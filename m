Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A56396B68
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 21:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789851986; cv=none; b=vEm56zKcuJpp6K6pt9c5Za2YE4aEOS370IKP4ZmknWWRC9KRgcBvis3jFGYVmVz2wJfp8izEQSURF3K7ms7Xl54t7UYr65CepQCk/ePi7eFUWHnuVZbIICn4ZiO30nhVnEtwWO0J/UcyJL2s+7J5PMkSPJsMdElAum2IwLmf2fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789851986; c=relaxed/simple;
	bh=1mZsbngPmUGZlsAHxnckBzeOtO8Zwy79cpor2SauIBg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KvAxXJFU59jlWIvjK6TIlU6hNl/t7Hg8ZP/Hr3BUDBdQxjLE5tyewvTjFvB5ABasDsRBaM4EiKx4mhHje3MuMo8IqH/b0gDhT/q1QbG0XlUWVl2kNrYnkU/beyq6Wj5Qxsk+xRpg+EPTZNuc+a+J1f/ubFQCTNBXnMGRv2ew278=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MZLE9j54; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MZLE9j54"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8631d0023daso1311890b3a.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 14:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789851983; x=1790456783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ENqTX+NY7Ywqvs/LvA4+I8HL6U8Mdro5TSSkptMowFA=;
        b=MZLE9j54VoXoFO4uhGwdBXV+pdnQh5z/oFxoM1kcJ+NFz6FemvtH7Yx6RWJqZR8muM
         iEcB3zNwGUUkiiGgry1TJP1cCoyN4FU+JoQNIGwLvzbj2xsrKSwVzQYKoYES+O6RgTAj
         sqPofmGHeEF3QkPMrbq1KqnLslENNE0782Zzpze8OD3cqu3S6mIzAzjDLpEqB51gf4k8
         5ASHl6Gscm0uHbmUQt2jHodYfmral7PsuAx6CPY4FYcaY+L/DepDH0eN2x3BO8gGGIhf
         e8o0YA2WgIYLVno2E0a/bSV5rVjPvqwEce1YhjzlNrV/W5z1OSs0wyMh6zEiLbAH2VNc
         NSfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789851983; x=1790456783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ENqTX+NY7Ywqvs/LvA4+I8HL6U8Mdro5TSSkptMowFA=;
        b=BlWW+YmPhKlPGGeWNjcuZJ2TltaNjjVTFb2P0LHAA84cYR+m7ieUzisUs1vBXH2lp7
         HQ0Z4b4I18KhlwfHdWl5JUHnZEHAEACbEXBHwSm1grgdOsrHVuuWIexFtG/yLH0LkUit
         Dqx7e946Cu6PoTpOyz4n4bg0SGJ8pclUQxROX9yyC4eRs9U6uo6WKv+RmszM2YUNYx3V
         Brxb5HaSn1pIxWDozlmwkGkOYzcji/2MZFTPpIf2LOH70hHpabXOGFPdZ4kUdHWNN9Yj
         Wh+5s4VM7G6Fiw9z9uojORtD5GF589oxStbNUleDly58LPIuxtfpYLmkjx9Uc1b+pLwy
         iQpQ==
X-Forwarded-Encrypted: i=1; AKwUvBwatgBzoLeTZvXWtZpDxU3qjD260LDHeqYJO1tRZorldoZorJ5ArJqYiD0zeRXPND2t2TQUVvxldDrZAQQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nW+W5mlfzTZ1RyDsf1my2GRPfXT9tpkpQMEkwoDPdO9NQ4qTAw
	fXHkUOLrDxFs41/sAOzoIU2gzq4ydEOg1OjfYhsPsbpETageyH53e6KT
X-Gm-Gg: AYBFou3saxMr5OrC4DPVlGmZRQPD8BrT3bHRnff1E3g4spEXUbbXrBPMItF1+eJfKzU
	+S+gDu9uXFzeAQIV9keL1WUVKQv6H9usBE5iz4ybiFOll3hE8rtt9KP0Y/WxWfpa6GkFdDJ3yR3
	N+wBSAgoW+GJWolNBycl9Hce48b8I6zfS0LOl6CfDsD//3gHc3rpUCohbyp8ATVBhTD98xhUGCI
	FwlarIgabzajql6YsYFT1uz4WJwzG9RjGH6kkj+H7w0mLgvpda9TV33DcByRDaglKVlfJgnMW77
	PtfPNLsOrWJwjmZfy4D0xF0PGh9JYNFKL84c9YDeAi0NQ7kBqwQLIAjTAdPm4iEJD/Thwz18cjN
	6xnJEjLfy7SIJpL1Xw1wT+a2CxuopNkcB1uUADKjyMdwz/Y/FvYxmckErKR2dSg9uq9Nq5ksoDJ
	CivuAaZf+V01QOkLChnwB9S7nYCeIokGyPfBjie+q6SLTSX/m274KhTvU/hKHCu4Ikd5f3fjKEe
	MwOTwYRLrBgdrtV5OLGENC2i+yy0wpZOtfUFsEyc9GKqEvvczkV6WY+xg9DkKNAfFEPvQiJFMj4
	c1gEftTe+A==
X-Received: by 2002:a05:6a00:4389:b0:878:37b2:df9a with SMTP id d2e1a72fcca58-87847134851mr2309234b3a.58.1789851983519;
        Sat, 19 Sep 2026 14:06:23 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a95f2abesm1297272b3a.26.2026.09.19.14.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 14:06:22 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: paul@paul-moore.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: horms@kernel.org,
	netdev@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ipv6: calipso: fix 8-bit hdrlen overflow and missing pskb_may_pull() in hop-by-hop options
Date: Sat, 19 Sep 2026 21:06:21 +0000
Message-ID: <20260919210621.3029744-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two bugs exist in the CALIPSO hop-by-hop option handling in
net/ipv6/calipso.c:

1. When inserting a CALIPSO option into an existing Hop-by-Hop extension
   header in calipso_opt_insert() or calipso_skbuff_setattr(), the
   resulting header length `buf_len` (or `ipv6_optlen(hop) + len_delta`)
   can exceed the maximum size representable by the 8-bit `hdrlen` field
   (256 * 8 = 2048 bytes). When `buf_len > 2048`, `new->hdrlen = buf_len
   / 8 - 1` (or `hop->hdrlen = ...`) truncates modulo 256, causing
   `ipv6_optlen()` to under-report the allocated header size and
   mismatch `opt->opt_nflen` or `skb->len`.
2. In calipso_skbuff_setattr(), when `ip6_hdr->nexthdr == NEXTHDR_HOP`,
   `hop` is dereferenced at `(struct ipv6_opt_hdr *)(ip6_hdr + 1)` and
   scanned by `calipso_opt_find(hop, &start, &end)` without ensuring
   that the Hop-by-Hop header resides in the linear data area of `skb`
   via `pskb_may_pull()`, risking an out-of-bounds read past `skb->tail`
   on non-linear skbs.

Reject Hop-by-Hop headers that would exceed `8 * 256` bytes with
`-ENOSPC`, and ensure `pskb_may_pull()` linearizes `hop` before
inspecting it in calipso_skbuff_setattr().

Fixes: ceba1832b1b2 ("calipso: Set the calipso socket label to match the secattr.")
Fixes: 2917f57b6bc1 ("calipso: Allow the lsm to label the skbuff directly.")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>

---
 net/ipv6/calipso.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/net/ipv6/calipso.c b/net/ipv6/calipso.c
index c6a34334e657..b8b7451a16ed 100644
--- a/net/ipv6/calipso.c
+++ b/net/ipv6/calipso.c
@@ -944,6 +944,10 @@ calipso_opt_insert(struct ipv6_opt_hdr *hop,
 		memcpy((char *)new + buf_len, (char *)hop + end, hop_len - end);
 		buf_len += hop_len - end;
 	}
+	if (buf_len > 8 * 256) {
+		kfree(new);
+		return ERR_PTR(-ENOSPC);
+	}
 	new->nexthdr = 0;
 	new->hdrlen = buf_len / 8 - 1;
 
@@ -1323,6 +1327,13 @@ static int calipso_skbuff_setattr(struct sk_buff *skb,
 
 	ip6_hdr = ipv6_hdr(skb);
 	if (ip6_hdr->nexthdr == NEXTHDR_HOP) {
+		if (!pskb_may_pull(skb, sizeof(*ip6_hdr) + sizeof(*hop)))
+			return -EINVAL;
+		ip6_hdr = ipv6_hdr(skb);
+		hop = (struct ipv6_opt_hdr *)(ip6_hdr + 1);
+		if (!pskb_may_pull(skb, sizeof(*ip6_hdr) + ipv6_optlen(hop)))
+			return -EINVAL;
+		ip6_hdr = ipv6_hdr(skb);
 		hop = (struct ipv6_opt_hdr *)(ip6_hdr + 1);
 		ret_val = calipso_opt_find(hop, &start, &end);
 		if (ret_val && ret_val != -ENOENT)
@@ -1341,6 +1352,8 @@ static int calipso_skbuff_setattr(struct sk_buff *skb,
 	/* At this point new_end aligns to 4n, so (new_end & 4) pads to 8n */
 	pad = ((new_end & 4) + (end & 7)) & 7;
 	len_delta = new_end - (int)end + pad;
+	if (start && (int)ipv6_optlen(hop) + len_delta > 8 * 256)
+		return -ENOSPC;
 	ret_val = skb_cow(skb,
 			  skb_headroom(skb) + (len_delta > 0 ? len_delta : 0));
 	if (ret_val < 0)
-- 
2.55.0.1082.g2b9226bbc0-goog


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793334101;
	b=z/hWIimCpT3lgAELSn2kmgMGhhDtxUYJpZ3ASBxWEpwXooyT9VxvZRneGW897Yq/lIhs
	 vUEB2OuENI58+ivXPblhaJoe5TEtbbnmLhl6QFcp1dsrm6nW/xlCvmWXU0fwwJ0GWCUtu
	 fkfrrIQqdCxhUSFrrSY9bT78aR13UEtLLPvV7nszh4xknbNnrwqUO0kf19CyIJk1vECSk
	 yp3vkiKdvxye5nMfkWId15b/UIUNEgYw1Dq3e1JKjzzM7r3Vh3xw8CFauWPzPYUe0PUo6
	 JIBqWoHTzUMV/tnnNFrXeJOfVXIPjlch3JcTsUByE/od5SyQQX2lMzQQY/jF9DzcGrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793334101;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PMpIblKmZXt8BOY3Honm+2Ww2wYw3iNTalEqXhUNRCc=;
	b=k0ylS3bJs6CLXrKGhBGkDcnlU+xvNnBCm4IlqV6NoBViBNMB5hooucvLRm8c4VIXfVOd
	 REyTgSlMYGe1OEZX7Q/hnp/Rb8vuNkjRCJTpviSHA9G5HHhLt92RSc2Na0f2PG7tRcISg
	 pJ/fVDtOunpK0tMmKUmsOsqYtVWJ4T7Ca9z68fhH8jRxx9nPusdLVZ+zRNmWQgQx/d7/I
	 hEM2+64F/yVk5oVXIxFVDAaJiluXf3E1hn6HFR67cAMC12CDC5a/x2d0PeP9toxM4gTte
	 j7QvvvYMXVLY/+VXPhrmsvYh9vWjPnyhaz7zmuQQby92XN7gJjjJb78Ulm5eJ6Oandw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openai.com;
	spf=pass smtp.mailfrom=openai.com;
	dkim=pass header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=V2Tu+7XG;
	arc=none smtp.remote-ip=209.85.160.48
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F00B606A322
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:21:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F00B606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=V2Tu+7XG
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-4a75a5fa32dso57751fac.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1793334100; x=1793938900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PMpIblKmZXt8BOY3Honm+2Ww2wYw3iNTalEqXhUNRCc=;
        b=V2Tu+7XGLweuI6JuW4q0Atp29krGpuRTqzaj3uF28jN846RWoygzoK6hQsvoo1UC9X
         knJAdo9MZNzSZj+rmkB/s1YKmt1kHg8xySqg/Y7Ilb8KXauOASd9C4O2nnuE4TRK807M
         J6rcR7iWe6FJEElVS0i4BdLAwdMFYZoYnAJMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793334100; x=1793938900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PMpIblKmZXt8BOY3Honm+2Ww2wYw3iNTalEqXhUNRCc=;
        b=AYE+jYxDdR6SE7aiXlT+kdRNl6z7ZgnhGuEz9dTmfbA/oT0RDW8qJrXjDBxCDw1F+e
         zu9lcWPT5/KQIA5/4YN+OjldJxqyexL0hgZvMH5fXvovV2jmvryKyexFuLOg8s/G1fL/
         LY13JHkuDgCXWTk7pKYAMDW+qbIbQeILQ4jAvgGl+WQdKN1jr9vKIO6q/sM3HPuqkwIK
         pzI0QqJ1hX72It3U7kHesrlR46PrvI5tV0HXRxH85JHdVTqubHzXbQ1qm6So2NTGG+RF
         hGlz4w7fko74ZEP9zE8lfsArsDGjbJ3VeVddd3y333C9s6z6mB9zEjrCO+dJFA1NEBUZ
         TBmA==
X-Forwarded-Encrypted: i=1; AKwUvBwdZqzULTgKEifTPTUEoHPs+FlrVgDmE0y19sb20HU9WKoPD+vjt115DwvE+OHu0a7x82JfIS8v2Hts4ao=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/31JQNAfLxYuiZIg5NZyLOkSt+LCnFf9WWwI0T/pPiqTGXn/j
	6RzOGlnOlnJPv2743xLVLn/xyMMb9xRdKCbMiLMf0Bzn+VVstxRogVsFZPeeeCEVQOA=
X-Gm-Gg: AYBFou2PI+ObX9N1UelnSZXdISmnEqm1M/qF91LL1L1ZcR+CYMfnx89CIdd8ft/CNhJ
	8DXuUYlOtDGXxBpNOVB8rlH7J23m7k4t1G4c6yLMyzXRk/tHrpTAK46VeilMNzHlWkcpuPbv8n4
	w2okjmD+WQPeVS84xGvv+/+T0JVfX81gYFlR+EFem7Gy6gdPfYZZK+cGcX08QZK88FR9oZML9nf
	0VHqnrKB00+IxlGPBM0nCyfgQ9XwipoAIP9bM1Qv9PMDZsV8rdhlEp9tx6RjYHIB7zMKa32Cs9D
	u7CrplJHmYYVPOPNcnnvzzugdrVn2ud+waMqAzZ8LEcbXGSbDIaJQ65BJkFWAFE28luwHJKixlg
	KiVyeJN0xJDLMbQwMJWN/UC17LB9UtIVczJuT3pCCcaV1ZiVek3uv+pz8W1zWsMwTQOzOJr+LP7
	l3Kv818DcyLqrJqIfPUMniMsD9R3SL6kCF2mKXMPKeMCE2KYctGJ343YBZxFtsKt5PWGw7R17OE
	mw05QnkfJEqoIwQjh+41D9uPBPE9k7d83PafOVJDepJQHabmsM7+Zeel84UBl2tgc+loGxOhZFo
	IP2fBZqK10v1gmxXRmcro2aYt/tuvDdsaeyGPzzAK9CmQPFvEPhOJ0YQ5MBO5MLpWH7A1y+JER7
	Blc2mke/sJtZ546zwQOwBhjyRdoScsw==
X-Received: by 2002:a05:6870:1f0a:b0:49d:c8ab:967b with SMTP id 586e51a60fabf-4a907775750mr775519fac.47.1793334100321;
        Thu, 29 Oct 2026 21:21:40 -0700 (PDT)
Received: from com-75606.corp.openai.org ([199.47.143.5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a90af650a1sm769349fac.15.2026.10.29.21.21.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 21:21:40 -0700 (PDT)
From: Kyle Zeng <kylebot@openai.com>
To: bpf@vger.kernel.org
Cc: John Fastabend <john.fastabend@gmail.com>,
	Jakub Sitnicki <jakub@cloudflare.com>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	outbounddisclosures@openai.com
Subject: [PATCH] net: skmsg: fix copy cursor when coalescing clones
Date: Thu, 29 Oct 2026 21:21:38 -0700
Message-ID: <20261030042138.73739-1-kylebot@openai.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A splice or zero-copy append can leave the destination copy cursor at
sg.end. If sk_msg_clone() subsequently coalesces with the last entry,
sg.end does not advance and the cursor still points at an unused slot.
sk_msg_memcopy_from_iter() can then walk around the ring and write into
older entries, including file pages spliced from a read-only descriptor.

Software TLS can reach this with an ordinary MSG_MORE send after a file
splice and a splice from another TCP socket. Both TCP and the TLS
encrypted-message allocation can use the sending task's page fragment,
so the TCP-sourced plaintext can be contiguous with the next cloned
encrypted-message range.

When coalescing with an exhausted destination, move the copy cursor to
the tail and set copybreak to its old length before extending it. Find
the actual tail on each iteration using the ring iterator, including
when end wraps to zero. Leave an existing copy cursor unchanged and
preserve the normal coalescing, reference counting, and memory charging.

Fixes: fda497e5f5b8 ("Optimize sk_msg_clone() by data merge to end dst sg entry")
Cc: stable@vger.kernel.org
Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
I have a reproducer for this issue and can share via DM

 net/core/skmsg.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/net/core/skmsg.c b/net/core/skmsg.c
index df385a5a961e..0e9ff4be78ba 100644
--- a/net/core/skmsg.c
+++ b/net/core/skmsg.c
@@ -103,16 +103,26 @@ int sk_msg_clone(struct sock *sk, struct sk_msg *dst, struct sk_msg *src,
 	}
 
 	while (len) {
+		int last = dst->sg.end;
+
 		sge_len = sge->length - off;
 		if (sge_len > len)
 			sge_len = len;
 
-		if (dst->sg.end)
-			sgd = sk_msg_elem(dst, dst->sg.end - 1);
+		sgd = NULL;
+		if (dst->sg.size) {
+			sk_msg_iter_var_prev(last);
+			sgd = sk_msg_elem(dst, last);
+		}
 
 		if (sgd &&
 		    (sg_page(sge) == sg_page(sgd)) &&
 		    (sg_virt(sge) + off == sg_virt(sgd) + sgd->length)) {
+			/* Start copying at the newly cloned suffix. */
+			if (dst->sg.curr == dst->sg.end) {
+				dst->sg.curr = last;
+				dst->sg.copybreak = sgd->length;
+			}
 			sgd->length += sge_len;
 			dst->sg.size += sge_len;
 		} else if (!sk_msg_full(dst)) {

base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
-- 
2.56.0

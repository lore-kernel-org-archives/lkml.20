Received: from mail-oo2-f6.google.com (mail-oo2-f6.google.com [74.125.231.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622974CDDD8
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 12:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791549692; cv=none; b=kaxXoRtPhs5bgZ5nJzL7SZgpqn9nKlESqn7b1oP9+NnuwZJG4X8E9XZCjZ1gDb2VG5Y8f726oPJlQ2N6YL93vEled+TA5M2eFH3+uCj3OECS3Wol6gK9/rHLnt7Pu0M80QDkfBPYo9zpH4m7RPwcTzwhJnEu4PUXDAempZeGgPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791549692; c=relaxed/simple;
	bh=PfNhsuzh4AOEts9llViSuzmKalMWMyZHXZnTes1rkHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D4y1i7W8DCNn41qYeY9abCLHweU8EMqJKJ/NvLh86/HoYPW4aC2nAWnPz2D9mIdpxGgJ2ASdwQWyLICaQZ3KotRuTyp9aM3cHCbww2tnRjYroNoJs2c5f3UPLbG2VKEhx0gGmyF3iYhpR7kBLD1z+c541ldY++589eLNHr2xDGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lgyw+bYU; arc=none smtp.client-ip=74.125.231.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lgyw+bYU"
Received: by mail-oo2-f6.google.com with SMTP id 46e09a7af769-8217177c5daso1513774a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 05:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791549684; x=1792154484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ryl3WOCqZhMHH6Gxb8y5ffAOVmJr/vg7ENqE2edW0CE=;
        b=lgyw+bYU4JkFYG/IjDvkSjBGeDmIHjZctUFElep4Hb1KTsjxK6gcev5mfkWfYxqVSl
         DUYyYFvRDX5jRpMgdm+5XqryPwNIxGTFyIcwNn/q624CnHYdWa1kWMz0liUc04BoBt38
         1d+/JR42mo2uzyiwAOU1rqj/P9p36vpV3kGP0AzeKWhDy9lthwoA9Kr6E6kszuaQiRVa
         9YP7n84fdnzoSMUMkmQF+6jo/qd396sqMqP/1NnDZjXcfCH1wJCUvjOavfKQKJpI/VJv
         0Sd2OCpBsMnHsCxBH6bMdpe9iHPhY5pSZUAWntwpmVLrvynieGR21MfPSpiV4TpUgWAw
         YPBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791549684; x=1792154484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ryl3WOCqZhMHH6Gxb8y5ffAOVmJr/vg7ENqE2edW0CE=;
        b=sKQv0v+5BEsmdG4bFnbR+GJIuB9pAFSgohaqsgXwmkaX7cceIi5SrtxwyMRbsBOT4z
         0bVmfwcpBmOSTy3x9z2KekC2uiPAYBGsCdD2dBweKURPXuWsVuUMqREVKDBp6hJz7QNl
         NFhjUvTkB6U1x+Y25UT7k62ffUJondear7HIE3oZTRJWO+ATwV1p93AqtgFGRQFrMmm2
         CApwT6WexzFHbF+HaruG8YW97P/Omm94fjD13SN/NgTMGRDqpEliKGcHdiVFMu8CGdbU
         muSuFKBFCLxfR60kSSRDuL8zWvtBZyYVZmFUFlaQrsBw/eywu28y9yXKg60dUbhXQoQO
         9ykA==
X-Forwarded-Encrypted: i=1; AKwUvBxAOPpOTzynOujhwwn7AHNWqqitaGFLhEWLhmXzxmHBbiq9Id8ZYr2IavpohXlIKaRgGWVq2iMMFjDoHes=@vger.kernel.org
X-Gm-Message-State: AFuF++nAuKv7+VMEX2IDKI2XWFxaEmniaf7EgfgGd3g2cZD0hFPK2gbG
	/IaxmiuGnkUjDXYS8Zsyw9nwnfMBG2AIkodgF14ATRnwWGQUXUxqyBWp
X-Gm-Gg: AYBFou3EoeIaqPj/k9gvY/mrNiaA071vPtJQT6Tjo/J/dNjLPbs5k4knXQpr48X737n
	Lonnm0HdgRQV30oaQO65HgiBZ/tfGxAmVu7xfSN+ijR7+7uyeYP+3aP5F3ak09RHMdkgqCpNlfK
	iUNfF9gzX68bV/KpwF6pG5JRBKgTSF/TUKkKmt1koblA98Lii9THRcTmY4rS/hR+qS2MrsQTyOl
	MTp6dVDTV7FwtST6TurzZJut1NzaJbJuRGUviG432WAMetfdSzWo7bHJiI3sCFtf7Q/Hzu49J9j
	rx++FjhJVKRmLlcrBG14O2jBx8ZyFk7+eqac/XB1/X2jvTC40LkvioYGqt1xtJ/qqGfkV/FEjzd
	Kmfaos9BZAtTprGw/NgBVe0X8x9ZtvQPW4mUS5PgLbWp1ByKYSN6aHlKyS9cOJljA+lVLlpkkYC
	A6xdhX+uArPzgCM6/dUkMxbgXOuYacbVFuLKVmS1H0UXkfBUW9Kg0uJhjSjNVRxZmDQusqqAFTH
	hg5GtIen4RPMbpptZLGX7rAX8JkTLmbcpjgXg==
X-Received: by 2002:a05:6820:1c89:b0:6dd:6d12:2305 with SMTP id 006d021491bc7-6ef08e71af8mr1263442eaf.3.1791549684102;
        Fri, 09 Oct 2026 05:41:24 -0700 (PDT)
Received: from localhost.localdomain ([14.116.239.36])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6ef00520fb5sm1492829eaf.5.2026.10.09.05.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 05:41:23 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Cc: netfilter-devel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] netfilter: nf_conntrack_h323: fix NULL pointer deref in decode_seqof()
Date: Fri,  9 Oct 2026 20:41:16 +0800
Message-ID: <20261009124116.3950469-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The eight supportedPrefixes table entries (_H310Caps, _H320Caps,
_H321Caps, _H322Caps, _H323Caps, _H324Caps, _VoiceCaps and
_T120OnlyCaps, all reached through the _SupportedProtocols CHOICE)
are declared SEQOF,SEMI with fields=NULL.  decode_seqof()
dereferences f->fields on the first loop iteration whenever the
attacker-controlled SEMI count is non-zero, causing a NULL pointer
dereference.

Return H323_ERROR_BOUND when the nested field pointer is NULL.

This issue was discovered by Tencent CodeBuddy Security.

Cc: stable@vger.kernel.org
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 net/netfilter/nf_conntrack_h323_asn1.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/net/netfilter/nf_conntrack_h323_asn1.c b/net/netfilter/nf_conntrack_h323_asn1.c
index 6830c9da3507..4d66db5bf5f7 100644
--- a/net/netfilter/nf_conntrack_h323_asn1.c
+++ b/net/netfilter/nf_conntrack_h323_asn1.c
@@ -692,6 +692,13 @@ static int decode_seqof(struct bitstr *bs, const struct field_t *f,

 	/* Decode nested field */
 	son = f->fields;
+	/*
+	 * Malformed table entries may carry a NULL fields pointer (e.g.
+	 * the *_Caps.supportedPrefixes SEQOF,SEMI rows); treat them as
+	 * undecodable instead of dereferencing NULL when count > 0.
+	 */
+	if (!son)
+		return H323_ERROR_BOUND;
 	if (base)
 		base -= son->offset;
 	for (i = 0; i < count; i++) {
--
2.43.7


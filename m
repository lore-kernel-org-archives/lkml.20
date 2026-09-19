Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C282D3876DF
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 21:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789853802; cv=none; b=GyBFnbo8r3qJTUYYeqNYh337SVt3Nmgj7LCcQFFeFdFubMC34pdcJ3aQu4niD2RLBvJtHu/sPr8d5GMpfkX2NTpcujQSzo8llrpNjdLmpmRpLf9KZ//mQ6aZRJ1tLujrHFrg0w5WWt1tm9pYuNZD5e2gUFW48En//ZEx9IkiLF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789853802; c=relaxed/simple;
	bh=lfoMmck27h8rxcEq//cYQsmDPpfPgRsuhqt5p1flyWY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y6iVC7RNxsDlwDmrPhdk5ld9dJN/OWtUBx7zgzAEwLoKpLsopUmdaJeAReCN8FJs/lXkgr5roKVPiKtdzR/1NYYf7kDI+NGRgDozY3/HlZAKWDlgAQZWrEKt9lXvxzGJu93Xu0fW4gIl26xLyn/OaF+b3G0Y/CnemqOspgwLM/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j+TcEW8k; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j+TcEW8k"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747f01363so15694125ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 14:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789853795; x=1790458595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lBz1wgM4ChVQkuNTsUB6r2UpX/KNTDzOql2jPvCkbsk=;
        b=j+TcEW8keaWFeHwCCe0d9DnBLIUebs0lT33AnkTz+R1w+nrHjYbfrA4KCgz2lKU26h
         9sGcGgs5iAvKs9q0Mvf1tuvsvPzXzkxP822zBvm55WRX9S5eOBiemUScy/MYLz2PVGnK
         cKSHb4dC7CK1ESKSyRf1jhM86TW6QqGXrtRWWWLMioUFJF8gg2SxuA+DBzN/IRLLE6wV
         hPYf+jj2ZESf8xNFAnxkDn7sBqde0Zd1SLb9OAyNYqd0eI2PVgrPW3vhrA877u44rGJF
         tyL3TjiljBmNTBh61PCSZe6SRqXBiVOdfqsCXckYD1/tTTneKqyNsh0E0ujrF6bMFn4C
         JHcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789853795; x=1790458595;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lBz1wgM4ChVQkuNTsUB6r2UpX/KNTDzOql2jPvCkbsk=;
        b=IrKC2IJgUWHXegLd+0ttImGgcYXHnEQlcSLIFDwTOXGUryqPlxOJ1rE9P2rfvcAbZG
         +XvWxpO3i7BS2oigXjxpq5OiErwIMTs0iLKz61VxdWuVt6+647U/q/fhNr/uHDsicDdk
         rgcwcsSAXHOH6Ff9duFyfILab1NxVPMO+X+RXRO9mNcQi1L01Y54JxJaoUN5TReZI1ZO
         un1+TDiPk8NEpvNwJuxEAbPcVnXuVXuVP07wVB36k1PQmVOpDxIhOgA7jwcqoVRqLRCd
         uYd8EhnZ4/i66BdcCARdhmloTDJlbezXRpill9zqfM3jcweOojujIAwgBYqVOgNvHXYc
         UW1g==
X-Forwarded-Encrypted: i=1; AKwUvBzf/OhmJsc7HjdrB2DKNrV50j8hoQ1hPj4fkJorB/2gL3YEbehhnw3hp8uzeD8fBPjKpF7C6VY5ogBVI/A=@vger.kernel.org
X-Gm-Message-State: AFuF++k7efZXDjb7g01bLRM5JSvlsvhVovrJXaFhdVJviNs0QrKT8Ll9
	SC/5HEZZEPNbqW6Sc/wnMX/cqYHDeDhhfJcCEma9TGY+4JdDna54Owjr
X-Gm-Gg: AYBFou2lTfplIEXoTYGdKYCywc/IO5MBDVPk05/lkiQ8U/LghYg2DDLiKT8jxueMzYd
	ujVSrOX1R0hyUVgaaCt70LkEOexThOQIKlH2MLKvLic/wkHhcNQleGTUUxD61/bDPicYC64Aa88
	8UhXK37Df21znAWe3f+Y5WxyrYQ7YtcLoacSofL1v/kVx/D06Z3Tx957NiTJarczfQGUgrHD+Ps
	Bsqop8QgjGGTZeRT1HLnP3kJBnM8Lm7q2Zbc95JdqGERp9GRQpKmsSMgn/96zfOZDcNUf7SZbD4
	q1Z9vRwIhC29MNNG2m2mYU4W92SCTh3iRAjvXtd8vHzRtTUn6WfgVnvRuE37LUjDNEdCOfJIKkD
	HYNLN7iE56xabOO7f8FG7gSnqxn+MvOE4ASwDPljWML/NpmITWyEgh1GVhV5s685ClEVCiUK8N2
	nQgxqosuNIT7J1pZ0ZX+e5mn1mPbyLQeg+ASt4wOX2YPKypJq/63gGy4CEysmJwg+1qS7crEbla
	0N8Iob26B/ziegCFjbVChVGu6Mt46Wqu3FXrsi3mWlem07hkR4S7KyNhqZ2BOnqW1M3hlUoqKzz
	gOkf8Fh5jg==
X-Received: by 2002:a17:903:2f0f:b0:2dd:c100:943d with SMTP id d9443c01a7336-2ddc1009bdfmr43991255ad.59.1789853795511;
        Sat, 19 Sep 2026 14:36:35 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc16b4a8dsm12762905ad.12.2026.09.19.14.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 14:36:34 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: marcelo.leitner@gmail.com,
	lucien.xin@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: linux-sctp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] sctp: copy zeroed stats to user in sctp_getsockopt_pr_streamstatus() when !streamoute
Date: Sat, 19 Sep 2026 21:36:34 +0000
Message-ID: <20260919213634.3314055-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In `sctp_getsockopt_pr_streamstatus()`, when the stream output extension
(`streamoute`) has not yet been allocated for `params.sprstat_sid`, the
function zeroes `params.sprstat_abandoned_unsent` and
`params.sprstat_abandoned_sent`, sets `retval = 0`, and jumps directly
to `out:`, skipping both `put_user(len, optlen)` and
`copy_to_user(optval, &params, len)`.

Consequently, `getsockopt(SCTP_PR_STREAM_STATUS)` returns `0` to
userspace without writing the zeroed statistics into the caller's
`optval` buffer.

Remove the premature `goto out` so the zeroed statistics and `optlen`
are copied to userspace.

Fixes: f952be79cebd ("sctp: introduce struct sctp_stream_out_ext")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>

---
 net/sctp/socket.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/net/sctp/socket.c b/net/sctp/socket.c
index c7b9e325ec1c..f3e48861e9e6 100644
--- a/net/sctp/socket.c
+++ b/net/sctp/socket.c
@@ -7569,11 +7569,7 @@ static int sctp_getsockopt_pr_streamstatus(struct sock *sk, int len,
 		/* Not allocated yet, means all stats are 0 */
 		params.sprstat_abandoned_unsent = 0;
 		params.sprstat_abandoned_sent = 0;
-		retval = 0;
-		goto out;
-	}
-
-	if (policy == SCTP_PR_SCTP_ALL) {
+	} else if (policy == SCTP_PR_SCTP_ALL) {
 		params.sprstat_abandoned_unsent = 0;
 		params.sprstat_abandoned_sent = 0;
 		for (policy = 0; policy <= SCTP_PR_INDEX(MAX); policy++) {
@@ -7589,6 +7585,8 @@ static int sctp_getsockopt_pr_streamstatus(struct sock *sk, int len,
 			streamoute->abandoned_sent[__SCTP_PR_INDEX(policy)];
 	}
 
+	retval = 0;
+
 	if (put_user(len, optlen) || copy_to_user(optval, &params, len)) {
 		retval = -EFAULT;
 		goto out;
-- 
2.55.0.1082.g2b9226bbc0-goog


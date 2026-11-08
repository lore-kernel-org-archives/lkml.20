Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794177143;
	b=sdej+C8ikBpha+ytjWfoWrqHDKGqOypm846QirHH46JnChpUHEQZ6IDRj0WUagoJxDbQ
	 7R7B5e+HEZt3Q+ANuhon/C5XPttF9UDoScq7pw2wDgZx9Jeqx1C5keK7kUZ2y3lwMAMpM
	 9GHEEXZTZw0si9/DFMPQN73PsLk55HsM56DBF2mBpMLLAQfsufHxjknsysis0iUcbJKiR
	 7cVJSsuXn22SKftuIFFUtXdCBxJra62qVyzdni6JI2w3GpbHxtyBAzGOf45woD3Q3pAmj
	 rcN69UvITMglWlD7c8yFqNG4Igxb/jGPx5QxIBfViWZ78PkRJ0mEHuepAMAu+tM4lbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794177143;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=9L6q0YkJhINETobLEedWRcicqFSMNtT+abPs/Uh3YjQ=;
	b=mBnHcBC47ZQFIhtlkYy1JaUFpbhQ/6rOeWmMeE9J7/vCg/CmyS2voSdlkwOm3aIWBrAx
	 mKh6Tzny0MWVchdCxkRPkjXXU02bBOy+N3GQSv8YYTKzTJP+bIGpINjkaB15uUMpEXJhr
	 LRhRoVvvfXsbhgQSs7fIJi8XcyY2CGWEmvdxaJ7qAQRz9C4qeVeNSNWoeEjDIZ3reHP3A
	 4xNdJomQBHES6dLpJG17i/YzSDiCi0XnRB6dBlvxI9w+4psRtecOAecjEPbWJtz/xkVmM
	 CptRfgzVJhz+Z3a1NItz0sMK09cLhOk3MA62wxMDVfpzwmt4z2cem6voYKpc3WS94TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=MgYJMhsc;
	arc=none smtp.remote-ip=109.224.244.18
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCA9606A323
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 22:32:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDCA9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=MgYJMhsc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1794177140; x=1794436340;
	bh=9L6q0YkJhINETobLEedWRcicqFSMNtT+abPs/Uh3YjQ=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=MgYJMhscuxKa5ltauC/4NPylXLPFqh+Aw+jKviKjQCQggaymPYTCvXkUA/c900lzM
	 rQFE6nfYKuLJewo7YAMy9lvgCqUvrawlDRRSttktpFvMyXZDdVIpDN7JBOrPUysU7k
	 JFII5XAZu6MP8rNwVS26707DqGywS+dOhqrMb6tthM43WUuXw6CVizr73ZZdApH1fY
	 UPEyOKVhcZl+S/zKOfOO4C8cqXzOKvoQnwsvqKaYaTonKAbJIp6A5w9g77ac4Z+lrS
	 tCFu7/lT8yX3WwsLgsETA+nEcFesC+SsB4XXsmLHMSxcIvydSdDSiVkorBzVZwRsSv
	 /mdgYX4BxEzvg==
Date: Sun, 08 Nov 2026 22:32:17 +0000
To: "pablo@netfilter.org" <pablo@netfilter.org>, "fw@strlen.de" <fw@strlen.de>, "kadlec@netfilter.org" <kadlec@netfilter.org>
From: Noah Weinberger <NoahWeinberger2003@proton.me>
Cc: "netfilter-devel@vger.kernel.org" <netfilter-devel@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] netfilter: nft_dynset: reject DELETE op when set lacks ->delete
Message-ID: <5aybqcVfq3WxYdpbT0Ea6bEWamp-4x10J9FF_5La7SSXJ57a4j176x_t3zUW8Ii2r84MsPX8xx_vNashO2PRWvuO9yNsaxS8YV_4TLc-QHU=@proton.me>
Feedback-ID: 186545857:user:proton
X-Pm-Message-ID: b3d9ccead2c59e7b876970e6da36d7e95a6fdbeb
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

nft_dynset_init() checks that the referenced set implements ->update,
but for NFT_DYNSET_OP_DELETE the packet path calls set->ops->delete
unconditionally. Today the only set type with ->update (nft_set_hash)
also implements ->delete, so the call is always valid - but any future
set type implementing ->update without ->delete turns a rule evaluation
into a NULL function call.

Reject the DELETE op at init time when ->delete is missing, next to the
existing ->update check.

Affected version/commit: mainline fa4ad798f6f681031775266044ba1b0cf3c670bd =
(v7.4-rc1, 2026-11-07), net/netfilter/nft_dynset.c:98-101 (eval), 209-217 (=
init).
Longstanding asymmetry.

This was found during an assisted (AI-supported) static source review of
mainline fa4ad798f6f681031775266044ba1b0cf3c670bd (v7.4-rc1, 2026-11-07); e=
very code path cited below was re-verified by the
reporter against that tree. The patch below has NOT been compiled and has
NOT been runtime tested, and no reproducer was produced - the triggering
conditions are described above instead. Please treat this as a report for
verification rather than a battle-tested fix.

Reported-by: Noah Weinberger <noahweinberger2003@proton.me>
---
diff --git a/net/netfilter/nft_dynset.c b/net/netfilter/nft_dynset.c
index fa4da69..5e2bbd0 100644
--- a/net/netfilter/nft_dynset.c
+++ b/net/netfilter/nft_dynset.c
@@ -216,6 +216,9 @@ static int nft_dynset_init(const struct nft_ctx *ctx,
 =09if (priv->op > NFT_DYNSET_OP_DELETE)
 =09=09return -EOPNOTSUPP;
=20
+=09=09if (priv->op =3D=3D NFT_DYNSET_OP_DELETE && !set->ops->delete)
+=09=09=09return -EOPNOTSUPP;
+
 =09timeout =3D 0;
 =09if (tb[NFTA_DYNSET_TIMEOUT] !=3D NULL) {
 =09=09if (!(set->flags & NFT_SET_TIMEOUT))


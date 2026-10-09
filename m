Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8A43DDAFE
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 05:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791525145; cv=none; b=WLCnTI1F/aNr+ZP+naL4rsvVM53s7Kae4ji2FkMMkpo31k96qIfZG23W8TfSVEq88gizzL4qIN160lGyShddJFlLWYeFpZym2HAaxJI+jcnFdlsUOy8DZcyTYsWkkx3k+Jyr96RL4h3aWUDVhGrgChF6Dcf2lwwNKORZppE3UD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791525145; c=relaxed/simple;
	bh=wKugUad1fZWni/TgB2VXp3zn2WGwy2cTnibHFzOKM9g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=kY6lYqNAy6YIwawueKCnYmrWiPwWaeoFm+iStTxmTpekyNOFZ9/9Ftr5O+lwtX8JAKZewhlbWCaZVfQnX9F1gJ4T03941fDqyIJfRbPpqY+eQ8tmcMdFsnaPYSoXALGxH6EzQOILE+NOezTaW/VKHPdwOJ5HQM6EQaHhZuHSApk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cnqbkmUa; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cnqbkmUa"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3a80d1c98f5so3642039a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 22:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791525143; x=1792129943; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VfWy+Ja9qxE77oobFy0N0Hs21rb2wAAVBQ2jt8NTcMM=;
        b=cnqbkmUalFR+hslIzWx06IfEZPCtxb/t42O8cyfelOR2IWhDB/MC/lGHJ3FLON4DMO
         nVI5m9rQwY1SrXZLFN4wfV+smIdCXtE/Zynk9msOaSueWOedfKJI5x2fG0eo8Kvbe3oh
         oxnuxyPdD0Uqw22kfmqpz5RhvK+xOBXq7Sz0BTRjpE5my0fpzvD8oIzDDdAcx4cw4uEM
         ezCD7HQ2p+kIekfdCjnHAYKFzd/r9WDMbc8z7vCadOuMzIqqHnkBxgnoaGWT0tsu8gDl
         ZJjAOUz3OkEgx/iAuet2hwpc6b9IEoy0kmSQPrFefAszE3oKO+EWVJKDmVfHwXeLwJzf
         FIag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791525143; x=1792129943;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VfWy+Ja9qxE77oobFy0N0Hs21rb2wAAVBQ2jt8NTcMM=;
        b=dURviKzt8cXmdIYnUfbCzZfedTptKGK5nnEri60pyjpVYp602O08S1OCTmkAvhf8wD
         5gdv/qHpMXe8DqsBeVvyh/h+AJJnw2GwpoQQr7c4ohUUUNOu25kMp+be8dRk7sSGHh1x
         rilgqP93RUx8V6fpPAfI8BJ8vvYguiqeoUXfEWm140ZYLds/no0MSSnPAmtyY2fNZM/N
         qoP1vTEadaxp+5vCGGGL6UfJm8mxh26b3c1Hjek4DQsY7xClF41iGRoMNg64qnywawh7
         fn6BFb5mRA5ONBHZI9VZeymXuTDmN392ktJYczu0H1BDsuvZxjpNkgwMm27vSh1jPgIh
         eFEg==
X-Forwarded-Encrypted: i=1; AKwUvByfYJRK/9O5neiTgunmvsj9A2VWdfTeYTy2vbAJggmNNfoE9PgQLWucjrtruu+SpAd8hSIQ4FdSlMpl4UA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKbSEJyxsIYpdWDhQx+0t1pTiKSEAFLtYgCbXl/b06+m+b1jJRe
	fvw0QcxiBGfl4hR9BV+Mr3ds3X+Yx8CJahBQgCh+K/vGVKC2uoDocVfa
X-Gm-Gg: AYBFou0xIVjSjnzZhtUoarRkuqwoytHJ9+eneofnZqmUV/huGiPDczogsfQc9iv0Mbg
	/KZ2nUeJx7++hAmP+MApDB6Zj6jqTErOlsMLkncs/PB40YOHNHF7GjSvbsh81pZC71AzL1LP6d8
	m44XjIdW4lT4ZJHEVsFrmLxkB1FvhAhL7v3ZAoVaZTUWGNrhOc9i3q59PlCd6IRTrUVppMp0jD/
	1lVAIt5iRueRAe+z7Q4BWVDL9BwStNj6xwuCdXKQL+3NBKlkXwDaipiYl3QafVTvzZSRkLLDIJK
	8AMlsUh6D40khO55PhlPbkG/3h1TS/lo3wJ+DlHmv2bQ9lVX2P1lwho8GJdPGfijGUn7eUwVCEf
	xo6GQkDb3eSNIzjk7VdLB3edJ4o7279dhSG5i1zJmJ9Bu6l417z5su+bL88YVMvewS9fV3C6VZ1
	jOyZJxoQdBTfHbi/Wk7Ke6IOegqGk5glFB2F4+oB8pNHhUnVujeaf3qsXWTd9ZoorjaQ==
X-Received: by 2002:a17:90b:2688:b0:3a0:516d:9f87 with SMTP id 98e67ed59e1d1-3ab3a911707mr845874a91.13.1791525142740;
        Thu, 08 Oct 2026 22:52:22 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38ff0d34sm2046675a91.14.2026.10.08.22.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 22:52:22 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: dhowells@redhat.com,
	jarkko@kernel.org,
	paul@paul-moore.com,
	jmorris@namei.org,
	serge@hallyn.com
Cc: keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH] keys: Check the authorization payload in process keyring searches
Date: Fri,  9 Oct 2026 13:52:16 +0800
Message-Id: <pm-key-management-objects-candidate-0004-v3-598361863b76bc25d58d@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

An authorization payload and its saved credentials must remain valid
while search_process_keyrings_rcu() searches the requestor's keyrings.
The function validates the authorization key, then separately loads
payload.data[0] and unconditionally reads rka->cred. Validation does
not prevent request_key_auth_revoke() from clearing the payload.

A request-key helper can assume authority and fork a descendant that
inherits the authorization key. If the descendant misses in its own
keyrings, it falls back to the saved requestor credentials. Successful
target instantiation invalidates the authorization key without clearing
the payload. After the helper exits, UMH_WAIT_PROC returns to the
requester, which calls complete_request_key() and revokes that key.

With the descendant paused after validation, the paths can interleave
as follows:

  1. The descendant enters search_process_keyrings_rcu() under RCU and
     key_validate() succeeds.
  2. The helper instantiates the target, invalidates the authorization
     key, and exits.
  3. The requester resumes from UMH_WAIT_PROC, calls
     complete_request_key(), and revokes the authorization key.
     request_key_auth_revoke() sets its payload pointer to NULL.
  4. The descendant loads NULL and dereferences rka->cred.

This NULL dereference can oops the kernel. RCU delays payload disposal
but does not prevent the pointer from being cleared.

Load the payload with dereference_key_rcu() and require a non-NULL
result before validating the authorization key and searching its saved
credentials. A non-NULL payload and its credentials remain alive for
the caller's RCU read-side section; a cleared payload skips the fallback
search and follows the existing error selection.

KASAN report as below:

    Oops: general protection fault, probably for non-canonical address 0xdffffc0000000005: 0000 [#1] SMP KASAN NOPTI
    KASAN: null-ptr-deref in range [0x0000000000000028-0x000000000000002f]
    RIP: 0010:search_process_keyrings_rcu+0x32b/0x790

Fixes: e59428f721ee ("keys: Move the RCU locks outwards from the keyring search functions")
Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---

diff --git a/security/keys/process_keys.c b/security/keys/process_keys.c
index a63c46bb2d148080add6a194579f7b1093c04d82..76da13fa07fab70115966e9ea8360af66390dd85 100644
--- a/security/keys/process_keys.c
+++ b/security/keys/process_keys.c
@@ -556,9 +556,8 @@ key_ref_t search_process_keyrings_rcu(struct keyring_search_context *ctx)
 	    ) {
 		const struct cred *cred = ctx->cred;
 
-		if (key_validate(cred->request_key_auth) == 0) {
-			rka = ctx->cred->request_key_auth->payload.data[0];
-
+		rka = dereference_key_rcu(cred->request_key_auth);
+		if (rka && key_validate(cred->request_key_auth) == 0) {
 			//// was search_process_keyrings() [ie. recursive]
 			ctx->cred = rka->cred;
 			key_ref = search_cred_keyrings_rcu(ctx);

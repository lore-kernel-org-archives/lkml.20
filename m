Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3D54BB5C7
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792158587; cv=pass; b=UAP5MUrZjId9kNCc8wqIzgync/3YvG914QLvYp9k6ePtc4E+xBV+3sQQYHfZvdRsz+vUIQ/eJV/a9xyVd55JYsMySxOwz8krPnlfcztxWEvQ+3S0lmAMT6ytNJ7M3NwN2iMPtDfpaIWtMVcirDsmxHqG5ELIel12iYijztgmz5A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792158587; c=relaxed/simple;
	bh=7gGpZqR+5f7jpt5A2HKWswoMs+I7vk84D0Zuc9LHtrw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=faJJupQRJWX2DD0XC1UQTo2rgu+E94P4MZeoj1EouQ8Ta6+lfFKwgWiFew9EbcgS2PqhSSN1iaUuGuhM4GMBDLGWpoGmKizXYWWCHrC07RjxK4RR3f/0btak02vtR0wkUxaHx6o6c5G1fZvFiQtlK9coecdiBJRucVJ/FISzruw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=FsXPqBPD; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="FsXPqBPD"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e5fb79ce82so37223315ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:49:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792158585; cv=none;
        d=google.com; s=arc-20260327;
        b=l6BtYZ8n8S8i6M0CPeyVxJiWLH4ez73Rra4OVr2ySdnvSwkCsz/EXefmHLUABsXzi9
         74Gtakk2vPImDdT4OnbkwOLFiiXGSbezOm7dKf/E+IR4kuCG4Y2Nm2HZkLvZI/hG8wP8
         pMUF4zzOoR6CEcoWHxdfem919pIBrlZ+MdRH5/izwTsrBEth7tBfRdiwgE1o+AizvlmL
         8t6msE2MSePWMmelcxDPWZ2Vv8lHy3NWwYksF+G9xCq+DY8Lj5ySFSphSvrmbOC++g3d
         Qluu9e8MSPY/gFipW+ErVjhhHMmfaMEjd98BWo5LyyZxTBF9wb6NhYFqA0D9M90yQV+6
         jMWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lkv906NsPe7KqHaTR7GsBWN1HrpWTEAB99z9qnvuWdA=;
        fh=NxobSF3je6t0ucrxwn2LJLcsJnqgOoVuNV/ptFZx9dI=;
        b=ll/4GMChP3iy7CUCJX1sJ+HTEOFqxl2UQY0QmuAUl20iJPvqKUEZcgJ142NJjfs8HN
         lw/QK2bCErRliyxrGlI5Sg/GsKMgtnTkxx34nx4fu/wjsOwQPzm3bluIZZXCa8rCx9J0
         TzJMH06P8zobW7PFT49tH93VAG+QFn+wypV8vB8fKEUDcOljW0rrQ8VSCqyBYC2oqLSE
         uzyH49053Khwr7nazaDBLGP5vzj60s4uP2ynuRbhQrctKrbIojqckTHI25ocm0OANPNw
         F+yvmhR2v5Q30dDN+rYjnZ1i7BfGRESUp0+K54obDVm8E4hsHMwqpi1hanuFRy7GSYoi
         2XVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1792158585; x=1792763385; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lkv906NsPe7KqHaTR7GsBWN1HrpWTEAB99z9qnvuWdA=;
        b=FsXPqBPDszhT7Q97oV0L9scaRd/jSAeGh8pSYCGFL21H0wbFU3PSaOx2puZuFm0rKD
         Q4WJYFfcY5/ORgoVOhX5Qpy7EEaQKCJ8SF//XUAONvrDqDEdmt2IHn77JUdJJ44RcgCH
         NZfmncqMhklJ+hRB9NXjtBpcjksUGQ4eGIZAe/3ppM3pUAKc/cUg5Nv9vcww2KrvM9X7
         BpYRrc4rpIm8q6c11T0HZ4RorWY+ZzGDCYI7urV99XyrxzJZbzmy4EGRA5Ie7TloZ9qJ
         gTc72BVgxqfSEsnsT28WW2NtxT0GxJhNYqcejScSXD3rdCMqcWS8tQGLry1wg+hIoyns
         QxrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792158585; x=1792763385;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lkv906NsPe7KqHaTR7GsBWN1HrpWTEAB99z9qnvuWdA=;
        b=VuJFj7Rv4rYCWqN14E1T4bipoAKL4DtpxwBrQp7XfDR3t+Dtyp8uMZqvKKx2wIHidd
         1JMgQs4MLIYvPTfdfrtiWAaGcgyP4sUf0/gDTeOFpgfwcvsDf0OarT6OEx7U7LQKOkJw
         aJi966QIfq3Cno+2oqC66Dz4TnLFY+PFh8FUlp9C/C4E1qC//7Zo4brtykljGyAQ7VPO
         R/Zz1tWeu30jaNhLOjgRohc3yDwwHmro9uUPIgXpUSyOkuJsnRxJ/DwBjKBj3dMKdVoh
         ybjkbu73Ha3PuizRS+bzC2MCQd8c+3W+oPwEaphdIvnd6LE2mxNelF+2gW26JKc2g4YT
         Qk2Q==
X-Forwarded-Encrypted: i=1; AKwUvBxGGz1+xGwWDHORJKdsY/sf91oV0fLqmjnCGiJgWgRPheY+uARPTvQpzo1fPsF2Aw677k9K/h4xWe4dTxs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJEIWlkms+/gTuP+JPCmQU36/mZDYHyhApL2NsIw+J61fO9qS4m
	JQolr8terzyWztsw4a7FyfNq2ONlJwc52W+TMomdmzTlOViFAb+AHNgZw5079mSgaVECcFb5d6R
	AtnAaysOJtsg66PQuYFUPH5X6qIfdqQeixKTnlbtM
X-Gm-Gg: AYBFou1QAOjaus156BTBRuyQTj2XI+bTrzIV+6WZZE4VtnjF1NSrIg6vg4l2B0NBKVs
	AvoDThfZw2Tu+9qgpt84EbjUvTSk6bxMK7f1stHMCHk/C9/Vrnquz6lm6fNBjeIQ/4jVegcj1sV
	fiLDV/Z4fKB4bSdjAy/M7JWQPmK4EI09xYAUCfHcs/mizrOSrEbvIoIHcoKcdofXNsnXybrw5la
	rFyL/JM/gwOWRRc7cXYHuFAXZ4izZT6tJNFfD3rLhEKak8a5ZzGYgw/71RhcuscjsetGm1ThJoF
	Vw/N2Fqq7mKkik4kVdXfOC2BY8Bg28rQvp/fjdq4VXWMH9uqZodtHNez7dTwq9hIqfPuUBu6oB8
	QqxwjCgq2mRE=
X-Received: by 2002:a17:903:9cc:b0:2e9:4b32:fc66 with SMTP id
 d9443c01a7336-2e9a68da443mr231625ad.10.1792158584887; Fri, 16 Oct 2026
 06:49:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <atIYdNSykms3dLCk@sirena.org.uk>
In-Reply-To: <atIYdNSykms3dLCk@sirena.org.uk>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 16 Oct 2026 09:49:32 -0400
X-Gm-Features: AclHuK_w9SiD-VgMm_QLlGq4MB_4pyYu-bBCTr_SAWZiC70KuhukPBoX1XwM-Ow
Message-ID: <CAHC9VhQzLLTFwVG+7BjVDqj-uazN+CAxzbP5WMfk2k4qNEw-9A@mail.gmail.com>
Subject: Re: linux-next: manual merge of the audit tree with the origin tree
To: Mark Brown <broonie@kernel.org>
Cc: =?UTF-8?B?SsOpcsOpbXkgSmVhbg==?= <Jeremy.Jean@oss.cyber.gouv.fr>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Stanislav Kinsburskii <skinsburskii@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 8:28=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> Hi all,
>
> Today's linux-next merge of the audit tree got a conflict in:
>
>   kernel/audit_tree.c
>
> between commit:
>
>   aa650d87a4988 ("audit: fix exe mark UAF in kill_rules()")
>
> from the origin tree and commit:
>
>   ca12826b4aac8 ("audit: Fix filter rule accounting after automatic remov=
al")
>
> from the audit tree.  I'm really unsure about this merge, it's not clear
> to me if the unaccounting should go in the initial loop or the RCU free
> loop.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Hi Mark,

My apologies, I was preparing the audit branches for the upcoming
merge window and it looks like I pushed an experiment to the next
branch and never corrected it.  I'm sorry about that.  It should be
fixed now, but of course if you see any additional problems please let
me know.

In case anyone is curious, this is the merge fixup that was in the
audit/next branch previously, and what is in there once again:

diff --git a/kernel/audit_tree.c b/kernel/audit_tree.c
index f2e81be8265e..e83b9fef048f 100644
--- a/kernel/audit_tree.c
+++ b/kernel/audit_tree.c
@@ -558,6 +558,7 @@ static void kill_rules(struct audit_context *context, s=
truct
audit_tree *tree)
                       list_del(&entry->rule.list);
                       if (entry->rule.exe)
                               need_sync =3D true;
+                       audit_rule_unaccount(rule);
               } else {
                       list_del_init(&rule->rlist);
               }

--=20
paul-moore.com

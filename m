Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476EC3CB56B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788276628; cv=pass; b=Uy3ykRkjYHtWzFzwVpl1AqdE5oVpcQDtXlJjz7wdzwxF26g+3OcpU5c7fYnUUdsGAVednWgwsklIdPLcbMyO/EgqR6qbJYh6QG2sOwYJsl8ECauFHbTkooXzXoJTD0dk+N1C8NRMSD5AGKvE418vaSyExaAAq1hrKAyYm7hRX68=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788276628; c=relaxed/simple;
	bh=oGeNoOa+p9ZzuwZnVouBlcSvBe+Jh3Gib2Kiy0uoXuY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=snOqVuxklMws6N3b6fTuwvAh4RWJVvB3GzVA3RkS1IKfS9/S3LB1KCYxQ6+mnSTpbo0ibVhTA8yEX5HSjaVu87Bpa/fNtfuZS9NN5hMFxG6ulp01Cko1DQ/3JMYXzdtYt2L1GuHERlbTvh9A/Zs9c3rAIE6x+Zl4jSAyfg0fhjA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=R8esj2ZC; arc=pass smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="R8esj2ZC"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc1c9879395so4064536a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:30:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788276627; cv=none;
        d=google.com; s=arc-20260327;
        b=J/nYupgzYOV+V/2eDACLETgBncnrYFbC5S8Zb6FwF+K83omEOsoAP1KIujW4ypJeAF
         LJMSJZL5IE5kC3qj8I+VbCkMeOU7CtPd8czKa/qKxzapfgkJ3FuwLv49p4mL6I46WD2m
         +BZoUZ6C8dveAymnW5Wl2X26xZI+VUQo2QdyyuPHfsc1tEg/P9Bht1MoUEjdDPs7/qoI
         5psLyRlc54VbXDghgZM51jbUmYu5Hgb5EFjwwrh3VoB/LJswj35EYC2tZoRC7rBW5aUJ
         Jutpie1KmqR0IMdBHx/G55zGFcvb/vvPo+g3N0JNvuISSrr83Ik2kWhtG3k0Es/Rtb3x
         cI8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z5rWp6/FMPiff7KV5XUE+nXFQ+JqVYy4oIJa29s1gF8=;
        fh=l0qAGC4Fh5ADrkpBtGrC6YQv16/2wVc88h/7QQzAzhg=;
        b=GKLpCmpm06nepwg5WylVnZuTkcfg2T9uTwXXIWqtgzagWYnbzvBBERPdPsBRsqvIsv
         u4Bv/0wRStN2sWzc0p//rTEEDtBxG62dyQGmiZjia2/yFzc825VRgBlW1JFhTdOwrfBC
         VyGF/1a/Im1WvqIY6F7Tjhj+HQ6v1sJX4af+3aggGGnUovqQS2yGm8UL5XalyJ5nGT/I
         HTl4guM9Ltzag3MH3OK0O9coSbXrj7hIWdXolzdf1ODNWRYToHciBdzR4e76kTdrihgG
         NB+6DL0ukkG3pk8s8gRVS/Ap8gVIzJz2NtNmci19zWfEWRZ7K/8d0oBeUdq9WlIJ3Nqv
         ytnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1788276627; x=1788881427; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z5rWp6/FMPiff7KV5XUE+nXFQ+JqVYy4oIJa29s1gF8=;
        b=R8esj2ZC1MQ3zauvBv9MGbowj5sTEI6PjKk72+RbINZVnrRd7qXe0OU7lzUPFvgCEM
         svxpC4pk2DVJIA/Dv4M2cazo9rdXMPv1gVGJr0Inf9fQgb6S5iaA+3w27NYjVK3G1rGV
         Jgg96YDlxIQueCYFcyS0PyPzSp9ZY64sBFgOjxxpiMIi+i8NgkOQ71w53c5ecix62sQ8
         CrAS8Wl8t5/E4FZN3WJKf9eWly6hqs3WZh7F2DkkEdAupUX8NrZuEqtvCrznK3ogfXNN
         aJsgFa0fuUAGlJHg5wTSgSp821QfmoNyPGLWWvW43qRe/pegIXkG+e8xvOS9CR9cE0Hc
         rUmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788276627; x=1788881427;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z5rWp6/FMPiff7KV5XUE+nXFQ+JqVYy4oIJa29s1gF8=;
        b=dHm61h1D2QJP+DsjSET/nkNKC0Jc14h9jVWntL/dIimFNXqDTb2PHlSS8THhsjG+WO
         EHqBZBe8MaUB8rz7P08It11473++4x6CwvzJrNaRrBBrlCoRRV+T4w9quBCkyijRZt3b
         oAeD0dGWKAttEdHK8RV4+nIk8Xa/+6JOEH2QtdwOV9pBnlk6ieM9cafDrUTffLGIY744
         /0KOTEUyE4JxZHX32qXSmjPW39bKZPg+bkycSrX+5IbKIItcBiTHlfR152qZhiWHPhAm
         OSEThyQ/dQxu71Ncq45XWMRm2598fT8lR9YRkRGXFJctJssKZo9QYrvSekn12jG55ARd
         1TvQ==
X-Forwarded-Encrypted: i=1; AHgh+RpD/IDiXSfu5BfFnU7Pc0p8v69CaZSV0BqmTZAcLTriX0j2Vun/aIsGgLO2mBr/WhRe2wcBhg5wy6gi58o=@vger.kernel.org
X-Gm-Message-State: AFuF++nGycW0PFxtRMvimrFvjNR0dHgmiYOc1LMTIdm2dU7GtGny+N9I
	2jkdDFNYZigIYo55iaXjTlsokx/8sosWrTkdwhfA22PstqyuSeqpLDsEtPz6yaU/gRm6PV9IANK
	cHMbfDcP8l+3nX9iZcIOsoi29hOCAh41QS1lt4KVp
X-Gm-Gg: AR+sD13nsWHoxIeQBLlT+4VHGTPNBCXr5GTvnlLJlTTPcSOT78T4IVnY7dCraA5PIPJ
	V7oERKmUYxqI6vQWMUX8R7pAC5VMlA5saH3vjj3kn7gRTrscH1YhhcBymB4XmdS7+0jJ6p5+WQG
	AgEjtfZX5tYfZt3H2lns+4d6/kxQ8y0DkyHb+TdN8m5f5B2ETk8j0HrstgPzxTx9IYzHjiNVaj0
	vwnhU6ydlOCEW28381k9oCnbRXLj+AcpYF4g8TN+hHxKpzPgMah91FOSgxetpAdl8vFxnHyZXHq
	szL/6Esh7LDoMhIKTRx1F3BVRbq36DIgwTrs9FDAGIqC
X-Received: by 2002:a05:6a21:a8a:b0:3d3:ad3c:49a5 with SMTP id
 adf61e73a8af0-3d3ad3c6457mr43951622637.19.1788276626517; Tue, 01 Sep 2026
 08:30:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <apbYZsfaO9BnB8nm@sirena.org.uk>
In-Reply-To: <apbYZsfaO9BnB8nm@sirena.org.uk>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 1 Sep 2026 11:30:14 -0400
X-Gm-Features: AcwNN1Xq90Ba1WRvtyU8kMeoJcWIIGgbEGSH8V_oysbwx7BB9WV_M54j0vbNtas
Message-ID: <CAHC9VhQQGcKJU_HF78cMSuCPf=2tj8xW78ELOYwb1xJJU8tuRA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the security tree with the
 vfs-brauner-fixes tree
To: Mark Brown <broonie@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, =?UTF-8?B?SsOpcsOpbXkgSmVhbg==?= <Jeremy.Jean@oss.cyber.gouv.fr>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 9:51=E2=80=AFAM Mark Brown <broonie@kernel.org> wrot=
e:
>
> Hi all,
>
> Today's linux-next merge of the security tree got a conflict in:
>
>   include/linux/ns/ns_common_types.h
>
> between commit:
>
>   82e9343260dfc ("nsfs: keep namespace tree fields stable until after RCU=
 grace period")
>
> from the vfs-brauner-fixes tree and commit:
>
>   f675d2e955696 ("lsm: add LSM blob and hooks for namespaces")
>
> from the security tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> diff --cc include/linux/ns/ns_common_types.h
> index 6ed6b497831c7,5cfe0ce3c8818..0000000000000
> --- a/include/linux/ns/ns_common_types.h
> +++ b/include/linux/ns/ns_common_types.h
> @@@ -116,8 -116,13 +116,11 @@@ struct ns_common
>         struct dentry *stashed;
>         const struct proc_ns_operations *ops;
>         unsigned int inum;
>  +      struct ns_tree;
>  +      struct rcu_head ns_rcu;
> + #ifdef CONFIG_SECURITY
> +       void *ns_security;
> + #endif
>  -      union {
>  -              struct ns_tree;
>  -              struct rcu_head ns_rcu;
>  -      };
>   };
                                \
Looks reasonable, thanks Mark.

--=20
paul-moore.com

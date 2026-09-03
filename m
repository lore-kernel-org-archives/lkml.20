Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69EE53C4562
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 06:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788415827; cv=none; b=n2bIZbf2dzsUBweMiT9+a/rtNVHEtULA6eOaZnPc5giVrGtMVt+HITc9SvIRrHFpIzQGhLI04tfbwkbZQJEufYevk+OV5JMPCkxHejmSsXZjLXeQLnCrUdCXuEhvUzHdfDOsharHS1k7gs57kbTnppgNPPubLFbcOfFNTdZpVt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788415827; c=relaxed/simple;
	bh=2SedpaDSoAR1LvgCWs+DWL0IdG8bnTzoa636rx/f34w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sBl/8eMwbVud0qpBBH5sHjMW9ZDwtJ7w6k81LegQHgFqfZGnx595oQcAVvYjt58gR4kR9qKChqzQw+9BLHU1n3/ykESIodofDGFVCuK/tgxBhCxAYQi8KBwAA88MIm0RXHTKfZ7/x9EIMQ57crnKK6d46YUq1ZoFX5BseSvBYdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=UFid8kkJ; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="UFid8kkJ"
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C9B313FC37
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 06:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1788415822;
	bh=0SXt+zKg72aqt2co0Md7aOOy9tUWiA94GMNENg6+61g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=UFid8kkJ8tcSC8T9BCB/mghzNvFBtzMkiffIcnvNH4w2pgI6erAeN+jltFr8SmNF3
	 p2Zh4OogU03KPVn8FBGSq1/XWwx0IQD/1ZLVOq1R/N77Euw0JSxFjlrCJ0+5f1T7v+
	 bVlSX+JTrdkIy/XLmzzrx98zpApIhvATWCmEbNCZuiJbQZfgsN7y1crfjRKwPzaGFS
	 pooKaaZvcRzB2w2WaMfErUsD16YQd/b3tsmgzBfdpiLZ4JuXQd2awdkFn1yB9O5P8W
	 o3UoRLyFaozpm9A7+5PL0CFonplM+Vc7Jw8O8l+sH9qKEsrHkTICykCeVZlcxzZ2QR
	 6zNF/ULSr/pdja/Mhsexh+HVXPLLyZJbjS8kqhtBp82VJfmRfVxXZHi3vzNYFFtsVE
	 PFEMvzjCpXy1WHlx3yy5Jlgr/4pdAiY9SgKESzVlujGDqRR69ZMy+LLvkPfsCnueNU
	 B7j3UHv/WDDV7fxFq6KEr0Iw1kmGRitLGYFzqRCb3CoBtEXmx7f7LB8otawt2TNx2M
	 XSLgjatswnUDsYZC4aMH/TbZY0a7Pqgt5F6XZ5cb42ltIHnOC4z/AQc3a1KpLBbg4A
	 WZU8B3mXhFOMe5VjjlCQiY/BWvhyChs0eASF+QMF1Vzr2ELCplcU9NypLPJVN8eLDi
	 0grZvE9CSevboOm/2F1mP7Ow=
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d70d8839f0so22853585ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 23:10:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788415821; x=1789020621;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0SXt+zKg72aqt2co0Md7aOOy9tUWiA94GMNENg6+61g=;
        b=Oo85ryO57BmjWGzPCnQ9stVP6Ta5Nzx61vShzw2m88hyIVobsgtqD8Uo5g60AdQnPZ
         WNWhVx4DIoztFq+di+SZmYeEDtHdChpuKbw2POsTOgAAxFbBtMEDSaWaEI2uANnhUzKt
         Ahi9hGYIP2lviZdqXT90WMeCNj2CEo49XOa/dIhe8AiNhIcWdfT134y+kvRqwxMpPFO6
         6kYkpkiFE3ilScvuWq7SKgOPyRvJnnF1NV7miOkdYcnrQOPb9cGBfCEiqj63+alxgV1J
         qfgaSHBKX5UVzG20e/PeC7hz3qbQYigFeQjBEe3dSnQ2667CxiQ/OQyt8XBQ/FUcoaYL
         6k7Q==
X-Gm-Message-State: AFuF++mNYShGPeflD5A9TBfZ0Bja0UOrNV2aCcEA/oGJPIci1XPOK2qL
	N22jHaGBqM4IJNIQXTgHvRj6p1Ffm0EZFJYMZhe0qX9ycTVCdlaobTDVUpQA35ECQNziGSAOnMT
	ukzhPUqxgNfBCZwKn2lLASBJubL5SKrjmyt/Oia1pJyzYzFxGRCbap4gvdK1i6zP3KHKMBPn2YV
	qA1J8fLA==
X-Gm-Gg: AYBFou16g0vGMhnejMOtuhqx/i6ywxL4OB4y75w6wx6E3+SZEovRcbFD7Ozmu4gGsEa
	udrL3jGurmrkRWV9qn/4cp7EYqy2u+8vEDVcywrfqd8BWY56AEEPDKTZEI5ef9XTO926SSPBgMn
	cRDJbrP9KMUMcSLJ30NML4B5+xAOPJnCIMxAJt0O/RfgTUllzl3V26nLpS/L1qS6TvYh2epBuU1
	rkG3DIQKZHH/k7Qb1hBhqesCda9+axaaxirs0GrVtOG2aZhcP3D3cwqfzIPtdWXQOfqEHoKMMB4
	0vgPn+grJXwoVEUKDdzT7PpBSqpUFMQbmaFeiXYIMDxgKiz/FPdyM4CO/ZH8jHciPzgITbtEkUk
	tHbdKx2QkgSg/Yu0=
X-Received: by 2002:a17:903:32c2:b0:2c9:bf82:dd11 with SMTP id d9443c01a7336-2daec646e99mr105324355ad.7.1788415821183;
        Wed, 02 Sep 2026 23:10:21 -0700 (PDT)
X-Received: by 2002:a17:903:32c2:b0:2c9:bf82:dd11 with SMTP id d9443c01a7336-2daec646e99mr105323705ad.7.1788415820747;
        Wed, 02 Sep 2026 23:10:20 -0700 (PDT)
Received: from [192.168.192.72] ([50.47.147.90])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2dafe0cf4d3sm4768265ad.3.2026.09.02.23.10.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 23:10:20 -0700 (PDT)
Message-ID: <c7850811-c258-4684-b232-e25ddfb152dd@canonical.com>
Date: Wed, 2 Sep 2026 23:10:19 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] SELinux: hooks for secctx_to_lsmprop and
 update_lsmprop
To: Casey Schaufler <casey@schaufler-ca.com>, paul@paul-moore.com,
 linux-security-module@vger.kernel.org, pablo@netfilter.org, fw@strlen.de,
 phil@nwl.cc
Cc: linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org,
 coreteam@netfilter.org, jmorris@namei.org, serge@hallyn.com,
 keescook@chromium.org, penguin-kernel@i-love.sakura.ne.jp,
 stephen.smalley.work@gmail.com, selinux@vger.kernel.org
References: <20260902220150.18586-1-casey@schaufler-ca.com>
 <20260902220150.18586-5-casey@schaufler-ca.com>
Content-Language: en-US
From: John Johansen <john.johansen@canonical.com>
Autocrypt: addr=john.johansen@canonical.com; keydata=
 xsFNBE5mrPoBEADAk19PsgVgBKkImmR2isPQ6o7KJhTTKjJdwVbkWSnNn+o6Up5knKP1f49E
 BQlceWg1yp/NwbR8ad+eSEO/uma/K+PqWvBptKC9SWD97FG4uB4/caomLEU97sLQMtnvGWdx
 rxVRGM4anzWYMgzz5TZmIiVTZ43Ou5VpaS1Vz1ZSxP3h/xKNZr/TcW5WQai8u3PWVnbkjhSZ
 PHv1BghN69qxEPomrJBm1gmtx3ZiVmFXluwTmTgJOkpFol7nbJ0ilnYHrA7SX3CtR1upeUpM
 a/WIanVO96WdTjHHIa43fbhmQube4txS3FcQLOJVqQsx6lE9B7qAppm9hQ10qPWwdfPy/+0W
 6AWtNu5ASiGVCInWzl2HBqYd/Zll93zUq+NIoCn8sDAM9iH+wtaGDcJywIGIn+edKNtK72AM
 gChTg/j1ZoWH6ZeWPjuUfubVzZto1FMoGJ/SF4MmdQG1iQNtf4sFZbEgXuy9cGi2bomF0zvy
 BJSANpxlKNBDYKzN6Kz09HUAkjlFMNgomL/cjqgABtAx59L+dVIZfaF281pIcUZzwvh5+JoG
 eOW5uBSMbE7L38nszooykIJ5XrAchkJxNfz7k+FnQeKEkNzEd2LWc3QF4BQZYRT6PHHga3Rg
 ykW5+1wTMqJILdmtaPbXrF3FvnV0LRPcv4xKx7B3fGm7ygdoowARAQABzStKb2huIEpvaGFu
 c2VuIDxqb2huLmpvaGFuc2VuQGNhbm9uaWNhbC5jb20+wsF3BBMBCgAhBQJOjRdaAhsDBQsJ
 CAcDBRUKCQgLBRYCAwEAAh4BAheAAAoJEAUvNnAY1cPYi0wP/2PJtzzt0zi4AeTrI0w3Rj8E
 Waa1NZWw4GGo6ehviLfwGsM7YLWFAI8JB7gsuzX/im16i9C3wHYXKs9WPCDuNlMc0rvivqUI
 JXHHfK7UHtT0+jhVORyyVVvX+qZa7HxdZw3jK+ROqUv4bGnImf31ll99clzo6HpOY59soa8y
 66/lqtIgDckcUt/1ou9m0DWKwlSvulL1qmD25NQZSnvB9XRZPpPd4bea1RTa6nklXjznQvTm
 MdLq5aJ79j7J8k5uLKvE3/pmpbkaieEsGr+azNxXm8FPcENV7dG8Xpd0z06E+fX5jzXHnj69
 DXXc3yIvAXsYZrXhnIhUA1kPQjQeNG9raT9GohFPMrK48fmmSVwodU8QUyY7MxP4U6jE2O9L
 7v7AbYowNgSYc+vU8kFlJl4fMrX219qU8ymkXGL6zJgtqA3SYHskdDBjtytS44OHJyrrRhXP
 W1oTKC7di/bb8jUQIYe8ocbrBz3SjjcL96UcQJecSHu0qmUNykgL44KYzEoeFHjr5dxm+DDg
 OBvtxrzd5BHcIbz0u9ClbYssoQQEOPuFmGQtuSQ9FmbfDwljjhrDxW2DFZ2dIQwIvEsg42Hq
 5nv/8NhW1whowliR5tpm0Z0KnQiBRlvbj9V29kJhs7rYeT/dWjWdfAdQSzfoP+/VtPRFkWLr
 0uCwJw5zHiBgzsFNBE5mrPoBEACirDqSQGFbIzV++BqYBWN5nqcoR+dFZuQL3gvUSwku6ndZ
 vZfQAE04dKRtIPikC4La0oX8QYG3kI/tB1UpEZxDMB3pvZzUh3L1EvDrDiCL6ef93U+bWSRi
 GRKLnNZoiDSblFBST4SXzOR/m1wT/U3Rnk4rYmGPAW7ltfRrSXhwUZZVARyJUwMpG3EyMS2T
 dLEVqWbpl1DamnbzbZyWerjNn2Za7V3bBrGLP5vkhrjB4NhrufjVRFwERRskCCeJwmQm0JPD
 IjEhbYqdXI6uO+RDMgG9o/QV0/a+9mg8x2UIjM6UiQ8uDETQha55Nd4EmE2zTWlvxsuqZMgy
 W7gu8EQsD+96JqOPmzzLnjYf9oex8F/gxBSEfE78FlXuHTopJR8hpjs6ACAq4Y0HdSJohRLn
 5r2CcQ5AsPEpHL9rtDW/1L42/H7uPyIfeORAmHFPpkGFkZHHSCQfdP4XSc0Obk1olSxqzCAm
 uoVmRQZ3YyubWqcrBeIC3xIhwQ12rfdHQoopELzReDCPwmffS9ctIb407UYfRQxwDEzDL+m+
 TotTkkaNlHvcnlQtWEfgwtsOCAPeY9qIbz5+i1OslQ+qqGD2HJQQ+lgbuyq3vhefv34IRlyM
 sfPKXq8AUTZbSTGUu1C1RlQc7fpp8W/yoak7dmo++MFS5q1cXq29RALB/cfpcwARAQABwsFf
 BBgBCgAJBQJOZqz6AhsMAAoJEAUvNnAY1cPYP9cP/R10z/hqLVv5OXWPOcpqNfeQb4x4Rh4j
 h/jS9yjes4uudEYU5xvLJ9UXr0wp6mJ7g7CgjWNxNTQAN5ydtacM0emvRJzPEEyujduesuGy
 a+O6dNgi+ywFm0HhpUmO4sgs9SWeEWprt9tWrRlCNuJX+u3aMEQ12b2lslnoaOelghwBs8IJ
 r998vj9JBFJgdeiEaKJLjLmMFOYrmW197As7DTZ+R7Ef4gkWusYFcNKDqfZKDGef740Xfh9d
 yb2mJrDeYqwgKb7SF02Hhp8ZnohZXw8ba16ihUOnh1iKH77Ff9dLzMEJzU73DifOU/aArOWp
 JZuGJamJ9EkEVrha0B4lN1dh3fuP8EjhFZaGfLDtoA80aPffK0Yc1R/pGjb+O2Pi0XXL9AVe
 qMkb/AaOl21F9u1SOosciy98800mr/3nynvid0AKJ2VZIfOP46nboqlsWebA07SmyJSyeG8c
 XA87+8BuXdGxHn7RGj6G+zZwSZC6/2v9sOUJ+nOna3dwr6uHFSqKw7HwNl/PUGeRqgJEVu++
 +T7sv9+iY+e0Y+SolyJgTxMYeRnDWE6S77g6gzYYHmcQOWP7ZMX+MtD4SKlf0+Q8li/F9GUL
 p0rw8op9f0p1+YAhyAd+dXWNKf7zIfZ2ME+0qKpbQnr1oizLHuJX/Telo8KMmHter28DPJ03 lT9Q
Organization: Canonical
In-Reply-To: <20260902220150.18586-5-casey@schaufler-ca.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/2/26 15:01, Casey Schaufler wrote:
> Implement these hooks.
> 
other than the question below, this is looking good
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> ---
>   security/selinux/hooks.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
> index 18dd28b2bb13..12614478b638 100644
> --- a/security/selinux/hooks.c
> +++ b/security/selinux/hooks.c
> @@ -6946,6 +6946,13 @@ static int selinux_ismaclabel(const char *name)
>   	return (strcmp(name, XATTR_SELINUX_SUFFIX) == 0);
>   }
>   
> +static void selinux_update_lsmprop(struct lsm_prop *dest, struct lsm_prop *src,
> +				   int lsmid)
> +{
> +	if (lsmid == LSM_ID_SELINUX || lsmid == LSM_ID_UNDEF)
you have added similar boiler plate to each of the LSMs using this hook. If
all LSMs are going to do this, then shouldn't we just move this into the
LSM similar to what is done with secctx_to_lsm_prop

		if (lsmid != LSM_ID_UNDEF && lsmid != scall->hl->lsmid->id)
			continue;

> +		dest->selinux.secid = src->selinux.secid;
> +}
> +
>   static int selinux_secid_to_secctx(u32 secid, struct lsm_context *cp)
>   {
>   	u32 seclen;
> @@ -6964,6 +6971,13 @@ static int selinux_secid_to_secctx(u32 secid, struct lsm_context *cp)
>   	return seclen;
>   }
>   
> +static int selinux_secctx_to_lsmprop(const char *secdata, u32 seclen,
> +				     struct lsm_prop *prop)
> +{
> +	return security_context_to_sid(secdata, seclen, &prop->selinux.secid,
> +				       GFP_KERNEL);
> +}
> +
>   static int selinux_lsmprop_to_secctx(struct lsm_prop *prop,
>   				     struct lsm_context *cp)
>   {
> @@ -7694,6 +7708,7 @@ static struct security_hook_list selinux_hooks[] __ro_after_init = {
>   
>   	LSM_HOOK_INIT(ismaclabel, selinux_ismaclabel),
>   	LSM_HOOK_INIT(secctx_to_secid, selinux_secctx_to_secid),
> +	LSM_HOOK_INIT(secctx_to_lsmprop, selinux_secctx_to_lsmprop),
>   	LSM_HOOK_INIT(release_secctx, selinux_release_secctx),
>   	LSM_HOOK_INIT(inode_invalidate_secctx, selinux_inode_invalidate_secctx),
>   	LSM_HOOK_INIT(inode_notifysecctx, selinux_inode_notifysecctx),
> @@ -7812,6 +7827,7 @@ static struct security_hook_list selinux_hooks[] __ro_after_init = {
>   	LSM_HOOK_INIT(sem_alloc_security, selinux_sem_alloc_security),
>   	LSM_HOOK_INIT(secid_to_secctx, selinux_secid_to_secctx),
>   	LSM_HOOK_INIT(lsmprop_to_secctx, selinux_lsmprop_to_secctx),
> +	LSM_HOOK_INIT(update_lsmprop, selinux_update_lsmprop),
>   	LSM_HOOK_INIT(inode_getsecctx, selinux_inode_getsecctx),
>   	LSM_HOOK_INIT(sk_alloc_security, selinux_sk_alloc_security),
>   	LSM_HOOK_INIT(tun_dev_alloc_security, selinux_tun_dev_alloc_security),


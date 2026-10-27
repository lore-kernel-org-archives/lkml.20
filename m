Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793135188;
	b=mHljjaiNxw1eCAEQ/0Mcu+muY4ZKAPByGUkzK4p+DmR1b8ZuxvC/hH/Nfn2M3VQONEgE
	 n7tFtZA6UicyshRtFi0k8ewicnanCFtNAoiRED47Ms9dMR7+9bTcPr67a2iNQkEeAoLFl
	 DxlC2VOxbeAGLgyZTsoyPzI4201ZkUqg2FqMRMGWtPKa7BvZDgKBFyRRnZ63nURZCGTTt
	 HpAbRroR3SNH6DMWYvHzBXnKF6f9JgHeeBobIUS1tW10H71+vUbOspr4pXM9K/LNiz2GD
	 7fpJogx4tId+2nqT7mC9qYdbHBx5j6vqyNLvSohg3IaOJan5aVZvVu2Ns/M4iRkWfOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793135188;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 Organization:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=iLUs7mDKOEAcw4ORxYxgGuH/mC9ip4fKpgyEIFsm+nA=;
	b=n9FBzHACT0JVJB+zLzRbjp/pXQybA/s46exPuMUSI0UFch/vQCMWuXAWbkhAdZiAHww9
	 ygzTgWpEaBc1tU8VeSUgO6iHm6NgksoZiVmLghYiydjaPm/Hlf9nI7LJbVIcY8xIFAxbg
	 SPigxb02D0jlnbia39xmbIwzr68Zp7Q2YcRl6mAR5QWOVrDBA+XKVzub0u4aZ5rrYtEqT
	 Rn7T7wqCzhACbUn/AmY7tfIzdpITIgyqwcSH/VKGTpkBIXEPHwVcE52qRRWg9Wf0R85fA
	 hmy5ToM/SNAhQzhxQyXwwtwFusT+alub7cYVa+ok5jJZE6bI/GLvXA+GpQKMrAbujyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=npTupSB+;
	arc=none smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BEA606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 21:06:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5BEA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=npTupSB+
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 2C47F3FE37
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 21:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1793135185;
	bh=iLUs7mDKOEAcw4ORxYxgGuH/mC9ip4fKpgyEIFsm+nA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=npTupSB+2G5aJoT9iC+bpvcwV5PjohTz068DVATm/awd/Qyox7ZkBpyWFi2sURuay
	 cafGgFTESk3ziJQv3qef1rLOPeOXf/fL12dACI3+noWjyJVaVBRVmSKgNrZC2AwuJg
	 co+46uUtSOelNwvjnegNLXouQUtlLoYYJnyNXkj9eTdCKgGt0GGXc9E+I961rwSR7C
	 CKnsFUrVxbRZrlVoLqAgS+TIQmEmxhx9jvzb0D4zaSGzPEzbjl17JjiJXqa9GLpM6D
	 g7UuEzOxmfKhVIos5PGnehYlWISwP9GrmACnEl+FgJcvQ0Gelu6R/mwDMil7rH5aqZ
	 woAQQYQ9iv+abClgvFMCKSO8eFnVxnG5q73wvs3lOm/T8zBT4dCGRzw777uGO1uz+O
	 yv7J7NYWOk6bXXdYT7XESLt0uGKW+H5dowr3t/9RFLm1e8/tpqlaTo/BMhx3yM38kc
	 G5FB2BNBswGXEE+0wqTSt0wZ3ZqviWzOzy4zjgzgpaTYzyiIH1V4j8y18t2iT80xZX
	 b1WaRG6PRs8FgRn+kmyLeckBWV0yVkVyL0TX8VIDhIZ+rB0vKnZVO+ow8jlst5tajW
	 8VhCn0IP9mRUOxXtc8GrrpJtDUv94KBrDZ9gMiF5xZkEL6ctGja+O3/Q4T78FhGBIG
	 XrAgYaM6zicY+0sWCodAgzMc=
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8b18d691d54so5082297b3.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:06:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793135184; x=1793739984;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iLUs7mDKOEAcw4ORxYxgGuH/mC9ip4fKpgyEIFsm+nA=;
        b=amoK55ZgqPH6Z5jGPvzOmhhqXCPRmbWsctGTsuKiLN8LxXSRnU1n+gakta5DvtFzG4
         qJgn4P3C89hUegoSalfP94aKTuDgECktWfRrWPLv4imwOr36JgJ+lnt4upqr1su4De2o
         7bgndt8ls51LG83A+x8k3sqe3gGFxfFDkUOT6zM8ZAnA6cUPw9nAwASJm7SbCpH7DZEV
         7YLlq3fsMuKaHYuswnm2jbh9LkwQpf2QHRCqTc27kZn/1eqg722/Yw38s8MOjAzK3gNC
         zcJXIts8AfWl1+X1tD3m/994zJImXNbC+/9muLMWoJXJm1bwX3WRKvrVcknLiKwGxONe
         6JiQ==
X-Forwarded-Encrypted: i=1; AKwUvBwcIxb9wx1kedellN0CdqcpSRxBGU4XWZtgQNH4ZIV2Xvs7RylCKVncQYeu1KGNl+8Wppoop6jvYvMViyQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLsy9qFupAcOMIKoBtEV/9KouuXi0g3IfhdRHVlZx4ZIcaAOskZ
	YsO8pMxKRWXK7vv/on72D9C3q/dTlBu0KfCnrWfC+br9/7G64D7m/u5e+BaOtkLxrWoBmQL1H/n
	qaUEAKyEYE+YDKRFXq5bOw7y6fCpgxF5pbQA4gfj2KRBWQATsens2J2gsIT0fA5P6IsnbzfGqbA
	mHbUwB1w==
X-Gm-Gg: AYBFou1Qar606OG8QGyMyIkInWsj/ekxh3/a43SgypKC6kDtTyTa9LOW4V1CuWK7Duf
	50DcOY6hzzWbvraYj9dLgRsfGC/aNRTOmDHE7DQuWmM+0EIA1Wz23wzHkNkORRkdvvMBTj3Dgbc
	EkSASO23Ypu+MOdnBl4SGJBtlz5sm9Gma7EYUyOlV/FXxwSHVXyk0bIMORDxlzZ8uoWH8+5SrAp
	uWZoCP8iyjtUtOCcHyWHT+CajKjUU/ZBmhyFG67EwfXh2lrkRUflZ8enU5pyr7Zsw2OGPIGzE7r
	IJbcpQIC66OZXGiiY7n2/Cqg/1SvUEXEFdffcUfbIkOiRlBAqt7CxQUCi5INzIxSseO4tCE0WRh
	H05nPb4ELAxuCsV3xmY8liSrMg8eo8jpkB8RWIi9+TkbJ0YdhCF+9ZY0=
X-Received: by 2002:a53:d58e:0:b0:679:ab13:5517 with SMTP id 956f58d0204a3-67a7bcec2a6mr336523d50.104.1793135184032;
        Tue, 27 Oct 2026 14:06:24 -0700 (PDT)
X-Received: by 2002:a53:d58e:0:b0:679:ab13:5517 with SMTP id 956f58d0204a3-67a7bcec2a6mr336512d50.104.1793135183637;
        Tue, 27 Oct 2026 14:06:23 -0700 (PDT)
Received: from [172.21.9.52] (host-209-35-187-178.broadbandcancun.mx. [209.35.187.178])
        by smtp.googlemail.com with ESMTPSA id 956f58d0204a3-67a79d7cd76sm776726d50.0.2026.10.27.14.06.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 14:06:23 -0700 (PDT)
Message-ID: <9c8f370b-fe0f-48ea-a8ba-2b0631bf7c3b@canonical.com>
Date: Tue, 27 Oct 2026 14:06:22 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] apparmor: Fix namespace reference leak in
 __aa_find_or_create_ns()
To: Wentao Liang <vulab@iscas.ac.cn>, apparmor@lists.ubuntu.com
Cc: jmorris@namei.org, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, paul@paul-moore.com,
 serge@hallyn.com, stable@vger.kernel.org
References: <20260917164302.2162938-1-vulab@iscas.ac.cn>
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
In-Reply-To: <20260917164302.2162938-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/17/26 09:43, Wentao Liang wrote:
> When the namespace already exists, the reference taken by aa_get_ns() is
> overwritten with ERR_PTR(-EEXIST) without being released. The caller in
> apparmorfs.c clears ns on IS_ERR() and so cannot drop it either, leaking
> the reference on every mkdir of an existing namespace.
> 
> Release the reference before returning -EEXIST.
> 
> Fixes: 73688d1ed0b8 ("apparmor: refactor prepare_ns() and make usable from different views")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Acked-by: John Johansen <john.johansen@canonical.com>

I have been pulled this into the apparmor tree

> ---
>   security/apparmor/policy_ns.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/security/apparmor/policy_ns.c b/security/apparmor/policy_ns.c
> index 5a907a875d8f..c423f4504d4d 100644
> --- a/security/apparmor/policy_ns.c
> +++ b/security/apparmor/policy_ns.c
> @@ -267,8 +267,10 @@ struct aa_ns *__aa_find_or_create_ns(struct aa_ns *parent, const char *name,
>   	ns = aa_get_ns(__aa_find_ns(&parent->sub_ns, name));
>   	if (!ns)
>   		ns = __aa_create_ns(parent, name, dir);
> -	else
> +	else {
> +		aa_put_ns(ns);
>   		ns = ERR_PTR(-EEXIST);
> +	}
>   
>   	/* return ref */
>   	return ns;


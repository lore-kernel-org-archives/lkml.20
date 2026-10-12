Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72053955CD
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791799889; cv=pass; b=RpylNK1PBxBg40+TFFYThNAiMG1LJWXc74eVblWCzJyqDLoQ0kI1OocUokfHoBirss1b+v1ZPiRuGXDLaZpQvCmljoZM1xgtCNV4SyERtmqY+zYjjd8KfzTM9lMM8frJxWkUZr0voCiVHMIkIi45U3VyE0/9qek+bbUSYxu11i8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791799889; c=relaxed/simple;
	bh=hD0XUYpmFbkzwLbEs6hxZkv+4L8VPUED/C4DSZiJEJg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=heX6/o9rhYYGJm6cpcaYGtV/2wbJHLU8qRo9prkpHkUWP1qS4niBiv3OaFKOXESw2HNGIpdtGpIonKxgwM/j6MyaOk8ZGMGPGWMb1VEhQUNOvr6QMGnVAYi1iL/V9UxzbyYwLR8JRmtkhHg7oes/3QoWjZPdOk5XqHtTku632I0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YXHNMIba; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YXHNMIba"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c2dcbcc546fso196912266b.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:11:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791799882; cv=none;
        d=google.com; s=arc-20260327;
        b=cD/5KDogns1hsFxNrvi/BxPBLHdJshFPWcTNa+aqC+Fwd4zSWEqRGsLTL8JSYBX34F
         oqDZxO2R94EHvNRbNf2Y0xCct3C8VA0Rv66j+UCqa8Z1YyM1Gt/ohekDwkShELanbPyV
         Am6tYDooUQPVuK3/T7pyUG9Lpu9fs+qoDQtUXFNPBhckDXhBtGqAlWv5203XxQVQTFip
         hLhn2/om8l/sYkAsq/A4d6UQoxoxeJErUT1W3AF0RKIV0zbsv5gRekMy2uyM40e4drSt
         fJujbBWmssbe1V59IE2XSI14JMhBHpzfBAnZPTdGk1Kf/hdCORWqCQ7vIFRHuqe1JNbH
         1Cnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IH/H5Rnu3KGQfAu4tL3ijSF/1VrM6iJeJ912BB/EjuA=;
        fh=iRz4TJevlViATilkOrkeYtLRuc1s86xVlkJtcXEe60g=;
        b=b41VWko9L6Xbc6V/pj4ffXyyC7unrP4713s8n87nl6VtLOZSVxAaany72z07UZvb/m
         GalqQb8K7s2q+xiYsmQwsq9zjcAViPc+zNDr2vG7NBUuX+bjRiHmy8l4bjwsN7fdidva
         4h0G+TnTYZzvpDGrcOXJm/1nV8GeWvzE2ZFuwZEmGXpxRF7K9ghy7GPUn8j7TDEd6EBO
         M2f0+wcrdpwl1J1dB7ob/a30BFRnZQ7jWCKtr+DepeT8qODInB0TCY89fXAwzJFW/+lc
         YHzaDUu9/QCXZOCyPRw8f+fiQHp7ip9KmnycztMwDvROgbJDhRoGBBF3qq1FcQVgVCzJ
         zNaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791799882; x=1792404682; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IH/H5Rnu3KGQfAu4tL3ijSF/1VrM6iJeJ912BB/EjuA=;
        b=YXHNMIbatKmqpRMhla9Q+v0No9Rhy8kGGt0tEgaKy+WczfjkqJKIMm6DJCd3jHSUlg
         wvp+FNfxoMkqFcfYnvHfQ0iRMId2i9p44nbcelwD2oCY0099ZBa91/Cb+vw8uiaeGmZI
         DUTog/2mRqc3sX7IOC4UkKP+W1EEf4Ls7ehW3sQaE8EOrCrt0v03in4aQLgJM/QHSszV
         QanATi4GA0fGmgMAYCCdE46D27HdiZAwU/5Enr4bSouUigzl1XdpYdCmIURcQ0YYykKt
         YEFpsZ5UzejtnI8/NFR+a2Oy0c0qAJR2EL/978Ne1lcqanA02AR0qzmShsloes9sxefU
         p1QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791799882; x=1792404682;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IH/H5Rnu3KGQfAu4tL3ijSF/1VrM6iJeJ912BB/EjuA=;
        b=aCvK/7HiRjhtk6TW0uA/aYnccTIjvnKZmwQzvOsyCjWqNDNwNV6m3JF0gwJ03+GIjP
         lJ+7x6edznPIGiKe8qdBSDyHL7zolWjPu/TGR9kWVrrpTrhcLwY9lVd5Plgot8xXC/hb
         XoBflTI+7qh7Zt7HmQib84JgYxOhdAk09j6GjSynsir5e5hodjoaeMLqo+Bge8ZkY9Ma
         AVXrKrqMyixveiQrs/9u1t/GLk9SlPdctMgYzMX4gQyT+BD+SnJQhnY6eo0HUEiex03v
         OPlhomyi/712DcO+f0Nowhf9oNo4RmrsrfCoVEOeHMomnea92+2r+GjgOuwO26huYUbx
         SM9Q==
X-Forwarded-Encrypted: i=1; AKwUvBzL/uyHymof/DU/owjPU6QorIeU6KZNmH50/o5oVla416Jl7xgYalVRg+GNAOnvGOVCnO71HaMfJV2GFW4=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+NPnNA1RAcTTKoclsZcUnMPsufjCAp5RLQO+pfiU5pJCjT9Wg
	RDxbMUnGyl+vwRTJmP7pYFpPKkhCTjclByk6tMVx59+St0Z9bp7proZWd53Nt+7PSqiRukxWPuh
	Ke5Frn04lEBBRb5bA7CihdiQneqcl3ls=
X-Gm-Gg: AYBFou3clq5Y9C89cPTaHKPKR6gk5OBQfxxuNT/Gvtz4kPJfDkub3VLo7W3cPQN133n
	E3IMcfzEWNYvKDPFm1nkosdLM+ydIiGd7qQbKcXwlEaOcF6VVbq3+NXjdTTfoSl0qvwfcBXLJvS
	PirRbv1nPLyMXWJ2JmwhJOiaAzR3hVsk9L/RqP2bLbGIFgToazQNy6aQaG1KFbVx+5RPgPlEVtw
	hPpPeDjZxjwvzu86I+iRwh7fG7uYJGkOJ6MXPo6AQW9o+80yUinWzpVR091MwFKoFIvoMRXsb2p
	sEOqDchFyhf4ACfoOlHLzMYeedr5kI1Bsz5zO1LdklV9uIVo+TsW34gz
X-Received: by 2002:a17:907:9625:b0:c2e:4c59:a3ab with SMTP id
 a640c23a62f3a-c31aa0d3c1emr865310166b.48.1791799881902; Mon, 12 Oct 2026
 03:11:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012060847.836027-1-zhugl3@xiaopeng.com> <20261012095538.938789-1-zhugl3@xiaopeng.com>
In-Reply-To: <20261012095538.938789-1-zhugl3@xiaopeng.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 12 Oct 2026 12:11:10 +0200
X-Gm-Features: AclHuK-zcdTy-mDP_rHpw_c-n4lrMxyUGTOyZXWU629AVGJdU872TFQ1QoVGClc
Message-ID: <CAOQ4uxgLZWGFhSHfHWiGFau7ZOXmNWsd8M5iVTOf+4_hO2KgGA@mail.gmail.com>
Subject: Re: [PATCH v2] ovl: reject lowerdir ending with unescaped backslash
To: Guanglei Zhu <zhugl3@xiaopeng.com>, Christian Brauner <brauner@kernel.org>
Cc: Miklos Szeredi <miklos@szeredi.hu>, linux-unionfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, liuwb@xiaopeng.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 11:55=E2=80=AFAM Guanglei Zhu <zhugl3@xiaopeng.com>=
 wrote:
>
> In ovl_parse_param_split_lowerdirs() a backslash consumes the
> character that follows it.  When the backslash is the last character
> of the lowerdir value, it consumes the NUL terminator: the loop exits
> normally and the backslash is kept in the output, so the lowerdir is
> passed downstream with a trailing backslash and the mount fails later
> with a confusing ENOENT from path lookup.
>
> A trailing unescaped backslash escapes nothing, so reject it with
> EINVAL.
>
> Signed-off-by: Guanglei Zhu <zhugl3@xiaopeng.com>
> ---
> v2: fix the commit message.  v1 wrongly claimed that the loop
> scans heap memory past the allocation; there is no out-of-bounds
> access, the backslash merely consumes the NUL terminator.  Thanks
> to Amir Goldstein and Sashiko for catching this.
>
> Verified with an ASAN build of a user-space replica of the loop:
> no out-of-bounds access, the output retains the trailing backslash.
> With this patch fsconfig(lowerdir=3D"...\") returns -EINVAL instead
> of -ENOENT.
>
>  fs/overlayfs/params.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/fs/overlayfs/params.c b/fs/overlayfs/params.c
> index c93fcaa45..5a15e5478 100644
> --- a/fs/overlayfs/params.c
> +++ b/fs/overlayfs/params.c
> @@ -216,6 +216,9 @@ static ssize_t ovl_parse_param_split_lowerdirs(char *=
str)
>                 if (*s =3D=3D '\\') {
>                         /* keep esc chars in split lowerdir */
>                         *d++ =3D *s++;
> +                       /* A trailing backslash escapes nothing. */
> +                       if (!*s)
> +                               return -EINVAL;
>                 } else if (*s =3D=3D ':') {
>                         bool next_colon =3D (*(s + 1) =3D=3D ':');
>
> --
> 2.43.0
>

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

Christian,

Could you pick this up via vfs.fixes?

Thanks,
Amir.

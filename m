Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EBE364042
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789401655; cv=pass; b=UUhdzJuJO6XP3H8JnhEolZMCaIGkmav/x4A+tHY6WhCr7bv3vpew+N3gbbzdcBfqE3V3CRtwmFiOy1gKTirDssvJxHGRdaCmMM5nk0Upy5WTz7ULaRvqlXWAJ4r7esv9XReWMvXrMlixj15iImgqDzHUSNtOaHzQlfaiT5KoCQE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789401655; c=relaxed/simple;
	bh=DA7uF5Wpgbv79gOFpdkMdi1M0g/8BWOdFdf6BE+9QMQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MA0UytEwD7pnqxdSIAFgJTaJYjlrZybwDJ4pvhVQ9utsGBpjDnHFTLOmOw+t9JHkiCQQVi+H6Kpkt0r5kuX4yAjdk8OVSXOiCPLbeEv/oMIoDJXv9pIG04gIxbXP2DTsRLvl817pddMKBttwP4uMCJY/fesCgVTfw/FrKa2inmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fps/r3cU; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fps/r3cU"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8694801b07dso232656b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:00:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789401654; cv=none;
        d=google.com; s=arc-20260327;
        b=VKgaAbu/0rLAcY5CF+UfsQNwXc3+1eMWsFfgMH3vqbp47BoR9QX8Z+VlqMZxhDPlDK
         aehgwifBDwY5kqpj9DeCvcePtUlcfPlTuYKo/0O2MDCrWc6KblE2HD6yCNxtmho3S/cu
         aQz78cxpyr0pd58ZRhSxs7Ne8QB7v1zD+OxAZmdE6iu6EyJgbuVEEAZu4mKbALc2lWDb
         208E00gjikTylf+hyaOhLucfPsVuqCJacIo7KMFBFGAErWE1Af5L/dtqBcAa4EAML6x3
         0vhCM+v7WT//sFeo4FwDibIa8aMlBIRXcGXKmw6t/TDIQ70F40Nvx4F25Tz2Ocd4qPRY
         x5Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DY2MERo4pqi0K0VhneHvwSpwoimTnvKFD3fY4QkQorI=;
        fh=8+GffOkuWFXFp0a3bZSZxJ0fWQX+8bpHBeCaon5wWSM=;
        b=jCiK9p461Yl8LixBuVvtyRsVLHKDZGL3sFj9ADes8F++7JydzuqzYxn5vh5DZjuz6A
         1gUokgg4D+BRmZbdpKqXfT0SHVTzlim9R0HB8UXKv8LmakQ+uZAH/WPFIZism9PkiT0J
         sNh2C0Mcb0XcnogOk+CN5tHuZD+xuWfkhn8Azw9Dokdp0vktB0lS7UX9OU/pTejCOjZO
         Ya7WmvPzehr5D9GBlD5Fhlj0ngXLo7KqnhOthxfafX5UD3YtQr15ZxHimN19v9XigJ0s
         v1A5ZyEJZ3hPcc5QieJvKR4u/xYwCHt9tL60AwppoUK3H6WlShUZsTwmruqTkiSvqp74
         TkZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789401654; x=1790006454; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DY2MERo4pqi0K0VhneHvwSpwoimTnvKFD3fY4QkQorI=;
        b=Fps/r3cUbm6JkmXeid5V8OZJnj1EbeB0gr54/Cz/L2qpDQd6vf/L7g0ewhx6F9oFYC
         IVr8BGkgwJFv8fiLdsDld9JyaHPOQC0wu4jlZdsMwfCpcany6g9g4mxjfNh4H3/8wCSw
         b0CcKIZq2tZ9ujgl0Z0WFRIj4fZJrBypfM9tPcap6fG9ugUkeA6fuyIDlsfOBEy4opUH
         Ez/wO3e/BxdtFkVZkflQr+ABUQbT89dxyGViOdp3V8ffJmbPWyIN8u8C2V96bzVTMV6v
         4LipUktlPu8QsvnnYJRIy79GGnsSJU/Qxn2FKt2P2Gm9pMsZ6Z7ose0UwcdsRBAEiliq
         rPOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789401654; x=1790006454;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DY2MERo4pqi0K0VhneHvwSpwoimTnvKFD3fY4QkQorI=;
        b=O7mTnfX5QZ3N5LgWuZa7Ndg4Ylde4Wj1UnmyKQqlkeqCJLFaARYYtHwlvNNTkXWJSh
         1cRtd1eT6uVaLI9WcmYGQcWbut7uWItR3p/r/FlPJiRjM7SConNs5S/Y8X+W+0/MCR5q
         hGzAebhXsi7Udb97zE2Q15DhQ0u6GabknqDTQ6em+JFJCG2y7GlgywB5z0754oIzqQ3s
         ej9DhtjusdupONU+JK477278naIuFanf+/aHzhrAKFsMc+uHE7NoL1kePDk0veXzJE0Q
         bECBg7+Kuqkvb7yO04dYpRBNgmRHVLy5FZA4CzW8TwwGafMs/O9UFTO9unx2tYP6XIUc
         MIYw==
X-Forwarded-Encrypted: i=1; AKwUvByApKOSUMn2vjT4ELKGPLYZWewk4zTvkVEHJtst7AqzLrd9inY7UHavoPTmPlU3HM/pJtQ8C++/aPus2lw=@vger.kernel.org
X-Gm-Message-State: AFuF++lCL2OqLZ7JIR/xNeL+GZp4Axx9KwDMVzmQNGlAXPrPSoQoSNI7
	zrQpzE/Ny28UXk+rCUKI1P8b+gTzitzI1F8nhFPv3HXURQlCPnTOsCeZbMWxMJKmu9LNjdvxlWz
	QAuUkpla8rvBGXPe6AZ+mQl9QpG8/qlM=
X-Gm-Gg: AYBFou2ohvNeHwgUCgONgEoBPjjFSYrknCppmjnhr/6rXgWcS3bRDDg+bCKLahj1CaK
	29LXpYk35lgovyEKQt6hS/kI3CRxnNZoRvMJ45fqXZFaKnW0ipkRq88z82NPAIxpzn9qJ6WfZU/
	lHyO5zxZPc2aDUUYq9UDVjrB25K3+YJDOg2TBrqHm5QGYKUF8RLJoLcgHTtfUQP1he+CKzQsbHJ
	qCBP1ZMhLlUoiul7RTXsZvsn1ViflbZB8bkRm0IF1jOujT0JeuZndTQt83tLMJAUCYhDxJ1EOqb
	VSHqMIaYKB/d2C8RZF97nPRRr/sruPOrKmKNuUruN+H4B+BLGK1uvRlGTORMxwrlNhO2kKAB/pN
	I9sez1LJ/cfyfSqZnwxRtGBld2epfI45fVOabUDptoA==
X-Received: by 2002:a17:90b:1d4f:b0:38f:aa76:88b with SMTP id
 98e67ed59e1d1-39dec1c3dabmr4866025a91.4.1789401653630; Mon, 14 Sep 2026
 09:00:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914132920.10127-1-harimishal1@gmail.com>
In-Reply-To: <20260914132920.10127-1-harimishal1@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 14 Sep 2026 12:00:40 -0400
X-Gm-Features: AcwNN1Wxf9uW0Stp_OdrSiy6kLoKP1kUMtA3NKxerasiMRbBAeEiR0U57Nj_bA4
Message-ID: <CADnq5_PKDe2dtDVsfzjNFwu+tjoH5DzE+GU7x+O8X=ymbDAmKg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: bound SCLK FCW range entries to the table size
To: Hari Mishal <harimishal1@gmail.com>
Cc: Kenneth Feng <kenneth.feng@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Hawking Zhang <Hawking.Zhang@amd.com>, Xiang Liu <xiang.liu@amd.com>, 
	Lijo Lazar <lijo.lazar@amd.com>, Yang Wang <kevinyang.wang@amd.com>, 
	Asad Kamal <asad.kamal@amd.com>, Rex Zhu <Rex.Zhu@amd.com>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.  Thanks!

On Mon, Sep 14, 2026 at 10:36=E2=80=AFAM Hari Mishal <harimishal1@gmail.com=
> wrote:
>
> atomctrl_get_smc_sclk_range_table() copies ucSclkEntryNum entries from
> the VBIOS SMU_Info table into pp_atom_ctrl_sclk_range_table. Both the
> source (asSclkFcwRangeEntry[]) and destination (table->entry[]) arrays
> are fixed at MAX_SCLK_RANGE (8) entries, but ucSclkEntryNum is an
> unchecked u8 read straight from the VBIOS, so it can be up to 255. The
> destination is stack-allocated in both callers
> (polaris10_get_sclk_range_table(), vegam_get_sclk_range_table()), so a
> count above 8 overflows a stack buffer, not just a heap read.
>
> Reject counts above MAX_SCLK_RANGE rather than clamping to it. Only
> one version of this VBIOS struct (ATOM_SMU_INFO_V2_1) has ever
> existed, so a count above 8 corresponds to no legitimate table format
> and means either a corrupted or a tampered VBIOS.
>
> Fixes: a23eefa2f461 ("drm/amd/powerplay: enable dpm for baffin.")
> Assisted-by: gkh_clanker_t1000
> Signed-off-by: Hari Mishal <harimishal1@gmail.com>
> ---
>  drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c b/driver=
s/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c
> index 4b796d60b03d..3217ad3c1d17 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c
> @@ -1025,6 +1025,9 @@ int atomctrl_get_smc_sclk_range_table(struct pp_hwm=
gr *hwmgr, struct pp_atom_ctr
>         if (!psmu_info)
>                 return -EINVAL;
>
> +       if (psmu_info->ucSclkEntryNum > MAX_SCLK_RANGE)
> +               return -EINVAL;
> +
>         for (i =3D 0; i < psmu_info->ucSclkEntryNum; i++) {
>                 table->entry[i].ucVco_setting =3D psmu_info->asSclkFcwRan=
geEntry[i].ucVco_setting;
>                 table->entry[i].ucPostdiv =3D psmu_info->asSclkFcwRangeEn=
try[i].ucPostdiv;
> --
> 2.43.0
>

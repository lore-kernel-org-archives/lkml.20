Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793283896;
	b=frF83CN0GN436MptaHExAEWhCDC7v//MDxSa/PL0sSdSFkgNE2iqF0tipzFo8sbZkZ9l
	 WffY6L10F+a9xsDEQuFriv6+joqCXFw7IxYtKUeN670dTjN+Uo4BYtZNa4olj1gpl0ROB
	 FaTCNJnA2fh7ESeug9p49pK7XEC3WjQWD8MXa9mWHPzyLf0Wo9+ePPaIBpSEoRa8t0OuY
	 0KlRC+sVFD/62yE37NLpjkVzjtKCoANuDXrq1e/Lc4h44lNBCwv+ek8m6bH15TCraWaCM
	 Jk/Pfv/8nPr9ebHYBT7H8svrrB53Jt2dmlZ7N2neo5oConG8ZeN4O6PSofBIZ/snlsw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283896;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=b1HUff2KBmgxmH6yjfASlYTd1KUp0LIqOs90e6k8hDs=;
	b=IkShrHrmpmG7Ew2T2EQ6LU9IN5iKpYiiKZxRJ/8L+19c6auVolKjTDnzRu5BpkSl1oRl
	 0n8aetxGXSAwM9c3MM6DD7+ih9NDwaxHuMagCIC3QRJP9cXeFigx0ELICe22oiMI+u0dl
	 s/ck/trvnHsbdpkECOM05vONeJAaQIeDwE7o1Uitxk9WMFDGCjXB2Mo1HAqWeWNjn4Sdo
	 UgA5ijnXjpOahvxOu771oRhPnlUUWO0SNaQ/mRVKKu53HSSKf9iu0EQp9FhDWU3TK2Fuh
	 v4yiN/SS2AKiKiidtpYaQPpKoFosF8fRIRF7jA7oobwSiD8Ok4fWKsO+r/aLGMfS2JA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wPMV2lYJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6A9606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:24:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD6A9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wPMV2lYJ
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-363cd582f45so243787eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:24:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793283895; cv=none;
        d=google.com; s=arc-20260327;
        b=YiqKIrAxo0fY8s1GU2MwIvYLbbUCRJ5Ij5sJ3Quw9QMQEVlU4zxc+0gm2TTfcPhwBI
         BGN3svGzqdoMnx8jfq9F8c62IRhOBec+VXblNb32nR4szrd1bsArbODDpw6CelKUQhoW
         Whyu4lbtNp9m3gWKEQPNJkQcLZp9iTQInUAyUeE9no1Uvls3HZjrjR/Ut58/+RcZRxII
         M/d7uUIn88Ms2eFaxD+a1VrXhxUlqMU6wm7Qj64blbobxVdvfwKENT9k5e58e6xawCp+
         jnEFKtFSZByZPN4DxY/JX7vEGxfqdcYE/xn33iFz1NSwLLmhyW7J0ZXLvdBKi2hTGZJ3
         tVOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b1HUff2KBmgxmH6yjfASlYTd1KUp0LIqOs90e6k8hDs=;
        fh=zGeneNdgg8MisLBPPSm01f8p8G3hhW4hMr0eZvXBncE=;
        b=mjuYmPM8LMakeQNwblcbmK8zCjSThqWXGaihYgNxU8BHKsLqOgmxSCV9+c56Fo53fk
         wU+Sb0/QqMx3JyuC+ucRBtKGH+3n8wtoGeAictHhGaFufFDgMLZYHAuZJd/eAaP74z/f
         zvc2cIfKqZGHs/Jz+A65SFJKPWLHBrP8aNpXSaWxt4zwuacRGeFTfpmsx45H8WqeEf5g
         BwJKvPIZMu261633juSU/NO7di7c5wzoTCkUK4G01p6QCcInRFQjjH1fXmMcwg3NYE7f
         MA4eZafRi+MXq/fl8w1MREcNzHjrwUSpkC6z6+y4e4W3sixHyAVlrinetQkE3CdMewiV
         1c9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793283895; x=1793888695; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b1HUff2KBmgxmH6yjfASlYTd1KUp0LIqOs90e6k8hDs=;
        b=wPMV2lYJzWa0tpgECLtiR4xSA7Ib9NyOpFFaHjQLw1kdLghJaZo5jp5oSPzBBe/YJH
         mWo9SGKH49rwasYjhlRQOv66FeIAKjsSlpmGFNZtV/O5plIxPy3TFHaop1vitWNw0/yW
         ELheEJ8R7OV6Sge965L0jI/KRKWwuZvILBncPo72h6FwqNzg97DmilTO01VUViJuNou9
         CpS+HFZlkJCYEFLWE9VSxkxFhcuJu6BlwNRfyhuCUqjGtQacHikin5+Nt5D8Lk8xV4WQ
         0PhW8SkWrSSeddonWFjrhWuQMGuMvhvkb3VnigBOLojJM22dRDKu4PvjgCkkE9YqBxCX
         C4Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283895; x=1793888695;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b1HUff2KBmgxmH6yjfASlYTd1KUp0LIqOs90e6k8hDs=;
        b=jAsO+ODy6wJSZBUMinnfpczUV8GahkWSlwzJUiSh7eyvFoFqE6gsRUhmTVHDsZIotk
         W4LDEkIYspeBcHc+e404YIHBrJfW+iJtU6aahhBhcdTXsRPIzUeF1n8DB3Q2nQomQ1eK
         6FB7Ghk/6h8/RsM9kQBMbBGioNSpzPfOt+PdDxCwNz1217sTrLgdG+nMhQ6YEzl8Bmpb
         RDXaUegXVz9Ax6Eahat72b3hPOfEcKkSAyQ9vra8xrXlqsd30x8dQZYuFL3xktNnuZbb
         NMMuPCLaLsxuP7FJTcOshee5rTskQ1t1svn7p5h/kRbDqa9ERwu8P8RkGLiXkzs+jymw
         3PHA==
X-Forwarded-Encrypted: i=1; AKwUvByyGCfCiNV/XojrZwxKI12+GhI3CoebXM2u1rctd+C9Fh2JZsVjVQOu8entZbebK0T33CcsMSS3z9u62yY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBKE5jW5hCLRp8x3ZVkrvrKlJ/bHJvVmw7EOtIPdgWrseshbLu
	lFskepWnc75yKJ5W6FBqeEL/w72bBvCzZmW5EOXp8Le1MtqqtCqMmH0cfKg/bmiofgb+hutAqaD
	/hQS2pLRj0GQeWMyT5ahBapZHL6O+L2o=
X-Gm-Gg: AYBFou2ZA/GkCjfk/QTjH5zKwxEMxCP010k0uKhYxv1/sOBH8dxWwtLsCwl1PRVmwXt
	0vmeaBg5GR+X+KEWEwd3L610rQlhFw3qtJf5jocbH5kJHWlrAIgSkk+KpcNhkPV2nUxu1/VDfVP
	WadGxPrCOynueIfM9KwTiUB0PzgD/OXYdFMITf3f9GpbG8fgy+X42XgaHlVAN2sDUizriziQS7c
	3vSGdc0eNcsI3XvRR09pv3jzIceGfx8QbJWG41zM4ADvtBvrmDDpblYysa1dK8gxrLOyUWrEBoD
	lgg/4wY3nguT8VuqK2F3iRPTruko5ZJFMXWtkjBzVamfss6wGnINlOp50xisq6t+m0DQ34Sjokd
	Z+CiyYhlBESHxVrZhe2u/Fsn6pNjHtRGrtWxZeaSNDHLrpqQSr3k6x55FSUyNAauoCwA27Jlw+k
	biBammicx2LZRUVIbYzBuQTfllRmbP2Q==
X-Received: by 2002:a05:701b:2803:b0:16b:4f52:a08 with SMTP id
 a92af1059eb24-1a6c26adc43mr10411808c88.0.1793283894754; Thu, 29 Oct 2026
 07:24:54 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <auNVlhF6DGyFYx10@sirena.org.uk>
In-Reply-To: <auNVlhF6DGyFYx10@sirena.org.uk>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 29 Oct 2026 10:24:43 -0400
X-Gm-Features: AclHuK_UPbQmPV7BBnSvAVPIEEtQb5W89rkm229lBE0fVYRMBexHzxOVe-By28Y
Message-ID: <CADnq5_N=r+BDQbEo7EeX6oYMuBUe8QGNTz_QWSUHKZLZOC=GHg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the amdgpu tree with the origin tree
To: Mark Brown <broonie@kernel.org>
Cc: Alex Deucher <alexander.deucher@amd.com>, Kenneth Feng <kenneth.feng@amd.com>, 
	Kevin Wang <kevin.wang@amd.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 10:18=E2=80=AFAM Mark Brown <broonie@kernel.org> wr=
ote:
>
> Hi all,
>
> Today's linux-next merge of the amdgpu tree got a conflict in:
>
>   drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c
>
> between commits:
>
>   a2eae9f4fa1b0 ("drm/amd/pm: add zero fan stop temperature support on sm=
u 14.0.2")
>   44d0d3031e479 ("drm/amd/pm:restate all customized OD features on every =
table upload for smu 13.0.0/smu 14.0.2")
>   af52c8fd45fbd ("drm/amd/pm: add zero fan stop temperature support on sm=
u 14.0.2")
>   9b0890e72d19b ("drm/amd/pm: preserve committed OD features for SMU 14.0=
.2")
>
> from the origin tree and commits:
>
>   f990c94a2633d ("drm/amd/pm: add zero fan stop temperature support on sm=
u 14.0.2")
>   1b63bb397db20 ("drm/amd/pm:restate all customized OD features on every =
table upload for smu 13.0.0/smu 14.0.2")
>   d2c1e98658b6c ("drm/amd/pm: report smu energy accumulator updates")
>   8d4ce79aff1cd ("drm/amd/pm: preserve committed OD features for SMU 14.0=
.2")
>
> from the amdgpu tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> diff --combined drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c
> index dda435f19ca66,62f16d17e22bc..0000000000000
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c
> @@@ -2277,8 -2277,11 +2277,11 @@@ static ssize_t smu_v14_0_2_get_gpu_metr
>                                                metrics->Vcn1ActivityPerce=
ntage);
>
>         gpu_metrics->average_socket_power =3D metrics->AverageSocketPower=
;
> -       if (mp1_ver =3D=3D IP_VERSION(14, 0, 3) && smu->smc_fw_version >=
=3D 0x00685000)
> -           gpu_metrics->energy_accumulator =3D metrics->EnergyAccumulato=
r;
> +       if ((mp1_ver =3D=3D IP_VERSION(14, 0, 2) &&
> +            smu->smc_fw_version >=3D 0x00664800) ||
> +           (mp1_ver =3D=3D IP_VERSION(14, 0, 3) &&
> +            smu->smc_fw_version >=3D 0x00685000))
> +               gpu_metrics->energy_accumulator =3D metrics->EnergyAccumu=
lator;
>
>         if (metrics->AverageGfxActivity <=3D SMU_14_0_2_BUSY_THRESHOLD)
>                 gpu_metrics->average_gfxclk_frequency =3D metrics->Averag=
eGfxclkFrequencyPostDs;
> @@@ -2600,14 -2603,9 +2603,10 @@@ static int smu_v14_0_2_od_restore_table
>                 od_table->OverDriveTable.FanZeroRpmEnable =3D
>                                         boot_overdrive_table->OverDriveTa=
ble.FanZeroRpmEnable;
>                 break;
> -       case PP_OD_EDIT_FAN_ZERO_RPM_STOP_TEMP:
> -               od_table->OverDriveTable.FanZeroRpmStopTemp =3D
> -                                       boot_overdrive_table->OverDriveTa=
ble.FanZeroRpmStopTemp;
> -               break;
>         case PP_OD_EDIT_FAN_ZERO_RPM_STOP_TEMP:
>                 od_table->OverDriveTable.FanZeroRpmStopTemp =3D
>                                         boot_overdrive_table->OverDriveTa=
ble.FanZeroRpmStopTemp;
>  +              od_table->OverDriveTable.FeatureCtrlMask |=3D BIT(PP_OD_F=
EATURE_ZERO_FAN_BIT);

I believe this should be dropped.  The FeatureCtrlMask updates are
handled in smu_v14_0_2_od_edit_dpm_table() now.

Thanks,

Alex

>                 break;
>         case PP_OD_EDIT_ACOUSTIC_LIMIT:
>                 od_table->OverDriveTable.AcousticLimitRpmThreshold =3D

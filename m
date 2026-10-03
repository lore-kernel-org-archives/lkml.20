Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB99384CED
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 17:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791049074; cv=none; b=tWoJuExJu+qq10wSaNkN5U4JNW3Q5LrMxO5hjBKXgnZXJ+lwTyZndKjiXAjyHZrDnBHLZgnK1cKAfaPJAg5tbniheG7olF8lu6kMLhqSsSE13O/f873WyzAJk1ae0EvaDWI6QWs2P+HP8DqB1WfOvfWq7b3nQiN1ZWDBL4L/uIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791049074; c=relaxed/simple;
	bh=ffsJ105eYLUOuLk7JN/4EgkWfpmmINiOvVNT5OhL4Jk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A27QNJEpXHZrGodR4bTeYhv5UPzEbVM3hTC71ogTFc3QA6WHGYRP6vkBP40zi6CkmLfKwaBa3RFXQVpmopEp8FF7jycUXTiHokdmfvYpu//ZgYswuhN/iX2PEyG2HW4tAgLD+JhAax/0jDIPrjlOKRE4oJ1f313KEDQEgLS5TFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VsaZhMEG; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VsaZhMEG"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso6314175e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 10:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791049071; x=1791653871; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I2lRWsP1FfRJ0fI6QeP0o6eYlL3R/tQRBoVsnT5hF6o=;
        b=VsaZhMEGaTNKa9BsUOdA9s3PPKEfhCmv1EmN9RCz33admRwT8Ms/Wy6G2grwFhrJtf
         /PATnI8ft0htPhiYIXQdIVZi++AjnJn6wVMtw+h8Aai/XczE6rqa5UGxl3R3iea7wEgk
         5eNRBxpFSOy8SpcSFQjeHG5YlfYeLvMSruP7pktiwIZUp2Vtp85xKhEqClrmJxvyTnWv
         6QDtMt1jNKOsEIcwQM7WgYEQO+jgdW8J63et0+Dv6lqe9ayWz6rNbQVpNGafvyrnX25y
         2BYe/hyPSng4uGsgKJsYh7psGkfPdA8SZrxLLTjuwYILBCk0TrKer6+wGkxYUN4Qx5/Y
         K2Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791049071; x=1791653871;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I2lRWsP1FfRJ0fI6QeP0o6eYlL3R/tQRBoVsnT5hF6o=;
        b=hz+l6vznFvHoyd46T+5CvHPExBQeqoOx5PmOeZ8rd5oEpXZLW5tIJBJ9tS2WEfMNIG
         Piz7/S/hiCnlIZYhZxDYcraMCMalfb5L4uYlRvPJSirssk/zeSvjPy9uupwWS4yDF8xo
         GX5WVBtChFTuEe3iiUvfj6jHJcvezk0crtAOM5JnPjOLKEaL11IEYDn9bQXp2T5poGz6
         pvdJOCrkAtAXtJCkzbI+bvfX8JpuwZOoC+MXuUZxXKaygSEVq3IxMejeC99lB+njjjA3
         0/rtODtzLLkXHCeEjgvRnGVjhbuXcWW5y/Pk1DwDuE5m+AjaoBxv7v7R5i9ch/oqox2K
         BEMQ==
X-Forwarded-Encrypted: i=1; AKwUvBzteU4bbeUjnjzOLD2lPA3GEd2Q/JlWDehL7SSv3+o045yC2NcFKocvXf7ex0eNmpfz10zUL+x7wej85NQ=@vger.kernel.org
X-Gm-Message-State: AFuF++l17jHYjs1W/pV3K14HNOAzSQ0FthKBZiT0S+3iI7CKwJ6yTVja
	pOkM2hnPZtTbjZotaH1f7vuzClIXZPwHCeNa1E+HWqAEKGP3kjzFA+zn
X-Gm-Gg: AYBFou1CzZa+OfcdqlY+auqXiC2SKvVeNAS1mB2PLHBVxlZqv/aiPnanCDLwtI0L/7r
	bWsVrv8WtfhNUMbvLSDf55W1B8/6AVMD6nQcrjDqgM4peVDlXvs2bNmSBI0nbJ9zPKrzsp3R+9W
	J0sho353EL04aCuSOI9pbmGgoNq0cMyxrrEVqwonW+zVvFBgsXoKHgr9V84144YqT1o1aHg9PNi
	WdMmYDBV+13e5dr1UDdVF3OLKqO6MIMWHoTqVB1dNmRM/ctJwslTzgj9HsOIkWKNJTVLtWQy0Oy
	B60RQc66oDGS5m3wdQJ4aFHFL6ExoIjyynSvJWz0zcQLm1MzYrq2TbQaJ/lirnteOyJ4iegI5NY
	4WBXc6QgvQYniwWbRZcOTM0Ux4wBNsCfRiRNCFG1JJ9a6GGc99s2M1qa0EBnllFax21Eogtj4t2
	SXcOADvZMxmmNHiLX9Fw/Mwepjpww6TjencMAMJoZPSg25crylAhWVH2D4vEEJ7zHh4oKS1Z/H5
	BheYvhKRvHLpK2XOPZ35LirI85twOiiQkMNzfOkiJvmj5U=
X-Received: by 2002:a05:600c:2049:b0:4a0:35c:8953 with SMTP id 5b1f17b1804b1-4a027566371mr66713875e9.7.1791049071004;
        Sat, 03 Oct 2026 10:37:51 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03feed16bsm152460585e9.4.2026.10.03.10.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 10:37:50 -0700 (PDT)
Date: Sat, 3 Oct 2026 18:37:49 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal
 <dikshita.agarwal@oss.qualcomm.com>, "Bryan O'Donoghue" <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sachin Kumar Garg
 <sachin.garg@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, Abhinav
 Kumar <abhinav.kumar@linux.dev>, Wangao Wang
 <wangao.wang@oss.qualcomm.com>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>, Deepa Guthyappa Madivalara
 <deepa.madivalara@oss.qualcomm.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: iris: avoid plain 64-bit division
Message-ID: <20261003183749.4f113fcd@pumpkin>
In-Reply-To: <20261002124435.3435628-1-arnd@kernel.org>
References: <20261002124435.3435628-1-arnd@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  2 Oct 2026 14:44:22 +0200
Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> inst->fw_caps[BITRATE].value is a 64-bit integer, which on 32-bit
> architectures cannot be divided:
> 
> ERROR: modpost: drivers/media/platform/qcom/iris/qcom-iris.ko: symbol '__divdi3' undefined!
> 
> In particular, doing three divisions in a row is particularly slow,
> even on 64-bit CPUs.
> 
> Rework the calculation to replace it with a single division, thus
> avoiding the build failure.
> 
> Fixes: 5f21cd9a4ae4 ("media: iris: add support for multi_slice in iris encoder")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> Please check the math, as I'm not sure if this is the intended
> amount of rounding. Previously it was rounding down twice and up
> once, now it just rounds up during the combined division.

Can definitely change the result:
	DIV_ROUND_UP(7 / 3, 2) is 1
but
	DIV_ROUND_UP(7, 2 * 3) is 2
who knows what the value is supposed to be.

> 
> Ideally this would be replaced with a cast of the incoming value
> to u32, but doing this requires to prove that this does not overflow.

You only need to prove that in incoming value is less than 32G (Hz).
The '/ 8' is cheap(ish) and can be done first.

David

> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index 8c4c47944f22..5294999fdf7b 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -1588,8 +1588,9 @@ int iris_set_slice_count(struct iris_inst *inst, enum platform_inst_fw_cap_type
>  	} else if (slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_BYTES) {
>  		hfi_value = inst->fw_caps[SLICE_MAX_BYTES].value;
>  		if (rc_type != HFI_RC_OFF) {
> -			max_avg_slicesize = DIV_ROUND_UP((inst->fw_caps[BITRATE].value / fps) / 8,
> -							 slice_caps->max_slices_per_frame);
> +			max_avg_slicesize = DIV_U64_ROUND_UP(inst->fw_caps[BITRATE].value,
> +							     fps * 8 *
> +							     slice_caps->max_slices_per_frame);
>  		} else {
>  			/*
>  			 * No bitrate target exists under RC_OFF, so approximate a


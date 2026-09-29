Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E3A3E6DD5
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790700734; cv=pass; b=rGks6RVFJ0ir9v0Hi+zStElBDON3DcvNvDUPFGFV1ruU+u1hQ8d2LEaEjnAxropW/IRNdB+f0nNjb2wU2LtPhHon1Q2DUL2b+7g3m+hIOElv7KUNBmSavs2/HRgzDhaOXOHOjKnlhPG7ORx6du91G+qpQF06TEHo2dzdW8bsVFs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790700734; c=relaxed/simple;
	bh=jwf0l5Fw+HV9E6x2wX8XBAM0k7K/aBNmScMWv44UYSk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I4x3DJigTjAF2f3SR4XZ+8Up0mRLLLQ4rECQIFwlYlmAnTcBxRUfc4ePp9Qu3Lp92SVzjKJ6fir6elZWD/I8eGD/9eU/MCynV7sFgqazc6oU++ylGjCzxvmfceqWlMmi5uiKtUjghDVgIMZ1qsZHg8mkAbZMbyVxxwiN+lImawU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bw+61bMV; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bw+61bMV"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5ba3b8a5187so81772e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:52:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790700731; cv=none;
        d=google.com; s=arc-20260327;
        b=ciql3VUx3RM8W9Bbo2xUnWC2lQxS72Txg+QPOzXx3lKKNM6p7Dqsp7UdcVaRWRDncv
         z6GSWPf16r2Cim3Ynm6SABRBnIbSmGM0bsr0vUBOKp09FTSUdcOfj2JfTay7UelzFgWS
         JsfMBT/QKK/PL+0QbTC2YkhxQmDfOfNsusowLme6xqjj33s5/fYvHhBSsY9Evj/QwtnJ
         WcQnIIcDJvo41IfK0uu/4lCsZu6BCuzAR8f6CuwcYnAmsce42ypprU0zQzzmTf5owgi4
         LJDD2fLHtkduFWIWmIUW7jcgmvRFgZlutmelyh4LP4oLwpmPtnsDFt4+da3zuCx8flSL
         LjXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JetRDdCxvex9qzj4077GQtsI0JjV0QDP5tFqeoVoSsM=;
        fh=q3Sd+4R7B+1vB0+vOPpq0BVDO8nxlkO2Np7g/gDtIiM=;
        b=OYPcQW32jH6se16BxCevjJZbgtOmuCjX2Pee1VGu4XNYa45eVwg724DOxE/IdFUW3i
         bTIfjLsx+sJoO4+MFfZ6b6FpuKyz3XNRy1fi8Gt6gbVvST8RENcWfiaoZ8v/b3gd3Sp5
         wBzCI1kZwr6HNQ+kgLZw/cnz6kpuGyXTsAj344K+vA+WqgKChUz9PQCu3E/IHDMsYElq
         6y+sHpofAqpvv0j7A5uq/J5DE3fang5jcrCv/fLg65WHkGnpSdlxj3qjlike1SaCgVY9
         nIg5FodM7Oc55ZDdzkAkjrdKRbN2fIbmkK1uJOX6sRQY6HPXOt+b8yVcYGD16e/R2oWg
         MT1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790700731; x=1791305531; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JetRDdCxvex9qzj4077GQtsI0JjV0QDP5tFqeoVoSsM=;
        b=Bw+61bMVBinqQ0CDl+3rQBZ6DRBZ6gbftIAuZvd8jr/NHo+Omd2FfNvmYZLjrYG3li
         usR9Dt9pA0dM6zq49VC+RUslPcfyG2MKqG/rSTWKyPy3++bvIWN4lSH0VjNpMcxkdymf
         HEv8nwldvaO+qzzcZKAjeEyBltNHzTOstv4738Q7roJR+3SkeJwhRiPR7qBXNRgTgxMC
         Uxx8H21dy59XesoB7JKuQ5nx+vd3z0XhI4HyX1IjX6pqP4bu66zN66LkFGb7TFt+qO/Z
         qojRZgf3w39g8JKfMN0PKcrfMOUQm/cg82mefKV6USlVNKQjfMdJyX0oIjDx1MT4qT5I
         mfzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790700731; x=1791305531;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JetRDdCxvex9qzj4077GQtsI0JjV0QDP5tFqeoVoSsM=;
        b=zQbjZvd0PEG7LNG9k2yiGF5SVjeHgk0150Z10r7wmW49+/3fnHXxJCEDrdOmCMXblf
         7RUPDwzTbFwJYN1iseAT49sZRW9SfEa00yw08JV4ctmeBpEonb04FxHguD/ax5T6f0iy
         8QnB3pV+Cxj9kQ+3CoisjLdLQqNC46AM+isZWTvKhBsKEfb7Q1m4Raamv7INwxVu6E9F
         B1stkJR93NfD450Q+ZhpRdoe+5tGLxglJwBkeEXcwuEMz0O5LHbpe5DQf89OLouVJQ5G
         0xiqi5VoJ6TjTWTYYbZ2CowAukuSy+826SBx4qVz/NhKOxN6vT7CHyv+Mz09SzBQOiKU
         vWxw==
X-Forwarded-Encrypted: i=1; AKwUvBzqvOOv3l2NDK3clfDMFI+FhiEpDBshXt+9iWFksaP+e8snhWjxkPpRC4HBEUOSClHkdU3+Z5SBvP4v21w=@vger.kernel.org
X-Gm-Message-State: AFq9FYLsEw+EEkKlaAjC3TQTOeTBAT4Vxdgol3/CS7u4yd76njhP6Y5u
	wokKCbmGBogFgZUhJtpqX2tYkBtgGK2TeU/sTJKf/Eb69WF5kgsLvSS9TR2EJRdV0xy4PCbPE5X
	rQmop08VTiG2UzEIZzUOtFY4Eeufh3/g=
X-Gm-Gg: AYBFou1aRxIyzYVycEUOITE+uWK6GG0lwzvelGpVW6w8/XjIVzeh0tkPX8fvnR4vnef
	FS3Kwe5JG+jBKix8Xwy3rovjShY9LzJnp6GQXpCYhWTJj0seKktiR+HIBZ6+P9otM4j3knzGTi6
	ut91DqFoL0Cu3lYP4lsUCfagrBsvv7/uoxesTUIyFa7mbIcXpx/O0E4lYcg9r3kuzvfJTxG0wOp
	4CuybaGytex2QhNQs2CTEn6uw8hcf5fOq2hX09DwYiLW4r945IfzHoBzWgdkhuVWvYawTo2OTYP
	G/KGFQO+K7AZEbD+uEa6PCH/O01y+7tDSL27J9i6cPRDDoXQrcjXM5vgW4nndsggu1Gw9koXQJ2
	W32yE0kI+eRQ8f/WODJs=
X-Received: by 2002:a05:6512:3daa:b0:5b6:1a7c:30 with SMTP id
 2adb3069b0e04-5ba3becf14bmr41478e87.51.1790700730984; Tue, 29 Sep 2026
 09:52:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926042757.2109927-1-geoffreyhe2@gmail.com> <2c521063-9f79-4c6f-a9cc-c1128066aa6b@oss.qualcomm.com>
In-Reply-To: <2c521063-9f79-4c6f-a9cc-c1128066aa6b@oss.qualcomm.com>
From: he geoffrey <geoffreyhe2@gmail.com>
Date: Wed, 30 Sep 2026 02:51:59 +1000
X-Gm-Features: AclHuK9BoLCeKcX60rOMfghguTPx1LnlcbeSQfOdhwtwXJywamBYVzyznEB7WQ4
Message-ID: <CAHAtOKHeFMLoHG8NspQcEec3BvsneSNODhd+AW7yGF+vFLOO_A@mail.gmail.com>
Subject: Re: [PATCH] thermal/drivers/sprd: validate the sensor id from the
 device tree
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On 9/29/26 10:46, Daniel Lezcano wrote:
> Why is there a mismatch between this check and above in the code:
>
>          thm->nr_sensors = of_get_child_count(np);
>          if (thm->nr_sensors == 0 || thm->nr_sensors > SPRD_THM_MAX_SENSOR) {
>
> (note the "thm->nr_sensors > SPRD_THM_MAX_SENSOR" instead of
> "thm->nr_sensors >= SPRD_THM_MAX_SENSOR"

Hi Daniel,

Thanks for the review.

The two checks bound different things. nr_sensors is a count, so eight
sensors is still valid and only a count above SPRD_THM_MAX_SENSOR is
rejected. sen->id is an index into thm->sensor[SPRD_THM_MAX_SENSOR], so
it must be below SPRD_THM_MAX_SENSOR, hence ">=".

Thanks,
Weigang

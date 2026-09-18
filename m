Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D09B414435
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789720385; cv=none; b=WXHOWc4HsyJYL2X82z7R7zG50Vz17ygwyb+EvEDX3tiUv+7M/oL18up2F1u+CWMG0DAcfwISoGatT7WN7LuLyh51tx2N4t/nP8yo1cjJc4fTS1u5/vujp6CyD8oDip+c0/3Azz/QTyD07JLHeaQHiAymsngbdNOyu4v48QidaCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789720385; c=relaxed/simple;
	bh=pKTzsHsh+KOl7XVkDAfUJy4MbfFG1awKeay+vTS1O6M=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gKYYSTRVMR3ohb1mMllDEkCwniw6U3kks/l5sMK1bG2d7xDY5XN6Em9HTwTLMvjs125IRBkOmqgKCSHe76Pzgu0aHwwd9j80lWgJWbkiL0ZGgSIgJCtDPXc97VuONlICZDXVBYP8XoITSCZjJbKJCuenaygpeE2KX31mnhUEm4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nfgSxmbP; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nfgSxmbP"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a6056ac81fso731636a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 01:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789720381; x=1790325181; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pKTzsHsh+KOl7XVkDAfUJy4MbfFG1awKeay+vTS1O6M=;
        b=nfgSxmbP5YP6RLt1l/C3o18goqydZY6Jye3F3+ZWnwOWeUSvRQLwsWBwpbUkljNEjl
         U3Kogfx8Xzx5Xsp3GmlYo+KSbSlLLSSNjNwuJktBSjSGX8BX6woXR+xP6Ev9uaea5CSa
         2gRzHkTLpP9tI1CHhNUFMqEhN3BG3U52EsZVoN9+pfbH2dfpmMUB8GolvMeBaH3doWh0
         R+Dzw0FjkOxo5ILY4DA69NzUes/29fE6oHGKmjxqlH6v1xEzCt3kixkYR52BmuXEq2NN
         bGnSGQa4YlulZr14sVkq1FRjCKroD9N2ZRGPH8EfQIkoaHi31ya+P3HM4/l2K1vMuSSp
         IsBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789720381; x=1790325181;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pKTzsHsh+KOl7XVkDAfUJy4MbfFG1awKeay+vTS1O6M=;
        b=1BZ5H3oRf8+DsVF8g+Sz6DiYY8lxjl/IzLFtr3th6Vis8RWOAJq46vbxNhyJoi0cyS
         WSeRgFsLR99TxKFvxWAqonlQQU+VEcs1TOzZ43hI34ba0wnoJ7725weVHhulfCkDq0lO
         9tXekYItoD6oiAQj1RZhtktuVxXXnyXJ3Q55/w37gqgtWWCdgy4ay04xkWpwx4eSv5AN
         X4H/DBKyBtz/iih78hhmHIzwIPvl7KcMvjyvYr3sUIkkN1Xx9qvacc8e7LLfl9HjZ9h7
         4Y7IhIZKMK4qNUVC9vIe9tUw6x+vy6vP9MEvZBLURDcNyvK/11xvdAhO3y6vvkNML+/A
         rOGw==
X-Forwarded-Encrypted: i=1; AKwUvBzmr1FJPh8YJGh8WcwL4RytMVD5WC0ZhsOavAAIzCLF16Go/gSKkglecC8jToDF1NugUc73zTkwY5ND/CA=@vger.kernel.org
X-Gm-Message-State: AFuF++lUChO4S3wdavNxptaKzgrWAXo8Ju61RjmbXHlzbfBXgrh1d/lZ
	LXAVtFzF3noLeaRMiSY6NibukqfdqMdDUrZvdwjQPGZZITR8tqa8RwHLKKV5qJNq94Q=
X-Gm-Gg: AYBFou2CU4HDyzWcmqz5iQW2bfJvvpTJU09D5CGybkJ1homOB0O9kGIJ1NEOgkiZ73G
	rW8WkcDbz/qcuGuNTmT7w2+viO1kXGDwqlK1erc/NWu2O/R0mXToAWBUKEOu6b8q7bprdGcPUaW
	buUk5UxlU1XnCmexKWcgnxjfAzjTauMSK8QHVKUCPWF/2yRUTDtCipAkKxPhOK5Z3ikxJSkjy9R
	hRvB+5svmbnspU76g5kB4gWhXRv9gh6SeSv21ukLkV44ZQgUAj+aJUkKBzfRxzcwA4j4Yy5X3Pr
	k+ZMNNEAVPyS2DhQINASNonwdlo3KtE9cwnZCWadrDYrvclwKSiC07xHVP8EsNendjlAnW15OdX
	Lh2OYYBwFSFDDFWrrSsxZLPdce3c5pvYgDT5xaxU0Q+L85syQArzFkDyUsKsd4ruUWeGpRigNJq
	bFPCroXHmIxvGxS/M+oWjt1OVI2m1BjmrxkIMbweYXV5MznHXkIN9uFBf21zoQNJNtTY3ypLQkB
	gE=
X-Received: by 2002:a05:6402:4026:b0:6a8:e223:fee5 with SMTP id 4fb4d7f45d1cf-6aa531ef01fmr709732a12.44.1789720381295;
        Fri, 18 Sep 2026 01:33:01 -0700 (PDT)
Received: from draszik.lan ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa59605618sm513138a12.11.2026.09.18.01.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 01:33:00 -0700 (PDT)
Message-ID: <950335110f9d9c22a026fa5174e492c4194299a5.camel@linaro.org>
Subject: Re: [PATCH] phy: exynos5-usbdrd: Use dynamic phy_cfg size to
 prevent OOB access
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Selvarasu Ganesan <selvarasu.g@samsung.com>, vkoul@kernel.org, 
	neil.armstrong@linaro.org, krzk@kernel.org, peter.griffin@linaro.org, 
	alim.akhtar@samsung.com, pritam.sutar@samsung.com, kernel@lvkasz.us, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: jh0801.jung@samsung.com, dh10.jung@samsung.com, akash.m5@samsung.com, 
	muhammed.ali@samsung.com, thiagu.r@samsung.com
Date: Fri, 18 Sep 2026 09:34:24 +0100
In-Reply-To: <20260831070309.158069-1-selvarasu.g@samsung.com>
References: 
	<CGME20260831070349epcas5p4c62a4e46592dffe95723ddd51a6068e0@epcas5p4.samsung.com>
	 <20260831070309.158069-1-selvarasu.g@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-08-31 at 12:33 +0530, Selvarasu Ganesan wrote:
> The probe loop currently iterates using EXYNOS5_DRDPHYS_NUM (2),
> creating both UTMI and PIPE3 PHY instances regardless of the SoC
> capability. Several SoCs (Exynos2200, Exynos7870, Exynos850, Exynos990,
> and ExynosAutoV920) provide phy_cfg arrays containing only a single
> element.
>=20
> On these SoCs, when the loop reaches index 1, the driver reads past the
> end of the rodata array, populating the second PHY instance with garbage
> data. Since the configuration structure contains critical function
> pointers (phy_isol, phy_init, set_refclk), any subsequent access to this
> PHY instance via exynos5_usbdrd_phy_xlate could result in a kernel oops.
>=20
> Fix this by adding 'n_phy_cfg' to struct exynos5_usbdrd_phy_drvdata to
> store the actual size of the phy_cfg array for each SoC. Update the
> probe loop and the xlate function to bound their access against this
> value instead of the hardcoded EXYNOS5_DRDPHYS_NUM.
>=20
> Assisted-by: Claude:claude-sonnet-5

Shouldn't this be 'Assisted-by: LLM'?

> Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
> ---
> =C2=A0drivers/phy/samsung/phy-exynos5-usbdrd.c | 17 +++++++++++++++--
> =C2=A01 file changed, 15 insertions(+), 2 deletions(-)

Other than that:

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

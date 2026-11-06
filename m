Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793982623;
	b=DB3G6oYbm0hp3Vza968JKAJ61MS7oqBbTiKTQwx6B1lhML56FCkHQzc9afu/AOighpCf
	 pI8cZlwb3C5dgbDQJ/Tx9NVjgJaanO6ejbAmDar57rVbNCC8IL+lr7OCJUpZ7f+M/xE1n
	 2XJG6z7/MIztzI2W4U2kZrOP40rjp1au8Rxj0KA1Qii/ZGLW9IDiSuB/kLWXRxSgBGk81
	 oqKzM6YHqquPSKYIHuaV1m3UOvCUijn7zmsN8+e/Bd0wnWNve4M/hbTpusZjUeyeUBO+D
	 fdqBV/XmD4kfHzIYvKWmdNBZx5U8wKGYZhtc9WYLZXlR/qFwaAdf8RJKGEmFXuHneUg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793982623;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=FH8WzscKogu5XU+7DFOngcgQrl1MXmTxhCA2KDW4bI8=;
	b=y26aIc4Tr4otk7G4upu7P8gCIJSyBHwufj0/euBEk765mDs5K40ipbk+x+PZF3V5Sq5N
	 btWpD1ABgkI0oX6kxxSi7oYP7IYRR3BJqU4D+0YJTIJVE34TGVHJAcCLnPOIaTVw+9DrW
	 fFZ4n7TIVmJT2UZ2ek5ZlerF0UO97moNkQEhxSvY3oIgWmdsPlTJ6/zDZHauTqbliKqQU
	 s+l/5eViWkCcTDGeNVZB16GrmCIda1XiPIuEeKeW8u+xFB9P0WCJzj3pA21I3HfMytcLR
	 1Q1oDF/X6idrBMoQnN/pMTS7AObRVgNgW91NxHsmNYRc6Y1nJHO2t4+tQHCpAhw90sw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wLWr6qql;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB85606A32F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:30:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFB85606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wLWr6qql
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b308fca7c3so7382247b3.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:30:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793982622; cv=none;
        d=google.com; s=arc-20260327;
        b=KwsNNrtOx45XrQd2hayFzQatxBhCG7GrziPHFQFLDPGFI3RITBpkLOrJVYGr/BCPx/
         59fS6xt8ELYEHRstHkEhUFPP0TNt9lqQ2biQVIih3f4rusCPv+bb25zlppCG9Dcl2QSI
         xjbLAKK5aJmH1FId/nF9WQKG0WioTziqwqlO66YTFPurACdAlvSLSRNkB61mA+t67rjS
         QB6uPxe2Ce6GKCJCCoGQnC5cNDVY5XEDOhJSqrjZA0d03Pbr82H51FLxTlMjStiAK1QS
         udSAzhW10ZqzEKMVoTp1ZKYC0UfJqCnoylR7plKf2seh2RFccCliREhmDqxGRrvKG7l2
         Ge2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FH8WzscKogu5XU+7DFOngcgQrl1MXmTxhCA2KDW4bI8=;
        fh=4RbGgvbBxb22wX9a9oNDKu6luBvjyLbt8Z98AsvN0Ac=;
        b=hG5qkU/t2n39/2UznE99bQWhxEGu0GlsIH3JrwP/8o9xLpIzTootD25O5BWaxsWzmj
         mCfQEzq/nF2N6dQYtqvHxwme/6G7YxMqtLLZ/Xn/0geZ7JRFVJ9lnJFn7VFVuF3hCL1n
         QMsJVfSu66BioGw3ZCndZeUFlDFBLlWG7OgqXcEjkdhEtcJThDsw2zVsTzvSUcCIThTl
         nvjw+CKBt8hYT7x8G1CD3eplfRF/20gIv4xSBItk5xBFx3p6Ye1Dvdc+gBw25fxN1Gxx
         ELoZ+8noNXe8iliT76EaeEh45oFQVpjYGHS/A52SZdrnfFKc58THn0CK+qVOlS5fHAIn
         dgvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793982622; x=1794587422; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FH8WzscKogu5XU+7DFOngcgQrl1MXmTxhCA2KDW4bI8=;
        b=wLWr6qql15sYV7yiDKmkPjELYkTZb/66URjn1f3hxyT0hfMfrTHYj6R9jF4Jg2Z/T4
         JX0m1zI3ekCQKQM5FjcxDA2mIZkzQvOAuT7mctFngOk+DqyjFnBnWOCNocsox+V1XC0s
         YGzT4jWsYWF/m7bzwuHjF6gNzCRxKJN90QvgGaAixCTtvmf/6nMu47piDMfMxMKWvRpe
         Ecv/PmkSSAC5ntPknEXG7I+vIME/9hd+gU2CkNsQJPMF9H6h6PqZ4Ev2dxOWq7LQoCCZ
         ECuDOxENpMvmipGcC4aJfcqe+xwrM61m//apdM/wFpvlOZabhnsXSIYmB6TkdVXgAhrq
         Szow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793982622; x=1794587422;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FH8WzscKogu5XU+7DFOngcgQrl1MXmTxhCA2KDW4bI8=;
        b=jfPBhgldezHMrO47Be2HGsAS+OsG6WGmtYiE8sfv8DrJkyfVNXxdTzp19rfUwqcV/R
         u+M0FFx7BJZJgflWBQd0OT3NSYA01DCoc+uuOnV1lOWc3HUlweZ7s+ZNDiJb93NWd55b
         CKoLUZ0OoBHc9ocZK4DYGIHu0lSkik7IHdUzGnUgf7ojOAE8LAtqS94qTU4t6d3/fqBX
         ircCzKyQov2U9jQufG5ufBQnlJ3mJm+kUTLxndTTpjmmxzNiWm9EFLWTweP6bpRHfkeN
         W+QUzSVc+pLM+eEvTYuA/UNL3A0Be6C9idP/FGB4VOI7bRwFXynKH1Abdl9GyGefhoaD
         egvA==
X-Forwarded-Encrypted: i=1; AL+hErH9uJXeHYRYxLSGifFm8hJ4XOWMpiMeek/c0sqtuJ/eL6CBjPNvZbQRmFZpoMxkMcmyAd0OYDxR4AYC+yM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jNFzKai5O4Ird7mbeiYF6SQOZX9oEVDIjdipimPkPLHl/DsOM
	1F1tHf/3U6BwyDMWyEWavteo/tNC+nB5Z1/i6Z4VEFyJQfIpdbFsR01Tajr4uQLj+HPSP1A7ZIM
	dD3fQJSvTzdoMPvD9HX6MSDQg9Obuk24=
X-Gm-Gg: AYBFou2hU2ETh0zmTTh6zJlgjGXv2Y8xaCbytManmbLUca5fOA3UgvmmN4CpEyc2bon
	hQhY/d4EcpZUdJZEfkMqYnpLQylWR7OM9JoBwg4/NQ1+ZrbFRYm4aqnLQfVS5mFI2yE8WN9y/Ft
	wH22mJ/DCRGReNfPC4JXX2lYQYa9mOS5EDDY65vvrY9EhASVQ0Zlzq9jmRkTKMjk7o0uCRq2gU4
	5sq+gT4FH+alMSefn0Uu9jGacvo81Tvc+Dfulyu+jWt54lIM32J1pu05K4HSeWGfw+2EZS6+h42
	R+YlvDd71HSgkLovA2wzDnk0rdhziKYdNaSXacgmDBHI7vG6I1QmWJ5qas4xaaGIMuYu1FEmkSE
	jrjerdpShTVaCu6GFQiIBDTKRZia+fQ3p1sm8s3V/pQZrIMa2aArSjEtQsgaeQIYlFF0sNxxMHt
	vv2FKbUiUh8cPvW4VZwCjAtl63SjW3opzUr5+5HOMdLSAyf3+ejtwi9IxthoULGf5HiH0Df7ODK
	9kkLB9s7A==
X-Received: by 2002:a05:690c:a006:b0:8ab:3918:33d9 with SMTP id
 00721157ae682-8b341b65b54mr16819607b3.61.1793982621872; Fri, 06 Nov 2026
 08:30:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104234928.86458-1-sidchintamaneni@gmail.com>
 <DS1PR21MB4279C556CFB876C5562C7F1182772@DS1PR21MB4279.namprd21.prod.outlook.com>
 <b660d79f-887e-4594-ba76-c45dc5f75435@linux.microsoft.com>
In-Reply-To: <b660d79f-887e-4594-ba76-c45dc5f75435@linux.microsoft.com>
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Date: Fri, 6 Nov 2026 08:30:10 -0800
X-Gm-Features: AclHuK8v0JSVhaJAzidw4U6zc9uGSHU7HDuopjMhviWvbGm_U0W3rhAX7PpRRzM
Message-ID: <CAE5sdEhozq5SVj-SJLndiaANx1N_sTiAMBD0zeA_aafUYAGOKw@mail.gmail.com>
Subject: Re: [EXTERNAL] [PATCH v1 1/1] i2c: designware: Add ACPI ID MSFT0006
 for Microsoft Cobalt SoCs
To: Jarred White <jarredwhite@linux.microsoft.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Len Brown <lenb@kernel.org>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Allen Pais <apais@microsoft.com>, 
	"rlmenge@gmail.com" <rlmenge@gmail.com>, 
	"hargar@linux.microsoft.com" <hargar@linux.microsoft.com>, Jeff Kirsher <jeff.kirsher@microsoft.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Nov 2026 at 13:27, Jarred White
<jarredwhite@linux.microsoft.com> wrote:
>
> > [You don't often get email from sidchintamaneni@gmail.com. Learn why
> > this is important at https://aka.ms/LearnAboutSenderIdentification
> > <https://aka.ms/LearnAboutSenderIdentification> ]
> >
> > Add the MSFT0006 ACPI ID for the DesignWare I2C controller integrated
> > on Microsoft Cobalt SoCs, along with its 300 MHz input clock description
> > in acpi_apd.c.
> >
> > Without an explicit MSFT0006 entry, ACPI device matching falls back to
> > its _CID (APMC0D0F), which configures a 100 MHz input clock instead of
> > the controller's actual 300 MHz clock.
> >
> > Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
>
> Acked-by: Jarred White <jarredwhite@linux.microsoft.com>
>

Thanks!
Do I have to respin the patch?

> > ---
>  > Cc: Jarred White <jarredwhite@linux.microsoft.com>
>  > Cc: Jeff Kirsher <jeff.kirsher@microsoft.com>
>  >
> >   drivers/acpi/acpi_apd.c                     | 6 ++++++
> >   drivers/i2c/busses/i2c-designware-platdrv.c | 1 +
> >   2 files changed, 7 insertions(+)
> >
> > diff --git a/drivers/acpi/acpi_apd.c b/drivers/acpi/acpi_apd.c
> > index 9fc667d6776c8..a1baa056931c4 100644
> > --- a/drivers/acpi/acpi_apd.c
> > +++ b/drivers/acpi/acpi_apd.c
> > @@ -198,6 +198,11 @@ static const struct apd_device_desc hjmc_i2c_desc = {
> >          .fixed_clk_rate = 200 * HZ_PER_MHZ,
> >   };
> >
> > +static const struct apd_device_desc msft_i2c_desc = {
> > +       .setup = acpi_apd_setup,
> > +       .fixed_clk_rate = 300 * HZ_PER_MHZ,
> > +};
> > +
> >   #endif /* CONFIG_ARM64 */
> >
> >   #endif
> > @@ -272,6 +277,7 @@ static const struct acpi_device_id
> > acpi_apd_device_ids[] = {
> >          { "HJMC3001", APD_ADDR(hjmc_i2c_desc) },
> >          { "LECA0002", APD_ADDR(leca_spi_desc) },
> >          { "LECA0003", APD_ADDR(leca_i2c_desc) },
> > +       { "MSFT0006", APD_ADDR(msft_i2c_desc) },
> >          { "NXP0001", APD_ADDR(nxp_i2c_desc) },
> >   #endif
> >          { }
> > diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/
> > busses/i2c-designware-platdrv.c
> > index 1da6b0314b6a0..f359d38cc63c7 100644
> > --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> > +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> > @@ -280,6 +280,7 @@ static const struct acpi_device_id
> > dw_i2c_acpi_match[] = {
> >          { .id = "INT3433" },
> >          { .id = "INTC10EF" },
> >          { .id = "LECA0003" },
> > +       { .id = "MSFT0006" },
> >          { }
> >   };
> >   MODULE_DEVICE_TABLE(acpi, dw_i2c_acpi_match);
> > --
> > 2.45.4
> >
>

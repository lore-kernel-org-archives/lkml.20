Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794012268;
	b=bx04syTz3sQCnIquK0X0Fvj+UvwSR8NibpAvhZcs3DgalJnUoogNwjJhSzMXWE77FUjz
	 6doXMbBvnBi/ULgVYb1MuSllagJwa68ExuXwXj7He8SU4SRTSeo4zO6UoYm8dCjFnaLtr
	 LSArwLdIXFq1r5Pr0uz0pCa3JpxnGrl/rUbq7LF/ixAaolhMdR9MNmFZyeWZ+iZ33g9EZ
	 ZnPIAjgXrX9N9E+8SMwASHsED5w3iidyaZ1Sc7Vn9oOWVcNv0fDpiYgJcSXJJRt0CLBPt
	 /23F0U6XS1L6u6U/rk2pO+S4w14UP4aUdsvrnzFX8gOe6PXKODgcDj1t2kkBK+LO/Hg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794012268;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=9eiigW6hOkRbk1j+4tKF/Fi6rPLvkQU7Pgh902ZJH6g=;
	b=wPSwMfksfKafjBcvxCfzaUyeaq/YTAwGyH8jZR/E5rj2UizwASGVA2iLgbZBOokMdXqL
	 W9dOWGcZQqs0LAP76llAVfjv4cHR+5sNyO9ZkfJFcWNXygvs0O+rdFhDrLbwC8gqEWt7Q
	 0Gv8uH0MZZSlYzvgvpZEaFNyn8B1bcHwvbPGlYByox3g+ZdTJqj6SlvcpEgRiTZHPcFFE
	 wh7hHMVSEQVd9qU7hDNFtxa4odcV5uWQsvR/N8D2E9KKi4fJ+9K5pg3fRB2/3SnQHSuBM
	 QxvzI8pUAvDVLyS7fvfmSl6oDzGmkPG4puyIXtWKqSSTF6QGNrAwvb7VION2Dn0UdMg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nOiLZodl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51C9606BFC1
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 00:44:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E51C9606BFC1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nOiLZodl
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b32daac9d7so1825897b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 16:44:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794012267; cv=none;
        d=google.com; s=arc-20260327;
        b=rYD5qAvASGA+5YFfL/qB5hdAqsjvnKBfeozNoKq86Yx3xR+EjbmquOy52daTtBnMAa
         l8j3UE1ee3iJwRf0iZjJ2mYZATK/w0ZuRRB30eu0vK3eOaJ4jrHdfn0WoDIVxLEsnwTB
         wfacxxXAvG4XPHdQoumT6I2nJI0iUzKld+bHnX3AxYB5ZkwGuO+88j6FvcMZ9+CMzzjK
         Owh4+rsxQ7N6n+7S9Jv+SlFr+81sl55KZIJpun1xpfCsxpy5aGdnSIeMHx7awihVIiOA
         oIbb1NVwLv29oL1OuB0lbgLkW9fGM3zwpHLEK/aNRV1SgQrxzs6fmjuQj5K8yy/iOwT3
         C9nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9eiigW6hOkRbk1j+4tKF/Fi6rPLvkQU7Pgh902ZJH6g=;
        fh=9Yb2/KkXeUTYyboEROuRFQGNTHWLC266VDsKNsbQezI=;
        b=iFv7RTlxHLBlBAtIdZTg5SSRjdqTgEx1Vbt1Agr+qjFOLNqSXnSD+YWEk4LJNPTRQW
         iKAVPhf2rvUOYUc4rwTy9vZ/GuCB0xdzKGOrlqyMJYJesVAHKSrB4AeO3wbNPY5ea9hU
         sc/lAZEc2GsaQ/+tuQqySS2pJ5ci8/TnnzAX9c3d5cb+9v8+LDY4nZZOyFEE4cMlmrfU
         00g2+N1She9r5en1bgg2eTFrYftWescrd+e1F91JBL9TAH22gUUcDizipE4W6XMj2B32
         VKFf3uLa0f8PEVSXqSBnSMvl0sOImBKLuzXKbLNbSXEr9ceZYIQ78A0bRnK4IxHku63p
         L1ZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794012267; x=1794617067; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9eiigW6hOkRbk1j+4tKF/Fi6rPLvkQU7Pgh902ZJH6g=;
        b=nOiLZodl15ocN+6iPF96n7YgQF16GvHtJCdXQpeUJ+at04+nc5dH5YSLMve7zunCNR
         ySvKXv/yTNJ/9IhuisdrAm5RXeLq9yGCKc7NLECfVd2bq1U+YFjONLwTsHJMM/Vx76AM
         /9J/fEnHkLMoBF54qQGcaub3pxzcWGNQm+hDwtl0syhIO1zDwDXoX4QI63NtWabBixMb
         gwn1yD+iwB/4y9RUkLUBI+YFkzrdo/CVm/VMdXwicheAWG88N4ZPVXzLrZlPr/tM9Bw/
         IVTu5LFLgYh1uEbsdyrFi5FA7gJkpmfWL9/TWxlX06RjuVl8a19PwWiLWkGo4cXBbr+b
         89dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794012267; x=1794617067;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9eiigW6hOkRbk1j+4tKF/Fi6rPLvkQU7Pgh902ZJH6g=;
        b=Ckg8Msj+GUVn4/MGkB88GNNjchv1j+3SQtTk82I4aAArtuEsjCnbfno6yNhEh19qsI
         Pes030JKeZd+UJkQt9d6h2+pc+k54W7HLJVwdEVqFmMCfSAbobc4ygmNA5dYxUagubQL
         FGi70542DKfXMzeF/HAQ/mY5XxhxTWyyOG0+VykyQmsPJ1wFsOBugpzFn+wULwMBSwIn
         6w9iTQpqFk4EzWJlmfj2ldEnPQa3ZdOAfF5VZyT5Vz16eYRGXhnHUX0UkQqlh1CuCgHa
         72MxDBpGxKCFBKV4wVKrYHtF155K0eyRoDXiytB6CSV9ndtwgVtWpWmQCOzlvKRW74XF
         SKmw==
X-Forwarded-Encrypted: i=1; AL+hErH6+JxkbwnKt7jxbPInE0zOc/e+uxDC3X4DH2WZDrpEMZ0QFvgFeVFeY6qFt+/8dTiXARcBPJ5XBFT4Mb4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8T3DY/vb2s2N/3kyKzRAkvg9IrB1AregQrLKbBZ58DKWo7beVQ
	KFPgckNZCQ8TJPw3T0L49ZujizB7ozegt5VDaDk7nEE30KRVaG4Vsbthj7bYA5tWO/Tk1qy4Rx5
	hK1lRcFt26Fqb1BEFN6hAERaqYAzl2E0=
X-Gm-Gg: AYBFou3IYTAYGQcNOxu/KeMv3yQR2KCxtmG9q6ycPdCHvOb0P8cudZrUczECt23qq56
	SoX92nlqS3A+1eG2ZxF39yPO4B4ut4JNFfEgbn+v+ILGKmRTFo9yHAdyJJJLGH13pPhK3n707g9
	p7ItVGFXZlIwbo/c9glWgPvNlaYFclYLODy0fdUXXMuDaSZItMoyoqBFzgha8TBSx38xeYRGBGa
	DZxpisRAwA+4AFgHCKwvdzYB4HfCoEjJ+oqjhnVHW7epknUUdgorCMiPpZ+y3RuIouDus+WW+8/
	oB26foUz1zFTEpcqaBbpl+dSpYPuFcBYQikZvv+FdTcwtXCDW72+tNq1Cv2oYMjToaxmUIF0Ni+
	+xhF7zMPIz76fr1sT8k9cQamDOXGS+SiWQrPtJ6JjOeFgTc5CpGZkpdeztFML/cDo9mnLuM4GsF
	PkINVq8Q+NIAYhoOSANhogN1Xp5Rr+2cnFrMLiWrkq5qUpwrdDu+Bm5VYOdzr+ciU+4x7eSzeq1
	O0eUvOocQ==
X-Received: by 2002:a05:690c:e184:20b0:8b3:310:244a with SMTP id
 00721157ae682-8b3566382bemr2930967b3.9.1794012266766; Fri, 06 Nov 2026
 16:44:26 -0800 (PST)
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
 <b660d79f-887e-4594-ba76-c45dc5f75435@linux.microsoft.com> <CAE5sdEhozq5SVj-SJLndiaANx1N_sTiAMBD0zeA_aafUYAGOKw@mail.gmail.com>
In-Reply-To: <CAE5sdEhozq5SVj-SJLndiaANx1N_sTiAMBD0zeA_aafUYAGOKw@mail.gmail.com>
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Date: Fri, 6 Nov 2026 16:44:16 -0800
X-Gm-Features: AclHuK9IwxmZ3zJg_UWR4NgkA_z56Ff8mEcKQ6deQjlglJnLrk3UFQi4VN7saZA
Message-ID: <CAE5sdEi9iOwEmuhzWZ=O5u30UVCbCerckhggBqEY9qU5jBce4A@mail.gmail.com>
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

On Fri, 6 Nov 2026 at 08:30, Siddharth Chintamaneni
<sidchintamaneni@gmail.com> wrote:
>
> On Thu, 5 Nov 2026 at 13:27, Jarred White
> <jarredwhite@linux.microsoft.com> wrote:
> >
> > > [You don't often get email from sidchintamaneni@gmail.com. Learn why
> > > this is important at https://aka.ms/LearnAboutSenderIdentification
> > > <https://aka.ms/LearnAboutSenderIdentification> ]
> > >
> > > Add the MSFT0006 ACPI ID for the DesignWare I2C controller integrated
> > > on Microsoft Cobalt SoCs, along with its 300 MHz input clock description
> > > in acpi_apd.c.
> > >
> > > Without an explicit MSFT0006 entry, ACPI device matching falls back to
> > > its _CID (APMC0D0F), which configures a 100 MHz input clock instead of
> > > the controller's actual 300 MHz clock.
> > >
> > > Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
> >
> > Acked-by: Jarred White <jarredwhite@linux.microsoft.com>
> >
>
> Thanks!
> Do I have to respin the patch?
>
> > > ---
> >  > Cc: Jarred White <jarredwhite@linux.microsoft.com>
> >  > Cc: Jeff Kirsher <jeff.kirsher@microsoft.com>
> >  >
> > >   drivers/acpi/acpi_apd.c                     | 6 ++++++
> > >   drivers/i2c/busses/i2c-designware-platdrv.c | 1 +
> > >   2 files changed, 7 insertions(+)
> > >
> > > diff --git a/drivers/acpi/acpi_apd.c b/drivers/acpi/acpi_apd.c
> > > index 9fc667d6776c8..a1baa056931c4 100644
> > > --- a/drivers/acpi/acpi_apd.c
> > > +++ b/drivers/acpi/acpi_apd.c
> > > @@ -198,6 +198,11 @@ static const struct apd_device_desc hjmc_i2c_desc = {
> > >          .fixed_clk_rate = 200 * HZ_PER_MHZ,
> > >   };
> > >
> > > +static const struct apd_device_desc msft_i2c_desc = {
> > > +       .setup = acpi_apd_setup,
> > > +       .fixed_clk_rate = 300 * HZ_PER_MHZ,
> > > +};
> > > +
> > >   #endif /* CONFIG_ARM64 */
> > >
> > >   #endif
> > > @@ -272,6 +277,7 @@ static const struct acpi_device_id
> > > acpi_apd_device_ids[] = {
> > >          { "HJMC3001", APD_ADDR(hjmc_i2c_desc) },
> > >          { "LECA0002", APD_ADDR(leca_spi_desc) },
> > >          { "LECA0003", APD_ADDR(leca_i2c_desc) },
> > > +       { "MSFT0006", APD_ADDR(msft_i2c_desc) },
> > >          { "NXP0001", APD_ADDR(nxp_i2c_desc) },
> > >   #endif
> > >          { }
> > > diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/
> > > busses/i2c-designware-platdrv.c
> > > index 1da6b0314b6a0..f359d38cc63c7 100644
> > > --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> > > +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> > > @@ -280,6 +280,7 @@ static const struct acpi_device_id
> > > dw_i2c_acpi_match[] = {
> > >          { .id = "INT3433" },
> > >          { .id = "INTC10EF" },
> > >          { .id = "LECA0003" },
> > > +       { .id = "MSFT0006" },
> > >          { }
> > >   };
> > >   MODULE_DEVICE_TABLE(acpi, dw_i2c_acpi_match);
> > > --
> > > 2.45.4
> > >
> >

Andy,

For Cobalt, the firmware exposes the designware input clock frequency
through the ACPI HCLK object.
Is there an existing way to retrieve or configure this clock frequency
through the ACPI tables, rather than hardcoding it in the driver?
Although the frequency is currently constant, it could change in
future hardware revisions that use the same ACPI HID. Would it make
sense to retrieve the frequency from firmware instead of relying on a
fixed value?

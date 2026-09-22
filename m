Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3A6535FC7
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790074514; cv=none; b=ojN9Nvz1i2DbT/FDKlClDNVJdwmWkywYWZQGvyWVz+WaFDrw5We+Txk6yx56ogoJE9etjuIzAJmUQJ1LcnTiUTPeTj/i52AbDb4ez8SVNhjre2TAl2WW8wh+4OxhdTNLMyCzlZcdcGNmYCH8rmhnxeWWjJgGuoTWovofchSK/7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790074514; c=relaxed/simple;
	bh=FJ1s9+IWST7wzuvMM2nR3FjXUniYpzyF+HfM2q13NXY=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=iBiq0toLB4JXAL31S6FEyTm+FDY48dkcmmpnN9xcUZOo/hSocCgysNRq7HsNmRTH5NWk2n6TAfdwA2VXBnZ9ZoL4/OihTsI2AUWDfPBDdy9Rtqevbql5DJ7Su00aYG1yUeY/h1fzyp0v1E80DTWVMsHTgWZ25s4shcdOV0RzyLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nzGu4fmX; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nzGu4fmX"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2d6ff3936easo4279735ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790074504; x=1790679304; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Qvfi21S6/W+JGJPKauvye3VyzMgsaM4FPWg0czrYd1M=;
        b=nzGu4fmX/1Zbsl+RiK5F0fabBnFs83C23MXYNYRjbrKN2TIBimQxVrV0hd4DGnUZD8
         oyzXCO1F+f6o8zixMrEMzEudB+WXia8ooVXn1AwZxi7kIo6h/3auQsrojyX9i43qP1hH
         fxMqrgoDCLz6InpPf/YeQp56EHFVqq/OnDY25ldBSdpR80pEfQ2upNXpfCY9RF/OmH/W
         yWlZGKlZ3JFfuz52NfvUcCmtpqNHC4H8rESrEtP37MMFPPwxL3EG0eo8yJgIt4HvPOOM
         CB0pZeXQqE+pUKtRPNo26oK5FgXIMc1yvimSVxyiNabYeDiv4RGPxGm2Vq4vsPmNAF/w
         K6ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790074504; x=1790679304;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qvfi21S6/W+JGJPKauvye3VyzMgsaM4FPWg0czrYd1M=;
        b=e80ezHiE/GNP07NK6iHDpw42PIOu8SxZQ98AF2E5D9/2/3WUwH26Gm2VCbT8qqhHSM
         HKKZws+n0rKoADuAnpWQtma99+937kbLPF8dOYRU6O82EERQ3sH2FfUtXV8NqT0eGDOS
         xAB/xvfA2/sN2o65Lwbyws/B+d1ihzgsY7ayUYFAgZzhKPZTPCqfPhxKREoB7O4K7plv
         NSD2R6DKEIF4+w0lU76HgeIA7ALYuVbMQnEfBbQIMZZ38/y68JWIIYgsb/a8wdvcaXHE
         CvCdGddemUHByYCwr+vcWdcCJS/mSq+oeZHvW8vxwjvmG+gslFN3jMGULokKzov5pYIR
         TfPA==
X-Forwarded-Encrypted: i=1; AKwUvByVhJDvb96tj1Bfm2v/u5EoubB6t6KNeAwqZUvOnQYV9bTr95O4RfPElgp62rpkRgl3c/ReDE+0PFcNpE4=@vger.kernel.org
X-Gm-Message-State: AFuF++kfCRc2j+Eak7zp8V3XxsZIq3WEgOZV67DUdPxPKPZxCOo/iL6u
	K3M7U+2hxaM9AWOB7/tYM9AHrWVackZoT4czIj6AwiT0qZbuFeMCFM9L
X-Gm-Gg: AYBFou19mypziACliIHlIdFyehp+eR/SI1Cdp5VUGgSC/0s7X9bu1Jq+LMeIo7IKM7p
	USItwIihYYIWhxqVSTDThNvDRwu6SSJJNrJUV4u/5jBux9KThn2m4B76yfejPF2/jXnPfdglPcw
	ozBX1tPsYrUNEmoXCBLJdWlkozAtfJWKmWA9MTKa2hyLq5UOrwVcPgOe4gkMFME2kH+z2Kb10EM
	u89wsABX1s3HIQBzo+A2efoc51oTz5SKVHZQBo00LDLc+Bi1KXpU0OuywzWx7kI3Le9HDiqWcLN
	gMtZi0bIaVEEbLNgjO1vnJCHXnvagQ9dNKvNe7M/pb91yqnKgZC0UgB7Bsb0RHgZtLq1UlduF1g
	PrvQU2aM6svcvMXf5bQ4iLKfR/vLwSPFTSJG25ipXeAbF/ZnZ826oz+bsCjNadLIeEww57G/g11
	JOlIf5Zb6/SZjntKifp2jSRawah4laoCyyFP9rcTHrQjyGTzaxa6JY54QsUtiNAhGbUJiIMZQ3F
	b1F45RpbC6hluuoFSAs
X-Received: by 2002:a17:903:1a24:b0:2cc:f4d4:29a0 with SMTP id d9443c01a7336-2df60bc66e2mr12441705ad.3.1790074504347;
        Tue, 22 Sep 2026 03:55:04 -0700 (PDT)
Received: from smtpclient.apple ([23.247.139.92])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5d019a69sm7754535ad.15.2026.09.22.03.54.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Sep 2026 03:55:03 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.8\))
Subject: Re: [PATCH RFC v9 0/8] mfd: ls2kbmc: multiple fixes for this driver
From: Miao Wang <shankerwangmiao@gmail.com>
In-Reply-To: <52183cd9-4b43-456d-896d-ee2fea6d5d72@loongson.cn>
Date: Tue, 22 Sep 2026 18:54:45 +0800
Cc: Chong Qiao <qiaochong@loongson.cn>,
 Lee Jones <lee@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Corey Minyard <corey@minyard.net>,
 Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Xi Ruoyao <xry111@xry111.site>,
 WANG Xuerui <kernel@xen0n.name>,
 Yinbo Zhu <zhuyinbo@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 mfd@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net,
 Corey Minyard <cminyard@mvista.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <F6B4A7C7-066E-405B-B6B0-B27D29B4BEFB@gmail.com>
References: <20260811-ls2kbmc-mod-v9-0-4fa9a5584406@gmail.com>
 <52183cd9-4b43-456d-896d-ee2fea6d5d72@loongson.cn>
To: Binbin Zhou <zhoubinbin@loongson.cn>
X-Mailer: Apple Mail (2.3826.700.81.1.8)

Hi,

> 2026=E5=B9=B49=E6=9C=8822=E6=97=A5 17:55=EF=BC=8CBinbin Zhou =
<zhoubinbin@loongson.cn> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> Hi:
>=20
> On 2026/8/11 16:07, Miao Wang via B4 Relay wrote:
>> Previously, the driver has been introduced to support the Loongson 2K
>> BMC running on the Loongson Servers, which is essential to prevent
>> the system from hanging when the BMC is being reset and the default
>> efi-framebuffer is being used. However, there are some drawbacks in =
the
>> driver.
>> Firstly, the driver tries to read and write to the connected PCI-E =
host
>> controller registers, assuming that the BMC is connected to LS7A =
PCI-E
>> host controller. This assumption should be true for real products, =
but
>> to prevent from accidentally reading and writing to the wrong PCI-E =
host
>> controller, this driver should be modified to check this before
>> accessing the registers.
>> Secondly, the driver uses non-exported functions to tell the vt
>> subsystem to redraw the screen, preventing the driver from being
>> compiling as a module. This can be fixed by using the exported
>> functions instead.
>> Thirdly, the driver directly accesses the GPIO controller registers
>> using hard-coded addresses, which might conflict with the loaded GPIO
>> controller driver for the same GPIO controller. This is fixed in this
>> series by using the GPIO subsystem APIs instead. To associate a GPIO =
pin
>> with a certian PCI device, it should be declared in the firmware =
level,
>> i.e. in the ACPI table or the device tree, and thus the firmware
>> interface should be discussed and coordinated with Loongson =
personnels.
>> Despite of this, the proposed solution in this series should be the
>> minimum necessary change to express such association. Furthermore, =
the
>> conventional GPIO pin number and the controller address are also
>> provided, to be used as a fallback when the GPIO pin is not declared.
>> Finally, there is a minor issue in the driver where it changes the
>> mode string describing the screen resolution during probing, which
>> prevents the device from being probed again if -EPROBE_DEFER is
>> returned by the probe function.
>> I have tested the changes in this series on a single-socket Loongson
>> 3C6000 server with a Loongson 2K BMC, and the driver works as =
expected
>> when the corresponding GPIO driver is additionally loaded.
>> Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>
>> ---
>> Changes in v9:
>> - Extend the kernel docs for gpio_device_get_fwnode() to describe the
>>   usage of this function, as suggested by Bartosz.
>> - Link to v8: =
https://lore.kernel.org/r/20260810-ls2kbmc-mod-v8-0-16e44f7322f4@gmail.com=

>=20
> I=E2=80=99m deeply sorry for the delayed response due to personal =
reasons.
>=20
> Regarding Patch-1, I don=E2=80=99t mind using your current version as =
is=E2=80=94it=E2=80=99s more complete. However, I received another email =
from lkp[1] a few days ago, and I still hope this patch can be merged =
sooner.
>=20
> The current discussion is focused on the GPIO-related patch, but in =
reality, it isn=E2=80=99t closely tied to the other patches; it=E2=80=99s =
more of an optimization. If possible, I personally think we could set it =
aside for now and treat it as a separate set of feature optimization =
patches.
>=20
> [1]: https://lore.kernel.org/all/202608230816.ifMzE0No-lkp@intel.com/

I'm not opposed to separating the first patch from the other patches.
But it seems that Bartosz has not been back ready for reviewing this
series.

Cheers,

Miao Wang



Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E595947ED;
	Tue,  8 Sep 2026 18:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788891339; cv=none; b=THGwvex2A7caT5NkAQStjsnDMmuxCdleDIy4IR0YRpiMh2iwTN0huR1pk21+3X+ieRPMGTtugRzw0aJwGsrurTcxxFKET7VRt//wFMcz82kxxyuXTFvJuLC+R796XnzvOt41z0R1YzRGpZMIyBtCX0TjDJ6IzLe8Y42bL49PB8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788891339; c=relaxed/simple;
	bh=FYPJ2aK/840ENRoGtNoVMYrOJWaWbFE7mbVsjwGk/uI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H2DrI8qr03xl/VAnYwR6qZb8GnfJJd1UXA7tS3dgxfPS80FXjFf8dlgd4/QtPHGroNMw+kUX0ETC/ZGrY9xf0+D8e+FT+7FsHNHcmXbTI+UU3JENFygiW/mukX75YVBYX3dGIM1N9+JZ2ABWgP9cy8X4XxHdzzdSo+hAbL1r2cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=causl8Ez; arc=none smtp.client-ip=212.227.126.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="causl8Ez"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1788891328; x=1789496128;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=KoNSdCBiIKc9Rd10HfpMdWa548blhxhVgyypY+mx6Rs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=causl8EzHsao7pxbiiuY3bxaKT7IwLK5zyIuBTP1JepO0nhgMh6r9E8vFdb2i6aE
	 iJqpUtNBUeveKpK2UKHdjKeDDbEywcEP8uOxHHzz56dFjbrxY5B1XZ9tB4sKBMW0V
	 JT0NoMB7MLrKpoe3rek6Az7B0ZlRiEEVx5D7uXW0cOm8kdyWgW0UzsD+jZk/GL6s4
	 S7ckb09aLQ3VgCgzyXAcwHfram6SkjwKiLb/gG8YXGSggw1D2mXBGRAhvd0aliSSy
	 GR5z6llCdPA/FUPsX7MRrUEBljXCJf3iXdxg2EhGbr4RrCGJ3H8QiHPH2ir4lMVFG
	 KoeTprZ/IiVYzDqN0g==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1Mae7u-1wXhk21NLW-00aOJ8; Tue, 08
 Sep 2026 20:15:28 +0200
Message-ID: <6eaa70f3-4d76-4271-b12d-75e063c9f869@oldschoolsolutions.biz>
Date: Tue, 8 Sep 2026 20:15:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] arm64: dts: qcom: IdeaCentre Mini 01Q8X10 Hamoa +
 Purwa
To: Mostafa Saleh <smostafa@google.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260905-x1-ideacentre-mini-prettify-v1-0-9a87882973bb@oldschoolsolutions.biz>
 <ap_PdUrwLIVGJ3oG@google.com>
 <dcae935c-ccbb-4cb5-a184-eb5dc2cc84b8@oldschoolsolutions.biz>
 <ap_qwdz-3WibXRjq@google.com>
 <364326dc-9715-4e77-bf25-4d0a30179826@oldschoolsolutions.biz>
 <ap_69OsnAOwQyo50@google.com>
 <9762659c-fbde-4887-8da8-200db7dfad09@oldschoolsolutions.biz>
 <aqBKI0Fg3ZqYPOJh@google.com>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <aqBKI0Fg3ZqYPOJh@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Ssgth1JGt5ddf9jII/qZG7NJQlzOzLbayjf66aXoxSmfzOEPhHk
 v5AUlKbxT8Errzv3uNpBQ59VwGS/FnyxrLGRZQ90ejqvOVy5cIr/APMX5h9yPfGTijs8ofI
 4EPjsrdxBBkQwhi9grQ0J31dNfzxGuF+NFmpuMbaDUID5vNU66P2btlmucwDY1Shld8Lo3a
 lvK3S0ZNTI4JYiW5Pa29g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wymb6s2tdRA=;9CEUH6FGVB/czx0rbSKAh7ZJbh9
 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

Hi Mostafa,

On 08.09.26 19:47, Mostafa Saleh wrote:
> On Tue, Sep 08, 2026 at 05:04:44PM +0200, Jens Glathe wrote:
>> Hi Mostafa,
>>
>> This is my .config [1].
>>
>> [1]: https://pastebin.com/QhDizqCB
> Thanks! I tested with your config plus
> - CONFIG_EFI_ARMSTUB_DTB_LOADER=3Dy otherwise I can't load my device
>    tree from UEFI shell
> - CONFIG_SERIAL_QCOM_GENI=3Dy, otherwise I can't see the console.
>
> Booting in EL2 is similar to before with SMMUv2 errors.

For that you would need the patch as listed before: [2]

[2]: https://github.com/jglathe/linux_ms_dev_kit/tree/b4/x1-el2-unfuck

This should give you boot on EL2.

> Booting in EL1 hangs with timeouts and missing suppliers:
> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x512f0011]
> [    0.000000] Linux version 7.3.0-rc1-next-20260904+ (smostafa@mostafa1=
.c.googlers.com) (Debian clang version 21.1.8 (3), Debian LLD 21.1.8) #2 S=
MP PREEMPT_DYNAMIC Tu6
> [    0.000000] KASLR enabled
> [    0.000000] Machine model: Lenovo IdeaCentre Mini 01Q8X10 (Purwa)
> [    0.000000] earlycon: qcom_geni0 MMIO:0x0000000000894000 (options '')
> [    0.000000] printk: legacy bootconsole [qcom_geni0] enabled
> [    0.000000] CPU features: SYS_ID_AA64MMFR0_EL1[63:60]: forced to 1
> [    0.000000] ITS@0x0000000017040000: Devices Table too large, reduce i=
ds 32->19
> [    0.000000] ITS@0x0000000017040000: Devices too large, reduce ITS pag=
es 1024->256
> [    0.163152] qcom-pcie 1c00000.pcie: supply vdda not found, using dumm=
y regulator
> [    0.163313] qcom-pcie 1c08000.pcie: supply vdda not found, using dumm=
y regulator
> [    0.168334] clk: Not disabling unused clocks
> [    0.168336] PM: genpd: Not disabling unused power domains
> [    0.170770] qcom-pcie 1c00000.pcie: supply vddpe-3v3 not found, using=
 dummy regulator
> [    0.178347] qcom-pcie 1c08000.pcie: supply vddpe-3v3 not found, using=
 dummy regulator
> [    0.184718] qcom-pcie 1c00000.pcie: supply vdda not found, using dumm=
y regulator
> [    0.211932] Warning: unable to open an initial console.
> [    0.212057] qcom-pcie 1c00000.pcie: supply vddpe-3v3 not found, using=
 dummy regulator
> [    0.213907] qcom-pcie 1c08000.pcie: supply vdda not found, using dumm=
y regulator
> [    0.213928] qcom-pcie 1c08000.pcie: supply vddpe-3v3 not found, using=
 dummy regulator
> [    0.244210] qcom-pcie 1c08000.pcie: supply vdda not found, using dumm=
y regulator
> [    0.244275] qcom-pcie 1c00000.pcie: supply vdda not found, using dumm=
y regulator
> [    0.251833] qcom-pcie 1c08000.pcie: supply vddpe-3v3 not found, using=
 dummy regulator
> [    0.259418] qcom-pcie 1c00000.pcie: supply vddpe-3v3 not found, using=
 dummy regulator
> [   10.213618] qcom-pcie 1bf8000.pcie: supply vdda not found, using dumm=
y regulator
> [   10.214873] arm-smmu 3da0000.iommu: deferred probe timeout, ignoring =
dependency
> [   10.228713] arm-smmu 3da0000.iommu: probe with driver arm-smmu failed=
 with error -110

Since you don't load firmwares, maybe try these? However, I was able to=20
boot and install with the Ubuntu Resolute ISO by providing the dtb,=20
without the firmwares. Odd.

> I believe we are testing on different SoCs from your fastfetch:
> CPU: Qualcomm Snapdragon X Elite 1E80100 (8) @ 2.96 GHz
>
> While mine:
> CPU: Qualcomm Snapdragon X Elite 1P42100 (8) @ 2.96 GHz
>
> I enabled CONFIG_QCOM_SOCINFO which shows:
> [root@alarm ~]# cat /sys/devices/soc0/soc_id
> 635 # which does not exist in qcom,ids.h
> [root@alarm ~]# cat /sys/devices/soc0/revision
> 1.0
Looks like nope:

root@mini-x-jg:~# cat /sys/devices/soc0/soc_id
635
root@mini-x-jg:~# cat /sys/devices/soc0/revision
1.0

We have the same SoC, maybe different binning. You could try to boot up=20
with the extended Resolute ISO to boot without firmwares [3]. It=20
contains the same dtb.

[3]:=20
https://drive.google.com/drive/folders/1sc_CpqOMTJNljfvRyLG-xdwB0yduje_O

with best regards

Jens


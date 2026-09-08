Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DCF525A60;
	Tue,  8 Sep 2026 12:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788868866; cv=none; b=JVu7ZGs+Cc21qK3kzisPOvuycvbUCApCSGyA9Lit87Ws9I5WsNSCmLKrqr5IganQUBzq3dzSHZw/3T5jZKjF399BpDDpwR+6MFv30eJY2p9HF1ii7Xhdd8iUCEY5JRMCOLiFiOLV97jl9sZ9nHKAg7RDL5Y/N1ikK+oJXX9Asn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788868866; c=relaxed/simple;
	bh=1mkcWQzoVLGK6uPRzb3CVyOZEnybhEW6Q5Yag/6iL9k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Py2VMGns9KsvYzgc1skpiIdqt1NulgUYGtP4dKukxq90HO7ryxlAv98qCJlEk/SbCorrOd/PBk0fgXQkBNZEAVIk32A0k2i6AotWQUBMFIPXF2rblU8/xGDbLTOm5aPqiFU1+sFrnhjsseHcL8dq76QYqkRBOvV8ydogCo4N9kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=fxupCXD8; arc=none smtp.client-ip=212.227.17.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="fxupCXD8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1788868846; x=1789473646;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=/15S6hqZSZBEDx9ytioB89/4yNoLcxJ7brF+T/ZWU4k=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=fxupCXD8VD0qi6vBPKLIm6t3ZjDVBtRHRLYsNq5dr3V9zH6UsSXiFbZAJJSz5AiB
	 YxfvNId8T1TQgo8ftDuNHZsWv5vB9U6fKvVNACO3c1AYHy3fTl9pfZoTSdS+D92Hq
	 7PfzYvNlRcq7tnhsgJBndtJyQN82/EJG1VWHJDsPQuuU7T3w0yFYcAZkY4/xa2w16
	 6lZSJwkBxhxF9IYTrr4HE7q6POKCeNMct40n08ATEoTgi1IuEqAL892fNTiK6HRPL
	 JSm+EkvTZH1oJ5eZJiKcv2sMpDvYc0sF47Jixm/wyf+GFKs66r/8AKEd96FFw+9xT
	 P4ekl7pzbnx3ZzCAmA==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Miqvq-1wP3ub3kf6-00igSg; Tue, 08
 Sep 2026 14:00:46 +0200
Message-ID: <364326dc-9715-4e77-bf25-4d0a30179826@oldschoolsolutions.biz>
Date: Tue, 8 Sep 2026 14:00:45 +0200
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
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <ap_qwdz-3WibXRjq@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:gtYJPBBflX5UfLSDGgbz4XJ2E/xT1072RfgTMSsPtRYkp/HMY0D
 IprPtExdF3rerBNYPnPF7buQUZLYDAucxztMUXSz7mbldIpmsTB54p7WI6z6mYmGXgDGW13
 WGD5jOw6gNF54zSJvpoKA9D/YhijiJzPv2mmnFKUApvk6ZbnYBeHvB8pMEecWxinyfYDb7q
 FmUKc1e6kNYIyaEufWqeg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:BBnhA4EYuMY=;QoQ3IDLADP+fua+4Ztn/JG4WgMQ
 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

Hi Mostafa,

On 9/8/26 13:00, Mostafa Saleh wrote:
> On Tue, Sep 08, 2026 at 11:39:54AM +0200, Jens Glathe wrote:
>> No dependencies. But I test if i can apply to torvalds/master
> I can't apply it on Linus's tree so I used your next tag + (revert
> for the QoS broken patch I mentioned)
>
> The patches doesn't build, I added this for now:
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qco=
m/Makefile
> index 0cfbf3018a7b..d282ce5635d8 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -173,7 +173,6 @@ dtb-$(CONFIG_ARCH_QCOM)     +=3D purwa-iot-evk.dtb
>   purwa-lenovo-ideacentre-mini-01q8x10-el2-dtbs :=3D purwa-lenovo-ideace=
ntre-mini-01q8x10.dtb x1-el2.dtbo
>   dtb-$(CONFIG_ARCH_QCOM)        +=3D purwa-lenovo-ideacentre-mini-01q8x=
10.dtb purwa-lenovo-ideacentre-mini-01q8x10-el2.dtb
>
> -dtb-$(CONFIG_ARCH_QCOM)        +=3D purwa-iot-evk-el2.dtb
>   dtb-$(CONFIG_ARCH_QCOM)        +=3D qcm6490-fairphone-fp5.dtb
>   dtb-$(CONFIG_ARCH_QCOM)        +=3D qcm6490-idp.dtb
>   dtb-$(CONFIG_ARCH_QCOM)        +=3D qcm6490-particle-tachyon.dtb

Yes that's true. Will be fixed in V2.

> I can't boot in EL2 (with purwa-lenovo-ideacentre-mini-01q8x10-el2.dtb):
> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x512f0011]
> [    0.000000] Linux version 7.3.0-rc1-next-20260904-g505bc4a244a7-dirty=
 (smostafa@mostafa1.c.googlers.com) (Debian clang version 21.1.8 (3), Debi=
an LLD 21.1.8) #2 SMP
> PREEMPT Tue Sep  8 10:10:35 UTC 2026
> [    0.000000] KASLR enabled
> [    0.000000] Machine model: Lenovo IdeaCentre Mini 01Q8X10 (Purwa)
> [    0.000000] earlycon: qcom_geni0 MMIO:0x0000000000894000 (options '')
> [    0.000000] printk: legacy bootconsole [qcom_geni0] enabled
> [    0.000000] CPU features: SYS_ID_AA64MMFR0_EL1[63:60]: forced to 1
> [    0.000000] arch_timer: [Firmware Bug]: VHE-capable CPU without EL2 v=
irtual timer interrupt
> [    0.191075] qcom_scm firmware:scm: qseecom: scm call failed with erro=
r -22
> [    0.198139] qcom_qseecom qcom_qseecom: probe with driver qcom_qseecom=
 failed with error -22
> [    0.227426] arm-smmu 15000000.iommu: Unhandled context fault: fsr=3D0=
x402, iova=3D0x86cd79c0, fsynr=3D0x400010, cbfrsynra=3D0x1000, cb=3D4
> [    0.291862] arm-smmu 15000000.iommu: FSR    =3D 00000402 [Format=3D2 =
TF], SID=3D0x1000
> [    0.299508] arm-smmu 15000000.iommu: FSYNR0 =3D 00400010 [S1CBNDX=3D6=
4 WNR PLVL=3D0]
> [    0.307018] arm-smmu 15000000.iommu: Unhandled context fault: fsr=3D0=
x402, iova=3D0x86b020c0, fsynr=3D0x400040, cbfrsynra=3D0x1000, cb=3D4
> [    0.318879] arm-smmu 15000000.iommu: FSR    =3D 00000402 [Format=3D2 =
TF], SID=3D0x1000
> [    0.326462] arm-smmu 15000000.iommu: FSYNR0 =3D 00400040 [S1CBNDX=3D6=
4 IND PLVL=3D0]
> [    0.333884] arm-smmu 15000000.iommu: Unhandled context fault: fsr=3D0=
x402, iova=3D0x86b020c0, fsynr=3D0x400040, cbfrsynra=3D0x1000, cb=3D4
> [a lot more of SMMU errors]

Well that's true, too. I prepared but never sent a patch for the EL2 PAS=
=20
use case.

https://github.com/jglathe/linux_ms_dev_kit/tree/b4/x1-el2-unfuck

My mini-x is up on EL2, too.

> And with in EL1 (with purwa-lenovo-ideacentre-mini-01q8x10.dtb)
> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x512f0011]
> [    0.000000] Linux version 7.3.0-rc1-next-20260904-g505bc4a244a7-dirty=
 (smostafa@mostafa1.c.googlers.com) (Debian clang version 21.1.8 (3), Debi=
an LLD 21.1.8) #2 SMP
> PREEMPT Tue Sep  8 10:10:35 UTC 2026
> [    0.000000] KASLR enabled
> [    0.000000] Machine model: Lenovo IdeaCentre Mini 01Q8X10 (Purwa)
> [    0.000000] earlycon: qcom_geni0 MMIO:0x0000000000894000 (options '')
> [    0.000000] printk: legacy bootconsole [qcom_geni0] enabled
> [    0.000000] CPU features: SYS_ID_AA64MMFR0_EL1[63:60]: forced to 1
> [    0.000000] ITS@0x0000000017040000: Devices Table too large, reduce i=
ds 32->19
> [    0.000000] ITS@0x0000000017040000: Devices too large, reduce ITS pag=
es 1024->256
> [    0.223762] remoteproc remoteproc0: Direct firmware load for qcom/x1p=
42100/LENOVO/91B6/qcadsp8380.mbn failed with error -2
> [    0.235468] remoteproc remoteproc0: Direct firmware load for qcom/x1p=
42100/LENOVO/91B6/qcadsp8380.mbn failed with error -2
> [    0.246800] remoteproc remoteproc0: request_firmware failed: -2
> [    0.252897] remoteproc remoteproc1: Direct firmware load for qcom/x1p=
42100/LENOVO/91B6/qccdsp8380.mbn failed with error -2
> [    0.261226] qcom-pcie 1bf8000.pcie: supply vdda not found, using dumm=
y regulator
> [    0.261707] qcom-pcie 1c00000.pcie: supply vdda not found, using dumm=
y regulator
> [    0.261729] qcom-pcie 1c00000.pcie: supply vddpe-3v3 not found, using=
 dummy regulator
> [    0.261871] qcom-pcie 1c08000.pcie: supply vdda not found, using dumm=
y regulator
> [    0.261889] qcom-pcie 1c08000.pcie: supply vddpe-3v3 not found, using=
 dummy regulator
> [    0.279415] remoteproc remoteproc1: Direct firmware load for qcom/x1p=
42100/LENOVO/91B6/qccdsp8380.mbn failed with error -2
> [    0.295042] remoteproc remoteproc1: request_firmware failed: -2
> [    0.332189] qcom_pmic_glink pmic-glink: Failed to create device link =
(0x180) with supplier a600000.usb for /pmic-glink/connector@0
> [    0.346753] qcom-pcie 1c08000.pcie: supply vdda not found, using dumm=
y regulator
> [    0.349142] ------------[ cut here ]------------
> [    0.354378] qcom-pcie 1c08000.pcie: supply vddpe-3v3 not found, using=
 dummy regulator
> [    0.359106] disp_cc_mdss_dptx1_link_clk_src: rcg didn't update its co=
nfiguration.
> [    0.367176] WARNING: drivers/clk/qcom/clk-rcg2.c:136 at update_config=
+0xd4/0xe8, CPU#2: kworker/u33:0/56
> [    0.384583] Modules linked in:
> [    0.387723] CPU: 2 UID: 0 PID: 56 Comm: kworker/u33:0 Not tainted 7.3=
.0-rc1-next-20260904-g505bc4a244a7-dirty #2 PREEMPT
> [    0.398963] Hardware name: LENOVO 91B6CTO1WW/3796, BIOS O6NKT3BA 05/0=
2/2025
> [    0.406111] Workqueue: events_unbound deferred_probe_work_func
> [    0.412095] pstate: 61400005 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTY=
PE=3D--)
> [    0.419240] pc : update_config+0xd4/0xe8
> [    0.423267] lr : update_config+0xd0/0xe8
> [    0.427295] sp : ffff80008027b980
> [    0.430703] x29: ffff80008027b990 x28: ffff000802f813c0 x27: ffffc157=
2aad6000
> [    0.438024] x26: ffffc1572a4df03f x25: ffffc1572a639ff6 x24: ffffc157=
2a61b412
> [    0.438026] x23: 0000000000000000 x22: 0000000000000002 x21: 00000000=
00000001
> [    0.438028] x20: ffffc1572a4bb085 x19: ffffc1572acfc020 x18: 00000000=
00000000
> [    0.459979] x17: 0000000006af4b93 x16: 0000000000000094 x15: 00000000=
00100000
> [    0.467302] x14: 00000000000066a7 x13: 000000000199e0a9 x12: 00000000=
000000a5
> [    0.474624] x11: 00000000000000c0 x10: 0cf36ad3ab101c53 x9 : a7b4a80d=
3a726d00
> [    0.481946] x8 : a7b4a80d3a726d00 x7 : 0000000000000000 x6 : 00000000=
0000003f
> [    0.489268] x5 : 0000000000000040 x4 : 0000000000000000 x3 : 00000000=
00000001
> [    0.496588] x2 : 0000000000100000 x1 : ffff000800c8b000 x0 : 00000000=
fffffff0
> [    0.503913] Call trace:
> [    0.506433]  update_config+0xd4/0xe8 (P)
> [    0.510464]  clk_rcg2_set_parent+0x58/0x68
> [    0.514666]  __clk_set_parent+0x50/0x214
> [    0.518696]  clk_core_set_parent_nolock+0xe8/0x1b4
> [    0.523611]  clk_set_parent+0xa4/0x13c
> [    0.527458]  of_clk_set_defaults+0x2f0/0x644
> [    0.531847]  platform_probe+0x38/0x9c
> [Many more of those also]

This sounds odd. I have tested all three possible DP outs (just to make=20
sure, added a real DP cable to a display and have screen on 2 displays)=20
and it boots well here. No dptx_ errors. Although, with both displays in=
=20
(HDMI, DP) the box doesn't want to boot... like, even start the uefi=20
boot entry. But that's a different and non-Linux issue. Add a third=20
type-c display and it boots again and all three displays come up.

jglathe@mini-x-jg:~$ fastfetch
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0....=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 jglathe@mini-x-jg
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .',:clooo:=C2=A0 .:loooo=
o:.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-----------------
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.;looooooooc=C2=A0 .oooooooooo'=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OS: Ubuntu 26.04.1 LTS=20
(Resolute Raccoon) aarch64
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .;looooool:,''.=C2=A0 :ooooooooooc=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 Host: 91B6001CUK=20
(IdeaCentre Mini 01Q8X10)
 =C2=A0 =C2=A0 =C2=A0 =C2=A0;looool;.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0'oo=
oooooooo,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Kernel: Linux=20
7.1.12-jg-0-qcom-x1e
 =C2=A0 =C2=A0 =C2=A0 ;clool'=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0.cooooooc.=C2=A0 ,,=C2=A0 =C2=A0 =C2=A0 =C2=A0Uptime: 12 mins
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0...=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ......=C2=A0 .:oo,=C2=A0 =C2=A0 =C2=A0 Packages: 2198=
 (dpkg),=20
12 (snap)
 =C2=A0 .;clol:,.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .loooo'=C2=A0 =C2=A0 =C2=A0Shell: bash 5.3.9
 =C2=A0:ooooooooo,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 'ooool=C2=A0 =C2=A0 =C2=A0Display (LG Electron=
ics=20
23"): 1920x1080 in 23", 60 Hz [External] *
'ooooooooooo.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 loooo.=C2=A0 =C2=A0 Display (PL2792QN):=20
2560x1440 in 27", 60 Hz [External]
'ooooooooool=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0coooo.=C2=A0 =C2=A0 Display (Type-c):=20
3840x2160 @ 2x in 15", 60 Hz [External]
 =C2=A0,loooooooc.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .loooo.=C2=A0 =C2=A0 DE: GNOME 50.1
 =C2=A0 =C2=A0.,;;;'.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;ooooc=C2=A0 =C2=A0 =C2=A0WM: Mutte=
r (Wayland)
 =C2=A0 =C2=A0 =C2=A0 =C2=A0...=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0,ooool.=C2=A0 =C2=A0 =C2=
=A0WM Theme: Adwaita
 =C2=A0 =C2=A0 .cooooc.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ..=
',,'.=C2=A0 .cooo.=C2=A0 =C2=A0 =C2=A0 Theme: Adwaita [GTK2/3/4]
 =C2=A0 =C2=A0 =C2=A0 ;ooooo:.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;oo=
oooooc.=C2=A0 :l.=C2=A0 =C2=A0 =C2=A0 =C2=A0Icons: Yaru [GTK2/3/4]
 =C2=A0 =C2=A0 =C2=A0 =C2=A0.coooooc,..=C2=A0 =C2=A0 =C2=A0 coooooooooo.=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Font: Adwaita Sans=20
(11pt) [GTK2/3/4]
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.:ooooooolc:. .ooooooooooo'=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Cursor: Adwaita (24px)
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.':loooooo;=C2=A0 ,oooooooooc=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Terminal: /dev/pts/2
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0..';::c'=C2=A0 .;l=
oooo:'=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CPU: Qualcomm Snapdr=
agon=20
X Elite 1E80100 (8) @ 2.96 GHz
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0GPU: Qualcomm Adreno=20
X1-45 [Integrated]
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0Memory: 3.08 GiB / 30.72=20
GiB (10%)
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0Swap: 0 B / 8.00 GiB (0%)
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0Disk (/): 58.09 GiB /=20
255.62 GiB (23%) - ext4
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0Disk (/minipool): 128.00=20
KiB / 1.71 TiB (0%) - zfs
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0Local IP (br0):=20
192.168.0.58/24
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0Locale: en_US.UTF-8

> However, booting with the hacked device tree I am using [1]:
[...]
> [1] https://lore.kernel.org/all/20260429141815.827157-1-smostafa@google.=
com/
>
I briefly compared the device trees. Quite some differences :) I will go=
=20
to the ToT and see if mine boots up then.

with best regards

Jens



Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.206.16.166
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793622383;
	b=zC2hRjQNvftVHSmF57r036SngHbLOXGH2tDMV4na3ABqRXhsftsnWgJKhu3pW7JICVo3
	 wURkf3tv9cWOvwQaXuRO857kCEVgYlMxSmPgfK7EsYBcXE5OPuyXL9wf+eTpAFlsJSfnc
	 9EFeK9SCTuURaOij6qqSYYVD5cyFvi+CNJeWvxdGzWUEGt0/I/IGahTPqb6bhvlE+7PJ6
	 91Z8/ai3ayqyRMVC/q568ocMDkq+/ap5Do831S0sJDx8Ic3G4xbgzVsNdJgqQLmwTMIEw
	 96ZNcCyLTllnd91rAlxpvPwyoharSvHkpWyIHZVVa2IhoO/EeOnxZQDQurJ7oWOe9GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793622383;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:X-QQ-SENDSIZE:
	 Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=kYoEHv1yJWT5CYnv9W1t01akAHdAj5zwmImIgwGqYBU=;
	b=xruonbtZ8lCWAiP14uImJJVWVHEQkBTzz5qepOVvQM9QWRFh5u+SjG46aFV/S1Ek76+q
	 Y1859BgBGeqm/QCRYrvGq7MLVMM1uPdA5QfHBvOWtYsOOXUFlAyyK1z2UOGfCltB1Kh8J
	 uzWAa3W4YKLwjmE7FUWf7Q7GLmxK//fI8funPiIA0KRZ5tKQ+eMdjZ9btqUtA2zlWSTcB
	 0p9Zobtdy0ICJZH415fViKX6AXEm8sbmN+Zz8KhTjdqKcrqXMOgHdorWxoC9G4ze8efNv
	 txt3xky9VAMDRWqbTBbPb1rSb6lxMysF2yX3HcPORX4OBL41zGaNR2vwAcYNlBaiW5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=FjuC4ywp;
	arc=none smtp.remote-ip=54.206.16.166
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317D4606A785
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:26:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 317D4606A785
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=FjuC4ywp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793622370;
	bh=kYoEHv1yJWT5CYnv9W1t01akAHdAj5zwmImIgwGqYBU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To;
	b=FjuC4ywpgmDhy1DVijeU0zlWbRfHWZvmAxDzZDk0A9GiKemI8FT4u43vmPJf+zJiS
	 fQGYn7a7wZNd/46mESKNy8b8yVEmR554lXCcMWsJAr9MfsLU33zirii8+sRcKzo2oi
	 LTdgKvaybh+JhC8/AyKPKmcJwfZ1YI6EDNLg8akg=
X-QQ-mid: zesmtpgz8t1793622369t830130f8
X-QQ-Originating-IP: tP4k4YoUdrk1slphkEOZp1b+BtaCl0ncYDtGj7CVP4Y=
Received: from mail-pl1-f175.google.com ( [209.85.214.175])
	by bizesmtp.qq.com (ESMTP) with SMTP id 0
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 20:26:06 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13417748600079865591
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e987b4a710so21103625ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:26:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwtWKQ4L+SQ13sfTuRInjUoc8IFXkOt3PymlB9r9FMU6YBYLhYsxMLGJlvkaBSxf198pG3gpuoBI0OSex8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ryzLx14DN2axOMY8iVdzwzL7zMvgRYPD8w+Vzo1IndRgqwDtr
	sS+g2eTTMH3AlTFucnqQgRUyFbLEEPB4HERLTmgyojbPqrV/specbBLqi2ivwTwG8y6GxHn3eyF
	DG6CJViirNH3legQxOCm7mvCogdoOICw=
X-Received: by 2002:a17:903:1212:b0:2e9:fd49:64a with SMTP id
 d9443c01a7336-2eb3640f012mr65226725ad.1.1793622366169; Mon, 02 Nov 2026
 04:26:06 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030094024.3226356-1-chunyan.zhang@linux.spacemit.com>
 <auYxFRtKWbGAlRTL@aurel32.net> <CAAfSe-shesRwmdKhZojqbZjJejVEtA47NXBwNmrpAsTsk6m5rA@mail.gmail.com>
 <DMKIFFUY4T1C.TTDVVD0FOSF1@kernel.org>
In-Reply-To: <DMKIFFUY4T1C.TTDVVD0FOSF1@kernel.org>
From: Chunyan Zhang <chunyan.zhang@linux.spacemit.com>
Date: Mon, 2 Nov 2026 20:25:29 +0800
X-Gmail-Original-Message-ID: <648788BF6233AD63+CAAfSe-uMrrX2Y_mzt5-Hhr+ssfwLVhs094PBb-ZTgKFLPwVjgA@mail.gmail.com>
X-Gm-Features: AclHuK8Nf_Wjx0Fs3iSP6YTyXDr4sshL9mP7vgixNBtorqmmqEdGoXFlzXEdNkY
Message-ID: <CAAfSe-uMrrX2Y_mzt5-Hhr+ssfwLVhs094PBb-ZTgKFLPwVjgA@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: spacemit: k3: add USB3 port A (DRD) nodes
To: Troy Mitchell <troy@kernel.org>
Cc: Yixun Lan <dlan@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Aurelien Jarno <aurelien@aurel32.net>, linux-kernel@vger.kernel.org, 
	spacemit@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, devicetree@vger.kernel.org, 
	linux-riscv <linux-riscv-bounces@lists.infradead.org>, 
	Troy Mitchell <troy.mitchell@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: OPwCOm/aw9wGRj4dH4gSoQfXH1bSqs37vg84z1cC9RKX5O8Ui4kWmZLT
	0J6Hu+/tX19EblazNpgyZDFdbXGkD6jTc4R0vN5iWSiLoS8vBaxoMv/kcQwkD0+ahPa6IV3
	vSgrtRHr+9jzh/noZDe/EHbtqGzlMJA2PyVJk3+JYhcqPG4ngW8hoa0/r9NH428IufbJdUM
	p+S9fwdQb6hz04mZltGvLGCTVS5vcXuAp2G5dd6f9/AftcK5HhSBUjjf76bdP1Ao4IefC97
	3DP6G+8Wug2XV/lJNvjb7rnosQh+rFsqFlTN8UrZhSj5szGRn69xuu1E1rPVkIlhf84tCTh
	9rLn9U5P3Kg8u9P7g71IAPThCcmhYAxw/5BdYHxpUr7J1FlVICYppCRIQyRrwz+2XgH3dd+
	KDKm3V3Ez5WT1/NoQQnywB40FLicZ/3dMVH+PPmFw87FWoJwQIVGyP6HI31e1sCN20cYf0H
	76EZkHX/C4mmrIm/sU8froOLxk1HXdEM9S+W9ZpYJAkOgl8m824nZtw59VEDuwtGOeHmDlm
	FuOa7g9Z3li4SG1NaLO1YgIVSjWa4UnpQrAoOgJnyvnsZmQy+RwEi9zP2NeNPcJ1SdgYQGn
	kNY7FJ0531lCkUD5RDMhJCuFs4CGLbaqt4ScX5rLiOpO/ddo7X4EjKRhDetMw0u9ABIK616
	aiDSu99J//YfQ+Ew1RQgtPFU3rdx6Tm3z5cyKhFqkMRw2ODnjugvfmGlKcIzSayte1tImBy
	57kLYiDCxE4psdmWL/rfyOekPIBoBuKiBOD2zhaIffBuaJbgLki4xXfrSjL5diaDy17TmvB
	cb3Sjk7RNYhKEXWIbibvfoLehq6n+voQUSE2ZxhjIlogY1G/4mm6ZueBcGn+ffOsHWhLh0+
	xSenZJvI/irQdu3ShPgm1P3tm96a49Mfm0m8RKTg/shBLdf9bL2fIbzSU3IfUNh1bJF2t7s
	3qTCbICcH9fZWbyH/GF2QkrotYTj34nTz+yHBhCEHkWJ3mcsSMIxanSdM6I37Q757SUq/2g
	pouGkEPv/npyJLTxioKmtFqqXe0k4KQr5cjTXOssAIqvltWoQtj3CLPp4qzjplJPdhNOZSc
	+9lSDu40e7W
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

Hi Troy,

On Mon, 2 Nov 2026 at 14:27, Troy Mitchell <troy@kernel.org> wrote:
>
> Hi Chunyan,
>
> On Fri Oct 30, 2026 at 5:40 PM +0800, Chunyan Zhang wrote:
> > Describe the DWC3 controller and its USB 2.0 PHY for USB3 port A
> > of the K3 SoC.
> >
> > Only the U2 lane is described: Port A's SuperSpeed PHY has no driver
> > yet, so the port runs at high-speed (maximum-speed =3D "high-speed").
> >
> > Enable USB3 port A with dr_mode =3D "peripheral", so it can be used as
> > a USB device.
>
> Port A is a Type-C port behind a FUSB301, so please note in the commit
> message that it's device-only until the CC controller is described.
>
> Was this tested with a C-to-C cable? That depends on the FUSB301's
> power-on CC mode, since nothing configures it yet.

Just tested,

On K3:
~ # ls /sys/class/udc
cad00000.usb
~ # cat /sys/class/udc/cad00000.usb/state; echo
configured
~ # cat /sys/class/udc/cad00000.usb/current_speed; echo
high-speed
~ # cat /sys/kernel/config/usb_gadget/g1/idVendor; echo
0x1d6b
~ # cat /sys/kernel/config/usb_gadget/g1/idProduct; echo
0x0104
~ # ls /sys/kernel/config/usb_gadget/g1/functions
acm.usb0           ecm.usb0           mass_storage.usb0
~ #

And the host side sees VID_1D6B:0104 with no error. This is not
guaranteed across all C-to-C host/cable combinations =E2=80=94 will note in
the commit message that Port A is device-only until the CC controller
is described, and that C-to-C behavior depends on the FUSB301 power-on
default.

Thanks,
Chunyan

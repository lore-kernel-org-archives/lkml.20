Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794600678;
	b=aF0NAUEpWZlxgZpf8bLuXMhRS9auth/f2uVm5m7DzU7/Rt42wuIUSglbmyww9LtLjJ+F
	 tr512YWtOkypIBCjhwpO/RCSuctTd47xXp0KIy7KN4tgWZeX38ytQmM/oQk1fQNqIGczR
	 HwO/kZ7A7oPgpcxwowaov11Gyg/C9tJkvqbxvaeMc3+966LUOQJceESktwRRDvwPXhM2L
	 jSKNLtE/RMTVxYAmuPJVw4U4USNyXcLDcYsBZnbgc7fDf8P314zhokSQvCirrEfvLJz/t
	 q7p5/Ub3mQvBQ5BfF4YUwkCKXwbLM546rDGRaXZnW4xysP3mbIcapJzSfIWU/gUPjjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794600678;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=MdqVu6GQ2x59YZWXLDPDTO4jZ1Xe2sGHC5fhtOzeSXQ=;
	b=oXWDTyM2smkBgeTb7KadjGIQc0v3D9+RcvlRJbgi1SqRtA4eFFp85v451kOqP9AJBJ1f
	 7DoBKHRxcC4XjGb4OhPK28bXb4BnEL1idcSMEFkw2O/ajoJ0dwwqDWsEmZPYoA4zgkKgR
	 M6vTIaHVRJImJHWTsxi3I5IoiIB2omkjbqaVitRAZ0VaxH/SS2WY6PO0xJeZSogDDs/mv
	 L0XEGRfoKRPusTnz2d+9f4ZSSBy8Aq8E8qIAJzH0NaN3lDGXGaF2Ob/xNV+SF+Ku7J9bf
	 u+Iz/BqyLAtGCdtNSZ2rmkrdd/MweHw0t8ZtZ2dAStBQfzlYIfIxxMk/fvwQrDzMS1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squebb.ca;
	spf=pass smtp.mailfrom=squebb.ca;
	dkim=pass header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=j3Z+wOSQ;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=JWEEDcM6;
	arc=none smtp.remote-ip=202.12.124.151
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF1B606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:11:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DF1B606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=j3Z+wOSQ;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=JWEEDcM6
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfout.stl.internal (Postfix) with ESMTP id 76DD41D00193
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:11:16 -0500 (EST)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Fri, 13 Nov 2026 15:11:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1794600676;
	 x=1794687076; bh=MdqVu6GQ2x59YZWXLDPDTO4jZ1Xe2sGHC5fhtOzeSXQ=; b=
	j3Z+wOSQtOaRBiaXlnzpdOiwoEpbPVVudfZxk6TrfrII6hXm2mq8yW5P3OZ7tZcD
	gYtJakZ+PSDHVNyQazYru4RCqdbZvTn2nfZcJfuJqkVlNNcCVbxEz+VRqTExTPuf
	3zHMfQjGXYbQ62pI/PxgPQ7znsGb5EQ2WgODtcH+QNQD1TKgZSH5NbL+6PBw2q7m
	ePFDC+rvcdIS546fG2BurrfiQUwHZLYtjkYYOb2NsRzrJvU8dOP8e1F9HXeHpqlN
	TxzFJvpGX9WDOISWF8/5fTQfGxBUaQa444WN8rSpgGV7uWFno2PcVtW9pXPPQEso
	LseBwmMVodDIVZzh4xGQtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794600676; x=
	1794687076; bh=MdqVu6GQ2x59YZWXLDPDTO4jZ1Xe2sGHC5fhtOzeSXQ=; b=J
	WEEDcM61ePsyePBgps36NWR5G/4tYkNcZ0NCTHqBsYb+d4pSUyJsQbtz3pXxtJVh
	tKwFKeaXCTIZdm9pMvqFeec3sFIMtTO9HoqyE3D7vk8f2cXOVxLPK5S+RXrgHvOc
	hybYaM1EW23G/ADEysrzuhsSkuqTbKLKa6mU3S2dh9FvLtIu9H8HsKAKMgSKz0uN
	s2rwrhrNgXa5dCE/WpXswND2fV/hwpmbxpUJ7zwDQakwt7V4FzImIyahuuYvGB7g
	z65uS/v3Hivua2wcQ6Vaj6ovRbyOTYx18PEH4IUtx6uHTPFRzO/IQwL2X/eoJqFE
	bjqQ+CsFxUzA0q6QosKNA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=squebb.ca a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794600676; d=squebb.ca;
	mf=PG1wZWFyc29uLWxlbm92b0BzcXVlYmIuY2E+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:LEI97d1U/RaqMOtJqxIXfALHCmOo1CytoHNZ6Nqs/O9Cf1T
	fpGopU8RAMjPAT72+ArS9xEkJ0Skzm7f2iPoRxCrjSs2AeZmnTWGZdc7nhhD1Ntc
	an7vxgbfChMUVSOGnQFbpNApGxWoIPD4NoRrcYtxajtShdnELRhsTs8WBVGLbj4T
	W8LGBbe3GONCrS1gr+LtH/GuM3A19ozKSQ8ld20/MPj7Vs+TC0Suy9LbXAivQDad
	oNoGzn0Xe8xuBNI6phys81oAal23K+655Ki9aLYHdUgFPdnJuuDRJ5RilypF1qEX
	woXuzc0bQUC0l5Xm62nWfXQKLez4in0cjLDWj9w==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:a2bYlrsALc5SHRRdHUH61xF7jU4mFww0s1lclRzAjvU=:FPtb3kMR/wXaYfFKAruSBoC94BRXFoGUK4o9IFL93xo=;
X-ME-Sender: <xms:4273ak6F3nNeSIX0OjmpHDQQUdC6Y-zFDGvH4ZlmfDMuNcOpoIOaUw>
    <xme:4273aguq-aRc9HXOZUnGk-pZiIfJp9wU2d1cbAQ04lhb9PKNn3Mv9Kf6ENJQRCHi-
    mJxC9h7sDxfMeoSSjMHrrD51zNVWEi4boztdIh4Uh6ExV4c6aJ3kLE>
X-ME-Proxy-Cause: dmFkZTEnQM6Xpm7E6jmcMCOOJbzmSBRUBcpKsd0nflCq4oseCj5QUwcfwFXEsHsVFI3tJA
    +jfAdmSPKPUtfsNnzaI+v5UfNUJ5I8cnNta2wjiwX5fbLd86+MBhGz5iliaIEbWxzZcNHM
    QizjCbHTWpmewXcygfmlYyM3BD4ruTHvp+YuHE6Dg8yNs8n4UgtIrrOk0v1hJaueIzgT8g
    qlqLXeRhQpwCD4sMALfu7ZA0uVkIzcNV7RmSEe3Eu7nKubv+ii5TtdosabtgIIO/LP0H/O
    olxFDjXOc+mNzM14RHnMxJaSnjwJ9lPzUMAogARDP8Zv4ntcwYdQJKWrOMNc5FtdBzpttk
    34seV/9T0JtfwZrnlpMSS5bkEq3ox1r9m2B2XILTVztd0mdz1LCC0m6vXgp8xfAK80n5SQ
    T6QagfPRn23hem7aqt31Xl3SldbFjKftgPjAc0KD0M2bbs1S3Jn7B2WbEdp2xAIjWThUgt
    0MflxJvwzZWqUZYPK2j6mh3aHQ+DLIuxQFFQ9F4XilLzv0N2Ki5gQ+dehvwQoAH9I44zdX
    ClYlFxL1g2mTBk2u5Ly7Xm5d8F6jKAg2V2Kt5r5bcePAz0uwAj3lqZCbEa4iOhNy9h9ci7
    juLS1ePXBLxHeZ3MtM/Wfh/Y/dwntsesq4U/0OawVry3CGP/Ee0CTTbylZhw
X-ME-Proxy: <xmx:5G73avusEJCUmDIR8YzAClGUd4h9liJKG0xV34bCPgsHAACbh3j_SQ>
    <xmx:5G73akJqWGuspCCGWQ4QSX608L76BvZc6jNVO2PNFXyUBuWKcWeEdQ>
    <xmx:5G73asnkt50-8yuVG0l57-ij_tPxfEa33ZbkZ9NuzKFzFpoXGbFxhg>
    <xmx:5G73alJvEnq9dXozrJKFeQ-dHXIDIHTrjEFe1HjkABqaWv7eHOWHHg>
    <xmx:5G73ajcrURjq8lJ6JvdeHcX4-Q2nP9S7rVJPnDE8MEUQYaKLAe7gt0aC>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id B9CA62C00085; Fri, 13 Nov 2026 15:11:15 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AorAWHb1nGwZ
Date: Fri, 13 Nov 2026 15:10:55 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: 
 =?UTF-8?Q?=D0=98=D0=BB=D1=8C=D1=8F_=D0=A1=D0=BE=D0=BA=D0=BE=D0=BB=D0=BE?=
 =?UTF-8?Q?=D0=B2?= <im.ilya.sokolov@gmail.com>,
 "Heikki Krogerus" <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, kernel@resetko.pl, linux-kernel@vger.kernel.org
Message-Id: <67dc8990-a15d-483b-ac45-073758ab406c@app.fastmail.com>
In-Reply-To: 
 <CAPb_5od-UFFAte88x8gxT+ba5HNT9=KbO1Re7=_f7-DuwBQyMA@mail.gmail.com>
References: 
 <CAPb_5od-UFFAte88x8gxT+ba5HNT9=KbO1Re7=_f7-DuwBQyMA@mail.gmail.com>
Subject: Re: [BUG] usb: typec: ucsi: Lenovo ThinkPad E14 Gen 5 AMD reports UCSI version
 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026, at 2:45 PM, =D0=98=D0=BB=D1=8C=D1=8F =D0=A1=D0=BE=D0=
=BA=D0=BE=D0=BB=D0=BE=D0=B2 wrote:
> Hello,
>
> I would like to report a UCSI firmware/driver initialization issue on =
the
> Lenovo ThinkPad E14 Gen 5 AMD.
>
> The issue appears similar to the recently reported UCSI zero-version
> problem on the ThinkPad T14 Gen 2a, for which a workaround was propose=
d:
>
> https://lore.kernel.org/linux-usb/20261103-ucsi-lenovo-t14g2a-v2-0-e85=
c659b56a2@resetko.pl/
>
> *System information*
>
>    -
>
>    Device: Lenovo ThinkPad E14 Gen 5 AMD
>    -
>
>    DMI board vendor: LENOVO
>    -
>
>    DMI board name: 21JSS0Y500
>    -
>
>    BIOS: R2CET50W (1.32)
>    -
>
>    CPU: AMD Ryzen 7 7730U
>    -
>
>    OS: Ubuntu 24.04 LTS
>    -
>
>    Kernel: 7.0.0-43-generic
>    -
>
>    Driver: ucsi_acpi
>
> *Problem*
>
> The UCSI ACPI device is detected, but the ucsi_acpi driver fails to bi=
nd to
> it.
>
> The device exposes the following ACPI identifiers:
>
> HID: USBC000
> CID: PNP0CA0
> Status: 15
>
> The driver matches the device but initialization fails:
>
> platform USBC000:00: __driver_probe_device:
>     matched device with driver ucsi_acpi
>
> platform USBC000:00: really_probe:
>     probing driver ucsi_acpi with device
>
> ucsi_acpi USBC000:00:
>     probe with driver ucsi_acpi rejects match -19
>
> As a result, /sys/class/typec/ remains empty.
>
> I used the kernel function graph tracer to investigate the failure. The
> relevant results were:
>
> ucsi_acpi_dsm()          ret=3D0
> ucsi_acpi_read_version() ret=3D0
> ucsi_register()          ret=3D-19
> ucsi_acpi_probe()        ret=3D-19
>
> This suggests that the firmware returns UCSI VERSION =3D 0, causing
> ucsi_register() to return -ENODEV.
>
> *Experimental workaround*
>
> I built a modified ucsi_acpi module using the source corresponding to
> Ubuntu kernel 7.0.0-43.
>
> I added a DMI entry matching:
>
> DMI_BOARD_VENDOR =3D "LENOVO"
> DMI_BOARD_NAME   =3D "21JSS0Y500"
>
> The entry reuses the existing ucsi_acer_ops, which assumes UCSI 1.2 wh=
en
> the firmware reports a zero version.
>
> After loading the modified module, the kernel reported:
>
> ucsi_acpi USBC000:00:
>     UCSI version is zero, assuming 1.2
>
> typec port0: bound usb1-port1
> typec port0: bound usb2-port1
>
> The driver successfully bound to USBC000:00, and /sys/class/typec/port0
> appeared.
>
> Connecting a USB-C device also created:
>
> port0-cable
> port0-partner
>
> This confirms that the zero-version workaround allows the UCSI control=
ler
> to register successfully.
>
> However, only one logical UCSI port was registered, although the lapto=
p has
> two physical USB-C connectors.
>
> *DisplayPort issue*
>
> I initially investigated this because native USB-C-to-DisplayPort outp=
ut
> does not work on this ThinkPad.
>
> The AMDGPU driver repeatedly reports:
>
> DP AUX transfer fail:3
>
> AMDGPU DM aux hw bus 3:
>     Too many retries, giving up.
>     First error: -110
>
> wake_up_aux_channel: Failed to power up sink
>
> Both USB-C ports work with an active USB-C-to-HDMI adapter.
>
> The USB-C-to-DisplayPort cable and monitor work correctly at 2560x1440=
@200Hz
> on another AMD laptop under both Windows 10 and Fedora Linux.
>
> Unfortunately, the UCSI zero-version workaround does not resolve the
> DisplayPort problem on the E14 Gen 5.
>
> With the modified driver, UCSI detects the cable and partner, but the
> monitor remains disconnected. The kernel also occasionally reports:
>
> ucsi_acpi USBC000:00:
>     GET_CURRENT_CAM command failed
>
> Neither the working USB-C-to-HDMI adapter nor the native DisplayPort c=
able
> exposes registered alternate modes through the UCSI sysfs interface.
>
> Therefore, I cannot confirm that the two issues are directly related.
>
> *Questions*
>
>    1.
>
>    Would extending the existing UCSI zero-version DMI quirk to the Thi=
nkPad
>    E14 Gen 5 AMD be appropriate?

This platform wasn't in the Linux program so chances of me getting the F=
W team to fix this are pretty close to zero. I've created internal ticke=
t LO-4776 to ask them - you never know.=20
So yeah, it might be a good candidate for a patch, though as you have ot=
her issues I'm not convinced it's a great idea. I can't confirm or test =
if there are any issues with it as I don't have the HW I'm afraid - espe=
cially as it doesn't actually solve your issue.

>    2.
>
>    Is there any additional testing needed to verify that assuming UCSI=
 1.2
>    is safe for this platform?

Bit worried it only shows 1 connector and the CAM command failure....but=
 that might be buried in the mysteries of the PD controller unfortunatel=
y.

>    3.
>
>    Could the failure to initialize UCSI be related to the native
>    DisplayPort AUX timeouts, even though registering the UCSI controll=
er does
>    not resolve them?
>
My guess is not and it's somethng else. Have you tried a ticket on the A=
MD DRM forums? https://gitlab.freedesktop.org/drm/amd
You can also post something on forums.lenovo.com/linux - but less likely=
 to get an expert comment there I'm afraid.

Mark


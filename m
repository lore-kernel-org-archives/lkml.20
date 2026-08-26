Received: from mail-10625.protonmail.ch (mail-10625.protonmail.ch [79.135.106.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979F635B62C;
	Wed, 26 Aug 2026 20:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787776489; cv=none; b=GPTTSi6w1SYSotZDPT7iYxz3rfmRgY2SV2x7cqx0Y5cSBaeFPM6GmQOHgemxmRNFWBUD4p3uP23SaBbxLltepvj7GCP4LKOXBUXV4xPYbwk7HUrKAXBhro0gpToTBtsFQgooctPPLh7Idd+U/8Lr54+a3IdJxsRJ894FlXbUNWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787776489; c=relaxed/simple;
	bh=zq0sKLifmni0DSexviiQ1uu6d9+6e2RXquCxsHJWfQ0=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rPSEUFfbWo70FUPWC4pJiA0Uq+mx6Aj8ounpNSUNiSSbKPh3o+WsevigSZj8NUeL6bZ/wQmU18B/g6wo79QO6xrGfEqmxqdlhVRFELREx3adzF/Zngmb57WM9DI/pTv7Ki+vbIsQeghkr6mW/fZk/pkIJuyuvYGhIMRVMpXfSNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pouliot.me; spf=pass smtp.mailfrom=pouliot.me; dkim=pass (2048-bit key) header.d=pouliot.me header.i=@pouliot.me header.b=A80E78jF; arc=none smtp.client-ip=79.135.106.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pouliot.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pouliot.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pouliot.me header.i=@pouliot.me header.b="A80E78jF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pouliot.me;
	s=protonmail; t=1787776476; x=1788035676;
	bh=Q198YZwzrhXS/7RbDIqrvfTGNpuEuUr/N5NMCdGeJkc=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=A80E78jFehbZOTldMdqmITN3ph3bgkRBRMKd3g3h3XJrgz8g7HYkRPxIxEMjYUoKa
	 Ag/gih610fTHPMteCVfIQo7hXQQgpaVNYiAxMt+V+DG5i8OuD3mzISJ+yUfsSr/jhk
	 Wa2YYVgeWC+Sc83aKNtnPOecIfGmIk6C0ypm2VO7x4sk/B6SvXgbbspMB56UOtCUz7
	 RSYScOC7QiJ4wrfX8Rfxsr9fgbiTnLfRYg8BnooFI4tClv9Xw+hYB1iNT9SF6MrXnS
	 ZTav6r/AG7/8UYRgY1CDRUCeQXmh19uP2NO9mFTk5aC7oeL5A/VxeH9DUmG9hDfebZ
	 lID94GamShi0g==
Date: Wed, 26 Aug 2026 20:34:29 +0000
To: Nicko van Someren <nicko@nicko.org>
From: Chris Pouliot <chris@pouliot.me>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: glymur: Add Asus Zenbook A14 (UX3407NA)
Message-ID: <ao9NBCsVaKMbl25Y@a14>
Feedback-ID: 216858851:user:proton
X-Pm-Message-ID: 41b5b3c0d73fbf60451e6ebed01936724d3b0afe
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Nicko,

I have an ASUS Zenbook A14 UX3407NA as well and have been investigating the=
 audio issue further.

On my unit I see the same basic hardware layout you described: the two WSA8=
845 devices on swr0 attach, while the two devices described on swr3 remain =
unattached. I now have working stereo speakers and internal microphone on N=
ixOS.

The currently working setup is:

keep the stock 4-channel GLYMUR-CRD AudioReach topology
remove the nonexistent WSA2/swr3 speaker path from the board/UCM configurat=
ion
constrain the WSA codec-DMA backend to 2 channels in the x1e80100 machine d=
river
map the frontend channel order so physical left/right, which land in PCM sl=
ots 0 and 2, are exposed as normal stereo

I have also started turning this into cleaner, distribution-independent pat=
ches for the DTS, AudioReach topology, and alsa-ucm-conf here:

https://github.com/chrispouliot/ux3407na-linux-audio

Those exact upstream-style patches have not been tested yet; they are curre=
ntly intended as RFC material. In particular, I am not yet sure whether the=
 correct upstream solution is a board-specific 2-channel AudioReach topolog=
y, or whether Glymur should retain the 4-channel frontend and express the 2=
-channel speaker constraint elsewhere.

I would appreciate any guidance on where that constraint is expected to liv=
e upstream.

Thanks,
Chris

On Mon, Aug 03, 2026 at 10:19:33AM -0600, Nicko van Someren wrote:
> On Jun 22, 2026, at 19:31, Bjorn Andersson <andersson@kernel.org> wrote:
>=20
> > From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> >=20
> > UX3407NA is a variant of the Asus Zenbook A14 built on the Qualcomm
> > Glymur platform. It comes with an 18-core X2 Elite SoC, 32GB DDR, and
> > the other typical Glymur platform capabilities.
>=20
> Firstly, many thanks for this. I recently acquired one of these machines
> for some firmware work I'm doing and having a working Linux system on it
> makes my life much easier!
>=20
> I tested this patch set, along with the others it depends on. I have it
> mostly working now but ran into some issues that might indicate a few
> changes.
>=20
> WIFI:
>=20
> > + wifi@0 {
> > + compatible =3D "pci17cb,1107";
> > ...
> > + };
>=20
> ASUS don't specify what WiFi7 chip they use, which is fairly normal since
> ASUS tends to swap the parts depending on supply. As a result, my machine
> has a QCC2072 (17cb:1112) WiFi/BT module not the WCN7850 (17cb:1107) devi=
ce
> that you listed. Inspection of the hardware shows that the WiFi/BT module
> is a solder-down M.2 LGA module, but electrically that's still an M.2
> interface. Photos that I can find of the Zenbook A16 show it does the sam=
e.
> I think it might be more reliable to define a wlan-connector, like Konrad
> Dybcio did in the Asus Zenbook A16 (UX3607OA) (2/3) from 2026-07-21,
> rather than specify the chip.
>=20
>=20
> SOUND:
>=20
> Regarding sound definitions, the dts declares four WSA8845s -- a woofer
> and tweeter per side, two on swr0 and two on swr3.=20
>=20
> > +&swr0 {
> > + status =3D "okay";
> > +
> > + /* WSA8845, left woofer */
> > ...
> > +
> > + /* WSA8845, left tweeter */
> > ...
> > +};
> > +
> > +&swr3 {
> > + status =3D "okay";
> > ...
> > + /* WSA8845, right woofer */
> > ...
> > +
> > + /* WSA8845, right tweeter */
> > ...
> > +};
>=20
> This machine only has two speakers (again confirmed by physical inspectio=
n).
> Only swr0 shows attached on /sys/bus/soundwire/devices/sdw:*/status:
>=20
>   sdw:1:0:0217:0204:00:0   Attached
>   sdw:1:0:0217:0204:00:1   Attached
>   sdw:4:0:0217:0204:00:0   UNATTACHED
>   sdw:4:0:0217:0204:00:1   UNATTACHED
>=20
> I don't think that's a config fault either; the swr0 and swr3 reset lines=
 are
> both claimed and in identical state of (out, 0, 2mA, no pull). It's not r=
eally
> a surprise that the cheaper model from ASUS would not use the full spec a=
udio
> offered on the Qualcomm reference designs, but without a suitable
> UX3407NA-tplg.bin topology file I can't really tell more.
>=20
> It appears that the audio setup is blocked further up the audio stack any=
way.
> I hacked some dts changes, purloined blobs from Windows and got a stereo =
speaker
> setup configured. SoundWire is healthy, but no audio is possible because =
the DSP
> does not respond. The ADSP boots and the audio PD is reported up:
>=20
>   remoteproc remoteproc1: remote processor adsp is now up
>   PDR: Indication received from msm/adsp/audio_pd, state: 0x1fffffff
>   qcom,apr ...: Adding APR/GPR dev: gprsvc:service:2:1
>=20
> then, on every boot:
>=20
>   qcom-apm gprsvc:service:2:1: CMD timeout for [1001021] opcode
>=20
> I'm curious as to if you tested this (or if this even known to work on th=
e
> Zenbook A16, Yoga Slim 7x or EliteBook X G2q with the other submissions).=
 Do
> you know if/when the required firmware blobs will be forthcoming and
> upstreamed?
>=20
>=20
> HDMI:
>=20
> The built-in HDMI cannot read EDID: the connector reports "connected" wit=
h
> a monitor attached but the EDID is 0 bytes and there are no modes. Less t=
han
> 2 seconds into every boot, before any cable is involved:
>=20
>   gcc_usb3_tert_phy_com_aux_clk status stuck at 'off'
>   Failed to enable clk 'com_aux': -16
>   phy phy-88e1000.phy.5: phy init failed --> -16
>=20
> I have not really investigated this in detail.
>=20
>=20
> eDP:
>=20
> eDP link training intermittently times out on resume, leaving visible fli=
cker
> until another suspend/resume retrains it:
>=20
>   [drm:msm_dp_ctrl_link_train_1_2] *ERROR* link training #2 on phy 0 fail=
ed. ret=3D-110
>=20
> I am carrying the (unmerged) "phy: qcom: edp: update v8 power-on
> programming sequence" series, so this may be feedback for that rather tha=
n
> a report against mainline.
>=20
>=20
> Anyway, thank you again for this patch series. It got me to the point of
> having a very usable machine for my limited needs. If you have updates th=
e
> need testing I'm happy to help.
>=20
> Nicko
>=20
>=20


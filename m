Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEA3392C42;
	Wed, 16 Sep 2026 02:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789526141; cv=none; b=cOb8fGjDEko/iPQSMlQmFl/wbY6XcERA+eAD6fg/tXubkpq4biIIGULz48wbuOs2EBln+5TK8zisCSkoRAATUomePITb7Q3WiyoFNXDBwvl5AtvgHcrGGcamqrhzRrJkobrh6+/BYqAJ1oPy0Ex5MxiB5FK8rOMQMKblyv85zUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789526141; c=relaxed/simple;
	bh=msfL9JO4ZeYfaEo+wQ64pWmcq2jR5oDPh92FhG1BpT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aSL5l6lECUQHSPFLrfo5ghLy1SHk9cNWsCwFaGcys3++XztItwEBE5Xsmnud6vJCZsGlXxiBguDPX3C2JSMXC68Ufyhx0M0WZ/yeU8l9p5RyQ2YWWiKS4jS7ux+LNmpdKa5zFZXGqTr+W1nbTHuc69tCMaLSsOOxxz3lYrtrsWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cwGL+g5F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cwGL+g5F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6167E1F000FF;
	Wed, 16 Sep 2026 02:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789526134;
	bh=hhOGsu2vBqRiy9aLaubxv4k01Wen6BTPaLQlfTu2L30=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cwGL+g5FFgSeP+661WsYGa8yHdAcKLcf7A+D4Rq8ZBe3KDzInBDwhjbcMnJSNlt3U
	 s54TEttsYnz+v4RM0O0hoOgO8p44JV4+c2qdsBGPrMPjnEd4o8JCV+WQKtgVGv4SVQ
	 BLyPi2p28J6YLVQtjAAUkaQ0s+04q38UOT2dvjF3+Vd84/GVVh1+codvtUVwTcyFHh
	 N8alG+rGAhXMqm+vDfY+djlWBwU7uzaL/l9SMyqA3G3JeucUWOGvhvkYTd8tT9Vpf7
	 D7NlIv/vn0rGI3IBltHzgXyocXdRpGsjD4NmrYTwBNXYH5vl1JB4D+2iiM+Dt1ieG1
	 5HyPAYh7k0ZvA==
Date: Tue, 15 Sep 2026 21:35:30 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Nicko van Someren <nicko@nicko.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: glymur: Add Asus Zenbook A14
 (UX3407NA)
Message-ID: <aqn-nRTRuXgjE9Qi@baldur>
References: <20260623-zenbook-dts-v1-0-3f80f680381d@oss.qualcomm.com>
 <20260623-zenbook-dts-v1-2-3f80f680381d@oss.qualcomm.com>
 <1D8BC06E-7D8C-4BD6-ADF2-A4CC1BD24B93@nicko.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1D8BC06E-7D8C-4BD6-ADF2-A4CC1BD24B93@nicko.org>

On Mon, Aug 03, 2026 at 10:19:33AM -0600, Nicko van Someren wrote:
> On Jun 22, 2026, at 19:31, Bjorn Andersson <andersson@kernel.org> wrote:
> 
> > From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > 
> > UX3407NA is a variant of the Asus Zenbook A14 built on the Qualcomm
> > Glymur platform. It comes with an 18-core X2 Elite SoC, 32GB DDR, and
> > the other typical Glymur platform capabilities.
> 
> Firstly, many thanks for this. I recently acquired one of these machines
> for some firmware work I'm doing and having a working Linux system on it
> makes my life much easier!
> 

Happy to hear that, and thank you for your reply.

> I tested this patch set, along with the others it depends on. I have it
> mostly working now but ran into some issues that might indicate a few
> changes.
> 
> WIFI:
> 
> > + wifi@0 {
> > + compatible = "pci17cb,1107";
> > ...
> > + };
> 
> ASUS don't specify what WiFi7 chip they use, which is fairly normal since
> ASUS tends to swap the parts depending on supply. As a result, my machine
> has a QCC2072 (17cb:1112) WiFi/BT module not the WCN7850 (17cb:1107) device
> that you listed. Inspection of the hardware shows that the WiFi/BT module
> is a solder-down M.2 LGA module, but electrically that's still an M.2
> interface. Photos that I can find of the Zenbook A16 show it does the same.
> I think it might be more reliable to define a wlan-connector, like Konrad
> Dybcio did in the Asus Zenbook A16 (UX3607OA) (2/3) from 2026-07-21,
> rather than specify the chip.
> 

Yes, this seems to be a more suitable representation, I have adopted the
setup from Konrad's solution.

> 
> SOUND:
> 
> Regarding sound definitions, the dts declares four WSA8845s -- a woofer
> and tweeter per side, two on swr0 and two on swr3. 
> 
> > +&swr0 {
> > + status = "okay";
> > +
> > + /* WSA8845, left woofer */
> > ...
> > +
> > + /* WSA8845, left tweeter */
> > ...
> > +};
> > +
> > +&swr3 {
> > + status = "okay";
> > ...
> > + /* WSA8845, right woofer */
> > ...
> > +
> > + /* WSA8845, right tweeter */
> > ...
> > +};
> 
> This machine only has two speakers (again confirmed by physical inspection).

Thanks for the confirmation. I haven't opened mine, but that was the
only remaining explanation, so I updated the patches accordingly and got
audio to work.

> Only swr0 shows attached on /sys/bus/soundwire/devices/sdw:*/status:
> 
>   sdw:1:0:0217:0204:00:0   Attached
>   sdw:1:0:0217:0204:00:1   Attached
>   sdw:4:0:0217:0204:00:0   UNATTACHED
>   sdw:4:0:0217:0204:00:1   UNATTACHED
> 
> I don't think that's a config fault either; the swr0 and swr3 reset lines are
> both claimed and in identical state of (out, 0, 2mA, no pull). It's not really
> a surprise that the cheaper model from ASUS would not use the full spec audio
> offered on the Qualcomm reference designs, but without a suitable
> UX3407NA-tplg.bin topology file I can't really tell more.
> 

This also matches the Hamoa-based Asus Zenbook A14.

> It appears that the audio setup is blocked further up the audio stack anyway.
> I hacked some dts changes, purloined blobs from Windows and got a stereo speaker
> setup configured. SoundWire is healthy, but no audio is possible because the DSP
> does not respond. The ADSP boots and the audio PD is reported up:
> 
>   remoteproc remoteproc1: remote processor adsp is now up
>   PDR: Indication received from msm/adsp/audio_pd, state: 0x1fffffff
>   qcom,apr ...: Adding APR/GPR dev: gprsvc:service:2:1
> 
> then, on every boot:
> 
>   qcom-apm gprsvc:service:2:1: CMD timeout for [1001021] opcode
> 

This can be ignored.

> I'm curious as to if you tested this (or if this even known to work on the
> Zenbook A16, Yoga Slim 7x or EliteBook X G2q with the other submissions). Do
> you know if/when the required firmware blobs will be forthcoming and
> upstreamed?
> 

At the time of posting this initial version, testing was blocked by
something else (don't remember exactly).

I now have working audio, but I am carrying a pm_runtime_forbid() in
qcom_swrm_probe() as a temporary workaround for hitting a "bus clash"
error.

You can find the UCM and topologies that I've tested with here:
  https://github.com/alsa-project/alsa-ucm-conf/pull/858
  https://github.com/linux-msm/audioreach-topology/pull/78

> 
> HDMI:
> 
> The built-in HDMI cannot read EDID: the connector reports "connected" with
> a monitor attached but the EDID is 0 bytes and there are no modes. Less than
> 2 seconds into every boot, before any cable is involved:
> 
>   gcc_usb3_tert_phy_com_aux_clk status stuck at 'off'
>   Failed to enable clk 'com_aux': -16
>   phy phy-88e1000.phy.5: phy init failed --> -16
> 
> I have not really investigated this in detail.
> 

We've made some progress on finding the cause for this, so I hope we
have some patches soon (unless I've already missed them?).

> 
> eDP:
> 
> eDP link training intermittently times out on resume, leaving visible flicker
> until another suspend/resume retrains it:
> 
>   [drm:msm_dp_ctrl_link_train_1_2] *ERROR* link training #2 on phy 0 failed. ret=-110
> 
> I am carrying the (unmerged) "phy: qcom: edp: update v8 power-on
> programming sequence" series, so this may be feedback for that rather than
> a report against mainline.
> 

Thanks for the report. Konrad reported seeing the same, so this needs to
be analysed.

> 
> Anyway, thank you again for this patch series. It got me to the point of
> having a very usable machine for my limited needs. If you have updates the
> need testing I'm happy to help.
> 

Thank you. v2 is in better shape and can be found here:
https://lore.kernel.org/all/20260915-zenbook-dts-v2-0-41de8669a7a8@oss.qualcomm.com/#t

Regards,
Bjorn

> Nicko
> 
> 
> 

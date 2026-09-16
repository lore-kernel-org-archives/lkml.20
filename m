Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DC1493642;
	Wed, 16 Sep 2026 23:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789602601; cv=none; b=g/8TU2Xza51Tabke8qaXP9M5CL/OA0kRwW+lnifePku6KQB8NmxICwVZyuo3zfwXiasDJKKAbGpDgYba/1hXv+5C/myGnbDO7Cj7teJbtJZipn4YlJ8yqA1futOWoVrQnkmgt7cZ+qYcQA9oI/q39qxcHMFJa6lKuoKVCBqXkVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789602601; c=relaxed/simple;
	bh=NNjIbUaYaWZ4tT4FFUewExGL1NK6vz19O/F0GPpATf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JDudL0wdDcvXCkx7GZs51l3wGlWBfYUPEin2kfyekBuQBuBL7mnA9bPk7PAOdxf751euXDKnFs0Eh6ZzinXmx9FoMs1bxzOA1YVfPYQ+CmWngXJl4Au46nAW1GW/h6rDiNYbfLeJuI6ToDWmCKtJxCTC1rdiqmOvYEcxj8QggPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mekx8IwD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mekx8IwD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C91AA1F000FF;
	Wed, 16 Sep 2026 23:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789602599;
	bh=VN6STUYeTPjIlv8wkaCwoduAtUJ1XttyOYdy6a//I+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mekx8IwDPzqNLSJLOj7pxU2I8BU0fRvkjWobGU1f76TSrc8WwsLEVnqjcb+GKRiQd
	 eSN7guqIcFOmyttCnprPB0Gp7MzxAzBxnKSsq/iHYnPjtN9Gr0qRpvk3P+apbiPDt6
	 GBkax32iC54Wl/TzfqQfrKTHP7ewQeaLK/82xP6C2pA7HNpTxriNXWvqSwy+ZhZIvw
	 D5ZwbdaymASnHIj4ASy29ffNS4thFdrRFUML6A4zGWtZZony3sS005yQJapAW9tsuU
	 ujwvljWZdYzm8KvFqD/ojIwmBujPrYZUcyUn0hdeEfVLPCIdU6+JDwkH9nnwPw02PK
	 7vslsUEuXOGog==
Date: Wed, 16 Sep 2026 18:49:56 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: david@ixit.cz
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Petr Hodina <petr.hodina@protonmail.com>, 
	Richard Acayan <mailingradian@gmail.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v9 0/2] Add initial dual front camera and rear flash
 support for Pixel 3 / 3 XL
Message-ID: <aqsrBhqnXLRO3Qzv@baldur>
References: <20260907-pixel3-camera-v9-0-b1981f2d3291@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-pixel3-camera-v9-0-b1981f2d3291@ixit.cz>

On Mon, Sep 07, 2026 at 05:58:08PM +0200, David Heidelberg via B4 Relay wrote:
> Describe the dual front-facing IMX355 sensors (standard and wide)
> and enable the PMI8998 flash LED with hardware-accurate limits.
> 
> This brings up the basic camera topology and flash support in DT.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> Changes in v9:
> - Dependency merged, no longer depends on anything.

Do you know if there's a immutable branch containing
dt-bindings/media/video-interface-devices.h somewhere, because this is
still an unmet dependency in my tree.

Regards,
Bjorn

> - Link to v8: https://patch.msgid.link/20260901-pixel3-camera-v8-0-99f159883348@ixit.cz
> 
> Changes in v8:
> - Fix ordering of includes. (Konrad)
> - Link to v7: https://lore.kernel.org/r/20260721-pixel3-camera-v7-0-82d323c6c5d2@ixit.cz
> 
> Changes in v7:
> - Depend on the
>   https://lore.kernel.org/all/20260628-kbingham-orientation-v3-0-4ed92968aff8@ideasonboard.com/
>   (Konrad)
> - Sort the renamed regulators. Why Mr. Anderson, why. (Konrad)
> - Link to v6: https://lore.kernel.org/r/20260720-pixel3-camera-v6-0-afe419bef476@ixit.cz
> 
> Changes in v6:
> - Remove forgotten bias-pull-down property from cci0_sleep node.
>   (dtbs_check)
> - ..-regulator -> regulator-.. (Konrad)
> - Rename camera -pin to -state and remove _pin from the labes. (Konrad,
>   dtbs_check)
> - Link to v5: https://lore.kernel.org/r/20260719-pixel3-camera-v5-0-99593f1bd8ec@ixit.cz
> 
> Changes in v5:
> - Added function-enumarator to flash LEDs. (Sashiko)
> - Dropped l22a regulator needed only for NFOV actuator. (Sashiko)
> - Dropped vdda-csi[0-2]-supply, as it was unused. (Sashiko).
> - Added previously omited cam_mclk2_sleep sleep state.
> - Link to v4: https://lore.kernel.org/r/20260719-pixel3-camera-v4-0-48cab1236852@ixit.cz
> 
> Changes in v4:
> - Use 24 MHz ext clock for the cameras, as the downstream does, since
>   the upstream driver can now support it.
> - Added additional LED, as the phone contains two separately controlled
>   white LEDs flash (upper and bottom, in one module).
> - Increase flash-max-microamp, as I took wrong "flash" from the
>   downstream sources and dropped Dmitry R-b.
> - Address formatting issues. (Konrad)
> - Link to v3: https://lore.kernel.org/r/20260412-pixel3-camera-v3-0-e26b090a6110@ixit.cz
> 
> Changes in v3:
> - Dropped cam_vio label. (Dmitry)
> - Move the MCLK2 pinctrl from cameras to common camss. (Dmitry)
> - Link to v2: https://lore.kernel.org/r/20260411-pixel3-camera-v2-0-41b889abb14c@ixit.cz
> 
> Changes in v2:
> - leds.h include escaped the initial submission. Fixed.
> - Link to v1: https://lore.kernel.org/r/20260411-pixel3-camera-v1-0-2757606515b6@ixit.cz
> 
> ---
> David Heidelberg (2):
>       arm64: dts: qcom: sdm845-google: Add dual front IMX355 cameras
>       arm64: dts: qcom: sdm845-google: Enable PMI8998 camera flash LEDs
> 
>  arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 199 ++++++++++++++++++++-
>  1 file changed, 198 insertions(+), 1 deletion(-)
> ---
> base-commit: 944a035ecca915ae947905dcfb03f2b9dc6d032c
> change-id: 20260315-pixel3-camera-a9989bf589ee
> 
> Best regards,
> --  
> David Heidelberg <david@ixit.cz>
> 
> 

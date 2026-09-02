Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209EE3ED132
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 13:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788355817; cv=none; b=jRus9tK3oQ5e0ND4Ihi+Q2d8/y41RczJjKkQKLnflInnuzN5U/iNil557d19ALZ6K1ZBVuMuCTNLl8X8xp4A0f8WUE/SP5iresFg+SFRaqnEg8ymK8sg6FLiFiYXuQcue/gUYL0IS0xa4A8L0WaNiI4qdMYph2H5jQ0CT5SZJvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788355817; c=relaxed/simple;
	bh=yRS3casAbW0vSRVgD98T3pImHrSvP0nYncWKSDB2S/s=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BfO0dU0enE5SlpQpPFCpoffcb8SwHlC96VGWKUM1pvydw2pXDHyshe8q1A0dEbk7wDfmlpjj+F+28aRbJc8yptCYMmc66CLFmVyhXnPJS93Rq9LFVzejEA+FFOOg3YCKg34ZlSNguGkbkQ0r5ic1RCqeNmEGH7iHLfcXWIxZuX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=APdJeIi4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="APdJeIi4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C472D1F00A3D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 13:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788355815;
	bh=yRS3casAbW0vSRVgD98T3pImHrSvP0nYncWKSDB2S/s=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=APdJeIi4/8ufueooABdGnx45rcwThUhJU0hv/NmfDCpMnZQqIbB23qODVwcmVv5LP
	 lMIouughgOuB33szKdFJcqY3jZcZEyhRBNYd2QuVQm+rFhZDmVgkfMKcFW+MgEFc6J
	 A5wD7OoRg3Pf1cqIxypyYnoUUMJZGNyVnk3ohHVHt91LMd8RqrVCWqqYlb6E0uHtYg
	 iBSKZIply53lw+MoOf5qNoAv/ROsMPW00tKJVkK3XJ1FW/GKE8uTh0S4w1zmjhI5mi
	 SQYMB1AdEbnoRmoiZKmVUWLO8N+ZZiYxwHj7Dl3QHLtmN3+ajhI330alxC5SjDc/XS
	 DSDhMLpWC4D0w==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b6036e9c70so932701e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 06:30:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwGDqPGdcujCYNC1cjdp4iInZrf0SPuAimyrAiJ5ZsX06RWV4yVRYLrwAdc6yUectclTgEYaNboqktnZI8=@vger.kernel.org
X-Gm-Message-State: AFuF++mrOujoaDm7a3ZfK6LlC9B7j1v96jUEonFS0647+HBBZGJ3BEHK
	EdO08XKven6S0Niws5dEJIVuDUiOAf7HbmIcLI1pbUesgI3GpRNA2O7I/eqVlyEk19abpfBGVwk
	RQOySWGLmbk1NQ4GCx2EaN/YGF58hMHkf6TUorEvY4w==
X-Received: by 2002:a05:6512:108b:b0:5b4:59a3:c48 with SMTP id
 2adb3069b0e04-5b60853c292mr1813677e87.12.1788355814475; Wed, 02 Sep 2026
 06:30:14 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 2 Sep 2026 06:30:12 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 2 Sep 2026 06:30:12 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260902045938.184221-3-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902045938.184221-1-shengchao.guo@oss.qualcomm.com> <20260902045938.184221-3-shengchao.guo@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 06:30:12 -0700
X-Gmail-Original-Message-ID: <CAMRc=Meu2KzFTWVowGuYJJODHDj+SNX8Gaq4u+PJPA1H9NFXwg@mail.gmail.com>
X-Gm-Features: AcwNN1UO3iDvmidkaTt_xVD222iLcrDDJNnBg-StcuA-7XrgDPpMDG_StTvhFPE
Message-ID: <CAMRc=Meu2KzFTWVowGuYJJODHDj+SNX8Gaq4u+PJPA1H9NFXwg@mail.gmail.com>
Subject: Re: [PATCH 2/2] usb: typec: Add onsemi FUSB15201 driver
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Sep 2026 06:59:38 +0200, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> The FUSB15201 is a dual-port USB Type-C and Power Delivery controller
> which runs the Type-C state machine and the PD policy engine on an
> integrated microcontroller. The host only observes the resulting state
> and may ask for role swaps, so this is a plain Type-C class driver
> rather than a TCPC driven by the Type-C Port Manager.
>
> Register a Type-C port for each connector described in firmware, report
> attach and detach, orientation, power and data roles and the PD
> capability of the partner, and drive the USB role switch of the attached
> USB controller so that OTG role switching works. Data and power role
> swaps requested through sysfs are forwarded to the controller, which
> performs them asynchronously and reports the outcome as a port status
> interrupt.
>
> The controller exposes a per-port VBUS ADC reading, but the Type-C class
> has no VBUS attribute and nothing needs the value, so it is not read.
> PD messages, PDOs and alternate modes are not exposed by the hardware at
> all. The chip-wide MASTER_RESET command would drop both ports at once
> and has no caller, so it is left alone as well.
>
> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

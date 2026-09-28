Received: from mail-106117.protonmail.ch (mail-106117.protonmail.ch [79.135.106.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0910036195B;
	Mon, 28 Sep 2026 02:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790564005; cv=none; b=UWaCv+uughnwstUEU0X7UcdVfYZOv3oc2qigzBNCIBLXjLxfmhqYTK9kB9SJoyMSeEKuT8efsO19FXJLtjoTgGsN5BHLoHJfwqsasRUq19TrC9tiK2WrSunTh6yxJad8YVbI/O3hlHwuExU79xVzi4a4vNKzrdHBMb3UcJDVlQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790564005; c=relaxed/simple;
	bh=VQdfyEA0NDRxKyfUnJ9+wBkpHy95AGsPUUbAH59kA8s=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kBACBuKIMvrCagDfy+woc/7vfkUdCD8s32ldzKomYcqHhp/aKtnqJSYH6JBW559VSWymZQo6pj5NJFtwrFVl23K6Wk9JT8HCBlYYAI57yrEANum4e+DTAOGKr4/lroexKgrza+cybvVDeIN/Mxsz3FJh+FKGxyvAycWTo66d4CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ironrobin.net; spf=pass smtp.mailfrom=ironrobin.net; dkim=pass (2048-bit key) header.d=ironrobin.net header.i=@ironrobin.net header.b=aPmTtCeT; arc=none smtp.client-ip=79.135.106.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ironrobin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ironrobin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ironrobin.net header.i=@ironrobin.net header.b="aPmTtCeT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ironrobin.net;
	s=protonmail3; t=1790563993; x=1790823193;
	bh=VQdfyEA0NDRxKyfUnJ9+wBkpHy95AGsPUUbAH59kA8s=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=aPmTtCeTVNAmZx68XmiiobjJqg+8m24IsKtvFcoHN2qBs5d1Bc5bNJst2eDrKQ+Hu
	 2DBWIrXOdMEuAO/29yGd0QLasQdWNHNGyiv/bQcPp3eZIlIgP4MDwtUw61f8rah+E0
	 o8/FS8/ySSeQSebjV+TFnxMhiY0QV3+59BhVeJf0D22tbSSQoxCvGEwkkjbZ2SdNfX
	 JBvazMb80Sud/cLdK7K9RCzRxBJMPr1LHvM4vgQ/23dsbaAGuT3slZCuqGI44wRcTJ
	 nl6lfiq5yupRBY06kRhjC9EgWjzG6sqIDB0wshn7WGmmSXEtXcOdM1vdQfWJ2EsTcf
	 wAnC67Lp9z6tw==
Date: Mon, 28 Sep 2026 02:53:08 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Alex R <alex@ironrobin.net>
Cc: Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Steev Klimaszewski <threeway@gmail.com>, platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: embedded-controller: Add Lenovo ThinkPad X13s EC
Message-ID: <SfCR0yNml_1hJk2DhXw0x7peYzRH52nThRG5dAjAiAYPzsw0ZIrIV3EaEV_O_G8hR8x1XnIZ4Wv5hBkdKqQG_pV-5fvPuMaVdpyXh3KMk_E=@ironrobin.net>
In-Reply-To: <fc7b99d8-f737-4dac-adfc-ccb9b12e30d7@kernel.org>
References: <20260926195415.5995-1-alex@ironrobin.net> <20260926195415.5995-2-alex@ironrobin.net> <fc7b99d8-f737-4dac-adfc-ccb9b12e30d7@kernel.org>
Feedback-ID: 54785507:user:proton
X-Pm-Message-ID: cc1fd69cb7f2e4397e6db992214d548540af8263
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thanks, I'll fix the author and Signed-off-by identity in the next revision=
.

Alex


Sent from Proton Mail for Android.

-------- Original Message --------
On Sunday, 09/27/26 at 12:21 Krzysztof Kozlowski <krzk@kernel.org> wrote:
On 26/09/2026 21:54, Clover wrote:
> Add a standalone binding for the embedded controller in the Lenovo
> ThinkPad X13s. Although its I2C command transport resembles that of the
> T14s EC, its keyboard-backlight, event and power-management interfaces
> differ.
>
> Describe the event interrupt and the separate host-controlled power-state
> signal, which is high during normal operation and low in the low-power
> state. Require this GPIO and allow wakeup-source to describe wake
> capability.
>
> Assisted-by: LLM
> Signed-off-by: Clover <alex@ironrobin.net>

Please use real and known identity. See submitting patches.

>



Best regards,
Krzysztof


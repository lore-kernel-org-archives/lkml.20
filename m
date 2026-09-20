Received: from mail-106101.protonmail.ch (mail-106101.protonmail.ch [79.135.106.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB813CC7DC
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 06:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789887240; cv=none; b=RUxwqE2wCr+ZoXQ2cKBRhvLuMr1N/GxdrzpfL3ekrFNhimjSxOd7N6g+dcCaUod4UDwbYYcnKVuSZyQCyb8OC/xAVGsVBn2kdPfN55jlMRbzjoRNkGgp0y56BwOSoTa8CNqdiP2C0rqmsYpYLWXdwtUhm27yKbcRycr3JJVTof0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789887240; c=relaxed/simple;
	bh=IbJAK7aXa5pz972jBcMi7T/vqSkdrkXCC86Z5Qp3eWA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qYzURJZkEnUTJVwlk6euL2jOHNYTXHTLhoZ2jPffkhbJWqlspyfY+M/D+F2rwLcB6Z+Wks9HVUicSA9b3Jg7k7R5MNNVZErDKNbGwM6FzlOxKljH9D09SLovc/sbE4OoutzV7olJcB3rnvtpFfQMOwE2asfxE3wdot1Yp1t1W2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=frdOYZX7; arc=none smtp.client-ip=79.135.106.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="frdOYZX7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1789887226; x=1790146426;
	bh=IbJAK7aXa5pz972jBcMi7T/vqSkdrkXCC86Z5Qp3eWA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=frdOYZX7FZJb91z6hvpOE5kpgk1q9s61Ad7aVmQ4uEJktsWxeb3O8iXMhYKFYCplc
	 AQEr/xyofjiCZdfjZ1p7lJIK6PIaJH+SyO5XEkcLuIyuR+C8bWcq9Gu2/C79jofA9U
	 R5HZTCWYeyr8JVFQjRt07BKju70K9EV0/hJfw5KcJAK2iA6w4DlToxp+crJ4R/4P88
	 oZ0PGwkaqNprudYxz4Rqd/kZZFMderx2YDEE9H80hCu3zSGeGPU8D1fdtgT3eAZbs7
	 hYko7HerXKILyDYgUihgLtj/YWV8mB2ctxZUXGT8yBYUzMJsm+iVR/Cp9tBQKZyRdo
	 EdpIyHhLCdH2A==
Date: Sun, 20 Sep 2026 06:53:42 +0000
To: Andre Przywara <andre.przywara@arm.com>
From: =?utf-8?Q?Juan_Carlos_Guti=C3=A9rrez?= <jcarlosgl96@proton.me>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: allwinner: Add SPC Glee 10.1 A64
Message-ID: <nW8RRZw7ua8aoc8OVyDPwkugyF_ondGUfEyOAIeuIjstEOvZUVgQGJ5ZPREZV0uFfsj_tcfUAENVI6ojy6ESKziH-HxaYLDWZl-OomGx2cc=@proton.me>
In-Reply-To: <63a19617-9349-4dd4-b9cb-dc677edc387f@arm.com>
References: <20260911-b4-spc-glee-a64-v1-v2-0-ed0b7ff02e0b@proton.me> <20260911-b4-spc-glee-a64-v1-v2-2-ed0b7ff02e0b@proton.me> <63a19617-9349-4dd4-b9cb-dc677edc387f@arm.com>
Feedback-ID: 47397442:user:proton
X-Pm-Message-ID: 8b81d433734c5098b45b8dd05d52a33c041e4bfd
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Andre,

Thanks for the detailed review.

I have looked at the PineTab DTS and the other A64 reference boards. They a=
re useful guides for the remaining peripherals, and I will use them when pr=
eparing the next revision.

You are right about the memory node. I will remove it and leave memory disc=
overy to U-Boot.

The eMMC was left disabled because I had not yet verified its supply voltag=
e and operating mode from a BSP boot. I will inspect the BSP MMC configurat=
ion and runtime state, then enable it once the voltage and timing are confi=
rmed.

The 25 MHz SD limit was conservative while high-speed operation was still u=
nverified. I will test the 3.3 V high-speed configuration and remove the li=
mit if the board is stable at 50 MHz.

USB has only been validated in peripheral mode so far. I will check the BSP=
 GPIO/debug information for an ID-detect pin. If the hardware is wired for =
OTG, I will add the corresponding usb0_id_det-gpios configuration; otherwis=
e I will keep peripheral mode and document the limitation.

I will incorporate these changes in the next revision.

Best regards,
Juan Carlos

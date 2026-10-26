Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.238.236.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793002246;
	b=qI7ZVcj2GT/anakb867m3raNskPdKTLiyeZudXsb5fK2BE17wvM3rb5jkFaL50hEsHxg
	 5ofBokoZgNTs7EwK0sGcQ30FgvaQLCDqjemX4Qwiit9c3tW9GjpKTu6EM++19QfUOPzX2
	 sHxDld7Kbsdt//TMTDnPVovTKTYi0ar+/1CskSxzNVwKLW+j4nWTpMA3o6zKk6k+NAlou
	 o5LkTVWtJQmtPhwEbhLGN7cak05oHTzPqVsd1fDlOtR5G5D6+Wa179YVekm6W/HVHIofa
	 1u8zW3rG7rAzBalRYktSD3AGZr3OYN2/dMr6b1hNCFeCq0SGuNt/CbxPYPEfl23tC2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793002246;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=FT2R+3LBW1RgNSBu29PCS8eirV9Pz7HjQL+1gPg5bno=;
	b=2Q5/yO4NUGcW+88oB8hNT/9z0NLjaX+qvkq4gL97W5Ia6M+4R2cMxnA2yer8icuyi5/8
	 KRr8Nyvvvloxqq4RvFKHxP/3RivlVABFqkPl2NurOUNSdraGBRYxyWLnqiozs2mTIKNlG
	 Jn4SUqr6iNBP5ttjLBnjhyjWwEekuA9bcXH1pBDHzeRaOSpOVIfkjdWlWQYZlrda+f4uw
	 0d3/c2DXkQFoRfUS9vML7qN8wdvRtnq5BDPrTqBnO1Zun/KmATCn/mgFVGPC97OWVruGh
	 tRhK1TjWGGBgo4ZZ1z72dxDtx195r1tmVQKj87XCvo9/jyogbeZ8CphqKG9JSsSkSyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kemnade.info;
	spf=pass smtp.mailfrom=kemnade.info;
	dkim=pass header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b="sy9Pf/tb";
	arc=none smtp.remote-ip=178.238.236.174
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D78606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:10:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83D78606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=sy9Pf/tb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=FT2R+3LBW1RgNSBu29PCS8eirV9Pz7HjQL+1gPg5bno=; t=1793002246; x=1794211846; 
	b=sy9Pf/tbEYmKkvRpsy8UdaS35GQvhJrVzX3l7+IagA9wEFjXYK0OY/eDrFynnAzz/UNC9o3WmrL
	2ctmEtYco/At3EwK2DlM9N0aJz/6/ETVANnhSSD4O8f2MKuDvSZQE/Ztttl8PGUyLJHoEdvVtxNOF
	w22WQIAbY+FgsHpE6iIRkLGxQ/YTdiK0uymWTOVa/5gR2hdMoBIc0f/AKRbm5Lbb992qPfaCTAij9
	aPAvxZ9VY1cHe1tvXU8N7vBPTLhaSe4AAS7Sdb6gzqqzTX8xEg70RfNgfv5VHmq5lw3dcd5vLM2d2
	hpKVbhIeafOdK1m4FgMKC/mm2YI3+y0WJ3JQ==;
Date: Mon, 26 Oct 2026 09:10:42 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] regulator: sy7636a: wait for power good, then
 switch VCOM_EN
Message-ID: <20261026091042.5376dd7d@kemnade.info>
In-Reply-To: <20261026003918.155321-5-pmazzini@gmail.com>
References: <20261026003918.155321-1-pmazzini@gmail.com>
	<20261026003918.155321-5-pmazzini@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 26 Oct 2026 00:39:15 +0000
Pablo Mazzini <pmazzini@gmail.com> wrote:

> Wait for power good on enable, as the TPS65185 and FP9931 drivers do.
> 
which is a good idea that the consumers can relay on the regulators being
useable when enabled.

> The VCOM_EN line was requested but held low. When it is wired, let it
> switch VCOM after power good.
> 
What is the reason for this change? VCOM gets enabled this way, too.
I added this line just for having the hardware completely documented.

A possible scenario where I could imagine this line being useful:

Calibration of required VCOM voltage, You would turn on everything else,
do a mode 0 refresh on the EPD and measure some kickback voltage on the
otherwise inactive VCOM line and have your calculated value for that
regulator.

To be useful, several things are needed:
- SY7636a driver needs to model vcom as a separate regulator turning
  on a vposneg regulator. The TPS65185 driver defines a vposneg regulator.
- ADC input is needed. The TPS65185 provides (not implemented in the
  driver yet) such measurement. Of course that can come from another
  chip.
- Some (probably userspace logic) to control all of this.

Regards,
Andreas

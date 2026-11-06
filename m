Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=116.202.128.144
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793991111;
	b=jEkMUYF/avnER6kSs66ERY8DZoa9DrcgeKBYIl/6Etnl5nOBmW+T5C4MLmHNhOpu2cg4
	 oXfGlGSol/yxZS03H08FBTDzHFMUMM5iZyNBxyHRR3MFs80nNNAbbOSCf1lTaV+gKUYxO
	 slw+qsGyrB3JwecNMoRSG4x9G7ZekIm6xgLXTNcsdSirtr6mPohCxeOjaBpGPRtvudoY7
	 9mmIaroScaqv3m5hHwTzAgvVkaHvWdiSLSdBngx1Tqa7FEf72qGpbwsEhY1YYJH52AfmO
	 8eveViC2ejWGHez7BsuZdGHm2s52EAhi0O7TfhZSlU72ymZpGShPslOZzAjO7Nzt8og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793991111;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=iJbBBhTmKjC5dRrCLy16aHqmWzeHhMuPJOjPj2I65fU=;
	b=Bpg56c3WF3iOrYsZ8x0eZM1P6xCF1VC84aNNDqBUS4SKLbnlZT3tJqil6M4FPq0qn3VL
	 EZqtpY6tVmcP7sxOGBqMOk8rIUp9Vi1JvpY4aShmsF2Ik1WXzysU8RjHIcd6/YDlyNg2G
	 tQ13VKYLQdznfjLLora8Kp3dzDuAXi54N8OwcpsGZ75pDYZx5Ex3QmV33Ma4w9GwPy3TI
	 Nycgj7XhsGbGY/k35FhOvi7R0Xth9Se2YN1ZPy2uFbzFf29fS0/UBSp8I41LZE4PJ0YOq
	 GfIZ3VS+7zQc6HZto4cZY+rW7CwYLuYJ1talrnLi4nFHLS3+8kpedy22Dv8atIJHopg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=freeshell.de;
	spf=pass smtp.mailfrom=freeshell.de;
	dkim=pass header.d=freeshell.de header.i=@freeshell.de header.a=rsa-sha256 header.s=s2025 header.b=KR+WWrD1;
	arc=none smtp.remote-ip=116.202.128.144
Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D49606A329;
	Fri,  6 Nov 2026 18:51:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48D49606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=freeshell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freeshell.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=freeshell.de header.i=@freeshell.de header.a=rsa-sha256 header.s=s2025 header.b=KR+WWrD1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1793991064;
	bh=iJbBBhTmKjC5dRrCLy16aHqmWzeHhMuPJOjPj2I65fU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KR+WWrD108d0d/sYexPx39IKW86oSjbsjrOCmPuw3W34yzkDbyeNaeBIS8XMhO8WB
	 7tMxeUMUhoTElvyviKL11+FSdDQlft2RsphBOXrxsir5wHr/h57XLvqyEYKBBFlPc9
	 +80VI8yoTKjKH2oomZX1Bo+yyz1MtF4/RsEJ8WcaFi9MbdPwhSAkjxtWtRjwYAVraT
	 3s+O/QIvfPivtDJg61+vT27QTIJE3j8WBZZuEU67v0cfHDA1dWTQcjULWLZI++/U7k
	 0ySb2nbxgLCOLRbEYF8WjPbrxUfJl8KPlW9CtPraMUkH4t60DMg/gaa9hoXuP1jR6W
	 ZqqRemClp+ETQ==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 8823EB220432;
	Fri,  6 Nov 2026 19:51:02 +0100 (CET)
Message-ID: <179fe9e8-322b-4745-8734-d5de5f1e8487@freeshell.de>
Date: Fri, 6 Nov 2026 10:51:00 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: starfive: jh7110-common: keep the status
 power LED on
To: Owen O'Hehir <oo.hehir@gmail.com>, Conor Dooley <conor@kernel.org>,
 Emil Renner Berthing <kernel@esmil.dk>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261106184055.3891621-1-oo.hehir@gmail.com>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20261106184055.3891621-1-oo.hehir@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Owen,

On 11/6/26 10:40, Owen O'Hehir wrote:
> The firmware turns the status power LED on, but the node has no
> default-state, so the LED switches off when leds-gpio probes and the
> board looks powered down.
> 
> Default the LED to on.
> 
> Tested on a VisionFive 2 v1.3B.
> 
> Fixes: 1ec99dfe9eb0 ("riscv: dts: starfive: jh7110-common: add status power led node")
> Signed-off-by: Owen O'Hehir <oo.hehir@gmail.com>
> ---
>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> index 64de468f2..7ec94e968 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> @@ -44,6 +44,7 @@ leds {
>  
>  		led_status_power: led-0 {
>  			gpios = <&aongpio 3 GPIO_ACTIVE_HIGH>;
> +			default-state = "on";
>  		};
>  	};
>  
> 
> base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b

I think this change may disagree with fastboot select function on
VisionFive2 Lite, where (if I understand this correctly) it is read as
an input; see that schematic listed as the "VisionFive 2 Lit Schematic":

https://www.starfivetech.com/en/index.php?s=docs&c=search&keyword=schematic

You may reference also the ghidra archive
https://web.archive.org/web/20260718140236/https://freeshell.de/e/riscv64/hrv-jhre-JH-7110%20BootROM%20analysis_2026_02_22.gar
for decompilation of JH-7110 BootROM loader, and there (to the best of
my understanding) it is not interacting with that register so it must be
purely the SoC reset state.

-E

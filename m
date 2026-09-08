Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9453569F01;
	Tue,  8 Sep 2026 16:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788884851; cv=none; b=PHl0FhVSZDn9XF70GneWIw6oE3vnrURotCOfuX2cCKWSbQjZoyuyjiQqoOQnHkm4gsG6Arj/fDsq7Iv9ZfeWXzi0eh97N38PpyaRBeW3qlBqRkLOgO3PYBVGt5tt4hNHOb6DY81EizxyG1Mwdm1oeyhk6RK7kkfklrKEr7sFEVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788884851; c=relaxed/simple;
	bh=4tot0O+d8TSmgQ1aVQb/tfZWtrwMnEKjHWtOI+zvfOY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CBl/3KBdVRXHvQW5BdUo14nze+9ou7GV4bAI4UbfwMzraoDu/BNjg8+vILugVgUiIlGbUKxFJESK+Mjv+5dlnUIXgxJIzq7938/W3OCJwlRMkb6kxrwwwq+M9cRwT8Xnhf4N9OvrW8CH1KMle0aiK4XcdRm28OQE4sH7TSHsKaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Sz9qeAyt; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=on45Idyi; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Sz9qeAyt";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="on45Idyi"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4hfTqg3g9szMl1L;
	Tue, 08 Sep 2026 18:27:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788884847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zV9GB3fXIyB5NrQ6rEv5WVb9ldeTAtPVcPbM4zRhXmA=;
	b=Sz9qeAytNGxWf0MkkrZ3MlYFlhTH3hjIkpZ/dSTBIMenAV3iHIkQqCAcHrzYDtxHMaBf0W
	MaeiA0xX70zK4blWKH7v1f+9tl6+2alZZ5t6scyNsQNbR1cVeVtDyp4757IiHA8ClYLeXt
	h0LiOWiSnEiHjhmz6bIHzx/0Oohmiao9pN5aQCktddE+KPepKCqMs0WT0LsXunjvtFpI8B
	VUN/CBLu4k4N43V+LbHXtHtwFML/IceP5B28uyLDmgYhc1NU/qHPfgURqPuML+87pdPnXy
	ExXrqmReeV/0QFSgnjifDTRram/b4WQ8AfNQO077/HKG8UI839j323CVVAl4ag==
Message-ID: <b1a64102-9c86-4cbc-aa07-11ad051b0dc2@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788884845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zV9GB3fXIyB5NrQ6rEv5WVb9ldeTAtPVcPbM4zRhXmA=;
	b=on45IdyiOihjZ3noklR6uoYpKdewRt4+AY7Cec1AyyjixAiL9ucsaZEYWXG1v9pkX2KJRo
	CUW1BZOkFFZMW93AbpxqScxiscr8XypgEbToTHVggabqiR9OThOsfS8xavLrGyhp949ZW1
	vwxtSs2xLiQe0jE+blHSgIbrg11+qnZowqr2bRxABYfg3cnZv9mIfB/Z3HSTSHehRu6A8x
	ILGjthCIL8Hz+hjjY6pl7kplwwZ3pWTVr883riWaQrqgL7f/lzU6LBtWwPeeV2cqhSTJvZ
	A5AXdOpl2IQykafHFl1+eu3rQ6VMrNcA2fSOLz70jXJw1AXe2MHYTCaqfZrIoQ==
Date: Tue, 8 Sep 2026 18:27:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: renesas: r8a779h0: Add GICv3 ITS and update
 PCIe node
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260906140134.492084-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdXKr-2+_kcCd8hSB84=AZpmOtDt2-Dxpgiewyg+67O+fw@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdXKr-2+_kcCd8hSB84=AZpmOtDt2-Dxpgiewyg+67O+fw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 95a871c755375494b81
X-MBO-RS-META: gsb99t9ej18ugjwbxn3iuk755yh9d7m3

On 9/8/26 10:46 AM, Geert Uytterhoeven wrote:

Hello Geert,

> As I am not PCIe DT expert, I am comparing this to the corresponding
> patch for R-Car V4H, which I have already queued as commit
> 7fe73a3a3f2c3718 ("arm64: dts: renesas: r8a779g0: Add GICv3 ITS and
> update PCIe nodes") in renesas-devel, but which probably needs some
> updates.

I sent a fix for that one:

[PATCH] arm64: dts: renesas: r8a779g0: Add MSI cells to GICv3 ITS

>> --- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
>> @@ -691,6 +691,8 @@ pciec0: pcie@e65d0000 {
>>                          resets = <&cpg 624>, <&cpg 1121>;
>>                          reset-names = "pwr", "core";
>>                          max-link-speed = <4>;
>> +                       msi-parent = <&its 0>;
> 
> This has an extra cell "0", which is probably correct, given
> "#msi-cells = <1>" below.
> 
>> +                       msi-map = <0x0 &its 0x0 0x10000>;
> 
> This is not present on R-Car V4H (which is probably wrong).
> 
> Interestingly, Documentation/devicetree/bindings/pci/pci-ep.yaml
> documents msi-map for endpoint node, so should it be added to the
> pcie-ep node, too?
I do not think we should be adding it until we can test ITS with EP ?
This patch adds the ITS only to the RC side, where I can test it.

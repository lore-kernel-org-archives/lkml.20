Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925574;
	b=XUgxmcsgiqLTLY8OwmDnHvgq68Uqc5/ZrFm0jiYcusA376TwH63rjhrFjqmGhgPDDYZB
	 oVoEBJLzwoWZwodD80tJH4F5z/G99lxdPChpX1dwQ9GSwBJ9FmZQFD2wBexIpkx2F0qMw
	 BIbg67pHGF45UIF3AgZVuw1fbvmre2lycHfWdTidpxOh5AQKuD+TdmJKpqSvmAuLpwKjR
	 uLSUB3LyAeExck3QO9wh+qX8PSYf3/G2W7ll4V/LhiBCnYhayZPUOYRrc6P131fpE68bW
	 zZk80vflQK5lbSMSpjq44fYPFVtJC118QbpswE3mmlw82A88pGU/oYVxZToEzrUPKFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925574;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=Qr2nUABmn5h/YBOq4rfdc5mzXb4rIjc5Q4wwfmjeF/o=;
	b=MbsHegOcKbfmZqKruXWsPOoFnYBWPm0/IWRubWbKvHK+3X6IoB1FOAIhabuKsZpYcKT9
	 G8ksapS216p9vq7EeX8XYkXBhh2ySGfomxn0q1uSF0VbkDpeyWpfJp9xX0BzRLc9WG4WI
	 PLTxEiojZOdw8wVhkEUvWKovbvfVYhkQhgcCIqXg4dK8YbzhWx2ZBe9UXsdvrAYbaKnEB
	 VuRRy/YPsCvf3TQsfziB/NdHye5UOT6DUL01KPxYhw6yhBFW98P42569EQkrj3hF+gG9G
	 RzbzytuCYBRJr4mAfInJpqiqxJYyrrX8wXTY3rTLQOJ5S2NXP67h2n+Ct/yAW9BOu9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=qD6dL8zB;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DAF606A338;
	Tue, 17 Nov 2026 14:26:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12DAF606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=qD6dL8zB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794925572;
	bh=Y8zZspvVCHyV544/HTl+z4+atP6mcZ4w51n6InGt6FA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qD6dL8zBJa/8aKYElbLg/C0j/T6uzmQiUwv9Iy/FwdtkoZMnRPA0tR1Tr7NkEtQZF
	 3qPsvf3dTZ87+6HVFrpI8vn/0ROgE3DUG9o44xFLzzvIUsXLdaKAt7NbHToKtZezCu
	 tnMvXEVNW2MH4VsnJwiUqmyU5r4moZO028h//j0nFVzNAS5I0JI9xRPvcd1GkeY9xM
	 /7KM2ZGjVl7TPs+O1tfBdO8F10XELQ6cjiChADQHpvvyTip+UZBQboIH7PMUuJ7TFN
	 Y3XZzLSqBQheTb1R7G1KW9Kl4f9t6QMQMhGeKXie8onu/6g6ftQ++Zds96uukdP2Ce
	 LPwvM1iRzmA1g==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D90C117E0069;
	Tue, 17 Nov 2026 15:26:11 +0100 (CET)
Message-ID: <a7d13845-5f9e-4337-a7d5-f01988c03f87@collabora.com>
Date: Tue, 17 Nov 2026 15:26:11 +0100
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
Subject: Re: [PATCH] arm64: dts: mediatek: Remove undocumented, unapproved
 aliases
To: Akari Tsuyukusa <akkun11.open@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20261117130556.234785-2-krzysztof.kozlowski@oss.qualcomm.com>
 <avxXNp5xEbczbb1y@buffalo-ssd>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <avxXNp5xEbczbb1y@buffalo-ssd>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/26 15:16, Akari Tsuyukusa wrote:
> Hi Krzysztof,
> 
> On Tue, Nov 17, 2026 at 02:05:57PM +0100, Krzysztof Kozlowski wrote:
>> The ovl, aal, color, dsi, gce, rdma, split and other aliases were never
>> approved by Devicetree maintainers, because they were never documented
>> as actual ABI.  Drop them, because no new custom aliases are allowed for
>> years now.
>>
>> This might break users of this undocumented ABI, so these should be
>> updated to use only documented and approved ABI.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> You mentioned 64-bit MediaTek SoCs, but the same class of issues also
> exists in 32-bit MediaTek SoCs under arch/arm/boot/dts/mediatek/.
> For example, mt7623n.dtsi has rdma0/rdma1 aliases, while mt6589.dtsi,
> mt8127.dtsi and mt8135.dtsi misuse "simple-bus" for the "clocks" node.
> 
> I hope this push for correctness doesn't lead to any regressions.
> 

As I said, picking this right now would break all MediaTek SoCs, but that patch is
just a way to get a discussion started - don't worry, noone is crazy here, this
will not get merged until a decent solution that avoids regressions is found.

Cheers,
Angelo

> Best regards,
> Akari


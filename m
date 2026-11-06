Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793948500;
	b=UmyFQ1GEXdso8TEbPyeZJHuMRkBvdMrxMvDwBTh/UEFMzqpPLnKRgGmUtPsYZo142l8g
	 duWd8XtgBz2H0IuFgkGttR2pq0pUOSIhkdDBYzCkL3fyLKMVehgPQYXj6jhrciRYNXYwD
	 pFPo3KIh9fml+9DkVR2mZGS97TbR/25nXXf7KgB+IMt5+3brZLA+2rkN9dGomblPhTwKh
	 adO9EMvAGK9L4CkN19EZHN6xz9kinTOW0Dzo/vkaYgppf8GuUZlk5OD6QX1XdOFTtez3q
	 vkAKkTqh72ZcKDYMFlhjFXtHKoRFLchhGQrGBm+fVIRLLcJjS7kP4i7S8zobeP/WSYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793948500;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=IFfuY1hZMoRwXCoL1hkTowy7WzV9kAbU4DoD/5e7u9o=;
	b=qbWVesElw7CK5URSzECnmddKhPUJmCFLOhAy0NJ8kSx0OeKkfWmw+SxP+5YrqvqWcOad
	 pj8RPsXOhU96uDKGUaU9rcETEcNkovvevig4EN/HVZmYiwI8Vh+fxXv9XceHrOc8Ln3YL
	 O0wjbqdJGMsr8ZpF7ukLx0caDWW9n7c+e62+57hj4uxgc/tY12OFzmU7eCOfgkbenkIzJ
	 xQujdra3Rm4FxDZXrZgdZFbWOxiTNbDZTW/8HnVmVaOH8mAhfQHhaAzsc+VVxl6+/9XN2
	 35EPkXH7gDwybq8zhkm3lTUM9AYT4zUmlik1J5R7XFNTb1FMoTUSrSUsG61wreNIs4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UgxMoMOP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7FE606A326;
	Fri,  6 Nov 2026 07:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UgxMoMOP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DC181F008A2;
	Fri,  6 Nov 2026 07:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793948499;
	bh=IFfuY1hZMoRwXCoL1hkTowy7WzV9kAbU4DoD/5e7u9o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=UgxMoMOPai0m3Br8spwQ/+zamPjOwrI3Q3KNAv2F+WvOSgcZTdOO2SByUIWHkMbRh
	 Funn9wbf6L0m8LN9e7UBFyvY0uIXuZ396mFvjRcrSWiKRCg/UNtHp4S45OFB9rcPKE
	 ZxJZ97LLSP4zR6FYCOsLF3cvXrNy4Ozj/0RyF9DE5bRVvR89ccW2Y/dGKhUknk3kVp
	 DHYznMXadWOw6599upaz6R2so3pq/bJK6/z8RHQmwNBZFOaLefl7mg8viCl7Aip6ka
	 ajS05lKJa85udrwczqy9wVmkZFKOlSYtt51TsRSFQIcoP7m9DbZMyZKzutRmyjWVsF
	 LNpeswl0g59sg==
Message-ID: <8ffdf2f9-dd67-419f-83af-8dd4206d54de@kernel.org>
Date: Fri, 6 Nov 2026 08:01:31 +0100
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
Subject: Re: [PATCH v6 1/3] dt-bindings: usb: Add CIX Sky1 USBSSP controller
To: Hongliang Yang <hongliang.yang@cixtech.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>,
 Roger Quadros <rogerq@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 cix-kernel-upstream@cixtech.com, Gary Yang <gary.yang@cixtech.com>,
 Fugang Duan <fugang.duan@cixtech.com>
References: <20261105011803.4058557-1-hongliang.yang@cixtech.com>
 <4d075b70-f2af-4aad-a1d7-cd8ea26387ca@kernel.org>
 <20261106055050.948470-1-hongliang.yang@cixtech.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20261106055050.948470-1-hongliang.yang@cixtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/11/2026 06:50, Hongliang Yang wrote:
> On Thu, Nov 05, 2026 at 08:49:05AM +0100, Krzysztof Kozlowski wrote:
>> NAK, you did not respond, did not implement feedback or part of the
>> feedback.
> 
> You are right, and I owe you a proper answer instead of another version.
> I replied to the cover letter of v5 and to nothing else, so the per-patch
> comments on v5 (b28d5657) and on v4 (a5586b54) were never answered.
> Answering a cover letter is not answering a review. Below is the
> point-by-point answer, including what I got wrong and what I have not
> implemented.
> 
> 1) "No MMIO here? ... If you have here MMIO for some glue over IP block,
>    then it is unlikely to be a syscon." (v4, 7c52bcf5)

So instead of replying under each comment, you selected a few of them
and expect me to map/figure out which ones you ignored?


OK, then find me where did you reply to this:

"And do not combine USB patches with other subsystems."

"I do not see how you addressed my feedback from v1. I asked, not to
combine USB patches with other subsystems, within one patchset. These
are separate patchsets."

Either here below or in original threads (more than one):

> 
> We do have MMIO. Each controller owns registers in the USB30 Type-A
> DRD0/1 RCSU block at 0x091c0000. "What is the actual memory map there?"
> (791fe5ba) - this is the block:
> 
>   offset   register        contents                                  belongs to
>   0x0300   STRAP_PIN0      stream ID (SID/SSID), controller 0        USB4
>   0x0304   STRAP_PIN1      stream ID (SID/SSID), controller 1        USB5
>   0x030c   STRAP_PIN3      clock enables, controllers and PHYs       USB4, USB5
>   0x0314   STRAP_PIN5      awcache[3:0], arcache[7:4], controller 0  USB4
>   0x0324   STRAP_PIN9      awcache[3:0], arcache[7:4], controller 1  USB5
>   0x0328   STRAP_PIN10     USB2 PLL controls, controller 0           USB4
>   0x0400   STRAP_STATUS0   AXI clock en/valid/req, controller 0      USB4
>   0x0410   STRAP_STATUS4   AXI clock en/valid/req, controller 1      USB5
> 
> Controller 0 of the block is used by USB4, controller 1 is used by USB5.
> The driver writes the AXI cache attributes of its own controller and
> polls its own AXI clock valid bit. By the rule you stated, this is a
> device with MMIO, so a device node, not a syscon, and the
> cix,sky1-usbss-rcsu syscon binding from v4 is gone.
> 
> 2) "Individual registers are not a device." (791fe5ba)
>    "You need to describe the address ranges, hierarchy, not the
>    registers." (291fc3be)
> 
> Agreed, and v6 still got this wrong: two reg entries of 0x10 bytes each
> are just a register with padding. What I intend to send as v7 is one
> range per controller, starting at its AXI cache attribute register and
> covering the register file up to its status register:
> 
>   usb@91c0314  reg = <0x0 0x91c0314 0x0 0x100>   /* USB4, controller 0 */
>   usb@91c0324  reg = <0x0 0x91c0324 0x0 0x100>   /* USB5, controller 1 */
> 
> 0x100 is the same size as the glue window of ti,j721e-usb in
> Documentation/devicetree/bindings/usb/cdns3-ti.yaml, so the range is
> comparable to what the other Cadence users describe for glue registers.
> 
> I want to be explicit about the hardware rather than let the DT imply
> otherwise: the strap and status registers of the two controllers are
> interleaved in this one block, and 0x0328 inside controller 1's range
> belongs to controller 0. There is no per-controller contiguous range
> that contains only that controller's registers, so the two ranges
> overlap, and the binding will say so. That is also why the driver maps
> the range with devm_ioremap() and not devm_platform_ioremap_resource():
> request_mem_region() would make one of the two controllers fail with
> -EBUSY for registers the hardware shares.
> 
> To be clear that this is the controller's register file and not an
> arbitrary register: the same register set exists as a dedicated block per
> controller on the four Type-C instances of this SoC, at 0x09000000,
> 0x09070000, 0x090e0000 and 0x09150000. There the block is not shared, and
> the cache attribute register is at 0x310 instead of 0x314 - which is why
> the status offset comes from per-compatible driver data. Only the two
> Type-A controllers share one block.
> 
> 3) "Shared region is not a simple bus." / "Drop node. Not relevant."
>    (b28d5657)
> 
> Done. usb-rcsu@91c0300 and its ranges translation are removed; v6 and
> v7 use absolute addresses with nothing translated.
> 
> 4) "So this is @14 / But this is at @91d0000 / You have completely fake
>    representation of hardware." (b28d5657)
> 
> That was the v5 container: a node at a translated offset 0x14 with a
> child at an absolute address. In v7 the unit address of each node is the
> first address in its reg, so usb@91c0314 and usb@91c0324 are where those
> registers actually are, and the Cadence core children usb@91d0000 and
> usb@91e0000 are at their own addresses.
> 
> 5) "Syscon is not a USB device. This is not supposed to be in USB."
>    (f76cef66)
> 
> The RCSU binding is gone since v5. The only syscon reference left is
> cix,usb-syscon, which points at the S5 system controller for the USB
> mode strap at 0x424, bit 8 for USB4 and bit 10 for USB5. That register
> is in the system control module, not in the USB controller.
> 
> 6) "NAK, undocumented ABI. Drop entire alias and do not sneak such stuff
>    in the future." (6029d402)
> 
> Done in v6: of_alias_get_id() and the "id" property are gone, the driver
> no longer derives an index from DT. axi_bmax_value is no longer a DT
> property either, it is a driver constant, which also answers Conor's
> "Why is this not a fixed value per SoC?".
> 
> 7) "In the description you describe hardware, not binding." (f76cef66)
> 
> I extended the description because I did not know how else to answer
> "What is the actual memory map there?" in the patch. In v7 the
> description is back to what the block is and which registers it holds;
> the map above lives in the commit message, where it belongs.
> 
> 8) "No improvements, since v2." (7c35c198)
> 
> You were right about the register model, and that is what v7 changes.
> The rest changed in v2..v6 but the changelog never said so - it only
> ever listed the previous revision, and v5's text was a stale copy of
> v2's. Complete one:
> 

Where is the reply?

Best regards,
Krzysztof

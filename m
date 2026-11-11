Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.210.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794388102;
	b=EPMPeKbijTusFIuPGPqfh2+6XTM3pO5p6AArZuqBWIAKrxO0mhUQ0TqtgFFLmEnn8X3C
	 Ri+JKlDncElOvmpn0Zekt1Y40nhT1oGYLY3mi3sg1+18QaAs4OpUp1kcQcyRlDt60SZ5k
	 a4xLaX09GfK/Piql1uMln5yiF2rN61gRyZduoyQBxePKmc2ESZnm6upJPFeYkKVYmTx2L
	 qxAK2ZUAnuCrXsAOqBwhbR+MfM1WzpHyJA8ri0F5E/7W/CF+EHaPeAYjxee0IihZPjlVa
	 ztdRIEz+kv7qIbKYaNrXmUtW6KemhGtWI161iSuZBZxwg32D19W0e1nN9i6BCYU6QHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794388102;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=/l2T4p9jCPLPtTUGGPewfdDVP0Og2K5VK9xJnKL6jZ4=;
	b=gAfoD9ZmWTjAn+yBlX7szv9rfaKS1nYGy1qPkTauA6OirLBAqvcvUjSbw0XytCNp6CwJ
	 VuV9/tXJb9eAc+mHOLOSi6bn+LviseaSirGryPd5lCTVkjYSa/BZwjIPs2E9I37lrc5nQ
	 iNCGc7kqXbrfDp4ybbtE9ZCkcJ51QG9mPk7GVDp/LNRi8TvjSTHdueChvLhgzc0N/dTaI
	 hWogFBygjUcSpAiEbuejfTzygRn/MnZwlfuYja+p26SWOeVA8vpcZrFi1j8oIc9jW2WqY
	 zlggrKoUgMGsrTxX+zyJJuNefKQN9DnzzvFeTkdlu9M0Tn7z+cYU0n2bmrgMU6iQoew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AL7Ux6x4;
	arc=fail smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB12606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:08:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFB12606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AL7Ux6x4
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-823b938464fso2009207a34.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:08:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794388100; cv=none;
        d=google.com; s=arc-20260327;
        b=hJSMiHJYVVo6zRzCIDu4GYMj/FBRELw5xzH0AZLjEC82FNKBrI0lQRwOjewUgCs750
         Li09fNOaA11/mS321ylz6U8VRP5jElsBkBMqJgXVjf9KW7/wUpQf6udhOro18e0Hae0O
         CPpVx+xvrU/MTvSQNJasOUaylxED5UeimjHe91R+rZV69br8K2eY6eTkSua2ToBMQKq3
         8nJ0gO9soktA9mABHjVJ+h8DXl3rjqXm6e9tru5SVAGxKOpx/Ydujw3juI71IoJvOFGc
         NTUP9gRlTaWDjsfOVQ3wmIatLjkFqMzjg5BB5mEaZ/UgNOj9f7+hsNRvo6+dBGzhrk6u
         yV+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/l2T4p9jCPLPtTUGGPewfdDVP0Og2K5VK9xJnKL6jZ4=;
        fh=77j5W8D6y1ifk/JDeHhT6TF/flE6a+eNBQG6KJ0Mqy8=;
        b=Lj79Wfe7sx194/2GB5D3Zznq1vQRfASH+BDCVJNQFxiy4C3F3LaooM7gO75wPWTfCx
         rsx23acDBhkfK0sE716Q7XqHDiCpFPOKJ6EvDRcJTHRb6f0Sc5+6D8ueDfd22NEW2vgT
         NX6EQAzPHhAdJvB8lDSW6t2lnJTHGYhsDAGT3uPDYlidausYDWoD72sdf2qI16GHbDcE
         JpHOQ8uN6d7QzHMe6sxT5ID8GfeolCYr+GM2U8J5TAZhBObLa5GmliURAkUaclm7z6aj
         +Cj9Osup5vBRPmbTCeEpNk0MTGfJidQ5rR7oTbxn3T1IJ8VkC69F72UKNcWLPMk3ZcYw
         hqUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794388100; x=1794992900; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/l2T4p9jCPLPtTUGGPewfdDVP0Og2K5VK9xJnKL6jZ4=;
        b=AL7Ux6x4ip6rFzYdnmZzpTZruFrBi/tmi2O32NjvsCi1areQq2rhMCzynqpCv98H7a
         umHzge6mEBjWcY6Eni+wB7y++iWqUVjSmTnHqfVsB6M9DscVKGiegKkyoKoAtBZ2UkEE
         30Et8RY7qNnRuffk7BPRpJbt7j6D8df750SgHA8s0WX1bLF8+FYDE1nfa0/NZ2VFTAfH
         e10oDV5I1pmbNECEa3YDmY13aEiLq/LRDyYtKEMmnZoKjxj2o1qPLZGOfZP+nFWzyD8n
         wyjAERxIXd518dGg119g9WUeeBlKJQ/qXYMzGFcCNw5kYuZYruMt9LZvdIKHwSrEtu5y
         VSlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794388100; x=1794992900;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/l2T4p9jCPLPtTUGGPewfdDVP0Og2K5VK9xJnKL6jZ4=;
        b=ScV7G8F/KFKq6AlvOOE5OcE3nvdkQWBtGPENF/p8J/1Adrn2LyonLwa1IL+YkroMhw
         t63+Go6FL3vn614OwlBLszN/T+69XmbI5uw1iY87jCXDrP0M5yF/G38zT42VT931/Bhz
         7+xHEtWOENxHhCj7yMTeeoEqbTwwho+wMnnZqHMN2KOgApH6D8o+/3iujYgz45zcM2Zi
         ZIuCpMYTaWCxSjijIsSTgdTzMrFkab6xMOrjnjO9JsnN2QV1NZD3FT3lnIFWFZot8bHS
         8D6d+ACo0MyHIDnTWpFoGDYVWGeln+rwqsQ/9QP9rN1csCVtgB8m5m3pZsFwntjZ7dVT
         AlVw==
X-Forwarded-Encrypted: i=1; AL+hErHgGFwEi81vZpTjBPSnatnLbENZCrIfzqp/YNZdjbIgyqnjblUGVpaV/mzqG6LPiqspChLkrMDCqcVOyiI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PbHY+ESUGOJH4ZtXdOt1hCkVkBVRhc6M+I6FC9KBOsDGXAmBf
	dokPBpTDVyiTdBhKKZWuSFwmCxzXEmn9qu/+IxfpnLwu3aGBd3SeYel20xQPkZ0sDUPz3KF6w4X
	OCpGqiA5rvVa9wy1uHAcHYBzFmkko9qc=
X-Gm-Gg: AYBFou3tsegPMhkE+GbO0fueLK7fqkX56Ga7JxB22PcyrT1CuOPvQ3ODr5eJvijurBx
	3HVMqB55UndY925Fhdba42hF+MN3ae3bHPTQtLUtGaPU+/iHwNgjE4cdVUhpqJ7e/LKbfO2r7MW
	075j0xnYJ+a3JhpTheFO//HsjtsLMiFwp38VRQTD+KPpCetrMagOiUWoIMuGv0/pfjAe/S7W+lz
	faCCYXaUyIBnumKtdkxPN0tfCJ+olbyMi0NRtdG/khwM5cgSWLwoA0Dgbsh+OsEtMKnxx1RqW40
	lgSjW0UVzI8MfE9yK+7NtjaxJjcxjFir0BxDa3ei6HUa61eTTMBYAqPCIF+QcxlM5XTXy7/tP6O
	kycT+RvH6CyUbBd+hUDEJPKLsGVuLELj37VhZDA==
X-Received: by 2002:a05:6830:438a:b0:824:e29:e00e with SMTP id
 46e09a7af769-860f287b5famr1402960a34.20.1794388100515; Wed, 11 Nov 2026
 01:08:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-yv4-remove-ff-nodes-v1-1-aa707a9577b7@gmail.com> <4d149414902c2e7d2d8cbfb2cf741f6e6b21add0.camel@codeconstruct.com.au>
In-Reply-To: <4d149414902c2e7d2d8cbfb2cf741f6e6b21add0.camel@codeconstruct.com.au>
From: Eric Yang <eric.yang.wiwynn@gmail.com>
Date: Wed, 11 Nov 2026 17:08:09 +0800
X-Gm-Features: AclHuK9PoMNLsTgMB1BxJw0pLV5rr9HNmObTBU7Lyh86uA-154BvlF3_R020LyE
Message-ID: <CAFme=rkf7Kgvv2DjLos8EbLamqVzcHMUWsUQb-ZRmeMWjWZ-mA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: yosemite4: Remove Floating Falls board nodes
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>, patrick@stwcx.xyz, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	Sean He <sean.he.wiwynn@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Andrew,

Thanks for the review.

On Fri, 2026-11-06 at 15:46 +1030, Andrew Jeffery wrote:
> So the expander and EEPROM are on a pluggable board?

Yes, they are on the Floating Falls board, which is a separate board
that would connect to the Sentinel Dome through a connector. That
connector is not populated on any Sentinel Dome currently in use.

> Which "stage" does the devicetree currently represent?

The Yosemite 4 hardware itself is not going to change any more, and
this is its only devicetree. The Floating Falls board is not part of
that hardware: no system currently in use has it. This patch therefore
only makes the devicetree describe the hardware as it is, by removing
the nodes for a board that is not there.

> Have you seen this discussion:

From what I read in that thread, your concern is that a devicetree
that is changed to follow the current design phase no longer says which
hardware it describes, so changes to it become incompatible changes
against a boundary that is unclear. You suggested:

- sending only the finalised design
- a separate .dts per phase, with the common parts in .dtsi files
- for small differences, a .dts that includes another .dts and adjusts
  properties or deletes nodes

Did I understand your concern correctly, or is the number of changes to
a devicetree also part of it?

I would also like to ask for your advice on how we handle future
platforms during their pre-production design phases.

In our case the firmware is built from the devicetree of the latest
stage only, and the devicetree and the userspace usually change
together, so we would like to send each change as we make it. Even
within one stage, the devicetree can need changes because of new
requirements or problems found. A platform can also have several SKUs
that are developed separately and can be at different stages. We build
all SKUs of a platform into one firmware image with a single
devicetree, so a devicetree per SKU would mean an image per SKU for us.

Of your three suggestions, the second looks the most workable for us.
Sending only the finalised design would leave the devicetree we build
our firmware from out of upstream until the design is final, which we
would like to avoid. The include approach looks suited to small
differences, but the differences between stages on our platforms can
include:

- a device moving to a different I2C bus
- GPIO line names changing
- devices being added or removed

My understanding is that your per-phase suggestion could work for us in
the following way:

- The top-level .dts keeps the platform's current name, and our
  firmware is built from it.
- Parts that do not change between stages or SKUs go into a common
  .dtsi.
- For each SKU, the top-level .dts also includes a .dtsi for the stage
  that SKU is currently at.
- Each change is sent as a DTS patch against the file for the SKU and
  stage it applies to, or against the common .dtsi if it applies to all
  of them.
- When a SKU moves to its next stage, DTS patches add the next stage's
  .dtsi and switch the top-level .dts to include it. The previous
  stage's .dtsi can be removed in a later patch, or kept if you prefer.

For example, with two SKUs at different stages:

  platform.dts            (top-level, keeps the platform's name)
    includes platform-common.dtsi
    includes platform-sku1-stage2.dtsi
    includes platform-sku2-stage1.dtsi

and after SKU 2 moves to its next stage:

  platform.dts
    includes platform-common.dtsi
    includes platform-sku1-stage2.dtsi
    includes platform-sku2-stage2.dtsi   (added)

Is that correct and acceptable to you, or would you recommend something
different? I would appreciate your advice.

Also, when two SKUs have different devices at the same address on the
same bus, the devicetree cannot describe both. I would appreciate your
advice here too: is removing such devices from the devicetree and
creating them in userspace the only way, is there another way, or
should this be avoided at the hardware design stage?

> This kind of verification isn't terribly useful?

In v2 I will leave that paragraph out and reword the commit message to
say that the board is not in any system currently in use and its
connector is not populated.

Thank you for your time and for sharing your perspective on this,
Eric

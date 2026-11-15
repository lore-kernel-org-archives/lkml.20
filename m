Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794760141;
	b=Oc13lDww29z2JAATxrKU9yRR3wwLw/aRTtA2AKjDG6/9yhdQUpIWVLzd2Bm4xWp+iw9Z
	 EI4lwQaDkEDW0J4rVYgbgpjuMkG4L95qJj0kvNuWUkhMA3Ql3w16NoCW+iwCPBT0NTDmO
	 2mrxdV52XYNoi0+NUm0ItLskX84v6ZWDd9fQNFgIe39JP9MwBxqwHYcCUPlTGcmbOKxmu
	 pQ4N3rr/bBYSaXoAiajJm4hecGA9MOfZk/9gUUu+dCHxXNJJYmu8/Z5MmESrNZWTxiiRY
	 tNNZwgLKrJRKJlhBl/GAPIwlbUdRJorMbVeoM2Lqk5Jqm0nim08mpTpu10m3jVtM2+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794760141;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=TMRcIs/5v6+65U7WavbNtglnS++8zAm5WMPxqy+BIL0=;
	b=GWoc+VoO7Ll1uHk9zr581INsaKRbmuenAs4mlJ4pCEAX1wscN92i/0EmOba7xvfvxgn8
	 NCDlIpZrWbancrHG8PTQBZuXEcq7+hMZvTIUzv6By6+2ubtf7BzFJA9GY6Z2uvx1m4ZD4
	 tgBc2XpBUv4KmauKqkO2VbMvpMJg3IkGpUcbgkc1lz3v4QRHIVlLIeM7FiiVcyo0m9+bt
	 o0IjNCSfzcT5zOEh7GRL8m1k4ES2ljg4bqTdrxkVY7i5jL7vWPR5lqHTPOOgCKkvpmQIS
	 BMlewFo43cQbZsnOuP7U4T4PzRotbPrJTgDOQiA7HcBlRbZxclmwIWAPEMkynjod/vQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="PKyR/Jgp";
	arc=none smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C12606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 16:29:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11C12606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PKyR/Jgp
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-55d2b4a99d4so8963611cf.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794760140; x=1795364940; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TMRcIs/5v6+65U7WavbNtglnS++8zAm5WMPxqy+BIL0=;
        b=PKyR/JgpCFUsrRYfOvT1HmcEnpLqZNC25bM+Eca/7XzvIQhoal5gMMnmRwObbm8FzI
         oZwq8azPUC/ciGa8IxvEralb+SasdvBpqP78+DKexH7Nwwo8ZsdvP+sOImiuOx5nOq3M
         n2fuQM62hJWN6nAvHDp/EbKuts4HZIahg7ZtTgdjXWXNRRW0gRtGQ1bzX3C5v2EHDG+I
         S/veLDjns7AplNd4VRMhH69KdVLAvcVqFSBPwYN2qc0s8KncXPVWzNWVpebl7gt6C5IZ
         bmiK/Ih3uBEwI7qkSTB5Zd+/gNvPlhGOMcdHvZ8+ZBvVdq0p9x5ppnsWEv65YEvuIV88
         VTzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794760140; x=1795364940;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TMRcIs/5v6+65U7WavbNtglnS++8zAm5WMPxqy+BIL0=;
        b=imZdjYgv2vgvkxsi9+Tr6EUApRlHv0RtZJY8c6AWhbDWmVc5go6yFhaBi791DoPbeg
         rCjnlJYkIHa9YE2jgOABr9qDSbIvUfkRXZ8nQO3BcavVSEt1EzQIA7hWRBAqvsop2BJc
         viFhyNOKwr2N9YvRv7VlwOx6E80G3OKeFnMCXsSEcr/eYHlbFWh9xxCqtHVTDxmn+IkK
         VHxNTy2gDbSwrnrA97vc9IOq1Y/Qwl+MxoSWj+f/wIvR8TTxDoLTBVNZ1UemvIv3/l/b
         0pfHEyFOiSnslDZEwi4dtznwTFNT05NyzGsUqzn8yxIZDkZzkpowBOi1mJ75X6meWhfl
         iQqg==
X-Forwarded-Encrypted: i=1; AL+hErEeoZhIvdCW8Zg1RSOQK5xskwRqIfhLkO5tR02K8Diz01Z0O9iOthzpJ7+g4KZnn1qUCA2V+s5WlxpM1vI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3E3tHE6mtuyReUPB4559AgWPATugqRBBmnxqkSVOyHRmf9+gR
	Xd38T0VrA+oE4YtNzwQFBOgvldaLh/Y+fIOA95z8XLbL9OdTPSDR62YZ
X-Gm-Gg: AYBFou0GhiB4d5O7c4sXJZFEtittEvKLIx5qorKKvsIku+M1b5bgGdtmAuYvU4HPdCO
	IzbOkM6mGl4KfGgkN9E/66/9SzP6l7pI38b9tfcdOhh16Cxpv/u1TFiLZENUiGIhcXbrC+H+vRI
	ERuhJH1Sr6kYYHszdVYfZh4OFDBWLuBrVC8zo71tVveHCE6mDl8CAD4wWl0T65V4D/kuXRDd7Up
	GaVGmmu/tHAzUDq/HjZsMx7o8M6JGP8jwhOeBq1xo7AoqfkmzIXsDUClV9C/0bsogwNR3h15oA9
	D6PYmNom3kt7yzVk94sZIPUJ8IhaqEE1+LeLzYkVfiFiQ+Ca8/IWUDb27nS1ph/g9HtZ8hI3i2m
	AqxMorpWI8cDN9x1AY2k2ZsoQHT4CY3k4lCYxnaNPLT83qguiC4jwHqC2+s2uPrVHpD2A43OH8q
	gXBUXTvGYNjqtdfS1HgBjoUCcn1/sldVAFWGW3hIfRW/h0fQxYUheWJ0/EXPrq9OZMu1c0wfgZK
	Tr8VeHkAxIoizZQxsjw7H/IwpAYMQd6fhlrtHUjeiSbnIRGpTKhu5Pyj1aJ8+fXA3hqRvULxoTg
	bxcMb4xFAG7V4o4s2ro8cSJX1TUJv0Cute87G5t9sh4/AlMgg7d03M+f2/7V9b8MauPajDj+W9e
	3jt0Ott0+m+PMEhxU+DYKiUiUw9NmQA/O3wtvHz93EIrwWIZVDMj3
X-Received: by 2002:ac8:5ac2:0:b0:535:1fe4:64df with SMTP id d75a77b69052e-55ac667df71mr138520351cf.12.1794760139843;
        Sun, 15 Nov 2026 08:28:59 -0800 (PST)
Received: from ?IPV6:2600:4040:5abf:f200::9dd? ([2600:4040:5abf:f200::9dd])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55ad15eb7basm63744721cf.26.2026.11.15.08.28.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 08:28:59 -0800 (PST)
Message-ID: <b92385e0-d39a-430c-925e-93dd978769dd@gmail.com>
Date: Sun, 15 Nov 2026 11:28:58 -0500
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
Subject: Re: [PATCH 2/5] arm64: dts: qcom: sc8180x: Add Microsoft Surface Pro
 X
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede
 <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
References: <20261104070441.74127-1-val@packett.cool>
 <20261104070441.74127-3-val@packett.cool>
 <64e7afd3-50e5-4134-9bf6-92c4aa740bd7@gmail.com>
 <4a7e0f27-60b6-46ec-956b-8897812622a2@packett.cool>
Content-Language: en-US
From: Haipeng Lin <jimmie.lin@gmail.com>
In-Reply-To: <4a7e0f27-60b6-46ec-956b-8897812622a2@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/15/26 3:20 AM, Val Packett wrote:

[...]>> Would it make sense to move opp-3072000000 and opp-3148800000 into the
>> shared sc8180x-microsoft-surface-pro-x.dtsi? qcom-cpufreq-hw disables
>> all DT OPPs first and only re-enables freqs present in the hardware LUT
>> so this would work for SQ1 and caspar.dtb will cover both the SQ1 and
>> SQ2 Wi-Fi models out of the box and carina.dts won't need its own
>> &cpu4_opp_table override.
> 
> I'm pretty sure mine *did* complain very loudly about having these OPPs and might've even had broken scaling.
> 
> I'll retest again, if it works I'll move it to the shared dtsi (or even the SoC's?)

I like the idea of moving it to the SoC. Did a test on my SQ2 Wi-Fi
with opp-3072000000/opp-3148800000 moved into sc8180x.dtsi, dropping
it from carina.dts, plus a dummy opp-32256000000 above my LUT's top
entry so I can "simulate" the SQ1 situation where there's a DT OPP that
the LUT does not have. Booting that with caspar.dtb:

- no cpufreq/OPP messages at all (e.g., "Voltage update failed" or
  "failed to update OPP" as observed for caspar.dts in this v1 on SQ2)
- policy4 scaling_available_frequencies tops out at 3148800, the dummy
  3225600 is disabled silently (by qcom_cpufreq_hw_read_lut() ?)
- under load time_in_state shows gold cluster sits at 3148800

Hopefully, this solution should work for both SQ1 and SQ2. sc8180x.dtsi
looks like it tops out at 2995200, and that is SQ1's bin above the
"regular" 8cx Gen 1's 2.84 GHz on the gold cluster so if it was broken
it would already be broken for the 8cx G1 due to the SQ1 entries...

[...]> 
> BTW, please send me the output of `sudo fwupdtool hwids`, these are needed to add support to dtbloader/systemd-stub/stubble DT auto-selection.
> 
> (If anyone with the cellular variants reads this: you too :))
> 
> 
> Thanks,
> 
> ~val

This is not the latest BIOS which is 11.504.140 according to
https://support.microsoft.com/en-us/surface/updates/surface-pro-x-update-history
but I don't have dual boot to update it...

Surface Pro X SQ2 Wi-Fi only:

Computer Information
--------------------
BiosVendor: Microsoft Corporation
BiosVersion: 11.311.140
BiosMajorRelease: 255
BiosMinorRelease: 255
BiosReleaseDate: 2/03/2026
FirmwareMajorRelease: ff
FirmwareMinorRelease: ff
Manufacturer: Microsoft Corporation
Family: Surface
ProductName: Surface Pro X
ProductSku: Surface_Pro_X_2010
EnclosureKind: 9
BaseboardManufacturer: Microsoft Corporation
BaseboardProduct: Surface Pro X
Hardware IDs
------------
{bf87a823-6823-50f1-9f18-2030fd86b087}   <- Manufacturer + Family + ProductName + ProductSku + BiosVendor + BiosVersion + BiosMajorRelease + BiosMinorRelease
{43cb3df2-05e6-5637-a89c-718381284f3d}   <- Manufacturer + Family + ProductName + BiosVendor + BiosVersion + BiosMajorRelease + BiosMinorRelease
{1d2505b3-3329-5a15-b934-e1990787e978}   <- Manufacturer + ProductName + BiosVendor + BiosVersion + BiosMajorRelease + BiosMinorRelease
{75b4817e-50ec-5e63-a904-1175cd1abff6}   <- Manufacturer + Family + ProductName + ProductSku + BaseboardManufacturer + BaseboardProduct
{cdf510a8-d41c-54bf-b2c5-61ba10957019}   <- Manufacturer + Family + ProductName + ProductSku
{cc2bc434-a08a-59c0-85ac-2576ed611de6}   <- Manufacturer + Family + ProductName
{69c2fd0d-8593-575f-b6af-5f70f0299ea4}   <- Manufacturer + ProductSku + BaseboardManufacturer + BaseboardProduct
{aa2c30e9-117c-5aeb-a8aa-4b01761cf493}   <- Manufacturer + ProductSku
{b07028e2-19c1-577d-a3c9-2eabef35c2a1}   <- Manufacturer + ProductName + BaseboardManufacturer + BaseboardProduct
{5d018db8-6de6-55f8-8d8b-4b773caf8450}   <- Manufacturer + ProductName
{db7e6e61-56bf-531d-b594-e4b1660d04aa}   <- Manufacturer + Family + BaseboardManufacturer + BaseboardProduct
{ca2e5189-1d32-509f-88a0-d4ebcc721899}   <- Manufacturer + Family
{aca387a9-183e-5da9-8f9d-f460c3f50f54}   <- Manufacturer + EnclosureKind
{f199ec04-d0d9-542b-b035-209532a4d1f6}   <- Manufacturer + BaseboardManufacturer + BaseboardProduct
{cc0aea32-ad2c-5013-8bed-cede6be8c9f4}   <- Manufacturer

Thanks,
Haipeng


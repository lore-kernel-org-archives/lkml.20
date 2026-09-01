Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBF847D94B;
	Tue,  1 Sep 2026 09:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788255666; cv=none; b=d5Km2zk2buPmo4dQAPSserXrk9iciePJ7Jr8RYLEOYhw4S4s4pkPsrQIMVPhx0avt6XozMqtk1dsOuKwpDL3lfMXqW87Euno8H6dE7b4VrN6e+soIODOpfoRhTTWA8cGKFl/esX5Wb8po22Nbsh840vGgkA1+yuUsjuWLPOS/SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788255666; c=relaxed/simple;
	bh=fR4E3wsARI1w2gb71VPhpglPlxt/SQnuehWv/DFvrVM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qDcr31J56stKLlsqMSp1fE6N7YJpIg+ARzTttTgT4qaaNIyq6hIL91IOBHzVIH8y2ePsKeSMBu4xO4YaCrzXSpGMUP2F2FqZy+Jt6zvmGKLowgmvtfYzTO9kVOXM6gMk3jyJTUTdrfAfWWAmbl5kwuBwc2liik/0ywMmvsEQ7wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y8FZmP8S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y8FZmP8S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A4D41F00A3E;
	Tue,  1 Sep 2026 09:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788255649;
	bh=mrdbPn5g4KWTIRCTOMc9dnD5O7PBdloYDk2yNJfLDUQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Y8FZmP8S0oTpR0LUJhEqkaLouko1cWU/+ioznyq1jl/2lMtjmoE9mlAEciqEYk9zq
	 BU7Nbt4zCztP169slRWwj6F6AK3lO8X78mRICetZ58LuDRd3E+g4VxSA79vMxZai21
	 Eaz/mEDFOG0OVr+2V/lrPsxcjKJpTB6urn1cuTWcTJgCyYaWyudEd2m3q/x9T2Qt6F
	 S8yG0Cprhm55F4ndHAkATAU80S0bnmJD0152HAUI6obsKoZ7IvD+akbxSKp5wwER/F
	 1u7J7hFN62AuNABDyk+1VfmZUmVpwuC/LDllBO4gHfd0HjOvLbEQ20yEas05zbTzK9
	 gG3PjlIThh0pw==
Message-ID: <e2365307-32d6-4ef9-9919-55ba69786741@kernel.org>
Date: Tue, 1 Sep 2026 11:40:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-check-style: Handle indented fragments in
 indent-consistent
To: Sven Peter <sven@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
 Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, asahi@lists.linux.dev
References: <20260830-b4-dts-check-fix-v1-0-e7c1b2774730@kernel.org>
 <20260830-b4-dts-check-fix-v1-2-e7c1b2774730@kernel.org>
 <20260901-platinum-dalmatian-of-intensity-b18743@quoll>
 <8e3633ca-6e82-4c2e-b441-adeac02d3eff@kernel.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <8e3633ca-6e82-4c2e-b441-adeac02d3eff@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/09/2026 10:49, Sven Peter wrote:
> 
> 
> On 9/1/26 10:22, Krzysztof Kozlowski wrote:
>> On Sun, Aug 30, 2026 at 08:24:55PM +0200, Sven Peter wrote:
>>> diff --git a/scripts/dtc/dt-style-selftest/expected/dts-fragment-indent.dtsi.txt b/scripts/dtc/dt-style-selftest/expected/dts-fragment-indent.dtsi.txt
>>> new file mode 100644
>>> index 000000000000..84ec8eb73468
>>> --- /dev/null
>>> +++ b/scripts/dtc/dt-style-selftest/expected/dts-fragment-indent.dtsi.txt
>>> @@ -0,0 +1,3 @@
>>> +# mode=strict
>>> +bad/dts-fragment-indent.dtsi:9: [indent-consistent] indent mismatch (expected depth 2 * '\t')
>>> +bad/dts-fragment-indent.dtsi:10: [indent-consistent] indent mismatch (expected depth 2 * '\t')
>>> diff --git a/scripts/dtc/dt-style-selftest/good/dts-fragment.dtsi b/scripts/dtc/dt-style-selftest/good/dts-fragment.dtsi
>>> new file mode 100644
>>> index 000000000000..58735112d3aa
>>> --- /dev/null
>>> +++ b/scripts/dtc/dt-style-selftest/good/dts-fragment.dtsi
>>> @@ -0,0 +1,19 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>> +/* Include fragment indented for its inclusion context. */
>>> +
>>> +	bus@10000 {
>> So here is a good example... and this is code is wrong.
>>
>> You CANNOT have MMIO node outside of MMIO bus or a new node outside of
>> root node indented with one tab.
> 
> Fair enough, just ignore this series then.
> I'll just do the whitespace fix then and un-indent the -dieX files for 
> apple which I think should make them pass the checker then.
> 

I see Apple DTS two soc nodes, so overriding/extending by phandle is a
bit trickier, but this should work in t600x-dieX.dtsi:

// earlier macro (or however you concatenate these)
#define DIE_NODE die0

&DIE_NODE {
	// here goes stuff with original indentation
	DIE_NODE(cpufreq_e): cpufreq@210e20000 {
		...
	};
};

Best regards,
Krzysztof

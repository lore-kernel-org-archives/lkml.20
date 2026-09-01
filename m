Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3B24772A2;
	Tue,  1 Sep 2026 08:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788252550; cv=none; b=Puj0vdJef8WPON5yLAueyrWR2zLY918yPaZ3+hgpoGMLU+GjC5tGDuxQe2LTxX85bWxA9UfHJvSkdu4cGGySfOp0dBY8vk/Bcu+xGWsTtRfx5PLHsI8FXwuHpA92mfT6e0yK9uj1Hmv5qDuVnJ5nG90+tyApYIaALwWd423aYOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788252550; c=relaxed/simple;
	bh=BAaJKs/MsSUfw3bKxCSKef8r2tUVBE6DhtfuTs/AAUg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JnrEEwTVL3Kk7hVS4rrfY4k8KlMDcQfsYFPC9mtSFGif/EsMwzsGXSJxYohFfq9iSFwHOX1bzznEJ2y7SGmfO65yfdj6t9P5ppPf9W97TdC0AIWbaarlnRTvkpyCmHsIQ4pfpmGwrlAdXoRoh8ThO+cBcVrNnYpEhK96M7qmAFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cpThLpME; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cpThLpME"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C6E31F000E9;
	Tue,  1 Sep 2026 08:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788252548;
	bh=RDrCUHp86k6keyJJMl9083cG2tyxbKuBSwQQaJ+bpS8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=cpThLpME+PX9SfzJ8ufHXpVmFwReYZoB8qn2UTJuqz21v23OW9CiJ53oeEw5BRhXt
	 F6qE/r0oQQBqOz5HCpv898QgsKyj9cGNPvUn1k1aZYbydQRYnYLphBDoTIZ8OZK29r
	 /dulnbeAZMQpUl89Q1QI617eDb6vIOSOY2waCRKx1gVj8pSEGKN2QM2NF8tCLpth4Q
	 vLUoxBbvsKruStcFQhSL9j8gJdLDPQkrNRkNNZcuj9EWW0O2++s6ZMTXF4n3a2Ya4v
	 V5+xneECDqqbSnWGJx9fSyM0Vr3tjOcWMdu1NQUB4T64bP+cZ7vS2rbx2GAEIhQnoY
	 WlkHXWl7DG6GQ==
Message-ID: <8e3633ca-6e82-4c2e-b441-adeac02d3eff@kernel.org>
Date: Tue, 1 Sep 2026 10:49:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-check-style: Handle indented fragments in
 indent-consistent
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
 Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, asahi@lists.linux.dev
References: <20260830-b4-dts-check-fix-v1-0-e7c1b2774730@kernel.org>
 <20260830-b4-dts-check-fix-v1-2-e7c1b2774730@kernel.org>
 <20260901-platinum-dalmatian-of-intensity-b18743@quoll>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20260901-platinum-dalmatian-of-intensity-b18743@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/1/26 10:22, Krzysztof Kozlowski wrote:
> On Sun, Aug 30, 2026 at 08:24:55PM +0200, Sven Peter wrote:
>> diff --git a/scripts/dtc/dt-style-selftest/expected/dts-fragment-indent.dtsi.txt b/scripts/dtc/dt-style-selftest/expected/dts-fragment-indent.dtsi.txt
>> new file mode 100644
>> index 000000000000..84ec8eb73468
>> --- /dev/null
>> +++ b/scripts/dtc/dt-style-selftest/expected/dts-fragment-indent.dtsi.txt
>> @@ -0,0 +1,3 @@
>> +# mode=strict
>> +bad/dts-fragment-indent.dtsi:9: [indent-consistent] indent mismatch (expected depth 2 * '\t')
>> +bad/dts-fragment-indent.dtsi:10: [indent-consistent] indent mismatch (expected depth 2 * '\t')
>> diff --git a/scripts/dtc/dt-style-selftest/good/dts-fragment.dtsi b/scripts/dtc/dt-style-selftest/good/dts-fragment.dtsi
>> new file mode 100644
>> index 000000000000..58735112d3aa
>> --- /dev/null
>> +++ b/scripts/dtc/dt-style-selftest/good/dts-fragment.dtsi
>> @@ -0,0 +1,19 @@
>> +// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +/* Include fragment indented for its inclusion context. */
>> +
>> +	bus@10000 {
> So here is a good example... and this is code is wrong.
>
> You CANNOT have MMIO node outside of MMIO bus or a new node outside of
> root node indented with one tab.

Fair enough, just ignore this series then.
I'll just do the whitespace fix then and un-indent the -dieX files for 
apple which I think should make them pass the checker then.


Sven


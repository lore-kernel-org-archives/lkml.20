Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794831743;
	b=bAef5fuc9hQyiPq2mCREPt2VwiHW0cEJgxqCPqS7SpUEqX+vvswAl83ER6RGBLRDgsNd
	 AXOzNb1Ei1SAOFvKNI/BX43WfEenwFzD3HKw30hC00QyKMNLc+HdxIYnKX5w9HGFuhvpu
	 u7LVkCHzpq3k1ueNCQelqdO7fBq6Js0pKvF1e59+TfaRZ7ZsrCQXKgQyI4Q/OyfPpn6bH
	 nKNWhWUcj3KQMZMXERzlrtL2k/TkMei0UmITLUCmAKe9fEZQFPaqHVXO9tlowirrrCeLl
	 9jeSsl6VSUo5jjJN0pKQKHfo8ahAL9FW29o02+aLT4mRgDePYXQTbbaoAHniQBFJSlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794831743;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=tJY1c31l5d6ee34HGatBDQMQ/oxNBle+BQO9LaXQVgU=;
	b=k1EfY2iWnoqMcECQOuqHzlpMetKQWA25WeTKIJR1CGE3KYo2771BYsuNynEAUrASRFrK
	 LDD/yvF7hJoSCA+DHzGrtNeTJttxsFEtjtPDCtGBfXo8aWOMqeoIXXnl1W0OQYxT0MuNl
	 WN5Azt/jBaYZiGapPe+PPuFr8KYg0b+fSs7k1JOpuVR4qexma4PIuonkWWoMNt1H+3g1Y
	 qjr55CAUEjJaYtIR1V0cmG56WK1jq7RQTrqr6TKP2g+kMnL3LsD8JzFreau5byqY42l+A
	 sbX1OEaCZQJx+9hROIRbW7BBL8dNax3LcO1qrxTVUy9F+1bpMJVYncyZmPw2mzC8lfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m5w+Wflr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8AAF606A31C;
	Mon, 16 Nov 2026 12:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m5w+Wflr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81D291F000C5;
	Mon, 16 Nov 2026 12:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794831743;
	bh=tJY1c31l5d6ee34HGatBDQMQ/oxNBle+BQO9LaXQVgU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=m5w+WflrvbyCz2OI0kEkVza1NdxBxDjPkd9aWwr8spi/tHNw/f9ytqiczDvj2Fk4q
	 9JnsLZNDLwX3WVWDAj2BlffpbOrOg0COChi4XTH6WaEi/YBkd9/QBoU086BgTqD/c3
	 VkgmMHSFv0zjnkhzFy/Y5LSHIjZCWLQjrgaC80JSP3vrJWcBlo/GzHhfh7rZ05cPV0
	 Km1NyNVFjTMFrlQLksQW9qpX3DqvmYF8FKtbkTyiolQbxeJbDVl+1E+sDQVBLbQ/Xj
	 rD9D3uvGcPehMXcgFXp/XjFYBq696nhn5K7JOwqv4Ak786cKya/0vhiEQBpz24aGf5
	 UeBe/kM/E60Qg==
Message-ID: <a96974a6-fc56-4e05-be9e-9eb3776cc4fb@kernel.org>
Date: Mon, 16 Nov 2026 13:22:12 +0100
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
Subject: Re: [PATCH v4 1/4] dt-bindings: soc: ti: Document the
 ti,tda54-mcu-scm-conf
To: Moteen Shah <m-shah@ti.com>
Cc: conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org, nm@ti.com,
 ssantosh@kernel.org, u-kumar1@ti.com, gehariprasath@ti.com, vigneshr@ti.com,
 afd@ti.com, a-limaye@ti.com, y-abhilashchandra@ti.com, johan@kernel.org,
 kees@kernel.org, jm@ti.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261112091027.1601122-1-m-shah@ti.com>
 <20261112091027.1601122-2-m-shah@ti.com>
 <20261113-fancy-trogon-of-saturation-16fc66@quoll>
 <699420d5-28b8-4238-8fc4-3a4e762265ba@ti.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <699420d5-28b8-4238-8fc4-3a4e762265ba@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/11/2026 12:33, Moteen Shah wrote:
> Hey Krzysztof,
> 
> On 13/11/26 13:26, Krzysztof Kozlowski wrote:
>> On Thu, Nov 12, 2026 at 02:40:24PM +0530, Moteen Shah wrote:
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  ti,proxy-id:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    minimum: 0
>>> +    maximum: 7
>>> +    description:
>>> +      Proxy region (0-7) through which this node's clients access
>>> +      claimable registers and their fault status registers.
>> Partially continuing discussion from v2, IOW, device cannot access
>> entire address space and you need to limit the address space to specific
>> window of it? At least this is how it looks in driver code.
>>
>> This looks like the MMIO space is wrong. Listen, if you claim that the
>> DTB represents the host (or VM) view on hardware and based on that you
>> add proxy-id property to restrict the MMIO, then why do you claim that
>> entire MMIO is correct for this host (or VM) in the first place?
> 
> 
> Thanks for the review, I got your point.
> One thing I wanted to clarify before sending a revision: a nonzero proxy 
> sets a bit in its CLAIM register to claim a register but for proxy 0 it 
> shouldn't be doing that as per the hardware. If we choose to use proxy 
> 0's reg window we just have to check if any other proxy has claimed it 
> previously or no. Are you fine with having a property in the binding 
> something like "proxy-0" or alternatively "ti,claim-required", because 
> the driver won't be able to makeout which proxy it has the view of.

Dedicated property for proxy0 is fine. Maybe not calling it proxy-0 but
express that this one is shared with others so first you need to check
if it was not claimed.

But OTOH, can't the driver make the claim if if no one has claimed it in
every case? IOW, why for proxy1 you take the claim unconditionally, but
for proxy0 you check first?

Best regards,
Krzysztof

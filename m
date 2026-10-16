Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABAE347FCD;
	Fri, 16 Oct 2026 14:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792160725; cv=none; b=AeFNjNx+6b6REd9S/MeQHfvbeBvJQcsPcpFkGV3HBeGU8PgBs3LTE6QZfv01hCJfOMRoy7sZ21DM7OlotDdKfFlW13PHw4ozPz/lI376DL2Arp+2zixcexn1jNZRNRGGi+9UBmDoGyqa09e+l7QF48VAEFiI8aQmYbZJf9DhHDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792160725; c=relaxed/simple;
	bh=EysSUdJPxlS8YP09my+uwmWYfTgJfrU7QBuE1ymYreo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hk8b1Nlf93SgGnK4RxNHGx+6rHYgAsB1Pg4r37d1vbW1R5QwRTY4fnT0rHSgc7M/Ef4LbFSoAJNTV+3Wt8LRcD83ppSEKmTkpVIIrW8iQMivXOGp/Tkf700PYGFEvtiNLmYi9OqrbFnOn/IVYgPMj2HcdzE0LN0Ior87HMv4f88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fKhad+Ol; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fKhad+Ol"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63AB71F000C4;
	Fri, 16 Oct 2026 14:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792160724;
	bh=plgMHerWPW7I9eXv3sbhNq9FoI1DwSKA4wzGvrzGk2s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=fKhad+OlNs4nT68tu1Ub5/VDcj+taHCRUeDM5+z+adtKERXcJMJUIquztDHnNEek4
	 xYEFa1rxbO+kKfaFYkCEngTY04Ok4eHVh59U7FADPr2BZkd+8WwwR1YiHHiGL0t+GE
	 16ol6nunIDgLL7hjN8N9c2M9EZfQxxOlxBWIuavdB/BmSYErp/Yrk54TUUKeh+wIdD
	 BcrbyGDCX8PIXaLLIi3ZwyOqxLKmTi8ji8v7yLZaaGJ8TWe9oPloIjrtRMgRN7nIyB
	 EA5zmAOndEVRL5/enM91x0dNoZ88TQ/J9OCmOfqSxgn9b4ztT56+Pt0z+EC3D+WA/C
	 6zQHjxOIDPz3w==
Message-ID: <34c65b1d-a389-447b-96f4-e2a15ee37f99@kernel.org>
Date: Fri, 16 Oct 2026 09:25:23 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 3/3] arm: dts: altera: add Draeger M48 CPU Module
Content-Language: en-US
To: Petko Manolov <petko.manolov@konsulko.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 arnemaximilian.richter@draeger.com, martynas.grybauskas@draeger.com
References: <20261015145804.3632839-1-petko.manolov@konsulko.com>
 <20261015145804.3632839-4-petko.manolov@konsulko.com>
 <62afc804-8a9f-42c0-93a5-8b0b7f3b84f0@kernel.org>
 <20261016123346.GC15187@carbon.k.g>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20261016123346.GC15187@carbon.k.g>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/16/26 07:33, Petko Manolov wrote:
> On 26-10-16 06:08:53, Dinh Nguyen wrote:
>>
>> On 10/15/26 09:58, Petko Manolov wrote:
>>> M48 is a heterogeneous board made by Draeger that is based on two
>>> independent cpus, that are monitoring each other.  One of them is
>>> imx6, the other is Altera SoCFPGA Cyclone 5.  The latter is booting
>>> independently off qspi.
> 
> <snip>
> 
>>> +&gmac0 {
>>> +	status = "okay";
>>> +	phy-mode = "rgmii";
>>> +	phy-handle = <&ethphy>;
>>> +
>>> +	mdio0 {
>>> +		#address-cells = <1>;
>>> +		#size-cells = <0>;
>>
>> You also need this here:  compatible = "snps,dwmac-mdio"
> 
> Thanks a lot.  Is there a way to send patches to Sashiko without bombing the
> LKML and, respectively, all of you guys?
> 
Yes, you can run sashiko locally. The instructions are in the sashiko 
project.

Dinh

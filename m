Received: from va-2-40.ptr.blmpb.com (va-2-40.ptr.blmpb.com [209.127.231.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD9733ADA0
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 10:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792232020; cv=none; b=D0uvm63qKUPTsZUPeTLAmNLwiHuDMresS8XEP1gGJg6iEpe8ov9G76QjL0Da4N0aMBDWfT6UIyi6nDFYTDPux3ZCZSn9FWewnGhfHQj2KeaXVjr3RaRKQIJDZRqgL1T32eCkfgLhrHYVbLI4K1nx/8sI0Rrz0okIpJXUbd6FWlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792232020; c=relaxed/simple;
	bh=GPZFSKaSQO6ijkNW2YtiCTlnwLD7iVefOOedFSfNETA=;
	h=Message-Id:In-Reply-To:Cc:From:Subject:To:References:Date:
	 Mime-Version:Content-Type; b=kiPYoiprO3IqShSGmwGyd8P6UzFtaTIs6NbxQ3F+MnXA+kKMzDhwVXXN3EZa3qb53B+GiUiC4+aOAwWV2wiQuOiikzX+u9apvk2dgEN5VrvLpCXHVDsOKFJJJ9uuYcctvCgnu3Uzn5Qy4lzUdkXlhzB5X5TtCSf/bUT5yo1g+w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=picoheart.com; spf=pass smtp.mailfrom=picoheart.com; dkim=pass (2048-bit key) header.d=picoheart.com header.i=@picoheart.com header.b=sLAc8YXK; arc=none smtp.client-ip=209.127.231.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=picoheart.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=picoheart.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=picoheart.com header.i=@picoheart.com header.b="sLAc8YXK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1792232006; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=OOYEfpEwMLQO0bPlTQu721mtf/5q4uehv1PDBQLDVZ8=;
 b=sLAc8YXKYd4YMon94mD82aqzPrkwixXpb9is/QaBRC0ytna+zwFEe10FjrhbhIwEvOuoQa
 S3vNwa8MtaUikrhJRTgPLG0ANnOto7WLqg7Wmr7SPZqSGmw8dh2lce/x7+pbMssl7DReds
 etgZH6EppJ62TMDRHqmPsnbC8ioi7B2fV0W0R7WBklHIkhy5MTyOtXWxJiZHwTmljY1hUX
 snfxLMMsux/gujiPg5JGFYzH7w5bx7i5lycN7PWWncKmGfSg3mErYpn6D4Tptjh6ksMdGS
 Flvu7p9N90Ctf2iRiYzLqjtBfTf5crmmEzrxfpyPyws61w2W2K+HNAOQ8bRR7w==
Message-Id: <f77689e0-91e9-4e5c-9185-fc6fb9394cc6@picoheart.com>
In-Reply-To: <DLLOVHIKRXPY.3AGBAPAM8F9WV@linux.dev>
Cc: "Sudeep Holla" <sudeep.holla@kernel.org>, 
	"Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, 
	"Danilo Krummrich" <dakr@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	<yang.yicong@picoheart.com>, "Catalin Marinas" <catalin.marinas@arm.com>, 
	"Will Deacon" <will@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, <linux-kernel@vger.kernel.org>, 
	<driver-core@lists.linux.dev>, <linux-riscv@lists.infradead.org>, 
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>
From: "Yicong Yang" <yang.yicong@picoheart.com>
Subject: Re: [PATCH RFC 2/3] arch_topology: Parse die nodes in /cpu-map
Received: from [100.86.216.62] ([61.141.241.117]) by smtp.feishu.cn with ESMTPS; Sat, 17 Oct 2026 18:13:24 +0800
To: "Troy Mitchell" <troy.mitchell@linux.dev>
References: <20260920-riscv-die-topology-rfc-v1-0-071c0bf61d5f@linux.dev> <20260920-riscv-die-topology-rfc-v1-2-071c0bf61d5f@linux.dev> <20260921-rational-frisky-jerboa-0f2ff0@sudeepholla> <DLLOVHIKRXPY.3AGBAPAM8F9WV@linux.dev>
X-Lms-Return-Path: <lba+26ad34a44+fac80b+vger.kernel.org+yang.yicong@picoheart.com>
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
Date: Sat, 17 Oct 2026 18:13:22 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
User-Agent: Mozilla Thunderbird
Content-Language: en-US

On 9/22/26 4:06 PM, Troy Mitchell wrote:
>> Where is the associated bindings ? Am I missing to check it in the series
>> or it is really missing ? It is essential to add any code using the binding.
> 
> I left the binding out to get initial feedback on the topology model,
> but I agree it should be available for review alongside the code.
> 
> The cpu-map binding lives in dt-schema. I have now opened a draft PR [1]
> with the proposed dieN hierarchy. The PR also links back to this kernel
> series.
> 
>> Also how does it align with ACPI implementation ? It is preferred to be
>> in parity here, so we need some binding there as well IMHO.
> 
> This series does not implement ACPI die discovery and leaves die_id at
> -1 on that path. I agree that DT and ACPI should describe the same
> topology model.
> 
> RISC-V does not define topology fields in hart IDs. PPTT can describe
> intermediate processor hierarchy nodes, but I could not find an explicit
> die indicator in the ACPI 6.6 processor-node flags. Is there an existing
> PPTT convention for identifying die boundaries that we should follow?
> 

PPTT describes the hierarchical processor information but except physical
package and SMT, there's no flags to bind the nodes to a real topology
structure. so maybe it's hard to choose one unless a new flag is added by
the spec to indicate the DIE topology.

may I know the target use case for this die information (as I see the same
question raised on the thread of the device tree PR)? IIUC the NUMA and
cluster information should be enough for the software to aware the
performance differences and the scheduler has already make use them.

thanks.

> Would it be acceptable to add DT support first, keeping ACPI die IDs
> unknown until that mapping is agreed, or should the ACPI mapping be
> defined as part of this RFC?
> 
> Link: https://github.com/devicetree-org/dt-schema/pull/208 [1].

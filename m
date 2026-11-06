Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793977705;
	b=LQCOetkSvr0MwyB78s+8QHaYJ6oW8YoIflgXcRDdeG+Gy9s75FrgIBOfod9Lb+oE13J9
	 ublbpWa/Ay1+ZwQRqeYWwb+1++WbjJmWGhctb82m3qhquV6THAE1eTskbAQ3r8tSTQens
	 Qr3/CVOtiOJVyhtLbVruBMWqDshoGiSgXrlVW2p47sEEA1I6xRlvjgGgHWX1qPBCc7aBb
	 k/AHFDMkP/IaH6V/9SXCCOrXqsauZPzRiHEpt9MvPr55V4XIKYxUjhM9A+rSFSXaCMBSl
	 aHBGIT0YF653iiAFtY0LwOJumWY4D/qit4Z/p3+Cdvz8UZEY5J0oufS7vjCIOVpuIuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793977705;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Sykp4o/+jigFXiA4+ilYlXp+/rgV6/09mQP79j9S/us=;
	b=Sd7xSOYi/dRfCsLuJs5bDJA7u45m4A0hKEy5I4w14NikzMnFJgAH09bqFdXYjmTxEjkl
	 zrdAbPB1V6dLWkcO+DYlYhHB0ZMzCyYGnKNtSt2d+uMBbBLRleGLvdXyXNj3Ed5k8FWnN
	 PeECP34fJ+SR8QWcMUYPSZySWc2/7Gpt818YBKC22UgUyz+KQtaQH3uV+ECmR+gHtNts+
	 1EUgrXs+N04dhJEBwN6sTUOQS8RodFWSJGhXQgqnbVPSlFA0hdwXkFNOc41tO9p3YjuoE
	 RqAlPBfPCrKarOuuOAalWSX/WwrZeOaTQJBJgNQ6RS2PFd/FHMgYDXvSb/XiBJ6ZkMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IVwKxxUh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E1E606A329;
	Fri,  6 Nov 2026 15:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IVwKxxUh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 741CF1F0089F;
	Fri,  6 Nov 2026 15:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793977704;
	bh=Sykp4o/+jigFXiA4+ilYlXp+/rgV6/09mQP79j9S/us=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IVwKxxUhudP6RzHQOzDgbAjaH4xylq1CsAsHRSwnkeemBd9LrNTk96sTCoZ0OQFRG
	 lCe0tZHupUyZ/DJCOM2Ce4zDcIQqqQm/4CavmxGdVTsEeSKqIwKAYU/Gqy/meCssCm
	 PhJJGdUeKjGjgZGJTmlgzpPFVzTM63+ZhFnm72DIe9zV/x+zCRKdn9MiZXEPG5gXzg
	 3naESWWBaOkM+TI7clfa7v9FbFReidls9Ow1vxOEjmBpWrAj/FO3kCAH667gyZHwdm
	 oSC2FU9s5fM9V96o6A9wQnWQlXzFpy8bHTIguBZVPmJ/4lINSP1lZROuW1No/Az6eN
	 HzN8jiNHe3vFw==
Date: Fri, 6 Nov 2026 09:08:22 -0600
From: Rob Herring <robh@kernel.org>
To: Ping Li <leeonion.muyu@gmail.com>
Cc: yin.li@oss.qualcomm.com, james.morse@arm.com, ben.horgan@arm.com,
	sdonthineni@nvidia.com, andre.przywara@arm.com,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/6] arm-mpam: Add basic device tree support for
 resctrl
Message-ID: <20261106150822.GA3193214-robh@kernel.org>
References: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
 <20261104081302.304667-1-leeonion.muyu@gmail.com>
 <9d370f12-9e4c-4b80-9d28-ff8085ce3aee@oss.qualcomm.com>
 <20261105055347.947416-1-leeonion.muyu@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105055347.947416-1-leeonion.muyu@gmail.com>

On Thu, Nov 05, 2026 at 01:53:47PM +0800, Ping Li wrote:
> Hi Yin,
> 
> Sure. Our memory controller MSC is described as a top-level node.
> The MPAM register window is mapped independently in the SoC (the
> component sits on the DDR egress path rather than being a sub-block
> of a memory-controller DT node), so the node is a direct child of
> the root:
> 
> 	ddr_msc: msc@2238000 {
> 		compatible = "<vendor>,<soc>-ddr-qos",
> 			     "arm,mpam-memory-controller-msc",
> 			     "arm,mpam-msc";
> 		reg = <0x0 0x02238000 0x0 0x1000>;
> 		arm,not-ready-us = <10>;
> 	};
> 
> The first compatible in the list is for our platform glue; I have
> replaced it with a placeholder here since it is not relevant to the
> binding discussion.
> 
> Notes on the properties, in case they matter for the binding:
> 
> - reg: the MPAM register window. Only a subset of the architectural
>   register space is implemented, so the size is the truncated window.
> - single RIS: the component reports HAS_RIS=0, so there are no
>   ris@N child nodes.
> - no interrupts: the component has no MPAM ESR block, so there is
>   no interrupts property.
> - arm,not-ready-us: 10.
> 
> The verified probe path: the node matches via "arm,mpam-msc", and
> patch 6/8 in v3 classifies it as MPAM_CLASS_MEMORY and treats it as
> accessible from all CPUs, which is exactly the behavior we need.
> 
> One question in return: with the node being a direct child of the
> root rather than a child of a memory-controller node, is that a
> form the binding should cover? If the binding expects the MSC to
> always be a sub-node of a memory controller, we would need the
> top-level form to be allowed as well.

This would be why we're not upstreaming the binding without users. We 
need actual h/w to validate the binding works.

Rob

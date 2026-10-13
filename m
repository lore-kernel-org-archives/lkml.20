Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43EE3434997;
	Tue, 13 Oct 2026 09:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791883996; cv=none; b=aWSrNJin49bzsciBEznBKjObH5g5VIDvMXNCnqgIxb81VBfXe64PJNFl+AU7W6+684WGLWcITIZbtVUHtYCXDEsgRqpDjIkPKg496Sf2Z5+cFdjkxWfiE/HoDGGnpLy73cs71QhfGEAz6us5BvKVIvHUM0syE/sr22sklpoeYAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791883996; c=relaxed/simple;
	bh=Q1qZV3UwEzz3kYase9ex51jhWfLYFtGN3beYzz8JjpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rzNUy5ai5EEMX4WUXMLMkWTWn9Efaj7nSCBTlwBEOObbc1K1gOpnHUGWnP0Qo0UM4sa/fdJWcF+bbVEOc2WKA5aReXRjX9RoAc9+rQBgN2NaVffWrBKzZCoSDHev+5MR4kWK8BFquy2GXSGuGLKWbdSj7YBB1naB8kkhObrKnJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BpGJpECm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BpGJpECm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C64D11F000FF;
	Tue, 13 Oct 2026 09:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791883991;
	bh=eXWwLO4f27zLzjYaywvcUXu0PszcUzOkRGtDDmJg/mY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BpGJpECmnc5GxGubaFlWpDQl4qaGSZ2UveCm+TNNzJZWXRKayz4Rmf+L2QFacrirh
	 YnR8BFP6LodCdz8smZSQYduJjU2p3dbVcw9LuZFURwfnaUAGYaSWTXrXBCXQmVzviX
	 lIWY45DPbKXmvNrAQvS9BrnJgWNJW7bszssvjnI2eCf1Chsd3g6vMQ0aaJV7np+N9C
	 OQoM2vAXUqL/nhb5fV6ybacrvnn+ds/EL2B4kT08NC4mHHmMCLPosZxU0tngS06mkM
	 J5PIvAcNMD4TnkFlXk2foyPEl0VdDGAWrMQ3qW/Pyh5rdAYalfuZOI8VyMGAe+0jZ1
	 xlvI0HnD5+iWw==
Date: Tue, 13 Oct 2026 11:33:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dawid Glazik <dawid.glazik@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, maciej.lawniczak@intel.com
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: aspeed: Add Intel AVCRP and
 JNCRP boards
Message-ID: <20261013-sincere-lemur-of-unity-ede6a7@quoll>
References: <cover.1791825961.git.dawid.glazik@linux.intel.com>
 <0b8fbf07323894a48a777ea531713a0285e319d4.1791825961.git.dawid.glazik@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0b8fbf07323894a48a777ea531713a0285e319d4.1791825961.git.dawid.glazik@linux.intel.com>

On Mon, Oct 12, 2026 at 07:39:05PM +0200, Dawid Glazik wrote:
> Add compatible strings for the Intel AVCRP and JNCRP BMC boards.
> 
> Signed-off-by: Dawid Glazik <dawid.glazik@linux.intel.com>
> ---
> v2:
>  - Squash the separate AVCRP and JNCRP commits from v1 into a single
>    commit, since the changes are small and closely related
>  - Fix compatible string ordering so the new entries stay in
>    alphabetical order within the enum
> ---
>  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


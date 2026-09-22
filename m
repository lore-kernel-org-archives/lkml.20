Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C72F5625F0;
	Tue, 22 Sep 2026 16:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790092963; cv=none; b=gx0NKMvZlXBHcQhgTPczuAQsX6wf0ABCSnxFL8GFtOi+q68YxpM9Rs9kZ6eA7Nmn/5+9aqAbtobDgwdl9N3dRgQF2nJ/PYM0jejDeqKyrvcnzV70SlTEqLN3qjlGHNpHNOjvuSrBSfe+G16XaIBYCU8dEOx8KxRIjOV7H0m8qK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790092963; c=relaxed/simple;
	bh=BLzAvoRCog0oj6ayMUj7mCBKU7CywbaRHqbDhNtpboc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ti77Zy33OYfwzuDwyBqkEVqemdMAklJ0adxfZCA9ZPTJjeQEWdR9VeAYL5fEyXlbVORAtXPb9A5INRchHBDKzTC2Zz74+ZnPHE3V+/A6864cQhKEUtHQPzKdlQPCFHXn3uRsc82GaVG7WJUykRO1DAqZRVFcsUGd5avdJA78lrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gbg7ccOG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gbg7ccOG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A2531F00893;
	Tue, 22 Sep 2026 16:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790092962;
	bh=H376EqLxzYGIR1HtxMkEdnt6E0UelkYiOnFTiHSoQvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gbg7ccOGOHfyCevLSfueubPZxgRebYPJKVNDKKFzBzw6h0hDOgjuh74QV9DqMmGar
	 d9IDggV2zjJZA1WhKhXhqTUCs4NUYJ6q3pBmG86/8/jfjfwSF6dF8gIZGTE2vDlRN1
	 xl8n7BRHobN1FgBfD40kFZMnPh3ro3BGBc0hl57HkcDidW2wjF50yywvQP9JpDGVcr
	 6ilT7RzMCyMZR8TybQni7mreH86OAvGdw4/PybXdi7O5QEwYnBndHKAGYD2Rc7LC0t
	 Xb4CEhZWMbv53p80pJKtT65z4Q0flHM8l8h97BPm6pP1apeDo9gyYBvXeChO8IBDPF
	 3mcPVLOdah0Bg==
Date: Tue, 22 Sep 2026 11:02:41 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Richard Genoud (TI)" <richard.genoud@bootlin.com>
Cc: Beleswar Padhi <b-padhi@ti.com>, Abhash Kumar <a-kumar2@ti.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	linux-kernel@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Udit Kumar <u-kumar1@ti.com>, Nishanth Menon <nm@ti.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Tero Kristo <kristo@kernel.org>
Subject: Re: [PATCH v4 1/7] dt-bindings: remoteproc: k3-r5f: Add Jacinto LPM
 memory region
Message-ID: <179009296069.3521742.6970352626408924376.robh@kernel.org>
References: <20260921145325.300025-1-richard.genoud@bootlin.com>
 <20260921145325.300025-2-richard.genoud@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921145325.300025-2-richard.genoud@bootlin.com>


On Mon, 21 Sep 2026 16:53:19 +0200, Richard Genoud (TI) wrote:
> Declare a carveout memory region to store LPM metadata on Jacinto
> devices.
> 
> For Jacinto devices, this memory region is needed for saving ATF context
> and the certificate information of ATF and OPTEE and DM image. This LPM
> metadata area is firewalled to be accessed only by TIFS.
> 
> U-Boot R5 SPL/TIFS will use this area to save and restore:
> - ATF context
> - ATF certificate information
> - OPTEE certificate information
> - DM image (which has been copied in memory at boot time by U-Boot
> R5-SPL)
> 
> At resume, U-Boot R5 SPL is executed and detects that the board is
> resuming (with a flag set in the PMIC), then it:
> - brings out of retention the DDR
> - retrieves the LPM memory region from DTS
> - authenticates certificates from LPM memory region and applies firewalls
> - asks TIFS to restore TFA and its own minimal context
> - starts TFA on remote proc
> - loads back DM image from memory and jumps to DM
> 
> https://software-dl.ti.com/tisci/esd/latest/2_tisci_msgs/pm/lpm.html#lpm-msg-lpm-save-addr
> 
> NB: This memory region is not part of DM memory (which is not retained
> at suspend)
> 
> Signed-off-by: Richard Genoud (TI) <richard.genoud@bootlin.com>
> ---
>  .../bindings/remoteproc/ti,k3-r5f-rproc.yaml   | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


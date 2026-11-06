Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.154.119.183
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794003208;
	b=1kUWuNQcDvU1c3AFBrm/igORfA4lazbb4IkRnamH8/nXzFfEQPgCUtCB9XSLRiJ2I/UK
	 1bug4n1+RsVnAQxzeY5QS8Vc6Xx2aasUOFP8aTOjhKaklB1gf/RyUS9U+SyFj24ysSFO9
	 RWTVWcAOGEprumb2Gkj4bWRETaFd9z7s9Uiv/ebLPWc2q/z3k3DaJkKWqVzmePZy/qcSn
	 aXZIWpxfFq6W2WlwGCbuJuoSsV1cgbeU1LK0rX6v9IjH5nWje1hIKVwPlhy0ezkgumc1d
	 6MKCi3hBqgFTQwPFsxttiLQ5EwyQehgtGrjD7H5E2LtAkkQ0u3YffqEL+fgPIcDJJow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794003208;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:Mail-Followup-To:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:User-Agent;
	bh=JYRO1i26D9FG5gpovbYIFwDb5aLIXhRJ9ZsiS5nT6io=;
	b=X0M5DMh6XjK9+jFlSLq50RQPP4sSLkR3Lgr9O1EMVQR4v+VF3tNCmyV/mdf1LE5wpLsP
	 cn1XVHYw93mo8nHVBw9sk4bV4pXVQdJ6ye+D0FbcI3UklXY3kavwnjG9fWGin1v5Olvc6
	 Iq6nyXutpAG8ZYkqooSG2gcsZuYiAQuNXVFfvVxOm46v8l7XvlMe+Z6Ehtm1zWz83hZvT
	 wb9IMZyj1EWfUA6E8kgN64917Go+JwhvqOdMeoIMW8yn/R0DOfu+kyKcwf+x6Jlg+uAT3
	 gS947+CyoyIHQG+hx/I+bnFDSGKnzYwweCRMRZIp2QGvNSbZEi5hcWKsHlhPjoPNvOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aurel32.net;
	spf=pass smtp.mailfrom=aurel32.net;
	dkim=pass header.d=aurel32.net header.i=@aurel32.net header.a=rsa-sha256 header.s=202004.hall header.b=rTlRXdcm;
	arc=none smtp.remote-ip=195.154.119.183
Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA76606A326;
	Fri,  6 Nov 2026 22:13:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BA76606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=aurel32.net header.i=@aurel32.net header.a=rsa-sha256 header.s=202004.hall header.b=rTlRXdcm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=JYRO1i26D9FG5gpovbYIFwDb5aLIXhRJ9ZsiS5nT6io=; b=rTlRXdcmanV7C+Ntq1kn1DFl2o
	2UJcvMtKcxlngJzYb8h0G3MdYh3Fk/JxVefw+/Qw5OUX8YN9mqwO6ZSNoD9kqEE+9ZXT7D2gQgP/H
	GMyYi8Hn4q9c/SrPAFTu8HCS/8qRc9j87J953wFtn0WK21QKSPVvkOxx1VcJWyQ9jdgDlu1+2pf2h
	Cr4kNrj/alh/Q4yD7hz/Bu1ihUTVB8XlkaD7CwrRlE1M4IsSHYftfZu7LtYKtL7XF+nfVs6kIlgmp
	vRy2/dbtrRUFzDgSa0GvM0NFuiHHo/nSiKhaQz9d8i1o28CHfDmbr1XxqWQ03aerGBUQai0U4zRdn
	kNaguWuQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1xPSBL-00000000qEZ-05Ws;
	Fri, 06 Nov 2026 23:13:11 +0100
Date: Fri, 6 Nov 2026 23:13:10 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Jiayu Du <duge1256@gmail.com>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, dlan@kernel.org,
	troy.mitchell@linux.spacemit.com, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	p.zabel@pengutronix.de, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] riscv: dts: spacemit: Add K3 eFuse and temperature
 trim cells
Message-ID: <au5Q9lYTUegeEglv@aurel32.net>
Mail-Followup-To: Jiayu Du <duge1256@gmail.com>, srini@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	dlan@kernel.org, troy.mitchell@linux.spacemit.com, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	p.zabel@pengutronix.de, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
References: <20261106060525.346873-1-duge1256@gmail.com>
 <20261106060525.346873-4-duge1256@gmail.com>
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
In-Reply-To: <20261106060525.346873-4-duge1256@gmail.com>
User-Agent: Mutt/2.4.1 (2026-07-04)

Hi,

On 2026-11-06 14:05, Jiayu Du wrote:
> Add the K3 eFuse controller with its AES_WTM clock and reset. Describe
> fixed-layout cells for the temperature calibration parameters stored in
> bank 0 and bank 7, using controller-relative offsets.
> 
> Leave the controller disabled for board-level enablement.

What is the reason for enabling it at the board-level? AFAIU, this is 
part of the SoC and does not require any board level hardware. Therefore 
I believe it should just be enabled by default.

> Signed-off-by: Jiayu Du <duge1256@gmail.com>
> ---
>  arch/riscv/boot/dts/spacemit/k3.dtsi | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> index e89d2cc5ca8c..51861fdc6a21 100644
> --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> @@ -1439,6 +1439,31 @@ saplic: interrupt-controller@e0804000 {
>  
>  		/* sec_i2c3: 0xf0614000, not available from Linux */
>  
> +		efuse: efuse@f0702800 {
> +			compatible = "spacemit,k3-efuse";
> +			reg = <0x0 0xf0702800 0x0 0x400>;
> +			clocks = <&syscon_apmu CLK_APMU_AES_WTM>;
> +			resets = <&syscon_apmu RESET_APMU_AES_WTM>;
> +
> +			status = "disabled";
> +
> +			nvmem-layout {
> +				compatible = "fixed-layout";
> +				#address-cells = <1>;
> +				#size-cells = <1>;
> +
> +				soc_rtemp_trim1: temperature-trim@120 {
> +					reg = <0x120 0x1>;
> +					bits = <0 8>;
> +				};
> +
> +				soc_rtemp_trim: temperature-trim@19a {
> +					reg = <0x19a 0x2>;
> +					bits = <4 8>;
> +				};

I have tried this patchset, and while I can see non-zero data in the 
/sys/bus/nvmem/devices/f0702800.efuse, both temperature calibration data 
appear as 0. Is that expected?

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

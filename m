Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C863CF21A;
	Mon, 12 Oct 2026 23:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791847923; cv=none; b=jtvmXaosCr9S3KzLCf72z/jWcZYyMeqEtNs0WkJEFQDXsT/BBDCRoIIigBeDrRbOQWckhDP6rEnuYEVvJ4CO0yL3CWnq0cVWvIjzCfNhQrAsPykE41oMY0o3A5H3coQYDh2N97Y4XU1CpdeWa6JAs+BhUtuWF5LtT36UVdyDMC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791847923; c=relaxed/simple;
	bh=/Kig9USumlg6SA3i+8l/TVdQF4zTKKXFxQT5yEd4WV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JzneD97nhTQMFLkP/hWT2hUW/YKdv6uCcnS80WZS/hAFKR1wkc8BtJtsTtU1rrVcbBuovJgvOblxSmp/kw2HYxrfN2VJBx1rbzV0tj7/08IDnqmKhTX7GoZbeRGTuSkLyb+bFndsXcP5SMKWbVDffB7kTas78IDvgv6v6tcjPIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EeSBCjv7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EeSBCjv7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 955531F0089B;
	Mon, 12 Oct 2026 23:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791847921;
	bh=et+fSNpAgASLBKfNUi/A2UyBeZSgDNV1kqK5yCpP8hg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EeSBCjv75gbokJ2stAxf5eiUhk30zOW3R4JE+07vST5nJjF8txuMIxjam3c5Dh6TK
	 TZIn2byMOf8JGCcqB0q+jI5YmEQ6xjPntEmApdR3C1VklhKd5M3DPD4GGSZkpK3BV+
	 vhPulGmkDJKuZBk8jhuk6OcEmwcaAPrNIdMkWKDh9knd8kTq94VGgS1cclH2Zcp88T
	 DM/m10rQRJ+1CHfGNKdmdSkpAL8qIpyEuuIKTjgMC8m18qNOstncoGGmUtSoEW6RsW
	 /DGDetbXVrMJm2zJ27EDaBjAyHuujIoDEBj6VPdLpqCj2iPMtCwEmcLYzu3ksVLAIj
	 34JXPGbeKcpgA==
Date: Mon, 12 Oct 2026 16:32:00 -0700
From: Drew Fustini <fustini@kernel.org>
To: Han Gao <gaohan@iscas.ac.cn>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Han Gao <rabenda.cn@gmail.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] riscv: dts: thead: Add Milk-V Meles support
Message-ID: <as1t8Ln4isRWfgO9@thelio>
References: <20261001-rv-meles-v2-0-c61052262f84@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001-rv-meles-v2-0-c61052262f84@iscas.ac.cn>

On Thu, Oct 01, 2026 at 03:44:09PM +0800, Han Gao wrote:
> Milk-V Meles is a single-board computer powered by T-HEAD's TH1520
> SoC with four C910 RISC-V cores. Add the board compatible and device
> tree for the Milk-V Meles.
> 
> Enable UART0, eMMC, microSD, Gigabit Ethernet and the PWM fan, and
> name the GPIO lines exposed on the 40-pin header. Add AP6256 Wi-Fi
> support over SDIO and enable HDMI output through the DC8200 display
> controller and DW-HDMI transmitter.
> 
> Board details:
> https://milkv.io/docs/meles/overview
> 
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
> Changes in v2:
> - Group BeagleV Ahead and Milk-V Meles compatibles in a common TH1520
>   enum, as requested by Krzysztof Kozlowski.
> - Explicitly select the GPIO function for the Wi-Fi host-wake pin,
>   as reported by Sashiko and confirmed by Drew Fustini.
> - Add Drew Fustini's Reviewed-by tags to patches 2-4.
> - Link to v1: https://lore.kernel.org/r/20260929-rv-meles-v1-0-effdd14a76e8@iscas.ac.cn
> 
> ---
> Han Gao (4):
>       dt-bindings: riscv: thead: add Milk-V Meles
>       riscv: dts: thead: add Milk-V Meles
>       riscv: dts: thead: enable AP6256 Wi-Fi on Milk-V Meles
>       riscv: dts: thead: enable HDMI on Milk-V Meles
> 
>  Documentation/devicetree/bindings/riscv/thead.yaml |   6 +-
>  arch/riscv/boot/dts/thead/Makefile                 |   1 +
>  arch/riscv/boot/dts/thead/th1520-milkv-meles.dts   | 346 +++++++++++++++++++++
>  3 files changed, 351 insertions(+), 2 deletions(-)
> ---
> base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
> change-id: 20260929-rv-meles-25d10148dc0c
> 
> Best regards,
> -- 
> Han Gao <gaohan@iscas.ac.cn>

Sorry, I forgot to reply to this thread that I did apply all 4 patches
to thead-dt-for-next.

  [1/4] dt-bindings: riscv: thead: add Milk-V Meles
        https://git.kernel.org/fustini/c/2c8613ec65f4
  [2/4] riscv: dts: thead: add Milk-V Meles
        https://git.kernel.org/fustini/c/8360e1bcc246
  [3/4] riscv: dts: thead: enable AP6256 Wi-Fi on Milk-V Meles
        https://git.kernel.org/fustini/c/a7f2539005c4
  [4/4] riscv: dts: thead: enable HDMI on Milk-V Meles
        https://git.kernel.org/fustini/c/d43b33e0253c

Thanks,
Drew

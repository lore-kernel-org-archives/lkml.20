Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794873718;
	b=T5mVklD4IGrU/xx0tbuLJHp2rBwTcPX+K/ZBzn65XgKQVwZmp5lyl9gJJWQl0IBpf9bT
	 xz98Wc6K6d4DaudHFx0FIg639B/vxN5n5bJlyBnUpzD0XOL5pnsELLTjdUr8ukih48OoM
	 b60pGcWbEGrDA2bQCfZj6kKZWEpC/0cA33apWAsyrTfm4tYa2BIsv6e6lKycKrDgYHVJz
	 R0WG0gqygiTcvG2raIiDllCQsVeH7zKpYYcNz1bimwBnkB3elLtPu4OuiC1iA8ViRLicN
	 XFuYNd0Ct42k4HFVuejdaX0fChbbp1LDD7+Ce3wVDxfZCG6BJnSN8y+x8jkZhB/FEmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873718;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=+BdcjLWH3QZDU1he+b9g7/esibSDQSzqqnA6BsHQW6U=;
	b=g1FO1gVr3RHUSplpdakeVtkpcmhAzGlVmXgnFhz1cmBENrEs3wHZkM/qGoYifSNqJaBL
	 KAEoqnXKLvgFR3k+2XwU0P+1XNmQ6MYrR9ODfLouMESTYtutYSSgUiEXA2LGz6vmEfwmh
	 R6D1BTc6Gxzghu1q5wmshJa5szEwIPtMMQje+CaPnQkwkYHudUZoKKwj8c248U5tF/Z5Y
	 78eeuWfl2AZtVL1R1QF12xA6AHOFo73+ib4VTavJWdcdrm1D7Tx53ersrNUhs3iId+oyD
	 ZnMWUnY6oVCUexvjvkxEJC8aQJircfbdePuzjJ6olsKz3AqJPCjAeWAN132zAgcgsRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NfnsTb7J;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A988606A33A;
	Tue, 17 Nov 2026 00:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NfnsTb7J
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9FED1F000CE;
	Tue, 17 Nov 2026 00:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794873718;
	bh=+BdcjLWH3QZDU1he+b9g7/esibSDQSzqqnA6BsHQW6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NfnsTb7JHejrjiUEGAem1P4z4yV7T0Zu+HC1uQlDhcuQxosCDtzFuqgIX1dqyuj+O
	 EDYdOj1te3JmwGaSe+fcZzerE99n6ZdCMbYKUUCTnAhCiTmVsOX5wiLlJEVuBFGq7s
	 kTCLnOkEe+yLRbvZOBJvIKPpm86VWLb14tSy6ieOe9yzIrSBP/QzaGA0cx5eN4Fpfp
	 MRK6hL7vZgLUjQS/SHYda30PPV19kGayhgzeTQMDOfJe+n9fnlnVj2Gtl9zNWdfsjo
	 a2U55NtFI0w+pzoocm/5Qq1K7xTadZjq8KW8eKE497jk5vCeK2eZW9bvrQ+ivJe3iz
	 xDs/2GVJQ3iEw==
Date: Mon, 16 Nov 2026 18:01:55 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Ajit Singh <blfizzyy@gmail.com>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: lemans: Add Vicharak Axon Pro
Message-ID: <avuY1JUIN78weC-b@zenbook>
References: <20261030074404.33517-1-blfizzyy@gmail.com>
 <20261030074404.33517-3-blfizzyy@gmail.com>
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
In-Reply-To: <20261030074404.33517-3-blfizzyy@gmail.com>

On Fri, Oct 30, 2026 at 01:14:04PM +0530, Ajit Singh wrote:
> Add initial device tree support for the Vicharak Axon Pro SBC based on
> the Qualcomm QCS9075 SoC.
> 
> Enable the debug UART, UFS, USB 2.0 host, PCIe1 (NVMe), GPIO LEDs, GPU
> and DSPs.
> 

I merged 1f90a2bab7f6 ("arm64: dts: qcom: lemans: Move platform
resources into lemans-embedded.dtsi") recently, which moved a bunch of
the labels you're relying on to lemans-embedded.dtsi.

Can you please rebase this patch on linux-next and resubmit it?

Regards,
Bjorn

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793704640;
	b=YuMB5tQILB9d5afqEqrHVSkm8SbwpKNtBLFP32+iRvf7F9tvtrAeAxGAPmZ4+4D+dIX0
	 DFui9RoteNjspBteb8zun1VJpuX+s13jqNgonhuE0nwlNbEXmuDUK0H1L7j1muvVosZVn
	 5QVN1xG3FmEgW3fgKfCxy/jAO4hZ9xL4sqG1y2EzASbiQBdRhxESOhNaNJM4Wh5TqnyVi
	 jmaARkCU907XtJzfwUhfQm+gqxSYwrGy9HHYEd70ewT3lomlxkHO2CF+hxmbIEV3OnHXq
	 d7RYI7ieXwbxRT5wjUqIbGyvQj+q45cxsYsOmDv7tA0nkeDe/l0Zlq/ZjYZ1FWlH0tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793704640;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Vyb8rBXQevAy02jk8h0gbZFOZmPCLNrIrkV1juknGEg=;
	b=aTk6nC8slF80QdNau8Xdc/U4IynK1Cx3EIBHz+8TO4ZB9c+VFPRHdjL/iwhqFs44+Aqi
	 OJwmUlzeMFWlmzRehBGliLNYYSkn0eEdY3BzZ5n/c2esWcUl4aUH8zeqelism4C26+Axf
	 gcVJunXdpQeuNSHLG3SMvwoU5zCHFvvrQsXM/AJWXOdrZ4DnyNUSdBq5vRcpEMQn4Rx0M
	 VcYEKyo3EbDxAVUA6zP0euO/bfIrbB2Oyt5MKFv2KEiX6tJbHi3Ui4dOuzsImZC7u7MgE
	 o1HkNev9yU9Gj0mwoLXfSpU4o1yiA/jgD4XiM5TpMGUNAADPJNQDlFHLeITknC1XoKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zj4XtqB6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4921B606C56E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zj4XtqB6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 892151F000C1;
	Tue,  3 Nov 2026 11:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793704639;
	bh=Vyb8rBXQevAy02jk8h0gbZFOZmPCLNrIrkV1juknGEg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Zj4XtqB6kXc1VRzGIvaVl7uhmtGdWyLKr5ZsINr/ZG3fMeTsW1zn9IHvsDXepLh7k
	 Rm7eRVE3lfJ1A4xGHB9QsbnIVRhAWLYE4SiTlPry8FREICxLQNsQEg8WXfK8KbOyq7
	 jwYqw6rn/+KrcfD/+l/8CC71Fjs9GxoPKymz6DA6H87xM80xvBuwuqY8QdsbtzcK+f
	 5wLiT5rHVK8eQePGziy+yruR/vtvYOoqAXg+ep3RyaRWkdi94FoKBZaop50IEMocl3
	 ZhCkM5YMp0hkdVbsV5BSuO3vrTQL4p/SZEK0NnfpuLnIgCBzbbmePEKJU+YzrvmWwL
	 C0u8IY9ZOPDhg==
Date: Tue, 3 Nov 2026 11:17:15 +0000
From: Will Deacon <will@kernel.org>
To: Paul Cercueil <paul.cercueil@bootlin.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: Kconfig: add CONFIG_CMDLINE_EXTEND
Message-ID: <aunCuysle9uzTRI1@willie-the-truck>
References: <20261103084140.7689-1-paul.cercueil@bootlin.com>
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
In-Reply-To: <20261103084140.7689-1-paul.cercueil@bootlin.com>

On Tue, Nov 03, 2026 at 09:41:40AM +0100, Paul Cercueil wrote:
> Other archs have it, and it is supported in arch-independent code, so I
> see no reason why it is not provided on Aarch64. Add it there.
> 
> Signed-off-by: Paul Cercueil <paul.cercueil@bootlin.com>
> ---
>  arch/arm64/Kconfig | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 1075bc661833..f8542e532b50 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -2551,6 +2551,12 @@ config CMDLINE_FROM_BOOTLOADER
>  	  the boot loader doesn't provide any, the default kernel command
>  	  string provided in CMDLINE will be used.
>  
> +config CMDLINE_EXTEND
> +	bool "Extend bootloader kernel arguments"
> +	help
> +	  The command-line arguments provided by the boot loader will be
> +	  appended to the default kernel command string.

We previously reverted this in cae118b6acc3 ("arm64: Drop support for
CMDLINE_EXTEND") and I think that reasoning still applies. The thing
that _has_ changed since then, is that I think bootconfig now has some
support for early params, so that's really what people should be using
here.

Will

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794298933;
	b=XxHuXLuGyA+qxHMHRyP0fKtnefNbTWrzXF4S/P2JF1b93mQHI2dDEWFqKKIxsHq77IfS
	 7sQedXTf0dKButt4Bbs4JNUB5g+LNKQ0V/TtnFBAlCuN5JxMZtS9AX28OxmLK6XieMJAf
	 O18uxDsA3nZ020l3uFtdG4/sKvTupJa2iSZ1j7FFHarfRfyKIjgmGQHL0wZaNBpXyVkqd
	 B1i9AJ/MR2kRum2H+csYJkf6HPXIJ63oO88n6ab2mLoq4wUzzGUIA9g+54MICjhARR8mL
	 QjAgvS60RVZ8oJvSamGhuApCoFiuBZtna39JhbxXC6Zy8Ta+SuRplIkNO6+czAGONMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794298933;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=HnrGMq+cn2NOMNsMWSOnoWmFXpZJHPxXccfXvP/driY=;
	b=jqUOLZcaHOCzbjeszrQDTENI3FflV6lfwo09F1p4+q0uPAcsw4iv+PJCQ4XoZ6ViWD1q
	 H/NJid8rB+6Gj4w33LF4+ODF8zL/Gz21mfGsjIAZkdoTAvQ5Kcw3mH6VnrReBS9f2wjJN
	 hNqqGx0FaF6HwV7PnsCXX3EASHyr5eEASzmMm2MUPdjSgq6Lp/XKD6maDWscABeKOgvVI
	 D7zolZ5sa7PpqF68wq/0WHaeLYIFAR9N9tyOXvyc8m3HDEfpoe5QMUMw4ZebS7xE20ikG
	 ReHgjjqlgt2JfJzgzFjlyg9IJuNYoZOrIIlnOybEXkrszxbiaYxe7nEfzrtB294ReQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=flE9mZh+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F416606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=flE9mZh+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 057AB1F0089F;
	Tue, 10 Nov 2026 08:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794298933;
	bh=HnrGMq+cn2NOMNsMWSOnoWmFXpZJHPxXccfXvP/driY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=flE9mZh+QHHyaCINvho2iTZoK/5U1LoVKzl1hLVatdoLJOlGhe0dBbpCEZcB0khkc
	 nrVeZ/0hBLEiLzdZHtiK5rt3HsTWotiqpjTXOTPi6QwJckdboOBdk+fAElKQNflmYv
	 Pt6rYtirwpFnCesLjlWMDzMQnaqucjrwqLyjIv8TKvMI4No2SfRKDJ43tnvspsCnNd
	 5L2R8z5AcQmSbT60hRuDtAnbttg4pQJCMRwhNhyIxeW2voLlZBLtvgszX5Lu6At6/U
	 FglrtYsoOqIxvxtjdt1lJUug3PgG29W8AW5dT6pLiaC2WBpeOxbC7FV1Et2+zAOAKj
	 4qoct87rG7Dfg==
Date: Tue, 10 Nov 2026 09:22:06 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Thorsten Blum <blum@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Nicolas Schier <n.schier@fritz.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Jan Stancek <jstancek@redhat.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	"Pratyush Yadav (Google)" <pratyush@kernel.org>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/4] x86/boot/compressed: Mark process_mem_region()
 index __maybe_unused
Message-ID: <avLULiGClSYFVZAE@gmail.com>
References: <20261109124816.61438-6-blum@kernel.org>
 <20261109124816.61438-9-blum@kernel.org>
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
In-Reply-To: <20261109124816.61438-9-blum@kernel.org>


* Thorsten Blum <blum@kernel.org> wrote:

> The local index variable i in process_mem_region() is unused when either
> CONFIG_MEMORY_HOTREMOVE or CONFIG_ACPI is disabled.
> 
> Mark it __maybe_unused accordingly.
> 
> Reviewed-by: Jan Stancek <jstancek@redhat.com>
> Reviewed-by: Nicolas Schier <n.schier@fritz.com>
> Signed-off-by: Thorsten Blum <blum@kernel.org>
> ---
>  arch/x86/boot/compressed/kaslr.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/boot/compressed/kaslr.c b/arch/x86/boot/compressed/kaslr.c
> index 290153818d0f..6f95092fa97e 100644
> --- a/arch/x86/boot/compressed/kaslr.c
> +++ b/arch/x86/boot/compressed/kaslr.c
> @@ -599,7 +599,8 @@ static bool process_mem_region(struct mem_vector *region,
>  			       unsigned long minimum,
>  			       unsigned long image_size)
>  {
> -	int i;
> +	int i __maybe_unused;
> +
>  	/*
>  	 * If no immovable memory found, or MEMORY_HOTREMOVE disabled,
>  	 * use @region directly.

Please improve the code instead of uglifying it with an attribute
of uncertainty. 99% of __maybe_unused uses are unnecessary, such as
this one - let's not introduce new unnecessary uses.

Thanks,

	Ingo

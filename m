Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794298498;
	b=DmqTVir6x81rHf9L61FicVgrVjKXA8eq1mC0UvnT+N0Kq+ouNrPCROpyuhdoLmv1upFZ
	 W8ZTt5jqT1HB+UzytYYL5SwPDq53u11UvxVkxEhxG9fr4FYFQgx/CFj3vP34kiA7nALhA
	 ctnqkgVtHm1jbKhkyNTxAO7R/N7uR4aG3JxluAv/ZR+pnr8KOcJGaxDbtXoLGRuVvZcd1
	 OZ/528S1Cx2MLC4L3dGBfj3PGzrTXQ7hA/U1tcR8eAvFNIc+/4I7yWfo4+C7FkSK8lWT5
	 kpH2dDsA6pBFWu4utlDrvmYuYo9q15NTLtvX1NDIz+lIXyUrYESZHx5Vdvp9YXXpEWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794298498;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=fU6Jm+ieNeH2DN/h1Yzcu3Lqj/OFOsO3InMyjzVZIWo=;
	b=ukdH4jmeElrhlCI9N0E0Iu/mI/D64umfzs30LYGoMdNsJdI027bNgvsckwP/dH/M0m2R
	 cRAMcAkO0536L3FB+8FFM9AGkzXfuemxCeVMKJw0TPX0FXRlbim0/4RycN6lsrrLVvFDG
	 hs2Ho9QJykblEt8hbBND4igfZw8l1cNPhtK0bnU/Bo53adH/XuqsqjKh1W3oQJ1oSwPul
	 8Ui+673CU/miBfAK/CR1PJt3wlK5xYjXnuVs6fq+DnC83AGcTKYXfUXOduqQNwwra06mO
	 bHf8FQ8bswkaz053X1LzdkdMqGnd4Df4Zezz/d0B2nZyokuc8K9gOjsSI61VZfe9dig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SvZSmsKh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC9E606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SvZSmsKh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B7FD1F008A4;
	Tue, 10 Nov 2026 08:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794298497;
	bh=fU6Jm+ieNeH2DN/h1Yzcu3Lqj/OFOsO3InMyjzVZIWo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SvZSmsKhe+VY8G2Bkr3e8Mj1cW4uGv8B2KXqMOvc6gl61y+uVSDhmg0FgDaj3EEmm
	 3c8Q1lAB3M6CorrzgNxo8YoiEky69jQbwmS+J6jrbSX+hlvrE/YdAKeJQPYRFYK7xr
	 jOOzd/4HUmC0N3RnY5FXp2zW8VzEl0Xqwxt/J3L1IjRXBD2A5/vQlKReHm81bDCg/E
	 YduE4wkLNg9LvAZYcuGkqwZikH4uwJYE9nVlTe1RLmxNJmdlM7LBnX2+5pAV4TeMcq
	 NhkZq1klygfi8RWd68DBAjGb0aEjLY+wppoze/ZSc7Pl043GO2liEHFjxEZ0Z2zzBe
	 zj7ixFlkyAGDg==
Date: Tue, 10 Nov 2026 09:14:50 +0100
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
Subject: Re: [PATCH v4 1/4] x86/boot/compressed: Remove unused variables in
 EFI helpers
Message-ID: <avLSetbF8JOzobni@gmail.com>
References: <20261109124816.61438-6-blum@kernel.org>
 <20261109124816.61438-7-blum@kernel.org>
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
In-Reply-To: <20261109124816.61438-7-blum@kernel.org>


* Thorsten Blum <blum@kernel.org> wrote:

> efi_get_system_table() declares an unused et variable, and
> efi_get_conf_table() declares an unused ret variable - remove both.
> 
> get_kexec_setup_data() also takes an unused et argument. Drop the
> argument and update the only caller in efi_get_conf_table().
> 
> Also simplify the no EFI system table case in efi_get_system_table() by
> falling through to the existing return since sys_tbl_pa is already zero,
> and add the missing newline to the debug log message.
> 
> Reviewed-by: Jan Stancek <jstancek@redhat.com>
> Reviewed-by: Nicolas Schier <n.schier@fritz.com>
> Signed-off-by: Thorsten Blum <blum@kernel.org>

> @@ -70,10 +69,8 @@ unsigned long efi_get_system_table(struct boot_params *bp)
>  #else
>  	sys_tbl_pa = ei->efi_systab;
>  #endif
> -	if (!sys_tbl_pa) {
> -		debug_putstr("EFI system table not found.");
> -		return 0;
> -	}
> +	if (!sys_tbl_pa)
> +		debug_putstr("EFI system table not found.\n");
>  
>  	return sys_tbl_pa;
>  }

Please put unrelated changes into separate patches.

In particular don't make changes that are not reflected in
the title:

  [PATCH v4 1/4] x86/boot/compressed: Remove unused variables in EFI helpers

Having the above change included in a patch with such a title
is highly confusing.

Thanks,

	Ingo

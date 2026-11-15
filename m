Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794758769;
	b=UZLBIYrFEyaOOJ1Bxth2KXqazkXHzUoTyBxMvwNzHUANwxl9l0HFHQTup3dtcq9YAlY+
	 t02IOZ1gkpXPC5G/yscok3vf2Q30eHUTpcXDKH+RfZMRRE+/ExzEZ/2OJP2RAubLjv/cx
	 kmcwarxeVrj1g2vqSqV0h3Y0PVScXN2wj3RCtpYsmXPBj9hcEznw9pxQzrAPHat12ylCn
	 yZ+8gfPR9/WY99vhdq6z4LX27HrU+ttFtpY3F7SEihFnWhQXrZ74VugCnplBFZFhrvK/9
	 noIKxs5h3iOi7FwmUB37iHm0mjhIbjXUCb92u+FJRLwQ6I3K1GUrFPzDG18bAZqeQlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794758769;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=kKbzeVq0dxaBZX4ziUX6/Bw27/CT0mPhXYsMi4cyD8w=;
	b=tdFxJ8rBwB7Q1WJ68GIsJe7fVyRihgNIRU3qaHaaXcJmmZHCW5ydID8R12VlEaS+ohK6
	 D/i3iG1q0d7v4aFM6II+C9sIsDF55t5mJYtz9Q/66ry2rPtt+W/rUeImJdVZ0GhAXKf8V
	 L3O8HEjR028o+AxTXyqzz05AAjoqtlenVcFX285G0s6+BvUIMWKEm2bocDWNx4/BVWky5
	 IxEJY+iWMOCzglEnSEJsOOfZu3ITuutvgJ58GX3djpd7VSQVl8VR5j9BEBEcWaDVNgx19
	 Vn2C1y244pGv83x1qTXqwfECL/mNTL2rZVSXP1a0pIRaLipYbqpb/NDnUae67dl9foA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=L8lH6tAl;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4280606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 16:06:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4280606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=L8lH6tAl
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id E496640E019C;
	Sun, 15 Nov 2026 16:06:05 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id mqeIC_iLPPDk; Sun, 15 Nov 2026 16:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1794758762; bh=kKbzeVq0dxaBZX4ziUX6/Bw27/CT0mPhXYsMi4cyD8w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L8lH6tAlDy3YZ6/LlcKSs8MKDpg5r6HmRZXUcztsFfcOPPIqXx91a0jhEGtG5tqON
	 6dhCgBnakBjrdHZBIonINOJg11S3FxfdHpyp/rmkDfybLrHnVk02WVVKVlyLzQcku2
	 a7em6G2HQhY2IVchr7eNjuxnirff17GwAOKwCR4cyk8Cdkw8sKuAdyYL/KLMOnayYK
	 9w05PHM8QLwlHWD5ScIB8J5DUBKaY+N2h1tIZdmob5Fx25NTjIj8YTTru09/fs/XZ8
	 f1zpcL2pcJHvj9rgSU7vLBXIrEn0oQC2x1DKVsp+idBlRuz8eW1TP/k5L9HkS4XEd2
	 Vwj2SLNmE4IpbYWbWjSb6izyprzoyBu3gI5VZKTfW0xbLwJRVl0/T/K3V+zeT5P5B1
	 +6hMN7ty/67xMF28bzfiQAsK20nctOAfZOrszW/cSeWCjh/EfG2rj9sNF4iMYCeQPk
	 /ZQHIBr3YBLMozyCnRqiPz2cFax1DPdREwkhsDxHxoQW/rKcJwdrShUzg7LawLja5b
	 15cArAerveWmhK6ShwnrXJAM7Pk34/LI4hBNhnqnNChkQVvxwjdEsLWLafcUw87GKL
	 HBdAgK7EvBZRM2EEUAdrKfQaf8XhYuqqQqA1WbuuPkYGISGbIryJOJwx7ogYv4cqMX
	 FXpSvuLLaLiTCnkLScH25VT0=
Received: from stx.tnic (unknown [209.52.143.85])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C897940E0140;
	Sun, 15 Nov 2026 16:05:44 +0000 (UTC)
Date: Sun, 15 Nov 2026 08:05:40 -0800
From: Borislav Petkov <bp@alien8.de>
To: Thorsten Blum <blum@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Pratyush Yadav (Google)" <pratyush@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Grzegorz Jaszczyk <jaszczyk@chromium.org>,
	Breno Leitao <leitao@debian.org>,
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Yinghai Lu <yinghai@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 1/3] x86/setup: Fix logged allocation range in
 relocate_initrd()
Message-ID: <20261115160540.GBavnYVFiGL7kpdOCW@fat_crate.local>
References: <20261111165608.78688-4-blum@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261111165608.78688-4-blum@kernel.org>

On Wed, Nov 11, 2026 at 05:56:08PM +0100, Thorsten Blum wrote:
> Since commit c967da6a0ba8 ("x86: Make sure free_init_pages() frees pages
> on page boundary"), relocate_initrd() allocates area_size bytes, which
> is ramdisk_size rounded up to a page boundary. However, the log still
> uses the potentially smaller ramdisk_size to calculate the end of the
> allocated range and can report it as too short.
> 
> Use area_size instead.
> 
> Fixes: c967da6a0ba8 ("x86: Make sure free_init_pages() frees pages on page boundary")
> Signed-off-by: Thorsten Blum <blum@kernel.org>
> ---
>  arch/x86/kernel/setup.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
> index 19fc8e1714e6..4a6c54110e75 100644
> --- a/arch/x86/kernel/setup.c
> +++ b/arch/x86/kernel/setup.c
> @@ -334,7 +334,7 @@ static void __init relocate_initrd(void)
>  	initrd_start = relocated_ramdisk + PAGE_OFFSET;
>  	initrd_end   = initrd_start + ramdisk_size;
>  	printk(KERN_INFO "Allocated new RAMDISK: [mem %#010llx-%#010llx]\n",
> -	       relocated_ramdisk, relocated_ramdisk + ramdisk_size - 1);
> +	       relocated_ramdisk, relocated_ramdisk + area_size - 1);
>  
>  	ret = copy_from_early_mem((void *)initrd_start, ramdisk_image, ramdisk_size);
>  	if (ret)

What about the rest of the code in that function still using ramdisk_size? But
reserve_initrd() using the page-aligned size?

Looks to me like this should be unified.

And that unification patch should contain all your other micro changes.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

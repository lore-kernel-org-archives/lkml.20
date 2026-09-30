Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A797E2749DC;
	Wed, 30 Sep 2026 00:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790728479; cv=none; b=Gqo4LBU83Za2aiJUVXcceZCtnGa+XO93uz58ABSsOk96gjgqKECZ33RWMFGRoa89bgtyoOGb/DTe8hOgUJiDVOqdWwXFf65R6hEwKrGC0niU+Ehu//A5M5i1wyMywc3rDN0fjjdPsTdYDhtr6eiICCkbKl0bJKMw84yq+pid1AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790728479; c=relaxed/simple;
	bh=nQLQnOldjUW7u76mhFdPNQBWr42kuMCBKdhSB0Y+khs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NECCxrwF4iT0ILONd/VMgcCOshCiLu2TmAaqQAWdD2S5KkwJ8vMAfIqPClXKAAri0Fx81g2/umH5uw/U44ExClAGc+X1e0XEvXh/ws9LD1N0A61E0/GN0LQnWrgbkKsK/AlqP0iU6Aj20yqnu4FPTpj52su6harlRHHpamWHaqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=a8u2HPpC; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="a8u2HPpC"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 7DA1440E01ED;
	Wed, 30 Sep 2026 00:34:35 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id GudoapwocObA; Wed, 30 Sep 2026 00:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1790728465; bh=kusEY4hWkBoVAW+1E85mtLH983ket5Irp56ANr5TYOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a8u2HPpCeFh/rPp8rBj9cfCsyuBf4cQ01XXJ0fLlbk3Z6uF2puWk8T0iWjP9VW40n
	 mXMw+N5cAZxwefYvIGhKwEb2K8iWpcc9Y1CNOMdgoFHF2LXuwJN1HRCXIoVxByJzLB
	 8yEBaFgg3FpRJW/Ts9vIeUaVbaCjXw8Um984uaRKTvlPrE0IAOOkvBCaBAowqiNoSJ
	 NODwsxwbpY1DmcnF1Zx1HAEoW4K8xtFYTe4AzS+KWut95PUPUK1d7JkvDqH8A2I3zj
	 apgEmD0+mnKS0vqmCkVC58W+UlnmP4U+QJGcYvkdwuKyZCBrYPI35cnlq7RyIzCiVI
	 j0C3kzbvcAjy1Msd3HlD5wTJeagdDJVwrSNhLIvlkul5Nax0nYpzga4iYlCNvtnxg0
	 23G/x2qRbSbxyRgc6sHwx1LdwnfTRTjw/MZsI2xYe2r01nRFVug/OwTUyVAXEH9Lnh
	 BYECmpgx2LeLobVvHwUzP4tZOvdFuRkC/mVb9pXcEEI7+UUkvEpOpWTQtyoqKwVSRd
	 d8i0SJvqA+BjXLtjvOUunFTnP0LSNN0G6VNOw7bVhW1b0DVDRVqXkC4rEBzsyVjqTk
	 V3vf5+fNjIEtr75IAmfRkbrLSiLPNhvBh4bsk0y8DV8pJSBpdKb2y2tT5meLW9hbK/
	 K/yi8tcIa2fymQ0SsGUC6pVM=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 8F64B40E01B4;
	Wed, 30 Sep 2026 00:34:15 +0000 (UTC)
Date: Tue, 29 Sep 2026 17:34:12 -0700
From: Borislav Petkov <bp@alien8.de>
To: Qunqin Zhao <zhaoqunqin@loongson.cn>
Cc: tony.luck@intel.com, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org, chenhuacai@kernel.org,
	Wang Jinwei <wangjinwei@loongson.cn>,
	Yulong Wang <wangyulong@loongson.cn>,
	Dongyan Qian <qiandongyan@loongson.cn>,
	Chao Li <lichao@loongson.cn>
Subject: Re: [PATCH v4 1/3] EDAC/loongson: Encode node and MC info into mc_idx
Message-ID: <20260930003412.GEarxZBOHFAgZg7TL6@fat_crate.local>
References: <20260902084827.2652-1-zhaoqunqin@loongson.cn>
 <20260902084827.2652-2-zhaoqunqin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260902084827.2652-2-zhaoqunqin@loongson.cn>

On Wed, Sep 02, 2026 at 04:48:25PM +0800, Qunqin Zhao wrote:
> @@ -23,6 +24,8 @@ struct loongson_edac_pvt {
>  	 * register state.
>  	 */
>  	int last_ce_count;
> +	u32 mcs_per_node;
> +	bool mc_idx_valid;

Why do you need a silly bool if you have valid indices in any case?

You either get it from edac_device_alloc_index() and in that case, the node
number is always 0 and when you get it from ACPI, you get the right thing
anyway?

IOW, you init mc_idx properly in the probe function and then you're all set.

>  static int read_ecc(struct mem_ctl_info *mci)
> @@ -44,7 +47,8 @@ static int read_ecc(struct mem_ctl_info *mci)
>  static void edac_check(struct mem_ctl_info *mci)

In a prepatch, please remove the "edac_" prefix from all your driver-local
definitions like edac_probe() or loongson_edac_pvt. The edac_ namespace
belongs to the EDAC core functions. Since your functions are static, you can
simply call them probe(), check() etc.

>  	struct loongson_edac_pvt *pvt = mci->pvt_info;
> -	int new, add;
> +	char other_detail[64] = {0};
> +	int new, add, node, mc;
>  
>  	new = read_ecc(mci);
>  	add = new - pvt->last_ce_count;

...

>  static int edac_probe(struct platform_device *pdev)
>  {
>  	struct edac_mc_layer layers[2];
>  	struct mem_ctl_info *mci;
> +	struct device *dev = &pdev->dev;
>  	void __iomem *vbase;
> +	u32 mcs_per_node;
>  	int ret;
> +	bool mc_idx_valid = true;

The EDAC tree preferred ordering of variable declarations at the
beginning of a function is reverse fir tree order::

	struct long_struct_name *descriptive_name;
	unsigned long foo, bar;
	unsigned int tmp;
	int ret;

The above is faster to parse than the reverse ordering::

	int ret;
	unsigned int tmp;
	unsigned long foo, bar;
	struct long_struct_name *descriptive_name;

And even more so than random ordering::

	unsigned long foo, bar;
	int ret;
	struct long_struct_name *descriptive_name;
	unsigned int tmp;

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

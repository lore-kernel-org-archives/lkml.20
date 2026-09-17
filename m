Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986E43EFD1F
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789632719; cv=none; b=Q8yTsWsp95lfWB7TiDnIfiTROv4x2yVv7ZJW6p9+44wNU2eK6Jl7OQEWf/SaxB34FGOh09EDJ1rYnFoH0mD7ealWfVbnihIDqwrGpMDwCY0f/wQuU31ks2JrgalwAW8r3asWuhwdTUpH1cs8LWwD0f0fiUpDeAg6yXpRAEbFAAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789632719; c=relaxed/simple;
	bh=aXi4Ocl4wPLP6DaqHSusLJmAe9fUehN8EncBiZqZaT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RxcL2D9756BiQCYaYl8B3sqIqfgh1hBKSjrOqgwaDEdEQBg71a//r3yWb202lrMcvvfhaqxREifjCyx3FJ4SUmXKqFDHj04/wPMuor60ATg0xFXZOmLyTJGdQH7uEbheiSUJnUFvScFpYYFT6qYkUpJYfjuQlsDf2JNY+mmyiUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UTY17t2U; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UTY17t2U"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so2432895e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789632715; x=1790237515; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fAnlR2dtGuXBbIrYg+IuvuLox4jTD1pnpks7H3lzGUg=;
        b=UTY17t2Uka+1gu+2nEo/zLhkh2d56fc5F5iW0iC7t6Mce/6Z9QPlq7nk0LXp5OEYyi
         byI2k1D12ov9XV58yaMim7dOdTiEiHIglGzxonOoxUYHT4IkqN4eIUVl7E4w4vHsZwBE
         wXheRV0fRltVEx1AYsoFq66PFgl3h2wqQf311wIx2oKLzm22Ucss34ngiF1CqRyvF/rw
         eyx5PCBoNxWJ/2z05jG1kB3IuMrmmhj5wKlmblKc7CHTsQG9PVlWim81qDlxZq8AIc3o
         GZbsS2K7TxFFscYDcPHbNQiY5oQ6IIINLA7TFgahxbc0Ar97Ffogd6BQmUzFbOdAWhpv
         qPGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789632715; x=1790237515;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fAnlR2dtGuXBbIrYg+IuvuLox4jTD1pnpks7H3lzGUg=;
        b=a7NmP2Cs9CSB0uCYqXy3jQTihsYJFZE6ts0kuhlN8CIddA+WKm8S+GOJJhM2rNr7US
         OJzjBTenQDXAOZ/FjPf7LOhBINAUEvBj5ZCd1fYOXYrl2pQ0ONiWLBun7nk129GHvHO8
         sd1a4Uame4to0kYU0ZMUZW8mqq8WPLnZfnQlg72Bt+57TTqeUwLrsL6h7loqCLlwV3WM
         XJuep3sVs+eJN6GZraQmFLCmnDpW8r1+u8wDH1EESi38gy4WhWkFNMtxd0s9cfdcmwkT
         9B4xEjnzXhoN6hiIsmc0G7mloqh0YleaYO8/jjBJ/BkMcYPXMv27LOFtCGHPTLY2sJPk
         IDIA==
X-Forwarded-Encrypted: i=1; AKwUvByPYHkb+wixsdI3+RHsYdewO6AnoQoSc/ItORaJfzisr8K2l7pJ4fzmweRarAAhRdOV5PqD296/mcu9Kjo=@vger.kernel.org
X-Gm-Message-State: AFuF++k0wkHLDSks2on6UM2+EcimmxhNeVnrzRmXiHfn5bGFBrsWxV84
	pDCDwj15WmkPw2ieg+ViNzz1w6AI32Pmu8xtCNCen61OCl4N1eMpXc2IPcwd7Zoi02E4SDoLhrx
	4HLDvQw==
X-Gm-Gg: AYBFou1GjePt3UVUHf3D2LN/YsN48R720jBiLnTkULdaGPHnGPzdcx1UAJnQI//3DE2
	QvutxiJmXlGN43vHl3LdhpWHlecRhPzyc8haHb0CLJ2de9zWIVa2j5yIC/J+hDALuK/V/Tjv6Vz
	REV18KwdjWjXvAarW//2+dWYp3okx+4EOSH2PzvrHz76Fn0o7QIhueI4foOdLyePPsmP8qawIka
	0E40OtuQRKAfs4BgnRAYXy+El6dooR3AT4kjuqCA1BskT7WQLhdNFwXWLqJNSwPhntZ3k8zCLy8
	pJNbSC9k4xwaDL62C/rm6911CRZMogpQZOq8VkTdrpBG7cCKcoQvG2PxEO3lnCDvBcyTuSMzp5g
	9Fv7dWNT3jvkqm/RUlK9dmF5seQsx7un9SKd+7A3uaMSp+yjqVS9jf8m3U7g55myiqLom1j3Z/q
	DQMkItu+GVw1UhGlM5L6dtGlpuv9L/YSQC2nJXecjcP14ZED5YZmwHRzLjPsfyKp8Rbyx9slde/
	8YFdx0fNA+5+PJdsoG4ZGlELgta4jutQtIximY8/jQmJ5lDWPG3Ug==
X-Received: by 2002:a05:600c:3b97:b0:49e:6050:9fbe with SMTP id 5b1f17b1804b1-49ebcc010d5mr137864965e9.15.1789632714827;
        Thu, 17 Sep 2026 01:11:54 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd22dbf2sm50558415e9.10.2026.09.17.01.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 01:11:54 -0700 (PDT)
Date: Thu, 17 Sep 2026 09:11:50 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Sebastian Ene <sebastianene@google.com>,
	Itaru Kitayama <itaru.kitayama@fujitsu.com>,
	Sashiko AI <sashiko-bot@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH v3 1/2] KVM: arm64: ptdump: Check the page tables aren't
 freed when accessing
Message-ID: <aqugxlnqegPzMpB-@google.com>
References: <20260916230337.4162485-1-weilin.chang@arm.com>
 <20260916230337.4162485-2-weilin.chang@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260916230337.4162485-2-weilin.chang@arm.com>

On Thu, Sep 17, 2026 at 12:03:36AM +0100, Wei-Lin Chang wrote:
> An open debugfs file keeps the KVM structure alive, but does not prevent
> mmu notifier release from freeing the stage-2 page tables when the VMM’s
> address space is torn down. Therefore page tables belonging to the mmus
> could have been freed when a thread opens or reads the ptdump files.
> Take the mmu_lock and check mmu->pgt is still alive before accessing the
> page tables.

As Sashiko said, the read_lock is probably enough, including the existing one in
kvm_ptdump_guest_show()

With that change:

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
Tested-by: Vincent Donnefort <vdonnefort@google.com>

> 
> Also for the ipa_range file and stage2_levels file, switch from keeping
> the pointer to the page tables to keeping the pointer to the mmu.
> 
> Fixes: 7c4f73548ed1 ("KVM: arm64: Register ptdump with debugfs on guest creation")
> Reported-by: Sashiko AI <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/kvmarm/20260623144054.B91D21F000E9@smtp.kernel.org/
> Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
> Cc: stable@vger.kernel.org
> ---
>  arch/arm64/kvm/ptdump.c | 43 +++++++++++++++++++++++++++++++----------
>  1 file changed, 33 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm64/kvm/ptdump.c b/arch/arm64/kvm/ptdump.c
> index 69899797dbad..4ead856c181a 100644
> --- a/arch/arm64/kvm/ptdump.c
> +++ b/arch/arm64/kvm/ptdump.c
> @@ -115,15 +115,28 @@ static int kvm_ptdump_build_levels(struct ptdump_pg_level *level, u32 start_lvl)
>  
>  static struct kvm_ptdump_guest_state *kvm_ptdump_parser_create(struct kvm_s2_mmu *mmu)
>  {
> +	struct kvm *kvm = kvm_s2_mmu_to_kvm(mmu);
>  	struct kvm_ptdump_guest_state *st;
> -	struct kvm_pgtable *pgtable = mmu->pgt;
> +	s8 start_level;
>  	int ret;
>  
> +	/*
> +	 * We only need the pgt start level to initialize the ptdump, get it
> +	 * while holding the mmu_lock. It's fine if the pgt gets freed
> +	 * afterwards, we'll check again when doing the actual dump.
> +	 */
> +	scoped_guard(write_lock, &kvm->mmu_lock) {
> +		if (mmu->pgt)
> +			start_level = mmu->pgt->start_level;
> +		else
> +			return ERR_PTR(-ENOENT);
> +	}
> +
>  	st = kzalloc_obj(struct kvm_ptdump_guest_state, GFP_KERNEL_ACCOUNT);
>  	if (!st)
>  		return ERR_PTR(-ENOMEM);
>  
> -	ret = kvm_ptdump_build_levels(&st->level[0], pgtable->start_level);
> +	ret = kvm_ptdump_build_levels(&st->level[0], start_level);
>  	if (ret) {
>  		kfree(st);
>  		return ERR_PTR(ret);
> @@ -149,6 +162,9 @@ static int kvm_ptdump_guest_show(struct seq_file *m, void *unused)
>  	};
>  
>  	guard(write_lock)(&kvm->mmu_lock);
> +	if (!mmu->pgt)
> +		return 0;
> +
>  	st->parser_state = (struct ptdump_pg_state) {
>  		.marker		= &st->ipa_marker[0],
>  		.end_address	= BIT(mmu->pgt->ia_bits),
> @@ -211,17 +227,27 @@ static const struct file_operations kvm_ptdump_guest_fops = {
>  
>  static int kvm_pgtable_range_show(struct seq_file *m, void *unused)
>  {
> -	struct kvm_pgtable *pgtable = m->private;
> +	struct kvm_s2_mmu *mmu = m->private;
> +	struct kvm *kvm = kvm_s2_mmu_to_kvm(mmu);
> +
> +	guard(write_lock)(&kvm->mmu_lock);
> +
> +	if (mmu->pgt)
> +		seq_printf(m, "%2u\n", mmu->pgt->ia_bits);
>  
> -	seq_printf(m, "%2u\n", pgtable->ia_bits);
>  	return 0;
>  }
>  
>  static int kvm_pgtable_levels_show(struct seq_file *m, void *unused)
>  {
> -	struct kvm_pgtable *pgtable = m->private;
> +	struct kvm_s2_mmu *mmu = m->private;
> +	struct kvm *kvm = kvm_s2_mmu_to_kvm(mmu);
> +
> +	guard(write_lock)(&kvm->mmu_lock);
> +
> +	if (mmu->pgt)
> +		seq_printf(m, "%1d\n", KVM_PGTABLE_MAX_LEVELS - mmu->pgt->start_level);
>  
> -	seq_printf(m, "%1d\n", KVM_PGTABLE_MAX_LEVELS - pgtable->start_level);
>  	return 0;
>  }
>  
> @@ -230,15 +256,12 @@ static int kvm_pgtable_debugfs_open(struct inode *m, struct file *file,
>  {
>  	struct kvm_s2_mmu *mmu = m->i_private;
>  	struct kvm *kvm = kvm_s2_mmu_to_kvm(mmu);
> -	struct kvm_pgtable *pgtable;
>  	int ret;
>  
>  	if (!kvm_get_kvm_safe(kvm))
>  		return -ENOENT;
>  
> -	pgtable = mmu->pgt;
> -
> -	ret = single_open(file, show, pgtable);
> +	ret = single_open(file, show, mmu);
>  	if (ret < 0)
>  		kvm_put_kvm(kvm);
>  	return ret;
> -- 
> 2.43.0
> 

-- 
Vincent

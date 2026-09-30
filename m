Received: from mail-lr2-f34.google.com (mail-lr2-f34.google.com [74.125.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDEA14F93A7
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790784426; cv=pass; b=ZEjozdnCf+d6Ukp60mGnbF8hG+m716DVsMhnRuq0Tzxz37nBUJXgmd/F4KVrfJJNtlrCncIZQ26kRvuIGlA4WCtxGmgy2eaUyYCdUEoJB00CVMCpOjd/VtqvxNwth6jXw93PsWh6Eqd1Mq++T2V3clfBvbXNNhUqtjng2qmUFgs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790784426; c=relaxed/simple;
	bh=Mr1y+u1OF3mjJvkZyDof7OV8WyZGPL7d/VHEFCAfkdI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PEl+R3c0BLkZ7F9h4IaMFLnRBtrX7ATRCxhr3TTVXqpbNww+mpjSjcU4Q/SIzeq9d2vLvL6ErSicUWmkplJ+o22gXf3d4g3Y/07g2iZriDJ4KPYR8iVzDAIFY9/6VUF4XjI9fDJz7iRtJXGrQlMaprR8k1dG4wDcphKYmNsCwis=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i3e6jQTp; arc=pass smtp.client-ip=74.125.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i3e6jQTp"
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a76b373063so14731631fa.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:07:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790784420; cv=none;
        d=google.com; s=arc-20260327;
        b=lyvUHchVZU/wCGOmbdA4TFXsMN1tSy5w2QuQwr+a31P8jnU+1adyIiQ1yrmgE4x1K1
         +DMgLAlLe0TfUyf/2p9jOXnHyXgWFMhOwBG4KPHFoKuHUhqwlmSC4TloxdYoyc4Whoqo
         y9SS1HizpgKWVxYI+HBiCnffBHgAhUeOvBHJZK1sIjjaqI2arSv0lhO/MGNTvSaOOcQg
         4gY/9HTvN4FDbMCCRq1Wep49BbxGHSTUXFrHtfTZQFwcN6/y0TOLjULtggpMnLe6tt0D
         9ksT4R2sQqnSIVfyfgSkyZabWjeQJAeFO4KeZAo0LT3HkX2dORi1La/hLtGDfGzKXxV8
         BlSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Mr1y+u1OF3mjJvkZyDof7OV8WyZGPL7d/VHEFCAfkdI=;
        fh=wb9B+NgPRdNZaM73dRn/CJhiI+2Z3iTwh413tItXYzc=;
        b=qkElX/s7sxXVC9pbxfOO5ucvw3ObEHNcifRAz2mbMioq/zordBzrHYcCiP31En3onZ
         YJ1UYnGGBvtJHxk3C4z3z5/i0Ne8i2AuXKw22CWh+Ky8gqRBfROtloonugHn92flG+RF
         i2QfyNp4dX4xtneYYnbcGfCryIiu25bfYlUWANQ6nbQzUPi3H/qdmwFe+fB2nW1mtv38
         2JsPg5BikxmCs7iPNuVeT4yC5+U2mIpX7Mw1s6rqd6IMxiwPRvvZhZM8gOXAV8SiVC5c
         mukizIXM5VJfQXKXwwFaTLh3hnSdqG2mpRL44iSepfKe4Sr6q0QSIlWijMjSNe5R4fhV
         F7Tw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790784420; x=1791389220; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mr1y+u1OF3mjJvkZyDof7OV8WyZGPL7d/VHEFCAfkdI=;
        b=i3e6jQTpk9MFny+zRI9ShvLMAzlRUcpA+oB6Rj/87c6z/Ycuj/O3hBMFm6AhN4VmEe
         Ap72V6o6OUVJwerxwdxyCltDppotx2h3NY9WaFRWSiTxltHj3swblyxki/CFv0E6+l2H
         mgQ8SERM/Ew7RixtLQoT2tPKuiEHjoeX8cjankMgp5mlR3CpuHYsvcKE2Mcu2A3NS9fH
         itaOBK/7LH2PYR4bqiE8D+oPoZvstewlKtayfZT/CM+XTB0TWUOR+dpnzNWLPNHdZ/tv
         ROU1Vhb+k49BrY/fDs170g4kw+peWKckXMLD30kqXWeRHy2KylhmIogDRH/WoMg4HabO
         5z+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790784420; x=1791389220;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Mr1y+u1OF3mjJvkZyDof7OV8WyZGPL7d/VHEFCAfkdI=;
        b=JRKmerZNwPZX9d7A0ddS+70lH4rdkBHN6pVTvnM77MMImS6A11BpNczhFvIKIUj2cF
         HScD51iqHLVNoCqvNg7r4XdH5J0SmfxCDRtb+yQ+blaVaK/CBnVIWlbad1q3HivowWVm
         I7e/MoON7AfNmuo1RQ37Gke0g2pafpxtG0rTDEbNI4zQts2Dd1MnOZw7dlRdChFIAz/l
         ENbUks52p2JImFaNhQl45iH21f+PhkzjbV6IXbmcc06VTnzwi7xrg8F+T17oyNKA5ToA
         O/MljicL7li/pjFkWpKm18fu/tRjNIpvk+KANmP9qVVK3mBC6WcY+/6t114Fg1gSbjgM
         SKbw==
X-Forwarded-Encrypted: i=1; AKwUvBwquHf/htsXDJbQpM9A5PrWrzb/a60whlxH770BFYGAbeNuYRbCPbfmYee4oNnxk7uD2Rhmsntkx7X2m20=@vger.kernel.org
X-Gm-Message-State: AFq9FYLiOjHFzOOxn+QpVLFYxNWitS9NzvVJ917Y6AZs4jY0P+sZ1d2e
	DxwWDf9btY0zZ3pR8elffi/HE9h0W32Zrta9TZo5hRE5iWSU1AB4K5BZ0UjUxXyWohmXFRtvuPb
	8zKu6wEqnmBAKAp+WRAJqQwY4NwstzlU=
X-Gm-Gg: AYBFou1yrljH2oTEv8/b3Oi6Cp2wUB3HFS41kzKi82IV12ouTwta78YuU/IAsqUi0hg
	KF/Em16pChQvtiUxoZGxFAv73N7BeIFtWVvXHlcEXJegA2jY3h76dCzSf7/QOnojWImgjpsnWJ8
	6Xw6GIvijlqsvldfBo+JMRchSSNuDCikK3nvgEM1Payq/r7YrGCks8WoKEMbc+bJpxXgTBEDdwG
	RTAA4lQtxylOVcVFULYUDjfBvNnykVdRmnyP/RLPa0vGEbGiih8EQSY9+MdqrFYWmcwTjv8H9Jq
	iBOeEkrO9lxLP1GAPGIAYIumrnDOqPMC7Ii8iDO4a86wpMY0HAJmGnFyrA==
X-Received: by 2002:a2e:ae07:0:b0:3a7:6d4a:1c9e with SMTP id
 38308e7fff4ca-3a77920702bmr5335761fa.11.1790784419801; Wed, 30 Sep 2026
 09:06:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923234819.702327-1-oss.patchbox@gmail.com> <20260928091551.GK13925@horms.kernel.org>
In-Reply-To: <20260928091551.GK13925@horms.kernel.org>
From: Yuho Choi <oss.patchbox@gmail.com>
Date: Wed, 30 Sep 2026 12:06:48 -0400
X-Gm-Features: AclHuK_HJEwr8rDcX7-6pNmp93VhndPAHBA6EzKYzl5-IOAv0A5_y9agapxl7BU
Message-ID: <CAGG=RgBNpQLy3s7Zqf1=TpN_grUOha8Cu_UVmjou=qPe0RBqiw@mail.gmail.com>
Subject: Re: [PATCH net v1] idpf: Fix vport IRQ name leak on request failure
To: Simon Horman <horms@kernel.org>
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, intel-wired-lan@lists.osuosl.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

I appreciate your time to review this.

On Mon, 28 Sept 2026 at 05:15, Simon Horman <horms@kernel.org> wrote:
>
> > Fixes: bf9bf7042a38 ("idpf: avoid bloating &idpf_q_vector with big %NR_CPUS")
>
> I don't believe that commit introduced this problem.

Thanks for catching this. I'll fix this tag.

> name is allocated by kasprintf() which is a wrapper around kvasprintf_const().
> And kvasprintf_const() documents that it's return value should be freed
> using kfree_const(). I don't think it will make any run-time difference
> here, but perhaps it would be best to follow that convention.

kasprintf() uses kvasprintf(), not kvasprintf_const(), so the name is
always kmalloc'ed and kfree() matches the kfree(free_irq()) used on the
normal path. Please correct me if I'm wrong.

> Also, for completeness, shouldn't there be error handling for the case
> where the allocation of name fails?
>

Agreed, I'll add it in v2

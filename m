Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875BC380FE7
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 22:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789166970; cv=none; b=oomtk9P+slcRMnxmByOtDOjyjmizh3qdYe/sS3wr/jOr4qUXQN5Q3gsMPOGcptLKR/fmB4G4kdE+53nsNOj3NK4pzc1bVGZ7YgCmlcpv2dpIdlY+OhsHqmtAZqwbq5m7kV6Quqz0mgr744tHDRZRzwAy8L0RaFmki4GfbbFofzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789166970; c=relaxed/simple;
	bh=r7gJUmlNhu91hRTpaNPKWXWjU0T1D5vdR1MPcCbBlXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SmChvSYOsdDhUYCIGbXesgodOhh4PC4Wd3ArANBp91UjRqFCisEcZsPPmVKtUMMViLEiCZpJqphx6gMxIR1DOsoOp3IEOMaVmzHRCxVow9EzSVysCGlJ3kYlPxJInvrxXEsrZ4Ib/DOPU01zB4F9FJo/CZwg9XNnjDZDoN6LcDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M85Y2Yjy; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M85Y2Yjy"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49e63568bfbso10492885e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789166968; x=1789771768; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QBxB2AmGJkKp9i5tKgUFrxZA33MoBn9KXbxevCCY/UU=;
        b=M85Y2YjyUtIsPAC+mGvNqZZ2yBZLcF/CM9+4iDMCN1Nk4ohckcNoBPcpWvfuvqBNDK
         QmYElMs1LN8P8Zr7EVBTE8H3pCpvk2eACjEPCV9N/tUVD4NNlMtTBSSTjPJakSsDCcNA
         Gp6yexVnMqd2aluKyae4JspeAqHz/Pnc+33YGDRfrFeU69gRfkUiIfp0UgRcFk3Icuzz
         bFGIemVen4RMy/nbN/IWeW+sMI2lWvVpn7EenB9bWwh/xNEKtG+nbLtQyamwkWCd1uxi
         bvkuFGZQXuUnvGUDRjwNAgYWLgpGrdwYdkZZhhQ2KkGsYjOIPRjkRy7VuJUG4+dZTMTq
         EuZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789166968; x=1789771768;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QBxB2AmGJkKp9i5tKgUFrxZA33MoBn9KXbxevCCY/UU=;
        b=gUVgffXSPK2XPlpmjv0GTaX7efovnl7UzW1Sd2dZyVw5kRXt5xZY2n915DOlLTbTL8
         qDodOCo88pGxnftaOHgDQpD2U/x/oSDXWEbCEI0E/Owcfnu2qCYm6fTjo3tNROi1Rijf
         A3lwaptlOE/ccbQH+9IQ0PkZtPbFKcj8pnrtJgGEvu8Wgc5aaDh5m7VlOM0njVTh1UVm
         bx/UDTsfcHpiWrgK1cQnN5pkUcxph36Pnrz7iEj/t/KZPS8OlbL6lloiRD1tBFhkPIKc
         RlzlGYZucZ0abUhWyVc4rq6iaErtkhHiVJUzc5pTKen4EwuZ4JzXsPAeu2X9EMWLoKoK
         dG6w==
X-Forwarded-Encrypted: i=1; AKwUvBxbS7tmxCfxKhba12g36nGE4vb21rNniAcs3rH2v5aB1QS0qeYU0rULrSpnq8yNoDgtBbB1YsHreeBfJ4Y=@vger.kernel.org
X-Gm-Message-State: AFuF++kYwLtSzrGyHrlxseixjBhGSOg1heHOqq0cKmL1GzanAbVHd/Yv
	w9QF6lZkeIIZaZ5P/c+r1sk5d3Q1jCrwwIKemMci9thfpcxKtAFl+4C7
X-Gm-Gg: AYBFou2d1DhHbTlL4ZUa9oJA0yb+/yvzgnDFe+mVaByOamqTwLF3nuW+LJsaptgWcfB
	+ZjilcKmUIfN8OQnQHMBC8kg0NWFfTitoxJnIGUhg3cjExr/W7mAarxdHwBLJA1h6y4XRhyy328
	PhsS3iyRrNeUVDW1HX3Tq6IcnbheVyVI2NRMtsspNsF3+1R/1OG8SVLEDtwGFTSdSALNvbh0ib1
	wR0280MZskP84W3Z5n9utwHSIplPHqnmIcTWtsJU59K0d2SzkQSZ1yF0CaoNiHOKqMB47Vb03/Y
	oyEH9y4560ksrXV7o+ibQRLD6CQzkrzCCbs3TanhiBBtHUuZGQU/FXRK24SuP0/MJkl3DQqH8qm
	uDH4nM0ZPEvBdnVqomRMJd7JzcMTkIJ9amhuemqdb9L/C18+gF687lczC9SdwwAbOKxStW32Uag
	nU+SeqGDUrmjIBvl5JATbscAHzmSTgc/eVD9HQGtznHRbh94OFSEJ7fvPbktqBgGP7dxcDJMYuL
	IW0pDRXYPZw4omPhZPTdVmEuWVVaaT5LvRvC4C8Kpa8S+xhf7X2EPsYXImD0qk+56Mzpg7//tBG
	aJ7r2DIyfJ4t9zu/tKs/hPRxg86xxP/e/g==
X-Received: by 2002:a05:600c:1385:b0:49c:fc6e:8cbd with SMTP id 5b1f17b1804b1-49e619e86c6mr62588065e9.33.1789166967648;
        Fri, 11 Sep 2026 15:49:27 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-095-114-033-154.95.114.pool.telefonica.de. [95.114.33.154])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb36e4a6sm9132172f8f.37.2026.09.11.15.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:49:26 -0700 (PDT)
Date: Sat, 12 Sep 2026 00:48:54 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtualization@lists.linux.dev, jasowangio@gmail.com, 
	eperezma@redhat.com, xuanzhuo@linux.alibaba.com, jiri@resnulli.us, 
	sashiko-bot@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] virtio_pci_modern: move avq cleanup from reset to
 del_vqs
Message-ID: <aqSDrWpFy84CxCoP@gmail.com>
References: <cover.1789160982.git.mst@redhat.com>
 <d0b3de807c800befe9adce1cefb2d064d9fe0bec.1789160982.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d0b3de807c800befe9adce1cefb2d064d9fe0bec.1789160982.git.mst@redhat.com>

On Fri, Sep 11, 2026 at 05:20:15PM +0100, Michael S. Tsirkin wrote:
> New in v3. v2 dropped sync from modern vp_reset in one combined
> patch, leaving avq_cleanup in vp_reset. v3 moves avq_cleanup out
> of vp_reset entirely into vp_del_vqs, fixing the race. Adds NULL
> check for admin_vq.info for find_vqs error paths.
> 

I think patch 3 introduces a use-after-free in the MSI-X setup error
path.

With VP_VQ_VECTOR_POLICY_EACH, vp_setup_vq() stores the admin queue's
info pointer before request_irq(). If request_irq() fails, vp_del_vq()
frees info but leaves admin_vq.info set.

vp_find_vqs_msix() then calls vp_del_vqs(). vp_del_vqs() now calls
vp_modern_avq_cleanup() first and dereferences the freed pointer:

    vq = vp_dev->admin_vq.info->vq;

No interrupt needs to fire.

I reproduced this on v3 with KASAN by returning -ENOMEM only for the
admin queue's request_irq():

    BUG: KASAN: slab-use-after-free in vp_modern_avq_cleanup+0xf4/0x110

KASAN shows the allocation in vp_setup_vq(), the free in
vp_find_one_vq_msix(), and the access in vp_modern_avq_cleanup(). Adding
*p_info = NULL after vp_del_vq() made the same test fall back and boot
without a KASAN report.

Thanks,
Karl

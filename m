Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949F8360EE5
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 22:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789167116; cv=none; b=DWCBsfphEQTbC10U5su8+CyySlbW9drno6Tomt83FHQvvL+vB2hUu2wmScS884ARoZdKQWDH9zvVq3SQNZZ/QZIGIGxhELv8G4Q4cL/NhgWSxLvAYt2V1wCKU2h+v6uMxb5o058+ea5uICRv/mKuyp9m9pWdtebFeN/QE7KJdWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789167116; c=relaxed/simple;
	bh=GfVdI+6U5Ub5l41aZwdFVfxugZPb6OlXikwNEihQr3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DkuSJKI21jX6GAiKSVCOnSPDn+Q67wJjnQkHLvil9YR+7Y31WkBB3Bu/4NoFN5+6y1grIMN1oTmwLDW3oElTPLZayqO/MoukvwqoKbtB2Yok8WtQ3lsJNdC8bYncVWGQTgCFBMuri1RNsIbfSjcbIDZxG0H/apzo+hUJK6fVB78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R9s3rzwp; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Tzhy81Vr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R9s3rzwp";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Tzhy81Vr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789167113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jQ6AshrF5wH31i2uOHPrbuYMla+mjtSA/+BYLCsl1e0=;
	b=R9s3rzwpjE9wopZ2Jmwjp08MGdLYJ1f9IaQwz/o1VMEVHrbNGD7ovd+ISxF5t4mNHPfGIX
	HMqdJBu0uII9iC6gDv335Ix9gjLXLeczztbcCil7aI0/nLDK+8KfWOjeYtCC3xC2bP1Iw/
	xQRcDRuraav23Suq5LiP0lFXOlPDLGY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-322-Mf3H9o91NlqKMJdt8xI79Q-1; Fri, 11 Sep 2026 18:51:52 -0400
X-MC-Unique: Mf3H9o91NlqKMJdt8xI79Q-1
X-Mimecast-MFC-AGG-ID: Mf3H9o91NlqKMJdt8xI79Q_1789167111
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48597bbd963so1053504f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789167111; x=1789771911; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jQ6AshrF5wH31i2uOHPrbuYMla+mjtSA/+BYLCsl1e0=;
        b=Tzhy81VrrWVZzGOI4cUstKamSyp8TWO+et1MsHAHdA589E3JZQZ1jYPG/iEqCbZCbv
         b5O6BN2sFUKifUmhQ8f6z8fA7LDJv37LUyNNtKSNv/8gmKklPSc1uiD+W4hccWcb06oR
         l9aUiKF9f3AEdrGYFJReC2i1UeletQnKIAWW+HUw4doXkL26XTpqq1Cal2mA0yhBxVZw
         rtl0rtBzqePWjtMYbP7OO4CnPrzunUPmo7AS7r5JaoweHhuiWTQOfSnerQXKsIArtZCt
         neiENxSj/12oCM5h/RmO48koegMoAFbGGkN3yzKyRkvh5fD80N2zxS5hFYdhmjXMDX+y
         UK3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789167111; x=1789771911;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jQ6AshrF5wH31i2uOHPrbuYMla+mjtSA/+BYLCsl1e0=;
        b=kYA/zKFNiUS93fGPxJ73GPelrJ7Cngp4EsdHDtpv7uNn6TmnTXt6Yw66heFGxZEMEK
         Gg+t3kI9AuyGfOwYElZ7fRDvQNrQV97yfH1Z/+8Mqfx/sF1NbXOKN9geGIpkVBdUAI3P
         1Ij6v9lgLFEyhnjqPc3DvQ3wlRLi1fJlApsIsIcj9AHLiTsiyjQd8BknsMA5W5UyCawp
         PMlsZceKS8kjVEeglT9se4yNC4LkiQ8XjuB+Z1tiKz8T/zACTB0ETaxJBVnCO0OGOFgM
         RlHjlUuryXUSrPnyHc9erazxFG9AGZBTWjXhZGgeBTR6UkJ10VPdI99mtemiWD+ixGrK
         HHmg==
X-Forwarded-Encrypted: i=1; AKwUvBxDayEQvlIMnVVUCGC9m+ga8pOcYctlhiITmT7NEXRo+NqtwgdZcaoDJKx1RyIcH28W0kBx38BdhM0uWIg=@vger.kernel.org
X-Gm-Message-State: AFuF++ljJLG+bq1QcXPDMYa1PQDAiVKwv60HVo87XRLKKkyQK04hmvH5
	De5xLeZgosOp7TJvSLrOaKk6JTkrxX3GbtYc1CAUqOOJpgZ6fI2DAq+s+ZKw4V7fCHqfNL5H0r2
	ZYBlTdJBoUGLRRwpVGFh3cOvNWi16Tnp1PPNm4G0TY/jK+usduNfU28mu4TDhlqneWg==
X-Gm-Gg: AYBFou38FAese7Teh8R1ASNyRuzGfd4xXN9FPNBMrkMroE1BHVt522/a+CsUQkfzz58
	vTkrO0KynVLFqq164i5WxmfJi6kei1XAhSmQJQ8C4lo1a7kzVfFZQwbYZ77ip+bRih8nZ29DJr/
	95Gj2P+sSiiUl/WZ0MYVa4v5TnWSqw+2LmOqONyzbZSUi+otnlOCGfju/oD+alCnPy6KgPSHqa6
	z1zByjnlaxyelX15eJjMIN6u1DnT24sNPQV6lA8GRjU94ENqZnPsC3qeKXXlhdaBH1RRBWCjSW1
	IEcO1//l1/NiqYeS9c4bHJxFm+mJnMHU2iZQuwdYurJZ5RDsyAC1YKwHXON3aZaxbuI=
X-Received: by 2002:a05:6000:5c6:b0:486:f4ba:ce0a with SMTP id ffacd0b85a97d-486f4bace38mr5083502f8f.9.1789167111057;
        Fri, 11 Sep 2026 15:51:51 -0700 (PDT)
X-Received: by 2002:a05:6000:5c6:b0:486:f4ba:ce0a with SMTP id ffacd0b85a97d-486f4bace38mr5083460f8f.9.1789167110617;
        Fri, 11 Sep 2026 15:51:50 -0700 (PDT)
Received: from redhat.com ([147.235.223.59])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486f301121asm4513415f8f.0.2026.09.11.15.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:51:50 -0700 (PDT)
Date: Fri, 11 Sep 2026 18:51:47 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: virtualization@lists.linux.dev, jasowangio@gmail.com,
	eperezma@redhat.com, xuanzhuo@linux.alibaba.com, jiri@resnulli.us,
	sashiko-bot@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] virtio_pci_modern: move avq cleanup from reset to
 del_vqs
Message-ID: <20260911185059-mutt-send-email-mst@kernel.org>
References: <cover.1789160982.git.mst@redhat.com>
 <d0b3de807c800befe9adce1cefb2d064d9fe0bec.1789160982.git.mst@redhat.com>
 <aqSDrWpFy84CxCoP@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqSDrWpFy84CxCoP@gmail.com>

On Sat, Sep 12, 2026 at 12:48:54AM +0200, Karl Mehltretter wrote:
> On Fri, Sep 11, 2026 at 05:20:15PM +0100, Michael S. Tsirkin wrote:
> > New in v3. v2 dropped sync from modern vp_reset in one combined
> > patch, leaving avq_cleanup in vp_reset. v3 moves avq_cleanup out
> > of vp_reset entirely into vp_del_vqs, fixing the race. Adds NULL
> > check for admin_vq.info for find_vqs error paths.
> > 
> 
> I think patch 3 introduces a use-after-free in the MSI-X setup error
> path.
> 
> With VP_VQ_VECTOR_POLICY_EACH, vp_setup_vq() stores the admin queue's
> info pointer before request_irq(). If request_irq() fails, vp_del_vq()
> frees info but leaves admin_vq.info set.
> 
> vp_find_vqs_msix() then calls vp_del_vqs(). vp_del_vqs() now calls
> vp_modern_avq_cleanup() first and dereferences the freed pointer:
> 
>     vq = vp_dev->admin_vq.info->vq;
> 
> No interrupt needs to fire.
> 
> I reproduced this on v3 with KASAN by returning -ENOMEM only for the
> admin queue's request_irq():
> 
>     BUG: KASAN: slab-use-after-free in vp_modern_avq_cleanup+0xf4/0x110
> 
> KASAN shows the allocation in vp_setup_vq(), the free in
> vp_find_one_vq_msix(), and the access in vp_modern_avq_cleanup(). Adding
> *p_info = NULL after vp_del_vq() made the same test fall back and boot
> without a KASAN report.
> 
> Thanks,
> Karl

Right. Besides, poking at modern from common is ugly. I'll rework this,
thanks a lot for the testing!

-- 
MST


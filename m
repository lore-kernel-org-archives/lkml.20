Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792762445;
	b=SVZkXg1XilVu+464Yb1vBaLd9s9OpA9Ymf8qi6CpnG2uJr+f0ockNcO0k2libloGTvLX
	 CUUopT6klHNPup851Y7+zUUwFG23g6OG/29kdBqaDttA3Qy1QEpX9GfIHXgesrMiAFFrd
	 cfJX8Eqf2PYmqkJgw/2qkS33KWXw+zlaXZ/7Cjt/BtWXVAcned64rdnAulp+jfGn32oQm
	 xW2cWR0AvABhJ0T9abTdv+QNpamyxUT33Bd5rwJVF7/YxUPClmvrgwGCrUMotm+OWwO4V
	 /KzlfQe81OHQfhZHfebU++wKyXJctIFsLhjXn7H0Er3fNoPIPKCQFEk1v7YH0ojpbQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792762445;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=TCmOnrpSb85CkuICZLkuWER882/FvQFFbKeLZboWFbc=;
	b=FJlSP4xbdCu+reE6Z3NwY1WqGM81/H+sAcDms3fVib2mOyyqxw6s+FDWq8NwbSedYQkq
	 C0tj02yVRA/kFczyx6Uj2NVn2ZVhYL7C9AVI1bGqgLFOgxJqMdFi5FBSGij3ey0ThK+2i
	 DcyvHfqqBQe0hmA52nU56nbBNuVZ5fm49UhCB/gniE4J+pJYO95eFH1ZJxyCweWn6+fpq
	 VRqM7xzfFGDayZhcAv5KWbdf1ZreO3UddcFkcPraRJmPcJOmc322FHMI8NEVEoR7E5wSD
	 7wwRsVv99XY9xvfpa7P68eY5BbbbOra4j/QgkJ79Rfe67B/VqVqM8SScHvC2eXxBCYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=VMvEmJUU;
	arc=none smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DC3606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:34:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23DC3606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=VMvEmJUU
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-53634b8328eso5857851cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792762444; x=1793367244; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TCmOnrpSb85CkuICZLkuWER882/FvQFFbKeLZboWFbc=;
        b=VMvEmJUUpA+iJFMZtyhoy0o0utat4CmXRTIPc05tTeO14jwd3YJbyETlG6k9/NKEc0
         Ga8vLCp3OSbuvDiKynf4f6IntGDGn/RPr/OFGMmdhsiTaV6XICsl70MmUUi2VoQXyHTs
         SK5iKlMez1TBr9y2PaTNP8QKT/Tl3e83Oll2A8HKgMneMt6QBn3biLcaP1VWfqvVXeRx
         DkHk6t8vmnGXzW82T7kvsuOhqGL73/srobu870ehrpvaifpl0+4F0PwCnejN6oyD7gs5
         x3vCwMtxVJZPO1ni7NPUSZV/MtT2Ixpygjv76feDgbYmb1wtacBHNYi5cgG68cLdE0ZF
         094A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792762444; x=1793367244;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TCmOnrpSb85CkuICZLkuWER882/FvQFFbKeLZboWFbc=;
        b=IKw9xciRI4Sn9jnPBsUWgYqatwtxnnxg3SvJKfAAeyT9f+xSqTQyMqZj0sFpRwXxbc
         YXqv4AxHdDNfGQjEUfNgHCNUNvqIAm7NPmVFnx5n697JQXEiOUlPUUXibMRmHOR7yFYv
         Q8zuAgXgzWIxUygcoXrd0elvWLfQgM0qcSS3BXo0hhoQsHbhl3G8UPM2jE1kCb9+2Xhv
         gAM9xSFIEz7NSPVdqD3vNrXNa94/CyJFTOpurDi9NFgK972Gfe5iL3OdWO2TO4uMwDbf
         Td9M6LNCAEVLwRQNJ4UUgn3F19O8U87ED8QUGpSwSj5vyWGfU/2bsGTvqr3DyDSBaAMW
         P+yA==
X-Forwarded-Encrypted: i=1; AKwUvBxF9UuuQ2DqdRhjhUykOeeG6m7DJAK1JA/J1l9QO39CF1MOP9GX/+QOexSgpWYA6mpiuOn39V3GlkLzb0Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqg1IsgWEouJ+oquxH3EusAOnMkNVATXQocnEq4kzQictreTbP
	OFcII8FKdKcvh0GF7dmNzD6vs87xNqfc830wAekhp2oy5n3TNB5Ztw4pQ4VyhJIvTwg=
X-Gm-Gg: AYBFou15g7H3poiUzV1Bk3O7a0FK7RwhBGfWyHyBh22hkP2m8KuX3ER71kE0WNaKImh
	j0vsvMhmjnaV1146JZzIKc6Ih4Bk5exa5k1VRveHC6UYqzcf3v6cZJhV7GFm2p8nG/KX7K8ALa9
	0xtZaZQiK7sMRPc7nDTVwbA2G6cNSAndbEa3yZTmFMuP12vQ+Z/TSkGzecDpKFPqOG85cOSJdi0
	QlN8Cbz/tJSkXgEnR/bTMElJhiRUU6JBtXt1+SiuFx2CyOVUzdWyepzC7/LagMimDxToZjOIGOH
	QIcQ+Auf8rnsaVqb4q6rOLdYt6Uj0LgfABoUom4p1y++YywoeXUKnVtVRVNq/VGVgKA2amsAp8m
	kXROgxsKTXu4tuzQQuaV0zAGAbJxXRSt94xJ4X+tMF61CRn8tfi06VIgh3HuBMjL4g1iFatXJ6q
	DdLQuQpkagnN6nWuzFv5dmLHp7oK+hCOSfHLAIO32DVqSepUnUqbEHTdUOX5YvSlIMm9TMYiCwm
	/iOSOkml70Xq3tF+8ljwH/bM/2B+T2v9Pmz6BX9ivpG6QLoOmVeDS8YE3MhapLioCNMQjyUJONf
	TRQZn8RdDS53hRKGPPtEwmQZMAEeJGta1TvhqQ==
X-Received: by 2002:a05:622a:e44d:10b0:537:5488:ada1 with SMTP id d75a77b69052e-5375488d9e8mr5137321cf.32.1792762443817;
        Fri, 23 Oct 2026 06:34:03 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c4529e899sm1552196d6.37.2026.10.23.06.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:34:03 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xKFPG-0000000Ggcg-2JDx;
	Fri, 23 Oct 2026 10:34:02 -0300
Date: Fri, 23 Oct 2026 10:34:02 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: syzbot <syzbot+2a4570d89a1e13003dbf@syzkaller.appspotmail.com>
Cc: iommu@lists.linux.dev, joro@8bytes.org, linux-kernel@vger.kernel.org,
	robin.murphy@arm.com, syzkaller-bugs@googlegroups.com,
	will@kernel.org
Subject: Re: [syzbot] [iommu?] WARNING in iommu_setup_default_domain
Message-ID: <20261023133402.GJ3381610@ziepe.ca>
References: <6ad19ce4.7952420f.283480.01c3.GAE@google.com>
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
In-Reply-To: <6ad19ce4.7952420f.283480.01c3.GAE@google.com>

On Thu, Oct 15, 2026 at 08:41:24PM -0700, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    b88c841d1164 Merge tag 'input-for-v7.3-rc6' of git://git.k..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=117d540d580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=44ac479246d4559b
> dashboard link: https://syzkaller.appspot.com/bug?extid=2a4570d89a1e13003dbf
> compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
> userspace arch: i386
> 
> Unfortunately, I don't have any reproducer for this issue yet.
> 
> Downloadable assets:
> disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-b88c841d.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/e27770b53aa6/vmlinux-b88c841d.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/3a314a5eb19d/bzImage-b88c841d.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+2a4570d89a1e13003dbf@syzkaller.appspotmail.com
> 
> R10: 0000000000000000 R11: 0000000000000292 R12: 0000000000000000
> R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
>  </TASK>
> ------------[ cut here ]------------
> ret
> WARNING: drivers/iommu/iommu.c:3205 at iommu_setup_default_domain+0xbb6/0xf30 drivers/iommu/iommu.c:3205, CPU#2: syz.2.802/11603
> Modules linked in:

This is from a fault injection hit in the intel driver..

[  382.158650][T11603] FAULT_INJECTION: forcing a failure.
[  382.158650][T11603] name failslab, interval 1, probability 0, space 0, times 0

[..]

[  382.158831][T11603]  ? lockdep_hardirqs_on+0x7d/0x110
[  382.158850][T11603]  ? _raw_spin_unlock_irqrestore+0x3b/0x80
[  382.158869][T11603]  cache_tag_assign_domain+0x1f3/0x650
[  382.158888][T11603]  intel_iommu_attach_device+0x706/0xe00
[  382.158906][T11603]  ? __pfx_intel_iommu_attach_device+0x10/0x10
[  382.158921][T11603]  __iommu_attach_device+0x73/0x340
[  382.158935][T11603]  __iommu_device_set_domain+0x178/0x250
[  382.158951][T11603]  __iommu_group_set_domain_internal+0x1b1/0x450
[  382.158969][T11603]  iommu_setup_default_domain+0xb9b/0xf30
[  382.158990][T11603]  __iommu_probe_device+0x1174/0x1550
[  382.159007][T11603]  ? __pfx___iommu_probe_device+0x10/0x10
[  382.159029][T11603]  iommu_probe_device+0x28/0x130
[  382.159045][T11603]  iommu_bus_notifier+0x5b/0x110
[  382.159061][T11603]  notifier_call_chain+0x99/0x3f0

Which causes initial domain attach to fail:

                /*
                 * Drivers are not allowed to fail the first domain attach.
                 * The only way to recover from this is to fail attaching the
                 * iommu driver and call ops->release_device. Put the domain
                 * in group->default_domain so it is freed after.
                 */
                ret = __iommu_group_set_domain_internal(
                        group, dom, IOMMU_SET_DOMAIN_MUST_SUCCEED);
                if (WARN_ON(ret))
                        goto out_free_old;

Which we can't handle in any sane way.

Not sure what to do about this, it doesn't seem like a real bug to
worry about.

Jason

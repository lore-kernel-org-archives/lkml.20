Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793232124;
	b=gDQDTdA5FhHp5xkhPctwze1bUTyJzfPPxJQ0Y/wzIamyXWrTSvsBiH8kKzMH3I1oZPfh
	 Mthmr9G6NPnV7r5YC5SRa5xLl/RwQq49YkCKjtS0wd9xztEC+ZcdrVUZUSOolQ6XLLSma
	 IHtv9N+P/i3olH0nm0dIkezDLcB+b6rNONNQEa9FTaA6RjVyWnRZWYebjcj9IHiFxpCOI
	 IkB2aQXdE3VGxDlpu/wclASoyy+SLjqFCga/20AwiEvOpxa4QV1uqsUa8NGwQTglToroB
	 HR9mmOXrkz0eShjfa/JtijH4M5z2HWjf546mFSxkdIR8ihMo7i0oJ0SwtUFUyOG1j3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793232124;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=UtW/sYsNMYd14q833jtnLcBy0iGbA94LyKtY63+yQks=;
	b=rcI1YZm6W+bLL/H87Ro4Y6FUfwWdkN2I1I+ZNEZdyNl9qiyExtbz5sg/M8j1Sf8TzDNk
	 RbxKJkQTwq72Zy87FwA+l+wTX/31139hGopALoxAVUGI3G31cbeRcmSJimyMtTjz23/Jf
	 rTCdZGPDvSTOSAtOyrWE4snxjNGqQGkBVa8FQ/SX8DFASjJMz+Qp4ncztp+1kzTMb23hM
	 IL4e4L/PXwLa1aeP95Jym+7+wd6gY5bvbBqr2V12YZ+1sT669S2nJIyzLuu7XubsICvqd
	 Yi5OqJD05LQpV+9UvjxE/bNWTrIvU7sMy1REIFV6sX0Eg4dHmfXz4t+MXt/eviH6fWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=EpKoMwgE;
	arc=none smtp.remote-ip=209.85.221.169
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EA2606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:02:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84EA2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=EpKoMwgE
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5eab93a9862so509911e0c.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1793232122; x=1793836922; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UtW/sYsNMYd14q833jtnLcBy0iGbA94LyKtY63+yQks=;
        b=EpKoMwgEEoHgtRNLqOsrFbza9ayjknIjZvpEUcg2luJkviGEk3/b3r07STY/DjmLA8
         /XkGfSisrwYjJB+E2qraZr1BMSiDgD/mg+5mg/Tbyv3Psv5T4MFMXGB11oiCZAUjJa4D
         zeL2ENfDoV2R1H++PE0b/6NBGj4qTP2FN6s7uasK/3sY3Yoqyf4ZXjosooinUqF2Pipm
         UquXeuIIUMX8B6YMwPoqf5sckl6UKYocL3LgFsWmqoKJ7qyRraYqUx/7MVvgXj0mYg3x
         8fV5AvWQFSGxbCvYUTrUD5HebiEPYTH/yCjpVCK4zWTJDFsYQmsHf1SS7tyFh0xGotDs
         OoKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793232122; x=1793836922;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UtW/sYsNMYd14q833jtnLcBy0iGbA94LyKtY63+yQks=;
        b=RExqTOQ5Ge9TpvfkyalBXZ7Xjz+RFNqqLJhExdin0JQTI3GURDReMjtEcODNTo5vnb
         XZLE2Zc1AJ9fphXwL/OQYFS2CdTWECtW9iHww98i8ld07jtDQHuhY4BPpOKVtGaI2ekW
         vl4TRKmfFKAiNqJmi/pBEfNOvz3r8ZTW8jfhKEcgSTiaKGFypdPlifdfeI12L6pUdXQ1
         Z1IZ1BeNNkly0zdJbt3O+OPEggNyzM5OgjXusCC/+bMSdpmysV5tdFvh8E3X0FdxOkhh
         Z3vy3ZfRQhgA+Riy90Dm1FE+8pFDBgvMH2cnVBip9/8TeJDkIKRjL0IZNGe4FfjoSahZ
         Baog==
X-Forwarded-Encrypted: i=1; AKwUvBzoWahHBHKPpuOfXN9zfzkBfaVS/wdklAsPAxrSos2NhfVXBLfwOTtGAFta1XEBgGzCiOyVOPgDNhGKrbA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLY5AkK/4jChH94OCU1N18/rrrNiA5kKcxKQBbi1sGr1dtySFzG
	smKn8ZmW2S5wfaPWVQa9dxCEPUAcNDswH5WDbS8XQu85OaJC6aiiw9pll1Lwb+IItbI=
X-Gm-Gg: AYBFou0PswM31ogWZg5VBsa+ABX2tTk9elkomjRrtocMSO8k1qJMlH1m8njghP9Ar+s
	iZ8p1Ad8wH4m8Hi5PtUlcvcRwRS+6cSPuuSKitT2w8eaqQiv3S35lxbvQ4E9ueSZb7I95s6wyLT
	YU/BKYP/NUvNQUo4ULM554TDoTVJZOONDuTXqFqp2K+4DZE1kcHlYgyaml3hMD1qjo4HmKDMIGe
	zVfn0Cz9TRmSLjlCV/7zPFHUCAax0jAzNTKfAWKZBFt23cz2+o1eF0/f2kd1gtC8prAC6tK6ljO
	tR+9yu6S3575jDPCwS1qksE+cTh/vUnC33tQD+Stha1FK1RZpJqn2oZCys4F3o7Xbqq23nvDsq8
	EIGj+3AOrjuDGLdX0s44q95ZA81RCi8NIn4miOLTBgLlOT23nkYW2U7yC2nxw2u3TGp9uOKwNzl
	YtLJSatbwhjonBk7m5b8O5csOY35SQd0kjx0xdnvkYqIJR+6hJ3qws6//0pTTk5A7uTnuh+lpcq
	NUR8JRBc5FufXinMLnQTDkBJTfRw3ng7K/o9kq2ykMFX0tc3HYS/FEPjz1/Bvi1nq0dFAOER1cu
	KAfVRuZ55wuXFZvR0AwJmJthfn/iOr79IpIaKTG+LIL3ZaOX6jnNOoIBCLDDC+nowWOGPPtZRja
	/uwmYoKmC7EJm9ANsljcyM2jA4NJWQ2L4
X-Received: by 2002:a05:6122:1c03:b0:5ea:d14a:ef8f with SMTP id 71dfb90a1353d-5ec4cc14f21mr1861192e0c.4.1793232122251;
        Wed, 28 Oct 2026 17:02:02 -0700 (PDT)
Received: from google.com (64.167.245.35.bc.googleusercontent.com. [35.245.167.64])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec4f931911sm3523257e0c.10.2026.10.28.17.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 17:02:01 -0700 (PDT)
Date: Wed, 28 Oct 2026 20:01:59 -0400
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>, 
	Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, 
	Alistair Popple <apopple@nvidia.com>, Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, kexec@lists.infradead.org
Subject: Re: [PATCH 1/3] mm/memfd_luo: don't use memfd_pin_folios()
Message-ID: <auKJXHWnNMzju7cv@google.com>
References: <20261027173031.763213-1-pratyush@kernel.org>
 <20261027173031.763213-2-pratyush@kernel.org>
 <179321872100.1775665.6881420026761127422.b4-review@b4>
 <2vxz4ie5o2ak.fsf@kernel.org>
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
In-Reply-To: <2vxz4ie5o2ak.fsf@kernel.org>

On 10-29 00:04, Pratyush Yadav wrote:
> > Nit:
> >
> > I would suggest adding another helper, memfd_luo_get_folio(inode, index, 
> > &folio), that wraps:
> >
> > - shmem_get_folio()
> > - The !folio_is_longterm_pinnable() migration retry loop logic
> >
> > I think this would make the final code a bit more manageable.
> 
> Sounds good, will do.
> 
> >
> > Other than that the patch looks alright, feel free to add
> > Acked-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> > Once the nit is addressed.
> 
> Thanks!
> 
> I think the MM side might take some time to gather reviews so I will
> send this out as part of a liveupdate-only series. This patch is useful
> on its own anyway.

Sounds good. Could you also consider adding a patch to that live 
update-only series to extend the memfd freeze from retrieve to finish()? 
That would close another gap that does not affect us yet, but will once 
other session fds depend on the memfd mapping.

See:
https://lore.kernel.org/r/20261022225035.377445-8-dmatlack@google.com

-- 
Pasha

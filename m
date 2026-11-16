Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837884;
	b=27pIyAm6+DvLB3WJflSZ/Uh2Cp7pIxr9xmRIQyin/jcZgWTNAuWQUFpb9dGW021EM0nk
	 /llEg6DxZuex8ecZw/GcSoMCdCpqpjvPdqprv+0VcgwSq0oV8zUz5Z5xjlDDdSMJ3L2tk
	 rTM48Ch7y2vz3gEuA5VrkBodfOJ9ndp1mg7FQ0J7L1RAdlKxYDHzUH13EDm8XtfM4MDSx
	 dkOmA6il3wVuqUALH2rfaATodzZdp6eWFG3YJ9c9/cKigIhPh7SptC2exT3NqwMt31llg
	 nu1n+zXnZyw/PLcLtnpFAqDPSRZu9WETVlWX0GXQmO+lTpWKXJYDIxYZyBssJkPMOkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837884;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=S/rwSMYRmKycQT+Q+WaK4Jt3aNV8OhLQHxBDEKKQbT4=;
	b=QDpypmnk7Czj8792ictLm1sWfYAiyqWUgvxtVdkC2pADBvmLPKBWh7O/4x+XBq+84BSO
	 fenP3MlPrv06U5tRmempCtFcgj+HxXf8PhVPDgqGovMCY54y7c7QQw0yZ06Zu2svTQgBW
	 17ly6nRw5wD/eZmfEWlRVkioCRH8Jdv9dZwH5o2FS9X0K3lPC/Yk4+Zdm0Um9HKGT9LhN
	 Fle2H3bg7mQi12gaxc+z2nfFxqRHep5Pm4xDrp2VvUEc3JE1fkXyWfpgxCYJ69/z7RW4J
	 PK6LGqjU1oRnzw5g8H1ToSTWt6VRrj4u8XprrcI2GI2/FWucM86ZR8s6WRefQjlRmfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iMDzRrq0;
	arc=none smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53591606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:04:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53591606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iMDzRrq0
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3ae2fb3fe2fso29454011fa.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794837882; x=1795442682; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S/rwSMYRmKycQT+Q+WaK4Jt3aNV8OhLQHxBDEKKQbT4=;
        b=iMDzRrq039OpnwA08q8wxpS5ic9JrpGL8KQy/z358OVtcUiZ54zbGwg8H+DBTz2TUa
         pv7vbxKyzddHqzhLP12j4t1DO+7iKl/0/M9BHiuLRIyxxj++IfynpWG6k38Gsj2NpTRT
         lnNmpMTz6kojOLl+rxFtA6JsOHtgODkqvBayqBMVmN1im/h4vh7rPe7aLetErqimSCrH
         j3Ti26DTCPJgzhUIndG/qgGDIGZTr4nnqcUKOg9RcAPAGee+qie0GBa166KTYMq1728p
         NWGKLrYv7vYNUbG4/r76nfnL2eLkmsx98ZMIxoE/YwRqTkcYqFkzWBP3UDHylAVc9LRY
         c5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794837882; x=1795442682;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S/rwSMYRmKycQT+Q+WaK4Jt3aNV8OhLQHxBDEKKQbT4=;
        b=OimLrnrrMo6BOD2sRgtbf2IusHu01QSFX0xuJwiFGu1JUti43ryZF9+01TDuXnG6Ky
         sjDqaANmt/91K7KyBqZxmZkDF5kTHnRulwP6T6ah7PLRWjf8QTzDa9YMkkktI/oXUNfW
         vON+jjiSQNTXM3BYaoiY4rLaDfdksQtFzpIBVMsdfxe6F6YLMp1iO9t0W4LkQkP8ww4t
         NPuKbDvltMYxzviYVe/05cD/u0eae1KUNnkHUHa/f5HNUZAnAhshGBzqBAqtwcTd9zvM
         WgYJhU+i8YPm6d7PJRA9OIPgZhDnKoqjoT7x7ssMGAqR4mIClSbuADvCGd1KSalY+Gs8
         1AEg==
X-Forwarded-Encrypted: i=1; AL+hErFY4etTuyikAy0GKUgSmTphYaFkGEbGY+v44rj6rAiorv29+vP5vgaDhi8jdGhw9feDnKaB87pNa05VpfY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WqCPtJ6JGF3zNwUj1p6EhL44MVstgTBuSmkwwMUN8u83bSBOp
	/98XQx0Q7w+NiDr1Vq8c/q1nh/wP0fk9XnLnjj2/C5NQWLtcf1xHEzgtEj0XNUYfGA==
X-Gm-Gg: AYBFou2P5I1kWXVmio2vW+7dPcHDhP33UeUuwvm97rjQ7mrQ4VluGRWT5beB7ut1iM2
	BSz0yM+BBq5SZozCcFbEYf4L+BiMurd0t7IwhaQh6rNzNIZBJ1eT5nLQnIQ1AGUlOA1H2+69o/a
	iZzfchgLSBYfq5QiZ2CNMdOy8/LnOy3mN/ja7gvdLrm60i/WKhBBVyJ0UV39JPUFSaMyHdct1Xf
	Ykr5Cn/4VZ5In2EFBdGVZyjpduvIURKn0f5oGNgeQ/E3tty/522cYRgBVra0yGT2MdCLvRVp9DW
	HDHUAbbbuM3b2+UZ8wXNxxz+zThoWXiu2cWdwOaUcRR0Fl1UqQtC0BgL6n/EaYoau4W5bQlheEE
	7HjAVvuvYjOR+/05sn3/MvrFvTIo57ksqei3SwM5GEupl6PD/bJmUj4zCil/+stji4T7MPzDWrV
	4pjRHb6Hm8ZYneQV7EYhUGFyW/sOCcPWJNtidCz/E/201WMLYjoq5SPsIzcNOUBJmDfzQlSlv0Y
	3b7aTWkqppYqfzCdBUst3gdiTcA4aPtdqp1snweAPIe/o/aG3rIHOlpVQE88LwYu5Gmj+feRYub
	S5UuC31MOymZaPHCXG5gOJivT/R5nxCm7kkIioZo7CK2AWbPMo1H70UCMD04BIBK5Q==
X-Received: by 2002:a05:6512:2208:b0:5c1:5970:ae1f with SMTP id 2adb3069b0e04-5c170a25d42mr3870536e87.63.1794837881958;
        Mon, 16 Nov 2026 06:04:41 -0800 (PST)
Received: from google.com (0.182.34.34.bc.googleusercontent.com. [34.34.182.0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d66esm20599601f8f.57.2026.11.16.06.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 06:04:40 -0800 (PST)
Date: Mon, 16 Nov 2026 14:04:36 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
	Mostafa Saleh <smostafa@google.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] drivers/virt: pkvm: Zero and clean memory before sharing
 it with the host
Message-ID: <avsNdPissIDAb1hA@google.com>
References: <20261116110549.1863653-1-fuad.tabba@linux.dev>
 <avro44jUWOARFzul@google.com>
 <CA+EHjTxWuiyjmUc3vH_KxRtS_3oX5w=CE76LdsLcrqC+RzLGfg@mail.gmail.com>
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
In-Reply-To: <CA+EHjTxWuiyjmUc3vH_KxRtS_3oX5w=CE76LdsLcrqC+RzLGfg@mail.gmail.com>

On Mon, Nov 16, 2026 at 12:25:43PM +0000, Fuad Tabba wrote:
> Hi Vincent,
> 
> On Mon, 16 Nov 2026 at 11:28, Vincent Donnefort <vdonnefort@google.com> wrote:
> [...]
> > > +     /*
> > > +      * The host can read the pages as soon as they are shared, possibly
> > > +      * through a Non-cacheable mapping. No caller relies on their contents.
> > > +      */
> > > +     memset((void *)addr, 0, size);
> >
> > Are we sure we want that? The guest may want to setup memory and then share it.
> > I am not sure about modifying this API.
> 
> Right! I wanted to fix the bug for the ITS property table, which is
> shared before it's initialized, and totally forgot that this is the
> path all sharing goes through... I'll drop this, and put that fix back
> in the ITS series.
> 
> > > +     dcache_clean_poc(addr, addr + size);
> >
> > I believe the hypervisor is already doing the cache maintainance when the page
> > is mapped back into the host. (see stage2_map_walker_try_leaf())
> 
> I don't think it does on this path. host_mmu.mm_ops doesn't have a
> dcache_clean_inval_poc() callback, so stage2_map_walker_try_leaf()
> doesn't do the CMO for a host mapping. On the guest's side,
> __pkvm_guest_share_host() only changes the software bits of the
> existing mapping, and the walker returns before the CMO in that case.
> 
> Cheers,
> /fuad

Ha yes of course, that's the host s2 we are mapping into. And on the guest side,
we are only changing the software bits, so no CMO. Actually I should have read
the comment in stage2_map_walker_try_leaf() more carefully.

That said, I wonder if that shouldn't be handled by the hypervisor, just like
hyp_poison_page() do the cache clean.

That would be slightly slower than letting the guest (who has a mapping already)
do it, but pKVM is enforcing isolation between host and guest, and it feels like
it should do it by default no matter the memory transition.

-- 
Vincent

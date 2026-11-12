Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794506867;
	b=XowBLwjTo0FalorjkCvWFUom++6TeMuThlSU7r/7pgZHBFENMYE671hlcMe4j/MBUk46
	 s3UC1QOOTNU+aIksALdbRVkF/YXJjAjVYQMs44FnprtvRl7tElMTybW0eLLHCADQAsGgi
	 heXTl0ULgtBqnslJmtpcnX3BY46X209e0qDjPfzzU8rXLH/p5oSBhxW46AaNN2Wb+BeRi
	 Zj1HIOwGmFbvEkhCmzvTVsVhVxrGKyf+7AVe4jBHy0Xyt5uC2DYnvDFilJl7CCJXF9ShS
	 CU3NgcMsYMezpJqlLvxPEKPXERtFKtgVIczRieGsONDY0v/yRtgLSf1fYwRDo+z/o+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794506867;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=k1iKJ3ce6I7V1KzAt6ijmlB03GjSeH93EgIWrRWokzQ=;
	b=PoJv7z2XPN0mRiYcUEj7WHJTESh53Oj9gnakUY8dSgENhdy0/ZpyJfL44mDaTFB5bu8f
	 aMgv6x7crXmQymleVbdfdJpsRmNwyUrZSPPOp+5rd5a258sCTHEX6DMyOIV/krZWJ61z7
	 kAkXLGCn8t+xFrdaMIYNtl5loBbQ0M/M0bBtrFU454//G9sHu6HpQVfrOXj8wfrquIFe8
	 cl1U0FrdNmO+6D8Bi24fZFHby8R7GadP5jrgLEaMO6DVCLpxcqztRlCY3N1EMzKIDtEf0
	 9O281My9d/XitMuoLvHtrrWnNvSh4Y7RpUJMEc8u1z1O4l+CkGkgn/VqBifAEc2DxMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WSZWdqmJ;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500EA606A33D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:07:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 500EA606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WSZWdqmJ
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cdba1bbde0bso54371a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794506866; x=1795111666; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k1iKJ3ce6I7V1KzAt6ijmlB03GjSeH93EgIWrRWokzQ=;
        b=WSZWdqmJqh+OgDpd0veh5NM3ZyaOZ2OD+CYCh11RQq/LhbAg+F59TVE2w8HLbiP37J
         AfTia6KAhVbRb3q5CFV5LOmYNMAQTDpEizJzAl+yYiIxvlcIsur+hL4XmOqbxN4Nrut5
         TAFERQq9ERTYuSdV1fZrNdPArb5TYPyPVddgh92h5N1IBbrCf0ATn9y5vSDDGfTAJR+w
         bG1hiauO5vPHMRNODgze/wKmPq5+m9DBT7Ch5CgS31kXkSIQbhBArKQDZUrVHryy0dQO
         2rHE3pUWOrEnhxHsV8torug94foBqDARJ+gDNh+HlEse6Cn3+uOV9GU2wUtfHYSTqcLP
         MGWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794506866; x=1795111666;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k1iKJ3ce6I7V1KzAt6ijmlB03GjSeH93EgIWrRWokzQ=;
        b=y+MxULHY3vHFpafoAUdoQZOULERncnmJC4bqZDzLxrFRoFiNilQ3TsVi5PiROCZsCI
         zuQS9+onU1c4BpY59QIyJB0L9ZuwZZjbIgnzv+MxXGdRflVQ5ZHSp/izsj3jCGenZc+B
         vEiJI9LgDdZOli8KzcwgKq3ZIDZ5V5r2Hsyn2SZKfdsvlbNhm6tO/4aGNEZonDAe0Txx
         D/7OhHWVqL2QejD+9AvMeZPN+sgJOm7GSGCjOcRe1TrVgwDTiuGX9SOudKuSckbk22Dk
         dLah6o0i8lnac0LFFDs5+t767pmzYxVSG62KPiNNzfh9w9M4uCerhPTbCu1dz4yxXtyl
         wsMw==
X-Forwarded-Encrypted: i=1; AL+hErGhVxQ3+sPG9+DD8JI3ITYBUHtMPvYwWyc3sNcWDjTvzsP0Fw12CEUyYRXSboyn2CjgyTFeHgUvuq7vO3I=@vger.kernel.org
X-Gm-Message-State: APuU4Z8IP0OodlZVqDMLoVTP1OfLwgo6sNgYjqRkCEDlCJ36ftpbOXjE
	J60wKt39TZ08Ud74Y9Vjy9qHovuaL3+f4IgXMPdHu47FYLd6gdciMuSH
X-Gm-Gg: AYBFou2Lj2/7oUDrIytpmC4s0mK6tWuXaJvsBLN+N/1hMxTmi8dEjwxOWHDqBDAwoeF
	vptnKg/uRgg+//AJRY6XP84YvJ6fW+ifvCWVD0WvOmMBOdSZhi72BEoAv4GiKqn9FB5AnkJ0/XH
	zTNprAFd4zKxlrMgx1qPskqe5q+W0uNSER30byuyr/S60QE3KFfMpxlffUBcFe/jeQNIbvGxRZa
	G5pVMx2EDzzOTArQBKLPSc1cdSq9G8BPcuvGNhPVGYmJ8Vpx0a9eu3lcGeR/nzIV+wXVMSRUeZb
	VAu2eXSJHGxJIknNQhHLZRssmgXSloSWBdkaA7UlZ2yuTI5HPyA5UD3zhzO7U+u9XXobKzOGqQQ
	8oulHrYJpfCJQMO457XGOHBFQqFceY3Ggk3OWmXMbrWzfn/+QoDXIoMvNcBQGsTXRpSrFSoii+m
	ahZNp8PJ0QruZR2KGdvwpo5H9ES0kZWQdZEEGTpB3BWWm7j5Rnq0CevtkP8qCMNNsJhqLnzrWHj
	EgOHZtmwh2+FHxdTH1i7hacrIGCQccSsk866GKz73lyOwfo33DD+AdKHzUYh3gCn2qZ3zlHDJCd
	BJKbikMFgC7aw/ByyP9ijsFGePjas9qUQ6DBlgzjgG7GMyHumpFjgCJ8wVxSM1EhbdtsNdbtbP6
	p3EM3T11VpxFJ3gN7oA/OV9ywzCC2J2oC7DZTZAwg+7oM6wwolC2veVTDCuBg0rnElvY+yUh6hR
	TTd+z/qL0J5S+QymGHYL6ECyQ4isYjdqS8Moze68wP
X-Received: by 2002:a17:90a:e387:b0:3b1:8380:a9a0 with SMTP id 98e67ed59e1d1-3b18380ac2fmr4732901a91.46.1794506866237;
        Thu, 12 Nov 2026 10:07:46 -0800 (PST)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b181f8fd59sm5540773a91.1.2026.11.12.10.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 10:07:45 -0800 (PST)
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Navneet Singh <navneetsingh@microsoft.com>,
	apais@microsoft.com,
	rlmenge@gmail.com,
	hargar@linux.microsoft.com,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Subject: Re: [PATCH 1/2] KVM: arm64: Hide FEAT_LS64_ACCDATA from guests
Date: Thu, 12 Nov 2026 18:07:41 +0000
Message-ID: <20261112180741.17614-1-sidchintamaneni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <040cf379-baba-4e3a-bf3d-6bc009a9e28d@app.fastmail.com>
References: <20261023070110.1833446-1-fuad.tabba@linux.dev> <20261023070110.1833446-2-fuad.tabba@linux.dev> <86fqxwzul7.wl-maz@kernel.org> <CA+EHjTw08SZC_3Uodt6ew6vXVH-doW-8G41fVCF-rmaKsv+0fQ@mail.gmail.com> <86ecdgzp6m.wl-maz@kernel.org> <CA+EHjTy0jpY3sdVCENJRj_kfRDwbZ6TpkCAHQ2xUO-7ZuErpcA@mail.gmail.com> <ad724195-3452-495a-a50a-5e5c8093a483@app.fastmail.com> <CA+EHjTyLnAXanf9R7SuoL3gFZUNewX7QOnW=mc3qzwvaxg7jJg@mail.gmail.com> <040cf379-baba-4e3a-bf3d-6bc009a9e28d@app.fastmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, Oct 27, 2026 at 02:48:29PM +0100, Arnd Bergmann wrote:
> On Sat, Oct 24, 2026, at 09:14, Fuad Tabba wrote:
> > On a host that runs at EL1 (nVHE or hVHE), this also requires
> > __init_el2_fgt to set nACCDATA_EL1 in HFGRTR_EL2 and HFGWTR_EL2, and
> > __init_el2_hcrx to set HCRX_EL2.EnAS0. Without them, the ACCDATA_EL1
> > access traps to EL2 and the hypervisor panics, and so does ST64BV0
> > once SCTLR_EL1.EnAS0 is set. Happy to write those and the KVM change
> > once you're ready to post this.
>
> Thanks for the offer, that part is definitely not my area.

Hi Arnd, Fuad,

We are preparing to post the Microsoft Smart Data Accelerator (SDA) VF
dmaengine driver for Microsoft Cobalt SoCs, which uses IOMMU SVA with
direct EL0 ST64BV0 portal submissions carrying the process PASID in
ACCDATA_EL1.

Now that Fuad's KVM guest FEAT_LS64_ACCDATA series is queued, are you
planning to post the host ST64BV0 SVA + EL2/KVM patches as a standalone
series soon?

Either way, we have Cobalt hardware with FEAT_LS64_ACCDATA available and
would be happy to test your patches on silicon, or help put together and
carry any remaining pieces alongside our driver series if you prefer.

Thanks,
Siddharth

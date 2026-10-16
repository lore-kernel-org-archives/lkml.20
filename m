Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE4A3FFAD7
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792143976; cv=none; b=eZ6GMNPovHhjCU3ksRQDGdL4/o7HixfqXl2v/Z/6r5BqlmDgITXOITAMca4pORNla69G9u+FokvvbDdH378QG7qYOhPXNyF8YJEHn68HX/lAZjSFCW/zVjGhPT7agr+AVJgIwOi8mBZJiWrPXePoDcV1VCOu9GU1rPAAqmjXtOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792143976; c=relaxed/simple;
	bh=WBdGcxWiDrcVKqaT6IjY7dlU/wWj/hMB+CXmv51CihE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VaAPH12kN5qsTmWokC2+4BcxlgpTGTP1Yssg3yEACaNFb5bHG3/ii6lJWAgVImvOpXDLXfQxFjeBPIkdr0EarpI9v2Mum6kSrzSyL5B5lNci+PvQtiRYsbgiwBJoG5og8k8bsCWvSR3WDDcLmDxlkpCzlU2QEjjYrnTUOlwluek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NEfSOoVj; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NEfSOoVj"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso4516952f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792143973; x=1792748773; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WBdGcxWiDrcVKqaT6IjY7dlU/wWj/hMB+CXmv51CihE=;
        b=NEfSOoVj58mfNWYWD0HBk9CT923PjsiXayk+W4diiizADUl5gWFolKCOmfHSVvTCs1
         +h794OQFcnI4VxGBrjRmYKYNPZZlEJeJKxFuLAdlqzITndINEspIxDSTinaJ79MIWPwm
         ON3UuhlS5KVtsmGhygxfRDhW/CTEVozMxOM2/ArIFPRUt6S4N3wHah3YltILTp3EtwHB
         mEv4ODp7kKJgpkji5pYf735jSa+T46G3W6B5bM/c41OsFSvGAOZQHdOOSgCIIyQUbG+z
         z+JuDj0XUZjZdvHkweJHJcGeAznwfFH7zARrpSGzvyeuSzPMKTvumLA8y8i0QK/Nqu8G
         ON8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792143973; x=1792748773;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WBdGcxWiDrcVKqaT6IjY7dlU/wWj/hMB+CXmv51CihE=;
        b=SLtLfL7BMlLvHe/ZSoKE4g/wp4IH4ZBTEj5CzcFNR+NSlc33GbFisjwxGoD2rQrBhG
         f6M1Nntp390yOoMC2rqv9UUdx24lFalrSLGx8zQcIFjOc19HkfX3LclWqAXEqdSSMTY/
         v9UEQei97jG86T146oro/09sXS3Hp28jEwEj7TcfOLCrva9frxlPO0PDRWd7ygGyt3d0
         bmupPgq2iIVjVc6qQhGWkyl5yYD0qVO5twUVicyLU2LwTOFhKkOXEpZAxMv6z24F1kpo
         6xjHjyK/+KtVxqgtqPPEXAEClDmDonvuuqt/k08MRpf16XpOX5NRuZTRGeL5cwkc5NeL
         oHsw==
X-Forwarded-Encrypted: i=1; AKwUvBxYJkEZZo3eBzDTd0CFLFrXLS2eCng9yTFj9260pWyV7Y+ypLfReQGtxk3vytIHHfNvM82PoQ6AG3xSSsM=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2aT2PROjqV+MF7fd32qsGE12l8iL7W4auy44ORn7dBjkzgtRw
	+rSCe7dv7yoLHvwt4UPY9iBFOun+gGu+JLy9O0Gc/0FSYCuX9pGTV2et
X-Gm-Gg: AYBFou2TR1O1tFQGjeRHDmbbCVwzwgVtVO8BexsslpIzEJQxokcEHWjFKtyqJ5j3Lqm
	0QDLezHq8a3Ks75dJkTLbVveE4Bp0RSKl0iwChDwSGk9q4iPW0+cH7z7IJGP+q66Vt1lV7rdAWJ
	aRtH94ho9cDrx0ea4Z5tb3nhuShFtBY0ledshzbu8ig6y49pMCGGrk/Ubwdz4mRF/QAvIMUgI/a
	2QdfdlFlabfrVEKD/sAchhnYjgGlpIZPLzjVfVScOoTYWrX1rp6xT72NLd+HM8DQhuoBoq+8dYY
	uc22rh4kf2l7WdKKcVXSKew+zaRI3iAfGbxSqOMk7lfoH2smDj//FzsjTRz6gZ9hM40hyXZHPbh
	mGOBHz0pR4C2fZiNqEbccx6mvTVYFvaEO7VoOx7/NOOdHOFnoLjxKTghhBR8zmdFFnMLZdnR+Y0
	fqBo+gLoeAaIKe5r048TiLSlx1v91wzJENiBge2k6AHfy6SEw+7J/BzgpBDl+tQzTD0X3q/RUMA
	7VjZQX2XE/cBi46gSXIPupVaRQDXpHRSTO040JgdskclSXqfpekvbXMsEbaW1Bh2vryXTdzg8R4
	yGWtVPL+czbl9cUCQ+golIjffYpFPdkIYSs=
X-Received: by 2002:a05:600c:83c6:b0:4a1:7093:40c7 with SMTP id 5b1f17b1804b1-4a18e493048mr406737735e9.8.1792143972697;
        Fri, 16 Oct 2026 02:46:12 -0700 (PDT)
Received: from dev-dsk-fgriffo-1c-93421965.eu-west-1.amazon.com (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cca43012sm17041055e9.3.2026.10.16.02.46.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 16 Oct 2026 02:46:12 -0700 (PDT)
From: Fred Griffoul <griffoul@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: David Woodhouse <dwmw2@infradead.org>,
	Ackerley Tng <ackerleytng@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [RFC PATCH v2 07/11] iommufd: Use large IOMMU pages for provider mappings
Date: Fri, 16 Oct 2026 09:46:10 +0000
Message-ID: <20261016094610.57849-1-griffoul@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261016001448.GC14213@ziepe.ca>
References: <20261014093733.90312-1-griffoul@gmail.com> <20261014093733.90312-8-griffoul@gmail.com> <20261016001448.GC14213@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, Oct 15, 2026 at 09:14:48PM -0300, Jason Gunthorpe wrote:
> You are going to need to go into generic_pt and implement cut and a
> more suitable unmap to make this stuff work properly. We can't over
> unmap on conversions.

Agreed. I'll drop this patch from v3 for now.

Just to check I understand what you have in mind: a cut operation in
generic_pt that splits a large entry in place into smaller ones, so
that the revoke unmaps exactly its range, and iommufd uses large pages
only on domains that support it?

> Also please don't write commit messages with AI. WTF is this even
> trying to say? The subject is "use large pages" and this text says
> "map each page with its own call"

Sorry about that. It goes away with the patch, and I'll check and
rewrite the other commit messages for v3.

Fred

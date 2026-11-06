Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794003614;
	b=tvvpe27sx+4JNzGyG1Ofi3sJp2Pq3z1ud7Sj1beGq9novKPuDcaRxMNzRjGkuHYgHv7t
	 T26RuJ2hNIleOvT8Vm3SZDOb0Vsk+Hc5hrHvtFwUIMEGyVqQ2u8MsOAuMzeCFR43cfayv
	 blhXy276tEw0zxLxSeLpgF8VYue02Ctgnwep/Em/V0dg+WNgTwHr+QKE4Y5TCrp/q03D7
	 L9Gpqw3mCwRawKe1EVWCnShplWnPw4h6BRHld55X4Ria2rKwnHcuRsIzpHX8OxQO06wNj
	 iuanFMMGkk26Ak2uEiaIiqJAg2jfXUGeVX3zLQUnLvOi/Q2HFWD8osOpGF0HtpncTvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794003614;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=YdrvcTfiK/07Nw/kCOuL7er8KrOXBZTHNtdfHcqY3yc=;
	b=FsOW5SP8aOdG5+xCBZHHCvJcZ3OzOWaGkSQsAsmODvD57ePzCaXkwqlR93n+N3I9E+2y
	 9vPwBEewKoVese2MNDuKmbpzkOAB4gLUjygiZAmpRKJTXc9RRPDcI6y/YaqzC0CpANwHs
	 LGhz49kwKZjVfARu11F41y37QTbvpiZU6x9gXdU2QbXnFZ5sfzkcbQNFwWz7Bbx9p38Vr
	 mntofK9O7GUUm0d9m7EowJKGpqA+tue/032X0HKFFt5iWHfqDO3cAxZwgDnmQOl6pMcyb
	 /l1UDgrCUTY9t1REtBvcDuk6hGy/wtuWIZqMFnYzIwXorD8WSay9v17Mxc1TjltbQqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LXEDKNDB;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0AD606A331
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 22:20:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C0AD606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LXEDKNDB
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b09c07b3d2so711508a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 14:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794003613; x=1794608413; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YdrvcTfiK/07Nw/kCOuL7er8KrOXBZTHNtdfHcqY3yc=;
        b=LXEDKNDBLRIJbYbtObAwr4pGaCKvFWMV99QdmyNI1LdRkb0kyu8RPs5U/rQq4a6M0h
         5ASlz3BmDk3LbCaPAyYM+ml0fpr0LBMu3Q0UZRphZODpbT5qLOGmsnp2iuyMGrmWopeo
         0rfHxzgGItR2A3RsjfMqH1RMIqnPHk/DKQcOT7SxsJPifbZx3trsUOLshBP/kzfGPp40
         jwfo6kRiQl0dxVV33yemWrOK969JVlnLk1sX53xxNvUOyU2suRXcmx/I4zRoch0SsKrQ
         gy23ukO+EfJuK2oVUR2elXb03hZSdEx1PEMUCYg04OuYdXw6vsu9TD7Y/3wa6Yuenl32
         VwJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794003613; x=1794608413;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YdrvcTfiK/07Nw/kCOuL7er8KrOXBZTHNtdfHcqY3yc=;
        b=owK0FPHcyz393szTcfYp4k/LSFWLefBq14t1pLC9cnFYL3w+TTeIrAq1hGmp57cBvO
         XiDxDujgKj3BzQnaWTznGREntIcGcV2rq9nTyfFJ9kGcPAG8IBvms7GQHuivgODnh/jg
         liphLQsRS/nSVKm/UAXdqN2Fk4W8NOas8KuP67kIdJvsUV0gxOZCkohy25jc2wK9JY7i
         de3OfFrOZUhRJLuKnHZC2n3AaIRZD+ZbrvsLoL4zTRt5a/itX4XWNbqItZJaD1DyCkmf
         SQTsipLvWXUAu9FkscjKErgS5/L6f/peeziWlHjkBjzMuzG6Wg94JO4TobIfDJWKHMg1
         p5cA==
X-Forwarded-Encrypted: i=1; AL+hErGukEBhwmDeRAsKzSbJLiEIzKorSFpx6rUVt9m5gKqEFOF/ARJ6fgHrlzY8bAScyrJuPmXRNRBMVGDQPpE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AWgWPTs8TdzOvdjbRqhljdWwqoStOhylojC4dYCJpjxE22k4h
	3PmtYwFvd/NlsGbZRlvfIPmiijnE3FtgaXL648rVQPhGy8YIwQSItG5PRUG9cjCuIQ==
X-Gm-Gg: AYBFou2Z6SCLOpJelSIRMn7gertcjfXLXvk4Mi6mUfwXP7PRo4kK7Watink7+wTiqXd
	Ecdw/3ejTGN42EiYE9YBbHgWOzfSMMBOsWdwwfegU2GPgEfCu7/ZBsz3Lrp2mn/CKbEzyfEUbRl
	mqid+jY2Qly2YOaMs5xtv8r2O0vaQq7UNfJAFPZbQ8DlKScwQW4L78hulHvAnj6E5QVd6uHEpsu
	TlQsLz/jqBXeNkIJCPfqzvLa7mhMpEIZJ7SHK6NeHuGFWw6B0PvdnViSqjNqmLdl6as6/bo4AhQ
	GwXj2VFj+u59QJkfs/4XNS8fEPo7wPHeStb0RwR9IFKOGfuom0xtlGvPdXjjCn3aaSWPH7/uYgi
	9powe4E2aMq4tRRdzNgrHBuH6mYOEO0GvhhYwZHpTyUtn0BQ+fL0VDf3g3yxJ8/eC4zpdb8AQ4j
	YF1Jk1wGgBsgzn33kuDcio/YBcL+RmFl3Oif5sLFlCLyHgj8juiseb80IOoI1nA+uL94fiQvL0s
	e6S2hIkodu0BaWw7N03HTTopYtO243YtqvjTU0MydKbarIRw2ZTtX+jGYzi4xc/XEUllV+Hz6QU
	/uOX57EtUWR5lvkogdYnHdanQFQFosCy2DyY1fsZjTmMmU5oJmslr8YrCIVL41ef0xCXxA==
X-Received: by 2002:a17:90b:3ec8:b0:3a4:e735:b39d with SMTP id 98e67ed59e1d1-3b0db726100mr3762406a91.64.1794003612758;
        Fri, 06 Nov 2026 14:20:12 -0800 (PST)
Received: from localhost (192.150.203.35.bc.googleusercontent.com. [35.203.150.192])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1057b1fa8sm528979a91.2.2026.11.06.14.20.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 14:20:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Nov 2026 22:20:10 +0000
Message-Id: <DMOH7D1PZUM4.1X82LVQK7E54Q@google.com>
Cc: <ajayachandra@nvidia.com>, <alex@shazbot.org>, <amastro@fb.com>,
 <ankita@nvidia.com>, <apopple@nvidia.com>, <bhelgaas@google.com>,
 <chrisl@kernel.org>, <christian.koenig@amd.com>, <corbet@lwn.net>,
 <dmatlack@google.com>, <graf@amazon.com>, <jacob.pan@linux.microsoft.com>,
 <jgg@nvidia.com>, <jgg@ziepe.ca>, <jrhilke@google.com>,
 <julianr@linux.ibm.com>, <kees@kernel.org>, <kevin.tian@intel.com>,
 <leon@kernel.org>, <leonro@nvidia.com>, <lukas@wunner.de>,
 <mattev@meta.com>, <michal.winiarski@intel.com>, <parav@nvidia.com>,
 <pasha.tatashin@soleen.com>, <praan@google.com>, <pratyush@kernel.org>,
 <rananta@google.com>, <rdunlap@infradead.org>, <rientjes@google.com>,
 <rodrigo.vivi@intel.com>, <rppt@kernel.org>, <saeedm@nvidia.com>,
 <schnelle@linux.ibm.com>, <skhan@linuxfoundation.org>,
 <skhawaja@google.com>, <vivek.kasireddy@intel.com>, <witu@nvidia.com>,
 <yanjun.zhu@linux.dev>, <yi.l.liu@intel.com>
Subject: Re: [PATCH v6 00/27] VFIO PCI Live Update (noiommu mode)
From: "David Matlack" <dmatlack@google.com>
To: "Vipin Sharma" <vipinsh@google.com>, <kexec@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <kvm@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-kselftest@vger.kernel.org>, <linux-pci@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20261102153656.1431701-1-vipinsh@google.com>
In-Reply-To: <20261102153656.1431701-1-vipinsh@google.com>

On Mon Nov 2, 2026 at 3:36 PM UTC, Vipin Sharma wrote:

> David Matlack (4):
>   vfio: Enforce preserved devices are retrieved via
>     LIVEUPDATE_SESSION_RETRIEVE_FD
>   docs: liveupdate: Add documentation for VFIO PCI
>   vfio: selftests: Add vfio_pci_liveupdate_uapi_test
>   vfio: selftests: Add Makefile support for TEST_GEN_PROGS_EXTENDED
>
> Vipin Sharma (23):
>   vfio/pci: Factor out the reset logic in VFIO PCI device close path
>   vfio: Export various helpers from VFIO
>   liveupdate: Export symbols needed by modules
>   vfio/pci: Register a file handler with Live Update Orchestrator
>   PCI: liveupdate: Add helpers to preserve struct pci_saved_state
>   vfio: Add helpers to identify device files that can be preserved
>   vfio/pci: Preserve vfio-pci device files across Live Update
>   vfio: Introduce vfio_find_device() helper
>   vfio: Refactor vfio_device_fops_cdev_open()
>   vfio: Add API to open cdev device for Live Update restore
>   vfio/pci: Retrieve preserved device files after Live Update
>   vfio/pci: Protect incoming preserved devices until they finish Live
>     Update
>   vfio/pci: Take over preserved devices without resetting them
>   vfio: selftests: Build liveupdate library in VFIO selftests
>   vfio: selftests: Initialize vfio_pci_device using a VFIO cdev FD
>   vfio: selftests: Add iommufd noiommu mode
>   vfio: selftests: Add helpers to map DMA memory at IOVA =3D=3D PA in
>     noiommu mode
>   vfio: selftests: Add helpers for Live Update DMA memory and sysfs
>     state
>   vfio: selftests: Add an attach() driver op
>   vfio: selftests: Test preserving noiommu devices in
>     vfio_pci_liveupdate_uapi_test
>   vfio: selftests: Add vfio_pci_liveupdate_kexec_test
>   vfio: selftests: Verify that opening VFIO device fails during Live
>     Update
>   vfio: selftests: Add continuous DMA to vfio_pci_liveupdate_kexec_test

This series is getting quite long. I would consider splitting out the
selftests into its own series and we can iterate on each separately.

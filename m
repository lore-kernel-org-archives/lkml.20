Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793234053;
	b=n5vJuTcIqshXxpsS3JXRkxOgZI6EP73QsJZvb74KfR4shujm2R+odoYRSqFAb6dS0Unp
	 Po5NvS0/UGb+WSGIyKxzcrUEdNf6LN47tOo96W3sbQpf8rygqvYJU+pSILf2Ay78nYDCN
	 B+iSEgmXB9ETDJ/EpZLBOZhO3to8Hz4q24D9jYJizizKTvnSL/Ofc+GeFS6lyFe+AVrWc
	 JRjfc1mUqlwwP0L8URvxZX1OFIhnkFsgU7YZo/LugO8QG1mj2zbdu15QBbfPXPygGjprw
	 X6c4dDVpoYiwDQb75sKl+WTSnYaGqXv+PowLBNRngh9UKEkSnQPfI9m6KpNIORjnu7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793234053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=tsBZ2JOSM+81yacIx7jogYyTLK+vUeLgZ6wv+MV+Ed0=;
	b=fMwgg4EeB7VqENg8aQYcaazn6m3ZB1Y555LNLaLxdpSshoegiRFe5I62oOGSeWUeq2kY
	 TckBjjRY7w/FJMrjZ/7KaQA67oFmEOF9LKedQXikr//6SFQXK0VDn2JLgxnlrwCeiy09L
	 bcKyMa6pAsFJD2EoxfJ80xCArZDInDLhI/gvozaliGfJ73AYW9vpQVvrv8ln4XFJA9N4+
	 ZWKlFL0c+D5cM25qQ0HQC3HKpTcOdY/r+qMrBkBCC6lDFxM4OO4y+bIeCxPPZ7T2z1MN3
	 ow8n7EXTd21cbcFS8zcjpkgHKqJZo4065pE93m+7BY/AbQWtktwXomzrXWF2ObxBFyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IyLUZFNV;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4740B606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:34:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4740B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IyLUZFNV
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e8d6fcbba0so19475ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793234053; x=1793838853; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tsBZ2JOSM+81yacIx7jogYyTLK+vUeLgZ6wv+MV+Ed0=;
        b=IyLUZFNVCF05T10ULCMk6viepf9HgBzKD1DKiJWD5n+x/XW4gC6WDyNIWJrCaCTmnf
         dyHMjGzLiRZCF63t78nj2H5B9pVlQOsO3nLgbBAu1XOgT3ef4IYVktx9+UV0ZnQ1OkT3
         f2YmLoyuZOgRzV7JwAMCcvRAq3s7XY5Lzu1mORCc96qlA3RoDa65NA9orN6vL5i79YIe
         79NiXccNmCyYdk/QK5wS/79JnvM2rywsAhRKVMXVeOPbYg31/ZQ9+vupaPYe73a0vMAo
         rvZ5AfNiSSTsmqzGmHhN6EKt4sQbpmGzFEVmsgMU5IbHRASgRfg/mZ0Rv+oboaOBRCXW
         H4kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793234053; x=1793838853;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tsBZ2JOSM+81yacIx7jogYyTLK+vUeLgZ6wv+MV+Ed0=;
        b=bh0mBP209LyCwY8icr4sSbIGcZu5mCwlwswUGQwrxnM0Rf06QL/WeBjJS8x7Px4kXg
         WLaNCLBd98FJX2O8rhKK4l7642vKW08hCW+CN5X+v1qqhk7VZ1ldyzsWcTlUvQa/cLT+
         WxpshYBLGsYqZ/rd+qIBIngVxIk/9bDxoHA8kLmiE7ngVj+j1gvjyfYpsMA50xcSoswH
         wpIfWeV2Rn4yr/7i/crO93dFtuDIkhvr4GEu/5vB+87Gkv3RslyP1iREfg1wBe7F9f0X
         F96X2usue6ra7ox9a+HCrEb05jKtcEtL95XmTOYzPZOfN2YGPPzRYH9VkXjS3ceYq3e7
         CLNw==
X-Forwarded-Encrypted: i=1; AKwUvBx3Ky6vOe+Jo9bwcSSrVLARqzU3eKlEGcUpPKsQWw1vUHzbyYt3odOsgo05W4QM7oIbezWJvnqxQ0Ijpek=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRfwRLiSDJDmZhdzSELs/XjbSAajJ7qQNRO/XboqZXseIWSaVw
	EgtDcYVByX7eNFjUBxcSfqi0m1Y1Z4Qu3aorcOH2s/Q66kyQz5Zp5j4RgasStii37A==
X-Gm-Gg: AYBFou1Rcjs1GMpiYTYQXVYvuk2NDsMm08oKVj/uhICjtR1uyePh8blDbY8xBD3Ooqu
	u+LKYwAWSGrevP5BXqH6um6ZOIao/vRalq6qq8054prxtxUymgerZtObIDVnPTvzBLq/mzivNjE
	p8s2u2gGjyPJ9+EMcuWI+y3I0l+ZNHhEDAuXM6LuIW3+x2urrIHIsoK+fcWJpDswS+Bwmj9FkXU
	I+goD2pu2LQd65/2hG6NXM7mNsZcjAmKERN6d8RP0UYuDiBbqw56IOk6iGwYRUlBZRIwYsZ40st
	DS1JRg+LTSvhMLRjgS9hhKFjMvF2uwYJfObuGF1+DUI0Nxj5oxwXVLxsa6UtG4QcJ3lNxXV+bjX
	rt67fnOxuWReLI+GcAodqLE58CRrD4MDH2WemPCvEosaHcHBBwnvmCcM85rDCjfxSbRMNSEYrqX
	Aw5h+Wl3eGlQTZAJEW1r+7Uty2wT+DEpJn+9vYYeBx9HWERGY77x9qCStmgLdE75XxizjM+I+oT
	xXArn2Nqswd4fQ3vc8xLoSoCMYHs5z5XNdcleP8KCzj1bwutn4qrGt3A00DbWu69ils321lCwMG
	BMSjBayzGpRmmhOqOk0bQyf5eVqBaq4xhZtafHh2HUDvS89Bpb9wMTA3v/CSD/u/1Fiwiq6RvS0
	beG9hCjbEholCYlOAKFIr6nOnBCwaoi+MzGN5ni7XAkA=
X-Received: by 2002:a17:903:388f:b0:2c6:99be:9dd with SMTP id d9443c01a7336-2eb1b86ba8amr2826165ad.12.1793234052002;
        Wed, 28 Oct 2026 17:34:12 -0700 (PDT)
Received: from google.com (25.75.145.34.bc.googleusercontent.com. [34.145.75.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdad8f2c611sm2396233a12.10.2026.10.28.17.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 17:34:09 -0700 (PDT)
Date: Thu, 29 Oct 2026 00:34:05 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, David Woodhouse <dwmw2@infradead.org>, 
	Robin Murphy <robin.murphy@arm.com>, Kevin Tian <kevin.tian@intel.com>, 
	Alex Williamson <alex@shazbot.org>, Shuah Khan <shuah@kernel.org>, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, Pratyush Yadav <pratyush@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, David Matlack <dmatlack@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Pranjal Shrivastava <praan@google.com>, 
	Vipin Sharma <vipinsh@google.com>, Ankit Soni <Ankit.Soni@amd.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, John Starks <dev@jstarks.net>
Subject: Re: [PATCH v6 07/18] iommu/vt-d: Clear unpreserved context entries
 during shutdown
Message-ID: <auKUZTjuwFZc_oPp@google.com>
References: <20261025021930.674647-1-skhawaja@google.com>
 <20261025021930.674647-8-skhawaja@google.com>
 <3a31d343-68e2-4329-bd72-76a80b4edf81@linux.intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <3a31d343-68e2-4329-bd72-76a80b4edf81@linux.intel.com>

On Wed, Oct 28, 2026 at 11:18:40AM +0800, Baolu Lu wrote:
>On 10/25/26 10:19, Samiullah Khawaja wrote:
>>During normal shutdown the iommu translation is disabled. Since the root
>>table is preserved during live update, it needs to be cleaned up and the
>>context entries of the unpreserved devices and root entries for the
>>unpreserved context tables need to be cleared.
>>
>>This is required because during kexec reboot and shutdown the devices do
>>not go through the release flow, so there might be stale entries in the
>>root table and context tables. Also note that new unpreserved context
>>tables for unpreserved devices might have been added after preservation,
>>so the root table entries for unpreserved context tables also need to
>>removed.
>>
>>Signed-off-by: Samiullah Khawaja <skhawaja@google.com>
>>---
>>  drivers/iommu/intel/iommu.c      |  15 +++-
>>  drivers/iommu/intel/iommu.h      |   5 ++
>>  drivers/iommu/intel/liveupdate.c | 134 +++++++++++++++++++++++++++++++
>>  3 files changed, 152 insertions(+), 2 deletions(-)
>>

[snip]

>>+
>>  static void unpreserve_iommu_context_tables(struct intel_iommu *iommu,
>>  					    struct iommu_hw_ser *ser)
>>  {
>
>This patch looks good to me,
>
>Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

Thanks for the review,
Sami

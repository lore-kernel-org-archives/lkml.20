Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793234014;
	b=pSfndi/5FElpCFmLU2s+bA76dMkyYmjwaUivrh86UBkA319yNLXFdet4pE/tkNC2Yh5f
	 HsHqfZF53/3jAMwZpYcXnpw2L0r9o8coj3wzF0HukAg2oTfk0xMGNzKwMARMeEVroHoCw
	 QuGwtoe/honc1NyDGtBLfggFw+0RRvLpDcx9ENKM6iM16IYeYOIKaCi/ACHh5wB5v9SeQ
	 UR67mqJNaCBNeJCkXEnVUBUonWZKUWQzNo0/lUb+dRVqaHmcCzkQJMX8SkhhsBuUc1dot
	 q/K5zQxb187B9CRg3is/Qx8ni0OHVZ8DTDPa7IxV0SkBsPe+Kc4nzeYyxLy+G3LZdVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793234014;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=O9QpSR8lg+vF2or6LsznjkiIHbPGjItpop+9ep+sVOA=;
	b=DsBWds9jqB+THLjuVIp159DoWGN3G2fCCU5dLh5zZaZr/mk+ORZLw3NaArAh1XNYtb8B
	 uSHwr5iTmk75zVPkHdCC5372d+DP3o/zHg67f+ch39PVPUAkYCj6h/Uhr/pVrEFqDqiNv
	 3nMg3m5ul1yrsRx0DOggUT6pAI4FivFfNIgaUluBAZzNJ8EhfkkDIODnPaPkpaONr5tv4
	 hpAF+Fp6wb6Nk9AE9JDAKQEKW0pqAuR/BHIgiGm0fLBk48V14MPQFNtN88diuqiqNxxX2
	 Tq9pWxdkCnrf+4knwv7YMKJSkOTpqMi6d5goCLiqBkFxy2BNYwojcC+BEnROAieOtyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="W7AkaGC/";
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30908606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:33:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30908606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=W7AkaGC/
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2eb0a52d605so30865ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793234013; x=1793838813; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O9QpSR8lg+vF2or6LsznjkiIHbPGjItpop+9ep+sVOA=;
        b=W7AkaGC/h68qamBtwPNyN612w4zInsqvafQv60Te9lnAPgWhczM4kgJeTkRrmIzSZd
         kNuRcFOcEaVrAW0FAw2ALVtQxxoz5t7AN06P8BDEEAlJx+XFNkLFCOeEYTxeSUqMW+Ol
         DdtbiIJbB0T9ud9QwNXOS86w3jT3MemxvSGqdtBSbx8LX/twJ5QT7N+ExTR8eAaEMChd
         XBquv62uSr/zUNIeTfNcUmgKz+Z47ccBYjz7TtbvqpjFOjYTADUpzGYTVqhEpxOzTYWU
         qiaI3WG10Zvztork/UWAImpyFHhGEtnKF4M3byVkRTdHjfYK3XxBftKLIM3yZ53jtfXd
         ozgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793234013; x=1793838813;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O9QpSR8lg+vF2or6LsznjkiIHbPGjItpop+9ep+sVOA=;
        b=r1/jFClli7AYUQz3AxI+bLZn0QnWvPOltD62VIPjhtKpjH1s7El/yQjyRyYMh5a/H7
         jxogrsXZho8Xh1Cb5Db8+t8QrHLKTzWNfdDGtoiW4yhnSmXSklWL9zvAFy9GE9l5Lz7c
         BxKbUAlutwbPqXRfNUNouZq/IXYguxmBO7ZnviHjCCOl1+GLs/dASx62SGMJ8Y96ZEB0
         DJg7olH0l8aSFJD3TcssvahE6qFI2h8XD2K3/iIR+4RMAhbtvXZDIQxGwvQP60M3GpFm
         Ij41U70duIvdVGKAlr2kz0PsXuSTnFPBJ+d9nIGTWktst8K650cXLdEbB50eHaz8n+Iu
         mmIA==
X-Forwarded-Encrypted: i=1; AKwUvBzmS7OabhUazjxoOS0O+nwtDfGt3d8iMZpu1DwhqOMhasnpthjtvQumGg3Ed17zI4nP1+ML1UV9aDjbIC4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIVayiNquhg1TWICSSWDtz5Q27NdA+Pgh8aHnjktOgzWd/85/s1
	ga7jSuupRzV4kgDb3q+aunilvBD8+60Tla64b597gLMj1f0LyQ+bwmG3HTZK8fymZw==
X-Gm-Gg: AYBFou3vcSDlS4i6rxL1mSfFE+T1gqio6cLLsZs4cQdoVe5zymc/rocifLRQn+Hmi7j
	4aQJv7PcJHdXn319ybM0IGF7R7HSwXIqISf5UttA1mOHQcwfnJFh7FDQTGOLzly0vRPbvC2Ts7b
	Sefukceg6UuYpXBb68URN6N0jqUi3vQ5Kz+KXLOEF1BEEpvjMsZzEDVEXaOzCtV2b1fypKyQCt3
	FJwYox88qU5aoyZoA6oTVx4ZTWdBCgY46z3juDFlU0Xwn5NnJrGoAud7b2+Bso+81albUCpYyuG
	u4VwwnE/RmRrpBSVpM7xMmZgSoHD5JHq2Ng6HG+/EClaU7i1j/CLMHTy2t0QxpZu7z9eTAtC5GD
	KtbJHDQyvnJHR11k+p0nFChbdux+mtyP1eGD3Fpj3jEQDGGYK7hEkGnuMk2CuHCJX5Da4cMwYaE
	UVUW19KVrZlP42qPmigM1zQdqsCbLEcOdfdfN7VQ032u/Oq+17YsIlOXMmjjK/ozkZqDGVkos3J
	nx2ghTM+aRIoXJgWaCYCjeNDQwUQmJgS+TiSo3Yyc8bSbgaE9e2sPN4LnJAd5lYIB+MpfthTz5F
	XPYw4cNp40onMNz9AyOLMUc1QvCTMT6R3TVqMKVJRmfptIAmbrHB4x2kdUSk1IT7aM407/l1++f
	Sx8+h8F3QOABOAYMOWWZ67w==
X-Received: by 2002:a17:903:2301:b0:2bd:3bfd:74f1 with SMTP id d9443c01a7336-2eb1ec33fe0mr1312655ad.2.1793234012878;
        Wed, 28 Oct 2026 17:33:32 -0700 (PDT)
Received: from google.com (25.75.145.34.bc.googleusercontent.com. [34.145.75.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5795d04asm2769044a91.2.2026.10.28.17.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 17:33:32 -0700 (PDT)
Date: Thu, 29 Oct 2026 00:33:28 +0000
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
Subject: Re: [PATCH v6 09/18] iommu/vt-d: Combine disable_dmar_iommu() and
 free_dmar_iommu()
Message-ID: <auKULvZVjkrAmzIB@google.com>
References: <20261025021930.674647-1-skhawaja@google.com>
 <20261025021930.674647-10-skhawaja@google.com>
 <9e0c1aee-5a4c-4e93-ab26-f7e59b268f2d@linux.intel.com>
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
In-Reply-To: <9e0c1aee-5a4c-4e93-ab26-f7e59b268f2d@linux.intel.com>

On Wed, Oct 28, 2026 at 02:01:08PM +0800, Baolu Lu wrote:
>On 10/25/26 10:19, Samiullah Khawaja wrote:
>>Every caller of disable_dmar_iommu() immediately follows it with a call
>>to free_dmar_iommu(). Combine the two helpers into release_dmar_iommu()
>>and simplify the teardown and error paths in init_dmars(),
>>intel_iommu_add(), and dmar_iommu_hotplug().
>>
>>Also drop the early return when
>>WARN_ON(!ida_is_empty(&iommu->domain_ida)) triggers so translation is
>>still disabled before freeing the IOMMU resources.
>>
>>Signed-off-by: Samiullah Khawaja <skhawaja@google.com>
>>---
>>  drivers/iommu/intel/iommu.c | 30 ++++++++++--------------------
>>  1 file changed, 10 insertions(+), 20 deletions(-)
>>

[snip]

>>@@ -2310,12 +2302,10 @@ int dmar_iommu_hotplug(struct dmar_drhd_unit *dmaru, bool insert)
>>  	if (iommu == NULL)
>>  		return -EINVAL;
>>-	if (insert) {
>>+	if (insert)
>>  		ret = intel_iommu_add(dmaru);
>>-	} else {
>>-		disable_dmar_iommu(iommu);
>>-		free_dmar_iommu(iommu);
>>-	}
>>+	else
>>+		release_dmar_iommu(iommu);
>>  	return ret;
>>  }
>
>Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

Thanks,
Sami

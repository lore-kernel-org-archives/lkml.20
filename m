Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794323301;
	b=gENnXG8aYQ+OPQqRLsxfmGUH+BauP4+RlOyYm+MpUuihQdoebHoCzMjsDF+1qCFplXwT
	 INV+HK6eh6ZneRxyxHKQC6hkNm5t54y47+M/Y9/r97OyW9xR+nsjIn0zSXnV+duMRSdnx
	 6n+9uGZGnDoU31/RDWpSDtfP8ihOsU+ZRoJyhWu4zd6DxM+MzKvTljGASMul5O3+hbvNk
	 rsxtS5hKe2Kq8V5Cg2AsQi3vKl7mXiopHEmfON8BkqtzdFB80lPG4ZcgvVYOWAxXdDJ/O
	 IVgqk/46r1SB0rXjSiymnI51L6NIBW0VDGkf+XNMn/3hQlbvXrBxMlBaVjyolrvrURg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794323301;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=WKAEhFQ+Dah3DMHVjGDEQ1FI4504gN8wbhTTvAQenls=;
	b=UIuAltmKNU9nrAQ0JD6Lp5b/7ibbScJ0Gs9SAMYbCdlPUIvfx4dYP1oIHjwyFKLMffx/
	 6V7PiGY94DB1MZUt4gMNKqcybeZfFylWVJUyYJaoxKReExXOAZ0CWIPHtk8pOKMpNqLlA
	 U/TJKncNUUUiD1QP8DqiA0pN0hM0ujov6YqNupfeRx9SDzCDa76KLAvWiTfndCqd+BDL5
	 r5pQNIqvdYQNak2BQvCxYX32pAA+TDfuJqKadRy4i6gQGZVf49laGO//us7gHsvVK3+Ha
	 DITX89dTHNXS6lSa3PHZK5/MG0MNvjxWVhaK4ozLzaLZGNYe5kom2n9h70203F+hPQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b="MY7/VxB1";
	arc=none smtp.remote-ip=209.85.221.172
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731D6606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:08:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 731D6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=MY7/VxB1
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5ea969fafeeso742141e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1794323300; x=1794928100; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WKAEhFQ+Dah3DMHVjGDEQ1FI4504gN8wbhTTvAQenls=;
        b=MY7/VxB1O/0DDBob4OhFBhE2r7AqoArsc4vheQsUZdhXDD+b5y1y1TaQrVm/bdwM31
         v+wvR1Xa3Ogoqeh918QB8QJkmxoGqB/R4NBJ2DOJcela0Ni/GKwIGZk8KpF3tas6I5PQ
         qKvtJzIG9/afJgpmJCT8Wdk0JCrpgGt8FzAo9UC1qJ+1YInuolQ9XLeruvGJazzi6dQA
         6/dnbpjLZxKCsl3iAfGw/gz7uTLTFH0Bl0FPaSew7qw4Mq3brXG6aw9DcGgQGyAglMNu
         RxiC7KvyFW8YJvykaeY5KOEMdF2MdmBGATrfsR7KNl7p0+qOdzVYWZayVDtF6hymuNJo
         lB+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794323300; x=1794928100;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WKAEhFQ+Dah3DMHVjGDEQ1FI4504gN8wbhTTvAQenls=;
        b=SFE3U0Q1jS3jcVCcSWPqjzE+1ZqJJu2+iM+7zKepPC8z6UQMzxcoF01oytBreeUBdj
         SIuyjLRyB87RQeAZxnPT9rk62s96mzHBmdRTSyXLbpinx288P8BWFnIsgDAFbcuA5UW1
         h4rkydzy+xEm3JrUREGOgg9xraaUNyvpe1Va5q2f1YTTRAZ4i1mtrTyUPBmieHBxMER+
         8YXex2/fNqDWUNVeELb4LrFPrBQ2OxWZUA1QyjK1GiArT7joSobweccFv/bKjdA0oTE1
         kkeSXErAGjRj+xFH0qJ7k/53d7ovd46lm3RKhhhPMzNIgnWpDlq9gwLFYVX0GqAStVbI
         bu3w==
X-Forwarded-Encrypted: i=1; AL+hErEA/GheAIWkfgycvoIbsJJfim35eYxjrZFGdeqK9xQ7rKXkRNaaWl3n9veODpFtKPgrPReJDc7SFOpeKq4=@vger.kernel.org
X-Gm-Message-State: APuU4Z98Mu7E67HXMHsTVaZKmCLDnVfFUif+UZhr2ix492JGimDd5irg
	9JBvng3ASdAJch8Iy8OLKB7NgRON1FQOQTLigJog8YioBlSkTWeea8oSGI8ZLBPoPjg=
X-Gm-Gg: AYBFou3i7wpgpmCJm9NYED5zmEKnJiF/8R9VaBwKqyH2IewH34HJKTbxgn6Tc4fk4dz
	gPJiPvyGmCO9eL8tLMeNy12soQ4c++X1nLE5vZ9vEU47m2hOzFDZRjOt0RKHkMMrutRkPbBrNN2
	oPCXAJIxi4WzO7YRaGS4d2EB2yl1bhiG+fY/D5/I3VNo15uK/77Lu5EgGY147LUkdPTrS7yyZSn
	VkIdp32bR7AsKqEPU90jWmwwHxWwTuByDMBsHuNnGQm8rgllORxJUqG5MPyu36Tq1V4pnJLweM6
	sZ55pS/OQInWs+Mo3Xb5az+1JWkm2BzovQv3XS/TqW8gBnsCS+8ddNzirlP3yqv7L3Tc0vgF87u
	sjrRvqQKjJbgvwhy4Z9DOe2KuV+c5aPbhADVb2UVjGEZuO3gntkNrypepTiHh2TC4DPHFY4VEYv
	sMLvjNtzEW4Jlvn18NvvbmK3D/TKDlrRMAPJWi2epWWGh9O3Bijw7DHrmV09OA+dd+n/vcnbtlw
	mdggxN2dOBZ7zBm5i0f3QtAMKFoSf0i0JOg/8krbneTi0jyZlgKGZkzILabVbF1LqXWFPo7GZG1
	A3fErGs2IYJJtBYwh2wkQok/a56phcz9d32eart30xZXUS9S5Qr079OfvkZ8+Rt418II3izZ0WV
	6i8r0K7l5rKUplzGo2Uv74Tfq2MEE4HBzKo1fyV1HeqW2
X-Received: by 2002:a05:6122:468c:b0:5da:a74:d6a4 with SMTP id 71dfb90a1353d-5ee0d1254cdmr983516e0c.15.1794323299946;
        Tue, 10 Nov 2026 07:08:19 -0800 (PST)
Received: from soleen.c.googlers.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c1fffe63asm1965122241.4.2026.11.10.07.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 07:08:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 06/19] kho: kexec_metadata: Add the feature header
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Tarun Sahu <tarunsahu@google.com>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Mike Rapoport <rppt@kernel.org>, robin.murphy@arm.com, maz@kernel.org, 
 will@kernel.org, David Matlack <dmatlack@google.com>, 
 Alexander Graf <graf@amazon.com>, seanjc@google.com, jgg@nvidia.com, 
 loganodell@google.com, arnd@arndb.de, dwmw2@infradead.org, 
 baolu.lu@linux.intel.com, Bjorn Helgaas <bhelgaas@google.com>, 
 oupton@kernel.org, alex@shazbot.org, gle.com@google.com, 
 pbonzini@redhat.com, Andrew Morton <akpm@linux-foundation.org>, 
 kevin.tian@intel.com, joro@8bytes.org, kvmarm@lists.linux.dev, 
 linux-pci@vger.kernel.org, Pratyush Yadav <pratyush@kernel.org>, 
 kexec@lists.infradead.org, kvm@vger.kernel.org, iommu@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, skhawaja@google.com, sagis@google.com, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261110050202.529473-7-tarunsahu@google.com>
References: <20261110050202.529473-1-tarunsahu@google.com>
 <20261110050202.529473-7-tarunsahu@google.com>
Date: Tue, 10 Nov 2026 10:08:12 -0500
Message-Id: <179432329215.2329176.14453669404153142360.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3169;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=QPKh6oqVuep5a0uq5kk2HJ+pkn4UzCARnNzVJdUZk/E=;
 b=owEBbQKS/ZANAwAKAbt3KEzbc3reAcsmYgBq8zNhLa8G7KPQhtpqNqIaC7iUSrItiw95IH4+W
 4FZp+mLRNmJAjMEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCavMzYQAKCRC7dyhM23N6
 3ixyD/9hSlVPu6pn+Usl6EKxRh1wkp2nNTAGfSwd0T80brdKlRNG7a8mQqhUQi1H7cXmovyHBUq
 ES73eQCtV9EEqD3V+9mhbM/vQ3DNxapFoBftgUpOKocv/TyzS+fnYCCd+V4qkZp6JbEE04DX5ph
 RXIIzYY1cOoM3lIFUa3WAKuQ5IlLTqUrcCnmCGDDA2ABc3Dn4YGxVfA+j1TEgs3i5/pZ3Jg6vPm
 2w2Rki59ZZh1OvjNwqaQcNxFUaUzOua2A1T1C5uWqXUw29+H364g+FPC9TsTFighlf5Dm5nInFm
 sy05T7yV7PmS1d4eRFn5VjWQo2hboOwrVmB5E3sLTnbZ+oXkY0TgWbPqKYlXfKYQ1RF1dttkf3y
 L666oJVxxNOxQuWbB80WyaaQp1G11CUhLjsRBaxuJqYWD3LuhT6NKGc7rkKJ+4Y1QHbv77qrsL0
 xU62OLvV+UYlxbDgjPM1r4q1njY/2zmio3uMBSt4oubrAmtiUMAW6J6dY86mFHlcm8xgbSUbn5B
 HOb83UbLMhoMCV4Zf4R9ofmr8Zb5PO+Ieg4+UAv33DElEYGHzsZJuh7rv0KDrtHn6JA4zqY3vNY
 KpfJSWU9gzyoa94bAOMSWiRRC/83AeXcMfiQw7G8I+bNVH6Sm/Q6RfvqXkiiTkw9BXIWwqNbXQH
 2NBA/068NaYZqOw==
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

> The kexec metadata subtree currently uses a monolithic u32 version field
> to identify the metadata structure layout. Any change to the structure,
> even an optional additive field, requires incrementing the version and
> breaks compatibility between adjacent kernels.
> 
> Replace the u32 version field in struct kho_kexec_metadata with
> struct kho_ser_hdr using DECLARE_KHO_SER. Later fields can be appended
> under new feature indices without breaking compatibility across kexec.
> Also make the 3-byte padding hole between previous_release and kexec_count
> explicit as reserved[3].
> 
> During deserialization, validate the blob size against the header size
> and reject unknown required features. A legacy v1 metadata blob is
> ignored with a warning.
> 
> Signed-off-by: Tarun Sahu <tarunsahu@google.com>
>
> diff --git a/include/linux/kho/abi/kexec_metadata.h b/include/linux/kho/abi/kexec_metadata.h
> index e9e3f7e38a7c..316b3e5ad01b 100644
> --- a/include/linux/kho/abi/kexec_metadata.h
> +++ b/include/linux/kho/abi/kexec_metadata.h
> @@ -18,28 +18,31 @@
>  #ifndef _LINUX_KHO_ABI_KEXEC_METADATA_H
>  #define _LINUX_KHO_ABI_KEXEC_METADATA_H
>  
> +#include <linux/build_bug.h>
> +#include <linux/kho/abi/feature.h>
>  #include <linux/types.h>
>  #include <linux/utsname.h>
>  
> -#define KHO_KEXEC_METADATA_VERSION 1
> -
>  /**
>   * struct kho_kexec_metadata - Kexec metadata passed between kernels
> - * @version: ABI version of this struct (must be first field)
>   * @previous_release: Kernel version string that initiated the kexec
> + * @reserved: Reserved for structure alignment; must be zero
>   * @kexec_count: Number of kexec boots since last cold boot
>   *
> - * This structure is preserved across kexec and allows the new kernel to
> + * This structure is preserved across kexec and allows the target kernel to
>   * identify which kernel it was booted from and how many kexec reboots
> - * have occurred.
> + * have occurred. Preceded by &struct kho_ser_hdr.
>   *
>   * __NEW_UTS_LEN is part of uABI, so it safe to use it in here.
>   */
>  struct kho_kexec_metadata {
> -	u32 version;
>  	char previous_release[__NEW_UTS_LEN + 1];
> +	u8 reserved[3];
>  	u32 kexec_count;
> -} __packed;
> +} __aligned(8);

Why __packed was not removed in the first commit? __aligned(8) should 
not be needed, given that it must follow DECLARE_KHO_SER which is 8-byte 
aligned.

> +
> +/* Register kho_kexec_metadata with KHO serialization accessors */
here and in all other places, please remove this comment.

> +DECLARE_KHO_SER(kho_kexec_metadata, 72, 0, 0);
>  
>  #define KHO_METADATA_NODE_NAME "kexec-metadata"
>  
> diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
> index 6f1f55fe3181..2edd772bb6d3 100644
> --- a/kernel/liveupdate/kexec_handover.c
> +++ b/kernel/liveupdate/kexec_handover.c
> @@ -1740,6 +1740,7 @@ static __init int kho_out_fdt_setup(void)
>  
>  static void __init kho_in_kexec_metadata(void)
>  {
> +	DECLARE_KHO_SER_HDR(kho_kexec_metadata, *fhdr);

Please don't do this, use kho_ser_hdr directly.

-- 
Pasha


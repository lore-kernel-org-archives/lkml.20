Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFAA4CF494
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 15:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792249980; cv=none; b=jEILSh3884XbCf5nFtYhxLsGzxIjkYhqqNzCNDw1OnJMMGZI+AlYoHGKi7g5cuaMKmCfnISxwZKPJsWRaL7uBDR6ns+gbcpM5Zl1AgkDoLVdYfmfQALCzh+NxsnOI1ddhFjo2Cutt41AyGNsAl09uGCury+PLGHRDiaU1BZxN3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792249980; c=relaxed/simple;
	bh=qqf0EAA1p51dLetd82Aowt4wkoLim7JbMCgwGi/DBLw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PXk3GWHzTJoioMqZfutjwNGTfssw9v6EHXXIENZaV/rWp/JTVW9OJM7+b92Sr1uSzziUOjTLA1B6xJ4hck1nJML1Tzx0ROITOa6lFGJlukT8JNAOuGj0kWzH0ebofMzPj5FwQCxmxrs1LNYjHOHPlnk8SDk4znz8ZoZICPP6/2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FAb4mNf3; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FAb4mNf3"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-360bd1d1f9bso89455eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 08:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792249978; x=1792854778; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qqf0EAA1p51dLetd82Aowt4wkoLim7JbMCgwGi/DBLw=;
        b=FAb4mNf3YsK3fjrY1S233OEYm2YOvZZSl+MebJxmm2C25jn/sj5H0tOOy+crpCP4Uo
         iriQ8nXeJjSnDq8nspBB1JxB7bNbO3wv2yfUpyvSaV295tLXpqc2ZMskCU/XIYo0X9ns
         34Dm89dseKYyF4mUwPYx+xozVWGcpdiDiE8qtCIHTWYE7iH2vPK7+8mSmg4s564FTMCs
         vo0gLSYfVqkv4gaBO0brQBNbH+J6IemKdTxpoZtVaKmkcQDxbRA5clO23153p3MPPtUE
         9PvrKS7XWwkB8IVDyHZ1YsZQ45zmi+7WxpRuK9+0MlbLZxA0Wx0zWKq1ZbxMSUPMpGh9
         wXZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792249978; x=1792854778;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qqf0EAA1p51dLetd82Aowt4wkoLim7JbMCgwGi/DBLw=;
        b=Ibr1ZIif9W1weB7Z7eyjWwDdM3O4U92h0ZZvUpEKOg1XRJnizshL4LqnnKLfrIiGOj
         cmmeR03RjKyYpuW/afsFf6rIrvjsZ90LIQefkQYNpG51leNsbGMSsmTpRplh8BlKIr1v
         Gzjt1NzuU1IWgy7feDnY9e4ZS2lhZW61YzaRhc59PCShUUz0NVA2twj3fefDb2WLufs5
         6Kc+4y9BtX95v4/kkMruljCiKBkh5kg32oiuufkGMzagwpBwjYOFPP8Td/6r9lyMfKc5
         VfbEWH4i2K7EwQvwC+Snffxq5tKAczy7FjB2TqTPiFdClDVobMSXkFzHii5PhRj0y16F
         qlRg==
X-Forwarded-Encrypted: i=1; AKwUvBwV4BCePvDunyn9tHO0g86Fo+52hx4wocjGwdStbE2T8TZ/qEbbypRJ/ZJgq5nYVfN4gtCPGElt+aCLFlA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXdEYP1AgL6cG8giG8GqPO1CbvU7oKFucmqKDXLoCH6o2ltaDT
	pk8us5gDE7wUSigeTVEelHUpMBIwI4BM/vs5ZXLIcVQobMFkRAuo5xAl
X-Gm-Gg: AYBFou2refzMX5Xa83XpChhqoVTKAYf9gAOlPFluS4CKNj65wj20z3xN2OPGwX244cp
	lMvHrK7byPzVTeZK3O3WFQu3fAF4MiM3ALrB1KrSQTACZn6+Lz01zGC2Mg9Rbj+oLTfVAomuLRE
	B22csnSTOFsmCmk+sZN6LQtoPFb8tJP/F8/eVqTbaS858nT3q3Nl5JvRxdtRLgrM4lPOmZMYPYG
	INXcdVk1n2oO6YXpTXrDPTL4zjQP1KkVn5lm6GilvbV53iQvSgHMiO7enyceXiy6RU4KA5JeUeM
	Erz7UBYDntNlSIgiTsHJiidS/pZoSq2iRgQolDHsnhkeWAcC9wcPMxkV3dRE/k3gobykqw2xalX
	yhShfbVUMVZlFALJKruLy9TdV9fm5PJMJhIRlUmqSDqijME/xNjwhDpXDqBWZ74P70fLfXnVz4K
	+rZ9NGjLMn7FTAjNqnfSxg2zYLr9rPnideNXB8QL+mxJkFDVlwmRUtOEiBH9dZfUtQYawK8nQjE
	mvhnVpj6EwDUgb/S2BgHtrewUFTBO5npGnb
X-Received: by 2002:a05:701b:4544:20b0:144:fd17:3b21 with SMTP id a92af1059eb24-18507810acdmr6497204c88.0.1792249978107;
        Sat, 17 Oct 2026 08:12:58 -0700 (PDT)
Received: from o6.lan ([2602:fce1:44f:115e::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa3ebsm13199859c88.8.2026.10.17.08.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 08:12:57 -0700 (PDT)
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: malhyuk97@gmail.com
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	lance.yang@linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: Re: [BUG] mm/huge_memory: lazyfree THP PMD restore races zap_pmd_range
Date: Sat, 17 Oct 2026 23:12:51 +0800
Message-ID: <20261017151251.3162336-1-xueyuan.chen21@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <CADQRuqvXOS9J9ebFpRf0dkFPwPvtWBR=fHWNb1oYMQwQ0X7_gw@mail.gmail.com>
References: <CADQRuqvXOS9J9ebFpRf0dkFPwPvtWBR=fHWNb1oYMQwQ0X7_gw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Sat, Oct 17, 2026 at 09:15:19AM -0500, 김종혁 wrote:

>Hi,
>
>__discard_anon_folio_pmd_locked() clears the PMD of a lazyfree
>PMD-mapped anon THP with pmdp_huge_clear_flush() and puts it back with
>set_pmd_at() when it turns out the folio cannot be discarded. The only
>lock it shares with a concurrent unmap is the pmd lock. zap_pmd_range()
>tests pmd_none(*pmd) without that lock for every caller except
>unmap_mapping_folio(), so a munmap() or an exiting mm that lands in the
>window skips the whole 2 MB range. The restore then reinstalls the PMD
>into a VMA that is about to go away. Nothing updates the folio's rmap
>or the mm counters, so the folio stays mapped forever, and
>folio->mapping keeps pointing at an anon_vma that unlink_anon_vmas()
>frees a moment later. Reclaim dereferences that pointer on every
>later pass over the folio, for the rest of the boot.
>
>I hit this as an ordinary user (uid 1000, no capabilities, no
>namespaces) on a stock v6.12.112 build. The code is the same in 7.2 and
>in mainline. If this is already known, sorry for the noise.
>

Hi,

This bug should be fixed by:

https://lore.kernel.org/linux-mm/20261012-lazyfree-stable-fix-v2-1-6387d6e30063@nvidia.com/

It is already in mm-unstable. Your reproducer would be a good test for it.

Thanks,
Xueyuan

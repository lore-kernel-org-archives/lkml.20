Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C8C455604
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789635682; cv=none; b=PE86D4B+BoTMR7MH8XCWKWwT17C2rR7/s9qSBClGlfAgOpPKwaMtULFvxWFjFG4p1sYFIErz02vFhpLfR5kL1ukj454kvPeDaeawL+ACSlWWBvc64uO74GdaPXW77x1hI7BwJjbmWK1QSgSMa0/qxx7Q75Zo+58owshWaFcm8LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789635682; c=relaxed/simple;
	bh=E4Z7jOErJTXnsj5lq5ff5hq3IDJWBDJZ0dlVPtQNtd0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZN2ZX4Kn9P+kQDmYMwtfC0hhIxr7UjJ1YnK8NAqzFOzIX0wqrmmF8zzpfgulIFm3d3xXwxN77mvSJFT+tZm496aMFS+mcsF41wY+37G5czmj8NAfJ3fb6t44a9gnTdv7q49J8QvHivQwFkad80zR7kNgLc2ubQ2K+G9Ip6Q17b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CzDdVgbR; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CzDdVgbR"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-86efece610cso476897b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789635680; x=1790240480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=laqtueQ1A73xIegtMtRDwRGfwaKfJ/pA21DgwFlf3jE=;
        b=CzDdVgbRryQASSW+SvnoL1gqi3PObb8VQYYKRjtvfjC89z81fWk1U9S8e/LPzki/J/
         zlwti/ypbuJ/9y5cKVfxVRLn/xgCedFhtRfTmLkOZK5GgSiXV2wN5TaXJjNUmbQByI5Z
         HRNGCdDv7ILzIZqCxGVn0c4MRYH5P1Hgax3VNNAau/SCTmSUdiIF/OGQIDZCii+vrxwi
         hGfm4y636tQ8+pKxBIx8g1zPIZcl6RxRMtw0qo4mjrtEMSEV6i4E4HuOGCVCgRGcB9LD
         kiupt3otR4UUtm4RRyLpbhT+XFnJccNECUfCWLujoNYBss1Y6Jj1AFAlhLTfIXlZ7oUO
         E3vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789635680; x=1790240480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=laqtueQ1A73xIegtMtRDwRGfwaKfJ/pA21DgwFlf3jE=;
        b=gfiQlFto0WUNpIhcElv2/95FfJFRwOIOuYwna4Su0bmJqiCUX7J1KYHALR0bUZRV+c
         P09eIAIAMfdW699T/j//pBGDWLUVMEuse31jwM3LUz3WwfonBlpFYynFwnKxsP3XybZF
         kCIQW/IjF4OOepQpeqSDVHARfCgG1Qdqc8FU0qi8gITVVF8fwr8P5fgw1nChH0I45UMP
         aGwI8T5XJR+wOSyImwphePICVOhvEFLwIEi1g9y8JGY0P72itS/54PqkwT2J2xOOr+J/
         JXL9oNKgvOpCm5dXe8JggrBisbBVfOATgfl2mTUBp9IqolrzPAAit1Jt46u0kf6rHVG8
         6l8w==
X-Forwarded-Encrypted: i=1; AKwUvBxWz0Kl6wmMs89CXdYubHahGeDahPYX+Yq8i4ykBQ+Y/OSHRIRi9QehOJfa39gtl8AxhhBbZTTLy+tsCz4=@vger.kernel.org
X-Gm-Message-State: AFuF++l1eDrThmGj2Oq2qAG2BGVwSx6GHgRom1rC9MBQqUTRLcTDFKTr
	5acjUdw2tHvjbzaPiGo2kWfroLebeMpIksV/EGEkslcsRslv18L9aXaa
X-Gm-Gg: AYBFou14ic89rem/OMuo+M4LOhe0+3w4BS+IFtqBE37d/Jnz4lgl8IsZ+i1HE1QiHl0
	CX3ivyPggMDxVGaomGKqVvfXaS2nCsFLSMDOFqxOCecMJT5W4W8D7O2TvP/cXEqzNC0Bif0teH5
	O2tNA0k/deAJvYtDQNd3WJ6RfEqWxDeC9BvFZZoFufVkC4U8Nyi2ux+6q9uNgCRfek3mqtyUklb
	NQmkazVUVEqgcztAwHTpq5XO8OZ5aO4zyB/IXcLwI85ptrI4V9UaXgA7khCFTmSvwbxTzlGrjij
	Bydb8wDOMC20KGLIpzcLoXRHBnEX3r3i74xKo3oHnMpi+k6VAweXSUjUCLFaCnKQ6spe/9ksYNg
	buckT4qKN+zV2AsXkDodh9IdeCrEQfF8gqJdHwjT1+wbckiZWSELUUBclJzalWvMDy0+HxNGMcP
	CSIRBTmEKbDx9m8LHtqjVWkAJMImN9Gwzkfoto9waIO8V5xJf8v6pdCnRME/zqFBf2Ca0mipU8A
	HeyHhK1gvBj9MqXDC+Y1+ZmuD/YrPL1BupaA9RpL+/LD1YCf7NqHjFeL1e6TFJU09i5tH4RG4e0
	WbyZbCeHL0ND69uE+XSe2LALuQ==
X-Received: by 2002:a05:6a00:440a:b0:869:ffe4:47a3 with SMTP id d2e1a72fcca58-8723969271emr14424224b3a.20.1789635679950;
        Thu, 17 Sep 2026 02:01:19 -0700 (PDT)
Received: from DESKTOP-TJS95SS.tail460ce2.ts.net (36-232-230-153.dynamic-ip.hinet.net. [36.232.230.153])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-871febdd0e5sm2438675b3a.4.2026.09.17.02.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 02:01:19 -0700 (PDT)
From: Yuan-Hao Hsu <aa9736195201@gmail.com>
To: David Hildenbrand <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	liam@infradead.org,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Rik van Riel <riel@surriel.com>,
	Aristeu Rozanski <aris@ruivo.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/gup: batch PTE-mapped large folios in gup_fast_pte_range()
Date: Thu, 17 Sep 2026 17:01:14 +0800
Message-ID: <20260917090114.611-1-aa9736195201@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <e988b0e8-3ee9-45ed-9d34-7b73d86d9cfd@kernel.org>
References: <20260917083747.786-1-aa9736195201@gmail.com> <f8f6d553-d818-4cc6-a1a1-a9c9149a17e9@kernel.org> <e988b0e8-3ee9-45ed-9d34-7b73d86d9cfd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 17 Sep 2026 10:43:22 +0200, David Hildenbrand (Arm) wrote:
> Ah, no, Rik looked at GUP not GUP-fast. So I'll have a look but it will take a
> while.

Thanks.

One note for whenever you get to it: the patch is against mainline, and
the last hunk has a two-line context conflict with Aristeu's
gup_fast_*() cleanup in mm-everything (pages[nr_pages++] there).  I
have the same change on top of mm-everything-2026-09-15-07-39 if that
base is preferable, and can post FPB_LOCKLESS as a separate first patch
if a two-patch series is easier to review.

Yuan-Hao Hsu

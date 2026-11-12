Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794503244;
	b=sOxIr3HaIMP8Svf8B6TlKraXoWEoJtp7/R4BgLAP2N1ZNloQU0PPFnXV1Vv3MvayX7hb
	 1GDXaBJQ3eDePjvp+sHATKi5oHfI2N3UMepSmGMTFH9ZJDc4xTQ3Fggv392O0GGtSkMyw
	 aHf5Fv/bud9/8kYVFYVzKBd4YZomjpWdAISulOoMhtQRj0yD49tz7EM352JD16ER0zbrM
	 y5RYj+SXWKuNHQdvtk/OvGTQFZSJ0QjZs9BZqh8XfkNEpkXWG4hxVuhoXQjoIarnofj9R
	 /4JhK/VjonQxsDfwSPwE0VSqv4shWON+MoDtCaHx+6jg6CP4e0Bizc3HehCblKNe1YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794503244;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=KhfyBc//VTsBjqGcAjilygXZyjWzwwcnsTJakX/xnqg=;
	b=XZQ8oRgcTFPThvSFqQsnMmwhOdrnWMcTPlAB3ip2WLzoNqaXxhNVRKSiqo0430M/9yRS
	 3OGRVSlyL41PTlMgtChmlwOv6B36ssrFpZGCO5wX3wphvLy4MD/sLr8d0LIv77a4Q0HjS
	 nDIu1usuTS/fKZK31EQmT7iVER9cmQ+M4w3a9KqJHkA4DQBX6eiF4cmgZE0f8KzE/NP4c
	 tA4nJgAqYR10zNO05s2eqn3B7U8wDfu7OZE/WSKHDtRtINPN1znzPj8xPhINYbgqGQqjA
	 FkoKgFVIfLBlVTRvTeGN1dtP0b+uYX1eMtGZ8wk5stcg84L3Tx6tg9SfP0t1Vrwg4Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=XxxT1kWh;
	arc=none smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A2C606A885
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:07:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47A2C606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=XxxT1kWh
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5363c8de563so46343941cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794503242; x=1795108042; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KhfyBc//VTsBjqGcAjilygXZyjWzwwcnsTJakX/xnqg=;
        b=XxxT1kWhf77k5HWqZd5kSrqa9TenqWzfTradsETOEJAdqwv5kPkm0YFAc3mX+F37IW
         1+OIKlYSvTjKdGZQIoIFNycQRdshGBKzSLwaeC3xje+Rkrey59b/rRuJgxLtsESLtKO4
         fVWG/05n08TabWyxSrBJEGHgNJOaxevdOavw6rdXW33g2qgVFOyhrVMQNIPDgYxyBNOj
         2Sq8DODDDCLwWpRKQfxahhMapheQX0LjT+is2oM2+S/96qVC+UBHAXoB/dIaiPzzbGzD
         yM8k8ffsmtFewc5wlZ76cXuEnxlW5NNd8lrp6aiYPxKuJhlQsaEgK9Cy3UNScEKqkmnv
         IQYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794503242; x=1795108042;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KhfyBc//VTsBjqGcAjilygXZyjWzwwcnsTJakX/xnqg=;
        b=vmSnGDoGyFTKPz2hzqABpYxazpQGLCupi3ajkEiumWeBSTNm/oIGJRm3feq3F6viu8
         IijvUF31g3UO065BHdM7UQGYzW5XQ1Xs01ZPWV23zOktP10GwU/rb8XuLpwG9Gg+JWwT
         pWLOBUgi70n0c9qYnuiZgtUIiFQaNyoLugIa7Aja8FSOuR3DgMpwdLGgjQTL1da+AIor
         Bz1oL7qdH28/RoKhrDG3aY14uVAWp7oFtrIpIjc3Pts2bEuAhvzsjYqcbGXzOR34KTQ4
         YYwc87/1jraDcLcWiR0QbNxZW1cwRqm2Jaz1+fOjnyMWSWdOUtbrrMfMKNf0tTDMsE3l
         e/cw==
X-Forwarded-Encrypted: i=1; AL+hErEMScDzbMMEHE7TVXJGkgwoWpuaNZYQz2KDWGPgcewtYMFD5fmsm7ERcI6aBvXG5hrFe+pnGNcGw0aWlgE=@vger.kernel.org
X-Gm-Message-State: APuU4Z93EgPwPvP+F9+DoEdmeCKXtyRn31Jf/gKLnBUMoH0CAU1gwDr4
	4ytFQFzSdaA0ij7EMiQb+nc9FgAGFsBQitligKa2EczxEnVOD9gh+DfHsB2op+AVPJI=
X-Gm-Gg: AYBFou3hXS54Dsb2CY9RJV02N/CkCaZaf975E7W1BcwF3nCWkgjoCDWCwsZblZpJZS9
	U3+wqlGucY1HQonLBZx+Ml76s4udh5258+HirlIHLSCUt3x1Vw/H/1tzud5WaSBF4dipfKYx7SK
	SHUec7R5Exk/ProGxonVr7nlkYPDc28p6MusNC4uYQZnWwCgPDTcg8OmQUSIqhG+2wX8lm2Mv+c
	tsR2RTACz/lY+cR+g3RzASInng9Qh2c7ogYSTxbUm3/vzawTAkLG3tKyx9eYyKQxeJ99I5GlGof
	F8CAV/ayA97KuIYrF/23N6SViHMWy9l/BG15b64vkjZ65FI9Oe3i4tAo3SFoKwalwNa9EMAOyGr
	JIcwJY78XyYZ5SJXVCN/T0PWbI76obXJi0lQoMMvYYKJ5b5HUWzAijxEx11OoU7SopY9aZNrChH
	z+OMOWXGDAe2yjwpgkH/384Z55rUvCPbE/GFrAoEbtQQ3F634RD9edcXUKcYr6iDtt9uyTzgB4l
	IyMy9JMTwB5EojKEC7xmKHVeAlkyYw/Ath9xK+dPpffeS9ptM+cQ2wOZ88qlte6aLCzAyIROzs+
	rjwYdlc3l8t2Y/grzukSz0dNcM4cS7N4k2zK0ZIGktj+0CrWc7iw89hoLjIZUugRxzST2COeZNt
	DRl/QgW0=
X-Received: by 2002:a05:622a:684a:10b0:535:70b4:3f7b with SMTP id d75a77b69052e-55aaaefd128mr5760821cf.65.1794503242102;
        Thu, 12 Nov 2026 09:07:22 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550bd33340sm78278751cf.21.2026.11.12.09.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:07:21 -0800 (PST)
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
Subject: Re: [PATCH 04/13] mm/migrate_device: allocate THP deferred split
 heads
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: David Hildenbrand <david@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, David Rientjes <rientjes@google.com>, 
 Shakeel Butt <shakeel.butt@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, Jann Horn <jannh@google.com>, 
 Pedro Falcato <pfalcato@suse.de>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
 Nhat Pham <nphamcs@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>, 
 Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>, 
 Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>, 
 Gregory Price <gourry@gourry.net>, 
 Ying Huang <ying.huang@linux.alibaba.com>, 
 Alistair Popple <apopple@nvidia.com>, Usama Arif <usama.arif@linux.dev>, 
 Kairui Song <kasong@tencent.com>, Balbir Singh <balbirs@nvidia.com>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_Glisse?= <jglisse@redhat.com>, 
 Kiryl Shutsemau <kas@kernel.org>, Yu-cheng Yu <yu-cheng.yu@intel.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, Dennis Zhou <dennis@kernel.org>, 
 Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>, 
 Peng Fan <peng.fan@nxp.com>, Josef Bacik <jbacik@fb.com>, 
 Chris Mason <mason@kernel.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 "Borislav Petkov (AMD)" <bp@alien8.de>, Mark Brown <broonie@kernel.org>, 
 "Dennis Zhou (Facebook)" <dennisszhou@gmail.com>, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Josef Bacik <josef@toxicpanda.com>, stable@vger.kernel.org
In-Reply-To: <20261111-mason-migrate-et-al-fixes-v1-4-3d2454362e8d@kernel.org>
References: <20261111-mason-migrate-et-al-fixes-v1-0-3d2454362e8d@kernel.org>
 <20261111-mason-migrate-et-al-fixes-v1-4-3d2454362e8d@kernel.org>
Date: Thu, 12 Nov 2026 12:07:19 -0500
Message-Id: <179450323943.482102.10332650234844298705.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-11 18:13 +0000, Lorenzo Stoakes (ARM) wrote:
> From: Josef Bacik <josef@toxicpanda.com>
> 
> A THP that device migration maps into an empty PMD can end up on the wrong
> deferred split list when it is later queued for a deferred split.
> 
> This occurs if the memcg has no heads yet (resulting in a warning if
> CONFIG_DEBUG_VM is set), where deferred_split_folio() will then queue the
> folio on the parent's list.
> 
> Once a later THP fault in the same memcg allocates the heads,
> __folio_unqueue_deferred_split() and the split path resolve folio_memcg()
> to the memcg's own, now existing, list and take its lock.  They then
> list_del_init() a folio that is linked on the parent's list, racing with
> anything holding the parent's lock, and both lists' nr_items counts go
> wrong.
> 
> Resolve the issue by calling folio_memcg_alloc_deferred() after the charge
> in migrate_vma_insert_huge_pmd_page() and falling back like a failed charge
> if that fails, as __do_huge_pmd_anonymous_page() does.
> 
> This was originally discovered by code inspection.
> 
> Fixes: fafaeceb89a5 ("mm: switch deferred split shrinker to list_lru")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> [ ljs: tweak commit message, remove unnecessary comment ]
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Was able to reproduce the warn this spits under CONFIG_DEBUG_VM
and see it relieved with the patch.

Tested-by: Gregory Price (Meta) <gourry@gourry.net>

-- 
~Gregory


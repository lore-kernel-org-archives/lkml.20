Received: from mail-pz2-f6.google.com (mail-pz2-f6.google.com [74.125.228.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F243B059E
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792131444; cv=none; b=o7CJ10kZKskWvP1zWWuE+aTQu/USBkE3Fhml+2x3TsdoJakxldpNzy+jqfs3PUi+0pX/rFZyeQjYKw0asDV1b7rr8B9P8X6AZKuQt4iH29eSr4rYfIPvU2cjQ/mRcJoxn8HtoAlMhl1wT4FqHT7u5PyUhgeuyMnq3rzLPJx/vsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792131444; c=relaxed/simple;
	bh=KS2Sad4txxYAPU7Ulhsill0lGwhrig2221eGQ+9zjh4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bnplwfJgnm5rRl5w3tCDeUGMvIROT+94jiK2L7hOFZ8klAgNSsCoEuHA0DmVLupDmD/DKKc3otCNQFKn4lXjSv7AzfzJJCYAX8DRN04oeLvPCRk2lAjevGTQDfL9s0KGuBtB0xyeUe3LCnjxibbx5UmyjrOnzy7vq1lk+i8nbKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sozrWC/h; arc=none smtp.client-ip=74.125.228.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sozrWC/h"
Received: by mail-pz2-f6.google.com with SMTP id 41be03b00d2f7-cd613507bd1so462348a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 23:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792131441; x=1792736241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EXuyqgfiF9x7HO7+fbFxeGIrd5nFUV6QECR0sZa4nrg=;
        b=sozrWC/hrPsPGXUJOtz7zeNJFwRMG4JtMwDbTJnkVIoQARYDT6b5NEMyQEZB4C9BOK
         bjTY3FqKzzM04wFy81NTKkS9niMuPUq8H9ADjsl++LGOh45mdMa/GVFEeAxWXwpPLXN5
         UfF0E66U+9d3aOgB/F3O7UAlYbvJjCaUjOsKtrQ0hLxjk60Zw9GmKNeQJPe5VcRvGNZp
         hCCsCA4c9dOYgTNei6ncgCjczGMeEwo0leiPjw5A26wYn8OvZ+0vReSCb1PoQSNDKcLb
         gesMbXceZdO7a0kMNM22G+u304itB1aROd4qHd0s9GyJqLl1tsvB5RO35t+ZaywJRdrj
         BZ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792131441; x=1792736241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EXuyqgfiF9x7HO7+fbFxeGIrd5nFUV6QECR0sZa4nrg=;
        b=HwwsPR5XhGl8X3UWjfOsKn1+BoSs5DjeeY9DCc+0DTdoW+Cq4yqc/OZh4MNYcJUVre
         wiEHZ2gkChDc91RXuLPcMhkGqsXYZEhG+dKVpgtH8lwc94A5OlhuINTNwagaJQbmVLVz
         g06sPAwqKIBHwjDF/Xmdzq22Ez+qvZ1O/HU7TxD3WmeDctCppOuA9CKQLdTHf1fEi1Nr
         BVhPWjlkA1MIIc/zh3OQ+1y58xRQhKevdVC07k29updODKV2fm62+lDWjwhOG7w8N32B
         opsPmyWBf2VD+UX0IwSNGMd7pgzURvmF6zoia9z3uQJdh03F7bAd/gfvoI50NAyeF3T+
         fYbg==
X-Forwarded-Encrypted: i=1; AKwUvBxf2s34rpyGR8wnOnBOqX/jDL7+Jqj2nZXBMXiygw50SHwn+JX1hvejUsNIqQgF9mwAFlLAXk0kIf64bVA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLG8yIlheBVyZD+9AtNFYZEBxqT14lFNKDhjiFASOWS7ZCbeS8H
	CMTNC88TCr84JQhumIOH/NVDLZ39VkbcVkTq5VHeypMEF3FBWYriPyGE
X-Gm-Gg: AYBFou1GWDuPGTjbCWyfHlLZEMEjGnAShhSpiEtHQL7Yu9CK0ZS0tMsdTzQP++Xoz76
	5d1HnzyMIjrrn9kHYCGLGL7FOj+MbBS+vrIRq3mf3peVplEW/UAGqj6VeZUwLvUyuEs1YpB5J44
	61UINSoIcfkfzNZg43jb3r8z7gkLknxP4FdLsma6CJiE9nJk9pZ7080L6xKNTbZ/3LQUIFMtV1G
	Rg8wYrUSB7r16H+LwMrLbePqexl8jYuOEF8eKnQlLG9CM9fjosRSsnuHJ4jVPlJu3YqyT4Baf7z
	nGNcvcMnufDS9DTZpn1tSs8pXDLcixHhfnp6e7I/pA7zl5J/ngUym8ouZe9OUdwI9TPlzifOPcz
	4uPcS453xc8GFReRzvw3KwzwxzPntlLj+5e2OG5QPORewFROEkMDHQ4hpcTlpxpOfePnHw0n7O8
	W4pRG0qhQiheXbzgTa+k4tNE0N91pbOlBB0GNdv0FI97aAwtyyk8RdB3dXi1V4oRJnMfoGlD4ZR
	oxxBovlwIajuZj+NTSZUw==
X-Received: by 2002:a05:6a21:1f8a:b0:3de:14ad:ae8a with SMTP id adf61e73a8af0-3e1d04198a7mr7196697637.16.1792131440647;
        Thu, 15 Oct 2026 23:17:20 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57b334e6sm586375b3a.42.2026.10.15.23.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 23:17:20 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [RESEND PATCH v8 6/8] of: reserved_mem: add dumpable flag to opt-in vmcore
Date: Fri, 16 Oct 2026 14:15:47 +0800
Message-ID: <20261016061549.4181390-7-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016061549.4181390-1-chenwandun1@gmail.com>
References: <20261016061549.4181390-1-chenwandun1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

Add a 'dumpable' flag to struct reserved_mem to decide whether a
reserved area should be included in the kdump vmcore. Non-dumpable
regions are later marked MEMBLOCK_NODUMP; the filtering itself happens
in memblock, keeping the arch kdump code independent of the DT API.

Most reserved regions are owned by devices and do not contain data
useful for kernel crash analysis, so dumpable default to false.
Reusable CMA regions are different: their pages are handed back to the
buddy allocator and may contain key data for crash analysis, so set
dumpable to true in rmem_cma_setup().

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 include/linux/of_reserved_mem.h | 1 +
 kernel/dma/contiguous.c         | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_mem.h
index 49da515859f2..99c0f3ccc297 100644
--- a/include/linux/of_reserved_mem.h
+++ b/include/linux/of_reserved_mem.h
@@ -15,6 +15,7 @@ struct reserved_mem {
 	phys_addr_t			base;
 	phys_addr_t			size;
 	void				*priv;
+	bool				dumpable;
 };
 
 struct reserved_mem_ops {
diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
index 90937dc7c627..d7bfc38ac762 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -567,6 +567,7 @@ static int __init rmem_cma_setup(unsigned long node, struct reserved_mem *rmem)
 		dma_contiguous_default_area = cma;
 
 	rmem->priv = cma;
+	rmem->dumpable = true;
 
 	pr_info("Reserved memory: created CMA memory pool at %pa, size %ld MiB\n",
 		&rmem->base, (unsigned long)rmem->size / SZ_1M);
-- 
2.43.0


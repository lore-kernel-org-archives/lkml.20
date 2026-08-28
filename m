Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C98536D9E0
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 16:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787935614; cv=none; b=UwcFUdUg8Ha/iSW9oznaHyfvyT+zXeQnA6awhLN38RLO6V3TZCpQ2h8Gu3T7uRP3g1aelWQCx3JfSrHB3W9T0MDRlALqnh2j1gt+zx64hJXht8mpIYQK4SSlRdKwm5erOOvLykBCewPq3Q8nH/0ore2Hvka4HBaDKcmrYn3GEpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787935614; c=relaxed/simple;
	bh=K/goC4AJrkO5X5CWpHMZBHdgUtrswgL/G2WnogRSeq8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CPTE7JNWChnIiX35C+8GQWgli3IZu2nrr5P364htIIBZrdhKkK2P8WqcDgf29niYsNBgj3D7lLkdgpz8WhF0gsrxJpuvxlNUM8nnVFM24+na6qfx+QSMw3NpJR5zqwVeA0zWlwd0t3iTkereilYVsUShZwkx54LkUS0DIZM2veU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai; spf=pass smtp.mailfrom=crusoe.ai; dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b=baqgU5RU; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b="baqgU5RU"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d6f55a7089so10815915ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crusoe.ai; s=google; t=1787935613; x=1788540413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pBVClgdpKmfnkM4Cu3SaLQRKw2oS/EQYOdlTnpUMlbs=;
        b=baqgU5RUiLtxq3hbdjqp2LgIz0O8nwGxEMvno6sXlMZ8s8q51wBUF5BbJLNNtQjOqT
         xZhEa2eU0SAZDhnotU/1tjvxrHQ+ftK9/puNh/SEQdfOKkTdlSxEvjoi7urQHAFbVdYF
         +pSTyCYUAsn8ihnQzIbPUHiR4r+5Ko3s0+3ljAaJpfjoQ4J4iWA4Vb1kSwyxJFJWN5wU
         /8fxVq4Coc5aat2Od0aT2g5/PXvD+QeZ5+9039GQeqltupHRhCIj5/4T7F7z9egmFdro
         aYf7GIWyczwefLl+nYlscEPt7MNWrTiAMEhepO5yzgVGcSMGKqdaSIDyY0VAWbsIuj4t
         pHqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787935613; x=1788540413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pBVClgdpKmfnkM4Cu3SaLQRKw2oS/EQYOdlTnpUMlbs=;
        b=YELBG7zZdX2IkwUEcwJmjgR2yiET316MPVK2BQP4NyXqFolDvPJeTfSZfpFTZduqbC
         PJKJ1LbqOoZ3ETNW22HqgWGGodB7BqQkkVDCsn9WOVS4Aztu52HQoV3W2l4bz3nUgj/j
         DUE+WNb3ZCLbtklKvl4vaAFTxATi0WnFGMrD963FLFaQmp8VPWAMQwnMuV0iqex1xc/j
         FMvysoHarXoZwxB72b+URqVrdaXS/Ystz3uk+A6i0Bg60hjIdT4HAXE+pjSZSguTXt88
         NfuvwcO4XFQUf3qE+ZHawl0QU6QBRmvI9ZoAnN7zgKxGPf9iUuvwQxSnNaSik9l03dR9
         yNyQ==
X-Forwarded-Encrypted: i=1; AHgh+RoZvo+g0NY6xw45VOaWAxwWZI1d1S0znD+h/xxx5xtwObiCO1NAbqGfjG4yf5Kh7TR2cxfpmyaH7E3dd/8=@vger.kernel.org
X-Gm-Message-State: AFuF++mg1TSrM7TsXcMmY5pCYy+ml1g7LZrxk/1HVbuouyfYGfQZsSuj
	dPew4obkKfbM43+5P9YubMeLSaMww+KpnJMlRWAbIgqHBsC9N2AF8Zz8gxs3REeh9Wg=
X-Gm-Gg: AR+sD123SEiTjtJEONu54PbplAtEzt26Evyz5iRjWDcbp95zEhCe29oxYgFMfViFY+c
	wZ3Iaz+4IgHgSZW5F4BK7ysOn4fWt9/pjjlpIZHo4Q/JoAbaTasqCnWeN3vPzbkRwwPWS76J1bg
	cBV5sR2ek5mwaZFgmbYaAqF1XTRq64h4xBc0IMwJTw2SiAzUCVDatn3FHKWdqrMqL32r4nx74uZ
	4/6r9+quq6cEI8o3A4v/YEHDAv/ywjqVufnUf4JpRTzTjG6fNqt16BDS3yeNNFmggF7b8tpa1vz
	76DohiBN3KvRyUY44EECuM4HyWoV5atAqf+MA/w3QSBJZF+ZYfMNFrmdmbHD+jstn3xXrbe4goG
	XCQfjRM9yVyE5lAMVghq1abzF0Isl5Poy8w7s1qwc09PV6xcLDab4a14bHgjXQUm07OwwEfGmFa
	PpG80Ef0DpK31413h2N7Wf3aD+I2JrXXf0yoeBo6oirhOZxUp3rWfTDuJUEnvKnWwd5ezwX3Z4W
	breB0nxJiYOAKlBnOJcFkDNWdyPLH8mQy0nfWWVDPUJqiaQJrQPohfuk/EBAEK5HpKNaVOiN+dt
	2kFScQ==
X-Received: by 2002:a17:903:1a26:b0:2d5:c099:16e2 with SMTP id d9443c01a7336-2d74e070456mr160099615ad.13.1787935612681;
        Fri, 28 Aug 2026 09:46:52 -0700 (PDT)
Received: from MBP-Saravanan-D.civet-hops.ts.net (c-73-240-212-25.hsd1.or.comcast.net. [73.240.212.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75988a1d6sm7487845ad.55.2026.08.28.09.46.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 28 Aug 2026 09:46:52 -0700 (PDT)
From: Saravanan D <saravanand@crusoe.ai>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Peter Xu <peterx@redhat.com>,
	Jason Gunthorpe <jgg@ziepe.ca>
Cc: Saravanan D <saravanand@crusoe.ai>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Cedric Le Goater <clg@redhat.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] mm/huge_memory: bypass THP tuneables for huge pfnmap mappings
Date: Fri, 28 Aug 2026 09:46:49 -0700
Message-ID: <20260828164649.77283-1-saravanand@crusoe.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827-hugepfn-allowable-orders-v1-1-94819c8807c8@kernel.org>
References: <20260827-hugepfn-allowable-orders-v1-1-94819c8807c8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Aug 27, 2026 at 08:55:57PM +0100, Lorenzo Stoakes (ARM) wrote:
> This is incorrect - if a huge PFN map is available (defined by
> vma->vm_ops->huge_fault being non-NULL for a VMA_PFNMAP_BIT VMA), then it
> should be mapped huge upon fault-in.
[...]
> Correct this by explicitly checking for this while ensuring that smaps
> continues to accurately report THPeligible statistics.

I backported this to a 6.17 based kernel and tested it under
cloud-hypervisor with THP left at the Ubuntu default of madvise, on
two GPU generations:

  - 4x H100, 128 GiB BAR1 each
  - 8x B300, 512 GiB BAR1 each

With the patch every BAR faults in entirely at PUD (1 GiB)
granularity, one entry per GiB of BAR, so 128 for each H100 BAR and
512 for each B300 BAR, and smaps reports THPeligible: 1 for every
vfio-device VMA. Total time in the huge_fault path was 4.5 ms on the
H100 node and 130 ms on the B300 node, and the VMs booted in 11.6s
and 32s respectively.

Tested-by: Saravanan D <saravanand@crusoe.ai>

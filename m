Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794599745;
	b=0UOYP1TpAvejPQBG55y+lQDPbT10dGrNh4AknsyXNtyk15lhNqGcVynrT3sU6T6n5Xax
	 wi1yYPzzEymSzOCaoHRs0mdQKiobsweoxTeTaLVsI60Udd07U3CjEBWmwc/bGMPF+t7DR
	 XiGpXNYk2mIfqiV+BBH9BHLPZXkb6nAsIOpHtCfsnMwfRokz6Ky6GwE+cdH7yvQ5HpFzQ
	 hoFl6uR0gseLWttGHKuUmMjPQ8t9YbcEXYcTttOvXI14mNtvVbKiDIVw5UbWAJHwBCuj5
	 jKAE175jaXolIGr/i8pjcrINZwLDQUDp28tNDp+WdL+FLfFsHb6FfAI1sakLUqhww9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794599745;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=UeGRg/WkJsGVpuyAFSuDrs2zUW/JrhTUImqKDlhPu/Q=;
	b=IO3CNCgpJR1XuqmOBE0S3GY+q9XeHUe2+3NgALKU/rYa+IqcXSRTfurlMZ1yZKlfjE9b
	 tynF25kj1kZZMXTRhJVu5kaJ6qfwkWtXvu/KnsVY2rhbVxElpCp3VusIAJjB/VjvH85BC
	 IV9Ak/M0xXxjgsesjF7bAxNEy9EJeJ8nIW/4Pdz05lfflA4U4dWrYhciTht2tbvPb/XBH
	 uQAAbWH401b38RK7Whn/bCae7xLwVvvGI+Cw8q9jI1rQe0Lkp9tGXBtxiFVhoUNV5jWnu
	 Oep/JBVigPNoU52quaNGHuw+/LN1DVB9XyUNxANJtCs2uru6QOPOp98fi8Nhst8AiFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=SdXigQuA;
	arc=none smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD92606A881
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:55:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FD92606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=SdXigQuA
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-55c38cdd5b7so3150011cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794599743; x=1795204543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UeGRg/WkJsGVpuyAFSuDrs2zUW/JrhTUImqKDlhPu/Q=;
        b=SdXigQuA9rPRYvsQD6lB82QqbJ8PJOW0/+lBYrX7DoW1Qe9DozLFb5Gm5MXihOvhPn
         /PSboJd2ORILXHF3rAj+6g2jCpwvYK/MyvfDt78UvVwVyRdvxIlr3kCOB7k/fl8NU8a2
         3Zb7lo2khGTNEQDxWViYNqTcJ+x6SUjpBuLNe+YAgCvKQ4k8BjtKSP/bZmrqHk7KS5G0
         Cj4YIlvALfhcWWhQgl/onRylVBwzQnzPWNMXVytB6T2z/LGxtIY/Zt4YCg03HPdIYjhw
         QYZhZHCUDxVx9jh+qkOFKPiIx5GUzIxwBVP41Twzfdo4M7bYSzPxH9aUhWqwMvXGL3cc
         UU7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794599743; x=1795204543;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UeGRg/WkJsGVpuyAFSuDrs2zUW/JrhTUImqKDlhPu/Q=;
        b=IRkjE+m41aM4T2EGdqqLCvbc2D+ug1vt1J6oi40IYFi9b7xLg0rjkuB0/YynhtIx7a
         RcgpxF0zjibSFrZDNG/mZvecbhWY1UWjW0yuo/l6jw8wMm/DMBVtRR5ryHzxZGnq+zkh
         3cSlcv5oqx6y2HsJeSP52NPECEqDYziabuKNdctvBEGTT38sbfM5/xbRdww3vjA98b8q
         43RbNW9gCiIPHJKLFII4ez+SjCESz8C/t3+4xbjybUwD8HtxTMvAoPu3CqARQQsmnbIg
         61J4DIZlY62Ojwmw5omOdeVecN7WDG3FiSdA6pC1hOOiTOWFtHQrHnZLKYSOg9teR05L
         teYg==
X-Gm-Message-State: APuU4Z8+7YJI16vBGSMHoc4zWAbByVXgMjxeE0SfyEuzos6G6gSpVOGt
	M/Zmt85DkxiuDDtu/IX+HjrsUDavm9y7zfCrRJSuX7aGvVfXD3yTJ3+knLJsea4UNEc=
X-Gm-Gg: AYBFou2nEFQMAs12Td5vipq9573H9DlclMzeNgjMOwWUb3q1+GOlqD9p3onpGxlAC8d
	nRlCUVZRcF6mUbRwwRc7JJ/S61xAWnODRIg4ft6vhoyjdP9RLjATCjwbiKmEPbV3Nhrq1VdAXpu
	JFEjZelR37uXRKkSq3XL4yYvygkc99aKlt4hxK4mXzp5Pl+BMEZjkTQTzkteKVpaTG6cT2+L1xy
	y6LqsBo8KvQjzZOHUZVN/wV1nYEg/nPEgb3pDR2o7+6c/H6XNRZmXjn11ClEWiNqbf/nDUX/ECr
	/S14Aoby8NJGOYVd6SVkRP5YkcfP3ls/ooYpQSvufM0Ov3undt6CdZ8CbQgEqCef4XMp0FetUeb
	IhQtqCy9LqnUjrdsHVTxmZ3qnw5VZDXK27jlnZsro6qHLsNrEOVa17uzhHHTSHS52Kripwt8EoX
	hy2c92IgrZbqBZxTFqMC4D8X/R+NTCNW4fMDi1/MwHyil2sj7WOWFPqFOSCoD0EIfZ90B7aNDex
	/SYN9RbSAyXYlF10K1RHRES7PNvFEd01Yk8lMC01oZesaEGaIShMCNXhUZun/c4dnXpXK/ZDJkm
	aFfIs4qpsvOm/2Gydtkc2Qec82Hqvi7l1zuS2jUuxgovKpbLSPmFauzWE0IBQeRhT86nPv+6GI4
	pGVXhtaFJEBBOTKU=
X-Received: by 2002:a05:622a:258e:b0:533:2c5b:d668 with SMTP id d75a77b69052e-55ac8894504mr59124981cf.30.1794599743447;
        Fri, 13 Nov 2026 11:55:43 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55ad0a231dcsm25486351cf.13.2026.11.13.11.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:55:42 -0800 (PST)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	jgg@ziepe.ca,
	leon@kernel.org,
	akpm@linux-foundation.org,
	david@kernel.org,
	kas@kernel.org,
	dave.hansen@linux.intel.com,
	bp@alien8.de,
	rppt@kernel.org,
	stable@vger.kernel.org,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Subject: [PATCH] mm/hmm: reject shadow-stack mappings
Date: Fri, 13 Nov 2026 14:55:36 -0500
Message-ID: <20261113195536.2660763-1-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HMM can grant ordinary device write access to a userspace shadow stack.
On x86, pte_write() is true for a shadow-stack PTE, so a populated page
can be returned with HMM_PFN_WRITE without taking a CPU write fault.

Nouveau translates that flag into a writable GPU mapping.

Reject shadow-stack VMAs in hmm_vma_walk_test(). Use the existing
unsupported-range handling: a requested fault returns -EFAULT, while a
snapshot records HMM_PFN_ERROR.

Link: https://lore.kernel.org/linux-mm/20261111-mason-migrate-et-al-fixes-v1-10-3d2454362e8d@kernel.org/
Fixes: 54007f818206 ("mm: Introduce VM_SHADOW_STACK for shadow stack memory")
Cc: stable@vger.kernel.org
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/hmm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mm/hmm.c b/mm/hmm.c
index 2f1e98c6b644..fa61ca59d927 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -596,6 +596,7 @@ static int hmm_vma_walk_test(unsigned long start, unsigned long end,
 	struct vm_area_struct *vma = walk->vma;
 
 	if (!(vma->vm_flags & (VM_IO | VM_PFNMAP)) &&
+	    !vma_test_single_mask(vma, VMA_SHADOW_STACK) &&
 	    vma->vm_flags & VM_READ)
 		return 0;
 
@@ -607,6 +608,8 @@ static int hmm_vma_walk_test(unsigned long start, unsigned long end,
 	 * allow write access either. HMM does not support architectures that
 	 * allow write without read.
 	 *
+	 * Devices must not gain ordinary write access to shadow stacks.
+	 *
 	 * If a fault is requested for an unsupported range then it is a hard
 	 * failure.
 	 */
-- 
2.56.0


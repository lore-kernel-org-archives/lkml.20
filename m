Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793431743;
	b=X8vpDMuFiDBMndG4XT1hLnLm4XOa6PmNP0/3zg3gMI4YgVrMGR2D7hhwIISZC6R5m3XF
	 FYuIeal+UBxCNNdDkiD/mIbxEfnGZeBmJ5/Q41Mf+/2j72OEkIuh58hBJl5XOm1omqBex
	 w6HFTX86B8h0PlAgc6e+KFuq1My4MJtF7BdTIekB+/Q5nItwUCsOQORoMICC1NQlAhM3y
	 4hpfVOSKcuEoqLOiEa1rj+MumviOx3kRNmMI0s/I9dCM1IgarrH7LpRDykBZmV8Mf9qp/
	 3pM35iwaQVObMX6zZ2MhTIA2NsDMA40/qXSv0DJa4dUWqpJ1TdVYluG5svTuX2swsAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793431743;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Date:Message-ID:Subject:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=1GfHJENjm3HCl2SLDMEeoyrSRdru9fmVN3yznIPIXt8=;
	b=wJmwNYNQ/htDWA708uKQIMkOI/f8pfDPewSsa7Tnh4Dh39Oo9Yca2uU521QWoFQ0yjwp
	 OtsugMioT7AtsnDfl8DhleTQBJZDjcr96vV58p1X3V1hDGX21AzqX/+ea9bjEpi/Emfqg
	 AlxGGOaHWz9Wek3iF0Bc2SnfGp6Wk10Ccttwf2gbxsgFKQekb3vHwbY5vXOBi3y2s+b2G
	 8ocw2L4ujCJBXUU4gYkW4eklkq5UhcHBGtrbEQmghhnY7MspLxh+0ZxSUYyIJm0h8Y8qe
	 BZFwBbHLIG0aSLmhXrr7mwftRpRu6A+q5sEslBEu9D0XUvbBCNlyftT6v4ddHnNq2Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pABmt6PN;
	arc=none smtp.remote-ip=74.125.227.135
Received: from mail-pj2-f7.google.com (mail-pj2-f7.google.com [74.125.227.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9296A606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 07:29:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9296A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pABmt6PN
Received: by mail-pj2-f7.google.com with SMTP id 98e67ed59e1d1-3ac63aee1ecso346521a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 00:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793431742; x=1794036542; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:subject
         :message-id:date:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1GfHJENjm3HCl2SLDMEeoyrSRdru9fmVN3yznIPIXt8=;
        b=pABmt6PNae5hfQ607SJ0ag2AjrJiRu8J2EE95t8i/Pk06Pz3o4rvhINYP9bcVmpnlf
         xZUuWJvSZcNuzE1Jgu0QaNkcFEVpnhUWm/U1yCHgJOG6asNe8y9GfQ1cJ5bmkuHy0HOR
         9EqDHgV3UzgNINrslP5e5fEoGE2LQsPCifdMEr0nMOF3ShYCbHcAATj01D77jv2q7qrP
         CE/Dl4iITiU1BkvKV5SBFpS9wE0aT6Ll875OMTNFhvfDow5kKgxworxFt80wLIZvZ5dk
         6ggN96HgW2jvoAx2S6ZSuCds5AWbIwV1jpndNV1KGalF6KACaM5qU9LYOaZP14jNIZno
         gsZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793431742; x=1794036542;
        h=mime-version:content-transfer-encoding:content-type:subject
         :message-id:date:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1GfHJENjm3HCl2SLDMEeoyrSRdru9fmVN3yznIPIXt8=;
        b=zP76Yku3FAiTA+/K2BaX1qA7vGWpnlzNX645QVCyE2DEB38ltygeqGVkNOxqOmca9K
         AtEQe0mw9Xiptd/Ro6Y5tlHsCRbMFO9Rw+dfc6KUL2lpAPoro0ERDnCXC2NNCXj10CBA
         btXI0cajpQEtuNVl0lLjhjYIY7UqS6W6uYJ9zW3tUtULwWMTYaUsYM/y8UGH4Qdzbxe1
         MXf3XAfAPC/LJessGAToDsxhgO3OqL66ywxWPAtRflFbGJy1XwmUyvXDC/nt2bBZ3uvb
         950B3AvU5TwTtSNIANBJPw46ihQla8TsavwoozZShDcr1bzyvEHNZKZIYegqFPAsaMqh
         qtyw==
X-Forwarded-Encrypted: i=1; AKwUvBzrNGAWLDY7BY4w/5QtGMuGn2ti4ezRQpC4JYXgMbFac7fut75ZeEDq7VeJ3pxsI+5ElzGtVV5P2HS9khA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJKLmES44iE0FT5TI9LPQZgeIR1wsYU92rZhvvkuahUjPTwb2JL
	TQ7HJBA6xyPPnfROQjUxYAeNSrRRA5lkQbBsPV6Bi6p2/zQpBbdpYKNpWBDxHpN02iNW7sgs
X-Gm-Gg: AYBFou25jry10a7ZGvun0Xc/kyvkvohrQvL2yOlBElkZn2ekhG9AREOBPusB1fM5Azm
	UYDml2x5Yl4b4gEwd7Oj1yMIHYR7WUeeo3ms2pmZnsfO+D3S+u/ZHlLXsOYbyJU+ifJrGIGiuCg
	IfG2eiXBr+pl2LC66uIRSsKmTkctJ0Mgb9M4OoVSmH9v4VgzTgvfpfele4ZQIsSXSHZnrd9H6rL
	AlA3WhOxAFlqrBMd8Ws7bKxtWqVauG/JAEHj279hpKYd5CoGl6NOPhR53jRrzCH8b8AfYdetjYb
	8Jcsh09oTEFMhZuMUUoPIWf02VYVwcjSyciRK7hFoaLjucjdh48NUqkfhs3Zs6O2FqVrnv5IdBh
	pXBEHvflC2Gsy8iCuWM25QBhuwEtbQtZhiQa0vVeDsEb6CYafMh3HLTR8O9lr2hue9wOu+MBNtP
	GORM/n3aLCAsokfVqtyKQHNBJtVg1ZZGczR8v++yBRXWBkyh3GV/kDLUmFVuX1LikQYyUErCtKb
	Lv7nUt7Sdqvj+OOndOs5ORMBPdihHSN2o5uFerTytQVmQ+lSDeBHPw6Aefm+b3lWfuNUIujGCUp
	J9Lp81KkN/cR980wezquS02zTi/isXvmWxTKXzPGZCB4GaA/+aprAAlOFMjdiHfjxM7H/OqJgzK
	hC4neYN2DVmnDq+mIb6dQcmbQ6BdILlUV
X-Received: by 2002:a17:90b:4f87:b0:3ac:af8d:c839 with SMTP id 98e67ed59e1d1-3ae897f6e6dmr3575891a91.35.1793431741819;
        Sat, 31 Oct 2026 00:29:01 -0700 (PDT)
Received: from [10.208.43.86] (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e98afe3sm11008530a91.12.2026.10.31.00.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 00:29:01 -0700 (PDT)
From: Aveline Noir <jm5905938@gmail.com>
To: Jason Gunthorpe <jgg@ziepe.ca>, Andrew Morton <akpm@linux-foundation.org>
Cc: Francois Dugast <francois.dugast@intel.com>,
 Christoph Hellwig <hch@lst.de>, Leon Romanovsky <leon@kernel.org>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
Date: Sat, 31 Oct 2026 18:10:22 +1100
Message-ID: <179343062238.2.2773026701442863377@gmail.com>
Subject: [PATCH] mm/hmm: honor write requests for owned device-private pages
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

The owner-matching device-private PTE and PMD paths return read-only
pages even when HMM_PFN_REQ_WRITE is requested. For example, after fork,
a write request can succeed without resolving COW or returning
HMM_PFN_WRITE. The test_hmm consumer then returns -EFAULT.

Check read-only entries for write faults before returning their PFNs.
Keep the fast path for writable entries and skip the PMD request scan
when no write request is possible.

Fixes: 10b9feee2d0d ("mm/hmm: populate PFNs from PMD swap entry")
Signed-off-by: Aveline Noir <jm5905938@gmail.com>
---
Found during code review and synthetic HMM testing.

Tested PTE and PMD write requests, COW and read-only VMAs with QEMU
test_hmm on x86-64. A separate test probe covered request flags. All
executed tests passed. Testing on a real GPU would be appreciated.
---
 mm/hmm.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/mm/hmm.c b/mm/hmm.c
index 2f1e98c6b644..92957541ba95 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -268,15 +268,22 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 		const softleaf_t entry = softleaf_from_pte(pte);
 
 		/*
-		 * Don't fault in device private pages owned by the caller,
-		 * just report the PFN.
+		 * Don't fault in device private pages owned by the caller unless
+		 * a write fault is required.
 		 */
 		if (softleaf_is_device_private(entry) &&
 		    page_pgmap(softleaf_to_page(entry))->owner ==
 		    range->dev_private_owner) {
 			cpu_flags = HMM_PFN_VALID;
-			if (softleaf_is_device_private_write(entry))
+			if (softleaf_is_device_private_write(entry)) {
 				cpu_flags |= HMM_PFN_WRITE;
+			} else {
+				required_fault =
+					hmm_pte_need_fault(hmm_vma_walk, pfn_req_flags,
+							   cpu_flags);
+				if (required_fault)
+					goto fault;
+			}
 			new_pfn_flags = softleaf_to_pfn(entry) | cpu_flags;
 			goto out;
 		}
@@ -358,8 +365,15 @@ static int hmm_vma_handle_absent_pmd(struct mm_walk *walk, unsigned long start,
 		unsigned long pfn = softleaf_to_pfn(entry);
 		unsigned long i;
 
-		if (softleaf_is_device_private_write(entry))
+		if (softleaf_is_device_private_write(entry)) {
 			cpu_flags |= HMM_PFN_WRITE;
+		} else if ((range->default_flags | range->pfn_flags_mask) &
+			   HMM_PFN_REQ_WRITE) {
+			required_fault = hmm_range_need_fault(hmm_vma_walk,
+							      hmm_pfns, npages, cpu_flags);
+			if (required_fault)
+				return hmm_record_fault(addr, end, required_fault, walk);
+		}
 
 		/*
 		 * Fully populate the PFN list though subsequent PFNs could be

base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
-- 
2.56.0


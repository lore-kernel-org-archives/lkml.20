Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794859475;
	b=0KUcDx2XIgYzJaOYIfAWePkGClrru+Z41TW5XciZdi5m7OYylhh3jHhEHlEa4hxoOXTD
	 0Du91BuL/fceIL6CycCaG0ai6dM46DhuYNdZNFzS6aVPmfmbtfbYFAkYbE1sQG8XEwfDZ
	 I5fPhhbXHcUdcioDSYuSNldEnPGwaec/hHlu83uamSkZl8L3Mm+DJSILP4BzM3FyvCOMp
	 1Lft3M2nC8lZ2871AmoDJrSuuRr3B4xaj8klRVtQMMv11ZLXyeO4KZeHMJsdGdr5yOCeP
	 6zqSZ2ApHxkaD9qCAmTcvnTDHZ08whFjdOV7J7CfK/JBXK8fDctP/+SZkRnQ044RTGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794859475;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cEJDNGjl/zFe/mV3ACxBqyEokV4hfSJvrPhzPRkWx7Y=;
	b=vqyxcrCW0CCyfgRhOhoJperb8RuVpQlQjf/znFIGLrAfGcmjBxjKi6CkTDiajAUKmcUr
	 1cs5RntuBgpQU6XUtxkeOxVQgCur8Y02OlQyFHFOeVEaQZT73eMrH2fyOfVF0bxs0pscn
	 k3bRO6QSVaEgLaU7MbnUUCrsQSm9ppwbDKsfjkm5hvD6IUIRo6zTWweGl5/WjqVIn3NL1
	 8g2idtEkgD4j7yNqR/6Rrgt6UTCQYE6fqyW/93f8XXoKnirU3aYrlnqJC38bxgMJOao2+
	 9OtCcjaxl15LsmJpieVAVTVarECfftLfJ32pMncp/pcYJa9wqwBBx0fulR7Y/P6Qqkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=oTB5isp6;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=h9Z2w0n6;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04AD606A338
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:04:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A04AD606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=oTB5isp6;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=h9Z2w0n6
Received: from pps.filterd (m0167070.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGJXISq2978962
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:04:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=cEJD
	NGjl/zFe/mV3ACxBqyEokV4hfSJvrPhzPRkWx7Y=; b=oTB5isp6rOQgN5HupD1s
	y4BGu3nwZm5mRAnn10ePdNKEIN3gYVx3MONUfXy6JhoiZr1vCG/+ODN5U0Uo5IFV
	5Y5ybunkPuXxdJv+Z4liVtAy9DqMHVxbF/ABrqCeJR8zngbtp7W/W1p7YwGxVZ+z
	F+CrSXjOcPsAsByfzHsmKk3tDLZnVf/+4u53PZW0EpqD5ldF9jkcl1kZ7nlir9ij
	EbSWPhOEJ2VuWMY5z97JXKHztBOEDiS6JPFvm4/fJWt4Byi36tHSjpsN/i+E2urL
	MMgLH+tQHdFdClRnByM0uoNLgYIDO21moyfeB4PhIybFvs4I8Fkq9BEQOgtU0oap
	/Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4j059sa2kq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:04:33 -0500 (EST)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-55c5caceee8so45165911cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794859473; x=1795464273; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cEJDNGjl/zFe/mV3ACxBqyEokV4hfSJvrPhzPRkWx7Y=;
        b=h9Z2w0n6BoUpp5FcLCQ5MUqOumbizh6r5jtLh3a8bd6V+GmReTYFYpLgVuMjLoQAGv
         rT/B1atHx2F37mKs8D9LDpHoh+FmQ3+uv01Wmme2yyByWWypLLHyZIMC/uOXFmPWjtCY
         z6o2XhYd8nSs6D+rlcXkGMVqDFX5enuSfa3kCKAPuknkh2J0lg7EscVGZcgVuDveBpXQ
         epgG/kC974yvk6+4pGUcuFpm6OKFOZMdoOt/UE54qWwcwPgwEqLf2oMr2H2EElqFvUVm
         rNjBMuKHRkM45OwY5n5/JmNfqD0+GAfjjEZegWXTKYX/EBUnKM0bajNbfdCyenlz7xT2
         8l4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794859473; x=1795464273;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cEJDNGjl/zFe/mV3ACxBqyEokV4hfSJvrPhzPRkWx7Y=;
        b=jmWNN1F4v1UTQibM+pXeEArg0MTVX8j6KNoM3VPnswoJ8cMO/LvazMI51SZ8WcuGxK
         ZuABONxJW4xaL+VO6rttsnJ6nV3Z2ImdcChq4Mllqk0Esd9Yfkr8VOak3FGIE9WtTMPz
         6I4RKaiyii4WJJGVla/aq7V1qNz6Dfa2qz994i2bXmYWy82DcPETuVgZV+OLaYFBkbHc
         tu2EXylHa3rDHhIFcLHciJ2xaSUGkOXOhUz/j0sBFnxRuriXvnGYpsZMArbAJSQNGnwz
         hf6arRMIf5+gKRXFaxbbBca6SgMwSpKySG8Os6R5Au2mxJY99rLaOmYIPRlmVzDQy8DK
         w9Tw==
X-Forwarded-Encrypted: i=1; AL+hErFLsNnk2PQC2HqY3RiJz1zQZ0wAps5P7OhIteXGID3gPU5ulhwPNShV8pIlaY4x1XrIV4FePgEPag8NEbk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rsiV4O+Rdwe3EpQ1JVcWdB/cpCX1V7m5cgfDd0idw7X4S2f+O
	P8e02QOTcoamrnwDIVb+jh7ofiGOfBS6sejRFCwpnE2LBNBt0DZ5Zw6Rju3cMG9QlopiLuXxz5C
	HggrFX8xTX5gQYx30O8MqPqHWS8JCIHEb1uTkulm9yU/8CRL2/rMs8ceg5/TgOw==
X-Gm-Gg: AYBFou1fV/Zey7hdZoLpEuRArbETK06d7W6ZpnemxSwcfZDSDsyAs7j8E2M/Mp5meRP
	cRK5qoSwYBzpFYUfgyGgqr6RGLEp3MRP2eo98sOeq4pdveMftwLJzaLUbxQDhOiGdintykXcMQC
	iD4soIgaM3aS9qMl1Rp+d2Nrpx/AREbBWLciRoWNpneiQCIaLTeInvzl7lABBMoSJdn0jbC0wNS
	FDrQwNPio3Uz/H4t01qlhBFTuTicoIhCcBWCkN0oprfxK9UvLrjJwyvWUlA4xbFIUepph/aY5d1
	ljSG44NFV53CZ4Xe5a+horKERnsDRuyZCOx7548x7MHKnnRLN8C3Z7CdMSeiS3W4wcR0o7bZ+jk
	p5QMx9R1xlR8MUDc+e62qPlW9T/vTquTCi436LnU7uZVutmg+JSfO1P65Y2alieaOXfpWKe8TwF
	fvh3OWEcPPl0dcHrw0ERm1
X-Received: by 2002:a05:622a:4c13:b0:55d:33e9:59c with SMTP id d75a77b69052e-55d33e907efmr87730851cf.15.1794859472589;
        Mon, 16 Nov 2026 12:04:32 -0800 (PST)
X-Received: by 2002:a05:622a:4c13:b0:55d:33e9:59c with SMTP id d75a77b69052e-55d33e907efmr87730001cf.15.1794859472014;
        Mon, 16 Nov 2026 12:04:32 -0800 (PST)
Received: from [127.0.1.1] (nat-128-59-176-174.net.columbia.edu. [128.59.176.174])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23efa2edsm93065426d6.15.2026.11.16.12.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:04:31 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 16 Nov 2026 15:02:48 -0500
Subject: [PATCH v2 6/9] mm/huge_memory: build the moved huge zero PMD from
 the destination VMA
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
Message-Id: <20261116-uffd-state-fixes-v2-6-4397a0196479@columbia.edu>
References: <20261116-uffd-state-fixes-v2-0-4397a0196479@columbia.edu>
In-Reply-To: <20261116-uffd-state-fixes-v2-0-4397a0196479@columbia.edu>
To: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
        Peter Xu <peterx@redhat.com>, James Houghton <jthoughton@google.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Balbir Singh <balbirs@nvidia.com>,
        "Liam R. Howlett" <liam@infradead.org>,
        Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>,
        Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
        David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@suse.com>,
        =?utf-8?q?Micha=C5=82_Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andrei Vagin <avagin@gmail.com>,
        Muhammad Usama Anjum <usama.anjum@arm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>,
        Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
        Joshua Hahn <joshua.hahnjy@gmail.com>,
        Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
        Ying Huang <ying.huang@linux.alibaba.com>,
        Alistair Popple <apopple@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
        Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
        Kiryl Shutsemau <kas@kernel.org>, Muchun Song <muchun.song@linux.dev>,
        Oscar Salvador <osalvador@suse.de>,
        =?utf-8?q?Miko=C5=82aj_Lenczewski?= <miko.lenczewski@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794859460; l=2165;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=Mw0PGqcdwi9MrYnN+IL/vE+jWvAOLk08il/P1XOxvA0=;
 b=ZziwTlLGLXjJcZArbTKseqAMiRMaN6WrcRvEULuLwzlevKpQUgbaDRMcTir85gnBILUj3uHSp
 YwvXpPYhyURDOGJtHeuhtt3mq6thHBtLeXk+Ex6SOWTGGj2RGQxXsJN
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA4MCBTYWx0ZWRfXzfIPqkBzkxFs
 Q7fbRSLiyI/MuBbkHSkhzmpAASDsBVjXIXuxCjvTfTBcZTxd9Kb/8fUBMgliP2pbpL8o5ZuX9rA
 MQqMV3Me4fa9xHKYDot6N1nt52serrxBVuUIJ6XQ0GQkbWYv8DCXhD4tPMlgo1u/sn+lRCTpCns
 ECLIHNF4Kp6L8Bby7k4I8SHwdHvobawQcGYFciooLNdWryViF4SaPI70/RktwBQQdW+REoE2LjP
 4ecTPh2teFakPd0ep4lMcDD3BZzHVHoH2535WLNvfh5jcKcVWTAW8Mna/tXhuLs9AMlbJYPPNC2
 T3mGEtjmC2/nTJOZEuZ/9eRMlDPgjZQgm68CqkihjHJOVYcm4JE3BdEmG7ze4JHwdsfrdOBn2lN
 bzpY/YmJ5gcLbqW2l6h43jaUmTtJfIKPOmNy3/HCwWnev+P/5flOgn8QurSN3mIgUFk70/5KUI8
 p2Kjl0pHrB6sBQ6i77Q==
X-Proofpoint-ORIG-GUID: lZaXV_fdf5m6OAkXLGIbUGxuS1dRlB0f
X-Proofpoint-GUID: lZaXV_fdf5m6OAkXLGIbUGxuS1dRlB0f
X-Authority-Analysis: v=2.4 cv=D63SufRj c=1 sm=1 tr=0 ts=6afb61d1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=KPY1cyGZ6h6m4ASiENTC8Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=svvvyxlR1OQQkelhaPoB:22
 a=VwQbUJbxAAAA:8 a=tHa68p0SAAAA:8 a=t9wnRcJLD9wLKarOqGUA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=ufIsyHvWW7FwcMbVRpPq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA4MCBTYWx0ZWRfX8Y7XSV+WNldt
 VaYW9I5p7trZSnbLx/RJBaIELCB2yG6zdr+9gh2gLQHXG4jQ3N0S6qxbCYmgDYyW7IJHupVUrht
 sB7EL3LlxD6PAhRFWXeHpDGfIj1qKaJ9a62IMpVdb8Q7pHVRukW1
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11968
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=10 priorityscore=1501 clxscore=1015 lowpriorityscore=10
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 bulkscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160080

move_pages_huge_pmd() builds the destination PMD for the huge zero page
by copying the source PMD and clearing its uffd bit, so the destination
keeps the protection of the source.

A source VMA registered for RWP can map the huge zero page with a
PAGE_NONE PMD, and UFFDIO_MOVE does not check how the source is
registered. The destination then gets a PAGE_NONE PMD without the uffd
bit, although nothing asked for that in the destination VMA.

The next access fixes it up through the NUMA hinting fault path. Until
then, the first access to the destination takes a spurious fault and GUP
has to take the fault path. The impact on userspace is small.

The moved entry must have the protection of the destination VMA. To fix
it, build the entry from the vm_page_prot of the destination VMA, as
move_zeropage_pte() does for the small zero page, and keep marking it
soft-dirty. A destination VMA registered for RWP still gets its PMD
re-armed afterwards.

Fixes: 763f43865fc4 ("mm: preserve RWP marker across PTE rewrites")
Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Tested-by: Gregory Price (Meta) <gourry@gourry.net>
Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 mm/huge_memory.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 5e2629602221..a2b1ac11e7dd 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3003,9 +3003,9 @@ int move_pages_huge_pmd(struct mm_struct *mm, pmd_t *dst_pmd, pmd_t *src_pmd, pm
 		/* Follow mremap() behavior and treat the entry dirty after the move */
 		_dst_pmd = pmd_mkwrite(pmd_mkdirty(_dst_pmd), dst_vma);
 	} else {
-		src_pmdval = pmdp_huge_clear_flush(src_vma, src_addr, src_pmd);
-		_dst_pmd = move_soft_dirty_pmd(src_pmdval);
-		_dst_pmd = clear_uffd_wp_pmd(_dst_pmd);
+		pmdp_huge_clear_flush(src_vma, src_addr, src_pmd);
+		_dst_pmd = folio_mk_pmd(huge_zero_folio, dst_vma->vm_page_prot);
+		_dst_pmd = move_soft_dirty_pmd(pmd_mkspecial(_dst_pmd));
 	}
 
 	/* Re-arm RWP on the moved PMD if dst_vma is RWP-registered. */

-- 
2.39.5


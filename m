Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794859473;
	b=PGAfxpT0Zocb6qhh3IcxZnmRH3JxMRlT442skzTnILRLfwDGUekkYjtCyI2cyJEtcImy
	 rg9aLP3KdbvZL0lxxynitjZW+9a+yJq+BoqiyFAWM0XcYj0Yipwn1wZFWVjl8MvMNAdT3
	 DpXvDnEfSeMOaGfuq4N/I5/L+rHKiGIBKTEmnoN9S8pc4fyaFUdmyNDxk+AltjB/df8kn
	 ZQ9mLqH+9dQbsBB3j1Rw0+PGfOuuVlibeuD4FUxxzc3inN1JgBTdBlcjrpkzyQPOcvPNw
	 oQ6vUHyVUOS7NennFkZ2rLIqQZaj+4GLm3A5yApfl2+ipVNx5BLyZui8tN4B5DyonAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794859473;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CQkHPjvXTTfeJYiMDE7iqXQPlSmcQWagnsIUKGmFjtY=;
	b=YrgIJ35uqJIj560+3Ou4ifhixYrhN7TJvqbfHZpDNED8OeM8YiYSOVAnHW4Zt7K0yhEO
	 MJcJj813XfxDL/BhHdr3DQt+mdRcR0FqZQizyYzv0+DNNwRQ6MvlW9GAb+VR+g//gYqx7
	 YSRKVlmD/8d1VJ+EvJlFkKue85K9rciOa+mgWsKT6gWQxe0VFkVDUdWXzFWHebh3d1T5u
	 AyafwNgq8G/WQJS/6pE82KtAyTeQF+eVAag/iXk5/4qJvbjJBPRlK8eRUbWpIg6AmC9La
	 s9rJpWpcVEdI2IOBWHW6OJaiNgSm8K1J531cEdIXGPZqaJBy4Alpx7q/jJVd9/9r1ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=KAnwt9fk;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=qFR+vGaW;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0CC606A8AF
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:04:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C0CC606A8AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=KAnwt9fk;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=qFR+vGaW
Received: from pps.filterd (m0167069.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGJXIRS3840558
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:04:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=CQkH
	PjvXTTfeJYiMDE7iqXQPlSmcQWagnsIUKGmFjtY=; b=KAnwt9fksP0cEvD3SzpN
	9AHr1JD8YwIZZF7LgL34k+/R6ExO5rgOpJUVstzTUm3dJ4FA3uvt7DqyIbplzF2f
	Qbyr4yt+DO3jQvpkf5GuJBfPa7QjJuhiXKlJmkylAWNLQlXTkXd0qXCKm/S33A4P
	R/e28+69oSVVV1TkO/OCPmTh6bKgFR9BezPq1Zg/ebPl6xQ34+Vl1eRO/xJyv8mp
	wpeZTs5qT5F3ut1t1JQz+4YL4reEX7etf8mk+c7HcTyjSyFgzg/kxGlIpRaen5ib
	4O17GeTpbLBgeQ38VvM+3Fcl0TK7hH1BjriAXPGOM7HYLZOLyvwuvStQZYnxA6YD
	PQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4j059sj3xq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:04:32 -0500 (EST)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91f2b449480so67891546d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794859471; x=1795464271; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CQkHPjvXTTfeJYiMDE7iqXQPlSmcQWagnsIUKGmFjtY=;
        b=qFR+vGaWBzqlL0ZktK6BD4Xkpn7t9hy8ooS/yXgPsSHQ1MFDkoZvtPAESR3qvvSCB5
         EbkSuhacDf3w9b0iD6Tpov1lW3lEUvnfCibIa9yOOMg/9aIFfcRt529Plc9jatzlBTz8
         aAY+tF5ADNgSvN/Xe7lpXt/gRmNC0SUYXpMN6R7CyRbkEhtYbEXkiNh76ruuXUv18Z7f
         0FLh8rA/toj50K5xtul9rvz3KcDZ8bt2NXXzrg99JqU4ASDnHDRG2EUffhGMU1OIXiaZ
         wPKfvtvt4awYcaU6ZegvA80s1OFX2YQZ2V1RxqlSNkEKUZ3Wsn3dYK/7AjI/6h7icryU
         p4OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794859471; x=1795464271;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CQkHPjvXTTfeJYiMDE7iqXQPlSmcQWagnsIUKGmFjtY=;
        b=j2cOinvRUQgNOChIhVUHJ63X1xE6HMMDFmtUqfStwfERAjvOyz2BfKWJRxf0v7SXUZ
         2k73e1TV4ZpLqGQF97XxOnS+pAnJILrm3Sb9TPw+Jv0qvRwZDEurIpLJPycz+suicxC/
         c2LA28iMlQJErDaZWGXRW6hr98+MBolfB5XQz9/TNk7omelfXOxcN+9V5LbX09O6s+s2
         61aKUCDFe2BzKHRPAXOgFt1aMGm8Q+4nMa5+H6i6BmGWeVjtWRwlhk9WubD8rU2zfYBY
         5QcxF7jhiQqaJyVx1/RcbfR/yE8dnXRDpkP073v+WBSUnr4DKuRJ+d4zYm/rcTNLf/dn
         sieQ==
X-Forwarded-Encrypted: i=1; AL+hErEei68RuZHHO6/wgestbEpkJUV2KFRT9ra1Xcn/DN7T/6LWXN/FRcFecmVtJnCIODwiJpx8BLU14ioY/KI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yRkPp7cBOc/pQtuNULldlrKM+AMsC5nW2SOJgt7Wtqa+HDyqj
	lK4F+Rm6IaAFu6W2crUKuiFFV27xXoNFNc0CG+TpxVPA2pQorHqUkte/N9jKmdHAJ4MszCfr43h
	H3AzhKh+dL2J8gzZnRgdwQdDAByplOPAc+/aopgoJ8UyqtCu43jwt3AmqrxvtDA==
X-Gm-Gg: AZFdTZc+AgNd7glJ46VG6dkQnePSYaIyl7yp3UXEwiLAbOcMZ9LHopXvR9dx8ayod0a
	X/vGmzMwwm3E54WcmePygw2SvySZCeqNeGlMc8zFWDOZWYJLZOX1xZIUxbbEoAY3PPrNJPuFSec
	WgEUZS0i7SeorLL8BjTbGe+jdu9rriND4pMOvPODH8ogI8Othd7CB+pMgVhu6rmdOaFCU14iL4B
	zyXvJWo0hJ0dJp5uw9kC4INJLIuFe45ozHMTF696is8+PkADBOFfgUul1IkcvrQNIPlhB8t5iLW
	H/1qepp3m7N2hd2stSCVNh7ktLXdbPH7S7/tAZVFSo0gGI15jjUj8RECvUHKOvYhCjO7DGVokbt
	IUAKzkGMfdpVRSHK57LyQqzin9qyCVPXOL15c/K4rr24+ZWu0DNOA+slZSU7Vn2Wunkj2ALqWra
	GfzAgp8BJjBOGriGZzAY3l
X-Received: by 2002:a05:6214:1c0a:b0:91c:359a:3263 with SMTP id 6a1803df08f44-91f24025642mr190254586d6.7.1794859471121;
        Mon, 16 Nov 2026 12:04:31 -0800 (PST)
X-Received: by 2002:a05:6214:1c0a:b0:91c:359a:3263 with SMTP id 6a1803df08f44-91f24025642mr190253756d6.7.1794859470498;
        Mon, 16 Nov 2026 12:04:30 -0800 (PST)
Received: from [127.0.1.1] (nat-128-59-176-174.net.columbia.edu. [128.59.176.174])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23efa2edsm93065426d6.15.2026.11.16.12.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:04:30 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 16 Nov 2026 15:02:47 -0500
Subject: [PATCH v2 5/9] fs/proc/task_mmu: write-protect device-private THPs
 in PAGEMAP_SCAN
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
Message-Id: <20261116-uffd-state-fixes-v2-5-4397a0196479@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794859460; l=1714;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=DVXYKxTIAEZp+EXI/8oQ0I7+4ALNcq1SSndANYXncjE=;
 b=6+ELPvQGdStv4nKd8pN8sVCMbZBLqnzKv/qqOoM+QS9mkKkH9crx080ucQzM33gtlLJ8mzVNp
 0+Vap0ml9QVA7VLHR+Fr+p7Ra3EaXSyU+Vivwbom+Y1nClSCxWJsRg+
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA4MCBTYWx0ZWRfX0U4W0FQBzpbv
 ZdQOhWkStJ+Oqwa9Lz85IQhgDsRSjQ+6LF1dPBvr0cUTykmzkpvM/6oTR6L0ZslRgmhDNOCwKbi
 dW7rUCwZUdhdL/nf2E4OZofdJ3Hk7Du8QVpzlHOk57iLZIbmn5vUgWrGCGvJfowuknsZhWKfLvX
 WJY3BsoqHaBKpdGROMaCAP/THXayMNfAgU9UO7c41ltsastt2nDSykKLId52eQCkVu0xxwo8Ol/
 /9GkA9BWtm5umfKNCL/ZJsIjqHbCzmHSmGq7r4Bbop39+moSkASFOPsn4aX0U22l5W5LOEe04+7
 oDV5houqlyjDXrwqqVppSBCJPKzvH2Gk0Ph4ff4PYJz0J3v8F6MTXDFwoH3VHPmIReaiSJmnMyv
 3BmaIGYOO1dQlKhROIL/O9XBiNQ0kXdkt+HNFEXGYmD3e8F0hdAryJQ83bcqNi3HPwc0Zaom3v0
 sVcbSY6nJM2FPRdr6aQ==
X-Proofpoint-GUID: jZYVSZXoA-V9GnGgh6GQUlNTx-eB0sS8
X-Proofpoint-ORIG-GUID: jZYVSZXoA-V9GnGgh6GQUlNTx-eB0sS8
X-Authority-Analysis: v=2.4 cv=X6THu2Te c=1 sm=1 tr=0 ts=6afb61d0 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=KPY1cyGZ6h6m4ASiENTC8Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=JR4YdQiviy7OQf72WyZ1:22
 a=tHa68p0SAAAA:8 a=RyLRxA_qM0uo8G8YelwA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=ufIsyHvWW7FwcMbVRpPq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA4MCBTYWx0ZWRfXxBI2mYYhwbSs
 Oveo072TSdH4COScUAX6vkKu9It0IzlMQ/0tBZquENF+lY16bFPlHc5B7gPnwRXw3CNJeYuOV3M
 Pj/NYD3cVZX4l3ftHqJvGa3bZvL3ipYN2P8J1cO8s7dH+oVBlHzo
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11968
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 phishscore=0
 malwarescore=0 impostorscore=10 bulkscore=10 spamscore=0 lowpriorityscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160080

PAGEMAP_SCAN with PM_SCAN_WP_MATCHING write-protects a huge PMD through
make_uffd_wp_pmd(), which handles a present THP and a migration entry
but does nothing for a device-private THP. The PMD never gets the uffd
bit.

pagemap_thp_category() reports a non-present PMD without the uffd bit as
written. A user tracking writes with async uffd-wp therefore sees every
page of a device-private THP as written on every scan, whether it was
written to or not. This requires a driver that migrates THPs to device
memory.

A device-private PMD must be write-protected like any other huge PMD. To
fix it, pass any valid PMD softleaf entry to set_uffd_wp_softleaf_pmd(),
not only a migration entry. It downgrades a writable entry and sets the
uffd bit. When the THP migrates back, set_pmd_migration_entry() carries
the uffd bit over to the migration entry, so the write protection is
kept.

Fixes: a30b48bf1b24 ("mm/migrate_device: implement THP migration of zone device pages")
Tested-by: Gregory Price (Meta) <gourry@gourry.net>
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/proc/task_mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index ee7f509d376e..013eeea7d1a3 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -2520,7 +2520,7 @@ static void make_uffd_wp_pmd(struct vm_area_struct *vma,
 		old = pmdp_invalidate_ad(vma, addr, pmdp);
 		pmd = pmd_mkuffd(old);
 		set_pmd_at(vma->vm_mm, addr, pmdp, pmd);
-	} else if (pmd_is_migration_entry(pmd)) {
+	} else if (pmd_is_valid_softleaf(pmd)) {
 		pmd = set_uffd_wp_softleaf_pmd(pmd);
 		set_pmd_at(vma->vm_mm, addr, pmdp, pmd);
 	}

-- 
2.39.5


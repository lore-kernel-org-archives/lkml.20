Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794859480;
	b=0bkDdpbuRSdnrZ4a/g7FcPSZmMEFcevNZxe+LXUshVAADvKaQJbEwUtKQ/ON2YmLYjxi
	 ACaFH4z7bgx+b5Xn6La5UunAq2IRmDm3OTRp7wGf9ou2nDwajuo3xGfLh9sW4C6YM3+/X
	 D6CmwezfxeIJutJ2JKgEMrCjVgLLIfkUxzSr6JmcqODYW+Uqy7rgthLUs1D0tlrcL2rBN
	 lJfQgL6EwXSmmaApYv7NRtiVMRNKMWSrGS5xdm9oXBQ7hW+aAcFc7j39G2Yvdazi8c4WW
	 W0c7g5CZ6pmR2HIa8cFpquguEr3IKFrP7m3jKS9nQhdPjLU+BTZ8Yd42DjDJhPf2mWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794859480;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=aJcdx4vcENOgHdl2eEbezDZ2+sbt03i8E18pwL1oDcg=;
	b=QkTBJdhwCv2vtYkKruSADjOBrTSck837YNfwhYfHfpxa3B1VNDnqjdmOc767tSQbnUSc
	 5CBvIYI2HO6MQ41UZM9aMTCxfEE8wStytaLyMeH1ZWm1+yoImfJ2cOUlcRmU6iNaFQMEt
	 1XbYv35qkpeAjAFeygxVJ3LbsmJDffDv4xieb4cXnl6UNGvomPFS0BvJYGPLWpsEjAO9o
	 EOji0UGhK71oTkncW1x6XVYxeRKtXzy8a+gdEZk+ks53M1DDi9xetDN9pVOVkDQBvsfqr
	 2O6w0l8PHO88wrzteoasuGHsrY9VtpENwQPmuuzft7fsXO6wM1t9OWX9kXhDUyeqr7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=O53Otncr;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=uh+hB+HI;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C91A60A2605
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:04:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C91A60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=O53Otncr;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=uh+hB+HI
Received: from pps.filterd (m0167068.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGJXRlj3802470
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:04:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=aJcd
	x4vcENOgHdl2eEbezDZ2+sbt03i8E18pwL1oDcg=; b=O53OtncrkYvH3dSx5Qwi
	Fl6G3Ntqld1xFgvYXyPjTgAl+xLeLCmaF6zdCn5hz13GszwJVItrKpw7Lz5eUS8S
	eMRvbV0y5yS22AyYY1SnxqisJI+0yWhw334hIoFAO5YyY2BM04PsJVm8Gm+qfTOj
	T6FmYNtj1uEoV4PU2BgQCsrQ45FIHjyyo2LeE84H6S+AlRJN/SMwQZgm30nW5JvD
	lBsozOtZjWJNBsin0lxTYg1KeRuLsI+V8wxBX38DU8wS2QE1avDgVWx+AoBPQTiA
	fWTfz0erwiJE61WCtAA5phLnOQQuQBPpt9f2Le3MUZSt7UpO+YZUsGX1qEA2zWQE
	aQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4j0598t3gs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:04:39 -0500 (EST)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91eb556c8a0so73443496d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794859479; x=1795464279; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aJcdx4vcENOgHdl2eEbezDZ2+sbt03i8E18pwL1oDcg=;
        b=uh+hB+HI/MEDXlBES5QRyRdUbPFG2QWcOSTvu9OZedehwlRI7SQlNH6Kq/IjARvbeH
         XC6IBaFxv6q47pRTZwjWNrBK+GuBZpbax3cuZ7mti3Kl3imDJnzO1faydXVsKiO7qaKX
         ms7gpHCnaiJmTeNN6lAqnjl3FVDBx7VMS6hcfxr1VHlKNAb2awp3zDREng1hew89be3J
         /SoHeQ4GuB20kruBGwnY5JJAZJms+Y/2XscsM68S8Lqn6lAmG1W6IdRi/t69EE8DPURy
         Z8GLTNEM/wHaEd6g2AFk/iviTKiaT5fGWMwxdUUe6jzVJLV5MYvijelcCIdqULBJztP4
         V4Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794859479; x=1795464279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aJcdx4vcENOgHdl2eEbezDZ2+sbt03i8E18pwL1oDcg=;
        b=zu+O2GAetGytGZq7KKKE9/wGrxhuBYK7CAChA7I2419ZzyYsZfrmGFbxrIA7sqeHx1
         i0o+itfujODu7rDPQQaH/gl4Jt3fcmuI+OoA7ufB2PfxEvDznyreVqSPiU5DazEFgMH6
         e70UqT90Vjz4z078CEALQps3o+f2xVAkJ7O0amxccqnKnsSVAYUE0+FjdYrj5fVtZ+MQ
         BuoUppaYPh1ApcS5AGI3RccEnvwzXzc2zimHcNw36MTFdcbFAgs7WCohaw6UxYCTCsV6
         SkskggUKhFwG5OdrD5cyJROJfOIMEZv79ubIbbhl9wx+Iw20O2yMyvrdI13bedJD5G1H
         G2+A==
X-Forwarded-Encrypted: i=1; AL+hErFIn5cMlKHi7dcQwqxEquL5h02tSrsW6R3a/gOw9Yv14hRW2FgiUvrF1CGOuZPiC/BDVpEYikG0iqILf9k=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BlqRlervQHRKaCjZeEGKv53E2ByYNhUHn51mGJN+mjztZ3s6t
	Fxc+eGxITXLITQ/CG8O+A0dRMD/JCDaTxfrqvLDv2nJHVHlaaHLIXgMowEMdj34B/BW1oduoDNP
	bwsZisJkpWntKZRdgvOjtw/gIDFezd+P8vFr0qzGLGCji0okSCV4dibzzIwhk9Q==
X-Gm-Gg: AZFdTZcSFaBK18VV2qwWsv+RMtOCZXAOM3pBVfLDySj48VOzvS9BObW55SkQ3UJk5uq
	/SPedhwu+W/UKoPuZiP9ZKlN/WPjOBSLWdclY8tIPBiFtCPhz6/SRoDFQUSoXjA4nNu0aCxqq6L
	pPI7T8q8xtA7Ub4cwqoaWADgoJW9YZ15IdD4eAMQf+P+XUKHj0RdgW+1gQHFr8aqi6+bCzj7T11
	aGv4kNW1Y6jCIA7dH8mRTEU7KapRan4eMRZwAp7c6pX3ZRX28SH0y/IoLYM7Tr5deGKKqpVMnFQ
	EujcpA925gzhlW4xyf2WAXpbNmIqOE7h+0e3cTUHcxYWxLUKqYZsIyWn/q2p2c2zRwQ7TV0uQaZ
	0uAZpPd8y3Y5V9Bc8giYYcwIIp+QeaWILy1Ekdk5yYL2BdKeeyYuZkG4laORkgqc0LNpwnTWp6i
	OlTHH3tuGqMcQrp8HBGx8G
X-Received: by 2002:a05:6214:623:b0:91e:b874:1290 with SMTP id 6a1803df08f44-91f2420900bmr177490776d6.41.1794859478698;
        Mon, 16 Nov 2026 12:04:38 -0800 (PST)
X-Received: by 2002:a05:6214:623:b0:91e:b874:1290 with SMTP id 6a1803df08f44-91f2420900bmr177490156d6.41.1794859478219;
        Mon, 16 Nov 2026 12:04:38 -0800 (PST)
Received: from [127.0.1.1] (nat-128-59-176-174.net.columbia.edu. [128.59.176.174])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23efa2edsm93065426d6.15.2026.11.16.12.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:04:37 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 16 Nov 2026 15:02:51 -0500
Subject: [PATCH v2 9/9] mm/userfaultfd: check hugetlb end alignment in
 UFFDIO_UNREGISTER pre-scan
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
Message-Id: <20261116-uffd-state-fixes-v2-9-4397a0196479@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794859460; l=2072;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=Piqnlv4F255M+HE2n3Ql4fdpsjy2Q0rhRNGi9JUEiaQ=;
 b=PR9LR3++3QTBASZudMyOGXHVHu58spzcaDhpG/3Zgg4i0SNzsQRrpoFgELBiH53vOEocXA9+v
 /FkJ/lGjlSZDojjsaQdfAfd+8YWMdP2uWlpedn5houvj/pq2Mgd7aIs
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-ORIG-GUID: DTmKMNV0iD4d8_HI7aKPLV5EPNttpKHQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA4MCBTYWx0ZWRfXw5DSWbIeIumc
 KFl0ZmE68cZW8X4XBxDzfYkTUTyHIIA1dVNLrEcRpxoZrHSOITCHxYELgWjDIDy7hNLotpFjz3Q
 vi6zfSnPZoEWX/fqbTyJachQJJTlYASZwAmmMvuoJA4wVmw9apiT
X-Proofpoint-GUID: DTmKMNV0iD4d8_HI7aKPLV5EPNttpKHQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA4MCBTYWx0ZWRfXxHUdefW0QXgn
 TzhpCSfRktrbA9o4CYroLMbpSaufB3o8gu9/5HwPP6nzsKDNfxhjEOKPUbrEuxcYDONeB2tsbc/
 OHPBo8/Iizdyr6141jFFiylTZzatNr6sFoK4dDOfrd+eEm5VwxyQiRm+GvSqAgtyc74csDoecme
 OB2obOqMoiTyzwzsE7t0lk+oCO7Arra9383pg8t3FrbKExlghe21l4zlfD6uMqSGNH+XJpzgZTK
 9NDsF+LF3C8d9LXcmCs0xZKamRmxwxsSjskjAtG51z79TsPnOH07HHL5K3pFpW4g0YTbjKV7qj4
 alfZ2USsEvY+uk17jsExToCOWptd9dw1Q3qRRGU93sGwOSGsm7isEwnVRqZicCWdyCyEHyomCVp
 v/LRjhY6VVtuIsfQ2FZWv7f9IPKSmkXAcXhgL5J/r9mVXL4OEP2+Ypk1VGw+tvOZcfVREhWM/QI
 02oNLl9KXT1Xu8OvlfA==
X-Authority-Analysis: v=2.4 cv=ZOpCCn7b c=1 sm=1 tr=0 ts=6afb61d7 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=KPY1cyGZ6h6m4ASiENTC8Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=usPcmh10W0ubT8QP8_c3:22
 a=SFyPIUEspjz1PKPiGGUA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11968
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=10 bulkscore=10 impostorscore=10 spamscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160080

UFFDIO_REGISTER and UFFDIO_UNREGISTER both scan the VMAs of the range
before changing anything. For a hugetlb VMA, userfaultfd_register()
rejects a range whose start or end is not huge page aligned there.
However, userfaultfd_unregister() only checks the start.

An unaligned end only fails later, when vma_modify_flags_uffd() cannot
split the VMA there. At that point, userfaultfd_clear_vma() already
cleared the WP or RWP protection. The ioctl returns -EINVAL and the VMA
stays registered, but accesses to its pages are no longer reported. This
requires a caller passing a misaligned range.

To fix it, check the end of a registered VMA in the pre-scan as well.
The ioctl still returns -EINVAL, but no longer unregisters the VMAs
before the misaligned one first.

Fixes: cab350afcbc9 ("userfaultfd: hugetlbfs: allow registration of ranges containing huge pages")
Fixes: f369b07c8614 ("mm/uffd: reset write protection when unregister with wp-mode")
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 mm/userfaultfd.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
index bf42fabb5afd..d8abc24353e1 100644
--- a/mm/userfaultfd.c
+++ b/mm/userfaultfd.c
@@ -3960,6 +3960,8 @@ static int userfaultfd_unregister(struct userfaultfd_ctx *ctx,
 	found = false;
 	cur = vma;
 	do {
+		const struct userfaultfd_ctx *vma_ctx = cur->vm_userfaultfd_ctx.ctx;
+
 		cond_resched();
 
 		VM_WARN_ON_ONCE(!!cur->vm_userfaultfd_ctx.ctx ^
@@ -3983,6 +3985,15 @@ static int userfaultfd_unregister(struct userfaultfd_ctx *ctx,
 		if (!vma_can_userfault(cur, cur->vm_flags, wp_async))
 			goto out_unlock;
 
+		/* See the check in userfaultfd_register(). */
+		if (vma_ctx && vma_is_hugetlb(cur) &&
+		    end <= cur->vm_end && end > cur->vm_start) {
+			const unsigned long vma_hpagesize = vma_kernel_pagesize(cur);
+
+			if (!IS_ALIGNED(end, vma_hpagesize))
+				goto out_unlock;
+		}
+
 		found = true;
 	} for_each_vma_range(vmi, cur, end);
 	VM_WARN_ON_ONCE(!found);

-- 
2.39.5


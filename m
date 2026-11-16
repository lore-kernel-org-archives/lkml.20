Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794859469;
	b=dzEn5RH+ymtRrWSebnGtjVVc0nqG9TF5p3fyaadEni1uwAW/raqRuD/DFX4Dq4CVpwHF
	 4YcamBi2JsufW7XOsXztf4C4ItimVnj/Oers6BvkplbJx7X3RAWJhG1dyZo0iw0W6HHPt
	 48tf63fkYhaKl701NJdV42HfpnoT8LKdiJvJxznR3RfveZlo5EF9NKniW9Ef8veuPCOCc
	 2qv4cIf7w/K8lSpJ88brFvHU7kaz4vr0spR9g2Hh3Lo6xnWJz5qAl8/KXGgXHOcoGlziz
	 b1zfdIPFG+W0q1Z8rBJ/WbZ3xlCszuOTFZL8cZNmU+09XAkc8qvcBr7TwOFmiBgpYsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794859469;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZCwhlg799dXefZN6g30kX8e7Dd77LrYQ4Kv/DAwnaW8=;
	b=Bee+tN2J0+KH5sSgy23fX3olSj6rc2avqFksgtBg6Jdwjzno+bt4soRPV/bjXC/joHUL
	 PeQSvULn/ZruRgJmph5EAZRQnM5wEbU6Y3D9fO5PJHBWIVeHxQUbaatQQjTfwvxiXJFs/
	 wEAWvBXPohWvL9YIRy1XCTNsUGDCIQMGmEBDNxx0kePF+BoVg4hqIRmmA3pnJ5SFp4afP
	 2phg+z46ZohS0Faw0nwes06kmdSsGmZ6g2qz6m8naOCi33IXprCc0bjbTJ2nQXkWBN8qi
	 bvllg8zvnKn/DWY3sGfvN1+gcRKQZDeXfi3qZZNR6bY54/CjUBiIrKLnvmScnNgeGpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=Avi6yR7y;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=SqJtWIwR;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFA660A2614
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:04:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CFA660A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=Avi6yR7y;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=SqJtWIwR
Received: from pps.filterd (m0499198.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGJXK2f4113371
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:04:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=ZCwh
	lg799dXefZN6g30kX8e7Dd77LrYQ4Kv/DAwnaW8=; b=Avi6yR7yJt5dxX4uim8f
	lZi5WkIGIa3WzKo8VWyn5yiY+9+QwBYGcFKkPG8Ll2bij05Tf/KmSHeosGVQEr0X
	vINu9OTxuHu+hMC8PrrSPH5E/xOI6rMUoMxPgyOWBkp2pV7hanccM7QxZzHJzxIH
	CJlhMYH6KmezeavezmwnNu3eu2xN+bBfGoFjsyRJnU8y7LnshG2MLp4qmcaRl7me
	/TDiOV/WbXgQaJ66MCjoqwqjmdjS3ibjEjpDsrJ+zOyGTYk6zpDPfuPR068ujrFO
	1iHPISMUXlqAF/djUPb8KgpHAfEW2FI80JP/8HOVxpFJzS/45igtuTLNBqPRtJ+G
	Kw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4j059dj3pb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:04:27 -0500 (EST)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-544019b1831so32058491cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794859467; x=1795464267; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZCwhlg799dXefZN6g30kX8e7Dd77LrYQ4Kv/DAwnaW8=;
        b=SqJtWIwRIxugCc52gjWRK7TYFawuwVQW0YTViyXOTfZEszhOjYugBNMBuNKbnuYZkJ
         WYK3Xohmhs7TQU/9yM3/HYqWAgew5P0pMwLBO5gyFI3K2wNn9QrQmWgowx/AppQq/4hG
         71upG2hUfLd8lpKVZsbCHkKXwhB32OzcoKekIbDiXJ65KWEmW54J3IKNreJPOT3hKwzp
         SUq80FFy/3tIMhDNGyp0PFkgCwKV1W+z2m+wbWKi3HUT7NFMXpXHhBfWl+suFGZ/xmzE
         vpPwfzhhUrBdt+s647EkFPlwWB+BjEqSg+/L/DCFZDT5wA/S+jhIwGk1+0kMv+x3trc5
         yKSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794859467; x=1795464267;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZCwhlg799dXefZN6g30kX8e7Dd77LrYQ4Kv/DAwnaW8=;
        b=z7ivjG7Uy+LSIsdU0UyW1gqcH15jUAI6+3kGSCUzwp2F4MBfGXzhNwEnSFC60LT6VO
         Sk5au1TLPmZ47qgbWIEr8J53vffbzSWEXocUrpIVeIbOmhR4g5BljkoQsDL/qkwRtn+T
         eSX9cHV9NUgmsXeF2+JmwazIS/yA+31Cc7JMKFBIzvxWimLOBN5YiLkWyuTdZ5VJ1k7i
         zFbTs0unwiwJ5FemE0V6mxv0E38lTFjdKdAn30UjYHpRMbW+WzDNYHlDsXSVnTA/LlJ+
         LHudjKgqPLxMK5eRvyr9YfWxxhKG1QhiXZY+387bfs4i7hXHgfb0BsU5gpkpU064a9Xk
         UGlA==
X-Forwarded-Encrypted: i=1; AL+hErGEtn+wRrYK6BGlXYmD6GagK0uo5TwteUiPe1SRiYYPH2pHf2pfLpKlbZH/ItBObRx06gVe/3Q32H7z2A4=@vger.kernel.org
X-Gm-Message-State: APuU4Z96EoRus1nK2NmbL9rcTt9OoClP37IqOjo6FLselxv+kpiJEDwl
	VQOtJzFYNTnwIVDa1ta19qR1EDoh98JwKxjXoZ+trl3wl5IGl4shcE31cBtPhOSxzszTvd+yH1H
	7sH64Fq2Y2WBDlVYyB+NX7i0qgFBoqFHVAdM3F4Kqcz8tuMQuhTrjcsTbkHPCOA==
X-Gm-Gg: AYBFou2xB16UZg8551LFECYSsomEPpg7sQr4MEhjvLgWNvtiWcRWlXmSPUOGU/ybiwD
	T2TxU866taIbHbpS/Xc+k/Y/NenyJsd/IKjJaYcST+sLIbSYvaOuT/RUThV1mV1X5y/camfJ4tB
	a/WyVV9yAYMqEdJxqJIrJl4vaxMhr84I5L9JTRvFZc68sNV0VJLb+n1Pu8Z3drcuMRCrkpO6WH6
	P5U/46JM0+vcpePvySd6JhUnSvNj9+grXSjsSwotWdCjYqltyFZhrAZaWZrGibfA5JDtWu0FOZy
	e4xL+HBnAxdP8P4JRQXFjkCuddunpXy8QYVnKQr6iRxDNvorVhhKVhbnX8m7/nVDbVEw9w5+lBE
	ljXmZjbDgWFxldRY1ZmMSSIIZyhESE3YHddyvaB6CIZWiFsVDCqJV034sTq59Tv4dkggq/X1e9T
	U4yl4H12pZGmGjW4ZY5FAo
X-Received: by 2002:a05:622a:1e11:b0:536:61d4:cc6d with SMTP id d75a77b69052e-55ac847c073mr171631801cf.53.1794859466747;
        Mon, 16 Nov 2026 12:04:26 -0800 (PST)
X-Received: by 2002:a05:622a:1e11:b0:536:61d4:cc6d with SMTP id d75a77b69052e-55ac847c073mr171630841cf.53.1794859466077;
        Mon, 16 Nov 2026 12:04:26 -0800 (PST)
Received: from [127.0.1.1] (nat-128-59-176-174.net.columbia.edu. [128.59.176.174])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23efa2edsm93065426d6.15.2026.11.16.12.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:04:25 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 16 Nov 2026 15:02:44 -0500
Subject: [PATCH v2 2/9] userfaultfd: refuse UFFDIO_MOVE into a non-present
 huge destination PMD
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
Message-Id: <20261116-uffd-state-fixes-v2-2-4397a0196479@columbia.edu>
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
        linux-fsdevel@vger.kernel.org, stable@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794859460; l=2644;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=BudFHF5389gq/6rY8jRzvPbsYx2vICBEg7pYFFrBViE=;
 b=t3sAieLSS+OXzq7B52aEUhbXT4G+5zwO4OVck5koZlutX8gDRlKpXN98AOcvX/w8IcqgKUbPD
 QyCfUeDhDxpD1EXJZMVer+LooTq+cx3UW2MMtCDD9f0yNIK3ut+s1Qv
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: GSkXQrrMp9fXJ1Xfl8XBazpamWuSAyZF
X-Authority-Analysis: v=2.4 cv=Utf2pOwB c=1 sm=1 tr=0 ts=6afb61cb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=KPY1cyGZ6h6m4ASiENTC8Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=BpGzv1V74M3SfeTrGa8v:22
 a=VwQbUJbxAAAA:8 a=tHa68p0SAAAA:8 a=n7zxJ9EK30Z5vFJJ7y0A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=ufIsyHvWW7FwcMbVRpPq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA4MCBTYWx0ZWRfX5kMzUSO263W+
 rk6MTWSNFRUIBJTCwOVkXYdiUz7GLkxnOd1Fx6+NpLZ4mQcCNfaoZpHI+TrVv3xlSAdWwZvYY/c
 BKgPv47R0iSumVE7tMMX7jNDwfDs9x/wDHRu2E/UAcfjC0s7SCcVTtHo5d3EB4J3HI7RjVkGsBJ
 +IxghYbHuNt5KYYJDZ6tzIZvXcJaD5pyAuvih4xCi53nlGMPaqzoKh9hxW2Kr/asPdyUJEaQ+vG
 cPK+n+bnjmfnOlHZGAmA1lc5rqtZ4nq51hzny0Frr62WK+/flrq6LO0ol6DZer+TUQj5XlEibMp
 ub1QWg1McwBSQLDbOrue2YlFT+i4bIMDRMF4rgY04yYIbMdKPcwpdCfY499rNF3LqbnmK+26Li2
 K2KwIHQkpynf4NMUz99M8jOv9gYvtZsdzsktw5JdJVKPrYKCepIXNxsDc4Kd6mMHifoXWoY2KcC
 XMC/u59cQ8bqh7jeXkA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA4MCBTYWx0ZWRfX7l3FKaTPRV6V
 cPkISd9yjKnLhCCQg4Jvphn4ZIB9G9hjzeu49AcDdasSkvnsg+cltY7Mnifsb/J5LmcASUVFHAr
 pW0xdjzvC1d3L9oRArLtR5566N64jvlvfMVDfjPddm34X4MUvEYC
X-Proofpoint-ORIG-GUID: GSkXQrrMp9fXJ1Xfl8XBazpamWuSAyZF
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11968
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=10 spamscore=0 adultscore=0
 clxscore=1015 impostorscore=10 suspectscore=0 lowpriorityscore=10
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160080

move_pages() refuses to move into a destination PMD that already maps a
THP, but checks for that with pmd_trans_huge(), which is only true for a
present THP. A device-private THP or a THP under migration is a PMD
softleaf entry and is not refused.

The destination PMD is then treated as if it pointed to a PTE table. It
is not empty, so pte_alloc() leaves it alone, and move_pages_ptes()
fails to map a PTE table from it and returns -EAGAIN. move_pages()
retries on -EAGAIN, with both VMA read locks held. If the source is a
THP, it is split first for nothing.

For a THP under migration, the loop ends once the migration finishes.
A device-private THP can remain in device memory indefinitely, so the
caller of UFFDIO_MOVE hangs until it receives a fatal signal, and
anything in the mm that needs to write-lock one of the VMAs blocks along
with it. This requires a driver that migrates THPs to device memory.

To fix it, check the destination with pmd_is_huge(), which is true for
a present THP and for a PMD softleaf entry. UFFDIO_MOVE now fails with
-EEXIST in these cases, as it already does for a present THP.

Fixes: adef440691ba ("userfaultfd: UFFDIO_MOVE uABI")
Fixes: a30b48bf1b24 ("mm/migrate_device: implement THP migration of zone device pages")
Cc: stable@vger.kernel.org
Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Tested-by: Gregory Price (Meta) <gourry@gourry.net>
Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 mm/userfaultfd.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
index 61a712e1f9f5..ad9d243dc64b 100644
--- a/mm/userfaultfd.c
+++ b/mm/userfaultfd.c
@@ -2021,12 +2021,13 @@ static ssize_t move_pages(struct userfaultfd_ctx *ctx, unsigned long dst_start,
 
 		dst_pmdval = pmdp_get_lockless(dst_pmd);
 		/*
-		 * If the dst_pmd is mapped as THP don't override it and just
-		 * be strict. If dst_pmd changes into TPH after this check, the
-		 * move_pages_huge_pmd() will detect the change and retry
-		 * while move_pages_pte() will detect the change and fail.
+		 * If the dst_pmd is a huge leaf, present or not, don't
+		 * override it and just be strict. If dst_pmd changes into a
+		 * leaf after this check, move_pages_huge_pmd() will detect the
+		 * change and retry while move_pages_ptes() will fail to map
+		 * the PTE table and the next iteration will see the leaf.
 		 */
-		if (unlikely(pmd_trans_huge(dst_pmdval))) {
+		if (unlikely(pmd_is_huge(dst_pmdval))) {
 			err = -EEXIST;
 			break;
 		}

-- 
2.39.5


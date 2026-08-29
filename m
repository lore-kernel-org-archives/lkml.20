Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C732F7EE6
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788030568; cv=none; b=h+eSANumUR8qNjeJbudA+sCAqEgV2/HdX3IAbCm/p6kg5QsI3KbbUxUkHw+q0RHgkbjJt99ccetl5zIXbpyQVW9QeKTeshv1Ggu3G6JDXlurPpq/nPPw9jygrVQcD6n+l4af7wzSjnphp65GqpqbsdF4pEKkMC1K0sOwe0WG75c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788030568; c=relaxed/simple;
	bh=BCcl2zDAdZHFcBdl79793ehAAmV8GYAzBaIVfNMP4qU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H25SkPeqmLv32ZGiXLKzcNUW4l6a0giZ7HnG8FluAAMkYAMDaJj1eW2sz6H/I6dj8BZ/1kKhECMmoD29/XxJvwzyeQ+w9rwH1NLKMtQ27hBm6zzncWiwRi8UdROuQz7pcg9xoW8q86P9kL9nhvpYZgM6AcYN1sa9zGUQGsg3nIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=uB3xh2hY; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=kW2FS/yX; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="uB3xh2hY";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="kW2FS/yX"
Received: from pps.filterd (m0167070.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TIZVg71211799
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 15:09:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=tU6k
	dSXF3QmqklrLl9ZtFiNMxMnkDC8HoR+tVfS5rbk=; b=uB3xh2hYIMCJRblC/zPV
	0H+SqjqEnE5Y0CZXxMeBBBrGThAUy7m6XaO1dlLVeAVABRspY3K6xY48l6JbR50i
	d6k6rF/HlornDEWpsTDl0Fii8JDPFT6HEm3s7nfBEheEO1bZ5GzO13rcZW9FwJX0
	lS9rq7SrPGWIzWERzmEJzpZI4/ZAJG2utHhUEyHWcIrlX0G6gm/xQVN9PIXgKa2j
	ZXrtO0CITxDjY/bnvDo5wMNz1gx2KmTBUMCHpOBSi4vuDSYdk1CrW+BQNcX7GDlb
	UB8PmtRaeu1tMREYKZxQdIItf41ACW2korCyCZzm+8QBglfnYIO2z84eCYX1cD/i
	qw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gbufx2rmq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 15:09:25 -0400 (EDT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52dcf1bb6e9so44797331cf.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 12:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788030565; x=1788635365; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tU6kdSXF3QmqklrLl9ZtFiNMxMnkDC8HoR+tVfS5rbk=;
        b=kW2FS/yXhWapg+XMkKbxq+j9RT88Pw/adFRqKy9ntgISUuswLvFD2b3NFxYKsSRW/F
         kkPvcngOT4DV1M0/HMc98cZicJmaK+MDRptona6kbD8uXNk7vu10o+5rfgMC0SBoRHpl
         PaUnMPQIfD9mLZyRyxEBhEfBsIBSdG32wf3STIXIKI11j6izJbHpEtA3AluuSGFyVfPN
         /iQMW/E8SJYsc+O0kmhrCl4DNqGt8g+75M/H6CFNgNwk22EqJkHxTtMkXcFOpHXBrz2q
         bVstxSuOwZ9qamHTiKZhmRkMIKkz0nBkGEBsQonyc1U2SmpkSqrUW3rI1X1AOm3HVJ4j
         +a6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788030565; x=1788635365;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tU6kdSXF3QmqklrLl9ZtFiNMxMnkDC8HoR+tVfS5rbk=;
        b=Fus1YHH2vqHgV/DTJCkGJw7H+8C5y6kLkm2BRK8Ryqbwz9tHAIoXh7mpe3r8OSCJJk
         IThbwtNP1qMS4woD1QIY7+iMxrq8CKC92Vi6YGnK5bBixVZw43dnAjAqo73TFrhSf89W
         zidwezcY3itjskBrDoyeB4y75fOGd0PQWg3/aob/Ohv4UQzI1BSThwrDhhkfHLRXccGT
         PPRjYL+QkmPAUeOIrJ1U0nhk/6p2KrPe8CfqlZOM6WwhsaTLh/FJud3FP077Jhc5bDHT
         MzH36S/MmjXmX/l3/qmPW9sXCxJh1TzYRJiX+GnMa7WUyJBc++66WaUpxUHSd68vOYHb
         zJDw==
X-Forwarded-Encrypted: i=1; AHgh+RpWBoOMNOEoUrtEMtHxumB5jmkpuxRcR8bYevHQnStvhXHFtkstedSfDH19c9aW2AnObUNhLtM27jRHoHA=@vger.kernel.org
X-Gm-Message-State: AFuF++mruDtUtwD3N6JWJcq1+ZGSn6SuYvO+lKBulCW0fsq+c1zPIl8Z
	qJ7kBYlPHVPVss9fkTKgVNtqkZZ6gtyOtLm0KZbZOIT44CGf+/ctqM/4itCmVsP5o7CrQUKd3nM
	UU9WVCDl6aPCr6BoegGzRwLivMJ0iDwDG2dopUqkVPZbD0vTlIsT5fniJlDohuA==
X-Gm-Gg: AR+sD13opRLPFscDn762nwvdicbn3A+dUFsvRP9DX7NaOegyd0IcBoDjH9nRb9oumSQ
	X44hWxS2a/H8tMc/oNZI6c4/Iqpz2HQfbJOxFyRoK/09yUpJx8bDFR2enrVOAYm2BpoQnXrWZ8f
	Hyvi7BK1WHP2l2NO9hF85a7Ib8JaWk3a/bujPEUQ+yBgZvx2Bq6Wks0jyy2FQQ4JTXhp0cIRp4o
	JCJT1lc5StjhDI1RsHgl92l+nqnJimqTGPJIPBF51ZCNw9zgCzKe1rESpeC/+OowKe+eujhHizJ
	7V4j/d7rzZm9y3nYm1szdz0TaJueMic46X4PGYdA+Woj1fov/r5/JnjLO3AaApZbITJuYrlGCrQ
	SSrJEM4suMVA93QterMXAbFYsqwQBuBnsYZfsF82eow==
X-Received: by 2002:ac8:5f11:0:b0:52e:1e5:45d6 with SMTP id d75a77b69052e-52fa1a980c6mr256846631cf.6.1788030564837;
        Sat, 29 Aug 2026 12:09:24 -0700 (PDT)
X-Received: by 2002:ac8:5f11:0:b0:52e:1e5:45d6 with SMTP id d75a77b69052e-52fa1a980c6mr256846091cf.6.1788030564433;
        Sat, 29 Aug 2026 12:09:24 -0700 (PDT)
Received: from [127.0.1.1] (bzq-79-179-7-133.red.bezeqint.net. [79.179.7.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b963c3c0asm239150095e9.10.2026.08.29.12.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:09:23 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Sat, 29 Aug 2026 15:09:01 -0400
Subject: [PATCH v2 2/6] mm: remove PageReclaim
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260829-b4-page_io-folios-v2-2-649728091117@columbia.edu>
References: <20260829-b4-page_io-folios-v2-0-649728091117@columbia.edu>
In-Reply-To: <20260829-b4-page_io-folios-v2-0-649728091117@columbia.edu>
To: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>,
        Kairui Song <kasong@tencent.com>,
        Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
        Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
        Youngjun Park <youngjun.park@lge.com>,
        David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
        "Liam R. Howlett" <liam@infradead.org>,
        Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@lst.de>,
        Johannes Weiner <hannes@cmpxchg.org>, Yosry Ahmed <yosry@kernel.org>,
        Chengming Zhou <chengming.zhou@linux.dev>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788030553; l=1135;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=BCcl2zDAdZHFcBdl79793ehAAmV8GYAzBaIVfNMP4qU=;
 b=14EcgAuY3De4UNPWTxyA1/SmrS+ExW1ZYGxseS5Q3cBlLwJHB+Zz1/u9LTefMgLRnhzLxyAEv
 HqHDtZXa3IDALuQ9bcTHL4EdKMg0Uwd10Zx16kVEDvPUdQpmM6VBMsd
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE2NSBTYWx0ZWRfXzSZSs0au7/wu
 OS0RI7GCFFwPrfThwRA8vAnrV2Dvxm3aGFby22dbzJ6HPz354rbPsqRw3mMOyNGUxqq/qPt3dNN
 TpgWgDboN5fy+Zhz5gee2m048+AJY0N0GOetj5QDKeJXxf8KaNTx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE2NSBTYWx0ZWRfX8TYx4mNKBLJg
 dSWPqY/+n3kPxkTeSNIeW5T3EVFC5qxmfJMBp3prtg5GJxUuBZnoJ3AQvdFw26rAvwE3opgJq4X
 t6xqvAblNqEVDVKKHOWg/onoTA7ecA06Kh4/s6kRFf1V9n7UdBNidadHGudl5E/IsDutV4lyD8I
 V5OgVzR8qsoIJ3etPahkKR+Ugn8tCJTH5QBipJgDli0njkbZDa+bAHu8JZQwtEeHFWUCorsJhHv
 JBfS8S9A1ctuW10ZWFXeaPQaEauJbNG2Itb6B+pri+2AeFQor+kzaYLOw48XrjiwQugwcQEzXiH
 vkHP6enrDOhGNzt9+6Phb3is/Bc9aJKhDLByz2c4galWC1IAeOo6B5U79Jo5ZK6t5UHd9i/H8VP
 SZyy5J850S/x1bOrWFHcaXEU6J6WIyl8pr+xEpYIDMiqa8KiaFo5L61qqqUI03IjuSt2+hTz2Pz
 xtdkFP8lCjDGjKiJMiw==
X-Proofpoint-ORIG-GUID: ZK9wkD7DwDnqBL9fSnznmvt2Ps_n-DWh
X-Authority-Analysis: v=2.4 cv=BoitB4X5 c=1 sm=1 tr=0 ts=6a932e65 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=LRATYcvZeiQrLRB5MfbBvg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=svvvyxlR1OQQkelhaPoB:22
 a=ufHFDILaAAAA:8 a=JfrnYn6hAAAA:8 a=VwQbUJbxAAAA:8 a=dpU52ea7H0PVM4Hx00EA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=ZmIg1sZ3JBWsdXgziEIF:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: ZK9wkD7DwDnqBL9fSnznmvt2Ps_n-DWh
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11890
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=10 lowpriorityscore=10 priorityscore=1501
 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=10
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608290165

This flag is now only used on folios, so we can remove all the page
accessors. folio_test_clear_reclaim() is not used, so don't add
FOLIO_TEST_CLEAR_FLAG() for it.

Acked-by: Johannes Weiner <hannes@cmpxchg.org>
Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 include/linux/page-flags.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 7a863572adce..ae2ebaed6d4d 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -593,8 +593,7 @@ TESTPAGEFLAG(Writeback, writeback, PF_NO_TAIL)
 FOLIO_FLAG(mappedtodisk, FOLIO_HEAD_PAGE)
 
 /* PG_readahead is only used for reads; PG_reclaim is only for writes */
-PAGEFLAG(Reclaim, reclaim, PF_NO_TAIL)
-	TESTCLEARFLAG(Reclaim, reclaim, PF_NO_TAIL)
+FOLIO_FLAG(reclaim, FOLIO_HEAD_PAGE)
 FOLIO_FLAG(readahead, FOLIO_HEAD_PAGE)
 	FOLIO_TEST_CLEAR_FLAG(readahead, FOLIO_HEAD_PAGE)
 

-- 
2.39.5


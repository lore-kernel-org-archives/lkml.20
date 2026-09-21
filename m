Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB8C4A8418
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790003688; cv=none; b=H+CEYglA1f1vTIIQOeLhQ1H1UrxJs+tliEYjwdCL1sxIQ00haCWb44XPYzCpqeS4/GliC2LrQLxlDPJMlk+YOgzOT+3zF0iLlpxQwfpmXPsAElJSlfciFPPrlVoLumeLkl3LtC8wAOp1yRFMBgmAa2Nj6tokilcHSm+fMIXIfZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790003688; c=relaxed/simple;
	bh=Whvk5RInjRcT7w4OABrB+OhDGuJK29mos0BwOanD3hU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UCF0VHCT6yl8tQTQNOuVcPq2v3g5wCSj3/F5LHM5Guuk24FFL1ENwQejl4zFxCizxhNqT61a9H7sYeX5FbikhKE4iomLQJ7rOI4jnRpA8x6kSA4S/BhebGya5TKKIkTCzHhjGPCat521QQgzH5HRTIf9LqQaWbR6DnjWxyInHIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dcH+Et1y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A84mEo39; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dcH+Et1y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A84mEo39"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LFAinO2012924
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:14:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+sC0Yvqh8Q5nitoPDOO2xt
	DXj5k7Je/RXYaZIXdOYtg=; b=dcH+Et1yC92Lu5dw7AEjH/U1yXQ6mEHF6MbfJO
	ePttSzU0pXW3tGBgh0USunt9zJbIWlj3bdB5t0Cn98Ns/BgFdhw+YUAC9/UQ9LtS
	sPzLhE4A3NC8i+VRr9SOmn5wmtolZqWZ64HNcKwQfvt8+3GwTRyecnobNZxqoyTE
	Kq4iYbAHg9N66jlxI6xfRt1lZUWRrJG1kwOTEeC56ZQEhe95yokRMwleVnIpHlzp
	4fwRt16x5LK2thprq9Q0h3V9qAV+3FGNVrBVECSgQHLfNTydcB6UMe/qwSxMPiw2
	sFBI1incax2uGm8Mv68+yAvwhxYxcABM9I7tZSfs0C13IXdQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu01d1x2m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:14:45 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2dd53f2b27cso39194035ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790003685; x=1790608485; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+sC0Yvqh8Q5nitoPDOO2xtDXj5k7Je/RXYaZIXdOYtg=;
        b=A84mEo39MHf/Vt9SY82ZOIfJHjtgSIi4o3BLDeIU9lGvON2r59LQrNMToZc11nSFL3
         JzSRIX09NJDSrYGMaaF4/7F95t0YYRECuPR32zIHfLtkek/t7D6uvI0GQQMZyx9fU9Ba
         39L09h5DU46RQKyexgw7ezmfqEFgBw+7/JUrVsEOh1PmxQSLZNcuorX7MYeX2RYRmOKL
         aXiC3Y8XwDWchxylh0LQ+vk58/Q6zQgsVd1BE64CQzWo1u0lO+QKAI9W4er+pmYc44Tu
         oIMUQUZ7XNNbItG132zjaLZ3beoM/7jFKJwAaH073hrlnzAm3po0JGIAabcVMV7hZIHR
         +VVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790003685; x=1790608485;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+sC0Yvqh8Q5nitoPDOO2xtDXj5k7Je/RXYaZIXdOYtg=;
        b=Bq7wqrmhVtIYk1bWAXmksov5v2tcsvwMbUFJFAAH++ak2xlkOX9nzNd02cVk9N1U9/
         XjpSSq/SA6CtNW2Ikr4crQwOFPNhggPyRTyraj6qZIV6Clqj3U8OhBMMwjQugqmWkO0s
         TmN0lqs1ZdAOh5CdNUdel9wylGRUR1P0wjOnLbmV1LnjLnMrOb5hePVnpAVLUPxEzIkz
         dMyIh8D9i1avPN81rGzqtRQsIjRijWkOPh8p0qBqKdqXbpw5tSe0TymIkHH7TnLgitQ7
         ZtST6mUUbdOEHWxx+Bb+DzmKkm2pJkqtKzI7JZLb+MpQqFBOj5CB+/knjYeEvOYut6Xm
         zAfg==
X-Forwarded-Encrypted: i=1; AKwUvBwqNh3J5KEuYeYmtGufSZ/OU2Gu2S1h//eBSpVFvsIXi8gjJgTbm+dQNZ4MOxDJ6J1VflZfJlhm1GdCVc0=@vger.kernel.org
X-Gm-Message-State: AFuF++mwP4VwuhlyRedHaIqHnUhYQzTcibyUzcdmEnioMXv5HnlHvsuQ
	oJScrO1GYjaBGFY8rtP5rxg4hz3Uh5ogOBe9vhTEFt48cmrf1bUxdQwYnae5dGUkm4J7e/zEVcq
	cX/UjWHHQFVcNq1UgvH8P3BqSj7ELWo2mE5BYND1fYcj15dNUH+g/2sDfCqOKw0re2a0=
X-Gm-Gg: AYBFou2uytoMp37lQEQvW0J+zryyw2cIsRauJ2LdtQd5QiRdD/liJhSyCa3CQItlo6x
	T0a5dYKyoBtXwVRSxAcpYkLO5/L9moHXnQ57EPw6UVkDyr3Jlvylz0yv4kOkjGmBxKnxTQiW16I
	fpNII+pnjzZf73RaM25SpQa6AAY4Ir7xekeWM5GqWpVdoEoeG36Pwpz9tiwlblm5BF+Ii3xQGSx
	rojmSzGk1h7gZyNGev+UfVuKw1YrepmpD4wWkXI/s5nc95tpsuD1US+bNGpnXuYBYUjqlKRnHBE
	PM9zHgMSzgv7syZf1kg3WZRPj8hl8ZqFXd/KQVBaojLkQFJuWF+4m2h49cPpFkVJEgvI4rxxq8A
	SmI+Q0Hg9kdxphZF3RUxjkA5H4VLv9h6oBH5BdWFu4/6SVgaS6PrmCu9n2tp75OHeZp+Zw1jTsz
	brjE2Xm2/u11f726LFX+gx
X-Received: by 2002:a17:902:e741:b0:2c0:a555:80d6 with SMTP id d9443c01a7336-2ddb1aaf260mr174889325ad.2.1790003685024;
        Mon, 21 Sep 2026 08:14:45 -0700 (PDT)
X-Received: by 2002:a17:902:e741:b0:2c0:a555:80d6 with SMTP id d9443c01a7336-2ddb1aaf260mr174888945ad.2.1790003684406;
        Mon, 21 Sep 2026 08:14:44 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17ba54dsm35708185ad.54.2026.09.21.08.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:14:43 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 20:43:41 +0530
Subject: [PATCH] dma-buf: system_heap: align allocation orders to ARM64
 hugepage sizes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-dma_buf_improvement-v1-1-23d82e771dec@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKRJsWoC/yXM0QqDIBTG8VeRcz2HFRr1KiPC7LidC7WpSRC9+
 2Rd/j74/ickjIQJRnZCxEKJgq9oHgzMR/s3clqroRWtEkOj+Or0vOx2JrfFUNChz1yLQWqUqkd
 poT63iJaOf/U13Y743Ws83yMsOiE3wTnKIyv9s+PRdDBd1w+O3lTQkQAAAA==
X-Change-ID: 20260916-dma_buf_improvement-a095ae567e5f
To: Sumit Semwal <sumit.semwal@linaro.org>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        John Stultz <jstultz@google.com>,
        "T.J. Mercier" <tjmercier@google.com>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>, Juan Yescas <jyescas@google.com>,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, Pankaj Patil <pankaj.patil@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790003679; l=3701;
 i=pankaj.patil@oss.qualcomm.com; s=20251121; h=from:subject:message-id;
 bh=aYodpMjhjueRZKnta3cynI3TH/uCot98oWss+KQn/3k=;
 b=+fXkiGBUsgSDeAWL8tAR41f8+8vf5VxpHd5B7u4dqwtqgoHWuab3DmhyN+j3ssNg9tGAgFslE
 FlGWAWAqZ27D0cmreba2JmnHXGa9MWxZGkFmQY4Q8A/GxWgPpu+fdk7
X-Developer-Key: i=pankaj.patil@oss.qualcomm.com; a=ed25519;
 pk=pWpEq/tlX6TaKH1UQolvxjRD+Vdib/sEkb8bH8AL6gc=
X-Proofpoint-ORIG-GUID: 5k74A4P3mU00G8PEIBmDPgGD_2ir0OXG
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDIyMiBTYWx0ZWRfXzAFR0Lx+hXOd
 /b9fdZXzhBSfWfKsm0305M8wRRelWYkWe57y2l5tYWVoSaugKWMxy5Ep3uc9OIAoY+Ua4qvLYis
 uo9RevQXh+cGGY9rlEE7YCLw5DQHa+8=
X-Proofpoint-GUID: 5k74A4P3mU00G8PEIBmDPgGD_2ir0OXG
X-Authority-Analysis: v=2.4 cv=Ht7jiETS c=1 sm=1 tr=0 ts=6ab149e6 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=EUspDBNiAAAA:8 a=Y-RT13NjMWaHgGG2EaEA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDIyMiBTYWx0ZWRfX2O3dK3grhxKo
 ayOY5aVlFpEY7i2M02mkASFIOztdIpx5d+r5EdRTz9RmXXTTPhOiFdmZONw+F7FNN7LDQObC3nn
 2LwcnqUKx2v823U7kXszaZBdbr+l4IEGkz+mtHfFeRg8nyx7jFcyHTKdHtMX/0sxfgwZVlPKwON
 YwYggeGG0efH6+TGzAuhbV4H7I161QCmiFs4NhP221g8Ay57o0/A/f78rrm8nxqRHJigIKkbfUI
 oMIZ3GteeJXTsuEwWs7IyKqjZmNDK8RaBsovqz/2w001EtxJd89bU7R4HTxch3A1EKaDMWf4pxT
 6OUc1UkJSLIm2QieuPDsTxP49Xi8dDFxdAQ6Ff1+bQIBOdM3P0GKXwM8zihMU54orsulF7zA/bQ
 pWGPX0TBy84BtFz1HWgryqVRBLRpYbGWrCZiq6fgYIVyr9IW0Yi1WdGmUQjyuz/xZOGMWZJzesZ
 OgiImOKTEs43OSnG4iw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210222

From: Prakash Gupta <prakash.gupta@oss.qualcomm.com>

System heap currently uses a fixed allocation order, {8, 4, 0} while
requesting pages from the buddy allocator which correspond to 1 MiB,
64 KiB and 4 KiB only on systems using 4 KiB page size.

Extending on patch from Juan [1] for ARM64 targets with LPAE, a 1 MiB
allocation does not correspond to a PMD block size. For a 4 KiB-granule
IOMMU, a 2 MiB allocation can be mapped using a single PMD block entry,
reducing IOMMU TLB pressure by requiring fewer translation entries.

Use allocation orders corresponding to the ARM64 PMD block and
contiguous-PTE sizes for 4 KiB, 16 KiB and 64 KiB page configurations.
ARM64 applicable orders are selected for ARM64 targets with default
orders being used for rest of the architectures.

[1] https://lore.kernel.org/all/20250417201913.2393655-1-jyescas@google.com/

Co-developed-by: Juan Yescas <jyescas@google.com>
Signed-off-by: Juan Yescas <jyescas@google.com>
Co-developed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Signed-off-by: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
---
 drivers/dma-buf/heaps/system_heap.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index c8959eadc71d..7a3e26c3dd43 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -22,6 +22,7 @@
 #include <linux/module.h>
 #include <linux/pgtable.h>
 #include <linux/scatterlist.h>
+#include <linux/sizes.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
 
@@ -57,12 +58,30 @@ struct dma_heap_attachment {
 				| __GFP_COMP)
 static gfp_t order_flags[] = {HIGH_ORDER_GFP, HIGH_ORDER_GFP, LOW_ORDER_GFP};
 /*
- * The selection of the orders used for allocation (1MB, 64K, 4K) is designed
- * to match with the sizes often found in IOMMUs. Using order 4 pages instead
- * of order 0 pages can significantly improve the performance of many IOMMUs
- * by reducing TLB pressure and time spent updating page tables.
+ * For ARM64, allocation orders correspond to the PMD block and CONT PTE
+ * hugepage sizes for each CPU page granule, which also align with the
+ * TLB entry sizes of a 4K-granule IOMMU (arm-smmu, arm-smmu-v3).
+ * Each order = (level_shift - PAGE_SHIFT), derived from:
+ *   PMD_SHIFT      = (PAGE_SHIFT - 3) * 2 + 3
+ *   CONT_PTE_SHIFT = CONFIG_ARM64_CONT_PTE_SHIFT + PAGE_SHIFT
+ *
+ * 4K  CPU (PAGE_SHIFT=12): PMD=2MiB   (21-12=9),  CONT_PTE=64KiB  (16-12=4)
+ * 16K CPU (PAGE_SHIFT=14): PMD=32MiB  (25-14=11), CONT_PTE=2MiB   (21-14=7)
+ * 64K CPU (PAGE_SHIFT=16): PMD=512MiB (29-16=13), CONT_PTE=2MiB   (21-16=5)
+ */
+#if defined(CONFIG_ARM64) && (PAGE_SIZE == SZ_4K)
+static const unsigned int orders[] = {21 - PAGE_SHIFT, 16 - PAGE_SHIFT, 0};
+#elif defined(CONFIG_ARM64) && (PAGE_SIZE == SZ_16K)
+static const unsigned int orders[] = {25 - PAGE_SHIFT, 21 - PAGE_SHIFT, 0};
+#elif defined(CONFIG_ARM64) && (PAGE_SIZE == SZ_64K)
+static const unsigned int orders[] = {29 - PAGE_SHIFT, 21 - PAGE_SHIFT, 0};
+#else
+/* Fallback to default allocation order for non-arm64 architectures
+ * On 4K-page systems, these orders correspond to 1MiB, 64KiB and 4KiB,
+ * matching sizes commonly supported by IOMMUs.
  */
 static const unsigned int orders[] = {8, 4, 0};
+#endif
 #define NUM_ORDERS ARRAY_SIZE(orders)
 
 static int system_heap_set_page_decrypted(struct page *page)

---
base-commit: c2cd463d6ee7d55a3ec0719d93c49ff99022d58f
change-id: 20260916-dma_buf_improvement-a095ae567e5f

Best regards,
-- 
Pankaj Patil <pankaj.patil@oss.qualcomm.com>


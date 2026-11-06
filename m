Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985332;
	b=k5P98wYmIXui8j4rpSztaZtM08Tr77c+pqNgdf9z2j+yzDvAP696mD0VLDSd8Ey1GuQd
	 ao5e5aGuf61hBebVEk5PscZhrnMGhr/SRWrbJza/j1ERiaZJYfw3u0hKzOl7/yFRsgUAy
	 lYSVW2O9u1uRo3S2cg9LAdEAyKiBWCxhB91GrHF0G5noZD09v+xxxCFaxRAoseJ9hBCun
	 uG+UQB81OcK+BuOAmzSbOeKjC2rFikuzO+UgHQG74Wm2qD80yUTXxBvwTQp9owhWsCRov
	 dhHRV46y6Ho/pMI2Opcb1c3RsCumnb0ECCww00N3FgWQKZoJtJIC8R2uduk9mNI9mtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985332;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zF/sv9c+NsXmkESm0mCjV6+WOZV3eXKN1t46mzLarEY=;
	b=N32EQKesKXEIDRD1mP1+ARhPpD6g8z36YzyXJQKTDRBK4X0FGGwCwuxSu74Ha31/XsIK
	 SMicCyWpRU3JvhZr86rxfH0IzbUII8pIYGUkD/zLyUknX677cT1FhSvKVbPIGJX0AFuEl
	 nsONZa9tKsmYKzIQebixqVQBE+D2zwOyGAZm0iU2/u0mHlM/T/xjzlTFUJmcJa1EOn7j6
	 N+uUvtyA8RgoCQCtQgLbq/i5qlySD927NfT+p9PKoMb9+Pd4fxfwuT0AhSD+b303VISBU
	 7YlRwWev51tg7fQ+KLEcoNOcsgwiQaGxUMD0m/VgECe83ZzYLvy3ATJscMfI7uJzEmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P3vtkPAE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xhy6mpYY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D13606A33F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:15:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4D13606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P3vtkPAE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xhy6mpYY
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6F00er2670653
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 17:15:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zF/sv9c+NsXmkESm0mCjV6+WOZV3eXKN1t46mzLarEY=; b=P3vtkPAEC2OU1b00
	o9yuEbq8a96oHz1CCQpEWhumD+JCXfrJVBaEIxKLCybmx//oe5RQ+4TB3R4RicYA
	x8TZSJGyfPSH1nDyG03f5E9JggRSUiS7uCxRXY7ILjVYOpxMvG4rRGUMLRaa5bP5
	UuDfaHXj9CtyeReUgmTt/+k92RDns0w8pGXjAknEiMN2jU1c9TcBu72fo9zzYHa0
	GzK/JZh+EJuGhzj/k7it8UPWJ1+AiDsiyf0DcvT3Rl8QRCcBVcoqnvnBA2awSEyR
	mzl5nimqZk+9pnEZH+xGfOExCks0/mVlm+SA7Bcirbuk6TlcOj5YWpvNTsTgUNHC
	60f7hA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pcbucb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 17:15:30 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36f479b9819so1458184eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793985330; x=1794590130; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zF/sv9c+NsXmkESm0mCjV6+WOZV3eXKN1t46mzLarEY=;
        b=Xhy6mpYYH+FaV0vtIaet0pNDRikfJtbPr3n7+QvJHvxrEkGscfVKGVT9i+0iMeTZii
         eU/qTs7DtHPn0igoyprHP1e4e8Fwtwf/r69jOFHmRODxGKSlLTsWD0g4IW0FxYwZ97VQ
         E49P4oEG0RJho/jRZuP/tgOoFFE+7v95aH19AlpI3/BNSiV2oXop7htxwvUF7aZhLW5c
         LmkCRVShGVzrJi1ez7GmRR9G+6a5QMu2CQ7XS4hCUewk/3aKEmrYm+LWy2B5UonhwQAn
         3F+9CVAhloyYTZYkpcZrlbLxhMrJO6VzzBlfjJgqU0yvbLKmDmet1pas9Io/qF0YEGDI
         Rm9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985330; x=1794590130;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zF/sv9c+NsXmkESm0mCjV6+WOZV3eXKN1t46mzLarEY=;
        b=s0eEwB7MmVbZN3QhykVwrGPVvf634BKfadqAiXPSpncuym9RwyQyIPj5+Xz4CMM9sJ
         UqMle/gApzsnLgdCwvrJdFuK+uqZmENATfeJJpDmBIyRGrunIL1CXcVQDtrtHKZ70m8x
         MZSOEMCk+Gb731vmjXgqKa4oPUJhREyDP4dCAZ3aNswLqznewchGGwqsjc21Vpv2Vpng
         XCJ5mw4pv38d+Vb/LsXCNrddZDMWcW80/oNFiCSuFUWzbkcMhS4W1KlaxdqCU9QWc+Ox
         irbQLBMbXrDmf8mgs/3vf+hNvdPQ41fxL/acwtjXWmNA5V7A4x9LSd5sbe10bPypBlOm
         skNg==
X-Forwarded-Encrypted: i=1; AL+hErHmA3zMkmV7EgcYkTgDmyNu8oYw40qaDjSrmuAb1YOCVckXRdXCF0zAKpJ76dp4Zw0oSxcZzKbWt3trKlM=@vger.kernel.org
X-Gm-Message-State: APuU4Z//5nl9V3nPk2RHRZhZDm6ZAinDZY6/43ec/J3/dUubnhZHpJwu
	jcRVZV/YjMpIIYoGjGEIy9xIHhs5ozxyzb+QNbnPoYOquSxX6b3SgZIJncJ0qgd4SlA2FAvmmnp
	htwDtKWIKJ8w5RNYb780Wh6i+jOqMLKWFaF3nvse0Rs/B3jVRalF9DvmKccLIw11o81Y=
X-Gm-Gg: AYBFou3qlBa3U/KwrWHujI0dEoALNMP0repst/yoJgiO0TGyPdTCadlRcN1U/vZuTM8
	0m0VPWvBs3pytoLHucIHPNP4XO45OHgviPR6E2wTqFJq/w5i9Unakxh270KRTUc9gLt2UpxNmwC
	W2BtQOOj8gIQo/K0VbeNUO31ODX5bBA/fQEklpsYKn1wj0zVb7o+HcHm9qTI5S0MDeXUcvZ2I8p
	nP4RhlIsUW3EFhYI6xx5lKHSvDDcaaWS5K3Ulw6FpfbX7WJ78RhKFuPHtZtq0R30GveaWYaGimD
	l0tq8M2BHGAemZ8QbdN0VAMVbzAcLtGiM3kLkgzc+PL+fp7HUnhgUsxDJ3GEnrRMLeJHLXnGqmE
	irUxzNxflw/hrLPCOLjIfz1uNqaq2K2NkPuIwAPnJBAsYnccS+ULlqa1ZlSFhvPbouxl3gPdl07
	T0PHYgfcMl
X-Received: by 2002:a05:693c:80c1:b0:36a:1732:1e7 with SMTP id 5a478bee46e88-36f76d0f26emr4000258eec.31.1793985330011;
        Fri, 06 Nov 2026 09:15:30 -0800 (PST)
X-Received: by 2002:a05:693c:80c1:b0:36a:1732:1e7 with SMTP id 5a478bee46e88-36f76d0f26emr4000223eec.31.1793985329467;
        Fri, 06 Nov 2026 09:15:29 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9aea75fsm14693756eec.15.2026.11.06.09.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:15:29 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 22:44:26 +0530
Subject: [PATCH v7 3/5] iommu/of: Make OF_IOMMU depend on OF_ADDRESS
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
Message-Id: <20261106-add_iommu_ranges-v7-3-5c0f72083e52@oss.qualcomm.com>
References: <20261106-add_iommu_ranges-v7-0-5c0f72083e52@oss.qualcomm.com>
In-Reply-To: <20261106-add_iommu_ranges-v7-0-5c0f72083e52@oss.qualcomm.com>
To: "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Vasant Hegde <vasant.hegde@amd.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Jean-Philippe Brucker <jpb@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Tomasz Nowicki <tomasz.nowicki@caviumnetworks.com>,
        Eric Auger <eric.auger@redhat.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Joerg Roedel <jroedel@suse.de>,
        Srinath Mannam <srinath.mannam@broadcom.com>,
        Oza Pawandeep <quic_poza@quicinc.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Alex Williamson <alex@shazbot.org>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
        virtualization@lists.linux.dev, devicetree@vger.kernel.org,
        kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793985294; l=2273;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=NupkmvlL/dCPtTaOqaRQsl8ArnjGwSn52BAlgLqDvzE=;
 b=zmYLfThWfIv3sYXwDsJ6RflfKmCfmALOpmNPBUN8TCisKPeZCWDqMJUW2XSqMOPFsQD3BtSCT
 o8PihuvJzOpAYMe5W/ppgKgNz7pZ2PFLD8vYjYsYkLQ8uPypf6/trFV
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-ORIG-GUID: KSbcVKdMSTWIW26fhCVEKEMYEwnrfIO5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA2OCBTYWx0ZWRfXzcfL5LKXjQ0i
 ORAVi3jxScho/5pPBbZPLVgfvCpfZq4WhgWcTsuQ7ydBsEEP0d42ihqrpXlpu5t4TPT64L4B5NP
 amRtDZ1uYV0h2g6bF7nWZnM+i+3zWiNOnvekxCc6CBYsI18GFFHCDDWUgyiVMA7432D4zQMQcPZ
 CGlNEUTY7nV3uj+vI8MZp/MtDNOo8e63EyCZOkEi/PGW6pCdeiTlNXi6RgUYjGhwuMv0OxMoEqy
 1QCCo8J9EM+aNeGym5tBHzKO1UNdO3nZfQBi34QuN7N3175QxLkg28jLrilbmBmyjfTrrCIdbrs
 54dOtzZh1o83w9A6nzQc7biUwzvapFU55l/0mcP9EaflCy+GoPzQBEzYUMy+B7e9GDdxey2PFAd
 iMvAlM7JmUsPI40nW+V2BLl5X5rOA44xs0Fv/hwLAQTus1xu6hJzFcQIT9Mu2ADXyX6xJAauUDb
 3NsUOyUmWsmIJKYdADg==
X-Proofpoint-GUID: KSbcVKdMSTWIW26fhCVEKEMYEwnrfIO5
X-Authority-Analysis: v=2.4 cv=TI3Q2Fla c=1 sm=1 tr=0 ts=6aee0b32 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fdurNWXONF6VWYIYtoQA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA2OCBTYWx0ZWRfX5r4kjCq1SJLO
 5mW5PtGjnpo3nVoShGeNTWlVyQ5aoIlDIoOwcIvvs6sJ7TQB9KdDE/aURIqUbOLCKF9dmb/n2ky
 MKnzD9+V/UD1jqh30QzN5H5RdZL7nuo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060068

The OF_IOMMU code relies on OF address parsing helpers, but the
dependency on OF_ADDRESS is not expressed in Kconfig. As a result,
of_iommu.c contains CONFIG_OF_ADDRESS guards and a __maybe_unused
annotation to handle configurations where OF_ADDRESS is disabled.

Make OF_IOMMU depend on OF_ADDRESS and remove the now unnecessary
preprocessor guards and __maybe_unused annotation.

The only architecture supporting OF without OF_ADDRESS is SPARC, which
does not use OF_IOMMU, so no functional change is intended.

Suggested-by: Rob Herring <robh@kernel.org>
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 drivers/iommu/Kconfig    | 2 +-
 drivers/iommu/of_iommu.c | 4 +---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index 85a8d7fdfa30b64e21b8db0db1d5bc268c04f24b..c1e97bd885f933cae45fb7806183477f2d64cd5d 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -147,7 +147,7 @@ endchoice
 
 config OF_IOMMU
 	def_bool y
-	depends on OF && IOMMU_API
+	depends on OF_ADDRESS && IOMMU_API
 
 # IOMMU-agnostic DMA-mapping layer
 config IOMMU_DMA
diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
index 5c266511db78910d6fd221af5437cecff4931c22..6675fc900e6c2d55b34c61dc9effaeb48e24f18f 100644
--- a/drivers/iommu/of_iommu.c
+++ b/drivers/iommu/of_iommu.c
@@ -167,7 +167,7 @@ int of_iommu_configure(struct device *dev, struct device_node *master_np,
 	return err;
 }
 
-static enum iommu_resv_type __maybe_unused
+static enum iommu_resv_type
 iommu_resv_region_get_type(struct device *dev,
 			   struct resource *phys,
 			   phys_addr_t start, resource_size_t length)
@@ -203,7 +203,6 @@ iommu_resv_region_get_type(struct device *dev,
  */
 void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
 {
-#if IS_ENABLED(CONFIG_OF_ADDRESS)
 	struct of_phandle_iterator it;
 	int err;
 
@@ -265,6 +264,5 @@ void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
 			}
 		}
 	}
-#endif
 }
 EXPORT_SYMBOL(of_iommu_get_resv_regions);

-- 
2.34.1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793719811;
	b=Xqs98zPyq6Q9SNboAmjcUmA/XfjIWaEy5sDuuU5uUIE8pmugpbHvJY3oricDeohC4QsI
	 rR1UGA3t/+QDgisNERe0D6JHl/h8fDJZaFWrI090vSJuBkcdiBOvoOSvRonj6qnXqiUyS
	 nFn8nKpKj4KcOPrzU1JxglYHaHxmKu4cqibTfd3Hyhr6ns45xP2nJMcMIIayPY2H1eiQS
	 bz+6p4Wyutp0tuFsb0TlSepM0m/fEpxw3wg1AwadrJ3cQLimnTLM+aorMKIfglIww3/ID
	 eWIdZcwqB5whBiM5FfK/PtMZMkaMjMmD2tm3cUyLreGhwDaQp8dH5gH+h9opaH90U5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719811;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OXaCH6Hk0zNkskg8aCS7eO92Aj1KS1X5NZZHHQN4Emk=;
	b=oFzQ8KhgQLc38Qih+DAGzjU2pUbM/QroOD8zalytFTGCnDmjkbZqBnvFSVR0Uq1JyMzo
	 xdvOVsjYTnnks84hS5QmhQTX1tEs9lQLaR+AqUVVTGTM7h0NmxfHPP3VvhsS6I9uNcefk
	 oFd5hr7BQTWVf0R7KLekQ3r0uxPN9plA76+JRKoP63dDMex2nuwvegXf+sNdOKRrJMjOt
	 96s4OcFc7Sn7eBHhTxN8rBNwyqbDg77fmbnjgrUDfDGd2kE6sWpbM1CoMYJQ3Ej9Zeplc
	 l5+itH3bWskixMAtj28YAI8Tg3JtlhlJKSeCUkPsGkNdR4KKL6XCK3LQqLb/6EXSpKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nTQz9dwb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ABWfhMaR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE78606A332
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:30:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBE78606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nTQz9dwb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ABWfhMaR
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3F6XZB1576822
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 15:30:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OXaCH6Hk0zNkskg8aCS7eO92Aj1KS1X5NZZHHQN4Emk=; b=nTQz9dwbCVRsr3Os
	2b5IzO1UcLgGaoe7tiFVfLvqC6dXARL5xnQXnw6WvZa8Bzo/TDiRvKq+GRHv8aKD
	xhsFi95h7Yozdv/Cos8G5w50wM9JVhlVQ/qGHba3ykyvUVMO2UbqX3YhhIX9S5tn
	Xrv84PR9Xt5wz79Dbp4+wMN6zTOTQL5b+fmTR7kEUbRr/3QTEn0EKrV172IrPRxq
	MCbXPDX9aI3dKqOTuvS3mH6MoQChz0P3agYL6G5d1b4jCSdOMP1/iWJ/MVS1QDk2
	htOTT27NB4hpdjM/ba30pueR51L4+O26oR/XUNJU9m7DKqe0bQ5w3gRhQgqtjlCL
	CN0g7w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqhyd035t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 15:30:09 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36a190c53a3so1151558eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 07:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793719809; x=1794324609; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OXaCH6Hk0zNkskg8aCS7eO92Aj1KS1X5NZZHHQN4Emk=;
        b=ABWfhMaRSyBp1DDy1Ay531lPOJCGBGW9Uh/EpzY5qknEeQRV//g4/rWE18bzpgaAEV
         b9simQPsulSZyKb3/a8Ocl4evurcHfCodor93uX1IdQlqdYHaJpV5q0wCOXz3W+TvWI3
         geA2f/7uPrqj2gyCrs0ud4lJvECzk8Nbx0ESy3/nUvylmXyPGb/abqkBmFTZsemUW895
         Wfq89jZbfwrjN3IZLj4najyyMO/+mOMEW4KRfqDFNMKF7sSK0j/Zl4os/V2xI0RCWZ5f
         HGIBjt8dtbljInHIhMU3AV4pkJ6qfo7NfdZzZpS+i5Scn+6zXUuTChRHr/jtwuC9h1Up
         B1fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793719809; x=1794324609;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OXaCH6Hk0zNkskg8aCS7eO92Aj1KS1X5NZZHHQN4Emk=;
        b=aC4Q1fS/fpT92J5z7zrUPSm0oTS2qRrVMZhIPAo7bxmqRtaW3yG7Zv4wty3wNruYtI
         rYHwHsacWpq1pFsMVUaBVQQ0yy8Ty6mGRiFVS0MzgWChrgp+Wurv69XYF79zn78guG33
         ENY8zfl2J+Ps69eNkwK1Nzsa1F4utJqMbV5SxfCk8nOfldmCAdCMksrw794La17MkJu5
         uJJFFLYyg4qETyuwAHQl50Sbmvkwgk/VBSNsM+8wqVoBS5K17o7Z/vzsAQSEBpWdf24b
         CaNTgZBow1qO2OsvmWQzIyG5NEIKyScvd1Hi5eemUT7FNLEEDt6DfFlb4av6Rl6FR1sz
         ZZuA==
X-Forwarded-Encrypted: i=1; AKwUvBzQhFJRzvhvhvjYh5aswrq4lDu+hQujTJsf/uMEoT2pEYd4Gxgv1I+d4izheLiMSi7s7CxYcyEpSHJc7eo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/WMAHl2QKUMguhLk+Eqv1D1O+FSumFI0eVy9m9xatiCOyiYhYb
	nWMkchtmUjiIZX5aMLXG119RGZidhLLQimr4c/oTY2MmkeH55FFFOnuaw//tY5Jq/Hz5tiwt/Lo
	Jg6igU1JZPeH4Fd6Dmp+9nMwd/jRyUe5DjwUEjY4NDFs/OYlZt0rpvfCkZqNbzdZhswA=
X-Gm-Gg: AYBFou0j622blMPXIPtiC34Kvv1X2uDE1U/f1iTOtQY4JZw+T8UV5iR88O6hnqEozCt
	0afliajX9JUbFSSNeJRuxK7mx7MWsQEbJr7hOV2A18JjPlM+Lv40erdPKOErC8qyK6n9r3Cyypy
	AEV0ZOOxYlO0dD+OT3SlDZJI9jilZtgxjzEcrMadW84yb1V2Li5R+e3b35pq8F+u53L/Kg3KpEe
	8lpFU5Yor0j0v+OQvH1T9C/SC+E6xm6QeDUp1Pv8PdCy2xKrIlXNB9Y/k4gPJsyLJJzy/JHcdCN
	n1q2twuDK52QmFNBtqqhmg9H4/cgRU02YDolOpw6eoh5sFH3cPdZdg1bOw66fHSaDxyS/yDPA/L
	uAqNUEhBK2jUEuYNDEBZyMZtjeqhKnWuGe6gPamGGl7O/Cp3KUR+j4y7Kw9UyaYMuDRNlNSuRxq
	KHPT+73OQe
X-Received: by 2002:a05:693c:62c1:b0:36c:9f5e:9bb1 with SMTP id 5a478bee46e88-36c9f5ea6e5mr647170eec.17.1793719809125;
        Tue, 03 Nov 2026 07:30:09 -0800 (PST)
X-Received: by 2002:a05:693c:62c1:b0:36c:9f5e:9bb1 with SMTP id 5a478bee46e88-36c9f5ea6e5mr647106eec.17.1793719808404;
        Tue, 03 Nov 2026 07:30:08 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a426681aesm59888302eec.1.2026.11.03.07.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:30:07 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 20:59:33 +0530
Subject: [PATCH v6 2/2] of: Add support for "iommu-ranges" on a device node
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
Message-Id: <20261103-add_iommu_ranges-v6-2-361f3921a133@oss.qualcomm.com>
References: <20261103-add_iommu_ranges-v6-0-361f3921a133@oss.qualcomm.com>
In-Reply-To: <20261103-add_iommu_ranges-v6-0-361f3921a133@oss.qualcomm.com>
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
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
        virtualization@lists.linux.dev, devicetree@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793719787; l=6563;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=/HCjFP5KVncbzHe/trG6YGt98EFlLa86tteMIGVpmp8=;
 b=6Tj+1OPmVTPu0MHSt9bDlvmNIXFchNtVNHkWjLAIEJxrSx0XOqiwaGWpiXkg4RPfULz0MpeSU
 aGhScx+Ai5nBZK91Lz97nm4CMlBgm6d/osaJf8dX8w94Uhzh6kSl0ps
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=bp/Zl0ai c=1 sm=1 tr=0 ts=6ae9fe02 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9_LjikorOHgNi3J1XaIA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: iAv9LpokvU0GVImlnGIGP2WmDsvxMJZx
X-Proofpoint-ORIG-GUID: iAv9LpokvU0GVImlnGIGP2WmDsvxMJZx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA2MSBTYWx0ZWRfX/aw33glVfxuD
 rZKhb9VeBrK3V9HO94a35+lHFvxYBg6YElIy34muILjgsLtu3UBg4uuvUJ2lSTosA/K3Z+gkw5g
 6CrAIC2LGMeHBEZzB5LF41UJLFJFn0I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA2MSBTYWx0ZWRfX5xA9X6DhJ4A0
 oM+Oi3iUx55FGmsSzi+K2PBuiEuZKmGfitwcBdpxGi9KvG4HraM3KP3KUwS4u9gnP2s54suB2ey
 5pW3B37caRlxAl+8NNY6EBM6rD7iKq9tywflFnS82bilIAPNnYRVei81sVGCu7IAcW4nsEd48YL
 6tUrtsUdS0IiczstWZnnsh6Csb6RDUkNsJ6TlfbuI1FSes/2DAro7nJn7F94xaKC1xKpG0G4vu/
 C2k4xyB/apIGeufMvA3W6hYRJgD56/f+SEvkkBsNpANqaQNfHcsmUktEJwCmIEXa90g6kkXpI2R
 FBPzx46owO7gVsTgmyBHB4eJLsESFe3TJ+9I/msLNDY5cboVHpS6Puw1U7gBt6FmRq6b2OqnL+q
 iGjahB7n3+CuSrvC8la6njaTnJ301hnib0ZhfQ175G2nqg0fooHBYwr9SvgreFvQBXR28YA1cKw
 BD+1Abch1PlgRo681QA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030061

Reserving an IOVA address using "iommu-addresses" requires it to be
placed in the reserved-memory node. But when "iommu-addresses" is the
only property being described and there is no backing "reg" (i.e. no
actual reserved system memory), it does not really belong under
/reserved-memory. A device IOVA range is specific to its own address
space, and does not describe the system physical memory to make it
qualify under reserved-memory. Given this, place "iommu-addresses"
inside reserved-memory only when it is paired with a "reg", otherwise,
define it within the device own node. It was discussed here:
https://lore.kernel.org/all/662f7093-fb0a-4564-9ca0-98e03e68ba9a@kernel.org

Existing "iommu-addresses" property expects a phandle, which does
not make sense when the property is defined within the device node.
"iommu-ranges" was introduced to specify the device specific IOVA ranges
when there is no backing "reg".

Suggested-by: Rob Herring <robh@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 drivers/iommu/of_iommu.c | 134 +++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 125 insertions(+), 9 deletions(-)

diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
index 5c266511db78910d6fd221af5437cecff4931c22..0428ceb50dec58f11872b4fb64e283fa8d9046a3 100644
--- a/drivers/iommu/of_iommu.c
+++ b/drivers/iommu/of_iommu.c
@@ -185,11 +185,118 @@ iommu_resv_region_get_type(struct device *dev,
 	if (start == phys->start && end == phys->end)
 		return IOMMU_RESV_DIRECT;
 
-	dev_warn(dev, "treating non-direct mapping [%pr] -> [%pap-%pap] as reservation\n", phys,
-		 &start, &end);
+	dev_err(dev, "non-direct mapping [%pr] -> [%pap-%pap] is not supported\n", phys,
+		&start, &end);
 	return IOMMU_RESV_RESERVED;
 }
 
+/**
+ * of_iommu_derive_resv_regions - derive reserved regions which
+ *                                are outside of iommu-ranges
+ * @dev: device for which to get reserved regions
+ * @list: reserved region list
+ *
+ * A device can describe its own usable IOVA ranges directly on its node
+ * via "iommu-ranges". Everything not under those ranges is derived
+ * as a reserved region so the IOMMU allocator won't use it. Entries may
+ * appear in any order in the property.
+ */
+#if IS_ENABLED(CONFIG_OF_ADDRESS)
+static void of_iommu_derive_resv_regions(struct device *dev, struct list_head *list)
+{
+	struct of_iommu_range {
+		struct list_head node;
+		phys_addr_t start;
+		phys_addr_t end;
+	} *pos, *new, *next_range;
+	int size, prot = IOMMU_READ | IOMMU_WRITE;
+	struct iommu_resv_region *region;
+	const __be32 *maps, *end;
+	struct list_head *prev;
+	phys_addr_t next = 0;
+	LIST_HEAD(ranges);
+
+	maps = of_get_property(dev->of_node, "iommu-ranges", &size);
+	if (!maps)
+		return;
+
+	end = maps + size / sizeof(__be32);
+
+	while (maps < end) {
+		phys_addr_t iova, iova_end;
+		resource_size_t length;
+
+		maps = of_translate_dma_region(dev->of_node, maps, &iova, &length);
+		if (!maps) {
+			dev_err(dev, "%pOF: failed to parse iommu-ranges\n",
+				dev->of_node);
+			break;
+		}
+
+		if (!length)
+			continue;
+
+		iova_end = iova + length - 1;
+
+		if (iova_end < iova) {
+			dev_err(dev, "%pOF: iommu-ranges overflows address space\n",
+				dev->of_node);
+			continue;
+		}
+
+		prev = &ranges;
+		list_for_each_entry(pos, &ranges, node) {
+			if (pos->start > iova)
+				break;
+			prev = &pos->node;
+		}
+
+		new = kmalloc_obj(*new);
+		if (!new)
+			continue;
+
+		new->start = iova;
+		new->end = iova_end;
+		list_add(&new->node, prev);
+	}
+
+	if (list_empty(&ranges))
+		return;
+
+	if (of_dma_is_coherent(dev->of_node))
+		prot |= IOMMU_CACHE;
+
+	list_for_each_entry_safe(pos, next_range, &ranges, node) {
+		if (pos->start > next) {
+			region = iommu_alloc_resv_region(next, pos->start - next, prot,
+							 IOMMU_RESV_RESERVED, GFP_KERNEL);
+			if (region)
+				list_add_tail(&region->list, list);
+		}
+
+		if (pos->end == PHYS_ADDR_MAX)
+			goto exit;
+
+		if (pos->end >= next)
+			next = pos->end + 1;
+
+		list_del(&pos->node);
+		kfree(pos);
+	}
+
+	region = iommu_alloc_resv_region(next, PHYS_ADDR_MAX - next + 1,
+					 prot, IOMMU_RESV_RESERVED, GFP_KERNEL);
+	if (region)
+		list_add_tail(&region->list, list);
+
+exit:
+	list_for_each_entry_safe(pos, next_range, &ranges, node) {
+		list_del(&pos->node);
+		kfree(pos);
+	}
+}
+#endif
+
 /**
  * of_iommu_get_resv_regions - reserved region driver helper for device tree
  * @dev: device for which to get reserved regions
@@ -214,10 +321,14 @@ void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
 
 		memset(&phys, 0, sizeof(phys));
 
+		maps = of_get_property(it.node, "iommu-addresses", &size);
+		if (!maps)
+			continue;
+
 		/*
-		 * The "reg" property is optional and can be omitted by reserved-memory regions
-		 * that represent reservations in the IOVA space, which are regions that should
-		 * not be mapped.
+		 * "iommu-addresses" must be used in combination with a "reg" that provides
+		 * the physical address and size of this memory region, for an identity 1:1
+		 * IOVA mapping to that physical memory.
 		 */
 		if (of_property_present(it.node, "reg")) {
 			err = of_address_to_resource(it.node, 0, &phys);
@@ -226,11 +337,11 @@ void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
 					it.node, err);
 				continue;
 			}
-		}
-
-		maps = of_get_property(it.node, "iommu-addresses", &size);
-		if (!maps)
+		} else {
+			dev_err(dev, "%pOF: iommu-addresses requires a reg property\n",
+				it.node);
 			continue;
+		}
 
 		end = maps + size / sizeof(__be32);
 
@@ -258,6 +369,9 @@ void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
 				}
 				type = iommu_resv_region_get_type(dev, &phys, iova, length);
 
+				if (type != IOMMU_RESV_DIRECT)
+					continue;
+
 				region = iommu_alloc_resv_region(iova, length, prot, type,
 								 GFP_KERNEL);
 				if (region)
@@ -265,6 +379,8 @@ void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
 			}
 		}
 	}
+
+	of_iommu_derive_resv_regions(dev, list);
 #endif
 }
 EXPORT_SYMBOL(of_iommu_get_resv_regions);

-- 
2.34.1


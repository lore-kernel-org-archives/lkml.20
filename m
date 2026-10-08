Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C18C3C8700
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 06:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791442071; cv=none; b=r7kx/6AnXmmfJZ41zOc1sFygtIpJtaeW2Pssh1k9U5Ufm1wR1Mey18++dHPqAsUny2WudEQ/Xj7aD6/3hHWB6qZwj3brJ1IKBUYBmgh7hLy+j3O+rHwi/kXV1cQGHUdilEQHSAwcKoLVXcpQDt5nRqbt01JEQX+9ULGexbB1S3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791442071; c=relaxed/simple;
	bh=80u2pAh3kUz7aM3k22MQUDFGQu6/eDakd11zKkQnXlg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e0jSxoPx3yAqUTEQDTz/GHnvp50u5n40pLGDv2vJHQ4tqqNnNStFWX9gv0b2sSd7YwEW/Gx6rVJFV4NreD1FQq3xe75O5hVgtS1oGsFGGK0292HeT36nJ7x+ISbotCJCmLNt4Th7aWMmudAWHxTWugj8w1awm4DoNWAzUG5iUKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nllrtFmY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BnIDQrgm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nllrtFmY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BnIDQrgm"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984Bhcc928685
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 06:47:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1/7KZsbA/bBQI4vWmdVz2CaKKWJjD6gB5SHU1QsuvkI=; b=nllrtFmYxX0K4LxO
	opRde25RZOXQpTiWhKsra0U1rovwhlB2fBW0igQUgaWB2cxV3pVEH3pNKFhi8S5S
	8MlqNg+QqKVnoHbCRIP1ad7PJ+5B1lvgHCDhF3etz9STYjSaxLxJZ8UgUYTFf23w
	2lvpb8SICblKu2ZddsrCFFR6MGqq12ZD7uYMkAWXmccComSBfomwbTGjq6lPdGme
	MTDkRSMQJKu3h+ECr8GF0mntrKkZqOQ42s4r3ASZgsa615ZoEoxzCOdxneX+fIAn
	oP8Gs/et04veczNvi9y42zVjBfymkj7/IGr53XuoLqRz1N+dMWedeqMHDJDtP+8G
	UFMScA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2shfu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 06:47:49 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3965ba1ba3eso6246370a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 23:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791442069; x=1792046869; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1/7KZsbA/bBQI4vWmdVz2CaKKWJjD6gB5SHU1QsuvkI=;
        b=BnIDQrgm1+p6+8YA1nP7f1GNrIURzYDe03ENLlzJ6xvdLPfQLqGDeWRtSD0aM0bDb4
         MwoqsCrNQubOTJf8OBflgXuFCm2FhPnbkWlpqpb1HZ4+/iwB+NY0yNJxtQyrxbTqDi9P
         Czjkne4ztQvqq/XWGCkIRPVRnWsqDDBEmdLURGV56VGTcW43dki3+moHpCmc42CNCFqV
         0mBr9W66Rc1vjLCBG3nLyCnd+JDWdxASetgnE/DM0Is3qybCojbaz3wD4pAzGYW1P+tQ
         1HKpCnlJdNa0c2/JLjD9lID6au1mlC3pHIxqdbhSw0++gdxu0GoK89gf+xDi5da1EM4z
         +hqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791442069; x=1792046869;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1/7KZsbA/bBQI4vWmdVz2CaKKWJjD6gB5SHU1QsuvkI=;
        b=N/Huo5JbnKNncjZpBH33xiByI1uJqY4Z5OiRbQuFgo/xiWHpj290fWc9id13jC0819
         HTdXR89UXFluVtEcA3bamfmGqeAECP8NnedoBN0qNAocSXbmDIYd1IHoBNJJsZT3xp9a
         ca8+yKU2IWDVbBz6wR4BbxQm9wp1JY4B6acQdGgm64GsuCyBY5XGw5omY49TNqSQ60HD
         epxE0kFvjRMRzf36VQOS7Hr0o4QEIk+9rO0NLHQ9IGKwgfyhNxsxT5+mJwkrQ3RBVBQF
         mQvmGVVJxr2J0xzEs4pTwERmech8mIk6F42ViwjJdNvyNEWz3HHXw9QPQaptzze+9Wo3
         rRUA==
X-Forwarded-Encrypted: i=1; AKwUvByqJnmBJikqYaudh2tcXCaXmu97rolf0pGHN7G0EdTm/ulVnjcmhDc+EBvd/Hgiak34vOzNmlKlw+g6KC0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLivigmCbun7fJLg2H3bqInP1iTneGBBsc94XFvUpo7hgDcMLSG
	D/jUBM0nC3DRRFb4vXaqPLv3WnqUc/5hQO0i+vsFm3J6MgmG2HhYhCsufmDiHw22rGJvA//AeNR
	f/4G6RR2IbK5Xi2UdoBkMgXCIoQksy9FoGTdSHYTSm8qddSd12w0pIWjMPzSMfyIAV04=
X-Gm-Gg: AYBFou0sv+dxMyITgzS3NrPwmYCATEQXM+MjUa6fU8Fw9y5O/3SAV9ZkzDplKqAlgUz
	oLT99+lfZkDBfPk9P/3Znbc91GJNK7HrSEIeLPJYXjeeW+mQt8nJus73pIHFU8Tqofz4T81cHAs
	87LQ9+JlZz9nXif0gyLQ18Bqu/QawEUSkwxv+ys1kyErzKgBgEuHxjibVjg2yzqT8TRId7XP9x1
	xA2gVPvzkqOwzU657B6inAJ8aaVuT48GqA7ddHFCSd7xj+G/wRkD2tjfaNvgpqFSNvU2SQBjtkN
	GrG7K+hQRUmk1eH0AQ6pN4+jXyjIFhXfDQf9WtG4CnQVKWyh6IotoqpcbgzxiNgyDqrWUyF6eyv
	cEVMlybwKC14tQC3bKDJRBL8MHlCkCtXa+g137eUaMADCnco6/Dxpz0o=
X-Received: by 2002:a17:90b:1a8a:b0:3a8:21e4:9584 with SMTP id 98e67ed59e1d1-3a8a15314eemr3245380a91.60.1791442068721;
        Wed, 07 Oct 2026 23:47:48 -0700 (PDT)
X-Received: by 2002:a17:90b:1a8a:b0:3a8:21e4:9584 with SMTP id 98e67ed59e1d1-3a8a15314eemr3245366a91.60.1791442068213;
        Wed, 07 Oct 2026 23:47:48 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1a254b3sm3313925a91.2.2026.10.07.23.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:47:47 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 14:41:13 +0800
Subject: [PATCH v3 4/8] cacheinfo: Expose the code to generate a cache-id
 from a device_node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-mpam-resctrl-dt-knp-support-v3-4-35196c2b43bf@oss.qualcomm.com>
References: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
In-Reply-To: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
To: James Morse <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Yin Li <yin.li@oss.qualcomm.com>, Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791442023; l=2378;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=treBZjfgVIBmtiVlLTsGxNxSnTktJbBCCAsYZ43ZZlE=;
 b=3SxhVsOuGeNgSvPZ92pETLYV0aGE3Lrja1mLwS8TGb1jJE+U8AFQP9fekEsXMRiNzDPorHWcu
 NsTLPixLPkKAmXzZ9LTTdmipd90gcTa2KYFnIBj5anxhOUkg4ybZpuZ
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNiBTYWx0ZWRfXx3v81lUap3BJ
 b515yYTkIL9f7VGnn7IrXeArwCwS9TPEfD70VeZ5+tdJpxEP/zIfcJ3+L+biY2yQ6P5sNQbOirj
 QXuuvkfQW+SMBQbK0SQ+fd+/CdM3vWo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNiBTYWx0ZWRfX+CXE8u1ciVGz
 ovpUhQABzF4qwtES9G7WZW8x942MtVP015kbUoQJ3Kd4Srn+JqQ0hT0FXWn/4YZYyFK/T2MZgZ2
 VWAaZ1jKSVQ7hKT6ZzmxYj5O3wburaAVpvxOO0dCRz2+mc8jYm8ocrlPnB6xNmH5++OIhaVG2PX
 O4ducwiyCt7YJ3OLmtVM3vflC9bs63UYBkidgA60W5GC07zYuWU7QpayMMySMhdIAthPS4X1M1x
 BXMd2l+Se157vpN7PFmJKq4z4q3NDeGw1rGjiSKZoCX4hJ+FxE1OgfA2B/ZlYWtjEegxJQYtlxO
 L1bZOOq1lsULOIYOXOW0ocOzjPOhL3SQjUbQSdBaNqVAXsMDIXTcsO0Ih40WsFoB2kVmEErPwOb
 6inThzKhRVzNH7zp0ufCwITse/YRdKo5rvOYDiejKvG4WTZtN22pw+SsJ7DrvmCyYUYdBaFZPan
 qmaNqQGbFkg+GZ1G6NA==
X-Proofpoint-ORIG-GUID: FD9GDMAaMv4z9vgJQUr35gdugjJmrsh-
X-Proofpoint-GUID: FD9GDMAaMv4z9vgJQUr35gdugjJmrsh-
X-Authority-Analysis: v=2.4 cv=CIm/zhrD c=1 sm=1 tr=0 ts=6ac73c95 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=NSEGM1D4AEf8_kYA:21 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=2UMQdz91M6SPgPM9X00A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080026

From: James Morse <james.morse@arm.com>

The MPAM driver identifies caches by id for use with resctrl. It
needs to know the cache-id when probe-ing, but the value isn't set
in cacheinfo until device_initcall(). Even after device_initcall(),
the cache-id is only available if at least one CPU associated with
the cache is online.

Instead of making the driver wait, expose the code that generates the
cache-id. The parts of the MPAM driver that run early can use this to
set up the resctrl structures before cacheinfo is ready in
device_initcall().

Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 drivers/base/cacheinfo.c  | 17 ++++++++++++-----
 include/linux/cacheinfo.h |  1 +
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index c4394baa7e53..5187535c8338 100644
--- a/drivers/base/cacheinfo.c
+++ b/drivers/base/cacheinfo.c
@@ -243,8 +243,7 @@ static bool match_cache_node(struct device_node *cpu,
 #define arch_compact_of_hwid(_x)	(_x)
 #endif
 
-static void cache_of_set_id(struct cacheinfo *this_leaf,
-			    struct device_node *cache_node)
+u32 cache_of_calculate_id(struct device_node *cache_node)
 {
 	struct device_node *cpu;
 	u32 min_id = ~0;
@@ -255,15 +254,23 @@ static void cache_of_set_id(struct cacheinfo *this_leaf,
 		id = arch_compact_of_hwid(id);
 		if (FIELD_GET(GENMASK_ULL(63, 32), id)) {
 			of_node_put(cpu);
-			return;
+			return ~0;
 		}
 
 		if (match_cache_node(cpu, cache_node))
 			min_id = min(min_id, id);
 	}
 
-	if (min_id != ~0) {
-		this_leaf->id = min_id;
+	return min_id;
+}
+
+static void cache_of_set_id(struct cacheinfo *this_leaf,
+			    struct device_node *cache_node)
+{
+	u32 id = cache_of_calculate_id(cache_node);
+
+	if (id != ~0) {
+		this_leaf->id = id;
 		this_leaf->attributes |= CACHE_ID;
 	}
 }
diff --git a/include/linux/cacheinfo.h b/include/linux/cacheinfo.h
index 56fa646df0d1..469d490968ac 100644
--- a/include/linux/cacheinfo.h
+++ b/include/linux/cacheinfo.h
@@ -114,6 +114,7 @@ int acpi_get_cache_info(unsigned int cpu,
 #endif
 
 const struct attribute_group *cache_get_priv_group(struct cacheinfo *this_leaf);
+u32 cache_of_calculate_id(struct device_node *np);
 
 /*
  * Get the cacheinfo structure for the cache associated with @cpu at

-- 
2.34.1


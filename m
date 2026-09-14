Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D317E42048E
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789378814; cv=none; b=fzo6C7K25HYx8UFe0XzvUxpW619z91SSbhzC53rJTul69BqObxvz5XWjlS4w8/oEDMlMoHk/g6h5tQL58l6ZU5QpDzTBiTg04RzcLmJJD+cg7EqcM6Um43vMe5Geh3R9wjpibi+OM9E6TtIY/MYkJkUgh6JkNZdjOJVseaJY8rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789378814; c=relaxed/simple;
	bh=N3m1XL0qPMrLpj2KyTA3YfQe/8CjzIGFh9rILUSGz/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ShHo3OOYwP5KdvC6zS8taLbo0MnXZvawxz6g57lz0qorWocng2KU1PDBNBDYlxpftCGh4PmwCaT3bP0ag7JRzjrAXbORcN8GwyR2YxlwiKrDQskpe78X/adjFLImWsmYuOndYyLNzIl5WleLhL8HCSDnKGZ4q3gv8BQ2SughoTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MswalhPg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IVucAIDG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MswalhPg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IVucAIDG"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jKaS3842723
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:40:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7DvmSimw6MjnY/L40N+LcEDCs6VLUnTtNUZQ4Z7jK70=; b=MswalhPgXrq7Zixl
	19P1QCywTTO7ETPIfcQHUw5E+pkNsUCPGnxHt83C8u5AixNCxAujo9U0EK/S1YqJ
	R9mgDmpFP7C0Lj+6d+q7nOhrPhxkHOGiBDWnnvr2Z2pbYmMYGkk7F6JOYbUYW8rv
	n1wMKRaKP56+G+XOIm4W7Ga2EJ8aWUhZMh90Cj89dGc9PhV9LVF/YTr7NVjpTbuE
	InVUxHn8xHfuUdlDbrTWJVOMVCuETDPjYHnsxTKUTaEjgxQ2VV6RVEHMXew21JXU
	I3n8mzOgseiLsTRSiwTGS5ga1NpqjbNJ9L1wSVHsfoCcVpsdnTxuwLSN4CkuNAg0
	TvelBA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c5yy4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:40:11 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so6357158a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789378810; x=1789983610; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7DvmSimw6MjnY/L40N+LcEDCs6VLUnTtNUZQ4Z7jK70=;
        b=IVucAIDGs04VAsUfbcWFZpyFTofXNJieEZkFSal9c/a14YfzSmm++9PXDAcZOQOM0O
         yyw8g3suUl+f0I6jYRpxWOMVgOHFjvgr09mfIdhpz/LzZZGSaXZgD6z4t5AgFKxnQMGn
         VVNao9ZiG1zINR+/Of8A6YMhxflHJR1EFnj/aAilSSxXR6YbuVb1iA2FP8bmnWwNwMgP
         +xPoVaD/F/zPJhUZk6zpm+k4RuG7XbyVDYpV6B8uAF4OCf7mV7I8Edr6p9Kh+gZ6tvx3
         JA8pBLLPueG8RW1P0lmjfwwYLUwKY5l5S96NOzA9O+6xaDtrRn9ivj5JbTPQpCiGxSCf
         vW6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789378810; x=1789983610;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7DvmSimw6MjnY/L40N+LcEDCs6VLUnTtNUZQ4Z7jK70=;
        b=JBm5V261isnWJ+HH4aADvKk8V47BnhAPtE1shuCxKkx7kQ5MiGhYqHwOPPWRo5e7lW
         sLwnIH4nelYh8/I5uCeTwWkZe0dfLnsQbQg6+Jk1oNcEkCHb4+pp/NgBL3NdXs7EgerC
         vTUkoyxj0RsDzQFcAaMNvwW3NU3Jt5YN0ekpK0Cq1DfBaVV45LfJwIvqwWR6NvTShWYi
         JBjyiolfkDgbNro9uF4o58Nar2Y+HqHlXq35qgSiHCiH9+s8tm3iK7qOjUZzBGrFh0D8
         PE2B/YnibgWzMPnSQeithbNIysj3UxpX+l8PCsKYd1+SUTS/LnA460kM8lYVwm9QCfMq
         MJJA==
X-Forwarded-Encrypted: i=1; AKwUvBwWx94JVmNuFGiE0/05ZciYFFOuxvbSbXjNHKexa1i+SPW/Ucaj8DkHRVnKPPXqjMsLIgiBLt+GF0m3jag=@vger.kernel.org
X-Gm-Message-State: AFuF++mqov9ilIXIO6DvtMDMEfoQ2KEHTqL6ZoHwCgLE8/0wuOHmbf4l
	ZRCB8ZwjBhQrT0DGQNO1u9VZlIPBL3aBaqSHSIVeWY+XadEKQp1So414eS9s6JpdBOXN1xV2o/z
	nlb0M9QGKTFck1znCwjDF/4tc0i9cY511PpZ577vgcYxX7tG/4OQzASQo18TMw+cotkhO3RbtI6
	g=
X-Gm-Gg: AYBFou2ELF5Mw4AuLxJGkCu7KHhy6Ha7OpPT8FSfJ3zYxrdpQfE+Y+4KCn3wG+PD+Wl
	swf2m/6Nqde5Y676ONygs/rZJ5Kn4BvwdyV3XHUeiJS3rOrfM7VRqnjSPDKElfqeBgV52YtnGTG
	xheBjriEVCu999Z85Dxg6YYl8eZvh9l9/BEYgj3za2hsFwm8+/g//ZAF9Sgmh1rzFupTvsPUXv/
	gO4waGAQpC/cYTI5d+YkYZ2bj125UbyFxk4pXCeQtPhqVWTRRW/lsq+Cvc9kBfsoGiOcfbl5xh3
	MaAzM/4ZHL/0aqBrNR1RZ6ZF/B3uk9tzYlLCTcJqESZTLkgQ++ypTfBjnTcS3rN+WWFlhWW9cM3
	6umlV6NbIxjzYjV0AkyQTfFEmBFbJEci4V1u4M1fdhlFb1db4/MELVtj4
X-Received: by 2002:a17:90b:5784:b0:39d:f7dc:61e4 with SMTP id 98e67ed59e1d1-39df7dc6273mr246892a91.9.1789378810103;
        Mon, 14 Sep 2026 02:40:10 -0700 (PDT)
X-Received: by 2002:a17:90b:5784:b0:39d:f7dc:61e4 with SMTP id 98e67ed59e1d1-39df7dc6273mr246764a91.9.1789378809464;
        Mon, 14 Sep 2026 02:40:09 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e60484sm19488728a91.4.2026.09.14.02.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:40:09 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 17:37:52 +0800
Subject: [PATCH RFC v2 04/10] cacheinfo: Expose the code to generate a
 cache-id from a device_node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-mpam-resctrl-dt-knp-support-v2-4-bf6645bb2f65@oss.qualcomm.com>
References: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
In-Reply-To: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789378762; l=2592;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=MXjxI8aXZOve7L6eY3Z0pfsNkIuJWimjX2RUSvdJo0s=;
 b=JQcH8p0AqmKiGfmEXtpcideR+t4riLV9L99EgGdmABEku5BckK3T4ae3bI4+e/TEVktBRzg2Q
 NpvKlDoiqZKC3MJi40P/aObfObcm4D3qRrfHXjEaX4rezR4jLu254fx
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-ORIG-GUID: o2J71EmLfwwECUgmi3YEmBBgH7NHK4cL
X-Proofpoint-GUID: o2J71EmLfwwECUgmi3YEmBBgH7NHK4cL
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa7c0fb cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=NSEGM1D4AEf8_kYA:21 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=YGyWITW8jF7qUHxv7J4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEzNyBTYWx0ZWRfXxQb0Zo/ftQ+h
 ksXRFbw0jqv3S80GPTlKf69DlMb77a+9/KwHBvEJKwofYncNq2FgTTEZ4WH3ju1MO5fgQ7tf6Fw
 IPenXDbdCEyvilzfRDpzSTnnqgMcVtkno2i6tsqAKsby1efn8qUPlc9DzjYGcU7m/UDxyC9Rgsn
 b/hdFZNo9HdhhRcnRoKYAqJYRMOgpwHBtnnqZ9U5RGRfdt79Ria4YOL/V4llq9dPl9HhZ3DDmCu
 icplwyOAwKhZJnDGYwcJxiTRSAZ+V3no0328FHU9x9Tz9xTSzpFX6h+c0Hb1uUEBMKtD98YOuS/
 Jmj/z3rQBhhQIJhEOKtW9oX9YQjGy84x0VrOhHZD9PMIreO1SxCS51wFx9NF+1TKsEs1RuHPqx3
 67xvintIhfzkKXORPxwNXpAw2xg2+w8BlruT0086AFNX4KQPvwrbwwBJBwOsBjBZl7RIe/A/z/L
 kF+fGfX9n96KSBC6SWw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEzNyBTYWx0ZWRfXwJf+8PNC1xVW
 zfdI/QTGpfOqtc91P9sHFIS/Iz3JN8/RX7eWq33w8Llyey2gKDQ79zZkyNPXkoami1WMhkvXVzV
 riY8+kluZrMShkLtJTDyy66l5W10AvQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140137

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
[ Yin Li: fix context conflicts in cacheinfo.c and cacheinfo.h; guard the
  cache_of_calculate_id() declaration with CONFIG_OF to prevent build
  errors when CONFIG_OF is not set ]
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 drivers/base/cacheinfo.c  | 17 ++++++++++++-----
 include/linux/cacheinfo.h |  3 +++
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index 9f9c72727a05..f75e7f64038b 100644
--- a/drivers/base/cacheinfo.c
+++ b/drivers/base/cacheinfo.c
@@ -226,8 +226,7 @@ static bool match_cache_node(struct device_node *cpu,
 #define arch_compact_of_hwid(_x)	(_x)
 #endif
 
-static void cache_of_set_id(struct cacheinfo *this_leaf,
-			    struct device_node *cache_node)
+u32 cache_of_calculate_id(struct device_node *cache_node)
 {
 	struct device_node *cpu;
 	u32 min_id = ~0;
@@ -238,15 +237,23 @@ static void cache_of_set_id(struct cacheinfo *this_leaf,
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
index fc879ac4cc4f..c33bb3c8bd63 100644
--- a/include/linux/cacheinfo.h
+++ b/include/linux/cacheinfo.h
@@ -113,6 +113,9 @@ int acpi_get_cache_info(unsigned int cpu,
 #endif
 
 const struct attribute_group *cache_get_priv_group(struct cacheinfo *this_leaf);
+#ifdef CONFIG_OF
+u32 cache_of_calculate_id(struct device_node *np);
+#endif
 
 /*
  * Get the cacheinfo structure for the cache associated with @cpu at

-- 
2.34.1


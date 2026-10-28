Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793188094;
	b=Rzha9Q1SUj7rIvkiuNUWPl1VfxDtkk9i9PaaI5c5HDfZx3Pr9GuaCkBuIC8wFHc5nKGl
	 H2R873byztoJ8wzBM07KoDjPrfzAjtwe1D2DK01ZCzcPVAfMXdcPcpdPzdNeVRwGhpMkd
	 2+gtug0oot//EaBOee9a2TxWC++/UZszopuWYDKZ8zrE3YE/cVZkXq+Tpl4huzSc7/FaO
	 pAvCHjlyax8xIS3dAd3OlSUYS51aVsbvpfg2Q06SgIUuk0TtuC/cC9a6I5O0qqHOsatAJ
	 vx90jLOs0D05RX4oXEtFcgKaEqHxMjnfCe6Z/W/SRRob2jxPT1gzT0p3RyPSO85O9iA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793188094;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+/p54A/2e4hZFHcid+4VCDQ25Z8tHYviReY8MS3Eaow=;
	b=Tyc2csgmkc3tK+nt7/O2opG3hI6lkl1+M/yuwg5coU4sV26DFevNeOgUk31HI87Wocw1
	 dhUp9cKIDgQhatSloEpm1efLnoQQE6Ibb7hIloTzWnHR44fUgX01TPcehhg0e81ZLxeIB
	 ETYmlgI7nnGAyaTwaL/Ow6rO32oMOx2X+Eliim0ZRLc0Sa33eQRX0MPjcfmRQ9mGv6GAO
	 IXGjwXRyv7Rj6DKF1IcoIlLzkxWwgCr/L1gmXMmJ7TPjzZfzq/jJPhvD5/G3ALnCi106B
	 VojP11WIw4I7br4ur6cWEJtxnUqHeeLnEATC2os/NKBeFAxNKlNg24WPT90sxHFC2eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aXsC2ItG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JiV3V4g5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A18C606A330
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:48:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A18C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aXsC2ItG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JiV3V4g5
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe4Ws1538987
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:48:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+/p54A/2e4hZFHcid+4VCDQ25Z8tHYviReY8MS3Eaow=; b=aXsC2ItG8FlL+JE9
	KAC2z5roNxozGt8CsUW+hq6elaEKAV/ncRmKYtMZPRCnPkDPs2TTuZ2OiGK+giQA
	b52xmXp2aIVv1zqXg4QlS5N3m5ab8Y8YdUaeRtgIg/hIVu9zpzJL0qUskj1AXMo9
	y6I3KADqPUEsGzxWv8wKderFC9PTw5zhGFUC1NJkuCQU/tMjHzuszpo3wlsS5nb+
	jYfWcgqvGgoLTHX+85QB5NOCAVt5SjguJ4+WRNOgeoHQS3+u9uzXjXTVjNjTShlO
	OlWla+SI/vc4PNEPHSSDOJ0oVZyi4lfe1Rw+rw8nogqigfJ+0lbfgzKs00x2aObz
	a8GDQQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdf7rqpc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:48:12 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ea0fe07201so5864745ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793188092; x=1793792892; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+/p54A/2e4hZFHcid+4VCDQ25Z8tHYviReY8MS3Eaow=;
        b=JiV3V4g5Oio2/IJHLh8nJpM+HoCchbN4wAewaN9moG4IUm39d4Z1nWZSPBKiH2cCrb
         8IwpG2rxhLEzl9sttRZECR/6SUPBCiASC3fxKMz/Y+6vKu7p1KAOBeICSzlWqNx+AIsy
         mjTOt8vo3v50EhS/oyy4riTgJdrC0y6KGOUmRMjT07GCm76eotbLMe9ULe4sJIjUXfjI
         JYNjmkRY+feTFyfwol3ZPFGgciiUHheMrQTYZtZBeRgLkK+lDw0xMEfndDTJd4t2LWGJ
         YXVRyLi+/pjrgENl/v6gp7Tgzlld3EoZhDUQIiIVnKr0xBGKZtlZ+vlQf2uYmOKELtA4
         VoDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793188092; x=1793792892;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+/p54A/2e4hZFHcid+4VCDQ25Z8tHYviReY8MS3Eaow=;
        b=xIy7AVvi3rnG5MRLU1D1Lbtr18Mw63nw4T9XyDLS9I2fpeoVbKB70K3LrP8MVtpvcG
         a0bkSr9xYaderJSxiHpe5EFDqR5GH6JNp3AMP144O5KqTD6BYhskzvhGFYTolxbB/E4o
         T4xhqA/ssX8+YooPOtEA3ihlAZdg/xpQjTg6VQBj5hwy1XjpoJg48xalUgTpqqpHiKOM
         /Z+2MwazK1Tv3p7a6uigPzECkyTr/sqdkPdMSeLlMhZ9e4mxQ2V72M+xeaxWtKu5eLLD
         StnemOqp5vDI69tzlqWkstP8Rm1XZOWJ34JB8XB3YuiJte1zKZXwpcVnLiivK+wgqtoX
         LoNA==
X-Forwarded-Encrypted: i=1; AKwUvBwiBFC/E3G3HDEApryCtKbVIN5y7SeGqPgrULOUjOcuZMQ+qXUlCxXAfv2ug2ujfn/l6So6wlGCL/6pQ6I=@vger.kernel.org
X-Gm-Message-State: AFq9FYLV3IfgmnJ08U7LhmEzPexlrdZ3Tt6pg0gzVEULt+y+VoYMdR6N
	MdowQ6NSoHfygGuJRKqIjsfOcN8kSVSHhwTVVt9qELP8n0tAMwsotwG21zwkYhAv4MOc9hPv/s6
	Mn7PgWm75HVhP9tLB4YL2jmy4+WwM/OyRTJunXUXInIYIAOTzIBGlWDlnJvVbc6O8HlA=
X-Gm-Gg: AYBFou2JMRh7+S2Q0A2nlLRJzeWMyF3C4FhccasOOCEriF0La+7fuT2kMWOwb0jRk6s
	h9QVWYidheXQnWNh/QHX6jGg9anS1yWPQR9VV9xdv24XuMzDQcmhpqVrFohYdA/SRH6RvkFhlpq
	MRTMilAFkD7ZYGFYoXCw6sr6Hz19XtqT27c/fnkvNfe4Q7Q6rypQxJKaGd6jGUSbL/eZnomAmpa
	I3LWXCiX32tHBTxQilE5OW/JRHYDrGkRPe8U7rK9lh+g2znREw/kJ4cuGHepATHaBj+jmd/yIoO
	OaQOvQ064qCBzNCIhKMQlvaT1z4722AgqQtI/079VG5ufBwY55u9MO3QMjaWkQjIafizmmLE68e
	aBousjdAOErfrq8A8wzg+6cnC5Ua40gSp4J6SwTBTW43ZOEAmExvQSVamacHdvsLSjwJNauVUqi
	3+ypz0lPMT+iiZfeKrbG01hOJ4dm2T
X-Received: by 2002:a17:903:2c06:b0:2e2:dfe4:adab with SMTP id d9443c01a7336-2eb003ffe11mr18527415ad.10.1793188091903;
        Wed, 28 Oct 2026 04:48:11 -0700 (PDT)
X-Received: by 2002:a17:903:2c06:b0:2e2:dfe4:adab with SMTP id d9443c01a7336-2eb003ffe11mr18527115ad.10.1793188091411;
        Wed, 28 Oct 2026 04:48:11 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c37551sm21207715ad.51.2026.10.28.04.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:48:10 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 19:45:44 +0800
Subject: [PATCH v4 4/6] cacheinfo: Expose the code to generate a cache-id
 from a device_node
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
Message-Id: <20261028-mpam-resctrl-dt-knp-support-v4-4-bdda1e445cba@oss.qualcomm.com>
References: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
In-Reply-To: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793188047; l=2378;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=cuphFizeBCUAPOmTA5mjgloZDLbPkPyZqyfKN0YBZdI=;
 b=n/XKEt2Df/QRRSl8LRoUZx320ZarsgT1ChUAkMLf5iPokWhJmxBSvVq8VNfkWiupCG8INUGKV
 UphnCzwL5k6Cf+mbzj5Cf+NoXIJ7fNZzyfax3mT22Nr/pOTnN1hhPEm
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Authority-Analysis: v=2.4 cv=M4bYuCws c=1 sm=1 tr=0 ts=6ae1e0fc cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=NSEGM1D4AEf8_kYA:21 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=2UMQdz91M6SPgPM9X00A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: riFK0jhF_hOvTb0pNuHHKbntrG3H-VjJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0NiBTYWx0ZWRfX22b6y8E45YWT
 yfh0ZSem1DAzc7m82Qy7Zrn6pnsYpkykgkDWvz3oW9IdahXoReYzXdNzZdRdCrzuPZXrQyg2WvM
 XaXWQ8dPuCxckRwgeZPgLFJajF/PK5U=
X-Proofpoint-ORIG-GUID: riFK0jhF_hOvTb0pNuHHKbntrG3H-VjJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0NiBTYWx0ZWRfX8B86Z6TRjLTe
 QGb1+9TNPL+t/Wr2mU7iASPy4O+JRdyiXETL+RO6/ScbHJ2iHHoA+YGhTHoiM7retOptPTYXOJE
 ozI0fu37iI2V2gCdgSqAWMPZBgTGYX1OPuv2o3zhRcvz3Uf8laoIj7+U2spa2lvU0RGrjLf+id6
 6wMHpgo0eMKwdJhRiAPYXY9dzScBBWHesW3k3+q/RsGKPKw/DCpl6qVdKKX3Ya/jx0UUqS5EdR2
 jhlmeUauktGwyKskC+IaGH93Alp62a7BbdEvxZs0//FappQUViiGRBZPXkTfJqtDNks5lrwcSxu
 BwFbsHjTW0Bn3sCVli037jvV4WxkHRvvyprX8xeVBh18+T8MENxrrfsSkq1gvhHOYCdSc52IOqm
 snlBIrLqvbwUuht5uBwuKxsyUoD1jxk9u6bAnN+BRAbzux3nbkNpqDG/lZaujCNRx+BeI7aNOeV
 iiqNjBLHwPOn62zM1sA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280046

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
index eb8a907f6d50..a4b10f3a9007 100644
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


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794218877;
	b=H1xCBosHemeHlmp6rtAqPVcxEROK+1d3jVApDWaGhlHHEMyZRCgM0JrCTlSjwoGlSj5o
	 /cCwv5ZCP1iXzPaQTuKckecO7xQ8boF0SqoOYFSILidqve1gwM65frweiks65QAhYjE6k
	 iiDkm+Lpi6LegJjejyEVnYU7cVEwiuTG3zdQXszur+i//i3EsolgoGCz2RKyaVwVmNFKc
	 OyEd3o+Cia9SijhQZ6vgUOMeRUp7JZn0KMEWWkh3pQtpLf/qN/YQJYLqT3mTJFTFxIe1F
	 hZCOgXkUMLZFx/ZhiOHVl8IwfP+io0K7Lpi+nUsvPbK8p9GR6hX2lFebcuWXoXoOOog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218877;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=V5PvQ547tCbmN/8YeX1jE2VPCAQUuSRfUS1P0am1dBo=;
	b=ebm+BwAI2XB1xwUFDD4CbRfnjZzXBrOMBrZpX9ITJ/h5XofkJucmn8mScItwGWRIXst8
	 L4PmOYxxZK2/W2TtJYNha1LHW27Cwh6cSNuGHgigop6RNRP7uJLynR3ioD/73MxbPA2ih
	 MLn566+ki6WiqaA9CWz0fQTqJrIdmyeUGh9+8c1Wf3uruwBZNDLyhAvSostm3/4lG6ISU
	 eEAEnUOOODDJTV10MX01dN/g5eCmcqXZhsxzsyel1e5WuLKAufFXdHTYM3odi5zSt/8a8
	 hiJiymlSC9+729zdVlvCg2A+FlZn9T4OxC74H8s81Ptn9eh1XMO2NqGWYAey1n9VWqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mUgCcZ1Z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D+9ax2HP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F11606EE8A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 10:07:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58F11606EE8A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mUgCcZ1Z;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D+9ax2HP
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99v5Jb561972
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 10:07:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V5PvQ547tCbmN/8YeX1jE2VPCAQUuSRfUS1P0am1dBo=; b=mUgCcZ1ZRWoKvmHO
	j/Fm5YaB3IJT5WlIYk8idCUh0iMklsVJ1rv59FcS7XRV41k91hpDwOLKyVzAZt3p
	Hlw4kS2TpwDDRUZQK/2tvRwhOazkHNlHkCpeuLopG1uSeTQxmS/fKx2FWdv8nR2T
	fvV82pQX7JpE70T4pGSzQh3DKk/BqxElC/w/P1D3JwXzFW6P17GtiKTe2x0maBkl
	iH7zHB73rB3D4RgtSrQv4sisXwU/TT//s4l9Vv/ASgUlkxm/DHo/+ipajS1/iEF3
	z0a1pRYQ0cEDNLB3lQCa+ds7670p3AOHd3DQyAEXZd+SNRvlMpvrXZ6jf0bGvqoR
	BCK8Qg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsujxdvvy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 10:07:55 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdaf2073b0cso435220a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 02:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794218875; x=1794823675; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V5PvQ547tCbmN/8YeX1jE2VPCAQUuSRfUS1P0am1dBo=;
        b=D+9ax2HPIHjTXZ7pQJ43udQipu22S3zEdecNdpcCW9hJRCp8rerFALvHVRNHSYqEfU
         gzO+CJ/n/X9ef2LBd8qVWcAgn8Dc1D4AZMnAJMTHQGyOmufR4A4o/g+vpTpgZAfhfoOd
         gXyJgzVNFptDOcZ5pyIojTedjeNpWezSDUvE+ppHE1INUUYYwDxLQaXv5u+ykNELUsjN
         C3gP7I8v+GEfJrbp8ZdW+ta6JFfc5jnpQjjLC9pnAYBySvpy0quyV89b+nLOjqbwKqNz
         iaYLfNPgYWqkUnBIK4waC3d02MCo4GWoY1nUVLVMhdMWmEgc/bm/dIC7zU2AXOlKvyhn
         1oAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794218875; x=1794823675;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V5PvQ547tCbmN/8YeX1jE2VPCAQUuSRfUS1P0am1dBo=;
        b=RtZQkEhTKFKdG7IKhFoAkXJwUdNB3Z6OOdVtZW7Dlqr09qtzNJKUsEXghwTc71AB7m
         LynmGZ5MUdPsi93ZNvDiyBLkkNVhWX1dLwzA2HpCUno5ZJLUHjrQBVNvkJlvyAuMczun
         2JbePFPsOjYsxG7eVcx14sQBvaF1IFy8fubAMBaOsalRRvRsSeeUsnjUnQeo/VzXNWyq
         eIdum2WRxSw/b/wGkZlGS0XRjK9etiqMmzuZUeXaIJMYYz1SEA5IHir2gZ1kpfekQM0f
         rA7ypzICGbpZylAuN25IUSNgl+rlp70BpExS7hlK3slutF7Q/U16jY5UN3U46SNdtepn
         0Ywg==
X-Forwarded-Encrypted: i=1; AL+hErETwOLLJGZxb30SIYRA5Vo2GuysErYQ1mencKzZJPe9HC20J+T5nnpqqE2keEO49KxiN/28If8VgpI2Ldo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+iYmHkdPiU1x4Raav6fhpLHJ1YoASvAmY8+f1W4iJhh/kyO/Wo
	F5YNGSzMecw0H8DmTA8TDSdSoYDRLP1wI5WGNb0+sFJWg/w61NS0RV8/uT1qljfyLjgNjOdGtuz
	4IiSPfU55UXfXoslYY0GPm1+NUdjKvMo/esROxyOC8XK9jauNcBaAMQiWkAUqoo3mowM=
X-Gm-Gg: AYBFou1a9SqSEORiETQCzri4k2BKNYBU8ZF6MLF0eMqO6uaIEQGy//LnputIO6i9T9W
	2Ms+z4F4A1lNllcTCYOyfiJwRCOGCw66sK143ECx8kzAqKoz4R/wPRzMOFFX3FilJf7uCnKl3Bp
	1t38pe57cD/eGEoWbqrokeKgxHArJ+hOlP6uyyZrf1UZWo9T8wiolRJMGDZ2vq1u06VHQsyA0bt
	eD4Sh/B3hWY87ma1jZCxWyulYYLc/lCruP4eHh6WpOmN9L4ul+yp2CRagrCwmJrO+V/SBZLyw/n
	zmEFEUWqdKNiXmGrcct84Ua9f3F8VerI9oK7c6tHu5e/8KpLg8qccGiChcVvxiBaV9Ffwnev/hN
	lGkPSYcGXlOrZHh7KDHO0C3UWv2WoAz1BSDgK6tUqpDynBIs2BVFtWnEa+H8wy+yNK7kVMti+2a
	2ArRZEKFT/pHjvo8B38KdBZ/rAXzOA
X-Received: by 2002:a17:90b:3c8d:b0:3aa:ff61:9504 with SMTP id 98e67ed59e1d1-3b12d2bf30amr3000942a91.20.1794218874779;
        Mon, 09 Nov 2026 02:07:54 -0800 (PST)
X-Received: by 2002:a17:90b:3c8d:b0:3aa:ff61:9504 with SMTP id 98e67ed59e1d1-3b12d2bf30amr3000904a91.20.1794218874240;
        Mon, 09 Nov 2026 02:07:54 -0800 (PST)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1054a53e4sm10034531a91.0.2026.11.09.02.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:07:53 -0800 (PST)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 18:05:37 +0800
Subject: [PATCH v5 5/7] arm_mpam: Add device tree support for MSC probing
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
Message-Id: <20261109-mpam-resctrl-dt-knp-support-v5-5-150335a79381@oss.qualcomm.com>
References: <20261109-mpam-resctrl-dt-knp-support-v5-0-150335a79381@oss.qualcomm.com>
In-Reply-To: <20261109-mpam-resctrl-dt-knp-support-v5-0-150335a79381@oss.qualcomm.com>
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
        devicetree@vger.kernel.org, Ping Li <leeonion.muyu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794218818; l=10837;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=DgDf8h8LQcisx9TI34NkwE8vhFdiwEpuzjsJQeN2wKs=;
 b=3EOoCA4OU9fr+HUGLOhfRR5EZ5OIcSoBpJ76+97c6bZDTgeDR+jmWFAHyHQr0j3982CHwbIlf
 rT93f/U07JkCfXgGZN0E8DrRKu7eVeJwFtV1gIWHidE7Dx4yxyfOxw8
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-GUID: N_GRE3WsUpHPpEY_ab3JRh11WyuZ-VDR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0MCBTYWx0ZWRfX2pXE4R9DresR
 iHNE3qhDZcQ4ZT7wmBRFJVl2kI/kui1Vem4qqRNAsIyaq4Nshynh3DOw8i+zRrLiZvvL9W5RWwS
 4bhO54JFoZXN00L+nce6ekrSwiwnsst4qn7AEDo8Y1K6xMMvdJKD7Uv9dXV6s6rqoT6hrORF3S0
 +kYOFFAFygkwez0/7t8z1dzG/zuWi/veA0gszEK/Q2k3i4FhK1v/DPrD2dASzS37KUUuq+u2887
 L1LjPTkLAW7LoQaScI1uBHxL31Eipy0r679x4paCU1Tf7arDMMQqgzMncc3kBHnHg2QoaU/9lKB
 gBjscxzG8eLjuIGHK6sRbqk45i7kG8yu3Pfm2BXhJ9ofQNJXYRd2PEZauQOFvp/k21vG4xmMUTM
 wQx/2vt/Sdnx1ljV2HEaUEVSsWPAJEHzkK9BFU4MrK3tz7fjAnY0CRSJFLduo3oI9s9V9G0Cnkh
 B1J6PmY98we4QIV2SfA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0MCBTYWx0ZWRfXxdn1dBTRzPZs
 H/6qppLBTalgu7AsSs6Bq65Jswf5N+sNpR0P6GBjJSytKMq7oRxY8qIxpraeD93TUgtHvS3olYo
 0zh7/NkwrNQs7NKgIZDOCFAyo4uMpn4=
X-Authority-Analysis: v=2.4 cv=TeIDJhQh c=1 sm=1 tr=0 ts=6af19b7c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=-Bf8dWPtDk6FBw2lJ3EA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: N_GRE3WsUpHPpEY_ab3JRh11WyuZ-VDR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090040

From: James Morse <james.morse@arm.com>

The MPAM driver currently discovers MSCs only via ACPI. Add a device
tree path so MSCs can be probed on DT-based platforms: parse MSC nodes
from the device tree, compute cache-id and affinity from the cache
nodes and create the RIS entries.

Signed-off-by: James Morse <james.morse@arm.com>
[ Yin Li: drop the ACPI-only stub of mpam_get_cpumask_from_cache_id();
  use of_node_get() for the cache parent to avoid a refcount underflow;
  reject out-of-range ris_idx after of_property_read_reg() before
  narrowing to u8; use u32 instead of unsigned long for cache-id values
  and compare against ~0U; fix mpam_dt_create_foundling_msc() to iterate
  MSC child nodes rather than creating a device for the cache node itself ]
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 drivers/resctrl/mpam_devices.c  | 250 +++++++++++++++++++++++++++++++++++++---
 drivers/resctrl/mpam_internal.h |   2 +-
 2 files changed, 234 insertions(+), 18 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index bea231dac7e6..78caa8ae1349 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -22,6 +22,9 @@
 #include <linux/lockdep.h>
 #include <linux/mailbox_client.h>
 #include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/printk.h>
 #include <linux/property.h>
@@ -263,6 +266,171 @@ static void mpam_free_garbage(void)
 	}
 }
 
+/* Called recursively to walk the list of caches from a particular CPU */
+static void __mpam_get_cpumask_from_cache_id(int cpu, struct device_node *cache_node,
+					     u32 cache_id,
+					     u32 cache_level,
+					     cpumask_t *affinity)
+{
+	int err;
+	u32 iter_level;
+	u32 iter_cache_id;
+	struct device_node *iter_node __free(device_node) = of_find_next_cache_node(cache_node);
+
+	if (!iter_node)
+		return;
+
+	err = of_property_read_u32(iter_node, "cache-level", &iter_level);
+	if (err)
+		return;
+
+	/*
+	 * get_cpu_cacheinfo_id() isn't ready until sometime
+	 * during device_initcall(). Use cache_of_calculate_id().
+	 */
+	iter_cache_id = cache_of_calculate_id(iter_node);
+	if (iter_cache_id == ~0U)
+		return;
+
+	if (iter_level == cache_level && iter_cache_id == cache_id)
+		cpumask_set_cpu(cpu, affinity);
+
+	if (iter_level < cache_level)
+		__mpam_get_cpumask_from_cache_id(cpu, iter_node, cache_id,
+						 cache_level, affinity);
+}
+
+/*
+ * The cacheinfo structures are only populated when CPUs are online.
+ * This helper walks the device tree to include offline CPUs too.
+ */
+int mpam_get_cpumask_from_cache_id(u32 cache_id, u32 cache_level,
+				   cpumask_t *affinity)
+{
+	int cpu;
+
+	if (!acpi_disabled)
+		return acpi_pptt_get_cpumask_from_cache_id(cache_id, affinity);
+
+	for_each_possible_cpu(cpu) {
+		struct device_node *cpu_node __free(device_node) = of_get_cpu_node(cpu, NULL);
+		if (!cpu_node) {
+			pr_err("Failed to find cpu%d device node\n", cpu);
+			return -ENOENT;
+		}
+
+		__mpam_get_cpumask_from_cache_id(cpu, cpu_node, cache_id,
+						 cache_level, affinity);
+	}
+
+	return 0;
+}
+
+static int get_cpumask_from_cache(struct device_node *cache,
+				  cpumask_t *affinity)
+{
+	int err;
+	u32 cache_level;
+	u32 cache_id;
+
+	err = of_property_read_u32(cache, "cache-level", &cache_level);
+	if (err) {
+		pr_err("Failed to read cache-level from cache node\n");
+		return -ENOENT;
+	}
+
+	cache_id = cache_of_calculate_id(cache);
+	if (cache_id == ~0U) {
+		pr_err("Failed to calculate cache-id from cache node\n");
+		return -ENOENT;
+	}
+
+	return mpam_get_cpumask_from_cache_id(cache_id, cache_level, affinity);
+}
+
+static int mpam_dt_count_msc(void)
+{
+	int count = 0;
+	struct device_node *np;
+
+	for_each_compatible_node(np, NULL, "arm,mpam-msc") {
+		if (of_device_is_available(np))
+			count++;
+	}
+
+	return count;
+}
+
+static int mpam_dt_parse_resource(struct mpam_msc *msc, struct device_node *np,
+				  u8 ris_idx)
+{
+	int err = 0;
+	u32 level = 0;
+	u32 cache_id;
+	struct device *dev = &msc->pdev->dev;
+	struct device_node *cache __free(device_node) = NULL;
+	struct device_node *parent __free(device_node) = of_get_parent(np);
+
+	if (of_device_is_compatible(np, "arm,mpam-cache")) {
+		cache = of_parse_phandle(np, "arm,mpam-device", 0);
+		if (!cache) {
+			dev_err_once(dev, "Failed to read phandle\n");
+			return -EINVAL;
+		}
+	} else if (of_device_is_compatible(parent, "cache")) {
+		cache = of_node_get(parent);
+	} else {
+		/* For now, only caches are supported */
+		cache = NULL;
+		return err;
+	}
+
+	err = of_property_read_u32(cache, "cache-level", &level);
+	if (err) {
+		dev_err_once(dev, "Failed to read cache-level\n");
+		return err;
+	}
+
+	cache_id = cache_of_calculate_id(cache);
+	if (cache_id == ~0U) {
+		dev_err_once(dev, "Failed to calculate cache-id\n");
+		return -ENOENT;
+	}
+
+	return mpam_ris_create(msc, ris_idx, MPAM_CLASS_CACHE, level, cache_id);
+}
+
+static int mpam_dt_parse_resources(struct mpam_msc *msc, void *ignored)
+{
+	u64 ris_idx = 0;
+	int err, num_ris = 0;
+	struct device_node *np;
+
+	np = msc->pdev->dev.of_node;
+	for_each_available_child_of_node_scoped(np, iter) {
+		err = of_property_read_reg(iter, 0, &ris_idx, NULL);
+		if (!err) {
+			/*
+			 * ris_idx is read as u64 but indexes a 4-bit RIS selector
+			 * (0..MPAM_MSC_MAX_NUM_RIS). Reject out-of-range values here,
+			 * before it is narrowed to u8, so a large value cannot be
+			 * truncated into a valid-looking index.
+			 */
+			if (ris_idx >= MPAM_MSC_MAX_NUM_RIS)
+				return -EINVAL;
+			num_ris++;
+			err = mpam_dt_parse_resource(msc, iter, ris_idx);
+			if (err)
+				return err;
+		}
+	}
+
+	if (!num_ris)
+		err = mpam_dt_parse_resource(msc, np, 0);
+
+	return err;
+}
+
 /*
  * Once mpam is enabled, new requestors cannot further reduce the available
  * partid. Assert that the size is fixed, and new requestors will be turned
@@ -629,16 +797,6 @@ mpam_vmsc_find(struct mpam_component *comp, struct mpam_msc *msc)
 	return mpam_vmsc_alloc(comp, msc);
 }
 
-/*
- * The cacheinfo structures are only populated when CPUs are online.
- * This helper walks the acpi tables to include offline CPUs too.
- */
-int mpam_get_cpumask_from_cache_id(unsigned long cache_id, u32 cache_level,
-				   cpumask_t *affinity)
-{
-	return acpi_pptt_get_cpumask_from_cache_id(cache_id, affinity);
-}
-
 /*
  * cpumask_of_node() only knows about online CPUs. This can't tell us whether
  * a class is represented on all possible CPUs.
@@ -2392,15 +2550,34 @@ static int mpam_msc_setup_error_irq(struct mpam_msc *msc)
  */
 static void update_msc_accessibility(struct mpam_msc *msc)
 {
+	struct device *dev = &msc->pdev->dev;
+	struct device_node *parent;
 	u32 affinity_id;
 	int err;
 
-	err = device_property_read_u32(&msc->pdev->dev, "cpu_affinity",
-				       &affinity_id);
-	if (err)
+	if (!acpi_disabled) {
+		err = device_property_read_u32(&msc->pdev->dev, "cpu_affinity",
+					       &affinity_id);
+		if (err)
+			cpumask_copy(&msc->accessibility, cpu_possible_mask);
+		else
+			acpi_pptt_get_cpus_from_container(affinity_id,
+							  &msc->accessibility);
+
+		return;
+	}
+
+	/* Where an MSC can be accessed from depends on the path to of_node. */
+	parent = of_get_parent(msc->pdev->dev.of_node);
+	if (parent == of_root) {
 		cpumask_copy(&msc->accessibility, cpu_possible_mask);
-	else
-		acpi_pptt_get_cpus_from_container(affinity_id, &msc->accessibility);
+	} else {
+		if (of_device_is_compatible(parent, "cache"))
+			get_cpumask_from_cache(parent, &msc->accessibility);
+		else
+			dev_err_once(dev, "Cannot determine accessibility of MSC.\n");
+	}
+	of_node_put(parent);
 }
 
 /*
@@ -2561,7 +2738,10 @@ static int mpam_msc_drv_probe(struct platform_device *pdev)
 		return PTR_ERR(msc);
 
 	/* Create RIS entries described by firmware */
-	err = acpi_mpam_parse_resources(msc, plat_data);
+	if (!acpi_disabled)
+		err = acpi_mpam_parse_resources(msc, plat_data);
+	else
+		err = mpam_dt_parse_resources(msc, plat_data);
 	if (err) {
 		mpam_msc_drv_remove(pdev);
 		return err;
@@ -2574,15 +2754,45 @@ static int mpam_msc_drv_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct of_device_id mpam_of_match[] = {
+	{ .compatible = "arm,mpam-msc", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, mpam_of_match);
+
 static struct platform_driver mpam_msc_driver = {
 	.driver = {
 		.name = "mpam_msc",
 		.suppress_bind_attrs = true,
+		.of_match_table = of_match_ptr(mpam_of_match),
 	},
 	.probe = mpam_msc_drv_probe,
 	.remove = mpam_msc_drv_remove,
 };
 
+/*
+ * MSCs that are declared by the firmware as being part of a cache may not
+ * be created automatically as platform devices, since there is no
+ * dedicated cache driver.
+ *
+ * Deal with theo MSCs here.
+ */
+static void mpam_dt_create_foundling_msc(void)
+{
+	for_each_compatible_node_scoped(cache, NULL, "cache") {
+		for_each_child_of_node_scoped(cache, child) {
+			if (!of_match_node(mpam_of_match, child))
+				continue;
+			if (!of_device_is_available(child))
+				continue;
+			if (of_node_check_flag(child, OF_POPULATED))
+				continue;
+			if (!of_platform_device_create(child, NULL, NULL))
+				pr_err("Failed to create MSC device for %pOF\n", child);
+		}
+	}
+}
+
 /* Any of these features mean the BWA_WD field is valid. */
 static bool mpam_has_bwa_wd_feature(struct mpam_props *props)
 {
@@ -3455,12 +3665,18 @@ static int __init mpam_msc_driver_init(void)
 
 	init_srcu_struct(&mpam_srcu);
 
-	fw_num_msc = acpi_mpam_count_msc();
+	if (!acpi_disabled)
+		fw_num_msc = acpi_mpam_count_msc();
+	else
+		fw_num_msc = mpam_dt_count_msc();
 	if (fw_num_msc <= 0) {
 		pr_err("No MSC devices found in firmware\n");
 		return -EINVAL;
 	}
 
+	if (acpi_disabled)
+		mpam_dt_create_foundling_msc();
+
 	return platform_driver_register(&mpam_msc_driver);
 }
 
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index 1f86cc158100..cd122f308eab 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -519,7 +519,7 @@ int mpam_msmon_read(struct mpam_component *comp, struct mon_cfg *ctx,
 		    enum mpam_device_features, u64 *val);
 void mpam_msmon_reset_mbwu(struct mpam_component *comp, struct mon_cfg *ctx);
 
-int mpam_get_cpumask_from_cache_id(unsigned long cache_id, u32 cache_level,
+int mpam_get_cpumask_from_cache_id(u32 cache_id, u32 cache_level,
 				   cpumask_t *affinity);
 
 #ifdef CONFIG_RESCTRL_FS

-- 
2.34.1


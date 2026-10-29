Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793277415;
	b=dNkB7XDnVG0I7PdTS4AJjMzu1uN3FXct2Z8hvdD9Tz61E/xkNQG1RIZ5VG6fww7sK1qX
	 EReSgUs6XhCwITJvZeqwq1z34l5xdCKmmYfuYJe3KHE9wW1jiovj38NJpNHoGxbVw2rr4
	 ETCOUl5/k7fK3edluHQCmt8iqc7MnJzG5neXxu9nG16WzaSLdgclI1iQiSGV3FyxwRiEK
	 9QzkIopgEuG7RXQXfRAQGWBtYs7448fpHleCSQv6K9XmZ5CqAi6Bl94iNnUGM4O161yVK
	 twCt9x95bNk0YUfVEMGcLlNdNUO9UYMtmitSOBcOc5tuaLvXuLDvcsg2v3ErEydSvoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793277415;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=VfH9B+E9dqXOIB2s/gv1jCxzMLtqQkhz9uQML4pHmeg=;
	b=0WEjfFIy8zzc/yyeQqi4L/TpmkdASfg6xqcRW+K8MKM/HmMNDp0zpoLuIqgYHdOw4Syk
	 ITxyq9RWQCMGRZjo74QM50lJmmkFZTTg43uu5Ae5nQRE8WTwrT2zhaNwU512zdRs+IA4+
	 /2dJCzvgFYBNrci9oYiixiQdLV9KlX9CSq5oNXmlcDyoOBE3819aM9rofvDTJENaKB0Da
	 ipsdKdCsIPMCKCIig++rH5+N/3h6Zob46yJ55VQNLeuBkOI2Jz4Cm4Fl9/KjDQtM32Y6h
	 F6rDTz8ChEVzDi7opQOSwpCTgS6WxhKM/TItdbeYEYzqK+Po90PFMJ1S9CrOvk0bo6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b="A2JKsc/p";
	arc=none smtp.remote-ip=113.46.200.226
Received: from canpmsgout11.his.huawei.com (canpmsgout11.his.huawei.com [113.46.200.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305B0606A33A;
	Thu, 29 Oct 2026 12:36:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 305B0606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=A2JKsc/p
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=VfH9B+E9dqXOIB2s/gv1jCxzMLtqQkhz9uQML4pHmeg=;
	b=A2JKsc/p2rsqvUX25OEKjQiwuKAh+SoR+qkwpyrmJrxqO7Lx0/+jmAEae84XT/TjUUjti0k8z
	DtvVhPH0yav8KQ21rO1HHbzyo+gFbQjZc11fx2w3Qy4+LP7AMpsjRqny85TQ1pfXhcchOLAToV+
	LX+kc9XXvjc76GNAeCrvvpY=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4jFkHt2pT4zKm61;
	Thu, 29 Oct 2026 20:36:42 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 25CFD40572;
	Thu, 29 Oct 2026 20:36:52 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 20:36:51 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <reinette.chatre@intel.com>, <james.morse@arm.com>, <ben.horgan@arm.com>,
	<fenghuay@nvidia.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<mark.rutland@arm.com>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<rdunlap@infradead.org>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<babu.moger@amd.com>, <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<tan.shaopeng@jp.fujitsu.com>, <jic23@kernel.org>, <zengheng4@huawei.com>,
	<gshan@redhat.com>, <x86@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v2 18/19] arm_mpam: resctrl: Expose the L2 monitor events
Date: Thu, 29 Oct 2026 20:36:10 +0800
Message-ID: <20261029123611.1108424-19-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261029123611.1108424-1-ruanjinjie@huawei.com>
References: <20261029123611.1108424-1-ruanjinjie@huawei.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)

Allow an L2 cache class to supply the CSU counters for l2c_occupancy and
the MBWU counters for mbm_core_bytes.

The L2 bandwidth event is a normal MBM event, so resctrl gives it a
counter for the life of the monitoring group. MBWU needs that: rewriting
the PARTID/PMG filter restarts the byte count, so the filter must stay
in place while traffic is counted. CSU occupancy is only a snapshot and
can still borrow a monitor for each read.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/resctrl/mpam_resctrl.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index b9487f3c648d..62214557b673 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -1123,9 +1123,10 @@ static void mpam_resctrl_pick_counters(void)
 	guard(srcu)(&mpam_srcu);
 	list_for_each_entry_srcu(class, &mpam_classes, classes_list,
 				 srcu_read_lock_held(&mpam_srcu)) {
-		/* The name of the resource is L3... */
-		if (class->type == MPAM_CLASS_CACHE && class->level != 3) {
-			pr_debug("class %u is a cache but not the L3", class->level);
+		if (class->type == MPAM_CLASS_CACHE && class->level != 2 &&
+		    class->level != 3) {
+			pr_debug("class %u is a cache but not L2 or L3",
+				 class->level);
 			continue;
 		}
 
@@ -1145,7 +1146,10 @@ static void mpam_resctrl_pick_counters(void)
 				if (update_rmid_limits(class))
 					break;
 
-				counter_update_class(RDT_RESOURCE_L3, QOS_OCCUP_EVENT_ID, class);
+				counter_update_class(class->level == 2 ?
+						     RDT_RESOURCE_L2 :
+						     RDT_RESOURCE_L3,
+						     QOS_OCCUP_EVENT_ID, class);
 				break;
 			default:
 				break;
@@ -1169,6 +1173,14 @@ static void mpam_resctrl_pick_counters(void)
 			 */
 			counter_update_class(RDT_RESOURCE_L3, QOS_MBM_TOTAL_EVENT_ID, class);
 		}
+
+		if (class->type == MPAM_CLASS_CACHE && class->level == 2 &&
+		    class_has_usable_mbwu(class)) {
+			pr_debug("class %u has usable MBWU for the L2 resource\n",
+				 class->level);
+			counter_update_class(RDT_RESOURCE_L2,
+					     QOS_MBM_TOTAL_EVENT_ID, class);
+		}
 	}
 }
 
-- 
2.34.1


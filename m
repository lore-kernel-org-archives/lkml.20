Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794482796;
	b=E2WOI4PZB4HAJhq00VEp3+ktO0ROL182PALS/wKxbu3rCk8JnWk9nE45f5fZHp/iPg6r
	 cy8AScoOHjgGHwcd3+JoZwCe3iexGbjAk2pt5aB+rpf7itTeinybdgLIFH4K2AF7PrTXc
	 DIAy3f1O+jIgUrVak5GgJgW2LMs87cNVSGTvuk05qPz3swRNP5qmwHR6r1FzfarhROUXb
	 eQ8VSM8aKTN88FLB4KX1+w77bpGAPpt11KAqeMxnKXJiAMq8J2vMCSkmDhzwlrGvEmej3
	 t6/DU2xKd65rwZv/NKl43KMyQKbDGdUKPTdabU5agfNmFOO+Q9UEil0SJlkX/dFl+EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482796;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=uTE3xEgwRPhVRHjOg6hOFWbbifgwhiynhlIrm1FKuxY=;
	b=dwOPXDEOS23VPf4lD3MvWxPHdl4i3N8VL8Gk9tkGaypivdCORF9Zz1De7ZD8ow+Mha5B
	 tTu3vO40rYsbfBZmcBBbWoI5cRrAedwztaIBGGO9CblipCVuICWkdCsh03ixlncRuMR9K
	 P8uMr0y85uArEoG+Z/HIt3A7wNLpyU071PFTO777kjubZ09qYWg24CPZA/dvH65NpOgRN
	 3HUPQCjPMqH8r4OQHdbRj7U8VnSGR2XYM/YjdkSa9LyuEfp+ZJeEjTXXrAz+isOjuPT5A
	 mcnwpE+qXM5CPtAd2Pfh9q7JVGmbljUJI5WBcxsK3HUVd4584f6wqzGEuxC+jIIpOUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yfe2y8F4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QJb137NE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8752606C17F
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:26:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8752606C17F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yfe2y8F4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QJb137NE
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC9ZEjp4092560
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:26:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uTE3xEgwRPhVRHjOg6hOFWbbifgwhiynhlIrm1FKuxY=; b=Yfe2y8F4yKwft9Xs
	t4scDgF36LcFvRH/UrkBfPUdkWhG/f9gnFw9ZK1brtprJrQ+Wx12ma5eWDwiOmUs
	zAv5m3d9XkZAajL4ijudtxarLxKgXMSyoF0/3ZQpHyXULumc34GxF+s2kCaetQIW
	RBUvg4WS9djtFjEX2E9ypWaLVyDlrcr45tu8TVXzPO1RQeLLpGJ6dFUl5K7pj08G
	sZsr35EO6gAKHbkTCccRQ088/jigco8tm4TNgYQShRt0pLzAOUnw9N+x9+P2sVkD
	nsDcPR3Y6kg75m0RGf0X/G4aw1YKLF61j9uqtGZ94t6O/t2kGPEGZoWgXHEy8Xhc
	KsbUEg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw0m8jjn5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:26:34 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1a2b6fab7a6so754679c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794482794; x=1795087594; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uTE3xEgwRPhVRHjOg6hOFWbbifgwhiynhlIrm1FKuxY=;
        b=QJb137NEiqldvXs+rm7zPRg4PexRd+OpzBrVgVfoRQWBoOCnoiGIbdjwWMQ5hmutFr
         dd8iG6pr80iOLFB9YN6XBoxNG8SQnOj80a9oQg8osDha2Ua5Fo9U4S4i9mvZxTasUVOF
         hEEhr1X/Wwv837LQ4Sz1hSmiUjpwP+WWfO9sJDNq/r+AqAuPw/nPvkDiFwFGy1ZoPbUl
         ROWk5ZJBgo7JzAjiLFD2yHRYWw4/fY3WczL5D4aLbqHoNBm8yKnFaI18hCQ7HFzfH10E
         aYT0rGjMzUlus73YZ1RDoCkrHbHKG33BtJ2COlu7lPH002rknbET4SUUSbA+HShr20Ad
         VeMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794482794; x=1795087594;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uTE3xEgwRPhVRHjOg6hOFWbbifgwhiynhlIrm1FKuxY=;
        b=x0CYjBZtp8K7bDmQz7jlsFUnaZuqWyezr/P4UYj638+cS63t7Ln3FVnFywGAjNxkFg
         PKjlA/HbSdUzcEdeoDcPz5DNmlyxsw7kaaVPIOzviGhxGCVWlfZeLmq3wlL+8o1NXgKZ
         /0iHGFEimFEtOEkyEGyV8iM+/ZWzfOTCcQV2y2xgBspJZClg58QUyvsQe+pwEJ8Heyxt
         O33oe7BiqBLsnrjT5vycR//DP42zOCYpr2Doqsbp1KM0Vpp3m15x0ejaXwezYSbSwTHR
         Eqh42b5jJ9F6VTSWfOcxDyWwMhefnXEVC98k97JfJ5EcjhiHH4GOxpzohW+Jpp6tJJ4h
         hbuQ==
X-Forwarded-Encrypted: i=1; AL+hErGQ0hm5R/aVP3R160kM+cmCk4vmKmLM7quwYVvBLQ57OxSS4cHqw/i7KvvWzAE1uf22ZtefGt01/mvcmuY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8d1Qht1lHBCAMeByE2ghJERBCB5aIXwuGSYcn3g1v9FWCbXsgX
	55T8tWz+j4Nluk4AQ9nVrvqnjCujyCvAgEIzxDYvKql329N19H+lt831gi101+NtArlDKtmDnll
	rbP9dVfOQFonIwwgGhKNMEcVtmAPVyQB9w4WLquLA4bwl6I2BxwpuEBcqZ292KqEnEaI=
X-Gm-Gg: AYBFou1h/yyoYd7nCfpj0JPRVr1gP4z8usZ+O2bdMpX511ZROcJQ9KPzses8eX8NmPs
	McJ9PmWUzwaa766PViWicvDDt28lWSPIedflx3oMKgl6A4V9VUQF9Im+sBhPcnqkpdyncUbZJN3
	kRKNSjcuZaI1iBQPkKkDPuFF8Pk1VIeoFVSqqCOpW3lusXjL4NOILZhqAKoaC9EZ8o0u6G163Ty
	MdNd2gqhJ3fpLDPwF3Xy2JOqUGad0gsO0fiTbvbKzY7QSHdSvYYs7wowVTVbZpF9MPb9E0kaHHX
	1ZrQ7zx9WOndrO1fHUqoVXJAi8i5c33QC3DiWDCBjhW7X3f0tJaU7QUQmIuo4MfZtnDLgUoXry4
	w9Lqv0/VcG15EJ/sK6h+0ZX+6gQ9kIWSOpU+jOwZodGrWL7stCXf320OLp4WO9g/oAbccKi2Ps0
	71HCRmOkXQ7QRY04dtnQXZQZbe
X-Received: by 2002:a05:701b:451b:10b0:1b2:67f9:43cb with SMTP id a92af1059eb24-1b4f5f5c6f8mr1793656c88.17.1794482793568;
        Thu, 12 Nov 2026 03:26:33 -0800 (PST)
X-Received: by 2002:a05:701b:451b:10b0:1b2:67f9:43cb with SMTP id a92af1059eb24-1b4f5f5c6f8mr1793635c88.17.1794482792952;
        Thu, 12 Nov 2026 03:26:32 -0800 (PST)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfadsm30402359eec.19.2026.11.12.03.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:26:32 -0800 (PST)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 03:26:03 -0800
Subject: [PATCH ath-next v3 04/10] wifi: ath10k: bound recovery time before
 entering WEDGED
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
Message-Id: <20261112-10k-sdio-crash-v3-4-24f03f300bb2@oss.qualcomm.com>
References: <20261112-10k-sdio-crash-v3-0-24f03f300bb2@oss.qualcomm.com>
In-Reply-To: <20261112-10k-sdio-crash-v3-0-24f03f300bb2@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794482788; l=4671;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=5MbJGy3RKq7arlk2SmcDcqcx7B4AcQTA9zf0fasV+sg=;
 b=g3D0EhqXJG9fjy0mDDD7e2heYqdHCE/8OejmeSLLW+NKPouJwdn6r8ekvYro/KoAkaiHfHCWc
 OoAjHn0L+c3AcECTf1EueeyHpKnZn0k8tQkuZ9gsliwlcgchH8oXRLM
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0NSBTYWx0ZWRfX5hc1DLJAxhSq
 QUCSemXrH4roB313QJ+LYyAfWBBaBvIEA7iwc64nJQ8w5AzduLr4Tl+wtIj5umeYV4I5C6TOl+r
 7gdQIFsFV94cRO2vs7cudGvJv/CUdck=
X-Proofpoint-GUID: otFiYS_hkQiQxqQGJK9EWFDvPrRP0BMJ
X-Proofpoint-ORIG-GUID: otFiYS_hkQiQxqQGJK9EWFDvPrRP0BMJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0NSBTYWx0ZWRfX5WLhVYgX+nCl
 U4Z1GEKaAExfxQsMN71QaUiP4VWC7gvBSKldYbd8UHevDTv8i/otT1j2Td8ghzWOUNUznidgb62
 1zw8cJXxYwAp6szn+H0gO0ij95lSr/bjdIt/CsImZ8Rg9umdU7Qli2Q+KXbTxiyrrmI9yEtGgi8
 NAxIstkHUHzBoZdy3VgZnM5/azW3ig3XYcao1Tbs0euCFLh2Yqg94RF0LEeTiD8n0CGARHVwFBC
 pHaKyUYwxeYyhdzn0tK8irlj6NYj4iK49YDAZRU1rZ3NPBEF3uj+6SrLz7KQdDFEfNMPLhtni/L
 VoiiUdq25+C7YwuyPm5zxuGzg6At1mvvuKdJ3zvVPd0DrYMQglrw1hYMbObUgJt4TsFq4OtXgqV
 N40uFvuSee+JYyytJiOU4qXFcHo26XfTmcD+rC0z+XJwao9rWUwNphneXmOAdIMWIYeocu0/hU/
 HXvmUrXsmPYGZ6DFzDQ==
X-Authority-Analysis: v=2.4 cv=Q9dHcI2a c=1 sm=1 tr=0 ts=6af5a26a cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=8Byw8hCbu9Kz8BjWs2cA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120045

Commit c256a94d1b1b ("wifi: ath10k: shutdown driver when
hardware is unreliable") added fail_cont_count tracking and
declared the device wedged after recovery remained pending for
a fixed number of timeout checks.

The monitor currently relies only on the number of checks and
does not consider how long the recovery attempt has actually
been running. Blocking waits in the recovery path may delay its
completion, so waiting for four timeout checks can consume most
of the suspend watchdog budget before the device enters
ATH10K_STATE_WEDGED.

This leaves insufficient time for blocked callers to exit and
for the driver to complete the WEDGED transition and shut down.

Record when each recovery attempt starts and add a 15-second
deadline based on the elapsed recovery time. Declare the device
wedged when either the deadline expires or fail_cont_count
reaches ATH10K_RECOVERY_MAX_FAIL_COUNT.

Also reduce ATH10K_RECOVERY_MAX_FAIL_COUNT from four to two so
a recovery that remains pending reaches the WEDGED state sooner
when the monitor runs normally.

This prevents a failed recovery from consuming the suspend
watchdog budget before the driver can shut down cleanly.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Fixes: c256a94d1b1b ("wifi: ath10k: shutdown driver when hardware is unreliable")
Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 10 +++++++---
 drivers/net/wireless/ath/ath10k/core.h | 10 +++++++++-
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index d86c4ead06e6..f6b6b81a4896 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -15,6 +15,7 @@
 #include <linux/ctype.h>
 #include <linux/pm_qos.h>
 #include <linux/nvmem-consumer.h>
+#include <linux/jiffies.h>
 #include <asm/byteorder.h>
 
 #include "core.h"
@@ -2526,6 +2527,7 @@ static void ath10k_core_recovery_check_work(struct work_struct *work)
 {
 	struct ath10k *ar = container_of(work, struct ath10k,
 					 recovery_check_work.work);
+	unsigned long recovery_start = READ_ONCE(ar->recovery_start_jiffies);
 	int fail_count;
 
 	if (ar->state == ATH10K_STATE_WEDGED)
@@ -2541,9 +2543,10 @@ static void ath10k_core_recovery_check_work(struct work_struct *work)
 	/* Record the continuous recovery fail count when recovery is late. */
 	fail_count = atomic_inc_return(&ar->fail_cont_count);
 
-	if (fail_count >= ATH10K_RECOVERY_MAX_FAIL_COUNT) {
-		ath10k_err(ar, "consecutive fail %d times, will shutdown driver!",
-			   fail_count);
+	if (fail_count >= ATH10K_RECOVERY_MAX_FAIL_COUNT ||
+	    time_after(jiffies, recovery_start + ATH10K_RECOVERY_DEADLINE_HZ)) {
+		ath10k_err(ar, "recovery timeout %ums, fail count %d, shutting down driver!",
+			   jiffies_to_msecs(jiffies - recovery_start), fail_count);
 		ath10k_core_enter_wedged(ar);
 		return;
 	}
@@ -2569,6 +2572,7 @@ void ath10k_core_start_recovery(struct ath10k *ar)
 		   ++ar->recovery_count);
 	/* Start a fresh failure budget; the last cycle may not have completed. */
 	atomic_set(&ar->fail_cont_count, 0);
+	WRITE_ONCE(ar->recovery_start_jiffies, jiffies);
 	queue_work(ar->workqueue, &ar->restart_work);
 	queue_delayed_work(ar->workqueue_aux, &ar->recovery_check_work,
 			   ATH10K_RECOVERY_TIMEOUT_HZ);
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index e8fcbef38ca6..a1ded2cba103 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -88,7 +88,13 @@
 #define ATH10K_ITER_RESUME_FLAGS (IEEE80211_IFACE_ITER_RESUME_ALL |\
 				  IEEE80211_IFACE_SKIP_SDATA_NOT_IN_DRIVER)
 #define ATH10K_RECOVERY_TIMEOUT_HZ			(5 * HZ)
-#define ATH10K_RECOVERY_MAX_FAIL_COUNT			4
+#define ATH10K_RECOVERY_MAX_FAIL_COUNT			2
+/*
+ * Some platforms configure suspend watchdogs as low as 25s; cap the
+ * total recovery time well under that so the WEDGED transition and
+ * any teardown that follows still have room to run before it fires.
+ */
+#define ATH10K_RECOVERY_DEADLINE_HZ			(15 * HZ)
 
 struct ath10k;
 
@@ -1215,6 +1221,8 @@ struct ath10k {
 	unsigned int recovery_count;
 	/* continuous recovery fail count */
 	atomic_t fail_cont_count;
+	/* jiffies when the current recovery attempt started */
+	unsigned long recovery_start_jiffies;
 
 	/* cycle count is reported twice for each visited channel during scan.
 	 * access protected by data_lock

-- 
2.34.1


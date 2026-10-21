Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792573802;
	b=rN9WfcRW3Z7bTk64Mk8PP1WrBJNH3ZrcHoFygfdNwhGktDLe+MaDGyAm771ydKMuAq4y
	 9N0Uoe0Vo3LBW5AM1PQKbVO0LIntcx3n22IFvWnc6EmZIapzW2pjixsTTy1h7GPL7SAwT
	 KsaANdmblhmD4Hqap/EsRKnKg7Rs4wrI5zNKGNHSxhmil/m2lU+e4IRmDtlFAJpntw9GL
	 XyeoeiXIOtw5ziyqj860S1A1R15euctY32yVM842GSJarxawRWpPx1yKTvNRS1qcTv2gj
	 DLjS30qeuZZil7qo4POYQJLnD4CHqZ+NgGCMVhtsXX/MGB0rc9Nt5cHqmKN8S0MfG4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792573802;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=otIwjrkbsLNWec0npAnJUqCgDqh7U1EWf/DMekBYQGY=;
	b=lwjAtZPhs9+ZqONUgW5Ds0z3p8QfqQLMtuzGzlZJcG9xzSTSWWj5WyyeBA+gpnkWcDKS
	 ttnty/mDaigdi0ldC/463LEZiXfyp+N7zwe1tzXYzDNVTK1wEspprgJ1CyoUscsa/fc8i
	 1Roa/TqYUzyAcGvuXD1Xj8jUQJdrffmGoRwtf+XOW4CYb/yCrqEFce6BPH0gBv86zujeT
	 vPlPPtEEOcValbfRMRAPJiQmkXR4QgswoKPBE9qglyQZJfCAXqrZ3qTJpk18dWmedmqgy
	 wexwbIpPGI33CO/S6JwwciYuBNBqn0oDsDtytZpDH2G22n3MTf6mbXGQEfYnvZ61vQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P8kF0uRb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d+zzy0vc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD57F60A2614
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:10:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD57F60A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P8kF0uRb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d+zzy0vc
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jJKS2848231
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:10:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	otIwjrkbsLNWec0npAnJUqCgDqh7U1EWf/DMekBYQGY=; b=P8kF0uRbe8eGz+Xp
	Vwum07iLRg/bTDiX6w/q1gn4UhPIPHV8M66pTQ4/QAx2NE/lZ0osRZMMgh6CV+vB
	l9hngmkUQeWKt5LhuaAUZFenRTJfVjyDbKpNY67Dquoh4Kud+kX60g6YkMN+12jf
	QwIjPTR1lbZleP0HL7hjZkIChSEWGuSCLqAQXKWSkunvHl8vYW2XJVbhyZLE/PSE
	LGBJQfOjpwLVCdaw2HsgBoA6WASOlo+kPTY3V2k7kVfEPhXRidugMTdlQjf0C5pB
	gRsGMZdCxaBSoCJOC69Ecy32QsjxhfRnqPwSVTd+9k4bfteYkcgqB93i8alPNNZQ
	6cVTDQ==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heeb9aype-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:10:00 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-54dbbf252cdso708109b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792573800; x=1793178600; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=otIwjrkbsLNWec0npAnJUqCgDqh7U1EWf/DMekBYQGY=;
        b=d+zzy0vc/J4ef9IHX3NDNRw/lV0J+JTx/tbr1xM0FHDlRNkCte5qoYNKjBr2pEPCLA
         3mcg85svjP1jJk7ZrNN/HQ+J5zmI1PJbXjQ3qDxP0DF8QuwNM20LvtpZoKIPwAclYv8/
         g3VDN839eiG01u4huCMCvy2m8LE/n2r5G2+pQ3bfVOIOTEKOU7IqdgWLUXFUxj2lmuer
         T+9iP1ybM9TQuEgoYTsaZkxcmvR6MD2ldEa908oHlgRQMucEdUs6RGricPNa4qVuA+SL
         b6GUM/XTyUOzSN/rxcPmp6BDhfQK1avJZIC4uHQW8FUhSSUB/iRPmdNIWKa0mfdQhLM0
         RnNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792573800; x=1793178600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=otIwjrkbsLNWec0npAnJUqCgDqh7U1EWf/DMekBYQGY=;
        b=vWg6W7Bydv9ISHHE7w3qsZtbDKnKmwo7EHHumu0lJiRaVu7LiD/fRvWpjinA0P2B/y
         UJhq1g0QNJunJSXbudDObsx8o97P9ZfiVBKyGpRUN1E80Sid/1yBLx0C2n8M5FegawsE
         LnV0SZteGvGLrJTPlGns4p3q5uZcaiYuJxohkshzfE9dpFjm1qDJJhgdfUjNSXNmJvye
         z6DZq12YMigtC8S3DLFHKiugxuZebHx0IWQUd9pcfKcoXuLMG7qfyPuBSmY/VHGN2rSW
         zbeRQRCw2cWnmxnGKKf8j9vvdlyA1Jps9sza2DHQ72vxAlNDnZyxvPXh7M5+lherYwhL
         RFiw==
X-Forwarded-Encrypted: i=1; AKwUvByMJh+kztGzKe1Dw3MpiKYCjatT5P/WDIC4hMpUQvApYpXsmJln/nLZ8sHaYH3FEpk+lSQM33tJu32N3y0=@vger.kernel.org
X-Gm-Message-State: AFq9FYID4nlxyjRdVFEkffUV1dNzoLxKO3FuWCJv30NF/FFMLjqfFxcj
	/dZhvjRGmde9SSsZe/Ffwre7VWuZ7Q4qvWT3JjPScFYjLTSc3QylZwo0uNFCXKgfyM6qPqMvpV9
	7CmsuH7BJnZfDoN3+AMzG4N+30WPuqtHAmLrSNuUi0qprVFcbWTDzkVgV6z4fwG+fZ7I=
X-Gm-Gg: AYBFou07oKwnw56VS1A8V0PM+rCuklFsiGP+gF5wM6OsDxw2UseUGwXocZIP9oxdRRk
	Z54PnMMPzFs9BsMye036XEvoKlnI1JDIvemFcen/6FCQbngKT4QaIXmrMf/iVaA/MrwpW2zNmPY
	ml7To7TPTmHHv9MIZ12sLHL1beUw/245kzvDhzcGZEMXMWMkOuLufucSktfBoMRbynDwUz/zppq
	x1pnztCab75XZvzE1ogCi6E8HNXFD8r9kG6pjD7WjqkXJPT5dGqbu8Xy9SMdxbe+4nW8c4cAPMB
	YHssuunK8eyxkVR+0zqP2kGP51EOVbYWXcpHKCR9IAIaaFsPKuHC1l08+Xi8KigjEgI1r+40M3s
	it71voEt1EWcQcAQaFHjTMjozreigoeyPkSiRrn+0LDWT88iZfg==
X-Received: by 2002:a05:6808:c3c8:b0:4a1:296:adec with SMTP id 5614622812f47-553559a2129mr911713b6e.15.1792573799763;
        Wed, 21 Oct 2026 02:09:59 -0700 (PDT)
X-Received: by 2002:a05:6808:c3c8:b0:4a1:296:adec with SMTP id 5614622812f47-553559a2129mr911699b6e.15.1792573799289;
        Wed, 21 Oct 2026 02:09:59 -0700 (PDT)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-552a182d59bsm1554595b6e.0.2026.10.21.02.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:09:58 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 02:09:32 -0700
Subject: [PATCH ath-next v2 4/8] wifi: ath10k: bound recovery time before
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
Message-Id: <20261021-10k-sdio-crash-v2-4-5df80bf16e86@oss.qualcomm.com>
References: <20261021-10k-sdio-crash-v2-0-5df80bf16e86@oss.qualcomm.com>
In-Reply-To: <20261021-10k-sdio-crash-v2-0-5df80bf16e86@oss.qualcomm.com>
To: Kang Yang <kang.yang@oss.qualcomm.com>, Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792573790; l=3465;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=aI36eG+GzocWwLCMMibADJ+IZVoI80YgIbYKQuwNIN0=;
 b=em+kyqEp5au2slgZnedoA3xlXSO8GkOskCvL9Lli1nGEjuxN+zIJxElYFOrIPD82FmdTCZfZx
 rdWnBKyR/ZXCa8FAmAFivsU46GJ2VXT+f2Ljg2O1SQCVWgUMe4S2JTC
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNiBTYWx0ZWRfX0kZFxP8J2Jja
 mF7k4fojUKCnADKgC1R9a5Ws2on57HPQvVfcf3Pns0d131DglUXSh4X3W/w70y7txYOID/t2Tci
 RPjpdpP+D1WSAxB7I22/PMRTR8cnU9I=
X-Proofpoint-GUID: 2plb8zxTkSVhrmafoNpbGTPOvVa3jkJs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNiBTYWx0ZWRfX8EY6SWi589K+
 LfuKlogIDOGMMbHlH7Ic2hrM9XZ9+4f73jRRKgWzScvbfx3vgL2Cuatawfq7OBcGi+W+rY/wuYO
 Lrubk9sDwSWue6Kr5IRKTyZJ61LMmdNjTPeGPe+Sv3U8lMlij0vkXpm+w6yhH9llIO8uOggQUdJ
 LYybDZabTGQDyFV0SPEIcOxohI9ctAjOxpa9mB+WG0I6ealeONKuZUfug+xTGaektRW4VKxzQc6
 gQ9V2ZQZz/Mzf5FFOVPGcNrXySIXYGfg8sjbs1HzoNtY1CDBewa30wstXDN1B4Duo6XvRDvqyF/
 OqugeFvtFp/Q1KD2xOtNNpD1mXKmsOrEoqRNnVZDB7JElcGcPIU7fOxohMdY6vXQLxIHfyDxAKB
 GZ2YCnUWNENwh0PLJ2saXg6Cw6ChdBf1z3Fk1vOvfxhsKqywmRKNLZnkRozQy7vMlmj4gvDkDWO
 /PnRR0+xqkwjSUB1XbQ==
X-Authority-Analysis: v=2.4 cv=R42WitRX c=1 sm=1 tr=0 ts=6ad88168 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=VCOL0f_idG3aiQAZe1wA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-ORIG-GUID: 2plb8zxTkSVhrmafoNpbGTPOvVa3jkJs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210036

Commit c256a94d1b1b ("wifi: ath10k: shutdown driver when
hardware is unreliable") added fail_cont_count tracking and
declared the device wedged after a fixed number of recovery
failures.

This relies solely on the number of observed failures and
does not place any bound on the total time spent in recovery.
As a result, the time required to reach ATH10K_STATE_WEDGED
depends on how recovery failures are observed rather than on
a fixed recovery budget.

In practice, recovery-related delays can stretch the interval
between failures and allow recovery attempts to continue far
longer than intended before the driver finally gives up.

Add ATH10K_RECOVERY_DEADLINE_HZ (15 seconds) as an independent upper
bound for each recovery attempt and declare the device wedged once either
the deadline expires or fail_cont_count reaches
ATH10K_RECOVERY_MAX_FAIL_COUNT.

Also reduce ATH10K_RECOVERY_MAX_FAIL_COUNT from 4 to 2 so
repeated failures reach the WEDGED state sooner.

This keeps recovery time bounded and helps avoid suspend
watchdog timeouts on platforms with tighter watchdog limits.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Fixes: c256a94d1b1b ("wifi: ath10k: shutdown driver when hardware is unreliable")
Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 8 +++++---
 drivers/net/wireless/ath/ath10k/core.h | 8 +++++++-
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 677e582b87e4..25e9a8f0ec8a 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -15,6 +15,7 @@
 #include <linux/ctype.h>
 #include <linux/pm_qos.h>
 #include <linux/nvmem-consumer.h>
+#include <linux/jiffies.h>
 #include <asm/byteorder.h>
 
 #include "core.h"
@@ -2544,9 +2545,10 @@ static void ath10k_core_recovery_check_work(struct work_struct *work)
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
 	}
 }
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index c739fbadc8bb..0319da3ec022 100644
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
 

-- 
2.34.1


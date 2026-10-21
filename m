Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792573797;
	b=Pv/OT8nopGZfiTRmqoxed46whdtOWbJS2s0TpX0OruwQKY9oeXK4rZhKQev5kvj7NZ61
	 WbptlU7lBu4mezADC+qCAQu9Dl0M1gcu8lgDv52QQ+raNhB5Fp0FXA8w9Y37cyw1UtgwR
	 XSJzL74lZyUea7YslIgdYv2RCflJO+AqO88wT2WaH8QnoRqjHOFC4ajZPxbt3MxwD5SC2
	 Iu17Od/ZCCRXGPqumbnFGnuvO5yMKTNdV67/WXbSgVriggoB3pDA6BByU4T1Mi7LlXJGH
	 giM1lAU5CSw3tCUDHhJvvS+7R4Hu9xjNw4wuQTqh/ytKohUCWL7Oq17vhNEG3q035DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792573797;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5F7IlOn+wHpmLBy6fLf5kOnI9xug8iEABbhwTUEk5nI=;
	b=D3lR/QIjdHH/gzMnoHkJC0iy2fYu6TGMpCCgs1uGtMa4Zf2AaG2gPCFYoD7Qgxkncod4
	 y/puN63OVY1PXxUunHPU8veXX9AqIh7tVnBaAuvyAx+GnfvQxsd+kbbvV2g/4vyiNq0EJ
	 XoKQ4Kqw+eZwaHqTEFw2K6sRP/MS+fc1hCJREFhE4BxwVT6gadjonFV+ArQaR8z+NnydK
	 eEaPvC/1qyH3qeFcO/Edj63M7gxShP+QI+TWa/MDXlS8+9BOUuCdOdyST68nlRSSlFCuo
	 4l+BTzRJN7AqlNP9D4Kj4avqoKhPtOnl/Nhj2M6Pt1s2HO1vHvRcWWOHCF/gCRkNi5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V6GIuVdy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tu1PFHtp;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C54E606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:09:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C54E606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V6GIuVdy;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tu1PFHtp
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jITg2848123
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:09:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5F7IlOn+wHpmLBy6fLf5kOnI9xug8iEABbhwTUEk5nI=; b=V6GIuVdyLj48pIuA
	zPLCxfn0QM+Z+de4KDq9R1uskHyqRt/VhFrUjfJZt3cR4mBXJj39mQNYJ84hPAaW
	/wGn5lPuqTq3gPvO0NjvcA7WzhcJaCdwVhCEDoNBiwrJhCvp/kOCpB/2ref7sIzP
	99UZBG1hygSYT6TzVEZus8OlPMGk6NwnpjQgpb+otdse734MYnIoSkTz6vOIuAyl
	nt2+7czxx5Sa51KB6DD9BZP2wqYF8H/VgXosYul302UuIYN55e4ZeSERppAcAYI8
	yDGruEWd0FhEs+HQSr0hZDc810pexaqsPimmjANux5N/Blub2gkRS/7ENQmeJ/E3
	0sEZVg==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heeb9aynv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:09:56 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-82169fb66c3so1174271a34.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792573795; x=1793178595; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5F7IlOn+wHpmLBy6fLf5kOnI9xug8iEABbhwTUEk5nI=;
        b=Tu1PFHtpYhYQufl4F57qkJ6kF9ZTOm3/4NJpce3ihyPEGM+Uu1RuxhYj/oX2hj5RqN
         Y0DeXN2/AdfL9kp1n0Kk2p7ZKCl1QmHWzf1YJB+mZOOlDjgLimZzmYDniuEyNGvmZIyI
         vyG8TvHuXduQ7hjoEjGyXQHfUlwsocIXS+XV6dqtcbEprOv6bIYbXvJ6J6xRgHlJUeL8
         Tp5YrlDvRc42nZWUlMKt3hL/8DC5RxQqJTj9ybPO4SlvkhMnprs9qTaX6Jbn3GRpnm7z
         7WFAMdCHZ8VpJOHLcf3vDi0tM82jYnPxRDT1b0Q6+/C3fj8EgIP+VOA249apoy3KN0NJ
         YQAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792573795; x=1793178595;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5F7IlOn+wHpmLBy6fLf5kOnI9xug8iEABbhwTUEk5nI=;
        b=qcZQ6nCjNUW9GtiPLSgSFPqPEZfEUmve/nQrtNnHFrur1xwlTZIiWBo9z37B5HX9DG
         +Az04Na8jHiOqaQGWd1bKlodCvXZ+HE300oxixEHsBTo1swyqWxsjt1G29oq4Fm9ij8G
         IFVGKHNSFKdvIoz+MbqJ3+6If90Uvi0p4hRNtkKwejIC4R92dy9Ei+VDDYl+8tJwlT0w
         8Ilmp34bbjdOUx+cOOuyYlDSe89LSbd/qGxrQpuaEd1RU7zDjD3rjYwbsYJQ9i/ki+3f
         BEBkqJ1Yjt21GV0FDKbv2AbUYN2Dyz5FM7Q3hlEyhkaULraGim9EDx/eVUw5wE5Vz5+3
         ehog==
X-Forwarded-Encrypted: i=1; AKwUvBzmaYToNTrGmboKjFcVx0Rp7wRtACIdPZBYyWTLn9AaFHgxR5LMmO9M7Z3AznjNHLxdke7bXe+UvnA4S80=@vger.kernel.org
X-Gm-Message-State: AFq9FYIlirmzhBpqtPLoUo8XrWsj9OrenS4pxOV8yFekkPOfelv07ycz
	SBVSLZUJdQWX6l4qshpd9Urh/PkLStfkAK0zepsqOK5sZ5hYoe5kDQCubiqWC23sa+2t9cVzlMh
	Dx3ZGFHLomY2fTWL8kILOX3OK+NRVQm/mGxfuXuZJDa+JhJWE+w1sVwg/cU52Tuc8mvbG/5b2nC
	+/YA==
X-Gm-Gg: AYBFou3PBqmDHrIUFX4WGOiRfj2gUiujZ412OLY1V+rJwkIqo0S8VpgrUjVeQKnmVIV
	EXCm/y68WL/xlwaz4fxN/tO8El/A1JuQsJvyrqDDqYs/nPm+FtCbHeVEH7UHgOC9B0t0KQiElpW
	VxdjbClW8cH2et0G9RyzlaEsGnWJLgFwgNfx1uXsO4TYF7wyL4MYdbi86Ko92sXbB2azuxpA5qg
	zNW/JTmKtCBvS4Fk+IyiWQ74mfl8A2HYf1jC0KnrzA82oTvhqMcCoq+ZuE3psL+rW6eoJ6bCH5V
	Z3dvaenJllQzGkkv3DmTrbHaIzyDcQrGvwgnCtq/NwKE5UwcVT7pPe4JjPq+RLn14Be/uOIEYCY
	Dl5k1rRgI/XosHI/Vr5mxxhLQBYuNwm2BepBrHn+86d2ydEE/IQ==
X-Received: by 2002:a05:6808:1a0d:b0:4d5:27da:a494 with SMTP id 5614622812f47-5536254f291mr774446b6e.46.1792573795272;
        Wed, 21 Oct 2026 02:09:55 -0700 (PDT)
X-Received: by 2002:a05:6808:1a0d:b0:4d5:27da:a494 with SMTP id 5614622812f47-5536254f291mr774430b6e.46.1792573794833;
        Wed, 21 Oct 2026 02:09:54 -0700 (PDT)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-552a182d59bsm1554595b6e.0.2026.10.21.02.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:09:54 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 02:09:29 -0700
Subject: [PATCH ath-next v2 1/8] wifi: ath10k: fix SDIO aux workqueue
 starvation in recovery detection
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
Message-Id: <20261021-10k-sdio-crash-v2-1-5df80bf16e86@oss.qualcomm.com>
References: <20261021-10k-sdio-crash-v2-0-5df80bf16e86@oss.qualcomm.com>
In-Reply-To: <20261021-10k-sdio-crash-v2-0-5df80bf16e86@oss.qualcomm.com>
To: Kang Yang <kang.yang@oss.qualcomm.com>, Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792573790; l=5192;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=3Qvk9OIDyUsTcNIe2E6YYBLeFS5QkCqczUNU9XX2Ltc=;
 b=/O3hXTgsWHEdzcy23qkDooJoPrVrXISYeUkF8n/JJVz2iG+8pFgdWFao923KHmgVaUVmdFilg
 OPjRpKdTUPQDvG6YXgwiwvXrK0vHlt6MgsLFS6quiCjEGdPyC9DsQXy
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNiBTYWx0ZWRfX5/flPqUloSgd
 dYZghY5YqJkSReK7bsXHLKdhiKmXWxKOhpan4MxoAJptV3X/9P+JPfYqiUn0ZyNjONXA/GyXimX
 EN1GdeIs20DNfFwIY+AZE1nmV7b4Deg=
X-Proofpoint-GUID: z2UxYii9AK6wt0T4fz4FkvWtQ-EhA3gd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNiBTYWx0ZWRfXzLrWTa6bN3h+
 Sg5zLQTMAWLoOeffHB23BkUXT2f6cH/9eaA0d65j6idr6Kxks8I4n/YC2+OHezZpEfkbz7H9Z0z
 Pz/ZC7j+NgT/0YYH7jwSnxyclZ8gk2A2t/lkhyQe60lMggjra6VwgdKq8oqUlkuxMEGWsSWbgKG
 3K9hKtpzSYafgVdnigXgtstaUxD1dSDlTrZaaw9LCeq7NnrLzsGfG2/gM1XiL6sIR0Kf3D6MuEn
 OH+rY08QHUgBTP7a/TLtVYGillUDBdlkSiaZSTmfckAcv1YYxxMoyGz7ptv7Yi7gvA2CoOzzLte
 KtwZ4/v+uqVTuY+jOflBNyBngYU947t70VTVQigG+UWfUo+LgJRQqwhbsbQ2pPYW5X6uiJEGvLv
 VHTvxaC7AddPMAB1u1kdvWuDTpYI1G8sFpGoR/dWkH3UFM48tKYM//LyMm5oN97zXfAXZI+trQS
 pLoYsWfqYVDO8PMNThQ==
X-Authority-Analysis: v=2.4 cv=R42WitRX c=1 sm=1 tr=0 ts=6ad88164 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=FvdSVOc6Z0cOWoVicyIA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-ORIG-GUID: z2UxYii9AK6wt0T4fz4FkvWtQ-EhA3gd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210036

Recovery monitoring runs on workqueue_aux, which is also
used by SDIO RX dispatch and WMI SERVICE_READY handling.

A single firmware crash may generate multiple recovery
triggers. Recovery detection currently handles each one by
waiting for recovery completion on workqueue_aux. On SDIO,
this blocks the same workqueue needed to deliver recovery
traffic, preventing recovery from completing.

As a result, otherwise recoverable firmware crashes fail
with:
  ctl_resp never came in (-110)

Treat duplicate recovery triggers as part of a single
recovery attempt by gating recovery startup in
ath10k_core_start_recovery() with an atomic_cmpxchg() on
pending_recovery, and by making the monitor path check the
elapsed time since the attempt started instead of blocking
on a completion.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Fixes: f35a07a4842a ("wifi: ath10k: move recovery check logic into a new work")
Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 64 +++++++++++++++++++---------------
 drivers/net/wireless/ath/ath10k/core.h |  2 ++
 2 files changed, 37 insertions(+), 29 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 7c2939cbde5f..07beefa06c4c 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2494,46 +2494,52 @@ static int ath10k_init_hw_params(struct ath10k *ar)
 static void ath10k_core_recovery_check_work(struct work_struct *work)
 {
 	struct ath10k *ar = container_of(work, struct ath10k, recovery_check_work);
-	long time_left;
+	unsigned long recovery_start = READ_ONCE(ar->recovery_start_jiffies);
+	int fail_count;
 
-	/* Sometimes the recovery will fail and then the next all recovery fail,
-	 * so avoid infinite recovery.
-	 */
-	if (atomic_read(&ar->fail_cont_count) >= ATH10K_RECOVERY_MAX_FAIL_COUNT) {
-		ath10k_err(ar, "consecutive fail %d times, will shutdown driver!",
-			   atomic_read(&ar->fail_cont_count));
-		ar->state = ATH10K_STATE_WEDGED;
+	if (ar->state == ATH10K_STATE_WEDGED)
 		return;
-	}
 
-	ath10k_dbg(ar, ATH10K_DBG_BOOT, "total recovery count: %d", ++ar->recovery_count);
+	/*
+	 * Pure monitor: only ath10k_core_start_recovery() starts a fresh
+	 * cycle. Bail if there is nothing in flight.
+	 */
+	if (!atomic_read(&ar->pending_recovery))
+		return;
 
-	if (atomic_read(&ar->pending_recovery)) {
-		/* Sometimes it happened another recovery work before the previous one
-		 * completed, then the second recovery work will destroy the previous
-		 * one, thus below is to avoid that.
-		 */
-		time_left = wait_for_completion_timeout(&ar->driver_recovery,
-							ATH10K_RECOVERY_TIMEOUT_HZ);
-		if (time_left) {
-			ath10k_warn(ar, "previous recovery succeeded, skip this!\n");
-			return;
-		}
+	if (!time_after(jiffies, recovery_start + ATH10K_RECOVERY_TIMEOUT_HZ))
+		return;
 
-		/* Record the continuous recovery fail count when recovery failed. */
-		atomic_inc(&ar->fail_cont_count);
+	/* Record the continuous recovery fail count when recovery is late. */
+	fail_count = atomic_inc_return(&ar->fail_cont_count);
 
-		/* Avoid having multiple recoveries at the same time. */
-		return;
+	if (fail_count >= ATH10K_RECOVERY_MAX_FAIL_COUNT) {
+		ath10k_err(ar, "consecutive fail %d times, will shutdown driver!",
+			   fail_count);
+		ar->state = ATH10K_STATE_WEDGED;
 	}
-
-	atomic_inc(&ar->pending_recovery);
-	queue_work(ar->workqueue, &ar->restart_work);
 }
 
 void ath10k_core_start_recovery(struct ath10k *ar)
 {
-	/* Use workqueue_aux to avoid blocking recovery tracking */
+	if (ar->state == ATH10K_STATE_WEDGED)
+		return;
+
+	/*
+	 * SDIO raises several triggers within microseconds of one crash;
+	 * only the first winner starts a fresh cycle and stamps the
+	 * deadline. Losers do nothing while the owner runs recovery.
+	 */
+	if (atomic_cmpxchg(&ar->pending_recovery, 0, 1) != 0)
+		return;
+	ath10k_dbg(ar, ATH10K_DBG_BOOT, "total recovery count: %d",
+		   ++ar->recovery_count);
+	/* Start a fresh failure budget; the last cycle may not have completed. */
+	atomic_set(&ar->fail_cont_count, 0);
+	WRITE_ONCE(ar->recovery_start_jiffies, jiffies);
+	queue_work(ar->workqueue, &ar->restart_work);
+
+	/* Start monitoring after publishing the recovery timestamp. */
 	queue_work(ar->workqueue_aux, &ar->recovery_check_work);
 }
 EXPORT_SYMBOL(ath10k_core_start_recovery);
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index dfee432615eb..c739fbadc8bb 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -1215,6 +1215,8 @@ struct ath10k {
 	unsigned int recovery_count;
 	/* continuous recovery fail count */
 	atomic_t fail_cont_count;
+	/* jiffies when the current recovery attempt started */
+	unsigned long recovery_start_jiffies;
 
 	/* cycle count is reported twice for each visited channel during scan.
 	 * access protected by data_lock

-- 
2.34.1


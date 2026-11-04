Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793754656;
	b=1TVpDTEHEgPF4PpkKDjcvBXgKXzD8YCn/wl2GnRbUEC4q4Md61JJUwnEYL0GXm/exaaE
	 ZHiQLUgD4yik3hVHrr8E9xR9sqhmgHJv3tOjub0Dkdny2xixGlFzMkql4UsJ10ttNViZD
	 3mIm7+V80CXyv4BGlqqxZR/g40D+eAPxw5T8NekSb76TJFlWjAZFKgm5rsT0FHUMuGXzF
	 VNFXjxQWH3HLPqSLFyIPHLZsMV7QyPawVnBjjIKDt9DP3HTrQcH9O0Gq30buScmZ0J348
	 eAO2oruL1ErTiCcx4w2b9Io1J37Jjh2KktLrylQJdsO3R8JukYzVTKrYuafiax8KI4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793754656;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Zy0g99KSmpxnlulEZdJjfjKVXSjdwjfhmOrhoS8xvt4=;
	b=JK6Ttpvqiy3ylB9J+5Aua3rzD+jaH8abPkOw4Nt2qwJLYlxdOAbDTHRUKzbj+ZPcGh6B
	 PHwp5gAlJWrv3tcM0vpRQuC8MRkpScKuclun4MfVbOHAhSkWcyGFy/J4hos+W6eUUVWZi
	 Ax7LSLd6KifRkOY5F6ZPrv1Xkdm4j8PgrxVYkoc7oJ98XedERFyC49Q4VyCjTmmlnJCUX
	 NDbeD1hh1d4aGNcNCxyGyRmeJNjI59l30ts9iibNuSat/OeOGAkTAa8fFXbyuTkS+CgGM
	 k+MgumPzmM1WN9GCM8VTzfws4+WSxpdP5X9XXYbDACMjqG4p2LRtYuq/Fqh6OUHU9Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OD2NxHmX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JP+CYKU7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534D8606D82D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 01:10:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 534D8606D82D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OD2NxHmX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JP+CYKU7
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40REHh3335342
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 01:10:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zy0g99KSmpxnlulEZdJjfjKVXSjdwjfhmOrhoS8xvt4=; b=OD2NxHmXppY4J5T2
	pgBa6YaPRWsHESBxxDfHJxPlqHq9bn+ujulj0tHxJqJTSWlRHlhcxzytI6WCPoLv
	kG+HeToYntjasRh7yeEovTsBas8lmTfCJ186Y2Ly8apiUj4Kq9KstS3Scedrc6T4
	naMuWRY/qthwcuH3U1WwIqTRGq+CgRDwSMEPFcytV/FNYcL+CjSozVy2zf1bPwmc
	im4TGkK0aqOqBe5TsKb6CTxPKRm22e7REg/IoD3jlQc92F2QxV1vqPRZ28xFsEox
	llacpS9piLmn5nwYmzL3tX5snjpJZPvn7FHYGCGT3RtAo+jqbunuLw0G4EfRof1n
	mCfRKA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqmjbsf9u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:10:55 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3552883bd19so563996eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 17:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793754654; x=1794359454; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zy0g99KSmpxnlulEZdJjfjKVXSjdwjfhmOrhoS8xvt4=;
        b=JP+CYKU74JEnzv7H0Dsangdm0odkEseeeH0WEOYprVijXbrRs0smzww1gaZhBmD1xt
         shnGg+vt5QwcHDUk452zF+henY5Upc7/lrZCayJUa2nW/2XuETSVPle2TaWEa3lfbcq/
         UAVt34l8Rq72YC92i8bT3aYMfPoIFunk5JjcMyakMz592zjHOLf54u43c8yOjdVL+797
         1Dwr5HQhVTnGVGia3NjjQJZW0hp/uPNgSrr9I0QqWPuz2KnQgG+aVliCLVH1yXR45HO1
         3Ct0YyQQdBcd2lwj9CEDSyCsOQEP8wf9ZdWfTT0x9KLvK90qhLhkN71ROChH4lipNDhO
         mRzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793754654; x=1794359454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zy0g99KSmpxnlulEZdJjfjKVXSjdwjfhmOrhoS8xvt4=;
        b=g2gnXqvLF2T3C/ebEMWYWJ2jBnfynpsswleCW1psRhQ/gf2hJwz4BvlbMKoYnLhJSy
         X7WWxWEvtO6pu615azSH/R0p/YQXtT1svgMBFL6QzxCfwWNoM/6kJDxlzFdGwVMXijbv
         MxKelKBeH1maCg7bLzDHrmZWaU57Kyw0BX8qZZ0118xSocKwRbcOLPAsf1oKh+NsxImo
         6nf6rwGzCfvUM+7AvzDToTIpNeHIr0CR8iAEPBjdbaxloTJYZ7fLz+6WXLE2XV7ztc9b
         CU7bXU9xTexs6e4cPURPZ9aQfk2GCUvWXTM9B6Gy48KkgF4+zSPQY31q68FCYqthgTLu
         bGVA==
X-Forwarded-Encrypted: i=1; AKwUvByVcKVXcJ5SKcrQDapRgk7ar2mAR28oyJ5fJaOLgPaS3dNZBGaCIJXHT1JK3xofBoJCqmWNsXCvnhojD3Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0FqvCXM5DRJXr+dUvUJOpBW/0/zPHfKSS0qpTMnmBSDBeGjO1
	vK9LcqAjiG/Tx+G/Wy9y8r8OXiCpwz2S/dUvYLshGcYeaVp27h9xIe5mTgKVd80IxxUopoCiiQZ
	wcukOc4W4WbKu9+JTIxcS5jPkIUIDVL71NH8i3eWmSY+vheB8OTjCxDx/eCUtASo8E48=
X-Gm-Gg: AYBFou3sbWKGRVaau5sl7kHIZkkxjgy21rWgc95rmwWcvH1qka9gZqGDKGoDK+yuNV0
	VFvfvVQWUYK2MyFSCfi3PmT5boP4+u2/iGM+uCspFAWf7iKjWo6kwno5JbEmFvM8JgGnvBk2trf
	B9cDMbZV0fc7rp1Nid7f8myOS7Q+3mmae2AQthee5bBElVOLl4KG/VUYji2aFMhQjEUdMo7hvFW
	HZsBm9zdNTSMYFWZmqhWGf80TMrLzkkHn8wliLP/k0gn3huv2wywAvgzt+WPAaLoRA4SCH3lvs2
	xjC0yRwY5Hxhd21AJBM2Xp/Hk88x8wSibpq+LIdiB+HOsfqSX3Dbou433u+Ee1/SaSxuLF5hNEv
	y6+E/KW80IvYglHK2YCogcPBNuLi4RO1dppCCxFTaTbzlouFS4oxU2NedP8E0M8oYgdFZizV9yE
	7S/kPxs0V/42WBcxVIl/w/wBBtJoGuNebok9Fb
X-Received: by 2002:a05:693c:6316:b0:369:fbc1:89c2 with SMTP id 5a478bee46e88-36a4235f4cemr20929502eec.8.1793754653922;
        Tue, 03 Nov 2026 17:10:53 -0800 (PST)
X-Received: by 2002:a05:693c:6316:b0:369:fbc1:89c2 with SMTP id 5a478bee46e88-36a4235f4cemr20929465eec.8.1793754653339;
        Tue, 03 Nov 2026 17:10:53 -0800 (PST)
Received: from ath12k-linux2.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a54ccsm2288670eec.4.2026.11.03.17.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 17:10:52 -0800 (PST)
From: Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 17:10:50 -0800
Subject: [PATCH ath-next v3 07/13] wifi: ath12k: ng: process REO status
 ring
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
Message-Id: <20261103-reo-cmd-b4-posting-v3-7-861adf04b516@oss.qualcomm.com>
References: <20261103-reo-cmd-b4-posting-v3-0-861adf04b516@oss.qualcomm.com>
In-Reply-To: <20261103-reo-cmd-b4-posting-v3-0-861adf04b516@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Ripan Deuri <quic_rdeuri@quicinc.com>,
        Pavankumar Nandeshwar <quic_pnandesh@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        ath12k-review@oss.qualcomm.com
Cc: Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Proofpoint-GUID: pTbLpNEgPvXYkHQR8oE4mQIc1hRkTmoE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAwNCBTYWx0ZWRfX5GK91uTQEAmi
 lmkQgJfjEV6wtfUPdCDhcn7l+Co4HldH6Y+Jy4j6opGLEt4fkzbhAqQbPaFaDRhcPjMzT3nz3ji
 /CEnGGKo0OW0o9cxguPuPMji7JmxGleoiFJqtS1JvRiWAwhGSHlaRovShy+Sjuk5VlknJDBiB7A
 msQ4GUZVj1e4VNJgLLHDLjfkS+yi10hBC7vyhGPA1atpVCCfjo0bV9h6hiBm1XxTMglTiMvXtu4
 sKSohYCn5rdl6Cp8RleQ4qkfVPwns+IhjSGHt6dLbSZ/cez9fBkSNiFmEdhVMR6hUdfaJLq7bBM
 i7OmzoNWdoUc+JpTZbFn28UIIUIgkXjUQi1LsF+x0yod0Er3tFgUc+eWJi5JioKCk9xa+0k6ubV
 tZo+KgXdTXAEVXS4mXtQQXUPJKm50TQlX+Vx+T3CJA+Xti8+keZD+x0upPEV2MUznplXitMLQmr
 A1FSNCEfq+3v0G00yyA==
X-Proofpoint-ORIG-GUID: pTbLpNEgPvXYkHQR8oE4mQIc1hRkTmoE
X-Authority-Analysis: v=2.4 cv=NMhAaE6g c=1 sm=1 tr=0 ts=6aea861f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=52ctRNkheENBddPFvzkA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAwNCBTYWx0ZWRfX1020OIv4qYCi
 /JuglMTYJLxhMoDjA5jNdoB+3P3nsYETh49whDY7lN2o5qW2tHwbXixUKyddSdZE1eFNRQshlQv
 SWCGO8z9aFO3x1mBymag7Vp8JBxyYrA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1011
 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040004

Wi-Fi 8 can submit REO commands with completion callbacks, but its NAPI
service path does not drain the REO status ring. Commands that request a
status therefore cannot deliver their decoded response to the pending
command context.

Service the REO status ring from the Wi-Fi 8 datapath, decode each
supported status TLV, match it to the pending command number, and pass the
complete status payload to the registered callback. Keep a queue-stats
command pending when a 1K bitmap page follows, then release its context
after processing the second page.

This commit only connects the generic command and status framework. It
does not add a command client or change Wi-Fi 7 status processing.

Tested-on: Compilation only, M=drivers/net/wireless/ath/ath12k

Signed-off-by: Pradeep Kumar Chitrapu <pradeep.chitrapu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi8/dp.c    |  8 +++
 drivers/net/wireless/ath/ath12k/wifi8/dp_rx.c | 93 +++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi8/dp_rx.h |  1 +
 3 files changed, 102 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wifi8/dp.c b/drivers/net/wireless/ath/ath12k/wifi8/dp.c
index dee73473cea9..e89826f33206 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/dp.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/dp.c
@@ -498,6 +498,14 @@ static int ath12k_wifi8_dp_service_srng(struct ath12k_dp *dp,
 			goto done;
 	}
 
+	if (dp->hw_params->ring_mask->reo_status[grp_id]) {
+		work_done = ath12k_wifi8_dp_rx_process_reo_status(dp, budget);
+		budget -= work_done;
+		tot_work_done += work_done;
+		if (budget <= 0)
+			goto done;
+	}
+
 done:
 	return tot_work_done;
 }
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.c
index b75e65091995..632ce30fe459 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.c
@@ -2210,3 +2210,96 @@ int ath12k_wifi8_dp_rx_process_err(struct ath12k_dp *dp,
 
 	return total_msdu_reaped;
 }
+
+int ath12k_wifi8_dp_rx_process_reo_status(struct ath12k_dp *dp, int budget)
+{
+	struct ath12k_base *ab = dp->ab;
+	struct hal_tlv_64_hdr *hdr;
+	struct hal_srng *srng;
+	struct ath12k_dp_rx_reo_cmd *cmd, *tmp;
+	struct hal_reo_status reo_status;
+	int work_done = 0;
+	u16 tag;
+	bool found;
+	bool done;
+
+	srng = &ab->hal.srng_list[dp->reo_status_ring.ring_id];
+
+	spin_lock_bh(&srng->lock);
+	ath12k_hal_srng_access_begin(ab, srng);
+
+	while (work_done < budget &&
+	       (hdr = ath12k_hal_srng_dst_get_next_entry(ab, srng))) {
+		work_done++;
+		tag = le64_get_bits(hdr->tl, HAL_SRNG_TLV_HDR_TAG);
+		memset(&reo_status, 0, sizeof(reo_status));
+
+		reo_status.tag = tag;
+		switch (tag) {
+		case HAL_REO_GET_QUEUE_STATS_STATUS:
+			ath12k_wifi8_hal_reo_status_queue_stats(ab, hdr, &reo_status);
+			break;
+		case HAL_REO_GET_QUEUE_1K_STATS_STATUS:
+			ath12k_wifi8_hal_reo_status_queue_1k_stats(ab, hdr,
+								   &reo_status);
+			break;
+		case HAL_REO_FLUSH_QUEUE_STATUS:
+			ath12k_wifi8_hal_reo_flush_queue_status(ab, hdr, &reo_status);
+			break;
+		case HAL_REO_FLUSH_CACHE_STATUS:
+			ath12k_wifi8_hal_reo_flush_cache_status(ab, hdr, &reo_status);
+			break;
+		case HAL_REO_UNBLOCK_CACHE_STATUS:
+			ath12k_wifi8_hal_reo_unblk_cache_status(ab, hdr, &reo_status);
+			break;
+		case HAL_REO_FLUSH_TIMEOUT_LIST_STATUS:
+			ath12k_wifi8_hal_reo_flush_timeout_list_status(ab, hdr,
+								       &reo_status);
+			break;
+		case HAL_REO_DESCRIPTOR_THRESHOLD_REACHED_STATUS:
+			ath12k_wifi8_hal_reo_desc_thresh_reached_status(ab, hdr,
+									&reo_status);
+			break;
+		case HAL_REO_UPDATE_RX_REO_QUEUE_STATUS:
+			ath12k_wifi8_hal_reo_update_rx_reo_queue_status(ab, hdr,
+									&reo_status);
+			break;
+		default:
+			ath12k_warn(ab, "Unknown reo status type %d\n", tag);
+			continue;
+		}
+
+		found = false;
+		done = true;
+
+		spin_lock_bh(&dp->reo_cmd_lock);
+		list_for_each_entry_safe(cmd, tmp, &dp->reo_cmd_list, list) {
+			if (reo_status.uniform_hdr.cmd_num != cmd->cmd_num)
+				continue;
+
+			found = true;
+			if (tag == HAL_REO_GET_QUEUE_STATS_STATUS &&
+			    reo_status.u.queue_stats.to_follow_1k)
+				done = false;
+
+			if (done)
+				list_del(&cmd->list);
+
+			break;
+		}
+		spin_unlock_bh(&dp->reo_cmd_lock);
+
+		if (found) {
+			if (cmd->handler)
+				cmd->handler(dp, &cmd->u, &reo_status);
+
+			if (done)
+				kfree(cmd);
+		}
+	}
+
+	ath12k_hal_srng_access_end(ab, srng);
+	spin_unlock_bh(&srng->lock);
+
+	return work_done;
+}
diff --git a/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.h b/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.h
index a05ab2f4495c..10940dd92a62 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.h
+++ b/drivers/net/wireless/ath/ath12k/wifi8/dp_rx.h
@@ -191,4 +191,5 @@ void ath12k_hal_extract_rx_spd_data_qcn9625(struct hal_rx_spd *rx_info,
 					    struct hal_rx_desc *rx_desc);
 int ath12k_wifi8_dp_rx_process_err(struct ath12k_dp *dp,
 				   struct napi_struct *napi, int budget);
+int ath12k_wifi8_dp_rx_process_reo_status(struct ath12k_dp *dp, int budget);
 #endif /* ATH12K_DP_RX_WIFI8_H */

-- 
2.43.0


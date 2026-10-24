Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792837859;
	b=kqDW8kr+DZWgSbwbHiu2ibOEqsFnRIug+jS9R2SrO/OcJXnHdhjqwd3LxI5wiNA/39qI
	 F+lTTtQBwBDYVNWuwrSjdnVrFuYOFtn87j8aiXjiiEd2W1u6ry5AX2XrnP3VeFyudtPS+
	 sCqom8mQb+kD5ljjmSwy21kgFmRxb/2m5VtjyV5EfWNX28nfPnZupdj1GpIxCaET+ZQbx
	 gcFL1ainLnhMfiWlO03Z6c86m1MPeL2S/cbxpkWscDfgirJiwWWbW0bpxfU9bkV6S15Tr
	 03eGi769SPfmJdIDIrDlOzqDomYAJEcr+RlUGXTYTQ+oWc3p7tqyihf8i5By4GCDWrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792837859;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=W3J2Hpv3nr4vSLVvjMy+VwXttjkCdlyxfB9Ss9Q/kT4=;
	b=RUDWt0fbTFJkW7of772JdbuIYeJcjSJ/o0mYjIinf+YMKild6THsatLsQf7JuwHu75ad
	 IWpx5kVbEpwl04OCvYp6CYeJpZhe8NCjdhJA7KYgqYG6Pq5qMzm+yuNPINMegzkFxHXOM
	 zumnX2SrWm/a1gwgBQH5smYGIJWC2MHWBSREzGuFlFHtYKVNl9Z4Ja7tDl98rb5xqE24E
	 quEDPaqKdzg1IGXoa8fOeT4fVIBdJ/hx2Y4lm6AUmKoGxsmMjTpNyyeDrUZ3I5LKl0d9V
	 9JBL5/gIkP+or5IBZc8W06VIbxIUp6EwfcxPN7xUxncrXBO0bbrBipaVQy5K8hb2ZRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="b2IO1Ip/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TIo1fOAL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410BF606A329
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 10:30:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 410BF606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b2IO1Ip/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TIo1fOAL
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69O8oaS92210278
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 10:30:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W3J2Hpv3nr4vSLVvjMy+VwXttjkCdlyxfB9Ss9Q/kT4=; b=b2IO1Ip/yTuqxOc/
	k6PpGXfC6zyRvx5EAyZ5wfOcuXSB0OL9ZRCWv4KSH1Q9T1T0v5sndAde6mK2JY92
	S1qjSt+rew3pujqHIk3uGOLZPf/ai/CvqjI7zCiY1SV7mL8GhnRq5zVkdODHZPev
	EuiB39D/gwfZ2uXHY2+TfN6f6Hckolh7eHaZwlCM4i6osDHM4aQKvKD9GFlLDMbz
	kD4QkMHTKcREEjRlni8N+mRneBwyuPnW902OJTK241hXZsbDczKgY9DR37MdeakS
	uPN3qkx2KinvbOXpRUpxrE/FGcp7TFuFc4Tt9N6/KlAJMA+4rJ4Y4gocRaX0FycR
	lVkhAQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgkms8van-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 10:30:58 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso2602278eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 03:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792837858; x=1793442658; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W3J2Hpv3nr4vSLVvjMy+VwXttjkCdlyxfB9Ss9Q/kT4=;
        b=TIo1fOALGSvK1fVscOt9IWluD2DRQoh7NIcmxK/UXnbrKmk6doo8EoIVOgDSTTl6bx
         /v/CV9qizw7QTkqaoc4pUJfYDBIfKr4BcQGxRUWpVlZ/+vzy+6+X5ltR/ZqeoZKsrv1u
         Z1yooRQofAngabBWmYfWxvmA9Ctz14G4ePs5NKbduElScr2jnJz2Oz8cKuhTG8e9GpCN
         NtDo7e4qjKXLVjLsPVY6leP7EYDKR38teP33GrvGCgFTOfhdCfl10blwEkx+tItz4ODV
         kjVhfFpXR1ag+1HIEgtYPm/97Tv5r9xWb6A5OStlVVRItWZ/LBcYwaUx/nKk/+gpTorz
         YIgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792837858; x=1793442658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W3J2Hpv3nr4vSLVvjMy+VwXttjkCdlyxfB9Ss9Q/kT4=;
        b=RE0/SP+EVmLwiWI+pu1wJJfbX597dX4cuiJumg2+sLvTxEN40d9DZbtxqENDR1aeUU
         ZJ4c7cyg/R4xZPPQWscubQZosExEAGDCDueIYAFvRdsc5nbbS7bwTqjOazckFTsIwcWn
         dlEn6Vs0sghi7bjJXjwD1VRVnmQXQ92lIFZPypZY0y3XdGKRWy/CzsTWIFJrrA9WuTmi
         o2gN977SqrO+ujTgXYMwCps1ucIQVByeqB/iQNIYQpYHftnGTcQVavByT4AMoeR2QsAs
         tFtUkXpJPF9ZUbk3XC2/P4D7B2pHSMP09ixq3/wYqUNFy9KqXbpycUi/ktC4Fjok/0uh
         5JRg==
X-Forwarded-Encrypted: i=1; AKwUvBxj2NnX4JKgmVz+W3ndepoqnhTyVM/Od+dZacmMQzGuM0iGyj4UCaa2m77lEPjqWhKhDIepNtaMsCHSNJk=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1leqHeYtzh6ofpIION3cQz/Oq6Ao0NppH74z7dWVfEWIX8hbX
	vQKiLojmv0prQ4G4awySogRET0pZHAUN6ZiKlo7F6oScWayYY6y21E2AKY0eer7h3c2izGmr3y6
	lT81usjMG9WDd6oqlcJc63GtuQxr0mb/x6ljTqWL6EddDO3hbYFcsSP+NyUC2XiQiHic=
X-Gm-Gg: AYBFou0hN+Jf5SfDob5jAcqB6IlpbcO6Cgt6GRKrVCorkZWw/NG1r72YMZ0bqvplWI4
	f2N6aMVCkbqsEt1CwhMN4XNnK5wg9GXSLENPO9BRXbeveiOlOP5wuvsg1hZ/iKk3BoKBdiJAugN
	nqhIa7+WkFselWsZDW2zxPHivZ7DkvWA8IkGOwB1J0wXZyf9+jZsdKPBc0rJqR6x/G1zb6ixjv2
	GStFUDn+tEYDQq03AhlzERE9WaK2UrJIs+Ze4wp6I/RNcCACNdB1HwxAKWANRpOKutHf8bs2RTI
	egAS9dw+ZrpfQuVV3fAPcgZWvxGfXSJkbeImbp/achJ177LrqqJ7H69xsT2/K/ZSVB09iXGQT1/
	cqgV+kM5g2yikYoceyi6UioI=
X-Received: by 2002:a05:7022:1508:b0:17f:7280:134e with SMTP id a92af1059eb24-19937025bfamr2402487c88.32.1792837857584;
        Sat, 24 Oct 2026 03:30:57 -0700 (PDT)
X-Received: by 2002:a05:7022:1508:b0:17f:7280:134e with SMTP id a92af1059eb24-19937025bfamr2402436c88.32.1792837856936;
        Sat, 24 Oct 2026 03:30:56 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19894d5a10csm6009441c88.1.2026.10.24.03.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 03:30:56 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 16:00:11 +0530
Subject: [PATCH 5/8] drm/msm: Fix sched_prio inversion within a ring
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
Message-Id: <20261024-assorted-fixes-oct-v1-5-2977f974ddb7@oss.qualcomm.com>
References: <20261024-assorted-fixes-oct-v1-0-2977f974ddb7@oss.qualcomm.com>
In-Reply-To: <20261024-assorted-fixes-oct-v1-0-2977f974ddb7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Luben Tuikov <ltuikov89@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792837816; l=3775;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=/p/xExe2wnQ1Pu4lNe12i74ui9lWBHsGWXEq9LYZN/g=;
 b=hgIcpVXBteagZ4vvfmPlFpmSXbnrYhFRwM5DvkNGy7xtffRy5qpGkfxqu0prTpDW2AkWa6/pD
 Um0wfeBa7bkBJzLTWIS/wYiSFGTxf/POcyBWIkaof79aeSxwPpLDfov
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: J0W3VTEgLbn1B4xHmw0enNyOsowJYWRs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDA0MSBTYWx0ZWRfXyBFqvnXZOF17
 QsjKdiJirTrIEW/R/n8wzveGJLsAMz3ztzVckALN0yiJVTnG7KJNAOOEcxBxr2Sv3VbQ6lhhMXV
 PTaT4JgxJKRrJ1Yej1eGEM8I4hBSq2N6Eze1J4fPw8iTVqd3ZPOL3hVSKrwX2fidWOv9zlLhNyv
 mzlwLtyPO4h3bkqRWL9RWL+TQDob6kyhWrsdrbEAvDD+tzrm6tim8MxpYJwN0EA62m7tTmt/Jpp
 Q/edHbFC0yyvjhmB5MMrblKwkJFcmRzzPD+sFUIi0aDSmwJxXkdSMx+PyWBjzaGY2y1+G9bdPut
 t5pPSo7OwtWQbn9sx6dBqkRwxv16ZH+Yso3BfUo23PqiddBLhkEfHX+EgiWIQVLyNNwI+Q/1jRu
 CYJblxWrwrFjmJ27O0RfG91izemDJnZX1O1aPvrvzsNOvUWy/Bw3j31c7s8fJqGekEDQB+3GNuk
 YmfmuIMn2jmkvH4bb9Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDA0MSBTYWx0ZWRfX/rJJ3pBvLrju
 R3WjcTJ9IlktCAKsaXnJAmXylgKbAKdQDWCKmzcrDYoItnr/tcCPjD+PNhTBqVlNgpaNQAYgu7d
 2FHyW2Fru4940I//FtIc9yvDi5yHjEQ=
X-Authority-Analysis: v=2.4 cv=UqX2pOwB c=1 sm=1 tr=0 ts=6adc88e2 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=F1ZHhNDtVFIJyJQHAloA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: J0W3VTEgLbn1B4xHmw0enNyOsowJYWRs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610240041

From: Jie Zhang <jie.zhang@oss.qualcomm.com>

Commit 38f922a563aa ("drm/sched: Reverse run-queue priority enumeration")
reversed the values of each sched priority. But it didn't update
msm_gpu_convert_priority() to match the new order. This results in
incorrect sched priorities within a ring.

To fix this, remove the inversion logic and add an offset of
DRM_SCHED_PRIORITY_HIGH to keep the range within [HIGH..LOW], reserving
KERNEL for internal submissions.

Fixes: 38f922a563aa ("drm/sched: Reverse run-queue priority enumeration")
Cc: stable@vger.kernel.org
Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gpu.h         | 24 ++++++++++--------------
 drivers/gpu/drm/msm/msm_submitqueue.c |  2 +-
 2 files changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index d27d54bdb7a7..bc5b31eb1eca 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -522,17 +522,18 @@ msm_context_is_vmbind(struct msm_context *ctx)
  * @sched_prio: [out] the gpu scheduler priority level which the userspace
  *              priority maps to
  *
- * With drm/scheduler providing it's own level of prioritization, our total
+ * With drm/scheduler providing its own level of prioritization, our total
  * number of available priority levels is (nr_rings * NR_SCHED_PRIORITIES).
- * Each ring is associated with it's own scheduler instance.  However, our
- * UABI is that lower numerical values are higher priority.  So mapping the
- * single userspace priority level into ring_nr and sched_prio takes some
- * care.  The userspace provided priority (when a submitqueue is created)
- * is mapped to ring nr and scheduler priority as such:
+ * Each ring is associated with its own scheduler instance.  Both the MSM
+ * UABI and drm/scheduler use lower-numeric = higher-priority, so the mapping
+ * from a single userspace priority level into ring_nr and sched_prio is:
  *
  *   ring_nr    = userspace_prio / NR_SCHED_PRIORITIES
- *   sched_prio = NR_SCHED_PRIORITIES -
- *                (userspace_prio % NR_SCHED_PRIORITIES) - 1
+ *   sched_prio = (userspace_prio % NR_SCHED_PRIORITIES) + DRM_SCHED_PRIORITY_HIGH
+ *
+ * The offset by DRM_SCHED_PRIORITY_HIGH keeps the range within [HIGH..LOW],
+ * intentionally excluding DRM_SCHED_PRIORITY_KERNEL which is reserved for
+ * kernel-internal submissions.
  *
  * This allows generations without preemption (nr_rings==1) to have some
  * amount of prioritization, and provides more priority levels for gens
@@ -547,16 +548,11 @@ static inline int msm_gpu_convert_priority(struct msm_gpu *gpu, int prio,
 
 	rn = div_u64_rem(prio, NR_SCHED_PRIORITIES, &sp);
 
-	/* invert sched priority to map to higher-numeric-is-higher-
-	 * priority convention
-	 */
-	sp = NR_SCHED_PRIORITIES - sp - 1;
-
 	if (rn >= gpu->nr_rings)
 		return -EINVAL;
 
 	*ring_nr = rn;
-	*sched_prio = sp;
+	*sched_prio = sp + DRM_SCHED_PRIORITY_HIGH;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index d307cdd17d90..8d550d281704 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -136,7 +136,7 @@ get_sched_entity(struct msm_context *ctx, struct msm_ringbuffer *ring,
 		 unsigned ring_nr, enum drm_sched_priority sched_prio)
 {
 	static DEFINE_MUTEX(entity_lock);
-	unsigned idx = (ring_nr * NR_SCHED_PRIORITIES) + sched_prio;
+	unsigned idx = (ring_nr * NR_SCHED_PRIORITIES) + (sched_prio - DRM_SCHED_PRIORITY_HIGH);
 
 	/* We should have already validated that the requested priority is
 	 * valid by the time we get here.

-- 
2.55.0


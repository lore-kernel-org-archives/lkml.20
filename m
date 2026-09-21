Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1D43AC0FC
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790019240; cv=none; b=KOiNyI4tjXRuD8CzoAdlILHdzN25iRaRoKLNhNN2/9EGYE7Hx/8AX2ZMLb1ixgBGwY0b/DI51usk+NtaAhlODfMPBXiJV8CUbtfwGcLuZjeAhLv3o5/hNbDRfvSuLTz1xfnsJhWWdx1oJM6R8+/h7VwUoB8DTcyXSj08OHsxVbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790019240; c=relaxed/simple;
	bh=TmUDlhnkn2s/Hh484olVyilhDyDyhy5zBWOH4b/rHxQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=a72VNhOpYmHp7ix88KajtMSJWSsC9o6FMvzys0oyP+ozni1B11kfnYRhiFzTyaf5sXdSMlIKQTBCZzJLowjUPsBpqo+qW/P70Uw4sA9igkOD++UkrEftDiGbQlObotKCyNU6omy27doe+4QhjgCFY/tl+MgJrupD7WVT7o4paEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Prfuvugy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A1myZVHy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Prfuvugy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A1myZVHy"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LHOxf11980327
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:33:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7rO5OxIkbscBDwX5Dx3HBq
	sg3q9hM2Mu5ot2WByPj2o=; b=PrfuvugyFyONkxvaqHAvBZQMyIrszMCxslJWeD
	XnVuYzApWkSv4ni6JC/M8m+rVJo30f+J4AYDci3iznUHSgQvRznG6oA1LzmhnPRk
	FoHR7unb+FgHi+6tvmERHtUfL1t2WoA64zcCYvQswzl80fQxhGqgFi8TCFWrujx1
	MSPbdhaHCrgQR99Jecqy6ueSZGwVen9pZMBsSVLazirvRqOyuA+G+khjy4ytK2ES
	1zb7Xo9zSppdIZBK0ZrZkrNxi2KQ655Cl9OyMKY+KqvCcBTeg1QUhVjdLW9nFpcj
	OxSecohE/smYqP3Q4JUcSwdZLkkjc0UtNdrpmhN7wIGb0Y0w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu3csj5yx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:33:57 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc489e7a701so4910945a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790019237; x=1790624037; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7rO5OxIkbscBDwX5Dx3HBqsg3q9hM2Mu5ot2WByPj2o=;
        b=A1myZVHyWAE+zW2qxGw+roEQVq7/0yan5MIRFwf+6BTtlLWcsPfucFcZfd7Usv53t7
         DVPLmp9ps9ZPuGMJ4NGgQWWsJbRHTZWvUth73Uz1CZICH7UeALOlWJxWQMpekuuDBrV8
         XbY6ssmLNG8cgh6DzVTZcxEVT0zUz2RqLBc3H7NtkyZSfXHMvHrnvCMyXDQdL8Z/62l0
         P1lvVGMFxuK/xj9W5+2SvB0mBbaT66A/gJPDCYWTNRtdk1xkUye1g+TZ3ekCk8keNeCu
         SV5VeaXAqGuOTQuS3lQ7/0uwBiCScljVEcnaSBgjvDUat6C7ohkIlUkp7/YR5cTeJ7qd
         PuBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790019237; x=1790624037;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7rO5OxIkbscBDwX5Dx3HBqsg3q9hM2Mu5ot2WByPj2o=;
        b=1G5O2tQH2yXdT01FSF8DANTAFFvStiGuoti2onxQwPvAC+U5mpE3hZ820p43miEm8H
         EjSr2c1S2vj2g8kCizWUN/Soenw4eXjrb/gufIDIhG69bD2OTqsiPa0tI5VQuD4KFxJL
         UQaxNDslBaXLsjVmnveFwGnpCAQ7ZvksQsi3ZWW4u4fQEUZWW3hIaZn5rmIH7uUzv05O
         HPEcnn1EYkXPXBE9kjVZJWuVTxcKiMaiiMCejIjXY0vA2/ISOxtqqPWtzj+d/Z/BgHKS
         5tita5Q7ssAxChEEzPpxr9nbViJw+8gspVHembb+T6SJKvcsQpRHzxTF0IMiagbGq4eB
         2Kjg==
X-Forwarded-Encrypted: i=1; AKwUvByBmuVKiftvNXBsiY7PRjLaCUDVvSFxvTT3vhuVLQjzd1aautlBGHxGoJEQjkpKvMyTKTX+yzITmNZvVvA=@vger.kernel.org
X-Gm-Message-State: AFuF++mGC8t/aBLZ3cixuUAshLXM1UWY9ydjSmH34SXWNw+iETovQF1c
	lfcTkDWkPhvJdGgv3ThWwcygJYXe3yC6h15MUuNEehouvswikhicl8rdA5TiHstYa+qVJ6uNfkE
	OgUwcRIE1e3v653FexE72pm8VYYRbk0mD9baM0UbHEmMxwCRDgNtHsFDkZnIOXX1RgDU=
X-Gm-Gg: AYBFou2kGivdCRwsRKsr4m69prUuRWVwDWaZZk9y+v0v5O0NjnaGDB+buYXLTVHLrE/
	OJYXILPwdcLP+NTRBFnk8HE7ITCa/O7/z2pfRWpZu0h0V0UYAiIITFts+zl8THeBVleYPj67xmK
	kEaRZbm42rjeQRJNZO+5YavemOUeUlABegp16rErtxp/MvH5ppMswWfbeOQL9Yc+WzTBej903/c
	E2G7DLjqdM68/v0kURJJrO7Rw8MJ67e2oZw+MVaNDx9rEC299wzJ9B3XPRnOCQ7tThDl7KCErLE
	kUbr5LpkEKlqyJZxF2ovkyR/LLkAdZc3vpFdGSTgcZ4w8Q5zOMnoqAatr6vbZ01ukGvg+fiuT+e
	XiEeD/RVKpWY7M/7uK5fUoX8l/3AhXov9QQAGGQ==
X-Received: by 2002:a05:6a20:a11f:b0:3dd:a196:53a0 with SMTP id adf61e73a8af0-3dda19654a4mr12414791637.66.1790019237061;
        Mon, 21 Sep 2026 12:33:57 -0700 (PDT)
X-Received: by 2002:a05:6a20:a11f:b0:3dd:a196:53a0 with SMTP id adf61e73a8af0-3dda19654a4mr12414769637.66.1790019236662;
        Mon, 21 Sep 2026 12:33:56 -0700 (PDT)
Received: from hu-anupvish-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e5eba1febsm165775eec.5.2026.09.21.12.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 12:33:56 -0700 (PDT)
From: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 01:03:52 +0530
Subject: [PATCH] remoteproc: qcom_q6v5_pas: Preserve shutdown error in
 qcom_pas_stop()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-b4-q6v5_pas_stop_preserve_shutdown_error-v1-1-2adced730893@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJ+GsWoC/yXNQQ7CIBCF4as0s5akBUXrVYyZlHa0uACcoWjS9
 O6iLr/k5X8rCLEngXOzAlPx4mOo6HYNjPMQ7qT8VA261bbttVZur562HDANgpJjwsRUG4VQ5iV
 P8RWQmCMr0zs60qkzhizUXN3d/Pt3dbn+LYt70Ji/fdi2D/rxsK6MAAAA
X-Change-ID: 20260922-b4-q6v5_pas_stop_preserve_shutdown_error-39be7e8133e6
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790019233; l=1677;
 i=anup.vishwakarma@oss.qualcomm.com; s=20260805; h=from:subject:message-id;
 bh=TmUDlhnkn2s/Hh484olVyilhDyDyhy5zBWOH4b/rHxQ=;
 b=80XGy6AlAsyCO+RLESdK/NExg5IIPe05pY5q6Xtpna2LaO3piw9iSkAh478gUOAiAtwDQFBDS
 D55mObdrvSZChIM9H0denEvtscYYkQtw67Q8M+Kjvyyab2y2MIo1pQP
X-Developer-Key: i=anup.vishwakarma@oss.qualcomm.com; a=ed25519;
 pk=Y9ilCu91UQrzHOM14SG2IjnmQ1QSroH5uVeBSWEmEDM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDI4NSBTYWx0ZWRfX4qNr33ul7lEk
 Dc7g1MXxtucXSQ51pL0AR+ijG250kXKYPGpHJihM713CdtNlERgr088RiG8DlMNsLzsCHfaahgF
 4aFXMD/tJLQ2WV3cEmb/cYjV+OUzDWc=
X-Proofpoint-GUID: Je_Rp8LGn6-d_Z-WuOTw2CWVzgRIvZZf
X-Authority-Analysis: v=2.4 cv=QovLTlyd c=1 sm=1 tr=0 ts=6ab186a5 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=cnCWFBqf1hCtONYA2ocA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDI4NSBTYWx0ZWRfX4aXc5TUEgsK7
 5M2qKYrj0/ofImk+kYKvLBrGp6mGaBsF/S7R5I0089KrKqoUpVOy0eN9r2BS+9fjmgIlDbf057U
 4jLqRqmV5GHG7h7MUCFYklVNMY3ln3xk1IFkiKkJU8uM1at6K2VdLDMyWJQNXQZZPfJ9vTH6p9D
 W5mfRjfA1Yx8/Yl1+vh4g6K0QxzliTIblqGCYwdN68oflG68Wz/vHOtIgJ4wen6fCTuaXAeIYlI
 1X3F8h+BTUC0WJXFCca9hU4nzVVCo4E5iv49AWeLEdjcVHxPjbspiKS8PVO50wozpIkaAKwxYDl
 +7LvmROMwERWdIAdmBp3fEOuejtTfu7wsq0ede1S37Cyiqqy6fe7GqzOGBhVMRkf0UaylpKEeBd
 6SXAATGJZepacFH4vES88gvkPLZm0fxd0UwEh7hp8fldJfma/UU/h6STnUzCKEOZk2GDfGIb9bg
 Ej5rUsJuW0H8Rm9QLRQ==
X-Proofpoint-ORIG-GUID: Je_Rp8LGn6-d_Z-WuOTw2CWVzgRIvZZf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210285

qcom_pas_stop() unconditionally overwrites ret with the return value of
qcom_smem_bust_hwspin_lock_by_host(), discarding any earlier shutdown
error from qcom_pas_shutdown(). If the primary shutdown fails but the
hwspin_lock bust succeeds, the function returns 0, silently masking the
failure from the remoteproc core.

Use a separate local variable for the hwspin_lock result and only update
ret if it is currently 0, consistent with how the DTB shutdown error is
already handled in the same function.

Fixes: 568b13b65078 ("remoteproc: qcom_q6v5_pas: Add hwspinlock bust on stop")
Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index a005546c265d..845aed000a1b 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -436,8 +436,15 @@ static int qcom_pas_stop(struct rproc *rproc)
 	if (handover)
 		qcom_pas_handover(&pas->q6v5);
 
-	if (pas->smem_host_id)
-		ret = qcom_smem_bust_hwspin_lock_by_host(pas->smem_host_id);
+	if (pas->smem_host_id) {
+		int lock_ret = qcom_smem_bust_hwspin_lock_by_host(pas->smem_host_id);
+
+		if (lock_ret) {
+			dev_err(pas->dev, "failed to bust hwspin_lock: %d\n", lock_ret);
+			if (!ret)
+				ret = lock_ret;
+		}
+	}
 
 	return ret;
 }

---
base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
change-id: 20260922-b4-q6v5_pas_stop_preserve_shutdown_error-39be7e8133e6

Best regards,
--  
Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>


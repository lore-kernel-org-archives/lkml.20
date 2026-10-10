Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55273AFCF7
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 03:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791602399; cv=none; b=rgtj877tNHFdE0EDbDdpdYu8RPMBBGoBvzhmqIWJ+suIBymsBXfDpfg6RFZjS4DgWW6mCtafNC9xhEA7NozyqaCY3Og3IvSgoRgVG+t65w7YhbnsLJaAnhqRuC7AYr/XzX6DRfZK78uA5xjjpF02W6bAjla8X3HAE5n30Q7WexU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791602399; c=relaxed/simple;
	bh=m+S2Wb/GQM3li+G+nRy2TZL7nsUJI1fXaS5AK1540i4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lWKy3GgODW4tZNy/9HTuF8J8y6e1PPzaylIe9og7ol1NvoH6UAq85GTTEsrrqWwU21gPuZtdv6kHOj9eDmvau5coCn7HSoBQsqewhQMlg0DcX2gectqeowvWCPA/au/e/zp+v0VqgWrS8iDwYAg+yzryOnVzqX3X29qSU5t0L8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h4R2ry/b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e4ryWUDq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h4R2ry/b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e4ryWUDq"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69A2eWhJ3598078
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 03:19:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=l2zlln3P8lcieIEn3wRf+R
	ryqjGxD9/bf43zUbyP1Zs=; b=h4R2ry/bLzd8jXCsFZ8KF0trrNuQjNvTJJrnGw
	Z0nw5LFGzOgTU/aB+5C10TnYXHR8ZiTkYaI5IkZI2A04pwTOZl6sns/xXI2NQW9r
	j/5bx27q0uJwLBKqTO7I6vsPXYUasaGzIRYYpaEOgY9Knm18bzuFd4Jxd7o6flAg
	/kbj7ynh7O5q2vMre3Ccu+RtoBk//eWwPxS6oo7uzx1jvMORq2lA0eAgi0W1LfeC
	rK1t1WNhzKQMvzsriOI9LNwdjjvQM9PwjRAoeZNN3adELMkQUhgBUd3hHGRVO8WT
	SH8/26+T2CMhbo48VdmTFqP95cgc1Zy5AVxORWKHXN/yBcjQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h74t89kev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 03:19:56 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-34ef0362d95so842975eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 20:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791602395; x=1792207195; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l2zlln3P8lcieIEn3wRf+RryqjGxD9/bf43zUbyP1Zs=;
        b=e4ryWUDqWeQDZVkX6Qra8Jw7vrUdhhUt5dZz+z+6x4TQykiG0Onn2HplSOqflBFnJ4
         fPNbc2jTbcL3qYmt6kKT5XgUsDphqkFWvTrsVYD39g+Drt9Uh2oATrsTTffWjgaVz0Kz
         dQVUW2iwSm2uR1qV1pdUVhSeqxtXxB9Y/j6wyvNqCm5HkQ3eAzuHfNBK5u2e/bwWTPuT
         JDwDFal9LGM660PtL+NHWJreocDa3lzT0m0osERfzFZX0yP5NFmulNf235wdv2Ui0YgK
         jND5UI7lUyoeGt+53r8Mvi5RCrfb1Vs7aBoU65mhXRWJUkDsbO+fsgjSuBqfmLn1R/7/
         GtsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791602395; x=1792207195;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=l2zlln3P8lcieIEn3wRf+RryqjGxD9/bf43zUbyP1Zs=;
        b=o3gM11tq0PsyT2CI/ToSv/Sw0ZGrHeiEkjnjwnrKMXnYdNcUACcq8iVdY5fIbe+9F9
         r3ZfDAYfGRXPcNsUv6LgSsqu2w4mdvEm2bf+5GQQbxu2F1GYdsBZynk9R8mr96QhgxiH
         E95fB+kP0Hqhq5A/8L295qp8WcX4x5xi2dXFlYnR0GEPNTCBRrrFdTKj90KXwRxBtUSg
         KXO1uVr2wRa2NURJmtsZVUIDLODJyJLKDkUEUZTVohiX6WbYkA98LxsUzmy8mVEKtGtC
         yjUXYffmpHAVsc7VKE6ObIKQbaalBihoRyOanBeYna0uusqWNjMiO6eLQUYIVWKdWMhn
         swRA==
X-Forwarded-Encrypted: i=1; AKwUvByd475mJB+zBn9zdED+Hhhv8wWiELmta67fat0Eq44fs+8wyTyZWKNbnQ2M876t472OnoTxNN7UJ3M/9mk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJDYOPYFRkXPHbYvY7S8fYfi5RlIbBZErudYI6/lhFF7Nn5/tVx
	y79ZrNJ630weivasXqAZdu3xPus83xqztVzCYlYlSGWtpJSGV4o5tP0qsjGLxX2BVMvBRB+3tHv
	9CyjQCYyjXWfpxDMVcCif7vGkfeHYj9B+Qk4XGOB7nOW2I8xrtLcIDgJGkhfP8eQSXUStzKzZUw
	==
X-Gm-Gg: AYBFou1acpV5tWsPRpvcDgJk8ts2XTqrLta4Q8hK7npFREK6qvhz7jVegXzPJJqxyMq
	DVxx1+3zt8v+TiclLyYXGMWLOZwYCqV5yvkMsjemX67msfKCVyMbHTUO9IHEb4Bsbg3JegRZS5v
	R008HaVy8lgHpeHng6HuaNyimRhYPX2SGqAy9PB/zJnVzAB0wTt1K8m/w2+8l8mL+frXmBmxuf4
	cO6aXJgGxUFbrHhjAF8mwNNuiOhvbhBRF9kf9PIa4A6AD4aG7ZFh0mRCx58ZKldOFNr+BRN4L/D
	8+NE1qguE1lZrqUpAEbohe9+x7jb7AlSodUV0MhVPUmci6FzUa7OrQFwTEDDc4MNcVdmXVV7HlI
	Ey4r+H6I9hs7E/BMbXtHycpK5WgxAegO59HSGdIOgdZq0MmnHCHfwtWDJFxo=
X-Received: by 2002:a05:693c:8110:b0:33c:16f1:2e11 with SMTP id 5a478bee46e88-3537df596f9mr5090027eec.7.1791602395441;
        Fri, 09 Oct 2026 20:19:55 -0700 (PDT)
X-Received: by 2002:a05:693c:8110:b0:33c:16f1:2e11 with SMTP id 5a478bee46e88-3537df596f9mr5090003eec.7.1791602394879;
        Fri, 09 Oct 2026 20:19:54 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-353814b556esm10127579eec.18.2026.10.09.20.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 20:19:54 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 20:19:48 -0700
Subject: [PATCH] tee: optee: allocate a bitmap for all valid notification
 keys
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-fix-tee-max-keys-v1-1-1462d96bf438@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANOuyWoC/x2MSwqAMBDFriKzdqAW6+8q4sLqUwfxQyuiiHe3u
 AwkecjDCTxV0UMOp3jZ1gBJHFE3tesIlj4waaWzRKmSB7n4AHhpL55xezZq0L0tcpvCUMh2h+D
 8y7p53w/LrAnQYgAAAA==
To: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDAxMiBTYWx0ZWRfX/De0hNty8mb2
 3v0w+ZYwGiY5Ui2yuOD5UE48ZCUm3ge78wz2hczqoHhKIYvvwv9CFyi+2cwGhRqoLtXc1cfal7h
 ldELOIYyvmQdfvQg46njKrpuQDTnJVc=
X-Proofpoint-ORIG-GUID: qNsBaTBEj7lVXRbBRtIdsU8HDDcSXlrq
X-Authority-Analysis: v=2.4 cv=D9jSufRj c=1 sm=1 tr=0 ts=6ac9aedc cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=hYfsqUzT0y0sb8bvQO0A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: qNsBaTBEj7lVXRbBRtIdsU8HDDcSXlrq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDAxMiBTYWx0ZWRfX3k/o3zzGVKQN
 FS5e4yPI9HxKXpAmvBmpG5T5Hh9FJ6l/oIw8AsA0uZU19BCQHXpmnRoUlPCwlEukOSbfL1KaW+Q
 5uMxGmPR0qBvtBdPIwXrFJSgEzleV/p8qaXxA27H5H0bBFM54Ogm637mmjrqmS2p7VfLAVrWoBc
 FiXzfekolYoAJVRW3SgxDyvPeNmlk093q1vDhlTJKhKaV37oRrj5IGroeXZ0scSVTUrU7RO2Va+
 wWEFVyhWDwwhundRg/+euNx/NXj8DiQMqDxKZdkxkSlUCaDEtwB5xIA/HKMc+Qyete1UuYZAbyb
 ixVZaGQQ2OUyvByAz2fcQwIa5Ay6MpfLy4pvL82CBNHw7LJQKc5/S6lDLIshqlaOilt2dNQGKap
 VibvXM8N5XYvjJEfLIy5BON1aamRwzNLqKCZX84Q04xRUnXERhfMETsOHy/X7Fmm9VuxER0yYsu
 sC/4rwfv3uFSsJtoGGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610100012

Notification keys are checked against an inclusive maximum, but
optee_notif_init() passes that maximum to bitmap_zalloc() as the number of
bits. The bitmap is therefore one bit short. When the maximum key is a
multiple of BITS_PER_LONG, accessing that key reads or writes beyond the
allocated bitmap. Word rounding masks the problem.

Allocate max_key + 1 bits so that the highest valid key has storage.

Fixes: 787c80cc7b22 ("optee: separate notification functions")
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/optee/notif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tee/optee/notif.c b/drivers/tee/optee/notif.c
index 68014222d7be..2bf5ce397233 100644
--- a/drivers/tee/optee/notif.c
+++ b/drivers/tee/optee/notif.c
@@ -114,7 +114,7 @@ int optee_notif_init(struct optee *optee, u_int max_key)
 {
 	spin_lock_init(&optee->notif.lock);
 	INIT_LIST_HEAD(&optee->notif.db);
-	optee->notif.bitmap = bitmap_zalloc(max_key, GFP_KERNEL);
+	optee->notif.bitmap = bitmap_zalloc(max_key + 1, GFP_KERNEL);
 	if (!optee->notif.bitmap)
 		return -ENOMEM;
 

---
base-commit: becb95e45ef0dda9ffb35156d909d3da7a2789c3
change-id: 20261009-fix-tee-max-keys-50f2db87b4e5

Best regards,
-- 
Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>


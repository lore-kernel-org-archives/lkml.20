Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D1F4908AA
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 11:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791372716; cv=none; b=u16jqTQ6S1dVmtnSFssmbc+VPkvssq/bB2LZEWpKrlvSi1j2X8cneFKcdFfvC35kH+PWHukWUXjbUcAdSkzhhydnvC2En4K+K026wda/XZIvQiq6JoMK1JClKtuZJ1llSgFmkV9mMQ5J+KexarXE1US6sNbGhqVtGwfuPbSgmsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791372716; c=relaxed/simple;
	bh=OJRJ4n6Rjp8IwVJxm+5+cJyXLWroXFMzWgufd/STv+8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AVGYU76ir7y/aN/Sn5zk30fZ5Y4wPYt7+zH4luwDvCzprGf0/KwiLYau3OshKRh8W++Opf5ednJ8nOhNYsMC2Mwzh1M8ijgf8iw4Oj/WRiYjTyVOjShGeJxh+mMBop3CJgv01b7zNrFj6bYXWJTGm2DWlf+jPPNYA3djAn4Reyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gB+2k4nU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D9ftVWWJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gB+2k4nU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D9ftVWWJ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697BV6dT609857
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 11:31:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ziTRJRTyTHrXpykIexrVW5H3SlT4DMRvLBq5cG0RzyI=; b=gB+2k4nU+XxnX+n9
	czX54suZ3o0DkYYT11zAuwdCULDrb7tG/X9J8VnRTDvDgN3dp18utPmWBErIGMaP
	str95OM/0kIwrWVct2IVvFZUM+7ze5diQ4YkKbspWS6ZeBSn3kYOS/bKzQvUca+R
	aZQ6iJSDqh2/dBFpVGDrLtl/hCzC8lFKRtAqJ0Iw5SxBQJrSqqDjOfEy4997YK+D
	uWA24ql0Z9mzchJRpQmcBOOQ/xanKQI0u37f6iTarIDvCUEXSlnOWQx5DIWvPlsH
	xF4a3DjV+CVai0dQQnQDwmPcDMb56JCd1v93k3K7SBKJ3SIagJImomZd5BSaIsR5
	U3c4SA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5fc597b7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 11:31:37 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a8a16d84eeso550374a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 04:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791372697; x=1791977497; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ziTRJRTyTHrXpykIexrVW5H3SlT4DMRvLBq5cG0RzyI=;
        b=D9ftVWWJSLosGtz4EcNp0yXzjcJSm6+x4fFl9xd8yB/OB+h/pwZ/kU9X6jyz2ckSIw
         PiWBtare1k7TrZ8mQX9afcFHhSCx80Kz5EamS92yoE5cKsuR1LrbJPAG4z3SOxGv5JYS
         SVQ0ILUi+IHhaYckIy5yz+ULUBLWbvhyb2pLK3Z3T+PpHUeHFP84dx8tLR1SiUTrJQjw
         j+/kPE27mE9eAz0vz78YFJ9LOALpIEt1+GkO7+sc5amABpEN5jm5ttQnFo3ZMJQo0Ne4
         9xX6awTKv1k566CdRQTtGpfMcy5Wn9/ryMJYqbA1oUE9wFPGhpEr8noG9nln2BYplbKk
         hSoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791372697; x=1791977497;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ziTRJRTyTHrXpykIexrVW5H3SlT4DMRvLBq5cG0RzyI=;
        b=P21WJjWi/xDXToLSSiS5K1MTVr37oKICldSj7rZAKymTfg5hsKnhKY1Fi4nqJfFu4a
         Swvs1y8IdIi84nt/bAbrjnu7anR+McMFVZSBAtHbUZYbRLAP47AMvIdSxNyLJ5n/m+2C
         2AJe3pPVuUF7vJoeuNPzZpqhJns2gI6J5iiQVJzzPaF0C51fs53+6IkcVS7GgtpA/cuE
         qsaDwDQNO0GLU1WjA0MvIe0xtq3sQbV+TzzrVP6NN2vsvpMAnIJ8fdTwSPg9m5PHGBqP
         0hfGHjBRzC7EJGZQ+YFWDiBrFfg/9fvUCUoLgl0u9QMGoRgy6AowceB9I3WzeXxjAmzA
         c/vA==
X-Forwarded-Encrypted: i=1; AKwUvBzRfLfVbGGIvXf8fcRSfQPb50V45Mm1GZ0MuF3LPBX+xoeb0h9vWtDqyeqGNkc4IzUBgcqtPOdBsIHJk4g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKyF+Xyh0umu6m+ZgXVkft4sr46sFBIYDANu8HB8DahbrUxErQi
	hgRPLRopY5Z2wWgYWcp9GdyKbx78eO2HrMB0tf5lCLqC3XgrNWoUSkSOZ6CNvum7pstuIzKEgUE
	0oeSVj3tExI6XUVBxsL7TREK9gjSJaSGsf5ZHNyfcXnbjRyYU8PwV1nuynr80HhI1ets=
X-Gm-Gg: AYBFou3v7Ph3zdhwG12ELGE7GGnJKiUNFItYUcfDCLpaZgtFlLGuJEEcVlP1J20/XgM
	V0g45o433A8IbPodyX/Lmw0Wqi5KuG6A6/gdiHGmRRermroZxrN70CzTzFw7WY4vpzW9RIJ4Erj
	ubn7gGuN29XNaMDN4i503lugOnlXzYK9OVJVE7HSL3xuWFE/WrtYtRutx0z2z3oVjYlKxoqlyxM
	Djkl1jztuXiZ1X2Fid2zbHj+AtuD/cQqYwXTzkY/rLY6JRxcsqk+hI3JGNsMfyMfm9xG7IioPp6
	naLYWAocwExavs5dvyeAEvQbMwK8Wrz/qcW1bIBKoTfVRiFiaY/ayfeqgBpaXoNJAF4aHcN7qOd
	OJITBBjEDx3tk9+Czwj6G5Pvpx9dYwXTWyA==
X-Received: by 2002:a17:90b:5887:b0:3a8:495b:d65e with SMTP id 98e67ed59e1d1-3a8a0509324mr1473449a91.6.1791372697130;
        Wed, 07 Oct 2026 04:31:37 -0700 (PDT)
X-Received: by 2002:a17:90b:5887:b0:3a8:495b:d65e with SMTP id 98e67ed59e1d1-3a8a0509324mr1473424a91.6.1791372696629;
        Wed, 07 Oct 2026 04:31:36 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe0d9sm8388515ad.20.2026.10.07.04.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:31:36 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 07 Oct 2026 17:01:05 +0530
Subject: [PATCH 1/2] Revert "media: qcom: iris: use disable_irq() during
 power-off"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-fix-disable-irq-safely-v1-1-45746f9a92de@oss.qualcomm.com>
References: <20261007-fix-disable-irq-safely-v1-0-45746f9a92de@oss.qualcomm.com>
In-Reply-To: <20261007-fix-disable-irq-safely-v1-0-45746f9a92de@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791372685; l=1211;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=OJRJ4n6Rjp8IwVJxm+5+cJyXLWroXFMzWgufd/STv+8=;
 b=Z7GoTmlct4HZlMxWwHDHbrNoLZPNxj554mA5a1vTb/et2ymndTTHPJpHgH1Vzo+2yKEBfGRJ0
 VBrv65Ryv9YANHRUUFJWfqQJmH4ig4O0VHNeZgwGxA+S1eiXju8dxqm
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0NSBTYWx0ZWRfXxz0OTfLPtdVW
 udLJezU+2m36Gjk4oKDBiPXnvFSdwiWJNVdvo6gnm6ImuXOCmm75Mlv29NGk6ASQBWoNiwM2KPa
 jxRED6nSHZnenlr+98cAylQJIeXBivM=
X-Proofpoint-GUID: 85mXwJJYSAzTyqSpVWn7qg1kRFzh4uxX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0NSBTYWx0ZWRfX2rY3ig3TcnFB
 U9ppYZk1WoMuAV/DV251bF9awST4W43lnz60LSUJoRY4QTDjz6X14LGWOgIJZ7tTnNBkGtYc8Ro
 ou7dUOU1B3zgIE/dMFNPgpnVO6fhVT2Vtu0KZfmHNHvLuhodWcmWGLGGMYR3dSLGVTASKMNq0Qm
 joG5e0s7iRL7WbEKFIqclfx3NwRDPwPMMgBF8gFlxnsg9z8s8yHmS1DFirYviDKIMiRuRjt+fgi
 22eyp6MAED6DnxB67PwX7DtLmHd60ddPSZoj7C5jKPXQ4VsDcdsrhh+zUqgQZfFqsRZzEYB57bj
 YCjVT8OFTee1sjy1TMk9i3vYH8NOsdw5eSRnWBgspAkgeFOSiz+zZjSOldReW9m1Zb6bQi8ERYH
 PiyJrgdEVQq9QUBZoI5DY0fONGQ1yXhV4hvc+MVq9KcrScq4Et5ZcRyvCj1i09PS4G5xr2A8Jx6
 SmguhKBLNUvxQUEjk6Q==
X-Proofpoint-ORIG-GUID: 85mXwJJYSAzTyqSpVWn7qg1kRFzh4uxX
X-Authority-Analysis: v=2.4 cv=a6+lZkSF c=1 sm=1 tr=0 ts=6ac62d99 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9tjrYt7ayRFslicBUeoA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070045

iris_vpu_power_off() is always called with core->lock held. The threaded
IRQ handler also requires core->lock to proceed. If the handler is woken
and queued around the same time power-off is entered, it cannot acquire
core->lock because it is held by the power-off caller. disable_irq() waits
for the handler to complete, resulting in a deadlock.

Fixes: b9c2215bdedc9c ("media: qcom: iris: use disable_irq() during power-off")
Cc: stable@vger.kernel.org
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 243bd845349f..1e183fc4e58c 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -240,7 +240,7 @@ void iris_vpu_power_off(struct iris_core *core)
 	iris_unset_icc_bw(core);
 
 	if (!iris_vpu_watchdog(core, core->intr_status))
-		disable_irq(core->irq);
+		disable_irq_nosync(core->irq);
 }
 
 int iris_vpu_power_on_controller(struct iris_core *core)

-- 
2.34.1


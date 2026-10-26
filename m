Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793021950;
	b=O4prpSyxETTsEsZD7VnIYxQJY+DaE32SCqB1dRLjyFSuu4F2KsdD2V7CQkXbJ82A6u43
	 I4BfImCMWdNv76iF//51ZGJ9BdaTZZicvuT6+xfK7j1npoCarXtcrcEyFC54NneRHaL78
	 4NoxeAM9AjEn9yRiiulYyetHnX0DUAr1/fF+I5GxMPzFcfu5Q5mouoIGMXoUHEtRmguDD
	 nrL+EwAJAxIz2BlnagojG7Kloc6W7S7jtORXU0gdZx0NTEC45Ie76LL7mxOzb+HLQYUYi
	 m1QsKnoSvpd0G7dC6FGHxpaFXy/DQOzoxXvBlMdXqc/HVyn+G5y6WI6q4sipImEBqGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793021950;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0ku0n+AWyS068N8ZBaElNH97qO9hdY5SJN2t7eC4tJw=;
	b=CB8QLx2DcMErp6rS3B0WqzIvm0RCmQvs7kF9VSQQrChJF75sfum2m+6L4QrYuu+mhjnF
	 qhJMIh/Ujgm5YgyYp8MI/T+Xbrcg79UZAKCqzwzXTTuWO7N9NY/LwN5EtQkG7VHzvV/bG
	 SWqaWs3k6iZdevDvIpiOg+KRF+/ugVtGWhZvKsV8sGM9oglpzxOBCKkfBpORlPCYm1/OJ
	 o7SL0qkB2EG/XyvQkGkgJTzRqzULjGeZr7yrmIxRD5eo2KU0zCwI300B3EmVequune5L+
	 L0oa8Lb/PtapThgyiZ6XTUw26gWNU6oqKhddc2Zn+StlmkexZqaQ3A6l+CcL592nCmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mLCwVPeM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b+utxqYO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20E2606AD12
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:39:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C20E2606AD12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mLCwVPeM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b+utxqYO
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtEcu3034730
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:39:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0ku0n+AWyS068N8ZBaElNH
	97qO9hdY5SJN2t7eC4tJw=; b=mLCwVPeMvRM/fvlW3h+5P30HlbQiwcV699Ln0z
	bs8CTF1D5vzH3zDE7zTFmz+pkLkJ3fPEuXmLPp4ZGTrcnPs5gE85x4iGpsBbGKbG
	8DdWHZP9iaQUTC/GkgzlrDtn/dgWu34g2ZA8oXHfDQO92gokOob8pkYSdc/oJFoE
	jHWydzuYEt6qRRXmzVgO8efQV4o0O1669IHFfZBTtr9Dr0AJ1xC1qBfjBi5kjfS5
	s8qR22tnOfHoN0QjG0UcJqes6K+BKoKMSSrFx682qn7E8fUxI+S9vgV9nty5W/G9
	/N5lgW0AT0muPr7fZYElTsfQx9J53APiKJVsjG1oEhkMX9Fw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj56y0nnj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:39:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f1e62510cso758238985a.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793021948; x=1793626748; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0ku0n+AWyS068N8ZBaElNH97qO9hdY5SJN2t7eC4tJw=;
        b=b+utxqYOH0kRQUugC+B4wRTmAkddh8mZAT0qm7mQb5lYvqxw2MOZ7+2gL+t3a4GJ5/
         680vzN7Jw6iWuL0rPbhEBeXbZmesyq1eRJNpIun0FghD7l4amILeeGrHtbxEeobPkdaw
         lu2wI2/sxyIoqu9DFDBvdrtca64U4N2cI2y6mkzzd2Uacjx6y17TAbrtu+U5RvAE95p/
         YGYM0KqGh9bsjpGQLPhGh/NJIMR2+dGmhgbwq0g8s6u6Ata19sTSCUon4hQhHsL2G0n8
         sFrU/S/hHqWScfY9UdCWDQdzatGgf8Ldfp19q5t2rieqZVuBVgoVaW7rn/guuEhS41Ke
         hC5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793021948; x=1793626748;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0ku0n+AWyS068N8ZBaElNH97qO9hdY5SJN2t7eC4tJw=;
        b=j8LQZTo3w5IAfa8vTId0a9loTFFAXQ797cEf++jAaWwkEjhAMhi9XIN7W/eis4bvKc
         7y2qdoVmnKx2UMzwnqhmtDf58gk8E47vFQ71Jr4zYFWLmqPt/1B3kfSFdzGi8AfxX1Su
         8+i4/NKMWaa0VpMkNXUQv6pe/rYiw02cx0+cKJNmhQSK/6UFWz+0KP1jWX8R3G87EDkk
         rEy/9kjIBkkDBUi2qY7hpbp8GR6qorDcFflZS6zuDoNXr/s76Lg5YyxcUEyxaNEZWzaq
         V59C87uPcWiC/MTe7JYE6TO5G9/0mPo4B/fDrq5QMBt/RcyRT9MitjzeOHC86l1WfikT
         p6/A==
X-Forwarded-Encrypted: i=1; AKwUvBz6WYKg7Jo1IERR1eA+E+Uu7dRQYIN6UX7RmbPeSWNqPfARdk+DhGNbO0ZfVMZT945vSpxFmFMQHMbJwI4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIgGGCUvy2EMcprV8PTZNnbDR1DbAhQZHQqg7r6EoAYlYJmYL6Z
	JcfpiW56Q3/bqWreBUy1Ii1IOv0+a5rypy8tG4p5iiFj2Ec4Kzs2ioF4E9556sbCApFwM5/3hxa
	9pkGotO5gFQT+184HOXgQqzS238h8IGevdchBY2/XdJMYBQwgF7xEDdCcaY/IMePls8c=
X-Gm-Gg: AYBFou24DxTuPZS7sUJq+VwruNsiN+QzhL7Pj5MfmXkAMB0Y9ELxBDiPpkPG26fQ4q5
	cHmWrwr+v3bJhvQKK/5UlyVVKyggSfb6GM98JLL4Zk7CVx+fgdCXl/3dEFnd28N6MeF+bN8JyBx
	8RLoW/yCh878k+mJowpY4jGgdXfeM0qYrc50H1yEGvsTFQgMlyxbLmMBdBzGEZ9bZzqA/HoArL6
	ddt8enxy3yGbWwIf6dZptqWvd0fT/uWvti24IwH+ilxt0eW/rGB9OYcs/O4g4mMittqwnPtj2C9
	9LPhscGw5S88krk8mfs4Iw8oMF2wpokkDdpShIVqEdS17gW2HhPm7uP3Z6M4muul19JkGHro3KN
	tizUnNSLNsw==
X-Received: by 2002:a05:620a:700c:b0:93e:c12c:9b71 with SMTP id af79cd13be357-940ef9d9d92mr934129585a.76.1793021947816;
        Mon, 26 Oct 2026 06:39:07 -0700 (PDT)
X-Received: by 2002:a05:620a:700c:b0:93e:c12c:9b71 with SMTP id af79cd13be357-940ef9d9d92mr934122985a.76.1793021947160;
        Mon, 26 Oct 2026 06:39:07 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ece5e4asm16285861f8f.59.2026.10.26.06.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:39:06 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 15:39:00 +0200
Subject: [PATCH] media: iris: Unload the firmware before hibernation
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
Message-Id: <20261026-b4-media-iris-unload-firmware-hibernation-v1-1-c1af57ac16b1@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPNX32oC/yXNwQrCMAyA4VcZORvoOpHqq4iHtM1cxHWSbCqMv
 btVj9/l/1cwVmGDU7OC8lNMplLR7hpIA5Uro+Rq8M4fWuc7jHscOQuhqBgu5T5Rxl50fJEyDhJ
 ZC821gsfOUQicIrsAtfdQ7uX9e50vf9sSb5zm7wC27QOpCOBMjQAAAA==
X-Change-ID: 20261023-b4-media-iris-unload-firmware-hibernation-930a88ecbe08
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3166;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=8kyPkDfI6goc5Kr9jMIvZXHilfKwZ4176ZzMJD7CRwA=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq31f4TjpkujEUP9uK28XPMCxTt4dz5qRdn6JeI
 2hT1TpUrFKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCat9X+AAKCRAbX0TJAJUV
 VqDgD/9NZ0deArMjTnahK9H7mCyQGnu030zgWKjouuK7fjU4f4INDfWo6FRlzv3sbWBonF+57I6
 qx4LcQOJC+eXOvUnJ/W1sY2B9Ctvv7LSPo7X1fajmMmlFzq+If0MEkEUg1pC3aIAdc+4DiI9vFi
 sGiyuBiA3gS718PYmwURqTnejPNNAOD+tGJeMBxDEP1URN8li6iEzLQgTy0vzxGyA0qggXCNl10
 I15oKbm6UXsCGDYgggNBm6yLgMP49EkVaZoM2pI50Y3JhcAS42MemqV7pSy1yznqsGEg3Op/kbh
 vZ2RA3wS7cji/zoN7HB+oAH1YeWmnwoM6+LcSzcSsdAezZ38AmirNxqEAKu+/cCW2s5ZQwyX4EH
 k/cqEAPr5pbBrOulINF7oqVtCoeTHFji+SNDDsuLzI7F+3xpfxWDMsIUk/FKVA/6/yBND6BNo88
 PpAJILS1h5FMFCT39gM3jVX2kdskAOTvX0rHoQJV1wArXqE6vk7l85PC84N4UHwZ7swnmSBa1Mv
 1M0yjs6XIBJrDgG4VveB6PhJO4g+apMCQy3yjI20Yb4sHkOG+JwrudfvCVrsvoRxu01eJdtj/q1
 Aoq2tAIBU+hS/mVor6NISBQ+D6JJHICE/n93/HXNKwa20VhwYOg7mE8LLoarvxlH9lqKzmhNLi6
 WkuQKhQE6NJ4flA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1NCBTYWx0ZWRfXwSCeWukW1DHB
 x1bVUTaGf3PdFX2GXwKZJPABV3LGDjQBbZClZu0lfhbR/is27awpNpzmL2ux7SK4FHspbVvExGj
 tGScXe8G7WdPywFGD9Ml6xIzmOZc8lI=
X-Authority-Analysis: v=2.4 cv=eMeGH3p1 c=1 sm=1 tr=0 ts=6adf57fc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=kFMsFxLcyhbFiWjYUuMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1NCBTYWx0ZWRfX9vsZ7Kgg4Wb7
 9DxYAQOVfY24vaC4HnuDZjyXJAyX0dkXOIiT6ylYCw/Y2dYZ5C7GE2HlEdRgZ1HoNJdi5UlZQLL
 N8PZ0BDwXeCQTDeMhnYS7jUWY0t4qh6uefIl+I54M7u2Zx08IpJn8WHke2AXSrANi1JHFYuTZy3
 nMbaFo7fErvzS9R2D27xDBiYl00OBNr19Tp4y1jbEx0+VFTnabpw4jLmVfvDf1cb+qRUW+GAaO7
 6nUKfXUfdYlrpn0ndqbh7QFb/LK4c/Q5xrrncV9QmeBbiZsuvVInkY4S8mdT6KoOtNaMEQOh3d5
 6/uBg69fDW42nYAn5+OeE/F/owPF/Rmh8zZ390gEQoiYEyOAEpv/iUkPyv6vH+BFkRIpkb4STBj
 a/mHuVO5/3pf2plrxFAzooMtd3WueJSVS59Rk8lG3n6oZ3k4uCG8kk222injBnFRENNnaT5SL0P
 ZwyotYZsS3yUeF/wSPA==
X-Proofpoint-GUID: oeOkIBN_NzNZE90zunchD9bo2WS2F7eo
X-Proofpoint-ORIG-GUID: oeOkIBN_NzNZE90zunchD9bo2WS2F7eo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260054

A hibernation image is restored after a power cycle, by a kernel that
may have loaded the firmware itself. Neither the firmware, which lives
in memory the image does not hold, nor its authentication by the
TrustZone survive that, so resuming the core from the restored kernel
fails:

  qcom-iris aa00000.video-codec: failed to resume

Make sure the image does not hold an initialized core. Unload the
firmware before the image is created, and before the kernel that loads
the image jumps into it, so that the next session loads it again. Keep
the system error handler disabled meanwhile, so that it cannot load the
firmware again behind our back.

Refuse to hibernate while the device is open, as its sessions cannot
survive this. Failing them the way a system error does would let
hibernation go on, but would break every open file handle on each
hibernation, without userspace having a chance to tear the session
down cleanly.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Prepared with help from an LLM-based assistant.
---
 drivers/media/platform/qcom/iris/iris_probe.c | 44 +++++++++++++++++++++++++--
 1 file changed, 42 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 41dec90f3e2b..ea77c573b333 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -411,9 +411,49 @@ static int __maybe_unused iris_pm_resume(struct device *dev)
 	return ret;
 }
 
+/*
+ * Neither the firmware nor its TrustZone authentication survive hibernation,
+ * so do not let the image hold an initialized core.
+ */
+static int iris_pm_freeze(struct device *dev)
+{
+	struct iris_core *core = dev_get_drvdata(dev);
+	int ret;
+
+	scoped_guard(mutex, &core->lock) {
+		if (!list_empty(&core->instances)) {
+			dev_err(dev, "cannot hibernate while the device is open\n");
+			return -EBUSY;
+		}
+	}
+
+	/* Keep a system error from loading the firmware again */
+	disable_delayed_work_sync(&core->sys_error_handler);
+	iris_core_deinit(core);
+
+	ret = pm_runtime_force_suspend(dev);
+	if (ret)
+		enable_delayed_work(&core->sys_error_handler);
+
+	return ret;
+}
+
+static int iris_pm_thaw(struct device *dev)
+{
+	struct iris_core *core = dev_get_drvdata(dev);
+
+	enable_delayed_work(&core->sys_error_handler);
+
+	return pm_runtime_force_resume(dev);
+}
+
 static const struct dev_pm_ops iris_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
+	.suspend = pm_sleep_ptr(pm_runtime_force_suspend),
+	.resume = pm_sleep_ptr(pm_runtime_force_resume),
+	.freeze = pm_sleep_ptr(iris_pm_freeze),
+	.thaw = pm_sleep_ptr(iris_pm_thaw),
+	.poweroff = pm_sleep_ptr(pm_runtime_force_suspend),
+	.restore = pm_sleep_ptr(iris_pm_thaw),
 	SET_RUNTIME_PM_OPS(iris_pm_suspend, iris_pm_resume, NULL)
 };
 

---
base-commit: 20a33c6b6cbe7e4805dfb6cd68816937443aa148
change-id: 20261023-b4-media-iris-unload-firmware-hibernation-930a88ecbe08

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


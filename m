Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E000175A6B
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790987239; cv=none; b=kdU5mX3bcB5gLa/FLA/uzUeejgnF15LdfC61kic1yio4Tx+iBKfmH97D05YnkmxBaO0cwRZoyLwNUzQpOKh7bvil8TZtxdZWHdI0pW1ekm38hPvw/Z5CylFwBStNFWrLU/nTznYFdn+UVC776OOrLmxaIvWNiFmj7EiazpJYEw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790987239; c=relaxed/simple;
	bh=WsQ21XZW4TA3F25Pv6HWJIhCOEkArUvMa6B6iciNKmk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ix73nYjMo4Nk8VUUWzaDqrYMHTStA7aP/fuou7aBhzVtiQlUqUwqvyGHOTQqRfXFBoYNQCUD/MpRxojtDh2gglavPOnEwD4UlGgNndXIPb4gMkEmHiXto1HUq95cCWMTNJGmUFD5AKTJmTfju8X8Q6aqZ8TFRjMvcYAl6oZ8ouw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i2+7A0Ss; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eQwH5+Da; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i2+7A0Ss";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eQwH5+Da"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692Ndwqr2941772
	for <linux-kernel@vger.kernel.org>; Sat, 3 Oct 2026 00:27:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+fZhaZ82V4/5KLW1sTiPxhoM8r1KKvfY9E07z+Fr920=; b=i2+7A0Ss++IsHniX
	jHZr9RJOBCCvs8ix1FidNc9hpbS2hwzCdOcOBjJccM3r+epDo98tFvi+YEMli+Mz
	1kSo69Ut96F/BEilf19Uww3G8c69QkaUlCBe0ZjDrX/nYCeWXAiSGMMuGkWgAKAR
	byCgfvYXa4iwtLE0NJ/1cS4CDAzVJeY29ilSr+bDj1H2/GawkzAugsKTD5V3KmOB
	tLrHOpTsyleUv1i7EMDl0z4/N+/IoDzP0yUBqwfrsJFh4CpJCtRrUhoZng3/sCx/
	Rm2mEXj6d+1RbitUajeAUz8kUx5fZOv3DDe2wXSGx7B5NGuLD4HJ8UGD7V89biyP
	QcAw5w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2h4ksdcs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 00:27:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cc40759b2so12333085a.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790987237; x=1791592037; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+fZhaZ82V4/5KLW1sTiPxhoM8r1KKvfY9E07z+Fr920=;
        b=eQwH5+Da/w2yTWjS9rEIjBgH8bk1vrLhXhAVWXe179QNekBGTFELIvJP+5LTagsvmq
         8rbmnCCtho3BQnRR9wdQqJrOScrcB8Zn2TCDaIhU39+kqazftf12vV2oBc2GhLIsh0VX
         iqIuVaeo5bt3CwGxv7iE8KO0HVFA9xK7hqeEHVg9amOXU+xhzKfgt7aIcZxjM/fRAYlD
         ltbrxJSTea+0F0bs13K5OrFM48myPgX4KwAvSofn5V3ZL1sZWCTGh6R05IvL54Iig+g3
         L68R8LOct4gTATNEVdiki2UWxmFPJerreqDrBzUW0fiwB5wpeQl5qH1pcvre7obrgXEC
         sLdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790987237; x=1791592037;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+fZhaZ82V4/5KLW1sTiPxhoM8r1KKvfY9E07z+Fr920=;
        b=WGrrFGlnwh8l9AZlIv0z/eBOP9rulXU/Y2P1vdKs6DGY31bq4MX2lHKs7qsd1Ts/UA
         XbZqgaLEnimZvefLiCghOf99ZdOMjhImfT5U8YLyKydmqXNPJa84aHa4wXJrHz96lg5T
         rfIgSkE5sqYtsMbMzarRa9IYh3NOcoXlBZsOIfZL87GvQ6brosyoGxoougSCv7Gy48tx
         cNuI5hazP7YGgr7TbfMizQaF5Kuf2uIZ5FeKo5UwQAPRVcm3rYyF0xLrEFn0cul99tfS
         XM4sZvcaAAQLk61bgMqS1a/cb3Wa1SHkWliwwfZYDuZyjlWMuN9xX4/Rcw26dqVSLSs8
         bpyQ==
X-Forwarded-Encrypted: i=1; AKwUvBy0qKK3mw0xcSMOCzqMaJbS6mfP1vEGcL8O53rZfggvZDPmZhl4Do9NOkqI82UYvunoqNnkU/XNFtA8DNg=@vger.kernel.org
X-Gm-Message-State: AFuF++koD9y+g9tW/EnDikSw+hJmVErLqxacomZknP0+arkN7pgYOZ5B
	C3crOk6Wlufscf/N5bxRMgH0mHLqJ75atRJD8bGxHvG22X4dLUUzCW7IJk7yFuURgpuizB1tl6a
	Xw/bYbCmRXMazclU+sQ8HE8/0KqWH2y81F/UN7FB0/z0ueK1HWIvKqR67/3rzRoCn1Bc=
X-Gm-Gg: AYBFou1UhEEveKVhJcD5cpgLOYp+e0m7ZIobitCsR69SiZg0PD3xOezyRoQ4I3oL966
	pPfckmqODE7f02AMPAXHJVGJr/AxkKFDzgSq6gCN7Pm+PqQJvEYDr+KcbpP7kegtnCP3XJgsJAV
	NZLaMTfzYJte9eFd//7Rk7OqDAVssM1X0GaXupxZvSc0x/AqO8PvyqKaajlx4j/iKPSQjUxKsLC
	a427YZg72FX/QPb6ytJDDrNGWZMbpcWnCmYZwDxPOppLg25seiIPqsW/zYcdfkA3d2lVDOUZsMk
	hP4zbhjwpj97uSH65pio3OBmpfhbGCHiAmUQ/fKnxlufk5+yOZin8FjQ+rfDTplWH7L+xHl6QE6
	c5AOZY42FjAk1V87FSHzyCVi57502z+k8DPM82Lb70AesuAGbP9DSKQnvrafXTNeyuQjH7PmVtP
	SsiRLNnTE2hy/I
X-Received: by 2002:a05:620a:d88:b0:93b:d7a0:d9e6 with SMTP id af79cd13be357-93cf19ccb7dmr856259585a.64.1790987236711;
        Fri, 02 Oct 2026 17:27:16 -0700 (PDT)
X-Received: by 2002:a05:620a:d88:b0:93b:d7a0:d9e6 with SMTP id af79cd13be357-93cf19ccb7dmr856255985a.64.1790987236227;
        Fri, 02 Oct 2026 17:27:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb86e68806sm1120705e87.4.2026.10.02.17.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 17:27:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 Oct 2026 03:27:09 +0300
Subject: [PATCH 01/11] drm/msm: fail the snapshot init when its worker
 cannot be created
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-msm-kms-destroy-fixes-v1-1-e062b7dae77f@oss.qualcomm.com>
References: <20261003-msm-kms-destroy-fixes-v1-0-e062b7dae77f@oss.qualcomm.com>
In-Reply-To: <20261003-msm-kms-destroy-fixes-v1-0-e062b7dae77f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1898;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=WsQ21XZW4TA3F25Pv6HWJIhCOEkArUvMa6B6iciNKmk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqwEvfRImEwWEXqzztO+y8szwPWXJcWhAUSL3Lx
 jJ3aUKCCLKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCasBL3wAKCRCLPIo+Aiko
 1XpkB/9v1i+FsbBEgX2l/Y3XD9Dfm9TxNiseu2vyBSwCLlwwRTI9doiPEIuHx1zX/g1XbiLVxXH
 JL8e/xHpSdkv9UyuIT+LAu6TJ2pz9eEY1fNLREtmFOnNsK9l8XjwCX7ZM6HsZS4kP4rpc7UZIXN
 LP+i9RHDihHWw/ehyRfIaRPVSTyLpQK85ZD2GtmSHhOknK6qBaVyxC7yucToiEXb0I9kNMn74vE
 FDR5tXdrvfNec8/38HpD06qROOrVTye1ZD06WaUOyJNDoPJxFAbvB+Pz9XcnZR0bkxSPaSdwhly
 99yAK1fP9Ikp3p5ZVn2ESyYSrbD/UuA7Y0q/WYwf95b3N1RU
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=G46JgNk5 c=1 sm=1 tr=0 ts=6ac04be5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=D-zmcGmn4BrKCB6hg70A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: PIJiObSz0vGKcc0abVkY9Ovj-WBh8TFA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfX5XxjYtNtb4+K
 r2xFYMHo1vPFB3i9vfOPCpXNAm737266XwK8X5zoLYWy8Ct/gwfdjQeLUpMBoeYSf5JJhW2fjcU
 jNctJnY45dd4nOZGIbI/jjsH2tVCDNYN7ZWBZsOTq1CI3tZlpjFj9iEaTpCvl1/Umo9SDhHSpbd
 TFoxykkEGtbPaAwpQjPO2HShAh7/uQiKSlMd5MJ7Pd85aLdsvTDrAE6hM/X+/9kKmeYVTo1rJhO
 FEMnZJYgpfhbVROO4UdmEE5QC0dx4mEzpAbvQ5lKPB5r4URoa578nKFheGP+LGy4XON+UAYUlRC
 te9OWrNFkaR328h/fv/wwXZ0sukJ88+F8V3IuL82zDktUe1mGAWmy/k20TNfkWLkXU5wZ0w9cE5
 WQhaSFggxtC5uZPgAwMd/73/Fb8xXAt7EJQiYpJZ6lNIs/PKNAOqYuXt2lsRgrZuWkmGwm4XHIM
 VIlqMUPtFaVKmCQZ2ug==
X-Proofpoint-GUID: PIJiObSz0vGKcc0abVkY9Ovj-WBh8TFA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAwMSBTYWx0ZWRfX4qotzg99a63Z
 pFCX7z4+dSHJx9YuGrnJsTgHj2Wzg0B7VWpqQIv0h2c8EWpkXow9Glb2elxitLra+VUjdJGfybe
 dnw1tDly+MQ1/p6EPzFBlYThxro95NQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030001

msm_disp_snapshot_init() only logs a failure of kthread_run_worker() and
returns success, leaving the error pointer in kms->dump_worker.  Both of
its users then dereference it: msm_disp_snapshot_state() queues the dump
work on it on the first display error, and msm_disp_snapshot_destroy()
only checks the pointer for NULL before passing it to
kthread_destroy_worker().

Clear the pointer and return the error instead, so that the KMS init
fails rather than leaving a snapshot facility which crashes when used.

Fixes: 98659487b845 ("drm/msm: add support to take dpu snapshot")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
index d99771684728..d1b10656e41a 100644
--- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
+++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
@@ -98,6 +98,7 @@ int msm_disp_snapshot_init(struct drm_device *drm_dev)
 {
 	struct msm_drm_private *priv;
 	struct msm_kms *kms;
+	int ret;
 
 	if (!drm_dev) {
 		DRM_ERROR("invalid params\n");
@@ -110,12 +111,21 @@ int msm_disp_snapshot_init(struct drm_device *drm_dev)
 	mutex_init(&kms->dump_mutex);
 
 	kms->dump_worker = kthread_run_worker(0, "%s", "disp_snapshot");
-	if (IS_ERR(kms->dump_worker))
+	if (IS_ERR(kms->dump_worker)) {
+		ret = PTR_ERR(kms->dump_worker);
 		DRM_ERROR("failed to create disp state task\n");
+		goto err_destroy_mutex;
+	}
 
 	kthread_init_work(&kms->dump_work, _msm_disp_snapshot_work);
 
 	return 0;
+
+err_destroy_mutex:
+	kms->dump_worker = NULL;
+	mutex_destroy(&kms->dump_mutex);
+
+	return ret;
 }
 
 void msm_disp_snapshot_destroy(struct drm_device *drm_dev)

-- 
2.47.3


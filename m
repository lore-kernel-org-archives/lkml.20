Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64A3155C97
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790985790; cv=none; b=De46Wn4T2WMs7s64rKA+dyLakw45jFeejXqux8fyU4VhuL2Yhno2qUhI6mY8BfRoby72jnAus8E56pQHVQ0RVDEwjc82lX5A7kyIWcP7Kz9i4tFcsZzlCHskx9yuLnQChRGv52xvAD5I2MqJU1UvIENakfkHNWVY3yUiCat05zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790985790; c=relaxed/simple;
	bh=IRuLvmE0+tzW0ijRMXTcaAZ1rYCTxwdRidPidjqJ/0E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MdCs75aSW7dVjLjTaSVAexlucBNehDUZ1cJfVnC1eNqz0iIpVSZgbMv9nwissybVTpKKyUIMswp//EK1t41vwNN97vbwRAxwGIrjt6Vn1AdL3bLPzXNu6sO2iNfUT4UCQLz9BDMYXVznpFI2oD8/j2d6EF/FOQU7RQbgaKVzVAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=asQbKqKI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KVchBZ17; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="asQbKqKI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KVchBZ17"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692Ne30R3884021
	for <linux-kernel@vger.kernel.org>; Sat, 3 Oct 2026 00:03:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YybtDh5zEBf5n1HBSnKt3zrXz3bWQXQ2umvjEfaI73I=; b=asQbKqKIh2o/8EDj
	losj1YeP4jpp1AzPC1XXVAvhtttxsbWvJTTxb7vCNwzzCIqvA/Yz2ZFqkUqrMTEc
	9Tx3C1ZfkGS3O25dQWovIEdooc64/0FqW5IyATVTpdtGeXnaPhrdFjwWXZsPa8EF
	xvJpJcMDNn1JzLdBPjJzeH34/MmO6EY1sNp6/n79CCDCxSoK9/Wl5w892op9yu5A
	NLQ7fvODvevJD4cQCWWEjyhORJddj5YnXf//sz2r+fGwBv9INzXUOzFwAjNtds8f
	WNogmy654UNjrfzu76dPd/N1g8gapksaCtz6d1fKR5vnCRHShcZv5OeYImQXjsGo
	rDI7xw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h26bp3y22-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 00:03:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9308eafb465so25364285a.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 17:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790985784; x=1791590584; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YybtDh5zEBf5n1HBSnKt3zrXz3bWQXQ2umvjEfaI73I=;
        b=KVchBZ17d5m/SzYReQFs4Dt50p9BvAHmld5kWXZaH8FLOqynu5dSYgbMr31MIe/RdB
         x6uYEmnHQ/gB8OFOg9aUE3qWIa2uXQYkdcmPAXjs8dPW8EyJpjvpALncI7MyUnYmG46b
         t3zssiZbTL+DnUAVfeuaYPcbwXYE3a4aVI4RYR14wGVGuWHvxz0NlZraOUGwR3T26W93
         qTFXu3uwLo2FMF1TFzGo02rhW1U6Jnr5ajLho6uWcvz4COXordtWfPGhxrLaEoMAjFrB
         UI+z+CsL3lJkZsSZcXHTeT6vYBGReRhUFQmAXkXoWZZhMNtSaek0SNoKepcgIdXFLpoE
         fDeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790985784; x=1791590584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YybtDh5zEBf5n1HBSnKt3zrXz3bWQXQ2umvjEfaI73I=;
        b=n2iWdmRUH587olV24waQPXGnIAl4pN+1DepFKI8Uq/xJCWgYVLc2hKrbS4tS0x/imm
         DjqR86wgkOdGiua1XMBWKkDHPrBlbULV+/nFb61HQOhoknW1hkmZ31U1mbiN7F5OJsaG
         AiYJL2DMGVfZIAYJM9Poy12G8P19M68hzRR8SUHvyQUoN1LSxGXXlSKmdQiq49dFRmTN
         vPaMZVTHKofV6Kf9keUeY9QrtMAmHFr8CY2QKyGydMbVerwqhDHtzuHUSCsGMowRVJOM
         T9qkhn6Cq59nXpnUApUvdeosUhYB7lukEelHvebYJGlLmVgTBvGmTczNkBzVLygGBn/N
         T0bw==
X-Forwarded-Encrypted: i=1; AKwUvBzLyn2Qb4mvoCx17fLb7bJoGT4Qz9pcgC0459CcwkL/Xg4x1aNzDEb+ov7G3P+bkQumYqxVXpPYCEr8bkw=@vger.kernel.org
X-Gm-Message-State: AFuF++lWq3SnbUN5ngFrAusaQYPkwdTdJN2J5nisBDb2RgZ8LbUHr7o0
	U+vvp8r74FRWXZ8TUBaMdhTypZwIgDWJ9k6KcB1qmenQYL7s4HcHsZjzIF7P8xCICbXuldC/Wmr
	bOwIvt1/No2T5Vyi5YjFliN8Q4NbjSdDzsLlsBo3mmOsQofoAl25EI7u7FRsJ9b8+nJMMcRklcF
	w=
X-Gm-Gg: AYBFou0nrxx1DlRKaUdR8MJ6K9t7RsRFPviwWTXvIlIHNurM3VqOYVbmLMVps2XBOUb
	TMmTHA3MDbVneOEmZ1Qb5KxNMZlQ+3kUqxvY8eClNxPS/dKKo3yvvUamR2eo7bnvH/tJE3Cd2Y9
	pPXqAMGOU6aQy5E5ytCUvqt8fGq0iDdYgEd9smcUejF6vbP1jv+Y/j+ALjot4g2IBCJ58ov46S/
	Et7ONSthiVVoPJZXuYUSvWS7RwDDmXMpoRNqp+6Wcdt1Kjy9PHqEBThzzFjvlGee7ItOfhcfs8C
	Lz2yU433Poyia2VWNNWd9m1tji+rA4DLdfNv1ugd5BmvZ3ezaX1N+yDNFZ8Di9tOZUggDdYGvJF
	1e6MhtQOO018BbM8kqH1OUoEuYPFHlCiJiU2HWUwHRucPfSekxzAMgOUTu+oevKGg3JszHpQ9fb
	empy+xzpvDe0ll
X-Received: by 2002:a05:620a:4589:b0:93c:779f:3e02 with SMTP id af79cd13be357-93ce7c1229cmr768035985a.11.1790985784180;
        Fri, 02 Oct 2026 17:03:04 -0700 (PDT)
X-Received: by 2002:a05:620a:4589:b0:93c:779f:3e02 with SMTP id af79cd13be357-93ce7c1229cmr768029685a.11.1790985783682;
        Fri, 02 Oct 2026 17:03:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e2f7b4esm14234531fa.14.2026.10.02.17.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 17:03:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 Oct 2026 03:02:59 +0300
Subject: [PATCH 1/5] drm/msm/dpu: don't flush a legacy CTL after its
 interface has stopped
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-dpu-quad-pipe-fixed-v1-1-6a6a00917b71@oss.qualcomm.com>
References: <20261003-dpu-quad-pipe-fixed-v1-0-6a6a00917b71@oss.qualcomm.com>
In-Reply-To: <20261003-dpu-quad-pipe-fixed-v1-0-6a6a00917b71@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Jun Nie <jun.nie@linaro.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Vinod Polimera <quic_vpolimer@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1918;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=IRuLvmE0+tzW0ijRMXTcaAZ1rYCTxwdRidPidjqJ/0E=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqwEYzaPJb1yOKg749Bbkvh+Ud1a40lcWZEygV/
 hLWhbmEXGWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCasBGMwAKCRCLPIo+Aiko
 1R4hB/0RnbaZnho6vaxm/YNE51kBpPHAIdL5cZyK1p1F0i+SD1gw2iMxinqP9K+G34fE4eLN0se
 8b9q+vzJ4qGOMxSXVs7LBrbGZuc1fM0HlVALedgw1mMaDOhNKoFL0xmaj1StBwzrCNfRC+YOYBP
 u/m/hvCrNXjk7RC4wZLfUcFYd13VaagXGs6ZXAwtXamwmzvSZRr0RUP2BM/OgE8KTp4vWnsUxnQ
 i/JJfCBI4sr5ixtjzKauayzimLoJtI7GUkfMsX8dIknXeoqPbvmYcAhcxYayEM2UAuKtNfUxblr
 aUHrgVnlvnG4Yp8AwxkQeelgZelsKR5FtR3yPC801ELpAtco
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=OMqyTiaB c=1 sm=1 tr=0 ts=6ac04639 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=EynL1qdohFGk3j19l_wA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: XIjiTDpzULC15Xjx4g8oO9gis1PaoJPt
X-Proofpoint-ORIG-GUID: XIjiTDpzULC15Xjx4g8oO9gis1PaoJPt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA5NSBTYWx0ZWRfXxEkiiXhc98Pa
 UNsafyjIsWSm6ttx26m5eWUIm9S4Wi9l9VajH/VGbfCBtSr/5I8DozzgIieAAXwcPZLrUORTiO7
 25SBdjQKtez6Pb2Mg/efdPCo2UwVWDI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA5NSBTYWx0ZWRfX07i8hKusZj7h
 UEChoZuW+eg2K3/ItHK57ptqFJfS6TkDkcMK3t4ZhzAm0hwneWdmE8HyjJaeSyRlzdlvTGXaLtq
 ovGEA/hoi8pVjd+z+Z0FVoQMG9Xg46FDFTADRhrwqNACH+zjU9A+VP9dUsuMxrI/L0kQnSYjQ/C
 4JAUmeAdQzWz+NRL4muk7qT2MYI7JQzSkGKiYfqVc+TEInMy1sUVk5bTo9lmaVp0QQq6deXSwVW
 Ifvmgbw8xnuQVPcc8L3GMWo9Z6A8ymWYErduDyt7AmD9R1WUBbjynwmJxapyV9ROMwPRJGRQ0eK
 hsandYYtmZ83UiiEBE9LTdFpXETzk9KBE0dGEi0eru8XjbtxU5YY0bsHchRXR0YkyjMqq121orJ
 BYg/h1kxeJnlrPPHZS6gUfhv8yFMq1ZVm9Lb2uDPFVvm87XNhy+o/Z2foqddr8ddvEOLEou3Jlg
 XzTgr9KlPrpo7MdydLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020095

On DPU < 5.0 the CTL latches a flush at the next vsync of the interface
it drives.  dpu_encoder_helper_phys_cleanup() runs after the video
encoder has switched the timing engine off, and still flushes the mixers
it has just reset, so the flush is never taken: the bits stay pending in
CTL_FLUSH, where a CTL soft reset doesn't clear them either.

The next display on that CTL then waits for a flush which can't
complete.  On SDA660, going back to fbcon from a two-mixer mode leaves
the LM_1 bit pending, and every following frame of the single-mixer
mode times out:

  [dpu error]vblank timeout: 80
  [dpu error]wait for commit done returned -110

Only trigger the flush from the teardown on DPU >= 5.0.  The legacy CTL
gets its registers flushed by its next user, as downstream does, which
rewrites CTL_TOP without a flush when it stops a CTL.

Fixes: 22cb02bc96ff ("drm/msm/disp/dpu: reset the datapath after timing engine disable")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 1f20695f81e3..5a06a0fbc7e1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2339,8 +2339,11 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
 	if (ctl->ops.reset_intf_cfg)
 		ctl->ops.reset_intf_cfg(ctl, &intf_cfg);
 
-	ctl->ops.trigger_flush(ctl);
-	ctl->ops.trigger_start(ctl);
+	/* a legacy CTL latches its flush at the vsync of a stopped interface */
+	if (phys_enc->dpu_kms->catalog->mdss_ver->core_major_ver >= 5) {
+		ctl->ops.trigger_flush(ctl);
+		ctl->ops.trigger_start(ctl);
+	}
 	ctl->ops.clear_pending_flush(ctl);
 }
 

-- 
2.47.3


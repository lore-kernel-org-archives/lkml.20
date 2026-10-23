Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792769523;
	b=l/SCo4MFtuZD5QoAbNNJ2IkTa3X5YzFwtXzEs5CwKQn88F+KIoHhxEIAsFfz2iwZW/db
	 ix48MV8r0K3xLR0KwecZUNNp8YktoLFxx3gtufkQkBNmJk/fd2OeuRJjjmZg7Xhu2s58g
	 42Qs0Cf20+eTyq+P6cguYPBnF+mjPD2OyCFZmwqIU8Zlz6CPcK+/QBPjakHS0Q+56ybPb
	 1vZGyGZGODhZ2poqb4OSTXTMQR7ZO0IafWuNzYo4CYJ5g7Wj+5oySxh/oiigm26mXaSzg
	 /cv4OSVcuwqH55QVKElTs8jLD1vIVzNoybw3zN7Kfmu10SwsaIcHqVrICNkKnMT2/Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792769523;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=FaqajoRcBElyuICZhCmUKXN7s8u9DKYWFfzft5nFEDw=;
	b=OzBU8OX1jGxOgjb9nudbnLDMuEhErBUJIY5u1gRTTsgTTwz9lJeb3c/ntuy7YaIFVDJL
	 GGVi02FGsAjESlj9ynNLhZzOWe+w355q55dBMQYt64YHVloxY0cjWEuqK5DKVTJRXYKJi
	 DKUYnnRqOuDdKci4n8kpKoup/KOO3uQAUB+FixBiYeWAuak2k/La3yFU8Y86ZcFhgJhd0
	 EUG4eSPaNJ16fa1f7/Xq5JboIqUNdZKGa2Xnqf4gQs/sHdlPfHJrTTrug3Ap8CWPkmHXB
	 yG8JbAKIxvBqfAjnJdEPDnFZ7JxqctzJg3cR1OfvgHWFuRoQc6nbt8GwHjEWM6YB4sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JTXsWQCy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ivjP0dAh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8779606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:32:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8779606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JTXsWQCy;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ivjP0dAh
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6tn01492268
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:32:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FaqajoRcBElyuICZhCmUKXN7s8u9DKYWFfzft5nFEDw=; b=JTXsWQCyYfxqy0BP
	Hd2gQwsaeH5HirwE8Q8VIuQniTq4DRwu5oUAVjJywJqeO9lraCsLGKDUNPSS3+5r
	idAwe2g7/mjLdInYTQlV+Oq0A2D7E1o8Y0ebXjI6MkyqDBzAmYKs382KN+ytXR0/
	yBMSFBkpQU0wR8RjFgtcis2TfF8bsoBlnHl6ZquBNdfDFH9gh7qBYFvWFI9AJmaF
	9yZdac3MighhB5InRhFuyXKtioP9Sa6D0fZZ2kRNvtzfsrWjdcldPkZpdKJ/XJLu
	qtmuXF4HWxSTW6CiFz43XEpszZ4lh3QGgUMUTg9zrjvRpH67rZseIQdrC15kBSxs
	aINCMg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsmausbj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:32:02 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7c15deb3794so210626137.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792769521; x=1793374321; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FaqajoRcBElyuICZhCmUKXN7s8u9DKYWFfzft5nFEDw=;
        b=ivjP0dAhWCxuCUqLUr88ifvdFQL8u55/cmOtchBLP/FvYQsROS3ZF+Wa0N+LM2Ox0V
         LgkOuKybPTM+kYaxLN07c0mZ44FVIRxGJgjKJvew+sOpJaLkLhKCII3YNuEJbeN/f2Tm
         /YRVdViZsq+ncnsuwCXyBowTyjHkN2JfEv1ObGuLzYZQjrhCop9ly3HB3Z/DhElaiBCk
         akRVAa9a1MnLKUVufTftU2tyf8udYvtO70cohnuKb5JPwITwrm0ebxNtpYxXUh5V5jXS
         /UwcO07Q6a/QbcHgyM6Wgo0PvlGsXTcvavOjKYJBpH5vA8I3KKpb0ugx5MPdzUOnwbH2
         Hi+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792769521; x=1793374321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FaqajoRcBElyuICZhCmUKXN7s8u9DKYWFfzft5nFEDw=;
        b=1mG12FVHSaNSvFWd60bQFEF0aLfzmYwNQVT4b8GGogTvL7M/pilvzCz5X5cJVBxsxO
         i7z+8ZPJdue8yOWpa510koIz1U6BzuC39DFECmQax8Aa/58fHm0YOdcUmZakBtxQtRgo
         WqPQ9wosSjftmN1CMqTHoZn+6u48zaapZ1ZLvpyGBZEegkfuwwuhEAvwgxq4OAHxOhYz
         ZhL2SmMO1ulypT6dRAXBgW54ARKMAEl4pAKTLn0IMI/XdoZiDKddIMqxs33t0FiYnUgj
         Djk5Ok5M6/RZ34jYIIYtID0i/u+SoO4sCX+cLbQQOwMl4PLYSjRdDVqO0yb2/6qf5zDW
         eGYA==
X-Forwarded-Encrypted: i=1; AKwUvByn0ZAlVJOShnNb4tHAiGkPrr2OysMs/yheBiYjOIkN6kQBxVkapzbF9dZS9bPaa+qMGjK+rqLVas9CpUs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIFXtmU0y5LOj4tGYqxVdygtk+sxP4LQ408EiJgIg0gOhdRN1+h
	NuIVY+ylvdM6z9upUV6+tQU6PaWFF/rtjJ47ZCc6PMjwrWQD7nywKTvHztkwIlYnnyItPvC0ier
	zqNOf+cYZz/0NEL8ug42ESd/vtsJqPTjtI5J3D2XUdE8YuVUo/MEuqogWiGDTw6qkD14=
X-Gm-Gg: AYBFou13eKZKivqK7NGgnX8XBzn4a+LMZKeATZRCXvqHcajUNAAoqutFTHFOSXwBLB4
	KW1rmzdrby8ZvTgSzB5tmpddI2slXRGKiFQXNDwrrdflRTe5oVANey7LSXiwJlJD1JyffcC0ac9
	yzPkIgnnS32FULUsDb8w8PvAzFhqui22kzgvCMPskiVvKr6I7YjLpBW4NemQmank/zQT67daom0
	bolS6i/YIO+KFYY2wPDy3smvBBz1SkHw5pC3JCMl0pm9oUtbvdJB4/0cbA93QhaEGjGBDkKqwOg
	LT8A8XxwDNs/FlRgeCOA8Ah78SYVtKHiuSL9BLvpWE24H1DQ/islQLPxMpSdHWxooFwliRP7p9c
	ELm7DcNdRk4P/a9JJniwYoup3b6WsQSG3QhNqh6+c/8dJdViPH9Ee99FO19+7ZZWw4INrkcAUmh
	sMfUyPl/xin4rX
X-Received: by 2002:a05:6102:c54:b0:7cc:2c29:54f0 with SMTP id ada2fe7eead31-7ccc300d074mr855766137.4.1792769520951;
        Fri, 23 Oct 2026 08:32:00 -0700 (PDT)
X-Received: by 2002:a05:6102:c54:b0:7cc:2c29:54f0 with SMTP id ada2fe7eead31-7ccc300d074mr855736137.4.1792769520451;
        Fri, 23 Oct 2026 08:32:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb0288806sm478062e87.55.2026.10.23.08.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:31:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 18:31:24 +0300
Subject: [PATCH v2 09/14] drm/msm/dpu: don't tear down a failed hw_init
 twice
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
Message-Id: <20261023-msm-kms-destroy-fixes-v2-9-83727c122de7@oss.qualcomm.com>
References: <20261023-msm-kms-destroy-fixes-v2-0-83727c122de7@oss.qualcomm.com>
In-Reply-To: <20261023-msm-kms-destroy-fixes-v2-0-83727c122de7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2919;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=2tPDXcEAQdfx+uOZ+i3gT4JR+STW+/Lz2xQF5BcD1Wc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq233XBTSWsE53xutitq/OEOQAia7nweiTo0Qsm
 uWw6zou+MeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatt91wAKCRCLPIo+Aiko
 1Sh6B/4pDgiRwSuUDdbhfYHChub9ldhWqn5cna/i0xrfiRlJEk4bnMSlnH74c+LBXS5nZ+nu2mn
 +fIbeXycqw5dEn8NJ9Kr5MaT4VRK+qH3akiOu5sQSxY6Jolyv3hANfy8yrRiu7yRJ9Ez5Bz/Rmf
 6HKqyMjQzKLwWn5KvxH3lO/jewUNXRmK+ztLjzHTHUGJZfsfr82xX8rw2G1i56nOlVuGXqnvZZj
 LXznOvZvlj0tF9NFuIxVumMwps5EAOebdfvsoPdGyAZiQfxqdfBei6V4+7QqdjaC8P+W+FIcPWl
 afcfpNkcKdWfBTLCj30ZmgUlD9Ln/1dO/cSvOGITJeWJNPqZ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=V7LoQuni c=1 sm=1 tr=0 ts=6adb7df2 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=VuwbfrIzBJgoMi6EY_8A:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfX0o1WCCMtTyul
 VgQtJfj+Ve9FI09XK0xYDbJrh2x0k34fcAYmo+wo38ABa0SHekG9+pMUbxX5epETzjTgWxOkwG0
 jwYlum3e9tOxtgPCz5rifA4K2fnBkQg=
X-Proofpoint-GUID: uUfYM-45bB9i1yE1qLoGD1v6ntvFXdy6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfX7V3fvFm7gdgL
 ZU0AMGpUjyeMQHqzHI3mxG76IVxIKaGTFLgTJSGRGnFeRHzpIwfl2LICVBA0Kg6oZcjrcHJB50x
 9CZfzMPRsQRBjQ+KgE7V6NUoUkoLaxEirk3dB+0TrBOFBfCGzQZo8liipcqzlx2X5cIFULfN8U+
 kmGu7VA6ZKxB/Eu2kMosBwg0li/c3S0wPU4fZZcflLr6IsfND72mpfbhBhT0det4VDWHFSCiSiF
 ivkpi2cADMCQx0cwAfb647OedZzUp50njtwy34ErStKUaojgSTbQCHLLwnE67JITZCESohwrCxa
 4LHYRB0dLF0M1pj6y7nbMv1OFScReh2TPuB7unN1udBgJdIJvDGm57oBWUaNKnp9pKSUxF/SOXH
 59PtW+7/HhHFibYXU1nbBwq5aM+LVBu5PEjoY6I2FDwqF4IPJqdLo5R5OX0TIW/QGVxNJv4U4Oy
 kPkRfBg0T089RvoESuQ==
X-Proofpoint-ORIG-GUID: uUfYM-45bB9i1yE1qLoGD1v6ntvFXdy6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230060

When dpu_kms_hw_init() fails it calls _dpu_kms_hw_destroy() itself, and
the caller then runs the ->destroy() callback, which calls
_dpu_kms_hw_destroy() a second time. Since the global state object is
finalised there, the second call deletes its list entry again and frees
its state twice.

Fold the hardware setup into dpu_kms_init(), undo the steps of
dpu_kms_init() when it fails, and tell the caller not to run ->destroy()
after a failed init.

Fixes: 49e27d3c9cd6 ("drm/msm/dpu: finalise global state object")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index da3556eb6ecc..255beb83fc94 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -55,7 +55,6 @@
 bool dpu_use_virtual_planes = true;
 module_param(dpu_use_virtual_planes, bool, 0);
 
-static int dpu_kms_hw_init(struct msm_kms *kms);
 static void _dpu_kms_mmu_destroy(struct dpu_kms *dpu_kms);
 
 #ifdef CONFIG_DEBUG_FS
@@ -1067,7 +1066,6 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
 }
 
 static const struct msm_kms_funcs kms_funcs = {
-	.hw_init         = dpu_kms_hw_init,
 	.irq_preinstall  = dpu_core_irq_preinstall,
 	.irq_postinstall = dpu_irq_postinstall,
 	.irq_uninstall   = dpu_core_irq_uninstall,
@@ -1135,21 +1133,12 @@ unsigned long dpu_kms_get_clk_rate(struct dpu_kms *dpu_kms, char *clock_name)
 
 #define	DPU_PERF_DEFAULT_MAX_CORE_CLK_RATE	412500000
 
-static int dpu_kms_hw_init(struct msm_kms *kms)
+static int dpu_kms_hw_init(struct dpu_kms *dpu_kms)
 {
-	struct dpu_kms *dpu_kms;
-	struct drm_device *dev;
-	int rc = -EINVAL;
+	struct drm_device *dev = dpu_kms->dev;
 	unsigned long max_core_clk_rate;
 	u32 core_rev;
-
-	if (!kms) {
-		DPU_ERROR("invalid kms\n");
-		return rc;
-	}
-
-	dpu_kms = to_dpu_kms(kms);
-	dev = dpu_kms->dev;
+	int rc;
 
 	dev->mode_config.cursor_width = 512;
 	dev->mode_config.cursor_height = 512;
@@ -1301,6 +1290,8 @@ static int dpu_kms_init(struct drm_device *ddev)
 	int ret = 0;
 	unsigned long max_freq = ULONG_MAX;
 
+	dpu_kms->base.init_unwinds = true;
+
 	opp = dev_pm_opp_find_freq_floor(dev, &max_freq);
 	if (!IS_ERR(opp))
 		dev_pm_opp_put(opp);
@@ -1317,7 +1308,17 @@ static int dpu_kms_init(struct drm_device *ddev)
 	pm_runtime_enable(&pdev->dev);
 	dpu_kms->rpm_enabled = true;
 
+	ret = dpu_kms_hw_init(dpu_kms);
+	if (ret)
+		goto err_disable_rpm;
+
 	return 0;
+
+err_disable_rpm:
+	pm_runtime_disable(&pdev->dev);
+	msm_kms_destroy(&dpu_kms->base);
+
+	return ret;
 }
 
 static int dpu_kms_mmap_mdp5(struct dpu_kms *dpu_kms)

-- 
2.47.3


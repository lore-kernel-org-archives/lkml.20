Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792762829;
	b=HLJX8iiBf8TrKRRBxHUtR/Zu5XLUzDoyZXoL/K933j673itdjDd8sJviRSSb0NAg6tYK
	 TYgGOaCt6q5F1MbFNWTgYYO4GGPMrBRC1sV6FfC/knORbrctzi7lih9kmLePUrkvkI/oS
	 kl75UdW+o+R/OR5m+c7Reqk8u4EwVHveExRPolffS4JnO/FACI9UGtx0d9fHfeq05EJKI
	 UaosWbYkjD3guNNHputjgWxoZXxCXiw8R7LT5QjyqsYJTDZ1R95O6Sa2zWP6dqLzrAY6H
	 VSnv5uHTi+xioMtxZ1HB91nEvU7/uImYsKKGHrY5NI4uh44FbWol2GtrD6UEZGYW1Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792762829;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jslaJ+w2HEyT9CXg0MOlXKm6PZnVP5VWPAUOBFNljSQ=;
	b=1dNn8ygoZsfE9o22MYsB0aVw4htY7ln1v9sQHBUNYh2mBlf4Q676TzvalAhTcqv/fsPP
	 +jmPDyRJRYjqn+aMN9v6PePhJA1pQsszUyPsf4ZKTbduhYHH8JBGxpslMsWEN/6F/KRR/
	 fzXZEyDfguguTNf9FfWvx+3JE8zzQ2U1ee+lqZ+u75OLokUOo0JxKBnNAAGM8mMoHXwMD
	 KTYTQqgQrz7cSI4QyBaoUFvfgb/1PjKwXyxo7LzbwBRrjbUa+qBUtKXdzlWdcPQk/2HkK
	 mVfP6tdacttqZ5T0TuRtMBYBSx1jLQLkiZjSZ2GmzWHLgtnib+v3Kb6yEWmhZBpML3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JMALdV9k;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eVCLCoOY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B69606A33E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:40:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1B69606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JMALdV9k;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eVCLCoOY
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAYOX1948477
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:40:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jslaJ+w2HEyT9CXg0MOlXKm6PZnVP5VWPAUOBFNljSQ=; b=JMALdV9kc5ziw6Cr
	v1pelBRZuf+CmVaSaSKPbKYKN3oIzBylbQWTrGwg4c6O7Btl7djYMrK445UQYTy8
	YL8i7y6GVlg9i6OJgnIbUcV5GpW8nk5xNMMJIxq3JFXp4QzxmixsAMFQ9XVgbGwE
	WlPUBU+4XFDTstZZfa2D1njrVN08/PT2xRiptPLYfExvXjYMlD8au5WQJYy2kK9d
	IgkdRsLdxT1bs/0fyG+b+ziovRwYKI0a90SWVjPHSiUHmLEHVRn74eDKdjkxbDF8
	DY/ESO5q6pUgLSn5VcOmzHxhhRYmAGKMj3kMXri2DmIw610MR6TEGJ1XCITpgt9t
	i0NecA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmtuwxc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:40:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ce7a85f04so178112585a.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792762827; x=1793367627; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jslaJ+w2HEyT9CXg0MOlXKm6PZnVP5VWPAUOBFNljSQ=;
        b=eVCLCoOYS2tShM2X6P9t/F/sEbI5leE/Ny4CSNFVx2//8t7AkImQ2WtRp5IN/7fd/5
         8Le7ax89HwTErbvrtVpgg1cvc2nZRaUrg3PU7phtkGlCPJnjmad5k/daLyca3zHp8GMl
         y9/FsTCcnqsouQpMr+HzhhDmrONFDCnvCKdkL4M9T+MPkbvrGG2OerzRxnVPd0U1CNde
         PyDq3tNs2VCP6aPD2gcIRQS6zKu4JSYytvjlUtNbUy5faLaAlwPSP8777l1FKGMoi8BL
         /TdkpY73n0CG0Ic/rDSLiyv1eR2kym1nbfIYY4pP2Ve0/5RKHJjkcn05AbHPWIarRAGr
         EaRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792762827; x=1793367627;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jslaJ+w2HEyT9CXg0MOlXKm6PZnVP5VWPAUOBFNljSQ=;
        b=fYfnEoNgqCwMOZ2TXAGwEywxoKVfC32qeHGx99KUV+8S9VMBmOnOwMsBjGNCPBmIHw
         itYn1+2jj7XP4+fCK4WcDJNJ4vrfsZu7MijnPPTy6HcUfnagUkDD/hWn14ApkhGMRGsn
         uW5B4fM00YevNfjJPLY3Yl/jpupYL1IDANxTX/XZf3UxXvApU5SRdAtFp5em2qXudzOr
         g8N5wWPhmoa77wifpL80KKHI1IhwyaeHpBunWECJj+OI30NnSH6MOe0qg/Mr7LQZA8nV
         gWWijH7Ne9/naRqf0FJS0+Bbo+vFLztlw9ewXH7xg3Y418CkwuVQZlbNdOyqwSOiSGdg
         OROQ==
X-Forwarded-Encrypted: i=1; AKwUvBx4/sWhJAKma6FCu8Xth/FRcOk8XMTOhW2g8K2doykVugNBd97mtDpno5m8F6UXxzF85KZbGyw2TzFDZ7k=@vger.kernel.org
X-Gm-Message-State: AFq9FYLW4yEEOVBq+3dKXK7d1k8JQ9hd66MJykGulbIMT9P+aIW3PH/4
	QuhxvlaDO14RRpShA/M4UC0gN4A3X8DssM6LDA2ltgI6us6ImphjLCN+xRYerF4rBVwLPUmbVRz
	dli7Xh/PneZDL06lEmROymOnIk+Y8srdBlGSn8lRF4w4F/NZr8qo/H5/rckT42sn6c0w=
X-Gm-Gg: AYBFou0d9fw8NkzUgvHBRJtZj72HFCYwwHBZh5bozu7Ec/f/y/pk2ovr5I5CqIAy8Wx
	ScNr6ixxQng2/HYWDURynbx/WUI8As8XLSYpLphE20I/p5SBGVMUsR/IFjQjoUJtxdL8YMIq6fY
	jkF7qRCR9r4odFdq7UIs2VVygIWmSMnVVes+1UNe/qw0biTveYpVbhopBpmQfpzZo3ObgAZ1TOY
	fgl9NJNkR1/DawWtaPt0BCZfwNrLNSHjP89F/Ca834MmMQS6OfB4FjE71ikCCFizpa5GAxvuucB
	lyGpWdTDEOcqVYpt2ineFnqVsnZv+a7FWSvTISEcX++GCvi3zM5R64Kp6oS/byVJXhu8yRGJ1xu
	lkgaPqkB4wVU0lhsv6hlwqa7urSIc32sDIGv8ROHHNX0W0mYi2reQGXQzUD+EgtnwrVrudYYR94
	s6Yx3iBHv2R1B7
X-Received: by 2002:a05:620a:7086:b0:93f:5843:1055 with SMTP id af79cd13be357-93f6f656ccemr406096685a.13.1792762826799;
        Fri, 23 Oct 2026 06:40:26 -0700 (PDT)
X-Received: by 2002:a05:620a:7086:b0:93f:5843:1055 with SMTP id af79cd13be357-93f6f656ccemr406089485a.13.1792762826136;
        Fri, 23 Oct 2026 06:40:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac65ce14fcsm5309701fa.7.2026.10.23.06.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:40:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 16:39:46 +0300
Subject: [PATCH v7 6/9] drm/msm/dp: don't take extra references on multiple
 plug events
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
Message-Id: <20261023-hpd-irq-events-v7-6-57a3aea3f09e@oss.qualcomm.com>
References: <20261023-hpd-irq-events-v7-0-57a3aea3f09e@oss.qualcomm.com>
In-Reply-To: <20261023-hpd-irq-events-v7-0-57a3aea3f09e@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Francesco Dolcini <francesco@dolcini.it>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=903;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=y6Q7UwG8h2RY53M7Uj/FBYAupAUz6hR7YBAr9z2d9v0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq22OqJOhixgIg9VA7IzyAGhBk6OzyCFXXMBbpS
 bq6XeHn7UCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCattjqgAKCRCLPIo+Aiko
 1aCEB/wJ8fNt4uH886JgFUulIe0+m2ySGRzn3AiPyxGkRwEFYwZVhXVPrSSDHoMW3xC8CJGxMA6
 akzlQzOCMNnGmyfRVQv9VC3GYfTRdB5YcrzCxwLohO/6nK3VVONFWTC3xq0BuFYq2X9EtQkr4Cf
 ZULvB5WBskmMM3/ZGAShDmPFWGG7/klJ1gV4ogm6oGdvEmwJym12Q7UbD0MQ0GXc+xhOFWKF6yS
 62bTAq0+FVAk84ja4eSe2YqJ+Sa2fVijVHzaIBWlSehdvaxYUFhCXhPzO2rsODtqnDYQujolgve
 S/I0avJ4Q91feNdGGesDsgv2uP3Y0LhYqJ3peVj6mP/fqS4p
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Gt3XaU1C c=1 sm=1 tr=0 ts=6adb63cb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=2dNI1gAXBh0p5IwnqgcA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: gvYUEDkUGtAw3hvHnhMjbGVytnDw1aam
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfX6eQtxsuq39bK
 kLv9iPvYfBM5xxJ1caoDEc0EivCw4/VeIafe5Nh+4sa79wb2urumxZPpiJf1A/ri1n4PeH0kM/a
 lh7ry2/k3RxwiCj+Wl7wAD4xmt/sXvAevJlyrVdN2XyOfv1mcuNfhDHXMGk2DrMHK6teaWFROIF
 KpaW+U9e8ysrRFAA1GTQVRw9qQfJtSWozDeZMRYv2i3saP49OmNJoapgSNQgmp1S5Cv0Ob0L7mc
 o6z0wqU9dWU5u5UsanGPPni+nME6uUUDfyrMHuY3HANnsu/pMcFFWy+RJeIlc80KmeUY+3MjCqR
 OReR9DJB2O05k1BCutd05xXEmnjaQl3HnIJfXvSCTYaKCdRg0qVBu0DG9g+JXaBBTUvUrZyrhFZ
 DSv7e2xIV3nTG6BwmeUePHnEdx1yy95HfDvvkDL1JexPUk65QO7sR4sxEMfk1ygQpGJcloRqzHk
 WNvS8bgE3C2DXkUIVsw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfX48XiGcDmzezP
 La+Vsg6eVtUslgIf4f0lnYncvqLasiJougUgI6XHW0dK1Pv0slas5eQSMobXPytRTnLzrkSy54j
 uNa4crMc0JO0SRxatlKcZkDW2P8ge3U=
X-Proofpoint-ORIG-GUID: gvYUEDkUGtAw3hvHnhMjbGVytnDw1aam
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230053

The upper layers might signal multiple sequential HPD plug events. Don't
take extra references and skip all further HPD plug events until we
receive the unplug event.

Fixes: 3ea2d1c3d154 ("drm/msm/dp: turn link_ready into plugged")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index fa8942922b53..ce919a26fba2 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -412,6 +412,9 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
 
 	guard(mutex)(&dp->plugged_lock);
 
+	if (dp->plugged)
+		return 0;
+
 	ret = pm_runtime_resume_and_get(&pdev->dev);
 	if (ret) {
 		DRM_ERROR("failed to pm_runtime_resume\n");

-- 
2.47.3


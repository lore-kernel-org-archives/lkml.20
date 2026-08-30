Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AB62E7378
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 04:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788064205; cv=none; b=Klx2PTU7R3+zmB9N2RQIlsNeCDGu2i3yqPGXNCWU6Th+NZaeVfQGtpyVJGcWi0+gsOWoYYJILWnO9poybYxc3SK3H1FKnSreQf5gknovVWoEl9m19vfFCOjKADtkfowagVSWvzvMG2q0sjbGCTplLnJZ5rWXAiz8e2BvKn+jekc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788064205; c=relaxed/simple;
	bh=gSbPk6PQOjTbDMU50WEy+eW/Dadr82jN0oB9jeV6KJg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tkl9vxAooVKNu5K3wKomqZaSNi6MXonRh1NKMSRBOUMdWFcDiy7S0AxUAfikLv1F/3Z06dDV+6vAdVaosMU8mSyRhAXWlEVXOEugsqz6Q/R7FbwTEcz9sOwHkFx0HlYsGKYBcGCNiN+p7amCxdo5HyviSL1AT/prb3l8+06wYOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a1pkHtD/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OyuS+ItU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a1pkHtD/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OyuS+ItU"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67U2QvO82883343
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 04:30:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=V8gw5TeS7xi
	QV0LtLxJkCa0MBg5aJLxhqsITxqygnxA=; b=a1pkHtD/9FcWf1qKoI7Fwcgjx7p
	hqV4VosBeZ7XHhmdi5oguVdulBA75fW+cuO5p8nwR6rJpKEOJ54YpJTEfZtNQRAX
	G0XURRHgiuqbH7kByowdBgVXww/+0adu+PlZ9Vy/vdi1wXTKy5PSypGEIceUcamS
	r5RT3zPglW7/mVgIGo1RqDl7LkojlVl8y5UdG7P2jDbQGaySYcnoEtpVX3VMqQ09
	uD/4mxam+ueZ8TM8lWPFVcnFPyMJp+Wsg2WOfZmCa1G0+2oO22uD9AITOzIS2kya
	uCAnMF8MH1BUiKX3uLOBA7JKkpCbbf7RRFAxvJdEcrxvQWNEogqiomxYHeQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrq825qy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 04:30:02 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso3993392a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 21:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788064202; x=1788669002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V8gw5TeS7xiQV0LtLxJkCa0MBg5aJLxhqsITxqygnxA=;
        b=OyuS+ItUQme2jSFkLIcK6KFl7DulqMQdOuNL+4o8j7pfqhS/o/E3nRXWAo5ALbJ7NE
         A1oT5/dPfZXa7CvZ31H+JNqBla7K8ThEiXUoNGisl6zUnXe6DUMaIRboCfu5tGYlUz9F
         9AwIBNev0NyosP22nkdCfqDlKooD3uEj6wSylbQgspjR5lGxJaLeXXKzAE7MXaLUSjjz
         9xo4WB4OnTaY7KMoQqZt/emQ9FoAl/wlPmPF6bmujQvYaWTaOqBVI4H3kcJExrNGMNc+
         +ycW7W+BWCDYz3XazUy7H7s5DY06c87qujV4Hl/NXvToWij8H7hx4F/qpuiJ1+ikKJY/
         wnow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788064202; x=1788669002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V8gw5TeS7xiQV0LtLxJkCa0MBg5aJLxhqsITxqygnxA=;
        b=dWS7nQ3KnQTD0RlwnMJ2NmXKPVYsY5a5AWWNJi/GP+uGcoNApJnbQvI65P3Z9C8Kox
         u7bnRsGfvbbI/P8WQekVpHgRcYOfpdg9jzJwoZhwuYiS1NgqrSlVm8p7m4SkxvFEutlU
         8/1iGrPLFzXyudaf9XQRizdhbTgbMOUD1qTBx+NGTzLJVzxx5FWuOj6AbjXkna5/LSKn
         C6Y7QOKDnw0qCOSI7HRQWNy42DT4+DOW0+GZXObCO/lUJ4N41oNETPm80/ZJ7gCElEiN
         WLi4WEDnkgFlom7wa3kwt7IyJj7iBWKPCx8DHpB62eGGwavs31NSenIQy5UlyPdq4wOx
         FYzA==
X-Forwarded-Encrypted: i=1; AHgh+RoiK0P0nvQXH/0gDHvNi+Vih7OwhsGxyMa8xTRMwKOXv9MW3WRORWo+q5YZq3jTxHI8z5//DACSt24fjmw=@vger.kernel.org
X-Gm-Message-State: AFuF++mm/YR6dsRwAsF2jAmSEigH5hK4Lwu35NhM75Qnupv6RLFH+ZPI
	R7aKmep3EPGILV6DQoV3ZULJfyrMyVSS6Vk52G/r/RkW0it5zupbucj/rq62TFw8gR5p9rEBfSJ
	fc28oq8vXXq8BJFE62Gw6+IzlRFoKBqYYtPW9008zaJ/u/lA+7u7LOSI9xGalfR/7sdE=
X-Gm-Gg: AR+sD10OaY9ENjzhUqjq5W75k1PwV6khPA+E+3gHDCVZPUm0pknQM4dXEJ4APJQSGPe
	z1JXlFZx2MWKTGEsR2g5MEfrb+iQOj4kn04QpiMedRbvWzr3dELzNaJOWLiTkAltLJEcLaGGKbS
	U2CRmdvtAj2qpagzwr73T7OvsbpyWvHIKIYwVDXfvjm/3JuPJUmP4r+B0oEDza8iGzyBJiN2Qk/
	Hd24Wm2+ePBoNSycbadPF+9+RGPkxu/NWHttU7jeschlUEbzeYITkWWz58AZbj24zFyR85nM278
	xV9s69e1xaTxu2kjiPTPVekMfNtVpyQQ0KFewtza+F6r4PrzO3N83qXJZef4CHcKZjVCNXZcPnz
	HJTC6G3/lMok6TXs4GnnkIzK0pdcsvbkJjmQcbjhdnUM1TCbISIdRJ8SeTBZ4
X-Received: by 2002:a05:6a20:6a29:b0:3d1:be60:281b with SMTP id adf61e73a8af0-3d268ef9eb5mr28341076637.15.1788064202106;
        Sat, 29 Aug 2026 21:30:02 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a29:b0:3d1:be60:281b with SMTP id adf61e73a8af0-3d268ef9eb5mr28341043637.15.1788064201663;
        Sat, 29 Aug 2026 21:30:01 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b4bc05416sm6078941eec.6.2026.08.29.21.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 21:30:01 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 2/2] pinctrl: qcom: spmi-gpio: Add PMAU0102 GPIO support
Date: Sun, 30 Aug 2026 12:29:39 +0800
Message-ID: <20260830042939.144376-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260830042939.144376-1-shengchao.guo@oss.qualcomm.com>
References: <20260830042939.144376-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 87QDJk0EpJKBoGMp-nY9PRZPNZbyeXJH
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDAzNSBTYWx0ZWRfX05zAusvYv9+a
 Ap5xwbUseNAQWxeuFqePuf0Ui0Gfq9N1IQ8ruoRfoI/jUcQLOst1kz9qxi7HXed/gLDfuJ/Srv8
 yLnzRaGOUXDqeC9VytpFj8XI9Ylz7Kw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDAzNSBTYWx0ZWRfX32FKbIbwN2dt
 WoJXM7G2hOJPvVUACeWc4k7HkjgbLj6tkAKjS5Rv2Zw5ECyka0AEN+MVX+JivJOKpzXi11O9eKW
 AfzuTY6G1VSR59RJeWcf3CrMLkorxQfwW8Vnuv7C54kgn/rCDf8k6YHRfRn/NpAlOIoX/pV5spc
 0zW6sjOzNdadCIuH0LRZkgHPu6FD8byEHmrfl6mEzZ57bATGa0897LoQZGF9ScoKO7VEkArxObT
 NJdbAVT0t6joqgR2tNDpKRW0BzXeOo5toEb/Md2lsZC3rL6LzWCmSU0/ribyi4mpXXS01hJ+7Ae
 T+5jBXrahCYSDEeyxyU1r6S2hPHyRO7b+R1LmzcTloRt9D/rpnaqVuia63WgdTo0ghThBGwd/cl
 LA1moT68Ex+F/WXX9/+1z1Rokfc//DPbKNhe9Iar3/GPk9cQt+PmwJsawOkViV8yCQuyXzpgtnd
 x5EtvzphxpAOIXGOE+A==
X-Authority-Analysis: v=2.4 cv=ZOPnX37b c=1 sm=1 tr=0 ts=6a93b1ca cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=a0wLEVJ3kHAuhMsajo4A:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 87QDJk0EpJKBoGMp-nY9PRZPNZbyeXJH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608300035

From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>

Add support for the PMAU0102 PMIC GPIO block, which has 12 GPIOs,
used on Nord platform.

Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index 922c27177b5a..f6dc43e27b38 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -1259,6 +1259,7 @@ static const struct of_device_id pmic_gpio_of_match[] = {
 	{ .compatible = "qcom,pm8994-gpio", .data = (void *) 22 },
 	{ .compatible = "qcom,pm8998-gpio", .data = (void *) 26 },
 	{ .compatible = "qcom,pma8084-gpio", .data = (void *) 22 },
+	{ .compatible = "qcom,pmau0102-gpio", .data = (void *) 12 },
 	{ .compatible = "qcom,pmc8380-gpio", .data = (void *) 10 },
 	{ .compatible = "qcom,pmcx0102-gpio", .data = (void *)14 },
 	{ .compatible = "qcom,pmd8028-gpio", .data = (void *) 4 },
-- 
2.43.0


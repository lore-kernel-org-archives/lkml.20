Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792898249;
	b=OONAFeoL27DNvj/dFcume+7DVfHaBu4AtuDTBt9TuWYH31PJu04dXykPqUQ9HPuJ9Hmb
	 y/dGyowMraVl3lgFqG8OIlwXBY9SGUaJpiVamSrYvalQo/5h0RSUWbIP+Be4zRwBNzYkX
	 wT+iNcXCbSeyhhqdppHKrGPm5eMOlaeEvlUJGAgNT9q5Bes4T+gyvCxuUl0WZYJPkliZk
	 mgPxrbWNrq/OhavNC5xg7BU6whOxkIYFHdYW/VDQp4xJxYDt2p9tyqcz4poedzFdlpKhx
	 dQlHgLbjAhoixdmvqmomrkUCwcaXb6dBVFMjL0SlUjsvsR7389td1dv83MkN3g+poCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792898249;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Ef+Na+GsihrxdoSAJed3PDwEa1uv3hQJy1tnM3Tzqs4=;
	b=XWQAmQ2q0eCOV/73Zrouq2Q7tHBuFOc42YQDDbGaRk8DH+jFvXjhNF4Zx12QbaT9/YTe
	 lkqUhVKNM6KkWToej9nsNevlJjIZcGNH9fShnLRZqWfaKYyClf4hQbAErHFzfNhVd1kZQ
	 tgvSUHwfG2cjjGiWkn3itpskPA/UM9hl7KCWHsjV8IwuxD0WwWdfih3N+rg8Wx9nT9UM7
	 29bCuUJaU0P5gKtRmVlTRWi/x5oiJED/bUcDb331CXFHiysOJy4NJ02QxfHN6mVQhKmS6
	 LLy/aynbI/9e/y+6ve2WvyGN6IA54tIhyzAHq+JpmVgqtSlbHsi5YlLdWxmIsPXSkzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KMfuPY9b;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BFAL8XS8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D484A606A330
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:17:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D484A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KMfuPY9b;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BFAL8XS8
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69P16LTM4172243
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:17:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ef+Na+GsihrxdoSAJed3PDwEa1uv3hQJy1tnM3Tzqs4=; b=KMfuPY9buqvS37J+
	W4zpIW4o6235zZ9+7zfRs7ZNI9Vw5JIAhwtfiMAUJUX9e9GRjvtJIO3td6XK57H1
	sYJYeulbgMP8vUt+8Pwubjyhy7R9YIqlz8tseXBPqZz0QFk8gMi1ZcoZOc/h7XED
	h9+ywnb18Achc6oPO/nMWugLSLWQYONYcsifckTXc4U423X0lVBWIOcwH2oVOHLn
	7IV1hD7vFQ4KiMPrKZM9WnJ0WF8wvjg0UzWiTM1o5onxa9I9bBNc+CaooHQmNmc8
	uKeV4cZCuejyw9LMVns42aOzQKTZ9I8Jja0BGvvQiEgNVR3VGX++5zRrwbOtk39p
	nw8iqA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgjcgtmwg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:17:28 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35c5aef2a74so9408355eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792898248; x=1793503048; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ef+Na+GsihrxdoSAJed3PDwEa1uv3hQJy1tnM3Tzqs4=;
        b=BFAL8XS8VH95dCD2JPtTE3bg7yhsY/v6xjF2gtTqJjWClfuPpirEPoMswjIjNkcL1a
         pQQbKxGD+/i+wr2LVvvhZ5B5EyQb/C8QTsGtg5qgWklKiZqA6fusLrMpFe0/kttSmYIq
         e6SbWbgG4O2eW/2UwV/YOI8ptZ1rw3kbksVaL5sD2A4Se2x6ak1ghR4VUDcJxtEpW6KX
         tpbMnLIe52UlHylPyNDyAQpcwYMQNpwUfyFwjfEzEq82nUziSYi6W1bzdvIa3V7T1xSi
         Z4A1mg+h7cNYloZKdIo2pUCmlSj4YO2lrOUGSY+b3V7xB9KQqssKxEdGUxvVQHA9nObE
         aWYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792898248; x=1793503048;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ef+Na+GsihrxdoSAJed3PDwEa1uv3hQJy1tnM3Tzqs4=;
        b=UhF0zOhDKvB2c4Pdi2X7HZB8TTZ42Ntde+xwlwZrdpR4r7bMZLZZN9sxp2v0NKT4Ev
         ZUc2ZuZyaVvjvNlE2MwijPkoDb1rCL4+HrVrt+Z5Gx2myjcyZyObqORZlbs6fpj+vRAI
         bXwUdtXS1GEtQvvwFdRDdzmxhGEQIZEJnIIyp8vcdHOajXTNbKxhNKmS6ZJruwY/DGSm
         D69l0aCzOCToAnSiRvs9tUSWpK6juyU+iiDhX7Ti1c9Einjvpi5TH85p8BTtlscPy9oQ
         mWWFpmwgIPMmeOYJxz95Sj4elufdAq5fdVOxqGNjPQDoVR94lvdHj1wm/wTX9F3shlXk
         ozMQ==
X-Forwarded-Encrypted: i=1; AKwUvBwawJR64LDAZyH+O9hTNaSsS/aFN/D4IkWBFdDEsnqApOAUigouaO3sXbrPXbCl6yAwgoKTN8R7AOpRDIk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLsAxDPEpD6jriwalHMTscLWWLcbKAJrOFUBLuPkFqhvnj3lz4A
	J6TQ0QWOJWBiyG/U0ECkj3U7c+oKdCvnWyufCM9GOgRucu4OgKjGzTW6M9qH95K/3K7k+Fwhz1S
	vg4oId5tdbyvrwRR4VeKsK4kK2COYZKY59LKXfw1Zz48m0PgwYL+zt6Ru4h29RWu3GcI=
X-Gm-Gg: AYBFou1fv5tPQSOfRBRSFuQd+nsNhKhdEspR9R9OGNNJ3NEWPv/Y0916C7R08pEDuW8
	E4+NWuE8LMyF4uwIvMzH7KJQUJMTgNiygxDG5zH+yF0Jk6QDYHiX9Lyq2YXVjIz6e9J6TUSlLPq
	Qzj/FGz/niDY+SynJTqPB7Ji/HKJIRwAlY6DXzOS5zTX7gJpqaHo35fqwjuU6CCLrUdWoSDa7aC
	M8weB5Z3ICg7XWXmsBNkJNIfR9/urgLrSyuP5zm/9FPgllY7eLzNEi4yVy8LYV1/GE9s+pIpFD+
	8X1e58o93eYMosOqFo36YDAmhxeKDUwVQClMuxemfl9svtd6vC0lciKCMqDFjf5B/vhwG0PfQN3
	FtJof2xEBdG7UzTpv0V4ofbGtxWBcJvudSUlav78rccVkzMey8WEFQtPfQuYULqyKozbN8jN/6t
	KKfIFJjklcNw==
X-Received: by 2002:a05:693c:88d2:10b0:369:f0de:259f with SMTP id 5a478bee46e88-369f0de264emr2953216eec.35.1792898247488;
        Sat, 24 Oct 2026 20:17:27 -0700 (PDT)
X-Received: by 2002:a05:693c:88d2:10b0:369:f0de:259f with SMTP id 5a478bee46e88-369f0de264emr2953170eec.35.1792898246942;
        Sat, 24 Oct 2026 20:17:26 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm24133054eec.23.2026.10.24.20.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:17:26 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 20:17:21 -0700
Subject: [PATCH v22 02/14] phy: qcom-mipi-csi2: Parametrise the common
 status register offset
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
Message-Id: <20261024-kaanapali-camss-v22-2-7da3ea49c8a1@oss.qualcomm.com>
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
In-Reply-To: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfXydNqJaTfD5iM
 jUFBpev1pJvjXtdwKoYLlz6+UOKzEPcPscpBZ+d4l7jC7jaz2fT2ZYPuQwPhA7jk7oOqFWtPaY4
 fNvHDRKLGGSVj5MHYEE2aoHo1G2A7xI=
X-Proofpoint-GUID: fdluN8W6cuKT6FtOy9pUfZVjYLfk-SlP
X-Authority-Analysis: v=2.4 cv=JvhkP84C c=1 sm=1 tr=0 ts=6add74c8 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=P6Xs4Y00w1yHQXPR5eoA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfXylnx8K4oYJ9h
 QtGB89mh1GmT6UStTn0uXelZPUzOQeUuGBuqFCUm+MKbJDlNXQkvsYKW/mdKOx2Gs5YbrrACafn
 vBp1pLIFQLsBsjW2qgOFz1tv5xe5DgLMBxXgr959baTeK5c92S4g1tzNVnTqj8Tdy9H/3lX5uCO
 7BZbxIdyJEcl8bcoribH+ppFm9mfbOZUJpvqPYQL64NN6cTiJlPoDO0ghJCb/kvLs8mULPLCY4h
 BmqnYfOUqasZWKyGk5oKu/4LMkYTpfFOq/4ShY/ybpGXHKaK3xTgaHWgJAgyskV2WreRyCKp3ec
 t3dCKdLVCVRZO/zA6sMurbre7+HHPc1crJ4+jVgdSYoyM1Xd6si340uF8hUy8D3rPuzJQRvn4fC
 Pn6ya5GhcDmSNZA9CmwBdSBhAjnAeMlozS+g0VvoTwYh23M8DDWIAx1y7uJJ1qX004mJ4Xc5a0j
 qwqwq7zpXLS7xLG25+A==
X-Proofpoint-ORIG-GUID: fdluN8W6cuKT6FtOy9pUfZVjYLfk-SlP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610250012

The CSI2 PHY common status registers are not at a fixed offset from the
common register block across SoCs: x1e80100 uses 0xb0 while other 3PH
v2.4.0 parts differ.

Replace the hard-coded 0xb0 in CSIPHY_3PH_CMN_CSI_COMMON_STATUSn() with
a per-SoC common_status_offset field in struct mipi_csi2phy_device_regs,
initialising x1e80100 to 0xb0 so behaviour is unchanged. This is a
no-functional-change preparation for describing other SoC offsets.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 16 +++++++++++-----
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  1 +
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
index 966d79c98f9b..8cd331cfb4b3 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
@@ -19,7 +19,8 @@
 #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B	BIT(0)
 #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID	BIT(1)
 #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL10_IRQ_CLEAR_CMD	BIT(0)
-#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, n)	((offset) + 0xb0 + 0x4 * (n))
+#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, common_status_offset, n) \
+	((offset) + (common_status_offset) + 0x4 * (n))
 
 #define CSIPHY_2PH_LN_CSI_2PHASE_CTRL9n(n)		((0x200 * (n)) + 0x24)
 
@@ -176,19 +177,23 @@ static void phy_qcom_mipi_csi2_hw_version_read(struct mipi_csi2phy_device *csi2p
 	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 6));
 
 	tmp = readl_relaxed(csi2phy->base +
-			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 12));
+			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset,
+							      regs->common_status_offset, 12));
 	csi2phy->hw_version = tmp;
 
 	tmp = readl_relaxed(csi2phy->base +
-			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 13));
+			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset,
+							      regs->common_status_offset, 13));
 	csi2phy->hw_version |= (tmp << 8) & 0xFF00;
 
 	tmp = readl_relaxed(csi2phy->base +
-			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 14));
+			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset,
+							      regs->common_status_offset, 14));
 	csi2phy->hw_version |= (tmp << 16) & 0xFF0000;
 
 	tmp = readl_relaxed(csi2phy->base +
-			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset, 15));
+			    CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->common_regs_offset,
+							      regs->common_status_offset, 15));
 	csi2phy->hw_version |= (tmp << 24) & 0xFF000000;
 
 	dev_dbg_once(csi2phy->dev, "CSIPHY 3PH HW Version = 0x%08x\n", csi2phy->hw_version);
@@ -375,6 +380,7 @@ const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
 		.init_seq = lane_regs_x1e80100,
 		.lane_array_size = ARRAY_SIZE(lane_regs_x1e80100),
 		.common_regs_offset = 0x1000,
+		.common_status_offset = 0xb0,
 	},
 	.supply_names = (const char **)x1e_supplies,
 	.num_supplies = ARRAY_SIZE(x1e_supplies),
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
index 7e55ae007370..d6366f809e51 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
@@ -51,6 +51,7 @@ struct mipi_csi2phy_device_regs {
 	const struct mipi_csi2phy_lane_regs *init_seq;
 	const int lane_array_size;
 	const u32 common_regs_offset;
+	const u32 common_status_offset;
 };
 
 struct mipi_csi2_genpd {

-- 
2.34.1


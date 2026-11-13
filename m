Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586293;
	b=bpOodPSO+k3iRhKRggFFUHYnPC4Yl5GRCApihIKf8ie36ZNkfpQN8Je7CUeODCwLxhQq
	 wjKCRmVss3/uGuTnZhR30N+aEqcP71gRt2g1bumzI8W9YmVf4TprZJ/Hh+AdDQBI8U/eO
	 ++ua/QAphV/SyTAMFIwiRe+qfQtyht3JC4KIwwR6c5H5sFNUHJOleZiTt3T7hL/0mfC42
	 S1WXVKKiF/pPq1jlxWtBjlfuBKEmx4TQ9dM7PWqUL5h+SC/NKFgwL1RlYxbNns3uwUlkU
	 eor0tGI2VJATZdDh1jMOKN2o4epNsOh0veigdTwwaCB1TqMvZTBy4Vh9H9qh3D/sK4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586293;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4LUGD2Z1OxVUhNrmytBWWKebaTfhvUmsQJIgh2WdKo4=;
	b=hUBrXG2nvHbc/pGOz+KMzyCiYj+T4fET7xKwie6kW+3sWe6kQ+XNkZcVyZlRK5fmvDDt
	 Xjip7tBtVveiJ88EWFl7/LZGB787Ck3hw68KZ8VvulBb7Ym/jtNn/PWffaRb7s+fOY2jy
	 wVTI4hwM3jiFmQ96wBwzYt9ouXDdjE/GeyuV7VBfCd37+JCujL3Hlkt6WD9l/jz7xabIx
	 MK56MjhdcUA5LGMtKQT34NARe8+sGhGs7EHBkMDE19IMNvsZep4Jqac+rG+4Jmu212DN1
	 AfXTlw4rNac1uWSBUirqWQ9+TUGEk3/qcSFgmUfg+SwVjLrRBCAKl1koqhgdGlA/F1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jgj56eqi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Raep9uUt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45044606A891
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:11:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45044606A891
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jgj56eqi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Raep9uUt
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFREnQ1190178
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:11:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4LUGD2Z1OxVUhNrmytBWWK
	ebaTfhvUmsQJIgh2WdKo4=; b=jgj56eqi3jJEwA23q3UdKoHj2IVs4IYzacZtPH
	Ohmhcb8AZVR5e6SxDb1oouW10SHbv9UACBN6v+DJCcavnfmRYdvow+hb+X+bJMM3
	b4B5tBU6Ym20Ogs0vZr1N69KQjgsvYoZeJ1sbHKOeVCjzLIE8rbtoSav882bARtc
	g7Qts6ld3mu2SmzjTD0WN37nr57niKk3r6xl3m8rxeyFQdb6Pchf45P3sB+jDf5S
	6UUYaK3iqFs/bZWInK0nzG7U29sqE+ePtnxKe1a8VtPjUwKUKPEQKhReyou77gQx
	n/Al0uVxJ/1N8CHSLnTq5BBhd2GVKyxD938p7J03qgn2gf+A==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwqufk4p7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:11:31 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-99b92772710so1265846241.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794586290; x=1795191090; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4LUGD2Z1OxVUhNrmytBWWKebaTfhvUmsQJIgh2WdKo4=;
        b=Raep9uUtdLfpw3dMOZFp4uX2xRd3jfMWNCQShUYfqsoALvTQaZl17Le6tTIOQSvJnP
         xDpi0XjKe7DA09DWa/Y4+pMsGJVtM7Mjn1qTYqsm4mwhKj2XXfAXTj+XQLUVFQR9ZC1Q
         8MKpEBBGEWR17T0AqEfcGLBf+Kqhfczf8SrTY4Hii8FusHsgW27SJY+80+/pD1I0YSWd
         fT8tQORAsnYojIPV/7KTbsGRc5P9jPD1SjPX84FfkHyuPVTK0QZZwtGyppcDSVTd2Od3
         OKEW+5wGbO47LEhcN9SmkNVXcB1DjcvGyusO0PLEy0dZo5UlLSq7tngmGFiKU3Z6Fu0C
         px2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794586290; x=1795191090;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4LUGD2Z1OxVUhNrmytBWWKebaTfhvUmsQJIgh2WdKo4=;
        b=AjWEL4P5aT6fHw1y5XIhEmoRGgQJsBwmQmyOjVbfpJ2uASz0W2zpnvk1b3uJjSBsSW
         YK4dQNwV58lJVB5JXOGIHwnwAOYpjpJYXc7kEpkV92fXjQh/6HddmfDVs6J+bgNkH1+0
         tWc7eLcei2to71Luabo+rVuBCqNVI+t8KAGJYfdXG4688nP38Klz4NpO9L40+MmKd04M
         H5vh3pNAq8qs+13T12Q6iz4Cz6JFgx7h74YUYvIdGfNlEN4mKULPXA1mV9a7PQr31DiT
         fQjGtNfqZERJ5mc2ctiyniUVa4Eim6kVP0rBzjvnaBxtVm/7SCh832Cljlu5IYeX8Thl
         4+ZA==
X-Forwarded-Encrypted: i=1; AL+hErErjFCJ1PrDtnjdmd/SML6j+8Lk2LB4zEUpFRdZ9eFk9b6zymptQzJDaB+sOFSUp7sxptqu/VgMMIgEB/A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GHuHsZZhSpUsTCFdu4osKJ832Jq2cgpymlAmKGawSQlCrlLe9
	VFYvCOwL/l07Dp8chsOOlY4aMpveF18k5iL+OFuvn2dSSASYkxWvKW7X6y0WIsMs+S6kBxhNr3x
	fCFfExoWJ4kfTfw0S1q2UdGA1CZBQZRq6BzIX7v4K7r3P4R1bfPrdzLiQNE+feMOb1Hs=
X-Gm-Gg: AYBFou3Aj+ty2BgtZB8eA1Iepecmdyz5YFrBPdeX3p+zHEyw5/4ZmFMOj+6erW+nZ3a
	Gp2PVRsy9+NhTN0RJmIpRgWDmuh04tQNZibBb6rPgMJjQamBOMnKp0m/lb8MmOf9F1LAxxTWG7I
	HckcIbKab3jppo7riOEyOgN2MFApLwQaesVnvs9Ql3rykC27xAFyhL+RnlvdDOQq/DDba6AsnQy
	iG3/Hne1i8xh/j4IE7Ya5O8bGtRJaztUBPlh1nb0iFS27Sww6AEyRZyhAuUpIjbGdvpdmDEGAq3
	LlRTu95e1dHDg+TyKOgZ2Gq240ARpVJMiEUKIMQ0IUyUFD+ab1iVkiToHIL/4QzelIDu80hlrTW
	LCotT34t9H14c9MoOAB4URrUPOD4uKFmRfU7cZA8m/U8IICXWfawn+3UgHeGycUbTcsKTRZZzRD
	GhpA==
X-Received: by 2002:a05:6122:178b:b0:5ec:3e18:a8fa with SMTP id 71dfb90a1353d-5ee34afd0b3mr1266365e0c.20.1794586290443;
        Fri, 13 Nov 2026 08:11:30 -0800 (PST)
X-Received: by 2002:a05:6122:178b:b0:5ec:3e18:a8fa with SMTP id 71dfb90a1353d-5ee34afd0b3mr1266330e0c.20.1794586290019;
        Fri, 13 Nov 2026 08:11:30 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm6191547f8f.23.2026.11.13.08.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:11:29 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 17:11:27 +0100
Subject: [PATCH] pinctrl: qcom: fix incorrect pull-up reporting
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
Message-Id: <20261113-qcom-pinctrl-msm-i2c-pull-up-v1-1-0eaf5c154441@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAK4292oC/x3MwQqDMAwA0F+RnA3YTAfuV4aHLsYt0NauVRHEf
 7d4fJd3QJakkuFVHZBk06xzKDB1Bfyz4SuoYzFQQ09jTIN/nj1GDbwkhz57VGKMq3O4RuwfH7Y
 t9WNnCUoRk0y63/17OM8LUIJxqG4AAAA=
X-Change-ID: 20261110-qcom-pinctrl-msm-i2c-pull-up-93bca429d5a2
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1653;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=qENpHSvjG0OILGspIeuGYed8DR95/mcpbr3JC5vzuhY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq9zawOIlsCCw6UJnBvKKinLIKFGP9eaFeaQNnT
 R/HK0c/EAGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavc2sAAKCRAFnS7L/zaE
 w+TtEACp2L3URF14/tI1QXht7ZgNJhAgYs55HtBCCyjUatNwfi1z24FxQ4JbPgiwIdU83yZ3xSf
 s/QBXAsqDzPb6oB6V0xgldpQOoyXHbSYmRsmyIO2tZlrI2j//RET0QzHY6SPpdEwy+HRKEyqnBY
 c7MpBWaRf9AeDVMZBRjkP8jbG4EMODEJUGCMWulX72RcjASSukA/T5yC2tRQcx3rKhlMhXXQMAb
 cHyA9R3VTfg8DORiZ4aqxliBCkkU58y51zfoUnY2WDr03rgP6wV7vy8Myslze5hJNuhZOZyLZxt
 iuslHDs3hS2CroAFH+Xq73cQYO9o3QImSM1XtLsWY5XruI92A4CosEpmOGEBWXizE8JPM5MQ3pi
 JePuB0Ur4uor8B3nDGw+rFPdQ4S6eIgYttF0ncvs5NcyPjGQNOXLVETryYZSMuIgJUj2dzOdtTb
 QwyAEQ7Z0vj2dWYlEwq+BGzMnAaZ4/Fu6bpvg0I0j14hMHR1QeK1+wmRkEappMyH1mN8V50iIan
 gc18swCkRgaCIyUusLzYAs+/uCrQQV+n9IBSOB/Znhyo9sSE2b93jol6k0tg20pBRwCe6/my6cR
 OawC3tRcPTisnZVeZFzeCdbv+gham7jp5ssqRxvo2oW1+Ybny6VYksjFxBnAKs+RUv7gCgBAtuS
 GQbfBRt/NxaFtkw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: VFWbJrQiiMwh03H7rLcEfOr9C8pLAu93
X-Proofpoint-ORIG-GUID: VFWbJrQiiMwh03H7rLcEfOr9C8pLAu93
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA2NCBTYWx0ZWRfX+J+gE6eCuCKK
 ox0PC02JujV6TBU9g2nrmSjDLNjY3VncOid+HWSj81XPuK67a/PNd3GOcgRz5ekINavkD3Ll/Ya
 G9K2+6liHF/ndXj/svVgAsEpNMIUkxCuKOZR6Te39m1QpuuXdJxxKn3qUwuoB934Zg1+FblB5f9
 4TamiyQEeOG+QiTDg/uQFdbi24FC8RpL8j/Q6kCNazYC0YbihIqfSNq0qQ7kEqVTzcNDxJPC7sk
 bUL3mW/s1yaGNP/c62n4m8DJUStVa/9JW5mSoNb/xvfcscpAeYx/Vprj1ifEPbhmL/eIIgyaAXV
 IFTOdmvuwR5l13zj1wvvJ8GpmfKZmn8DzoQsAgtjbhbpd+vnZoiKK9ClXn2MEs0z2ZRJhBEpTEV
 ft4x+WNZqAzidU8cQeX6Of7pBXKvbnnWXWRvCLOa5SxZFQg0mqUCuBZ6F34TFoZSb7fXSkcGMQi
 UuIpVuAk9/NLNasldaA==
X-Authority-Analysis: v=2.4 cv=XZocX455 c=1 sm=1 tr=0 ts=6af736b3 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Gl397SsdjGjx4eaZ7aEA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA2NCBTYWx0ZWRfX9cdtD/E8yJd6
 C/OJviQ40Mtn3UUxjH/6Xjgy+lUOP4T1XObYAKUPf/8l6Qi32xPiSRi4rH7Q2DjgV7AkoK+vwD8
 dsBjxJ/uDB+Q1KneR4a8O9zF0zDlQ5M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130064

In msm_config_group_get(), querying the PIN_CONFIG_BIAS_PULL_UP parameter
on non-I2C pins incorrectly reports a strong I2C pull-up bias when the
hardware is configured as PULL_UP or PULL_DOWN. For non-i2c pins,
g->i2c_pull_bit is 0 and the condition is always true because BIT(0) is
1.

Check if the pull bit is non-zero before comparing it against arg and
match exactly what's written in msm_config_group_set().

Cc: stable@vger.kernel.org
Fixes: 099f37a539e6 ("pinctrl: qcom: Add support for i2c specific pull feature")
Closes: https://sashiko.dev/#/bug/linux-42fe82f8-2ab3-4bdf-9d87-6f46c976e49a
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index f953d3d9e0980c535e08ba1c1765d835b8abb88e..7230780ee8d2982c56f59738e5f92dca7ff5e991 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -396,7 +396,7 @@ static int msm_config_group_get(struct pinctrl_dev *pctldev,
 	case PIN_CONFIG_BIAS_PULL_UP:
 		if (pctrl->soc->pull_no_keeper)
 			arg = arg == MSM_PULL_UP_NO_KEEPER;
-		else if (arg & BIT(g->i2c_pull_bit))
+		else if (g->i2c_pull_bit && arg == ((BIT(g->i2c_pull_bit) >> bit) | MSM_PULL_UP))
 			arg = MSM_I2C_STRONG_PULL_UP;
 		else
 			arg = arg == MSM_PULL_UP;

---
base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
change-id: 20261110-qcom-pinctrl-msm-i2c-pull-up-93bca429d5a2

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


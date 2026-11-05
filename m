Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793884475;
	b=hU7tkBGbbX80NYLi6ML73hqrgY9uHa91KUQlSWR9cDbOflH9OA2IWOwilJO0a/ZdKAAR
	 vRnykxEdCb1E9s+rFAs2neIHJTPSHTDARBqKMwn8gabE4Hf7Da3KHVobjMNA6ecQS8jKf
	 75K8eOT6CPH9dUvfHEilociglBDAE9qbOETr6/2v6O+Pc+JgVIZ5sPJomKePkDWQYbk1f
	 eEVGYLv/8sWvw4z5HOYk1yPKv6LkiW5nMEdULF+TuOVuMdTXDTlx9qvnlg4FuVUwo/ByG
	 mbJpHXqkKVQdGQRvzQGJyZh8OfAaSaSCVS5Oc/nqk7EcyYOAXu/lO9IGTl1wD/viJ3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793884475;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=23xE/pG0PxrZgDnTN6o56S9USHdH1/BEwYK81Qphu78=;
	b=OI2LrBExU7bPcso3Rl8xCHaV/CLO1/RHG2bj1wjX7GZSm2fyLNcMNT03bzNcTMqaRq3j
	 uiJHKtdSE6/Cs9yk7Zu7DVOa7wxR/JYdurJdxO8kga28ReP9neO7yE8FUcIOVQOBmzsm1
	 8geP4R6K4DzsGM7rtj3WOpDO6r4NVPrtCqVOCx7uQWs71QWG48U5E6kbOg6Qt2qaKp69x
	 hMhyKJ5o823M4w5YMp6PfZjdIkZ2m/TmqY9lh1plNDs+cvfPGXDeBbUupDzoJVxTeFeky
	 ivpj991U1hmXVgQnkJd1pCxkizc325kDP6PctlWAwwonNQXgtoTWbxzCPK3qwYPLFZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GS9QQOEv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NWZfsYNL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F70C606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 13:14:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F70C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GS9QQOEv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NWZfsYNL
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5B3LZj3193512
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 13:14:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=23xE/pG0PxrZgDnTN6o56S
	9USHdH1/BEwYK81Qphu78=; b=GS9QQOEvyagyxW4AOpm6qYjR7jCKPC9ovlt/st
	BKSccjL8AG0Ka1So5VO9j6GGzimISP3h3dtirV5lPTqpe/NUDU8oYHV0X9yWGziy
	F6aLmxd+4AClGFV49qJ4ZJ8DI1QAqhOxnutB+MCUF2zin7ayMmkl4iAMae8kou8L
	GFSgwrJBaYyvREDrr1DOKhPDhRrHheOPZqWGXhmnq8jjHnwFzEfoJpBX+a3XhS3+
	sGatro6fX54ZfHd9u4r3SKR/y6G5e/R3/tHcztS0eIjQygnXRkMhgkZAxOW2myuU
	usc22bkt0IKe4b3Htqk+sLYgw5eODEY4n6tZcocDQtPwuuIA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrrkdrhsj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:14:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f568dee56so349584185a.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 05:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793884472; x=1794489272; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=23xE/pG0PxrZgDnTN6o56S9USHdH1/BEwYK81Qphu78=;
        b=NWZfsYNL8uCzcBcHt6ZQ8GuYtbzTjwRj0tZ56Z+Uu3jD3vLURCwZgpovB25qsOyvye
         8ypPOvFzQGqaoYjckWuC8UKrp2UvxTm9L8LEDVz3fwH5aLEtWfU/WohCdCG+cp+NvJAV
         sINKNHMp/TPX/1JKM+U2as/ecJmMr0e3yGqmUxJ9tpG2FDhRfRgwtrcR1KvQ5vIp0KZC
         1hypduv8vkZB0/poi4w3J6oRVzWgFPXSUEiNSDLymzcrLVt0/fKrmOsx5VpiN/yaJNGa
         G2/ZZAD5cgHEaz+Tp0C4okrWJ9Ur9+FJ4K7Qu91Cz+/VSCNX23fGt5y7h18e+5o/6WiX
         4F8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793884472; x=1794489272;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=23xE/pG0PxrZgDnTN6o56S9USHdH1/BEwYK81Qphu78=;
        b=BQT449e0673nQeo6LVdjKbUmLRAkSPMdfcuVUNcJQMAi3+mRDTtgbs4V27kqr26s3L
         uT+0mhBY44+1rNi3pM47HW5Q34Y43Acuy+GJB4g0wtpgHoFRsY6OaOiS9RUDwh7vxCwk
         NIrJb+9tYkJMI2FsuUbT/Nxopps4F1+moam5ieZb241FpMOg2+d/lEhemBvmdyxqrE9T
         aQQP1itJABY3la52fdTn2CmNCwJehou05KK+9xjxP4nvBt8tTsesYMo9UDGd0e9mAmi+
         GeNSVpA8BEQWgjCU91RZshCuD2KjC5ynVHmIxc1haSU5P3pHUy0nHwE3529SxsRymK6x
         rM7g==
X-Forwarded-Encrypted: i=1; AKwUvBzp6IQ1XR1qpkIvU+BJ35weFrbWOdh5dsBE3u9q3pzYvpBW/X+ASgVHIOABfjKN3sQ1FiMV68Z6l3mJgwU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WJ1VdT+gNADaBl61734ZoZ+b5I/Kzj2VkzmUNCf+6798+wROv
	Ym40C7Rpgb0Tyq7EJx1QVmbhEqm9LZDiSbklIWdsgENidTE/G7us4rMTVqHKtA81QJwpD8CMyqQ
	W3NP7YInRhj9wV0UHBDOlyVOmf0WUaEBPDDgmD0lZgrHa5/a4rTCUFhfNzl0wfVdOJbA=
X-Gm-Gg: AYBFou1NRkcXfpHLIQuiypj5kzew8OeQ+2WyDs16gCADv/rmBWV1TtynvtR4gfL8Wwg
	PRMwcgQtZGs6y/sZsxMQfVQrsJsvECd3O+vVLSKBCcaXusB0/kNYT0S6G2DdJclOdjYr3dtj3TY
	73T1YM8cGHoKUzAemRgG57x4efUXKVuBYU9NYdV/XCC9VRQOV+67RKWqPf++T0wdRtQfZ3c5iMW
	pD5wuuTP4ZB1ZfmTkuJSWYbiX4LBZCTgu/tWKu23Gr0QL0DhzbrEaVI3xaBE4QmHRVmWHqkhhJX
	ag5SQwANhmmJPVb2b1VKn4Q6N0dOXcid3gNNZhPumSBztftNzHpX4TAVo4Strb5cSne0jX5aLI7
	v7gJPr32Bi2DrBlemE3bcBPGDlU1p0FTLXikhr0/pi63qP7HX63eUx3GKxJ16mKfzt8tohkz5Cu
	IzJA==
X-Received: by 2002:a05:620a:a8cb:10b0:93f:2ab9:7294 with SMTP id af79cd13be357-94430bc5284mr1978057385a.29.1793884472159;
        Thu, 05 Nov 2026 05:14:32 -0800 (PST)
X-Received: by 2002:a05:620a:a8cb:10b0:93f:2ab9:7294 with SMTP id af79cd13be357-94430bc5284mr1978054185a.29.1793884471727;
        Thu, 05 Nov 2026 05:14:31 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56ea594cfsm58427225e9.5.2026.11.05.05.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:14:30 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 14:14:27 +0100
Subject: [PATCH] gpio: sodaville: fix use-after-free bug when registering
 the irqchip
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
Message-Id: <20261105-gpio-sodaville-use-after-free-v1-1-f572f40feedd@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADKB7GoC/x3MQQqDMBAF0KvIrDuQBNuKVyldRP2xA2Jkpoog3
 t3g8m3eQQYVGLXVQYpNTPJc4B8V9b84j2AZiim48PLePXlcJLPlIW4yTeDVwDH9oZwUYNeEGu8
 aHXxD5VgUSfb7/3zP8wKZe0oPbwAAAA==
X-Change-ID: 20261105-gpio-sodaville-use-after-free-0824e74ebe18
To: Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1837;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=mtZCRkkcVp1Pu8MTkbPwoYXRgIxey6b4FJwI8ZeDJrU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq7IE1+YCaN3rfSgsz490/sqXEUn/d0CQdL3/3b
 4jl2xeGVMSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauyBNQAKCRAFnS7L/zaE
 w5RPD/4mACSFED3s9lgkJASVoQ96FuxBAVSoSz7sJPe7ON4ttfxDlSOQZ7SFV2Jrtn3lfqXXq7C
 TQZOyAiTJlC+qarUYkIR8eieV2YudN+Mk9sdCrwI2xggU9l6rjyocu4M8wQde5pOGKaCKfFC0uf
 cJUVgadk+5qZS2694XAgy0mpskmeQtnYKyJuz3KkkQi/rEAWu7iFcTf13Gv3DjovTnD0tT/2Sr2
 DblPBPpBawhrbjpsGPzx6PwzyT97btbk8eAoOA3S+0GGREE4onSndqkjLIKcflHymc3zCc4tYXv
 kfQwoy55h78c9UCR/2URIGs8gNfeZK62fNK1rRlYW5msPsgTN0sZcwBSMMTsHUcZBVU1f7MTHkh
 jAfW75kQgmesLjiEudM7PREIOJqpo/TB4NbYj4HAmET/MeasIqg1ThslL5iHXbxiXx1kou/Z/6+
 8HGk2JsBBVJh5mYKsvOp2Xsh9RQUJdo1lw9INoY/Wdy86E7+4ovsquIyRMXD/ql8nNzkLLmToKM
 Y5dZGTTpPzE6yskZGhp/64kH7hVc2BlgTpkNLxu37MajFmh4PdyTmt9ulredKHVon3+YMj4PL7v
 6vxeskvmrkmVkg6zW9EKLcC16lqlYwHAGtNidvEUgkKkfn54Z0Sni4DLcODiBbgQZ8UQmE30nLh
 QD6nGUIANxxx1Yw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=Xd4cX455 c=1 sm=1 tr=0 ts=6aec8139 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NpnzE1Ya6WnjZ8Z4SpgA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: 83s8xb-Nn555t6xFEb1-oxEzVamvcuDa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1MiBTYWx0ZWRfX57IWU7q+f/xA
 jajzF8XClVBzqV1SezPcl0eHEPAw/FQQkXhyVLNVwMinAQxaPBJCPUIjASCPyd8rhMky7KO55lJ
 7DM5aLgAM/p8lmZTh2HdrzP5yfjtgnA=
X-Proofpoint-GUID: 83s8xb-Nn555t6xFEb1-oxEzVamvcuDa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1MiBTYWx0ZWRfX862q2N7MFta8
 pCdkaS1QivpurHyq2D8Q0wTYPHEx68oAVbz8BGnGpdDDvUAsmZl/fniu1fp63uh3/bKwOcX1b9t
 HMZmJ1iI44De1sd6Wib4VZxVF9M1gAqa79Ma0SlkdElBvJ4YycQnc8nw41Des8YTqloaLUYLGli
 e2pW17/Kh9EuQVnr4DYLP01mKFXmrwbD5aT62itKIpTIAC9NUnjcP8NuSgR/bZfseAarrvwjj5U
 DsAAMX5ix26k6CZt+F1yLaMdXX5eA6mYIEIlzn+e5Q2bTnCOdrEDce6pQkTTlao7eSqunGpqX0a
 kRCLDj6wYHJ7Y0MSOiHZhFqL4KQ0xN2nwvThB+YUGwrxCFWHKqyzHxMRYunOUn3VTg+x2zgsVlD
 +mu5SmpvYltlZ/I19W2l09rQi+1fSwihGAzfnMst+/LMBsZ4NgEa6nS/xvPIaCXtIYEJDKsqbi7
 ceElNXB0Tb0EMzvj4zA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050052

In sdv_register_irqsupport(), if irq_domain_create_legacy() fails during
device probing, a generic IRQ chip is left registered in the global gc_list
while its underlying memory is freed, leading to a use-after-free. Use
the managed variant of irq_setup_generic_chip() to ensure that the chip
gets unregistered before the memory it uses is freed.

Cc: stable@vger.kernel.org
Fixes: 9381fc5d655d ("gpio: sodaville: Convert to use managed functions pcim_* and devm_*")
Closes: https://sashiko.dev/#/bug/linux-2f7ac8b6-5034-4ff1-9afa-5700ff44e3e9
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpio-sodaville.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-sodaville.c b/drivers/gpio/gpio-sodaville.c
index e2a784df275c98699dd625c48f14a3be31113920..4ae38d964bfc1f4191ebebaf4716d544183a9e8e 100644
--- a/drivers/gpio/gpio-sodaville.c
+++ b/drivers/gpio/gpio-sodaville.c
@@ -166,9 +166,12 @@ static int sdv_register_irqsupport(struct sdv_gpio_chip_data *sd,
 	ct->chip.irq_eoi = irq_gc_eoi;
 	ct->chip.irq_set_type = sdv_gpio_pub_set_type;
 
-	irq_setup_generic_chip(sd->gc, IRQ_MSK(SDV_NUM_PUB_GPIOS),
-			IRQ_GC_INIT_MASK_CACHE, IRQ_NOREQUEST,
-			IRQ_LEVEL | IRQ_NOPROBE);
+	ret = devm_irq_setup_generic_chip(&pdev->dev, sd->gc,
+					  IRQ_MSK(SDV_NUM_PUB_GPIOS),
+					  IRQ_GC_INIT_MASK_CACHE, IRQ_NOREQUEST,
+					  IRQ_LEVEL | IRQ_NOPROBE);
+	if (ret)
+		return ret;
 
 	sd->id = irq_domain_create_legacy(dev_fwnode(&pdev->dev), SDV_NUM_PUB_GPIOS, sd->irq_base,
 					  0, &irq_domain_sdv_ops, sd);

---
base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
change-id: 20261105-gpio-sodaville-use-after-free-0824e74ebe18

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


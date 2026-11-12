Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794492656;
	b=jnezJLpeEnSMukU8TgHt4Nztro2Pd3AOIIo7PobvdjUtY0G5nIq1Ole7ypJnvZKX26bk
	 z1speo2lGHzqtP7U5ewTrelAU/0HskAC6JBkriXXo9SxV2ntdEbHF/kCNvlCxFvSMoNUU
	 pdyhNSwWjrWYffZwyL7sq3dpvu2jyPTGkJumr/5EQqd1h99gfBRtzHREP7trDDbHP13lC
	 e7jy4K0npXALrSEs9wPmnuzJ55nPxLnQdTbCf0faClAH5x+CpItA+zP6/1RjdHUYdD1rV
	 lSnP2dIDLa5hbPTcHU3BSZ16MtzrXOukDl2EhHUMCv/MiN3VK0rJlVlfHXNEgTuXiLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794492656;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nxz0IxyZ0qklpIDkMqdgjYELFVGmdSKRcaGfWcs3vIw=;
	b=bnH1KH0ZPQ+Qs1MAfG6x+Hl3G4U0uwKJllgXhqnpZsUmcjGqBLaMNuPvkkBLcyQ/0jNh
	 l+6jfH8I9RYa/Pla1TBZUqwd3qrLssPC+MZCC7iAeS0MG6EWJ+UuLr7pf4cZin7a/pP/I
	 SmTNUB14DXzBQpyrXMl1XRWjKmQkMAy7xxocm1IQlaw+ongaogTBUZ0Nlh+17cdm4q+M6
	 RJAoX0NQXYUFwLenAMJid7Cnom+J9S9wM7oETdMMdYhMo3WZYpx0JI9b5kvsczOHY8Cc+
	 g5x8BE7rpqMtQzHX402DHdua+bbkI5Bh19m90Y2Me23c0xwxFWudqVe/eCftFchqZMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WVGjJzZI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DiqapLmy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE444606A331
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:10:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE444606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WVGjJzZI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DiqapLmy
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACAfUrr1954312
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:10:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nxz0IxyZ0qklpIDkMqdgjYELFVGmdSKRcaGfWcs3vIw=; b=WVGjJzZIeob9bIej
	nMTml9n/R5SiVaogsSaU601e+NKusrEJNrB1jiXFnCrVNuQWxA61+RsKgOKMo2tD
	0BuQxqMtPfyepnT7jSxJETcghbMBgKat2IoRurTgCeiL/V3W+SwhDIAiLUYfdFjT
	9e6cy/J9EwtLOwQz1wKZt9KDowLVBqpNh5DjK7dXIRIGLG8pxtPMCPe63Um7zcnk
	B3UPrlZ0uABRTW91QWIV/kkS8dk12vq9bQ7qOFtoQIn5hivvSn3JLMCTK6JyiUXU
	MlunMISvIlRZGQ+Y44WRaQQQjZSxDGycBvh5leWdEgnBJ6w9oQjC+S0K6sWZw5Lm
	y1tJZw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbx30pv0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:10:55 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ee30bf935eso65746e0c.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794492654; x=1795097454; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nxz0IxyZ0qklpIDkMqdgjYELFVGmdSKRcaGfWcs3vIw=;
        b=DiqapLmykv/YUs5MkTbMNKYLq4Lz5Dr8uKHwic7xNPQYiZWRTBQgDaqeguEqcHSwYA
         rchP89kU7Z42l1Fka68IAbK4iyA/e7YuLnd3clYm/iFr7niloLZtl4xzy3ff/g3S1TXo
         XVcBIgWR7iw9umwD9ki+LxSQE7CZZqnaUlVphbEgivxkBxH0L4ixgT0Qr7Zvq+noq9gc
         SdrH23+uhWQ8ToQW2KMuWCrkOAvNnskoJiwm1I3sHmfcielpecvbZ+k0RfS3yjM1WjPJ
         6o3JM0MTF7nQ/svbWLTLpUw8vKI3eVBszOE1gPWbEvSBWr8be0hSs4yMVoYr+allYI2Q
         GF2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794492654; x=1795097454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nxz0IxyZ0qklpIDkMqdgjYELFVGmdSKRcaGfWcs3vIw=;
        b=qyfw8RnXKiQ/nFgZmiXQ+CMoXITR1japkCp2ZRlDfPbtoutnyRf50WTucWI1nkmpz/
         VC5aKReKT/Bc2vI1wZkwF71++AZ7HvDdujr3NPQrJFblbx17RUYNhlgdklvllfopKWQD
         0scQxdpY7pCpHudUI403spAHZYFweIFcdJ0fYPiqOd8F9Act/3Cc0kwA5TK6Q07qPTZ4
         YHA0C6CvemoYjruZURYKZv7xg/0tO13sQQI3wk5uWn/b+0N1J30e7ES+kg/EEpz8YS8w
         kAZXHm/zbgncAcLW/fm8rxuskswr0CkVdPJzj3ff+kdpzRq3NxpeELnIqu/jN7OL4p1i
         hOMw==
X-Forwarded-Encrypted: i=1; AL+hErHaeG/5NRY8zMpFLW4hY4wMsrHeGGn6p2PHTnjvFeHNfVevkd8my1W26kZw7lKz8c2qWFf/nnlefcBK3JA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LhIPdxdJVmq8A2xqShvloJVh2f72vQOpaGU7TWEeQ/p5mmFkJ
	Ivhycd+sh4h8EkVfmmeFDRzkUnYGt089rspvoPdZRclGmFWijXi+pGv3iXi4IYgfmzSg+qnYPXV
	EYPT8MqaX2uz/junA/j4pPwINNhI55T5CNuRy/ny7w8ZzkUD8oAlwDtwupWODGhlL3tI=
X-Gm-Gg: AYBFou0JLV7pC6tXIjqceJn1gG1QWfnO+O/y4MeqslfO7sWWEjG03SBrQDeuzmModxb
	vDXJPx1hMRRIQ98gC7OzpstF5WOokMdMFuNoCJVWvfH/IPg2rlTdTuuA6r0rJHgEobKEhV7GrOv
	joavZvn2Xaa16qnL3WX594z924IhiUWT4r6IC6JRLXMkd6AIfo3EaIw9KDXACku0QLXz4z8dOsg
	EKFyG1sA0erPtKp0lytLm43L3bPWyEowA5tUqQwm2Wl4d3gKTh/qDBXm1nkf9bhqzu4+pBH/V3+
	OgR8NYkEtzy/rxFSGAKbzyhqY/I2/CdUaCCHMHYQ/+EIHY9Co4cCYliD2VBvD8I3hDRRn526iRa
	XpgBVhqLPEHwqW1iRoXOB55mf6ks5UjcD7+Q90Az/E0g8Amy6MZ6EAydkBNz1lkzw8b7e4shweL
	7oSUJvmtXnh9e9SfZ9VS42atDdpEMDTmYzAiD2OorQoxMl2tIcO0P4BFHhbLQpcec=
X-Received: by 2002:a05:6122:3119:b0:5ec:d70c:6326 with SMTP id 71dfb90a1353d-5ee1c46be08mr2351954e0c.23.1794492654201;
        Thu, 12 Nov 2026 06:10:54 -0800 (PST)
X-Received: by 2002:a05:6122:3119:b0:5ec:d70c:6326 with SMTP id 71dfb90a1353d-5ee1c46be08mr2351938e0c.23.1794492653647;
        Thu, 12 Nov 2026 06:10:53 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e271378sm81817775e9.13.2026.11.12.06.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 06:10:52 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 15:10:43 +0100
Subject: [PATCH v11 3/4] arm64: defconfig: update the Qualcomm Crypto
 Engine entry
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
Message-Id: <20261112-qce-fix-self-tests-v11-3-b86a65ee7107@oss.qualcomm.com>
References: <20261112-qce-fix-self-tests-v11-0-b86a65ee7107@oss.qualcomm.com>
In-Reply-To: <20261112-qce-fix-self-tests-v11-0-b86a65ee7107@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1275;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=WtO6aZCAkjOIZjzSkn3SdWOc0GthFTg4IDGn8knbBYM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq9cjlADNyic9kqSgOBPEjApUyRLS0M2VjdEVhi
 jHnGi7k/RyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavXI5QAKCRAFnS7L/zaE
 wyNHD/wN3ge3XOkQAQewv1CsqcXmlrtv2VRnzTM2OFXGbrdEGMeXv9p0wAH+LrBDFSwseEfUuIo
 fbw78Sc2HpDlmS9/rd/11olWyIQ1GXulBtwBbzr21c7m0LM50t8IuVafGDmdENGI2ZzpDGh8FDL
 IHy1facCttMxma6eLUlEt9nrW/qIf3wNAwZbrllDQLnCEFAXI2QUC2BoGQZYRjKX++D5K/eHAuu
 WkF325e0JMpBnPAttKtworXrkzu8X5u5CMKGLEii5sh/p4fFMCiQwgkYKZF8L4JiNhhJyxDDbrB
 YWYXE097EzSfukj3M+9scO/syqzPSTiUFL3f6wLRTBs1ZU+hHeZx9bWwp6ZMwB+j0DWvbUczjsG
 RZk0HxNDWbFbl4tcIyIILowMuWCcmTqGkCrdAs3K2jkwUgQcHddWtwiYMms++oXiGuCdA+Th+Mx
 kxEKHrLevhBvAV6J1BTQR9tVRMY2CgcMIlKDCeQkUHw4yIKiPKJvI469x4cYy7xMYHjIpTuWyZZ
 MJ3ujyuEyBzA2GeAUMjU3//XAEcqnWMqxFcTmzzMsGusY8zrPR51LnO6TYqpo57dlj3W72IveOJ
 Yn9a3mKVS4cuG6G3P5sQS4p2jxOzLmWLLGa80hruLooShMJHRFx13mTp4kxiAxkYvno0vtQqy6B
 dn8alaocjC4w0Mw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=S+5MU4sP c=1 sm=1 tr=0 ts=6af5c8ef cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=5AW58fNYxLuDjIPvRSgA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1NiBTYWx0ZWRfX6UzoJETqyjvZ
 qEtts5zsmBFeLG5uRuHlFqcb9YOGtpTokJL/TQywH+2U5l5+ND8i3wQjDdbZ8QbGKsIz4UAF3ep
 QiOXm0ziH+LCYX89Tqt5JTFh8C0QhtV7AjFnCYSlHtHCQrdx91pl30T2X2Nh21+g2+NxICOZ+6+
 dXmgyWVw8WCsTbhWucqp3faKuv+qUgkFw2U1M0YX1zB8leMTO+KbKQHENs3/HaJezBIzR+jI1od
 7YY2Yj0QdKMx9EQsiRSi6Phe/Rg4gIBlWt4PIdfr+qfznciDvN97GW4yNtkrahHQebNFDp+21ZJ
 jCt42bJxc0Hwi+3/7Sl+O9CBNm8pmfrsl+UU/OFc8F7wXyDJTZVMu71U2Y+Ai/zndp/ASUeYijh
 xWQyDOTrf3gaFuM59DEAzvaFzajrmyWlnzISWu+MZgfQSg/J9XhjYWboZkoLAAx06zE17waQ9VX
 CaY8UrzzA5JG3UYjA1A==
X-Proofpoint-ORIG-GUID: 9JadQbcx-d8qadjj1Qb-RhF9H8Qq8fV5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1NiBTYWx0ZWRfX3oZ9p4A/SPF6
 OsFIqmMqDkMl1184liCBznm9TTb0GxtV0hnWRtaRAIwJSINTDr7nJwIKr2Gp+q2wjpLhLm04H2h
 WIr1NlwGk+3s/QUL87XqViW2MdnAB/0=
X-Proofpoint-GUID: 9JadQbcx-d8qadjj1Qb-RhF9H8Qq8fV5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120056

Most Qualcomm SoCs contain the QCE hardware offloader. The crypto driver
for this IP is being split into a smaller core stub that doesn't register
the crypto algorithms on its own AND an auxiliary driver than handles
the crypto part. Update the arm64 defconfig to only build the core part
by default and leave the choice of building the crypto part to the user.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f9179bba64de773886d20cee388293cf9f538ab0..cc81a68f234b9818331d05b51b40735c3296fdb1 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1550,6 +1550,7 @@ CONFIG_MTK_CMDQ=m
 CONFIG_MTK_DEVAPC=m
 CONFIG_MTK_PMIC_WRAP=y
 CONFIG_MTK_SVS=m
+CONFIG_QCOM_CRYPTO_CORE=m
 CONFIG_QCOM_SPM=m
 CONFIG_ROCKCHIP_IODOMAIN=y
 CONFIG_TI_PRUSS=m
@@ -1800,7 +1801,6 @@ CONFIG_CRYPTO_AES_ARM64_CE_CCM=y
 CONFIG_CRYPTO_DEV_SUN8I_CE=m
 CONFIG_CRYPTO_DEV_FSL_CAAM=m
 CONFIG_CRYPTO_DEV_FSL_DPAA2_CAAM=m
-CONFIG_CRYPTO_DEV_QCE=m
 CONFIG_CRYPTO_DEV_TEGRA=m
 CONFIG_CRYPTO_DEV_ZYNQMP_AES=m
 CONFIG_CRYPTO_DEV_ZYNQMP_SHA3=m

-- 
2.47.3


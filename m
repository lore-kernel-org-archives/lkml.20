Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4C454EEB2
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790081904; cv=none; b=in2x9fh+KXeCUR1srQ+eIUR4jG9e8E7bSDXAg6PG7A0awKRNjEdJwiHiI5WDNuUSRC3cQqi2baxfhVa3c3FznoKIL9PTbGU90bN1DzQTyO/Hsw4523VTb47aVJ8OeYiRI8S8FQLOAzly0tTzT6cCIX3OWoWQ79mm33yMPaL4kvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790081904; c=relaxed/simple;
	bh=ji7o4kGz34cmVqJOSJOjQ8rHVe1A4JqseoZChXshzjA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pYQ5wzs8mMPjxAYABDoXTd3MIFI68FWSxH0dPRZT9St5nm4C2lKNcR0e+P5sd/bQoAfeMbJGbtZAemDOXQ7g24jtkEOkDFAaIrV8ucaaEjdZu5pRn+AYFaAcprmxZi7vwPSmPA7mNveZAvJrm8M9EpTrankLMR1TUEzLN+G8oV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TYFN3Rj9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Viuqi7Yc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TYFN3Rj9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Viuqi7Yc"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBPgY1134464
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:58:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gdQOWdli3leTGKHPsnF/A7t0W6rlUUzFDLfpE5R26M4=; b=TYFN3Rj9nbYmcuo+
	CQZO2Gc0LDvB97lIWN2+3qtDKRNGrtPfoDup28dl+2vwoWhijk99Ou+GPl1OZbfF
	ZrYUHeUFuaKIMPbCPDKbSxy7V7pdM7dywlnvftb7mcF5RnJz70QSkURyVdNSGrrK
	4GTCT6psWzp2cQOa3dybij6E5NqQ0gHUarikEwfE01gV3L632efFU/BLG6/dodYE
	xIX1G7Brd83b959qzHs/hWo66EoFIc4rypgorleR8QjqO3DOIph2nHwmPzyewO6Y
	GUfAJj0d3W/B75woNe8MOG82i8PV4TuZRrRqQ+LDpR+UVHtoGwXLiIuKkCHLC1Bv
	bKA4qw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gujkja0fv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:58:22 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c96449cbb2so1263713e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790081901; x=1790686701; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gdQOWdli3leTGKHPsnF/A7t0W6rlUUzFDLfpE5R26M4=;
        b=Viuqi7YcEKkLLqwJKhs/FXGc9Xl96cjx2e2wT05U7L3/VYvU9tXLgRW0nRejAMlN25
         fzJGQhHsSMCvB2LuIJqgX7u4ygQlLdOfuiME9O3WZ+rhmYzOE/4cqYLqm4QYEgqITsQw
         qIjvTj8TjzdUT/qgRKJdbvrDEg+bNcFWt3KD6ZUkvATFQoXTLdpj16rGvYprZ7m2BF79
         EadYeuOQcTlp084vSbMJTZl0vZhmNo1911bD1m+atSirue1DAic73z//k9V0XUAC3055
         Gz+jYxYopjQunRCZ0gQXFUxojLkxo8BUQKfoBlc1N5UpQFeyQddJYA42Sb5obyItBv1w
         +k+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790081901; x=1790686701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gdQOWdli3leTGKHPsnF/A7t0W6rlUUzFDLfpE5R26M4=;
        b=sfB4HWoXPoKwO8MtqwmEKOrZFXkcWFkej91atzbI/C9Scu3okiaTmiQGuOj7idfmFF
         1FfyD6qSXGEEWQzrkYH29wPK/jjzTvkQYgwspGKvQ2cZzNOF8epg+OQ8FevAN5Ab2A78
         Tg8JLDQet/dHnf0Vk+bxkmzNA+JxvNO3vwjokEfc0nSb/9arHZh84Iqpu0liUl0LNHHc
         KuqHKiZ7/jlK9xK5gnQAK2HAo8l+hnU5HeuERl4uVfxtAJ9nzvZEaUFe9DQW/gUeC2Dh
         ffe15eA8+0a9CCLWeKbIwfJRyRcQFVYQGKFChuo0sCaLzjBUzWJy+BdktFP67befxE/q
         GfEA==
X-Forwarded-Encrypted: i=1; AKwUvBwBdKNHbwvdXHsYME0ePsYkfSiEug0EsQDbLUByYPeWNKd7Sv14nH1UNQMUK+tYH0JYtXWNO5zkTvB67aM=@vger.kernel.org
X-Gm-Message-State: AFuF++lLuQvacTrZ3Kk+c8tp0xZDz1vcTIXyvbgfLmXLnQlfsGpgag6U
	4c5yeIelgfpb/UTz8FUEiTrTM4gFP+ZR/0xjt92gaMMuaexT8wOghPMkoc5gwR19Q0WvV35KkkH
	tXyZSsJOaRbFLDPGQB5ooLv48jEGwB9jarXFBf62pAs684/8+8HRTK7b4TpGpqmJyNauD8qp7VP
	0=
X-Gm-Gg: AYBFou2Z29qGdtejxckivvULfpbV5VdPeob9VNu2qWPXb5GXA/IaDWbaO3qMyNbqBfb
	B1hwo8McLSvoB116/2OBaXYmt4SbhHnpMp2+YTyJ2vDThfAyVgU6CQSC8osXg5iU+twG7yQHKRw
	VRb1ak+RTV8elZGiuqDaZbvXsm0Tj3aNtDo1gqDf3LUIOC/yFH5hV9mDsmZbWPRgBYmC6sQmuMe
	ckSoOwKfhW7MiSGCvn5D7Cq07gbtam0GuGMA5o0RbpwYhWjumGtvCU3F0om6s8WBFWzDqYLppJv
	BmflQchgcsZ/An0mxqVcGgF/DBbcxKEtm2z+ZcMH7PrJnF10iiM46SPRMODAUT+jd1iYdgRbJM8
	manrp/e/HD82U99uDUV8p/zJQWvA=
X-Received: by 2002:a05:6122:30e7:b0:5c5:731b:11d2 with SMTP id 71dfb90a1353d-5c9b5941ac6mr8272814e0c.8.1790081901484;
        Tue, 22 Sep 2026 05:58:21 -0700 (PDT)
X-Received: by 2002:a05:6122:30e7:b0:5c5:731b:11d2 with SMTP id 71dfb90a1353d-5c9b5941ac6mr8272781e0c.8.1790081901093;
        Tue, 22 Sep 2026 05:58:21 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5105:ff9:e148:c440])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa4537b5dsm1097669a12.30.2026.09.22.05.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:58:18 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 14:57:28 +0200
Subject: [PATCH v9 13/14] arm64: defconfig: enable the Qualcomm Crypto
 Engine core driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-qce-fix-self-tests-v9-13-b1aa742e79af@oss.qualcomm.com>
References: <20260922-qce-fix-self-tests-v9-0-b1aa742e79af@oss.qualcomm.com>
In-Reply-To: <20260922-qce-fix-self-tests-v9-0-b1aa742e79af@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1162;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ji7o4kGz34cmVqJOSJOjQ8rHVe1A4JqseoZChXshzjA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqsntBZe+g9nIUmEpjkGFYbi2XVnb0JwBoWcN0y
 jLA7FsjUqOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarJ7QQAKCRAFnS7L/zaE
 w1FGD/9zS9mD6MAL7sm4C/rsUcW5SvYKlJbCC0/J2T1qsC0SdU/4+x/En2iirGXcg8nK8eLFDR0
 URYFkpKH7sNHFAaAb/X6Fpnblmsd+qSLlN6UOaARP9SjW5QeVYQgACox15hWvRd1usp9uOXtUUP
 LLvI5fHP62PPWN7YwnYn5QRLhTEMzQeMO/eOeSrdYY1JteT/Jen6O4BY6J0/xvcPfYkbxv7RY+O
 npRSFYCxCk2/Rup6FEqjVN9jOukFkbopqOeU6b/iU62Icv/YJnia8FXsBBXWzUQj0swG8NBBZ1V
 PzaYFhv+0WVM/ASVixkxKCylm53ucCmu1iFcPjaN+36oocp9w1W9svt3d4prcqqnAr/RhcSvKSU
 UEsCMPY1++j0bv6DMfXRhv87czKaIDBr6qhPWMvd40FtxIihkWNwgcS/53gz3oZKKO+M/i3yeR4
 r/obEbKcDaSoWA8olvOProisSg1GaLf7AD7FochOcHD0EPAOk4p4sWhyXns5wic1C7P4EMgkAnZ
 A2Z8hkwBkUxtHvMoX/XLC9VlofEIlFN4Scbn45YB9q4w/pNDRmSO2fTy8/d8MwYtc16pw+4CNQR
 0YhTd73JZ0rCc1c63rNuEquGcfUK9sBMoqYhkVXYr2rgDsLMu6B0YF+vFBm98F/LwCYZFUUduO2
 3HAb86ZY2+UUhlw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: oef3ucpdYEhnXk39HSC7Vb381TeSpU7u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE4NyBTYWx0ZWRfX2QAwvHZ8Ob9f
 Lk+16U8A6XIhMm2C75WJHfEzq1QvbuATxqwG6wtgU0CU3E+umCu9DTqeExDYXKLzegIGAlLKbcG
 ZN8SNmtiVtwF9B3RYJ6VY77PJDiGetO0H8dL2lO0mSVHNhnWlWOn8fpr9Jz38uqiBO+ulO4GIPn
 lXrmKJ4sPhwd2Z6QssNOAZ082K/nwZEaS5SSt4+UG78M0MJvVbZmLIcwZXNFRv/sIKebwpCaD2e
 3h5wx9VNKD676liKsxiUiTuL28hP68HhdOZkPSR8OLCgJK2nmPvwb4V5TpxcbBhmDytPOP7i2KU
 3oXhMjjjhgJU8LsmWpbLyggR8QIze+Qtlf7x4MDzIF9TZs6YQEmJ+vSzHLxSSij9Cg3jCAaBu8P
 kLSTpha7sBfO12CxYsQledp3SNRXWOCj96BK2o+BUr5prmEjrjJh1nE8+ZUF2Oe2MnP7EiEGLfr
 cNFZyUK1OmAIKUsy07Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE4NyBTYWx0ZWRfX9Sz4SGzdNd0Q
 ctDYQtNwIBHzywcXAZFQR3z3Ks2ffNidYpauj++8REpxlXyCQDcoA/mysealz6JxJ4JGWt0xfCE
 DyKJ4p3Sc9o0p3+8CHD/fLbnyUzS4NY=
X-Authority-Analysis: v=2.4 cv=SuAFe/O0 c=1 sm=1 tr=0 ts=6ab27b6e cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=QftN5WpXeUmWSfsFEiEA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: oef3ucpdYEhnXk39HSC7Vb381TeSpU7u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220187

The QCE core driver should be enabled by default as it binds to the qce
device node and scales down the interconnects if no child auxiliary
driver is using the IP. Add it to the arm64 defconfig. Disable the
crypto part of the driver by default.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e80927f87ff26fe3f51db6409f509fb99ad614a0..760f9e9fb2ae13392563ade5de871a5e882d195d 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1663,6 +1663,7 @@ CONFIG_QCOM_SMD_RPM=y
 CONFIG_QCOM_SMP2P=y
 CONFIG_QCOM_SMSM=y
 CONFIG_QCOM_SOCINFO=m
+CONFIG_QCOM_CRYPTO_CORE=m
 CONFIG_QCOM_SPM=m
 CONFIG_QCOM_STATS=m
 CONFIG_QCOM_WCNSS_CTRL=m
@@ -1949,7 +1950,6 @@ CONFIG_CRYPTO_AES_ARM64_CE_CCM=y
 CONFIG_CRYPTO_DEV_SUN8I_CE=m
 CONFIG_CRYPTO_DEV_FSL_CAAM=m
 CONFIG_CRYPTO_DEV_FSL_DPAA2_CAAM=m
-CONFIG_CRYPTO_DEV_QCE=m
 CONFIG_CRYPTO_DEV_TEGRA=m
 CONFIG_CRYPTO_DEV_ZYNQMP_AES=m
 CONFIG_CRYPTO_DEV_ZYNQMP_SHA3=m

-- 
2.47.3


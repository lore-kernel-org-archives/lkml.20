Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59863B71DC
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789574162; cv=none; b=bSO585qA4CWXJNRmAquCEthHYjgIjBTJhI1AQvpLIKoznTNZJfVqf5tm3EiPDj/NY5L5oo3q2Fqp2STBLCn4py0FA3Hoxu+zOOhDwonuyGAs7IaSvBu78wD2FXa6UigTWFp6FjvFIu0r11Oqug3kGzqVtrVr4QEPyC+F8kvBIBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789574162; c=relaxed/simple;
	bh=DIO04uzroUuedOOaszUBuucgUOhScwy9gT5HUgyCdZU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uXimZDg7kMyd01Kc88NY8/KnFbYdnoZexsAY5cEvpm5z2SfMlwvM+3THrw+MzySEsLDVX9XkDCvunqUSWG2otdbIQNnRRv2NjTtkVeYqQi8jyKunDhRrWOO7Ck8UrU6m+SvO+RTbcvGYZr4LGBVE5Gma9n1r5GPqU9K3v29gp2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LaCXLmwn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XGy+7I+R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LaCXLmwn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XGy+7I+R"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GFeNPf3233253
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:55:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Z7qzSvvt73cSpQcU8e4RWI
	Qu1jaXpwh9YBIhF8t2N6c=; b=LaCXLmwnYeaHWv7HE4QWyZwl1YgCQ0ZHuSoA08
	DIjnaQVuOv2Lj+C7iDUWkJ4qVtwwj0C6jWcsNXcV3Xd81sArOq6r7iJpExZQkFEY
	3RatSAIuvQ6J+LQK06cnaW/ZdWZK9ap7Y974qK/RptSgbXgpRfpMWTMUbpKrVEK5
	o6BQ4oRy4cwMWXEjEtt/Vk6qhC4X9EmVDJTh2D/tiSjjVyNCip7Vib0WSUo/Sxxt
	15rUfbBS3ijt+ijQcjRA175SkY/wIN5McJtvo/69svBQnZXA7+P8zTLfsrqdaY7V
	JRCxagtEft7ju+22RjnkFk0Pr5gttwhyMrMIgZy7h9UmhEfg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqdywc3h4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:55:50 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7a04805f8f1so648615137.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789574150; x=1790178950; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Z7qzSvvt73cSpQcU8e4RWIQu1jaXpwh9YBIhF8t2N6c=;
        b=XGy+7I+RYbzKM4elUgCyPZ/pIZ6Fn9M6ZHQ1q7w46f1uqYxxaL3KFfusg8d9UgQ3yV
         5s4btxTo4/uCAeQLtnURpbwa+cdBD8QUZbEXbA0gk4iUOlpA21uIRtbAvqcEdiGYeq2U
         yxgVygUjOIN2wq2a52uegQXPpDfJP7zZISSNuZe4sQOBX2nY/j/7rix3lj/kP0pbUWP7
         fUS1Jaaf4LK2BfD1C08+mVVbWQGxjghqv5oWwc6P4ZC6s0L6xSZe1v5hcVArRuvGipkh
         8ZAI0UuZcCC2RDVvFD/gvt6IdlTjCHNFJhdLeTcEl7Yvx2XBXVCZDM68wyNzJg/VKXIG
         5IaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789574150; x=1790178950;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Z7qzSvvt73cSpQcU8e4RWIQu1jaXpwh9YBIhF8t2N6c=;
        b=opaQUmFPiCPc5tN+xzHE4knnFOhIxic+WZYUSD5/cDsjzUyymdRjArAVSqXVL9c8Uc
         LmWQL/q4MCBpAdfN9MUv7elgNP+mVngDCDtQycvaqh6mmjZ10+fDFFeDlzXvQ7mF4IXc
         eYuxj0q+Yn+sRTImVDg6PjGuKPut7k9/LoQ7wABJLxxY57pXDNOdYSSrm6LCgMqZ39H/
         CEgzimNfPEfX+UtPBlpXENihNs+pvssJc1OnWCR0fFFx+bBWmh5xNh3p7INbTjqrggkT
         GldrQBY6RscNKCfTldeNDma6xB9ejNFsL4TS2r1A22omVMxQ26fXGTptCWsxJWNW6m7M
         ZflA==
X-Forwarded-Encrypted: i=1; AKwUvBy/TWjy9IWqm0JhQ/FGudlVP76opVsCRhJXobAUMQM3YR50q9eBZedp8d0nRUde5pwdW7e6asvOtUaMEYI=@vger.kernel.org
X-Gm-Message-State: AFuF++ngkA5dKwiUeaGDFecQZRBVFTLJp9X4Z/EmNuvAuJ7uxMt7/uO1
	Slw2pomX6rdf1UTlJUW8jjvvDDWuG5GMPrpQ1EBK0MBQ30z6jeQvdEwztCp7RAQKYIBzNnQRDyG
	eGTOFnHcLp0JeBipof8KnOiqPILOpwozZTEGb/9Bf0oFFHjwQuH4z3yWnV+9uGmqtL6c=
X-Gm-Gg: AYBFou2pjJf6msLGvo7Nzf/nVzb1YwdPaGpuX/WaW5EU8WhwAI0ulRyieiX1lmvGcwc
	tSRQWW/5dK2LwVDlINpB6hpiC8i8SwdlpODhzEo6T00IrXYUPK4GukCfLXAfdsnUmS7GX17WFgy
	fnb1EdjRbDfWt9ETKldxcTpzfmhDKPnVe3p3a2nDRdZjxKw27H2AiOfGzE3G7fzCLnsJGnxozkp
	2421w171PXArM/xI2YJb71zA9jsZnGETrLJIj/dfEIeErPZVkfECXz81s+hJbh/LfRDi0FF8sUz
	4j01NvFEENMaoqLuo9iAIMvk0DrVeBe/oir+VntitYzEBNDP2cOe49P1Mh1Ks8QDK/nwQLurwq3
	IVVy5P/aZoCC2A3gimy+WQlScmxI=
X-Received: by 2002:a05:6102:3ec7:b0:79b:b116:2c5 with SMTP id ada2fe7eead31-7a023d19677mr3780545137.2.1789574149834;
        Wed, 16 Sep 2026 08:55:49 -0700 (PDT)
X-Received: by 2002:a05:6102:3ec7:b0:79b:b116:2c5 with SMTP id ada2fe7eead31-7a023d19677mr3780503137.2.1789574149415;
        Wed, 16 Sep 2026 08:55:49 -0700 (PDT)
Received: from brgl-qcom.local ([90.161.207.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd2160c2sm765525e9.6.2026.09.16.08.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 08:55:48 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/2] arm64: dts: qcom: nord: add GPI DMA nodes
Date: Wed, 16 Sep 2026 17:55:37 +0200
Message-Id: <20260916-nord-gpi-dts-v1-0-073e3f9c19d0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPm7qmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDS0Mz3bz8ohTd9IJM3ZSSYl0TAxNTM1MDgyTzJEMloJaCotS0zAqwcdG
 xtbUAXkx/EV4AAAA=
X-Change-ID: 20260916-nord-gpi-dts-40456500b7b1
To: Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, brgl@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=626;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=DIO04uzroUuedOOaszUBuucgUOhScwy9gT5HUgyCdZU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqqrv8DuPa1iiZnlD/I2rWIKJ8oLUkqWR+k/9OR
 P59ZNCZLv6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaqq7/AAKCRAFnS7L/zaE
 w1x8EACS85bx+67gX6slKQ2NOYTZyIYWoLDG1o99W6PPU8ac9yzeCcQxjauxJHusAW6NIvvBZd4
 WT8wSR2+c1TZNX6E7TD7AXEbwRJbmCY+tNTppKEEdI/eKrdw43alMrTnFTDS7z2m5Adl8NBDgNT
 kMkRZMN9yq9Q0ehECoJElOGq0kbW1DTan3fOupO6xCVAwM1iNbnBtZaLIy69WAhD35U/ZoJ1puK
 ix+WJMqh+43OU1eHcXgLcC3N+6ZJ8JWfLxXDacK82GiQnEjIHgY/lw7vXv41r/4Ms8my6eFJ/fN
 ccr/509fuW+++b+RotJyA0zSXmpBHfVH5GMAIWuGkTFJnIFoBd4JVnwoWmfdSH40A8CapKiZRiH
 TOoQ9zHR3DkbENWT+YWY1GrI5vkwFrjaghP1YLofwWDTLMvJeIpGq+bBh6BwgT1isyAVyANekfX
 vVZuQctfegG6RTWMxc/f0EmU7ya04IKssw2ejf1Ymhk/YtR4mDZab7wMnKrfEpC19ra1zwpJ/Xm
 bh7nCqLxgRVMcZYpxkLeLr9EaRCWE3XFTvAfFjGsH3wkALqIrZnxROaG1n99hkzvVuqgBM0tyTN
 Xak9m+wNsxNPOfc1WdIJB7YRcirPqz8141SnqhvEtFO1v45/nJLA0KmpYdvj395dem8bo45LiCS
 I+8HMrqCQrWo4yw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: h3vlNaziZ0a1l7w4KEqYZcn_7Nr5OtJQ
X-Authority-Analysis: v=2.4 cv=aJ1lOr9m c=1 sm=1 tr=0 ts=6aaabc06 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=BQ2oiuy6hHN+kKmom1QVvA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Q_R4M8txQULSIu3kbIEA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIxNyBTYWx0ZWRfX7aaNoOQMr+Hg
 +FRcrc5Kl2TkswhBgn7OAji7//1BZNEz1HhkdHtyhCEf21t2dqMZ3STsqfvX5uS/+H3wI4oafjn
 P6IuWJPdo5t78dXT1p91nMEQYW0GIAH9ZNHxUcGspALVOJ/8Ov+h39dRGrd4L3Z4BlL0YvpzfNt
 kXZf2enABvVaMEvsD4+JrEal6F0Wc/K5JUO3YvZW8JiYs0iaMMPVUANQG8lg0q6XeBPFhQ58XHf
 TCq3M7fZg1CB3EmMgr8ZY3HaooxTttl5MiR7ZrWOwYHoY1GKW1hw35QcTEHz0rDCEd+oecRZQPN
 M+W4Z6cB2GFccC6yERV7TM272H24BaeoznBGX79V4lh3sD5oTPAwGTcQMDsnoZ09BXc4FKCID17
 DHD1wsWxpPQYxZaSAmBgrN+TfWn+dXF/4rDznxMrFp1KDUfB297SlqGpqlrmKdpeL8TYZ1WIIxt
 uClm9qCXcmELcBQBSYA==
X-Proofpoint-ORIG-GUID: h3vlNaziZ0a1l7w4KEqYZcn_7Nr5OtJQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIxNyBTYWx0ZWRfX1PDiGD1RqIxf
 yb47pvdbD1ba4DJy5ftWTMfybdeEHAweTndvEd2wkn2sJhhua7dSuMl8Q5ks+VUABZ1Fa1xWk2G
 SAo5WjF8BesFYm69H0aO2qX4p9t2qxc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160217

Add GPI DMA nodes for Nord and reference them from the QUPv3 I2C/SPI
nodes.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (2):
      arm64: dts: qcom: nord: add GPI DMA controller nodes
      arm64: dts: qcom: nord: wire up GPI DMA for QUP I2C/SPI engines

 arch/arm64/boot/dts/qcom/nord.dtsi | 219 +++++++++++++++++++++++++++++++++++++
 1 file changed, 219 insertions(+)
---
base-commit: 3c60a5740403002069d54463b6b0f603b9ba08bb
change-id: 20260916-nord-gpi-dts-40456500b7b1

Best regards,
--  
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794478493;
	b=BuGX7LrxGhijN2q850ThAb10zZgQddF0Q/0U+Bma65NjTeB1/zUTmwJxXCbddtjAE+Cr
	 fcAYvymULvTVpZo8C++AkTVwue+RjtbhqEyBwbSGI08S+qwznYuDeQUPolwvlWVCX/a0D
	 Lh6vFZpQJdLN3Mb8BSEEjrhG5+vB8locMj5AkrFmMCOVTjV+PoMtm5pSkEh6jprGbHgJb
	 8cJYaBR8JW739Oskmcy7XA/RMCHSl1NlzzrbPT8/NrPxXqZUtFrxFT5BwXi19zP/Arnyc
	 Zn+sNc3jf6Gj8+Kz3HEk/z0+xYWdBLGinutaMUAWmRCb5ILZjd6iVyHIWFe4MfJ9Dbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794478493;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qBOR+gFFhPjIkJZAh9FbBz32f5Ed7y+W4HlGKYADqeo=;
	b=XmN7kSnlwlryW3Csu1yeoXzYgDqdTF2MqpqHpoIX1kuziCSyaWyLbiPcpv2tmjZFxtJi
	 06D9SkTCoTNwZnKhYJTiP7yNZU/sJPDxwJLtVl2/kNEGxD67a32uEzpjD58mSJaIRHl9Y
	 URCBC0tGuHteZTP/0yjne5DEQU45h4jdGeb4avWq3A1bKOUy7uWIKhgcKb0ctmzSjDFxP
	 GuOqRctrBJJJtXQFO9EOu7dqs14fkSbAwgtFk6bNS0FgqsZ4gnhowASE3uyr152gSXDBs
	 hoFeG+mLk3FSrSDZXpQfQZGEWix+YivJAifVPqIi7odfbkmrImICjxnTCEHkud5jtgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iYswqEQx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U1q+5iXH;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47B3606A333
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:14:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C47B3606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iYswqEQx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U1q+5iXH
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC9ZEZZ4092560
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:14:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=qBOR+gFFhPjIkJZAh9FbBz32f5Ed7y+W4Hl
	GKYADqeo=; b=iYswqEQxaB+KMHSlWhPE/l3KfebpG8whkxNSNhazGOTo77fS8eB
	YULd/gde+N4XjtoypfaMT0eNanhawtTbsL8aHcyhOSOkhaauV/XchGWz+539VjdD
	1gXuPYi8i0vFo48WKGruQuMnst3Lawrw484IsIKAbD0zYRCqp7dSUADl6pd1hYrl
	B9ymJNnXGXYwSot27pvHVywU0HQTk5TiNjSD22J51u/JdkkvbG67RqWjAEh9e7X4
	z0UrVcjuQzKMehqqZK9vPT0DmGJ/IdtvmXK9zZ4gTf3Espxp2rIzlGIn/h5x+lO1
	jDi+49zm8rQAOc6qOwCqywD9QBfGA3nlarw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw0m8jbfs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:14:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9308eafb465so895197585a.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794478491; x=1795083291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qBOR+gFFhPjIkJZAh9FbBz32f5Ed7y+W4HlGKYADqeo=;
        b=U1q+5iXHR3+kWKbhe5vnQW8IGK8Yud7S3BmcPxLadCvlPV7HGDQI2xuuXbgkjAS9As
         oQw1Ra01Uw3JgX6OJprurP6WiFjKuqRnMYuuNX8dUmJsuQqi9RDnlnxChmhWXdWg+6zZ
         szxQ6HzAW80q85++O7IYXCRdiAcSVr2+mtir4lEG3jtcTGaj0LZ1ODaedgnz2C6uI3Sm
         YqjfyauacmXZqb3XPeyZwBl6migeGExixDPBHDX3UQAp8Om5a4bebxBYtPcPIbqx6nxY
         aKh/cY6PvlwUgRsxmimvkSG933uJGs14M/yPzGcv387A2PhIPelwuFDy2VkbkoIU5dKh
         uPDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794478491; x=1795083291;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qBOR+gFFhPjIkJZAh9FbBz32f5Ed7y+W4HlGKYADqeo=;
        b=GsqYkLITLoZQoVs+r5C9sfp5iYwy+k3C1iwEwWtEE6uCmIwnh5ufY8egTK+tnvHeAw
         FmFE997nc1DNKbpyJONR4QyUD2tZ1wu5rQCeQdIpS+lGSVfgwXKIP0kaowd2Mk+cVkF4
         CK8cJByUrCRXTw+huAA2SKdzBFWguZ52u5pjSNKGzC14vpNfAZBJMlg3ppxwrOl3DEuD
         E+621cHZ1APR/4tqka0gVv8K8yHh3Vn2vPKI3zZnb7H3AjtTL/iEPc3W+OlivpgDbFll
         qjvRg/F2OfnhbHz0q6E5zi5eMPhu3ZYWJfqpaz6nR35G3S38U/AQYn2yc2J27XN/GTcx
         pOjQ==
X-Forwarded-Encrypted: i=1; AL+hErE4P1FDooBo1QzWg+UWJRhGYDnsJmyJpYK0N6VPOrCYm1GzITxf5EjwXPhPN7os8VNqBhIzh00fED6iUt0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gzNbhlzGWBhdVchSGrzrUIkSPNg584waHTP2xokdZOSUf9svk
	fl/Zgbq4cH1SXux5x/uoF4apbOIXWlGywX8tA4vB7uad+Enpa+kfHZWfsG7FsVN9cbnvjamg2bO
	tmkZuqSMZjJEBSRT27aN+Xt1tG44xEEMn1VfI/S/vd33BcGh5GP82Y1oEDt2MPZyOV5Y=
X-Gm-Gg: AYBFou1wrwnkyQcksNoKzAqpOsiFMyDXX6AWYrBl0EElC9EBtODj+qH6CiF/rYIUTUM
	D7H51TKDcTwdUrg0lqUVDZWhH9Yq6pEtE+M7YY9Cb0xfSl/IwYm9WmB28Du6CJH+63ML42oIKdP
	C/cGFDdojxxLr9Y+wYEvwP+ZxaF2YDrRuZW5VWlrGxJvA2FMQjid4dtuGiUfgfq28sejyfxHmqF
	cjWQYEM2XdN6vW1J3p91Yqy+OW+Kma7rRXpNZV4UWXsROGhORv8qiReLy3s3jAqYpSWYVnnM5V/
	gvH7xD3FwBBbElblq8QR91yAnti0h6vm2IEOAnadkorUYxkAd1e0e5/XNzT3VJ/jhM8vnrYcifq
	zNZ9BxhixMZi6VcC+1FycTjUWfmkR9jy5whTJ2EC0AcAZiG+AR/h6exbdrhA7TA==
X-Received: by 2002:a05:620a:199e:b0:943:f31a:c0a8 with SMTP id af79cd13be357-947aff97ab5mr909117985a.17.1794478491015;
        Thu, 12 Nov 2026 02:14:51 -0800 (PST)
X-Received: by 2002:a05:620a:199e:b0:943:f31a:c0a8 with SMTP id af79cd13be357-947aff97ab5mr909115985a.17.1794478490623;
        Thu, 12 Nov 2026 02:14:50 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498366c30b1sm15933943f8f.46.2026.11.12.02.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 02:14:49 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Adrian Hunter <adrian.hunter@intel.com>,
        Ritesh Harjani <ritesh.list@gmail.com>, Ulf Hansson <ulfh@kernel.org>,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] MAINTAINERS: mmc: Drop Asutosh Das
Date: Thu, 12 Nov 2026 11:14:44 +0100
Message-ID: <20261112101443.62417-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=826; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=zQ4QLbByNXixw4AisNKAoHU6qGobht5gpmvNdOqT+lA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq9ZGTxUwjWfyERB+m7WJU5+unV7Qrluo01Fzpa
 jvcrqO/fWGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavWRkwAKCRDBN2bmhouD
 10s2D/9Mobm3qaOtlZWIt04ssgwrzpmncF0Xf/GHIj9g7RxLWMZgFkf8GqSksBsCaaOQVCEDlqe
 bz0hUVLkZri2clqBwbbomD1rWfdso64UAhQntlK/PfPxXj69UgZCSQauF+XzbV1Q1s54hEM0Oeo
 BvxZ3/EpS0O6lWejiuCSXa7O2ACpPPKsudvNxzpwl//p73opgmOIE2lF44+9RLy3HRqGCXJJB4c
 lxGPpBV67UkZvdEdHQRZIQMnfAydBeW9BPL7jKFfdUMnkV34uaHmmfDnzsjiy5GoNE+wwQVyByz
 v1w4wtNOuIrUE7wHcIYBGCd0EB4Eu3fLKq2UYn0D8/3tflvVKv10a5onJ24gJs7RXbsef9wWE22
 aJFSFnt7HUQCqSn0VH2WraQKUJWgMGvazOEHSQcPA8oYUVw5pgrPkBemcGC6GuJaPM84nYxXvXX
 glNLKz3CufbGL0zqoy+/9NgUfYV7tLK+ULE/NRYzHpT04wBm86DbAonpbGShJjjcaA0aoRensTL
 0EwXKg+DDUGX5oVddr/++nh9vr5TnSNR1hy4B9fISoLWRmMz7FHxbFK6Kp9Fbs9DcwsWe/En5iE
 6cwjpkmPxiuvNLuphXex3IRUoR5X9rXAMvyihCEd+5DaQcm/bv3o0pBps55q/y3Kaia0PlyvTcx Myp32S5oDPlAlbQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0MCBTYWx0ZWRfX/+0NNniDY1JW
 I+rW12dYCFfPzG5w37TSnSfcwzvZNnIBq7HIdhuVlhbg+camgEijx3gt40LyzCLxYEnF9MdhQ2o
 Sik7feoui4myz2jVMTadfPCQBo8KA0U=
X-Proofpoint-GUID: 95E0UevSz2JswsvtPrV_lU9bW1cUldKD
X-Proofpoint-ORIG-GUID: 95E0UevSz2JswsvtPrV_lU9bW1cUldKD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0MCBTYWx0ZWRfX0Qz5FBiyc/2t
 8Cqm09rlqv6fJjcL+zqXfEw9mti9NPP7u2zaXqGipklTD18D7huX0KszncUjXlcoFm+ILvsNt60
 VPL+sHcKB/ftFEX1PHnMkyeolXqjq34baF2EfcMIpIt6uauBI4Jgjfw3ldSFCHlFzPCJKt4cVfu
 SK4790EljACHM3hLp4kKcGfbVx9b2wxXcIfqqbEuiboMJ2V4gnbsKM+qGUxNwQLFus5dFLxD1ss
 a+qUDsGA5t0Ja1V0axVuBiPp+/DlMdtbjRvy1oEM4Vtotun3aoX9rT5g5kuGrNRlXDgjtwuQazP
 8XPEccLWmUaGRsUpy3/GcFQET7QYgu4pbSGj2ORMYOFGVDP4weoZmOJdXdF5Te5is7p4SCUAi9d
 UgybW4q34KZ6vt1X3Z8v5gRjXek0/cZWmJn89WxuUB+8aJuGQPaIbbIgLtsb+Cjef4OSGkI9WxI
 oe9gDT87BLn08ueGUPw==
X-Authority-Analysis: v=2.4 cv=Q9dHcI2a c=1 sm=1 tr=0 ts=6af5919c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=ss8VjldhompejPgElc4A:9 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120040

Emails to Asutosh Das bounce permanently with 550 code.  quicinc.com
domain was long time ago changed to oss.qualcomm.com and every Qualcomm
maintainer was asked to do the update in maintainers file, thus if that
update did not happen, then maintainer has moved on.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index aa647f5d37dd..b0ba5fd61b33 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9868,7 +9868,6 @@ F:	drivers/media/usb/em28xx/
 
 EMMC CMDQ HOST CONTROLLER INTERFACE (CQHCI) DRIVER
 M:	Adrian Hunter <adrian.hunter@intel.com>
-M:	Asutosh Das <quic_asutoshd@quicinc.com>
 R:	Ritesh Harjani <ritesh.list@gmail.com>
 L:	linux-mmc@vger.kernel.org
 S:	Supported
-- 
2.53.0


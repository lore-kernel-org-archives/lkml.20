Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8563B5310
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789450870; cv=none; b=Q1RRRVIt+61yHXDf5JWru6lAFGxWl3DwZz4PZRdUNHAcKnRIulyZVFP0Qw/yMUGfM9FeW7oii75bRe5CGzn0z55GtubkeCHLfB6NNVmDFfH4CO01X6QuNoeG9LJ1fjRrzkvZEuKwM3zmSVmxA8uEBY9+oo4pwlQmBA4AA82LRiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789450870; c=relaxed/simple;
	bh=JpO4JBE1VNxT+lBQjWYB0XPRrR/gMl2Dly0MPBZmz+c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HtkH8ons/URmvoaAp/4FEMTcAhLl19OqTDB99twg87FkC1K8ELaKjrXkpRMjElQEhBuXK/IB81ctuNIrx+3Q2GUon5nN+kGR1nzy9F8Q1hl3SPniLJS/k+HDI1q/wAHgswsgXW343IMD1WmjloBuBSPpL4WStcsxpHXYKRf9tP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZeQoQz7X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D5U7X3TA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZeQoQz7X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D5U7X3TA"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F2nR802623200
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:41:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2KABN47JNikjdc7PIx0sNg
	UCf68WcstqIF1Q/UcAcbY=; b=ZeQoQz7XHja5/7/tPpDKVRJ/NfU2VzPSzjq4N8
	dZckksdX95zbuEFvsJkiKCT8G2hhACxKZ0ShZG8N8OEYfM7tay8u4szgjfhpNq6s
	svjEuSthPTbZ/WqNkSQ4d2PZPL9rMRlie9NCfyaOrarPUB8R5keja79JTjx0/IjD
	SHA1mv9ViXzW9LOuVwm+PWhaYsl91+rIDtGXMrWUvWS2P2mdHdvSj1vzsVWYI4jO
	54ZX1LHapDDJV+VK4Cbn3W0ZWxXHeFQhCWpS4DHW6ZTVBHWzwqUuj7hrHgT7niQG
	ClPMHMQScUAeeOBNUxEwg+vUocI+1cg7I+oizY8WqK376mgw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpmx9tk4r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:41:08 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e8d1600b3so1064744a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 22:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789450867; x=1790055667; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2KABN47JNikjdc7PIx0sNgUCf68WcstqIF1Q/UcAcbY=;
        b=D5U7X3TAqubyZzfy/r2TTcwr1XSihXR3GjTvborA+RXhFzLefEUEvR3BKL6CpMBA0a
         BKXcG603B3VNrhLI+7LU3cW3QeJYWr6dP6iO64IDs/Q8LBOuh1OaPwDwJEo7xJiANcX/
         BgMzi0gv//UT3PQde6baPfYTufYUkBaHgrCAVKYa90l+QRvh9DOEFEhaa5w4pXfARub0
         sV68bWm/O5X627lRY40pspPKkoKzITJumaZ5goGwyxciOG5RBGhzbOau1S6LQhx9w+GF
         WNtB5vmaEHUWY6S2a6V6g7CqGLgp5Z+wnmpMUKThUuyOLZGJyAXO+5EGJBQRwVauBw3a
         OjHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789450867; x=1790055667;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2KABN47JNikjdc7PIx0sNgUCf68WcstqIF1Q/UcAcbY=;
        b=hxve6g1gwi3Y4BF7Q4s7NiooGHn6/Ht4ZTneDU6rlJ494APHbK41cG9Vg59gQAJp1q
         r6PU4iBoKIqMfsaMfBthASH+KSb0X/nahdnXNTv6CHc5Cz2pxN66XZq3qUXeLZIZWAtO
         uLw4b5z9vlmcLkKWFfmgghg8VLoaHT8nW/roscK0TY8DlO2Cear/IjswRfwZsyLngJ+S
         77B5gni4cnwOfNHG26lzW33HQp+WRa0zkw2uUFMdzclH0JzykLfbUzi3dvxtIFX+CZv2
         M345wN9XCfYLXmysRa85bplU2OFvh4cMsZFHFdX3LIYcaFNexVYIcm06nGMZeGa0mWMr
         Q7lA==
X-Forwarded-Encrypted: i=1; AKwUvBwhI2V4a3VCSvRTLShHjR2vp+eYFgJUh/nu1QKSuzd6RyCesNMWs/ASfKw9kFShqSHLhSniGV7fqUCI3mI=@vger.kernel.org
X-Gm-Message-State: AFuF++m5RSfa91TL11RpiGQc/2YxyLoxGYf52nF7KZ90uF94bitckTAA
	1UmnLi1ekBlocJkUerCEqQs2NKWMKOuPhSymzgUV3NUK1CkzbSgEtmy5rszuzvPrqOcFWqs9XOG
	Fuh1pt9INrBl83qwbWngxdN2MX1TFr7CDqTahMOVJq08/0Hkl0ojoNAmiTI7gZ+MNvVw=
X-Gm-Gg: AYBFou1Bb0qS3trYW0O3xU8ZNLfKezwFgryrHtHyUrSPIsHUBKT6tJaWx7LPOF30NQm
	C6h8wahtMS5Tymam6KVk++AGDNSAnWpYzIm7UCJrvTo0U2Fz0IT8lKOQBbPQ0/uoloLfHxAd5gd
	xor1qQInElCWp4DTo4yQH/wmnmKGrfIxWTyHtHRIxq9Zll6FPEcLekTR42JNbyM6gS+Skd2DXjU
	GvfKnLSg4wjI4R2SKcVlX3U2wjuKhlmaVOD128md9EEuNKcrNVBEZW6a+nA78r15u9vCw9gT+7D
	uYkfd3TQxlCSaXqiq73J3HIBKgYTAJFsoOe5AvjdlCY8XedZdkYWceTfETSSJgVRExMf2kwZgS5
	+k33AFXizOZos0I6OidGtTxAUFDJJONfyDmOxxHDa9bDhA70=
X-Received: by 2002:a17:90b:538c:b0:39e:b7:cbee with SMTP id 98e67ed59e1d1-39e00b7d2d5mr2590264a91.6.1789450867540;
        Mon, 14 Sep 2026 22:41:07 -0700 (PDT)
X-Received: by 2002:a17:90b:538c:b0:39e:b7:cbee with SMTP id 98e67ed59e1d1-39e00b7d2d5mr2590247a91.6.1789450867005;
        Mon, 14 Sep 2026 22:41:07 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14390c0be29sm1589960c88.9.2026.09.14.22.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 22:41:06 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Bluetooth: btnxpuart: Simplify ACL handling and fix
 skb leak
Date: Mon, 14 Sep 2026 22:40:50 -0700
Message-Id: <20260914-misc_fix-v2-0-6178d838c946@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAGLaqGoC/22NQQ6CMBBFr0JmbUlbbQOuvIchBupUxgjVDhAN4
 e4W3Lr5yZu8+X8GxkjIcMxmiDgRU+gT6F0Grq37Gwq6JgYttZWl2ouO2F08vYX11htVeLSNgaQ
 /I6bzVnWufsxjc0c3rP+r0RIPIX62rUmt3p/aSQkpjCmcwoPURVOeAnP+GuuHC12Xp4BqWZYvy
 JGT0LkAAAA=
X-Change-ID: 20260913-misc_fix-6f6f518fe6b5
To: Amitkumar Karwar <amitkumar.karwar@nxp.com>,
        Neeraj Kale <neeraj.sanjaykale@nxp.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        Zijun Hu <zijun.hu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=G+KJgNk5 c=1 sm=1 tr=0 ts=6aa8da74 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=jqfNI8RexKxqlRSoiHwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDA3OSBTYWx0ZWRfX9Zakvaf3ajJy
 mOuBw/6UaL6C/n+ZynrZvu0KS0rSMgO5iU86ahda1QHROGheU1MNzkbyafCJtStCW7v7O2coJJL
 K9acj3mrbSEsOFKYTAtNUKrwIFPfvN+NyFQnpHXBtgo1C4m4R9TcfCubncl+KNm81mgO1QJwXUH
 1f704WFoPoOzHwEKFRJ6T27YCCX7OZFbj+DpAjXvOL5lCttTombsLBsM/lSOgFhJw+uFpfW1Tia
 JXu6I/nojovJ0dwUolr2lqZM/dWnAftHowIccvHZNA0BMRS8xRly7QTtQWXe4OGGFXzwmO7W1uO
 kdDnhKK46WoJcX9VbT9e9FCSxY5qAU9q70/JFYFAUVYJi1M/tE9Cni1uXtpxgU1mgbVgd1zu4oG
 AefausKVK3WDYZK0DNUiZRnN/aP2/dBVG8e0WhCDPqPKhY4BdibgOTjomM/c+unMVcjhuaXdkyW
 zWtQn05J8dt5XCWvNRg==
X-Proofpoint-GUID: 3SwnCwG7HBXgklLHqpQVt1kZcCW5HUmX
X-Proofpoint-ORIG-GUID: 3SwnCwG7HBXgklLHqpQVt1kZcCW5HUmX
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDA3OSBTYWx0ZWRfX6uV/yfxLJXC8
 AcShLr8QlnWgGWd0HWDQWXKrNxMq/hvVuZz62TrCyljwZEG4RfwvPC+JikuvQ39GRqHdd2aocvK
 q84p5aIo2Qa7g3pWzybZpWXiHjaUrkk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_01,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150079

This series simplifies ACL handle extraction in btnxpuart and fixes
an skb leak when devcoredump support is disabled, — all simple.

---
Changes in v2:
- Add a minor ACL handle-extraction simplification in btnxpuart.
- Fix the skb leak in btnxpuart when devcoredump support is disabled.
- Link to v1: https://patch.msgid.link/20260913-misc_fix-v1-0-558c1e4028b9@oss.qualcomm.com

---
Zijun Hu (2):
      Bluetooth: btnxpuart: Simplify nxp_recv_acl_pkt() by hci_acl_handle()
      Bluetooth: btnxpuart: Fix skb leak in nxp_process_fw_dump()

 drivers/bluetooth/btnxpuart.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
---
base-commit: 0186e4e1e5c26a21058a263cccd878fbf894677e
change-id: 20260913-misc_fix-6f6f518fe6b5

Best regards,
--  
Zijun Hu <zijun.hu@oss.qualcomm.com>


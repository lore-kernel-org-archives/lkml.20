Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792665810;
	b=IbJktU4AOUYNenZS+8T0Kmt7r+Kn4AZ/UUNkhMHQORL8g0vpFw2Egv2W8VTFGe221rZj
	 5Yv+PR2gVyA3Gs5kx5Fb14+dANN+FZMkw1ROVV5iEaNbrbwKgMGo68tCxe76GstSEQuIl
	 i0XPnYQbp+d0UuZDtkvFBt8sA7r35ihmKjICVzY4m9Zozk0sbKjt0mcWbYTHV4NDz4NhH
	 E83K5kLN5rgzhZPb62Bvl1DapOonlsNgaSzrN99vXI6w3+o7KECecBjd4XfGksYIPgAOp
	 epv64t/A8TD/UCMcRa6uBaIA4Stq74UnwQaD9bk7LEFHpkZvewIQH5OjPXkAlNr7yZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792665810;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2gbrInL419R6hHZSv2+xMg3r+A2bgFZW0N0Re/fN6sw=;
	b=hcMzWbonEMa7jSqmWjtBcA9DCuXG/ZJXmZWpCtxMmGc5KBjFnxqaq/j1zaTHWd6hqQch
	 Ny7j9PiKZrM5sMi4sTsNKC6htvDPSoZHFlolOXxrHa56HKWfIPA7aqzTv+xpkJPV6YI/h
	 svCGhDrGSVm0oUQrwDjGlPSBlKheAEZqOBg9Yy12VDRU1h1lg3jmpR0X3RoUA1bMz/XV3
	 JUiJ95PrMZLwfTrAWJ1G5J/xeYlFaOOj+IdGeiLF3FAqx2ABqq5t3hv96cJg3R+yQ2QuB
	 J5lAdtJCW2fLCxyp5zUugDmCb1ptiK1tDUGl+tl7LLo8lm89U54QuaTqu1sLTMQwjxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=daewYeES;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DUp7Wvwf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3FA606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:43:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C3FA606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=daewYeES;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DUp7Wvwf
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M9xphh346110
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:43:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=2gbrInL419R6hHZSv2+xMg3r+A2bgFZW0N0
	Re/fN6sw=; b=daewYeESSfna48Z7aDymFvsZzyPleeuq/V+ZWtxso4EREZCT/zT
	1XstK8fzR9YaH3aaW0cFy+gXmDj/vnw+Ysojty49uGV+2VIX2NX7I7bjKde3+qvt
	p0Cr/0v80+bKA9gK1qw/F0TPKxMDLgvF5i8x4ZLl34wJW20hw0pUOOiyFou6zakE
	gBGoRVMOkGvoLREnlYvGiWXFnF1hNcVS/rq188YZqln93tRD/yfUVLUdeFC9vlF2
	3KMRA69gol89xu8CkdnYQzQgoWQqdZ8QPG1YUkm9kgk/zYOG9bLJmJMNn+lcj52M
	MrW5qlR6uRSHxcn2Pxf2TD3xKjyD+nNO3Kw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93da5ud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:43:29 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd0b795aa8cso478615a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792665808; x=1793270608; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2gbrInL419R6hHZSv2+xMg3r+A2bgFZW0N0Re/fN6sw=;
        b=DUp7WvwfU/ao3Tjo0cY54Rmd8tSF0/mWX8XzRKiMIJyJXS4Hl0KJxP2e6S0BR3OIEG
         wIbxuakFmYuGvkOFWSc+fLfRAJVpuX0eUxEffMyjl5lmd1OAjOrP/keB61qk6aF/Oho8
         XYhUe9tnjhniOwy8QHr/bykffRHAcgfBmH3yP/iVWk1P2U+XebHrBqvIBIsjGNILF6NR
         P31rFZui0c3lWJ4rXr92Y0I4VlAqjHiub/ePBc52/GpQT1JkfaYUYeH4lchqT/7jmeXI
         rjmfsxBZGsTlORybWPMOcMMLiB3NjH7rGRbv8ldMj+Ka2cpqB2wxGSpCXu7BCDVty2vf
         1Srg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792665808; x=1793270608;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2gbrInL419R6hHZSv2+xMg3r+A2bgFZW0N0Re/fN6sw=;
        b=WmLyb0YuE6P5mw60urnKu8CtY8wyWXoF10g3hN5iS/EEMw428AQ/KrtbQHiURn9SsR
         QvGFhQTqHzNp3SsC0JZHO2W8arGQZzcbEG2G64z0ONB+/CmrelaZDZ4j0EzX2H0twbJv
         dv3sxc+6LXj2jObOkyK0P8/TzfL8HHyHoh5vgEKiI5xEC7L+CVoTUmK5h76IwY8nZI76
         nqoAGwZvprbF0VQ2ysasYziSE4kVyvF4OGeXeOuxuSCVrFi4qjF4Ns8akwGaxHnZEjtf
         kdS8Bb4bgzFHYZlSP3cLd2ki/KnkXya8nhdwViBEnI3HCp5QUITWCkKdMFhoEOwX2zV3
         NEyw==
X-Forwarded-Encrypted: i=1; AKwUvBw/VQBCKUd4lyugLxtoGfLD9CoM6rx6vvbkgtZEI8Z/P2Gswq2eT29O3w5TbfuXjCIpkuX/QS0dyY+HfHA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxuQv4VnpDktHGBax4a7LYPHDgookXIQd4yZ2WDrp4tpRVodYn
	o3r5WOHQrasd/JV7I757EjkLW2Z0seXvVaU6jOClGskD6n8KxmQVcUC+ex7P0qZH8uMVg+0OV3t
	SNuA6dof7KhK7AkJ3ADITHGozp02LpjJJcoi+LRqoIVkriE3dNrYsuy8HLOE3Bzopkhw=
X-Gm-Gg: AYBFou0eg0SH8a4RKcekzm1vRT1AHVekn5Z2QMBdIHD4bsMxnBPvIPdpS4OqcTvOEHA
	/mGRyOS4lG+n0YQC+8Y0MoXRUumxx/FLrEj9cKU1OrZxBgnrEpRtJ2FZsB5q/M53rU2PJ9LuwnP
	KOruKp3zxBT+yQxUT21UiLJ0SPX1CzjrRA/Njbso5ylfhpOvC4VDj6YavWUbLxCm7cAn+rFxyKx
	KPnNGLc2y8Q24LEt4lepbSpt84BWn8Ca7kgx+JiHlBTYJH/KjtdZofbpPHeWXsLRTTEgDh48Dkn
	qxT6YnwXABzTSMILklFxiwjmb59DgmqKZHi3dTZgSKUNelCGF22uiMDJskIfc9+WHX+JZqawthK
	OKjI172Zzx/i22tUKMsm/+3wJTlIY
X-Received: by 2002:a17:902:ce82:b0:2e5:debe:cb50 with SMTP id d9443c01a7336-2ea6263513dmr13737705ad.4.1792665808423;
        Thu, 22 Oct 2026 03:43:28 -0700 (PDT)
X-Received: by 2002:a17:902:ce82:b0:2e5:debe:cb50 with SMTP id d9443c01a7336-2ea6263513dmr13737625ad.4.1792665807987;
        Thu, 22 Oct 2026 03:43:27 -0700 (PDT)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b43b53dsm22327565ad.39.2026.10.22.03.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 03:43:27 -0700 (PDT)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>
Subject: [PATCH v1 0/2] Add the PM suspend/resume callbacks for qcom-combo phys
Date: Thu, 22 Oct 2026 16:13:19 +0530
Message-Id: <20261022104321.306679-1-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MiBTYWx0ZWRfXzFiNs/VSstG5
 G+HxB0Tb8SJ+66LVv5D0ZQ4nrKdWhLFKpFbzi2MgdaZMq29XgCP8R8X3qfdjVqdxQ1lGlF1Xywa
 9CDCLjsX9quR45q2z2okyS2tL9LunXo=
X-Proofpoint-ORIG-GUID: ZKCKvjMJt9kTPSGUu-ZPeMLs0DS_HfyU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MiBTYWx0ZWRfX074FnUIRezoF
 wLI8WKYBurMG7fS4v8JFhgtgYsVyt0nzpmuKhmO7wGCjZwVag5pn0JlyvzVHas/0DdL7bu0sAaz
 rouWfAEWgdFgxWLiO/YDGuk00P8yN2hsnBKVYOcurZ5ied+7aqS+pNDkfZo+JTMeEEl+T8MX0C8
 OPt4qypVHr4D6zBbnm1rwdBnNWh33elm67VNFInPSamUrQQfIc+5Sc9nMPtpPSLyyT5R6iQoh07
 0rIU8l9MmKYieHxKUQ9Wzp5mo5OniLmRVx7aaWZB2k3sNZh8QJwcAJSwIZPnYLRsatLe6xVps5R
 TjzUmX4X/L7Zm3ET4RrxhpgcvaqoAxzAEEQ60Qvs+3IjB4JFnLWASOzkmH3cvthjyhhcZ0S5Exf
 kV3nBUAH+hk8uyIW8qUO3gqaxYWKeN3uMiHsO1FmTJ/OyBYf4mfpr7LESi5p3b8IFQrzz6yibAq
 yWESzxb6ADNb8k9y92Q==
X-Proofpoint-GUID: ZKCKvjMJt9kTPSGUu-ZPeMLs0DS_HfyU
X-Authority-Analysis: v=2.4 cv=TIPQ2Fla c=1 sm=1 tr=0 ts=6ad9e8d1 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=cP5vnYSvVPmSLNQO43UA:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220042

Currently the phy clocks are left ON during system suspend, this leading to
power leakages. Prevent this by disabling the phy clocks during PM suspend.

Prashanth K (2):
  phy: qcom: qmp-combo: Add PM suspend/resume callbacks
  phy: qcom: qmp-usb: Add PM suspend/resume callbacks

 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 17 +++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c   | 17 +++++++++++++++++
 2 files changed, 34 insertions(+)

-- 
2.34.1


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FEC4BD114
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 14:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788446860; cv=none; b=L4TUjf97QbgaNZcllGHRhyc53eT3EeJQbaE0UQNp48L6UUDR2VxpSMeIz9p+d2y57sYI/mh1D4nWTpIlZN7t2RVYKSAT2sRNyHrUnCBtHmQfe6am015w1UpgoWWQA1i1dEHre+a5SnMijB6QZNhdoXvyZrumgP9yJkeRUm4xA9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788446860; c=relaxed/simple;
	bh=sqW75DqQe6cS50dUtAMa+hqUW0hi/MzNQckd+wLmVXw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mN2UqQfbbGocQxL/E7CezjP7SSOGz63AAHChCr9pJi8EyRu+8UX0SasANum32oDby/rljaa3I2nzWq3vgpS8Nhw5jT+dHOfpJNUXSxDsVCiSBsDDSSjzuOrgvFjae5plOVXjV3vf+4K3f7yZa9SlMwZr4BghnpdByNDaiVt6X+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RIqMbTN+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HvvbCpBr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RIqMbTN+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HvvbCpBr"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DAa35539855
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 14:47:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3N17qA18FgGW3zEmXJwdfd
	pABRJJiCXPz2tCM03URs8=; b=RIqMbTN+OYj2qG7t6Sq1Wdf4kFxOak7WoGPN4O
	V0pcQXyJZYJoHXsWq0/Z0Yf8sf346cyNyTl3sK3DaAseepOowCY7NCKpaQM8MsNe
	fYonduFOPFh2Zo3bV2Mop/U35GpLEBSJy06X1x4txrX7wGaAQYRwskcyv+S0JFze
	sWw4JyFW4vdiEYthWqJFchM44imCreu9C9KdXdOxAT0HU7k3Wdw1OcIG6dZfK2H6
	eO2ax+wKP5mp/pukUNfSzipkfo/xoItGRN6A8WhmfDYTwlVsMS180AAHwx/eXEIY
	q9uKR6cJxT3if4R9UzGkib3JQL/wHCayTsSlhWpcYQDZI91g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf6tx13f3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 14:47:37 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3989c51d5daso560298a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 07:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788446857; x=1789051657; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3N17qA18FgGW3zEmXJwdfdpABRJJiCXPz2tCM03URs8=;
        b=HvvbCpBrYjECOXHuWgQtFw+z9HQCDwg0+AoDaaFAO3UsCsXFStYZ18xJZosHUcMS7w
         pHlt4if/pefw743gtQcrOGjWGBg2QynQbjsdtiVt+l3dtGYQg6h/Z645SSrObs/blvvv
         rVThKvtSjpVNcOvFfm0M6hA/bIxaeR/7kRmcvUlvNghAs72rhH2wlBDi7h4q2PYulimC
         U5P8/nOUMaLbLT4q9B4vVegrsxz8ZMIdhVjBHvuKQTQ6Qe4gEGj+7VUni75Gtett+jZd
         q1B9vSUS+TTKEMaD8vzyfwiT/EmkIDPQzavSzDAFFlbBRUUdCtxmtyebgi8cClxdOA5e
         eKJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788446857; x=1789051657;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3N17qA18FgGW3zEmXJwdfdpABRJJiCXPz2tCM03URs8=;
        b=GIIzBNBsZ9EmA3M6hRuMAST5oQJwM3U9Py3YbyJo4dQOqHOuBNVTnzadmoAbFXJd9n
         H+sy2PnBxNEhEYjmJvxNQ6cKq0Z/Ls5sbpuD52RccclKGQcAaRuJhuw4i4nt3MnDC2Z1
         ZZrAh4jPtmWDzdx+2f6gnB9EY4vbvK0lt88xDIqPMaRHP9/0ti+EfpPZYAVl0iahj4zf
         m/waFT5kV2hgphwmJlOHNumjOwIuc6TByG0Gikz0iTj+1Tv2qrGrLY6InHmyr8qRydtD
         yNlQYCRP6DCzgu4VLK4xJ55V3tMVFjfJtgDOXnVkDJpUr+GeaYBG5n3O78hoDPpavsGv
         2mpA==
X-Forwarded-Encrypted: i=1; AKwUvByGh19ySriYxYjFwBatZc6IwY+dJrTu4B7lD5Jn0FY5N+31DI+Mf3pvewLUVSgu2yxT2uc0wxzmHkIyO/w=@vger.kernel.org
X-Gm-Message-State: AFuF++mRRq0UdX2K045hNeyfPL6+LctdK/ZQLhoVQ2e/SvGFIshZxg7f
	Zt59OQKyYJY8dpB1uErNkl3ToUK6pVe/tUIAz+yr1bfxxJNIeZ2z9984v1buUbT3KTe010xqOgP
	jqsWbB2ry+ThBI2LODwU5QRBZlcsGrXSYLmKFynh2YV+J3SkxLpPGCq0CfyN9e/4hSsh1T1ata9
	4=
X-Gm-Gg: AYBFou0uF2XjzdUbdZDnWRJgqdolZNP52k2vAynW79aDbo0vT7xXPiZqD2pFb1xYLlz
	M7AOWRoi4kJ0i7PMO7bgxGbRfUfi1cMrOqDQsWOeRgyHlru6LVlxj58x7qpc9VPNrqXkrxvw1jD
	hiX2QetJfD8DgECImPIG8HBBwXSQ5+lrWwSuDYH6dkwbDDnd+d9kMnXbvHydVaFlNVb8jkwoyDD
	QSz5eaaUOwUJvtX6kwgD3TFRhmu9AlgFC+VySrS13KbXrT8bEndIWpNdjV9R3UKQi0c7C0Big45
	FGEX1Boi9V2+zzYLrVi1WKG607FjUqZHM9R+I18/rzpAtMXCp2cb79ULVvn38BBzkgI1QLlIeef
	t71Fm3VwKx0rpY/ZDnUO17a0aA1JMZHphaKcHMudbFGdjG7g=
X-Received: by 2002:a17:90b:3841:b0:398:bac0:238e with SMTP id 98e67ed59e1d1-39aee24957amr12445089a91.6.1788446856490;
        Thu, 03 Sep 2026 07:47:36 -0700 (PDT)
X-Received: by 2002:a17:90b:3841:b0:398:bac0:238e with SMTP id 98e67ed59e1d1-39aee24957amr12444975a91.6.1788446855426;
        Thu, 03 Sep 2026 07:47:35 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243bfbe3sm25794c88.11.2026.09.03.07.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 07:47:34 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Subject: [PATCH BlueZ v3 0/4] BlueZ: Support vendor packets
Date: Thu, 03 Sep 2026 07:47:12 -0700
Message-Id: <20260903-vendor_hci-v3-0-015d62a57c91@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHCImWoC/23N3wqCMBQG8FeRXTfZH3RbV9FjFBFzm7lQV5uOQ
 nz3pl1E4M2B7/Cd35lAMN6aAPbZBLyJNljXp0B3GVCN7G8GWp0yIIiUiGEBo+m189dGWYg5r1V
 BhWaSg3Tw8Ka2rxU7g2M7mhO4fNdhrO5GDQu0FBsbBuff69OI1/qWHzFEUNdEqkIWCGN2cCHkz
 1G2ynVdnsbqR/ITOEV/AkmCEIiyEomCyWpDmOf5A6tXH0UGAQAA
X-Change-ID: 20260719-vendor_hci-188fc539d7a8
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: GkuK8JxzDhp7TNM21M9dyIexk1wh7Nm4
X-Authority-Analysis: v=2.4 cv=TqjWQjXh c=1 sm=1 tr=0 ts=6a998889 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=qgPclA31fA7-HnSu8dwA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: GkuK8JxzDhp7TNM21M9dyIexk1wh7Nm4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEyOCBTYWx0ZWRfX5X1hQXP1NbYE
 JukXUmZzycfzbbHRBfQ9QLfcyE/WQhxNfYqtXxAE+n7IBGJvA0UQDZ/TY25W1y7AenBxT1D1vf9
 ht/mHzwdLBc1PpmiISB0ZcSM10ToT5TPw6eD3ikeW4YbwI6DMLaDldqdKdAa6LDW8ZAkCK6aMLk
 weRjwDVt+FMtgxDBloDfySOfUawDQstJC15Zy1rEpKrqds3maWMMOmA1ZvGCidf/4gHXKZxE4HD
 L2EH8ssbb3l45OhOix7XoClwEPOVGX+tYbMkOoga7jGuRKpvXCdkFHTIIp/wu8RXoeo4mRRp8fF
 5TtysDyQhTMhBqIPWBMqP0VSnbRAB3B013Zh21HR5Uv/4u6N+un6bP2RAuWgJYXFwh5Tvl9R/0x
 7PoC/SM+PWcXjE09JEyXqyxYgFnva55C1hyFi/RQzK9pm/RfyW3cndgRt2m5xGz88ujKwC+68kj
 dVuhhu3+3i5x/tbqzhw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEyOCBTYWx0ZWRfX1iaMmC1r38Pw
 fM96fEDXaGHki5+ZeNN5f/UYfHZrhNfNObwHWYLqnn5t69J5F8+zE335VuGp/LHv/Z0shxrvQpV
 Gjb5d5Rb/2qJVwSrXNi76wOkkCe6GEE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030128

This series adds userspace support for vendor packets, which use
0xff as their packet type, complementing the kernel change here:

https://lore.kernel.org/all/20260830-btusb_qcc2072-v2-2-5c0e0c9dd98b@oss.qualcomm.com

All commits are straightforward.

---
Changes in v3:
- New patch: s/vendor_(evt|event)/\1_vendor/ for monitor
- Improve naming for consistency (no functional change)
- Improve the commit title and message
- Link to v2: https://patch.msgid.link/20260830-vendor_hci-v2-0-9903760957ab@oss.qualcomm.com

Changes in v2:
- Rename BT_RCV_VENDOR_PKT to BT_RECV_VENDOR_PKT
- Improve the commit title and message 
- Link to v1: https://patch.msgid.link/20260719-vendor_hci-v1-0-df2ac5a50117@oss.qualcomm.com

---
Zijun Hu (4):
      doc/hci-protocol: Fix missing & on mtu argument in BT_RCVMTU example
      monitor: s/vendor_(evt|event)/\1_vendor/
      doc/hci-protocol: Add BT_RECV_VENDOR_PKT socket option for HCI_CHANNEL_USER
      monitor: Support vendor packets

 doc/btsnoop-protocol.rst |  8 ++++++++
 doc/hci-protocol.rst     | 20 +++++++++++++++++++-
 monitor/analyze.c        | 23 +++++++++++++++++++++++
 monitor/broadcom.c       | 10 +++++-----
 monitor/broadcom.h       |  4 ++--
 monitor/intel.c          | 16 ++++++++--------
 monitor/intel.h          |  4 ++--
 monitor/msft.c           |  6 +++---
 monitor/msft.h           |  4 ++--
 monitor/packet.c         | 46 ++++++++++++++++++++++++++++++++++++----------
 monitor/packet.h         |  2 ++
 monitor/vendor.c         |  2 +-
 monitor/vendor.h         |  4 ++--
 src/shared/btsnoop.h     |  2 ++
 14 files changed, 115 insertions(+), 36 deletions(-)
---
base-commit: e8141342284be2a52e16565b96b513ebe1297d84
change-id: 20260719-vendor_hci-188fc539d7a8

Best regards,
--  
Zijun Hu <zijun.hu@oss.qualcomm.com>


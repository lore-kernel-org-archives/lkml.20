Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA098184540
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788152649; cv=none; b=MmG8JJwihlZqNvZmqlCyG+MD2tWpz1g99kPV1wZLUUqjkxF4EfMyqH2iPrNEsyCHdBdbHVK4Tkh6wPgzUGcAVweBwekIpP6J2d8fz8GM6avzzQhLKAnOXNkokZWOa32fkuE6c6X5FlOvT8SWrBpd9WWK+C2KAK5mUxituMpXEBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788152649; c=relaxed/simple;
	bh=dMqfHbqeByd+EohTzin5vWpPtDe9rTjAsekqHlLwCXA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LvVhylO8qVxLN+uF3o/GT75Yc4EZk9btBqqSsOhEAK0ijCCQCd9bn6l667yJ0eyoX2NVC/9dQ36Mwg+EbOj73gIm52totpNVkif8LcvgcZVNI8MQS6+9NtR3XFvaeHtTTAspxQwpYLdMmTqaPmMttffXcMpr8dRnWWKVRDD2i9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kdRL2jIv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BOR3ZID5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kdRL2jIv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BOR3ZID5"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V52NEr3260339
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:04:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=w2fb21A2KYHUakY5chruxN
	aS++ck/8P1K0Q3T1Lno/0=; b=kdRL2jIv95TF+piBdBl+M9/niR+vLFO4+jWZEi
	2xGhXtT5wAEnIAXesDgYC9Q2XQt+hgGr4ID3GLQUbui53FzN5bV81gwROhqzRWy8
	uhnrHvm55HeMEadOvapgqfCp1z3a0BOWhhZtAjIcTjK68YzyDXe/3OTbevEfTg5W
	yNU1caGE5e8/bNoPow52b24zospcWrdGcCfLV7dCUB4khm4CFM5sqmV9B/GvPOMl
	FcOgDviRp+DIe+d+yeXe5xhmNT/prmqAXNutrJEVPvNpdWdjtl57LX8UWFO/TyqD
	yYTjOlbFRkFuUHb93ak0vo0H3VtHhTmIFPduZOTvFPpvniYQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqdfmmhq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:04:07 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3966d158a76so1031823a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 22:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788152647; x=1788757447; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=w2fb21A2KYHUakY5chruxNaS++ck/8P1K0Q3T1Lno/0=;
        b=BOR3ZID5BZAxTm+PkbuVl/ni0Xf5KpYUkrHTisY/UKcyfopWF33U9weawtMm0ZpTsD
         l60TO9JpCuaB+bFkWTQkVBEOoXggTbWemjwtjcVti4lc4178H0kP0rBqrjUcnx4DqIGU
         CYy7Ilxdsag02aDnMnRa1l50jqtODFFOoaGx60EIx32KQf1nyn7jVk6i8w0qQ8YJYOlH
         w91M6J1NDBd+VJvEmbDVVDtHYxdJJWcCAURQzAojIZFjLIrWR7sfoqk7SHwVYZEiilgG
         PmlWY8IV5dq08blLXiE7wNBJrRWxzNOYuegHQplwi44Ar940VAThmOwSGUZDVsodxPnB
         CNfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788152647; x=1788757447;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=w2fb21A2KYHUakY5chruxNaS++ck/8P1K0Q3T1Lno/0=;
        b=KhJY0skOxNUPOUy/4E2YwBZymPR2cLfhEgCaH3HK0qfhE6BkGm45g8M065dA1W/0w2
         fAW01K547LklofM2qNA+LQxVGnVwsaKa3RdLwCtLULTrnJeoijGtn3CWv8tE6EFHNYHw
         psy074OUj75HpH6XtpNO8dy/2Ip9CmQRRLxy3a/vSk4Rl4+EoST/3cm6TuaJc0yvfq3y
         jCEmAU9lPxgu0Z72vyyHXaTuISLWKHQOjFyX917lSpbV3rJW+bb/MiV2MoADI+3lzs6W
         ePtJFa06rpLduCNhBTqOuDHtKkBzC9PUGKLoEZRGAGAZwLr3cC32VQoB+W/QArn8RTGB
         tiMQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZaKBFBoqrX9qF5kYi2RdKyPGnAt5QyRE1bAaQyE0ewb18sD8w6rA7D7GUccwY1/xrmqs+lyeserF0FKs=@vger.kernel.org
X-Gm-Message-State: AFuF++lWKXbTlMKwcpOWXbc2hZILtkZV+DP/un5kyZx4qedFKC7FvgUa
	RYgymEfum/k3A4/U5k2R8zGKOcKXpmTG5n/yebOUNfr3caWd314jTVdgCAeEIUU6cgNpfDW7Clq
	pC6q+OXGpY3jZqDYr0dXE7nGuhrSrgRqTcTzcwsxngkK/Ny7CMWWMlYF7XxOr9HLSaz8=
X-Gm-Gg: AYBFou1pON90W5CoaYithcL9kq+2kvKpnp9Kh+5CFo7qUPKHNMTziJcySYSoFGhJcBt
	eqzAlhJFEnB6/rw3b3CqHnmI7+XOZemXJByyp5GMWczWUedyD86ttCw/IA13KdSogA/UvkWRYbU
	IVilHqmPhm6q/fHJQLddIoWvOPb8niRtYxslRBkmRNtw4bw8Bx4Tx8vRccaLYGQWVW1jIJ2PGzk
	1sjtRSCSKKNUSjnOvWQOukkyWtqOud2V5pOhi+2jNlLdb29WFy8Uz/W7tqRiaZBz6q7Qbe+i/ez
	6/NqS0VWum8lD5B0MtzxPwy+OVsLKMwOzcqeeA/5nO6wpNuBUTxGpQQU7wl0xL3sxtCv1qHVfhK
	bywFQ9MTYlsOAYsmp8hPK/4Z+lG1+nzl1faupxZp69q0MZ4A=
X-Received: by 2002:a17:90b:5288:b0:381:bcfb:e710 with SMTP id 98e67ed59e1d1-398babbaa1bmr11245046a91.3.1788152646988;
        Sun, 30 Aug 2026 22:04:06 -0700 (PDT)
X-Received: by 2002:a17:90b:5288:b0:381:bcfb:e710 with SMTP id 98e67ed59e1d1-398babbaa1bmr11245003a91.3.1788152646514;
        Sun, 30 Aug 2026 22:04:06 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0df264csm43017912c88.14.2026.08.30.22.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 22:04:05 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Subject: [PATCH v2 0/4] Bluetooth: btusb: Support Qualcomm multi-subsystem
 QCC2072
Date: Sun, 30 Aug 2026 22:03:49 -0700
Message-Id: <20260830-btusb_qcc2072-v2-0-5c0e0c9dd98b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADULlWoC/0WM2w6CMBBEf4XssyXtQrj45H8YY9qySI1Q6QIxI
 fy7RRN9meRkZs4KTMERwzFZIdDi2PkhAh4SsJ0ebiRcExlQYiErzIWZZjbX0VqUJQptTK0qbXJ
 ECfHzDNS618d3vnyZZ3MnO+2SfdEG34upC6T/3lJlP29sFyWUyGqrjZVNU0h18szpOOtHbPs0B
 mzbG0u2vBS6AAAA
X-Change-ID: 20260824-btusb_qcc2072-abb918ab4220
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, Zijun Hu <zijun.hu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA0MSBTYWx0ZWRfXwY/yhHgH76/I
 lxyrC7qmnHKE17XGNjA8MVFwnAlOgqNd4TY5O8DhRwkdq/xjJUiLDcUIGL6ee4I3VkfisMZ4ALD
 QJ8hyeWACHgm5cKk6ASnjn62Zx87PFeioqQC0ylONCyGStto4EBora8XrSp+oKjcu3n8Macvk7M
 E+cUrmbXmWOa2gDBAJcH9LZU/htZiO7l8NNEHUu9aoWqLNB+nq2Y0eEvO8LooA2RHcd+7NLU+kb
 t08yJP5Z9cAfY51E3rkwutNhDxklZfRJZoD7ROR1V9N1p+GxU/mVNyqK4qLHH6jnIgczdd0QflP
 +pUdSYFtgm4Bqdu0AcN96y0Of864b/YVciNUTyzAClyH8XWiAf9fYU4jDP3sgXu/kIoq1y/Ifdh
 SECflsXmX7DmcFS7UyoKWaSEmJx1JZI/eeVwe55WjUOr27mUuGRXOQPdZfbst7zfFYKaJNyPQhA
 DLwMuggQ/rMAD/VbrbQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA0MSBTYWx0ZWRfX7WOSC5kpDHxu
 88bE9yEdKOSOukWizU6E+0Y4O3jVsmHWiLBLi81gsE7Y8FE8SbHXhTqmL/Tj6cFam7XvFQCyEtZ
 vTBr0YD0/FzMm/flBRVQ22v8J6Toc9Y=
X-Authority-Analysis: v=2.4 cv=B7eJFutM c=1 sm=1 tr=0 ts=6a950b47 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=xa2G615rChn3jUNm5UUA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: nsVHNHW_9YrPqy2BmFtVvomeMX7tFXa6
X-Proofpoint-ORIG-GUID: nsVHNHW_9YrPqy2BmFtVvomeMX7tFXa6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310041

Hi Luiz,

This revision addresses issues below you raised in our previous discussion.
Could you take a look at this new revision when you get a chance, and let
me know if you have any further comments?

- Pre-process the PERI frame
- Don't hci_send_to_monitor() for PERI frame
- Don't use the safer skb_pull_data() helper

A malformed PERI frame, once identified for what it is, is sometimes still
valuable, so don't drop it early via a min_len/max_len check.
For example, a malformed memdump frame needs to reach its final handler to
abort an in-progress memdump procedure.

This patch series is to support Qualcomm multi-subsystem QCC2072, the
first 3 commits are simple dependencies of the last one, previously
sent separately but now combined into this series, each commit includes
its own changelog below the commit message.

Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
Zijun Hu (4):
      Bluetooth: btusb: Add recv_intr() hook to btusb_data
      Bluetooth: Add generic support for vendor HCI packets
      Bluetooth: btusb: Build the driver from multiple source files
      Bluetooth: btusb: Add support for Qualcomm multi-subsystem QCC2072

 drivers/bluetooth/Kconfig                   |   14 +
 drivers/bluetooth/Makefile                  |    3 +
 drivers/bluetooth/{btusb.c => btusb_main.c} |   77 +-
 drivers/bluetooth/btusb_qcom.c              | 4513 +++++++++++++++++++++++++++
 drivers/bluetooth/btusb_qcom.h              |   91 +
 include/net/bluetooth/bluetooth.h           |    6 +
 include/net/bluetooth/hci.h                 |    1 +
 include/net/bluetooth/hci_core.h            |    5 +
 include/net/bluetooth/hci_mon.h             |    2 +
 net/bluetooth/hci_core.c                    |   44 +
 net/bluetooth/hci_sock.c                    |   53 +-
 11 files changed, 4802 insertions(+), 7 deletions(-)
---
base-commit: bcb621272aa04a116a74ab5fcc9324231ffa3acb
change-id: 20260824-btusb_qcc2072-abb918ab4220

Best regards,
--  
Zijun Hu <zijun.hu@oss.qualcomm.com>


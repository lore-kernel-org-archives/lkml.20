Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2093BB695
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789463630; cv=none; b=SfHSMMW7927HVCMwmBsC/pXZIeWgJIhM4SgV6Pv3Y6zYRYBDo2UTHx+2sMzHg8xlZWIcjWc0QXBgX+oTr2YbZuz2jwn/DNkMePMuO87hFMX07rogmYIpzqqxHvp/dC2E4QtHFsbXxb9/uTbFDDuEohSJrB+c7M9hTurTRuhieOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789463630; c=relaxed/simple;
	bh=Qj9TPK3mLqzLv4V48K3tEe+VRiKIEI6rimcodIOp2NU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BgA/5J64TAw9AJx7fZ505GnsJUGurGxQiuz87lJa7gLdaaB4XzjQkiGYXC5k8KVZ1KzNmZKG7GH/o3QKYvpwK9aa9aLYSF9LqM4w6Ntk/rUlYnqc6hcI1altP+s0h5sZ+dGmLm+tS6S2so6+Q0F2LTqYdOlMwM/U27ExMQq5dGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DBqSB5Nm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SnVfS2U0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DBqSB5Nm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SnVfS2U0"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6ZekY3126432
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:13:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cPK6TxwwqV0GZRDfZrEX+CmKiAJus2OaYwz7BZNVt/E=; b=DBqSB5NmQk9QeUrL
	tRbc0WYXZwVPSkXunpx/J2Wy7qdLYDxQrs5jo7dmCSztE6Q7jnx5/ebhqEQjmAmX
	DKxfLQ3laMNE8MzRRg1bCEm2mTe7P5bRHElOeKvYIp8iodVLjzpBsbjpaChzFKg4
	QND93/bdIWXFawXyDa68os7MEVqhHMvYU3uX+xSGn7i0RQnMLz7LRgqRM7SPDQjL
	tgBu6Ue18JKKMEuX4Lijn+V6uRLHGBpH14z5u1XFmUV0TyAXf1RZzrtKB+kyftUO
	bmQSFq29CXGyclomz/GO/05lZMIdurqk4GenDxKKl+VXw2AltbNV0FHQ/4WO2T+B
	izT7xQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpmx9un44-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:13:46 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc3934574deso546854a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789463625; x=1790068425; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cPK6TxwwqV0GZRDfZrEX+CmKiAJus2OaYwz7BZNVt/E=;
        b=SnVfS2U0H6bIhz4WSwm3+8qxGH+/fi8l3qOXr/gMo0orh9CssNcTKQ1VNwBY0RXZvn
         szSj/iDz2GwkNQ633vSdaCP3q1B0Rg0Jtw8L/X41KD+nAHYRIsMImnWT7k73EfI8GO2g
         XttnJlBZ0PfNqlJIAPZI9R/E74AvXLElvJBH1L1C3sZJ7wNpGrhUsilGxPfByTdJERfv
         Vw1FYtRq9ZyPzktXAzrezBjlK5J1XArhtzIsyS8kbNvjfllZfbAO6dYSgGzlKjauYGoU
         WbwAqyXvUSvTz2VfcoIWwJuhJDRwOPfdjJjR3R+O2E+a3opY2hHKMwWRwdVuvmsGJPur
         hckg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789463625; x=1790068425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cPK6TxwwqV0GZRDfZrEX+CmKiAJus2OaYwz7BZNVt/E=;
        b=QdhPTdDOOOjKqywPNSsZbtZWweZxnoDyS8nl9snZSIA6jEWcyI2Lb08Q981gcMGmy0
         V0kLt7j6pc569c4U+O5niOZ9WAz4Z9PB4B+i+M7nbht0PhymtCofHKLesQOD4MM7uYzG
         UDucu9z0/TAZkM0omQ4KoYCJUky4mKCGDO9CiLk9UG9sASol+g2DgQOke581oulSy6On
         K4ws7IR13LfPx9BRGV89kuhSCZb8L2lGEEhosyfN/UXhDmBzt+96oT8D2zLPJQHwEKGw
         bk87KTacT+VflR9eKJuvmbfzV2vSjfpLEaHT3F10WDROTTOgVHEm/3/Ke3DHySNtLrqS
         5MZA==
X-Forwarded-Encrypted: i=1; AKwUvBzMFG4VNdRPVckyw+yzaO2KfTmPYWQ6216GwE/ZYT40iXRgxcmbzZvHOUDyZ0+zohqHilwj6/4NAhNQ/ZQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nTDGuxR0y7DZsac6FUPwGjmDVtXkX+8sFA6heWBVWvyQFK115M
	mXO7nnWqJKrr9b0bsimGTmbAFebz+0KVNaUJPkJXaH7VMUqJj6Df63LoyuJkjsFoVLBFfjjUHiS
	py5KDKBnNas8pNDpfXgmUFF5/2lpzfjepPJNtp8GCQ2ypbAB10TcPiJBLbyUEib2smpU=
X-Gm-Gg: AYBFou0jseMVOdlhho9Al96Ah+25SI1aW4lmJB411UlKTUtwPHj3vjQe4Ey4+2WkA49
	AVA2wP2h2HDPnmpUZcMLCF+jZaxf0M/xmjFYEc6yMy0shUUr8UzU91qmM1UUlDtKsFoM+pPC/nZ
	I/VxjviS3zo9Bnuaojb04I5YF5fEAil8nNTzFgdCSAX8DLwZsd1Ph/c0cvnxLT//+uFVhZWZaaT
	pMKorOn5ct+58fZTxUawv4nLXcHdDHwLRvN6hQtV09t2pGiuFekqnXWCpxk26lstzfq4br8Llc3
	eLimvdYPNaVsGWz/gnSJkG/EuHRi45NJsKzKsIbn2o0XxD7UFUMKa/8gqzs0ccliwlVdoGF0oOB
	wp7xTadhhsuZAhLSc+ESiVS9RSMB+SUG4G16F+bbstLO9WmU=
X-Received: by 2002:a17:90b:2709:b0:39d:fcef:e241 with SMTP id 98e67ed59e1d1-39dfcefe940mr4913880a91.2.1789463625058;
        Tue, 15 Sep 2026 02:13:45 -0700 (PDT)
X-Received: by 2002:a17:90b:2709:b0:39d:fcef:e241 with SMTP id 98e67ed59e1d1-39dfcefe940mr4913854a91.2.1789463624639;
        Tue, 15 Sep 2026 02:13:44 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14390c0be29sm3493044c88.9.2026.09.15.02.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:13:44 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 02:13:20 -0700
Subject: [PATCH BlueZ 1/2] monitor: Fix btmon heap-buffer-overflow
 triggered by HCI devcoredump
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-fix_heap_overflow-v1-1-8fc39dbcb303@oss.qualcomm.com>
References: <20260915-fix_heap_overflow-v1-0-8fc39dbcb303@oss.qualcomm.com>
In-Reply-To: <20260915-fix_heap_overflow-v1-0-8fc39dbcb303@oss.qualcomm.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Linux Bluetooth <linux-bluetooth@vger.kernel.org>,
        linux-kernel@vger.kernel.org, Zijun Hu <zijun_hu@icloud.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=G+KJgNk5 c=1 sm=1 tr=0 ts=6aa90c4a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=cGIbaRgtdj3G7wcnDWwA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEzMSBTYWx0ZWRfX9td5cs3mcqUx
 B1CYpgGHX8/8YI5xujea3I7hxadO9CV8aPXWixI0MvJv3QtZ5TuN2pLsdcNRO65NiCqccOm7WES
 DyQW6xgRWrOxKWMLJbA19kLICLukqJCJj1azzBOHX4bsOmt76Upl7+n/NsKN9+13FnsosvInGQC
 x+8nrHy9YszoPovqJx6xFAK/PfUP+xOpdEjKUAkRA0+Xkg6fSkt8+QaLoT5rAvsdHrRJhBRyTMZ
 Imn+WAdn/79Qunt3CkXXN+QQvlF8By0ObBCqrWHZIhzpLv8Q+dPvlfD29TUxWX9WB+6ItJ/t5vc
 BIPHE0sG2eZyJP70Jc9Q67fPJiPn5ABlXCcACA7jIzYrT4I80NDaBuwqnRzPOv2tL3yKszqQb1Z
 tnvf6r/HYSJSIa5Ry60eDHxowB7nWF1EVc1wQeLgiyN2y39sXPEAC69BNDSaAhKK1VjniBjSZic
 usKGn9T9Hm2or5kaziQ==
X-Proofpoint-GUID: 1MIg6R2hYLFoaD3BJijpODO5cW9vlAzO
X-Proofpoint-ORIG-GUID: 1MIg6R2hYLFoaD3BJijpODO5cW9vlAzO
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEzMSBTYWx0ZWRfX0QYQ+N4Bs+bP
 LmhwIhAsjAdcf86sXsKV9NMe3ZDxv3aKD94kjBsuQwxqwFuVfAtt5o2FL+SFILaCB8cbBMYaMpt
 jliudit0YMzWxpaTS2w4tv32rEL1pm4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150131

Kernel HCI devcoredump can accumulate a large amount of dump data from MANY
packets, then send it as a SINGLE DIAG packet to the monitor channel, so
cause payload length @len in the header exceed BTSNOOP_MAX_PACKET_SIZE, but
btmon uses @len to access the payload in @buf without validating that
@len fits within @buf, causing a heap-buffer-overflow.

Kernel:
include/net/bluetooth/hci_mon.h
struct hci_mon_hdr {
	__le16  opcode;
	__le16  index;
	__le16  len;
} __packed;

BlueZ:
src/shared/btsnoop.h
#define BTSNOOP_MAX_PACKET_SIZE            (1486 + 4)
monitor/control.c
struct control_data {
	uint16_t channel;
	int fd;
	unsigned char buf[BTSNOOP_MAX_PACKET_SIZE];
	uint16_t offset;
};

The heap-buffer-overflow Issue:
ERROR: AddressSanitizer: heap-buffer-overflow on address 0x51b00000065c at pc 0x7f50b987a029 bp 0x7ffde88dc8d0 sp 0x7ffde88dc088
READ of size 17916 at 0x51b00000065c thread T0
    #0 0x7f50b987a028 in write ../../../../src/libsanitizer/sanitizer_common/sanitizer_common_interceptors.inc:1096
    #1 0x5b4f3443ae3a in btsnoop_write ../src/shared/btsnoop.c:289
    #2 0x5b4f3429cbf0 in data_callback ../monitor/control.c:969
    #3 0x5b4f3444fa9d in mainloop_run ../src/shared/mainloop.c:104
    #4 0x5b4f34451da6 in mainloop_run_with_signal ../src/shared/mainloop-notify.c:196
    #5 0x5b4f342953fc in main ../monitor/main.c:303
    #6 0x7f50b8c2a1c9 in __libc_start_call_main ../sysdeps/nptl/libc_start_call_main.h:58
    #7 0x7f50b8c2a28a in __libc_start_main_impl ../csu/libc-start.c:360
    #8 0x5b4f34295ed4 in _start (/usr/bin/btmon+0x29fed4) (BuildId: b41caafb24db693946c283eaea48112186863d2d)

Fix by clamping @len to the amount of data received before accessing
@buf.
---
 monitor/control.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/monitor/control.c b/monitor/control.c
index 83347d5dbc3e..1eab9c4fe0bd 100644
--- a/monitor/control.c
+++ b/monitor/control.c
@@ -961,16 +961,19 @@ static void data_callback(int fd, uint32_t events, void *user_data)
 		pktlen = le16_to_cpu(hdr.len);
 
 		switch (data->channel) {
 		case HCI_CHANNEL_CONTROL:
 			packet_control(tv, cred, index, opcode,
 							data->buf, pktlen);
 			break;
 		case HCI_CHANNEL_MONITOR:
+			if (pktlen > (len - MGMT_HDR_SIZE))
+				pktlen = (len - MGMT_HDR_SIZE);
+
 			btsnoop_write_hci(btsnoop_file, tv, index, opcode, 0,
 							data->buf, pktlen);
 			ellisys_inject_hci(tv, index, opcode,
 							data->buf, pktlen);
 			packet_monitor(tv, cred, index, opcode,
 							data->buf, pktlen);
 			break;
 		}

-- 
2.34.1


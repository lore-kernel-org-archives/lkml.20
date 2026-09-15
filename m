Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60BA3A1A55
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789463629; cv=none; b=FskySLavkRX+7+gp2WjWI3yk0bpx9LEhdhICbtRM7E1DLAyYW81VJDsBz6lDYfwtZ21wsc4GF7tLgoNhwYADOPWyQ1DhIdC0ZvitvMeFrKYHqRnUT3Saz8lpgpUDgCWRvxZwxtWrMywNl935TwoU+CU1U4czw/pHMdC/M/eYqak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789463629; c=relaxed/simple;
	bh=LAHB+TdCn+Mq2sZkQXd+KOrPqxDNZYnhIbuOP09gO3c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GLwAxrFh3htkrgb6B3BNOsc0XJRDlG77Fc6OHV4Jtcy6b4eLwqdUGsSIMSZUd6X11ACIJX60TXFl7qrgHO20SIOMYGff7Yl0B5XTf8jslyzyYR8w7mU0womqyGcbMuX7Xq5Mq2memXRYz4XZCyxJ5GoRoFB+3OhZCdU2hVkoOUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HXb4jNXC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OmfS72S8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HXb4jNXC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OmfS72S8"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6ZPMV3487175
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:13:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yK36FUkJqsPnyV4EB9Xdp/mswiMYw5WzkKGITyZqa1o=; b=HXb4jNXCzWiSYPTi
	W71qZ6AqgqTKvZVQZ7FzvekmJZ1k8LJVbYivQ1yNr6sBF9KZ4u+vwYC5EgMInOE3
	V7PFl0umP0aYyxmzZmIHH1vAU3aph7kyPm0zgv32VEY28CNPw+f+6IkKaSx/0zOl
	XLJqJG0SBt3355VdokCEGDbDwgBI4Ivo/9+KGbdEr2UzMYADhr3p08VDVMFGB6Lf
	X6adkUZhvhPrsWDhGC0zWtafgbyLkYXZH+POln5r1Klbx1iYuF1nGTAIEWX/nfX+
	MJFs8+KGnhiGP/C4NOOX78plNQFYYBCc4KfNv7GD0i0cn4td0vYrkUqbcOSrup83
	o4C/IQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq0jerr77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:13:46 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-394f8176688so1109068a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789463626; x=1790068426; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yK36FUkJqsPnyV4EB9Xdp/mswiMYw5WzkKGITyZqa1o=;
        b=OmfS72S84CWsxdnG+HiBgtC5uFpYVkIe0PUVXV9JuExH+LNIXyVZUOJ71oDThVRPxP
         h5oqTFtdCWW7MVxm4pw8eIHtQYaqZ5q4LOYzkE2jH5vnpJn360HqTO7Ny9mt9rXvCjwY
         tk3hjSYPjj1RVW1Ue2vHw6DbORDXNCVvyKSOCnCW7xkiijC62KPKAuzxDXD+xvLdk3C7
         xtTbwczpuV+Y44Vh/McwIP2IbE1dHOGRbNuOolJm6CrBax8Sb7uCfXKL3BQ+Gn+X05l6
         4lhQJ5M96RmFI+SfKytkJlOIhADOMCVpLD1ujEvbiC+D0XvFRETZFwE0AJBdb3/O+cvf
         rIsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789463626; x=1790068426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yK36FUkJqsPnyV4EB9Xdp/mswiMYw5WzkKGITyZqa1o=;
        b=QvjxxF4dFjKKRxSE7+7PXiBZnhJOg1G4C4s89HrQEgDzx3RcnUs8jzfGpbfefAMhw3
         3qQoCpKjiHup6mlqlpFjaCXgOvyxvnxaKR/r1QoyNFoN4OqC+R/xcVKfBlhZrY5GASqW
         DKTRYPuQ7Dz5lj46uWDgox7HhfxNjIFk/LhMHLKvkLxXp73qiv3HDwb5uaZadPKyjcuz
         EKqRkPSGfDcdGR41MO0Sv04xrbY0frrf+XTMWvNHuY7qs9rN3Gd7ZqYUGn3ciYAPOZvu
         ZTTIM1AGSGc3iMSEsVP3u6ZjRqTJKycPAacakWZ1W4Sakv1gU7ZQda7MUM3w2cq5mQ5Y
         Tx0g==
X-Forwarded-Encrypted: i=1; AKwUvBwYTLUnMAX6jTX0s3qVt0HcSNiNO3JWu4cfjq8SRWVoPasnArr1yV96VhGZIPJLXMMOGIWCCekWgNrPgMI=@vger.kernel.org
X-Gm-Message-State: AFuF++lIPeZBRFucCOSxpXDX/xqJNHy4E57Uq2g7g0bquMXxJhkFJ4aP
	GNHGBUI//HCcGirECwEgWiNs+75iyzKjjdGF0rOz06hKrPv80kyLDle33S73P8e3ZTjpux80GYJ
	QYBrwZlW4xhUcBORryteqgFeLuFFganuRGfgCWwJMMcUeXr81F9REw9xim+UB2Ll/ylQ=
X-Gm-Gg: AYBFou0+GzyFvhhNRTTucIvHvZXmqyoXK+qi9ehSjQ69LJl7VP2LGJsTZ7cdQngS3FQ
	XUVUiLdt711UYYf8QX9emNqe5vEOhntb15IgFS+F0n+lRdC4JDydubaJlZAtz5NVmzbwJJbsxBZ
	vE2exzuhuALTU6k+W85i5fuDwSNH1MW1Ki2A4996Q/dGfSO/HaNbfnrnZpEj0PEjEMSgvPO61aj
	PIWFIs2g19uAyhpnolNe85CDMfC9eKM3TwOiGB3SKz3MD3DqeHsbQIzG4jfOZQ9FebkF/e+2l4Z
	dWm+tH2xzYwaiIlNqNHT383bAb4li0a0feWclJNXSS7qitfkZgVWFJgapYat9wbwwJHUwxdZvgJ
	/Es48wm06TtxMRhXUO/9jZdebfrgLu35h5IjECK7WtyGBrY8=
X-Received: by 2002:a17:90b:2541:b0:390:af7c:fe5e with SMTP id 98e67ed59e1d1-39debfbe500mr8747010a91.2.1789463625702;
        Tue, 15 Sep 2026 02:13:45 -0700 (PDT)
X-Received: by 2002:a17:90b:2541:b0:390:af7c:fe5e with SMTP id 98e67ed59e1d1-39debfbe500mr8746973a91.2.1789463625315;
        Tue, 15 Sep 2026 02:13:45 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14390c0be29sm3493044c88.9.2026.09.15.02.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:13:44 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 02:13:21 -0700
Subject: [PATCH BlueZ 2/2] tools: Fix btmon-logger heap-buffer-overflow
 triggered by HCI devcoredump
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-fix_heap_overflow-v1-2-8fc39dbcb303@oss.qualcomm.com>
References: <20260915-fix_heap_overflow-v1-0-8fc39dbcb303@oss.qualcomm.com>
In-Reply-To: <20260915-fix_heap_overflow-v1-0-8fc39dbcb303@oss.qualcomm.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Linux Bluetooth <linux-bluetooth@vger.kernel.org>,
        linux-kernel@vger.kernel.org, Zijun Hu <zijun_hu@icloud.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEzMSBTYWx0ZWRfX6q9sdAIw5vwv
 vxS60yEEbHxj13WMXgQ4BYzp3u1CmCmU/CnHXlZF15Nr7p5yjJ1Ur517Bg3/ydHsSJuSkqDJGez
 ZlCvpo4XQfuLYh3/M/pdSBcgSdrQvLw=
X-Authority-Analysis: v=2.4 cv=Kr/YSmWN c=1 sm=1 tr=0 ts=6aa90c4a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=kEP8u9lKm2yaboKPa_EA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: pxVUaF-dr2AjJJz7435mtV138EpFCZl4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEzMSBTYWx0ZWRfX0U9Tr/nZlJ91
 t0a0NbxYI08bg4oZ771pMbnIqU7ur4I54Fgu1xGqZTVbshqk/GOOkpBUNWHy5Ob30zBQhFi+AU3
 /jw9Nu9SWADpIpKzAQnDXG0alaM+wBClwoz6mXWwFYyW31qIWVweflocwG9iB2ymzFKW6U+SUq6
 HDWavNAag/m0MCk6RhFXtkmdAm/wz+LkdKETKn28ZBEg4b2w0lSPjGxno7E269aF4hrleW3xEhU
 KMrBhq7dc4oCeqvO6M+OyY03BJNOrkcqKvKBhTGwecmIZjmxAM9NU392VsYESaDppJ5cuyM+KA+
 dxcIRsS/E41obVTcZ1pzebpI8l2EUlhnw98GTpxS2O7IVKfMeONEvk35OYrFYw+l48//7S9j+ZW
 DicOLL9C6RUXENhFi3EbFgvAx/7/2WHgx/TWwXZ6yyZJht/THw7JCfRopv+0idRtqI671gpzTlX
 1Tb8pslfrWEQeSkDlEw==
X-Proofpoint-ORIG-GUID: pxVUaF-dr2AjJJz7435mtV138EpFCZl4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150131

Kernel HCI devcoredump can accumulate a large amount of dump data from MANY
packets, then send it as a SINGLE DIAG packet to the monitor channel, so
cause payload length @len in the header exceed BTSNOOP_MAX_PACKET_SIZE, but
btmon-logger uses @len to access the payload in @buf without validating that
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
tools/btmon-logger.c
uint8_t buf[BTSNOOP_MAX_PACKET_SIZE];

Fix by clamping the payload length to the amount of data received before
accessing @buf.
---
 tools/btmon-logger.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/btmon-logger.c b/tools/btmon-logger.c
index 261d998a6664..b9a81965a464 100644
--- a/tools/btmon-logger.c
+++ b/tools/btmon-logger.c
@@ -94,16 +94,19 @@ static void data_callback(int fd, uint32_t events, void *user_data)
 				tv = &ctv;
 			}
 		}
 
 		opcode = le16_to_cpu(hdr.opcode);
 		index  = le16_to_cpu(hdr.index);
 		pktlen = le16_to_cpu(hdr.len);
 
+		if (pktlen > (len - sizeof(hdr)))
+			pktlen = (len - sizeof(hdr));
+
 		btsnoop_write_hci(btsnoop_file, tv, index, opcode, 0, buf,
 									pktlen);
 	}
 }
 
 static bool open_monitor_channel(void)
 {
 	struct sockaddr_hci addr;

-- 
2.34.1


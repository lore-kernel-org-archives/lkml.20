Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793688934;
	b=gY0cuUzKqAS9YmevYqDjZzJcFr9svJN7QcqCWy/uaCQWKTEzJG9aLDUmetvfh1BkkUc+
	 sOIQkivZMjy3y62ocMpe5djSVFOMMLpxM25evJUx/e681usUzgcFjpUfy29ao/cCfXpwW
	 XyXcFOo0F9K5YKQJYZ9U6RwJQ2onZoSn2RXfj4CLKd9JJ3/cvDRyx/KuU4P+a/ZFFmNyO
	 0YACqHphcvxZ1FlV67+1pYEUyCuqmItyJ2d5ErZggORWYbFzCU+Dihw5J4qy4wBR/L7/Y
	 qUdSKSwIAQzVsW2P2GGsoO33Y9bT7t8XAw2dahDZoqXSYM52gnzrMCLpCyGziplwhNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793688934;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jg8NEK3ZW1ubDPMf7drkDVCuPq6ogQM+ofkG9ZyFXQE=;
	b=BQtmoUaRC1n2cOPLWznZvrUFL3N6EX6Uezd8lqyeTe7GCCkpYE4tq4OVyIOYIfpXA7eD
	 6EmufLvTJ1uhIkiwKvS82pl20dwNa9UgZ3DISLmqBWl6AN8YkcdT1o2s85be4/etUztq5
	 9WP1LByA+543LkDFvE6LcpSATsZyTMe+My4/VJdNVdx+Fhe633sVpbrXo01BIPFcAGrls
	 dHQU55y8s+GT4jhrWSC99+tZQpVOC7hQbGsJvjj7p9UDDxcTpQrhX9cGH62C3IxwPVBrG
	 dXtFg/UvcmCmgtPZwTFq1RDe2caWJQQ+7vvJZpu6qQg8dTZjsXOit75yWsmEXUg7kjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l5TRNqzI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KbM6sVC3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3715606A32D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 06:55:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3715606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l5TRNqzI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KbM6sVC3
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A31eDmr2403177
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 06:55:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jg8NEK3ZW1ubDPMf7drkDVCuPq6ogQM+ofkG9ZyFXQE=; b=l5TRNqzIbTQl2soi
	UhAorkwSPLzlVsJhsGz2MK8lVVssIdBqBZsrZl0fOK/o4G11lnxym6XCFCt/VjEf
	7lzT0OfR+MGUgeAeGqd87+S2jcFgBCbJ7VKTbo4cnXgdCDFBlXm5AceV2xhriZk0
	raA6Zkdcyj0PDZY8vHDnhnSbMJt2Xdn+W1BLQLwNRdNzDseDvfS6PMNrvMSgqgMe
	wC8FII89ucdKCtN8Jt0cgak1km6XnVEN9zlKmOLl6odqCjo1gvNtC/25c30n1nKf
	onSWWhkCfKHqRJW7/emVvKF7NTamxZhqZ8XOFmoGFs2Bxj5xtztPqIPE72R1FTDc
	CwAmbw==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq3uy1hq1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:55:32 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-555eaa3ff0dso892918b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 22:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793688932; x=1794293732; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jg8NEK3ZW1ubDPMf7drkDVCuPq6ogQM+ofkG9ZyFXQE=;
        b=KbM6sVC3z5eP0F96eopdkd9XhMozs69QCUAGA2FeyEYE/BHTf+z/ikIWktoFlT2q3b
         sQIrgC/thDseI/TYiU4YpAvxbgaoRZB7QSEcJC8D47cCrM3l+LCrjzokpMw2RBl9nMnH
         URqswjU8ZDq2RfuVDWo08jl26YjFJXPWLZKsuJ4fk08j3tCYMi1iG9KDb4+MtJ0yIoVi
         Uj9MYgCGAcqAAa/ws9m+ghMy5Ac1h6JQNoQZilfgZe+QVO5ksY1ZYZYlme0JO2bH3ZYt
         H/oWBwJtPkXkUFAfw7yULqQ9uu0AoJoamW2tlN4JMuU8SsQeQDCjHBR88vbAQ/vbpF7I
         i5Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793688932; x=1794293732;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jg8NEK3ZW1ubDPMf7drkDVCuPq6ogQM+ofkG9ZyFXQE=;
        b=KpBtay7/hCHNOG2KoCXLuQYnA9epGO54Npy6+dcdRSwktk3c1cyep0/TNJgFeLW1dh
         d3FT327J3xZnk3UI7aB2r3Vxg41H5Q69gzU2RJwdzRsyRMpj5m9bpR3xL3oVJCW/Jm9M
         HANNx2K306iHx3hlDi3sZ0LbkuhD1kmNtTJNRuE3cxvacmmddz1tpHMDvLAgpRnFl2CO
         OmJyOfnnq/CMRpfciIzKAne0K9Nm8VfNnQ/yEAnq5YOcH8+A09XX13XHyIZSHzy6r6Ug
         WDwnha7eMeO1b4HCr2hrPJOkWxbdnOalyvm/8RgOXaUmDSwGdYPc0uJFqaea2i1rbG58
         vz4g==
X-Forwarded-Encrypted: i=1; AKwUvBwCUhKdF8bbDqOe2pEtdBCfkqrHF81/iEj/b4wvpUslK/0XcGQP3ZKlMNXL5aXXNHOptJFBLBur+uufMvU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzMeB0/ieqakfKtYocYKXUAxAnCJ9ZiaLy55N3M6AjB1PrmLje
	vfRYC0VYGBtVMN1HWGQglP3+iLOlMiWlssUALWOhphIuB5ImFBa9NI83M6JL4XzDB38IFDhJqZ1
	Pg64/f+XgQc9vsqJ+ExCc9/ssuF8F/YSRongRO37bMN5t8Ofcz2wKD1uuPJMJtKzn3qk=
X-Gm-Gg: AYBFou2zSZt3pCLLFAbq9D/xxXeyx1yea7PRScRd+aanjqlxTxKk1FwJKYuIFe3BKIX
	K7/Qxgg+wf/Y41IZLkTLnfaMLIyRUD2F1bgRpL7AWXja44H59bGBIolsL/YTOYMmpwOZQ/ae6G0
	CUCCMBa735/Eiceew10qX+zAuPUz5+R20EO6wHVKqvTgZr5aJ0uf2SwPoKUJp0RFsgzzsv2cNaz
	LXPycw/s4Fr7ZwCMORsoRELtNQerL2FYW+K39XS8o+n55pM7iCXuYrWA2g7JdTlzDznlhjrN/AJ
	uTa8j9kATWBC49mLHVMBMgZV+krtZ5F1bP1fV/ZK8dh9U356/+Oj3cetAbJdxMNffJkFdHOrCyI
	SzCHmPzLqptdjwHh2fLMavlk55evOxsF7VkEaDt1BkjmOQPe8Ml10EBJTtJbhIgVf3S3gtVnU/6
	fktkTF/wSK5ATza7wfeUI=
X-Received: by 2002:a05:6808:bd1:b0:55c:866:20de with SMTP id 5614622812f47-5640d9d5e9fmr12645145b6e.2.1793688932118;
        Mon, 02 Nov 2026 22:55:32 -0800 (PST)
X-Received: by 2002:a05:6808:bd1:b0:55c:866:20de with SMTP id 5614622812f47-5640d9d5e9fmr12645126b6e.2.1793688931721;
        Mon, 02 Nov 2026 22:55:31 -0800 (PST)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fe423fasm10305974b6e.16.2026.11.02.22.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 22:55:30 -0800 (PST)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 22:55:20 -0800
Subject: [PATCH v2 1/2] Bluetooth: hci_conn: Fix SCO/eSCO
 Transport_Unit_Size for HCI data path
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
Message-Id: <20261102-fix_kconf-v2-1-b4bd28de37b5@oss.qualcomm.com>
References: <20261102-fix_kconf-v2-0-b4bd28de37b5@oss.qualcomm.com>
In-Reply-To: <20261102-fix_kconf-v2-0-b4bd28de37b5@oss.qualcomm.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Chethan T N <chethan.tumkur.narayan@intel.com>,
        Srivatsa Ravishankar <ravishankar.srivatsa@intel.com>,
        Kiran K <kiran.k@intel.com>
Cc: Zijun Hu <zijun_hu@icloud.com>,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zijun Hu <zijun.hu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: 1iEK6jzeA7-sQdgzbb0yqOh0ryXOfnFI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAyNyBTYWx0ZWRfX4h5W0ICCoGaC
 5ofg1XKKpLFP2ulGONkVBgJEzwDVu1wCGx/+bNPDvjBgvqiT27SA3jksGMAKMFiuLzCP2Uxk5ew
 94MS6BLNVD+dlDblRZUqqmj1QwEDl2VRI/eF/SGfT1NQiXS4SEuptN4RehYDdx8z6XqiChBFBO+
 /6OT1UnqwEtIDs8UHRXad1sYh3X2eDFhUwq12YdcV+UedSRbmmGFsrLgYpv2RczG9W6m/D0J0z1
 wc6n+4Fc8iWHDTL9mX2mYCEOApEnQkRPTlk7DefBN1eMd2j4eLUArhZhdG0v4e/5WAyGwrkZS76
 exwfdiF4TLs5z0MQebb5GkX5JKxM/7viasbCQ9Qn8dQ2JzeNxKTAdRN0iwKV9d2sfGosm7JKPKA
 2dU6kkeSymFqwVZUyXEH0LFBkyqqn6rHCRQnYLd+H08soerAatxvccQgufTxkOeuPCpQQtG+Kce
 2tX3faBxEZxrLdxfBUQ==
X-Authority-Analysis: v=2.4 cv=VoG2kO2n c=1 sm=1 tr=0 ts=6ae98564 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=HEh3y00BNYiN-q-pdcgA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-GUID: 1iEK6jzeA7-sQdgzbb0yqOh0ryXOfnFI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAyNyBTYWx0ZWRfX5+TAi/YOTxDs
 W+4VwR2GCCUME6a+AoAd87qcOIO3BJAZB/GctE1/+JLYNCGQ46fWXfLseO5c1+Ro75sKlhmfp+m
 IBR+0EskZB/vzoz2KQUnsm4dyCSpguY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030027

Correct (Input|Output)_Transport_Unit_Size based on Core spec v6.3,
Vol 4, Part E, 7.1.45:

  "The Host shall set the Input_Transport_Unit_Size and
   Output_Transport_Unit_Size to be equal. For HCI Host transport
   the Host shall set them to 0."

Fixes: b2af264ad3af ("Bluetooth: Add support for HCI_Enhanced_Setup_Synchronous_Connection command")
Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
 net/bluetooth/hci_conn.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/net/bluetooth/hci_conn.c b/net/bluetooth/hci_conn.c
index b007f623b2ec..eebd73988bf6 100644
--- a/net/bluetooth/hci_conn.c
+++ b/net/bluetooth/hci_conn.c
@@ -322,18 +322,20 @@ static int hci_enhanced_setup_sync(struct hci_dev *hdev, void *data)
 		cp.in_coded_data_size = __cpu_to_le16(16);
 		cp.out_coded_data_size = __cpu_to_le16(16);
 		cp.in_pcm_data_format = 2;
 		cp.out_pcm_data_format = 2;
 		cp.in_pcm_sample_payload_msb_pos = 0;
 		cp.out_pcm_sample_payload_msb_pos = 0;
 		cp.in_data_path = conn->codec.data_path;
 		cp.out_data_path = conn->codec.data_path;
-		cp.in_transport_unit_size = 1;
-		cp.out_transport_unit_size = 1;
+		if (conn->codec.data_path) {
+			cp.in_transport_unit_size = 1;
+			cp.out_transport_unit_size = 1;
+		}
 		break;
 
 	case BT_CODEC_TRANSPARENT:
 		if (!find_next_esco_param(conn, esco_param_msbc,
 					  ARRAY_SIZE(esco_param_msbc)))
 			goto unlock;
 
 		param = &esco_param_msbc[conn->attempt - 1];
@@ -348,18 +350,20 @@ static int hci_enhanced_setup_sync(struct hci_dev *hdev, void *data)
 		cp.in_coded_data_size = __cpu_to_le16(16);
 		cp.out_coded_data_size = __cpu_to_le16(16);
 		cp.in_pcm_data_format = 2;
 		cp.out_pcm_data_format = 2;
 		cp.in_pcm_sample_payload_msb_pos = 0;
 		cp.out_pcm_sample_payload_msb_pos = 0;
 		cp.in_data_path = conn->codec.data_path;
 		cp.out_data_path = conn->codec.data_path;
-		cp.in_transport_unit_size = 1;
-		cp.out_transport_unit_size = 1;
+		if (conn->codec.data_path) {
+			cp.in_transport_unit_size = 1;
+			cp.out_transport_unit_size = 1;
+		}
 		break;
 
 	case BT_CODEC_CVSD:
 		if (conn->parent && lmp_esco_capable(conn->parent)) {
 			if (!find_next_esco_param(conn, esco_param_cvsd,
 						  ARRAY_SIZE(esco_param_cvsd)))
 				goto unlock;
 			param = &esco_param_cvsd[conn->attempt - 1];
@@ -379,18 +383,20 @@ static int hci_enhanced_setup_sync(struct hci_dev *hdev, void *data)
 		cp.in_coded_data_size = __cpu_to_le16(16);
 		cp.out_coded_data_size = __cpu_to_le16(16);
 		cp.in_pcm_data_format = 2;
 		cp.out_pcm_data_format = 2;
 		cp.in_pcm_sample_payload_msb_pos = 0;
 		cp.out_pcm_sample_payload_msb_pos = 0;
 		cp.in_data_path = conn->codec.data_path;
 		cp.out_data_path = conn->codec.data_path;
-		cp.in_transport_unit_size = 16;
-		cp.out_transport_unit_size = 16;
+		if (conn->codec.data_path) {
+			cp.in_transport_unit_size = 16;
+			cp.out_transport_unit_size = 16;
+		}
 		break;
 	default:
 		goto unlock;
 	}
 
 	hci_dev_unlock(hdev);
 
 	cp.retrans_effort = param->retrans_effort;

-- 
2.34.1


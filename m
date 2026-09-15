Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04E143B3E5
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789450872; cv=none; b=bCtERp+N6hX91p3LgfqyBpHVpHsVvYZDn6Xcwg9eWEFx8b3GnnzBveqmZXlDW0WpQ7v/1DDTBR9OAkhLSIIv/VQXsYWcgelL7zrVsHEut2uWUVbW/yzwo4zH33cvbAPYgwxFP2fFMO37SvYaWy9iAP2Q0wreDwSzh3witFs/BBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789450872; c=relaxed/simple;
	bh=PhAMGANz7MkUBW5ysjeXPGKUMHHQxXQzswMnWBzcuwQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=exhTVacPe8ed3sV5PPLv6xVsu94fGAx/VNxmYfdiMqSVYxQD96uh/UU66QLT3jYO3NuXeHzHYbYM37XF+74NvagasDVXON9I0Fd84VD7cf2nzL2E/5ufFQHzboTzHPLKxRTztjWHJceohJnI9yFD5HckvctVC4zDSG58Kqr5RZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O25HQT07; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V5oYilCp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O25HQT07";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V5oYilCp"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F4u3nl2032076
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:41:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	demnwsDRacp7YkAOkxM3KDcVI0hv/Hsw5qIhskdy3c8=; b=O25HQT07wIjDAb5a
	HETERkQbDPKgib2Tm9AYKFm1FvPDPE2SKNbebTUk/PMCszclmQu8cyYfWEYKI9Rp
	9B1Jaw3WMpOwQ3CQBmuPyFFJR/THy63LlWfsyJ2vnfmcjuflaDQBflc3dt5UEstg
	nqQkjAjDSbpLfF7bJL3AZ2nZwxY2h+8tV79MQInFp4jcK/NjwVLVb+uRDqo6HzOQ
	gB9V2HpKnrXnUlWVogzTPzBhyxGrNsgrGdE/cvVjOWLDuxU8ooNc4IM/mOz0qSEq
	LbiadTeN+6bfgXcEgIiQhXeuIo0ZbYi/wJRUwDeYCftH5OCu2ylMGB8F30nK6Vo1
	ZC7xIQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpye704n6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:41:09 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-399271df9d8so1015907a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 22:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789450868; x=1790055668; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=demnwsDRacp7YkAOkxM3KDcVI0hv/Hsw5qIhskdy3c8=;
        b=V5oYilCp3zOuz0NjWX9z7uP0XaQSmRXxjGPIaMH2NQJIupD7OnGXKZpxz+tj0mfPLo
         4+6COVgr1Q8L8PgXxNVMb4/28cKF3WpPBXo0GwXPj3ktWqBgQPtIjuXTzqmUHVOzZsVx
         Hs4rLXR9b0dBQMuQdTCN47Ksg29YdeIncjQpHgnpJL2lko6Ro4WGnWM8KqAf5JoEx3k/
         d+1R0nxU10rF6JzxpiAxfizbKhqypOLa3jD/dfTTSHUJtK40PKCPHlifcGYDF2vC3F20
         GnS1l5LdUBuOOp1iDW3lq0xItVvHk2U6bhtWi7fEEveQHUH+wJgUwedoweI6/gzpfT9c
         DqGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789450868; x=1790055668;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=demnwsDRacp7YkAOkxM3KDcVI0hv/Hsw5qIhskdy3c8=;
        b=sbb6E+L8jcGUyrXj810yjtZIqb+IVQhWZncxmTK70nZDpW+1YwEGsEerxVRYS0HX7F
         6CbaUAzVqgzpF+BOV/D9PQRwq3Wh3FViVCpzNTo6O2sUG0pC+NswrBMSmWFnStsdQjBs
         EajFox140un/2MY/sDkvBn2PnLt8X2Ex3zRMGZOBBt3coh1qPiYLHAPEjJPZjJZq6F5P
         Bf29eTNcKkn4XYwYmYudejOu4RVj/z0tYV5C2X3PyS8UVlgp1N+TpIogRsajNQ69NiWx
         ZyN5GBHokmeYe8G6Uw3aHT+gb753w8DTPCksNHFsSnZ0Kd7S6NVIy52yoKOMtrAyQDCE
         sNSg==
X-Forwarded-Encrypted: i=1; AKwUvBwWQlpolJdY8qXKwzfyVLJDZ7h4L9Gr4E8wA5loSPfGuVMYq/Bwx9UVl9wXJu5Cy+CZiNkMVM6u/vIhX9U=@vger.kernel.org
X-Gm-Message-State: AFuF++kyOgF2UyiZ0GdMxYmykvJXtWESEC8EsgTyXjdgcnTAiPH4bkov
	iAVTv4rpn2IW5qMobokPwzg5iNHt4PxHzLfXLe+5gdbEkCdPzNINi6VINaHkZvwCIHD6ITqe0ON
	PpMaaaSOX2ewt2UsiBgOJuYCeIc+6+5PSLeM6T6O7FIwN3IrXT5QSLZT9TCYkJgdhmOc=
X-Gm-Gg: AYBFou2xfGw+SXhxd8HGLaa6ZPjpX1TgY3Md8D0FGHuvnLJlhl6LgOa98UdzvJpMEGV
	TMAcZONWEGjA8siqe9I4/DImbL3WZY8gwqKnqtB3CFxc9EhuDW4xEUeZwycjcOrWq1qFwc06s+t
	e1Jy+GGBxlr7s+3/1m0dl5R7wSGJQJJkKagiZTBp414u5fkT8z8fzzDHv5U+NJY462h4yZLelr6
	r8oVYhsC8/VWddtmh5VFka/pUkXu3J1vIt0sRWHUbUPWuM+vu2hgF/3KOxjc+9HdsXn9g0f/NCz
	VBYGnc98AWBsOOF/+YTa+q+6c1plDy+oUaPBmI1nOqMmbSv0ue4d99mvR5wn3OZYSvzWmBwcsIL
	4CPdQ9ATTGaPavMoujr+PfIPXRm2qSyrWLLwqvcAHm3CvT30=
X-Received: by 2002:a17:90b:2709:b0:39d:fcef:e241 with SMTP id 98e67ed59e1d1-39dfcefe940mr4015315a91.2.1789450868534;
        Mon, 14 Sep 2026 22:41:08 -0700 (PDT)
X-Received: by 2002:a17:90b:2709:b0:39d:fcef:e241 with SMTP id 98e67ed59e1d1-39dfcefe940mr4015282a91.2.1789450868135;
        Mon, 14 Sep 2026 22:41:08 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14390c0be29sm1589960c88.9.2026.09.14.22.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 22:41:07 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 22:40:51 -0700
Subject: [PATCH v2 1/2] Bluetooth: btnxpuart: Simplify nxp_recv_acl_pkt()
 by hci_acl_handle()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-misc_fix-v2-1-6178d838c946@oss.qualcomm.com>
References: <20260914-misc_fix-v2-0-6178d838c946@oss.qualcomm.com>
In-Reply-To: <20260914-misc_fix-v2-0-6178d838c946@oss.qualcomm.com>
To: Amitkumar Karwar <amitkumar.karwar@nxp.com>,
        Neeraj Kale <neeraj.sanjaykale@nxp.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        Zijun Hu <zijun.hu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDA3OSBTYWx0ZWRfX4R/QZBQA1uKS
 IotlIf0c6Luydn3Cu086wPsi6N+/ctTldubGuNKEsds+3mYR+l8XS5fJBToZSmiGn5oYEbG675t
 qmqELz6cLJBc4vm3DdlUVbrrfGyzr8ubVbkJbmju2c6k7TjsDROh0pyP42721w/G7Dz4EL93Eif
 6EZ8oJgeZIbL4hFfZRZBjgEyysJxuQyPdODUp6rUiFsJVuGQlXod0+QmYgrT4DC7ott7ICN2avB
 VwgU6VmDs+hOB9JLU16JZ00xdJ+WUwAH5JJwu37mekhA9VAfa9/sG/zri80+0Rec5DN54lgI4T6
 yGGrSSdjrohNkcxhj/Vjao4XdYem0meitOHNRP26t//DwbFkifZ92zfYF+c1U+vSzIJziMHmnkk
 LjFXGrg2pMj1SoKPETaQ6Y5S9ZykRrbgT5YT88XHitIY2RqZxdKZ0ynnLRXDXsoNB9gyihbUYEd
 tHMekd1fGDnfMCKJvmQ==
X-Proofpoint-GUID: SJ6LLrmNb6p-LE5CV_Tzaesrxhfl1uLe
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDA3OSBTYWx0ZWRfX4PGFtRKiD4Kk
 9+wWdxBwMlyI/wDfZC/MsSr8uFdRwzPSzGExEwgmGRSc3xunkaE0XuscxdYgw8qXaycOkPLI/Zv
 OIZKgnwZmd59pPpr9dbF5nNaGT2J+0Y=
X-Authority-Analysis: v=2.4 cv=fck4WEQF c=1 sm=1 tr=0 ts=6aa8da75 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=k-9T60deko6e8epjNngA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: SJ6LLrmNb6p-LE5CV_Tzaesrxhfl1uLe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_01,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150079

Simplify nxp_recv_acl_pkt() by using hci_acl_handle() instead of:

__u16 handle = __le16_to_cpu(hci_acl_hdr(skb)->handle);
... (handle & 0x0FFF) ...

Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
 drivers/bluetooth/btnxpuart.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/bluetooth/btnxpuart.c b/drivers/bluetooth/btnxpuart.c
index f2bbe6e462aa..69e897444112 100644
--- a/drivers/bluetooth/btnxpuart.c
+++ b/drivers/bluetooth/btnxpuart.c
@@ -1400,20 +1400,18 @@ static int nxp_process_fw_dump(struct hci_dev *hdev, struct sk_buff *skb)
 
 free_skb:
 	kfree_skb(skb);
 	return 0;
 }
 
 static int nxp_recv_acl_pkt(struct hci_dev *hdev, struct sk_buff *skb)
 {
-	__u16 handle = __le16_to_cpu(hci_acl_hdr(skb)->handle);
-
 	/* FW dump chunks are ACL packets with conn handle 0xfff */
-	if ((handle & 0x0FFF) == 0xFFF)
+	if (hci_acl_handle(skb) == 0xFFF)
 		return nxp_process_fw_dump(hdev, skb);
 	else
 		return hci_recv_frame(hdev, skb);
 }
 
 static int nxp_set_bdaddr(struct hci_dev *hdev, const bdaddr_t *bdaddr)
 {
 	union nxp_set_bd_addr_payload pcmd;

-- 
2.34.1


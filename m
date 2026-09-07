Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF83F446C0C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770761; cv=none; b=t+EeLuh3WLZjd3qQkI/CPHm9biOcnbFWzHpcguzjZVV8bCJpL1U6+lo814k5r1vp0FAT9weD24tntPCFE5akTQueg3NwR/3HGDqxLK7Dj12a1gWIwmriskgsJZM3kJIQwgLn/3+jPvyHIsnmUXDO65vNmtuPchhw/4YUAdWm8+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770761; c=relaxed/simple;
	bh=3QuQQakF3Zi22G3iYl7aYfWmFHhSS6FeB684lImThr8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UHzlv34/SC7JAxDhQ4ZRv0LkcN/aK1AmluaTvCHVYODFi1cVDnFc7m63GoijAoAR8YN5/OJgX6JUr6KQZtl5SJiEkw5VqUdKGfsGwLHiuT04AduNfYbxoWsrMA4OA+HLTjaHK0puSgLOIWJGEaTGUpNyF56THtCgXXc2HjOnFZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FvMlEuna; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W7Avl9Ee; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FvMlEuna";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W7Avl9Ee"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777CYj2838509
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 08:45:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Brs4thZkb+ADUJ9KGOCW0Dja/RM97Wj6zvjTE185qk=; b=FvMlEunaU7Qa1/ad
	n8TQ150Cpe4L9m7E94E6cR0IW9BqaL2AvWiKfd8EiWoLzTMDP1FNLxmkCEhp6zRu
	6sc23q35brr5mn5luYp9AezkVST9w60CfcfCK7mlrA4bxHuGYOwx8EhyaNNVjNEt
	DQ+IXsjtyjnI/9JFSL41OsofUdITzxWlS70eakjqiri9pzvEW2lUnd4yyCUtAPOT
	YFlXzmBEcqNzUUKq3U47GcKuNCvl0bm9OmPxMTRtXcV4XXgIyQ+cQpILVwdAU/Kv
	3bFHC+Povb0uU4Bip7RB4qJDRA990i2UlmtFcWrbGdeV1cTRNpSRvSBlns8wJ/JO
	kxRpjA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggbuep1pt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:45:58 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39924189378so1094972a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788770758; x=1789375558; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Brs4thZkb+ADUJ9KGOCW0Dja/RM97Wj6zvjTE185qk=;
        b=W7Avl9EeiUE9t9CWvsdSRJ9haJJ4PS7QpTLNDuzEiuaMjUDv+aKXI9JmbxDiN4/pp9
         hik6MgsGy4Bsp4LVHbx/1T+NQA1fYzfcFv2gZ5hIgB7Kvcn8fjQzPwWGxek7V3x66xJv
         ZMAe1l/RSsTPIJOXh1ukCX+isGaT2VcAzk+ZJOOEz4u8o2+tI+uia68cilVqDo49jI0m
         LfAKuL/yFuNDMFrj78aMgvJPzbzwJIZwGMjqRtROOnDck03Pclsef30oTJR28DanwErv
         iikq8KxUHgDrhJ1rqYYpHvFh2EBkVsZ4bQUCkQg9ANHEBK+pstTQ2r4PrFIavzf2/dxh
         pEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770758; x=1789375558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Brs4thZkb+ADUJ9KGOCW0Dja/RM97Wj6zvjTE185qk=;
        b=i2ZhkTbZwckvr+r9nHlUlkqHL+68SZSPGoCvYe35kl1aLCd//m/V2wYzRJ9TyNZSZR
         KGAiVoyLufAiNUO/15tbGtcvaI7PVMK7eAIm+x1NRoY7vxaWtMyeKEcNAfVCIi88wYHq
         hU0kd/ydDO1oXaU6SmaYAY0l21Yl7XT/Pd/19FCj8APrQRuMJYZnaWqyyYbilznoUnb2
         2AelU5JHsgRi7k5GiC22zStywbz7kBVEW7t1xScHuuEKq8hlZdKotP0WS8d1ZS3Ovg2W
         rmOKA2OdPJZOdhQfT8C0wUJ6SH+XgoUSk1EZf9LvJeHIZ6TpffvhKUdcYVuU+1hv1BWX
         PSRg==
X-Forwarded-Encrypted: i=1; AKwUvBzKCVJqn/OmpnS2QA7SKGbWGqgp2Uk6dVmVB1MczHoxOeQ2PFSvr4WaugmqABDIp2iGuZpyKZDabLaKCu4=@vger.kernel.org
X-Gm-Message-State: AFuF++ngeWe6qxnrAosFKSMry197j80V5fZctMif1IU4scHzQEjl6GZd
	FAd0WjJkQVOeqV+N+osJkOQnYDK4eR4VshF15rfL75jW0TCEepeSw8MyQDvwTUTWKYy6qtV/UqQ
	T33iLK7YdTvk+bw0JbNnyUrA4vL973DasyqVm5miDmasWYkJIxLO2yCyf04AiEpwOCes=
X-Gm-Gg: AYBFou1TSRrndn1YeBvwX5+RWHO2vvfk6U+u7Nho9NVCEXxToPjqeAGKF8CM6p7m+Dt
	u5CgBg6ke6Ki1HocNcVZ4L5wTTaDdwLLLYC8LCbPfT59GG0Gogoa+vYNWwkpHLzc9eSTF+zzhQL
	ELok+rOK6bRDN3+n539JNoxV7HTqOLiDZ31dIK/CzjXM8YtfvL5FD0TA+rGyQUYR8ub0dyDsrd6
	/udwnyR5ThYFNRsGxhxkF6QkD6ewZota0ac8ryGKqSFp9k3w67wtbFztxn0iKM9wMwBvQ9weVaf
	kin0oDuWEsyopDsUW1giG1fZ5+AHkbSB19g0mdFKVcnqzdkB9LZRBvxv6Qigiy6msaBl50VstdV
	CQa1ZuSwmZXLOfK2S/YDHgPzPWu1tHX6nlyA9gdjrUKnrWm8=
X-Received: by 2002:a17:90a:2cc5:b0:39b:64e9:2510 with SMTP id 98e67ed59e1d1-39b64e9607amr3833185a91.4.1788770758045;
        Mon, 07 Sep 2026 01:45:58 -0700 (PDT)
X-Received: by 2002:a17:90a:2cc5:b0:39b:64e9:2510 with SMTP id 98e67ed59e1d1-39b64e9607amr3833159a91.4.1788770757610;
        Mon, 07 Sep 2026 01:45:57 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243f780csm23622117c88.13.2026.09.07.01.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:45:56 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 01:45:40 -0700
Subject: [PATCH v3 3/4] Bluetooth: btusb: Build the driver from multiple
 source files
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-btusb_qcc2072-v3-3-1f65350b03b8@oss.qualcomm.com>
References: <20260907-btusb_qcc2072-v3-0-1f65350b03b8@oss.qualcomm.com>
In-Reply-To: <20260907-btusb_qcc2072-v3-0-1f65350b03b8@oss.qualcomm.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, Zijun Hu <zijun.hu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5NCBTYWx0ZWRfXxepZ1SigiRtw
 SUdXDmXajwPYMTo13aa3Oz96QrMto7WrD3f6bKVja7Q6t8iE6yHfpkTmREbbmp2QUkxgUzpC76v
 DxVSOgFUIHDqOi/In108JxF8ti8FH3zLFa8WTJgZOnXGK5juhKediYcBQMITN4kPGsghQXYIGh6
 SiVcQJsK4ngt8C2hbl1XZSYID4uFzy73LOteiPIoIpP+BbtqHNd6HnV6L3QhQWs2RwUeyFxsgsj
 iqqzgu8AU51ip5G1+HQ4hCC3IylVwOTUOs/N+cu8Ruzy8iG7pQaIZgZwMMzX6w9WVu1xe4RlTVB
 E53eU1Dl7Th3SQYX4rzgn/vQbc14gHJr+gm+TVEPTH3teV+LdmGcPL8ODf9rU8Apy26iMRmq4+M
 ZTpDa9QLwhHZqpsb5x6TZ2dIHESHfJtx+hMC3IhmQda2peOeiorkNIHXzizMfeTpSNnZNC/lRyi
 Hear/sCtr5J81gXphDQ==
X-Authority-Analysis: v=2.4 cv=P8AKQCAu c=1 sm=1 tr=0 ts=6a9e79c6 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=4J4qWk0Wo-fRNhQ-KTgA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 0hUMIfWiBBBhxzRBWJ7cbl8VNLWrCKlj
X-Proofpoint-ORIG-GUID: 0hUMIfWiBBBhxzRBWJ7cbl8VNLWrCKlj
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5NCBTYWx0ZWRfXyxzndj+A1BTt
 PInvrbJOjAVyMz9pcdGWP8FfLX7TXjqitKeEZjoYaN7Lsz4hBm1q32at2JwrMVopib9ZhmR62OA
 iFEHmafgwAKmmL27aqmtxZruacpZ0pE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 adultscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070094

Allow the driver to include vendor USB-transport-specific source files by:
- renaming btusb.c to btusb_main.c
- making btusb.o a composite object

Used by Qualcomm QCC2072 support.

Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
 drivers/bluetooth/Makefile                  | 2 ++
 drivers/bluetooth/{btusb.c => btusb_main.c} | 0
 2 files changed, 2 insertions(+)

diff --git a/drivers/bluetooth/Makefile b/drivers/bluetooth/Makefile
index e6b1c1180d1d..8b436c6de8b7 100644
--- a/drivers/bluetooth/Makefile
+++ b/drivers/bluetooth/Makefile
@@ -46,9 +46,11 @@ hci_uart-$(CONFIG_BT_HCIUART_3WIRE)	+= hci_h5.o
 hci_uart-$(CONFIG_BT_HCIUART_INTEL)	+= hci_intel.o
 hci_uart-$(CONFIG_BT_HCIUART_BCM)	+= hci_bcm.o
 hci_uart-$(CONFIG_BT_HCIUART_QCA)	+= hci_qca.o
 hci_uart-$(CONFIG_BT_HCIUART_AG6XX)	+= hci_ag6xx.o
 hci_uart-$(CONFIG_BT_HCIUART_MRVL)	+= hci_mrvl.o
 hci_uart-$(CONFIG_BT_HCIUART_AML)	+= hci_aml.o
 hci_uart-objs				:= $(hci_uart-y)
 
+btusb-y				:= btusb_main.o
+
 CONTEXT_ANALYSIS := y
diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb_main.c
similarity index 100%
rename from drivers/bluetooth/btusb.c
rename to drivers/bluetooth/btusb_main.c

-- 
2.34.1


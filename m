Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92864A1DE4
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789050952; cv=none; b=ndRrx6bbwfl2DVr+E1g7qOihOG3eNGUp2q+QN7RAAvtqw8qKiVOvopn9IVloFSZCK7lSn9jEHVf4m4MkPIweBH8DWCpRfdfmDSymtd00lz9XGs7RfqYLcYb85OWKtu4jjpkZoZXW40trEDJJwgQ1LuJDbmvNV/NaBmF4BErXnTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789050952; c=relaxed/simple;
	bh=3QuQQakF3Zi22G3iYl7aYfWmFHhSS6FeB684lImThr8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=krXjZ6zxjCElPquT/0OzsvcUZNe/SBVADm6kR5THoMwtkAQdhAtDlkzLWNm3m8kL0kVd8R+5XdmTjTYvZaNTWe2hxq/ogmO32Av/R8RLm7i6s9i4LRkdr2FcW+PgnZT2oLyDgadDELwv1m0hD28cbkd3oZcxtvlBYTXHCT9USa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SNF8LgqM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XqaO/ULA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SNF8LgqM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XqaO/ULA"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7lI6245046
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:35:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Brs4thZkb+ADUJ9KGOCW0Dja/RM97Wj6zvjTE185qk=; b=SNF8LgqMTTS7i5vi
	OMhUdQSVbLmHTEThGhFnpUk+5oCzpcsUcBkRj824tQYn4p2OCEj+yaXQnvtsTzxY
	SMQdygBlT5Ata5Oj0bJbmx9v0VuthEazQrLK/tFfc+0AEwoDjlJ2mysf6b6NeKv1
	YlwI1lvbx55iJ6UngdUOvjgZFdizIeF9zNkv2ttvEe48r+XFSEaZ/7Q+o2/Yl216
	iKXwG4VtJ1mg1S15Zy7USy2wXSR4ShNIK9pg0kKqopf4KNMtWGXkj0OJMEPj5rAf
	dNpt3Mh/5FAdZHRRGXPHYhtCSa17j2spC2B/ndPVnTcNRMt/UPEhysTaptcrX4/r
	fTRHwA==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyfmh7v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:35:48 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4bb359e69e8so187257b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789050948; x=1789655748; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Brs4thZkb+ADUJ9KGOCW0Dja/RM97Wj6zvjTE185qk=;
        b=XqaO/ULAkL39tJT4R70E2KcpHI5a9KrvpY/oRzT0X1H/ka0AF0eRO72/9btG6UI97L
         f6yrS6PbH+4jXVvD4BBV6hbK2wNmv3qwYD8kKWN/DBuA0zkUTrXST3vHUHQeJy97p74l
         3ldrqOlq5r3rxVg3uz9RcDQerbm0ZFtE0zf9B18j7VwUuREPbNYe93UvObLvnZzYMfY3
         hc/hp9c0NDpaxSAQds7Ok2EEFbXEnpDxQUMQ5kJdYrXrvyH8cxafzXECLooLlr8npNn1
         RJqQ3ackvxQghTgJDbXqBctcTrPFlRdLml8mj8oJrxIEk+LT0DeSqA/bnSmO6cDIdc4D
         jmig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789050948; x=1789655748;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Brs4thZkb+ADUJ9KGOCW0Dja/RM97Wj6zvjTE185qk=;
        b=pkpx4WW+QnldwhFYaUA70WV0wBokjnBx1b5a1smhnqSLHSLnT7LTwyk/VswtoUft5r
         qkBWa2vJKhcCMp/IlbBpOOvJ1pmojcerbFEek/T14xpAG0ruCUHV6FrtE00zILh4kOyw
         vW0G9AXsCJeWccrMchtaD3gLdSNvKcPvspOMC2MQkfHa0xiiy7qBO4r8k3UXNCKcRexX
         qPcPXjOI3iwZpmhytkp/t/QV3BDsTQ5mxfVEpx6bPlB1/nwHS25OwDGd8DIX8v9gVOKK
         t18RGzLYVuB4c58q+43SZArKRCXq8tvFDjiDDUgyUcZQAvOtqyu7FCXwwHMsHgNATDsN
         uzNQ==
X-Forwarded-Encrypted: i=1; AKwUvBzczoGh6RrtDv7NoZZPvVnzdAy6JOXBR3mw7TdpKFVqpM5+GVmUEsaSzAUHjsQzhbS+bBLfSDo/7CxKBMM=@vger.kernel.org
X-Gm-Message-State: AFuF++n8y0zBxyLcQ+Sj1PtLwwsvB5Zdn1NGb40JQfrO34iyJCQUZCP6
	HuRHHidMLrWtuK0ULi4uoJR4TF/gSCz1J72S5PaaC4s3JGiMRE9842NEQ7Cq52XV/b6afIVZy49
	D/yTloWJCnfZ5IPh4EE32Pxn/1D/FeDt11dIvPCxwSPF3wvrgiT+gnGIXJwFojnw9fxJJ9Wt2kk
	8=
X-Gm-Gg: AYBFou17JdjKEZLNg/75BgNpdFsGN67QS9WVePsQ6pvyt/mf5/+8HL2GySjvSHCxqFH
	Qen5KRLD3/dwwAKRIZtoz2uvVJsdvzo9j4P0pm25Hi7B8zXfS9erY9B2PQyU/g2UNRGPIifwTfy
	K4iEII+cP2B/Kz9ySszcHnfgXs36vbSVz33f2OTl9Su2MKX/nzG5SjEFv7fqx5utLrCjyNWRHZN
	adrVMAe6J575V9vlX4rVWAR5djwgrZZatj/lNuoLaHVlcZmfH+/ZKh6Z7N7YuIIyC4cDXWlAIoG
	U55hXRUh+s7bg4rteO8SdV+hJQcCCZvWz69bMNwdXEl3oLlfGZ6SMDAExFgpPzdssUdzQ8jIh4q
	enPOeDiTYMdSSX98vHXdJ5b4hhJWjf1ctWJaJlse3jyY7P0Q=
X-Received: by 2002:a05:6808:318b:b0:4b3:749e:3299 with SMTP id 5614622812f47-4c1b88b9ce7mr2916446b6e.4.1789050947672;
        Thu, 10 Sep 2026 07:35:47 -0700 (PDT)
X-Received: by 2002:a05:6808:318b:b0:4b3:749e:3299 with SMTP id 5614622812f47-4c1b88b9ce7mr2916426b6e.4.1789050947248;
        Thu, 10 Sep 2026 07:35:47 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b971246d9csm19056119b6e.7.2026.09.10.07.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 07:35:46 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 07:35:37 -0700
Subject: [PATCH v4 3/4] Bluetooth: btusb: Build the driver from multiple
 source files
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-btusb_qcc2072-v4-3-e78f04b7675e@oss.qualcomm.com>
References: <20260910-btusb_qcc2072-v4-0-e78f04b7675e@oss.qualcomm.com>
In-Reply-To: <20260910-btusb_qcc2072-v4-0-e78f04b7675e@oss.qualcomm.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, Zijun Hu <zijun.hu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE3NiBTYWx0ZWRfX6yMrkoGNkW6N
 +yqOkYpe2Kf9kFchn3bxZM89w8EkaKiemaaNK3GbYoO9xbDPqT8wxrs2CLEyzJo4o07CUcinrkF
 lhBcDplSD7/TMEX+Dv5e2++yu+Xh7sI=
X-Proofpoint-ORIG-GUID: oAtWlHCa2wBKw3BO0G6s6PBD92MxjMLe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE3NiBTYWx0ZWRfX1XIU6Y66m9PK
 LY7bQRfkKj0XdpSrxM/IPF2u9fmAvNBF7u8lXNJ5+57KFXASFsVB4PrD7oLrislgnBreNM0WU71
 vDFxCrvAiyQdogXckeHMD6fOVphPJIxmxgXhs/vGVpbvqNL7P0N4CFol8LEmDLEIS2uIDbxWb0a
 8iwCQm99+KW0hwwGFnaBmX0nhinp03t/BrjtdDVgnaAY+TirBd+RmpseXNYOnGUmxa9swJZSEBO
 YSD6UF7vO4ut9t6wvGRRCeD320FYfBqmUo48ajOsFPpBueZFOstvq1cdZ/zPmL1eSlgGdL04KFA
 UpzzhseHThP3RzjWdFy9Wf5vpogHsVgWgGOlol5SkbQACT80sgHfNUNgeTDaeS4mPvWXU1TELpa
 OLDLtf7kZ2E4Zhd0S1sKVwiz+Fa16xvdlPD0cHJDuF9QDkXKO/x2GUcgfwdL1EofAvPZpuZGaqX
 LUAxYTY00A8Ps4hTDXg==
X-Authority-Analysis: v=2.4 cv=H5pOUOYi c=1 sm=1 tr=0 ts=6aa2c044 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=4J4qWk0Wo-fRNhQ-KTgA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-GUID: oAtWlHCa2wBKw3BO0G6s6PBD92MxjMLe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100176

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


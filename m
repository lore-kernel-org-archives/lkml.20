Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792508745;
	b=sBQubaqiTdR3jEZgpP+J/fJBw17fOGnch1vmmDqyDOvr7cmiWFIPgb4Q0TTVxCVo4iEr
	 VBGxH8aGYRaPmfvHjH6z4155q6EGUDgBghVyyA1abHl9FanszNa4Plyon+cMt6CKum59G
	 geDH7uVjXpM43ZDVaoat2kZpshioHDeUPN/xMdA16vpPqom8DlBf2Bi+FKyfKKZT5T8Pl
	 RyJkIrwrvXHidZK5rf0WFZQPF3g+pXmJyWMZ/xzANJF4Fs7m7ADvTzvDOeIeYywfuDyFN
	 BPi47NswX0+8GSln/YUSlJxF/RJGm0k7AfJMqD2CmgwPOHrdOJ0y0hHj81+8UFMRzcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792508745;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EWJT/LZ91KZcU9yRbx5HYVK03kKWvI4hKl6c29Ki7JM=;
	b=PKZAcJiD3Dr9iWl5jqkI4sxSoKevDwfWIqpQmRnW+w6fjyTWkyt5hhPh5TjJEd/QoWFE
	 gd9AdS/L/SsGfAXlaKMGEyMHEF7DJQwgt/gnTcovy32GqSA7mhosNpkBvU427mBiIC5MP
	 OAl9mrQnkXQfXCAWm1VEhji3wBaqqJO0TZps6+/sNvsOFl56PWptZeuWkVbU2e8TcqfBX
	 xlH54LKVBnapyiL1Fy30m2ahEztGJZOtyN2i3rEi4oHaZZt9RG9lzRnsyCaIrTH7v3QXx
	 hJqU8ys4qDeHII5U1gCCBY3HyI+BLJQ9CpVWUi8Shgok2P+kNZyAjwvnGpvgWiOPr+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LTK8bzdw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bvSMQRjX;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45021606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:05:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45021606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LTK8bzdw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bvSMQRjX
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDACXx1429965
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:05:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=EWJT/LZ91KZcU9yRbx5HYV
	K03kKWvI4hKl6c29Ki7JM=; b=LTK8bzdwSt0YRkQGJq+WVVPnWEagWsC/SmEqOO
	ZuJ1kocuz4c/EJtbSQd/lTetMTK6yPggo8bHZinU6afRhxYX6HSVRnHS+60K7Ia7
	16+4mdEp0ZS4Q7WOv3Ln5Dq4J6UiXY9F5+GELvECumt5LtlKeorvHYpd4GJvpokX
	P6+x8x5mLGpvpIu74tVfeulKVdxGccNsnwX7ikl2tyjTk30yqBGSZR9t4fvxNCcf
	oyKYg7Vnl3oXjdF+D9UxZAEFJ/kPtH9pDnAzdGV4wfLUk/25sPWOA1zQ0zsB6aqI
	5vRKavVLLoBoTo5MAqVySeabhSUWbX4oNPzYevNPaZPLMkRQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5qb1ps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:05:44 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eacd73e83bso84426e0c.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792508743; x=1793113543; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EWJT/LZ91KZcU9yRbx5HYVK03kKWvI4hKl6c29Ki7JM=;
        b=bvSMQRjX4p195e04tvfCwZlf8OffqVuyV2Bp9rN58Ikjh42Tq+RtQWNGOOUA+iYaSh
         j9ceniKOzM1iyWE9GIfiq54qS31odo0EoN+PgzCpCZMkPRPoa/LhMG2VQiYEWJn66fQn
         UwVUK+l5TZFUUaFUaJrb7MAcfrlM8Cr2Z7/mHtK9B4pflNfJWAH2FOFF4pOAV4KxEaKv
         ihabU9Mim0n4VUM1LEdIWpKP99XWRvCIbqpPSSlDdeiWdOfCQ3XcmcNhHt5zTmWcIJzE
         DlfJgKsNpfIhl9L1jDClE8hjC7Jp0q6aiQmyuel4NCt6Yi+QvYYwZz4QYv8WeWbczyuf
         aK+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792508743; x=1793113543;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EWJT/LZ91KZcU9yRbx5HYVK03kKWvI4hKl6c29Ki7JM=;
        b=04t5dq4Tl26wW8bpKU8JJ4Yc1IHkhlnPGBZ41f8ew1kcne3QnQ8l7s2q9pBw5bCfqg
         3fkmXJO0k+d0vPadOvlFFo7E0Z40O2CQMDE62SxNT5br3JyHbtDmBXdMB8sPtVMihbpv
         CuaqCaVtA+M422T8aQ0ULkOe/nCYs81FKkZIj9O8CZfd1GWqYqz/1lzeMZt2WigYBdjy
         t7uT6vZv3OMX7VeQbvLl33QGOaqbWkI+5kl4CtkckfYnh3xBavCJxxnBv5URLP8FGZZ6
         4UX/EfT0MN3DeINS79Ix/iJYOPPf7Ct2AviT5wU8+zi0rLRTczJkxjIXcs/OB7X+TNSi
         ezDA==
X-Forwarded-Encrypted: i=1; AKwUvBw7PyIS6GX9bsddzyZ/aI4EAb1YfklyZAdC9Cw9Gn9sc5BSlseV/gv9zi/P4mPcMWDXbOKsYt38SkUH0+k=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQk96WtHj06hudKccpeJs9IxQA8YYLi2EWtV3dZx+BP45fKjrK
	rmrbt9bavEHIeEEoT1EXEHfkSoOpedUG/dc7479vOrZdnaAdiXNmvJCTYf6EeenF1keOPViiV6+
	alVzmDza7SKSru2X0QoPWb20MoqW+g6XDHlP0BXSsrbGIYbRnUiTyezN/pujmuXDzyTI=
X-Gm-Gg: AYBFou2XLgY1GWPFUUIQxAQNowM1eq6HhtEBaESkZH8zQEMplmK6okynbr84Mb2BCQs
	KRTWB1QIsPuD1oNgllzNWUhh+mZ+eR34taCSKw18tVulR6qONvfbsccI5mKkhuihioDHiXQM+aK
	lzvbZ0+3G3acmW5X7AEgao42U5XNxvWtRH8GG3tSr4AMcSxQDeSTzUzd09OIzWzZzTtpwmdhCcp
	7S/qNZXZRq3D5dBMGGmMJlp5u7x1N+OaicXPQ+LzGN0LKJvLHZd0T2TwmoAzJj1Pi4AIT/fpqZg
	S2oniW/dwh4FPEBdhxPoSjQL5yVqr2WYTzrBeJyFw8ZTgqc+R3TQ6HPdDWsD5UhNzABb55Uhu5+
	nFcbZY931CSBuC+X+HHi0c50NHLVW0bGV1Q==
X-Received: by 2002:a05:6102:418f:b0:7cc:32ce:4c41 with SMTP id ada2fe7eead31-7cc368f207dmr1898153137.2.1792508743303;
        Tue, 20 Oct 2026 08:05:43 -0700 (PDT)
X-Received: by 2002:a05:6102:418f:b0:7cc:32ce:4c41 with SMTP id ada2fe7eead31-7cc368f207dmr1898131137.2.1792508742853;
        Tue, 20 Oct 2026 08:05:42 -0700 (PDT)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:2178:c9bb:4cda:9f4d])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1d66d6sm5168567a12.23.2026.10.20.08.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:05:41 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 17:05:39 +0200
Subject: [PATCH] usb: hcd-pci: avoid double disable on surprise removal
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
Message-Id: <20261020-topic-hub_pci-v1-1-bccdaef0344f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEKD12oC/x3MQQqAIBBA0avIrBPUoKyrRETalLNR0YogvHvS8
 i3+fyFjIswwshcS3pQp+ArZMLBu9Qdy2qpBCdVJoQQ/QyTL3WWWaIkPojXaSr3J3kBtYsKdnv8
 3zaV8v4KLHV8AAAA=
X-Change-ID: 20261020-topic-hub_pci-903b8c18d17b
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792508740; l=1089;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=KnCWtDRZNJ63UHLvRCKMA8r8EZjb3xAjvrVzr2DQjO4=;
 b=HtVuHL+v3Qa8UycbGzkQ2/PowbyoV/uCjKLhN4rPCUlCYZ3FTIB0E8VmA7Nkv1rRebY6IGWi3
 DbA3nFdcf3CCUTVQjY+meJ/jJJ+QXYWV8xH9pUaFuPSbc7xJe2mLyl9
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-ORIG-GUID: KLT0KSBUtihfteT4zQiVJe3Mic2uajTf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA2MCBTYWx0ZWRfX0R2LO5uENbls
 w2G5qHO2zghgi9TaVEtZ8XmqwGcewc6sttnPzdCxbn16jQtMRo14s1Spd03Hxok5+/vgSmaAAWn
 v0QAmBoaQGI3vkeIaIygasIpWxHRIWk06R+/au7Xv0sKfgOvln1aLmKThIqm1n0hnXtYwI+qJe5
 XtTB+sGAGO5fSSnWDVqttBfzAr/z//YWrqC9Kj5SOMXNZZh8SmZp/wDgcPqTSnN7zPc2+WE5mi9
 /AiC2e9hMs96FWH0RERecXYcNoxsDCF3lRvjEeeRRuq9LcOdk/u8njgJjTStkIE3F5VcOruNXXR
 5QU0GXoIno336KdR/UHOS4UMaupMuT7SKbGZ0XAcxxR8l06Et17GrrWgqBsieKhWHTsTpwnER0U
 4wwv3N9NFPNhGyI5vyeIDiYDPRZHAPj48B3caAksbRe2fHiPavUnmGyp22N3/fk8iLlfjZJXsPj
 i0k+uZ0wdDn93DGe2qg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA2MCBTYWx0ZWRfXxfUOwpwFDlvd
 QWvpgk49MoQJ3YI9/NoRxR8gwkjL4JQNgMrwLWzb/uX47eyAu01fIig3sWKyaxXiLv6lt2Gyd6i
 UjCjp/L2+JbcWfhbVovcBYe2G7P8xzU=
X-Authority-Analysis: v=2.4 cv=LpcHWXdc c=1 sm=1 tr=0 ts=6ad78348 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=Y30hiCGzOIVvoHo1-qsA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: KLT0KSBUtihfteT4zQiVJe3Mic2uajTf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200060

A PCI HCD can be surprise-removed after suspend_common() disables it
and before resume_common() re-enables it. Avoid a second call to
pci_disable_device() in the remove path when no enable reference
remains.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/usb/core/hcd-pci.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/core/hcd-pci.c b/drivers/usb/core/hcd-pci.c
index cd223475917ef199511311eda5c6aaef073b0ad4..34c4d352b40c40c54cf17c30fc264833ba05bcd6 100644
--- a/drivers/usb/core/hcd-pci.c
+++ b/drivers/usb/core/hcd-pci.c
@@ -348,7 +348,9 @@ void usb_hcd_pci_remove(struct pci_dev *dev)
 	usb_put_hcd(hcd);
 	if ((hcd_driver_flags & HCD_MASK) < HCD_USB3)
 		pci_free_irq_vectors(dev);
-	pci_disable_device(dev);
+
+	if (pci_is_enabled(dev))
+		pci_disable_device(dev);
 }
 EXPORT_SYMBOL_GPL(usb_hcd_pci_remove);
 

---
base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
change-id: 20261020-topic-hub_pci-903b8c18d17b

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB9E3F8EB7
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787915649; cv=none; b=NVekufYk7te1ygje1KMPejKBhEoVdjaQM1aj0UIHDq5Q5ADLe2Td+vLMAYrTrSsRLEg8tJrADp1MW+S9Fg4QwiWGTU9XpQbaI21Z2/rupuhZUK0D47AkeutBWSFExWxF7af1kmODOfIYPLpfSRiY+7XKvpOjl+J3qU51kW8RC7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787915649; c=relaxed/simple;
	bh=x+iLPxSxz/4dz/phQxlkbvpBWoeB/hI/TAcfJpKaygk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UneFQ05GiLaly/6vnAvIr0+YJ/LEarZWWqjKdV2RqjKtMTGvHsPM11e6yCJsPdmlVKfHhZuyJEBvGRswjoZz8hIQ4paik/KnKmePcSplIij5QVSzWowhxbtwJYACxY2wATzp5dYf3CV5IYb2CgvAG7aHeWigNvIzqaJECjQ4qHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TflBbp9h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HKh1+Ntd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TflBbp9h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HKh1+Ntd"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA8M0k2798408
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:14:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WIBvrWmy2BOm4AoI0nXroK
	GVyOJUm/0pcRzlfNy+yzw=; b=TflBbp9huvEDVAqatSXEiwCMLO3kwGRqES4v7R
	StBDPPexKaUQXjzAqq9U0ZNTdOmg+sq6ElZHxRphKj0GH8ba1Q1dKAHSsOVDgzks
	S+ghGKyvPnPI+gU7SiKvEkpKHLDQ6AWUmVCjpS7EPSi7tb8ykEv2AFGjV5ySobyK
	7TKB4EsARfE9RaRoONRaYqE0rEt859F/aNR5ygs2cV8U2Oqni+O29vUUrezMUiYh
	ttPixIXj1SFYL0swIqB3MuNkiL7d32VKeIkmBuscQLb0jOzHX8ztB+3ymrJUYM/N
	809AqGANq97Tqbl8pY93+QyHbyXuTvmHvPWuw3rikVjO58Kg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb62h0v4u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:14:06 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38fa7b09921so1804826a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 04:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787915646; x=1788520446; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WIBvrWmy2BOm4AoI0nXroKGVyOJUm/0pcRzlfNy+yzw=;
        b=HKh1+NtdzGDh1Lon+P5+3F5OK6sU6b4fUM1SVCVRPt5pLIpYOcYUMcEmwguGHuM8JK
         67lMHEQdrhw1L1tZycqgLyTtbTieD+wr4yuhbtk9MmEw7Cf+1aIghrVvyKXN4g2txlC2
         0Qk78VcexvQ1MZpp5O6jo9mNFycdifvYNhNGiqIpZBKoft7OnG96zUK+tyU/oAsHqTj2
         xgCVzunWVDXNj0gL+4PTSWYiu/V2zm9ujB2riu7yytakbC00LyusA7urJ2pUbtuLHjB0
         s/ekot9Ixj3hmHLTFMN9FZ1q94DqMzRDRJ97oDgOxOx1tlYERa8yQWm1I0iTen3H6lyy
         s44A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787915646; x=1788520446;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WIBvrWmy2BOm4AoI0nXroKGVyOJUm/0pcRzlfNy+yzw=;
        b=lwlUJJSoNQFNOojnuIjWlbr9QpjAk9Nn1del+kzvzYCl0z6n/rAgl7CRq3s1061Axm
         t8zjSGUKywAAP216mBfT2WXcCC1wpWOjqDc6Tq/ve0btU67wuWeLGNObsdI6kclJd3K+
         yovrz3+M2W+GtRINiNxBoUNM9LUqWTklHIeFi8sLLLSAZxBt9izx57NidGQIIvbKnD6k
         DAclnMPK6o+NYXeVYUicQ0MYnWm4BN1z2qaQLnxeCmjnNK8p+USbBrwB4ixgsdtfyWXj
         qZcpCeg7pHHtrmhxsj/Ke4D4PBDth0JXs0Ny1DJJmMu9GrDoJBkcryFANL02r1pTU21w
         ODVA==
X-Forwarded-Encrypted: i=1; AHgh+RriWjvbmZxp6Vm57CsnnLoxZ0Z+oQY4QRw0y+yiocs6btMYqAuOSot1X5BTht2qQ9r/CW8shXyLmYCt4QY=@vger.kernel.org
X-Gm-Message-State: AFuF++mV2GvxZi0EuMKDgM/bkz6QqQ1OP8I6at+P0+Ss+fYdO2lY73Se
	f4wzAv/punELbIpL+wO0ekEhXF5SMg/Dpn8aayZQtKcq8jKJt75nD3nlafTQKPm4Nq59pogpXbS
	uNQjp6/FU3g07FqNWmMQRsUyIzW9ssA6ZKei+S9IH7yrY18s3TVq3rYZ5bCWdwC/2dII=
X-Gm-Gg: AR+sD13MEsniRXpohlNsriBtUg9FjiskodUSS5ErKq8/XgoWiuzG14ApcqS4i++yZP/
	Lru/tBUlXB2z3NLJAtSGSrsz1yK+N2VVUyUzC/S0/QMPS28inx1j5hGbtoqOyYfawpBzSqCij3P
	s+IsZN5njlXPQQoV3f25qhFSyiLtvqcvu0U3XWsD/AXtgvUAuRujxzosL6mXFd9C0KpbPBJoRjT
	PGVh3LFLstqqJ6ZizzCFsEgNV/D2ZOG5h0O9aszqeScn1n8QQ7eB/YWWy+3uMiszeNRetfqei/2
	T7nUuyjIVN83Fvxj2RIhCmRZcQ4jCt+AEBq8Y9RpMJd+AOZOnGGk16piu7YI9mmhAwxnhuvadSG
	hosxuYqFO1DnaC2CLAdiRMlAZiWWV6bUJoTw=
X-Received: by 2002:a17:90b:2e48:b0:380:71eb:4014 with SMTP id 98e67ed59e1d1-396d0feda32mr11941892a91.15.1787915645984;
        Fri, 28 Aug 2026 04:14:05 -0700 (PDT)
X-Received: by 2002:a17:90b:2e48:b0:380:71eb:4014 with SMTP id 98e67ed59e1d1-396d0feda32mr11941782a91.15.1787915645493;
        Fri, 28 Aug 2026 04:14:05 -0700 (PDT)
Received: from hu-arandive-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f99585csm4470475eec.21.2026.08.28.04.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 04:14:05 -0700 (PDT)
From: Aniket Randive <aniket.randive@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 16:44:00 +0530
Subject: [PATCH v1] serial: qcom-geni: Fix port_ida handling for console
 and probe errors
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-master-v1-1-1f8afa5f82c2@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHdtkWoC/yWM3QpFQBRGX0Xf9ZkaQxpeRedisLGVn2YjJe9uc
 LlWq3VCyDMJiuiEp52F5ylA/ItQ927qSHETGEabTFtj1ehkJa8SsjqrXJLmpkGIF08tH++oxB7
 j/znZqoHq9Tngum5V3hVObgAAAA==
X-Change-ID: 20260828-master-3e806ba3492d
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Aniket Randive <aniket.randive@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787915642; l=2062;
 i=aniket.randive@oss.qualcomm.com; s=20260325; h=from:subject:message-id;
 bh=x+iLPxSxz/4dz/phQxlkbvpBWoeB/hI/TAcfJpKaygk=;
 b=l7McKXL3kWYdep3cqPWgXqVW4mDDzQjkGdLTSUBajRJRky9ly0fkrSdf0jrUhSDYZxkG+xqlZ
 hmnBdbwXQWuCC6Uy7bikIxHThAARl+GtoUeCDHElU93uto/RmXPpy56
X-Developer-Key: i=aniket.randive@oss.qualcomm.com; a=ed25519;
 pk=4o37X1ZqGbCO/T2SR8kq/HnWvq0yb1RUlFuNukovbQk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA5NiBTYWx0ZWRfX8UlArNTdCfBL
 kjntGHsFhgIxd4TRprGrwXID61wzWJ900KttipmBW2fMz7WT1jc/cDZtB3Ii6keEky6ViodLOhF
 np+2Y6AP0HAZ+cZT5oim7wR717UY/iw=
X-Proofpoint-GUID: oC4zhxYB6Ci4iKPnAUME7lytgw7Tn1Kt
X-Proofpoint-ORIG-GUID: oC4zhxYB6Ci4iKPnAUME7lytgw7Tn1Kt
X-Authority-Analysis: v=2.4 cv=I5dVgtgg c=1 sm=1 tr=0 ts=6a916d7e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=W6L3oTFDJPfymd7k00EA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA5NiBTYWx0ZWRfX5NOdnMOWqwnO
 94mAXbG5/kqUhkGQOW+Eh5REJZOsHNPbvrCCoYP7NKisr97ACetPZBQDmoBJWEmdbl2DpNuWao5
 +eRytbLdebJ4cnCt1DvdXJ5rfymX2je1tX/IV59LyjF2Z0NCSKBRN8eE2o1qmz+m41tVt4hPNzN
 +lNvl8Kh6nRfAhXz5l8YNoT+ybuGsOGjOZjy6mQtAusiQsbCzCxAFC5htsOMQL2v+VweJCVj80J
 2a/xMuouHKVONaHtFpqnx2yZAv9oxKJtWyvB8XbseilT0cCaHlr78DMT/6GT0P8OPf287GTaSO/
 w2+8fK0VvkywlPm69n3qF6Til3MrH+TaYW8tIG7yhtQ24HHfH97uAbFPQgBOUekuZs7J+VXjTUY
 Ri+nrytLG/mBZylaNzYha8jrvQfwkBvlogCMuhgxKhDKu1v/d11hN0FVpEkJTWnoHC3MQNwvY9U
 PUE2NDjWskU9P2d/PjQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608280096

The console port uses a fixed line number and is not allocated from
port_ida. However, qcom_geni_serial_remove() unconditionally frees the
line number for all ports, including the console port.

Skip ida_free() for console ports so that only IDs allocated from
port_ida are returned.

Also release allocated IDs from the common probe error path. Currently,
IDs are freed only on the wake-IRQ failure path, causing leaks when
probe fails after a successful allocation. Move the ida_free() call to
the common error path and guard it for console ports.

Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
---
 drivers/tty/serial/qcom_geni_serial.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 3633723acef8..3bfe597d2c83 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1979,7 +1979,6 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 						port->wakeup_irq);
 		if (ret) {
 			device_init_wakeup(&pdev->dev, false);
-			ida_free(&port_ida, uport->line);
 			goto error;
 		}
 	}
@@ -2003,6 +2002,8 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 	return 0;
 
 error:
+	if (!data->console)
+		ida_free(&port_ida, uport->line);
 	if (port->rx_dma_addr) {
 		dma_unmap_single(pdev->dev.parent, port->rx_dma_addr,
 				 DMA_RX_BUF_SIZE, DMA_FROM_DEVICE);
@@ -2024,7 +2025,8 @@ static void qcom_geni_serial_remove(struct platform_device *pdev)
 	irq_work_sync(&port->tx_kick);
 	dev_pm_clear_wake_irq(&pdev->dev);
 	device_init_wakeup(&pdev->dev, false);
-	ida_free(&port_ida, uport->line);
+	if (!port->dev_data->console)
+		ida_free(&port_ida, uport->line);
 	uart_remove_one_port(drv, &port->uport);
 
 	if (port->rx_dma_addr) {

---
base-commit: a8406e6c0b793ce0788019683837c40855b55995
change-id: 20260828-master-3e806ba3492d

Best regards,
--  
Aniket Randive <aniket.randive@oss.qualcomm.com>


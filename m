Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793894118;
	b=oEt41iwYaKzZpKLIqzIQep7aUgOb7Krc5RR+dnxNxKyeQ4aLlw8A/eBl9tayacW974/a
	 2v+5hGL59ZS6QrVtmJOpb4iahvPRTzH0er6LMnZ3LSrsL4K8FB9JHDxXY0SU+c3my9vAR
	 vjy8eQtl8mTLyV4Uy1NG3C8D9U44HQIY0dUwPMfRMyhDLc4pk25n/IzBbnmT3RfvEvmFt
	 fBwGjMT+cZGyq/fIPo6mwmEWpCX86GoUG0m1biwA8TcrnHaTh/um5l/iPuutJH87y2dEi
	 scJ7Twgs05Kov5FNR+EjyK5kwEwMxzzslqPa7Arm6qvNnMUjzahtEntOx2dl4v67hgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793894118;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tdKl+siKq28S91b9oYIgCcRRzZiP/IWdXCqV8LvsSrQ=;
	b=1IIriYAptrcUDWm+Iqg8TZvAScyGLlzfsiTf+T33VAGN7UsLrCAOc3r6pPu7On9Mm6bt
	 CP+Yk1WgGbOhaDYEiTzysxUYodtDccL73PiXfcGaeL2aKD8NpJqt4F33FZHrmza4V7503
	 D35cchQPyuEWbyWbJvzdLIUo6G/2vXEjv/CuVevQRAJeC+tgpwb2FSNaJani8Pl0UPQWV
	 w6bBAjHhcMbIjJ0FptyW6+cbKRwe0lFdMN0vMZ+Fp9TsWufLxz/Uhm2PnkX8QXUfC/Taz
	 tUgRHUe+VAyryKCNSb7f2kIYTQQjLGQvg++gUIwQ2veUedNSjLMqlOG50hYdZsmxb0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n3WfkUgW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AJM5Ggwc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA9E606CF99
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:55:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FA9E606CF99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n3WfkUgW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AJM5Ggwc
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQJPG2004738
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 15:55:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tdKl+siKq28S91b9oYIgCc
	RRzZiP/IWdXCqV8LvsSrQ=; b=n3WfkUgWvmEYw4O7jKdcsHY4KqK4Q2Eif88Wb4
	jvnjttLvCZLaTu5Z1cCVlw6beDjWqT/mayJ+sEvZ3OvOZFis+XGcOqNF/QAXbu9G
	JGPUn+I1M1xDx5yZi1+Dm7bJJJt6ixzeyQm6hTk9cYNGknFAFi8xE/Rj9SxZuw1W
	AKjPDU0DJ6x9FL8U/RQMUCgFI1ZNc+iFYNGgsDRaUG+6cwpRuwPY1NWJ73H2nF35
	PUQgKYOG9sY0wLpBFr6i4Sjw6N8vPK/xgA08Ez+DnAGgj44q/lqvsUzuXeq+9ZBP
	scejxph7V3O625FpnC2OGsasKH7zh/bquQb+pPNSXVd4U3bA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrqpd1fna-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 15:55:17 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9907de400a6so434862241.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793894116; x=1794498916; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tdKl+siKq28S91b9oYIgCcRRzZiP/IWdXCqV8LvsSrQ=;
        b=AJM5Ggwcrj/bfkV3iQ+pjZ0Q+dcApSD/aeaCrk0vHqKDlI7T+AbFbsBQWq7jyIJaHs
         XdNa2XXyKtcApfnXpGOOq9iPWEG3TQyq0a2UILtf1L3J0wgJLRUEmn6ZVlCE/Clco+4w
         cIo9vrbrm4rdxds/XEPI3UgYiL13gJHABwIDzo2fYBgsp7j376MVswfBAyDfI91i28R+
         E/z/OCSEhkWfN21oKIiEofKShrxSVVR6gTIEhA4zL4uVJdZvV0BPl7w7eU9uzq73N8+K
         Ydx2Ms1OaC3sPGw7Cz3Mtmj8iYDtQbFmqoU0GaEYpenSO/3B2cuw/lhFdN8iAgwhseom
         W5cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793894116; x=1794498916;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tdKl+siKq28S91b9oYIgCcRRzZiP/IWdXCqV8LvsSrQ=;
        b=1WAuU8yk7whJHjN+NTSlYIIO3JISTttaNj6mIPef2vvWgMPhb3SzIxo+arcp5o/gEy
         wWZRrdeqcGnNdr1+e+V1GjjMVA/w3oo4P5ObIw+8UzAl/JfP1HnY+l10lNQj9vk/MWjA
         LcJOvoedGgKI1Eq8QFMbspX1taeJdymGEIn/Trt975j+8OPCdb62niRQc/fvQ3xPD+Ez
         yRrtu0KV2QIKaIpAFBUjRpcBJlR6gfJb/qh1MoxKnJL1q6nPbN1t+BE2eZs+9KHhsBwQ
         WB3GedBrzqC1Un8ZaFgJeszYCkl+NlKzebR0tKlRqrjjM5LiQhIc+bwXDjJRH46L7f3s
         rezA==
X-Forwarded-Encrypted: i=1; AKwUvBy5t7ShV9ipAQ2H3NJJ5lYQb6rtdCTWKXXTBC48I5ceLOoLXD14oeF6A8d9F7WrNie4g0Aa++SIoRFQC9Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z97X2XosiMVEtSw5Lepi+svJtAZgOSzKa0pm0GSBDhwmBGZTuYF
	A64xC0l8jNdNpziEsV2Jgl7qBm7CG91ZCm1bcJAXjIsg1nPFtZy8PW7xqsWHBFgke5zt+e75h2f
	LTNrzniVt2G+7W7yyFq6fBWhx1KA74wi3kryXrD/lh5lD2oSkgprVE5jO05MVV3sZNsM=
X-Gm-Gg: AYBFou3wmyyU6tMhuPptHa/15Ryciw0ryL+moB3gsZhcJa3jqO3dwhYvCGCnoG6RiCH
	9s+uorynqB0kNCouU+/69GL16Eepg12dkmc1Yw+U/vTtzTgSeGY8GbJGdEhU3Qqx/7LowatkdiZ
	B1/N+pyNfQS4Q2ZN85tsUz0idwS2o3vMq30OE/VZRsl+ur98JGe07f0GV7x+CItpnFA6NYGZcey
	IGgFekv6dSHXVCGMm5POjb4FQe49Rv1wNlraadYbJLD/si/nX4JE03O7CM6+60yjw5XYA2aaKnn
	eqZnt0pWGGtXt1OTGgEgk/pFFJhFhoEqkGmof5XvXZ+VroR2yxj6L5eSyvYf2bmE+qN4ifu2fBJ
	wE2HZNHUAy2WF4+L7+ezqUsVvX1uKXoPFRB8culUU2Pj/9tSanfN08kCaB4bFpBnaa2+SfKNPsm
	gc5A==
X-Received: by 2002:a05:6102:604e:b0:7d0:9587:1b99 with SMTP id ada2fe7eead31-7d2a0fa8580mr4288137.0.1793894116425;
        Thu, 05 Nov 2026 07:55:16 -0800 (PST)
X-Received: by 2002:a05:6102:604e:b0:7d0:9587:1b99 with SMTP id ada2fe7eead31-7d2a0fa8580mr4268137.0.1793894115915;
        Thu, 05 Nov 2026 07:55:15 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda2007esm10612301f8f.47.2026.11.05.07.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:55:15 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 16:55:11 +0100
Subject: [PATCH] power: sequencing: core: add a note on descriptor
 serialization
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
Message-Id: <20261105-pwrseq-core-desc-kerneldoc-v1-1-e10a2b03ce1f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAN6m7GoC/x3MQQqDQAwF0KtI1g04arX0KqULyXw1WGZsAm1Bv
 LtDl2/zdnKYwule7WT4qGtOBeFSkSxjmsEai6mpmz6E+srb1xxvlmzgCBdeYQmvmIWHeAvSjX3
 bYqISbIZJf//88TyOE6ZYwCBsAAAA
X-Change-ID: 20261105-pwrseq-core-desc-kerneldoc-7d81c4a633ef
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1633;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=6xeukmjDq+lNKkylfxdTWLXrBwaRiFMGYWd8X7CRWMw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq7KbiU/r6BxsMkL3eFph1es2+13kLmLBWAoMNd
 HdxqUG2ysqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauym4gAKCRAFnS7L/zaE
 w+vbEACVQmqNgC3PnpXovbOuKQp7LzwsZfRRlf3xxAjakv1ZjSbPWwD9/C13Xezr9n6C6Q2p8Rm
 XTMdC1eY666HH9yFwyNoUV6tNNeO9jUOGV7X5JDutbMlp/k5dx+67DNJjiAbLWFiYtAtkG6kPe/
 4ryBo0yY2aKRaOVdNnyo6o8j43vaWdg+bDPsYmmmn8BK/0b1wwAYaHYpGQOFOnu38YDxceIZw+3
 3WGTv3qGGxhkmXbjzWVAulksIm+M6HFaMFAA6uWboxF87ToAE7ufoILjiSOrixPcfWApFHItOVm
 7oTB7QZdPYJRS2hsIXkiM0Xijo8Lf2CT84urTyy6Xim8rYHX+sii82M3KmO8MlLRmeDBcTd+aTd
 dZHR3FaY4KqIVrxLBD7+LbVWMQEM8hklbN4WL+uWDpeevQ8CugvCPoz7Olo8V6YSQQpDEDEbjsn
 nOEx0phuESu9HBaLO3hYOJJfan3Z1aBoS+RqcwSA70/mACdoLQYsYX9PDSRkn1uefg5J50ULBko
 EEDr3N4p3bpPfirvh0alQIVcC8wodg/4Jmw1TotWetQrM9myJfgOysWIWGdjUYrdVGy+WMElAX/
 2qNBPFCSUqybJZdmDupiLP+OMAYxf3e+UR+gziPOlNk+f6DR3Pu7vNhrpQMgpCoJaFubvuFkCgh
 KUW+P6tCOEi/UGA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2MyBTYWx0ZWRfXyrKV46oruTeA
 E8fpldzHpeueyQuyrZaF7vt4VXEKnUNVLsMMUIEKZEkdkeSxpJMSL2nXyA4cevaPGOfkW44SAL6
 iPdnfrkg5TLvS/yJVaMnV1HtAkYWP5E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2MyBTYWx0ZWRfX0v+WubAX5/Ct
 S++nmbwFxA4740I7GAe+vfVscVFPVg/Ody5orDlxK9RJSfF8cdBF3t54kr363cUr1L9xIGmYz/N
 5nEMue6P2wGQ5YKeLBge/boDTPDdmJYeQkwDo172hYycxmwS41smr8JbuJcp81dqNMwnnivZ0Pr
 y9SifccmqEgnn36Th4lem1RqUdriCxsw+02QuODuOzDtAcjaCtRorEo/6CwIaaHPpBRr2dTotFn
 lZvbfowhqZaYhvLLi5K/kyJdnvsqHZ3r/ihn65a/SiI3TzCsXX9dMvksvV2arbKQGMeMpTs1p2/
 S3hv3Uq/l/RY0sOPOwvjfqB/tzkp9rshR98e61hQuwWvE2khJPVTFB2FUqApdb7A78eUObXERIB
 EzivIh/Vi9rfsOY11s2fiv01zU1kKGYGVXmg3+zBOa3SnAOv44NDkRBjmwspBvU2GTzRNsMl+ZE
 iaiTW8J5ntyf9AkREcg==
X-Proofpoint-ORIG-GUID: 8PBTYRaYTiJ9_ZXyM6tZEnwJeN7baIb-
X-Proofpoint-GUID: 8PBTYRaYTiJ9_ZXyM6tZEnwJeN7baIb-
X-Authority-Analysis: v=2.4 cv=Y5JtIReN c=1 sm=1 tr=0 ts=6aeca6e5 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=K8rka6OJ2oXCR8qD2JwA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050063

Sashiko reported a race in pwrseq_enable/disable() which is a false
positive. The descriptor structures are not synchronized by power
sequencing core. Instead: the user that requested a descriptor is
responsible for serializing access to it. Add a note to the kerneldoc.

Closes: https://sashiko.dev/#/bug/linux-d409bd5b-8a5d-485d-aa53-cbc9ddeb8436
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/power/sequencing/core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/power/sequencing/core.c b/drivers/power/sequencing/core.c
index d7a545bb4ed2e22897843f4a81c337deb0c28062..588c6da12acbe942eb5b918e36be11b855c79e2b 100644
--- a/drivers/power/sequencing/core.c
+++ b/drivers/power/sequencing/core.c
@@ -270,6 +270,11 @@ static void pwrseq_device_put(struct pwrseq_device *pwrseq)
  * @target: Reference to the target this descriptor allows to control.
  * @powered_on: Power state set by the holder of the descriptor (not necessarily
  * corresponding to the actual power state of the device).
+ *
+ * @note: The user that requested the descriptor from the provider is
+ * responsible for the serialization of access to it. Concurrent threads must
+ * not access the descriptor structure without synchronization as power
+ * sequencing core does not provide any per-descriptor locking.
  */
 struct pwrseq_desc {
 	struct pwrseq_device *pwrseq;

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261105-pwrseq-core-desc-kerneldoc-7d81c4a633ef

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


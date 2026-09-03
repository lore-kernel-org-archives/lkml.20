Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB9B4BB5D9
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 14:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788446861; cv=none; b=cBGTn0wKGH2wyDh5AbPUauv4biHxmPWs55h0qSwJAGYJSpQtkcNuK1UVmF5p2C4+z08ygOFHQ70/fCH0chocsIK35X3ZzuX0ZBEU6jXlLTAWtMrw3gLVq46qHp8gEzFtDsWTjGAxTVBNaOUbuOoeUiO7nMpA6PegBK4BqifdvdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788446861; c=relaxed/simple;
	bh=nGZreA1amTgzCPBA3pk9j3iYkm570B956O1G7sPHObE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mWBxQs3gX468dK1j9TGXc0R9nrDE8UhmyFg5V3mHlZT9/0NXEOKo/FZ6GtjIk0IHN9BCIVWxW+o1T5Bg9FOuUzJVvLqR4bJdaFjW7oxTOOaxN5yFUDvkrbaZ7rn/VZ/rvRvQmmLw05bKPuKBXeK/x95KodM/YM3scyqIBaZ1kTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UH/o7e8T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eIeI5AfD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UH/o7e8T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eIeI5AfD"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DAc2O4158148
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 14:47:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KgjPny+eSGIgNXcSG5I6onSrjp3K5wwDfeW3fNEHLX0=; b=UH/o7e8TT7WSEeBu
	yXxd7Qwik4TQOL7RkBwiEfoZ1A6pauzmnQ0TfC9iGM59oDf9vSH1kqV2Woi9vUz0
	QSB5kjHdAIYSri/hvfYGUQQkwaBuwfJr7j7ogH+MDJM2mlTOI1675Ps3PMkvKdrB
	2DKDuve2U4rzP8I0VX6nAN5WiN4ktex8L2kgBUr8TbinBuFFs3hfByFLqMbWSi/W
	Wfr1NKIXmPEkuLAQIhzY6cIdbRSB1Mq61oXQntn2T+BOMRJiusDawa6zZxoID8we
	TOmxepY8bmgjqHJI0VPT3/rljhjMocISD7Qt/vYyAkaTnUlyL+jZNWlZBhpiG9ct
	fNk5FA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf5pdse3g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 14:47:38 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39af306c795so338779a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 07:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788446858; x=1789051658; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KgjPny+eSGIgNXcSG5I6onSrjp3K5wwDfeW3fNEHLX0=;
        b=eIeI5AfDPef50j+uqSbr689abAm6SI3SZ+iUidOp/1RJZb6QHcxL1Y0gUlZSxiTvYQ
         pyur+Yp/eBz8beNqdMNk9CpFthsOj0Opy2c9ejxAsQBbqbGAQ1nnfSRUOA4qvRTgtGCH
         K8yhAHBrLM1Pl9Xy2AFbhOSVa9huSd6g6k5tQr6WkonIqnXW9VFLjX95Gj5rMVGSOLfh
         IiVwfNpbghNRPEW14fRj+I5G8O6ELuqLW6U11n9O82jHV8hhcZ23riNXYtqMPd+dV6EL
         lfiWioqMQkI7Be5Kw6racXEjHXaWDm/MMnTohYdSDBurCPX2x2tqgnwoE5QB/Vw1y1nf
         G67Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788446858; x=1789051658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KgjPny+eSGIgNXcSG5I6onSrjp3K5wwDfeW3fNEHLX0=;
        b=Y7HkI6Op67e5liGhMDEeODCI6arfC7WVZP24mt/bQK9GG5VnUbj0EW6XW+YOVtdXl8
         kFzZjIkf7wS7U2uJoZiQybdb/uX7je5fJcg8cLPv0J42FxJAaoK+3zNU54WbHRuLBqm3
         uIYl827A9MgoQznzgMY0R31l1zrcsU0BpOBLU/GhQsKxN5aoaW4hY8fGYRI16z+U8/zj
         BFFuBPtD2yKymI3GqmUIBkhOjqnfcgq/UKYknWblSlfsM6dzh2ZH0XNrCwQJGjm4HgNj
         MG8qPIpPXXRhnDqooSXOSGDw0F5Ws4yWa5MIeOaAKD70QVOyaTGEGsY9Qy0ku40ZVStn
         0w3g==
X-Forwarded-Encrypted: i=1; AKwUvBzZh+N/0dmnVmf1cMDKri/kWqktfFPnHViHrk/AvedfQeERWZk7fSptBJ5/nYpjZMAnJ8+mARsRcwqNEOk=@vger.kernel.org
X-Gm-Message-State: AFuF++keaRObjzbJYm8jXLWqUByyF7tB0e04yTw2cBUh6uGuNznqwr3f
	ruLchpSo9ZKlGQoWlAOdoib9r8ofWHxrDVSmvsMusg0MbJT8PKtKp38BBKScXaCEw9/o9yZ5fVd
	wX1srqP+JZGA6lgQFckImfDaeyphHPsisvY/geD/ztrTcRvbO6I+eD5/BvBs89AAbaHp2L8sNyB
	s=
X-Gm-Gg: AYBFou0ltXIKaMsRnyVEwRGCO7eXl6rcewpzt7HmSc86GDAOWz+5Ehle18KPfYq7e5w
	wUmVmxtRqbp9/ljOTk6078KVW28ie0VXyQUv1K6EdAqaPtrVPTi+O3Yp55VJ/Spg74zvOEuNvF4
	ldHFL7NaJKEPtKKtZ4hnPpK7DgM4uqP8a4+Fcnpy/XScDjTxJropnYCnr3xAXiszohHGKJsMvPD
	ew5+jq/l5eVMmxAgWhR5G+gEJ3mf92JdMIAYEQNJGTjOkA+xwI7mZtLAXrmfYNj/nBnwHxq6iOD
	7G9rlVnAlLipoPQEZKdhXhQSb5a+Po8Kancb51TNg8w75Xa9WpxOtvxzAB2aCM4HlVj6W45nCjS
	V8X4IkTrEk81g/Obk0siUiQ9twIJUeUfT9NzqdreESAQp5Ns=
X-Received: by 2002:a17:90b:4b8b:b0:38e:76f8:fcbb with SMTP id 98e67ed59e1d1-39aee1c6d08mr11873144a91.4.1788446857033;
        Thu, 03 Sep 2026 07:47:37 -0700 (PDT)
X-Received: by 2002:a17:90b:4b8b:b0:38e:76f8:fcbb with SMTP id 98e67ed59e1d1-39aee1c6d08mr11873100a91.4.1788446856524;
        Thu, 03 Sep 2026 07:47:36 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243bfbe3sm25794c88.11.2026.09.03.07.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 07:47:35 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Thu, 03 Sep 2026 07:47:13 -0700
Subject: [PATCH BlueZ v3 1/4] doc/hci-protocol: Fix missing & on mtu
 argument in BT_RCVMTU example
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-vendor_hci-v3-1-015d62a57c91@oss.qualcomm.com>
References: <20260903-vendor_hci-v3-0-015d62a57c91@oss.qualcomm.com>
In-Reply-To: <20260903-vendor_hci-v3-0-015d62a57c91@oss.qualcomm.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEyOCBTYWx0ZWRfX/5gglC8gVZc9
 K3V0Z6zxbpy8oXMDfFalWrDOO1fXOgQ6wpN/T3qRonqsau/8uP4zUQzAWonTBhXI3GcS4foX8v7
 h2jj6sQ7CspH6f0HWF8xTadDSL0lviU=
X-Proofpoint-ORIG-GUID: l2mfAwFuwh6VMnwS1L8awysHwLwkzADb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEyOCBTYWx0ZWRfX1DftJplpkhDe
 r/3HXpgScoamQHOkE4zmiF+Zrq6M6O9x4zQckVomzSEmP/cJNplNlWnUAKwwhWsfcIc6DKnfmgl
 AMbyxbe8CLU2h33OPpVynvlSoim5YSLj56QrWPrlkESBTjeFi19LNnNJ56y1/biF7AV7mYDbfZg
 2cBDzp+iyBUXE/uLegBs8a4W1RdWJ0zvx6uf6uKGcmon/8yxKOn21q/aPJz2aJKtpmGPstyYo7z
 +sl6Ht/HvOPK4wRj37Kp5xC7eEPg0q9vy69O48Dh/fueRir7qa/ehJhMLAsuul3t/eobk+Ao7Wh
 wWgzTqiBVN8BlzDb5EBMo/oztKENhnTWX4CFdb4Ajxdhin8tZtHNORepKDs2tb4MdLfzS2KRqIV
 FYbadtMKqOr+2FIhDK10lMjv7SlahXVJZpcXjK+PVBt7y7gEfoAlrFyEp5CCFs1+czdCYREaAs9
 gvIdo5i9ojQHeFngC2A==
X-Authority-Analysis: v=2.4 cv=RsL16imK c=1 sm=1 tr=0 ts=6a99888a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=wa7QpaTpAAAA:8 a=zpTOe8WlNf4vmfFp-y0A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=ehqneT2-Ts4HTEaPPMaO:22
X-Proofpoint-GUID: l2mfAwFuwh6VMnwS1L8awysHwLwkzADb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030128

getsockopt() requires a pointer argument, but mtu was passed by value.

Fix by using &mtu instead of mtu.
---
 doc/hci-protocol.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/doc/hci-protocol.rst b/doc/hci-protocol.rst
index f28684655842..db10b35df736 100644
--- a/doc/hci-protocol.rst
+++ b/doc/hci-protocol.rst
@@ -129,17 +129,17 @@ Example:
 
 .. code-block::
 
     uint16_t mtu;
     socklen_t len;
     int err;
 
     len = sizeof(mtu);
-    err = getsockopt(sock, SOL_BLUETOOTH, BT_RCVMTU, mtu, &len);
+    err = getsockopt(sock, SOL_BLUETOOTH, BT_RCVMTU, &mtu, &len);
 
 RESOURCES
 =========
 
 http://www.bluez.org
 
 REPORTING BUGS
 ==============

-- 
2.34.1


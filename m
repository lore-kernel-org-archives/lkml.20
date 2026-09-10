Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA11348EC83
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789051212; cv=none; b=FlpCUs9j2l0br4tV7SK3xJFtAaFJ17AIlXYLpcrHIzCzJUBU6hFiSJx0QDXn0pS84cYkHq12dZri6I4n3nKmbQljZrKCj6Z+e/K0rFs8tBM8UzoWukRD4qZeaZrfNCqZfwDXe5XJ/jg1SjEzuHAjDjKsIraXJGXSBZeHTY4mo3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789051212; c=relaxed/simple;
	bh=nGZreA1amTgzCPBA3pk9j3iYkm570B956O1G7sPHObE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TiJ7nJhV2g/onqF5DdcdIuG5Iz8SCuxkj1pyelSnXYtDmXlXEIzW5EQmRec/JCsTe0dipvGQuDSJHlgZftp4aLurAd76LBXZZjwdr3i8vI7AnDTwp9uP8TRodKBrb7zPMVJUUqcN3pJfR0wbHIucnyWyGVimNC0HAkguKVyGDqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cgFqw294; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gw32IV3R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cgFqw294";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gw32IV3R"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7i8g780831
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:40:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KgjPny+eSGIgNXcSG5I6onSrjp3K5wwDfeW3fNEHLX0=; b=cgFqw294BhjbeoSA
	urLg+kN/HPgn8wns9sFJMAK7dJPKDSMZYpIvMx88f5TGpUrhpS860/I4//WfdkP5
	bEvU+PEu3H64QlO0tjJV/oNQ17ozfmIqVIxayGiQBr7m3wKwJl1RxDa16iAbD2F0
	VkyyGEndPCz2zBNWr2hWO1LsgRiOkCe8Q02wuDuY42nU0csq4SL71qdj9l24JoUc
	2UAaalOkyhXv9spqJm+mothX5nViyrJY0RvtoVBaEO0sdcf8ryO4F+Ydi2Joo5nt
	F75Tpy8Y8majNexw6vAzakqxt9159+y6XJkDy+Qn+CMcRptHUKEy2jwiubzw+A/1
	G8yFjA==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkrak9sq8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:40:08 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-8003169e5c5so570760a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789051208; x=1789656008; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KgjPny+eSGIgNXcSG5I6onSrjp3K5wwDfeW3fNEHLX0=;
        b=gw32IV3RSMnnsvzIpJ53YwC/5v5aUVVHaNhScEAKuhEVyZEKL/pzE3ISoJhzvAzYwh
         iAr8WUiPLjaBsnimOIbDqsc8FztDNH+WqDN8EeI2xojA/Gs/i1+n+GYOVf1b1qG2SGUi
         HK7LUIZqjZ3LV5eRPZPi++t+0yKu5e79gkmEkdjW29mczUyLeBbg9QqrtFNrjjETtZ/l
         y/RgAwlb3kT6yj7qYizJUrGmuJ9EhHG4OpBymzx3ygNise/+/y1h86M3UY3xtyWeRCP8
         oONiPd8kQGepDxYWly/e7n7u8YobjZA2PHeXU1A8Pm7y58FlkLnRfSvEGzS6+mdbq8ad
         1giQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789051208; x=1789656008;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KgjPny+eSGIgNXcSG5I6onSrjp3K5wwDfeW3fNEHLX0=;
        b=n55uG1DxbfjNlybG+bex2gTCS0kMrYgEPjfjDENJpvVxi7ZcXQVWBQj04Lsmz8qaUJ
         E/7KrbOw1i/iedQhNVM36lx7AR1TtkczE2ZS68Lh5+SX1oosoBRcQdHJ6gY252/lUGNu
         S9k3qERuvU6bttLSL3k8aMhe570I9kqAnjr+iFGa2wEbIcniylEthx6OLwuqlYVYrBke
         RP3mK4bHNcz49W4wdSs9Qmo7OsADb5fbpz8V29F2DtJwtxZ33knxVYsb2bwSs/qXwGYu
         1IQUdTVbdmduDg7/GLEkI63aADpaA5MjH5GWY9YPiEjoIRe3TPlWthpoI16RdUz1+H//
         2quw==
X-Forwarded-Encrypted: i=1; AKwUvBxceOd+jimgMO2uWX1dKKRPMMrqe5Ts6eHOmc/D6V+WAVDhyyrO2wDJumHLc6Fp8GgnbvK+ZE6Q+gP5CFM=@vger.kernel.org
X-Gm-Message-State: AFuF++kZ+GVtA7cQitFg2SgEVO/IGH2qMpzbulsTMuccDVWCY/p7/bHp
	DsdYM0JmpMGGLNgcwn63b01YSy8uOcEUUKr4LcMOq+NrZjGUqxEbweP6OEHoKU0pm2pIigFK/bM
	VpQEcQtVibkTUj5w80xslq3qYU992caYI3fZs55wmGobLgW+Org0QqhfaCe0IeHPw0+Y=
X-Gm-Gg: AYBFou18OARhoByTd/5DYnzEaqPP66HJDf0nZNXFqNfnAvd/ekkE0z0FHHwRviHNXs/
	VgnY6nZJpFbRhGcpDl9ue8wBRHbWEeJXc8i5Ld5HnFeAegW8UatqkAxYSNx8TXcElEMiMqQCF+j
	s7dEh/F5VFheg7FcQiVmEpS+ctLVfXqmktaETcEaPD+qbVovPnCj/pXwgKod2nbweLIB1klvjfv
	TYp1mJ3NtOldJsyy0gnJl/agTQoaKxm5fNvlPKbZEpC9wwyiZ7tQAWzM/8od40oM3+MGazFuuUu
	uVowjIL0ZsQpa1PkoDdzPS2r/UbYjoewKsG85uUni+hu7fefK93/UPviiJfGDrI/m6ikMjnKkLx
	2JqCXP77Xk0vfd9tmkMBj6nqFyYt4ddC33KK8+frcnZtv3fU=
X-Received: by 2002:a05:6830:3495:b0:801:b3e8:25ab with SMTP id 46e09a7af769-801b3e8a6c8mr5287707a34.2.1789051207825;
        Thu, 10 Sep 2026 07:40:07 -0700 (PDT)
X-Received: by 2002:a05:6830:3495:b0:801:b3e8:25ab with SMTP id 46e09a7af769-801b3e8a6c8mr5287560a34.2.1789051203817;
        Thu, 10 Sep 2026 07:40:03 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7fa02cddc41sm20740155a34.22.2026.09.10.07.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 07:40:03 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 07:39:55 -0700
Subject: [PATCH BlueZ v4 1/3] doc/hci-protocol: Fix missing & on mtu
 argument in BT_RCVMTU example
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-vendor_hci-v4-1-b953ce117d12@oss.qualcomm.com>
References: <20260910-vendor_hci-v4-0-b953ce117d12@oss.qualcomm.com>
In-Reply-To: <20260910-vendor_hci-v4-0-b953ce117d12@oss.qualcomm.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE3NyBTYWx0ZWRfX3zGWN4p9/B4F
 jeutRjcqXZ47xx6T9QcF4kflx1lDsgwFKB0cNQoDG5rFJW4XPgL2oWZgx+IPFPwN/E28UkqUC9l
 8yjYVUCZo4q5h80LxoxK7Qnif5sfGyA=
X-Proofpoint-GUID: 2mUx83ostCh6czgzjFlIfrMLGeaqL2D2
X-Proofpoint-ORIG-GUID: 2mUx83ostCh6czgzjFlIfrMLGeaqL2D2
X-Authority-Analysis: v=2.4 cv=EspHPicA c=1 sm=1 tr=0 ts=6aa2c148 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=wa7QpaTpAAAA:8 a=zpTOe8WlNf4vmfFp-y0A:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22 a=ehqneT2-Ts4HTEaPPMaO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE3NyBTYWx0ZWRfX9T0TweSzTTgV
 7izaKnHbCbdEjPogVUSeAhxkrK4Nm6BQx/F4VQfcZKht7y1cMTcOH8hqQTJ6yNRSI84GRkZLLCM
 bR0yMueJK61R/KomezU0M0F5+XyxornZ77uNOGGZodRUakVA9Da2mbA5lbuFGfvyi9UOV4wyV9G
 Q2sExMNQYNtI4V+gmGDXiKUhnH9nGQoSmAFVu18Z3MkdSma0T/I/D1S49qOUBAuStn8JeTxhwvu
 M4hsMzLm6MZdScHlFdagfLQMd9Cpx8A1rjfz+ykS9+dJUS9HzdcrhtaOHM1hOwpUFbnMQs46l59
 B1H0ebhUhoA5qNa21CIgNQjGR3svZ4ctn06L/SHXSTijsEbT/vxPXlTVy1nXMoATHXJn9AcNDnE
 XvxtyUzK3B+znTIs4oJTkwt958zvRXPCHzIYqvjetVlZcUeNlpPbU4HFP/FjdbwFm+22MkQVxdC
 Hcw2rbSQ+pO2ZK0iAdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100177

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


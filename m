Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794806885;
	b=JD5Vq5JhgsD7ALUCXBpj/M7bXjhOONYuXrVpirmAin5NzeyyZ48/DYJdQstgyD+m4mk/
	 edSQ3/6RWt/M/PAoE+Dq+UJFdWN2f249FwWR2EcbRxQZ6yMSEKUk/kXHvKN2bGhbYUx7B
	 zldMT7+IiBkPqq/E6Z29uFJi5IJYPUWFJl61420Vb3ly0g2kJZ43LqOVBrPUymOq7atSD
	 0WkrJZXJcB6ByKJmydzn89wjVVyCmvxoobGEkujWUT2ZAWOaNuKUUKLJU18ghzdQrIXG3
	 d+LlmpIflOw22BNX2BocFju2K8iC6EDtNxl50Du/88s3QGTIZVpqKho7N56aDgTem9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794806885;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ODAc/WUdkN8owaR4LW8+eF4ErfhvSrgEn9CVJETyrww=;
	b=ofhLsJhAdf1dRBpzx1HGumtsuQTnh4tRcKAbgXRAFSzj8cYV+joA4Aes6yVhQCa0V9Cq
	 5Q0G0J5q8W7pQBt6p1JOr+yY3SxuRqDSPoHrwoha+aUs9LcQEtdlx8ankwfkFYolr4ZBA
	 PKTAHrcOF0dEFhs6fmLuw+J6cAFUgtcGD+u9/Xnt27tPmjBwwgDzSpoH+ZsOmNIm/sf8d
	 AbyGPyz22VugiduolamSwOMWe8aEJFIlsbBQPPg8FkzvQCHQKogTqClkYalEIKjfgDPB8
	 yJTmrCSa9wU2xT5VsQgv2Z8VWO8u3eJudSrzZ037KoRyjjIKu+17T1c7sT1s9wWZ4mQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lgU9aBCv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hOdD+iUM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1793F606A32F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:28:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1793F606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lgU9aBCv;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hOdD+iUM
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5LbaC3839126
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:28:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ODAc/WUdkN8owaR4LW8+eF4ErfhvSrgEn9CVJETyrww=; b=lgU9aBCvep5OTeVe
	CKIG9Qa2yYKfBBe6Ts1PyuGw14n77riQ7lCDrD1eYJ5fQwqLHrW2j86B6Y2xTAsV
	FvzmOe1GjOkj8EsaqGsz82cXrwudtRbeZCfIJT4W2JtJpx6FIE9jJ6/+kYClK7Lz
	Ka7Ded0TIOEqxgm/74+ZDAmtKTCz+tCiiRzMQiEsUgt3OnEav4mskhgaPZOXzC5g
	PGEzn/s0RupRidNHOeM5l/zHUCFUMR12rmNxclmsgDhbuq3zHl9SgiDYhUC0RQpW
	1sv7g1NghGArc21pNHK0kuviRsOVzBVltWLykeh9wKIfDh9ckV8EtB7OaWmGlFeL
	odKuMA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmhmuhf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:28:04 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ed08904845so12603735ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794806884; x=1795411684; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ODAc/WUdkN8owaR4LW8+eF4ErfhvSrgEn9CVJETyrww=;
        b=hOdD+iUMZ272ZRQVb9MEKVS32yfNVni9+wSm7zO6duL2SH0AcsE4Pj+/NK4xmd8qj8
         6YYKetwAoZFc+Lzh7xB3/yc/uPJWjmzkkZTtJp5+yAXb4lfc3cx8NBC+4LY4RfwAxIr4
         qI3V5vZ5hkXdaZYRg/tktbY0PNTzUuoyV66liJd0k0mi31iYdHSZdgyU1Rqm0DnAlHjH
         ykYVKnWrnLKH9yQOZSpBSOHvf2DOqpOcOERYaTJELPYiw70m5mRYogHa1WD/1Fu4DzLY
         +Twsp5Y78hSJVxikMnqrSYABu7yYTsymvVcyIHoDqjCWn7uP7Awudjmxgxy4GKhnAaJK
         +5Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794806884; x=1795411684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ODAc/WUdkN8owaR4LW8+eF4ErfhvSrgEn9CVJETyrww=;
        b=xat9dpk+DgqQl1EanHodjA3ft6yES56T4++NVgcyXHhq2bucIAU5h+fmkDp+l2NJGR
         mn4L9cf501MSogc97xggrM/czky3bN0DZWlkWXAIF2+uAVaapfx1EZt0X8QPbsIXE+9e
         rTlf24Anyrt0OKRZym/GPVbH6eJhImforRtDp00PUyLIlDOMVVTWm6ektOattjnPCudW
         vslv+v3Ohz7bKD9zUH6ahRUjcFBxO0/R87YITPzRaY2fYto4nYM7TQjoWCZvpDOHhmJJ
         FyEk34KP5dU9tYJTTIiYUPKthp4pixAAI4J30nlLNwWc6eGOsRfsU/C4NL1sMttQktgI
         S2Ew==
X-Forwarded-Encrypted: i=1; AL+hErHH/XDRLxnWcpJmTjDpYO6UbJcOZiZBt2J76ym4tJQ4iP+ho7Za48auiw82UNHyjQ36k1E1czy3Vy7xTFw=@vger.kernel.org
X-Gm-Message-State: APuU4Z99BO9hFggXIOW92gfkXr9wQE0Xi6xzm/DPSWszuI1dgZUzSG8m
	+VUiTyfcjhmLouqPBipTTLZWIt+/6UM8tjDq9R0plrAMTuviMO5tP+Ykj+2JgGdgYrm+KBJUHnP
	Ep85K+SFXpRmFtCfoM1KB/TyCSCa9aKR2N2jCN7Sz7d9EcjYHtIdBYqWRAT56ACwFyeE=
X-Gm-Gg: AYBFou3n4xSGucHMaKCYXLCHcJNqtw4awzPPoqPuVFS8qenZ/BY2Hhn3VEcNkqfVUK+
	uzKXQs3p64pDAREDb1iydyvxXbXbwVjA2x7qKuHcBOlX7DUw3V8JxCB5lUQCVE2G6SVci9DsQOv
	0oN5amY+2mMms4v9IvyuoHwwWNdjAieoFYFfhU4eYpssq+/Qo9imysnxIyAbycW8T33c4LI1/wc
	y3AXKRrW2ok8PvaUNZYAjltVfhbD3jqBQK5qI2mEdRgzrPoVzKIGoY7YwPJ7Y2aL0EV+5WlfdJP
	b7u8G3byUYMhncnTN7kHXN1YTF8eIJJCcEq1/Rxvef3WHsH7N1Egeh+Ey6wLmPt+grdZrUUzuIl
	lZiiC8WyqvnZHA584gKnfaXp7KIoSgEtWaxicQkwBsyo3FDn4z864Btk7VjgOYfKl8HkBkICABA
	==
X-Received: by 2002:a17:903:3c68:b0:2e9:53c2:760 with SMTP id d9443c01a7336-2ee0dadc2ffmr101068775ad.30.1794806883683;
        Sun, 15 Nov 2026 21:28:03 -0800 (PST)
X-Received: by 2002:a17:903:3c68:b0:2e9:53c2:760 with SMTP id d9443c01a7336-2ee0dadc2ffmr101068535ad.30.1794806883260;
        Sun, 15 Nov 2026 21:28:03 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f4ad519sm31478885ad.2.2026.11.15.21.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 21:28:02 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 10:57:44 +0530
Subject: [PATCH 1/2] dt-bindings: clock: qcom: add Shikra PWM XO512 source
 clock
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
Message-Id: <20261116-pwm_clocks_shikra-v1-1-55fc11501821@oss.qualcomm.com>
References: <20261116-pwm_clocks_shikra-v1-0-55fc11501821@oss.qualcomm.com>
In-Reply-To: <20261116-pwm_clocks_shikra-v1-0-55fc11501821@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: aY4FVWsOJzJ_GVaONdf7Ahfx9xtXhbtH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyMSBTYWx0ZWRfX9DPSE/n7tl+j
 DdJgPzbMe0URL7v7BfveemZ5R4KKLLC+fU0RH8jZQCWZV1K73KjwsKLgtkUO7mB3qVEeRFekVME
 ozrDDbK99nodrXeYD/IwqOk6VTPWlI0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyMSBTYWx0ZWRfX+wMBgw0qrt8d
 5hAOino6f5dH3y9y/lQ+8WnNR7NrMLknaQMCgajdPGkDCC0xM+KPk3rgqgoO8aEK0AuoTLGmY+5
 4hiEgyT8pDIHzMdu5DwqrQ4pSqBgb12h3iuAD9wHUz/O0wB6i6jIYuRiqMcartY7oMIiRSFwOZ5
 jrF17d3C9usVT617LmgbkCzz/pkTBncrMp3a5QR7vq3aYUIMDv/gk2lptx+DR7u7poHNYJRZw7t
 gHHzOlF2vfgU+DEFPD9xvxwS5ecf/mWIh5VRW201PP1sjHHc5AkqKorLvj4Mj9WIw+AlhDOwGHS
 2qYDoFQ5CqWl549i3sa/yYqgGxw7LXfvOF8HpUKQF22ygRMTpeAbzLAoKib1PeSp1PLZIC2OSCc
 g8I7BjNyV/AuOoJaQ0D+kOj3Rahh6+uOnuzPhO8IU3qcy1yMJSQtFVnyAZUR+O0DRxJvAIGLdCv
 xJ8HUb9ZDFkquoJv8Cw==
X-Authority-Analysis: v=2.4 cv=e/2T2qp/ c=1 sm=1 tr=0 ts=6afa9464 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=4k7nqb-1yaoPLSLXa1YA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: aY4FVWsOJzJ_GVaONdf7Ahfx9xtXhbtH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160021

Export the GCC PWM XO512 source clock ID so the Shikra PWM controller
can describe and configure its complete clock path.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 include/dt-bindings/clock/qcom,shikra-gcc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/qcom,shikra-gcc.h b/include/dt-bindings/clock/qcom,shikra-gcc.h
index 656c959c7e1251ed9af8fd04285fe616dfe9ecdc..b86f122e7a9ba0d10c84aac954626eb9caaf0788 100644
--- a/include/dt-bindings/clock/qcom,shikra-gcc.h
+++ b/include/dt-bindings/clock/qcom,shikra-gcc.h
@@ -222,6 +222,7 @@
 #define GCC_VIDEO_VENUS_CLK_SRC					212
 #define GCC_VIDEO_VENUS_CTL_CLK					213
 #define GCC_VIDEO_XO_CLK					214
+#define GCC_PWM0_XO512_CLK_SRC					215
 
 /* GCC power domains */
 #define GCC_CAMSS_TOP_GDSC					0

-- 
2.34.1


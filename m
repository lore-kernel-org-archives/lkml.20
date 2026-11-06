Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793979401;
	b=qVmPTULyXhwpV1qBXDOdXYGVBBjXOn6C91jX4EfRXRdn2CpqVNO7ZeHtaVyvskArKS/8
	 vpyIRgvsbtLZ8ohu88qpTniRmiEqNISg/FhbKO0PPmQFDtE2/ovBECYcRgmsAMbAH/QRA
	 AiG5J9cQbkQr7HVCpIzkFqVIZdl7ez59NmN65lo2PMnpedZCQeZIuwe8CVmvzLfmNg1bQ
	 N1DXD/+tZqmD3tXHIjdb9KWpvaYfu1CDx6+VGXI93iGHy2j55AaQ63sppfUWox0MMm4EQ
	 zfrSjOaSy4rD9qZTfWYqXI38O5aPy9E7C33c5tRz8daScdCUlmo0DmanmsMMKPvx9eQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793979401;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8FPkuk2euvsx1j+tDah7DaNr4rI/HTjPxRW4XcSqVrw=;
	b=ZRGWO9wtSVBe3CkAIOHwqm9v4vZGG5Oq+PUlh7+79Zl+EC/c7wL+BQoKZX/unLWdzZwc
	 wuDeFP0/dLd6R67g6zf7gOV6anQ+fzQiihRn3avWd5ZHFgz9grL2uL9pc9JeULGGxdIXY
	 IhJAxLGBK6AE4qXwFRaQoEo7RHtWQw3BcMLeO3gOzBiBh5IpkorDGRpTX+Sy+CeEv7JJp
	 EUlll7uT7aLKb4/G0LA2HDAt9AKj3m2Nsh8xWqIU6QByialuH/YlDN6TmoWLrNxeHwGrp
	 0ls37J/ekpqI67Rzloov9L709lL0ZUPQ6HC8eCMbXgNJY/5owk9aaZw6rD1+XOUAgBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=omjr62Ak;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=etrUVoBV;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D096D606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:36:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D096D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=omjr62Ak;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=etrUVoBV
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6Exwnr1121583
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 15:36:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8FPkuk2euvsx1j+tDah7Da
	Nr4rI/HTjPxRW4XcSqVrw=; b=omjr62AkNdgl7RMO8IWQdRcD2ABHI8QfJDWIIl
	ZzhF+iqEXxySlm4xCqQu9oG3XaJFr5OHCAQYLCBYHB9f1AWghtDBOOrtl+HKAjFA
	JD5PStfParddYEXTuUGgk9nXbLYSHbuOCjhz6pMUBwiginXV/wnwsamiktwm81iP
	RRQ26SX0fuhcXlFrvTB5dqipg9VPCFcqMV8bIlw5i1kx0V515bS5n3j2u7osUlVN
	MUTHnUSWBCTuM5JPyHAfTpeHODnJhs+UsIl3aYm9/u0SfNFutvrOgxr815p/i5l7
	2nNz8EM5OwW6A6WdtodqUJEDU5wot221536j9l4GQY3g5s2A==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9udsy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 15:36:39 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7c0f07b4e97so753647137.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793979399; x=1794584199; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8FPkuk2euvsx1j+tDah7DaNr4rI/HTjPxRW4XcSqVrw=;
        b=etrUVoBV5Oj9B8Y0b/wVcjsrPYkxvuhYtMEGSwfr5WUdBVI2Fvrh4MgKwys1dTIJ06
         5GrYVE67oCZylE5zWsW0hGDa5D9jUx7GwekDp/FYkmPcyK3g8l4R9hVaqpeoDqStCzGB
         +3BEL0bqzY6A/+ECbThjQD9N+dZ3EpbVE6DR35yCz6t6D36UY3RjNmFMYLAsC2fqjPfU
         m2XPwAXPvQrNNVnU+8ibI4UFRaet9gDk0WWg6zaafkKqrjY1uMJs++3da4r2OiaP6tm5
         3zPkHBNQmda/ko9XMgkkGK4bQqg3uAiaBHSwOXhjWuKZDDGIdK3NOCMUvFw31RGe2pth
         Jtpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793979399; x=1794584199;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8FPkuk2euvsx1j+tDah7DaNr4rI/HTjPxRW4XcSqVrw=;
        b=2D99XDt69k5u1JFQSi4tXXLvvpTdHbZasAPohPDB6yswKoWacVhh/Heiz7ipC8vBl3
         QjFtmjIjsi+O1BvTBhxWCt3+OKfR8Tflw3HcPHXlKzDAxOCYKPygVamKxcMHD1D/zTFs
         2NTCpKbtfYN0e9Cht8FU1raHQJ4JvCKc4C073EBHJ/iBX1WxK3FKP/vXcFlJBzUEIKmk
         yPzrAiFa9V+1zmTGpGenSd3K54SxugIjwAqmoj0tJooTFr0ns+SEOIniPx49u4N3kgb7
         CA1hbH4+2k/QTMx/RO80QcOMD5QdeUEgu56TArl2QhaO45KW4d/jeEk+GZ01sehFhtpJ
         qSEg==
X-Forwarded-Encrypted: i=1; AKwUvBy99dLbwRvwbmfSjvVFAhg0mLZcEClgvkeWAhYcOKB2Vl9j0NY4pWuoIgSvwZcQIq+uZ3uZwr/Q4EIs/pE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XVcVzKWkKZK8OOdzBpjqAKBqr+RGsvcW7PoPkBMdNy37FWeyj
	3yRn5yjWGKpveQlgNjVbvE39EsirjN5oILNIDvs+WQs/7PJ+WJt6bqAiyrXW+JYoSz+93O9UcPd
	jTSuSwQ8TlhT1y5OFL/jyMyDA1lBAYnUfeiAoyfbh0weT3ziHjQ5FE16BVUoZNVh7w2o=
X-Gm-Gg: AYBFou3QAY3txZE30jIOZD87EQp5NEMAfh0md6z2TaF5ri2dMKuuWO7oj+/kPTymiXG
	C7SsrHv1LQrKrzlWL7aoYQcwdiGBhFCQ8hqxlcYRbP/h128K10XdxyxyOeA2noMEJ276UzRya5i
	euD8S+XBxfdb5CPUEn5AZVbs82r2Xnpa2fpDXPyF3u3AhmoPbluNzE8iBof9x91K0xb4B5zPBtu
	ZMCvpm2r/ptp4RhJJCmILu2loB5NtR+z3jB+1yLZXE4+y0QoOai1mrc3vDMK55mSKYiqkF/USwP
	zJkAbqLqI8vX+5upIjbfRMlte45XQkgubhes1ZiF53deLSDzRl8YgxWKfgPoCk1OJ5OJiKoO8Wb
	KNCjRlM550fVO66SAy5loyQvxUMkqEv44aY2hy0ZCl/ec0oN3LE7B+S2o1w==
X-Received: by 2002:a05:6102:291f:b0:7c0:c6e3:3b88 with SMTP id ada2fe7eead31-7d2a1618ffemr1707088137.28.1793979398516;
        Fri, 06 Nov 2026 07:36:38 -0800 (PST)
X-Received: by 2002:a05:6102:291f:b0:7c0:c6e3:3b88 with SMTP id ada2fe7eead31-7d2a1618ffemr1706949137.28.1793979393258;
        Fri, 06 Nov 2026 07:36:33 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d6d63b6esm4462129f8f.10.2026.11.06.07.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:36:32 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 17:36:24 +0200
Subject: [PATCH] drm/panel-edp: add BOE NS140WUM-L61 entry
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
Message-Id: <20261106-panel-edp-boe-ns140wum-l61-v1-1-4c9747ec9186@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPfz7WoC/yXMwQqDMAwA0F+RnBdopFTwV8YObY0zorU0cxuI/
 75uO77LO0C5CCv0zQGFn6KypQq6NBAnn+6MMlRDa1pHZBxmn3hBHjKGjTEpWfPaV1wcobed86O
 NRF2AGuTCo7x/+fX2t+5h5vj4jnCeH10mo4F+AAAA
X-Change-ID: 20261106-panel-edp-boe-ns140wum-l61-a476af4c117b
To: Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2597;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=TTDtDHbrg7cjaWgp0tDdMN18iFuexpk2NAksBiJSEho=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq7fP+Um5J4O4YWjly4jS+ySpv88WtFVY/cwBQ8
 Kt7eWFMKuaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCau3z/gAKCRAbX0TJAJUV
 VrDWD/95bkqpNbsKuUdE5tEukr1oQSnAiyKHtyNuQLtz1SUlylVU6XYUKd4NnX2PeYi9hcm9Aqu
 gJEgiYRvN88B3L5GRWOALTrPmiPKw5h1QhIQDcdggcFlLcp1TnkT6wnfsbxa7hPuqimGzJUFVPh
 vHmU0hKK4wVSLgs/mOGlnz9q6hlVlYHT89UhzClRDqshedOH8RClRTBUwS4zyaDrtiA+SHG3Vd5
 vtYFgAn5DQ6h2DnurOaEvDhFGc8qMS9Iv+jYE51BkATcuC4Abhn19thHINfkTcni4gnEWj+AXTv
 3+xFprAFa4WfcggzWThb/DLa4moffPRPHImtTPrTJW/WdDcPud+eTXpHbpw6srHBrep8P+As4dD
 CKYe2/1Yw7wZelOj2vj63gp5gdCB2Or8Vx3Cy07ZZWgCxQF33wrMPdb/0qvy6HyMLgJEyFzfPs0
 EzJsvJPb7QYLbNB6V4RuOv/kfpA8r/ZHve1QNd5n2ZXS7SSaNCyyPGYXeQA6zCNZ0wNqZhaBGK/
 kqEx+F/9tGwqH0NOfOqWLc6JO8RLNmhvs1zWWewcXlBr3MkE12ffmZt56/OuWkjWHoOMkA5B/vX
 wS3he1bxp7w34OJA22+lGdAudqFheGPjXDceZFTWVATqUKvw1bJMfxhtShTLR2JJybpoiBS4Aqu
 1c61JJPWQKN4g9g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA2MiBTYWx0ZWRfX5c1LxWpv6MzS
 2OhFJt8EQnLmnzfKpbkgCeb8zPSlf2EVB+Av7b5MF7Kv5c28jR4y0H1YpqFuMg8aSc8mhG0WlFE
 F+FqyrDbmgBs4Z/AHKHhcz82k6x2Bbs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA2MiBTYWx0ZWRfX7DMJJyeVxrxA
 LQkN3g294fEAN0Z6j79IEfpK12k+QAu1xRtXTEV+kzhX9YIOOvBQ2TKiyxQJWpSASeeeBgLpsVg
 SPCX5E3uVDzVZr9WNRdjrh2TeM5fvbixyheNMtea9co6yccm6ZvK97aogoRTsHMTseWOJiyBJuo
 XBjty6wV6dEupTOLbmz5Ij8ns7iIVzu93p3PEsJxYliyniS3Z87LGj4pobXPfWGhTXTL8QTNI1V
 fcAQ6jt/OWHWe8i0/W7UmFpNIaAC1xggRTJZxku8qZtvzX6OW/mCbybCghM4a8K7utlwuh5pp8e
 m7mTMk1/JBVSYbPGm9XBuDQkSr9JEktiFy0aQgnSm97/45tXD0H28HPkqtjmJ+5BX5PPurgV5hC
 COzL+rU9PZMW9GraZk4rIIjoOZWb2DgShSX7Wv3TDRprpXk8NwPPF1Gkp1JgIMicbZs8R/VVddr
 wGjmUDZn0szaicAcAew==
X-Proofpoint-ORIG-GUID: 9EvVlB7jkB6a0OW1cbiWIDtHI5Hsyohh
X-Authority-Analysis: v=2.4 cv=f6Pdl+yM c=1 sm=1 tr=0 ts=6aedf407 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=K9GtLKQmH6Xbff-BUrMA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: 9EvVlB7jkB6a0OW1cbiWIDtHI5Hsyohh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060062

The Lenovo ThinkPad T14s Gen 7 (Mahua) LCD variant ships with a
14" 1920x1200 BOE NS140WUM-L61 panel, which reports itself as BOE
0x0d9d. Since there is no matching entry, panel-edp warns about an
unknown panel and uses the conservative timings.

Raw EDID of the panel on this machine:

  00 ff ff ff ff ff ff 00 09 e5 9d 0d 00 00 00 00
  0c 23 01 04 a5 1e 13 78 07 53 38 a3 57 4b 99 25
  0f 51 57 00 00 00 01 01 01 01 01 01 01 01 01 01
  01 01 01 01 01 01 10 44 80 18 71 b0 78 40 30 20
  f6 0c 2e bc 10 00 00 1a 00 00 00 fd 00 1e 3c 4f
  4f 11 01 0a 20 20 20 20 20 20 00 00 00 fe 00 42
  4f 45 20 43 51 0a 20 20 20 20 20 20 00 00 00 fc
  00 4e 53 31 34 30 57 55 4d 2d 4c 36 31 0a 01 2c

  70 20 79 02 00 81 00 15 74 1a 00 00 03 51 1e 3c
  00 00 6a 3e 6a 3e 3c 00 00 00 00 80 00 00 00 00
  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  00 00 00 00 00 00 00 00 00 00 00 00 00 00 87 90

  Manufacturer: BOE
  Model: 0x0d9d
  Made in: week 12 of 2025
  Display Product Name: 'NS140WUM-L61'
  ASCII String: 'BOE CQ'
  DTD 1: 1920x1200 60.000000 Hz 16:10 (302 mm x 188 mm)

No datasheet was at hand, so use delay_200_500_e80, which is what
the other 14" WUXGA BOE panels in the table (NE140WUM-N6S and
NE140WUM-N41) use.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index ee880dff5e02..d93436746c97 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -2082,6 +2082,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0d73, &delay_200_500_e80, "NE140WUM-N6S"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0d98, &delay_200_500_e50_po2e200_d100, "NV140FHM-N5B"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0d9b, &delay_200_500_e80, "NE140WUM-N41"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0d9d, &delay_200_500_e80, "NS140WUM-L61"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0db3, &delay_200_500_e80, "NV153WUM-N42"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0ddf, &delay_200_500_e80, "NV116WHM-T01"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x386e, &delay_200_500_e80, "NV116WH2-M30"),

---
base-commit: 09b4318c0e8a3d27b1fe6a2765163c1c52e321fb
change-id: 20261106-panel-edp-boe-ns140wum-l61-a476af4c117b

Best regards,
--  

Abel


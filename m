Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C463DD50B
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 08:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791449055; cv=none; b=H3FZ8NosANPH0caN/uec/RDdS3Cnd6mXICDJ1PlftuYoAGXdbi6KgFKzXOOXnlfP7zN7Nrf+iyMlMCift6DWlYCGsSiLrlw+xqIiB3uyTTJ5+YtEQ0K0TNLy0PDNDue0M3iEuWQ4tkwiPnI47t1NqSbHireARukfa3uuarTLECA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791449055; c=relaxed/simple;
	bh=8XRz2m7ODag9sGecW0L756bQlx33AeahS9N5ej7iIXI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=oZBRf/qWbpNmFCoB9b168r6ZOFN3OWzozifOch0RaIMwjL14DwOS4Io72Nm2u/Pj7dOB26R5D+F2rPCHSf8zbF60HqiJ7hunQE3yjlxascG/F6sah/S2TtZsFZtS4hf3xslxBBzk9ku6UVXXPocJ7eI9yBwfb7o2/MT15sexjdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oZmwFFOJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dqCQhTcj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oZmwFFOJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dqCQhTcj"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987K9jI1574571
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 08:44:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qvQ92t2jkdC6exdh59r8e9
	i0QzBBAbnteMfEjRvpDbw=; b=oZmwFFOJM1c+fms2e2GOgneru1/GrgG2FTBbzV
	laqmu/MLc8pqzfWBEuQ3hEKNV1m32RvNV6mGLcLs5Mnaz8kJdKr9S2Liz5IVyg1Z
	uvqRmCwiI6Uud0tQGgQW7BxCw3qX2PNYgTU4VJcJDNIL7SQYJHP+z95bxusAYBsw
	9VB7pj7BSZ9/cJ8uOcYa6M/G74WC6jCQDyYLJ8xe6jTP44G4hOMSFdfZhBzc2Prd
	WDyR/9sHxA2SMoSwNFto34nAwPo1Eb8zPkWp4wsfJ3BqHWQ74s/z2T7bJyhKRASq
	AgeWOKpT4YzWRIftk9/5gIO0NBzRyOTwlSfyyBKZThm3sndA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe520fe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 08:44:13 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1438fef603cso6649301c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 01:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791449052; x=1792053852; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qvQ92t2jkdC6exdh59r8e9i0QzBBAbnteMfEjRvpDbw=;
        b=dqCQhTcjtMqoTCqtkonQT2Q7KcpNbv8uybhjB7yz+iaztAXTjdn9FiP5P+NqUHXzod
         0zLCVVro25iTDcLr5QlFp9pCl9AeSI3vJheUc2h2JjTPm8EHr2rK/E3g1/5ygOzPhvpU
         9peKcklzCwEHA03VS+MKpPwI+t0eIYBrkcyTFyAH7M6kbequvpfs6G7G8z0DBLlXE5R/
         lujZTWk4uTK9vFDrM25OXevJyk7ffSDZ7MNlijy1SaMdhvPle1dCwaPGgFQuezEKkuE0
         iK801b7G3cA9FVmfZMomxN/MWntUpfq5UtJ9wAdlsIrw+NkrEz2wZDgw9vIHHPsaj41I
         X78w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791449052; x=1792053852;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qvQ92t2jkdC6exdh59r8e9i0QzBBAbnteMfEjRvpDbw=;
        b=yZs1ph/bK6NTe/bWfqLlSyj/KkRF5BsQWWUpKnbvd9wHiVhMhgdc3HAmtZFr08fp/J
         6yn0FOwm5gPChBZHPZHvTFmZYCXpoGd1PBjaUUSJ4zb4UgV52j6o3TNgiNthJMpF4AKM
         hwN0Yk+njtKigz4LX+MYmAPUFFVTuJvovL41+J+lJ7QsL09milW5WkDew+SEOs/Q3sSh
         fyRbYk41/tWOeTF3Y01KSpfwPjwZ2s9f22RqvuB3sQ/IqQT9WrqTf4P2LTF+qocRSIQ6
         GXPYnNiVkEN0STb+XHKq2dCiGG4HtuGoQ2tB0QKby0YW38NAQ5wCAkakDKVxiL2i/JMK
         nfww==
X-Forwarded-Encrypted: i=1; AKwUvBxoiMbXdMrhax7Bp4viyJthRmcWooBYxdiBsv6ba0VgFR8u4ES7mZz9/lCII3yruqYMwOUMLrxrAqAUuQo=@vger.kernel.org
X-Gm-Message-State: AFuF++liZcWQ2SBOeU7MD+mA3kr+uu5Z7eAVvCV2lwMpO47ipbdQ0Hq8
	29OHclIk/ZZ+PH8ZAZy5Ry4RccNsggycFukHBKlDTMHyfCqlklh9p04W7i8o8XaYf7cfPCRqI2v
	fqrQsinfEuxMDqGrYdmaSrh0FCsj9obCCAxrQs+XQIPd0hjI7zyLHSocSQvXoA05xu28=
X-Gm-Gg: AYBFou0SMStu9PGXsIc7KnCR0nQk7Ot8hcrQ0Z+3+zSIwI4dKD79mW0/v4V8uZIiJuh
	6Ol2xjntopqwt5RLoG5ss1ErEmL8KaQ2cwU+16enAOmmaHVNfQLlbJKR+2EOyeKecQzxSzotuoy
	745ZimxYd+hVjBOSxrfMz2TAbQ3oLGK3OEmRUkRd7oJ9W/GnUAMjKU7cVIUqFDK2QH/Y26ufU1W
	23MUYeKKY7pSLEq9zafhg5LKD7Z+Z8dMAozvZD+T00S29A+tCE/ha82D4BW298qAOi0ZR3gGj5w
	4OaXM1S5EzXdWXk+FoIx/RTTqF5dQZiQvA+AmcMfCBLBuJnR97YVr1fy3249h3b2vdQQDvCUL1t
	9m0yBFSo2rCncrJImjoe/ePc2+Y/Mnp1hi/33yGyNgDh6+3DJEC8rnaU2lagHLBg89mjOAQCaQt
	pOjN4wxpcBvVJKDA9AOTDY5q0XzvsG9g==
X-Received: by 2002:a05:701b:454a:20b0:145:f4:13ff with SMTP id a92af1059eb24-16209f0a817mr5723224c88.43.1791449052471;
        Thu, 08 Oct 2026 01:44:12 -0700 (PDT)
X-Received: by 2002:a05:701b:454a:20b0:145:f4:13ff with SMTP id a92af1059eb24-16209f0a817mr5723153c88.43.1791449050659;
        Thu, 08 Oct 2026 01:44:10 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35179d07566sm5216348eec.30.2026.10.08.01.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 01:44:10 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 14:14:00 +0530
Subject: [PATCH] dt-bindings: pwm: add IPQ5210 binding
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-pwm-v1-1-0b8776398632@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAM9Xx2oC/zXMQQ6DIBCF4auQWTsJWNOqVzEuBMY6C1CBtibGu
 0tqXP4vL98OkQJThFbsEOjLkWefQxUCzDT4NyHb3FDK8qmkfOHyc2is1bV+qErZBvJzCTTy9le
 6/upA6ydj6RpBD5HQzM5xaoWnLeENQn8cJ9Yz5JCGAAAA
X-Change-ID: 20261007-pwm-cddb8b3141d9
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        George Moussalem <george.moussalem@outlook.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pwm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: -Xc1G6lMFEeItOehdlWKzOKnQrpHevpc
X-Authority-Analysis: v=2.4 cv=E4dYNqdl c=1 sm=1 tr=0 ts=6ac757dd cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=YhYfuao1U0lJTJAE8lkA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzNCBTYWx0ZWRfXysSTCrbSihBU
 YFuhmCVhrL0AF37tKZd/koZ5aIHP/N6RpZmYJQVGtj03E5Nqzg+c7NeCKBY1jQDZgijkCpuedNT
 EkFSNAXztY0uEC44Ry+yJwksvd/yH3c=
X-Proofpoint-GUID: -Xc1G6lMFEeItOehdlWKzOKnQrpHevpc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzNCBTYWx0ZWRfXzUZeJBPHh0eg
 9DozaYaJmuecDBjEQCirYxhx9JQP0kOB2bVtIMCOoRM43sIraxVBGM2cnzZVjkEBNjR7eH59s7R
 nwkS2ExrQ81QbhlnZaXnPqOKZtDNCsK+AHIJj6/8zX2AxC+Q09lvc8f2LacKNBbCQRBiin2yosd
 TNmx1vHoQe8Yg80ykOHHiIRkxPeTnvBqlnwh4u+OIa/cC9fqUYtfnkI2Mgy+KQmO8yBOvCgr9UT
 bw602/PO0SNKJnfHmU9mCTEbeWm9HtiM8ySFzlftYFFom628+tw9F8BFullicsWy2q9kQ6Nz1wh
 1rgsGo3+P+UupNzXYD4BEbkLQaiKkulddIzswO/5arh3YlDVnZ+a+Zajwxz3PVnIzkWedaMTZV9
 7E+Axobw+ChT8o5jbNDmPvgjfyHjt9z46maFqzCg/r+tYzsobd6abI7cSp7NiVKxZJWmkDlewqt
 DQml7BjyCxhQXwDuPCw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080034

Add DT binding for the PWM block in Qualcomm IPQ5210 SoC with
qcom,ipq6018-pwm as the fallback.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pwm/qcom,ipq6018-pwm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pwm/qcom,ipq6018-pwm.yaml b/Documentation/devicetree/bindings/pwm/qcom,ipq6018-pwm.yaml
index f9f1f652e752..c6b9004dd30e 100644
--- a/Documentation/devicetree/bindings/pwm/qcom,ipq6018-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/qcom,ipq6018-pwm.yaml
@@ -15,6 +15,7 @@ properties:
       - items:
           - enum:
               - qcom,ipq5018-pwm
+              - qcom,ipq5210-pwm
               - qcom,ipq5332-pwm
               - qcom,ipq9574-pwm
           - const: qcom,ipq6018-pwm

---
base-commit: cf4a8255a424f691f95dfa378e88336f33aa8ae4
change-id: 20261007-pwm-cddb8b3141d9

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>


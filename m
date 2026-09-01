Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E882C473C88
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 08:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250087; cv=none; b=kHbF39R/ZOiTPk61U1Fo95dLDu/Ctqy0Xqr1cOZHDAy62BsSTy87gPnu4dDX+Q7A9bxsvsN31GWr8KcG2hEU8GFVFuj5mWGBBDxkWTvYqR+rxcdboyTjgWtK5CMQUFKVrSdgV+RlNzrto0aW9O5yi+8HxAtS0p18PVQcqFNoQr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250087; c=relaxed/simple;
	bh=sBae8R0vKEkozIUJX0qR+welSBPJeruryo4FOGtusrs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FpjkViogYxJQMbKztygRy+1jkwTGFhHXrkX6k6xCsjHJLK6Et7fSzGo253N7kWG7jwpf8Sb+Yz8TDP4bD0xUujHa886Zwes9PxGjKFFVMRfUmktl0u8RZQiww4mR3z2yOAQPQ+pvctVdnsLADAAN+wsoTAN6hpzU0QPsROIZazo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OBQuU6By; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CYuYQwWa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OBQuU6By";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CYuYQwWa"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179IG61975461
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 08:08:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	duCBHsBCta3oYMOh90c4POqqhq50/eyJ3BOcaXl7OIg=; b=OBQuU6ByxDXvGxAy
	GltdBWdhTiwl/LA/WAjgjNAM3pH2v13BzPywaOyufi+8puamuJMBwJbtJVCRjRO8
	SPoEa6CKNfYGKcJCzF/ezlRgrWZvbIX/5FKJRK+sBgotrFfJ9xoUcodl3R72g3vP
	HRnb+o3/lRsOox8aPXXoFtWb6jUYQvB8JTF99Be5kF27/dpieso5AzsFgwjnVZmH
	e/bW3YgkPtvYACgnVJTADFo/AfkkHZ9XcQQIbpAFQulf/uRaxeS67qkQKYpIxYnx
	C4oczWO4Rfp+AiWl7OwyX428+pvU3E294GnYxIeEAaDCk+6JskC/1OJ6qnUMlN/M
	gpblSQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp7r16mj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:08:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93494527488so120511785a.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 01:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788250084; x=1788854884; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=duCBHsBCta3oYMOh90c4POqqhq50/eyJ3BOcaXl7OIg=;
        b=CYuYQwWalwSj6JkdZtvSJsGLvcEvF9a747gQY58Mll9jVWE+454Tz8T81ZhBNgFI5U
         +gpyB3q81CbwZxIrt8cP5Ml5DAdm3TGzPOxF56yyT+Q9ga6bAyEsOnvzpf8mZZXTgwqa
         Qo1BrYOXZaNXHYJM+UvK16QUMHWQB9QKVLVzAXKrvKrbkvfDMc44hanKbIN+/L5kU00F
         ocniU3mcol3CgjsouNzS8UhBa+AGYxZIghl5Jibt/tHd2nZHTaS3GyiMUhF7DDFkxeUF
         +l3rgfSqSunX/xq6y9Z0mtwcWJnPYonR8ZCZ2RdaqixwYsXuKv7NGyhV3IKJBxsAJw0G
         9fwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250084; x=1788854884;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=duCBHsBCta3oYMOh90c4POqqhq50/eyJ3BOcaXl7OIg=;
        b=VDdTKc6roXKOfak+3xfYK0sro1mUs8e1YGn2dd89QFUqIFQhFtbLqeUKJHcTkeyQT0
         tkOAt9hD2DfpgStjY4ptkCixt36lfPstk7sW50fZ4ol6lgIOcM3evSTLWzA9PsKYUnIs
         Eblm88Ddv13LO8Jcuxb7zX7v1ETqfgUdGgTjJdUFaNrgDCXwoa3VHNyPn87AzEiWXPVd
         NVEdJijgh/ULhgjvxYbFpLOqFrkoJ0ffVs6AH089D9TXmWToXmx/tQONJerj2o1l9OPx
         W+Xcq3bGfcJQoOLQIN7/bLXYIdftz+HX74r3zA9ysIX5PFeYeb1YPJaEgCzekYzZUdLZ
         Bb5w==
X-Forwarded-Encrypted: i=1; AHgh+Rp+3ZLIQawTpwBpYgoUKqt5DcYyAaZvuHrh5b8spT4EI9/e4IdmoNYA9PhNT/dIxrNJ/+GVxolqtx26i1I=@vger.kernel.org
X-Gm-Message-State: AFuF++mX+pXni2jjdodqcWkXnpvIhBD1c+/LxJNCSEefo/F3kr+kwxsH
	yEi2GKcZcH4xOyX8M/KYAISINZil7+F6px+S+izkxbpYOpJ2AKikp6HCENUhdVVzH/u3W1YZAN6
	nezldaBHVSIOpVdsKR250pIYpxvIXEIe8nRJ6Moace5h0zoHmA0ZwGjcl+72CODjGL1c=
X-Gm-Gg: AR+sD11AzVPCbbnZHndJ9CvbMdiRFs9QBG2E+gpJ91fZF9tyA0Iv9U1urag416Mjfga
	gBEipHNdwLx5FDil059LZ8sXChe5CnuUcOF2/QOYPx5oObsNaJNDvJsjR4nPRoYY+FZA6bBUXGx
	hD5bvDVvhKS0fVnNqH+tJAhk1l3vOeKr4hB0CfNVYQNJL0LQkVvnp968gsNuzxHL0+CB2ACSI9q
	ZXotUAZb3fvhSd0Mf2N43hE03DevT4Eew/YMlg/bzDKaXFVVfYuokoNAWYLUuOhIxeHw6XdC4Ho
	Yr0w/6tQVCmSyiB8WiUNn0dHAYwh1L4LTtH4V4VeLnBUbng8+uV+K/EaCAEohWOW9Jgd0wjsujv
	Kh12wmxyz
X-Received: by 2002:a05:620a:29c6:b0:92e:7383:4a93 with SMTP id af79cd13be357-9391395ad22mr3407164285a.35.1788250084316;
        Tue, 01 Sep 2026 01:08:04 -0700 (PDT)
X-Received: by 2002:a05:620a:29c6:b0:92e:7383:4a93 with SMTP id af79cd13be357-9391395ad22mr3407158185a.35.1788250083637;
        Tue, 01 Sep 2026 01:08:03 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d3d2eesm3267776f8f.15.2026.09.01.01.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:08:00 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 11:07:09 +0300
Subject: [PATCH v2 12/16] arm64: dts: qcom: x1-dell-thena: Mark the EC
 reset gpio as reserved
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-12-f4ab7e4bb75d@oss.qualcomm.com>
References: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
In-Reply-To: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Val Packett <val@packett.cool>,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Dale Whinham <daleyo@gmail.com>,
        =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1083;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=sBae8R0vKEkozIUJX0qR+welSBPJeruryo4FOGtusrs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqloe2YyCfIsB3CCeMI9eWJndylkpFdq1LAvKG3
 +NzR45UhOWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapaHtgAKCRAbX0TJAJUV
 Vsx0EACaLuUIvGBBfPwkWTF32560exXX6swJSAr9zet2H1xusL+nPMZki3etHBe180T5JyJiLRS
 qkvDyA8EUuOptr/9PrOui0yTaqMB/oANSZDjDYniuM4kmaEbPgESqi1nZvSbmX7/MpXjb+5yiyE
 gRzJten1Pry6sifIutdlYOKj18yDwB0af/5LpDJsUPWZPPgKi3yGd2QMJ/aKKife7KnwfqvDeXF
 TMNfk+pBAP+kH53f8GdN0NiN7N2EckUxlQ7LQipuIPovVqiMOZgJMjwQqjqtbYezbzbs7LJ7xm2
 i5g7lHCuTbNNgtTS/fgcJmEuc3nY4SgUiLQRRhBVEN27ALR63nP+7/xkj3ehFIIpGcbFB1pb1ML
 bo281v3aDG5InERSeP+0xWSokpjnfjlk7KqmiCBJ+T7TdUagwj44MjdnRJPbVUkZQSXNVzTzNuZ
 6Nq7CX2sETXBkWKUqFSryJnazHGN1SliySUUacof+cmaBcj9gsm5AJykZtjlQQppMXrG5F8n9+A
 h3f+pTEfaA7eWmaTM7/9fhFZ/nTtBaYfh/RNMSJrVWysZGJGJjlR9d7yTZ7ePKh3ipOFe/O9DTh
 SdOcHIO2mH6tGuDcWvtuFEUZw4t233JV0iWUfLxtHcI4qx+CDo91s8ygmYHXeJG87ivGBL8qVXk
 leAEHfslB4H9iww==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=beZbluPB c=1 sm=1 tr=0 ts=6a9687e4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=UFfQ5ueM2aPJ8qDrgdoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfX9mJMMw/eFhRL
 Wxcpq8w/v5WeRzpIt8UNAwFHWZdo6lLmeU39lgDZU+NK1PcA/rkOfggb0NaUQv1zM4KfjQ5cNPN
 puKxt5nJwEuXy+GHi+iGUbKx2Uz4SDltoCbHTdCqmyVyCU9cBMH/ny4/CQ4LzZ8binPNDluXkxz
 z+qsywuGkMCJncBojLPxE58hGjMsnSfeO5YeUMAYVzV70MmUFj7ul3NSE9UJt2prYUul9WM2FzF
 JPG6SSr2X0tjuTHCzhbZUSTSou4xmJg/DC1+wr3xOvJbAhZYB+uIHLy8U4lhWBot+2DTEO2Yjl6
 1CvYBqS8rsefSDc0DsxfxHp1xLlqRUHcGTH3EFloOg4De3m8RDyNuQNkAdahxE4PIGb//sf0fEU
 08w30fXiWJP2pGOGgs6J/gY2Dwpe1YqbueM45xFnKfYwmvamtKZJGCnHycEgHimwjZHl5jJfziM
 +hgrDssEF+NA0mQSu6w==
X-Proofpoint-GUID: CEBBIpljVg9D03c5oLVebJy7CDRyVJvt
X-Proofpoint-ORIG-GUID: CEBBIpljVg9D03c5oLVebJy7CDRyVJvt
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfX79FCldbnIiSU
 mLUclNhuPWoeGXkG6Dk+jNjGG132z8aCJ9T9shRrmce7ze72SzEkOWCWjG7RYdwpqX4q03JnLGB
 DoSfDxwMUFV0ekd8bpfaxXwUfep1mSM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010071

GPIO 65 from TLMM is used by the embedded controller as its reset line.

On some devices, toggling the embedded controller reset line makes the
device not power up at all, unless the battery is unplugged.

So reserve it in order to prevent Linux from requesting or
reconfiguring it.

Fixes: e7733b42111c ("arm64: dts: qcom: Add support for Dell Inspiron 7441 / Latitude 7455")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
index 4cda708455d8..b367eef085ae 100644
--- a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
@@ -1303,6 +1303,7 @@ right_tweeter: speaker@0,1 {
 
 &tlmm {
 	gpio-reserved-ranges = <44 4>,  /* SPI11 (TPM) */
+			       <65 1>,  /* EC reset */
 			       <76 4>,  /* SPI19 (TZ Protected) */
 			       <80 2>,  /* I2C20 (Battery SMBus) */
 			       <238 1>; /* UFS Reset */

-- 
2.54.0


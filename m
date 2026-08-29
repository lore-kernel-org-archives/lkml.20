Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C793B585F
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788033224; cv=none; b=RG9Ac4mC3uj/m6rgw/bUcUR6/TmhiTzN93c5rkCzizDrrQO5CmoIlQ8rRCGYG1R1DwJresEa5fBUESSwefQNpCXlhxrV4W6hMo6SJ0bVA1qsV3CzXGwVfaAVbsinI/si9o1Zssh3gQNAxQFnHwT+1lXCoZcwUGUjjgv2shSWBV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788033224; c=relaxed/simple;
	bh=dycdsX2LY0tuu1ud8cW2TLZg6qlXAf751T0VqCGeNHY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aE6yKYw17WX2uQ5Jrw5JA3AX71jYBSMYKVbT8OfMc+IV4W77CbCWQmf2E3Gt5eqH0Nc8QyfKjF7HJGWynAA/z2oHdevCeXuQBmixWOrGCk3AYUvek9cR4X20F8NkzKJ4bUjGcwp03vmjiQzfLAALE/nzSpi9PJVtg/Lip6FDog0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WjNMfjd4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gRmkdttm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WjNMfjd4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gRmkdttm"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TJkpUI3797803
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:53:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FLqqv7Xex0VKsby3JMIwwfwTQmGDJCsxSwMP9TchycU=; b=WjNMfjd4j7Evv5JC
	F1TYnypC8xqjIfwiVBLT7UKza5i8Afg810vFvqXGOQDyIRucr4Knyn9USetSNvhk
	dODk8zryVuAGqORzRdiriwLhxBGe7nDyL2RlJ1gEgV7qVqwICxroeO9F4I2HC8R4
	mA1r7PNBr7vt5+/LZO553vRFeROJCYGKx3Nm/su20i35BTJ/O4c4oE6ilhJ1bt8/
	6IzVM1NtIVsEKk89C++UzGb7aZt18Uq9/2xlp3e4/q2LhayXNB54FHjaJjgG0Zop
	1+JDU0s/cp9lO0LTtpq6K0aYcd3TzPwUMMhLGWPyz5ueW9f2nOSYwaWDJ36piObY
	Shn9FA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqhmsnwq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:53:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52fb2a46cb5so54764241cf.3
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 12:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788033221; x=1788638021; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FLqqv7Xex0VKsby3JMIwwfwTQmGDJCsxSwMP9TchycU=;
        b=gRmkdttmRsJrWHPrn4AyS9nQMJnyU1gmhzNkrINPvuaGYOfXNcDhmys91Ru/eRjcbo
         l1t2PzsApoyla/3XaH7NtEC2Jcl0gLjJx/DiXlmotWT9xB0M7v2Yn4K5RalwY+ab91B8
         Nt70c1CfDZ5Jvb7iprQWe13kjP0D7oWPnMfRhslZdh3uB5y0r2YVnN8gxHYSwZsPoQxQ
         qZine0R8b7/hdwyy0TSclIyipH61ZFdcIJUcXk67ntyRETCezdvw2J/tUnUGbenPD8Jp
         IJ/GpZNbngEfe/5LMPJWTra1DWMKfAonXfgUvE68Peig2h64V17r1jCuQFcnI+Kr3Nyq
         +WCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788033221; x=1788638021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FLqqv7Xex0VKsby3JMIwwfwTQmGDJCsxSwMP9TchycU=;
        b=RildKqD8r4/gAhYFvufxvxjiIS8cnKHpRPofCYNzf9o5p6wV1gytiNbW25Yx+zMvh+
         rBeDf+4fH/GYxCMNC0iwPOECjP/hplIXpzXW83ZP2qlLk4flRyfKmyZ9ZFGuKSw81+QZ
         u03Xj4h94uCd8ijNvG4gF2VyC7alahUplFaK3i2firHueOfyju5cz3mUfEvyaZ8g4JO8
         Iuc49Y+Pg06VdOrHUDAQX1WQWTrWsgXf3YBUnBwCV1HlBBMkGot+fS+c3dZi6MpvwQEj
         nN5ARhrRpcPCtcD43drOxVJDzGN2vq4AkgDG7CIflSLyI8h6hk60uwxRdSxd58/SfHwX
         ArKw==
X-Forwarded-Encrypted: i=1; AHgh+RoeT0RaaA+nRXQGTuCzRX834EK+pvvWT63LW2dcLyF1gssBptSZq0RGOt9vy0r64u5HrZkvahofW+p4kH0=@vger.kernel.org
X-Gm-Message-State: AFuF++nVaRRtOHyUK4dTWOS6k8fjMw3KFyNwGzp87P7WvP/BlKrXn1Cu
	mpEzkTbEAes77r5da5aXOKH8MI7fHUpLrk3RRSiM6+0xkOegVMGESD/pQ8oj6TLhkgd+MeUux4X
	W4shQ2j/caGa4K4fM6Lcsv1ZStWUdZqqiOS9tlZ0qayRubA6fIKyxqWV0UJ94aOmrN7o=
X-Gm-Gg: AR+sD12n4Q3/VZhC78KXNag8RgZM8RjWNYeSIdNYVr3Owu0k4D5uwC/joieG3qQuBSh
	5ez3fRUn0O/6zbMGpyxX/YpB2dFb9wFkBS/XcSNaQ4XY5HOa7/2TJNZez9JPgG9t6jyzgiRowFw
	H7ffvy+2/wmEK+b/0DBS4Vizm6g1CmftGLKZg5oOCVWRlxzCvdmFpV+xMKUiMA/a8CPfwqdAEz8
	vW4/voc+UbPp8VSo6KgcjWIxB7Zfio2R3gEN+LeO0KCBRD/M53uqNCDMAS7Ccs+jNrNtp3Is06/
	DPJPkrm6ACBrA0XLBFteg6glSJYR2jEppYUNZQ+6Oeul2GQ//KmDukOC9hokUdNvfkZPtDJzjEI
	+CmO1YwQqnAMOSf5AkJWEm6M=
X-Received: by 2002:ac8:5a47:0:b0:52c:ce3:6428 with SMTP id d75a77b69052e-52fb9406c2emr188620871cf.16.1788033221168;
        Sat, 29 Aug 2026 12:53:41 -0700 (PDT)
X-Received: by 2002:ac8:5a47:0:b0:52c:ce3:6428 with SMTP id d75a77b69052e-52fb9406c2emr188620611cf.16.1788033220797;
        Sat, 29 Aug 2026 12:53:40 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb32d30sm12446343f8f.34.2026.08.29.12.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:53:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 29 Aug 2026 21:53:19 +0200
Subject: [PATCH 3/6] dtc: dt-check-style: Process property names with a
 question mark
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260829-dts-style-checker-sort-v1-3-6693a37d7ae1@oss.qualcomm.com>
References: <20260829-dts-style-checker-sort-v1-0-6693a37d7ae1@oss.qualcomm.com>
In-Reply-To: <20260829-dts-style-checker-sort-v1-0-6693a37d7ae1@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=897;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=dycdsX2LY0tuu1ud8cW2TLZg6qlXAf751T0VqCGeNHY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkzi1M6FTu91NY1SBmgg0xEPok0ROTAiRjObPU
 olIxJWoSByJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapM4tQAKCRDBN2bmhouD
 1+m9D/98jluDhW9+SsoMwYVRsPCcJ90y2H1lC+3IKDHRo8tjcyXskhGPXRRcxwA53Kz3oOw4JD6
 6H/qdwo39BJA8GkQOfH6eCdWFTzgl8O0oXzJS7SL1Tmo/2fh5k+VYLg4S1xbjnfhnTwgOV9QGkC
 Y6KtdhAZo9IaJ4gMZORbfN4int3j/oBEgoEbC8isUcM/JRybVfkCzAdVx7Mt3OKpC2/ILAYAi6w
 Wp+gQn7wjYocfyaz2gIFxLNJnO8Nkau5N02syOcuJo+ebImL+hEU16K9IoTo/BI2CS0eNDtewGu
 2A92gEhkJMgevO1d8DlKCdlLP11l0gt485D08JTuO2PG/4meSkEjsapyBru8lF5VL1H1eCQl1Z7
 ov/Tf/H7J7N/64gVic+xa5uhfqlhctu+CkZkm/GBUeuk/5QBItpYaG5dAq/1GBW+pkzebttwPUJ
 fOwZnnNDZeW41Nrd27DKna7hiKViViBDp1S8VKGL96rrTC9tPVCijGKnztHrPPAH+TbAjsmjDwY
 JNOGQQWal6WY9IHDaiGGN4MpVzHrG9eEbSIOcXrnYwnwPrgPOMOt96j/+NgcrOHxC+IRVQWyEty
 U5e5RU+cZ4QKR3yVLXt64KoZY75ZI9iAONGq/H7Fs4i8h8xEqXV42QEtwLyvciGzpZtjf0MKFkP
 2wlaDk+fepYB/lA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE3MiBTYWx0ZWRfX+7TU74RCf+o2
 HW5mEYPU1d2fv0J1BM0HfTWvSaXMcpo7wukexVQRJBn+eWfHbixk0fzJZUQyp/6aSh7WenEaf5b
 lw/D/Wv9MATyv0yynkFL1OrXY/TWtyn6Dtt7T1TbOf+r0uFGSCKKU/5/Lapyu88oyoTuqBrn0aN
 2PCE6pUhtZIyIzABUhLkdduge41DXw+FKbwqXzsLh9ywPcjm9JoVsKvPeit5UDXv+PT1Xwe3JGT
 AwLOOEQ9g2QFfYru7jX960kaV5+K/5W0CDv0f4WqrizvkNVVifuebJo1nJW5cO43zgDUGUpswdg
 c5eA/ViivStI7MuWpkmWGhSRUqdOGuRl6N2Mo5Qz7SGoQ4Qo2t1KkxpWT2Pwm7fFmNzOqIcIBY1
 wVS3ChqaohSmGyHpNR/UoPCyPUAwNNPjh7ygOXYjb7EDr4Sg+n0nJ5wS0vS9oFgeoUywjd9i31h
 hcmIFMYjJI7lOArQEFA==
X-Proofpoint-ORIG-GUID: _ELo4WQuY95_e_btUdU2qEpb0pKVBUAq
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE3MiBTYWx0ZWRfXzx+EgnywprAi
 xI2Iexhse8rXjxlAyJf/zVC3pxfI4fHYw3esG2LOfl7xzY+8u0qycio7W3hLfN/AjW7cUGNLN5v
 gq1xi7Ejl4SawlQYsvEQH3D2R58BYLU=
X-Proofpoint-GUID: _ELo4WQuY95_e_btUdU2qEpb0pKVBUAq
X-Authority-Analysis: v=2.4 cv=bpl8wkai c=1 sm=1 tr=0 ts=6a9338c6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VUm4ztGfwmjKtcs48IoA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_06,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290172

Devicetree spec allows question mark '?' in property names and such code
is also accepted by DTC, thus catch such properties as a valid code,
even if discouraged.  Otherwise certain rules checking for property
names would ignore that line.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 5385a03f377e..7c3ee1432dc6 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -280,7 +280,7 @@ def parse_node_header(dl):
 
 
 def parse_property_name(dl):
-    m = re.match(r'^([a-zA-Z0-9#][a-zA-Z0-9,._+#-]*)\s*[=;]', dl.stripped)
+    m = re.match(r'^([a-zA-Z0-9#][a-zA-Z0-9,._+?#-]*)\s*[=;]', dl.stripped)
     if m:
         dl.prop_name = m.group(1)
 

-- 
2.53.0


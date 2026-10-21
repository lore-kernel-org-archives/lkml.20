Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792574780;
	b=lmcBAXR95E21hkGUqPIgIV//GAWJwwIkQzsVrcna4idELjKiR5mXWHn3V/0tMSrNRXt3
	 LJe9QEmThQwTN89j3a5URO3XRYivqFuKHSrqkMdJOFUP82YoVcqbqhh8tRQCin5AqbsVM
	 4lAkicUXoOf0ztHxSfrp3B6uky5NPQ8C/Sxv7RcxbNmB3/32jxW6YoktpgyVqkUthkOUl
	 cNsmtHnGwasYBdVQLyeOG0FP5//gmZrjlvbP3k7CZ2dGPfp0Pi6I72adnkMafuMwsBsh0
	 8/K+QcVkfiW9I9HE6UTQojA/Z3jbqI9lgRUsPdkuCACvYekV+ANFYtxCWNGGKHw9jnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792574780;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hnuqUzzjgSEBIaiHp/opE7urPU3XKVrRGqxwgy1tl/U=;
	b=eH4X+58ywIvniOsd7Xi+9WJmOq3VYF9WIMBptKwhGh7eTbRWVxR8qIIqML02BDOa5jw6
	 8xPv3iBEHfIU0NFotPukkX9Jr6Hl6smS4Jj3yvQyjM+753IRIlUbIjCxfJqfrocHBGVAS
	 y5sV4HxO+ZSKL/XV9MN8Is7lPdHdG2OJEbuXzeopxnOgctUURhI/IPOoFXPUKhHmkjUXS
	 Y6lAe0kDi39R7zu+9FXBnAjIIi9A0l7C64xZhb8DgJF7ecjvXjuDOUc07q689ynA85qw3
	 vrNXy3182c98yDRXlX63xXWRB+NzQ4d0EtKJpP56nFvUCqGGykNC6t8ryKqc8E97MyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=plflsPsJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IXLV+xap;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AC7606A323
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:26:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45AC7606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=plflsPsJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IXLV+xap
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L8f2vY082660
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:26:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hnuqUzzjgSEBIaiHp/opE7urPU3XKVrRGqxwgy1tl/U=; b=plflsPsJl/slmmFd
	8laA/Z9kJZCWStJMxXQOkcWyDay+oJ2fEmOmVFeKTM4jYKgyhr3OrHifdPCQYz8l
	mpXyze+EiZJb6FHt78FWA+PuJy0BCL+4klqDsWFo2hKVNTUSs2gNS/pg+VEjqlLb
	WhyqkgAUms2zus4Z4QV2LDQU/PxgPO9dofMjBkbpmCRqDFV978rX03HjsyE8LwB+
	q3U/wtYQtwu1/bI0KkUirRdiaX+3Den2B2EG/NT5iCvdGMqG9vhHvFQE5hMIcEr4
	bWJg2YBpg+RhOUsh2TCM0vcOjOaTjJQrUfPFnRm6yBqvwA9Tq4/eOQoEzjv095ea
	xP7I9w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heh5r2b39-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:26:18 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-359b81ad4e8so908437eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792574778; x=1793179578; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hnuqUzzjgSEBIaiHp/opE7urPU3XKVrRGqxwgy1tl/U=;
        b=IXLV+xapULjOV7O7OBpSyhgEPGcmUefGdtFWO9l1jf8zKUzEBCJnnONFhj7L2oDnPM
         casK/2tSzzjYc7G/DfOEk8K2qWfplmoWOO9zGEQFKBNi1nHojvpkQk6JvMCek8yVCB/r
         dq/bwZ6XRbu8QqgOETs79IyKMvZt3gioBUMXSHfdExzs0GBY72ul8Qc6tpdoMhhdIsX3
         ck23GXBBbdbstaPo8BJS58Hnp2CimmG3IAHWZYS9l2euAT4xqqk4Nzv64+DXOleAWxQ0
         +zUBDjb4KB77z2oTlQWxQQFAeoFmY/hLWhHy16Nu96rgkccB4G2QgNgVU7p0d1pao7zD
         WlZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574778; x=1793179578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hnuqUzzjgSEBIaiHp/opE7urPU3XKVrRGqxwgy1tl/U=;
        b=SWv2smbzRBRMClNj1wlUaBzEUSo8ZvU3nmxq50dRrqPZE8VSf8No3fIpePqv5zh8xf
         BIB+W+Vp2R11+0eXw9l0XE9KRrkhmWT+H+vwdSzhPZ5p4yiGl3+NKb0WZASSUhGOunV9
         OL5LaID06N4RO/qVc1DkQJQn4qaxbw1hy+n0JMQkHapiKa+MZuTbtpXtpAE+hr9AF3Rn
         0Es+KqqhbxwsKnQv8hSCSeiPYTMTRyy1fI+eG6NECjQqbWyit1Khq0ZRYaXYXPaXY2qS
         dD3n7qAhmeAJLWzDq+mbsBsT73INDB82eUIh3Wx6fEgUgSiQuNa3HvXEEItYj1LeTtk8
         7/mA==
X-Forwarded-Encrypted: i=1; AKwUvBxjNuhclxsaqbgWePb7J/Qd3fBFiaAYOUQbZ5O4PEFda3QT4846+ka9MJstCMtmJ3svjYAdslJqJQPkf/8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIW8L7GkS1qmiQSX2319xVha1cW0ndszbqJ3QH9XgOayKgL1r33
	E561mdQHXhMzqiHRsgrPw1/YWtrWs9Dmq4H2/Vz9zh5mDkBIsbMtirE3vU35ZV2u0NcibN93EJU
	oK9N1xNxLmj0Lwdzh0E8x6o8eh7cZf9x4df81QKUUcCufq4jhNQJETQG62pd5+75p+Wo=
X-Gm-Gg: AYBFou2Eaeh8O+Nq98otUXnIHczQivrvEEbMKzydNSvYIm1uZAC/aKhOLORwYe1b8XM
	J19sycGOBoqUgrIS7g5Oi+uKLaCQgLAowLZN+XFKrSxmm2JcxAQ21c6Dvxp9BHmsB9cQnTq7WoF
	fJxzJoKPDbtlWwls7knz6O2sZpaEi06+4yJlA+H5GcZNq+CfxGP3Jg/GhZ7eWS0e1deey/8xzHi
	b5hcjB+BL3yu+E3AZXgSSY1WxZT26JQSuX7Tx3//OMWrUrdr/63m19jyau+ykhhlvOhaz9KcuNM
	/4CCn/36kYvqGy8O+cKU5cKOvAnsOqvmMw2QLYdAxEud6Dl/nGQr7Jb+jgw+LYzT8T3Iwnon2W5
	3hS8gKBk7YQSL9f777mRvaYe2H9shqyEg
X-Received: by 2002:a05:693c:2a0b:b0:351:bb8f:540c with SMTP id 5a478bee46e88-3674df47953mr2657635eec.35.1792574777868;
        Wed, 21 Oct 2026 02:26:17 -0700 (PDT)
X-Received: by 2002:a05:693c:2a0b:b0:351:bb8f:540c with SMTP id 5a478bee46e88-3674df47953mr2657610eec.35.1792574777323;
        Wed, 21 Oct 2026 02:26:17 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc8439sm6155671eec.11.2026.10.21.02.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:26:16 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 14:55:49 +0530
Subject: [PATCH v6 3/3] dt-bindings: misc: qcom,fastrpc: deprecate
 qcom,nsessions
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
Message-Id: <20261021-dup-sessions-v6-3-578ab52ba66c@oss.qualcomm.com>
References: <20261021-dup-sessions-v6-0-578ab52ba66c@oss.qualcomm.com>
In-Reply-To: <20261021-dup-sessions-v6-0-578ab52ba66c@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        devicetree@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792574754; l=1219;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=VMGzKTCz/azLzKyF9qh0sYFoOD2oiutFm8UHF1H6/Mk=;
 b=RHAEq1iBAsEUcfhN5ifaU3s8lvFXOfr2CVxuqoWhnvopFuaiUrJQ7klbFFiD8K7RDMfsHBm+u
 5aoeemGEKNdCeJWePMuVPimsjC5W+qMQiJMLN4JEAGi8CTSjmPNb7oN
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Authority-Analysis: v=2.4 cv=aI5lOr9m c=1 sm=1 tr=0 ts=6ad8853a cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=e51zU0WOd6sbzzcJbsAA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: YY1nvJ2OOpHgvAt0yk6kmEGIy7yD8J_P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfXy90MLMqGKdhz
 f4AW5mkgaa9NcpWO63TkV+MWpIxUvB54vkYnlTW2TaEC9ZLd6XzgzHMWUnoHr+seTcu5Yx4WoFj
 2pamSZVILg9Ni7c9N/W0ab5AJkS5dmkrYeVDmHFTU7/cwd8j+R2Z+ibbtrP5s3RYFmH/cSqpgA5
 zWRJP/Mmu+g9do/jsIP5knPeSus3mV9imLB/beNfM7Mx+pLTlrfq88BfAz+VVJY5QZRrDwxMWa9
 ops8TOXx2dvoQu1ddvDPiTNy5g8G3cQFIhVsmcittWBB8x77wyO9XU7caJpVTZDtC+7X97nybcD
 xZ2cRiXCsjB+0xXr7QwpLcsVqgst2xy6C6QylrjtPUCIkT1FW2Yh3fAgFM6Dh5cKptX4LDebX6e
 jitXGO92/dKGtoJff9Mc9485NJI07F6Shsnq3y5SMw6sJSB62hf5h+tKS4yND/Std7L8vJV3EcS
 eoYbTH1cFBFNJ8o0vtg==
X-Proofpoint-GUID: YY1nvJ2OOpHgvAt0yk6kmEGIy7yD8J_P
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfXz521mC7K3W+Z
 qxPgtwtvIXZMRyBYkTswHeefMIEzaLg95bt6ZdY+5l+4TE5f4JQIGFoSslnzC7qe3fiR6KacpW0
 U71sO7CLCCEBpb3OAXOJN+f1odEUvms=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210037

The qcom,nsessions property was used to duplicate FastRPC sessions
inline during context bank initialisation. Session duplication is now
handled at the driver level, making this DT property redundant. Mark
it deprecated.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index 49d2a5e8ba39..e945c8ba75e3 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -101,8 +101,10 @@ patternProperties:
       qcom,nsessions:
         $ref: /schemas/types.yaml#/definitions/uint32
         default: 1
+        deprecated: true
         description: >
           A value indicating how many sessions can share this context bank.
+          Session duplication is now handled by the driver.
 
     required:
       - compatible

-- 
2.34.1


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E003C374E64
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790327403; cv=none; b=uaveUbqI8+gVpFu+h7FXqtBXO1mPF1GDpiYm3KrS4DpVkVH6p0FDT0r/X3Xth5VK58N+751OhLC2efiUR5eIOEjtT1pYMRxMNzcAShA8AnUV7c4coa8PIyAf5s06Lv0H5W1FMWbxyJcwYzCNJX/UOH9/BMzWAaiT91rS2ngEfhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790327403; c=relaxed/simple;
	bh=H3FZ7znaCS6E2tCa+3jHj85kDw9yZ0pmbfqMcQI6JqA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rsIm8UPrVvlyDiEzEVnU4tTgp7O7G7jBJa/iBNQ5M/DERxetT5v6RI1fHOZs61+UdHNh3KdGUeoNqVTNx7N/IKhQd7KlmNJG45VzxpFgm+JDTZ0La3hHrRFU2KOwIuv8pet5zzXnc0MNPHhUU/S7d8m2NrVO+LJl5LlzoZMSQqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IvCfmozJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AhvRiYrT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IvCfmozJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AhvRiYrT"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4Yi8m4102869
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:09:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PagDSuh7l2ZhcYiXNCHSTvc79NuxyK2nfl6x2BVYD44=; b=IvCfmozJ6Tw88OYG
	BQftPtdyHnoCJIoCSWojfqPs3/I8gxD/0hGPQIT4LuU8U61KiKfUWNFjZjt4trhu
	CJrIPCjCpjFVmvi261T3d1cyw6cEIbFaICH6lRuw0tlhPt0m0JXRw1Iefo/otIPS
	RWX6N8dbyJ1MGnhuWlY2EDFBb8izgok5qdU/p84Zy1TWp1d4EnW89KLCR02EuLGx
	t8Mej/ANUlLDMwfc9w8y3w2ls31dh0xykVB9aIakGe58dRZk/N0gOJBQykkwynVm
	B8kXPAcHAO6i6lS4C6qsra/nKpkz3GQ5KBj9GQqgSdBgoY87P9AFESDeHXyl/fwy
	CkSzYw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw5q8un9t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:09:58 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90e80ce3597so14706046d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 02:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790327398; x=1790932198; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PagDSuh7l2ZhcYiXNCHSTvc79NuxyK2nfl6x2BVYD44=;
        b=AhvRiYrTn4VPsMthPWcebWBXXIXWFUvYxZUX4uX6gcIQLkh5ZeGkoemWW8F/7N12r6
         uhiR1ZjPV38+dj9qE+AhWgZUS79yF7KX07AGP4f41XW90JhBxzhFHkk+xe3rC8kcy/ov
         S1L8ieXtIKFKU8LztCLHCv3n3tsLUxEYKroTeZ458Y34YbpRQA7O5i68izMt1Jzl3Uvi
         3xCymafp4lH21Dx25cXi/fmtqtDUh67WnAQeHdvDEN2VoxfmBUQVmGS+NIblOku1hyzP
         zD1ats2SN+UDVCs+4veWB1cWJsGgvpyKApKZ696K3rSkLHl+eK7xkMarwtWRCnQg4UwT
         AEHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790327398; x=1790932198;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PagDSuh7l2ZhcYiXNCHSTvc79NuxyK2nfl6x2BVYD44=;
        b=mhHnOzcA6Lkz5XCyTvon/pfWxaSJfiiVE33RdRZY/PrwEQcbolCFRArXnjKeidPozw
         lhluxuAoFIJgn7YM7jlrUvjQkKW9xjc/3X6Z8P55ZhRnLaAo4GPWp2YTxUYX2/iYSi3F
         xJExsqUe9jvMN/0o8Q0FuE+Cjb/JReijTnrCJh8goZwWEnh/y2s65TkXj/w8+61L9fQB
         dFf5Uq9e2itR5lpDoORBjTHTjGtKg+9ySOqfw8/JXclNM3/Z2VamfDrZ6LyiddRaD1B8
         uJRHm3E5HeUL4HMZQna+l85Fc/pxfRJg9u6dmeErfLp9JryskF9Cx9js+cmz3IjPv84Z
         GGpQ==
X-Forwarded-Encrypted: i=1; AKwUvBwKBUBHsa2o3yaYy4CLKiAFLbkouFHFRCufztfsQbf7g3QJy4KZvOk+dR82jcejCzrOqgAXh6kXRWa34vc=@vger.kernel.org
X-Gm-Message-State: AFuF++lDtnisHLz0EIw7UJL4I2zyg7mcZ41hCCvUSzoIZ+fJKRDXDRCb
	CebC6AqFwD9wjebI2boagIu0+lK7+v/Xs2625T5Sw4jCEEJOXJ7nU29WxHAusIdcoc+4KkGIW1Q
	A4IX+Q0GC8K7PNBfOtdPkIAGtNy/O904SxlvL10GTOFaUg395/+3wmTLBdi4EjsnP3mo=
X-Gm-Gg: AYBFou0txhvEx4HQ4dHCNAemYv8qICnYVdcxl6QIDu9qlhy/mkMEJI2FSKkzfEGkaE+
	w1REWQ1Xjf0mpH6b9owKrHTqkYBjCp7hZYaC3+WQ5qAS0TVSsbBLb6ZQ8SXSnWURm6IAg8oDZZb
	NbUWgaRjrEhHQxCpdgj8fnKpFERyyjuCFSFrG6atqzTat9gR954wWt7HyH/vnMSJi5p5u4iSXs5
	3K3OYt3O7igLPV1xJCfs2z9RAjKB7x5oAvqyKCXkLLUP0rAVGTcrd3biB9Akmn3eHpJSaOk6WeE
	sauSyZqgA5FT5MYlEK/6cod+3Ww6SoOmZUjYlDpNLm+8TUqlKUyidcxXYHe9aAiQ8zlN7pNIsqI
	90UVhtolCbCyP9Pjeg11K8Is7/b8OL89fPPZGc892MwFCsRZwjuHw8NxAuox2QQ841AOK6KWpVB
	utFjfd0hKi8S0lSuZtHR94e2X52KTNwFTu3KR11ItW/WbqgW12enQ=
X-Received: by 2002:a05:620a:471f:b0:93b:d7a3:45d5 with SMTP id af79cd13be357-93c43d77939mr320252785a.62.1790327397667;
        Fri, 25 Sep 2026 02:09:57 -0700 (PDT)
X-Received: by 2002:a05:620a:471f:b0:93b:d7a3:45d5 with SMTP id af79cd13be357-93c43d77939mr320248985a.62.1790327397175;
        Fri, 25 Sep 2026 02:09:57 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:5c1f:3897:a4a1:99e1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a638sm5269890f8f.9.2026.09.25.02.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 02:09:56 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 11:09:50 +0200
Subject: [PATCH v10 3/9] dt-bindings: media: qcom,qcm2290-camss-ope:
 Document shikra compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-camss-isp-ope-v10-3-2622411034cb@oss.qualcomm.com>
References: <20260925-camss-isp-ope-v10-0-2622411034cb@oss.qualcomm.com>
In-Reply-To: <20260925-camss-isp-ope-v10-0-2622411034cb@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzNiBTYWx0ZWRfX3Zg4vh9HKRfw
 ErpmNJ6pSMEzVkQGJiwEHPDdzj6BitQnCuIwUef5wYRcVcqmx72jrgifeZllGZDyuyxWW3TtZZq
 cxHi9EzHLo8QVn+IKxmSASdGBANl/uE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzNiBTYWx0ZWRfX+hnMR9C+wwlc
 xXbluJW+H+pe9gPnZV55BaHApIq8HmxH6g8Cmd1j/spwVtDEb/CNKXj1gm7cCiHHvt5yYVBDzQ8
 fpSFi1xaHcfKkWm9fuPtftMz4tP+dqLLBPZ3CMxqDo9ogFy28Mi23l9IxhUTsAkTkLknSa54AUe
 2PSWfTEnm2E5DpRCDDDu0tDTQiTjOnTu0EpB/T6IXyfSxOZLjtfpYURA6ej4zE5tFXjIG6QlUGw
 SAW9zV5IqeR37NjP/hWE/8HyAR/mYmASheu3xBD5sco/b5cZ3yqnLH++SFqNa4SZvnrR2E6le/h
 oxTeywgAUoHw4XsMDRkVnJc+SJtCEa+Ow+BFH1bOWbKVgYe11HEursTSRUX93mSJnlXUep+KTUf
 PhTevHZORdvewmgFXUiz8NQUQu3GDimx7dZDp8HSAN8oQun6dBXOslmxdqpWwkwmtsPyfm9+Jc0
 EGcHPozJ5IBkzix7isQ==
X-Authority-Analysis: v=2.4 cv=SYRi5fRu c=1 sm=1 tr=0 ts=6ab63a66 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=yPTVd8cUMD2GasGf7IAA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: phxMCXwqSJn8ctJjp1HT6EJN6SODVe8V
X-Proofpoint-ORIG-GUID: phxMCXwqSJn8ctJjp1HT6EJN6SODVe8V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250036

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Shikra uses the same Offline Processing Engine hardware as QCM2290,
add qcom,shikra-camss-ope compatible string with qcom,qcm2290-camss-ope
as the fallback.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
index f9c31bc88e94b028c241060bbd8e56e0bdc49af5..3359581bfb13e918bb4efb3bc41749e60d772ef4 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
@@ -19,7 +19,11 @@ description:
 
 properties:
   compatible:
-    const: qcom,qcm2290-camss-ope
+    oneOf:
+      - items:
+          - const: qcom,shikra-camss-ope
+          - const: qcom,qcm2290-camss-ope
+      - const: qcom,qcm2290-camss-ope
 
   reg:
     maxItems: 6

-- 
2.34.1


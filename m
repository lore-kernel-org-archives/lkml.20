Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BA651FCD4
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 18:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788804637; cv=none; b=u+wpWGYT7Aw596+ft4YQa6Y7xUNmIkVqdm4r0QfTZInLDce1/4dsCjsQMbmc4OLr7u46sBM5yjRBCoO+Vdh66hoWANzTdx4gNiAc3d7o40qZ+0714RYq0J3dkeHEdViImk19mEX4wdAx3DrkDCNBvHdNbhFGo8rIM4qxC9653S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788804637; c=relaxed/simple;
	bh=dS0jDXHlVW4llf9vuhR2+deqH3p/w1Xv3ipBNHhZA78=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SvSUzaqlR6wLfRDX5PM/7kykcqdF0bKTCg08BciNxzWVqFqN3FJIM7WsuooSB7vyplkidTOeyH3lEz+6nBSBnJIfnC0x1nPfAFmYillPA3abbQt/QLoBvw7OwSu9roCsVylcZJgqExW/u66sQLymqpF8KGrTMP/p/onvQjH3qIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L47wz2Zy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GQrtRaTM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L47wz2Zy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GQrtRaTM"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687H7gf41642023
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 18:10:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VO0PQiHDx30LGg+w33cmq8DXc7nasM3WGJcKJJwoAGA=; b=L47wz2ZyTd6YmryH
	TG1s5xAgB4Fb1dilaDQqIsFq4S5A0Q8FgXU/fSXRu2pv9oknmW3Nocxxj8FudemY
	o6VvbLm4jThfJjCLhB80en7CQYNqRDtVMAHiF0LcuASBwEgnmo8wO1A/IrfHtb6i
	kLVsexJdkEHhTDEOrJrG68gnBSbnuyaRf/kOmlTgFYeDVVHY14rFCfjwL8RKwXfB
	57X5b8GVhHur7PoJKufX3qAe5ownkGmweTDILfCPqVCA8MtUUVanvxj4z/WE7QqS
	Eod9S9EeY5krKlCmnd9Yo/jdFXjKAm45S4ssLyTVIx42KrVXsC/3qxFWnbdLJbAv
	NthG6g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghruaajyv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 18:10:35 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so5030828a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 11:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788804635; x=1789409435; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VO0PQiHDx30LGg+w33cmq8DXc7nasM3WGJcKJJwoAGA=;
        b=GQrtRaTM8WOIVOSacgS593Iv5cRMiD+7tGl6DnpTsx/9QKXPI0gI1IpVnQPKubbSWt
         KRPL1dBWiFGca+byMPhqAw0BmNBhuOX9INLPz090U3zrjbLs6/4iPayrGgUkk/BYTWur
         74WZXkz//7/HavfO9ncVVMkrdg9z9QoDxnVlXIxEl6UFRatYvppmnJPlXz8h8434W2/v
         FvJyQSxEdso/RgfVDeVTywo23By2Ld4JL26lJVaehjOtPimH+h04BS1bLJtun3z7CKzP
         oao88rFzycxM1lzko2dS/8rOGuPZE2Ow/uZviUyo248taVF8B/JUJ7FgHA0wUjjNrzR+
         6C8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788804635; x=1789409435;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VO0PQiHDx30LGg+w33cmq8DXc7nasM3WGJcKJJwoAGA=;
        b=YjrcpkfAgrXaS2bxN9GrZXWwTFZhs9K5Xtp4f5Ke+0ezMJGHHgaAib7cY8TDPbrf57
         SYTa8E2hC7vO/fe1KXIUYBUIAuDnEsfEww8N8m3DrJ5zUaXEyjsgw0rii1qd5YwObULh
         TEmWNu9eLwZXgq/AiZD4uTIFcKF/Wl4ahr9+McEtrXT+eYVtyelG4nOir9ZOIV6Tfb9j
         tlz0YmWTxNoxoXgu+XBr1d1LtK/0jvXsLV+XNOvPIa6PVsw5VFpDFHUZSzyVdyL9xWcp
         S83CQa4b/G5zX+FHS+0I4gwgzC7wkiWq1LG42DRj9drnz1VlVrVygQXRHsmkwDB8UNcg
         QKwQ==
X-Forwarded-Encrypted: i=1; AKwUvByqFKpoV+bxj/DDc+C1FRHb+W02cwBypIX6i6jiom36ZfBDH34jJKdBtwo20OJ+PC7G6e4frhk6kHpn8oc=@vger.kernel.org
X-Gm-Message-State: AFuF++m/3XZRoMcfq+4+SWpyicmtx1cU1lpiJkGO1Um90Uqe/Wozu/gl
	2M2kxFznuAWWOOp2hnAomVrD5u5+jS7loVxZlSW5LpykFoc2BjBT/CmPTgQs3pRFP9NttH/Ly5X
	20Ed5WXK/oKDlBr6zrj1jEvbXqoZ/rzXkRowLZYE4ZA4oXBbnpqlmKAKXKgk2P7/7BTs=
X-Gm-Gg: AYBFou0sBo9ZmfEy928v/1dDrfADbqXK02ss7Qcs4FD2I3hu2ZNITUb4b5Go+4WVJKQ
	fgEknk2Phw9onP72r/yY+QGqPxG+aQEy/zkCthIY6YYElJ92fwwXdfEK1PXFzXGWpK+Ti1yO1Ti
	X4FQB2aSMKvtpNJDVG4ZB92U5A142cSzlI3Nq5PX0IwcOMr7MS97Z476VMTf2DoZVNwUyeM+68b
	ZOZt0gqZySCX11wizzOKOdNRzw4Vd296qSG3SJzMv8WAsQdGdP4XSlZvHo19Fl6jZjsp2ZpD4eG
	klEFwSsqRffzdMmGirz9FwS4XwOZ+LktNh9sDo8md0cIvXArOr+yofcu4qh44kUGfHn4fh9bRtp
	s83/aJCQ7Xybv+mj2NJhqSe+WXGQy7+wc1cgb
X-Received: by 2002:a17:90b:3852:b0:38e:9ef9:eb97 with SMTP id 98e67ed59e1d1-39b26272d69mr36796102a91.16.1788804634659;
        Mon, 07 Sep 2026 11:10:34 -0700 (PDT)
X-Received: by 2002:a17:90b:3852:b0:38e:9ef9:eb97 with SMTP id 98e67ed59e1d1-39b26272d69mr36796023a91.16.1788804634200;
        Mon, 07 Sep 2026 11:10:34 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b608409sm33961954eec.21.2026.09.07.11.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 11:10:33 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 23:39:45 +0530
Subject: [PATCH v1 4/5] ASoC: dt-bindings: qcom,sm8250: Add Nord Ride sound
 card
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-nord-asoc-driver-support-v1-4-997d3b20cf43@oss.qualcomm.com>
References: <20260907-nord-asoc-driver-support-v1-0-997d3b20cf43@oss.qualcomm.com>
In-Reply-To: <20260907-nord-asoc-driver-support-v1-0-997d3b20cf43@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788804602; l=989;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=dS0jDXHlVW4llf9vuhR2+deqH3p/w1Xv3ipBNHhZA78=;
 b=7UuavNITpn+sMxMYWQTId+dxqjXUOxi8+6Uzm0d7zkuTzy0sD2r8oO2IfkhwJ6XTESYDZYfUU
 j4hMMr31DgtBlUEqgLlBoiBTJfxyiginDjfjO2vsqd5quWUIz9XVNQZ
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-ORIG-GUID: 7GPOZ6vOzwE8xwnb9M3RTFlrGK0f6-Cl
X-Authority-Analysis: v=2.4 cv=U+aiy+ru c=1 sm=1 tr=0 ts=6a9efe1b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=7YRCYCP2VF9Zukq8dE4A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 7GPOZ6vOzwE8xwnb9M3RTFlrGK0f6-Cl
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDIwMSBTYWx0ZWRfX1/vlAb0jurCG
 LQrxFwXfpygbWdCGrEjXA120GxcuchaLbLM5qpDB3QVRB/tnNdQS7+B+/QXm0MghIICuGGbMr58
 IBYAYxgvz4nmqSX7FXxFLIGL3Lw+UiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDIwMSBTYWx0ZWRfX6njPvUPOgnFj
 g1MWhlzHUBvWScNBmOYf/51gtR0wGCVXd0LS2yzgyNgVupv+g07qKtwbQhltume9ckT4KTRfgMf
 YY/8KuSnz+twwHNoVAaEnQBZd1o8FEZrcw3pmNEryBVxQw52Sj1ma5pyj/EwJZKdk4xcI18GZLl
 Wkl0WH8bDpQ7Ut5Nxa5lpYNpGiLrP9CsOZa1tDe6NQwdPoV1cE+RRxInp9FIlQUfdbLo3Ii01W6
 8hdkZcK1OA0QCQSpaBKz9eyupG+JkQ13INBHbBf8p0o2jn5RyPr8zxs1J05FfiCZShyjCWr8+Wx
 jPkYgOiS9uDanUp45f9LpelLK6dnK4m/ZAd0/sByYxnHBD9yjBJkFiJTn7OetbJZ9VFgVl4ahZr
 wP0xZsWXQeJKADNRvygGZ6NDjNeNPCOqjUcTt0HZJjp5W2ebC/HldKmzKfhf+eaKrISIWQcZ9kQ
 apxuVZpaDI7WJikO6MA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_05,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070201

Document the bindings for the Qualcomm Nord Ride board
specific sound card.

The bindings are the same as for other newer Qualcomm ADSP
sound cards, thus keep them in existing qcom,sm8250.yaml file.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 1536fcd96d68..bdbaa8c822fc 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -38,6 +38,7 @@ properties:
           - fairphone,fp5-sndcard
           - qcom,apq8096-sndcard
           - qcom,glymur-sndcard
+          - qcom,nord-ride-sndcard
           - qcom,qcm6490-idp-sndcard
           - qcom,qcs615-sndcard
           - qcom,qcs6490-rb3gen2-sndcard

-- 
2.34.1


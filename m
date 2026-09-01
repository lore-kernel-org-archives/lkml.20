Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4964C4746DD
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 08:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250100; cv=none; b=KUp13rTKkf7KQr5S9RO0bPwUePz5FbJ41Q3DbsL/fm6GQNNdHvxoASMnwp9Wv6666oEInGjadHDKHUNvODTzkyM3k1JIWuM8ENJD7L6Xjh9nRWGNZULLwenwQWrwakNx78h2lZgMWm9ZiW8BKBMQv73T5+9QKCtSLvS6ag+yZao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250100; c=relaxed/simple;
	bh=7nn9usmMLV88dn1paeje9qi6h6cTYQN9asMVMTvIgck=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NDMzdw/2CZpg6l+p1hbhPV/ScXnHov8xeQQCdzr9hloGudgjMeicxxF3UQYSwA3I25/9/mkL6IAG+StsNi6N6L03clQrZHMKopDl+u7p1oyaWi5uLbYI7Gi5mtkS8Fs9vxQzBQRaUblUKVC/+wiSWf8+J9p0Oda3XyykL8l87DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GQiwhP8Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tu9nSXy/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GQiwhP8Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tu9nSXy/"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179J0M1709548
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 08:08:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+2qGQWEB0utc78z1PDl1MdZBmTQDKQEsYy00apmvaZU=; b=GQiwhP8ZTJYkg88L
	9yggElcoDKCW18TD6gz5on55+8A3pglmITQ+IGVgZxrW51fREWah6CIt+TYmZg9Y
	pAFB3PvF7IAKlLJg/jjdosiZgq1WYidqojuY06gA5Bcy6P0Ll27DX9TkX/75Fhks
	YSG6dVjgYnmmu01r14XSzXHnljsYn3ZgAsJYwm1vDLLjIkEacQtnDYemGt1KFvp6
	pzeE8oZdGAM3BxiscX4nyBQmy8N5pfhBYlN3kCy6WXmhiob3XwaT46zBVggZ+Qaf
	qYReh6LPxhS2etPP+sSUtGrp3BC2V7gKCAizzet5l9Ohpvo5V74qPX24spBSRZwk
	/Xyy7Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp8fs5mr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:08:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e62e3459fso608842585a.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 01:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788250097; x=1788854897; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+2qGQWEB0utc78z1PDl1MdZBmTQDKQEsYy00apmvaZU=;
        b=Tu9nSXy/K/jF8msq0jcrUI+/DyQwCoNQ/IttxbGDej5QxXP6t4Mt821ay5hFB2IUMO
         50tvu7KO06HntWkKL7Qam2oz98BsBdvnjQs789WvglFeQmjzknnjojgDvzjlaNvIF0QS
         l2qkev3YOoq7+Jy025xmFM58+mn0A0oE/mBnWkoopa0HR+OjiHuD/5sbdjfdCMKabcOs
         C9aS6ULE4s4KOpPRZvGDAgIaPfh6y9nr3MgboVM8qQ2Doke3WsuQnNgYBlKqLay9vTL9
         ffEoeEra8e26s40/zLL1HgjZ3BFjmrQx0hcyAdieHN8Y5gup8w34UvGCHZ1o4aB5Dasc
         TdTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250097; x=1788854897;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+2qGQWEB0utc78z1PDl1MdZBmTQDKQEsYy00apmvaZU=;
        b=NuKGkeQBBHJ+UNEFHTgyQe+oZfM3CRcjcSJ6whEWAhUNTPTrGp9N/4V8+ySoxgks2v
         8Tc2scctLG6Y8EOcsDH5zf8RhNfedV6k8WNc3Sp8Xn93Pcngcql9E9iECs82Vozh7/IP
         AlKaignXetdltBw42rwBCk9ppQkmShLP6pzSwgVTGmQnLQtY1p0yzwJ/9xh/zplbydzJ
         tH3NNbEQnqrEXIjG6sIvBboRqu/EFPfuO5vi+0nFaLROtn7riasIyDga2hBBX4+/gbFH
         ZBLIiuHLBqIEEKYD4qnk8hEnqsAVAX/0LltABDaAtSd6HLoUz75Zdcl3OaH9CIVAHRTs
         /Gfg==
X-Forwarded-Encrypted: i=1; AHgh+RqHKw1V60NVzfdOfoGf4rqGfDTIa/nr/tO/XjKqHGA84P9iX9e0mJXs0LhqqVQJCslf/RZ4Ebnft8ljg9o=@vger.kernel.org
X-Gm-Message-State: AFuF++l4Xz7q7R7yEBTMpsvxNoWGYpMFw8qUfVS14ucYSzcat3y4N3cO
	cFMFBz8Hkmvv4PbupzZBqUDrJOxA5wM4XGVnSHnqL01ArNpMr71Jm3p0h6N/UnsJ2hU/K0KuqCS
	gVBmjgNyl35uciW3bOj5MSdt0FShmtemWo/ZVBpyFQ5aU1EAEK49cDt0djOE77X3+5UY=
X-Gm-Gg: AR+sD13SJeZEdvhXHuXEcfnKaqpATqxg+Wj3fu1VgmcSRaaeVuTeu/txe8Qh00WQyEU
	gwyLlbEeyfg642dDm5YVeLz8ybsILoqkBp5pky2NKdxxAZ1woAVwwuOIUcXodOgFL6tZ38a+gHQ
	7qtgPJhlLdq7dDGf1iKIpAj+OIzApQGlSMuuIpdYGbW64idsfRl887X0HbOVbRE245Jk1pq/U75
	l28KG1LXaEMw/FnBSLtCfg//AqUFmVViSeLXg+moioYKCFt7yFewChRgDGgMOarW0J7HcatQbaX
	eJ/0ohhk3Mj98i/Wx2DazESq2+IbvSOqJc0qOj6hlLas6pHUJa/vuE9LroiJWyfPeRcKQQwU7p6
	p06Dn6LLW
X-Received: by 2002:a05:620a:29cd:b0:915:a953:4b9c with SMTP id af79cd13be357-93913749780mr3406013385a.3.1788250096611;
        Tue, 01 Sep 2026 01:08:16 -0700 (PDT)
X-Received: by 2002:a05:620a:29cd:b0:915:a953:4b9c with SMTP id af79cd13be357-93913749780mr3406005185a.3.1788250095835;
        Tue, 01 Sep 2026 01:08:15 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d3d2eesm3267776f8f.15.2026.09.01.01.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:08:14 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 11:07:13 +0300
Subject: [PATCH v2 16/16] arm64: dts: qcom: x1p42100-microsoft-sp12in: Mark
 the EC reset gpio as reserved
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-16-f4ab7e4bb75d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1127;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=7nn9usmMLV88dn1paeje9qi6h6cTYQN9asMVMTvIgck=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqloe61oL9DNQOynC+ryLIxJiMfpxUA5n/C7TOo
 S88xUtneiSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapaHugAKCRAbX0TJAJUV
 VhUqD/0WRWVxlL5WwlYNgqDphfx29jcEoHn86yeOB55wiHDluuap/p8M3jM9yO9fGlDlDXFgFXI
 aicQcyDtgXLFYSmxIGI/PZUEFjfWj2CqhOwCTRtlvxajNQn4aUWGotbgf/Pw+oXAu7IP3QLqv2T
 kpb04dJx1hBfp+258iVdcBQaE5DMfz8P9+cc6cUNLBn/NJUd2KF1jlOfL5VjLg1krcU077Ls+2n
 3porv3UEZ+F4ACim6j0HeZPxiGVPMaVK+ZQi/EC9091FLAt+9Vgk4T0ar/WLKAPLYvu/Ezsb2EC
 5v79bWK0NBJxuQnOwRw3okid83kSqTeBUi3vg2P32AcMF7uV3EnHXARgAq55F6AKLA0jP/SmcEZ
 YxG5LYl2aWlYWBO8u3MyYHoQWQCM7wka7csZ0h/FuUH2Wu8MoW6mOMwl/6bSr50eA0hEm+a3Djz
 Q/2r4XTggYBeD7JQacvMfWbAN90rctXTAKdOV1JY9LZa6j8p5m1u2BoiPEa1wKwgEBAKbQy3+9Y
 Gr6tinuRMh9vReil3Se952FwjH0tJkSESXVlrFC0Ws9W7EgsaemmODAzDQyI8bw5CeZ7ScSMoHD
 ZH7r2OuNWWPv7Py7YkYKqgpVdNxjHboBPjPR6S1jUDBcys6W8mNZKrxnNkW179SsiC09gN04kZR
 lHA9YuRF8q8DrIQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: P-wLxD0M9r-IJVb9splHpfwtS6O1At2R
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfX0qFlYOKWWLMb
 pwypFmTpxmO4raXpIp8WiYVpJDbguNv0bno8rKwXR1NqmgCflwRiSk8BDLIo8aaM4ZMHza3XZc8
 CJ8qz9h4GnAJ+IJT8Q1KjOZbRkFOqJk=
X-Proofpoint-ORIG-GUID: P-wLxD0M9r-IJVb9splHpfwtS6O1At2R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfXzRplL/dEwCo/
 LRpHUl+UbZGgilfcUjNjfoLQJ/rWhGww+rzKiZfYd1mH3SN9JTjwgSd7g1TyFWk7OLc5lFNrWn9
 7tgdgz6UfItydAso3sVXNu/bbSAeyeYGHI+TrwvHLCe61GaN5ka/YbvjL7fYVAdQkvG7TaN0M5a
 Y6KdIdui8HcsRZr0GEvFnhx7yEe4QgSe76lBeq/fKkKr2wn9yGIE7g0Ze1JvRD4AkfytG8n6hs9
 ryP8WlkZlfVg7M6HrRM7sK9sUaQcvMlb7Kp2clIXNOxw6lJQup6wueMqhDm+QHWlUP5Jt4TXeZF
 M0JykC5TXv2Zzk9JhptexMFx3fV2wLdtShpo9VEqj58MCdK7Dz+lJpXIljPoXv60JFJGezyQJRA
 gRwiposzUJXnZMoQxIekoEDDbL0h2Zwe51ZPzF+fdLAx7TFLzc4pXnGK5KbvzFBibeCbSFO1Msc
 dFHEiAouSOl0gTWCtAA==
X-Authority-Analysis: v=2.4 cv=BPWDalQG c=1 sm=1 tr=0 ts=6a9687f2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=UFfQ5ueM2aPJ8qDrgdoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010071

GPIO 65 from TLMM is used by the embedded controller as its reset line.

On some devices, toggling the embedded controller reset line makes the
device not power up at all, unless the battery is unplugged.

So reserve it in order to prevent Linux from requesting or
reconfiguring it.

Fixes: 447f8053b184 ("arm64: dts: qcom: purwa: Add Microsoft Surface Pro 12in")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dts b/arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dts
index 0314b2246cdb..7f7245773e6d 100644
--- a/arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dts
+++ b/arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dts
@@ -970,7 +970,8 @@ right_spkr: speaker@0,1 {
 
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
-			       <44 4>; /* SPI (TPM) */
+			       <44 4>, /* SPI (TPM) */
+			       <65 1>; /* EC reset */
 
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio70";

-- 
2.54.0


Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191DE4279FE
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789379694; cv=none; b=gfo6k7OKgVpD5y/c6zXu8PWt5h9wLx5BAg0qWM9ONXViEWk3DT+S+hVQ85CTCPHkVk3iQ2kLVf5n6qlf59eSThEyJTjvsIq9AHTh5kEy6Ybi0XoNT4IU8xvRZdHWgSKH5rN/r4sXQEkgOO4YETP8u60nd6xgk+3Htf/UoJDwVhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789379694; c=relaxed/simple;
	bh=yhrLrIbyiT7c4YyDNNJbJJzV4AM7Y+QrAL2VnT2KYpQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sVLBOubbn3yWz4sBlha9HBiIMZJwFPdbeb9MOWYRJTV9e7zsI+p6AruRw//nuQcZ1pYwnZhK/28i0H8YmikGHhOB/7tXci/9Zs0eoeEemQRuB4Zazd1G3CI1wPoWDoqC6syyISlf9DSga+/GfhqyTX9gjeBUo6/c+k/mvNjsw40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bfPQGe0q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=joKHBfxV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bfPQGe0q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="joKHBfxV"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E9np6R1086603
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:54:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L9rl6Sgop0Hx7CQKELd9DVOeFYbbcRcJKtXX5jZ/dwk=; b=bfPQGe0qB6D04faV
	Ldkqqu6D5qNcNuNStg4jspGKeeZ8GghPptxBoYKoOfu6hraKLiPpdI499cZNe2xb
	6XrWFbucuGoXK9Dzz4yJhPrPN41cJfV9W1EyyI67kmgDDy9D4oq9AmBbkAFWeYeY
	XJRm/yqxi6CFRifzX/tslsc5lTtybXHgdm50AklX7u8Fjry24GTfIH5EzNXGwwRo
	tXiUVmy9fNNmIzmBOmPdBWK++WyZ93taUBAy3jXYhAn/MquMneV9xT+JqhoIAO2g
	vqNkdtjBziOl0kJg4jZkF/p4dH/xv8lI93BZxJyrzTVJTo8uJp8xtTEmkhK6OzRF
	Sa9Apw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3k09vd4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:54:52 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39deda201bcso740998a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789379692; x=1789984492; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L9rl6Sgop0Hx7CQKELd9DVOeFYbbcRcJKtXX5jZ/dwk=;
        b=joKHBfxViAzuEmRgs8ylLLzwfP5+YICyMj6epIi4KJRGUxrTZgVWa95nFaCdRrzk7j
         RGZ4qNPSAYh0BRfYfTVc9VL8RIb/0C10gSlAJDT+X9xIZqecaLK2vOr3OEsxeR/I+BJ4
         6Q20VUmL/6g9K4AhbcIRE/6kugyokCzH6qOVAi9+6TiseW5PuULqpQrW/ie3z758iqex
         ubsgB9jc7HU/B0UcUjjeADBw4btHB+m2ViWOZ76eSPaj1m9r09/iI4jdACRRfoqlNqM+
         Mvwg3I9NZdIvWcVvYwpwCC19tyLZHZkqBsEK5bEA3CvYIaduupSAWvSbPv2v5rhen0y4
         l4+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789379692; x=1789984492;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L9rl6Sgop0Hx7CQKELd9DVOeFYbbcRcJKtXX5jZ/dwk=;
        b=al5gi0anUjW6KRfv19DeqvacTyaS2epFVujEssUA5ogYnhogDbxW6Ep/V+2YWYFoGw
         E2glerLeEfXvCX9tpMrgVEBxpOVn2lQjEppHtRXOEz88L0X09qpZ4au0gMJYqSAEDJDS
         001oBH702YNbk9Rts0l1jabsnhB93/jmFEYTpMcFl25saLAP1o51UxSgPgD6v4y2eKXJ
         jkUgi4YCA9xh8szZy08e8N6vRO/hCDZuf2oyhk1m3ytYoMmfZQGM2z9cWhEIdG8sK5Pf
         xlWaPyduW117Uczx9/HUi13vqFxh7VdIemS1LCW2/bUrTp3UA8IqjQ8hzClgXDRS2PZP
         2UDw==
X-Forwarded-Encrypted: i=1; AKwUvByJEWAylpGY2y0Ot8j1MCA3O4RyHG3G+KOf5ISmQT245tCdMOhV9YnzeW1eoP5+j6X2ZbPMysGqV/ZncHk=@vger.kernel.org
X-Gm-Message-State: AFuF++kqFc2P10CNC9izPFdMrSz4QKzOZk6jg5fqAIlvSU3bNK5ghXbu
	cMYT18iRUuwxPzXPNeHgeEoA+r3qbvkvct6+O+AVdmZc5KtFjaiVzGZ/On636N1qoltI0JjaSTd
	ZfDsz4TlUnIm4pIjcjq9mDTsn2y9QAbUgjwCZ6/TdbAv/s2DDnTlqfqhWiQhs8v9OZ/Y=
X-Gm-Gg: AYBFou1eOuAfsVJn0VA6gF/9yEoj3Ru/D7O5ywsmAn4wqi8Bqiv8BmRM6oDo/gND74E
	XdwwvoEMHLckjZjRopNqUzj3xIhju0aNRa7rwE0muSk75CmcYIENptJe3zh6vrlkZPwOng++n+K
	Wr+e+RkUrqcFX033KCE+5bbYpaVF57aVlmBeMCXRrIiKB6nVhm/Bv6yGCikNV0VatFpwdrGmhWv
	iKIHOvD/i+0mralRUKJkyYMclD1xPmZmL1jKc9a2KUHG3jIvHuRhNqBmpqBqJ0PnU8QacyRyQiU
	JKGYepW+kMwvApOeJxNKa1PNN4rlahgdL+yY7bOhpZQGVITSMYmd/v0Yjem+tqZaWiWeJpCW8GA
	AgAeFcN1+J2jHrxikm0oUvr7p4Ax6ORSQE92Na4BkdTpzXBjXd8YU/Ydu6KNow21ezj9PRHVD2W
	k=
X-Received: by 2002:a17:90b:1c90:b0:39d:f660:fa9c with SMTP id 98e67ed59e1d1-39df660fademr786294a91.10.1789379691792;
        Mon, 14 Sep 2026 02:54:51 -0700 (PDT)
X-Received: by 2002:a17:90b:1c90:b0:39d:f660:fa9c with SMTP id 98e67ed59e1d1-39df660fademr786256a91.10.1789379691395;
        Mon, 14 Sep 2026 02:54:51 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d94bafb3bsm20664313a91.1.2026.09.14.02.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:54:51 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 17:54:26 +0800
Subject: [PATCH 4/4] arm64: dts: qcom: eliza-mtp: Enable iris video codec
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-add_iris_for_eliza-v1-4-e8ccd9b8cf7a@oss.qualcomm.com>
References: <20260914-add_iris_for_eliza-v1-0-e8ccd9b8cf7a@oss.qualcomm.com>
In-Reply-To: <20260914-add_iris_for_eliza-v1-0-e8ccd9b8cf7a@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789379665; l=782;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=yhrLrIbyiT7c4YyDNNJbJJzV4AM7Y+QrAL2VnT2KYpQ=;
 b=MrTTsCTueK2mjYj6fVajeVTW6P2WYtKUIqy7dS4Nu0LthySSosdLm5PPZLhBTX5u5hEzIRp2v
 Xr3gybn6m04DijQs6wE3F5kzxnJoiremFE74zFp1yxa83IVF7tr9iKm
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE0MSBTYWx0ZWRfX839gFqN7eDAx
 Hmaf6OqQ0TfxwltYNvKeKa/Dp1iwMXUeyN++cRGZbt/xT/Akuee6AejChXt7qdiJAuuPt+rc+7Z
 GQEaZqUj3zjNjbQvGzhFnTJsHvFCNhM=
X-Proofpoint-GUID: 0QmqdyO9bt8H4jV9DWlL9b3kNBlONHtj
X-Proofpoint-ORIG-GUID: 0QmqdyO9bt8H4jV9DWlL9b3kNBlONHtj
X-Authority-Analysis: v=2.4 cv=BtAIUoX5 c=1 sm=1 tr=0 ts=6aa7c46c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=nChROllu96siAGe8wIkA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE0MSBTYWx0ZWRfX4JQXJCaQmnRr
 N/20daxW7UTyWogI85eFhmuO/HvoIVVkrzjWR9KUsDZxWzCQ+L9nfLgmq45YDCRfKTPmx9TT+BM
 MKnpgxh4ctMRVNAJ6q6lyDUP9DvorD+VD+Q4qwlWPcf4YDPriv5QNdq9MFMjVsBu3+X4A6dL73z
 e00QnRADBDfF2kMqkQNoMT7ZKbU9KHVIuZd3RFUfFKFZjZ5E7dpwHoIuWxZk/WYm7pCQgHrP7PG
 6cHrN0ND45IO/6mSCYFb1pkF+R9dW2RnPHWNdkxbypS0TtQWJYYDQmWGCj1BxSgEcSJG5FeIt8K
 uvc5Ub2q/tOuQJWErlCc2VIJ+gLVudBOrY89j1oZQi1ZTFTJKDAeyUsjB37js69zTzFB5ecjNTR
 NK+XfaB0Hwf7bOANQMWIF/GQq+jk4zfCk58Fb6rkuS6mO3ltdX5cTmzKxuUVHqiJ0pZH0QjEMz5
 3Jy6R1QuV2m89rpYmKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140141

The Eliza MTP includes the Iris video codec, but the device tree leaves
the node disabled. Mark it as okay so the video codec driver can probe
on this board.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-mtp.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
index ee05192adcfb9f79cba59f11001b640a8572cc91..e5a698602dfc7a2d3ad00eade40d4f91a0cee57d 100644
--- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
@@ -430,6 +430,10 @@ &gpu_zap_shader {
 	firmware-name = "qcom/eliza/gen71700_zap.mbn";
 };
 
+&iris {
+	status = "okay";
+};
+
 &mdss {
 	status = "okay";
 };

-- 
2.43.0


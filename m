Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F643F166A
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 22:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789253598; cv=none; b=dKW7bQs9F+XI6Zh6MSHFs+Vyqd+bgfK6Bm4hsu5tKXxkQ0muZjR+TLUKwc2FQ7DdIghJwKDnQFDF7B02aP6QMR1wBjtw6YJl51ywvpgKc77ZtvUsJqrvOSOYc6TxwJatR14FIKCKiwZsZYZmUVn/DgQlLpteBQfc1f/zz5EcfNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789253598; c=relaxed/simple;
	bh=CxINbAgj0KrvDpn80rfuC0LTbqzZ9PR7KL+bHMKUQPU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tkGYJOjoAHPTEcp+dbYUZN+JTcSy17ru/2IkM2I3hcGplT1WnZe0dJcv1R0nDngTps2KnJxOk+ZuJYacgEiHlxyWkj6CPuqVDej3TtVNtBe8vzYD/LbJYhceMqJJj3vPjQPnw92lDwChU1qXho3IQaTBAFoGV2v7aUZzxc0KYf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=owe+Eb0S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FkAqggJL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="owe+Eb0S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FkAqggJL"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CLoZr83674504
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 22:53:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HseOcJDMkSV
	2wbU7KryEfZ/oIZYLo1W223ZlnWsKMso=; b=owe+Eb0SQ5iWsXh3cPMn4r6vbWI
	fighoJnvEZkaPKFEMGUqWw8+3YVdjzylbi7CjKJP1nzJgoeAJvC1UigSGsYKFfFa
	3jV8KhYqqxGjHpKqYA49UkkfbhWpSuVL/H2xK7v63rNUISAmJIZVc4ksyRYVGAHy
	UKICzxPaGjHA4BeYMOgV9kaUpZXP998OeJv/pdsiRNClw5L5HCXKn5z7+DxyUHZ/
	fQcjE5dZIzkCFwA2PZ96gO440o7+q0ZhA20ZncG/D9evpjbocnMZok4809Ym2I+6
	5Vs6BwlIaHgoJWJJC7vhvW9GPf3TmLtmc5zKRSSx5bD1ImVqNedG9+adjlg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmygd236g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 22:53:11 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so3363058a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 15:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789253591; x=1789858391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HseOcJDMkSV2wbU7KryEfZ/oIZYLo1W223ZlnWsKMso=;
        b=FkAqggJLDJ33m55Qlwx4UZao09tL05vUTx0AuCS50H9Hetai9JqnlC1eC1Z+12DlUJ
         pvHR0oXpN8ExkVps0DVT9VoK6VaM1Yc9PaXVsh21TYLRWlIj4npViDXE7aF/H4t5IQAs
         EW7k/EQtnvRrI10fPWd7qYR5FPGzvFwMLDAutGAO7Zpmb64rtD0EsYcVbN7ArhxkrFKJ
         W/RTi4NCKf7Y19bkpC9WVLY4/YamzD5EZnfvxJ5eiPiwV/CsEaP1n4AZFxD+s5+jb78y
         ij+1fkWvBfsHAz2z+qhflFx9H3tVjrHvv+pXLLvFn4WYGpQk5GmCKMQOw4Ck0th/yhRV
         Fwwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789253591; x=1789858391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HseOcJDMkSV2wbU7KryEfZ/oIZYLo1W223ZlnWsKMso=;
        b=Y5IG1lacT0iroqiriqPEsWtLmzcxGda1f3N0i1U8kD2HKY4+awu2QypRavJFyq/5J5
         Lqx54qfaDb/bzL7kr8p9UDS4THym+fMNXbvD4aoNWnuRCD0xZUPV5NOqCJHSr+9P006V
         vGxV0NknYgOOMqqyHNalyhpgMFJKRSri0x66F91LSZPVdUNsbCMBeafF/XHLsqXTjiVE
         fEk6CBg5nxGhcFxznvggibymN/t/MHh8ssd32ek02WZyIIDLulXFw9q7cVCdT2t+Egid
         hpOlDwuUamiDl5WEi1RE1i7G/45pmPrsSGIGeCctb4eDS+Al04cltmbjVtD0yIu1cqiN
         Y4xA==
X-Forwarded-Encrypted: i=1; AKwUvBy8VI8myKTGussHVnHpKWmXZa8vAemRZJPQDFuEgTFNjLTVgHI3Y96J7S624eKR4lntvcfY2PCy3l8TzXE=@vger.kernel.org
X-Gm-Message-State: AFuF++kXgv+P4XIf9Ue/1CsbTJ3KegPfvvNwy3nqhA3c3kaw2l3+Qrqr
	zOEU5nnMnAzp+n77Aq/T+iPgpjGWTPkAFQih/pVhTl+fjK6NJtEF+m48vNAG7Z5Xbo2XJt7GI02
	jDHsTtsuAo+txMcB9RowCxR1IrddJFvp5tcpYYENQC/I3WLAJzbGKzLW7PG0Ehie8PiM=
X-Gm-Gg: AYBFou2o/WKTn3H+1XQChdccxfzv9Axw2e4drCL/XdtZxSF3PP4HuPxzwHZ6R0RRZ3D
	e/bI4fYnOQAc+Uxo5Ovan8bJ9ZOdjr9Zmm1MxtPLiMSgDFkLQ0+RUbctqr5Mjltu8cW96/6Covt
	Bqn53Vws03g9dri0u5UFnXcf7paHMK6c0bddwT0pgvCnLHC1HOsIU4ITNI7ATVvDnuk8aotdOpy
	pIY1By7stxe7+Y4ZSVkGoBPablf6G5P3zaLNS75oDsgKHljRNBn46tH+EZkfy/1XtcpLjRN61vI
	hR3fYe8IJAaXWdi2LDZkUIjtSJ363DwSla4SX3UpUbxo1K1yLpJ6DAsW4rwlbLr/siatPMY+iOs
	j0dpbwD5wOyLQN+XkhST/DGQp31qrC5KhKpL6V+zzLoac506qMWHxxA==
X-Received: by 2002:a17:90b:4c0d:b0:38e:b400:a860 with SMTP id 98e67ed59e1d1-39dbc6a3e56mr8467481a91.13.1789253590685;
        Sat, 12 Sep 2026 15:53:10 -0700 (PDT)
X-Received: by 2002:a17:90b:4c0d:b0:38e:b400:a860 with SMTP id 98e67ed59e1d1-39dbc6a3e56mr8467436a91.13.1789253590284;
        Sat, 12 Sep 2026 15:53:10 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f5833fsm19741555eec.23.2026.09.12.15.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 15:53:09 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Peter Chen <peter.chen@kernel.org>
Subject: [PATCH v8 5/8] usb: misc: qcom_eud: improve enable_store API
Date: Sat, 12 Sep 2026 15:52:58 -0700
Message-Id: <20260912225301.3396556-6-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260912225301.3396556-1-elson.serrao@oss.qualcomm.com>
References: <20260912225301.3396556-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RY0FmFtv c=1 sm=1 tr=0 ts=6aa5d7d7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=iEam2xx7WbKG8qDqzoQA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDMzNCBTYWx0ZWRfX2VmVCwIOMxre
 eUNDNG9KriGQScxePYDwCx3x8CyWvZdbrmS7YPrPd59vGL9aHOvtpZJ/VTL3EYlmh/NeffWf7AU
 uO9j6/Wjxp14MY900E9m+xBui1XGvA1eUEpvmgYFJygwnRuHqUvT00AgZWKyA8V7Cm1guUhjr3/
 x5zLPYwrkcTA6ImcvzPhYEE8OgimPGzmh7gdokh2TQm97CIorvM1Ihd7deMiI4RB3d1n7i6ojxr
 c0xj9CcKzv2GriFi8nJhNmfOssC1VwulzxcfvZgbsuvg2kym0rjXwfQMdfCXplnXWTaMEGyIaGl
 nwmrBFPoYcAwS8I9Z0PEsu9ZIp+99fNAhPRhwqfj0N1KYR3jH2iGBXMZMCytdRQC8kyYOqqY8BP
 c7JgMEagWS9DhrX/nQXYutqsilhEjFCXHVKhy7bG6u/behmBE7owdsQfiTH1QblLzUAFIVU9ZTd
 qnPNgZIK+cJ9Ej5Zzhw==
X-Proofpoint-ORIG-GUID: JDCKtLuwaQ5VAKL9VmQugEy4m6BLhUX4
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDMzNCBTYWx0ZWRfX8f3nZi/7rJe+
 fc11LFN9xaS+V55fUL8UWh0BDpohAZVs72GkoCqTopy01Ri4MIpiDdwTWBx8sJu5m0CqowjsJDN
 pDFzrwJ6efTTdj4RIWFN1jVtx6Y4jyk=
X-Proofpoint-GUID: JDCKtLuwaQ5VAKL9VmQugEy4m6BLhUX4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_07,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609120334

Currently enable_store() allows operations irrespective of the EUD state,
which can result in redundant operations. Avoid this by adding duplicate
state checks to skip requests when EUD is already in the desired state.
Additionally, improve error handling with explicit logging to provide
better feedback.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Peter Chen <peter.chen@kernel.org>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index e2694c6109ba..d280628370e4 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -162,18 +162,27 @@ static ssize_t enable_store(struct device *dev,
 	if (kstrtobool(buf, &enable))
 		return -EINVAL;
 
+	/* Skip operation if already in desired state */
+	if (chip->enabled == enable)
+		return count;
+
 	if (enable) {
 		ret = enable_eud(chip);
-		if (!ret)
-			chip->enabled = enable;
-		else
-			disable_eud(chip);
-
+		if (ret) {
+			dev_err(chip->dev, "failed to enable eud\n");
+			return ret;
+		}
 	} else {
 		ret = disable_eud(chip);
+		if (ret) {
+			dev_err(chip->dev, "failed to disable eud\n");
+			return ret;
+		}
 	}
 
-	return ret < 0 ? ret : count;
+	chip->enabled = enable;
+
+	return count;
 }
 
 static DEVICE_ATTR_RW(enable);
-- 
2.34.1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101814;
	b=ZUtlsAV2t8tCFi1q7QGWyEjgqoBMj409RqD6bcLG+Q7DwG9m1s00WAbyeIN4Yc8lB+v1
	 pZ5YV/S3zVpeqpoRnWExPfKBFOsvKJq2V2hKIiEAY7C9mT2ZGHnOHYdDtDStv1eu4iWAK
	 6V9qwZjjASZ4Fyr35uXBwOs0+OaEYRGrXZs5ti5+IbZnRv8GX8EgiqrHT6EPn/drnudON
	 FiTqs2EUt0EtR977WiUyaQuHCQCgtSHa7zd/F6dMtDpo/kTvKq2/xjSm3spgx40BEVVHQ
	 mLpk/+74/eypxKBqM9wojPut+pfHOv0wNQMphBni+vTLUEfYjaIlUlcKIpcbPuYZrow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101814;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1b94Txq/lwmxaDtayj0mrEaKFPzEZIPVcW3H/HTvxDE=;
	b=a8ZQuaJ3j+AuDWFg6UVMvUxaCRKpawwPOLvfn14m5MDrDSVQl1lwUuZXuyyxysLFHVt2
	 xBT2o/YI9UwOX2AxQYhIzTX2W+Xwju2rwNR1l0uoAnXiWdgPoeF0ITuxqcY8YRxnyqQyX
	 g7RyWQCKQ4n5UsXArMuN7KPBNrDUsM84VtcHhd6RkM/fASwamR4B5gJQPitBxghyqyctu
	 IW2IIRh/ySh47TiXp9+79nqPK4rluq4+gyX1mAs0wbo2iddV7roq7PBYdfjS4HZeWABa2
	 Q1EvotJGGvYcPgFUL0RfwMno0aj0nzQ1iDrcPebvP6O5bVHIGGp9CH6+Z9b4h8fGqzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d1glalQs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y0NsVbba;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F14C606A321
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:50:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F14C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d1glalQs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y0NsVbba
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe3dP432322
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:50:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1b94Txq/lwm
	xaDtayj0mrEaKFPzEZIPVcW3H/HTvxDE=; b=d1glalQsrrJyN9SaGwigFvB6h+R
	am3hngFEAw9IxUAdMMXx0D7PuF29llpXk0RBu03fgpRs+BziSayIJghWxwTSUBE6
	pNyUzQlK6GyolbMm7X6h0qirolJ1iVPdgzSb6codHF2f8Pv20aYiHEN20/Ced6op
	C7N1H5d3gDXDGY6xYNcmQbFB/iRxbDDupURzsYU0XQ8MMuBjSiL7PDkhFnQFVbGm
	uJo8WWcXNmAO3CJrti8jyIZvRFDToZtny5kviUco40dihptjo+wt8HK0o6cjMt/l
	2PyzvCUv2NFLG30/lpvodLu0lKNPKLcSHxXwHWGBO3hKyqL//RMxkQkqmIg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjb54km7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:50:13 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-351788121cfso2065007eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793101813; x=1793706613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1b94Txq/lwmxaDtayj0mrEaKFPzEZIPVcW3H/HTvxDE=;
        b=Y0NsVbbaMUtQeuhsxbvkLqWzGOei0E88PN6lkKwBvkJ3NTbNwNXe5hQqdZ9TNKMDv5
         vUm1jgKCLsEHY0UgY6eRgIZmT/MmQ4LSBuo7PeZbtJa14imbfUouDpj7gfdt7ackEY60
         zJFs7sLSqeQ9lwgRmVBNMAsAkcmqTAS8KdqF2dpXqoTD6SJPgKFMnwhVIqv7JEWTtRNS
         sWCfHo6wwQeJyHbA/bwNktOS68u/mFxJ0jQ6ytZp5ajB/XnusqYixCVcr6vIiyMAMS8c
         t0jW89b/xZA/5YmgHgOsa+0cc4ZxSzhvIAdPlJb92Vten3hIXBH2DkehSdFXb3VdJ46Q
         3qfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101813; x=1793706613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1b94Txq/lwmxaDtayj0mrEaKFPzEZIPVcW3H/HTvxDE=;
        b=BvsLnl3ViArjFBzFFkv83L4j05goUc+SkuKuaDmKDyYG6pgqaa28Zyoc1qwjfzh/3Q
         IEyLfyhPuYk7CEqUsLi+Ee//vdkvS9kPumCrX+OewZ8N6uJu6pqSjqbqDQx4h0qyM6jG
         m5xv+cADWx0c+EgID1bOWw5oLxZpkFFFmZMJBFhsxp8PiCBz4pIXYDBOFks79n59APq0
         Gx+hxScoASmVFUz2nljXl3Mcm9y6ZCzvKg9S7mjXAtJFd0bv3s+TIZp3OFYc8bz4fpCu
         EbBDqMz28ZvgsfhQOzFVUXbFxNbSx4wuqW/AEkU9f2PqEK3XyuRy0b9WfcovChwnKALQ
         YBgA==
X-Forwarded-Encrypted: i=1; AKwUvBwDDu9GQUI5AlZcX2HX1H2N+j40BQXnaWm8kNQJLgBYoph64tC/uGszAVn0UVTZmRyYNTkdIFqp5CK0PM4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKiVgtT/kbLe26lXQD8M0nf+U4Xq5Jb4hjKbRI7q8ltbVsAQx7e
	601rZpUetwrF5uDwz0Jt6LeZQKTnufX8PAvICoz8o0MZSPSeuqhZzGUgXnUBSYfgKJOWGkKzZRy
	GTFLxf+RwN9IjL9Z1W4uNamqUgJ7Hc3VFCXBKB5JR1eSYGeFvUZHdeshTrL8N3D4xNIs=
X-Gm-Gg: AYBFou2jUCgiH2gKLWpYR+SG+HRE5jJVJrIJqOzZl7vmFrVgOR1Ny/UQebxsYlDj9vv
	DC/EbNR682qyn3Lj95A/4rQH6NLrv8KABqq32XhJrsPmmJ3NkcJhmTaSBUjtY0IQ7lL/DnyUFJM
	EqwyFFTV03299do2ejOESgbdveIHDsBJBubdEHdBAHOozK/TBfRjdm3vtdlmdpqzRJeltRY7Z+5
	KbkVwHFE3H6qv9uDaUyyg4AitDdLqZfbDbNwOhH9+/zvlVG4Dx9TaaKEYn3Z2XdKIANgbFX5d3P
	snmFDmk3SKgu3DKrjwfEQphheVygKhz2udYdlr30Akpf+eV64sJsj1w9jIvt4oChq0R25l6HDYf
	nw4yDHPGYiECALoGftksUGRCGc90Y0b6z0rMptJbKygF5LEYUy78PfFCz5/hawkcX12Y+uHI2cx
	Z4dHW1mLJ246LObaIjtG+2bA==
X-Received: by 2002:a05:693c:4018:b0:369:f05d:6c5c with SMTP id 5a478bee46e88-369f05d6f61mr12713561eec.28.1793101812911;
        Tue, 27 Oct 2026 04:50:12 -0700 (PDT)
X-Received: by 2002:a05:693c:4018:b0:369:f05d:6c5c with SMTP id 5a478bee46e88-369f05d6f61mr12713524eec.28.1793101812229;
        Tue, 27 Oct 2026 04:50:12 -0700 (PDT)
Received: from hu-sivagupt-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm61918825eec.23.2026.10.27.04.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:50:11 -0700 (PDT)
From: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
Subject: [PATCH 2/4] firmware: qcom: scm: Allow QSEECOM on the Mahua QCB
Date: Tue, 27 Oct 2026 17:19:53 +0530
Message-ID: <20261027114955.1266499-3-sivansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027114955.1266499-1-sivansh.gupta@oss.qualcomm.com>
References: <20261027114955.1266499-1-sivansh.gupta@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfXyIMJiBHolVpW
 jrYFNWpxOfkoVN7/mHgF10+AkcHuX3hHAJmuNCZDHOfnCYk0UilKl3EbSNqy99E7r7qkRzt5Gy0
 mMEx54X0cVMROF9TwL0DgbagQo6i9CQ=
X-Authority-Analysis: v=2.4 cv=bsnZl0ai c=1 sm=1 tr=0 ts=6ae08ff5 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=QKtFLHZR5-43mdkG35oA:9 a=zZCYzV9kfG8A:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: luAnOGZ23euNxYmT3eZ_YkV773bfzfnb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX0OVLuYrhpOXM
 Ra+JcnOWUEdiYvgGzRCi64X/awYwZfV1sK+NDJ2UrHA7PLA+I47Fta/+9Qdikhv9yqPbr3kwuUi
 2PIlRu0NrCjsBQxKI7HyEbQ+dP42Ld5ecbrpuNbTAW5h+Kh8CaaCDAjtqwMWtXCAFta1A0qs4bj
 dZ5EN8X6IO3O2jyggKeyhh7RFcROM7HmUtwcyCCO/K3Aa1lHv05IUqqr3GLbLup1FrDhOwz6UeY
 Ww/GRwkhtG2V52t+ij4Hhsheml1BWjqImjWxrGg/klPA4QShFdjLpHoWD3EHXRkoLUgGoQJWUcg
 nNKSNCMy7leKpP1/6URZF16MB28xM5VauwmQs4n3ZLz+Mst7HpRqahRexvZlOuHrgPDZpHyP03A
 +gUzUswoL/E5zWw0fZozzdhzFJ9sRR1xkNDa2OlEoc2ULxpo9tKflTSkoP9/aZ2SePnE+NOu/7m
 pmlv/d84vanKnZE+MuQ==
X-Proofpoint-GUID: luAnOGZ23euNxYmT3eZ_YkV773bfzfnb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270047

From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

Add the Mahua QCB to the QSEECOM allowlist for enabling access to
efivars and the UEFI bootloader.


Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Signed-off-by: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 43e250faea75..eb262928d4c4 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2260,6 +2260,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "qcom,hamoa-iot-evk" },
 	{ .compatible = "qcom,kalambo-crd" },
 	{ .compatible = "qcom,mahua-crd" },
+	{ .compatible = "qcom,mahua-qcb" },
 	{ .compatible = "qcom,purwa-iot-evk" },
 	{ .compatible = "qcom,sc8180x-primus" },
 	{ .compatible = "qcom,x1e001de-devkit" },
-- 
2.43.0


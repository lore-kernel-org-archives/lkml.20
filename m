Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C8B3E557D
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 22:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790720327; cv=none; b=Dh7PMGqcgRO/YMPGWEKVCG45CRORnQJU1adqUkYTJbeag098mIsFwwCmL21cVxeSL3EgSAuBrmcbgsPgQwPqSIlIqu5eyXK0+6vP1vAmuqvb2R40bNy82nvuTI6bdaXBBlSzfDTvK4NSTN7q7xlCLTr198H76cm4RT/STR+rfXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790720327; c=relaxed/simple;
	bh=RIbldL7RmoZJB+4oI+sOM02ju88vpR1QbLJnL5LcQDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lisbk109USnohgKVtrIvabNswAkoPEl7OybcDPKGGm7uyuXcGc5eStaKhEAVih/jwDOgISHs1y+1aZVHtseWZOIhKjhYRYARGbW7cacaeUbbF9DqZN849XZU2bkWQWqzlHkwRggfQGRlFOms06Vf9ZYh3vrrZCFsWsbTLAip/FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PYwTTWS+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ERjcVYxn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PYwTTWS+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ERjcVYxn"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68THThC0826568
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 22:18:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=efWurbXWJr4
	abrZmzfxo7NYYbMEg/gvYeU9UOZfHRdE=; b=PYwTTWS+7isz+Q6g+ocPGDXm3Ft
	njmIKEc7WNqUhNiYt4yNCxyu4a2OFJWKv8R8kDAkU6K1HxEiEm4K1zRQvgSZu8of
	ETbPPUM3tYNHiE7+cq3QKmWkE2m1DtraX9J2Nmo8RhU29fuX1EvALTxVJxgOiZZR
	DMlLPqbYGNBmNCk/i0t+IQilmhDtTalruYgW0AlCWpU1/qNwW0qEc34yz7k/S8Mb
	Xyd/y2DN0CGd8Oj46td/JjRaLGVgK3QpVl3trArlLzwvS4eGuQZjwunv9Nij0/RP
	CTvvsB3BNLHqQ1IhmNcs/WTnd2VNFvwFb828uN7eF+FLAmtSI+zYD/UPfMg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0hsh12up-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 22:18:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93c58ee2116so820652885a.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 15:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790720324; x=1791325124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=efWurbXWJr4abrZmzfxo7NYYbMEg/gvYeU9UOZfHRdE=;
        b=ERjcVYxnU0rzwH9tNZjxel2ZPwY2JB7V+AjCcc6NBW1ccIt1sT3mw6P98bvzOU7WDg
         9Ql1JDfJftzC/v5rkP24w9B5IfOzQ+eU6iI0prPA8CR49usnR+qRmZq/IjrgZNXOnV4d
         1LFMFab4Sizd50IAGeYPQbU+rkCI9IBQZunxioENtAt0FwkuOdy4saT4IS1B0oy5hccG
         gEHxkHDvQaJml4NFgL5zaIs8NKDA6l4FmGxou/fi8G6PcueR96UJgR93eKcHveerdaIv
         Xm0xfaSi3KsXzLawizLcJ7qVsN+B1idv0sC0DhX14rA9nQ0oYYS0ZuPcILowu1x9p6/h
         z11g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790720324; x=1791325124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=efWurbXWJr4abrZmzfxo7NYYbMEg/gvYeU9UOZfHRdE=;
        b=DQZSoFmz9AqlSmF63CwfJAWm2W22CqXDNqgGZF+YffW3gx9lzklt/eqVUMoZYxRCo0
         2Bl1l/J/amUs9fu1iUoupVS2jfcfPDEiuFIfnbvtj/EDVbmAD+2ER1kKBQ5B7Te8IZGP
         FpCJvoCaSPIJ4Tbraft7EdJiA1bUHlwYE1c5gU3iA/c4o2hsUJDR+0HA/RwLkYOZG4eu
         EH9MXNBXf2Jjnli4p/TrETRz2LXrxXM4N7W16pbK3+CjSiKYNbnllu6r4m+dIAqwUTqO
         jXXQCDaiVOG8yP/6r0ImEaV5I3GUY85yJCGcx6vXNurVmoY8/TfMDG8ngDOKv4tvmrVr
         t6GQ==
X-Forwarded-Encrypted: i=1; AKwUvBy3B7FD3HarRynRSN90yTVtW7I+pzPry7unUH0PoerC7/wRC0eYxTFlFvlZZHmojVQv6gDMJ7cRe80Hxuc=@vger.kernel.org
X-Gm-Message-State: AFuF++kNBXjzzKw1TSFEUn8LnlwBQFpWY8cwTcFoHUZ9NZgmSCHIXAgy
	/y8LvRmN739SMg/HZsIbAVfHb9dEkTbrTDCRs3DjQL4qAfs/Byxu/jBHPkVRi6NmNZ/pgPgaPg4
	tcsOXP0anCYp7MevAss92fvlR6MRd6AwFIXH7LNDth/ZPH1M1E1zsEEsOO6c4FeJCxN4=
X-Gm-Gg: AYBFou0vIgxVIBJyA/u7sXKScJAFbuULdLYKHt7gPPFSJPOsUIQ/daI/tnpL+j2KZAh
	xm559EkyctrYwm+ZyxJr+HN92FLXgziMawNfXHEr9qwY92KkejY3cT71Ri2ysfHHJuz5Phuzo8s
	AI0NZlSlq4kxfZTx71zMMZoydi5koIUJ5k30zS1Q8nfIFB2LK6rthzDJH68U9ucoxrLLS/xycg3
	/F61eLRCdFmqEMhYIQw0f0MWkncTtng2ZMtfJNCaLAn2QZYZiyJJaR//sUdu5OL0esdtHYUI8k1
	SdLLMugiJQ6F0o05ddSYfeMSK8RotYK9opCEt8ZdgYjCZhFvfQ+aXDQbP6/O1dZYhWF7E7EzcTR
	Jol3Q1X3PsKWE
X-Received: by 2002:a05:620a:4484:b0:93c:a468:2db1 with SMTP id af79cd13be357-93ca46833e0mr6333385a.58.1790720323857;
        Tue, 29 Sep 2026 15:18:43 -0700 (PDT)
X-Received: by 2002:a05:620a:4484:b0:93c:a468:2db1 with SMTP id af79cd13be357-93ca46833e0mr6330185a.58.1790720323446;
        Tue, 29 Sep 2026 15:18:43 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a014f77b7csm16981525e9.8.2026.09.29.15.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 15:18:42 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 3/3] firmware: qcom: scm: Allow QSEECOM on ThinkPad T14s Gen 7
Date: Tue, 29 Sep 2026 23:18:21 +0100
Message-ID: <20260929221821.505551-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260929221821.505551-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260929221821.505551-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA4OCBTYWx0ZWRfX8E59YYr/1H+G
 BHAg8QWSPLXYcyt67+Fczl5nyvoXO3L0hEO8MgQ4hKU9EXOBEdbdU8ldfBUVHwr+8TlFIIW4xvi
 HDwn10XZTvDFp04iY2GjCSDnV8ApOWNzR9UEtDF8NdFx9n2Bmh171sJXfhe3Nx2iqeR8kmbroR3
 Kqr+WYMWxXMebzLGeEZOLpFpcNVxLB+MjoHAi5NTDMM5IiOW1BOqC+09+I9+WJj8V4QTTuccYsh
 yScVko+MrtovfIv4jGV0l13AEWRC8CuaBaBRgAi5foUoAfVD2m0dCD6Ma6j7ipbNEQ5UXGQTdb6
 1hyhKYaiCHdz69aaMrPmw7bBL4VjnL98dK6P2JWpj7/e56BDErMQ7n1PVqWyKI0f+p1eNxzwLAn
 1/DXGs3ryXqYHpGF0d6MoS3UA+MhhiAGTUTk7tzfpHgRdXAGIZcwJDp8ablzFGHLy+3nZZfOMXb
 MTaUb1/IQZZhvyN6CqA==
X-Proofpoint-GUID: eb_txsi-FkjmXPhK7OCOxjpi3sIdzCix
X-Proofpoint-ORIG-GUID: eb_txsi-FkjmXPhK7OCOxjpi3sIdzCix
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA4OCBTYWx0ZWRfX2piSoqtTGsMk
 zmOeQZ4+WHNCy9jJYVWCEdE3SeykE0eMu9UCkAUeH1HBkA0N6O8zDXjXH7p5SJuiHrc/7KpGejW
 1guu9sVNKQCfk4z0HIgu6E6L8tBpxIU=
X-Authority-Analysis: v=2.4 cv=cZZHPXDM c=1 sm=1 tr=0 ts=6abc3944 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=qIna1hWlAHbsUj6keHIA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290088

Allow the use of QSEECOM on the Mahua-based Lenovo ThinkPad T14s Gen 7,
matching the pattern established for the Yoga Slim 7x Gen 11.

Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 899573674c2e..43e250faea75 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2244,6 +2244,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "lenovo,ideacentre-mini-01q8x10" },
 	{ .compatible = "lenovo,thinkbook-16" },
 	{ .compatible = "lenovo,thinkpad-t14s" },
+	{ .compatible = "lenovo,thinkpad-t14s-gen7" },
 	{ .compatible = "lenovo,thinkpad-x13s", },
 	{ .compatible = "lenovo,yoga-slim7x" },
 	{ .compatible = "lenovo,yoga-slim7x-gen11" },
-- 
2.53.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794143946;
	b=D9ZD0HD4fyt6Sql13QbW2ck5HzVs3OttSYQhJF9L8hW2lT9CKB5sooYRb498klv/kSqG
	 kw8XUvf1YgBWe6xuzQjCkffg0lth1u46CkRymuWzRUvzCOB3//nem9/yPabZ0WRPFzb8e
	 Z6SLaJLNbiqlQJdDcVweH/qEd+73QhC1FcC6cXj6enVK9DKwYI/C5SLXZ7BWSArXj0p4e
	 F9qkCRcP+XowuRs7QF9VLHgJN2tWCyl6AbWadMa/m1VBRWDz09WB+98gisc3k//qhuYaj
	 MfnDLP3Z9gg4CtPzXyAQqGcxFfAurQAMuyaTiHDhvaUYZ8Q7KjOwNRUwnNq3hcCbdQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794143946;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fkCARdSce3zQQOopd1LbuUPfMjM4xn/vBfRm72WuLrg=;
	b=oIUrXHbfRY85V4JWWmoGZGal+qospb2IGUurecvE8z8aVbjqilu/oHq+kH7d3nNUpvos
	 fAEJxN1DqWd8nGJ5K6nWmb0UJVLFLKQtQJZpirVMv9FjoWdsqGp2DwXAQJOoLNgfKafhg
	 DqF+bY36O/WMzAV4St2eogX/LddQ1mJvLB6n+cneb6ln80/HVPv7M3QbF7KUFI3kokLGU
	 ZmZk3YX1nSf4mHNQFpZQV2fNrO56fSxs5/How8OQQ2sw/JB8Wj8VMvn7c53H2WcZ8Qgax
	 s5qfFJqBnw3tIe1H6GhIZBxTARlFc/6qssfX+4WU3t8ljIg9WYY4JtT2JSc5snJcMug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NmmGnEW0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B9uL2K1f;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E4B606A336
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 13:19:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7E4B606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NmmGnEW0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B9uL2K1f
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A8AflL12209039
	for <linux-kernel@vger.kernel.org>; Sun, 8 Nov 2026 13:19:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fkCARdSce3zQQOopd1LbuUPfMjM4xn/vBfRm72WuLrg=; b=NmmGnEW04tWw0qBI
	EJsLz5EFuuhZ3VpfFMGJEy2Fh+TEpjk5Shk6VAZoxSVrcyoNbkamFkwYKcYHIIvj
	YAXXqjAMZKr1L36YT7G4fcA6ZpdyefMzqLSLngEQqQptzeNjhJ8IPMspATXiiJDv
	hP2CxEprfTMBTpWDH9foSVmuHpPHVc7nJx0wpKra3E8Kkg8w84KYGqWk7suOiOup
	wg8bR2yB+e1QWA9N/99MltZnMIJf+hpL3oNKZaCJKuLMsbNR+AZwlFlTJUmQnBuQ
	qA9r4GwgYKw5LYYxAqkpX6oEVzJg/H2G5NibaCbZDVLGTADhN3G9uaUpY+gJsKv1
	9DJLcg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsspf39x6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 13:19:05 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1a71dd190b0so376974c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 05:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794143944; x=1794748744; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fkCARdSce3zQQOopd1LbuUPfMjM4xn/vBfRm72WuLrg=;
        b=B9uL2K1fBoCxgmDlUamaLqDFYw18B8AP3wmJp1FNBP90gJ4gYkyg+DEylmf2ufgbXJ
         83PEMvJNY80pqtdbipvJPvlM8ewfldop3OdqgQwV20Py5r5qZg/wtpjqa/rVZ7cNvTpL
         CdsiHqltF4K1ODvF2Y6+gpy4UoSRuOe9wXJOJeZ2GVjNBWb95XEtheU5FI4U6Mbc4H9P
         rWCWSWCwifme6IprubbWsi85OCfadnyHIkywJs3dgd4dWhBqdv32UqwLzvSJS+oVF3lY
         KWKMr72mrJr3V48pYJ9kqZsH1X9JwJBAxVwRKqpFRHHA6LiUXUHeq2Jq0BisTJRl2+4u
         sJrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794143944; x=1794748744;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fkCARdSce3zQQOopd1LbuUPfMjM4xn/vBfRm72WuLrg=;
        b=NV0t0R3EqqPo8oaM42AXozilxnkApJkhaZM24HWNXjslaIRfrCFGmjtdZlIOnOwP/G
         qHcBz45IonJ8t+gNpdLpFWSeaQNra9UDua0xEDps3nvHv+BmDgFGeuDDQZ24XSaNpUiV
         Fvybaa4Lu27/42J1oIr2s9SwBaIKdDJ9MBYom2YwKVMB6ihxe2kuoJP4+v+ewJIVdNDB
         zPjX8Ip1ifMrpgoxA6s6/am+fZmBrn8CFJgL5oG21fOLuRwS9tj3Puh+ckea2ogLocuW
         v+ViL/GHw959kefeuYkrRYs03UcKqF678OvV58xzuy9WxrBA5xrVZvFYXuZU5rnIESda
         RsOw==
X-Forwarded-Encrypted: i=1; AL+hErHbePC9K18XzujepLXfFRADrYtzTfCdiX0HMtgvKQ9WUuJSUY25AQCWvbNb8X7Scte4GPvE2iz0d/+8KUI=@vger.kernel.org
X-Gm-Message-State: APuU4Z82scuJ2SPBalYvAs15v40rTyccsdtJQne5T6KDvRTSTVhPz+BI
	TrWB87EtTuQJjHmmsN1b28pZoCyG4AfdEr87K1sVMgybPBNSKoo/fIeJKRcVM90oLP3qv1ORRq2
	ovhKDwwKqqGcHRIrnUNeNuovRQK9S+7r5fi7bKXHxV0657/rakICQmLsYm1IIsnKVlTo=
X-Gm-Gg: AYBFou1uBbGidlyUrUCEK28rnKdvhCu8Z8qMJMFNyhse3sJJteJwX4TnUFqynHscJsB
	uHJsiA/SXhdFt5u3fWaHGRD43DthgkGlFKlm2wvE9Os4JU0qxHNRwWMckSxsWe4drCcQBRh0oMt
	sHUOCFcyiHMWL0A3zvadOs591AfiL+1nBzdxq+nX3RBkr9oiw/ByeT2j9fJPD2HeaeVFMomNYMK
	t1gzeufWcg6ApTnLkrPZmkJgBeR3CVWHwjsiDwkQVG9gOkHYW/p7x/MHLyc2HkCCJTJDYYouWrq
	VhY57iCeS4hB8MxjOo5S7+CtARkVff3wRnjT4n2rR5L7IepGVlqapYqsXI3K+8JwQmBC3KD5r35
	/ALG/yrtTJzelQQcqbnkHvkHDQX7eHP+1gyGU2sFt4wyxuBcqyqwjrpxru7ZIkViVBis7EVVAcF
	ij36g=
X-Received: by 2002:a05:701b:2802:b0:1b2:6d5b:36bc with SMTP id a92af1059eb24-1b39feadb75mr2038257c88.23.1794143944507;
        Sun, 08 Nov 2026 05:19:04 -0800 (PST)
X-Received: by 2002:a05:701b:2802:b0:1b2:6d5b:36bc with SMTP id a92af1059eb24-1b39feadb75mr2038232c88.23.1794143943894;
        Sun, 08 Nov 2026 05:19:03 -0800 (PST)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3757214cbsm5336980c88.13.2026.11.08.05.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 05:19:03 -0800 (PST)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Sun, 08 Nov 2026 18:48:26 +0530
Subject: [PATCH v2 05/10] arm64: defconfig: Enable Qualcomm TSC driver
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
Message-Id: <20261108-tscss-v2-5-d5f575010427@oss.qualcomm.com>
References: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
In-Reply-To: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDA1MiBTYWx0ZWRfX0uPDvHnIr+Y6
 JLqjQIS8dI6o/GMjgh8pXA7q2wu+HOP2iWTfTrmYXESXjMpipkVDR4RDfFNVl1SorTViQmpK4+W
 fkguNC3usIeDKG0YmG3ZpR6aknHGF5g=
X-Authority-Analysis: v=2.4 cv=LJzz05W9 c=1 sm=1 tr=0 ts=6af076c9 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VwNPhHur-d9dQeroUnUA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: ckmC5OeeWt5QIoTWQ2iBbibLqRQGXWta
X-Proofpoint-ORIG-GUID: ckmC5OeeWt5QIoTWQ2iBbibLqRQGXWta
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDA1MiBTYWx0ZWRfXzGSQTStvNJnF
 3/ebZ8/d2XfxSYDYdLDnAUEdABdC22imMSzSaTrYNfUZGZrwcO9mvP3plZ856dzQSt20u8vZEin
 KiNcdeBIQ/IbFfQ8mKzNZzui5VHGpU1DfpyW8oO47k8vi1nQr7pO/6UVou0f0sN2J2S66WSPMkP
 wt1aBRCHIK7YUfWRHCvNqxK6OFACMYl0XlFXHMiKvVovdS8jkcUBpAgKggsG55tSTvtHkN/4j+P
 PEtlBlt9bf7nstchObJ54mMWGwn/aLMS7lh0wHmuFxySHbS6UPVkyuxInmUbd60o/YhUap/KY2y
 1PQykv9NhGlDRKz5SayqGiJ+5qQjekpYAP+5JRn9bmNL5zwj2xGwmMsgkow168esxO+XjAl0kYy
 0hZZDets4LJcI+UCVgucdYdamBK75rSeyWP2I6Vfm5HllSUqXNhqKzPhyV9z9b7suYC406Pjzzk
 gcwWTIzsZczli6ViPgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611080052

Enable PTP_QCOM_TSC as a module to support the Timestamp Counter (TSC)
synchronization functionality on Qualcomm Lemans, Monaco and QDU1000
platforms.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7b4985b29b21..9af55787b236 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -689,6 +689,7 @@ CONFIG_SPI_SPIDEV=m
 CONFIG_SPMI=y
 CONFIG_SPMI_APPLE=m
 CONFIG_SPMI_MTK_PMIF=m
+CONFIG_PTP_QCOM_TSC=m
 CONFIG_PINCTRL_APPLE_GPIO=m
 CONFIG_PINCTRL_DA9062=m
 CONFIG_PINCTRL_MAX77620=y

-- 
2.34.1


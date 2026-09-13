Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B42317162
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 15:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789312823; cv=none; b=hb0ZF+Ww1CZi+Sz0IwYLBv6DfkLslMQzVFY/FiYF4CpPcjdYKchgSnxlJsISFD0WtBgkKxb95FFEWFXHYWK8VnbV9JE8PT0VWKEAaJMV/jOQ6o6k9xdrSngZbbV3HPo7052cx0sML91QSjHS3Xt1Zd5CA40gUDjdPAcsGCQRWMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789312823; c=relaxed/simple;
	bh=8SqdPP41lYHYCTdkr8owB3wjXGz3LwpStONsz+DELzE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kBx5/vquNaKoDDrst8IeopXfp5JVTQ0iDbssddo+WBFnAABzHBBHo7epLJtQlxlJKAfDqXP2ajustNio1oEXYvg73ffWQoEtS8YRO+5cc5kmyxcHBw1W3nSXfA0uZZTvYXYPLF4Ene+G7a4aGKBHySauByhaqeJDzBA7Ff/4NLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UXUdYpRw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RTc14yDV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UXUdYpRw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RTc14yDV"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DDxsNu2300760
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 15:20:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8SqdPP41lYHYCTdkr8owB3wjXGz3LwpStONsz+DELzE=; b=UXUdYpRwymBhpkca
	0NdA6NdoWFF89CdeqIkpAQywZyfpkF9as8Ev1Vu/t7wmec+YDYbVVYvsgTt7uk9z
	58+Sram/KpKxxPnIUCBe+04SN0yudkAx+9jxQ6CYiP+HG5K6jeJx3A2lhkitPPKX
	VWEHkfdk7Thoo40SQFDalCdDMCrtlTM2h8Co9QynU+6HeIVYlCMxzfM9QW/4h02b
	3qhf+FRCDlxAIiliZ1tG7r0gs6Tfq3p8FU0w+Tu/MhiRtG0ToUmhT8KgjyrhP3lL
	9FXHnd73IFTMKrTyJjpTqPOIdwVLYrkMiVLSfLTqrPWgHyeR8d2FbICFmgTRbHTm
	gsM31Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dkk91-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 15:20:19 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1b8088202so2085131a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 08:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789312819; x=1789917619; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8SqdPP41lYHYCTdkr8owB3wjXGz3LwpStONsz+DELzE=;
        b=RTc14yDVaCHcKb8Vx2XqODh9J30JLFXKA9rFhjlbof8mIEjrL8rf5rcsVbBSQfHctI
         AgO/BNG+jqBf4sVAprUjZe3KMVFaMIlN+/bT9hlJIi5mhCtJQ0NrKNSyTfsFEf8A0FT/
         dpW5gKfKZiHE3OlP+JEd7XYJUi9bWjSPM/jO9FZXMSxuGr6GKfcHzM9uSyTjnAmYLtvS
         AnfrtRV+GZcgYMAZ6idcfnf5WacAom/tBuaIBCpuUDlBkMj1HIpPLKspbBWdc8ZRj06s
         9ugX57bTh/vhV4Jzuxdb/BpcF9vRCcmGYJ41mZuR9l/PzbVIjjakdszijdbkSEGQAl9X
         VM8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789312819; x=1789917619;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8SqdPP41lYHYCTdkr8owB3wjXGz3LwpStONsz+DELzE=;
        b=rUIAiskVg2pqtuLafvYqbpAa71Bt5QcXCr9Zomegmc1wfNBhEsp7FTZoFvUKEdZLuc
         hqxJ9kIyDdcM+7vZZ86s1s3YSIq2BQQMEKqf7gMl/YHaK0BvlUnVDx+NzOguOmL04TDC
         FhzEWmGJ3eIaCZfWo3155vxVJdbNX/R2aPs4A7Mg/WEIGinmlJtQkUJzq9Hc9F4A8jMw
         Aks5dhMw1oYOM8M7mH8AKdWYPZZ98M9SQKWmrKWHH/j511z5JpQnlS3cuxc9zo3Niz4v
         jQKrAdMdS7rwuhLsyMvNpPhiffpJytaKwcuxkn7IQwCYShzLpeD1kRK9kj3IrishXt15
         R22Q==
X-Forwarded-Encrypted: i=1; AKwUvBzEPEpS0WUiZMXwYeeBeB7PgX/pyaOg2rYBCmapBFCKzm+pxvz3H7FX2UB0dZpw+s1b2f11Y1iyEDJf4k8=@vger.kernel.org
X-Gm-Message-State: AFuF++kTRanYbjnAZfisALj5jrYoxf9/stJm2sr8Xqag3EC6zkqGV90/
	hHQz8EsKqDNjabAM7yiVHio5REe8AE/0BGkoE3YoOiWBCotA4ixiEK0a8nn2BjXLHQZOr31zCD6
	v7QvlJObZwMmcaZYs2VmtxZpM+m7QLqjomIKy7+LID8ecpZ67R4cmKLuJfeilLse3Tmg=
X-Gm-Gg: AYBFou3LpBHQ1jmfEUjRnce4FNsii4v0Swk00+Ct1sKSVlVgCodG4+920aQWJhW82Zv
	g5BBELMCjFJTRoiviXIfKl55vuVjgWJwN7s2YX4z1YjprF4DY9O+XKCLfH3xNfFCk9H2XAmPSG9
	kQOyWWHGNOHRoutnzlAr+5Nm9bVNsWvuZEsqpjK6/bH24CAiJMcAVqhD+VJDZCCUE4PsvGZzpmB
	w0hoZzwudBgGVlhECjTfw5cMqjt+RiXqOdhogPlYDKguvW7bYKdK+LzrnI2796MKNKopkTxtBD5
	OtNzZp9crUuk3daSjQMKw5nTmbYZvAGC1SQioF0trZkQXnJRZNpMtpXGPH8qGM6ll/H3QuD6u7W
	poEm6mnzYSzMoz5YBlGudOpXURh/6rA==
X-Received: by 2002:a05:6a20:939e:b0:3d3:adbf:7784 with SMTP id adf61e73a8af0-3daed4ec53emr25613303637.25.1789312818690;
        Sun, 13 Sep 2026 08:20:18 -0700 (PDT)
X-Received: by 2002:a05:6a20:939e:b0:3d3:adbf:7784 with SMTP id adf61e73a8af0-3daed4ec53emr25613246637.25.1789312818313;
        Sun, 13 Sep 2026 08:20:18 -0700 (PDT)
Received: from [192.168.29.166] ([49.43.233.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf72dbsm22243050eec.3.2026.09.13.08.20.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 08:20:17 -0700 (PDT)
Message-ID: <93c23619-f5e0-4998-8da4-9742d9e9be9d@oss.qualcomm.com>
Date: Sun, 13 Sep 2026 20:50:09 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: Add SD Card support for Shikra SoC
To: Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        Kernel Team <kernel@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260911093932.2376058-1-monish.chunara@oss.qualcomm.com>
 <20260911093932.2376058-2-monish.chunara@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260911093932.2376058-2-monish.chunara@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDIxOSBTYWx0ZWRfX1gMWA3iglRep
 Fkpfg80EeDJ9Na0a/LKOwui2xKnlKSMZu7fWFXw9ZYq8qRZuyvhotcrGaI5OwmDY6lhrdr/uiR7
 ePkYtzHXcZdJDzXTlwhPNQp6PICynphxLYxb85vApsfsqcMZoLyBX0V17PMAU6j1MToyu+E8Gpx
 0yOROqfM0L9wGibrmrKKX9lvJ/fpRqB2447YkywItMrvwYpgFyXNIzO2M766monwZDMCA2KhbMB
 9nKjKCMrOnvrv3SLF3t4hKEE7RwffwjwWpq6e51EzcX9ijSczHmO4sIAmERxqza3Md/bPbdZL5B
 hJ8RHhqKb4C8ukgLPn6uxXkE7iyuZnvcLMQRsYJUwkGrZGcDsGcsA70ZrZ+x4QirTFNSrt1WHYz
 QTWL0q6gOMl3ncPdYcGs2kaDzA4/A4eZ8BTgm5grh9u7LyeaeD6W9gqGr6Rvb5UgddPjpI2uvZi
 7qyrJAjTa5n4aAAtc3A==
X-Proofpoint-ORIG-GUID: xZwRJ38bJXsuLHoFjaYZHS4cTEsV5_ny
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDIxOSBTYWx0ZWRfXxEYn76Tbo48B
 +sYygt7reNoA87NxbPnqBrCNnZo0L2y0wMqOI0Hgo5DaUdiEJJCtilWF7XDIiPqBYpOCYyq1GBO
 gCDNB03QLm7N0+xs7KF+SH9NRmUsqfc=
X-Authority-Analysis: v=2.4 cv=Y6htIReN c=1 sm=1 tr=0 ts=6aa6bf33 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ygYGJKfEQ+goyyaro2Znww==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=UBd3s1dwWAu4bQkakUwA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: xZwRJ38bJXsuLHoFjaYZHS4cTEsV5_ny
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130219

On 9/11/2026 3:09 PM, Monish Chunara wrote:
> Add support for SD card on Shikra SoC and enable the required pinctrl
> configurations.
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>

Reviewed-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6222F3D4114
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790592557; cv=none; b=SGWEote/PJZdsbCWcad7TmsJCUs6gEneZ1yGb3yybtj+ci/2mTZAgwuPuxA1ZmtMXVbYxTiC2gJABaxRZb52289nAc69gDQ/VdDt40z/RulJ7BYhedl/uxkYKWy/S+MS7vIVs1KTC5+O8x9R79ayZGXEkRqUaLttQDGHAeFnTls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790592557; c=relaxed/simple;
	bh=vUQxdTuqCw6zujbZJXCgbuy5rPAiprMN7QGYXOORR/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X8Ui7CnVSWSfSpeiUQTppKjazNJe9f0mFTX/ptZJZx9LX49WnFOw0qrbTncZqePI2e3ah5qUyr32v9ekMTrzWKTl21iQkRoyac3eDMYAbfXB64DIprmdrZbu2fFZ6ZSDoIXD2z2udSgmltmfIS0qGpiSdc0QDVt2tEhFxK21o4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EGrfqYXu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LFAt+klh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EGrfqYXu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LFAt+klh"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S9MCDT954336
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:49:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I655IJxwZHuA1LDqMurAhNs/SZ1fSA3amOsY/eOz7jg=; b=EGrfqYXuwBM3xqt7
	O+JWJYCnAiFv+1on7YOFW7rrLaGv3TakJZzJvdgN1bkYH2x72hq9Dfu2wSpq994T
	SVPl0Zq9btjHffw7NooQHo9T50yaFmmPHx99yb7YdogRn9GYov4oofYrquR/o9fV
	E9wqZUTnv94votwvuhwYvKPeYKDLOhOMeS/BQ9JiGMUDsz4/uJXFsV8WpHwAU01z
	QRhrATWWAmxiQITbIhkuDQa5/fvG2m/jFRQpfQPnHtH11HKjNSXyHcwzuQZTK8F9
	TsD26UNn0hBRU4xMmZ7fAzxgE8l+GEdrcvfybCi9CjKL2msZ4fGMIxxiHwbrWLI3
	WCr+rw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynbc0bun-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:49:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-530e05c6d3fso2375881cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 03:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790592555; x=1791197355; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I655IJxwZHuA1LDqMurAhNs/SZ1fSA3amOsY/eOz7jg=;
        b=LFAt+klhHai9NSbGoUe2JlxuCLGVGMLC6ggomL3aFRwVlypxCsoo8HF1G7bXaZ3lxp
         2rh3zUHqG1Aeh/jEvZcsOtgz+E9VPr0DcN2C3+LKc1YwBhiGoSMQVA60YEQZG+zvAPHt
         duFoPDV+BupsTQ8tH+lhCfDqh/zQMDmwAzwW/AkvR1KasUOKaEoWsMsZmCFeuQ8IX3lR
         1BrtiXPG+7htpnjq/fF2jiBxu8UAfoj1dCkoTuw3OWWmUfY1tmoF1xpNmamnd4SVkwQ/
         s/8eHZWpR/H1vC6sRCfvaWfYUMu8N67NkPeJG/Zm4CgwEw8DjpmlkKs9eDlQqzubBRwj
         DNUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790592555; x=1791197355;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I655IJxwZHuA1LDqMurAhNs/SZ1fSA3amOsY/eOz7jg=;
        b=ymVy4HRWE/lOVqwL6/Pt7pMr33joeQVmwQqGRI0GrpiVoaPDxuyfC/JZ8AJdOuvjB7
         hNnbJFjfHVAzt6IeMdxg6BnUQ0ismcSEJWTvRvWNrEp89qHYvRJ0E+v61/H+d2UGJ7+V
         1gTaVRE+dKE86+0QNVnED92Bx/EfplOkQBEd7gIGDvt5hITJbDGwn5BXoMMZCyQp2GtB
         2gTUQ/2Ydno0MgUQ+7hkZfWuOaNvLJf1DdFwM/VSCAORoKTuoCpuEgx4tJCWladz9YJB
         /HPLGAp8FbFzEDv/sGICnrJH40KnT79wlyin5OQZxKxxxKj0PbcCTm0vbBATVWZEHTGY
         4hlw==
X-Forwarded-Encrypted: i=1; AKwUvBxvMUzqx/w6qLNUzVi3FKzOH43nhnI19B5nRqHnVmDVJca8M10BUYgA2cKnGJwJwazbte33iQrN4PZznnA=@vger.kernel.org
X-Gm-Message-State: AFuF++nM5+usNz2i0w+0F4C2uWri4Lzg3JU0BJkZfGtcY7WPalxzXN1Z
	/HFoabrWFNy4mt/0Gx6jCoOQVgEcQZlXB+UEklcZXB55/jwKRYOFie8TvZCebUsAD03opeMl85n
	ALRmWJNE7DQqvozga/MpPQh79QbUFe3JXHoL1kmDATyMD858+dnj33Un/VAesQCc69xM=
X-Gm-Gg: AYBFou0vB/T+K0eejvUn4BnwfmXDeoK/RyTXOEf/+Z3r4+3IzPFzWr2nM4riRBEh2KI
	J7v/Z8GycpBd12n3G63KWS3RJNreFzPB6K6buNVnMOvm1WiHxxtlRGu0h5Dw93N4ZH+1p+h3EGT
	Kvl9TFk8D/Q+grrTH7VsrCpwsmesmj/hXKiicUjQLIXpwHcv8WFCHGfoirJSE0TCXGnaXI5hFrL
	IVHmZ8ooHOsvqP7jjnPg5iOc8qbbkPshycb3fMwQetShMxvYIWRApiMCdEROrccHY+zW1Gqvg5c
	jj1NfA7KyGVpY0IZsGHxgdk1l/JjDWDhuVHXcvOJm56rcbDfrVWqCxUVqv+ncBDoLBlCbBrR0BQ
	DEhwfyl5UI2vFJuHTG6DIBQ==
X-Received: by 2002:a05:620a:2a0f:b0:93c:6a0d:762 with SMTP id af79cd13be357-93c6a0d212amr860376085a.0.1790592554617;
        Mon, 28 Sep 2026 03:49:14 -0700 (PDT)
X-Received: by 2002:a05:620a:2a0f:b0:93c:6a0d:762 with SMTP id af79cd13be357-93c6a0d212amr860373085a.0.1790592554070;
        Mon, 28 Sep 2026 03:49:14 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aae5cb94b1sm3985771a12.8.2026.09.28.03.49.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 03:49:13 -0700 (PDT)
Message-ID: <11500e01-a854-4d43-8964-a2456e319be7@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 12:49:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] Assorted fixes for icc-rpm
To: Mark Brown <broonie@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Georgi Djakov <djakov@kernel.org>, Evan Green <evgreen@chromium.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Adam Skladowski <a39.skl@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Aishwarya.TCV@arm.com
References: <20260909-topic-icc_rpm_smd_qol-v1-0-6dc5b5e97626@oss.qualcomm.com>
 <a4439f1d-6c2c-43ee-966c-239eaee148df@sirena.org.uk>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a4439f1d-6c2c-43ee-966c-239eaee148df@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Sq4Fe/O0 c=1 sm=1 tr=0 ts=6aba462b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=6iXw61xbxFNOpa5etCIA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: -E5fd62kz0ZVz3kKfZAK5S7BcWDY6oZO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA0MyBTYWx0ZWRfX2MtXwTUDYaca
 naFZfRVrARPfXSzGYMdpCcnd3EezHN7C7/Z0ErH6izSxeZJkBVw/Xcw+r3kaK3mgYEboVtCM54E
 D+6JIl4358NUGKKxp8I9BZcQ1EdY72MsriyTFgS+vhpFHzSeHiJ7hDE0Tymtcg2UDta7JJCBqkv
 XRMLVaNSK5oWI/Mv4VxvGIIYRY9yZaXhLQ33H4iypAd+UXdnJuhUjMq7VCZxIjDtHZ6igW0PUXP
 fTT4OwTmzi4ocYF481LkHeTmIEFaFEfGtbnBx5lEXPyj8g2WeHLJdzE42+ikaxQl9YRz51Mxsuy
 BC5rhVoguTR21/btRMri4rTM/JfyRjfRrOpCj8vm0adhJDN1D/NkTNP4B+tEo43Abcyx1Ni0z88
 xxXTYL17Q9P+aXyAH1ewuts/1upCtEcvdgW5LdcvcO9OKKS+q/WB5admA8Ft3OeaYA2/2MiRPVm
 Kccx7HwgbeKw6Opv6ag==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA0MyBTYWx0ZWRfX6xMxza6ZokV7
 z7Lx87HeNLIKJkmx3LgICDR8KvA//0p2HtUHPPaR0XXHkNSiacrn2HY2m2Qh8cKZ5fIDX7w0Dnz
 +6BUpJuu3UpKHXikHFSVb8Teyj9Cs4s=
X-Proofpoint-ORIG-GUID: -E5fd62kz0ZVz3kKfZAK5S7BcWDY6oZO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 adultscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280043

On 9/25/26 1:19 AM, Mark Brown wrote:
> On Wed, Sep 09, 2026 at 06:41:53PM +0200, Konrad Dybcio wrote:
>> This series brings multi-port QoS programming and squashes some
>> minor existing issues. No dependencies.
> 
> Something about this series seems to break network boot on db845c, the
> system comes up but the USB and network never appears and eventually the
> board reboots (I guess a watchdog?):
> 
> <6>[    3.127987] Trying to probe devices needed for running init ...
> <4>[    3.131178] qcom-pcie 1c00000.pcie: supply vdda not found, using dummy regulator
> <4>[    3.133600] qcom-pcie 1c08000.pcie: supply vdda not found, using dummy regulator
> <4>[    3.133765] qcom-pcie 1c08000.pcie: supply vddpe-3v3 not found, using dummy regulator
> <4>[    3.145996] qcom-pcie 1c00000.pcie: supply vdda not found, using dummy regulator
> <4>[    3.147172] qcom-pcie 1c08000.pcie: supply vdda not found, using dummy regulator
> <4>[    3.147292] qcom-pcie 1c08000.pcie: supply vddpe-3v3 not found, using dummy regulator
> Format: Log Type - Time(microsec) - Message - Optional Info
> Log Type: B - Since Boot(Power On Reset),  D - Delta,  S - Statistic

Strange, next-20260923 boots for me :/

Konrad

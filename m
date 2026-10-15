Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8FB3D7D9B
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075434; cv=none; b=YjuXkzFrJUk2iltZET5XSMNCyGDOMA35B/6xYVzmfPB7TKYVVYwfznHp4x9pFZk2FCK6atnSqx3NGgMaqH0fXR90AQJSlcQjhShZ6ezJ+idn99aPIK97M/KGrTmPDx8hLkyOJVxHdZa32hKEbR9hPzjLGTOa1fP82IcAHChizJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075434; c=relaxed/simple;
	bh=DXjyIndIDwV3dd6kJq4K5YDy+8+s7quV+iZlTF5mzCs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lgkIeZP+SD0OO01Ds8N3Y9zwuUTExaqWFAI9f4UhMaBw2pj9SC7m1JToHHfyrS01tQAjxnC+p7LBq9CqZlC4XsvCX//AVtaUH/MIZP8a53OxRIwtiHAVZ+hWv+gFMAXUJCVqF92DjFO/4diKNIQzvSvYksDFmeCv+bCqYH5CO7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UjaBIApH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LjpQhgLM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UjaBIApH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LjpQhgLM"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jTOS2809304
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:43:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ctsq3+iuFi3MtzssQO1t1IJwSkNjscSenYh4eM7gop4=; b=UjaBIApHvRcGsN3E
	zZg8lbX6CeNRwMA5Bs/oJPMq54LfOrzquf+qSfrNDQPru8CieubfmHPWMRcUKuD2
	w2THhpjkRYBPQSBFpisG9cQ04zwqgauizi/uANJ9oF0XlyACIi/HDgOiqJF2IY2G
	vheBEfPmOnjpltaEtouQ4k+c1iMAdmCiBu0T1joYJj/tqo/56WO/64GhHyEksALa
	XV5tK1iuwlbXbKG2QyD1Pz4jRsCJd+Gy1bMi6YbHOcAUuM3B9GYw8WBeKZxtAenA
	qutyrf2JLWqNIIH+BuXumNvUlQPh4Oh3AH0DLremXkiRgE4VycaNhnDFnDVFQB85
	RlrIVg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4han54u46n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:43:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92eebb130dcso97481685a.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792075430; x=1792680230; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ctsq3+iuFi3MtzssQO1t1IJwSkNjscSenYh4eM7gop4=;
        b=LjpQhgLMWCIUaPNUEzE1ey/te0yiQhXadvuu8zWyYOrYqDFVNtbs43dmfLjsHjnd4V
         gUAlgG1+NrnXrO+4mxKbrfBwdPamN6raHxqqf1jLO8gVFczk7kTQOR4/YD9z+yEWw0J5
         zRA67FahwEKVdEuTAAjAc52okSqXJYRFOpsvEh67TSBlvPgj4OA3N6guVewQWnBlGeKk
         dsX6d6Ur4d2arIoPduCzZi6BHaEb/OAKbULbXcK0G/ijl0uWx5Hi33MUG5LjcseDEW7T
         QZN3caVAWYccTBh9V76YSKNh+O3yITpEaxMV38gqyG6iZCO5gZopAXGaUCjXg973CVfQ
         Efzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792075430; x=1792680230;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ctsq3+iuFi3MtzssQO1t1IJwSkNjscSenYh4eM7gop4=;
        b=E9nfKWjl4R3HalwNJkAiT8K2nF3i56VlC25hdCLkteSTTf53UI8Ak3RlJgIQ01AAM2
         Ul5rkxiZmPfGbaNtgmcKoKuMi7+j91HTJTh++15twDDhN/fu7in7avy2Of2Okygnbjv3
         3XBQPW5jQIJqM2uYgCyw5ty/Pwiqr3O+Wx15ZfpXf5p0DFyoUGssB52F2Re/K3yb+PPf
         XAGncJUvfj5x/2l8djCAs4c8FsY0EMYB9GN1TST6RVkoc1nyybJWxTSewhtqCxtpED5C
         4IylQRIZWwo6FeL4FUNdZErAKu6rSBBUOk10pQ4KFhQoe04cUjiBoVsdO/RjJ6pDD+1U
         46YQ==
X-Forwarded-Encrypted: i=1; AKwUvBwcA2q6WNOsS1hDIh1JXhqip5FNcPL9ldK/hi90h8Zye9wnn7r4X0W0jhkEV3HK9KgxBFMJdV4pY9n9KiE=@vger.kernel.org
X-Gm-Message-State: AFq9FYImknPu6e7M6cD6NMZF84revK/C5ctOUII6yqhTnvWBty2Dx2Sy
	sfUiyoI8h+QD9i/5rMkfBm6+tCnC4gs3m27z582jL9xDHRgW87Ez3Ro+N2wVKx0zM6eSz5fAQ8f
	PwBN+YR1OnYxMPmqNEjFkMD4tVx1mBc3oI5WRiaDdSIA64zL4u9CQi3Y5jz/+q6IBKPWFpVZ5Z6
	I=
X-Gm-Gg: AYBFou1brGFRLdNgtGGkgziCbZjLCwsqy4bBRvvLu6UUYeV4LjQp/8Tq+2Q+pQA+BzI
	2Y9606MHg4uPLNeIi042P72OM+gxFfveGPvBpzjf6PeYsqsZKWaHaRzY9RD90Y6Grkouwp8c98U
	nOoB4LZ5CQy/UF+p0wy85nmol1IxOIYjWvIs21Y37L4rBvk4mc58kRSKLLYUfUX0oz2ng8iVSr1
	yytu19dTeXIzAEl4160SpMomfOWxUkeoKBN7guEDK6NVUBxzTn2Xy3brOpr6BzcOlcIyIhQQTof
	VGzExCjkihCGI5cSS9mxYb51lHOktSiy/CrjkG+HN3Jm3iWTsIMM9fs+svaXnOYRyPGWhNr/0ka
	HhMjArF2elWNiSca4oFmZXg==
X-Received: by 2002:a05:620a:3186:b0:939:8bc:8826 with SMTP id af79cd13be357-93ebd10c0e2mr3654726085a.2.1792075430436;
        Thu, 15 Oct 2026 07:43:50 -0700 (PDT)
X-Received: by 2002:a05:620a:3186:b0:939:8bc:8826 with SMTP id af79cd13be357-93ebd10c0e2mr3654721585a.2.1792075429968;
        Thu, 15 Oct 2026 07:43:49 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed95478efsm136191466b.27.2026.10.15.07.43.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 07:43:49 -0700 (PDT)
Message-ID: <d4907952-60e6-48d9-ad81-1a0401f3207d@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:43:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/8] usb: misc: qcom_eud: add per-path role switch
 support
To: Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Chen <peter.chen@kernel.org>
References: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
 <20260929213513.2401005-5-elson.serrao@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260929213513.2401005-5-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RYQFmFtv c=1 sm=1 tr=0 ts=6ad0e6a6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=foisExlbF95jOuBURZEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1OCBTYWx0ZWRfX0D4FZ7VKel+E
 sTEgbo5zA9ErnC/mVN/1csOUI7L2/sL/LFv/JwUOiVFstQXxdGSOp+Lq3IBMwmfIWuL8rTCD3Dv
 ySjA0cAYz5gAt3XK0INIH+5vy/zFF9uaEJ8cn4our/FENUeSmGZA3xudrJifVwfXxF9Z57exhNl
 0YzzJEhuoL+Ek5GjRFkJvI5NYVDPh5maTvzQsP/Bkj4DD3euaNmAIoJhJ7BZ4qT2rci3SMcSOOu
 bovwPOhJsVbVIyS+JXo9x0yadroNg3jLEYtYzzpnVVV5xl7+XrMPVCpVwNiUquuDbPJpXQ3QkQq
 dww/qFm+6N7futFesyN+BkGNk6cM2Tuaflh2zuO8b0DhYyybqT5v++KvmUv6VffrHZMBJzMUJA2
 pmtp7BeZc9HhV02jKqhrzBAmIObOeAokrMGVdfmbOLclm5lAoJpdkXN0Wm0r5+fNjCGZwT6dvQQ
 K8D3KveKuWiwtNxPtQw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1OCBTYWx0ZWRfX7LvzdnDGh8zW
 xI24lhBP0Sd5QLNOHwc5e4EcmPy/uvx61egrGYlTrNblvMod+6H/BcvtG07AS+CSWt+gbq5Vabj
 F0qyV+4DmaXl8JShoUe0kv3j3rwxabU=
X-Proofpoint-GUID: dFoiji4xXnZkW3djfoQF7EAaZFhOJULI
X-Proofpoint-ORIG-GUID: dFoiji4xXnZkW3djfoQF7EAaZFhOJULI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150058

On 9/29/26 11:35 PM, Elson Serrao wrote:
> The EUD hardware can support multiple High-Speed USB paths, each connected
> to different USB controllers. The current implementation uses a single
> chip-level role switch, which cannot properly handle multi-path
> configurations where each path needs independent role management. Since
> EUD is physically present between the USB connector and the controller,
> it should also relay the role change requests from the connector.
> 
> Restructure the driver to support per-path role switches and remove the
> chip-level role switch. Additionally, as EUD need not modify the USB
> role upon enabling, remove the unnecessary role switch call from
> enable_eud().
> 
> Reviewed-by: Peter Chen <peter.chen@kernel.org>
> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
> ---


[...]

> +	sw = usb_role_switch_find_by_fwnode(of_fwnode_handle(controller_node));
> +	if (!sw) {
> +		of_node_put(controller_node);
> +		return dev_err_probe(chip->dev, -EPROBE_DEFER,
> +				     "Failed to get controller role switch for path %d\n",
> +				     path_num);
> +	}

This will always probe defer on a fixed-role controller, we should patch
dwc3 to always register a roleswitch

Konrad

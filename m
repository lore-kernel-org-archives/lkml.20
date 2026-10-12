Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9689A377ECC
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818524; cv=none; b=m7u3HjEyvPEOwyupyAY5tYC7w98DBxk8gDlkI4FOXtWFQC5LpYnp8S11i0XO0eVioG4wIgztL4UQOtBt/4AGKs2hrEMDDTP5iacG8QUgXJKHfa8hqEa0LAhY3uaHcIhUT/rHmcXy7rqWLxhDiJtMY0+I5eafTJs/izygijTf1Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818524; c=relaxed/simple;
	bh=OU/ZOZCUTF1a+9OBByGIJG7+kpK78IpdvczEdEcaEDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dxu//tsb8Nw6YRztPmSDIjtqxX8yKJO8Yfs6IPH5i1UtbnhFZa9T9SUKOERIaHFdAkFe0nGPf6gTSgW8aUnkcvabZb5mAMaiek/7z1CD9bxfDsqQw3WjK1WGwc/pyqJ1q4o2lfD51Sv6L5hsBlSXWUVLU2AcF+16sV51uhaQqFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZwAFGcaq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VdA0SGxq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZwAFGcaq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VdA0SGxq"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0BoW2275902
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:22:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pg+ucC++OVs+P+7IDGhBwvltOq+8zBTV4xh2ZYbJjek=; b=ZwAFGcaqM1+iBCaF
	IxVzf3en5XwQtItp9dTo9JO6FXcwWFs3dMXTHgA0ZrPcYzOLl92+hwzlcX8WP2UO
	r3vO6xX2fcpRL3aV5/1K02qX0OzZRlS1vdX0l8VTnXo36EDBPSX/Bc3sU/Q2yuW6
	C8yITBFhAbJSzCQzx+YhqPeWoDYIHeKCT8lW3GmXSR+l9qQUjHDyFcgP0/hvwoRc
	xCTP9l4z4fZnRIndmd/3C4W0h22UynMcpBC2valzU7ir7idjB98yE0n6Y1Sos6e7
	QibqHaIosFMeHm1GWJQGwRUgW8ftUW14rOihZbSwK/rqdfEoz9Biebk0PT2/6fd3
	99n5Yw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8udq21bg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:22:02 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5356c6d98cbso6507641cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791818522; x=1792423322; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pg+ucC++OVs+P+7IDGhBwvltOq+8zBTV4xh2ZYbJjek=;
        b=VdA0SGxqaRDz/BiDU8LqRuThRPP9y5iA4FfxA10fV9LwzcS6VUakt6bAfwf3CYHjT7
         5ssRStBK0h0ipCSjxQiJ9HgOsff5MnmNsOstuPNO/+fC7eAy3EAv13L5czRsOXTbxr6X
         ovL3sRbyYpFyrQVyvl2DgZ7nIHIwRq8OXbQQOwnMjL3ygfW6jVlMw07w96igLTh+25Q2
         FK1YALZYgzzabBSvUw1KkRKC+xmIelfxPEr6QTkfLT9Y41V1jXSwjeh1w9PD0jNHJGQo
         EvDm2thJmFZK50NV62ZuUBpCJtpHpFmfIs49i9+GQOTSdFGAC+SU0J0yQ3Jpj7CSuYGl
         QFXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818522; x=1792423322;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pg+ucC++OVs+P+7IDGhBwvltOq+8zBTV4xh2ZYbJjek=;
        b=lQEEdTcxWOYihSAPq2aKnofObKKDajpYfq+7VaYCHK3zL4q6+veZb3U3laFZGk0w9a
         4yVnGiQemnWX96FiSLvYNONAxMETCh8qJ7CUCkz0GjKwdrserY4HBUu8dUGDYRKHFmix
         m3X0ZVrQ2bYrRegC1HHpSVf2yWU6DUvjSyFVsOibTwaA+wsbmn8bcfTmnPnu5+N4kq4U
         vyzSjhw5JJAFRqAwQKH9RpAHGDdx5PxER2gDgCXdwj/L/FPWumZvah0aglppSKCXfubk
         GPbjmZGAU/Wv7pZhs6m8tKsuLlxQJsaoBddprtNWhSSdBbEnyk1OZTO9eGBqF+Sr9EBU
         SQUw==
X-Forwarded-Encrypted: i=1; AKwUvByNK+v2hJjV3jYGl7pIW0MLoABFd00gQyLtVmKqqay6BaoJd1iVGYNBn8Ip1x8pSOBe80H//zl04ZMnhhg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPS06Vmr3YIZzUiH+JuC/SN7/5yLLX2EDlK80CPMDPLppjtzkS
	msHLvfJZKGKi1X95Wo4XQ0fCxde+VaqJ+GigoK5MUuyGr693kQ0EuJI1TDboxy+UrWggqmCp+kf
	VnoEJZhIH0kM3CuEsuuLV6O13ediCb7JlNTVedjePQ9SLPvhv3yGJFORNvKmHUuzRCsI=
X-Gm-Gg: AYBFou1Guotc9Petbj1Bd/8BAEiXBdzgYBf7JxdfPIipfW9IDMDc2Fms1+tJfPRZCxH
	I7y8KJc78cxazccGf1VKbXQ04rUadYE8AtjUy3AWJAMF33ppxdOha5YVq5TNLYxJ/KfcnZl4LbZ
	v2p9ubsYP7I9EGBte2sFy6AYgHQXSvgtIuoujYm4zkvBAMI2DdDOcDJ1Jpo7N99rAcYMbDZeyky
	sxJj6k2b631uC2da+6C5H+RPzMwFwMU2wq/yX/0YqI2cCcUWSnQVv5yDAOg0OGxtZ69Ua73U5hW
	TbkfnJNmq9HSufgH/h938DB+Ql3QFNZAClFi4aEYgTdLhwyRY0I2D20RCaOBPT+CTh/tUfUzZig
	Uw06Lf30jqKTAuDpNmZnKKw==
X-Received: by 2002:a05:620a:8017:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93ebcd2bc8fmr1690353585a.0.1791818521688;
        Mon, 12 Oct 2026 08:22:01 -0700 (PDT)
X-Received: by 2002:a05:620a:8017:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93ebcd2bc8fmr1690348885a.0.1791818521086;
        Mon, 12 Oct 2026 08:22:01 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b1c27f0f3esm1435990a12.27.2026.10.12.08.21.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:22:00 -0700 (PDT)
Message-ID: <0f7023b6-4fc1-48be-aa70-9564c0e1fc7e@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:21:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/38] arm: dts: qcom: pm8841: Remove superfluous empty
 lines
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <62a960c58513c2356f814108800732deb989d589.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <62a960c58513c2356f814108800732deb989d589.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=evJKXYpX c=1 sm=1 tr=0 ts=6accfb1a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=bwAYAckmPWK81loY6icA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX1/gscj732LcX
 5Ld3QQRJXK2UBbKVNrWvbnCvPMZ11HA/+ASpBwBBiwxOfsLzdJ8qlumx4VnuqnQAcn4rkHBi9vC
 Ywk8D4aG4ww57qH0/nO5fRDlIYe8lFo=
X-Proofpoint-GUID: wbZ0WuzrEFQzVyyLH8Wpbr5LY_-Q2IJz
X-Proofpoint-ORIG-GUID: wbZ0WuzrEFQzVyyLH8Wpbr5LY_-Q2IJz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX+1DUcFRoLQUr
 wx9cvdZgwPsPLQgO5NjHS3LjmBYo3X4x/TkYxi9t4p92Ayuldhp7IfgLBkP/JDS8KgOlKjBEu9K
 HErztVkw0Q7vS1YjXLNN0loDluWGyxApbN3/Vo2nCd/uhMDrSaEGneHpd+PuGEIyh62VSHyuKuA
 2mlDs7ZRwdbUiAOnUu+3If27V8Jii7tAzTdhoamIECww4Jvl+/er4i4i5tMFfY4WroZ8yHfKktN
 9zBIKKbptV7z3/os/G4Yb5Kx3hLrIAGtaMk/27cSJmnAo5BIAfPt0/fsYi0ycHQ9nrhzriDIeR9
 2vaVSaWoTm6h2Qou+KMr/jERKWEAqpbQ74z7OAQl1pxDFv7GWbsJwevIIEKg4aLPh39yNsNFQDk
 ikqW89opvBjeXQsUsCntbD23cgsgZvqwIFElfhqweqRDZibTxEtoP72GhHKgtjKltd+OnjCYiE9
 Cf549x5NZXPI1D09n2w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> There shouldn't be a newline at the start of node definition or multiple
> empty lines. Found/fixed with dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

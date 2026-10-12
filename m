Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F71F49B44B
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818579; cv=none; b=t3a4qX/3eYaBKFsjeyesEQMrZRPmDsWkLZz7HpCNSsVueBCmB2+4HK4o/qraXqXcB8Q9FhWQX7nMMSDGSNmcldNLkXr4q4wNAMBlYK1vLrK1ECx7hN+fiNocSCTQ2Mo6e7eQ+dC1iJF2cxx6FlxC3SXR7cyz5+nbhUrO+a+5Pcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818579; c=relaxed/simple;
	bh=xRoJhJ1AvQpHt61hi2ZYmyap1RubXShFWJ+UOKcfqj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o5OTNVe+jt4AYnZnD8IYNXYx4wWOLy0U09wXIy7fRdhPsqZZWnUga30+IkHPCau/Bl5wW4NGrlYurgcSWWJlK7Li6taFGG6BEwWia0xAeq1v/d2n8I7OptbfOkgCiOEtR0+KhZkReA5l4LYJyJKnHTdcBp6GWh6+KV5+5mTXc0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cN5AVNxT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eRrm0DqJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cN5AVNxT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eRrm0DqJ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC03oF2786771
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:22:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n5VagN2mi3Fe/oMevwo3rCpI6oJ8tUsL3jWLuRR0zfs=; b=cN5AVNxTwQKcA6s3
	ODYh3wrV48eb39bXu8iJPnOLRG3DoeqWvcSFgBi7KyGIzd97ld9bl/OZakKbDYKo
	dQSuEOgw2wQNquL7jFNv/xM+qFNzEkrsb+qwWrdScB+oDHgKPKx+X8lRl1YvjTdk
	sd+GgY/LJIKbJwINTqOpY2HcqeLxR5624TN89CLnIz6nYwAmwtAOw8Vf6PECHznK
	kbIXAlCNATGN+PYezZXMK8MRi06wkY+KwSxxjr2Xe8Mf6pQPqL9MIkXHdmmjcpSl
	80b3g/OzrWbDqC1nZTWs0WB5Bk+fZdgIulJ1nMpF/NAOnuD5PwFtJvChbVoEqLrs
	5Fhnww==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wffhbyk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:22:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934a8cd3a8bso22027885a.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791818576; x=1792423376; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n5VagN2mi3Fe/oMevwo3rCpI6oJ8tUsL3jWLuRR0zfs=;
        b=eRrm0DqJcMCKVNdty32O+8wxTY9w+PETTGJqV4DC3wsWUF8XtUElmbt+vQduwKBnBz
         4NYe6FPlXJ7p+2M/qzWo4fSZlfg07lm9o2+i4nW13GwMLZkb3F5wEYZnqo4uul7DBldo
         k9GAISm2TUMjR1HSzc9Rz3fcFpU803FlIH6sV3uWZa62EsU/P51aRrQuvJHbrri74FLb
         eEJb8UCdAKwOYg0Tz0BpA1OQ/VdeAhjYEYXtM7lPjVUqakZ7RDxOLC2nQ5oJm79Tzt8U
         QL6rE8Q0ZH81CRxBg1wU1kPEhdIjR8p1/M+d7Wn0qg12oXZ6z1ge0E/E4lfMgWBKiSYY
         mv2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818576; x=1792423376;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n5VagN2mi3Fe/oMevwo3rCpI6oJ8tUsL3jWLuRR0zfs=;
        b=yjc/lZ1vrC3VohkjAk3Z1+3IKknkXp16TYa0v2CIljii8LOfVCvoaToAz38CloOaPz
         /Z4H8wV1Y4tPoLN5pwQUSZzEQhjcy5gpMh4ivW6ntPiDbsyfvPpoRpX113rllz6iDgMc
         gXlkmtW46BQOdoqV2Dof0HwzyJgwGEDg2CeH6ZMwfDfoPB0yLwq/WHA0fimImwNnxhXA
         csBBLgFOd4kgnf1XfsZW+an23qYYfJVl8XyVV1GRvEVhXG0KQW3YOGEPpLW9uZdVif1I
         DSz77A+VpUQvJSEAX9UsZ2T10Z0LBmZ63ujrBz6/NcEMywfi3v9Ns0ALqdPTtB9tSVrM
         PZjA==
X-Forwarded-Encrypted: i=1; AKwUvBylkv2G97TShdLFPGOC6c0X8A+R1d9VMoxZ4IB6DZq2tKYzQWbFUN1KeElUOlZ2MPS1JSag5JSQfW2AdqQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIkFYvkrqdiBtCr7Wbq7OXOBKasQg8rVdOBajPM8wAt45+L6rdT
	ryL2s27OrmUdx4Ewcag92QXoZM2zGKaVkZZtQsG5uMgl+Y0Ykop4zYNm6FfMxxwbR8PxASezKOl
	OaM4NihzOZgyPv7pqAVwJGkvzV98+I2gaHWN0+RR4KluVAvtVMxJEM1DgZcikJux5uyk=
X-Gm-Gg: AYBFou10IB1g/SfAzC4y6c17umfiYnD7k7Uz86F5EpLXxvyYNX7TJ+AzDQrYYIqsZAf
	T7HDdusyICPpNTZAm0ydpVt8Q/AxOAo4/A27ISCrspve5eTwi3+CuTP6Ia3Ax3L1+G23H5gVLKo
	bqo8IY5Nfl3c1C1kS2HXqr0A4pr0dr0SR85ihEIrr7nHI2/DCjxEJYecTTBfznztxq7dr4TXo8N
	/eVMM7lqGxyG/HQTRY8miA3kAjaCN3sXMJeP/2GezjyoMv5Hird4Y0ar4TX1RQu3Jaa+ZXqV74w
	yn+r4kCNY0GJcTkBSG7JSt9+hTZ5XeQspDhbEUKGAMfu3g0nPVJagKP/s3HpaXFhK9hTBCIwYhi
	E5IPF9uitaD8QuhEgxM/vMw==
X-Received: by 2002:a05:620a:4613:b0:939:c7d1:7471 with SMTP id af79cd13be357-93ebd228f1cmr1893174785a.4.1791818571091;
        Mon, 12 Oct 2026 08:22:51 -0700 (PDT)
X-Received: by 2002:a05:620a:4613:b0:939:c7d1:7471 with SMTP id af79cd13be357-93ebd228f1cmr1893167285a.4.1791818570443;
        Mon, 12 Oct 2026 08:22:50 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179dd3597sm5300210a12.14.2026.10.12.08.22.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:22:49 -0700 (PDT)
Message-ID: <b156e0a3-f66d-4016-9d23-bf6c06e9c7f2@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:22:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/38] arm: dts: qcom: apq8026: Add space between
 OR-operator
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <4f490edf747de9157a86eb3b3db634e2b6f6cc39.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4f490edf747de9157a86eb3b3db634e2b6f6cc39.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX2CEZJaH/OWIx
 dOjSdEr/zxXD7V16dk13qZ4yS+Ju18PmYnHxoXr5JO9sEDiZvqfPQ3l6S+j0Eu4eulYVvVKf/03
 TfnYbSXgrnZUILMmw9NB233NC7roJEOoc6yFsvVyGDAXjHemN6MZsIFYRutT9AOttD5tB/b3cYD
 M+UQY4VyFRIESiNF4DRXPjCFjLc5MPqtyhZKkW2pCuMSNMriOo+8MZ4orwD8z9o5B1RROm/8S3m
 fA2LVm/8AHKxvdCWE8YrL+my+D5dvYuU8Q1ABl5/sFY3GKlYGkAGSlmAk0FB2ptoQWcnFglOUZ2
 paXaOcCHhrLuIQo+sqK4e8PMn51sKMFyOsONH+kV7JHfGX1QoL26tQkswlCDUtT4PKO3nud1eD8
 4lnBrlaYU6nF8eA1rsIOGCWYgOBh+7lGMji5AD0C70nceo1w/TiHU0p5u9+Zy+d/tDSFIP6KeOw
 1sXd/Lvbb6JqDKxb1Lw==
X-Proofpoint-GUID: ooY6_Z2TNNLKNB98zAQzH5IZbpp-J7JA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfXxYBapikQjb8Q
 pOqtNDBgF1ZIJ03Pf5BG7WXrX6Jy9qB1A8STzGnj9ZHVvf5bzc8NxLrLWawlZke6pft53uJPPMG
 DQBKoCAcSQNkUH9OtVeYlRiiNHOJ+KM=
X-Authority-Analysis: v=2.4 cv=ZcWIpcVA c=1 sm=1 tr=0 ts=6accfb50 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=Ae01CA2AY_RmMo-c5YcA:9 a=QEXdDO2ut3YA:10
 a=hTkh0tvSPVsA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-ORIG-GUID: ooY6_Z2TNNLKNB98zAQzH5IZbpp-J7JA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> There should be a space between binary operators. Found/fixed with
> dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

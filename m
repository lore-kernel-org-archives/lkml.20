Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792482064;
	b=m6JjC8uWtWqGHqAGTq+c+nl/BXp2f6S3gQEX9utgNuGnjOmwN1hxkHRkCz/VNvEmFde9
	 Lpcj5jxFq/X7zFM8ck2YvqFeqTdm8+bmUpcfcsFWmOHy85BTNdb9zhRn+BHTLQNpt70h+
	 NpNNpl8Jj45DzpIg2kQE2hREInA1iRT1CVotTIKf8EDesSvWkppyxr8bqaJslef27f9hw
	 CTU4Rqavd7JxzRgBY8iepydzXXGTfWWvyePjh+eSWUySZCgabHfcjBQqqdMAPLpoktK2O
	 scYqyZC6Svd6rWBkmNIyju1riwEzH3hg0oz3FDp4Z1G1Bxf7emAjNy6bD9NILlWCBXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792482064;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WHyBOCxfyR08rNIzaaeSaXMBvmHX20z2ZAI9yVNfQCo=;
	b=M80G3PCIbcAW8wKvtTUgmlG+7LFRdrLEXl17jLdqSsoSvJ6xe3GSjDE/aekvHcbXOetu
	 G26ZdsrmtHdrDhCCYkTh9gdJ4ZlBLGFXRRC6xEBj1GcpJe88xjFZMD0N75oyueaj/Xf/U
	 fXywUMibzjFVnq97PslQQ6jrAXUwnVZPu5BQe/vnqLfCkMVxU/uaVsqLQaEddIggaz2s5
	 kZFz0qXKbPjpZUD7+QGfmS18r9v60ZO10TWKzxPIlGy3SPGRFeVZySUuEDhSJjQldQYIr
	 ZooowTEFM8sBZN3Jf53ocKxOgGZVD5BxRNhyugpQEFol20au+Kc78hMFJ81kwiptIQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fLNiTKrn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BAJpXqTD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C65606A323
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:41:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48C65606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fLNiTKrn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BAJpXqTD
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0t7kX3806851
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:41:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WHyBOCxfyR08rNIzaaeSaXMBvmHX20z2ZAI9yVNfQCo=; b=fLNiTKrnOBPyf1/E
	V2zDkk9bGOlg4SOcYxissGvnz8OBNDf87jH0opux+vHeArndM1oEDDxAaMeab8hw
	jI0RYFzm4JAqYhfvHASL1C7nkKCRw/0GcmSNBsIsd+qijrhP4cwvXd+xItb+SRU/
	SYxV1ud0ar4BkiOv0OhmQTxTsQO9NYF6DQ1lkeGojNfHf0PAeHX8Xa/lO2nHakDV
	R6aJ5Dt4nehkKO/gmbOc/PmkU5Rdegt7qzZZEczaLCSfhW3kUdtszdda13fiNsMW
	bLXtkNA9UeDGrTc3iFh2x2+5SStB0Kq2ZtH/C6urwn2dd5A7PLZp2PZiNDgiS/6t
	RGfUEg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5p9edu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:41:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ce7a85f04so594163085a.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792482063; x=1793086863; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WHyBOCxfyR08rNIzaaeSaXMBvmHX20z2ZAI9yVNfQCo=;
        b=BAJpXqTDMdaOdil+3GEfoNO+K5s0MMzRZxjtoMmV3+SrQaYnWEKhlAvz1fRQN/yw+Y
         T8HVGtbgvmCJ5b3ZU7QmWo7Pzm5mtJAIyIEPEJN3WFL+fCkyT7Ctmd9XDNDtg1sd3iil
         fcnPQ1WSSIe//5Fmd+HGdp5in3qMgiJYe348XZkN4pFNKL/lmmxjNBLQbqUr9i85BLR7
         ZTpMb7U6Dn/kFbXfmYs7neaMWSh68h+zrHGykpye8Ym2BD3BC2ITDQYtLzzIgew0pWJQ
         Ud8N00wGTphzIcY5Q3r7yXtk/t+knUq2I578uY4JDQ88hGPCDIYPX032ZoC8lZcOQKwY
         LB+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792482063; x=1793086863;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WHyBOCxfyR08rNIzaaeSaXMBvmHX20z2ZAI9yVNfQCo=;
        b=pPqsShKMO/LnpqQ9s5VVcESSaz4UI9ziZ8eirG0LMmk8EwI3/EKBZilJ96yizHp7dQ
         MlurEZ6Cy7z+xXOXH1oEsp72z7nGnKvw6lISz+AAl17axiCyjh4RBzaZC2Flip+ymz11
         7CIZsDcHx/PAe3ecKd8jI25PqHxIO+W6LJqiSmiEyjHm7xFMz1nJuCxAUj3445gm5slK
         ZmH8twzFQVmDV/r5pNT0kOhnc0CVmqjvXW3cGojtv8EfrEyru8ioobYazSazv/JFItR8
         isNaKt/IdrJBjyxtT10VpLLIj+s/AL0ksXECW17BqmjxMlJ0C8VfmDApxg7I5ElnPFYz
         LYmg==
X-Forwarded-Encrypted: i=1; AKwUvByYqQVZOFP6xzv2SmdviXZzOpTOcrH7PCq733Pm+HLaCEh6E9D26dX2rvoGNdrsnITr2kLoe9Ye+X8yh/Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNqQl/BNbzRNvLYs8Juql82F5zETOmKrFe8Cmb89g2E3qJO55b
	1Tdmkd5u+3lnW5Acqz+FwmzS9fEI1H+W/f1SFUGxP+VMYpm25GwJN0F60ixpeEjCDml1NRZhXj4
	LEj8urWItVea7AxMd49sDnPByy5v2XiKKiILyJcr1yhMRYgXC5Bc+1ehi1Qm5aezu4Pk=
X-Gm-Gg: AYBFou03CVpBV3tG6RCWByzkwJm/d6VYJMthAweCcHpLTw4XMZ7eXx37fI7HKlGFP5l
	K+zcDE25m+4CDhKmqy7CCHnomyGjr9UYifXMI9kxNK+Mnr/YYjML6wNpBZcKtzEKpyzPCI5/n4h
	eeIvk2OcaZVBWYEzt7//AfbO7lWQ4lspOGPgjndat6lVADpy/e4jXH8+t3cUZj9lcwatFtfvSnN
	C5E60q1pSD+80lqducgGJUpZIfo7Tg/ZqnvMoIICtEcsZ+SCBasaFekuweSxPCRwMuz4PVRLy2T
	EtorqYG7v1IvbnRwvcn2hrqTxngpsDRUs7ifKTvf2tjWjdvQiYAvZUcTZkJ8L4HTAXQAQSeEEsc
	XsORwSYQUFFZvQRsHTBQvrywkG5Ei1Hk8L9mbnYRE
X-Received: by 2002:a05:620a:6410:b0:93c:c538:2b23 with SMTP id af79cd13be357-93f29b7e6f0mr1606492485a.1.1792482062711;
        Tue, 20 Oct 2026 00:41:02 -0700 (PDT)
X-Received: by 2002:a05:620a:6410:b0:93c:c538:2b23 with SMTP id af79cd13be357-93f29b7e6f0mr1606487885a.1.1792482062245;
        Tue, 20 Oct 2026 00:41:02 -0700 (PDT)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f6631abfsm34100475e9.1.2026.10.20.00.41.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 00:41:01 -0700 (PDT)
Message-ID: <1eb062d9-6662-4b10-856c-6f5a3daa3962@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 10:40:59 +0300
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: qcom,camcc-sm8250: add
 interconnect provider
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>, Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016170701.1504338-1-atanas.filipov@oss.qualcomm.com>
 <20261016170701.1504338-2-atanas.filipov@oss.qualcomm.com>
 <20261020-bloodhound-of-remarkable-debate-11afe3@quoll>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261020-bloodhound-of-remarkable-debate-11afe3@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: L6QZmQfJJZ-Mwpe96tfBsKC7x6izVpLg
X-Authority-Analysis: v=2.4 cv=fb84WEQF c=1 sm=1 tr=0 ts=6ad71b0f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=YZ1k_EG-GQ4t5jaSdRAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfXxK51rfD1UsTb
 eMtvYjkcongU67zOR92xAECjKBlA3Su3EdGViTDgMMYsGTmpiRognuN7sskj70ZfbKYHNCfN/KI
 9n6jccfNv6WUwqM2COhGudzax8wnkpG/wgYZCe3md1pkAD8R4TJBlxtYDQlpOLEcydoRXI4+9zO
 9sUGlcnNJdczoM4lWMXpYcwPDBVOR20F+fE2lZ+HTT3uMRoXskFHZ8ofPJ9hkNhAO+AXiOI784M
 nilLWFvXiItbL5HFQP/16TfZq8fmowLLKSXcZDXCwfWCgp2yc3TkxmOkMy8vB/UU8fiW4PZltfF
 PN9dWarXUp6xEp+7m/XFnJqVaXfteMrbtXjRRZZyjXdLb9lNNv59+LabxxJgPZHO+XZVMYTgg8n
 sHkcOgaissmG4t4mTQ41R0JGwBFrGFs0e0csB2CAIAHqGZMShsI4it6sQgtgOMdzN6ih+GSwtfA
 NaJZvmQ4XUzESOgHgag==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfX9TdwHMIq3CsA
 tPvYy4bablFxMuBxJ6Pumk3DirovBEgD/P06htTHWbAsEdma1P3igwsOMr/B3gPXNGaMpSnSjor
 ud4ykfcQs7/eeWSfvN+EGfuVYrQN5nM=
X-Proofpoint-ORIG-GUID: L6QZmQfJJZ-Mwpe96tfBsKC7x6izVpLg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200030

Hi Krzysztof,

On 10/20/2026 10:12 AM, Krzysztof Kozlowski wrote:
> On Fri, Oct 16, 2026 at 08:06:59PM +0300, Atanas Filipov wrote:
>> CAM_CC_CAMNOC_AXI_CLK is shared by several camera blocks. Setting its
> 
> Clock is not an interconnect, although AXI suggests this could be
> something with bus, but it seems you solve driver problem with
> interconnect description.
> 
> If you only need to solve "last writer" problem, why not fixing the
> clock framework to accept the votes? Otherwise this should have
> description why it is an interconnect.

There are two approaches which we have looked in to resolving the sharing of the AXI clock.

1. The drivers newer touch this clock but vote on new icc camera which controls this clock (The v1 and v2) patches.

2. Use icc-clk in the extension in clock framework same approach as: 
https://lore.kernel.org/all/20240430064214.2030013-6-quic_varada@quicinc.com/
This is already merged and i believe resolved similar issue. 

3. Which you are proposing to have clock framework to accept the votes.

Before we jump and implement the v4 it will be really good to have common agreement on which direction to go.

Regards,
~Gjorgji

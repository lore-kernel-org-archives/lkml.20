Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794492264;
	b=zc//QqjHlaijVfUqNsT7B60p3V73M5lYCoqqo7GsxJtQ2IbNMdC6Se6unzUDtu7d6yKI
	 xPBmyUdTt3x4gMESlGEsQ2NAwqtqS655MOYN/uWDVVKt8ZzdUsdJZqUXlZ6rO193vl4CF
	 68HZOGp8ZtAwXbSw3G0UAHOSmommlBW93CovEIfvT+QoEc34HlfZwTt0OHQe1qA6CmaZS
	 7Av1vhCmNWJoaXUQkNshgSuQ2K1vEHB4EO7Y8Bm+PfhcpWEYXaE9z3CQQgGrQ9EyKTWdY
	 ZrQYsHeZAHcyf3DvSs1WUWheuC0kJpu9VDGPuLyJDatNWb6qZjWXQi9s6WFsO2fkUMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794492264;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=B+CH3/jx2KSH+RRiLFJDBQonfvkStMqSF3XdFCzZT8w=;
	b=GKvRPBX12fnmiwRowNFv9LM7/4KRNFRfDUi1pIXaGY4aSbUXItP7mfAncuACYum7pY3U
	 YB64cyjy/a+i4YXmUWMlSCoEoqVfR0due/jAUMQBa/nq7Ir5vUylfncF5AK/tUuMUrV/v
	 yytpmxEVX7h40IUCGk8TlGdlL2dVff7fbjdnb9Ud5l8/557Mi4BV3tU2Ulk5BFbNe9p9H
	 3zwVnfbHypwqA149pakclLhRyCFNsJHJmJt0qs2tIDVoCtJaZigdE20Qb0jduei/tP+NJ
	 py4Atz6Is/8CL8v3AQ23r/yD9f059sfFtkGu8xStAyKd7C5pAJNoQrurUkK10IrJuyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Pt8mT/O3";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zkdyv7FZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40797606AE87
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:04:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40797606AE87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pt8mT/O3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zkdyv7FZ
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC7j4IP126395
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:04:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B+CH3/jx2KSH+RRiLFJDBQonfvkStMqSF3XdFCzZT8w=; b=Pt8mT/O3E+MdfLZ5
	irvIgS8uLB5HnZNSkjqw9uCkzssqONuDPOuy5kilOtAmiJYPSUIGSxF9D13buTDW
	+aiq1LxgbwgdvUSAxVbw1ePXNqBwO48/h8xDkJyoNw2v5Sye+5IkGZ5mYZBhXSek
	9IbJYB9tIVir/trXeHtT9QBeG7HdB6KhiLrlaeALCLDPAhar3kGWHDWv5bKoDo3y
	b1Dsb+rh2gEqjZQn5RcwKEHhw1XJjnEJ/9RV0rfBb56LC0GBgri8dlL94paAxjrr
	w1g25DSeUfIxH8cy9wY4Y9eKbEvUgEKPcm3YmIbx4AGfryQISQPQZM7vH49th1Rc
	Ed87YA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9a09apk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:04:22 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b25d977b91so5145178c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794492262; x=1795097062; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B+CH3/jx2KSH+RRiLFJDBQonfvkStMqSF3XdFCzZT8w=;
        b=Zkdyv7FZMAup7d7VcnxaVAem3tfHj5MSFqZtrqcidXWFs7hcaVhX1gf27oHzB2TEEB
         kvMkGB0vbGlN6Cd4G1y3J3mO1SN+/1C6MGibdA/X4cUpEUXNV7uVokZvfuX6QJ+Poyam
         zFs1Kc81Xes1FcQ9nO/+M2sg6VuLXuIdD/nHbbswzwV0de4ZZH0TVrlDt6tKfU1GtRI1
         qhvF4mjdOIDWI3rrbHgEk3cUzd6nn/pxW02mCQ6GM8vh8zJThB4l4CWFEqOPXWgftQiw
         iua5SuEaZsKOZPSst79yXKuZHWDTzmjEXt3+cVkHS4UhCuYfJcf9jA1Q7mA3tr0SxscB
         Me3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794492262; x=1795097062;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B+CH3/jx2KSH+RRiLFJDBQonfvkStMqSF3XdFCzZT8w=;
        b=S5GDOb9mMRH7IsqF/BRlW8v6h225rauDXNTPhesPKVGgIGQn8V0ffpxSBnt5fxbxQl
         +L6iAc1X8cEteVbX7UX1Z/7Bca2fP2IQo0XmyDIqPqVcpaQKfZsFBfyc9MKnIODKiNYi
         GRRTsmjiRkGivgO/B4/tk1riCluJSTkfQ12ThhM5rdiPFgcxfWmPmoM7/mb3AK53mqfq
         jUNZ2je4TReYw/YC4zBM9qWA4rEhHBz0lVdiyfsR6CDOOWYRFoaUCfh8Pmv3qjuqlP7L
         TR59tCyZ9pmVFT1ePLhDN+nxSdBeHbRZ3ru0wY7Odq7r/nGaW9Qg/Q/rW7eH6VmzI6kY
         kiZw==
X-Forwarded-Encrypted: i=1; AL+hErHmGmk2nde0I1O1pQ6LQi/bT6bfozDnYPeZbEwCIVrRRjB7LA90hH5MWdMytNnnZdc/RF0Fyhu78b3q5cU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JPZtGq9S7ONN8gL8uPlIhVruNXazCegr2GrdPCYSf6a4q7MX8
	f+uqQ20PUulodbaD5aucOm/8TQn9dGZjLgCK9GHg4RWPQj8dLwyNlcMSGwAWtsWLx1VeToBhYCx
	K0OeUubEDTn0XW2mOJvjL+mRB1sQgD5hc0Y4l8dAmtI8sSktRS6H8VDq1LvLrczenH0c=
X-Gm-Gg: AYBFou38wmm3FShRZKkI8AC+AhtLbXr94Pm+dcJQMT6TdQK2j30ggXiwI1oTMxv6VRg
	zRKiIslAYQ484UvyvcDRU2fql7L/Q/geOWDb8LhGOY4DzvtzurdBfCbYjREhDFBSOEbtc+HM6as
	lDTxAy+jdlt9FeeZ70G5tMcuN5nrkUJw6Og6GuDdkBqCxSG8CgH9cHUFq2F/H4zQiMcaEPXew+C
	C8pIPUWS2Vaz48w6Ya/UhwoTlwOyP4sLSK0uz1nkp1Xd7Su3UBzN+VWTF1M6s19LA03BAYOIgTN
	zEDHZjVvbnH2p7pokvy2NHxOqoVaee0MTzoH6DuofDmuNEWgwuoP+lWtUjfDEbKZfmpK6pWQzWG
	8v2oKgdjK8YSHGlRzTYFt/6FXnmBuC2rchZpJXG5YHbfy5//YDJvfH6GPSf6JjWq1+U91g1cajr
	YcDs5P
X-Received: by 2002:a05:7022:28c:b0:1b3:bae1:f5f3 with SMTP id a92af1059eb24-1b3c023c99dmr4854450c88.6.1794492261716;
        Thu, 12 Nov 2026 06:04:21 -0800 (PST)
X-Received: by 2002:a05:7022:28c:b0:1b3:bae1:f5f3 with SMTP id a92af1059eb24-1b3c023c99dmr4854412c88.6.1794492260879;
        Thu, 12 Nov 2026 06:04:20 -0800 (PST)
Received: from [10.206.104.93] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5029ecb1bsm14027c88.1.2026.11.12.06.04.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 06:04:20 -0800 (PST)
Message-ID: <97c4eabf-16b0-4e3f-8aab-1c56912c27d4@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 19:34:11 +0530
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
Subject: Re: [PATCH v7 4/5] iommu/of: Require reg for iommu-addresses
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Vasant Hegde <vasant.hegde@amd.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Jean-Philippe Brucker <jpb@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Tomasz Nowicki <tomasz.nowicki@caviumnetworks.com>,
        Eric Auger <eric.auger@redhat.com>, Joerg Roedel <jroedel@suse.de>,
        Srinath Mannam <srinath.mannam@broadcom.com>,
        Oza Pawandeep <quic_poza@quicinc.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Alex Williamson <alex@shazbot.org>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
        virtualization@lists.linux.dev, devicetree@vger.kernel.org,
        kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20261106-add_iommu_ranges-v7-0-5c0f72083e52@oss.qualcomm.com>
 <20261106-add_iommu_ranges-v7-4-5c0f72083e52@oss.qualcomm.com>
 <3713bf13-cec6-4b02-a29b-8f76070f03b3@linaro.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <3713bf13-cec6-4b02-a29b-8f76070f03b3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: IeuSgxH9YQs_zLOI-Mv-Qwhvm58Cj5j1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1NSBTYWx0ZWRfX7cYe0S+h3YKO
 Pkph5yUi8v4TOg8o8TRj+oZY+bIMYVmp0fjqMzHujEKIOWuzFp07bEkLvs8/YeGgfzZ7oDLg8kK
 gwyt2WVBeRIXDaCQvDwVtvSdd6CmNXTFTkI+8VFbFfN7gl85LET/PgWJOBNquCHTDeo4U1WjaOv
 InHfi5mlVus+Gs8tBXQ4RsJUjk0eUEjH9RNtxpOauo6ow9aJlPvWeJb12eoJsQ+1BOadGy4QsGx
 WF9NndaUYsV6fuvExCOUcMQwFvPukKoEmssk4DNoIy62AGmO4xYz522jPXO1Oj57oEUIbCj88AT
 fAeZYmjocTW1haG79MW7LnHdmIKQcv/TDmQjq1dq2K9za9hD+VG4RzQ9AQtFA9gtNjVOEiuP6tV
 iBMBnlL5HZBaJ2oNSFviNOMErXnS1sUlvsLWvF0JGGGXTiFXAer4GMInziVuilwdL0f+slYsJb3
 wqiV7QUZlYt9CJUyQtQ==
X-Proofpoint-ORIG-GUID: IeuSgxH9YQs_zLOI-Mv-Qwhvm58Cj5j1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1NSBTYWx0ZWRfX1avF8cUOegxb
 k8DM0TdWS0FEQBHSlJTJisJJfX/SnHvCXS638Zr0cgeLZG6c8pJ4QY665Q65bXThSPey0SsQ+42
 GMOVik8RUlAfv60+/940lWkaFKQLSkI=
X-Authority-Analysis: v=2.4 cv=COG/zhrD c=1 sm=1 tr=0 ts=6af5c766 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=DrYjplHx1sOd6opfFz8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120055


On 11/11/2026 5:32 PM, Bryan O'Donoghue wrote:
> On 06/11/2026 17:14, Vikash Garodia wrote:
>> @@ -257,6 +252,9 @@ void of_iommu_get_resv_regions(struct device *dev, 
>> struct list_head *list)
>>                   }
>>                   type = iommu_resv_region_get_type(dev, &phys, iova, 
>> length);
>> +                if (type != IOMMU_RESV_DIRECT)
>> +                    continue;
>> +
> 
> This change is not about requiring a reg though, which is why it should 
> be a standalone patch with its own justifications.
> 

This is about reg, which determines the direct mapping, hence the code 
is very much applicable to this patch. Please refer this code [1]

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/iommu/of_iommu.c#n223

Regards,
Vikash

> Basically the patch should state why a mismatch is dropped instead of 
> being reserved.
> 
> ---
> bod


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794381247;
	b=Dr3db9Nd/0TGvJ6Iu6ORNQocdPAQUH+K3Rakp0bvV8Ok7INZgTtlvYcfAaWbeDvaxFzQ
	 swzBItVngpsgy4tSYCOcBvDnfDztYegTgd8UktnhfkkYjLZFbBqiKteaOYmAisVp0sFA9
	 N5P+hwn9pNPW7BsYtYcV8I2U3Lxn+tHGZxP83zS8yEOdXTvtP9jGr5MhwHr4AwlpPR8B3
	 Tw9xZQlOHSaryFdWUDlnCYVUI5gP+qvlgI/tcvfJfAfj/8RF2gaAQVVvQDfd0irIAEbhY
	 QUdMehbd240DDeDwC9MqLVKQbzGnW5ciJqsPn+naUBuwdkgfBuf8OO3EbwsSE1qav6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794381247;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 X-Google-Original-From:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yhiVcwHv7tpMqJImC6knJLtSlQ8s0N4Jer0j4grDt2w=;
	b=yX8Uv1VDp6fsmMcXHS/SpAKIgVHWlW8of5tQvLK+YGifQaeBDkzF/nqxOXqv5EPmzIhA
	 g8V3py45IXMBLKaBZBie09XPRgjZ9RPBe/RudAPBjIA0ZxemGxlG79MnR77UaRx/Sm+Ms
	 tkssElStvdhJRur6O4guEqpG3XFGGvDF9DWToUNEq6BKwoyqojV4iC0uXDzTi5Xahqv8Q
	 KImQZLYDZSpxTOI3TZxBeP+NPLcb17tTMqoINWiDLfJzQpDLHbqE69fC96sj+5oSogM9S
	 Qp58opqDY6C7puxULR7uctKO24RwmtK9gH/rOK1dhER3PHLH+NfWPwWHbEtbzpIpSRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E6ZtrJWS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=glABb1JA;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4057D606A327
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:14:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4057D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E6ZtrJWS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=glABb1JA
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5KRVx1409616
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:14:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yhiVcwHv7tpMqJImC6knJLtSlQ8s0N4Jer0j4grDt2w=; b=E6ZtrJWS36NJglrd
	wrr1bpaV9Jd9mV9zd7xBCZYYEwwSNptUySacWLWhEtOics1GqNNZGOztM2ZpUOIK
	lsJ79vl+7z2qX3fM4jggXDLB9fin1eITfHQZ64UTV7ypRU9OKeO+7RVI76duUfm1
	uYBjm5xXKfiH8hn55EK8aO+XONk6UCcCKHIdeVmicDZysX1GbQ1kYILRRrb2PPIR
	33CqW2bWiaWFITu6A8Ve3eYH9i9aSTg6Zupi21eeaTG3lhCKhKdiHBsMTCpzic5Q
	oqRxqFCPKU3V5DRzDhPN0GfEeu5SR7eequFTx3qGGHRZ/N0IcQMMZdvFYhm3I2cI
	iWIFpg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvgjdgqe0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:14:06 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33713e5e6daso3612454eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794381246; x=1794986046; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yhiVcwHv7tpMqJImC6knJLtSlQ8s0N4Jer0j4grDt2w=;
        b=glABb1JA9GP4/m4aXMgGq5JGRA6XUUCMtWnhjOEl6qD4a+tJFq6CSLHjGjUjrNeofQ
         cwxaEaWf2Aq6BVpFlw1VXDfKfm4cZriKZNF5uJCZqe3yXXCSZNjwdSqrhJfLbReEpw77
         mjXCNlzi7cbyOw8bnyCyJMryibZrsnjviOk3EjU+ExgDvEMJJpiyxH91+TeZ13sTdkn4
         wPtPw1M67Wgj6zmfMYlYnRa0cNtDVbTlKdOg7OUoRt7FXjADDT1DZZ+4a4ciFDyq+WTJ
         05CX79BJOTArKp36gx0CAL2nXC9acayUpsjD9dQa9fE3MS7xhttsH7F9K1O7wVEBhZj1
         fDjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794381246; x=1794986046;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yhiVcwHv7tpMqJImC6knJLtSlQ8s0N4Jer0j4grDt2w=;
        b=j9rPrKROwYkLfw6hFS07++yuXF4NjYf4JqqHf9pd5x+lkt8/tQoqIy8gu+BCegrRvA
         nldajKv/NEDbk6G1zOYhmknoverGm1RwNxm9iOPHblR/xWh0Sbz5slqPjEElEq7ZaBt1
         wXVGrn/pcOq7RSgVjtLKV9s5sO5ow3TeBleNGFl4v9TUrreONzHYHfDxZHdvohV6w+hg
         JdEWlmhuxY3RFRz5YPCSgUtqMW5MAXmXta4UhuzKPcAmOItNeidXBR7DK7KSTZ1l96yY
         YOunsDCzewI9LZe+kGCcnCGAbfEN9mJ2doBw8RZ3DfWdGlP0qpVmwfjNLQVCYWWXJpwa
         oW0w==
X-Forwarded-Encrypted: i=1; AL+hErGtEmCmrNiKXzV2b61ikQFCwpzkgFTYWDwq+nNxah8hxyYdTPomMgpzNT1cDZ/5qKIAx9tcrQQv39AAUVA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jBMYT4ByNhHeHLmZonm6VKiXfeL59GiuyZjYxBMTDk0SRXXFx
	KISrmYSeuNjMPpWQadc3hrvulRXk5MOTmfGpPRmtFNOWxdmoq3LGNkP/HJPgFxpYHvz2LhGRptk
	FAlb9cdjKZx/Iz154D/lJvjV4iH9p4+DIdNG4S54mpwEXTQFXUmfPZjubeDRIwpaTLnc=
X-Gm-Gg: AYBFou2kHvfTWyJmtWYnsufzc8sYx3WHes77/ELxn47xJubT5PAt9mMzGfm93oyzE+O
	JNlg0QilQqErZk+/9tv5t052Cz0f4Br6gI7c33lZBJliiKbLWhqarggcRZhVpWA+O3WmsIz0KnQ
	zJXadVmOsJX28mpzm1210trrHdd8lEEYekcTIIKdPxPbmvgbJC1EcG+0vvsWNDm5WWDzT0cSnrY
	6mEdydSmjcb5iVeDjpa5jXUIiCmNJnbsW7TJwRmYvEayfYq3xqDLY4UFLAe7V/tZI2nGCPeRyUS
	ceAzDNYm1UtGc3VrPQxI+LRlrteAY/FZp7crJDQUrObUHzWOpohEDPmHTjteLcJzngd0o2JE6wg
	7MfRwzE5gPqSwxSJJ7p9iW5hIjKcDDHmtMYCvHMoCXbeS8z8lTIMDwFe2mUDN6k0c3Prha43r13
	zvbueY+bA=
X-Received: by 2002:a05:7022:170a:b0:190:da74:2c89 with SMTP id a92af1059eb24-1b3c0324aafmr1387078c88.21.1794381245666;
        Tue, 10 Nov 2026 23:14:05 -0800 (PST)
X-Received: by 2002:a05:7022:170a:b0:190:da74:2c89 with SMTP id a92af1059eb24-1b3c0324aafmr1387024c88.21.1794381244935;
        Tue, 10 Nov 2026 23:14:04 -0800 (PST)
Received: from [10.204.79.28] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890c0esm13146024c88.1.2026.11.10.23.13.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 23:14:04 -0800 (PST)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
X-Google-Original-From: Jayant Shekhar <jshekhar.shekhar@oss.qualcomm.com>
Message-ID: <512f4c94-15a0-4ea2-aa70-b0015fcb4079@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 12:43:53 +0530
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
Subject: Re: [PATCH v2 01/23] dt-bindings: display: msm: Add Qualcomm DCP
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowangio@gmail.com>,
        =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>, virtualization@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev
References: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
 <20261026-jshekhar-dcp-hlos-v2-1-7cf014efdee1@oss.qualcomm.com>
 <20261027-camouflaged-orca-of-debate-316694@quoll>
Content-Language: en-US
In-Reply-To: <20261027-camouflaged-orca-of-debate-316694@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=E7tYNqdl c=1 sm=1 tr=0 ts=6af415be cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=iiY4aUXpewVHb1WYKVUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: uvAvMI5MXKAaomu1BQuxWXwFBZP1-cub
X-Proofpoint-GUID: uvAvMI5MXKAaomu1BQuxWXwFBZP1-cub
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAyOCBTYWx0ZWRfX/uRjgJuWMdqx
 Tn08CGSzKQU6BVA9cSNhtvNevUudTOr4kVxYfZjRWCV30kWQFaYzN9xGz8lQj5vTiP9DCpWfzFQ
 /ChbWlW6yMg4wPP0AzWuaBER/Y7mabms7ev+YFZUYPgvWewafQmVYHOjfVCpf+K0nLnvr1ImW8G
 Ub/PcJAaIpxmlXH0WDsUvjLHM1Y+WuiCsRJvBB6d+gngyDC+1CDksR7jXk/0yaBrgUUabuta5z1
 rGsWrfjHvcOfdR8xQb+m7x4D563mcBJBLOyYlaZMFg7Q6rbTDYSig+mHhtlUvu6LWzSmO1VEnKc
 CP2UxEAtTAnBophAsWEb3Rg3pJ13geegYRHD/1uVuxnJ1AQ6KpY/TfYEiZlNkg8uDkDWr33FqO1
 Zhgd8lA9t8HY9ybspXoXQN8GQxJIy5imUCRVS2zK1y0ysQwSoyrfAeT+kra55FXzX9j/d1AA51w
 DSTMu7uqWlxqUgc6MEQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAyOCBTYWx0ZWRfX/uR8FeLZqLdH
 E7kjwJLY3QfjHM4phCl7SQfJl3SkDcF8O5p9K3QVR+nRb3yBOcEnUyz2n/mpWq+ZIq9A5qhzqMO
 rpJI3D54gaMU14HmHs/07GA374G8P7w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110028


On 27-10-2026 14:06, Krzysztof Kozlowski wrote:
> On Mon, Oct 26, 2026 at 11:51:11AM +0530, Jayant Shekhar wrote:
>> DCP platforms place the display pipeline under firmware control, so Linux
> What is a DCP platform?
>

Will address this in v3.


>> cannot discover display resources through direct register access. The DRM
>> driver therefore needs device-tree descriptions of the Qualcomm transport
>> wrapper, display topology, IOMMU contexts, and panel connections.
>>
>> Add bindings for the Qualcomm DCP transport wrapper and VirtIO display
>> subsystem. Document the IPCC power-notify resources, transport and
>> framebuffer IOMMU contexts, firmware-visible IOVA range, INTF graph, and
>> DSI panel connections. The wrapper creates a standard VirtIO-MMIO child
>> after the IPCC power-notify sequence has completed.
> It's still DT for real hardware, so I wonder why no SoC specific
> compatibles were used.


Thanks. The same DCP transport wrapper works on Hawi and Maili, so the 
current driver uses the generic qcom,dcp-virtio compatible.

If a future SoC requires different wrapper handling or has a different 
layout, we can add a SoC-

specific compatible and match data then. The child’s virtio,device34 
compatible identifies the VirtIO function.


> Best regards,
> Krzysztof

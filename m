Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0F4409637
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792392347; cv=none; b=pJtHnrA0dy7b6ODm1Kn/zzALt20kA/5C8/XscrXFAbMFsZNz+ebmPJaONj6kUWodpsXIutIyFPi6KxkMyHT8NNmukVajQvzlh1/TxyWKmbBnSEVUoFOvCmIow+E6sYBkSDgKXU+Q8g+RWWm+p1mpHq6nKeUazG7ddjKupTmzlFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792392347; c=relaxed/simple;
	bh=pfPZE1oNbQbujg70mqVq+VNEU8XoDctbzzic/gjTn/I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VgGQEWW1txshCQmYyuyyo+R33XUEZf6BSvYyK3SDdU1/g2dcMlNJEjybPAINvVreXqOqTnHwdN+SH4DefHSXsRtjyILxQXDBkthWCnziq2XKGdfbmS3rZnfVXmv5T7XE6dwtoPaiOaqDqyjkNxDMpjmQosY5vUTXRavTK7Sz9Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hn/J+RbS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iWhWJ9P4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hn/J+RbS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iWhWJ9P4"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J4jF9q2821625
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:45:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DVmSeay1XTMpEpXgY2Y5H3fL3jFlEFcncLH042xWGNk=; b=hn/J+RbS23AsOvR8
	TedeY3Bsg0NhTf5sRVzf+0mHzJ8qwP9oCzAtTS5o7lwEbYW5mo2dL5nVcMjRYW4K
	zYy2DwuKF5pwxaHk4uyyie5gEDyvAlIo6TFc5Ml65qQrP7jOW03pcY5YoHp08Ook
	/ssC941oX/sC71PYIrM6SvTaH9SThaoeaueI1RXHU0QbUkM1Tfxdw3PM+9IDhQrC
	bKTrn+jrlI/a5CpFoKv8BtZA4C8Cy7PeHmtMupCvsyr/rirrsmrvi8LTYgMAfZyx
	y8eZag+4Jq3Xsi9eFTfuP81Yg2hrQCjZw/SQqRSiY3o9FvvzXuQFxrTy7FfqqTgV
	Cc2n3w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbxqfwhyq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:45:44 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e9821ca96fso18291545ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 23:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792392344; x=1792997144; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DVmSeay1XTMpEpXgY2Y5H3fL3jFlEFcncLH042xWGNk=;
        b=iWhWJ9P4a4y6hp0IyIx7dQQVhhOcMyzF1hszxb9hNF9lkDjhW518gurXxYVy6zRGEu
         DaidBQAUgLGccMOfhfFhLedt4O3duWEs+tPl/LcNINlxmSqwEQp35BXuivnBhl0YZ+mP
         CEFxfHi2mEq6a+hq2BbwSLvkp9zTxCTcNfbccKC9LGSQZ8+e25xutVfXl6CbX8PXbhCh
         ibIZiYf4m+ghAvSuFArKGk8seWNG44Vwywv9CVVkOVFcbcIuJ8QxOjGrQvHqdK9dHEPw
         RG7XmjsPHCgPiZdFKlAYpcEtyx007wQSfCehz5hD1JYDdWLU3ei1PosOUSb6dFIerMlj
         6H7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792392344; x=1792997144;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DVmSeay1XTMpEpXgY2Y5H3fL3jFlEFcncLH042xWGNk=;
        b=sQWfeW5Z9WChgeWPaFVvqMqUQmttDN6U3d5giPDBAm/fFScVtymvPAaeHuRBNOgqpH
         aVaqLBJw2UW27RO+RMqm+2/gokp2x+eYnBuKiznMk0tQQti9W7uxdA7HTR6O7IDhAQtw
         FAu3bOEeeNFC3JdZSduPCAg+xtHYtj+A8iwdy1IVWNxcDWGQw6YBQ8/CcCPn4zIY878+
         YkqHAbsTr1G294DJujeHtlyOyS5+cPr8syAyaLVp9DexZmh5vkB8IgNuSN38Odt7jvJY
         fm1DIpyD4/A4Iw+4NjN2UTOaaU7zgw9eRrzORecJzUCUigWUSpmfBW0tt3GXATBVJ7hf
         KfsA==
X-Forwarded-Encrypted: i=1; AKwUvBznNgxO4f40sH4RZphHsM94z3EiY1OG+R+KRO/7GvngJL4aixtRZKH+AVx+V4F8A61APXIy0wsfmKQPWCw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIa3ziUxbqjM6GiqJPbgUnuu2hXE08xviVXi/BguqNhoCsyIUgr
	jFpcgt/FtFGiMmMfoS3Y5qSwsHPwjYl98RJw5Ui3yva7RZ4uKle8NUukyPfdDmheiJZgDspQ/Ia
	Q37dky6yCsG8vHUOBNA3SXEnU3Zlo5o5n0tUw/HFYE7B2Mw6w1wZ/fP3bH57z8DVE5Bw=
X-Gm-Gg: AYBFou0NBRN62ZxGS1zPgT8PS3Talbrnr/p1ZQTxfMCpcSE3IxbxHJNyfvZ6VthOV4s
	W+VknMOUOxrDlt06pcw+m8k1X9nhqI106d+zTkbP9rHZSmQifyoRqYxORp+Hbn24/pKRSxUEFZE
	ZsEpad772mOp0NR8NGQLcB0l804L7dP0EHEERhjsjMikUL/tZRZ1JyLLoM0M/nBI00JLEwJKXuu
	nhQQDNt5rHyWobLI5xBVNSMeQc09X+xPSxaRqvVvIbF4gOC/GfkYDcuG5mi6th/DBGZJNDwsjWb
	3qYIr1/iQHEhSLVwYAaDL1t9AOQof/FZc0ofMsdCBf+oWY2T8E/dikuwDA14ZVzawkE08AyFjDJ
	L0sEKEGm1PijqEbDK5Nz4P3CUvwi3dCeNp/NkErnqesFJ3D7UGAfM4One7uxf
X-Received: by 2002:a17:902:f686:b0:2e9:a090:dd80 with SMTP id d9443c01a7336-2e9a6d25346mr62369855ad.22.1792392343734;
        Sun, 18 Oct 2026 23:45:43 -0700 (PDT)
X-Received: by 2002:a17:902:f686:b0:2e9:a090:dd80 with SMTP id d9443c01a7336-2e9a6d25346mr62369505ad.22.1792392343154;
        Sun, 18 Oct 2026 23:45:43 -0700 (PDT)
Received: from [10.133.33.6] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea0cda9d8fsm731205ad.14.2026.10.18.23.45.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2026 23:45:42 -0700 (PDT)
Message-ID: <2bb63bef-b1b5-487c-98de-7cb5fa9b6758@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 14:45:34 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] dt-bindings: arm: Add MPAM MSC binding
To: Rob Herring <robh@kernel.org>
Cc: James Morse <james.morse@arm.com>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan
 <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
 <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu
 <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
 <20261008-mpam-resctrl-dt-knp-support-v3-3-35196c2b43bf@oss.qualcomm.com>
 <20261008212736.GB1318789-robh@kernel.org>
 <2eddfb6d-c622-4d72-827e-aed685e72b9c@oss.qualcomm.com>
 <51bc6576-7e52-4685-b7b2-a355c2b7e1ae@oss.qualcomm.com>
 <20261015193639.GE5059-robh@kernel.org>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <20261015193639.GE5059-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAyNiBTYWx0ZWRfX9F0LEHx1JIRw
 BFhO0pVgfEL+j6A/YPf4f1i++aTRrk2NPj22nAp8l++qDgEP5b5Gt+S/ufsKTeOInbivwmIfYZ+
 o6zhuqU0NJpP0Vgnv9c1zJUE11YB2N0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAyNiBTYWx0ZWRfX0TZbIYdnajs0
 dK/Sqsx3RJZAL/nYFSnB+TI3BOcIa4MHiiOJXV9Nr2FpUiFCvT6SRXTUtsTCF2cOUGa/4uY72sA
 GLC1Fh5VxF0fOxZl+s1/MTno0kRrdymt9ycLe0hNnDCz86B5h15gL/8uRqs2eeV6nk33Mrjrgfd
 IOOdSBYpx1HoLdBwngSWvjNqiPGF3BVHDogrRSQUqB0uV4a3MiuqgMKwSP5wCr/25d8gU5+T4/y
 Oo1pjtysreHVXvTWCV7qg0EPuOXyUl2aCQ6q7FSPMXtRcI0XM+HZ6Q0Kcuvx3W9IuGDeSk57Tj3
 gypL1rNu9a2j2pwWcvtZi1t0EDq6GLfyhyaYfoXGC0BSLPF+MaJ7EvD+iYaakSSJWZcsphfTks1
 V/KYf4gShWVifTqxTlS0IPMVr0pB4tTtLNEErY2XjOm8S4heEl7dCe69BizaI8Z76OS+G6fX8sh
 iZOB1HpE7AniJK9uoAw==
X-Proofpoint-ORIG-GUID: XV2c1TFmr2GKfIEETN04HddrhXx6dGtB
X-Proofpoint-GUID: XV2c1TFmr2GKfIEETN04HddrhXx6dGtB
X-Authority-Analysis: v=2.4 cv=RYMFmFtv c=1 sm=1 tr=0 ts=6ad5bc98 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gEfo2CItAAAA:8 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=2vh7TcXBQbIRG-HjRUIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=sptkURWiP4Gy88Gu7hUp:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190026



On 10/16/2026 3:36 AM, Rob Herring wrote:
> On Mon, Oct 12, 2026 at 06:24:06PM +0800, Yin Li wrote:
>>
>>
>> On 10/12/2026 3:05 PM, Yin Li wrote:
>>>
>>>
>>> On 10/9/2026 5:27 AM, Rob Herring wrote:
>>>> On Thu, Oct 08, 2026 at 02:41:12PM +0800, Yin Li wrote:
>>>>> From: Rob Herring <robh@kernel.org>
>>>>>
>>>>> The binding is designed around the assumption that an MSC will be a
>>>>> sub-block of something else such as a memory controller, cache
>>>>> controller,
>>>>> or IOMMU. However, it's certainly possible a design does not have that
>>>>> association or has a mixture of both, so the binding illustrates
>>>>> how we can
>>>>> support that with RIS child nodes.
>>>>>
>>>>> A key part of MPAM is we need to know about all of the MSCs in
>>>>> the system
>>>>> before it can be enabled. This drives the need for the genericish
>>>>> 'arm,mpam-msc' compatible. Though we can't assume an MSC is accessible
>>>>> until a h/w specific driver potentially enables the h/w.
>>>>>
>>>>> Cc: James Morse <james.morse@arm.com>
>>>>> Signed-off-by: Rob Herring <robh@kernel.org>
>>>>> Signed-off-by: James Morse <james.morse@arm.com>
>>>>> [ Yin Li and Huang Yiwei: use oneOf for the compatible to allow both
>>>>>     standalone arm,mpam-msc and the two-item combination; fix
>>>>> schema field
>>>>>     order, type constraints and yamllint spacing; fix example reg
>>>>> addresses,
>>>>>     add arm,mpam-device phandle and remove TODO comment ]
>>>>> Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
>>>>> Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
>>>>> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
>>>>> ---
>>>>>    .../devicetree/bindings/arm/arm,mpam-msc.yaml      | 202
>>>>> ++++++++++ +++++++++++
>>>>>    1 file changed, 202 insertions(+)
>>>>>
>>>>> diff --git
>>>>> a/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
>>>>> b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
>>>>> new file mode 100644
>>>>> index 000000000000..3c7b13a23ff2
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
>>>>> @@ -0,0 +1,202 @@
>>>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>>>> +%YAML 1.2
>>>>> +---
>>>>> +$id: http://devicetree.org/schemas/arm/arm,mpam-msc.yaml#
>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>> +
>>>>> +title: Arm Memory System Resource Partitioning and Monitoring (MPAM)
>>>>> +
>>>>> +maintainers:
>>>>> +  - Rob Herring <robh@kernel.org>
>>>>> +
>>>>> +description: |
>>>>> +  The Arm MPAM specification can be found here:
>>>>> +
>>>>> +  https://developer.arm.com/documentation/ddi0598/latest
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    oneOf:
>>>>> +      - const: arm,mpam-msc                   # Further details
>>>>> are discoverable
>>>>> +      - items:
>>>>> +          - const: arm,mpam-memory-controller-msc
>>>>
>>>> Why do we need this?
>>>>
>>>
>>> Hi Rob,
>>>
>>> Thanks for the review.
>>>
>>> The 'arm,mpam-memory-controller-msc' compatible is needed because,
>>> unlike cache MSCs, memory controller MSCs cannot rely on the parent node
>>> to identify the resource type.
>>>
>>> Cache controllers universally carry a 'cache' compatible, so the driver
>>> can recognise any cache parent and derive the cache ID from standard
>>> properties. No equivalent convention exists for memory controllers, and
>>> the component ID comes from the MSC's own 'numa-node-id' rather than the
>>> parent, so there is no parent attribute to rely on.
>>>
>>
>> Hi Rob,
>>
>> As a follow-up to my previous reply:
>> Whatever the outcome of the discussion on "arm_mpam: Add support for
>> memory controller MSC on DT platforms", we will keep the binding and
>> driver support consistent. If it's dropped, the
>> 'arm,mpam-memory-controller-msc' compatible, 'numa-node-id' property, and
>> the memory controller example will be removed together.
> 
> Which parts are you actually using/needing and not using? If you don't
> need RIS support, for example, we should drop it.
> 

Hi Rob,

The Kaanapali DTS only uses 'arm,mpam-msc' nested under a cache node,
deriving type and affinity from the parent — following your earlier
suggestion. No RIS child nodes are used. However, this is not 
universally applicable. On most platforms, L2 cache nodes sit under CPU 
nodes, which do not provide an MMIO address space. Nesting an MSC there 
causes address translation failures. The Kaanapali DNM patch moves the 
cache nodes out of the CPU to work around this, which also has the 
benefit of making the MSC-cache parent relationship explicit in the 
device tree — though this is still an artificial arrangement for 
demonstration purposes.

In fact, if Kaanapali supported direct MMIO access to the MPAM
registers, it would also need to place the MSC independently and use
RIS with 'arm,mpam-device' to point to the L2 cache node under the
CPU — the same approach required on any platform where the cache
topology cannot be modified.

Therefore, apart from the memory controller MSC support, we believe
the remaining parts — including RIS — are needed on the Kaanapali
platform.

Thanks,
Yin


> Rob

-- 
Thx and BRs,
Yin


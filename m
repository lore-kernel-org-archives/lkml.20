Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792757045;
	b=BcKPYen5Lx6AmuHMerDAeASAVD4iugBvrIliaMvEID9joTzitHg0anMqK8abCEID4wTH
	 ILlwxi5lRVezsuzic2AvZdxG1sTOHbvxxapsJzTi1nwZXuuOnyzgrptPhGw8Ck3G0oQAZ
	 PMTPKOOXFvLnrUJo9DYxX7awxdh9GnvEsO4n5+ahHa/pRqLAt1/DeSegVY7ZZM+46YT5W
	 jRXw23DUCJxLFG4ArDLT8i0qWuGxh9/GUqOcPwpqDarvtK4holDHARhY/osIrQC+fqKES
	 5kfUht3xUmdTfBNHEVyVVhsPZpx3BkZSf/K751QhT5OahFcNCNGcQz37LQrXFofxklw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792757045;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2v7sykkVpQFD15T/qtMC8NWAztz/dUgETy0RLYu2jp8=;
	b=zaW7sbur9MWMGfnNtDCWQMQljwrwmajxoJnRERHonTOPlHjTjAsQjGi8zjwnZegORGzC
	 ItNHxAnx07d09+98rzqFNWbHYHn7HZiDDvOpwRs/rfOuEC/hHRicBMAfO9G+P8OXyKjJx
	 D1HbnKsp4VtXdcR7ZakN/6zehvDVOrjJmRHvAE1vk5r9ejXw2aPh2o+fwNVW5q+XMes9w
	 pzmff9fq2dmdoLVWV3lW/IJlTWuGKiAGU4nU9aKuQN47M111klR1rR5HF9jKP7Sg+/D5B
	 GMe2AaZidoyI3KpPOsq0aMLIw23ZCW67EJ8M1MvQN1NjCFd+lFqItHaGEDJvuDbYJLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h5L59kEI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LirIhP9K;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27821606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:04:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27821606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h5L59kEI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LirIhP9K
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAWbt3560971
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:04:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2v7sykkVpQFD15T/qtMC8NWAztz/dUgETy0RLYu2jp8=; b=h5L59kEIQ/3LwFB7
	bNnjdoQed4rRZlG/2nqyWogTvOgQxtmgAFJWoqOGMfgv9Oy2q0L95WZEbPm8CXF6
	gUMwudisky+BO/d/5ARtn9Jt9QpzA9om1ylWvq+SVUHrVF6AWt4uBQ52XhFiALFp
	wisDT7HfLyTQ3wNQHoDSWClIKU8+Zo0wj5fzPJ3ZAfE/VWmELr38uEAClRXF80So
	nPLbPNxiogVq1qvif5iEw2AcvBST8tZQaj5NK4ojlcFJEmEYtUeQIhu+4PXxnYvM
	k7A2AB2gWgZ0cezr9xp8x/YuKn+hmuwotIrTE79J53YP9qX//rK5SvvHBeCK41m5
	z8Y24A==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmpbhvr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:04:04 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-988c723394dso14395241.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 05:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792757043; x=1793361843; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2v7sykkVpQFD15T/qtMC8NWAztz/dUgETy0RLYu2jp8=;
        b=LirIhP9KN2mZ8XOO8zljmzmV5LyuC8xKGqcwFlyoFuo8RqNHzA/7i6v1OAhPnWABzB
         oz30IpCL3+SASPDdwJZHiO4zmd2g869bMhD2fbAFqreEuAyLlf5GhN+O5FlMGFuEJLDK
         VQJXqPIP0z9nDqyKSM7BOesVgYYGE4CF+TaEV8KrLcxyWVTs1z8DLB2x3rolA+IhHu57
         fp8DYci4FObIkDjcl10TXMGWpWzRPdY4+CcHXfGfVYW0kPjh3C0ypAcxO7DT1E/9ejgZ
         fDfWWohL7Nl/gZYsrXOvSbgn5pccJQ1dIS0VAjS8CdwqjCA3te0fWOalgGR94GdzGX+1
         Yo5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792757043; x=1793361843;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2v7sykkVpQFD15T/qtMC8NWAztz/dUgETy0RLYu2jp8=;
        b=rd2HkX5ZCM8ZqEKfIsKmHlbg8UBsXl/FhDIfJ+LxmLkktWhGJ32ZiBSlcQxVfjQ02H
         Goqeo4toefHu7kuJYVFFkMBzBixlKP+OY062WAZitzDj65o55fBKwyu3GTAb2dbHplgQ
         zyd5YKnODdASpyaEZPOkXo36Y5jLtjRdTuRviG4i30/I83b4rrMNH55KEgjEDHshsj/S
         iX8dS45ZpqsMI2HKBXnvPkJZPl8eZzKMhqZerI1Paw5yl91YdMSmudI5hsdOnflGWyA+
         McN6K2F9ocmr5ZhT2XDnoVBC86Rcr3fJb0uBasOCKbmyzq8zg/Fvo101ACYgcFjU2bwk
         Xp6w==
X-Forwarded-Encrypted: i=1; AKwUvBwnM9yrK2Vou1UYG73NHYq09ZP29j115t1ke7Qr1wpUUIFwdstAvagNu3okQOo6fHoAl75askrtGK+pH20=@vger.kernel.org
X-Gm-Message-State: AFq9FYJY4K04FjanDJkw4BNd+0stY2aQ1eyLZsjDt11hz8UoxOQApxyj
	Fta81Zz90mQd/Bstv3O5xzkngiflaggdrbLbB2l0FEfs4OxOjaA3Vhmsw22lIw2MQRet8IEvglJ
	Z9Voi+awhizrEahtVOyfPmzoTBFPYMgPiQzAPn83O/bj5LRUANsp30JQYEuu+c5cyVPM=
X-Gm-Gg: AYBFou2mlpD5n0ejOPEYtGoqVIK///k+pjBq4jZ40x0Zn/PJ0uZNN130eRK5PDIzAMa
	QdjcHBtlA4UmONynfdYb4nwVZI2ewKYJ0f7z0iDiwI0hb6+4l5mvJ9k/1BNLUDpdBuqLUaza7Ii
	V4m99w4Fmm53GPt1W/FhpjYorwHU6+KN6C7oOxYzmb//DCDl1y6kgnTCU/HGf4rT6Mky6cKbVW2
	ntnrlLAe3wVhhrbyCYjnhxChX/utj7IjY0qS561ka+6FeEinsPyR+vRbqmsp/0E6uZvLg4Y5CJX
	MBlYjLKaKpvNK1D3gah2ML9gi1qpmnW378pQmrZUiybQGtF+VaRM5SgvcKC9hyVLWC5rc1da+Ay
	q57jkjbwK/qmQIUwT5AsjjQ==
X-Received: by 2002:a05:6102:8515:20b0:7cc:174b:f7b7 with SMTP id ada2fe7eead31-7ccc2d8f97emr718387137.0.1792757043081;
        Fri, 23 Oct 2026 05:04:03 -0700 (PDT)
X-Received: by 2002:a05:6102:8515:20b0:7cc:174b:f7b7 with SMTP id ada2fe7eead31-7ccc2d8f97emr718339137.0.1792757042539;
        Fri, 23 Oct 2026 05:04:02 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b432c96badsm977598a12.14.2026.10.23.05.03.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 05:04:01 -0700 (PDT)
Message-ID: <1feb10d8-75f3-4dbf-9fae-807dc5a22c25@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 14:03:57 +0200
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
Subject: Re: [PATCH DNM v3 8/8] arm64: dts: qcom: kaanapali: Add MPAM MSC
 nodes for the L2 caches
To: Yin Li <yin.li@oss.qualcomm.com>, Ben Horgan <ben.horgan@arm.com>,
        Rob Herring <robh@kernel.org>
Cc: James Morse <james.morse@arm.com>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
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
 <20261008-mpam-resctrl-dt-knp-support-v3-8-35196c2b43bf@oss.qualcomm.com>
 <20261008210004.GA1318789-robh@kernel.org>
 <1d764a3d-7935-4e26-b1c2-92537e1d3811@oss.qualcomm.com>
 <893507ca-b956-474c-9124-92fbfc25e9ab@arm.com>
 <f17e31ca-817c-4607-a680-55ceb12169dc@oss.qualcomm.com>
 <6e06228b-827a-4321-99c1-3e0e961abd61@arm.com>
 <86fee017-c9cb-4583-beab-4f29919fb518@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <86fee017-c9cb-4583-beab-4f29919fb518@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA0NiBTYWx0ZWRfX0FyPcTss/7Lh
 AI+uX5lm5FB4AVl1w5fsdh0S23znnok75XxejbqxUnsFkfuENQZ3NbD82ZxKc4UdxEwIKPpC42C
 MuZw1knoGcjSS35WLpiM+ATAnBgEK78=
X-Proofpoint-GUID: CRoDGmxoUCtgl4DXCTf8_K0rBpQBhzXX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA0NiBTYWx0ZWRfX0ywneN6mbGQ5
 0nEgTMBOTHn2wf6+4a8VsrMx88xuU7YUqi23su2UL6dmpF8aLQAlTJtZU8EJY0yXrmhO+j1+iqZ
 ywiPEq4RRbsIjWbDbS4j7+GP/n54S9jalvn66o+Me2ZRvFZ77ef3p36y5dBbeT3rHrhU7ISRc3L
 dW15XdhbTtUTmBmjBp/t4sO/LRgnMsuqE/0PPnnrBjv8J0yuPy2ISvnu930fwO2tvppg8IhcJfi
 b5pd2al+f5+Ze7IL0+a3hyysfEdtwH4zQQW3FtGFRQyuX9yAXFpptr2WEKa4kU9L8kIvfdFWsC5
 ZkkJ1ZzzcxH/hsN2iM9sfIBbo+6v6ITskmltjDRtLPhE2ux8BIuTr8ks11jTTwaTgl9yArQPqvQ
 q5jS9wqlJk231Tmq9tcQs2B7H9qb/TtaMqmzg8eZ/aP7XMghVXyUHqudUBxKQMkAslfb7rm97pW
 cI8AifGpKGl+B+y3aRw==
X-Proofpoint-ORIG-GUID: CRoDGmxoUCtgl4DXCTf8_K0rBpQBhzXX
X-Authority-Analysis: v=2.4 cv=BdBNQbt2 c=1 sm=1 tr=0 ts=6adb4d34 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=u5pNeYj4kXT91oPWfH4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230046

On 10/14/26 9:09 AM, Yin Li wrote:
> 
> 
> On 10/13/2026 6:37 PM, Ben Horgan wrote:
>> Hi Yin,

[...]

> Hi Ben, Konrad,
> 
> The original 0x10000 reflects the per-MSC register block size as
> allocated in the KNP hardware — as Konrad noted, Qualcomm DTs tend to
> use "how much register space is allocated for this block" rather than
> "what the last used register ends" to avoid holes.
> 
> We'd like to update it to 0x321c to give other platform authors a more useful reference, without exposing KNP-internal details such as address holes between blocks. In our case, we don't implement MPAMCFG_MBW_PBM, and — as you noted — the registers from 0x3000 onward are domain-specific; since we have no domains, those aren't used either. So the actual footprint we need is smaller than 0x321c, but showing the full 0x321c gives other authors a complete picture of the allocated register space.
> 
> That said, this patch is marked DNM and is intended as a local
> verification example only, not for merging.

If you don't intend it to get merged, you can even put 0x12345
in there. But for future submissions that will have the intent to
be merged, please stick to the 0x10000 size

Konrad

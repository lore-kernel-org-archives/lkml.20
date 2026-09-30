Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E4950C2A4
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790788291; cv=none; b=iqIvM//JOgPLoau/bbeJWFSXbZjVZtdCxOobGLIq+LuonZnpd3HgozJzVPGhXmbTysBgVhtO0bVnboDeT50IdG1HNeDwRUS5QEtnmmQWxqRsRZwChNDHdrMBoOLHsgqwAYfxOtxFuJsl3270riDdd54EZM6TMqDAGFhxEqi0G5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790788291; c=relaxed/simple;
	bh=s6L2Yneu5RinD/X1cXZhWmOBWmpe7BXb+htXFPn+fGI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pgeMrmL1LisQG9AP5QW6UI+WBwnD4Avc0MO53I0dXqTik6hPhZxt6YFhLyQHQNzN0P106+cpt0M52+6lFmljUNdYvZgzuLzexu9yj//MG3t130pSWiJWgTExKqEwVSWac+EVgKd544r5uHg8XvMQ900m/TSZgXbsWgu3GEhiA2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KPfhXbhX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hPplf8Ri; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KPfhXbhX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hPplf8Ri"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE045P3942329
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:11:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1speXV24+/9tG1ESXtDUfECcqOxMqMyFb+Zms7tpaoU=; b=KPfhXbhXoBXQlO6R
	HYEPswmcgK9D/YdvL1jmAEq+Emj61a6fbSDM9XWA9p+3zYbdphP7ABW5DDwKu5Yx
	BpKAZ0cqB6gxCPZ4V8nqm6yIv5zmvIo/bslS/wSi4HJ4OtUm7tUvvfSGGt2SaAP3
	KeiFvfpk8YcsaKa7/9dyMjEm8zmMuhcwoIu9JbgpHygnDrh0XFCslndkREwFc/D6
	U1Hpt+YkG1X5IwACNiMtjvHi+uGlDzRuMzgXTMzTuXfNDZqQIS2jCSsp17xvxHGM
	0jisipw1dJbQX6Y/XBRTVxcjZ1lZE6545iwVMlVvnjQSgUugcbFnNfi+2glTPhG3
	iCYE4Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h10bk9vvv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:11:28 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a46f0f158dso2731328a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790788288; x=1791393088; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1speXV24+/9tG1ESXtDUfECcqOxMqMyFb+Zms7tpaoU=;
        b=hPplf8RisHHjnHnS5fgvUmJzWnwaZXL4MPwyUh907WyaQsVb52Aobk4YHQRg/gqWGX
         DcZK2a0yHTSqpwTTf5QT28mECvxe5cUkr8XG9Q9OvnlbubCNA6BMMsu69KolcUEcsWck
         2U4ZsaFO3dQOTIj/mjY5oSeNDDUOa2gvrczA9ZmFVA9fNZkXyzBIgGgEOPv1UALA7KpL
         8FxtyBJ6KmwC64J/1gISvPQR7yoPIDnFtpZ60q/2X1OsSDAytNY2jJTco3xov7v2TsBb
         pQogTTPlyrvRTFeSljO4cKNf/CYpY6fEj3H5psJq1jfsVDamfzzTBaBSpjYOCzeHXOKl
         RSfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790788288; x=1791393088;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1speXV24+/9tG1ESXtDUfECcqOxMqMyFb+Zms7tpaoU=;
        b=gL3RxvBIinEXz3jE/MBmmTmavQ3J2TyzqE/6xey69YH+hy2/r+1cOyKdqNDsdULDRS
         1/fDpXt8yewq0ubdNQrjUmtBPTW+n7JaxVs9z2clZoEzlUcPiRUyZEz1XY3owRyBK4rz
         cMChMd4ZiKjSGeFYlnxpOAl16LfYEgD7jqt7pttqWl5mtz33TZ4x4EL/cKry+aDZI8yx
         BUO82mjB7EbBxBkY3qAxq5OAYaKxZJBgswvVTIQCaUfwmFy5ULIC2TI3zw9ixV0hQCmU
         qfjDnR071bKt9mVRLg/tStR0bZCnUszKZkAlG0WEWiZXSfwGS2cm0DFUZaKhPoEd9v1K
         SvHg==
X-Forwarded-Encrypted: i=1; AKwUvBwjZYLMnQ+XLH8WAvV3E8/4/LucQmgxkLidcSu2VG+juQ+xcfxuxx1iqb7m15a6xrpdA2MUwnAG0fSXp3c=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOhfEIwtp9pNAoExZ4sBKyb1/bQRNJypI0RqN1QfXxhacrYT8r
	0E+FgAbSFXOTGGgmcMvmd4sNxiFE5lkO+2QT0PdNXPN+ODuMwM7SwnBDypSIwDsPdmAxJyEk2BR
	JAV8aJiftiGjxhO2LzVBFyjtWLn2knLeUPgQhFi5XLF3/XS9DV0rLZlOw9puo0kSOv7k=
X-Gm-Gg: AYBFou3aLrnU3Wlji5Cg9fRR30UGAb6kBj5jXChVLgq0Gtw1EDEksUdzonsC2PB7ggI
	QpG23puP4VbcEhwZZ9gknNHDrGZL5RQmzrjZQdj06F9hd7Tj8rQ6wF1NQtLAsdpCuCPRQ8X4uDE
	yoh19F+IC1yMZU0IfMXwKm/mt1ls3i7SIs2yIq9UlI6jIhZuihT9ciCx5a7+WyKN/SGd4xElshu
	yhi5uExxgSXU42WM97YBlUqgVOPDMjQZLxFxWu8H/Ns/tTnDOSrCWBDtO1pYl66ndk7HhDZNnA4
	XlQgpvA4Hj8rc72F34UA5yykYY5reS+fL/DXyA8OsYrTURJAnWrMRjvhoxH7IIgq5BVJ35c5g2X
	YZX5pCqD+Iv1tJRSXHioZbvxN+SU=
X-Received: by 2002:a17:90b:4d06:b0:3a0:eec6:b065 with SMTP id 98e67ed59e1d1-3a4f2d5ed16mr126687a91.13.1790788287467;
        Wed, 30 Sep 2026 10:11:27 -0700 (PDT)
X-Received: by 2002:a17:90b:4d06:b0:3a0:eec6:b065 with SMTP id 98e67ed59e1d1-3a4f2d5ed16mr126663a91.13.1790788286852;
        Wed, 30 Sep 2026 10:11:26 -0700 (PDT)
Received: from [10.216.34.91] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f46b6bbbsm214768a91.3.2026.09.30.10.11.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 10:11:26 -0700 (PDT)
Message-ID: <0d485228-b082-4064-8923-a750db9acf02@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 22:40:55 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] soc: qcom: smem: add boundary checks for partitions
To: Albert Esteve <aesteve@redhat.com>, Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sudeepgoud Patil <quic_sudeepgo@quicinc.com>,
        Sarannya S <quic_sarannya@quicinc.com>,
        Pranav Mahesh Phansalkar <quic_pphansal@quicinc.com>
References: <20260820-port-smem-v1-0-d19a45f583bf@redhat.com>
 <20260820-port-smem-v1-1-d19a45f583bf@redhat.com> <apYFPXLD6hLWohz0@baldur>
 <CADSE00LeKbGsqd_fBnWhAssiu5yFPH2_FuaY0ZamxK1GYHt+Qg@mail.gmail.com>
Content-Language: en-US
From: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
In-Reply-To: <CADSE00LeKbGsqd_fBnWhAssiu5yFPH2_FuaY0ZamxK1GYHt+Qg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 764mdNscbzn-nug2x_n3Ax8wo-oKePCP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2OCBTYWx0ZWRfX5YSyIPRRYx4A
 rtgv8aeYfrszW7nQI/T05cW7JNZkSKPj/E1u2Kg3PwIKmEAsn6+l41srudi6iHwAPMLxQOY2d3T
 iPQTodE5+kxkwVZDeb2S6To85drAOkwhFBfX3S4AYEQfmjGdQA5gWTbT6Pu6nqI10+k+IJg1hcX
 iQdvMw33OI0bw5IQ99xFrgnF/0+wl/cbpxOKGL1yTkQGMwx6wy0AML7gQ7lgQecUAhvIVbmz5rE
 yLIlfQUbhoaU7Ny8vy3c1TBD7WsbTqVkcJbIkgSpO+ZHrT/dGrTL5KRJC0om1T0nzTviQ3xhRQS
 molc7sJRKBlDlN7XmOY9zVdIrfyYjMrq1+rgxJxHYTMwrkxwTADkASRKKhfS71U7+1oV5T8exx4
 jsij7rN4qDDIXub8FOPdERlDcH9cVxKKc1EZE+RzF+YwicS+9CXDGnfDujY3URyqmJ6osj+LHD7
 c8m8mmxZ7AGovaF9kXg==
X-Authority-Analysis: v=2.4 cv=MZn5KJ/f c=1 sm=1 tr=0 ts=6abd42c0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=zDguiNvBNssQI5srXMUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2OCBTYWx0ZWRfXzhyeVMe9j+0U
 Ww0dHmiLfymLGiP7F7l5lpMRywtf2BlAlMQc7g7nXYSdEz9FT33v4u1yb3nvcZeWUMMMAK3/CfZ
 GjADbUoeBPIQh3NY7JI5evcWeJg3HhI=
X-Proofpoint-ORIG-GUID: 764mdNscbzn-nug2x_n3Ax8wo-oKePCP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300068


On 9/1/2026 12:34 PM, Albert Esteve wrote:
> On Tue, Sep 1, 2026 at 12:54 AM Bjorn Andersson <andersson@kernel.org> wrote:
>> On Thu, Aug 20, 2026 at 01:34:18PM +0200, Albert Esteve wrote:
>>> From: Sudeepgoud Patil <quic_sudeepgo@quicinc.com>
>>>
>>> Add condition check to make sure that the end address
>>> of private entry does not go out of partition.
>>>
>>> Signed-off-by: Sarannya S <quic_sarannya@quicinc.com>
>>> Signed-off-by: Pranav Mahesh Phansalkar <quic_pphansal@quicinc.com>
>>> Signed-off-by: Sudeepgoud Patil <quic_sudeepgo@quicinc.com>
>>> Signed-off-by: Albert Esteve <aesteve@redhat.com>
>> I'm sorry, Albert. Sudeepgoud messed up the authorship vs signed-off-by
>> chain here. The author should be "Sarannya", as that's the first
>> signed-off-by.
>>
>> PS. It would also be nice if this was submitted with updated email
>> addresses and copyright statement. But I'd not expect you to fix that.
> Hi Bjorn,
>
> I'm happy to address these changes for V2. Do you know where to find
> the updated email addresses?
>
> BR,
> Albert.

Hi Albert,

Sorry for providing this info late. In case you post new series please use below ids-

Sarannya S <sarannya.s@oss.qualcomm.com>
Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>
Tony Truong <tony.truong@oss.qualcomm.com>
Sudeepgoud Patil <sudeep.patil@oss.qualcomm.com>

Regards,
Deepak

>
>> Regards,
>> Bjorn
>>
>>> ---
>>>   drivers/soc/qcom/smem.c | 105 +++++++++++++++++++++++++++++++++---------------
>>>   1 file changed, 72 insertions(+), 33 deletions(-)
>>>
>>> diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
>>> index afb21a778fe7b..194ffb2ac010f 100644
>>> --- a/drivers/soc/qcom/smem.c
>>> +++ b/drivers/soc/qcom/smem.c
>>> @@ -2,6 +2,7 @@
>>>   /*
>>>    * Copyright (c) 2015, Sony Mobile Communications AB.
>>>    * Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
>>> + * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>>    */
>>>
>>>   #include <linux/hwspinlock.h>
>>> @@ -85,6 +86,17 @@
>>>   /* Processor/host identifier for the global partition */
>>>   #define SMEM_GLOBAL_HOST     0xfffe
>>>
>>> +/* Entry range check
>>> + * ptr >= start : Checks if ptr is greater than the start of access region
>>> + * ptr + size >= ptr: Check for integer overflow (On 32bit system where ptr
>>> + * and size are 32bits, ptr + size can wrap around to be a small integer)
>>> + * ptr + size <= end: Checks if ptr+size is less than the end of access region
>>> + */
>>> +#define IN_PARTITION_RANGE(ptr, size, start, end)            \
>>> +     (((void *)(ptr) >= (void *)(start)) &&                  \
>>> +      (((void *)(ptr) + (size)) >= (void *)(ptr)) && \
>>> +      (((void *)(ptr) + (size)) <= (void *)(end)))
>>> +
>>>   /**
>>>     * struct smem_proc_comm - proc_comm communication struct (legacy)
>>>     * @command:        current command to be executed
>>> @@ -403,6 +415,7 @@ static int qcom_smem_alloc_private(struct qcom_smem *smem,
>>>                                   size_t size)
>>>   {
>>>        struct smem_private_entry *hdr, *end;
>>> +     struct smem_private_entry *next_hdr;
>>>        struct smem_partition_header *phdr;
>>>        size_t alloc_size;
>>>        void *cached;
>>> @@ -415,19 +428,25 @@ static int qcom_smem_alloc_private(struct qcom_smem *smem,
>>>        end = phdr_to_last_uncached_entry(phdr);
>>>        cached = phdr_to_last_cached_entry(phdr);
>>>
>>> -     if (WARN_ON((void *)end > p_end || cached > p_end))
>>> +     if (WARN_ON(!IN_PARTITION_RANGE(end, 0, phdr, cached) ||
>>> +                                             cached > p_end))
>>>                return -EINVAL;
>>>
>>> -     while (hdr < end) {
>>> +     while ((hdr < end) && ((hdr + 1) < end)) {
>>>                if (hdr->canary != SMEM_PRIVATE_CANARY)
>>>                        goto bad_canary;
>>>                if (le16_to_cpu(hdr->item) == item)
>>>                        return -EEXIST;
>>>
>>> -             hdr = uncached_entry_next(hdr);
>>> +             next_hdr = uncached_entry_next(hdr);
>>> +
>>> +             if (WARN_ON(next_hdr <= hdr))
>>> +                     return -EINVAL;
>>> +
>>> +             hdr = next_hdr;
>>>        }
>>>
>>> -     if (WARN_ON((void *)hdr > p_end))
>>> +     if (WARN_ON((void *)hdr > (void *)end))
>>>                return -EINVAL;
>>>
>>>        /* Check that we don't grow into the cached region */
>>> @@ -587,9 +606,11 @@ static void *qcom_smem_get_private(struct qcom_smem *smem,
>>>                                   unsigned item,
>>>                                   size_t *size)
>>>   {
>>> -     struct smem_private_entry *e, *end;
>>> +     struct smem_private_entry *e, *uncached_end, *cached_end;
>>> +     struct smem_private_entry *next_e;
>>>        struct smem_partition_header *phdr;
>>>        void *item_ptr, *p_end;
>>> +     size_t entry_size = 0;
>>>        u32 padding_data;
>>>        u32 e_size;
>>>
>>> @@ -597,67 +618,85 @@ static void *qcom_smem_get_private(struct qcom_smem *smem,
>>>        p_end = (void *)phdr + part->size;
>>>
>>>        e = phdr_to_first_uncached_entry(phdr);
>>> -     end = phdr_to_last_uncached_entry(phdr);
>>> +     uncached_end = phdr_to_last_uncached_entry(phdr);
>>> +     cached_end = phdr_to_last_cached_entry(phdr);
>>> +
>>> +     if (WARN_ON(!IN_PARTITION_RANGE(uncached_end, 0, phdr, cached_end)
>>> +                                     || (void *)cached_end > p_end))
>>> +             return ERR_PTR(-EINVAL);
>>>
>>> -     while (e < end) {
>>> +     while ((e < uncached_end) && ((e + 1) < uncached_end)) {
>>>                if (e->canary != SMEM_PRIVATE_CANARY)
>>>                        goto invalid_canary;
>>>
>>>                if (le16_to_cpu(e->item) == item) {
>>> -                     if (size != NULL) {
>>> -                             e_size = le32_to_cpu(e->size);
>>> -                             padding_data = le16_to_cpu(e->padding_data);
>>> +                     e_size = le32_to_cpu(e->size);
>>> +                     padding_data = le16_to_cpu(e->padding_data);
>>>
>>> -                             if (WARN_ON(e_size > part->size || padding_data > e_size))
>>> -                                     return ERR_PTR(-EINVAL);
>>> +                     if (e_size < part->size && padding_data < e_size)
>>> +                             entry_size = e_size - padding_data;
>>> +                     else
>>> +                             return ERR_PTR(-EINVAL);
>>>
>>> -                             *size = e_size - padding_data;
>>> -                     }
>>> +                     item_ptr =  uncached_entry_to_item(e);
>>>
>>> -                     item_ptr = uncached_entry_to_item(e);
>>> -                     if (WARN_ON(item_ptr > p_end))
>>> +                     if (WARN_ON(!IN_PARTITION_RANGE(item_ptr, entry_size, e, uncached_end)))
>>>                                return ERR_PTR(-EINVAL);
>>>
>>> +                     if (size != NULL)
>>> +                             *size = entry_size;
>>> +
>>>                        return item_ptr;
>>>                }
>>>
>>> -             e = uncached_entry_next(e);
>>> -     }
>>> +             next_e = uncached_entry_next(e);
>>> +             if (WARN_ON(next_e <= e))
>>> +                     return ERR_PTR(-EINVAL);
>>>
>>> -     if (WARN_ON((void *)e > p_end))
>>> +             e = next_e;
>>> +     }
>>> +     if (WARN_ON((void *)e > (void *)uncached_end))
>>>                return ERR_PTR(-EINVAL);
>>>
>>>        /* Item was not found in the uncached list, search the cached list */
>>>
>>> +     if (cached_end == p_end)
>>> +             return ERR_PTR(-ENOENT);
>>> +
>>>        e = phdr_to_first_cached_entry(phdr, part->cacheline);
>>> -     end = phdr_to_last_cached_entry(phdr);
>>>
>>> -     if (WARN_ON((void *)e < (void *)phdr || (void *)end > p_end))
>>> +     if (WARN_ON(!IN_PARTITION_RANGE(cached_end, 0, uncached_end, p_end) ||
>>> +                     !IN_PARTITION_RANGE(e, sizeof(*e), cached_end, p_end)))
>>>                return ERR_PTR(-EINVAL);
>>>
>>> -     while (e > end) {
>>> +     while (e > cached_end) {
>>>                if (e->canary != SMEM_PRIVATE_CANARY)
>>>                        goto invalid_canary;
>>>
>>>                if (le16_to_cpu(e->item) == item) {
>>> -                     if (size != NULL) {
>>> -                             e_size = le32_to_cpu(e->size);
>>> -                             padding_data = le16_to_cpu(e->padding_data);
>>> +                     e_size = le32_to_cpu(e->size);
>>> +                     padding_data = le16_to_cpu(e->padding_data);
>>>
>>> -                             if (WARN_ON(e_size > part->size || padding_data > e_size))
>>> -                                     return ERR_PTR(-EINVAL);
>>> -
>>> -                             *size = e_size - padding_data;
>>> -                     }
>>> +                     if (e_size < part->size && padding_data < e_size)
>>> +                             entry_size  = e_size - padding_data;
>>> +                     else
>>> +                             return ERR_PTR(-EINVAL);
>>>
>>> -                     item_ptr = cached_entry_to_item(e);
>>> -                     if (WARN_ON(item_ptr < (void *)phdr))
>>> +                     item_ptr =  cached_entry_to_item(e);
>>> +                     if (WARN_ON(!IN_PARTITION_RANGE(item_ptr, entry_size, cached_end, e)))
>>>                                return ERR_PTR(-EINVAL);
>>>
>>> +                     if (size != NULL)
>>> +                             *size = entry_size;
>>> +
>>>                        return item_ptr;
>>>                }
>>>
>>> -             e = cached_entry_next(e, part->cacheline);
>>> +             next_e = cached_entry_next(e, part->cacheline);
>>> +             if (WARN_ON(next_e >= e))
>>> +                     return ERR_PTR(-EINVAL);
>>> +
>>> +             e = next_e;
>>>        }
>>>
>>>        if (WARN_ON((void *)e < (void *)phdr))
>>>
>>> --
>>> 2.55.0
>>>

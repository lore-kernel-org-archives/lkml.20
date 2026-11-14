Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794673786;
	b=DoJhXYN2ebmY7t7YOLZWUL7x+Zjak8Ft/QBPlgcb3szuXuXZaG/Hcxom3NdQW8ujpmqY
	 ulyj/XCArZD0fLP2pbIA1A2Ue7B9vfPnZ/CdB3gSPcUY9d4of1nKYC7n2rZCPI4Bgcdrf
	 gtZ19CpsWbqZbXO1y3TuA7EdIg3p/Yn322aci1HdjYZ/+Ts5M2YxV8iEft993hDk+hb6w
	 CKlPqgaYzi/lLmSmBX5PBMDNkKcdYwSaqXdG782Kw3xOuGmYHMCBWUioSwkmAvo4/QVZW
	 XYMOvWoy7OkoIGwGz9ddbnOiVIlVIFJMJzKw2fR0XLjGwFM6HlocR30sIFZEBtCF3/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794673786;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FI3y6/i/Rf//ALQS2LeyJfxMmqwcXIT9KAD4tIV72aA=;
	b=4/u0hTFrN01bfWszfcGA9aJbOCpw6y5Ih30bWHK/XXiFBEwRmsMpAKBAW++gY8iMpmUT
	 D9AibXVKOIGovKgZXMc9xQQtHFUtLBDZwA2rMOlYFZ5AVApvZjMLiZA3JYUK6iRbtzOXx
	 n5/JuVAXWPXqzD22/QYFZqZBWaUdci4Vq6WxemVDC4M7KBiN/f/yVY+3JvvME2do9Vf9D
	 OJLGYNttQpsgMUYsFUsYQFoox57LMHwja64CMM+malfhuKhoux/3CfFSt2Mi+HKKawuhe
	 lBN98Ghk4o94bc8Z2Me1q64Mwdf5EPEtaSL0CgnSPxBrRHPFoGvqV48Q++M77NkSIxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PPw+1viQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EpmVBgs7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA502606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:29:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA502606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PPw+1viQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EpmVBgs7
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AEDlSkF4185378
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:29:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FI3y6/i/Rf//ALQS2LeyJfxMmqwcXIT9KAD4tIV72aA=; b=PPw+1viQR6AQA+pi
	JW1HaAOSFgshLC2LO93ZT202AFvpFbw0+O+WOozj1IslCzC0ndhZl4DJpZiPTgcp
	pl8cyUv2E5crUfftpY3z/dVTuXXVA9sgjy53RNsxdH2Xs7V1NoZX3Io4TnOWALgF
	cn+vgHWmyXjdMzODe0zJOEVzY/K3lm/eK7N5x/acl0Qo6QfEMCBoZ3Kw+8f8Dcli
	T/0MrDo6waXv7xmrjhqquFGwQNBwSdT1+t9Z28ZXy0IL1v655wKXf2vIin9K7hGq
	iZaHUBFleYDmf9rRnzmz5BHYukyaZeleCQQlZhXLX11byoBSOPZBcbcsLHFHsrXW
	b7mP1w==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhk217bs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:29:44 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-37549877380so2632058eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794673784; x=1795278584; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FI3y6/i/Rf//ALQS2LeyJfxMmqwcXIT9KAD4tIV72aA=;
        b=EpmVBgs7nGJxg32EzU8v2RMfydWkAxMJrEtAE2e/qZRLYiNOXyEMavuXxOAWAmv3Pc
         +uF9+WL/diQ4bvpI1vL/r1kB/PcBIP+oAtrdGpoLlUogAHgNEatpvFHqSmSSEXHC/4zl
         QHcIyJWL8y1jeJhmHkMwTeMebXXAQ0O9cmaMzVXoNGByqByab0xjfaSBD2tUDq7ZyPs/
         xsxx0onbypglOCxRmqCgMk4hKgC3DXK240oKtbdU7HnlPfEQ/91pmjPUbSeUrd83k/PV
         xm6SSWfMfs7Bh1IVNL9sdUJ+AnVaLRBuUZLh12XtdwRMYlohR9hQYtm4pzUmrfQdNxbo
         yNrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794673784; x=1795278584;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FI3y6/i/Rf//ALQS2LeyJfxMmqwcXIT9KAD4tIV72aA=;
        b=vHpd2eD2XXtDXSKzHinWfGTkKdcC9MgWbSu5ew3nkpU1kgahT1qd7LZC2XvKlN7a0u
         2rFlkJQq16e3dmy2AKkAf4WJHzl5/kPHG3v2RKFD5Hd8D/JBMYdeVUer9lGZvNcWcdQv
         DvVtFbUJmVAm3y1OfhIxxBW2cw10UT7koSrDOoNVe4zH8ZGzfkfLw4A90ACZonOI/eGc
         hpQeQ1k6rVCjxI3X5UWfiKGvXOTnaJaO7eLrAcZ6181zFt4B8pJlWPZKRAJdD9bhqGj+
         Rk+dkvOYzhWSp0S/5unpL7Q4LIwA9Z1mz8ICcHkuYxJJtCK6Vqi+VOxodg7PEQ+L9Tz6
         24/g==
X-Forwarded-Encrypted: i=1; AL+hErHTVHJVVHD6ctyPeNNltB+7zWpzoV4lt7H5ulqUUA8ZDlUzgK9NvuuZ2i6Lne6Xc53GkPgBA5TJ5hGW/Qg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8A86Y/nQFia+PIeeBVWTIrN7cmOilCrh/Ck+GGZa4ljLb0LucD
	0m6VKZyPKKLWX5/xfd1azZ177rHhh63fBTtNBLmLmvD+CjOi1tQZvUuoA04q6cB4GqDad0dApnG
	mczzVBUyrgRTyAbwiIVqxYNeXy0qlIRSc6K1v7Uw1uuEHI18QzZoSXo87RmcorJH8cZY=
X-Gm-Gg: AYBFou09ttHlGOJeMkiQFnMWrc9iGTmOdQk0jcByz4LrR2FW9ypT91PNlWiKXtAImll
	1Vuqyq1fh7L6sHbOt8XyKbh3cWloIPftxtrrzVa2wJXRvxZuVfCpWR8Bb5uiXV4ataBrMAB5F0l
	l2L9MfeQIcIF5DDz+ET8XQ19rP7ftRTfqxY6P4vpe6uCrM/S5pPmK7T6QwkRe06eyDlEzhxtnN5
	P7ca8thjrWCrz2FKT4o4ahYAMprU2Oc+RyCpS1JNIj+CFlxgYxyJxzK7ERRyfMhcyZKmQvbXa6m
	xJYxyPXfLZtLGtHqlW/PbUaPZUA9tgBd+Mwb+oIoWtGtZNSZZ0eY2imB07oSCKf6cFieUnyMPtB
	rRpXDm/kWoNs0jWKuDkKnYZ67SKOTbc/S1CcpZLuNheuaQDZKRz1m58zh2cx47C/vA24gLvichb
	d37AhciVjaU/ePCP0qSyslwZ/rwVX/
X-Received: by 2002:a05:693c:8107:b0:36c:b7b4:407e with SMTP id 5a478bee46e88-37967cdd709mr6250756eec.22.1794673783379;
        Sat, 14 Nov 2026 08:29:43 -0800 (PST)
X-Received: by 2002:a05:693c:8107:b0:36c:b7b4:407e with SMTP id 5a478bee46e88-37967cdd709mr6250702eec.22.1794673782537;
        Sat, 14 Nov 2026 08:29:42 -0800 (PST)
Received: from [192.168.1.20] (39.sub-97-215-59.myvzw.com. [97.215.59.39])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f02ff0sm17265093eec.16.2026.11.14.08.29.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 08:29:41 -0800 (PST)
Message-ID: <9e14a92b-019d-4db7-862a-ce5a414d5c28@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 08:29:40 -0800
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
Subject: Re: [PATCH v2] wifi: ath10k: Stop unanswered temperature reads
To: Jeff Johnson <jjohnson@kernel.org>, Filippo Falezza <effeffe99@gmail.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261027-ath10k-temperature-v2-1-0793e80d73bc@gmail.com>
 <179331456469.1083805.7983060076518551936.b4-ty@b4>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <179331456469.1083805.7983060076518551936.b4-ty@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mPB5Ao3yHD9enp_lHiiQlqLx1KIYWv5m
X-Authority-Analysis: v=2.4 cv=QanzLcbv c=1 sm=1 tr=0 ts=6af88c78 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=7UwXyAtrHAWG9Tdc5CO1EQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=DzVTQg4m434XtEhf8sYA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA2NSBTYWx0ZWRfXxCU+Y0+cnjj0
 SBktFus0WShmihqw42EobMcaRWpqmrlMdjt4BjbU41s3pbJAn4gdaEztZw5dk3ejoUBikcBHX6K
 8aEtSV5gA7iK447y3rhUQ4oAgVHJeoTelm7tMPFIc6unH9qffrPOPFiLPXwHk57iL2qJWQm3Snz
 OZCh8zYWxVXjkXjn1RW19InWol9pv/oGPzZOXJP1Ga8CqUl2uzqviVA9/nSXu2diLynl1zo30Fi
 XJUbPU9DgXcbDwvk9A4gBFyKxGp9KaFDIko7XCTt7LDhsTA+TgFG2XmRUq/g3Zg093a5hF+XR0O
 ugIQ5QgFDtAbWdCgHPNK6k0e8ZHDE7n18CMDPqk5b9QYKnU/Y6FJVTa04jqEnoA45sLnAn7mFKp
 Y0QNGNhsQhB+EqCAv0D34a+aAERYB7Gzc0q1XC/WlkpAB0hA/148gkJqFldt+V4EeTuEJmTsx2M
 Hby+dTz3B6PUk0UPvRw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA2NSBTYWx0ZWRfX3LDIAfYCPZrm
 DYN1wrUKDin7FPRWhNR63bvZNDfW5xA5dzEIOXjljO2sDVgh7HScS6b9h93T3wWFEqBAsOkAL80
 Za2XmTJv+pmhNFn6OvUWpqu8BnWuh7U=
X-Proofpoint-GUID: mPB5Ao3yHD9enp_lHiiQlqLx1KIYWv5m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140065

On 10/29/2026 3:56 PM, Jeff Johnson wrote:
> 
> On Tue, 27 Oct 2026 01:56:20 +0000, Filippo Falezza wrote:
>> Reading the ath10k hwmon temperature sends WMI_PDEV_GET_TEMPERATURE and
>> waits up to 5 s (ATH10K_THERMAL_SYNC_TIMEOUT_HZ) for the reply event,
>> holding conf_mutex. Not all firmware answers: the WCN3990 firmware
>> WLAN.HL.3.3.1-00694-QCAHLSWMTPLZ-1 on a Motorola Moto G 5G Plus
>> codename nairo (SM7250) never sends the event, so every read of
>> temp1_input stalls for 5 s, logs
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/1] wifi: ath10k: Stop unanswered temperature reads
>       commit: 2a87e367c62856b87a90f745c6b7d2eb91e0c51f
> 
> Best regards,

Based upon Nicolas' message I've reverted this.

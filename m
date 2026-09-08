Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9142348F02C
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 22:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788906484; cv=none; b=VV9uZXTV4ZpvGmgil8NjU/vWox4474IGRx30MshI4VJVFSqgOs1FBpn7sIU1un/uCkhMPyNl/GdViBcjvnWUww1NvpHb6/LbM577K5rEJxdfXaejRBpZOGg25fOvYAKac8QxQjfRbRgKaJBZcJVcvce84chkPaFhgq6TnVKBZmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788906484; c=relaxed/simple;
	bh=HLg2lbwzzOHSgGaPYCDHwz+1Rk8J0DfUcGDqN5rbGTU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pvjHXwlgDC2Cui4xeCbN2LFdNbIJrwfH2Bv5IMTd4CNodXtVXU9XoDjA/6GOfaSoNTmHdxJ9sM2TIkI4RJscIwweUev4/lb7fLH6XDQ2gadXH79Qhxq3RGM6DU5X5aFpX2+q05y2xoc8fCI5vFToXCEkshNw3j5URkBYjWhK44k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=sX5hDkhc; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=kHPwsSCz; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="sX5hDkhc";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="kHPwsSCz"
Received: from pps.filterd (m0167071.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688KuqGg3387628
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 18:28:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=gFr6
	eyiExask1WnyL3Xet2TTasaMGO96hT07htdHUvk=; b=sX5hDkhcFsTxLOeTnfYT
	j0hOnzZkR4O7OLBwWeGcldsLDcMx1hXU0ORQdV6HzKeUxRaJHWNeBSS4mSsnyQv/
	JR0EuVCscHJ1b7CsS+I3O21eOrndYjSH0ujobOjva44pQqmA9rZCo5bQd++0VgV1
	k1BbSYpz3rrZPlgeY32obMyVOa4SYnBLi+M/Ql+/dmakFHUmia949tHzwrzrYyEh
	5+wy/3tBrJ0oUsfJdZYubmrErNNr1LYaVaF88SGyhnEhwBPmUM5X+KJSXR8mXU59
	V/x4YWnGkmjjlTnc0zl0FvzFyfDootCAkzjRZ39zC/PoV5MY3eOQDho8ir0TjP1s
	Sw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gjnk0bpv4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 18:28:00 -0400 (EDT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e820609d9so824448585a.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 15:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788906479; x=1789511279; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gFr6eyiExask1WnyL3Xet2TTasaMGO96hT07htdHUvk=;
        b=kHPwsSCzqrtv+mJF/g1sfTVUlzP/kRoUWynXUypMWsQGkS89q0tzdC5iOJikvmr7DV
         8RG3RacJ2by6uFEQQTs/b2wV2wJUZgpFjpEPFq8poTL3DPYF6f/yfkF/vLPOef0UjXZU
         vAs5DS9NMYzWOM1QzoXDGQE7aFTISEvdK2LPTQNHVG76347hVSNs9DfRaTE6n5lL25uG
         PXXMC++5MPl2PS+nYBjYIK1Urk0OoYXGYI8JSusI9rTMYKz2cGAxdIQZFSQ4XP21dHBT
         c6sOa1+mseHLPlQK/49KXI03OZb85bbBJg1AtCB4ZiczAj+TG1SeBGny4kPpY8Rga8FT
         kMAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788906479; x=1789511279;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gFr6eyiExask1WnyL3Xet2TTasaMGO96hT07htdHUvk=;
        b=MWn8b9di2mj+tfz3A/+QSpMzLjmuKtxIALq0pGt9lQ7ObQ78IuM3STg5/dQNY443/E
         cwl8EQZKEeeuXN20D3M+wY4JiRjQI2UDYgbFHTX66jRdSWdeVoGXRj2wEmrRZNl73m58
         vNoajpV0nOZLHaoWx0uksM4fVsmtP6lCdo2GpbFzxElTRw2/Lz5/cizXrOGhVDdwVRuq
         KxgbO0b8Ey+ZXKdjSv2N/GKWh4Y5PqrAXTLS9XbRyu1IXG6IHZszgojKIEBDZuV8HK7U
         k4oxJ0uFJR/FrhUWbR9GDzWnwQK3pQbHULTQYrTQ+kd0vx3pcurxn3Qo/prR7wcrrWar
         MIxg==
X-Forwarded-Encrypted: i=1; AKwUvBwMZ1XLMJTU0Xw48Lbod7el6YmNpsxOm7Uq2JgoHTvxj10g5HGyp2X762QGvEBjMz6nngj2N1q+aNF2EII=@vger.kernel.org
X-Gm-Message-State: AFuF++l+rMdVG9UYuplnpMOVrJQewcXBG5rE+D83Wju/xs33KsIuARbc
	UW5XhmD7ddlIowqA6obJfOPfxmmVdzaPBcFdzHQsGXXlANKhC+0GTrtHsGMWW6kXvq+SRpknxgK
	6VzIgYe7vrtJEkgKFelEEiVjq6ixdMP10+3f+QDwDRTSGHWzaEDS1niHhsrCpqg==
X-Gm-Gg: AYBFou1vs+1qrxDzly6F9QVpiULujBrDdI1KHA+XItQ+DyEwu/RP4Pi+dz5/ns4/fjs
	bDmz1GPCaKYPRbZSGfFe8F2c8Pi/bBracqDW7uEJmO/jO7FEDSEvVN2om1AZV0HqEYmwC2Zxq2P
	sSHuNJsFGA2VmfnFCUjdpgc8bBZz9wPjJt4gQZxCmr9nmyQMxpioJXug/FE3Kdamu3yHuFtUW0p
	KGejnUTsfD0sJNirnYi4U4yByaFl91Vs6QJj4QoA2BmBrxXDTX33tJDN0ZDlABt6X2MDkeiFtjy
	Hb3IoCPnSB/4KP0EL3JuTeM6fSJDK6EXvid9msK7Di+vl+3dww/Tci6XN+hF2AjJOL7WuWbv2DV
	VbkwHCyK32S+kW7CVUb043JmpdsqYHDTL5DPGbIn0iyLxtExbV/0M
X-Received: by 2002:a05:620a:4553:b0:939:c898:ce3f with SMTP id af79cd13be357-939c898d8a5mr433433085a.14.1788906479348;
        Tue, 08 Sep 2026 15:27:59 -0700 (PDT)
X-Received: by 2002:a05:620a:4553:b0:939:c898:ce3f with SMTP id af79cd13be357-939c898d8a5mr433428285a.14.1788906478899;
        Tue, 08 Sep 2026 15:27:58 -0700 (PDT)
Received: from [10.207.49.22] (nat-128-59-177-174.net.columbia.edu. [128.59.177.174])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939b554f1d2sm442937585a.21.2026.09.08.15.27.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 15:27:58 -0700 (PDT)
Message-ID: <47b274e3-0d62-4b13-871f-8e34141da2a9@columbia.edu>
Date: Tue, 8 Sep 2026 18:27:57 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/15] btrfs: remove the free space inode ordered extent
 special cases
To: dsterba@suse.cz
Cc: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
        Qu Wenruo <wqu@suse.com>, linux-btrfs@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260907-btrfs-remove-v1-space-cache-v1-0-5f9a5ba352a7@columbia.edu>
 <20260907-btrfs-remove-v1-space-cache-v1-12-5f9a5ba352a7@columbia.edu>
 <20260908154231.GE9053@twin.jikos.cz>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <20260908154231.GE9053@twin.jikos.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDI0NiBTYWx0ZWRfXwU6RFbh7V046
 KJCBlIujjxDdbSaqdvvlQo3NeItIVGWzUaa1WxyDIzzsjjXTX4YYvWM7U4/v7eHfron4egAlKsn
 L3QFVLz7iIK+brx+nJoUmtLMPd7aWm/5TD1Ey1M/DoS/SDy94MGT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDI0NiBTYWx0ZWRfXzo0NGPG6W7H2
 +bF/oaB66egrqNyPMid3lraPxu7Zs/0xJ631UK/OAiwNNiI4dwfkT39PaKkEgoESPi5k6fL/1hq
 VB4c6ZdmcTxnXRJ5eMrhaNn9VFDO77VUM1ky+2MV1uYPyOOKP7OsIfWWv8rBX8GIgOe5BGJK2tO
 s7AQf/SxR4tFU78b1bwHDq6WiH9OutpoI9+CSI9LThjaVhklKF7uHS1dD64NLxEyB5M9T9a8STz
 c0BwYVUe89LJ9WacWpRfxWyTMcTfyQohkwIKd5TwdfpV/9zuoSH69CJX/LcxBKHbp8guICTA1od
 I+/NdAilgKVPEhwum6tMp7reEjE9WZsIpTQvJOlsr8s2f3YRG2d19Jhxmx4Yimj7Eab/EQnHPEP
 nf2ddCe8Wii3qhTFRPEQxlNDglthq/+6H9UMKwjSU0hVLx5CPLV0VJPQM2KtuzfiHtYZv1sn9vi
 Axg5s3poAsrS75vtQGA==
X-Proofpoint-GUID: -q8yRiPCKl0v3UzXsQ9ifwv7EJpHVISx
X-Authority-Analysis: v=2.4 cv=Z+fc2nRA c=1 sm=1 tr=0 ts=6aa08bf0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=HBUb3goEnnz3w2smY6d+Hw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=79PYxaXUQd1wl-QFWJnA:22
 a=J6ZNMGKFVfwIeeHgaGAA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: -q8yRiPCKl0v3UzXsQ9ifwv7EJpHVISx
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11900
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 bulkscore=10 impostorscore=10
 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=10
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080246

On 9/8/26 6:42 PM, David Sterba wrote:
> On Mon, Sep 07, 2026 at 09:19:27PM -0400, Tal Zussman wrote:
>> --- a/fs/btrfs/transaction.c
>> +++ b/fs/btrfs/transaction.c
>> @@ -125,17 +125,14 @@ static const unsigned int btrfs_blocked_trans_types[TRANS_STATE_MAX] = {
>>  	[TRANS_STATE_UNBLOCKED]		= (__TRANS_START |
>>  					   __TRANS_ATTACH |
>>  					   __TRANS_JOIN |
>> -					   __TRANS_JOIN_NOLOCK |
>>  					   __TRANS_JOIN_NOSTART),
>>  	[TRANS_STATE_SUPER_COMMITTED]	= (__TRANS_START |
>>  					   __TRANS_ATTACH |
>>  					   __TRANS_JOIN |
>> -					   __TRANS_JOIN_NOLOCK |
>>  					   __TRANS_JOIN_NOSTART),
>>  	[TRANS_STATE_COMPLETED]		= (__TRANS_START |
>>  					   __TRANS_ATTACH |
>>  					   __TRANS_JOIN |
>> -					   __TRANS_JOIN_NOLOCK |
>>  					   __TRANS_JOIN_NOSTART),
>>  };
> 
> This touches the transaction engine, there was exception for the space
> cache, I'm not sure if we want to remove it completely. At least it
> would be good to separate the space cache usage and the the API in case
> we'd want to restore it some day.
> 

Sure, I can split out the transaction changes from the rest of this patch
for v2. I'll move the transaction changes to the end of the series so we
can easily drop them if necessary.

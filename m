Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794526125;
	b=TaqF2W5UouhTRu/CwsyRNgs+mkkWSy8Dc4Yb5WuKtAWytnUjCpcBK2Z2cNxNJjWqHrVc
	 dh2pPdsZvn3EYoCYsLUpIShDxPHS9MNeeg/IfBSUVhBf6Y2qmjJ6IbxJfn8tXwD2hh+Nn
	 tzcS2D2poKKn18yDe249bvOLTrH0JvMMubUM8U9u7IN22C+4DAGAz8Lh0Bv3DJMWErsuq
	 JKVDcXZHCahvuSyOFr1zMfbW0YppkzHmgFFtb2bbzISYe/bGQ3KbZjkh2GC0hWrrvCPGB
	 RlQDfY0adhcFsYca9J3wr/jWERjcpnJVr3PpwOXpcQhdxLEKoOismx4PxfBEr2q1+7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794526125;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=j+2MQFCjJLlFkCf/4Ra1E51lD7PDuO5cvPRTDHXzpTk=;
	b=GAgSwEYYgg0D9E/JRGvnBLVvNRCXjEJBF09IQ9NoKS3h5dxH18nJmVwBbpXRB9l1IETN
	 3sHHmHeBhxBm/xggF6JahcSnlrrnbYCDAWBYqh5ucIaZFr2MbM3Ye/Sbqjscb5MyZ/gXW
	 5PuipEZH/IWjVn8IYYpn5eyWDQHBwwJUORYvFXLjHVsW7SaFxf48M+siQ5csgHoL3ONc/
	 bBoYjv5n5V1z7W0wNkfnYcPwHETuKO1t/VEr5n8w5gGffiwWRy/FbR4gmC+Xx2blAMqd4
	 OVHOEhcUeK1JSZGEsKhO+lt1pNcIVrK92nSETeV2xvrgtAQr1yPnro9IeVCEVYX8WmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FMp0sQ8K;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=uEjZzY4D;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04326606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 23:28:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04326606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FMp0sQ8K;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=uEjZzY4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794526123;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j+2MQFCjJLlFkCf/4Ra1E51lD7PDuO5cvPRTDHXzpTk=;
	b=FMp0sQ8KEXhwjo9VllqLor1Lr/Z9gOUWvYm5ZgIjLRexRlwHoG2v+t6UyW84T9rUxHbAyz
	wYxDESng+Ffd+ohw2CtzRIlOTZjq2z5FdPMWViJBBVTi9y1Z3fmd4XnLkAEuky/2TxlHHG
	fShb2o6Eo3L7r18bJC2ApVD3+UJ3kjw=
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com
 [74.125.82.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-84-Z14PS5y-NVa_bWFFS-XNWw-1; Thu, 12 Nov 2026 18:28:42 -0500
X-MC-Unique: Z14PS5y-NVa_bWFFS-XNWw-1
X-Mimecast-MFC-AGG-ID: Z14PS5y-NVa_bWFFS-XNWw_1794526121
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-14373747468so263912c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794526121; x=1795130921; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j+2MQFCjJLlFkCf/4Ra1E51lD7PDuO5cvPRTDHXzpTk=;
        b=uEjZzY4DwyjAX8qvgkyXQ00ctXaW5Qmb5GH4zi7g/rPVIOgeTD5scMUHFIvTksTWrD
         Hf2D6+VkxdA+qVn+LdIfWQ2ddCjCMGOl4hvdGJYTNNI8NtK8RJV/rxOsMEMkDRezdmLg
         LvO8VapsUdu8FRcc3HY1nF5acViybsv4WH+837E+7l0JCqEHEMNkkvnKkFv6V/neP3iO
         mWBpYrkTW6AaBk8iRKkmtqrxYhb/sktEkgga6CSx7BUq3yuVyaIkJniddMnnPLZ+v3vT
         LPVHudjf2aitY28bi8DcfjeVMAbEv1SuRuEI35IQFZ14AfBfjYANETrBIhcHlUbtvUgp
         EgPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794526121; x=1795130921;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j+2MQFCjJLlFkCf/4Ra1E51lD7PDuO5cvPRTDHXzpTk=;
        b=PCOoLE3MVLMyTp1NWNT+TwySKkOYEzy8dehCFIP6x0V8ID3grPTXzcKl41BE5qccEw
         2OvV6RNrOOTYm3wtjNB9W3ixv9Ctb0Dfsk85vOax0uOWY68elbnbgAheQ5mE6e4l0+B+
         TKWi2WjMykyWFKjyhVkmdALAzRY2fZO7avME46886R5Z1Q6G9PgZb/maKV66IDvpDQf4
         J2V0bg/YCy4KXtGhezHux9oA0KlZeTLK5SF0Gy5jqTApfR6oCphT8RKkdKpsKXVjmw79
         1x1XyGnrTkqzM7enk5Y5NfHjw8XAdTcO15DEzQfD+NnVSU2PDnvOki+SBMOuteyAwBa3
         tnsA==
X-Forwarded-Encrypted: i=1; AL+hErEOsViKDeLx6PRlZpaOjkJkLWaoRjs66cqpnQhCgEhATij1CJNv06dSftCtEL17NXs2/+O3YTR+a1gQ8Vw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/os25spsPttRmyBAnpNwqA621V6vgAOEBkSevBmKIE2y5gfH7
	xQzueh7yeVq+ODmnQwCojDeSbLJprS1bQAPnmEBkkNmSOXi0Wx7FZbVVhRzHuLMKJAXLqqYhzS/
	VTOxOLPmkj+zzoZflXXFJIMm8apHdv/mVWXZJpLoXvSJOh4M/rbhh4KwOiD+LQGN2XA==
X-Gm-Gg: AYBFou2GfOwGfkwPumkapDkdC+aPnolhOLPE6+aMiQX93TFmnyAtf8lHqcFPTdWvLGY
	XnmwTBhoun8LsmyU+oar9wLFlDgXX2YJ6D6N0IRV2OG7FTXwjtnGiI40Yz+ZylvI74iGwWrbSRm
	qxiZe1FFxpRcAA+5mvN5av+QnIswrBoywLR+PR7v9R8S7Ye2f30TmAjexdaVG6JQJtJFVoXF0fd
	h2yvn7gneEq5lf2JxjxND8qUnHBDO+nQ2WDdy1o/0Qpe2a8arjaUYLf2iSNLFcJGOGqMIxAU+RQ
	VSHJy6aHVy17xjqV1/UC0aBkYfZaOjk7PivnfGaovTBW7Qg92sC3AyNuDJhYwLaUrV/NaN0RLpZ
	t2DQj+PXl5ZLbp1qmkSbJqwUxgcTdiKGVzmy8f2A9Te45LwuQwGtu9qYRbcT6/ZwgyXkE4bYT8y
	hV0G4fn+vba5HZdh8=
X-Received: by 2002:a05:7022:3b87:b0:1b2:43cc:48 with SMTP id a92af1059eb24-1b5030d2bf7mr881058c88.33.1794526120697;
        Thu, 12 Nov 2026 15:28:40 -0800 (PST)
X-Received: by 2002:a05:7022:3b87:b0:1b2:43cc:48 with SMTP id a92af1059eb24-1b5030d2bf7mr881032c88.33.1794526120149;
        Thu, 12 Nov 2026 15:28:40 -0800 (PST)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b503191a43sm1796185c88.10.2026.11.12.15.28.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 15:28:39 -0800 (PST)
Message-ID: <8804ae3a-8dac-4f4a-98b5-06b2a7524d12@redhat.com>
Date: Fri, 13 Nov 2026 09:28:34 +1000
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
Subject: Re: [PATCH v4 1/3] arm_mpam: resctrl: Leave CDP off when there are
 too few PARTIDs
To: Jinjie Ruan <ruanjinjie@huawei.com>, james.morse@arm.com,
 ben.horgan@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 zengheng4@huawei.com, tan.shaopeng@jp.fujitsu.com, jic23@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261111081316.3828283-1-ruanjinjie@huawei.com>
 <20261111081316.3828283-2-ruanjinjie@huawei.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261111081316.3828283-2-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/26 6:13 PM, Jinjie Ruan wrote:
> Enabling CDP requires at least 2 PARTIDs. If there are too few PARTIDs,
> resctrl_arch_set_cdp_enabled() returns -EINVAL, but only after it has
> recorded CDP as enabled, halved the monitor count and turned off the
> mbw_max MBA control. resctrl then believes CDP is off, which leaves the
> two sides out of step and the halved monitor count and the missing MBA
> control are not undone.
> 
> Check the PARTID limit before anything is changed so a failed enable has
> no effect.
> 
> Fixes: 6789fb99282c ("arm_mpam: resctrl: Add CDP emulation")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: <stable@vger.kernel.org> # 7.1+
> ---
>   drivers/resctrl/mpam_resctrl.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794527203;
	b=lBJQYsTjnvCrjlM4URymYwEfEK6zXttmsKUfWmj+O8nwTGMuyzQtXZdhV/UIyCFGdnkY
	 aTfHVYPLJYyoOyGFUvYInSMDTqX5lQ8LAOo+QqzVkzxbosn3cFUcRkGjNOsbPsYwrvL8+
	 xDHf728mfzzp71z2HS2Tnk6fOTHLMDlQLyI/LnqGANMk0gVIpeWIRNOn4lLW0lQpO2pkH
	 GDPRILZ67Gh4AvrfinzCmX2dtJ58jyGfaSQC6BV21li9c+dQs46mD4FB5X1gxtpx6aOEA
	 oqY6H1qkrMT8RRiGsIpP+i1N93alSJ1Ukv/lOWlcgRQbLEYjWNtcLVvnAQHqMR2I89A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794527203;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Fp4tdSd/mDb/LWGtHZMVb3duVaZTa+5YiNZw4U0pJl0=;
	b=3+cI0MgEPOjVpbJX8m4aJNZgz2DjemuvSa/cx9sJvqHxbMdKclWvlfD2RFV8gSTRhKOi
	 W/bx9nDjS08Nao3ZPlqiftl+4Ed/LOhK+Glawx9A6D4guOIgEb/nJQ4kTQfUE79trMyra
	 dTTqdmxnc+hWE+UjRuMWiyoK9JHLSZgyPMTyYigh5LHXKkybz3PrtUXG2NQZcjcZAtz/A
	 NjthmBQhHLXe4+Zd/G5MfG71psTzI8To08KGJENY8Oydm8TfbD2KhiAUu5euyjj2S+zUX
	 XmW2VIk5o9JfHIXyYRePEZ/wg0952zVv7xnxC9ME0P7J1Ae1cFXGX8er2QnuH6iQudA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aMVly8mi;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Ex3i1bEQ;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF919606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 23:46:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF919606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aMVly8mi;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Ex3i1bEQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794527201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fp4tdSd/mDb/LWGtHZMVb3duVaZTa+5YiNZw4U0pJl0=;
	b=aMVly8miUlDwqUMW2u4JYjawtZiSW0GThkGdwrg/xp1NAJzrZEwjZCCp6Xz/23vhs3Ln7F
	EHwMgBhP5wlEUSHXr0dHbkGE8+z4vtU/FAcF9XN6xslOLF0f77ubE/myJhdOtTyCInhjDu
	j0fEg0ueYmdvWVLlrspgabEIDWNbXic=
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-498-1ZKoqAsmOjC4JbYqtgA28Q-1; Thu, 12 Nov 2026 18:46:40 -0500
X-MC-Unique: 1ZKoqAsmOjC4JbYqtgA28Q-1
X-Mimecast-MFC-AGG-ID: 1ZKoqAsmOjC4JbYqtgA28Q_1794527199
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so601536eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794527199; x=1795131999; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fp4tdSd/mDb/LWGtHZMVb3duVaZTa+5YiNZw4U0pJl0=;
        b=Ex3i1bEQ9mxj0br2J/t5iZiQWOf8LWq7Ado3UzttOS/rqZrPESfVqA6kADsW5fUPXU
         ebEHpf3XZVR9+J1sOTutCEQHpk0errp0ga75oONwWvmAC0lkZDQQigDOHCMo7HqQ1cnf
         fdm2Y1NmgmE51sq1jcddGwo0hSlC/+NnFcPwPTLdQKsv+OufZ/yumF9VBqgASwOHlmdV
         iwf6n8Ovxowr8kXPvfvIijmaQHEcqO5ny18KWDcpAlG2dIpIJErrMyYkEV/q4bwkoOb6
         W2Rnw+dHtObZOuKlFYkYdOe1//sfa9PeHG2K54N2RG0VO8WvvladT059r+mSDTv41mjr
         +gJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794527199; x=1795131999;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fp4tdSd/mDb/LWGtHZMVb3duVaZTa+5YiNZw4U0pJl0=;
        b=gDvOXrFHgK2uK8wdWyQHy6vmDRouatuBMwGQPOQIp8WQo0doFxDn+KSZ/E0T2uPaLw
         K2nSe0xqy22MSuduClUhCryTYTpfVy3FfX5o4QNPDSzGMIUKDBFe9nsOMMgrfQYa9O8A
         trpn5jlG5pMPCmOjiJDjxI1ljddgj/Iy4wJxF+OW+kIDta2Wra/uJ6loBmIMxh2FdUH5
         ATIsSiaqS5j2lIhqMx/n5ck4ABr102KR5QGs3zroKXX4u6fKPWk83gJpnTXC8h3mmI2i
         +7P7XbGGIet/yPgMtMFEG3OcMDcATV5d4P32b3niXg/y9yHtILZ7WEof/RJhHzUYgrMd
         m18w==
X-Forwarded-Encrypted: i=1; AL+hErGG30mJPjtnTkN8z+XPjVJHz+7p6ZgHEDj1QVxcmI14MtpHxz4ZakLybhNcD1LWKvRVKZn9zQeojs3bb+o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6elWtbW0SlbjF+C5GE1sJ94J8Fc/2MRz686u8i3iXCBO5GrO6
	Hv8bkYEaGjm1iqaiAznUWx2806mPZyRXYyBlyHzEvg0/A0wYpgcIvP5MhxohvWNbLUKaiWDzN3z
	q3e7ilEkHvHeUtNt5syWaGSK7QT/wQFFIJdLPAQoRTAtyoXtsF2himXR/wNBt3Xh7WQ==
X-Gm-Gg: AYBFou16G5Q37Ew2r41VKAgjuHeTBW1foMljWkSn4+kHJUMrdbyKoJYDIOqVmvy9X40
	PBUipmvFVSR7Hd+k6UsnodJLq007B2hwHqRE8K9tck+Enc9A7hc506S8ZxYI1FjepLgjfX8Uou+
	GHdeYdSvitJwFJyM+zcvqDL68kEl2A2ez3jFEW2kpo8tpQY1ALce3kBRsNuShbNMlDuquFJVsne
	qBKWkW7ruL6jNT7DhOp1Pqo7X9DV/J0qZQti8xAlid9m8lCspPme4Gv3n16esT6Yr5CmXepknff
	kBsLerhx8yzuKnaKcpNHJS0cTRBMGLFrO/ci3yRZpMJhDA6X3P7eUpWhn2RhrJ1HxS9B6FjId4l
	UVdNh9l8KFdHXrV9OYxVJVusFWVZFdrddh9Vr3y4x+XDPsGX1+IVWESq8tFFqXW1L1mkABM6eyc
	P6rwl8GsajrMFg3k0=
X-Received: by 2002:a05:7300:a21f:b0:36e:c85c:3bbc with SMTP id 5a478bee46e88-37965ca778amr617161eec.12.1794527199152;
        Thu, 12 Nov 2026 15:46:39 -0800 (PST)
X-Received: by 2002:a05:7300:a21f:b0:36e:c85c:3bbc with SMTP id 5a478bee46e88-37965ca778amr617132eec.12.1794527198548;
        Thu, 12 Nov 2026 15:46:38 -0800 (PST)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316f2sm1655703eec.9.2026.11.12.15.46.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 15:46:37 -0800 (PST)
Message-ID: <da4c6658-a4a0-43ae-92da-14d8463dfc08@redhat.com>
Date: Fri, 13 Nov 2026 09:46:32 +1000
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
Subject: Re: [PATCH v4 3/3] arm_mpam: resctrl: Limit num_rmids to the CLOSIDs
 in use
To: Jinjie Ruan <ruanjinjie@huawei.com>, james.morse@arm.com,
 ben.horgan@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 zengheng4@huawei.com, tan.shaopeng@jp.fujitsu.com, jic23@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261111081316.3828283-1-ruanjinjie@huawei.com>
 <20261111081316.3828283-4-ruanjinjie@huawei.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261111081316.3828283-4-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/26 6:13 PM, Jinjie Ruan wrote:
> On MPAM an RMID is a PMG within a PARTID, so resctrl can only allocate
> the PMGs of the CLOSIDs it uses. info/L3_MON/num_rmids is instead set
> to the whole PARTID and PMG space when the monitors are initialised,
> and halved when CDP is enabled. It reports more RMIDs than resctrl can
> allocate in two cases:
> 
> - With CDP each CLOSID takes two PARTIDs, and resctrl halves the
>    CLOSID count rounding down, while MPAM halves the whole RMID space.
>    With 5 PARTIDs and 2 PMGs resctrl has 2 CLOSIDs and 4 RMIDs, but
>    num_rmids reads 5. The count is too high whenever the number of
>    PARTIDs is odd and there is more than one PMG.
> 
> - On a monitor-only system there are no control groups and resctrl
>    only uses the default CLOSID, but num_rmids still covers every
>    PARTID. With 5 PARTIDs and 2 PMGs it reads 10 while only 2 RMIDs
>    can be allocated.
> 
> RMID allocation is limited to the CLOSIDs in use, so only the value
> reported to userspace is too high. Creating as many monitor groups as
> num_rmids allows fails with -ENOSPC before that number is reached.
> 
> Count the CLOSIDs resctrl uses instead: every resource has
> mpam_partid_max + 1 CLOSIDs, halved and rounded down while CDP is
> enabled, and a system with no resource that can allocate uses only the
> default CLOSID. Report (pmg_max + 1) RMIDs for each of those CLOSIDs.
> Count at monitor initialisation and from resctrl_arch_set_cdp_enabled(),
> which resctrl calls whenever a mount or unmount enables or disables
> CDP.
> 
> Fixes: 264c285999fc ("arm_mpam: resctrl: Add monitor initialisation and domain boilerplate")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: <stable@vger.kernel.org> # 7.1+
> Cc: James Morse <james.morse@arm.com>
> Cc: Ben Horgan <ben.horgan@arm.com>
> Cc: Reinette Chatre <reinette.chatre@intel.com>
> Cc: Fenghua Yu <fenghuay@nvidia.com>
> ---
> v4:
> - Simplify the fix with mpam_partid_max, cdp_enabled
>    and resctrl_arch_alloc_capable() as Ben suggested.
> v3:
> - Drop resctrl_arch_set_mon_rmid_count() and count the CLOSIDs in the
>    MPAM driver instead, as Ben suggested.
> - v2: https://lore.kernel.org/all/20261105123304.2281987-1-ruanjinjie@huawei.com/
> v2:
> - Also fix num_rmids on monitor-only systems, as Ben suggested.
> - Retitle from "arm_mpam: Round the CDP RMID count down to whole CLOSIDs".
> - v1: https://lore.kernel.org/all/20261104101622.563280-1-ruanjinjie@huawei.com/
> ---
>   drivers/resctrl/mpam_resctrl.c | 30 +++++++++++++++++-------------
>   1 file changed, 17 insertions(+), 13 deletions(-)

Reviewed-by: Gavin Shan <gshan@redhat.com>


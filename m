Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793696334;
	b=UhcicjjMkyzW3wrm6E4yxbZvf4H94jp2vptFybI+doQ3UM5/axTR62KSjOx0+RTkCKdk
	 ZxNU0zY3QKnM/IU04PHC2b5SGMB1NYDv0xxmsFhXzPJjTKaYhVxMv+PTReJ2BFJqxUZaf
	 yfVl8PmizwI4+voQNrS/EhMHbuWZvVpsG+0oU7NwxOaHA4IsEN0Yo2HeVfPV91janpmOg
	 PO/+5Tve94v7Uno/3s3TyX1v65oOKTgrl7pugcdkM3ZOpkaS0Kq80DoRoDFDKCvuuUWnj
	 RcPQC+MUkhhOtO1Uy8fXC/o0VJWGmlNcBtJjz7FyqhtHGTGu0xb26N9Zbd7Wx0LGrBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793696334;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=2Wui6IZ8+3IGT64LYdI3jyRRUf+/gPZP21F0NxyFocQ=;
	b=01Kh5S1p2xNQSCso6U+92W2494D2IO9GCdio2RUhFv5UIAk/jvXtk3QeoIm1wLryZp9P
	 pcxtfws2wUA1MmneVmsrrJHlVcKPBgjXdHY6mk2UjRxsDYUf8HpGZsLDT3qVLcUGBIv+n
	 oDuBwEjG94d2uMjgOittHjWnSX1RmckQAkdtevVd1WG3e+6/y30uPcFE3cuvfuNwRKGk4
	 a24h+ANmuo5Ej0YeqXInPDRNmPv4o0/DVzstC9O754riOBhlNhPZRmK1CTHE1AyhtGZvO
	 EoeiFJUgewP9qfFfZ8JpZFi5Cg0p8LPz5hygtJ+LCv0ae8enJHl148QONDiKQncvMyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=isrv22Qo;
	arc=none smtp.remote-ip=113.46.200.216
Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954EC606A324;
	Tue,  3 Nov 2026 08:58:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 954EC606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=isrv22Qo
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=2Wui6IZ8+3IGT64LYdI3jyRRUf+/gPZP21F0NxyFocQ=;
	b=isrv22QophiKZJmHwiKj18ROMvnstRKjIO5KG/TqqRwa3SnAL84BCdjX2f4IR7ndwUDmEt0vg
	3m/9phItTB9i/QXD7Df5zIhq1zWhXy9o1/Xw2X7yFJ42Ax0X5f6AxY85HkyFW13SzTiN8vvC/bI
	0tTDoXsiI2Bt3HAvPJ+LmNU=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4jJjCp3g83z1T4GB;
	Tue,  3 Nov 2026 16:58:30 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id BDAE64057F;
	Tue,  3 Nov 2026 16:58:48 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 3 Nov
 2026 16:58:47 +0800
Message-ID: <432a92de-bd62-4d89-b0b8-3e89086660e0@huawei.com>
Date: Tue, 3 Nov 2026 16:58:45 +0800
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
Subject: Re: [RFC PATCH v2 19/19] Documentation: arm64: mpam: Describe the L2
 monitor events
To: Daniel Pereira <danielmaraboo@gmail.com>
CC: <reinette.chatre@intel.com>, <james.morse@arm.com>, <ben.horgan@arm.com>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>, <rdunlap@infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20261029123611.1108424-1-ruanjinjie@huawei.com>
 <20261029123611.1108424-20-ruanjinjie@huawei.com>
 <CAMAsx6c655ZN6YkwCSmgo9rdddUG9sjYQE_1XQi6=J=i=7N_Jw@mail.gmail.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <CAMAsx6c655ZN6YkwCSmgo9rdddUG9sjYQE_1XQi6=J=i=7N_Jw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/11/3 10:29, Daniel Pereira 写道:
> Hi Jinjie,
> 
>> Say why a bandwidth counter is assigned for the life of the monitoring
>> group: rewriting its filter restarts the count.
> 
> I could not find this explanation in the diff. Is my analysis correct,
> or was the paragraph left out of this version?

This is an outdated message leftover by mistake; please ignore it.

> 
> Thanks,
> Daniel

-- 
Best regards,
Jinjie


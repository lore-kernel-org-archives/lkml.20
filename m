Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793081836;
	b=nfmJNfK5QRVeZrRI5pojhiU5pKDxNmCrqe4a/qgTxp+zY5tTigVbiMLbK4cF8RaeqwjJ
	 WUE6skqbMhZI9LN8R4IEdZ64JruCHcAh98nhE19HPh4Tl/itxzlwHhr5l05/TJMDm8LPx
	 6QcZYiDJ5A9GN10GOxzCcIKqv0SLSH2NB4NpGYWPOgm2E12q+A41V06RL8mccP233qZDI
	 X/oih1diw3nq4bBFR1MBwvsRYEQ+1V2PYDs13PaZF7mQ9Swpg88A98Kf/ZmdQjhZ6NhM6
	 hIjj/HSv22i+uBXwY43OkMzvmH6phSab4C/g885KunXKPmNXwGhzOUzopEnw49sg0VA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793081836;
	h=DMARC-Filter:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=ef3JyI0YdgpGvcMfoyAxHAYTbrS9lUx0QjdeKBeznBc=;
	b=1fJE2/3S9U1UXEfw8IcT2KzhT4G3/DXaAyW3CtXMuyD/gbMYlZEp7b7MSwxp7zUKKMQG
	 lmja/Q2Z3YSdbO7KP+F8cYTv3psmHeSziJtvlVsG5nc/zM4J9y+XEoSW8+OuL6fwfsnLy
	 uwQDvxH1+vXgDknIXHP6Mxa8BZiuTlrCYXcDdrY6zZ2kYN1Y5S4jqAKm6H9AZFIL3QTI8
	 2MKXg1mUYiUy9se7ler5vTQ7bcASrQj6Ecsdhgj02eFF3TodLc9Q4Spi9f19LX63ridea
	 SytpDnqNqgtWTqWyi4n0wClm3DYelxDbmAPTpyl53F2I3JyjC34822EJvJmAqac+G3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=JUc7K8Xq;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAF0606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:17:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EAF0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=JUc7K8Xq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=ef3JyI0YdgpGvcMfoyAxHAYTbrS9lUx0QjdeKBeznBc=;
	b=JUc7K8XquiFb5y4NH5vXLs5kXnJxtTJVzVEFXxiLAuFpZ7BgP0BdqvQr6yf7cz
	hLPn81GVP+kJnKsTLLZUc33nOffe+suf8N2Ew/wK+Z1GTHplZOl3ubMAHkgkMVSx
	82kEwuh/Nl045xwsrhJGIAI8RopE5iojbV+HLvVTjZo3A=
Message-ID: <a3d00829-1085-4560-9c20-6a9dae4894f6@163.com>
Date: Tue, 27 Oct 2026 14:16:05 +0800
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
Subject: Re: [PATCH v4 04/31] ntfs: preserve attribute search context
 initialization errors
To: Hyunchul Lee <hyc.lee@gmail.com>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev,
 linux-kernel@vger.kernel.org, wangxuewen@kylinos.cn, wudandan@kylinos.cn
References: <20261020084421.2196486-1-liubaolin12138@163.com>
 <20261020084421.2196486-5-liubaolin12138@163.com>
 <auA600gtGbVWw_SU@hyunchul-PC02>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <auA600gtGbVWw_SU@hyunchul-PC02>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgBnTZm7QeBqgKJNCQ--.39021S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xw1rAFy3uw15Gr15uFy3Jwb_yoWxAFX_Zw
	4v93WDKrW2qF1DZwsFvrsavFs8WrZ3Jrn8XryrtFs2yw1kta97uas5urZ3JFZ7Ww1Fvan8
	Gr4UuFyj9r15AjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjFAp7UUUUU==
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6h1SHWrgQb2s0gAA3w



在 2026/10/27 13:46, Hyunchul Lee 写道:
> Hi,
> 
>> @@ -5476,7 +5480,7 @@ int ntfs_attr_exist(struct ntfs_inode *ni, const __le32 type, __le16 *name,
>>   	ntfs_debug("Entering\n");
>>   
>>   	ctx = ntfs_attr_get_search_ctx(ni, NULL);
>> -	if (!ctx) {
>> +	if (IS_ERR(ctx)) {
>>   		ntfs_error(ni->vol->sb, "%s: Failed to get search context",
>>   				__func__);
>>   		return 0;
> 
> ntfs_attr_exist() still turns ntfs_attr_get_search_ctx() errors into
> 'attribute absent'.

Hi HyunchulLee,
    You're right. In v5, I'll make ntfs_attr_exist() preserve errors and 
update its callers to distinguish errors from an absent attribute.

Thanks,
Baolin.

> 
>> -- 
>> 2.51.0
>>
> 


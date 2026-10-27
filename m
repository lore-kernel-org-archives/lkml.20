Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793081942;
	b=J326gr/wl2sSLSHN/VEHhcHYsyX8z2Fo+Mmn15TGXphMq7x9uUVVQTnIm1QF2voYUVNW
	 zB3T5HICM66HkUbHCoOZhDeRRK4+4yUrn8HO/c9c1gSY/ArduZ2zq88wmq3Kn4k48qCUe
	 +AUzYN+keeLWQzF5ukZanHQ9/EMLNdqH3oQiioXENprioN2xIp5SfBxz6s0mMNKhDmVaW
	 OiGb6IcQHm7ULjDnQh+AbaTQ+gmZnwVTnvgqhzDtizTqVTQdo/gJF4/BgIqymz6eaFdSs
	 CI3gf8LpJ9C+pNGGbj5yQzcZp1/es/vmcZFwtXrsBD+jvVyJxPDQ29OyBC8oB32LSmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793081942;
	h=DMARC-Filter:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=9rTAfW4u1PPdVWJfzLLbp4BNSXUE/vuEFidaNLbl3bU=;
	b=oZPtAjMfI9XIAiqdT16SZRpoO9KUpHe0LRTlG5IFrxppj36HEhRCzaGBw/tBXCu9oZSu
	 rI0EXdzTO/iFapoVezhv5E3x2gb2T88Nkmz+zDopKZfjCZudYASy36mMtv5HRnAFshQjR
	 XecwbhCOaxiSp3tFWx0tnnnRq4dGeKGcoWrR2mYL6+BiZ+xsmpFRpuK96Ss+E4YLO0GcC
	 6svN+QzGx4mWx29kQdKIL0KfmWEFvW7ai70ggxTfoovCm27l3+X61/Ft15e03iwYRHOvi
	 5o+jum7DIpweVn7QyEe3SD/FV1FxzrfkhRc82pziXzKEMn314WTMBuw5Ekkoqcuq1Lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=gA5OhUmn;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16D5606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:19:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D16D5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=gA5OhUmn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=9rTAfW4u1PPdVWJfzLLbp4BNSXUE/vuEFidaNLbl3bU=;
	b=gA5OhUmneVnglJ5+Sf40aGFnhdKkxFfxJRMTAFJVXfE3/qSDqYcFAcZhz4FLWU
	OX0/0VA7XQ6sBUbjTGkSOVXmX6LmvJiUV4Zmthy84MeLx50uHrJQfAXZnXG9gba7
	ldC1i1Ud86me6jwTi0D0z0RBZM9LSPg0UaL2pYxDhEokA=
Message-ID: <371c8495-8eaf-4894-be40-007bf857866e@163.com>
Date: Tue, 27 Oct 2026 14:18:14 +0800
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
Subject: Re: [PATCH v4 05/31] ntfs: report boot geometry and MFT bootstrap
 errors
To: Hyunchul Lee <hyc.lee@gmail.com>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev,
 linux-kernel@vger.kernel.org, wangxuewen@kylinos.cn, wudandan@kylinos.cn
References: <20261020084421.2196486-1-liubaolin12138@163.com>
 <20261020084421.2196486-6-liubaolin12138@163.com>
 <auA7LJX2rUZUH8v9@hyunchul-PC02>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <auA7LJX2rUZUH8v9@hyunchul-PC02>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgB3N24oQuBq8P5eCQ--.30598S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUnpnQDUUUU
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6gptOGrgQirEzgAA3d



在 2026/10/27 13:48, Hyunchul Lee 写道:
>> @@ -2802,7 +2822,8 @@ static int ntfs_fill_super(struct super_block *sb, struct fs_context *fc)
>>   
>>   	tmp_ino->i_ino = FILE_MFT;
>>   	insert_inode_hash(tmp_ino);
>> -	if (ntfs_read_inode_mount(tmp_ino) < 0) {
>> +	err = ntfs_read_inode_mount(tmp_ino);
> 
> There is still one error handling case where ntfs_read_inode_mount()
> returns -1.
> 
Hi Hyunchul,

    You're right, I missed that return path. I'll return the actual 
errno there in v5.

Thanks,
Baolin.


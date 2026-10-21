Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792551217;
	b=GLk7XI8Rpym/RWQMvFqT3C3W/pfbRKKo+XUjhiG8jLjb9MeO2lTyBGQ4XfGVYJCFGB5I
	 gOkp/UYRSM+NuSEfCJWpV4be7oCaL0SXsDGS0agc4o6atOgPzV604893w26DUt97KQ66f
	 hjYLsZcIl6UJKocLnbe+WkDv4XN3CC5XDk8/7cqsanZUUMQc+2/V6L5wIzG73GGyLJmym
	 XX2tfF1S/yegPxfptRysbo8dwaF3S8plP/I5T/c+6BST4KeayGarvL8ZMh+FsXg7Y3z7j
	 EcbtUP3TxViZKGOKMBMKN0oaHO58zO/CJmnHtvdScK9Dcv1Q9f6AGFYSiInwOY9yx7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792551217;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:From:User-Agent:
	 MIME-Version:To:CC:Subject:References:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=HrGJi+RB2YQ86RKcmJi8niM130S0rIztrK9+RbyCn54=;
	b=ml8iJlORicmaWTf6YdUZOUrZS/VB/NZRo9fPN2FwV1C/56TImHMhnvQJaEDxEVy+09rG
	 43D9Ond4ZwIBNzoPVX5busm7FVMfQ5rWq4etmP28nx8COp5B8nSoffOpSk74VnSEhQ/Xd
	 sd1cyn3abk7mG2gLZDoNRVkOgmybwuTGF4VOgojyROn7rOBEIzYlD7Edk5jR8HtuqHQ7O
	 9Hx0p3njoS28WzM83NSRxPIBt8yXm2mYMCDGoB7FDlR2zCFArsDo6vb+4mg5Q2QI+uUid
	 CeUx9VofSpaxSCe7hB+1nkXTatyn14wQeK3+g0BeUNwyihphZ5TdizE4d5IRASyi0Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=126.com;
	spf=pass smtp.mailfrom=126.com;
	dkim=pass header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=o2jrmEnn;
	arc=none smtp.remote-ip=117.135.210.9
Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6258D606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:53:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6258D606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=o2jrmEnn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Message-ID:Date:From:MIME-Version:To:Subject:
	Content-Type; bh=HrGJi+RB2YQ86RKcmJi8niM130S0rIztrK9+RbyCn54=;
	b=o2jrmEnnLuWsbccq0bZ5VE22yyhogFpXS15h1ua/sNFSrLHRFebbHyE9h5QFvR
	snVBT5XdvI6t2fVDPCiKetEln8eIZrSlxnpYiwEG6xV4h01cfqaSI/5McgsGjQfD
	JvEjLgWe5F0NrsSjcf9WMU6Zw26TUwJ5KTrNJygiXHEtM=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wDnT64QKdhqzoz0BQ--.9259S2;
	Wed, 21 Oct 2026 10:53:05 +0800 (CST)
Message-ID: <6AD828E9.3020305@126.com>
Date: Wed, 21 Oct 2026 10:52:25 +0800
From: Hongling Zeng <zhongling0719@126.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:31.0) Gecko/20100101 Thunderbird/31.2.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
To: Hyunchul Lee <hyc.lee@gmail.com>, 
 Hongling Zeng <zenghongling@kylinos.cn>
CC: linkinjeon@kernel.org, ntfs@lists.linux.dev, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] ntfs: handle a failed size rollback in the write error
 path
References: <20261020070641.793832-1-zenghongling@kylinos.cn> <atga-YNByHiwk-y0@hyunchul-PC02>
In-Reply-To: <atga-YNByHiwk-y0@hyunchul-PC02>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnT64QKdhqzoz0BQ--.9259S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZryfAw1DCrW5ZrW7JryfCrg_yoW5Jryxpr
	9rur43try7Z3yxGrnYqrWkXw1jqrWrWr1UZFy5KF1fAFyv9r1vqF18t3y8CFWIyr90k3ZY
	vF4DXrWxZrn5XFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jI0PfUUUUU=
X-CM-SenderInfo: x2kr0wpolqwiqxrzqiyswou0bp/xtbBrxEf72rYKRGnbAAA3P


在 2026年10月21日 09:52, Hyunchul Lee 写道:
>> diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
>> index d810ca5904bd..ad032cccfb15 100644
>> --- a/fs/ntfs/file.c
>> +++ b/fs/ntfs/file.c
>> @@ -934,23 +934,46 @@ ssize_t ntfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>>   				&ntfs_iomap_folio_ops, NULL);
>>   out:
>>   	if (ret < 0 && ret != -EIOCBQUEUED) {
>> -		if (ni->initialized_size != old_init_size) {
>> -			struct ntfs_inode *mrec_ni =
>> -				ntfs_base_inode(ni);
>> +		int init_err = 0;
>> +		int data_err = 0;
>>   
>> +		if (ni->data_size != old_data_size) {
>> +			struct ntfs_inode *mrec_ni = ntfs_base_inode(ni);
>> +
>> +			truncate_setsize(vi, old_data_size);
>> +			/*
>> +			 * ntfs_attr_truncate() would reject a compressed
>> +			 * attribute.
>> +			 */
>>   			mutex_lock(&mrec_ni->mrec_lock);
>> -			ntfs_attr_set_initialized_size(ni, old_init_size);
>> +			data_err = __ntfs_attr_truncate_vfs(ni, old_data_size,
>> +					old_data_size);
>>   			mutex_unlock(&mrec_ni->mrec_lock);
>> +			/* Like ntfs_setattr_size(): stay on the durable size. */
>> +			if (data_err)
>> +				i_size_write(vi, ni->data_size);
>>   		}
>> -		if (ni->data_size != old_data_size) {
>> -			struct ntfs_inode *mrec_ni =
>> -				ntfs_base_inode(ni);
>> +		/*
>> +		 * The shrink above may leave the initialized size above
>> +		 * the old one; ntfs_attr_set_initialized_size() rejects
>> +		 * a resident attribute.
>> +		 */
>> +		if (ni->initialized_size != old_init_size &&
>> +		    NInoNonResident(ni)) {
>> +			struct ntfs_inode *mrec_ni = ntfs_base_inode(ni);
>>   
>> -			truncate_setsize(vi, old_data_size);
>>   			mutex_lock(&mrec_ni->mrec_lock);
>> -			ntfs_attr_truncate(ni, old_data_size);
>> +			init_err = ntfs_attr_set_initialized_size(ni,
>> +					old_init_size);
> The shrink above can clamp initialzied_size to old_data_size. If
> ntfs_attr_set_initialized_size() fails, the initialized_size remains
> instead of being restored to old_init_size. For a compressed file,
> this can expose stale data.
>
> Could you restore the initialized_size first and perform the shink only
> if that rollback succeeds?
>
  ok,you are right, I will roll the initialized size back first, and 
skip the data size rollback when it fails. With the initialized size 
restored, the clamp keeps it at the old initialized size at most,
   and when the restore fails, both sizes stay extended, which keeps the 
on-disk initialized size below the data size. Will post v5.
Thanks!


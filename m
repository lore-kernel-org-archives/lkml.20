Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7159E2AE68
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 02:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788919434; cv=none; b=KNv0kO52WthyVDUApE+7FpDMvsq6EfwIUgkfLavgPwjNYIgZ9npoEh+1Mhtwd+9uSEWDcOd6uFcihn/dTeKvfMW+UhjhtmbNI3lxdIZPyVeMLcU4aM04HVusCakHCJgOOaFfWcCNUJVL8XgMyQgeVpWOtS8Jq2w2Euf4vy5zApI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788919434; c=relaxed/simple;
	bh=7QxfwFB1513YCpCcinldL5FCs6fclRFzOy9S2pH6RQ4=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=EngmY1Pc7jGoUEezPkPTx8GFkajDLlYO2XhHrr2leQhSJDU2TB/7mqa0W97HRglmKLUgIcHfqDBt4I6XbYPtMj4n3bk3mTBTY2O2eldqS7ImRfgVwr2vP4DDi0rNDLBgpnEtfpemzFvOWruu25JKPgZnekG3Lpm5bAgXwSujOMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VYkQ2X/v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VYkQ2X/v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AD4C1F00A3A;
	Wed,  9 Sep 2026 02:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788919433;
	bh=iPPijrSAEf6GC7mT3EoUKryESek5TYWN+vDTDROlKhQ=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=VYkQ2X/vI7dLQ0twmWOT67G8W6ceML31Wc8XfnLg4liLyBb0VU+sy+nj5uVRU8K77
	 U3aACHvERUx6A/7nSEb6JEKZpWpScl3bp7KTekr5HXRt7cfvBlz/YBdAD53+mtY42d
	 vG2hPNfGq0Yxvd4KDexj/MMGwuMR37IcQuDssppNpbjimSqn+jRgkf9Bwj6tmT4FeD
	 YATF9XIsR3/2Ej+pbOycR0mkTFg9kXzRGMR0TCsccroV/00XdIvAAii+BYt+Vk1RFd
	 8Ilye4FCvOp7wjlVa3Gt0c3Xztl7xNmYfBdHGtd8nN1Q2fIS34/u9Bclx7BXZ28bDD
	 JCS5PFuiNRkZg==
Message-ID: <c5d29b31-e764-4782-9639-be84b1b2bfc2@kernel.org>
Date: Wed, 9 Sep 2026 10:03:50 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, jaegeuk@kernel.org, stable@kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid potential deadloop in
 f2fs_fsync_node_pages()
To: Zhiguo Niu <niuzhiguo84@gmail.com>
References: <20260824131729.3694378-1-chao@kernel.org>
 <CAHJ8P3+KBs1cQnDPsfpHOyjxNA+JNQ5DPCbrF_JqTLcmoyzB1w@mail.gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CAHJ8P3+KBs1cQnDPsfpHOyjxNA+JNQ5DPCbrF_JqTLcmoyzB1w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 9/9/26 09:12, Zhiguo Niu wrote:
> Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
> 于2026年8月24日周一 21:19写道：
>>
>> There is potential deadloop in race condition:
>>
>> Thread A                                Thread B
>> - fsync
>>  - f2fs_do_sync_file
>>   - f2fs_fsync_node_pages
>>    - last_fsync_dnode
>>     - folio_get(last_folio)
>>                                         - f2fs_setattr
>>                                          - f2fs_truncate
>>                                           - f2fs_truncate_blocks
>>                                            - f2fs_do_truncate_blocks
>>                                             - f2fs_truncate_inode_blocks
>>                                              - truncate_dnode
>>                                               - truncate_node
>>                                                - invalidate_mapping_pages
>>                                                 - folio->mapping = NULL
>>    - is_node_folio alwasy return false
>>    - atomic && !marked is always true,
>>      then goto retry
>>
>> Cc: stable@kernel.org
>> Fixes: 608514deba38 ("f2fs: set fsync mark only for the last dnode")
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>  fs/f2fs/node.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
>> index 968e5ed38816..86c2e67e43b6 100644
>> --- a/fs/f2fs/node.c
>> +++ b/fs/f2fs/node.c
>> @@ -2016,6 +2016,11 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
>>                 f2fs_debug(sbi, "Retry to write fsync mark: ino=%u, idx=%lx",
>>                            ino, last_folio->index);
>>                 folio_lock(last_folio);
>> +               if (unlikely(!is_node_folio(last_folio))) {
> Hi Chao,
> is_node_folio->NODE_MAPPING(F2FS_F_SB(folio))->F2FS_M_SB(folio->mappping)->F2FS_I_SB(mapping->host)
> if mapping==NULL, panic will occur here?
> just like  commit msg in  mai: "f2fs: parameterize node helpers and macros"

Hi Zhiguo,

Ah, seems we need to revert ("f2fs: introduce is_{meta,node}_folio") which
introduce this bug? IIUC.

Thanks,

> thanks！
> 
>> +                       f2fs_folio_put(last_folio, true);
>> +                       ret = -EAGAIN;
>> +                       goto out;
>> +               }
>>                 f2fs_folio_wait_writeback(last_folio, NODE, true, true);
>>                 folio_mark_dirty(last_folio);
>>                 folio_unlock(last_folio);
>> --
>> 2.49.0
>>
>>
>>
>> _______________________________________________
>> Linux-f2fs-devel mailing list
>> Linux-f2fs-devel@lists.sourceforge.net
>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


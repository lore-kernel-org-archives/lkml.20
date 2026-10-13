Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6C635AC24
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791857752; cv=none; b=SQSXBeOCBOGxxnDRwxRY1nGq295PTd+TWenFjiaqO1RszVm8CRuVt7nFnu6g/GsFPm2dpRK7PYcDGPq/EG7Nsvz9faBgq48a2uYELUGb/jbGKg3MZQ5Hk/IuWwBK29uR28GjtnYxOBZoIfOh92KU5ZQg/BQYWXNWOLxRT1wKTBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791857752; c=relaxed/simple;
	bh=tX57hGNQ7+NLNQofa+VJcdpDL9MFD2u8xR7G3kHptcg=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=APsT0DIAhY62DiMsKED7Z2/1c8mO6Zgaom53McVpBdm+tVnt6YmM/9jp9ei4uoR5AbJ+cWAKsYMUMJqlRhuKSuPci/lbOlg063p9l8vDqADVqz0I8vtLePgbl4LCwyY6nfxrlP9cJqVQ/EeKwx3gmYmGSmp6ZdhYoHM5nuu6dpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=CVYa7y/t; arc=none smtp.client-ip=113.46.200.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="CVYa7y/t"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Q85ygIiAoY+q0RpnUiItrY/4wrTsA/2qV3ljC2Zfm/4=;
	b=CVYa7y/tNdiMXVJFDMiTP0ZYKUFgt+/qlzcRN/shTnpSNSOy7dEfj+U3dbcCJsHw/g0tF+Hb5
	+ygT/AJChlg+HSkUlo0O0aTlzJWKdy7qRPhGdA+/o0MeR5/t97XvCp2tgezTrk0l+uMubyPCH+S
	6dtxH4VHh3dthSBCA+svVxM=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4j3d0f6D7jzLlX5;
	Tue, 13 Oct 2026 10:03:30 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id 6A44040586;
	Tue, 13 Oct 2026 10:15:48 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 whupemo200011.china.huawei.com (7.152.185.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 13 Oct 2026 10:15:47 +0800
Subject: Re: AW: [PATCH] ubifs: fix host inode TNC offset when deleting an
 xattr
To: Richard Weinberger <richard@nod.at>, Nan Lin <lin.nan@h3c.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<wangxiaoqing@h3c.com>, <zhou.kete@h3c.com>
References: <20261012075046.1268480-1-lin.nan@h3c.com>
 <mv5oa6u2.f135b439-8d58-4f22-b346-3aacaa66e9e4@nod.at>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <6bbe3bbe-ea29-97d8-20d8-97723570a426@huawei.com>
Date: Tue, 13 Oct 2026 10:15:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <mv5oa6u2.f135b439-8d58-4f22-b346-3aacaa66e9e4@nod.at>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 whupemo200011.china.huawei.com (7.152.185.179)

ÔÚ 2026/10/13 3:56, Richard Weinberger Ð´µÀ:
> Am Mon, Oct 12, 2026, 09:58 schrieb Nan Lin <lin.nan@h3c.com>:
>> When ubifs_jnl_delete_xattr() deletes an extended attribute, it writes
>> a group of three nodes to the base head: the xent node, the xattr
>> inode node and the host inode node. The host inode node is actually
>> packed at xent_offs + aligned_xlen + UBIFS_INO_NODE_SZ, but the
>> position registered into TNC is computed backwards as
>> xent_offs + len - hlen. The two differ by the group tail padding,
>> ALIGN(hlen, 8) - hlen.
>>
>> Whenever the host inode's data_len is not a multiple of 8, the offset
>> registered in TNC points 1 to 7 bytes past the real node header. The
>> wrong offset gets committed into the on-flash index, and on the next
>> mount read_znode() fails the offs & 7 alignment check, returns -EINVAL
>> and switches the filesystem to read-only mode, reporting
>> "bad indexing node ... error 2".
>>
>> Which inodes are affected depends on data_len:
>>   - block/character devices always carry data_len = 4 and are always
>>     affected;
>>   - symlinks carry data_len = strlen(target) and are affected unless
>>     the target length happens to be a multiple of 8;
>>   - regular files, FIFOs and sockets carry data_len = 0 and are
>>     unaffected.
>>
>> The bug reproduces by setting an xattr on a symlink with attr -Rs and
>> removing it with attr -Rr: after unmount and remount, readlink()
>> fails, the index node is rejected with error 2 (bad branch offset) and
>> the filesystem turns read-only.
>>
>> Fix the offset computation by accumulating the group layout forward
>> instead of subtracting from the total length: register the host inode
>> at xent_offs + aligned_xlen + UBIFS_INO_NODE_SZ, which matches the
>> packed position exactly. The host node length hlen is already correct
>> and stays unchanged.
> 
> Fixes: 1e51764a3c2a ("UBIFS: add new flash file system")
> Cc: stable@vger.kernel.org
> 
>> Signed-off-by: Nan Lin <lin.nan@h3c.com>
>> ---
>>   fs/ubifs/journal.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> Good catch!
> 
> Please ask your LLM to write less wordy commit messages.
> How about something like that:
> 
> ubifs: fix host inode TNC offset when deleting an xattr
> 
> ubifs_jnl_delete_xattr() writes a group of three nodes: the xent, the
> xattr inode and the host inode. The host inode is packed at
> xent_offs + aligned_xlen + UBIFS_INO_NODE_SZ, but its TNC position is
> computed backwards as xent_offs + len - hlen. Since len includes the
> group's tail padding, ALIGN(hlen, 8) - hlen, the two differ whenever
> the host inode's inline data length is not a multiple of 8. This
> affects symlinks and device nodes.
> 
> The unaligned offset ends up in the on-flash index and the next mount
> rejects the index node, turning the filesystem read-only.
> 
>> diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
>> index 40a95a2fad50..1a32d641e658 100644
>> --- a/fs/ubifs/journal.c
>> +++ b/fs/ubifs/journal.c
>> @@ -1943,7 +1943,9 @@ int ubifs_jnl_delete_xattr(struct ubifs_info *c, const struct inode *host,
>>   
>>   	/* And update TNC with the new host inode position */
>>   	ino_key_init(c, &key1, host->i_ino);
>> -	err = ubifs_tnc_add(c, &key1, lnum, xent_offs + len - hlen, hlen, hash);
>> +	err = ubifs_tnc_add(c, &key1, lnum,
>> +				xent_offs + aligned_xlen + UBIFS_INO_NODE_SZ,
>> +				hlen, hash);
> 
> How about adding a new variable instead of open coding the offset?
> The offsets are already super hard to understand, more magic doesn't
> make it better.
> 
> e.g.
> host_offs = xent_offs + aligned_xlen + UBIFS_INO_NODE_SZ;
> 

The problem can be easily reproduced by following script:
mnt=/mnt
mknod $mnt/node c 0 0
setfattr -n security.123 -v 123 $mnt/node
setfattr -x security.123 $mnt/node
umount $mnt
mount /dev/ubi0_0 $mnt
dmesg
[60700.197045] UBIFS error (ubi0:0 pid 8770): ubifs_load_znode [ubifs]: 
bad branch 2
[60700.197352] UBIFS error (ubi0:0 pid 8770): ubifs_load_znode [ubifs]: 
bad indexing node at LEB 11:2048
[60700.197604] 	magic          0x6101831
[60700.197610] 	crc            0x374e477d
[60700.197616] 	node_type      9 (indexing node)
[60700.197622] 	group_type     0 (no node group)
[60700.197629] 	sqnum          28
[60700.197634] 	len            88
[60700.197640] 	child_cnt      3
[60700.197645] 	level          0
[60700.197650] 	Branches:
[60700.197655] 	0: LEB 12:2280 len 160 key (1, inode)
[60700.197667] 	1: LEB 12:2048 len 61 key (1, direntry, 0x1b1f5d0)
[60700.197678] 	2: LEB 12:4332 len 164 key (65, inode)
[60700.197698] UBIFS error (ubi0:0 pid 8770): ubifs_iget [ubifs]: failed 
to read inode 1, error -22

The reason we haven't discovered this issue for so long might be that 
ordinary people don't set xattrs on symlinks or device nodes.
BTW,

Tested-by: Zhihao Cheng <chengzhihao1@huawei.com>

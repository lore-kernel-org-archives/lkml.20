Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793238292;
	b=zng8oTBmb3ZXhV5lf75dQnDPkuf6t+Zftd4mYQo8WpdlR20BQxd+vQsJt6Sz93Ga+dx6
	 w8poMwxE9y2UPdtnxCgEH+94Zm9QUsk/qn8FPGEli9V76aY4q4xDfoTnrFFo3VQn/pVGu
	 VzLdk6Jv6t0Zohn6IK/SIUP+TgyR/7ggUcijpIIZFo5CEj+6A5NdI/9wJQ9r1EDMlYal/
	 wn7za4mkLa03YuJYqWsRIxM4lBppATMPlrxxzEdNHpMvdxmGWL80go/sI2f7HxV2HEpIz
	 u9IpaZWHhqVVI8to/u6DeZVldOUFmYucTBUapBdJQdbLbHxt1/mlOZRP/RtBXMPa35Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793238292;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=fsImNdWrr83N8+F7M3ohrBELj1nHC3un4eFEu4YBSFs=;
	b=hwbesOBt3PBjcHY4+O5MJK1AqPIgeP5K9DWn7IbLAoRbSkz/gwZaqSBJ3JljwjtGXfJw
	 jk+OvZaoQTAywEES9ZeXgEaFmGy1nHTYQw51XfXaOpdS4pURWvLRJN8JRHlWxuXwo3HzN
	 6KWpn49SRNQtf3TDqq+97CF38gKFMTn8HPVkgnuHJW5mgHoaoabCjWrmx0huzuTsQ9TM4
	 jfrXioBkbuIyaPoM8GL8NbENV5y1x7tyWsvwXkR69Ky1Be6G8kOPIVyvMiENBIIqpVwmU
	 CZtP/nwi17goWYOfQbGglUGgTbFt7keNVIJxU3/W3ZS7r6wkW6Yq1JwF1UEGAgVitjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F97606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:44:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4F97606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 51742f00d33a11f19a56ed5b684f684d-20261029
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:7c6f379b-36a0-4ef1-9455-98e168291740,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:ea4b5ef0005654da332220e8719846a7,BulkI
	D:nil,BulkQuantity:0,SF:80|81|82|83|102|865|898,TC:nil,Content:0|15|52|99,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 51742f00d33a11f19a56ed5b684f684d-20261029
X-User: wangxuewen@kylinos.cn
Received: from [172.30.70.102] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <wangxuewen@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1064201557; Thu, 29 Oct 2026 09:44:45 +0800
Message-ID: <b9a48416-8052-4bc4-b002-d7766895121b@kylinos.cn>
Date: Thu, 29 Oct 2026 09:44:41 +0800
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
Subject: Re: [PATCH v1 2/5] ntfs: preserve timestamps when creating hard links
To: Hyunchul Lee <hyc.lee@gmail.com>, Baolin Liu <liubaolin12138@163.com>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261027093515.344799-1-liubaolin12138@163.com>
 <20261027093515.344799-3-liubaolin12138@163.com>
 <auKQCM-vwM5RPYDc@hyunchul-PC02>
From: wangxuewen <wangxuewen@kylinos.cn>
In-Reply-To: <auKQCM-vwM5RPYDc@hyunchul-PC02>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/10/29 08:15, Hyunchul Lee 写道:
> Hi Baolin,
> 
> On Tue, Oct 27, 2026 at 05:35:12PM +0800, Baolin Liu wrote:
>> From: Xuewen Wang <wangxuewen@kylinos.cn>
>>
>> ntfs_link() resets atime, mtime and ctime on both the source file and
>> the destination directory after creating a hard link. This overwrites
>> the source file's atime and mtime and the directory's atime.
>>
>> Update only the source ctime and the destination directory mtime/ctime.
>> Mark both inodes dirty so these changes are queued for writeback instead
>> of relying on the earlier FILE_NAME write.
>>
>> Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
>> ---
>> Tested with the complete five-patch series in QEMU. Explicitly assigned
>> atime and mtime are preserved across ordinary hard-link creation and
>> O_TMPFILE publication. A separate persistence check set and synced
>> atime/mtime on the published file, then verified those values after
>> cache eviction, remount and a fresh boot.
>>
>>   fs/ntfs/namei.c | 7 ++++---
>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/fs/ntfs/namei.c b/fs/ntfs/namei.c
>> index 0c84a5c..4442e1d 100644
>> --- a/fs/ntfs/namei.c
>> +++ b/fs/ntfs/namei.c
>> @@ -1663,12 +1663,13 @@ static int ntfs_link(struct dentry *old_dentry, struct inode *dir,
>>   	}
>>   
>>   	inode_inc_iversion(dir);
>> -	simple_inode_init_ts(dir);
>> +	inode_set_mtime_to_ts(dir, inode_set_ctime_current(dir));
>> +	mark_inode_dirty(dir);
>>   
>>   	inode_inc_iversion(vi);
>> -	simple_inode_init_ts(vi);
>> +	inode_set_ctime_current(vi);
>> +	mark_inode_dirty(vi);
> 
> Could you also update the last_mft_change_time of $FILE_NAME? it still
> appears to retains the old ctime.
> 
> Additionaly, could you run run xfstests generic/004 and generic/389?
Hi Hyunchul,

Thanks for your review. Baolin and I will make modifications and run 
tests per your comments, and submit the v2 patch afterwards.

Regards,
Xuewen>
>>   
>> -	/* timestamp is already written, so mark_inode_dirty() is unneeded. */
>>   	d_instantiate(dentry, vi);
>>   	mutex_unlock(&dir_ni->mrec_lock);
>>   	mutex_unlock(&ni->mrec_lock);
>>
> 


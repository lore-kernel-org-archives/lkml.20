Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B91A3AAF70
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 03:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788490970; cv=none; b=uTOn3umh5HX76Qh7s3MZPLP+k1caRqUCW5vCWyRyugmdUuDSTwxTXWid6wP3DdwXTRSatWVu04VKH5naQ5zzM/GglgueZyJ7OhA7pC/w0ZRADZ3nMbuY9Sb1jdBeok0aJMb6cM3sRSKd5dxy+Y+Z5ArW4djyyqyECNQe6zE733g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788490970; c=relaxed/simple;
	bh=7GRbg3jEHD5gNolzS5BQ1u0cZ2awsH1/cbZccRiCI4o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EBxMkuhdH+6mm/BKRL4V1Lf7zpQhpNmAXRW6eHBBz/r48Ccp1Jap+QSG9XLCrU39k8VFePhbRBIA531D0LjSv/83+eUpqfCNG614zx/Xwb/VaEnPjhUkUxCBu4amO1pwoQ7E2d3JGXQfO3wKPYqNQhaqz+F4BGnpHDfy71Q7vu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=WwOC5iYR; arc=none smtp.client-ip=115.124.30.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="WwOC5iYR"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788490964; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=7tO3MuRsHneSDmvV+X3t3Ak6scnLDQvn4gudozB3MVg=;
	b=WwOC5iYRxbaPj9sV0k0JjKto0WtTS7BEDBXMhz1h6kfMTi9SIaFnnzHHIwRp+lROaEOBaBxvy8pmfFQkkJdxV2v2iGo0TUJNZOQrk23h//Lnlc7N/Y0zqUtQxXrvBy4499H9E/obONN25XMTYI4X4okAPy4uSNZkj2AX4ni0hfY=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R751e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0XAHQG0q_1788490963;
Received: from 30.221.129.151(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XAHQG0q_1788490963 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 04 Sep 2026 11:02:43 +0800
Message-ID: <900645a7-97a7-4ebf-9266-6c7e6269c3fc@linux.alibaba.com>
Date: Fri, 4 Sep 2026 11:02:42 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] ocfs2: possible deadlock in ocfs2_write_begin_nolock on
 v7.2-rc3
To: CJ <firefly0158@163.com>
Cc: mark@fasheh.com, jlbec@evilplan.org, ocfs2-devel@oss.oracle.com,
 linux-kernel@vger.kernel.org,
 syzbot+1782a3a587bc53dc10cf@syzkaller.appspotmail.com
References: <4a9f1b94.5284.1a066097387.Coremail.firefly0158@163.com>
From: Joseph Qi <joseph.qi@linux.alibaba.com>
In-Reply-To: <4a9f1b94.5284.1a066097387.Coremail.firefly0158@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Seems you posted into a stale mail list.

+cc ocfs2-devel@lists.linux.dev

On 9/3/26 2:51 PM, CJ wrote:
> 
> 
> Hi,
> 
> I am reporting that possible deadlock in ocfs2_write_begin_nolock remains
> reproducible with a migrated syzkaller reproducer on Linux 7.2-rc3. The
> tested HEAD commit is a13c140cc289c0b7b3770bce5b3ad42ab35074aa.
> 
> The reproducer mounts a crafted OCFS2 image and performs file and xattr
> operations that enter the buffered write path.
> 
> Lockdep reports a circular dependency when ocfs2_write_begin_nolock() starts
> a transaction while the inode allocation semaphore is already held. The
> reverse dependency is established through OCFS2 refcount-tree and xattr
> handling.
> 
> This looks like an inconsistent lock ordering between the inode allocation
> semaphore and the filesystem transaction lock in the OCFS2 write path.
> 
> This issue was previously reported at:
> 
> https://syzkaller.appspot.com/bug?extid=1782a3a587bc53dc10cf
> 
> Reproducer:
> 
> syz reproducer: https://pastebin.com/raw/Ch9E7gAi
> 
> console output: https://pastebin.com/raw/02Zj2gLb
> kernel config: https://pastebin.com/raw/RLSmRk5j
> Kernel:
> 
> HEAD commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
> git tree: torvalds/linux
> kernel version: 7.2.0-rc3 #1 PREEMPT(full)
> tested tag: v7.2-rc3
> 
> Let me know if you need more details or testing.
> 
> Best regards,
> Xianying


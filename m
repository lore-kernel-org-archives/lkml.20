Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6D14457C9
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 13:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790430595; cv=none; b=JDA5EnNW4d1URVtFHYrAETkL8HmqYJY8C0NcBQGWKy/U8/cYda5mpsAWcDIarpN1H6T770OvrUcFUiQOO10lLM0tUKGIx/tSwkHAJzTm4pIIMFKNE8/A2iMuYpo+JFsCkQy+Q0fpA7DF5/h0QgI5WBmdp1Xjdr2AybxE9U/2LqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790430595; c=relaxed/simple;
	bh=pg4htWPSTWhst5jptWH6ipeiHyaHtmPzw6NrMc48f10=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mgOtIoI///HhEx6p3k/kFb3fqySmzWCrVuCSuqT+yujYhGps+9Fg3n0KlDqjrTBdbQOjXrKYAG42IVdgtszhf6BuUtdcYJcWFwZVgU6mdR/wCWwIb5inONFmOmEP+NG1Y/Vw6HqJ9AQHx6KkwHUytEMBjA2yJ3Z/OUjUqE8/nYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=nN8TGVJo; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="nN8TGVJo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=IGr+dvrh4HuH30oh4FfmfQWp2wTHQLcHpe5e0TGlCNw=;
	b=nN8TGVJozCUsP1bsGz2yBQY1UoF0IIgMFZ0SxxNE6PWykna96RJP4LNDqf1cnu
	lazIPW2ZHSkz2tVD5Pgd356BYCUHJ75LqoFsOldygCl3uQXmpTkHGQRDH2oYorsY
	MnpmGsOWIhC3wIm3J6a86VlcgAJuDIyOqva+bp8x73vY8=
Received: from [IPV6:2409:8949:6ca0:7910:cfbd:ff70:c0fd:a387] (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wDnv6JTzbdqIb6jAw--.28866S2;
	Sat, 26 Sep 2026 21:49:09 +0800 (CST)
Message-ID: <21ffdfca-f58d-4509-889e-7f45e3266c30@163.com>
Date: Sat, 26 Sep 2026 21:49:07 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] ntfs: report filesystem errors through fsnotify
To: Hyunchul Lee <hyc.lee@gmail.com>
Cc: linkinjeon@kernel.org, ntfs@lists.linux.dev,
 linux-kernel@vger.kernel.org, Baolin Liu <liubaolin@kylinos.cn>
References: <20260924090102.2865942-1-liubaolin12138@163.com>
 <CANFS6bZu50diLF6Rk2BNLgpCWry3yW3n+JAjiqBXTijviRJ8JQ@mail.gmail.com>
Content-Language: en-US
From: liubaolin <liubaolin12138@163.com>
In-Reply-To: <CANFS6bZu50diLF6Rk2BNLgpCWry3yW3n+JAjiqBXTijviRJ8JQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnv6JTzbdqIb6jAw--.28866S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAF4fJr1rtF4kAFy3AFyftFb_yoWrXw13pF
	Z7G3sxK3ykJry7twnIv3yUt3WFgrZ5J3yUXr13W34Ik3WYkr1jqFWxK3W09FW8urZ3t348
	Xw4UK3srur1DAFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U2zuZUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbCwhUR22q3zVWWzgAA3A



在 2026/9/26 08:33, Hyunchul Lee 写道:
> Hi Baolin,
> 
> 2026년 9월 24일 (목) 오후 6:02, Baolin Liu <liubaolin12138@163.com>님이 작성:
>>
>> From: Baolin Liu <liubaolin@kylinos.cn>
>>
>> Report NTFS metadata and shutdown errors through the generic filesystem
>> error notification infrastructure. Use file-level events for errors
> 
> There appear to be several error paths that identify corruption
> but don't call any report_*_error(). For example:
> 
> * ntfs_lookup_inode_by_example(), ntfs_ib_read(),
>    ntfs_read_iomap_begin_non_resident(), and etc.
> 

Hi Hyunchul,
   Thank you for the suggestion. I agree that these corruption paths 
should be covered.
   I'll take some time to thoroughly review the remaining error paths 
for similar omissions and add the missing reports in v4.

Thanks,
Baolin.

>> associated with an affected inode, and volume-level events for volume
>> metadata and shutdown errors. Preserve the volume error flags and report
>> failed recovery independently of the error that triggered it.
>>
>> Report errors where they are detected and leave queued event merging to
>> fanotify. No error_reported state is carried through search contexts,
>> mapping-pairs updates or MFT mappings, so releasing a context cannot lose
>> that state or suppress a later rollback or restore failure.
>>
>> Changes since v2:
>> - Follow Hyunchul Lee's suggestion to remove error_reported tracking and
>>    the reporting-aware mapping APIs throughout the series.
>> - Report independent cluster, mapping-pairs, ATTRIBUTE_LIST and MFT
>>    bitmap recovery failures while preserving the original operation errno.
>> - Base the series on ntfs-next at 401898d748fc ("ntfs: validate
>>    attribute-list sizes before allocation"). Retain its MFT parent BIO
>>    and folio writeback implementation. Report synchronous and asynchronous
>>    device errors in the existing completion callback; fserror itself
>>    defers notification work and holds the inode reference. No additional
>>    NTFS completion workqueue or pending-I/O counter is introduced.
>> - Cover stale extent references, failed extent-record cleanup, mirror
>>    failures and MFT preparation errors. Resolve attribute-inode reports
>>    to their base inode and keep cluster-free counts in 64-bit variables.
>> - Split MFT reporting into two patches: metadata validation, allocation
>>    and recovery in patch 4; write preparation, mirror and BIO completion
>>    errors in patch 5. This keeps the two review topics separate.
>>    Shutdown reporting is now patch 6.
>>
>> Testing on this base:
>> - QEMU passed mount/read/write/fsync/truncate/xattr/rename/unlink, MFT
>>    growth and unmount without FAN_FS_ERROR events during normal operation.
>> - Verified EIO with a valid FID for file MFT corruption, EUCLEAN without
>>    a valid FID for an MFT bitmap mismatch, and ESHUTDOWN for forced
>>    shutdown.
>> - Fault injection of an initial mapping-pairs error followed by an
>>    independent restore failure produced a merged FAN_FS_ERROR event with
>>    error_count=2. Synchronous and asynchronous MFT completion failures
>>    also generated notifications. The injection code is test-only and is
>>    excluded from the series.
>>
>> Baolin Liu (6):
>>    ntfs: report allocation metadata errors to fsnotify
>>    ntfs: report attribute errors to fsnotify
>>    ntfs: report inode metadata errors to fsnotify
>>    ntfs: report MFT metadata and recovery errors to fsnotify
>>    ntfs: report MFT writeback errors to fsnotify
>>    ntfs: report shutdown errors to fsnotify
>>
>>   fs/ntfs/attrib.c   |  84 ++++++++++++++------
>>   fs/ntfs/attrlist.c |  17 ++--
>>   fs/ntfs/bitmap.c   |   2 +-
>>   fs/ntfs/inode.c    |  12 ++-
>>   fs/ntfs/lcnalloc.c |   4 +-
>>   fs/ntfs/logfile.c  |   2 +-
>>   fs/ntfs/mft.c      | 192 ++++++++++++++++++++++++++++-----------------
>>   fs/ntfs/super.c    |  32 +++++++-
>>   fs/ntfs/volume.h   |   4 +
>>   9 files changed, 235 insertions(+), 114 deletions(-)
>>
>> --
>> 2.51.0
>>
> 
> 
> --
> Thanks,
> Hyunchul


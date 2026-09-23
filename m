Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F3F41DDEC
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 22:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790201685; cv=none; b=U6gF1JxwOncnn5yIQo7/1rEXEl4Ct4J8i3+kfjmGCCCzLtkUYwlJEYQkR0tcgqwc1S5KgN/+Qkma+a/hZ4crOCf7qRPc6SeiLj+yxiiK8lB17Wkg04/RSL0NFhEYE5R/7wLz+o/1qbFoWpqjID4RvsyRy8pKEKiYGqEXZQA4uA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790201685; c=relaxed/simple;
	bh=9hyyX28oeoph3ynZDZOIhq81NPkDeMrwBFPPNTTwcUM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=I8jMNMLLq2m7hwObRgPUyDAxmaiklVcfgSowi3YgnPG3FN9xusRjoag8HL0hQA6rXkKbJbTity8QMstfSJeIEneUUnpa30U0Mju+7GDdj0EBWPvsGsjfybykLt+71VcLHVx55nUkin8UiKYKKdB/4VgOgSMxcWRo0LPdvmCL54o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F4ZDIe6Q; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F4ZDIe6Q"
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97ea1a712deso523054241.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790201683; x=1790806483; darn=vger.kernel.org;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0EdqxdNUP5cyv8NzTsTlmS03OnsakLNpJMwPNRa976s=;
        b=F4ZDIe6Q4QgkEdECQ2Ez9owwKXdYcOJaT2cDQlUQvq7ctqjQ1+AX6Plf7JFlDV+B1c
         KbsoblyCowTztzLiaeAG6pOLHBeqRv2t7neaYZHXOJMNfKp4cKzws7kejz0SQk8yJ2A2
         KDmULhdfz20DAgXzpM6w//jQh4CJwG1a4KaJkMokCVj0h/usdQadS7gO5Ip31au2v2Wm
         AzkyVdQQ/Zsw9uOYnEvDGRlX9HAvPV1GXh4d0zp1Q6VKZXTiLQ483X8y6huupT48umKL
         JmnZp8RYikJa5VTXqLbqefYvWPCOjdR1tnKoutBkYzo0lya7KpCZykCKMe/L/IghcWS+
         Jo0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790201683; x=1790806483;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0EdqxdNUP5cyv8NzTsTlmS03OnsakLNpJMwPNRa976s=;
        b=0ljpbM4tNC9qZAku32NtKEe+bSevzmDbW50BqhC7zmcRK4KbLyMm3fRyEolhLh/z9m
         x8Bpr2JDMaaFbdgLvSgiq/pGCSx+BnWxsRzHcmfW2UbQtXZV6A4H3rs1coj2Uax8jiML
         ksazDqbLSlzZKwvugmjgpJ8KDQZCy2HuRmmWNk+vYv4x3ZjiXRVcgHchhf+HLYH1OrFi
         vVRMXMp3KGez9XcAnA/QG9AMPbPwAjTFt1jIEm73yDBVuMCz42RISHAnrBvwE2FfjfFj
         NmbxOaVyuh4WtKLnTGQBwrdz08a0mM2B5RA+qjTd5kEQtX4p1+sUF5iXC+b3c2Ewwt1W
         p2Eg==
X-Forwarded-Encrypted: i=1; AKwUvBzms98RHEm2HAH75CEnXp9hpw0AeLo0VgbEwT18PANY0NSPDXGLXCvx8zB78ncsxpgbmKRvH86hG50g9E0=@vger.kernel.org
X-Gm-Message-State: AFuF++mXr2OqotSUvy/qs09fRkFVjoAyzm7iFN6UC6F1nmw3FlrlDWdw
	hLF+dsiFxF4L36Yt50c1T7k9ZvvpmCkT4p8Thw2QaQzu1XFrbeFfKWy9
X-Gm-Gg: AYBFou0LfIhxEnnTH5FJlzG4YWLij1vNiavtsdvCfFuRO4NrUKWUT/irbSb3vjK9NIr
	ZaIKRM4yMvzq4iHOdKQ17yLGG69kMeBsOx2wtV3JDVrQsD5S3Oc/YPpBAEb5GWvO4L3PslbBjTX
	0OcqrnBxgjqx3L7pQCeUDlVktMZmmXsQPdIUgymHkGywv6vAoG/mDwRnzVFFtBKEzNLVhbLYZKA
	kwb0+tl62Tiqf6HFsnyqnzSh1wKNZ9AhLUShzC9Qk53h2rufTsaiZzc0swWiriM807d1Ps6FhGT
	CcjbrDAqLiQO/FtbIgaCvfoXF0DCg2+b/FCLYoF3qdSX14KpgLoLazBoWr0KVawTK9/5ckVhflI
	1e45UGIKzXHpRvBmXWrQCJ9yWezcnhcX/ZPOi2vQYfr3fRWn1OiNnSzwolpbiKw44gFjxjXilOI
	iV97+vz+jmYPFcQswafXc1uNZyjldqetm/SP4j72OjZoFTDfv2e6koVL21CsqdxacfKyhGnutrj
	2ALzLNAOa0PBIzci7nz3Q5W48rXGM2kuSD4gPHKWrSBXOo3/BVTSv/BJOvDJvpKBHsR
X-Received: by 2002:a05:6102:508e:b0:7a3:833c:49a4 with SMTP id ada2fe7eead31-7af1eff6910mr462129137.26.1790201683185;
        Wed, 23 Sep 2026 15:14:43 -0700 (PDT)
Received: from bazzite ([138.122.221.5])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7abf5c6d7b2sm6071173137.8.2026.09.23.15.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 15:14:42 -0700 (PDT)
Date: Wed, 23 Sep 2026 19:14:21 -0300 (-03)
From: Davy Felipe <davyfelipe34@gmail.com>
To: Viacheslav Dubeyko <slava@dubeyko.com>
cc: Davy Felipe <davyfelipe34@gmail.com>, 
    John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
    Yangtao Li <frank.li@vivo.com>, linux-fsdevel@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hfs: handle extent B-tree write errors
In-Reply-To: <c569d5f8ee542e5c86a7e4dee23df99f4ec0becd.camel@dubeyko.com>
Message-ID: <44cf540b-6d33-845d-4943-6b65959730f5@gmail.com>
References: <20260920160213.285316-1-davyfelipe34@gmail.com> <20260922234039.1307375-1-davyfelipe34@gmail.com> <c569d5f8ee542e5c86a7e4dee23df99f4ec0becd.camel@dubeyko.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463806207-502084886-1790201682=:1721090"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463806207-502084886-1790201682=:1721090
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

Hi Slava,

Thanks for the feedback.

Yes, I agree. A small reusable check helper would make the code cleaner
and avoid duplicating the range validation.

Regarding hfs_bnode_write(), I also agree that its current void
interface makes proper error handling difficult. Converting it to
return an error code and auditing its callers looks like the right
direction for a follow-up refactoring.

For this patch, I will keep the change small, introduce the reusable
check helper, and send a v3.

I would be happy to work on the hfs_bnode_write() refactoring as a
follow-up as well.

Thanks,
Davy Felipe

On Wed, 23 Sep 2026, Viacheslav Dubeyko wrote:

> On Tue, 2026-09-22 at 20:40 -0300, Davy Felipe wrote:
>> __hfs_ext_write_extent() does not report all failures while updating
>> the extents B-tree.
>>
>> When inserting a new extent record, the return value of
>> hfs_brec_insert() is ignored and HFS_FLG_EXT_DIRTY and
>> HFS_FLG_EXT_NEW
>> are cleared even if the insertion fails.
>>
>> When updating an existing extent record, hfs_bnode_write() returns
>> void, so its caller cannot detect a rejected write. Validate the
>> extent
>> record size and node range before calling hfs_bnode_write().
>>
>> Propagate errors returned by hfs_brec_insert() and return -EIO for an
>> invalid existing extent record. Only clear the extent dirty flags
>> after
>> a successful operation.
>>
>> Fault injection confirmed both failure paths. Insertion errors are
>> propagated to the caller, and invalid existing-record writes are
>> rejected before hfs_bnode_write() without clearing the dirty state.
>>
>> Signed-off-by: Davy Felipe <davyfelipe34@gmail.com>
>>
>> Changes in v2:
>> - Validate the existing extent record size and node range before
>>   calling hfs_bnode_write(), following review feedback.
>> - Return -EIO without clearing HFS_FLG_EXT_DIRTY when validation
>>   fails.
>> - Fault-injection tested the existing-record failure path. Before the
>>   change, hfs_bnode_write() rejected an invalid offset internally but
>>   __hfs_ext_write_extent() continued and cleared the dirty flag. With
>>   v2, the invalid write is rejected before hfs_bnode_write().
>>
>> ---
>>  fs/hfs/extent.c | 13 +++++++++++--
>>  1 file changed, 11 insertions(+), 2 deletions(-)
>>
>> diff --git a/fs/hfs/extent.c b/fs/hfs/extent.c
>> index f066a99a863b..13426503fbb3 100644
>> --- a/fs/hfs/extent.c
>> +++ b/fs/hfs/extent.c
>> @@ -121,12 +121,21 @@ static int __hfs_ext_write_extent(struct inode
>> *inode, struct hfs_find_data *fd)
>>  		res = hfs_bmap_reserve(fd->tree, fd->tree->depth +
>> 1);
>>  		if (res)
>>  			return res;
>> -		hfs_brec_insert(fd, HFS_I(inode)->cached_extents,
>> sizeof(hfs_extent_rec));
>> +		res = hfs_brec_insert(fd, HFS_I(inode)-
>>> cached_extents,
>> +				      sizeof(hfs_extent_rec));
>> +		if (res)
>> +			return res;
>>  		HFS_I(inode)->flags &=
>> ~(HFS_FLG_EXT_DIRTY|HFS_FLG_EXT_NEW);
>>  	} else {
>>  		if (res)
>>  			return res;
>> -		hfs_bnode_write(fd->bnode, HFS_I(inode)-
>>> cached_extents, fd->entryoffset, fd->entrylength);
>> +		if (fd->entrylength != sizeof(hfs_extent_rec) ||
>> +		    fd->entryoffset < 0 ||
>> +		    (u64)fd->entryoffset + fd->entrylength >
>> +			    fd->tree->node_size)
>
> I think it will be better to introduce a small check function that can
> be reused then. And code will be cleaner here. What do you think?
>
>> +			return -EIO;
>> +		hfs_bnode_write(fd->bnode, HFS_I(inode)-
>>> cached_extents,
>> +				fd->entryoffset, fd->entrylength);
>
> I see that you are trying not to go into huge modification. But,
> frankly speaking, I believe we need the refactoring of
> hfs_bnode_write() calling. This function should return error code and
> we need to process this error code in other methods. Maybe, future
> refactoring work for you? ;)
>
> Thanks,
> Slava.
>
>>  		HFS_I(inode)->flags &= ~HFS_FLG_EXT_DIRTY;
>>  	}
>>  	return 0;
>
---1463806207-502084886-1790201682=:1721090--

Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD18441CB20
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792101214; cv=none; b=edAFrLOrweEwlxneMYd9z3OaYCMO8f6jKae1C7tYEt9Q8l/xdhBILS/hX9M93w1282kovj1bIqEwb8QGhcKdsZdUBa8Kb5XTNC1k27a3F2B4R65blrLAF0D7fEOOpHF8FZj/sNdpH5HhvFzgDpYzvHvFd7nZwvSpR8FGpdlkWuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792101214; c=relaxed/simple;
	bh=zCjxxsBd1lLCN9AtDXr7N1K+VmtxxJp0k9WMXBnArPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kAXyviS4AyJxHk0+NWezD8h9v7BZV00ZFP9rFiLi/kIT6DpvM4uiX5crOACIJhzpIn941jaAfy0p/1lF8Z/obAyrdeCFPU2SN+Ix0gDYT+D5yhhVeg9ymS+cXvVWo9fUGad2SiPC3u9A6GGteIlK9AWZzaQLARf99qZSXPDCiIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QkP48mJa; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QkP48mJa"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc7e79c1eaaso2705199a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792101213; x=1792706013; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mI5j2QSx7YHmNnf5OMmNmLr/+3VlhYuDRCjBR0r1XZM=;
        b=QkP48mJalop8w16T6xlM3Dva0ZiyLbNVoGEjSWRODeKAkxr2gKPbt62+ky7LX5uYW6
         DuLuvEWoFRFLoll2n0UemYoF//plZe9wAoprm1h5hrSY2iOTVBf872PJN5vW6/oJ5m6f
         LeXQ5y+qz6V5B1QEXYyUyUq9WBBgm8VfmII/R71OW4YXsLb9v34Yt5o9bnp5o5QFIBOc
         Bkuy10Mht0tzLKVw7Y7hf6Zol+S6yg2HNQSyoZ++J82HsiNBfs4SwhMgHZn5YWb8lxZ1
         pCpuJuJlbqsbJSK8JJce7UJknMIE2GzT93m+wjw6pgVAX4ZlAJKOhjG/Kgxb5QXCTvoV
         mkJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792101213; x=1792706013;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mI5j2QSx7YHmNnf5OMmNmLr/+3VlhYuDRCjBR0r1XZM=;
        b=yCSA2OOAJreLWc9DuAWTfh94EhX9OqdlyrbbvK4EbzK/yZxsycBrv5YFVw6qgddBTu
         Q4ptggLC6GMWEsYsP0h3W0W5oi08GvWaCmHUGGjkoRvSFhsQnMuH0rYNRiVOGX4BOceb
         5SGRXirqD6U9Udj9Vksqgy6zoP3dPlI0gwe1V7SwmURvBXL5pITxYkBR7dEyG+1qlYxi
         38WwAURsqZ0G5ae5ii0DTexWeeMUeknJSXXFZNpc+TmVLhSyn3FlwHy6CdLH/q+IOdEC
         9Err27YhLSHDn8YzwgI9Y5um9TCvLdqQSxpYa4xJRGSAvLb3qGg6QkmbXoAmSyUxUn5L
         jgAA==
X-Forwarded-Encrypted: i=1; AKwUvBx0ZQ4btAZf1ZaMwchHdoeafBy/S+4zyHB/F7oQHXT2Uu6yB2N0ikMv3vKhNRllGFR1Ox7xKmemAkU3FR8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIAY7s/6qXLoeIpAlruGrMS2MoHNlbQ2INKTCLoLnHmztfvrFgl
	izKWoeZgSbwFJiU17M+9xnCO0cKjGwusyq7CBF4rGrqcGMpNAxI4elZZbzDmXGw2oQ==
X-Gm-Gg: AYBFou07L/HrhFU2EF6jLPQ6Rvdu89R942dYP+EYUHvYkMDtpvVseLTHlrVvwm0pCjR
	T7kRpM0UmWXCiLQAYsrm8r+71ISpofUUHOD0o2W7Mt+ZN/++aVR5CrX82X1+0OdbjlUANPvPR0B
	KmfWHmSrcn26qVVrUTsS4AoLzZB6BJ1XAzbxL6mtnp6ylLBrehOPH21EahejOLQJiyxQgfwisy8
	Q8hqveWwJ2WhFaYLFjfHxDPWYV7sDGVDaeeHFCRewMlnnrzf3+B0IZeBlu/N4/ZG4uB2fq9OKVA
	6hxhuMd0caZVJkxD+JmLP0KTUBbzeweLNtNbbrS4GpgwTvcbsdWTBNVJy/ZJ08T++nnvUeGjd5H
	rFU9Kgu5Yd9jsPExMIO8+4TGVLQiP3XLlr/CTKoEP4qEG3XCDbi/CPNt944Jc9/EgGAND1GCjzy
	mgnxr0a/mXdZM/iHY4mqcEzW1nohDC8kZt8SJnZ7gWVaWL55m62HqMNnQjFSGxA/I1oMF0X2BzA
	f+gPSk7bU8JjQmV8dAZfGNf1KRNdnpSDx/TGNdyE2ymmw==
X-Received: by 2002:a17:90b:5343:b0:3ab:188b:c5bc with SMTP id 98e67ed59e1d1-3ab3a94f0dcmr16931016a91.14.1792101212423;
        Thu, 15 Oct 2026 14:53:32 -0700 (PDT)
Received: from google.com (64.75.127.34.bc.googleusercontent.com. [34.127.75.64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc48e8646sm865063a91.10.2026.10.15.14.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 14:53:31 -0700 (PDT)
Date: Thu, 15 Oct 2026 21:53:27 +0000
From: David Matlack <dmatlack@google.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org, rppt@kernel.org, shuah@kernel.org,
	akpm@linux-foundation.org, linux-mm@kvack.org, vipinsh@google.com,
	linux-kernel@vger.kernel.org, kexec@lists.infradead.org,
	pratyush@kernel.org, graf@amazon.com
Subject: Re: [PATCH v1 0/7] liveupdate: tmpfs preservation and early freeze
Message-ID: <atFLV3tT0s3y6zMp@google.com>
References: <20261015093816.2438942-1-pasha.tatashin@soleen.com>
 <atESAwf17pJ11S9U@google.com>
 <atEaPuWNOm5VLc7A@google.com>
 <atEhc20Zawj4D62x@google.com>
 <atE53vmlDeA4cWD2@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atE53vmlDeA4cWD2@google.com>

On 2026-10-15 04:38 PM, Pasha Tatashin wrote:

> What if instead of retrieve-into an existing file FD, userspace passes
> a dir_fd on the target tmpfs mount where the file should be restored?

This is good. This eliminates the pinning race and also eliminates the
checks v1 had to do on the userspace-provided file.

> During preserve we can record the file's basename if the file was linked
> (or mark that it was unlinked). On retrieve, creates a brand-new file in
> dir_fd (e.g. starts as an unlinked O_TMPFILE on that tmpfs superblock),
> populates all the folios and metadata while the file is still unreachable
> by anyone else, links it into dir_fd under the preserved name at the end
> (or leaves it unlinked if the original file was unlinked), and returns
> the FD of the new file to userspace.

I don't think the name should be in the ABI though:

 - Userspace already has to know what each token is, so it knows the
   name. And a basename isn't enough anyway, since userspace still has
   to supply the directory.

 - "The name" isn't well defined. A file can have several hard links,
   and it can be renamed or unlinked between preserve and freeze.

 - Linking in the kernel needs a policy for collisions, and linking at
   finish() can fail (or find the name taken) at a point where there's
   no good way to report it.

 - The name isn't the only thing needed to create the file properly.
   There's also the mode, the owner (fsuid/fsgid, setgid directories,
   idmapped mounts), default ACLs and LSM labels, the access mode of the
   fd, and whether the file may be linked at all. If we record those in
   the ABI it grows a lot.

What if we model the retrieve args on open() directly? RETRIEVE_FD
behaves like openat(dirfd, ".", O_TMPFILE | flags, mode), then fills the
file, then returns the fd:

  struct liveupdate_memfd_retrieve_arg {
  	__u32		size;
  	__s32		dirfd;
  	__aligned_u64	flags;	/* subset of O_*, ORed with O_TMPFILE */
  	__aligned_u64	mode;
  };

In the kernel this is file_open_root(&dir_path, ".", O_TMPFILE | flags,
mode), which goes through the same path as open().

Userspace links the file into place with linkat() whenever it wants, the
usual O_TMPFILE way, or passes O_EXCL to make it unlinkable. Then
there's no name in the ABI or the uAPI, no linking in the kernel,
unlinked files are just files userspace never links, and "don't link it
until it's fully populated" comes for free.

One quirk: open() rejects O_TMPFILE without write access.  With LUO
holding the file until finish, that brings back the -ETXTBSY problem for
restored binaries. vfs_tmpfile() itself doesn't need write access, and
neither does filling the file, so I think we can allow an O_RDONLY |
O_TMPFILE here.

> I would like file type to stay exactly the same, I really don't want to 
> play the game where LUO can magically change file from one type to 
> another even if from Linux internal implementation they share a lot of 
> code, they are still a different file types from the user perspective.

Ok, I don't feel that strongly. We should just do it based on the
superblock rather than i_nlink, so that O_TMPFILE and unlinked tmpfs
files stay on a user mount.

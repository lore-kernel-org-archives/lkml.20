Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795343B6C15
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792030345; cv=none; b=rNBKb0XQQ3jeddlYuWhQA/pgYEWW3OgVA6Y0u0CDbU4Q4sVQuCWdGb5iL6DUPOs9NGIegnv+lTifK2nuwG5eEOvdBrnB7UwwY95mSKypKuuYX2jCWXqN7MTfrNwoCPAkHrPZmDUDAImpn/TT72rkPeK5dJwjkuOQaKGRbhNa0fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792030345; c=relaxed/simple;
	bh=QoK/zoAXmRtFRGamOVPtuQjiMWOVJ+/JkUV5YTITKew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gtq+VrnLwuZSf5eMJFy9eNUgrzk0/hdpBHWfx50ptuJLTviT8O4jPHixwQLYqxqytERcF2HOi64JJFJH5aS7XKl3claJa+L3qknDtW/T9ri6Ad7AUz4yrXjRQjzl3IN/aNqGOMcrdW6dFsGr1UUSF+HPXC/MilwyDoufiv3T4rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=myVQQQc3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="myVQQQc3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 513E31F000C5;
	Thu, 15 Oct 2026 02:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792030341;
	bh=qMLHCJtJQPgffvNFPP52wXbusU89D1NMxKSfS6CjEcI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=myVQQQc3AkWg8Rs99ajie+H/9mSd02rYHqEaBv/AwUu4bxrQw/ajPX05cuK2vfb3U
	 9oPNrlp1fwHzufh2gcwcRZwnLVRDqJTXbcoeCLSZLkfqNZkh0TVMKeWvoa1vfwI3pn
	 mI5AmxAxBwOVOvLJo8BOHVyfDTesd1sn/9XzDbkIndYFbvC8hsi2UIlQAiMUhbWzd2
	 QDiyZ1ziCBIoSXyhsuN8cyttqdmwwNMAXXSSGkI/+/ZhKNSy1kaPfDF2/FkeJm6b5T
	 Ck+VCoXrKFdMsRCKtsX7U+Qm0Up5ZfBj61t4pqM4Zl5fu1clA1HcJRy+84CsaQMptx
	 zRtE005Y9n36Q==
Date: Thu, 15 Oct 2026 02:12:19 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "Kirill A. Shutemov" <kirill@shutemov.name>,
	Pedro Falcato <pfalcato@suse.de>, Harry Yoo <harry@kernel.org>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>,
	Matthew Wilcox <willy@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-mm <linux-mm@kvack.org>,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Improve page refcount scalability
Message-ID: <atA2g8OgpiNOiVL_@google.com>
References: <CAHk-=wjLjgfwgSZ1RDk4YdNFcV0ntosMO5AmBoHD76Zb3HFY7Q@mail.gmail.com>
 <as690Xcu7FxIDYjf@thinkpad>
 <CAHk-=wiak+h+d2tZ5W_MwRzatUP=hJKn7cpGjDxArG-gwgHLXg@mail.gmail.com>
 <as9-2cIuGuXwE2Oa@pedro-suse.tail5790ac.ts.net>
 <CAHk-=wgkoAuxNXga29nQ8w7GxdqR+4vPAUhPsbfp+gzKrb9EgA@mail.gmail.com>
 <CAHk-=whzkNzkBmCspHYd80D1Z=krDc4SgVC32=pJ5PtEgqSDrw@mail.gmail.com>
 <3c613725-406a-4506-b788-987a337b9771@app.fastmail.com>
 <CAHk-=wh+1Hz+3HJ8evmh=FKO1fCGiwuNTqArXEfe-tAJ6hDy0A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wh+1Hz+3HJ8evmh=FKO1fCGiwuNTqArXEfe-tAJ6hDy0A@mail.gmail.com>

On 10/14, Linus Torvalds wrote:
> On Wed, 14 Oct 2026 at 10:44, Kirill A. Shutemov <kirill@shutemov.name> wrote:
> >
> > I already have it:
> 
> So that was my thinking too, but I have my notes (from the original
> truncage/hole punch patch) about mapping_exiting() being problematic
> due to f2fs playing games with it.
> 
> Now, that's probably just a f2fs bug waiting to happen independently
> of this. But the path is
> 
> ioctl(F2FS_IOC_START_ATOMIC_REPLACE) ->
>   f2fs_ioc_start_atomic_write() ->
>     truncate_inode_pages_final()
> 
> and that truncate_inode_pages_final() is the problem - it's what sets
> mapping_set_exiting() on a live inode.
> 
> I had this as a note for the original branch, and it became a
> non-issue with the change to the "set PG_rcu_free on hot pages in the
> read path" instead.
> 
> But your change makes it an issue again.
> 
> Now, I think f2fs really is just buggy here. Calling
> truncate_inode_pages_final() on something that is still live
> afterwards is wrong - because it's not "final". As far as I can tell,
> there may still be hundreds of active readers holding that fd open.

F2FS_IOC_START_ATOMIC_REPLACE was supposed to replace a heavy ATOMIC_FILE class
in Android, consisting of 1) creating a backup file, 2) write data to the file, 3)
fsync(), 4) rename(to original one), 5) fsync(dir).

Indeed, it's a bug that user can see zeros between F2FS_IOC_START_ATOMIC_REPLACE
and F2FS_IOC_COMMIT_ATOMIC_WRITE. I think we need to move the truncation path
into the commit phase and use truncate_inode_pages() instead.

> 
> I might be wrong. Adding Jaegeuk to the cc.
> 
>                  Linus

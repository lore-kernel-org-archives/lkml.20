Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB153C4B79
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 18:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792088644; cv=none; b=fdvFyMFuhiEzeCsx1iiuongc2jf7M91YfnCqW/yoEUZnxyW+yBaVNhM833Xm54Ly2rc++zESLPK0HfmCxcFgSGycufdRaXMJUKAK5YIajdXhTy8kK5ekEUEzvYUWooEhY/Gfmo/ibEF7zw7ct71W0W8OPA9PGopXcUy2LIc594M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792088644; c=relaxed/simple;
	bh=KvUS7pCYTO68kn3TChBVqEyQS+KtyiMD4/u2I7iZyeA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sjKBTUwGcyv4jpRUciAyfs/VL7oeLhUhybhEbUHKP2scb9j5Gt7WtI0QdHKVOFtwAueCo3kWwzqnMmVKi/wjbof9hfXlBimH8YQMhNoWEOE6rI0a1MDiNLge5sbb3uq3nwyg2A/w6A531F9a4wKfBlNs+4B/dJrD4vE/17ddAdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=R/z66Xzh; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="R/z66Xzh"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5e931215e5fso643584e0c.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792088640; x=1792693440; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fejDPgUdb/iOyoCqBL5K47RANMeJV8pAF9VzuVR2mQg=;
        b=R/z66XzhKOj4LjE2SnwCHtn5tAjQ/4TuVvHIEYQ0tGvaFOB69GjrAaT7XZMrRYAzvE
         ZxhCpq59feuqYP0LFIfiWb1NElgSu93PhHAgeVzeXi18zQfUjA8EyoqqeyZzLZ24PK9l
         T0Fv7gnlFeNTPScZa/w+9tjq/NQpNYm1fECZEmjqJbeCbfow+52Mx2XhUYy4KD4v9PZF
         LiWV3HkqdLt99eA0dnv4VWFPNJw+8zWxwNwOuhP6G6s8Tv2GoyUHoQKdwiHhwZm0vCgF
         Q37jkeP3yi57u/iWR4H3X6C9dwsUiXj4r990Z80j6uzeDiG6C8Ddhz/Yis6ajtJPEWxX
         GE8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792088640; x=1792693440;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fejDPgUdb/iOyoCqBL5K47RANMeJV8pAF9VzuVR2mQg=;
        b=NPnESW7qQ1IkwY9gUbheW0dwVQ6YkzmuIE8c0jHVICh7TsxavUN9ZA6gQVEDuZtBf6
         BXfBuDBEAiRTRbmR527dWkhGbOnG7jFLnNxiWhs0ctCRGz4DBGcvVxMwrZNwi3P9ZPGJ
         XSIj8YFLSIwf0WhaMn8WpfiHe1QUZVfD4ENsi/uCMchy/P9iZ65IMHghLADj482CUYlj
         KaQhqr5mUVNyoxUxBeeS0eFbzRkawpCS6/Vq1hiVh2KbvkQ/jmt8IVicwpltqQZkGa20
         zAgIm39Rmf7XVPC2qWA9QTqL2t6mLT9LVaDQrHU0sK2jNX4hZSpNl5YBt2/7rJn54Bxg
         KUQQ==
X-Forwarded-Encrypted: i=1; AKwUvBx7ngZUVnvB3ai8+95jt8X3dmIjfx7u2y2I6J4Sh6biIoD0XZOAL1YGtdHT8m8VRdZ0KCSdfjCkpXIy0TY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJx+FKK2OiGkYZGmqUQ8UfvvcouA01H1Gfz4nHZyG8l+fpXZh3Y
	cch5nbqJXBh8z6LbGZuKHasZRXda9ct8g3ETIHuW6xlgaxHKp3EH5NSpe1Yfb6FoxMzQ5dns9Fu
	s+JZ1
X-Gm-Gg: AYBFou2lSzpf3TAKWSRwLjtBCEv8WHro/lx4hn9HMyTr8YOdsK9hqXAnWs4bgezpUwW
	7lSLR/W5qB3ZHTId/SXG7u64ZkTswvLKzTjLxjnDmcUg33cdAHwBOHgGh22V11Rlr8J7WuGvGNN
	qb+SVqor+qVdxp7+5jaVRBErgYeuuoeqy1fj4QcjIwj6PQyI84FPqohAZ787jdI+ywhxLIZlK71
	IR8Uq0X9KfAYnIIS9C1n/PuvhoCTk97fAQzMEZ+sTC3auaaidNMv3ltiGM8ZBoHxjPars4/BRz7
	SCOV/Ju6wHK0z0LIhRWE4JMRY/AMlr6fLUvfF0dmLJEyUOuhxAfwk7nqkkpnoCeiI2Fu7oGqB5E
	eNs06MXgBHd4oRJHNETMwkfwhQqslYyzqop/vk/jzY/Qg3ereiXnMaqYaClcTz2rJRVHSlV7YyH
	XWDxaKdA6X8oj+RGNaDWkOUC6/3bZ+JzkEJTbN1nSR+f7MLlOZIBI2P/znoz5aibDlzw2X9ClCv
	H+xGMFAYmBoUxqu86J4j04fKNWbrDIsZVT4Sst4oGl9RFoelJNoXeiKPeisMZJY3TPImkOSTnXl
	Bvjpn0c2Vw==
X-Received: by 2002:a05:6123:91:b0:5ce:b65d:22c4 with SMTP id 71dfb90a1353d-5e91f51f7d0mr7511976e0c.16.1792088640045;
        Thu, 15 Oct 2026 11:24:00 -0700 (PDT)
Received: from google.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9943d7ffsm331215e0c.3.2026.10.15.11.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 11:23:59 -0700 (PDT)
Date: Thu, 15 Oct 2026 14:23:58 -0400
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: David Matlack <dmatlack@google.com>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>,
	linux-kselftest@vger.kernel.org, rppt@kernel.org, shuah@kernel.org,
	akpm@linux-foundation.org, linux-mm@kvack.org, vipinsh@google.com,
	linux-kernel@vger.kernel.org, kexec@lists.infradead.org,
	pratyush@kernel.org, graf@amazon.com
Subject: Re: [PATCH v1 0/7] liveupdate: tmpfs preservation and early freeze
Message-ID: <atEaPuWNOm5VLc7A@google.com>
References: <20261015093816.2438942-1-pasha.tatashin@soleen.com>
 <atESAwf17pJ11S9U@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atESAwf17pJ11S9U@google.com>

On 10-15 17:48, David Matlack wrote:
> On 2026-10-15 05:38 AM, Pasha Tatashin wrote:
> > This series allows preserving files in tmpfs via LUO to survive across a
> > live update, and allows userspace to decide when to freeze a session
> > instead of delaying until auto-freeze at kexec time. Once userspace is
> > done with a session, it can freeze the session immediately (and across
> > multiple sessions in parallel), reducing blackout time by not postponing
> > this operation to kexec shutdown where all sessions are frozen serially:
> > 
> > 1. Early session freeze (LIVEUPDATE_SESSION_FREEZE):
> >    Currently, LUO sessions are frozen automatically only inside the
> >    reboot(LINUX_REBOOT_CMD_KEXEC) path, where luo_session_serialize()
> >    iterates through all outgoing sessions under global write locks and
> >    freezes them serially during shutdown.
> > 
> >    Add the LIVEUPDATE_SESSION_FREEZE ioctl on session file descriptors so
> >    userspace can freeze a session as soon as it is done with it (and freeze
> >    multiple sessions concurrently, since luo_session_freeze() only acquires
> >    the per-session mutex). During kexec, already-frozen sessions skip the
> >    late auto-freeze step; if an early-frozen session is closed before
> >    kexec, its files are rolled back via .unfreeze() before being
> >    unpreserved.
> 
> Thanks for putting this together. I'm on board with driving
> retrieve-into through a per-handler argument instead of a LUO-level
> flag. It's what Pratyush suggested on the RFC too (sorry Pratyush, I
> never replied to that). I still need to review the actual patch but
> I think the idea is fine.

Yeah, Pratyush and I discussed this at LPC. I've been using this extra
argument in my cpu_preserve series to launch jobs at a given entry
address on a preserved CPU, and figured it would be a useful, generic
interface for others as well. So I decided to send this series now to
reduce the extra infrastructure I carry in my cpu_preserve series, and
your tmpfs work was a good reason to land it now :-)

> However, nothing ties the arg struct to a handler, it's interpreted by
> whichever handler owns the token. At LPC we discussed letting userspace
> pick the handler in PRESERVE_FD/RETRIEVE_FD, so that it controls which
> one is used when more than one can take a file. If we do that, the
> handler name would also be the natural key for which arg struct is
> expected.
> 
> > 3. Tmpfs file preservation and retrieval:
> >    Using the file handler retrieve argument, extend mm/memfd_luo to allow
> >    preserving generic shmem-backed tmpfs files (not just unlinked memfd
> >    pseudofiles), recording MEMFD_LUO_FLAG_TMPFS in
> >    struct memfd_luo_ser.flags so that preserved tmpfs files must be
> >    retrieved as tmpfs files and preserved memfd files must be retrieved as
> >    memfd files.
> 
> I've been working on a v1 of the tmpfs preservation since LPC. v1 fixes
> a number of problems in the RFC that I think this series still has
> (sorry for the wall of text, it is LLM-generated):
> 
>  - Failures that userspace can fix lose the file. The folios are
>    restored, charged and added one at a time, so if the target's mount
>    is too small (ENOSPC/quota) or the caller hits its memcg limit
>    partway through, the target is truncated, the folios are freed, and
>    the failure is permanent. Only bad-argument errors are retryable.
>    v1 restores all the folios first, charges all the blocks and memcg
>    up front, and adds all the folios to the page cache or none of them.
>    It keeps the restored folios in private_data between attempts (LUO
>    needs to pass private_data to .retrieve() and keep it on failure),
>    so the only permanent failure left is losing the KHO state itself.

I think the current behavior is fine: if the file doesn't fit when
restoring, I think it is okay to lose the file permanently. We shouldn't
keep preserved data around in private_data once we have started
retrieving folios.

>  - memfd_pin_folios() doesn't require the inode lock, so iommufd can
>    pin folios of the target while they're being added or truncated
>    away. v1 starts with two patches that make iommufd take the lock
>    and make memfd_pin_folios() assert it.

Hm, isn't this mostly orthogonal to the change we're making here?

> 
>  - The target has to be opened for writing (FMODE_WRITE). Since LUO
>    holds a reference to it until finish, that means a restored binary
>    can't be executed until the session is finished (-ETXTBSY). v1
>    instead requires mnt_want_write_file() and file_permission(MAY_WRITE)
>    under the inode lock, like FS_IOC_ENABLE_VERITY. That also rejects
>    immutable files, which a fd opened for writing before chattr +i
>    doesn't.

Ah, good point.

>  - There's no file_modified() or fsnotify_modify(), so setuid/setgid
>    bits aren't cleared and timestamps aren't updated. The normal write
>    path does both.

That is true, though I'm not sure fsnotify_modify() is really needed
since the whole file is restored at once and I doubt anyone is watching
for modifications during restore (clearing setuid/setgid via
file_modified() makes sense, though).

>  - f_pos is set through fget() + vfs_setpos() without f_pos_lock, which
>    races with read()/lseek() on the same open file. v1 uses
>    fdget_pos(). (Sashiko called this an ABBA deadlock. I don't think it
>    is one, since vfs_setpos() doesn't take the lock, but the race is
>    real.)

Right, this was reported by Sashiko; I haven't looked into it yet.

> 
>  - Early failures leak the preserved folios. The seals/flags check
>    frees ser and records a permanent error, so .finish() skips the file
>    and the folios are never freed. Sashiko flagged this as well. The
>    new MEMFD_LUO_ALL_FLAGS check adds another way to get there. In v1,
>    early failures don't consume anything and aren't permanent, so
>    .finish() cleans up.

We originally agreed that if retrieve() fails, we fail permanently and
leak resources until reboot to avoid memory corruption from ongoing DMA
activity. However, now that we have the retryable option, we can start
relaxing what is considered a permanent failure vs. a recoverable/early
failure that .finish() can clean up.


>  - If a token was already retrieved, luo_retrieve_file() returns the
>    existing file and ignores arg. Userspace that asks to retrieve into
>    X gets success and an fd for a different file. I think LUO should
>    fail with -EBUSY if an arg is passed for a token that was already
>    retrieved.

Agreed, if an arg is passed for a token that was already retrieved,
failing with -EBUSY (or -EINVAL if the target file doesn't match the
originally retrieved struct file) makes sense.


>  - Sashiko's WARN_ON(liveupdate_claim_file()) report on 3/7 is valid:
>    xa_insert() can fail with -ENOMEM there, and userspace can trigger
>    that.

Yeah, we can address that.

> One place our series are not aligned is MEMFD_LUO_FLAG_TMPFS. My
> thinking has been that RETRIEVE_FD should support retrieving into any
> shmem file (including linked files, memfds, and O_TMPFILE). It is
> userspace's choice at retrieve time. The only thing the kernel enforces
> are the fundamental requirements such as exceeding the file's mount's
> limit.  When I think about it that way there is nothing special about
> retrieving into a memfd and MEMFD_LUO_FLAG_TMPFS is just artificially
> limiting how a shmem file can be retrieved. WDYT?

I do not want LUO to change the type of a preserved file across live
update. Take seals, for example: a memfd can be sealed with the
guarantee that it will never be modified, whereas a regular tmpfs file
does not support sealing. Allowing a preserved memfd to be retrieved
into a tmpfs file would create a loophole to strip seals (or bypass
mount/superblock boundaries). I strongly prefer keeping the file type
strictly the same across preserve and retrieve.

> One last thing is my v1 also comes with a dedicated tmpfs selftest with
> much broader positive and negative test coverage that I would like to
> land (things link O_TMPFILE and read-only targets, executing restored
> binaries, exact block accounting with statfs() and st_blocks, including
> large folios that extend past EOF, etc.).
> 
> Maybe what we can do is keep your 1-5/7 patches and I'll rebase my v1 on
> top and send that as a replacement for 6-7/7?

Sure, please go ahead and send the new version.

Pasha

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384806;
	b=2B/xYudEVKGpiNCYqVo9yDygOi71qdY++A4D5bzAX0YX8vmyGrlvdMVrW2pdTcyoqr7h
	 bVamFDfIOyU/LZOVXxyGL0b1ZF1R77i93uFJMR9Q48jR8gLRAe0YNPWydk737qHoGxDKD
	 Ar/aMzjkbqJBC/gdcXvYhUefUJtMO4BcdelAQuwK71N2NyqC0xn+X/P9iaGj84OXfekyZ
	 +EbHX1nPWWMwGdrLAlrvbeMenBocC8l/fmObFKzIKa7TVAvM9jKjy4IfqacSFfSMHoHqg
	 sdEyfxwtV+/WonQLJa6+ikRODpkL1UM7DfVALGz4Zypiv3wAw4AHAqztc/oOS196NbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384806;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=DgQI3xxkFFA7BhKNt2RfO4arKL4tKgGT+HlK8U19YZw=;
	b=aUa7S14Sw5u8sqJ1kDkFT5Xv+sFVZMvgNzw5ezy7DUgSbVggpaNQi4+WPhuRsdn1LibJ
	 IzYR8OxXZTr8AkzU7r9OaD3B7lDa/aXloKXZE1nXC7p5BdUGUswohyrJu1NfpLydcekiW
	 46ibt0nfGrQimsHNXjYl8dwJaYCMC1/agwx3/JsvIwf5n+WXCmfS8iQZnYMTpWM2uMW+w
	 mu8cHs/7ZkSq1w7Pi0V7bBSz0M+GhgmlijJ1ilN9OtoXmz8NjOvaI9eCdQcbCqbxGwwTm
	 oei+8ZLvmsPIjUqr0t6GpUzdTNbBZpz9UAl6lN1K6kizP4B9o90tpqdASpcK005ajcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=HFeXLgVM;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FFE60A2605
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:13:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34FFE60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=HFeXLgVM
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c50692e6c0aso1922566b.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794384804; x=1794989604; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DgQI3xxkFFA7BhKNt2RfO4arKL4tKgGT+HlK8U19YZw=;
        b=HFeXLgVMBpTERHWDiSovZQXILqXdD0gpZ6s6i9Hv+LCjsrbc0lGXS/qto+UBNWe86X
         1XoFkqRfAiiGpWYmGh3xxPXoJqCMj/9maoc2qPS3CO2BwIHsp5XkD+MmV3Kl8KkWs6ls
         4MGbfG15/WA1l8grvJIBuLg5XmI1a7v7NnNkaZwV3Pd2gINGzmUkZoEkHP7c03qQ6AMy
         M7G8CGoF9Kl4dTAgt1NRKZCbbvzegKNWSb/4DoMlBbtNHyxtFdc5s6F/ysM0MA+nczOS
         0InufqTdtN9g/DKr2RXNzJJkTCf1lViyC+SE76K69X/IayGP0abaXc/0pwQ1ld3FI6R2
         AMog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384804; x=1794989604;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DgQI3xxkFFA7BhKNt2RfO4arKL4tKgGT+HlK8U19YZw=;
        b=FclXkkD7pk5usM63cyw9/AKQxRuHA0V4yko/MJchINVjQbIn+pG6fwoYJ44kB4XCTG
         EW9BIp4nJ3d26sEqSEBegWvDDvPyF9+zML7fT5kdHi1OeMXzunK5XA3xdgpCXDLW9Ji3
         y4u7sUWx54Z7BFUo+kn4EMpwYd0d3JM34ktfOnDxnPQcOI+W2R7NZ3EyAZrGnPTFk/1b
         FoDicMzcIi1Im0IyiRzWD8Nd7cOzCExvolShzjFP3+v8zHLW08q9p3JihY+ZRSUvQApc
         /dVO5ZvVtIkbxreFTa+XnUUWWeys50cI/KRyi/8Sw8wcL4wvwGe7BxCw0H2hsSIRYbG+
         WgnQ==
X-Forwarded-Encrypted: i=1; AL+hErGIqg1sBsFvfTySfV9xlKXBpZXmIg/0Ob0pYc8BBPsfUpRsfuvLLT7pXV2UEoQRn4xM6FhaDcHPHRk9DXM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/m1qPRdM1dWL+0gYE9iNkpUfPfwLTv/5/XFs+afbCPyF1hxICP
	5T38iVIZBODhX7Vlq/ajoBe48tveKPBV6R/IgZLpklnP4DUalqOZ3b1zuwXs7LtqzlI=
X-Gm-Gg: AYBFou3V49DiY0vpY5YPjazRancZ2kzWc2zoMahcTJfXqwGUcnqYbBuFN1LbIOTPGnc
	45z7YtzpPH4oYafG9dLvghKQHAkR//OJM+BIkwWdW/A79DYbP7EHQoytEwJb3ZSEynGG6sILsZU
	t75gqmDQV/oiKt68mOimEYcKoOBQtOzuZZCCq+wO7KJMKgEfc+5sDggRMspcy0iX0pGkxgz/h/4
	0FtTJDy7EeH63yRpbCt5S4ZUMQ8kh6sHt3Fllga4R4ogzFM93bdmiQfiVEgZh/8Bw1pnc8euZEC
	wwIjjSVKH61Fecx9fLiLGbMU3RNK7dxOOsF/XSQBmcAm/AF0naHzOPMOzJ8BtGlTPUid3ktvG9C
	Iw2OaL/N76ZeucVHNKD6vxzWrTcG/WjAtoKY21XSi06sBe8xidYVQpqWLoOFPA40a5PQuRH9YY8
	cPsm/ddXPCrLEiG+HiD3BOpeGhAYsRtSST6xfpHermyxnFu7o6BKFq07hqpi4IpodaA81rL08VR
	hlMs7qtQHoPoIeStHAdkOSv+PlLWVdrt5WFehhqNkf4Opl4Ctic4V6wAP5mP6EP+6sUldzUjf2F
	p2qTDEbwd73d94j0UGZYeWD+qnT+0TRzBvM=
X-Received: by 2002:a17:906:3ce2:b0:c4d:1768:48eb with SMTP id a640c23a62f3a-c5066ae6ba4mr117518566b.2.1794384804465;
        Wed, 11 Nov 2026 00:13:24 -0800 (PST)
Received: from [10.202.112.30] ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaa1b27cdsm1775739b3a.19.2026.11.11.00.13.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 00:13:23 -0800 (PST)
Message-ID: <a5576744-0984-462f-8f85-aa71151b277c@suse.com>
Date: Wed, 11 Nov 2026 16:13:19 +0800
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
Subject: Re: [PATCH] ocfs2: fix kernel BUG in ocfs2_page_mkwrite() when
 write_end fails
To: Zhiyuan Zhang <zhiyuanzhang912@gmail.com>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, Mark Fasheh <mark@fasheh.com>,
 Joel Becker <jlbec@evilplan.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 yangwenfang <vicky.yangwenfang@huawei.com>, ocfs2-devel@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 syzbot+42984127d45ad96219de@syzkaller.appspotmail.com, stable@vger.kernel.org
References: <20261111023444.22688-1-zhiyuanzhang912@gmail.com>
From: Heming Zhao <heming.zhao@suse.com>
Content-Language: en-US
In-Reply-To: <20261111023444.22688-1-zhiyuanzhang912@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/26 10:34, Zhiyuan Zhang wrote:
> From: Zhiyuan Zhang <zhiyuanzhang912@gmail.com>
> 
> syzbot reported a kernel BUG in the ocfs2 write fault path:
> 
>    (syz.0.17,5578,0):ocfs2_write_end_nolock:1945 ERROR: status = -30
>    kernel BUG at fs/ocfs2/mmap.c:106!
>    Call Trace:
>     do_page_mkwrite+0x147/0x310 mm/memory.c:3879
>     do_shared_fault mm/memory.c:6145 [inline]
>     handle_mm_fault+0x1a53/0x3750 mm/memory.c:6943
> 
> __ocfs2_page_mkwrite() calls ocfs2_write_begin_nolock() and then
> ocfs2_write_end_nolock(), and uses BUG_ON() to assert that the latter
> returns the full length.  But ocfs2_write_end_nolock() can fail: since
> commit 7f27ec978b0e ("ocfs2: call ocfs2_journal_access_di() before
> ocfs2_journal_dirty() in ocfs2_write_end_nolock()") it gets journal
> access to the inode buffer again, because the handle may have been
> restarted since ocfs2_write_begin_nolock().  That fails with -EROFS or
> -EIO once the journal has been aborted or jbd2 has seen write errors
> on the device.  The syzbot reproducer gets there by shrinking the
> backing loop device to zero with LOOP_SET_STATUS while writing to a
> shared file mapping.
> 
> Handle the failure instead of crashing.  ocfs2_write_end_nolock()
> leaves the mmap folio locked, because ocfs2_unlock_folios() skips it
> when w_target_locked is set so that it can be returned with
> VM_FAULT_LOCKED, and do_page_mkwrite() does not unlock it either when
> ->page_mkwrite() returns an error.  So unlock it and fail the fault;
> the faulting task gets SIGBUS, like for the other errors in this
> function.
> 
> For an mmap write ocfs2_write_end_nolock() returns either len or a
> negative errno: inline data has already been converted to extents by
> ocfs2_write_begin_nolock(), and copied is equal to len.
> 
> The BUG matters for local mounts, where the filesystem is expected to
> go read-only and keep running after a journal abort.  On clustered
> mounts ocfs2_abort() panics the node anyway as soon as it notices the
> aborted journal.
> 
> Fixes: 7f27ec978b0e ("ocfs2: call ocfs2_journal_access_di() before ocfs2_journal_dirty() in ocfs2_write_end_nolock()")
> Reported-by: syzbot+42984127d45ad96219de@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=42984127d45ad96219de
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-fable-5-2
> Signed-off-by: Zhiyuan Zhang <zhiyuanzhang912@gmail.com>

looks good to me.
Reviewed-by: Heming Zhao <heming.zhao@suse.com>
> ---
> 
> Notes:
>      Testing: syzbot C reproducer in QEMU (x86_64) on a defconfig-based
>      kernel with KASAN, lockdep, DEBUG_VM and hung task detection enabled
>      (not syzbot's own config).
>      
>       - Unpatched: BUG in 3 of 3 runs, within 22 iterations.
>       - Patched: 437 iterations over 3 runs hit the failing write_end 21
>         times (11 x -EROFS, 10 x -EIO), all ending in SIGBUS, with no BUG,
>         KASAN, lockdep, DEBUG_VM or hung task report.
>       - Negative control: without the folio_unlock(), inode eviction hangs
>         on the locked folio in truncate_inode_pages_range() in 3 of 3 runs
>         that hit the error.
>      
>      Not tested on a clustered mount.
>      
>      AI assistants were used to analyse the report, to write the patch
>      and the changelog, and to run the tests above.
>      
>      ocfs2_dio_wr_get_block() has the same BUG_ON(ret != len).  It is left
>      alone here because the pending "migrates ocfs2 DIO from buffer_head to
>      iomap" series removes that function.
> 
>   fs/ocfs2/mmap.c | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/ocfs2/mmap.c b/fs/ocfs2/mmap.c
> index 6c570157caf1..1c03f45e8965 100644
> --- a/fs/ocfs2/mmap.c
> +++ b/fs/ocfs2/mmap.c
> @@ -103,7 +103,17 @@ static vm_fault_t __ocfs2_page_mkwrite(struct file *file,
>   		goto out;
>   	}
>   	err = ocfs2_write_end_nolock(mapping, pos, len, len, fsdata);
> -	BUG_ON(err != len);
> +	if (err != len) {
> +		/*
> +		 * ocfs2_write_end_nolock() keeps the mmap folio locked so
> +		 * that it can be returned to the VM with VM_FAULT_LOCKED.
> +		 * On failure nobody else will unlock it, so do it here.
> +		 */
> +		folio_unlock(locked_folio);
> +		mlog_errno(err);
> +		ret = vmf_error(err);
> +		goto out;
> +	}
>   	ret = VM_FAULT_LOCKED;
>   out:
>   	return ret;
> 
> base-commit: 067c5c24cef23d913b67eaaf71ae67e7169a6620


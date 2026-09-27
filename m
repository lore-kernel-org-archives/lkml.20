Received: from mail-oo2-f39.google.com (mail-oo2-f39.google.com [74.125.231.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271D23B6371
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 02:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790477248; cv=none; b=Q7Pnv02i1USlRI5at5aIa0C5VzYIwvK+i3rlCPNXgIb+xOkfwyXBDQ84JFRbt7tlpltPGXpZqg8J5UHay87893qarlXqSZdarqvFmLWtmLvM/bsR3XxI33VEUej+oWJltX/XI7oPSqqdI787AkMXkEMX2ey2WcrNi5lXKh13UpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790477248; c=relaxed/simple;
	bh=sw1FsZk3EXWJSZs1rgYit1v3sgrB+52CTgcM/JeRkS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FkbgiNzjiUaN4dZdFfBJGxIC8mJHFWxwW3e5SvHxnqIHN3Wi431+n197QvY34YtpwLo/eu4a0h2++r4LLCQZo3HtBbnH0Why/WIKMhrrkMw7VVBeLkwRDZUglaAElvT+EMNVpo3wetxeonQxZI5OCiFfOSuqn+xaRyrHVXr1oMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NXmw60ZT; arc=none smtp.client-ip=74.125.231.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NXmw60ZT"
Received: by mail-oo2-f39.google.com with SMTP id 46e09a7af769-8167e0d1f90so1323915a34.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 19:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790477244; x=1791082044; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GBbvPJsBSWZjdVvkKhQVMvVffAad735JPJh2cGJmwo0=;
        b=NXmw60ZTkPfjTHSYZrdrUztbze+i2DL8ptGE4+KxgnOiIbPFij0M8+LYt+V0S1femP
         /tPrBLsbArNSZrqykexvoWsY26DIFWYaL75LpIlnYze4pFfH7ebgXX1St69zLkDR/Pk8
         zw77sIrTOX6klrfopFPEQXpewLIP1Z6z+8au+ChTS2ODwAZzBJdPD62v2h0ZFJsBVctb
         +lwmksB2ucwrB0oSNvqrD2oMloXSsKdo6d4UrEsCn5VSTq0H1fB+qUznMql3ixyppsMm
         tGAYBMX+KOXVEnOBNtPVqFAzXElMeFmyiKdgRTbzvzd+vDdoWasCXJcGVKxpdJtK6jh3
         cHug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790477244; x=1791082044;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GBbvPJsBSWZjdVvkKhQVMvVffAad735JPJh2cGJmwo0=;
        b=qUCUruOmn7rYglVoxd1XnlhqfK+jYqj5J/APlSb8JOgOBJcJE2FVA0GXKoqauUPrxg
         OblKsc+tPkZQQkpblSCv2rK3qjgdYf22B64Clabm3zjYyprYZGK74TSa42sgUZBMj/9i
         AdImKeK7Arg5IkZ5XArGNzQqZxyV/80lIDquzTFcEE3KcRcEWMryNYscKy9zNNm5+u6h
         0xNYXzjBiXUkBKEfgYYRqbmNx5N/QppdqFUND06qwJIpkA4PI6l82qp9ew+8fmiPPRHc
         1n2Uaku5RWtvZtelq7lCpGu32O712ZII4DRvG+0GeMUCjQuQMzviDldIQsLuGlkinp9a
         L0aA==
X-Forwarded-Encrypted: i=1; AKwUvBxklylDokr6ikvqh/SdDo5RaWKYtsHTd+6bPzfB09xMGaB4IqiptQIfeg3QVkPQ2gRAETCjJWe1DFjmWMk=@vger.kernel.org
X-Gm-Message-State: AFuF++lnYs1vsDNHKXOCgu9T6jwsnhS1BZfnGyKlVnXkJORG4AM9TbWx
	ZA4b8jwIHXIT/W7lJb/U6pz93+VP1WXWFsC++k6CTDOH7jNBD6s735+i
X-Gm-Gg: AYBFou3Kzm2XP9a+B4zTxA4dmZT1tyHrIlm26iXr3LY9hSlrN0ns1/MGR5v+NjvguNB
	dYsPtGfjqZ5+kz5uS2wTLusVTnnfXVE2nI6857ZeKTiCe+RmJJsFa+sZD+OlDGKRZkrNq1YqN5n
	7tzZyvA7RJLmg+QO13btA33Za9uafOMZbTflBvhjPMbnITKnDIsZC0TPM/iRj1yS7xEF1OaurfY
	DXETkWv7DywiQJkGVnJb7b5Rg19pzkS112AGffs+UkRpSvKk94hrAc6ZTVSs6UocQJQb8poWxjW
	6NVWiYdORYMvGBzwhzaryyRpGrKZZSoDJEQBlE+h+izCj6h02faHZFVFTAfFUZ/w9MAIsh1EtXn
	b2HpiPxIlvAclfLrHdnLylxZ7QvAhSG24krMC1F8dbNt5atMeMYwTcFMq20E4IVmhknnum6RH7B
	nBZUXH55mpIw64W30+N09OaFaoq084lw78Q6j2TNDdt61PYif2fharVgSJqmsqqhfz5gVqSkJyr
	B/Rh2h59EAjCzX4QL7fk10/cFTBukn8/BTvaH2LDafAup0wGj4hYXyhuAYVNBNyEa+G0s0loAsw
	P8CFK0ckjM8Wibc=
X-Received: by 2002:a05:6830:6686:b0:7f4:edd8:b7eb with SMTP id 46e09a7af769-81780d976d8mr11093358a34.6.1790477243868;
        Sat, 26 Sep 2026 19:47:23 -0700 (PDT)
Received: from fedora-laptop ([172.245.82.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-818e33f6714sm6626099a34.0.2026.09.26.19.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 19:47:23 -0700 (PDT)
Date: Sat, 26 Sep 2026 21:47:17 -0500
From: Ming Lei <tom.leiming@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, tglx@kernel.org, mingo@redhat.com,
	peterz@infradead.org
Subject: Re: [RFC PATCH 00/15] io_uring: thread identity handoff for blocking
 inline issue
Message-ID: <ariDteQPQ7BGtZZW@fedora-laptop>
References: <20260911154148.644489-1-axboe@kernel.dk>
 <arfs_kX_gkH1o_S-@fedora-laptop>
 <0367c089-a2da-42ad-ae9f-fc61dd220d1a@kernel.dk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0367c089-a2da-42ad-ae9f-fc61dd220d1a@kernel.dk>

On Sat, Sep 26, 2026 at 04:06:02PM -0600, Jens Axboe wrote:
> On 9/26/26 10:04 AM, Ming Lei wrote:
> > On Fri, Sep 11, 2026 at 09:40:50AM -0600, Jens Axboe wrote:
> >> Hi,
> >>
> > 
> > ...
> > 
> >>
> >> This is obviously an RFC, in terms of what I'd love people to take a
> >> closer look at:
> >>
> >> - The scheduler hook and the identity move itself, kernel/thread_handoff.c.
> >>   Is the set of refused states complete enough, and is moving
> >>   thread group leadership this way (the leader must stay first on
> >>   ->thread_head, like de_thread() keeps it) acceptable / kosher.
> >> - The x86 and arm64 register state handling. x86 refuses AMX users,
> >>   and arm64 refuses SME.
> >> - Whether anyone relies on a task's user identity staying on one
> >>   task_struct in ways not covered above in the series.
> > 
> > This way may break ublk server given 'task_struct *' can be changed
> > because the server issues blocking OP(fallocate, ...), then the
> > `current` check in ublk_dispatch_req() can be hit.
> 
> Yep, which is why is isn't enabled there.

If you mean .blockable isn't set for IORING_OP_URING_CMD, it can't avoid
this issue, because io->task crosses IORING_OP_URING_CMD, and one
io-uring(fallocate) changes ublk server's `task_struct *`. It can be
solved in ublk driver by storing and checking tid.

The usage is similar with prctl(PR_IO_FLUSHER).

> Known gaps are LSM state kept in the task rather than the cred, and
> PR_SET_IO_FLUSHER. Neither moves, and not moving them can only ever
> restrict.

A spare forked before PR_SET_IO_FLUSHER lacks the flags, so the user
thread loses them after the handoff, for good, since later spares are
forked from the new task.

> 
> > Also there is risk in 'task_struct *' keyed bpf task storage.
> > 
> > task_work queuing could become tricky too.
> 
> Like the above, the series does attempt to handle that.

I meant kernel tw uses instead of io-uring's, one example:

With CLOSE + FSYNC in one io_uring_enter(), the CLOSE isn't blocked and its
CQE is posted before the syscall returns, but ____fput stays queued on the old
submitter until the FSYNC completes because of handoff, so the app still sees
the file open.


Thanks,
Ming

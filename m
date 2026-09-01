Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE182931C4
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 02:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788228624; cv=none; b=Gsgi1GH0M5GJmjdTUgZJqGWCeF2k0D4qqB/SKOm2vXJgkYlfB9IykWyzlTjaMhOBSN/Zq7dFvNy9bp1+wNyRkfuznZ/3ujAKp1fMwQ1NBPyv46wErmpad7Kqjl8NAHZMgtWTMIr2vNuSC0jvk8tQByDlkqA9DbnopXsaTFQkUWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788228624; c=relaxed/simple;
	bh=e4ZfVR6W9Y7ztv0gPvqblApVTko3pyqbW78djerx+f0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZCJLgZLfcN4t6R5O2kkfGWe7mGnvoGM3Lgd/JFcOqz4SNpviIGCwGA4W1ULs/waCKzmPj5KG589rp82IDrdU03B3oH1xVUTivNtcLRxIRUT34A4VXEd7lyik5MSBJ6A3+8jHkY9DJdeF9CTN/ePL7qWHXz3gQ+UFBbDtyvQoqgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=SGBgi82W; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="SGBgi82W"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-9391e3b21fbso246246085a.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 19:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1788228606; x=1788833406; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XWpljHwuiD60nMC9te2ihW2jr04d4Ep95HSCXpScAMc=;
        b=SGBgi82WuRiAs+NvhIUUXcg6DbD72OwphSj03e1IVIiNxzSu+3TRn4Yg8vOx/b+z/i
         WQ9i0wIh1s5/cEsuo5GSCJZWMv2JNS8h2eByWvYRCoTmbe/sCeUgAwZ1FsXtE2BeucPi
         Mkb0JceDk99Z8WHFXVMoQjzmUxx0rPFd/m45pGJs+5xcFLD9Eqa0u2swWJ0yJZB3PgDq
         4vlDBLU7g40p5i1EJSZr3e1qL+qyZoPe/XcwjsjEI679XFF7Gzqju3qbhwfncvTiRh/y
         5hbNClZ/5469PbodAvcRwLQHq4H4IH74WkKdFnmcf1RfTiEzy4si+YkIQVfe7Lh2Zze3
         zdSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788228606; x=1788833406;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XWpljHwuiD60nMC9te2ihW2jr04d4Ep95HSCXpScAMc=;
        b=czB7FohFAM1Fxl9JXdjQB+r1if5lKKjuwRtB+Nt9Fdju3EUWuFxWpRqUnfAjrj9oOp
         giXGxLxKN0+lvA6xpcQyyNKXL5S/V2wlaevLhr4THeBWqgZ6lr6LyJzudJ2W3fhpvogQ
         4k9KQfCOgKPHzMFDOi9T5+yrwjZ1jHmx42ixjV1b9O0j+ldkHYmgxfH6xji+tRbG/2qH
         TKHanzcIEQkMZ7hSRa7AjjXRjw7ME5ooQ9/vuEYrdlw8yx6ymbvYarAz5tjUM2gkZUBI
         1goOwI3QFFJZIoabju4lAsNgzwyFrEf83/Xduv09cdxkA50X89Ack+EceHBdZIQLZInh
         2KHw==
X-Forwarded-Encrypted: i=1; AHgh+RojG52OrnddG/boWJGnk3cOKi679WDEzqeiMC6SKerMUQ1VDrxm2i3STP6NEiKgQ5v2EiyWa70OoemWrU4=@vger.kernel.org
X-Gm-Message-State: AFuF++kKBnx/YydDNxZGAcNJjFgJI53b6QE2EZPNp1kKEqORNtqN0cYU
	VqKO09fegMXFHKLPKsPnLOTOLZmyqEVSFjMi9hkH4937UWCYI/6137ccoy77OBGtGA==
X-Gm-Gg: AR+sD11w8O/f0kGbAljKchE7HJrz4Xer17Ljvqrvbrqp3n/aV+mFGunWMrzTSUxbY0k
	aOb/RAvh1D8zuJgK3hX4h1K9dBy5e79+kmfwX04xvLsbur5kdOVN4f9M+AiS1Rp6cOHgDHnK2fq
	nZygNIRtlrxHxPQ0QYGOlWosx8PVl9vuhNHf1PsKNCiZUZm/uVqJWIW1QJtLAIKmRJdRSeJROYi
	alKN/J4heo4EPdPV9Ic5QUO9Cg4trSA7Hn668P+p5pZVcKghGraRmWHVH+VRdMI3dF8pFexEvV6
	wHyDEHNicYJu0vH+CZyXUbUW55iZ1pbVEGfH5xlUW7wRW58gf2/7GwqW2wE/WFnQ+euCaaYDvVw
	2NRBwvdyNaJxkHNSrEymPDmLWa8cY2HG/DkI0YsgYkMrSBOWFGARarI29yLVa4uEC9IqZTshB2V
	m5E86KIMHIh+c0sravlFyHMrbuTDXDwMLjl4L5JVfp2hoER9J8k8boDc+KOIeLk+NO39Wiyy+EB
	w==
X-Received: by 2002:a05:620a:40cb:b0:936:cda7:554d with SMTP id af79cd13be357-93913798773mr3504049085a.14.1788228605915;
        Mon, 31 Aug 2026 19:10:05 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9391740b75bsm917492485a.41.2026.08.31.19.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 19:10:04 -0700 (PDT)
Date: Mon, 31 Aug 2026 22:10:01 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Rafael Alejandro =?iso-8859-1?Q?D=EDaz?= Cruz <rafad900@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+4a5c87a01894ca37f25c@syzkaller.appspotmail.com
Subject: Re: [PATCH usb-next v2] USB: gadgetfs: Fix use-after-free in
 gadgetfs_kill_sb
Message-ID: <23099c10-19ea-4626-b1a0-74a64fcb0dda@rowland.harvard.edu>
References: <20260829011901.325379-1-rafad900@gmail.com>
 <991f3432-02af-47e7-b470-b21d36d09ac5@rowland.harvard.edu>
 <CALp66yH0C0WAgUDkXArbLHgwSdrJ0hfQP2id2xhztg-d=qK1Jw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALp66yH0C0WAgUDkXArbLHgwSdrJ0hfQP2id2xhztg-d=qK1Jw@mail.gmail.com>

On Mon, Aug 31, 2026 at 09:58:57AM -0700, Rafael Alejandro Díaz Cruz wrote:
> Hello,
> Sorry for the confusion. I assume I can just address the
> concerns here and create another patch once the message
> is clear.
> 
> I suppose there are actually two errors but because they
> are triggered by the same syzkaller reproducer, I'm
> treating them as one. The initial problem is the UAF on
> the_device pointer when put_dev() is called both by the
> error path of gadgetfs_fill_super() and gadgetfs_kill_sb().
> This is triggered by the fault_injection in the reproducer.
> I'll assume that one is clear.

Yes, that's okay.

> The second underlying issue is still related to the_device
> but not itself, rather the_device->count variable keeping
> the references. The syzkaller reproducer still triggers the
> same fault_injection in the reproducer but the
> fault_injection might fail which leads to the success path
> being taken. This means that the gadgetfs_fill_super()
> will succeed and the the_device->count will be initialized
> with 1 as you had mentioned. However, at the end of
> the reproducer close() and umount() will each be called.
> This leads to the following:
> 
> close() -> dev_releave() -> put_dev()
> umount -> gadgetfs_kill_sb() -> put_dev()
> 
> the_device->count == 1 at the start but is decremented
> twice. refcount < 0 triggers second UAF.

But gadget_dev_open() increments the refcount (it calls get_dev()).  The 
increment caused by opening the device cancels out the decrement caused 
by closing it.  And the initial assignment to 1 caused by creating it 
cancels out the final decrement caused by gadgetfs_kill_sb().  So there 
shouldn't be any erroneous accesses.

> This is fixed by incrementing the reference on the success
> path of gadgetfs_fill_super(). That is what the get_dev(dev);
> call is for.

If you do that, what will cancel out the increment caused by 
gadget_dev_open()?

> As a side note, I'm part of the Linux Kernel Mentorship
> and I appreciate your feedback! Please don't hold back on
> the suggestions. Every bit helps me!

Don't mention it; we all have to start somewhere!

Alan Stern

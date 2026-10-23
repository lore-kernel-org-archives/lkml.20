Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792764342;
	b=tP2Vhf7I86DamfjYr3jifkNgajb993FK5/xhdiHBe8vuSxJOUUfK4wjZHf+lobw+qW8X
	 nQEYdNFuEdstsIIw46TEi2/NdkkGVXhES/E7p6uwkDcqyD6XJSZ6ULuLMM5hgkOfAx6xv
	 LOE1yT71OFy9oEMlPn/O+6MUNqpSpzxqV/fVSJbQHKrPwIDFTGTlZyJINRK3fmgJxRwSS
	 MgPGBhqIm6d++K/DGjDFeNkWgEKqDJxOdqo4paS/ULgbkIE1WMqrzRMYQrsdsLdsgxVX3
	 pApJfD6VCOl8aCER/YJc66fMYYa1mJ75kJ7knnjZjFsequ9s2wlEqN8d5P2KDdv7oDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792764342;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=BUJVWluZQW/qDMSCSzMsGJRAgytWrmfDDzAkl2tvmys=;
	b=Hrh0a933Wz5YX9m2wELyAhxCkbxrlOxqJ3uFk9rYBbQM0R9qZaPKe1o1OFn9BaywqY0F
	 BZnsGd0Qe7RrpxKp3+9rNXNcdM9Ax70tSPlzo60iwchXT/kny45KzC9y2mnPY4fcL4zUQ
	 zeLEwjU1pBTXmWjs6kbphntQFEqJ1Ri2wwhQYUjeCgzIK1vVoozQGQsMrer6n0vdAob2K
	 wt5BkojWi31B1g2HFiyouY1Lik4zdkBT/0+pvJaKS8slg/ejQx0ELxHExuoPuyBoIZa4j
	 /wlm7sM42Z0n2gQpZ1Oq5hOXi+Vb+vGCNxxCB4AGzvY1lPfMrhX21M3iOfz13YKN5Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qCHc+pkS;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E570606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 14:05:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E570606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qCHc+pkS
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c43373ae89aso149117566b.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792764340; x=1793369140; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BUJVWluZQW/qDMSCSzMsGJRAgytWrmfDDzAkl2tvmys=;
        b=qCHc+pkSgGjiEkB+YGvSGYu0lSGIfzJY5pAXsLur0x09rjShylBp6MESq/gj/bUUeh
         oyclnk95Q/C3POCVEUbNXFP4IqJXHSma/pajCGqeZyhCELztyVVVdT1KzN0/DiuOzsqL
         9Y4ucHy3nxyJX8Jr5ptAo65RP1pHINUXa+j66SYOcgsW/4w3zWYQGyt0PS7DblO/Nj+F
         6cR6Vpe8/G0OSomPI6w+IJAo/Vvsu/2p1/hH9GzjtiMu3Z4Skvxb6kisSSA+zwoRq2Uo
         musg/d6JQTXlZ7Ewkk5COEiWzZeK+DPYSAkEQLuXc3Fsm1pX+6ug7EsLGn0NAOACqha8
         +nVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792764340; x=1793369140;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BUJVWluZQW/qDMSCSzMsGJRAgytWrmfDDzAkl2tvmys=;
        b=fUdPGlZDw9z2cdMUgr/Ls/xfBiWZFIZm0pnzlkADBYH731fu3M2F1Lk+pk0wECfjW8
         c7ev2ZlPrs+Bz3biC1D09emel+nl/+b5w77hVITceg3UWEPfdzAEj6PgFHFU3L+0rkxS
         y86VjBBszYCbAwA1ApsPi/iELujouhOM49rgkU6BmB15fTfLOVUKLvMNUgCJ3k7qAFLi
         RVmHKPdO/Wz/KX0/tnkzSHWdemoZuPUU7K39STWSKKr9EDJI8J3rGJpK2IEwVMOqUk2X
         5dz29sXTbOccLTHGO6jAdjGNgLOSJr3S8Q1tXFeWB5OHfq+w4+jSRLBceCyb/rBuI1+q
         u4dQ==
X-Forwarded-Encrypted: i=1; AKwUvByDQH2K42Oxf5VtH9nF1R2FoTnoChuwTnbmKzn4W4Pa7YlKxnhT7/w0aR7+PX9WmF5XrUowR8dSTABoeaY=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9Gt6SLK8G5aEss0W0qMBr8RX9RuS8jGc4rb9UKEsp5PJQ7Xe5
	XPsmHpFU7mCf7Bg65fMKCTbncW+wpgs3tTKL7TjhM2ue/xvJL5XJkCbq1kLX+1fOrv9ijzAA
X-Gm-Gg: AYBFou3DXO3Tc2t16Tec6KfCmjhBJXYuPXaRyp4Ske62Nx/5H4knq0f8vG3tsvUMZzx
	4gn2KNnGxhABuGlm/Fntk0ZzCeimyknK2Wc6WOMbsgOdNwW+jUIt/KKUPcZLhwLWOZqwTmCKFB3
	yHRRCZoTqOOGLXBcHXYOEyAff1LMNWFDL148YkX/LsSzzFtqdcM7aHeWYpQos8Zs5NmAhAFPGth
	4fkzgKiI56F0PaVSow8A/+lPbpdEOTh19WMaVDMx0qk5mrE40EKN4G5MfWJteIZUs6GddkQQIs4
	9acMiIPbsoQLMe8DG90tfLMReuDeZbpcgFLwWZerZQcUIDFkp/h7wnhyeD8ezg/IqeH/tEiidc/
	qm3piSmzuGDYYiHeHVRCQ1P4h6fzWzzOLUH3eZaZ6SOOd7NoirTFxOWecA0JyBtaSEuWnd7ib2w
	QzMrTmOJEFRHJ+gVxafqVHLlrWs5bQBw1vWOXAJJCr8LB/mLsnJr/I+4irvUOtCPDU1v2tURHlA
	n90Yr+6tXd4B7WR2dLpZm8fmci2XQ/JcVbtvHivP9XmJSSgonfqIiZIP1E3v4a9PNtlRX0T7hsl
	tpuEif2hphSCVo1udgtsKnThn0eA+ggj622qjfZOOPpgsulhBspeP6VisfS174cVEuXt+1FwkaU
	B5GztMoCK/BXofgSAtNJLHayyK+1i1Je0fD+KD7/bQSX33bL2wByY55tAH+0WaoI/Y0c7Tck125
	LgOWGUBln7fVx1hao=
X-Received: by 2002:a17:907:930a:b0:c41:30be:4f84 with SMTP id a640c23a62f3a-c46a90ae916mr376211766b.9.1792764340190;
        Fri, 23 Oct 2026 07:05:40 -0700 (PDT)
Received: from [192.168.100.100] (87-205-15-91.static.ip.netia.com.pl. [87.205.15.91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46b8ba181esm4707666b.25.2026.10.23.07.05.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 07:05:39 -0700 (PDT)
Message-ID: <7a212208-74f2-4d79-8ca2-a1502d0e0a1c@gmail.com>
Date: Fri, 23 Oct 2026 16:05:38 +0200
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
Subject: Re: [PATCH 0/2] kernfs, autofs: fix pipe lock cycles through sysfs
 stores
To: Ian Kent <raven@themaw.net>, Tejun Heo <tj@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich
 <dakr@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, Jens Axboe <axboe@kernel.dk>,
 driver-core@lists.linux.dev, autofs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 syzbot+002fb7b2d0bc53bf7e75@syzkaller.appspotmail.com
References: <6aa23178.f81106d8.2ab401.0006.GAE@google.com>
 <cover.1792577179.git.krystianmkaniewski@gmail.com>
 <649966b83b39fcdd25e892fc3c6732a1@kernel.org>
 <22d41f2a5546d3bc90a1b3ad24ed3656588a854f.camel@themaw.net>
Content-Language: en-US
From: Krystian Kaniewski <krystianmkaniewski@gmail.com>
In-Reply-To: <22d41f2a5546d3bc90a1b3ad24ed3656588a854f.camel@themaw.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Tejun, Ian,

On 10/22/26 04:46, Ian Kent wrote:
> On Wed, 2026-10-21 at 11:48 -1000, Tejun Heo wrote:
>> it doesn't make sense to change the locking scheme for it.
>> Can we just disallow splice on /sys/power/resume instead?

That would address the direct case, but it would not make this report
go away. The lockdep report combines two separate operations.

First, the reproducer splices a pipe into the cgroup v1 devices.deny
file. This records:

        &pipe->mutex -> &of->mutex

It later uses a normal write() to /sys/power/resume. That records:

        &of->mutex -> &sbi->pipe_mutex -> &pipe->mutex

There is no splice into /sys/power/resume in the reported sequence.
Disabling splice on that file would prevent some direct deadlock
cases, but the first edge of this report would still come from
devices.deny.

A complete restriction for this attribute would also have to cover
both splice directions. With an O_RDWR open, a splice read takes the
output pipe mutex before the same of->mutex. Another thread can write
through the same open and reach autofs in the opposite order.

Kernfs splice support is established behavior. Commit f2d6c2708bd8
("kernfs: wire up ->splice_read and ->splice_write") explicitly
restored it in v5.11 after the VFS stopped providing the implicit
fallback. The pipe has been locked across ->write_iter() since 2014.

I agree that changing serialization for every regular sysfs store is
too broad for this case. Before preparing a v2, I would like to
clarify the intended scope.

> Not only is the description hard to follow the example is flawed

You are right that the cover letter was hard to follow. I should have
described the two operations separately. The automount itself uses the
normal empty directory case.

The reproducer creates a detached indirect autofs mount with its own
daemon pipe. It changes its current directory to the root of that
mount and moves out of the daemon process group. It then writes the
relative name "0x0000000004000921" to /sys/power/resume.

resume_store() calls lookup_bdev() on that string before trying to
parse it as a device number. The pathname lookup therefore starts in
the autofs root. The new negative name triggers the normal mount
request for an empty indirect autofs directory.

The dentry whose ->d_automount callback runs belongs to autofs, not
to sysfs. There is no autofs mount on top of kernfs in this
reproducer. Kernfs is involved only because resume_store() starts the
pathname lookup.

The change which made this path possible is 1e8c813b083c ("PM:
hibernate: don't use early_lookup_bdev in resume_store"). It replaced
early_lookup_bdev() with the normal pathname lookup in v6.5. That is
what made autofs reachable from resume_store().

> The other possibility I was thinking about when I saw that report
> is to disallow file systems that don't make sense for automount.

I may be misunderstanding this suggestion. In this reproducer, the
filesystem which owns the automount dentry is autofs. A restriction
based on the filesystem owning that dentry would therefore see autofs,
not kernfs.

The lookup from a sysfs store is also not unique to
/sys/power/resume. For example, with CONFIG_BCACHE=y,
sys/fs/bcache/register also resolves a user supplied pathname.

The exact reproducer records the lockdep edges with different pipes
and different open files. It does not deadlock on those mutex
instances. After sending the request, it waits killably for a daemon
reply that never arrives. Related setups can deadlock when the daemon
pipe itself participates in splice or tee.

Given these two separate paths, did you intend to prevent only direct
splice operations on /sys/power/resume even though the reported class
cycle would remain, or should a replacement also eliminate the
lockdep report?

A per-attribute splice restriction alone cannot do both. If this does
not justify new kernfs infrastructure, I can leave it alone.

Thanks,
-- 
Krystian Kaniewski

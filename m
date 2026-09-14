Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323102FD7D3
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789350608; cv=pass; b=oknlZUkFcJc6teRY9IBtLGq9ROuwPbtgo5OyhrvQLzlCcf32VGMLvV5CzGvahv5KcRc53fEeCf9IgpeivMhZtWpOrZuOcusEz7nEoMZ0+WfTbs05Y6RhmTLF1zdqh3EV9fWLuGc5Po9QQKuYiFQSt86V+iBNGFs+190N3SoDbZc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789350608; c=relaxed/simple;
	bh=6JDat1egMs8T2AopmiRxNOMRANZPNk5p+3KGcSZ8/GY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EQ8Aybp8V3dh4wiITVrljEDiyltsknzBC362aRdpBp7TfgDvMT6Uh/en3GKwghloUm3hh3Gn/kXerfFx5t5uvRA+eB6fol3/8n3O+bWc3bt4VjG37rfDSmlnAFy6F/LyyGY2On5S0wyfDwTPrHWUacUfkisUt7sEgrnHYmLm4Ng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VfYXgsy1; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VfYXgsy1"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c25b661d37dso388086666b.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 18:50:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789350605; cv=none;
        d=google.com; s=arc-20260327;
        b=IyynhXiKL0SXF6IrmQHciBUWTyn1W4t9HvSGalp44f83UBQedh9Pq+kkMe+m68bPzR
         AkNvEIgBaw9uRu1i7eue+sjTVirydazeZ2cEjG4rfhZHb4cG7UsDPC8hmpp5H40bR3Rj
         J6IlPn5dOYRtZ4OkzVbZN4q8uDlOiAuqnda812zYJ6Uc7VS75VGNZ9WuAso2b3rUz3gQ
         R7ZpHCcq7ImNiFPDC6pcoHWfFVN9wvDre3i4nM0S5HZL/GK7/gMn2ldHx9fo3DZ9v6WX
         2Z3lQgy2DMO0uoIplEv07PIlGRM36DJZauET0Nwf0GaPBFz3I7AT55NiPzdasDHktnGm
         ThQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nDT39FdBcImVCPVb0QHT1U8B7f8POVTcW4tGeOBDc0c=;
        fh=qxIp36baWpg6hvEAHsP49T7We3Lzj/QCuVlrOze1rzQ=;
        b=rGynwsKxZ2Y/sMSbRMi4CLxGKghR64ZdeR7hVx6RRWggmv12KrDRpuSCxr742esvwE
         Li+uIEogxddW6dXvepFjNxPpFk9LG4S0mtPRopfGJ6bmTOn+fTjGJd4gPHAMYy/QBPjM
         +4y8crwSITLI1LEktOhttRn6CXxSwba66YQm/PYczH9lddzsWj+HZTKv4femsv0KcIgS
         Akc1KVBprtz0W6nnvvdHESq5IiGr0vdc2kdrZS9L5f0Na7sQj7EwEIb1gwks4fgY0ZNu
         J5gacHj7wso67kCvQAW7SK028Dob82rZ74gHeCJjxoXSp0vNLS7FWQAgOUZgMGA4tzT6
         NgMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789350605; x=1789955405; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nDT39FdBcImVCPVb0QHT1U8B7f8POVTcW4tGeOBDc0c=;
        b=VfYXgsy1FMY1HWqok8dA/7LdvG+RsQfsDLKhPFkp9EIs0X+m6UQOnT/Oy7rPO1mC0i
         o3C4h3/F5bIjs2wN9rXSHtIjfxO4QsMVD28cSA0qsA0n9a/1BXkeNRfK/+QD3fHlMYjD
         Fo5BSv8xsbJnuk46GJz+9ILoqYSQIgg5TZcCr7tML3zuckSqnth8zi43qg0sAGmrKhgq
         xaZ4YGjnpQskXQ3k6YcCaQCaVe3Xwr5+igbX82HYTOEMpfndawReGfN4ZKEa3HQ4vqCW
         gNZ6MC62pWyXS7NiTThDaDssFwzQS5TabkyuAv7lqBXEd2PV4VXb7n+9NFfpm7NH20zE
         HwyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789350605; x=1789955405;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nDT39FdBcImVCPVb0QHT1U8B7f8POVTcW4tGeOBDc0c=;
        b=PTbNB3ZVimkTyEhCQDlhzyqxVj7D4Sh6LXk1+4F4uOZYYP/oRlbkwMTS5+qtH64R75
         8jsN3usM8UnldrHc1lxZroHOSkegnG+l+zKvlxCZIsxyPgZXDCCZddHod7HbjkQ+wUOp
         bw9a09Slz0SZg2DeQeM9R7Kq4yjZ1TYYOEuII39f1AFNK4WIEN3b8eL3gnl2pUW51pKC
         RX2l/fnoF668vTKjbT2+RURE5CCpNhHCX6SifsUxW1PubkFWYpK1jyzJ+S5i8PEd06y2
         KAahpB6jmWi/FzsFvp6MU4OugRPGwKo1CNkPCKfW2VhtMGgidGTEI3A0b+eUItOZRD0I
         1ckQ==
X-Forwarded-Encrypted: i=1; AKwUvBzynuQ4Reh1fWXwXbMgBDCe5wrusoalN46VawczSQYebQDsM8elb07GvPJmhGG0KsMaMfHFb0vKcnl6vMY=@vger.kernel.org
X-Gm-Message-State: AFuF++kBDVoYivmwyQg8YtyDB/PesdnocSCd+E+2z+4DiCzYLfwPGnWd
	FWjaLundzviVufFb4IvWAJo0MxPMg45TRCdM18WoAB1MvGWDLGlTcEz8P2EG9TFjOZ+vl5X+DFA
	+K2yqhguAq0i39k4Gu0AAEChUdjoh3FBiCo7HC6llbQ==
X-Gm-Gg: AYBFou2TkC9awGNeUY0s4j50T9s3itRqeqJlMpByfCSnYcbmsj2Mnw9WgqrH/n20gqq
	JHaz093JICBY2Ei9b7o6GVGY9UO4PePPUsF9nRJgExy/f5Izn+hj6o+U57DMYJVnwA2lag7K5pN
	u7f1A/puVKtm5rI/cjWGp+p1WB8EsduSYLipPr3ogFGiHByrsdUTBzLQ7zy1HkT9M159IJt1QBc
	glj5FbvPQvURR7qMI6Ds9uqGsyp3P4lLxU90rFgeG2UczanIVp1fj+V7UuK2FhTRAf0P88RpXjy
	C3Hys3T7zNCt27TZaypdjV3XTu3vyNU9pqI5lUaHj0vTLmluKhQ5NVIUjeJ177uqfstz1hoSFkt
	XNbUr2dNDjlbM
X-Received: by 2002:a17:907:1c8b:b0:c29:44b0:1428 with SMTP id
 a640c23a62f3a-c29b87811c1mr30232866b.42.1789350605077; Sun, 13 Sep 2026
 18:50:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913114528.842015-3-bestswngs@gmail.com> <aqc2igMKBhpiEeSp@dread>
In-Reply-To: <aqc2igMKBhpiEeSp@dread>
From: Weiming Shi <bestswngs@gmail.com>
Date: Mon, 14 Sep 2026 09:49:28 +0800
X-Gm-Features: AcwNN1XJfyet9Pz86i53FrvFTYUn_UoNqnMHSeKkbBlGR2ZwQU2nrN2NaQjskbs
Message-ID: <CANgPUi2OVWU+5Gsv8hy7B5nFh3n5_B+Am3Zm3f6M9Y11oX1Ocw@mail.gmail.com>
Subject: Re: [PATCH] xfs: validate buffer log item before reordering
To: Dave Chinner <dgc@kernel.org>
Cc: Carlos Maiolino <cem@kernel.org>, linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Chandan Babu R <chandanrlinux@gmail.com>, "Darrick J . Wong" <darrick.wong@oracle.com>, 
	Xiang Mei <xmei5@asu.edu>, co+af981e62f5c7171a@bugs.sh, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dave Chinner <dgc@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8814=E6=97=A5=
=E5=91=A8=E4=B8=80 07:49=E5=86=99=E9=81=93=EF=BC=9A
>
> On Sun, Sep 13, 2026 at 07:45:30PM +0800, Weiming Shi wrote:
> > Log recovery reorders transaction items before buffer item pass1 valida=
tes
> > the format of region 0.  A corrupt log can therefore supply a four-byte
> > region containing only blf_type and blf_size.  xlog_recover_buf_reorder=
()
> > then reads blf_flags immediately past the allocation:
> >
> >   BUG: KASAN: slab-out-of-bounds in xlog_recover_buf_reorder
> >   Read of size 2 at addr ffff88800e40e364 by task poc/133
> >   Call Trace:
> >    kasan_report mm/kasan/report.c:595
> >    xlog_recover_buf_reorder fs/xfs/xfs_buf_item_recover.c:164
> >    xlog_recover_reorder_trans fs/xfs/xfs_log_recover.c:1929
> >    xlog_recover_commit_trans fs/xfs/xfs_log_recover.c:2053
> >    xlog_recovery_process_trans fs/xfs/xfs_log_recover.c:2319
> >    xlog_recover_process_data fs/xfs/xfs_log_recover.c:2510
> >    xlog_do_recovery_pass fs/xfs/xfs_log_recover.c:3253
> >    xlog_do_log_recovery fs/xfs/xfs_log_recover.c:3340
> >    xlog_do_recover fs/xfs/xfs_log_recover.c:3377
> >    xlog_recover fs/xfs/xfs_log_recover.c:3502
> >    xfs_log_mount fs/xfs/xfs_log.c:617
> >    xfs_mountfs fs/xfs/xfs_mount.c:1031
> >   The buggy address is located 0 bytes to the right of
> >   allocated 4-byte region [ffff88800e40e360, ffff88800e40e364)
> >
> > Validate region 0 before inspecting the flags.  Keep a malformed item o=
n
> > the regular item list so that xlog_recover_buf_commit_pass1() reports t=
he
> > corrupt log through the existing error path.
> >
> > Fixes: 86ffa471d9ce ("xfs: refactor log recovery item sorting into a ge=
neric dispatch structure")
> > Reported-by: co+af981e62f5c7171a@bugs.sh
> > Closes: https://lore.kernel.org/all/aqZALi7GdVprcNOh@cronus.toxiclabs.c=
c/
> > Cc: stable@vger.kernel.org
> > Assisted-by: Codex:gpt-5
> > Signed-off-by: Weiming Shi <bestswngs@gmail.com>
>
> That's pretty poor form - taking a bug reported by someone else and
> then reposting their proposed fix as if it was your own before
> they've even had a chance to respond to the maintainer's comments.
>
> And that's even before I take into account that the proposed fix is
> an extremely poor one. It basically punts the broken log item down
> the road where some future processing operation happens to catch it
> and abort journal recovery with EFSCORRUPTEDEFSCORRUPTED before bad thing=
s
> happen.
>
> i.e. you didn't review it, nor did your directions to the LLM that
> "helped" you direct it to determine if this was the right way to fix
> this issue.
>
> To compound this all, I've previously asked you directly to stop
> sending patches that add random verification checks to random parts
> of log recovery and instead spend time on actually addressing the
> root cause of these issues.  i.e. that we lack robust on-disk format
> verification of the journal contents.
>
> Last week, when someone else posted a random 'log vector is broken'
> hack, I said the same thing (yet again!) and posted the design doc I
> wrote a while back to provide robust, generic log item validation
> for the entire journal:
>
> https://lore.kernel.org/linux-xfs/ap8ucHIw-pKLhh9c@dread/
>
> I posted a link to the git repo where I've started this work further
> down that discussion:
>
> | Ok, I just posted my current WIP to the log-verification-1 branch
> | in my kernel.org repo
> | (https://git.kernel.org/pub/scm/linux/kernel/git/dgc/linux-xfs.git)
>
> That's the work we need to do to get rid of -all- the journal
> corruption issues in one go; once we have that in place then almost
> all corruptions will be caught long before any of the recovery
> parsing code can trip over it....
>
> -Dave.
> --
> Dave Chinner
> dgc@kernel.org

You=E2=80=99re right. I=E2=80=99m sorry that I overlooked the ongoing effor=
t to
address these journal corruption issues systematically and instead
started from the bugs.sh patch, which merely stops this particular
crash rather than addressing the underlying problem properly.

I did analyze the crash, test the patch, and check that it handled
this reproducer; I did not send it without review or testing. However,
I understand that this does not make it a good-quality or appropriate
fix, and I=E2=80=99m sorry for submitting it.

I=E2=80=99ll follow your log-verification work and would be happy to test
whether it also addresses this issue.

Thanks,

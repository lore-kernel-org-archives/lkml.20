Received: from mail-qv2-f41.google.com (mail-qv2-f41.google.com [74.125.230.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A24525A8C
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687253; cv=none; b=A2ovw/EfFq5gkeUnlmemRh771KJJ0UTII42sTrsGX09JrTWBmETRTLQ5/7KQ2ZeYu0Qiq7mUb4AcmamldvJvDy993nKPo8I0otxYoldL4u9ymYK6jfnohnXjdFi928iaVoEY7wSkes13GYgYdhf0rU5LiHpRUKbIrCNQ04nuFmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687253; c=relaxed/simple;
	bh=PUrN0XLKKmcY4+BzdqcUirV+08xJH2NYk9oyUJnLOKY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MLRsPpH9Mg1+0yeF9+1P2E+4z8z1SQAxlineV62ymvm5Fv4JZJXgKmRVJTN13+x97ua+8wMkARg+ZeDzRLEP7/F8zwXji/O4ElQuIqbaSVVThXBx5yqaHPYsccFQ7VfllOu2f6v9uiAa8jONsg9GJKWUkUD9oiXmvJpcrwnBgBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=sGoAyW/c; arc=none smtp.client-ip=74.125.230.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="sGoAyW/c"
Received: by mail-qv2-f41.google.com with SMTP id 6a1803df08f44-9178b9b7ecfso6302536d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1790687247; x=1791292047; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s2+9C75fPvA5g6i7G+PRMeW8ilNW2Hk9NJmcPsE1jGE=;
        b=sGoAyW/cBDUOjNP/dhva8ysA7RPUsTwMJ8xLzsDjxnrHpZ8NwtRL8fvltqg6ECe6uk
         4bSH/ClMNhb5xWEM48s783LJiRt6RHjWDUZLjJTTSOJnJYKhL/YuPXQkC7g2xGL+ha9X
         eap9ibADGLP/UaXukTYZfE7vg7NOClXT2SgcR3xekoUB+3eJFaOISd4mlCfpA+kPLcx4
         jAt+oDTYPvPUHlWadsoosVfKAuDRA/O1LvlgL1idYqQNiSmq2wYGHhP+fYfdjkaOTssm
         a8O5jRbN1JVD3+bX6NCG8XOzg/cQULYHziQOTmEP+dRSGQ1yD+q05MWpiHqn877tFCej
         5AiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687247; x=1791292047;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s2+9C75fPvA5g6i7G+PRMeW8ilNW2Hk9NJmcPsE1jGE=;
        b=Z3+uQnw74vhFl/3Jcll4fMyL/O+HSyq0MuAZ9sqFmpICLDlcYvxCSqI1vhPltZ5ZJI
         Ip+7avIa6jqmeP7wurITuiKts605t70rdIzgqgwewbl1Lt0My9srkqjoucyUkzfDpG2Y
         QVeaSLB7ObP94IQESgRCYYt3FX8Afz9xRjZUrNM6MQ/R2O+HjraUUp6ypJlYqDXl5nH6
         bgG4m1hmLd74KlRIBq/Yz+LGeXeSmfjuBepNI+SeMbMgoKkBdgwFm6cIsGmwCOg+W3dj
         YIo1rF0RqettB7PtSAVLnAGdd2g08t1YbhRFL2dk8rA3pG+RmRKJLA1uaybQNZethuw5
         e+pg==
X-Forwarded-Encrypted: i=1; AKwUvBziYIukWsdlk+tno2MOFKRl5jHxrPEdpw0dWVd2CGlgyH1DL5PPLiSLZ+NDbTdMyi9dnZjD48sVMliMjAc=@vger.kernel.org
X-Gm-Message-State: AFuF++knmz3vgbAJOiZXO6FaWdAhLyP8TXP1BHZ0QrWv/SSFQCMsPdI0
	tJfoXF8XJqkd4pVRute+aAW5/W150YRt5q5WCUJFEDl6+C9YghOiBJWbX+E/km4+lGA=
X-Gm-Gg: AYBFou2Gt/WzS7nErNiF9+aUt66EEpLWHMCqYXn8eGgJIxwRrfp9V9jq5HuYBLePEti
	JwIizVTO+WuZffg8MUN3PCh7mfoa+nsHim4cAuarn1PWTzeKCM6hGZaAe/15BXnHO/LirRmjCeV
	njHbEm2AB2chYOndD4ubR+OxXRgHxGrdlRS0n2QAidgNYqlqPsvQq31M5rAg8SE2PeSYMcRLpqP
	5LJ2RGKl+JcbR17Cc0ALyHTS888j7qOAjsPc2uH8XCf3GAkici7tuzAZpmJGTLKTXl0v217kH5F
	ewyV8xEkc7u7TnP5FTq6EriYZg8f2DuQD9sUAx5ldsLzpdVLcn/C5FOmIRI/JL6SL/NumaDwe/k
	8M6jbQfQ/mpi8Xg0UBsXsRAIG6jgKxqzDjpXlSLxjZGjuIJx+7nIjBviU7isYcm68PHEVLBcANU
	CJmr8mrmxEQPBU/GDvANWnzfPRpjIqmby6VFJBl7mIJGL3ocPJfOC0WEEO9FVzem3V3Uw5u8s/x
	q3h5HSjj+JI8Cc=
X-Received: by 2002:a05:6214:2f8b:b0:913:ffb2:e8d9 with SMTP id 6a1803df08f44-9142f93e820mr258725566d6.40.1790687246832;
        Tue, 29 Sep 2026 06:07:26 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.255])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d1bcfabsm9993486d6.2.2026.09.29.06.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:07:26 -0700 (PDT)
Date: Tue, 29 Sep 2026 13:06:49 +0000
Message-ID: <f3880ecc0f95cc12f0b8fbb019f7efef.josef@toxicpanda.com>
From: Josef Bacik <josef@toxicpanda.com>
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: Ming Lei <tom.leiming@gmail.com>, Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 3/9] ublk: publish io->cmd under io->lock in the commit paths
In-Reply-To: <CADUfDZqDZEM4=uw+By6RnxvLqXbc-iPf8RCUQtQB5_Z_Di84Aw@mail.gmail.com>
References: <20260928-b4-ublk-cancel-stop-v1-0-4a4360232a46@toxicpanda.com> <20260928-b4-ublk-cancel-stop-v1-3-4a4360232a46@toxicpanda.com> <CADUfDZqDZEM4=uw+By6RnxvLqXbc-iPf8RCUQtQB5_Z_Di84Aw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, Sep 28, 2026 at 10:53:38AM -0700, Caleb Sander Mateos wrote:
> On Mon, Sep 28, 2026 at 9:03 AM Josef Bacik <josef@toxicpanda.com> wrote:
> > +               ublk_io_lock(io);
> >                 req = ublk_fill_io_cmd(io, cmd);
> > +               ublk_io_unlock(io);
>
> Taking a spinlock for every ublk I/O completion will be very
> expensive. Is it not possible all paths calling ublk_cancel_dev() to
> wait for all tags to go idle?

I measured it on a c6id.metal (Xeon 8375C) under KVM: an 8 vCPU guest,
kublk null target with 4 queues, fio 4k randread with 4 jobs at iodepth
32, ten interleaved rounds of three kernels: for-next, this series, and
this series with io->lock taken back out of the commit path. That last
one also drops the second lock/unlock pair patch 5 adds after
ublk_prep_cancel(), so it isolates both. The guests weren't pinned and
landed at two throughput levels about 15% apart, so I compared within a
level.

Series against the no-lock kernel, IOPS / CPU time per I/O:

  plain      -0.04% / +0.7%  (high level)   -0.7% / +0.7%  (low level)
  zero copy  -0.6%  / +1.1%                 +1.5% / -1.2%

Batch mode, which runs the same per-I/O code on both kernels, differs by
-0.03% / +1.2% and +0.4% / +0.5%, so the lock is inside the noise of
this setup, which is under 1% of about 3.5us per I/O. Against for-next
the series is +0.4% IOPS / +1.0% CPU per I/O in plain mode at the high
level. I'm rerunning with pinned guests to tighten that and will follow
up if it moves.

It's one lock per io that only the task committing that io takes, so
it's uncontended, which fits those numbers.

Waiting for the tags to go idle doesn't close the race this is for,
though. The control path claims io->cmd while the server can still
commit on the same io, and what matters is ordering the claim against
the commit switching the io from the request to the new command. Idle
doesn't give you that: a tag can be idle when you look and be re-armed
by a COMMIT_AND_FETCH right after. That's the QUIESCE_DEV hang on
for-next today, its cancel pass skips a tag whose request is with the
server, the server commits and re-arms it, and nothing ever completes
that command.

Also, ublk_wait_for_idle_io() can't actually wait as it is.
blk_mq_tagset_busy_iter() only visits started requests and
ublk_count_busy_req() only counts requests that aren't started, so the
count is always 0. I'll send a fix for that separately with the
QUIESCE_DEV work.

If the numbers show a real cost I'd rather find a way to keep the lock
off the fast path than lose the ordering, so I'm open to ideas.

Thanks,
Josef

Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C18B3A7F68
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 03:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787888041; cv=pass; b=KUVSNSalt+4hAlXFAQ4ubAhm6XqivmqDcgm+3e+9ZSd9hppelx+PAUhqtlPgCqJMt05zeRYUDRNYIPy8PAEat3mDbPudbZDZIrsnsuRTQaHQfKn7DAOEWJrL3Dhpr8o86nYSwRBhHm5L2+LU0ohBgRyO9Hoxl74b9zC9ebEy5nk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787888041; c=relaxed/simple;
	bh=eVCUgnuZPY9rp4G0hxfWBoh/8wdCFKKRU8Eq9Q7yXbg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PBGf3o9+i0YMtxIBw9Axi073+IgZpGtKBYGgIChwL+TYETV9J59S3F4eVs5L3L4HfkYnM0MnMM2nRg1hEJuh++lBPbd7AwsuYuKqueAVqVciK0ihPjEKxmwRM9AzjMysO9j42Xul7q8izUOpVAk7lcaPO7Up9VUNB59//uJF5Qw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qoJ0brIm; arc=pass smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qoJ0brIm"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7f0167e59a3so241423a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 20:33:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787888039; cv=none;
        d=google.com; s=arc-20260327;
        b=I/ZEO82EZRUEQOX+X4qOOazflPGMHI1BGXPspHq0+id6byxibS3Xsn/qep/GI0UslW
         yvyN01Y51kV01zGYHtxcv8MxdG8fOxZIOTpfdNXLUa5XQ0F+K3lnDfJtGpFUV/3+6Ttc
         6R+DJNrd4Ja8I181XGKjI0xUlXe8PsDRvTOQfA3hv/IHViuG6h+uae/rAY6/A91kFSNM
         3TBqIF46QVE8YbCo+N0P1R38D1x3weZKgdX/3zHgPGhRdowAu6U/zBpq2aDl5r/pXEp8
         Q+lZhQLdnMAhQB0+3wX7qJaZyxzeEbzH/7RNivqbnytlKUja8PFLqKWTF7rwIPLCxOw/
         1HRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tJ6GRA/2LwQW6/jDEIjrj/TZS2ZKHOJ3XYsZbyYACDw=;
        fh=w+MzvPA0veehoFg9zJLFBKA1VI83APtW40qrlSn/aCw=;
        b=fWRuNa1dk9lDayeQZFN8o6ObP8+rjpA5VevmuCedvvdQkEAwIwyCPMKyaV+icIVFV+
         1vYlKVbE4wL4a2Zv7sbM5oGLe5b1z0eeB74HuHG+NqRg5/kQ67A/i6DAJK41L+xPYKOF
         XuZBjhw2/uO7gcE8j625mPnl0y9PWeKy++3r4/2cd1MabfGjOsJXb5MTgolMqDlYMr8n
         3OkJctaJVuliFYtzGKwfO8bnHLVcQB2wWdaFuR4gySA+tFP4AR56xSUIJwonEKmM/rNl
         boUUHLg+Ym1ynDHOLph4znwgtNEoK3nWFFS1cY6Mx3IwCHZ/d81O55nl4Iof6aJ6BEgE
         Rn7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787888039; x=1788492839; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tJ6GRA/2LwQW6/jDEIjrj/TZS2ZKHOJ3XYsZbyYACDw=;
        b=qoJ0brImXYW2jxuJ/+X9STf16jjXZ92rLmZ4786e6MVSpMWvhHnkJ14DzuZd++/cjq
         iXnv5vvRllyON65+nnXaCJ/b6+YH56o0zedDj/zHvJNlAGDchuDSruVJyLQBrV8WAXWs
         SravIim8345TcwwvXjYeU75tQ4kL7jLhRajFS1OSDokJJV/2VK2hrLyNHeytc09YbPBE
         jM2IhEqSV04jlyvKp+lPOuB2WYY9aatRDk+LOTBeBnMlDt3YlDDVrTb0oSdatP/JD6YQ
         IL0Ud2rj4HI2GkkPVHkPeM+vv4EnsEOhUTSW45cOfdJ43h4sIYmtFzLdciJnJMx53rpl
         0bRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787888039; x=1788492839;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tJ6GRA/2LwQW6/jDEIjrj/TZS2ZKHOJ3XYsZbyYACDw=;
        b=NL8zF9WYUF5W1j9t9oMWKq4SlDHdAx+iSVxADoItZ5HzqhztWMicjsNhETz4M6WExw
         0Zhx7OxTwFexNle+JfmB0U4SY0YIMY81Hjqv311VPg87YDc7mfq5CGt8CBx28BakORIK
         2OnwlMTGCOJEJ1izGC6y2dhzSS7PO3hfgyUk2H01W2VHGqixpCK3Nc+eT0vtYeM+eb7O
         kKk8j9O4pS8w3HJlm3e2FaWUt4YF3/Y5iyEsCwPJmiLz4HBjV08NZTi3QEBDf4/7f1kd
         hpf6xsGZCTGvAMnn7j1KBSGs3QykQ13yHI0Xjz/DS1BGPL2fCj7v5aykjqqW/eiU+3eN
         4IQA==
X-Forwarded-Encrypted: i=1; AHgh+RoNDqfI9MPBpU6OPbOno4G7v7qGUu92dFXr/fA0UhfJMKxEtIkwi9Vy/yYdH9EDfWJX4NfkX0NjxTKxRHU=@vger.kernel.org
X-Gm-Message-State: AFuF++muqYgcY82ZUWY7rMjJj8hziTqhhZrVlDlV9z3vqgzf18Hme5K6
	ZnQDmkT1bwkEEls8oNKssa5UjZyWEHATHixTXryNJhqVtQUjK0maCF65rmCOtBflqr/f+jfr5X9
	D2fkMBdpNXn2qfG598ON7HtC3F/EtFcE=
X-Gm-Gg: AR+sD12LM0NvKg71X5CgBA5Xy93qyaXW1qwj3zKB3VSvhWrLqpBJdKih1JUIyp8K7zp
	944PRUKVFev4rZfF7DhmQFOhQCpHAu02w1VZfMkrcjXyuTYa3S1LbdZRwme/lDB+0b3IHcqfaBc
	vq/SKqbz8fQRk2qyoya2uTO+gq9pbI/Cl2hgzSxej4WjTGKcYLDERDTn63VqW3XHPiPHUORZIXr
	aCNm5JW7FVsBAqJbFp2RvWu1yu8zd/uChpBlqr4DGl+Je4JAR4suYqD+QWj/pViryth+bVNsqAT
	onfDHt97nHaH8Xp/zyyQlPl3ndXnqmyNxdQ6OmmqzzTT9/SLLcpc0tw6sNQytR/6otvKpUWU5yM
	AUviDbv1i1Nc/J1mFu/jeybBXXMi8dHsw2mlvPZtB2bxB
X-Received: by 2002:a05:6820:340e:10b0:6b1:67e1:fc8e with SMTP id
 006d021491bc7-6b1c66e6ce5mr2559540eaf.25.1787888038951; Thu, 27 Aug 2026
 20:33:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827185722.3234622-1-csander@purestorage.com>
 <20260827185722.3234622-2-csander@purestorage.com> <CAJnrk1YfTg-Lz+TmM+c=Asc8N4QGuY9_g8zUXtaNr4O7hG1Djw@mail.gmail.com>
 <CADUfDZoEosgMMQ47BDWBskTOZrYZpg6VUT5c4kwczDLRLXYk=Q@mail.gmail.com>
In-Reply-To: <CADUfDZoEosgMMQ47BDWBskTOZrYZpg6VUT5c4kwczDLRLXYk=Q@mail.gmail.com>
From: Ming Lei <tom.leiming@gmail.com>
Date: Thu, 27 Aug 2026 22:33:46 -0500
X-Gm-Features: AcwNN1V96G10EnqkMmlBEbQoJ8ihVOlJhML3SIuW3TsrH3jrmu0CBU7aGovmtII
Message-ID: <CACVXFVOLBVVGwfo+mbn+4jnGKZS66dL_2ghsKiaT6buscWJg6w@mail.gmail.com>
Subject: Re: [PATCH 1/2] io_uring/cmd: split io_uring_cmd_set_res() from io_uring_cmd_done()
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: Joanne Koong <joannelkoong@gmail.com>, Jens Axboe <axboe@kernel.dk>, 
	Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>, 
	Bernd Schubert <bernd@bsbernd.com>, Miklos Szeredi <miklos@szeredi.hu>, linux-block@vger.kernel.org, 
	linux-nvme@lists.infradead.org, linux-scsi@vger.kernel.org, 
	linux-btrfs@vger.kernel.org, fuse-devel@lists.linux.dev, 
	io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 4:44=E2=80=AFPM Caleb Sander Mateos
<csander@purestorage.com> wrote:
>
> On Thu, Aug 27, 2026 at 1:05=E2=80=AFPM Joanne Koong <joannelkoong@gmail.=
com> wrote:
> >
> > Hi Caleb,
> >
> > On Thu, Aug 27, 2026 at 11:57=E2=80=AFAM Caleb Sander Mateos
> > <csander@purestorage.com> wrote:
> > >
> > > In preparation for setting the io_uring NVMe passthru CQE results fro=
m
> > > the blk-mq request completion rather than the task work callback, spl=
it
> > > out functions io_uring_cmd_set_res{,32}() from io_uring_cmd_done{,32}=
().
> > > This allows io_uring_cmd_done{,32}() and __io_uring_cmd_done() to be
> > > consolidated into a single CQE-size-agnostic function with 3 fewer
> > > arguments than __io_uring_cmd_done().
> > >
> >
> > The conversion looks logically correct to me but the interface feels a
> > bit annoying / fragile on the caller side.
> >
> > Is there a way nvme can get what it needs without changing the other
> > callers? Would it work to just keep the existing
> > io_uring_cmd_done{,32}() as is and add a separate API for special
> > callers like nvme, eg:
> >
> >   void io_uring_cmd_set_res32(struct io_uring_cmd *cmd, s32 ret, u64 re=
s2);
> >   void __io_uring_cmd_done(struct io_uring_cmd *cmd, unsigned issue_fla=
gs);
> >
> > where io_uring_cmd_done{,32} would then just be inline wrappers over
> > those? afaict, then only the nvme callsite would have to change and
> > fuse, btrfs, block, ublk, and scsi_bsg could just stay as is. Do you
> > think something like that makes sense to do?

Yeah, this way is definitely much better from a driver viewpoint.



Thanks,
Ming Lei

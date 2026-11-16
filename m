Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794810417;
	b=x0dfo8JCtTUyz2tN4NJO3cp2rRh+N2C67cnn2fwd5XZOAP0X7z0jtVDAly3wizntFG9w
	 8y/WHH86TxaHVw7aQFzAwcFVU6PFTyoZiQcEqOOxnGL6uNamMmh9YZF2RMPuDJbIAMMwW
	 eN8mEzvV9Qg7/nWHoFjQ+rwSs7Nk0mtZCZ6KC9Msaj04IaOds2YU52Zu0LiXbG4zxr3vS
	 Yml+bj7SrDII+eli7CvbPStYyp0ny5HRHcKnV67LDhikfmWo82gf22zKxA5/ib1HRqWPf
	 shwra4jRlM2YagIvwv/yy8Gs55eZZqWRO4Ta1vC+y61UMhpVmx+ffbBzEfaHxlKAOdA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810417;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=wd/v+54C2+9hZ5vK2vynCTpvfy6lXgdEPXyeyseozC8=;
	b=fMcNo+cjpVXfDSTMdhKHP6PwvaoLdV7CunFlwZ+E39Sj2z/J4pMgcObQG/INZil2P+/I
	 6cxhBy4x+WIq0rwYxuFhOkjmIjcdS7M9POsQ4qcP+DqGMkH4q0wxZwQzmu2dH36vHq9VJ
	 kSK4G6ePx20YXqheKOK3EcNnk+ZH+W2Ac4PFltwUOZ8yh2Fp7VjoW2JHXOTd4UBoXWR5Y
	 HUtNDLV5DOGe2zF7FsfBpDsQHUg5a02P0gaoLRX+T4twJE70h999m+oA+Qqj/6wTIFaYD
	 aZYZnakMh3Pmn5c6I2qtGnUZY9StrIQerNQOFbEBXMz0e2ccqLmI0gVmuHOgihnsIGw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kCXmteOG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33A7606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:26:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F33A7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kCXmteOG
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ea7190aea1so10332085ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:26:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794810416; cv=none;
        d=google.com; s=arc-20260327;
        b=mTVtQla9vmdHwxvKmX49EBdqBch2rMjJhL0O2QU5kjFsquIi3XlDK1m1MJc4TWRIsO
         SEal17vP9Q0E66BHCThYmGbru+BDqI4Df3bJlwS3SfM7nPBhSXzrwq6b72fjUKQs3lh/
         6p0wWzhBSwWMRSXrIGtCRo+D+pvMdjfLsknY/pDZOPSTgjyuyoU3JUzMmahBzrNFLvtV
         KL+sC1LyT/3DyfvaL3WfOqWUMIjoFSH5Vx99zzWCrV0wSEC+f4gCVGNY8uBxTiyJRJca
         tsmHO1oZ1oGcc0zUiH1dcfkcB4bplTg8V86VZQ0od62HKhUq9q0HRC6SVUq0L6MUtwls
         p70A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wd/v+54C2+9hZ5vK2vynCTpvfy6lXgdEPXyeyseozC8=;
        fh=F9PuWdogo52uiVHW/ruAQzWalAFf8eJQl2cw3UZSHxg=;
        b=Y6pVTbvFGr2JjyuxPAAKFgtKIj6YyO14aIpFIAlQ2ocJvKcmNjuIbFGlxLXPmzIBpm
         maSKVIcuaqZg82sT5GT9HKhtZmlE2THsKgP7rA+7hGAB+VTtkH+jVLT64b7qMe3aLUzn
         bSsPSmJcW2wHF+10fft8egnMKrz7JpVh1YHX5uU4Mn0rnXW6YEdYCdedw3FCdCSdfaJu
         AVtJZ82re7mooWkj9CSmfHdA8w0UPUJwdKLqjDYATLfCFP65gOqokIsN4AnScEDsOhZX
         +mvVOEtkS3b6sgQE5bkM1yI4Nk0zUXuTrXCvCtWMqqHzsmlxvcQ7YZ6c874OCFtkGb8H
         4WXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810416; x=1795415216; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wd/v+54C2+9hZ5vK2vynCTpvfy6lXgdEPXyeyseozC8=;
        b=kCXmteOGFlIRiNajigys1uwla9KKP4B8RV5cZoAQXXdTrgwjLHpbek9rmSivaCKBPW
         R1cJYdsD9KKWtnWc4Fcr21U/S7rdFTwvmaqvs5wXYo32fjQlX/AQN23NPivVRr68wSR4
         +8edqNDvQTp7Kw4Z5gucX7bF4ytviHS0V1/44pyBpuZ06rX64T6724t14AcD7VcNx/Ju
         JT9Hr7/z/pvCEQAnhG0DmWiPWDfNVn1hNJJTVAm4SG7srlghKulMg/FCb/F2/xLpPSGg
         gQgiM7xS9yQOCaiDP1+y6YKgSngRbgvgvseO+iW/+7uJE+uBcv8uPyK6FYoaaM5MVCBg
         dELg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810416; x=1795415216;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wd/v+54C2+9hZ5vK2vynCTpvfy6lXgdEPXyeyseozC8=;
        b=MXyTaZ6HVGnB7QFwTfyrZy+yN8omkmXaQuu2FRahvw3p6vXVm9OWF9OeqyjMKridt3
         3yRB0lmT3BG8vWfYrKSvSRySMaK/3N9P+uHNaX16TX/BvnXtbYmbDJjUB8RW4gZqnGwO
         AMbSCYo9tSiiaQ4hgWz50+ZSoWFyYKaYxEnEHDTnxx4vwUR5h0EljKYMaE48ulvQalgS
         CIavYmWloVZjCPNBTE2egJu9VfsqQsookZJLfIH+Fb+6/cC5YgafBrb+cSf/bJJR4WDY
         AeAa1xJtT9L7jTdu0iJY90u1RXdB0E6I9L2onJPe+jBb8/Wk/rB1aQG8X3FA2rElRfi7
         dLWg==
X-Forwarded-Encrypted: i=1; AL+hErHY92sem6OSs5JxNb8ZHggHLl3nok1D+uJtd3SLuv6cy+QjNVkZ4KaeQoQC3iBPak+tplhe5SIKCJaShIY=@vger.kernel.org
X-Gm-Message-State: APuU4Z82ViJpZkmJKSPer9AnR2nNTg/YZVP1qESVbR8eepd3WPnjMFge
	PVZkvWIpwdB476QwiB0FvFufUsKdtInKnm7QDeTcW5deEWB7IQgtrBpatNArZxU9sjbsxBSaToh
	96XREUHWTUUK9bnz89u+2rBO+ihT+69W6tRsS
X-Gm-Gg: AZFdTZdv3+pMt2D2dZj3RJtlsGl+o1A131kLhcZ1ZNOi02BrctmcpSD089KdsPuqP/r
	HzgJ/9PXTYBgV5zmsx3yQZddiSKnknwFrsu0GjA32r2heOpi0Xsm9kYc5BCzz2BI+LY4nMVnkTt
	bab1LbS18Mk59Nahygpzl5woKD45RGj5kNC2hb2rlxD62J4ePPflY0ujZqcO7hY1VsmddwAMV2M
	cZEtxLumn/Juo/bPLJ3TPGQNIAfC9hpZjrGkC2edD78Y7m7o8Q667ZW7vYzBoUU4J3b0/fQzoDb
	QaeUalYECRPWzS1BLJ7ptes4L/BC4y7whoxxkjO1aUIriAsR3iZ8uZjvXELZB//vz+eoY0rwqni
	5NHt46S8H8ONbt74xSezOBVOoBhbB9EINEW9W2/03P2qrczWZP8AcLdoeMntMr8FypQ==
X-Received: by 2002:a17:903:1844:b0:2ed:3c25:782 with SMTP id
 d9443c01a7336-2ee0da7f5a1mr90997955ad.24.1794810416253; Sun, 15 Nov 2026
 22:26:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112140101.647-1-adrianhuang0701@gmail.com>
 <20261112183727.68afda9533aff699eea12cdd@linux-foundation.org>
 <CAJuCfpEqQQb1_UkWH50tgbdVz9KZ2anfCGWsvvoYFsnC_KHcjg@mail.gmail.com> <CAJuCfpH57DNEb5ckB_c4QTWiiHVGSHNhB=S6HFdjvJ6GgGNSnw@mail.gmail.com>
In-Reply-To: <CAJuCfpH57DNEb5ckB_c4QTWiiHVGSHNhB=S6HFdjvJ6GgGNSnw@mail.gmail.com>
From: Huang Adrian <adrianhuang0701@gmail.com>
Date: Mon, 16 Nov 2026 14:26:44 +0800
X-Gm-Features: AclHuK9IzBryxrXRbSIYeEf8bDFSSEJ-fF65yis3zCtQgIP3kFYe9Y881Oj97MU
Message-ID: <CAHKZfL3UxswfJgK+2rHj8Y-Lckbg1Kt+oVK4iyr0pkPWRmW6mQ@mail.gmail.com>
Subject: Re: [PATCH mm-unstable 1/1] fs/proc/task_mmu: advance seq_file
 position on interrupted VMA lookup
To: Suren Baghdasaryan <surenb@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, ahuang12@lenovo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew and Suren,

On Fri, Nov 13, 2026 at 11:17=E2=80=AFAM Suren Baghdasaryan <surenb@google.=
com> wrote:
>
> On Thu, Nov 12, 2026 at 7:13=E2=80=AFPM Suren Baghdasaryan <surenb@google=
.com> wrote:
> >
> > On Thu, Nov 12, 2026 at 6:37=E2=80=AFPM Andrew Morton <akpm@linux-found=
ation.org> wrote:
> > >
> > > On Thu, 12 Nov 2026 22:01:01 +0800 "Adrian Huang (Lenovo)" <adrianhua=
ng0701@gmail.com> wrote:
> > >
> > > > Commit 5631da56c9a8 ("fs/proc/task_mmu: read proc/pid/maps under
> > > > per-vma lock") introduced the possibility of returning -EINTR
> > > > from proc_get_vma() when the VMA lookup is interrupted.
> > >
> > > OK, but what's causing the interruption?
> > >
> > > > When this happens in m_next(), proc_get_vma() returns an error
> > > > pointer without updating the position index. Consequently,
> > > > seq_read_iter() reports:
> > > >
> > > >   seq_file: buggy .next function m_next did not update position ind=
ex
> > > >
> > > > The above buggy message is reproduced by the following command:
> > > >
> > > >   # stress-ng --vma 0 -t 60
> > >
> > > afaict "stress-ng -t" can send SIGALRM, but mmap_read_lock_killable()
> > > only responds to fatal signals.
> > >
> > > So please clarify: exactly what is causing this to happen?
> >
> > Also I don't think stress-ng --vma 0 -t 60 command reads maps, smaps
> > or smaps_rollup files by itself but I might be mistaken. It would be
> > nice to get more details on how this gets reproduced.
>
> Just after sending this I found
> https://github.com/ColinIanKing/stress-ng/blob/master/stress-vma.c#L536,
> so I stand corrected. Still, it would be nice to know how exactly this
> issue is reproduced.

The --vma stressor performs the following jobs:
  * It creates a thread that repeatedly reads /proc/self/maps while other
    threads modify the process's VMAs[1][2].
  * It sends SIGKILL (fatal signal) to its own threads approximately
    every 10 seconds[3]. This happens independently of the 60-second
    timeout for the command 'stress-ng --vma 0 -t 60'.

As a result, down_read_killable() in Linux kernel returns -EINTR.

This finding is based on code inspection and analysis. To validate the
behavior, I collected ftrace logs and added debug patches to trace the
relevant task PID/TID information. The full explanation is fairly
detailed, so I have not included it here, but I can provide it if
there's interest.

[1] https://github.com/ColinIanKing/stress-ng/blob/master/stress-vma.c#L748
[2] https://github.com/ColinIanKing/stress-ng/blob/master/stress-vma.c#L658
[3] https://github.com/ColinIanKing/stress-ng/blob/master/stress-vma.c#L768

-- Adrian

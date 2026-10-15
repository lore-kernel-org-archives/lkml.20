Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D095F43BDDD
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792094541; cv=pass; b=jkgJtbXfVba2rTrgHgW/R3lux8V2O8Zew+5kExUFH/2uFXLXVHjwQRNG8FOIudZTceJi0zDcS9pzPuX+YigtKN7jQ40gzKwAcTf9vu44vQ/5R/80VLUmDh8RPqOhv/Ilsp7GHD9uta1VC/kJNhH2a+kzxboSub04U8fssKm+0bw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792094541; c=relaxed/simple;
	bh=mTPvvAdIxgOtHuBEpEFyNQt8LStAshIksTq74xqzhRE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kd6ZC9sW7Dek6MaGOxrsWwxjBQhOtFx7roHCiSkYzuPX0bBIv3/2Po+4p5F648pmjR1ROTiHn4Du5+dA0OfAoEP6O+IQJ8v5Q81WHshZK3G0ZY0xnkpVxQySAensohBgfJgJ2Dr8u1neS1F12yfdeUYPdlPwF7poAALytYGujCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=J6tqORvj; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="J6tqORvj"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48df4f540ebso685810f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:02:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792094538; cv=none;
        d=google.com; s=arc-20260327;
        b=WKE/htqErGcxODuu8epxk6WZg51+Fpbh+VtZ5PYDhnb+zjwCOOtjEelbjgiF5sX9Nb
         4TylDwXl4POzjkO/iClwhCGLU0ePAbXxdl3nk73Qv6NVvyFUsPBOEu+UPmrVrWIrojVt
         XEEc7p+xExg1joFiqsPc+s5zPrmDgrbP/OpCsyc6dY1qctk+bBKKEsaXN5STzpWNxflF
         DuqAsZWwXBcF/hvy7Lb2z402UlvxxCw7O6BxHKRX73uKpjcCs9qL5+FvoLjvAOWpYbd3
         3ALAvMrZZD8lo3lUCDVwpftF2JB6NKgMYo6aIP8S7x0Gk2gesxyhqSRwfDh7DY+NW7Cx
         mB9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=adFghwGxsnRj3hxYZf8a4TwNZCzfV6GnTk1GcsiUceg=;
        fh=pp8BCgHAV8++vyHeFy9jdMYHl0A4Vc1q4OfDiIdwtj4=;
        b=U/I5HnzOI5lq6LuMF6hSADhXSzldpIXds85Q5ZV/iBuQLsu3FaMxBkDwRffQSc7J2I
         qj+R9ZksxlwcnbR6AfmeaEYA//fcgQOmek013B9zDRbcagC+Hp2JySIeNzkucH3TGOJs
         OXV6HTMNim1pM6ReGL5pS2YgB6CvtxfESluauzJ9RDFnMn8skotFjNkd9RS0bjQIVe9d
         QMT5ccVvFvWQWxaoy4HIFIDEjsJNMjNScZhrqMvf9frNPHA+mtwJKzzcE9WRIHkRGpiO
         nMr5/rF9XH4QotDqSHxXi4h+NBN5z7kekaIMzZTNQU8fB/ufc4aoMJnJ/weDzqvAqC0F
         QaVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1792094538; x=1792699338; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=adFghwGxsnRj3hxYZf8a4TwNZCzfV6GnTk1GcsiUceg=;
        b=J6tqORvjRuFkEkkGRW/2LhUoSr3JqMvg9Fg+4R6PXROwZ/ey/9K3hnFRKuH6BlyuaO
         6ndrOb40SHg0/bR7Hhl8I4CB9UHTvSh6t1GZT7oTU7j6bJkmb4nsg2m6Ydgghckt350w
         EGiyldwcAVUCimvFv7FHdpzwBV8EafymP4TSA+8Y9NHPPxdPk9dpujAsgDRWgJcR79zQ
         I6/xF9PK0B54QpcY2W7ZMuFuk8o04TQjeZ8rNfgdI5w60T/5gujFXfpfY0txIejuAhpU
         OM73573QKnsIxRbYpE5hzvvEFpIpqODEIuHQgoAC3LpBEEekPcdkrdWsCAz8QzasjRdV
         FkBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792094538; x=1792699338;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=adFghwGxsnRj3hxYZf8a4TwNZCzfV6GnTk1GcsiUceg=;
        b=q52WFEsSr7T4a7I3Z5a/OYEFLZ4GIUvkHhE7c7XSt4pXAONt3jGOGQRGt8bzMUNH3T
         OolqcyCx9+0Pz1bJOFaq2bTzERdxmC5lFUtCkYebB97/bZEF5dRRGSfF90nN10ESC2zS
         K/kQkKSA23V4mDyZ27KGSmaG+Rtl4Z9rCINaPXm7+5ZW9eMF1ImfeUu+dTORJySo+4dF
         KJJUCPldWoinR8GKsWZ5gaNJOMtbC07xAPoBXFsHU/GT4JUFcQ7MRUbOmWrdGYoy3RXX
         jIKtH9gG5ZF1Bjxdly4A2jlO8xoLF/1wVr6/xCRMs4w6tbSVYWRcn2csTZYcs4v5crfm
         JP/w==
X-Forwarded-Encrypted: i=1; AKwUvBxD8VLGr4y+0D/no83CXBXy7TTKMKj2BZaTwg0OzlT6ACAK+FgA1JJpvQ8fEowiTLvftcaUYj7aadNtwIo=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1hp+BSkHQKP3DhaZxfK657ehJMCan/641rwPjPpRWGEpEzJsC
	/WGhGoFCfARVUZLG2pRma6kSiyryKLIg15k2/Q9zJywp9fKtQ5T4jcKmKgR8D3XOCS+mWbidkGK
	9cTijKSfFbt1qOTlRd9usm1F57X0r5M7vdovs/esib+klCCJcNbq4w2hPancd
X-Gm-Gg: AYBFou3E/bLdgX2WxQTYhnSj5bv3luI6+26mx8zqQoGlsjxt5dz6rrekBtIBaLpNclm
	5cShDF5JDoqesY671g715DXqdcgnsl52AFvBOLXCarEq8aJdHxhhVK/7mSL9TPcgPtGFd6l+oNp
	oT3Zco0a0+vn39e79mPuVUxUZ6plXoZO4rCT3R3SS4Zjqj/7S5R9TMOgNqtP6JAudJEgYChcSh8
	w5AhR59LcM7fs89c8k+rYp6Bw1ZwUgNqppV9r++7iZyAiErDwaq6IJViEElUDwBGI+zevxTe5af
	UjnofrJZLZXc4IrutwGx5B61GBKQ9vSL3nvjEB05DwsQIN3v8zZ8jiYijNggtEA43h1OaVRPkTq
	6e8+ngeX/MsmgvJti9YV0uuZb0xw4JyIrjokXUpZg3KGOrg==
X-Received: by 2002:a05:6000:987:b0:488:7787:469d with SMTP id
 ffacd0b85a97d-48df14ed887mr9923470f8f.25.1792094538039; Thu, 15 Oct 2026
 13:02:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008192048.98833-1-artem@trailofbits.com> <askqkXhBORyXr-v9@mit.edu>
 <CAP3zxaC92rwQNCpuK_tXR9THQOecVoZwxg8ZUgYt=0iKiMsuxg@mail.gmail.com> <asrNX2qBf5qBrFLu@mit.edu>
In-Reply-To: <asrNX2qBf5qBrFLu@mit.edu>
From: Artem Dinaburg <artem@trailofbits.com>
Date: Thu, 15 Oct 2026 16:01:42 -0400
X-Gm-Features: AclHuK9tJDFa3d3xJEx_0hqszb3wpW9Z8si-SJpf2vKpIgukHzjFNUgs2VdIVxA
Message-ID: <CAP3zxaD3-QYqe588XGxzTrgAnK4OQC4aRfbea1Ln452mM45KBQ@mail.gmail.com>
Subject: Re: [PATCH 6.6.y 0/2] jbd2: backport CVE-2026-89566, CVE-2026-89567
To: Theodore Tso <tytso@mit.edu>
Cc: stable@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sasha Levin <sashal@kernel.org>, Max Kellermann <max.kellermann@ionos.com>, 
	Zhang Yi <yi.zhang@huawei.com>, Jan Kara <jack@suse.cz>, Jan Kara <jack@suse.com>, 
	linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ted,

> Note that some tests can be flaky. So when you see a test failure, it
> can be useful to run a test multiple times

Thanks for the advice. We are still working through the testing and
wanted to send you a progress update.

We have completed three full iterations of
ext4/all,xfs/4k,btrfs/4k -g auto on the same unpatched 6.6.159-rc1
baseline (72bada21be7b), followed by one full iteration with the
submitted two-patch jbd2 series.

We used QEMU/KVM with fresh guest and test disks for each
configuration.

Following your suggestion, we also completed ten focused trials on
each kernel for 21 suspect configuration/test pairs: 420 trials in
total. Each trial used a separately booted guest and fresh disks.

In those ten runs on each kernel, we observed the following flaky
tests. Counts below are failures out of ten, unpatched / patched:

Flaky on both kernels:

  btrfs/4k btrfs/028: 3 / 3
  btrfs/4k btrfs/192: 7 / 6
  btrfs/4k generic/449: 4 / 7
  ext4/1k generic/051: 3 / 5
  ext4/1k generic/388: 2 / 3
  ext4/1k generic/475: 5 / 3
  ext4/adv generic/455: 5 / 5
  ext4/adv generic/482: 4 / 2
  ext4/ext3 generic/388: 8 / 9

Flaky on the unpatched kernel only:

  ext4/bigalloc_4k generic/320: 2 / 0

Flaky on the patched kernel only:

  ext4/4k generic/045: 0 / 1

We are now running 200 additional iterations of generic/045 on each
kernel in each of ext4/4k and ext4/1k. Ten runs leave wide confidence
intervals: a rare failure could easily have been missed on the
unpatched kernel. The additional runs will let us estimate failure
rates and their 95% confidence intervals to assess whether the test
fails more often on the patched kernel. We will finish all planned
runs before comparing the results.


Thanks,
Artem Dinaburg

On Sat, Oct 10, 2026 at 7:54=E2=80=AFPM Theodore Tso <tytso@mit.edu> wrote:
>
> On Sat, Oct 10, 2026 at 06:12:10PM -0500, Artem Dinaburg wrote:
> >
> > Our initial unpatched/patched runs showed some differences in both
> > directions. We cannot yet attribute those to the series, so we have
> > paused the patched comparison and are running three complete
> > iterations on the same unpatched baseline to assess repeatability.
>
> Note that some tests can be flaky.  So when you see a test failure, it
> can be useful to run a test multiple times, so you can see if the test
> is a reliable hard failure, or one that only fails, say, 30% of the
> time.  So to run generic/363 10 times in the ext4/1k configuration,
> you might do soemthing like this:
>
>    kvm-xfstests -c ext4/1k generic/363 -C 10
>
>                                                 - Ted
>

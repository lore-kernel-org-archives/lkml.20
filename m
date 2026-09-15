Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBC848820C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789512919; cv=none; b=n+SRKeJf8Vhly06ZBGtmsn+xjcKp5uheEz4LTb5VVztEcc3Hdx/Q8SSrqAsCg2AGdED6qFEM5FZB8C3P5R3PcPZzgnTYOpNn4Rj4K5vhbaXTSP4L4uaChL1O7K+aqnsf45eEFdBZvEfmig8QS8HORTAG/rUN7C9qGOEQ145wUjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789512919; c=relaxed/simple;
	bh=ITz7hBythv5OWTbmQ9c4e1mzRPysX2+YTMbCrseTj6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QGYo+fPq7jEKjY56gAJDlYnrvmY94wbQ81dMfGMLFsQ5gizK9qf4iMSr37fxQhjgETYxtVSizXneXDfsAFXy+YjJ8mFW5Xka+mqjQdCdiva2kpgYSmVuFx+PrfNhZGpVafgYnNrKICxLIzCUKQyCwrd5ZbLgu8Mb6C1li9naTkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Bgi8Y6Hp; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Bgi8Y6Hp"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a9adea43b6so509058a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789512916; x=1790117716; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7NEEN5klK6sYQ7k8fj+V0z2WeSFVNwjy5fJJIdfiMPQ=;
        b=Bgi8Y6Hp01v2wSiRK4NN1xrqLDsWw/k6UUibIG/WnbKUEGBhTXuPUalIXrRmMhf8H4
         BCQqtiAjs5VUB1747pSTAWA4WSmSNQ0d1mMncEgLoomGr0rBY9r6REBAjkkyerUDIQ+N
         Vv6W4NN+2I5tbd814koSQQ1OsQqiO0xVDbfJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789512916; x=1790117716;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7NEEN5klK6sYQ7k8fj+V0z2WeSFVNwjy5fJJIdfiMPQ=;
        b=Mb5jClG0wgWB7gcwXEBeHkCTWsWHoKQikVzI0NBn+zLQ1Et6mIZYudkUjmGi9KQFZh
         iUK/s2oEYdgsnTZuRuDVYqhRboLrnuxn349l+QHjWxBIdECqofbHMq/Davl8xXYf5IZG
         5nrTL39aF9DKi83x/yV/lnlJEqhOEtx2I0+VyGSRwIuO6RXPWaKz+cID3g6K8e7WGfE3
         V3YgIECZuZvaVk3/gNosGQDwme6aWtEIt6eTCjQ1hogXoUYOiSR0PlektYY46rwDMdiF
         Sn7ghuyOPmo04pvqaKtc5gkFHR+qP6W6MKCjEmo51CeaFl68/2Mq8DqjcIH7LAgLIamB
         t6GQ==
X-Forwarded-Encrypted: i=1; AKwUvBxH58kCeTMJyGt2P4Su6SUDgPSeKvUXmxEMak/xrBkCBNoymzPQJts2GyGzPr1Ee8TDEhpriqW3mEStZCg=@vger.kernel.org
X-Gm-Message-State: AFuF++mVUHfTn6r8Cvw2Sru0ThZmV3DrT7h/aa+w05/vDyDRRYB2fkrh
	4muNvWXieGzpd9MatE3zrXaFmKda0zrtGuw/kuXVqFhc7kkEaVLkv+KUH3N5Q3j5aOi2m2ly0R8
	fy+sWIA/u9w==
X-Gm-Gg: AYBFou12pAKtX3pc/pIlUUyz5Wcq/1UqD8icJ1SLUrZF+npSsBAlBCb5LyINnQhD3vb
	/yEO9oQQ95JJEIOapgtvMdYlmjKGw4U1RVp4FFiZ3UyBD1UC0ocWsJ8cxFNTWvj365nDMqbPINo
	XOFgJVUydWXpt13saCIrCUthM+MU2c1SnNMhxmHuQ7lU9PtKbgbQEPUVv390RDJGMnH9Q5cf2Ql
	Il+8Iq3qZGorH6H7pT7D+YbI6NrycNzpIXf7vTmECxwN6Gy8Fyu7H62cEUtEUmNLzR/UmeSCm+Y
	juHz6IeeY71NVSc13hAnWVf17fi/WHgcZpaqT9lXca0y8ImUAa3VodULk30IMjyFnunpWGmNKGG
	v+aOF3xk1B0GDC19f6Pvmwq7/YcUdlBNbx+tSuC6Ct+x2+w70yDIHqjYCi1MOhcj/pWFRu8Cy0v
	QTntcOzFSq1KdIE7ekZO1cUDz7Mr6s3y8oTNkSy5nQzzSYgXkCJN5kT4rGgPq66kV93gn3UwQA2
	ig79SjkM0l85+VMqInqHpacn3Y77CaZsOqUlrUlg8dfpjJv
X-Received: by 2002:a17:907:d25:b0:c25:34c7:44d1 with SMTP id a640c23a62f3a-c29e4eaad2emr12554866b.0.1789512915732;
        Tue, 15 Sep 2026 15:55:15 -0700 (PDT)
Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com. [74.125.228.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de48af2asm33877266b.26.2026.09.15.15.55.14
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 15:55:14 -0700 (PDT)
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a98dfb8002so490818a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:55:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz/cEFAOZi4Xp/+ww4f9q9QP1XTia8eQlT43/eJGbOXFBLrjYiX879N/fGjScFmDtapFZZE4TmHjQ/S6OM=@vger.kernel.org
X-Received: by 2002:a05:6402:5d1:b0:6a9:a6c0:e5ef with SMTP id
 4fb4d7f45d1cf-6aa2244ef06mr218172a12.37.1789512913950; Tue, 15 Sep 2026
 15:55:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <CAHk-=wjeamU=_RYT9cR3dZJ2N-Teo-N1+aYh7jwhrB=iWXD0cg@mail.gmail.com> <CACSVV028AdnTYa6OKDeoJYCau58uTkKMgEdqTn7crNSV8QZxOA@mail.gmail.com>
In-Reply-To: <CACSVV028AdnTYa6OKDeoJYCau58uTkKMgEdqTn7crNSV8QZxOA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 15 Sep 2026 15:54:57 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjhJF91TCO0Zqeuf+caG2tQZ4AzbLr2qFmRmnMM4dbh4g@mail.gmail.com>
X-Gm-Features: AcwNN1Wx2MaYDtFtmeOlL6MnzYY7doY_FEPpziKatTBWbLOeKsjmritQ5JuAL3M
Message-ID: <CAHk-=wjhJF91TCO0Zqeuf+caG2tQZ4AzbLr2qFmRmnMM4dbh4g@mail.gmail.com>
Subject: Re: [PATCH RFC POC 00/50] file: handle files on syscall exit
To: rob.clark@oss.qualcomm.com
Cc: Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jann Horn <jannh@google.com>, Jan Kara <jack@suse.cz>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Oleg Nesterov <oleg@redhat.com>, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org, 
	netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, bpf@vger.kernel.org, 
	David Airlie <airlied@redhat.com>, virtualization@lists.linux.dev, kvm@vger.kernel.org, 
	kexec@lists.infradead.org, linux-hyperv@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Sept 2026 at 15:21, Rob Clark <rob.clark@oss.qualcomm.com> wrote:
>
> With fd's it is more than just about error rollback.. exposing an fd
> to userspace mid-way thru an ioctl is an easy security bug to write..

That isn't very common code. It's something that is done by a few
strange cases, and yes, those cases should just do it right.

But "those few cases should do it right" does not mean "make a whole
new subsystem for this thing that makes a simple "open" actually be
slower and stranger".

             Linus

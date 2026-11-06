Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793995833;
	b=4mFWOCNoFUbQewq/hPntgHS3z80ce8yyo7PseCbhKdaz3epuSNeAqvPZqzkOhKtLdGl5
	 60OhA36ZI8GWBZmvGYErYbP75u2ts3w1Hx8k8SzjtDhqYlTfRCzQgcFGXodyMcY6qf/et
	 7tueNBjvLYmBca2wfnc4FUsLCQQdz+R+0uoZac9vEtfdrL8zOvFBL0zPmD8nASIQfHYgp
	 wvHJ0lAbIx7tvwvJaaAKYwECb62grGoXU3GUnRvW84b+ltibl+rSrExuXWsCqAmIWTRmW
	 cyy+BzVHQls+pHoVAIpNnUysMFyWN+medcInJ3owYyvsu7FaMHqDII2SE0bwTR+z0Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793995833;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=1PuD9l1hH8OOyees3FtjiIDpzh8LbMQefMah40HN15c=;
	b=M+UJ4UXM+OQiyoLmqsAKGo8SKBipG/3LnAaB0G2ohYt7h7ug5nDBaYJpSvc/yDmey0LJ
	 wrpOLrokHxShE/MSZEuo2ZZq3wiI9ew/odCXcZgogkItsFzmY9BkxLkXcZNDxoWsO0n56
	 bpTV+IXEaHaqS0cRzaX3IPUzoxI5CNaxHr0rb3m6+CgtvkEzwkBwdl7V9KZv6Uk8KcfV+
	 nHzO9r6qsk2zUywYvZa4fF2wnaFw+vFtY5fYdVlX8RqX6GfetJb6zlWHbZ7y9RmvVldWM
	 CwGcLIruD1LnQDHl3vPxsH+C5Fe/5+RF78rs4MSLMbxZ7At01rB6KCwxKaUMSo4vc7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=MhiSgMfh;
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030DB606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 20:10:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 030DB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=MhiSgMfh
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b587538a37so1382436a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 12:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793995830; x=1794600630; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1PuD9l1hH8OOyees3FtjiIDpzh8LbMQefMah40HN15c=;
        b=MhiSgMfhijLptj6lPoTvX15KIY6L7UlXEWtu97bHRZz2RLdkrQhDAYF3a8hG5uTkNx
         oHVwliW9gsROgYSfdBjhX+Nh6TF/9br2CYUuDgU72TOoDW4LsCGk5SWbytkkwtJGF50H
         1Z3npzHxuc2viHhG2m8aYLruxeghjRkW0mYMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793995830; x=1794600630;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1PuD9l1hH8OOyees3FtjiIDpzh8LbMQefMah40HN15c=;
        b=FcYb6c6Hiota692Wpy8ReY8gNeF4nDWDooJg5C++pt4D55oEuU89+n4cD/B1kwenYz
         HVOIKdm2qk853PFmWEnwMtAXkRvBcdXjZF/0BNtA8HRhoEqi8vMNdGw49mOyANp516iz
         8uVUGzmmaxNumDxx6Q9iZ0Lqhmim46jT3IYl3taYpksWWHNEFBuEUTetOqf5fadLThHQ
         Yxxlt+hsZ5rBU5OGRlxn4Mf3IVMQ3JV0n+xhR+OPDF8pO3H87skG23+tX5PKPTwXC+rf
         dzV8sPugfx324NdiSWqyr4Ef0bRgpjAJIjLWpVSI5He6MDmrMIBXvOMTvrYmC6ic7Le5
         iqQQ==
X-Forwarded-Encrypted: i=1; AL+hErGWuzxTBFfdGTNnrOwLiedfcMfHqqJawlFc82s2TjmnGqr3NwYTcs5onKVy6KYYy8bIFFyjv4BqT7u55XI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8n0vhZR59ksgsQm06o1K/nFO/St5y81LX69tYaZ7HP8O1oEGoy
	An0sGfxUTxNXfMlABWfe35FGL0R+drGzmypKEwd3PXb3aZy5pJUey9nmBLo7r3AsK92Z45bVlH0
	Rfmxe4lJJfQ==
X-Gm-Gg: AYBFou14jyFhNDuj4G3+MFUqOWuBwJk0zEkIpPXxUPb+FcMgc1PzaqMwVLSQWz10v5X
	F2bXO44f09VE4gKDG3bWTeTzOYkMPhtEUtS3e7WIi+S3FkiZ/sIi22kMCitnLdMCVdNe0wui97L
	tu4ZUkka2gLCTXn/pkxgfevwH3S35IfuPHEZ6N/H7a6+AKjvdcVc08Jlas076J3AQUCTm3N6auC
	KS2u4z4Mz63ZKDWN4sXV3U94rOhcCTUr3L7hb3WUMD7BtWaeKMgEgwuQQogtG97w97v2EzmlGsU
	WCZY4EAL1GHj7gHbwN4uHEGjVrA8CxpQFJk7h8LdntyZ6npQ4ttoTgM76Hyqk4wmTUM9u/i/Z6t
	JM04M5XTxnAA8C/5onkUk0dYpdmdGxxOaY4Cabyo9iCXkowtkHuyW8cPFKECjDdTtbcI+YMJuYw
	6UTLWW6mpYFPieJH7A1TBLpzV6effK/1b79B7mMHTl/eZd5sjw7G0D468G3w5nKu2dd5yHwDIlq
	shcaXh22orJjxoijTrofBY0mAAIQ1H69akGuoPIJc6ThVxsrdm8UJvhnJp+yPkEPD9B9hiJs6IX
	UYZSIc2BeEGjeM/2sRqvp9EsqunNO3nUQ2NFZq5LA4MTUfFyH3gUHiapvH4A432CSv2KUzwnEPn
	xSA==
X-Received: by 2002:a05:6402:234b:b0:6b4:597f:9bc7 with SMTP id 4fb4d7f45d1cf-6b5977c04c9mr2507011a12.13.1793995830151;
        Fri, 06 Nov 2026 12:10:30 -0800 (PST)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b669c4dcd0sm1017630a12.35.2026.11.06.12.10.29
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 12:10:29 -0800 (PST)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b587538a37so1382409a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 12:10:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBytMvAG1bXSGx0ow+V1aI5E8CoMxh9UmCjJVGGcs3O/r4PCRYH1EH9jZQsJS6qn4U+jk4eQZCIM2YPCQQg=@vger.kernel.org
X-Received: by 2002:a17:907:97d1:b0:c2d:ca32:2176 with SMTP id
 a640c23a62f3a-c4d3522bf11mr295774766b.8.1793995829552; Fri, 06 Nov 2026
 12:10:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-fs-v2-0-319e0f9a8aae@kernel.org>
 <CAHk-=wj9Y9NcOesBBm+jhPjYa7qO00fD7g7uwX+H-k0-R2difA@mail.gmail.com>
 <20261104-allein-bepacken-hitzig-5e517d3c129f@brauner> <20261105-genehm-dachrinnen-infusion-9cdf4868d32e@brauner>
In-Reply-To: <20261105-genehm-dachrinnen-infusion-9cdf4868d32e@brauner>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 6 Nov 2026 12:10:13 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgLpWDjmcNWphCMkKXKwuZsa8KWRPvJ4j=C_ktCL4gBzg@mail.gmail.com>
X-Gm-Features: AclHuK8u2vjwLORBZ85ALxektHeJKK64DjU4CTV-vhgdh1gurlxjwUzbjkbzF94
Message-ID: <CAHk-=wgLpWDjmcNWphCMkKXKwuZsa8KWRPvJ4j=C_ktCL4gBzg@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 00/30] proc: convert the fs, kernel and mm
 entries (Part 5/7)
To: Christian Brauner <brauner@kernel.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Jann Horn <jannh@google.com>, 
	Christoph Hellwig <hch@lst.de>, Jeff Layton <jlayton@kernel.org>, NeilBrown <neil@brown.name>, 
	Josef Bacik <josef@toxicpanda.com>, Chris Mason <mason@kernel.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Nov 2026 at 15:35, Christian Brauner <brauner@kernel.org> wrote:
>
> A git tree with all of the patches can be found at:
>
>     https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git/log/?h=work.procfs.cleanup

Next comment:  3c7a6276d211 ("scsi: core: NUL-terminate what is
written to the host proc files") is nasty.

It does compares 'count' to PROC_BLOCK_SIZE, and then after that it
just allocates PAGE_SIZE and does

    page[count] = '\0';

and it all *works*, but it depends on that PROC_BLOCK_SIZE being a
random value smaller than PAGE_SIZE:

    #define PROC_BLOCK_SIZE (3*1024)

and yes, the minimum page size we support across architectures is 4k.

So this is a "it works, but it's still wrong" kind of thing. If making
changes in this area, please just fix these kinds of issues. Use the
*same* constant for size comparisons rather than two different ones.

             Linus

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793103048;
	b=C1qWCUkCxQE3gKOnNclMqxdblUlSUdKdRiK9Cn3exkuJ9dcRQEJ8f6x6wsqFNZPXWJJ3
	 07q/cIO2+ZsPusbIv+iRFYXacU8CDdvK0XK1gBfxLixoE8IvcdyADPIpkl2V4d8sdbYBn
	 XArMZuSttYrkxtegTIzXbMDy7M/GeFyXCqxAUtW2jg0Qn0PTatiGdRGZJQ5kHiMej0Zdv
	 sAHnixOk72yQqqOyW/vvhfTx0xIxC7Tbrc7pZbSFT8lhVGZeB+MYtad//hwvzuDijkx//
	 z+jIjiD2Sd+gRWn4I9uFU1Lp6Kl294EhixefvwjssZpZiWuqHAjgTVh4yztbUJtVnDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793103048;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1VQjrw1Euxi4TbH9hbPniZhHv8s080YQR+PmEDM4C/c=;
	b=aiqho14ssy+hAwcvZ27nEmQJUPWQWHtFZaAPq974V6IwHnCpnwx0oF9h5wBF+/Qt9epy
	 SgWK1SvIG+PBM4ZOaxx3PbBOoUlSArM/B0xcXrqcx2UdJVhNq5wJEv5r4hgjMkk/ceJzy
	 gOkv9MchA0OTAlOC9uKNte8dhekqnagonRR6vmszG+rXWAtAHWhLmHQZILm2X74jXLkbm
	 ZCdBvQZ4f+2snv31heaGScyT8msPzgdTDjASUWmgAC98okQWDOgtauWrZxQrTvA/LwjyF
	 L9LTxTuQbpC9dZdrhpyt5ZEHj26Y2/CXJLXbum5ZjRL8sUd9a+1F0fycKL/HtVS0iWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hackers.camp;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D13606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:10:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89D13606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hackers.camp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48dc1508191so603943f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:10:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793103046; x=1793707846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1VQjrw1Euxi4TbH9hbPniZhHv8s080YQR+PmEDM4C/c=;
        b=wih6xbxCVdcA6FbrXfkIPSqJXcwQ7I7Sr5KO6J7ihbW2vnaBxKgbeZ2ioKhdOKECsS
         chDeTsKkPjMws0t0ulvKIfFSGnnwGm1JbrIA6kzz/qeAL+0G77QvzCHEf+F88Uu/0EC+
         6/EVwCozILl5OUkKgyUniTrYIncI5OgbS59UJiMBM4/8D4Idg5PGiW6+D9AbiG6l+b67
         //knFPFjky38NzxnMZ6ExkTB/gaiAZs9lSxFR76KZA56NSMbVSq/l/EnFXsv07XbkB4s
         v3lK3o87rw6JUgENpu/6mutznDbfZCcp2yYNkIq7yPinrfeLbWzblXJxJFrRXdGaIXVD
         pehA==
X-Forwarded-Encrypted: i=1; AKwUvBzvJ0I6efcX9RIPsmkUAMJqmCYPdtJnVCYLMqVfhjfXX1oRXRhZzblZ0olKIkF8dPrRgVN1g6g41JC3YyI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYShcqzsPZtEdscKvrktAqWvJjlkApCKOGLsoveIskPgMLgHEO
	bvvI5inRB6xFiPeXRj+S3K7Ej+Gz8gOwL5ddsLKmjZocWVDr53ypLYJ3
X-Gm-Gg: AYBFou3Qw728xwqX5iAE1nehicepn/y8DBiIBzD1ilTn68rAyfxGCgdar4IN2qWDX3D
	MlwqAxVBja15vIF+EvaK72tTIrCCyDyOUX9mZ5/hQgdIG5SaPPyT8Es5vRwdHUA4/G2FJI6sWtM
	bxEpag85BVd5hiVsQRGdT3Cw+6gxb8P6qDsg1E174a/XAQksidSptmgaIHrvRImlw9bo5Dmsn02
	c28GeKX4uJ7LAGsFcgfVv5nAh5fyvwGnbdB6Fa2/EJ4Ff3Y2o/LXZqKXqd9FCW6OF9rLEb3IUoF
	6HhkYTm11CfyFVkC1fwJXzk0nYED6qWPTLHEFcKrhzLqr70aYB6CR9hZOR2rCE68Yw2Sd7TTjdt
	Qv+HrHGyoPFoSAoNf3qQ3XNwdxgwOV1kX4YhPY+BB2Gj4CCCq4T4VAApl5RTRe7kD/dDyx1+U0W
	oAt3EWocHcdlNLjqZrsSiy8JdcAfGk9twvmaHPbcoKoRMhzkICiybwm5a3HiISI8/TPi2oQUKl7
	atNtnrq8h5MtZgISYNma/8tY2kRCh5DxgaZyLlbTWoM+Q12ie24mGe80yLnOLWv/n5m9RQgKZIo
	GNv7sEG1+W6BpEBJDA==
X-Received: by 2002:a05:6000:2406:b0:48c:6611:82 with SMTP id ffacd0b85a97d-48e3eb2b637mr20593069f8f.1.1793103045646;
        Tue, 27 Oct 2026 05:10:45 -0700 (PDT)
Received: from spartian.home ([2a01:cb1c:76:ed00:602f:c5f4:d108:b925])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f387sm22239473f8f.4.2026.10.27.05.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:10:42 -0700 (PDT)
From: Aurelien DESBRIERES <aurelien@hackers.camp>
To: jack@suse.cz
Cc: brauner@kernel.org,
	willy@infradead.org,
	viro@zeniv.linux.org.uk,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot@lists.linux.dev,
	syzkaller-bugs@googlegroups.com,
	aurelien.desbrieres@gmail.com
Subject: Re: [syzbot ci] Re: buffer: warn when a buffer is attached to a second mmb
Date: Tue, 27 Oct 2026 13:10:41 +0100
Message-ID: <20261027121041.68485-1-aurelien@hackers.camp>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <6ae064e5.768774f5.3237ab.0015.GAE@google.com>
References: <6ae064e5.768774f5.3237ab.0015.GAE@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue 27-10-26 01:46:29, syzbot ci wrote:
> and found the following issues:
> * WARNING in __ext4_handle_dirty_metadata
> * WARNING in fat_add_entries
> * WARNING in fat_alloc_new_dir
> * WARNING in fat_remove_entries

Jan, thanks for the Reviewed-by. Before the patch goes anywhere,
syzbot answers the question it left open, in two different ways.

The three fat hits are on crafted images (two of them print "Invalid
FSINFO signature" first): directories whose clusters overlap, so the
same buffer is one directory's and then another's. That is the
multiply claimed block the cmpxchg comment is about, on-disk data the
kernel does not control, and a WARN_ON there will be filed as a bug
for every new image syzbot finds. If the assertion is to stay, it
should not be a WARN on that path; a ratelimited pr_warn naming the
device would say the same thing without a splat. I can send that as
v2 if you prefer it.

The ext4 hit is different. It is the nojournal branch of
__ext4_handle_dirty_metadata(), reached from ext4_xattr_block_set() at
the "reusing; refcount now=N" point: an xattr block that mbcache
deduplicates between inodes, by design, marked dirty through the mmb
of whichever inode reuses it. That is one buffer on several inodes'
lists in turn, in ext4 without a journal, the shape the warning was
written for, and the window in mmb_sync() applies to it. I have not
reproduced it outside syzbot's repro and do not know ext4 well enough
to say what the right fix is there (mark_buffer_dirty() alone for a
block with h_refcount > 1, or a list of their own, as we did); that
one is yours to judge.

Aurelien

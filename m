Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794292738;
	b=h1KwXNo7/hmzy9V+jgaQrLHFI0D5u5wDfjH0wYlBXggSU4D4Ysl9G8+rafRbr2533KZC
	 djwZpfZIjbw33c6YI/0MnOq5oyOlT/Z72IHxoDoZzXFmzT4uWQbuDOJ7WqB9DdNWDmmBN
	 hZoau7bTiIU/w8dLW8aa00EX2jt9L/tH44YKz09w/4DLG/sFraiHWzi6luEj7lSfPSuGG
	 03++XcnIMFnVhT5SRCzSzYJv4RS1sWZSqiMSM7cQcbdwJTvZZFx8MSPAKUeLLOjCXC/eL
	 ef/5MdOVoq606vk1cFZS6rayMNJple0jME3P1qzD4ioAV43RU0ZRaAE+JzhNvWatqKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794292738;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=xGnzNpbW5HBJowHbelE8TIAH0CHLKv+3lpr5Rd0UybU=;
	b=oyEaQgRTBKS5dz2JvmyanSolLuhImhdUHYy0cVgDrbjW4wibqvWsbqijuLoVysRmq+fm
	 avz542Na0w0ANeGcd7oZqyYsKfeQ/fNURNVAPaLtNZkBNMvXLI7DxoV0oVUTWQCyUn5VO
	 iwwg8L9rYFPqbKrNoMaRvBA0wB3mcBms1DVTebtKcRybVJi7LY5Wa6fXKt6eqa/pPqYzx
	 APL+iWfAnGjYstVRBxREIaCqNbL+tXj3QAKbZVYKdQ5frVRL/qUWFu/gK0jm+wnFHbvjS
	 FjhqLeOqNh7Ht/I6hL4tn8UnSwIubYBLLFBVfM5ToDT5JCB2LQEMhI0iOXigMoUznww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lUjbyjdq;
	arc=none smtp.remote-ip=209.85.215.200
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0628606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:38:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0628606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lUjbyjdq
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc4216aee8fso1877651a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 22:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794292737; x=1794897537; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xGnzNpbW5HBJowHbelE8TIAH0CHLKv+3lpr5Rd0UybU=;
        b=lUjbyjdq0Cdy/5hmHfWdhJaKgFI7fDoSFMrmNdT1apdPUGgqHYEJPpK602EQgZubA8
         lI5KHZU8Baq2CSU7na/Plt9wQEnHzajJ1QzZlUEi34qjWkKzxqExnCpGW0YHA4AljIvg
         wX3ZtrFSbSGq46i6xgqbhdxIyzwP6i0o2Mw3d4DdZsOqIw57bS5eVSo2GbBKFCFgEcdK
         AlvrGGoqmqcR3R0LDxkFNvbnlEIpdT9im9A37TihAhOjc5WTrd65PRbnrZvdM8WZvVGB
         +aqz47nKcu3/P9gsdfAhMVxiY4EN1qK+NBbQF1ahO+m2wUwYjqZVDjvBR0ZGLTNAl49+
         mNgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794292737; x=1794897537;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xGnzNpbW5HBJowHbelE8TIAH0CHLKv+3lpr5Rd0UybU=;
        b=BZSBpBh1ijW7tdfFtxUF/9CvXs7ERQ2nPUSKwjk3zqwfN9T0vNhcwjA7H0GhquBOQM
         Pyri0VGxe0VFBCLT0DcULezAkVnSRDPS4BSuHMFR38XBsLL453iBa0VuEryNTP9neKxs
         YvJuldAuIvEN3zuboPoREpppp7giM60Mim1+YFrGQjNCE5ztn+K9r7xTtzYu9Csfmb0f
         5GwXL3GdbX6T8I/S8A3jqb2JN3q3hvSryi2fcOq9mkgHX/zT3WdgURvWVgMnRR2DXOLz
         yJdPGsthljLinuf5PIPw32UoVZ5obC7He8PbtGSOpuX1tyQJ6yczyfKS6T367DgbOvrm
         za3Q==
X-Forwarded-Encrypted: i=1; AL+hErFZmCCZSmtXGYjvCedwTCxYKHE0ALTi2Lr8oYX1NqCszJSJ+oivF5tsaza0EHIPMfMChp5HxFnN+FL4LH4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cGfGsTeSyp9xn7ERWRznIvKPPVBCIO6/wt5U8+Zqm5nTLohvV
	hvylL58AzhzjJdGj86ogm/1nMDPx+ALFx/Pu10GNfME6KNdfYuKZvOUUYFtMPBVp8+AIkiR0twX
	t7farZA==
X-Received: from pjsd12.prod.google.com ([2002:a17:90a:bf8c:b0:3b0:994b:db90])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3889:b0:3ac:3e42:60a2
 with SMTP id 98e67ed59e1d1-3b166cebaa7mr2018376a91.33.1794292736895; Mon, 09
 Nov 2026 22:38:56 -0800 (PST)
Date: Tue, 10 Nov 2026 06:38:56 +0000
In-Reply-To: <20261106051905.218638-1-sidchintamaneni@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261106051905.218638-1-sidchintamaneni@gmail.com>
Message-ID: <avK7nGo4aGxJ7QiU@google.com>
Subject: Re: [PATCH net 0/4] af_unix: Fix inq_len and scm_stat.nr_fds
 accounting leaks
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Cc: Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Willem de Bruijn <willemb@google.com>, Jann Horn <jannh@google.com>, Kirill Tkhai <tkhai@ya.ru>, 
	apais@microsoft.com, rlmenge@gmail.com, hargar@linux.microsoft.com, 
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, 06 Nov 2026 05:19:01 +0000, Siddharth Chintamaneni wrote:
> This series fixes receive-queue accounting leaks of u->inq_len and
> u->scm_stat.nr_fds in AF_UNIX sockets, along with selftests:
> 
> - Patch 1 fixes a u->inq_len leak in manage_oob() when an unconsumed
>   out-of-band (MSG_OOB) skb is skipped and dropped during a normal read.
> - Patch 2 fixes u->scm_stat.nr_fds leaks when an OOB skb is skipped or
>   freed in manage_oob(), unix_stream_recv_urg(), and
>   unix_stream_read_skb().
> - Patch 3 fixes a u->scm_stat.nr_fds leak in unix_dgram_disconnected()
>   when purging queued skbs from sk->sk_receive_queue on disconnect.
> - Patch 4 adds SIOCINQ and scm_fds (/proc/self/fdinfo/<fd>) checks to
>   the msg_oob and scm_rights selftests.

I planed to drop MSG_OOB support in this cycle.

Could you repost without OOB changes ?


> 
> Siddharth Chintamaneni (4):
>   af_unix: Fix inq_len leak when skipping unread OOB skb.
>   af_unix: Fix scm_stat.nr_fds leaks for OOB skb.
>   af_unix: Fix scm_stat.nr_fds leak in unix_dgram_disconnected().
>   selftest: af_unix: Test SIOCINQ and scm_fds with OOB and dgram
>     disconnect.
> 
>  net/unix/af_unix.c                            |  69 ++++++-----
>  tools/testing/selftests/net/af_unix/msg_oob.c |  12 +-
>  .../selftests/net/af_unix/scm_rights.c        | 108 ++++++++++++++++++
>  3 files changed, 161 insertions(+), 28 deletions(-)
> 
> -- 
> 2.43.0
> 

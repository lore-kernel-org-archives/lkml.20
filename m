Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794831924;
	b=aOON90md6nVhIzILidzw8izWK7TJqrR9+GQYPXxiykGYgHZhvfTrkNescoCF7HjBbMtd
	 /MG57T+41+rxDuriwICHK4YHWFJh8x3aF7CfLgHHLlipzkZCZgiEx8TT7qbOzaxY8Hhto
	 AVPl6n5doC4k/QZZ0YVt1b9nlXgWAsKPsbdK/cxfwvn95/8UEapbaDvDOtEatKY+UFCE6
	 QOWasSnLznfNdYFyn12JjzPyEts3mlQgbK3u9juJQx2+5fKrfJokc++pPAmP2Vvr46e+c
	 esbUf2haOiVt/ATH4pG8A0uagOaPFpTNTTr2MuAl+udasuTAmhUYgtXnqPq1bJ1apvQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794831924;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=/PiMcjQOkt2ak1BLcowjZuDxANqjoy7CFeucPyIKk0k=;
	b=KGHiq7FO3FnVu4v7YvL/JGSBVtAO6j8wzQfqJX/ASi+pclmOfphm4TQXK4afuN2Gkxm7
	 St4KbHl2c6fZ4pir/PYRbyfmMrAWUzMYmrxGmMrDT6riKKB5+HJNT2C6hlcueQulGlbOW
	 tuDpRudEZ1i2tIEZpmzJIRjOXbj7rj33RUQqCuE767RpTQ9HTWXYx+7m4zQZQRTsso1TS
	 taHI37UDlywnu0GvculZgyIg+m47j8n49NXF7sAdzlTlrVkqSqe9EoM++ldFsoek+piM0
	 chv8KVM2xzaTSNHIq6fZ9RDzolF/zpP/q9KZ78ysRx8kCF1TcqbuCp5T8oFJnZPckFg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Io6RcOzD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.170
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41208606A336
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:25:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41208606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Io6RcOzD
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3acd523a802so33843061fa.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:25:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794831920; cv=none;
        d=google.com; s=arc-20260327;
        b=js+AfjmAipLiF2Oaip0sGnaMyKjv2jzLJ0Cuqt6TPuzj8OJSHTAp4CdWCqIz7Dx0xP
         RQ6l46sflUF+cjqp+Oq7Fb0G/S+4XCbYP1K47x5b/sPoMNfJzH1ETo0n3JMPUueNKgNL
         invwEEMw7jgChAE0DEChsMjiia/kYHXNIPAolc9f60nueRZz6qcQsN7Ro2fjJnrYriWd
         D+LQjPxn2Z6UaFffP4K2TE7sz/+H2lecXxdX+onkgFcnHep53Ch0RWq5tyXT4zFGSBOC
         k3ab6PCyt/AH3p6yLDFL+NPDCer1lhwMqO3XdthFjB2DSo/aORZ7HDl3o3FfvLWZF2x+
         Bcaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/PiMcjQOkt2ak1BLcowjZuDxANqjoy7CFeucPyIKk0k=;
        fh=Kj64QI36aBtUJ3etjIfyOPSFxcsSTxbQiRbCW1PMCv0=;
        b=E8ffQQ0w6NtXap1oAn/11w9noOKzyskwSLl9xJmCc5a0RP6pSLefXWitHhMPrZCkba
         v4oFkRwBFnqy/sMKKlehaD1+8C0xN3VIaHVMgh5eccIE/iG4zVgFVviqwofTStJMEFc+
         6QUyd8Pv3Qn9jv3O/gD8qs/hOm+q2VdpdS5rE2qtVTh4nJcB4LwA0VyHp4ChhiZUJ43z
         aVU009kkP0bmo57gJZKhX9HA6O0cS0kbGzSQ1oRJiMu8ktZWxbWNIluabLKLJy81o9mx
         goYFi7F0Fj+3ficIe4Df3ADx2uwbXH+fDuylovYbJdtByyYQdlWAdfnPht8yvlIomFYY
         od4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794831920; x=1795436720; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/PiMcjQOkt2ak1BLcowjZuDxANqjoy7CFeucPyIKk0k=;
        b=Io6RcOzDR0JwQSOMZ2h/dhataExRAczwSTQYM2gQGcvveSLFkoliJjGCFbhzZ99VwP
         9xDPwkg0P3o4hEJS2bKPbWl/SIDSTT5vif+ZberzXGPC1gJ2yEZDQb+TVWFrP7aBagAM
         RYdX+hW9Ys6Vx4eHmulxcgkFXEX7FzLwsnbKwoKQeQrQcqbGwro95zEANdjKwE2PWuPO
         I27p838Yp1sAveGpu2sNwbQgbBkK3CP3eIenSSnNb5EWDY7e7UYKfhDUJw1t460K430F
         P2ILgEKZwkxcbRYmPC5i4YfVKTbPg9BldMzn191ptyulfkn5XEb6Zl02u/O5HvzMmSqI
         FM6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794831920; x=1795436720;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/PiMcjQOkt2ak1BLcowjZuDxANqjoy7CFeucPyIKk0k=;
        b=KLuCHfr7uwwN88htQSAzyzKtEqFSxuCS2lUYsLCEJBqowyuV/FEQkuGeIIF8ZZOfml
         M/3P5V81TGydiTaO6nWKaH1LxwUTNbrUSgR3Ry/HP+fwSbRGEB6nM5+Z39+q+mGncinu
         qugOqOFgm/hKCp3MhmgeUBE9/UoSlRR3BCfBr/GsQMqSnrQK2qXGaaj4VUXTjM8E+gPQ
         67i9BS26GHo7xWkWoS7rw/l5zJM51Cej5U7+KRYzwgrmCH3zldHnjgcjncVvGzoZzfRB
         6iNe/jmytudOjCMTs04c+is2zf8oIyiZuqm+eGCDOrempBYyd/GyFXl9Pk+vrBwaZVjd
         /JTw==
X-Forwarded-Encrypted: i=1; AL+hErE0e5jcTYKcku0TNoarkcj/Plgh04t4qZHHWw1qH3NjaIOW80GB0RvlIY3lVS7G9gYkB/pP7Q4xXCFY/oE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+05eSTa2r9OeGPLvjNoMWLnNCVWZG1ikKSpnC8powx10UMv0Vy
	CuJ5yG1YItbqFwjUdLNiQQxVZJ3PpaOv9GZTm7v6Bh7luxVuhprTwdY8Ow9jVp7qkjgGBNjhQQR
	Mijt5pf7x0FEVfnndSCERnKnYHkgZhp0=
X-Gm-Gg: AYBFou3MpHCU5OURk9HR7YQzPbF6WLtnhcyu22xWV8wwXJ/hKZAkO+J6V6JZkGsbVYt
	0XVostpybL6idTgdqUWdraqElU7idVPLXSpI0PfR1yRTohTUs1ieQ50NPnaQloY6Kyzahagq2uR
	ul++sALlU+CG/9t4GVJNDqRtOY73G0t6pYStB60FcjLghtDgaW7F9DKtmjs+Nzqac0WCaSKp0N9
	AI+eJ8HIsrM3GAJ02JD8rTMJKk1ccpXXwzYM2JmhP8qrWhgTvmiyFRhCWRQY7pKf1Ixv0iJkWds
	b9OLAYdNmfUdoQhn1X59rYW8kj2yi7YdVcaZoJId37H46QfD08Y7LvJQnHjswRVr4COmrreuHrI
	zYKMqcJlDWdya0FzdC8cvcV9RPXzeJ+W1/8bwcw==
X-Received: by 2002:a05:651c:b2c:b0:3ad:fb2d:a757 with SMTP id
 38308e7fff4ca-3ae2b5302cfmr27450321fa.24.1794831920174; Mon, 16 Nov 2026
 04:25:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115210952.2140036-1-graypanda.inzag@gmail.com>
 <20261115210952.2140036-3-graypanda.inzag@gmail.com> <CAOQ4uxhR=ERNBYsxQ06-sKGrTXvePpzv-xi+62oceNff6Mzzbw@mail.gmail.com>
In-Reply-To: <CAOQ4uxhR=ERNBYsxQ06-sKGrTXvePpzv-xi+62oceNff6Mzzbw@mail.gmail.com>
From: Junyoung Jang <graypanda.inzag@gmail.com>
Date: Mon, 16 Nov 2026 21:25:07 +0900
X-Gm-Features: Aa3M54r2Viw7fFeJwPagRzK9IYztsTnUnL-IHLph1k3bGx9UGsJ-OXrvkjOjw2M
Message-ID: <CAO7ntTQvav7mhK6caZ82afGadP8jeOJ_thanAf8DXBMBboN14g@mail.gmail.com>
Subject: Re: [PATCH 2/3] inotify: zero-pad event names after an embedded NUL
To: Amir Goldstein <amir73il@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Jan Kara <jack@suse.cz>, Matt Bobrowski <matt@bobrowski.net>, 
	Gwanhyun Lee <gwanhyunlee@gmail.com>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Christian Brauner <brauner@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 16, 2026 at 7:32 PM Amir Goldstein <amir73il@gmail.com> wrote:
>
> On Sun, Nov 15, 2026 at 10:10 PM Junyoung Jang
> <graypanda.inzag@gmail.com> wrote:
> >
> > inotify_handle_inode_event() allocates the variable-length event with
> > kmalloc() without zeroing the name buffer, sets event->name_len to
> > name->len, and copies name->name with strscpy().
> >
> > If a dentry qstr contains an embedded NUL byte (for example, via a
> > crafted FUSE READDIRPLUS entry aliasing an open directory), strscpy()
> > stops at the first NUL while event->name_len still covers the trailing
> > bytes. copy_event_to_user() then copies event->name_len bytes to
> > userspace, leaking uninitialized slab memory from the tail of the
> > event allocation.
> >
> > This mismatch dates back to
> > commit ce163918cd33 ("inotify_handle_event(): don't bother with strlen()"),
> > which replaced strlen(file_name->name) with file_name->len, and remained
> > in commit b8f2688258f8 ("inotify: Use strscpy() for event->name copies").
> >
> > Switch to strscpy_pad() so any trailing bytes up to event->name_len + 1
> > are zeroed.
> >
> > Fixes: ce163918cd33 ("inotify_handle_event(): don't bother with strlen()")
> > Cc: stable@vger.kernel.org
> > Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
> > Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
> > Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>
> > ---
> >  fs/notify/inotify/inotify_fsnotify.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/fs/notify/inotify/inotify_fsnotify.c b/fs/notify/inotify/inotify_fsnotify.c
> > index 6e3af6452dcc..78eb1e92a14c 100644
> > --- a/fs/notify/inotify/inotify_fsnotify.c
> > +++ b/fs/notify/inotify/inotify_fsnotify.c
> > @@ -121,7 +121,7 @@ int inotify_handle_inode_event(struct fsnotify_mark *inode_mark, u32 mask,
> >         event->sync_cookie = cookie;
> >         event->name_len = len;
> >         if (len)
> > -               strscpy(event->name, name->name, event->name_len + 1);
> > +               strscpy_pad(event->name, name->name, event->name_len + 1);
> >
>
> I am not sure it is inotify/fanotify responsibility to hide awkward names
> which filesystem emits.
>
> First of all, I think the solution should be consistent with d_path(), so memcpy
> instead of strcpy here may be enough to avoid leaking uninit memory.
>
> If we want to be nicer to userspace, then we could for example pad the
> garbage bytes with "???" for here and for d_path(), but I don't think
> this is worth the effort and also don't think that hiding the fs flaky name
> with strscpy_pad() is the best way to go.
>
> Thanks,
> Amir.

Hi Amir,

Agreed, matching __d_alloc() and d_path() is cleaner than zero-masking
the trailing bytes.

For v2, I will switch both inotify (patch 2) and fanotify (patch 3) to
memcpy(..., len) followed by an explicit '\0' at index len so the full
allocated buffer is initialized. I will give others a bit more time to
comment before sending v2.

Thanks,
Junyoung

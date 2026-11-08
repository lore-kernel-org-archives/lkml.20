Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794164398;
	b=0ccye4YJdHFcz1oDYFLdr507NAQtkU/rCB+fSfBdOYIHjJnKPSqRB1oUFOlU8RjrUUna
	 uuh4wPyrQX9+ojIJyiYwIwICZhCWhGVhf1rYGQD5mxGQInwyqD3K87r4gRks+lf0Z5Ofs
	 zXWN5BZo/IM5zIge0AbZaJjdcTtXu0ZI+M9BiZBwEmUbVedeBtF05MnhZIhntPgs0+cbR
	 GuBgdJeTl2g8tw3DBE/bcnucibvHmnYYkVwwS7O87/2FZ50fQGuOc55OJQIhs+pARs/NS
	 thIsRi5fWbjSUtmddWfeiMMKFPZ5ZjfSbWxQPnvZ8KBLijZFNQDFKFXYckEr4egVmpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794164398;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=JLhUwzup1lwefYy8NOOFjthYnrByVfTsqIe79kkV+Lk=;
	b=Mp8Ji12dCmIRnGLVHuREiuJS5V6nV648Tf8bz249JJqMNkOpnut/Yy4cER2B6kn4s5kh
	 nkJ3+3QXq8DLyckIAhvxwFWd4duGcqmGhpzMENHXOCTlhoXOFdBbLVYfrwxzB5G3DY93d
	 IMIskzBQOrrpWYrMfeDH46EcM/NTAYpv4HwoQdFOBKL1nN46wXlKl7+hQWH7pR8rTsVi/
	 Bn8zO+U/tGcq63Z3kIhRGWt9CodGuaS9M98XFtlO7P5cegZIh2tufDpP0biYiqSD6YNzV
	 zTD4GLsm0tbrc4ANN8x5sIFhQAA1syAph599vb+JVljHloikmm8zYoZv3h3zlwF/+cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XrEUEgHU;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCF9606A33C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 18:59:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CCF9606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XrEUEgHU
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so1338185e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 10:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794164397; x=1794769197; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JLhUwzup1lwefYy8NOOFjthYnrByVfTsqIe79kkV+Lk=;
        b=XrEUEgHUwv+lt2Z0T4RzlOQuYT1yMbnY/MJrtF5HY2pc8m0ujKE+1IGJbqc3A1SsPJ
         Pz+po0Wh7ECcrOl1hyNdZBme+OsO/r11IeCA1lW9KMbstFhlOkC0Hm7Ef+TTavGsfrDk
         7T2AE8nlcorDhYFpLo0KTCt4xOv09AacMRilfH2h4PS2mZ0iBReAF8XAcgtI3iT+qlRY
         EJQPYUIUlDRCCjadf1+24R8V0flZyhCZpLCroCVsidoQ510350k4POOaAcSXgGRrBTWF
         rbpUnz5O6K0TOR8uz/zwLHiObwDAqnCJFWP0+ssCNYCBYnXJwQ2yMfUqdKkv6ro/lp/q
         XMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794164397; x=1794769197;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JLhUwzup1lwefYy8NOOFjthYnrByVfTsqIe79kkV+Lk=;
        b=zlBykEL/NwU84dJxG0GGJtGFzoSC9k3gEWrY6aELcu1hpw7DtMQ1UxCWZwR+V/9VHa
         Ti9w/m5eZ1Po/XhqD4hGmhCTNUl8lorkOf7d4B6bCwhTAJjmrbu/aIHOKkQGeLxy9XaP
         UrksP5jANrnLXWr9Zr7J/YmN1REj5dHkJ7O4xUEZI3ajs0GvmlqQCDJfkv27XGUUIk6+
         E8Mqnd5HZ16auWDQnqyL88DA5Lr2UTXMEBOFeUS7hsCQO1B1CCAJHoiPlWXGGDALWczK
         QSS8a90D9sE6nFi334PG4xql/YkzLPWI/wO/EFodnATVHqZvGWeBg28oMPaDFcJHCiys
         crJw==
X-Forwarded-Encrypted: i=1; AL+hErEl3wr2KBB+N1axbnKg9WNT4QSeidRAE3IkSmrE0OBUEWlgfrQkvL6L88EgOIYvMZi2bLKf33YzFQtjusE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Zn7o4do1Zw+CqzSCqFZ8KSNN79SlG/bdNGBLuf5GlQiQwPiE/
	kkzIdTKnl7kARES/OrcCinCCtp27XMcX6W+6kWSLZJTJ/zAHg8A44P0g
X-Gm-Gg: AYBFou2nTYyX3NoAu0MlNJ75UTVAemzLrE5uKbzNSX1RxkczgxiKrBpv9NSrBe5cAem
	EAyF49BOslfGOLKA2Tkjje1Ilp1nJSbg/sV+87l77oLFQSpCF1LOO+BAPekUdMobQfzXD/uVsFj
	pHdnLHxpR8PNfGhz/5WuxeoqiG4yfeNo505AdSF8way3RFJeuKpzRPkXvBUK2Z/aKhRBNHbYGjc
	Q8Zk5kJeFwGq/ThbTnGP0Pl3OFdE/miuVkZlyItzgFsIB835M0hoT9flnxtPKlUJjvSxWUsqCyr
	57FIfyoTHXp8j381pAhoFE3c6yxJo9iJVX5QSFmTb55cC8DG+H/Cm5r20bAISuZI321Kw0GS0IP
	A+VKuStP3RBAhzXAjRD13Ld2EhdRzf4yhFTA2eJTrtQgCNLunEVHebpZVS8g7i/LDaJh69QDW+s
	3MRvon3iiXkRwogYcN4S1c0XxEw6CMJ8h5ARFtF7MhNy0KcFKaXYLBcCOITNq4TQEP5x3xUQhYH
	pOZv4BJq5QLeXR/EdiE/7zgceFYH1kHsNRQYANeqeUvHiI0dCXKanCIpKqujxc9Agu4VaP34O4s
	NZbEdna7BmrOYFch8OJJaKewkYEiDzNWsrvgwZt1imUCNec0kzMeTOgFBqDMr2VV
X-Received: by 2002:a05:600c:468f:b0:4a1:7e77:c382 with SMTP id 5b1f17b1804b1-4b960d9b170mr35982125e9.5.1794164396406;
        Sun, 08 Nov 2026 10:59:56 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb1f3acsm185228445e9.14.2026.11.08.10.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 10:59:56 -0800 (PST)
Date: Sun, 8 Nov 2026 18:59:53 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-fsdevel@vger.kernel.org, Linus Torvalds
 <torvalds@linux-foundation.org>, Jann Horn <jannh@google.com>, Josef Bacik
 <josef@toxicpanda.com>, Chris Mason <mason@kernel.org>, Jeff Layton
 <jlayton@kernel.org>, NeilBrown <neil@brown.name>, Eric Dumazet
 <edumazet@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Al Viro
 <viro@zeniv.linux.org.uk>, Jonathan Corbet <corbet@lwn.net>, Christoph
 Hellwig <hch@lst.de>, Greg Kroah-Hartman <gregkh@suse.de>, Joel Granados
 <joel.granados@kernel.org>, Kees Cook <kees@kernel.org>, Jan Kara
 <jack@suse.cz>, Jan Kara <jack@suse.com>, linux-kernel@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-um@lists.infradead.org,
 linux-wireless@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 netdev@vger.kernel.org, ntfs3@lists.linux.dev,
 platform-driver-x86@vger.kernel.org, coreteam@netfilter.org,
 kexec@lists.infradead.org, linux-pci@vger.kernel.org,
 linux-sound@vger.kernel.org, netfilter-devel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, ibm-acpi-devel@lists.sourceforge.net,
 jfs-discussion@lists.sourceforge.net, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-cifs@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-mm@kvack.org, linux-sh@vger.kernel.org, linux-usb@vger.kernel.org,
 samba-technical@lists.samba.org, sparclinux@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-doc@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-atm-general@lists.sourceforge.net,
 Takashi Iwai <tiwai@suse.de>, linux-input@vger.kernel.org,
 linux-raid@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-debuggers@vger.kernel.org, Chuck Lever
 <cel@kernel.org>
Subject: Re: [PATCH RESEND v2 14/23] proc: let procfs copy in writes before
 pinning the entry
Message-ID: <20261108185953.28054fb3@pumpkin>
In-Reply-To: <20261107-akteur-gemieden-eckdaten-21304d085e35@brauner>
References: <20261104-work-procfs-core-v2-14-76ace653a773@kernel.org>
	<CAMuHMdVfakapgBK6TBhO1iWX8qzvLDk8jzRS=t2MVa5G=MCUeg@mail.gmail.com>
	<20261107-akteur-gemieden-eckdaten-21304d085e35@brauner>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 7 Nov 2026 10:48:35 +0100
Christian Brauner <brauner@kernel.org> wrote:

> > While at it, I think it would be good to use this conversion as an
> > opportunity to replace "char *" by "void *", which will probably let
> > you drop several casts from users.  
> 
> So I tried that too. The thing is it drops exactly one u8 * cast in
> ntfs3's label write. 

Since char is now unsigned that one isn't even needed...

David

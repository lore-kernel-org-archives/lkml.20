Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793974883;
	b=jQ9U6CYeR6OBCMM447iVyAT9CUw7JNfwbRYY6uRm+iSH+w/TYCsD3TEc4JeSmQ0EI1Zh
	 DOT75aIV5EDHACUWwxtRgOojUsIrcXx4+mcuwSCPl3OWEnNTwNmLNFAnY1qJ0rS8Pe3Oh
	 5gXCe2soCUeU6rZx2Kdh2oIWbG15XnwvEFIb7aDjuYbs6S45aEGxhBNriXCdHE6QXVq/c
	 7xtuAcxr+JwBg5FA7mUL+CZfYQPvC7wplfGnxSfem/Hndtc3tivvI5Dh4jBNPvHIjlLEl
	 d3OBAghHHOsfXbO/AKb1fwjoMSNATrWhzgL+4uiWn76dZYEVZY4pqx8+1ZzIE5FNqEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793974883;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=IvIeWVFRooaZt+m0oS1armEMk7H1Tnpgkc/RvyXuKEw=;
	b=Io6w4yL0C/K8cmLTwLr7375BCIOWPPcNIwhgJhfUG6Zaz71tJhZi51PiWBCYo5AmdFG9
	 pnXPzZpdobLuxUfhUdWHtrLZFiwxVrwqBAb5oUYgv9Qly6edA3r7vtVxeJsa3gu0OmtnR
	 gOg82bw9qf/F4/RQNJJf2EbRyd1EpGce2Ujp+S2zVqZqnnROMp5BotxImJOpRx86iKxEu
	 ZIYb1jwO+6Y8akxZVvRS4BYXUMU01MVPd/X8/aZprRkPGcmz+A+KurWCUOhwMHPfNENqA
	 rPpjj5UqiFMqWqplk/iGmsuo/9o4Kxd/80OooIWH9+YhPB7uCU6Zx25i6l6+t9kqH7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=HTmRJOHs;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16786606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:21:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16786606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=HTmRJOHs
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a215e64962so7862195e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 06:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793974881; x=1794579681; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IvIeWVFRooaZt+m0oS1armEMk7H1Tnpgkc/RvyXuKEw=;
        b=HTmRJOHsTnJnIOQhAlY5SixzU9LExT/kDWKzytRWLedwdbyRIOi5oOqv6hx4QGp1R/
         d3nLB0yGEj4qz5USsXxo2MjRdvh+N53+nr9T9EUpMFPtxxUNkvCASQGDfYk+J963DKGw
         6i9nrarJSEHDww9G2c5Gi6LeJnBQoQDEzGhpIpFeNsllzEW3PI+HOIyJeHtDNFJaThEk
         ZOirTvYWGngTuZcmpP0XPiw4t8dGw0AEoiaCsAbOOOkjl0Rmn274b6KpenvXo0vQuxgq
         iYomHLebF+GcZwhfd8qwlZH6md49edNnkZ9l1ntOqeNSUgtiAkge5XHUOA6trLfLFj/E
         u5Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793974881; x=1794579681;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IvIeWVFRooaZt+m0oS1armEMk7H1Tnpgkc/RvyXuKEw=;
        b=h2YmapPcjwvJG/0aA/FzMInRsX0iaEgYqh9EINRwidD/n/P34rcK9qqSrWoyEspEUq
         guqyMjH3cI6oR0wNhCQ//jPd1yQFhoOwImoi67prIIODd5TETywrNTj7pgXMmtnjqU1l
         RBb0oXhqPpmhlTtD1n7227fBTv0MaUMPpFpazur0Duf6DEidmr0mseCL07BW2jJcBRWo
         NdUxKZDu/5mMy7ZKSjqzVnR814iT6GUsR1I7s94fkla4YcFRLVdn5SuzV53KLPFS5SFh
         0wTgDWn2pM19ShKWuaNox4qAGK4lmpWWCABf5SctTLQSdKwThmJVh7Mv+T/mVGFbhe6R
         dpoQ==
X-Forwarded-Encrypted: i=1; AKwUvBzFqNFM+JAfkQZZQmyYPY520QizyuHKe8ZvrbLmu1atK+xok6/mJwUpRBnAWBbOTAiHjxjButRFa8SA1lU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/WZ6fiPUJ6S6+YBFAFRfH1HRKFwHocBxVLeyaRcPWVzifZk8BD
	zGcNeEae0lO6yGw+B9MMu+GCkNsbyrOyuAkl8pDTeR8lPXPCUZwTqZztobY5E9LyFrs=
X-Gm-Gg: AYBFou2E+te7w8a8bNmFqCPjobkc32SLxypSVIXK/8AXhRXzXcUlhexLE8SmcaXSt/3
	KmeSa9mgMEwKQZNeA0M+ApKSTKeITDqR2uupoTq6EOVMejGFq4+OjZ/jrzVyhXjPw98c9hR3liP
	eTY3BD6uFFY6QHrCIaeg3Wtjxy7yboNWZy5/YuRiBl+ja2qA11QLVZSGjvniIWfEhYjoutT4dyR
	lVKE5MYNlf+9geIzrOj84VHuXibrvsFGwrzVjRfyJscxE2sZ1MGJV/PYf0at0FOyphgzUJGImKB
	mAInttsnbgCiXbOLWHDJuORrLIF3rnAYpFgYxYZXXuVIsUIpHCoK9v+02Ck55D2UHI6Y67d1vaD
	Qb1sOBOa+UpoctkD9DHOFsQ0yUm1BAtdyD1lcjONoW/g4+K3zjvG4DUHfb5Y/z3g036LZ04lIry
	O9qSFYwuQmausE+mv94CBqf4wfwWbbjZ095lDlYXZRBsQCA8QDjri6BYJvJRS1mqaTqeoSKfXh5
	DUd83pEkgakH8GszjF9OrIBwVEUFUmgf38Mpc4PomOKg0wNVncnJvJnSJVkjizrdh/ylgsLkiGN
	kHhuv7OZzHztf49awJFRfjOId1xBHNuB6PKNCgkvxrTiG0DaCp0=
X-Received: by 2002:a05:600c:34ca:b0:4a1:e672:5721 with SMTP id 5b1f17b1804b1-4b6df11da11mr43661215e9.13.1793974881479;
        Fri, 06 Nov 2026 06:21:21 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b76cb772e1sm406105e9.0.2026.11.06.06.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 06:21:21 -0800 (PST)
Date: Fri, 6 Nov 2026 15:21:19 +0100
From: Petr Mladek <pmladek@suse.com>
To: Chris Down <chris@chrisdown.name>
Cc: John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 14/16] printk: Do not set Braille console as
 preferred_console
Message-ID: <au3iX_xMl9H-MqJB@pathway.suse.cz>
References: <20260929120546.328616-1-pmladek@suse.com>
 <20260929120546.328616-15-pmladek@suse.com>
 <auLznwtHktgqlST1@chrisdown.name>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auLznwtHktgqlST1@chrisdown.name>

On Thu 2026-10-29 15:19:59, Chris Down wrote:
> Petr Mladek writes:
> >-	if (brl_options)
> >+	if (is_new_entry)
> >+		INIT_LIST_HEAD(&pc->preferred_dev_node);
> 
> is_new_entry is derived from pc->name[0]/pc->devname[0] being empty, and
> console_setup() can store an empty name:
> 
>     console=,115200 console=tty1
> 
> The first one creates an entry with name "" (and links it). The second one 
> stops the lookup loop at the same slot, sees it as new again, and 
> re-initialises a node which is still linked, followed by list_add(). With 
> DEBUG_LIST + BUG_ON_DATA_CORRUPTION:
> 
>     list_add corruption. next->prev should be prev (ffffb010209fc0c0), but was ffffb01023cd1fa0. (next=ffffb01023cd1fa0).
>     kernel BUG at lib/list_debug.c:29!
>     Call trace:
>      __list_add_valid_or_report+0xbc/0x1c0 (P)
>      add_or_update_preferred_console+0x6fc/0x9c0
>      __add_preferred_console+0x11c/0x160
>      console_setup+0x2e4/0x348
>      obsolete_checksetup+0x148/0x190
>      unknown_bootoption+0x150/0x328
>      parse_one+0x108/0x480
>      parse_args+0x158/0x3d0
>      start_kernel+0x134/0x488
> 
> "console=,foo:bar" does the same on the first console= when SPCR added an 
> entry, since it matches the SPCR slot via the empty devname (see 7/16).
> 
> Rejecting empty name/devname in add_or_update_preferred_console() (see my 
> comment on 7/16) should fix that.

Yup, it will be fixed in v6 this way.

> >-		preferred_dev_console = i;
> >+		if (!list_empty(&pc->preferred_dev_node))
> >+			list_del_init(&pc->preferred_dev_node);
> >+	} else if (!is_braille_console_preferred(pc)) {
> >+		if (list_empty(&pc->preferred_dev_node))
> >+			list_add(&pc->preferred_dev_node, &preferred_dev_console);
> >+		else
> >+			list_move(&pc->preferred_dev_node, &preferred_dev_console);
> 
> list_del_init() and list_move() are both fine on an initialised self-linked 
> node (list_move() passes the DEBUG_LIST checks in __list_del_entry_valid()), so 
> the list_empty() checks can go.

I was lazy to check this and wanted to stay on the safe side ;-)
OK, I am going to do the following changes for v6:

--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -2666,13 +2666,9 @@ static int add_or_update_preferred_console(unsigned int i,
 	 */
 	if (brl_options) {
 		want_braille_console = true;
-		if (!list_empty(&pc->preferred_dev_node))
-			list_del_init(&pc->preferred_dev_node);
+		list_del_init(&pc->preferred_dev_node);
 	} else if (!is_braille_console_preferred(pc)) {
-		if (list_empty(&pc->preferred_dev_node))
-			list_add(&pc->preferred_dev_node, &preferred_dev_console);
-		else
-			list_move(&pc->preferred_dev_node, &preferred_dev_console);
+		list_move(&pc->preferred_dev_node, &preferred_dev_console);
 	}
 
 	if (user_specified) {


> With these fixed:
> 
> Acked-by: Chris Down <chris@chrisdown.name>

Thanks.

Best Regards,
Petr

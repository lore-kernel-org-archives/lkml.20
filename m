Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962101;
	b=ZhnJJ02HGWRqouhKO5mibiwouQoUDi8Y/FqtHsUHnkQDX/dkbLvMe4Z/MLRY8nC0qxcp
	 iO6U7Pw9e39l5BUFrW2kK2j0qljjgkA+HSkz9HVSHRf+okXx+aPCOmZarypkhKqq4g18+
	 3TxCvAPSyMb0DDb9Mlba5EvzW0wyuLXb7oNxlGC4zjOVf/3bvKy8lq2W1M0vvit4UtTGc
	 blGCIDdW1C9QOVchZtrQ56W0qX2iLgeYVWhSMLOVaJepLBMzhFXw0xPD5xF9Fg89aoSak
	 lpZa47exemCsoHdP0g2jYxdPROv+R0ff+R3qxA7kb79Fsl4NIXpvN+arT+pB69txZ+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962101;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=aTern/SjYwS7EU9tp0WJipbrde6t1sJhlDOVXbBVdYQ=;
	b=j9guQNGVOTit/Uidyqu3azyXlzA9gLPO/z3+5d8TEiVL3qMWzIBzo89ZQDNAPlYFlZEw
	 DUbR1gpRr7XMek5wRcEhzvdpSsjc678/ZJEOVpLRyEaBT0hP7SEugs/xppked8i26gH4k
	 1mN26nN46HlryXkTahlf+jHeopqxOEq98wAlYzLqxeVx1C4dD1dL03Lp5HUTk9MwgJZT8
	 DQaiARK8FUNNuYxvl6s2mDLQowKKuTdJ4vQKdGhGDtMJP+Hx2WEDzl+16yq+5aIFIOXo7
	 jlycRLsKAnHhaLyESRfkD/C05c+dlvH9v4thRmqQbRPqV8WurJBAgCgyawx4Ov8eziQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=DPfbFwHd;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C4D606A33B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 10:48:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00C4D606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=DPfbFwHd
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48dee593f18so372020f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 02:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793962099; x=1794566899; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aTern/SjYwS7EU9tp0WJipbrde6t1sJhlDOVXbBVdYQ=;
        b=DPfbFwHdOZnQaYu0EaSEf2ym0l6Rmt8l2j1xTg4OBPt20g2Kv66WTKwYjBSeuW3wxA
         3Uatlz6j7Ha2QJTyvuAH9rsv8MICvSct3yt+kGlvMTFafmBHWX4Og8E64lpoh5EOdjFB
         RE/mU+lmJsKTDxXfOr31s9yNWM8f1YomCYfxrdeEiiGiyZwgicbJ4TkXsG9A1yAcBM9F
         /Q9wamb8vkuGl2hrPypZuecaAYEnILrI07SM77c9XpXB5pmX2LJmkHdbr4NXT2EpILV4
         EhJoJSpsULP3DUv/kVoGiDWxLVeLltvNCsBAm7w24isIDKF0kZj6LxoYCGx/4H2SgR04
         SW/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793962099; x=1794566899;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aTern/SjYwS7EU9tp0WJipbrde6t1sJhlDOVXbBVdYQ=;
        b=yeHbeyYGvJ4RPRWgVhkHgV25c30zgGwGJWZAFF3t+ckw1vnJz+KUZOju2P07MxPoi9
         RN4cGaeRHfMxMsREd4IgbIHVZk23VvXmZNv4QUgxbn7q+xpOiBPssfyMazWQ/m3ZBr+u
         zolJ70c9oa29b+adKSd5CXQg/ADOxL8uJa83xveyS4Pmbg2BxRUj5XzqE9s5TdbCf543
         2KzUw6pydkgZMr2dyejHz82KY2/syLNWMr78kUyDMoVPGENrRaFFhLYD5/dkdfpZ7P5c
         mM6GyriHcnL/4qeISNFaoAQ9gLyCrmaAhGEvB0+xIUE/ZJsmfg+Q0/E19c2sVj13r5d8
         lRVg==
X-Forwarded-Encrypted: i=1; AL+hErGPC2KIAS54iTEkaO64zsCUCXjaJfQ2QvdWz6mlFFQHLoN4/8Oy3gMZZLliLWVNBbdg3WzSHFH/ZUuACFQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/RPrQyqV5aPM7YpwbLq2oKZI05CIJsHAcEBH16fnoywCGmF0XU
	LL6UEhKrvT/vcuZIjbsBX8n7mFU/ESSf1/atv6xcXJKDlVkppNSMVimDw4QYdMR+aFk=
X-Gm-Gg: AYBFou2zxjbJS6VSg8S7MdaUvlRq9LyrwSiGvf+CBdfhcGqIj59vnC0BI3mwPTChY/g
	mdLAk+PnxqlxM24JfLqrMm0UdoXTAFHunB1eWE9WKrZC36sFq1Mese4Lf1JhtgnsqCFXJWfo5Qr
	GalGlTEiPcshKnjFBOwHKftyq/B3mw17ASVynrJ5H28Y/0szkhHwm+3VAFjHRvYLPGBoUIDoJUb
	557fwyZAnEZaRloT1yVHMmwv1v8+0MIsP2DxfxUzpEcbu+CrgZa1JDGf9H5TWrXdYJA60hTj73e
	yojKEWhQV57JBXe/RwSCQX9bGYMzwMQHImA0Tb5TVXKWd/9kwIJdbFva75VJb0RxS90iG06Ifi8
	Wdrcry+neefOi6Pl1E++lzL9F8vgZVFAc3SLeHwEDY+KZAWnAgnszAIG2mXYirpIhEceI4nIxlP
	525kXlRySxfC8ji8PTGN8xcc6zDzJR4MZ3oPMz/WxrIi3iqxUbcNiLqoglHqMs8HkqcKG4pyHtO
	uOSRD3TYpU9Nv4oCkfdxO0gJjmYd5umuhpVdfDfTOlcyzm4gS6s221ykCrxfYf8nH1o4uIPcObO
	Ksvwi9S0QYOb5n2NzAQLHu7cVlJwzamFXHmBE7W6ctKdqR0f5X0=
X-Received: by 2002:adf:e196:0:b0:48f:bc59:ab9c with SMTP id ffacd0b85a97d-492760da821mr4292883f8f.12.1793962099388;
        Fri, 06 Nov 2026 02:48:19 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d837e3f5sm3087419f8f.56.2026.11.06.02.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 02:48:18 -0800 (PST)
Date: Fri, 6 Nov 2026 11:48:16 +0100
From: Petr Mladek <pmladek@suse.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Peter Zijlstra <peterz@infradead.org>,
	Petr Mladek <pmladek@suse.com>, printk@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] Few printk fixups for 7.4
Message-ID: <au2wcOTpkirvACU6@pathway.suse.cz>
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

Hi Linus,

please pull few printk fixups from

  git://git.kernel.org/pub/scm/linux/kernel/git/printk/linux.git tags/printk-for-7.4-fixups

================================================================

- Prevent possible use-after-free when printk kthreads could not be created

- Fix computation of the free space when allocating a bigger ring buffer

- Add info about the new printk mailing list for printk-related subsystems

----------------------------------------------------------------
John Ogness (1):
      printk: Avoid multiple unregistration in unregister_console_locked()

Petr Mladek (1):
      MAINTAINERS: Add new "printk" mailing list for PRINTK, PRINTK INDEXING, and VSPRINTF

Wang Wensheng (1):
      printk_ringbuffer: Fix space_used() when blk_lpos->next overflows

 MAINTAINERS                       |  3 +++
 kernel/printk/printk.c            | 34 ++++++++++++++++++++++++++++++----
 kernel/printk/printk_ringbuffer.c |  8 +++-----
 3 files changed, 36 insertions(+), 9 deletions(-)

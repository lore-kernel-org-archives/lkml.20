Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B7E3F86E1
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792380862; cv=none; b=sEcKgioYpvJDS4NTr23G82zCeMOIWlWijVQ7C9eXGpw85ICXHBf0mCOVb2Tx8AnLjtAjTF5MGiucLvACtc/L8GvVsTWCREqYycTCWazK3zpqqnDLKLTRSOsKBH9I6s/bEgbIFYY7b97LmpY50nZ76bOawWReW1bLeN+ICkFoQ5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792380862; c=relaxed/simple;
	bh=y/cWCG+bVwAtEoZnfRzuUb5PSJqI7ZqfYayWjoAeWsA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l+tkkxqybaAs4qrchaLXtn+56kWVfDzKDSKkeHGdWpb7aox4igML5IfPGdREO7nNrF6yJ7560HyYFdvKGC1MfLWPYNka1UPSH6eH4jCNE2/W1bJaButoJvUUsBFtlWRH54nxrMNXsrojl4JhrPSmEVObq2yvnSK74Eq4d2zVM+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cPfAAp0A; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cPfAAp0A"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3acc96a256dso1076622a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 20:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792380860; x=1792985660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+gpICvUOk5Bsu25IUENRujBQeDUSaz7AmQ+tkKJdfcs=;
        b=cPfAAp0AZWirMEI0VdPMlabRgt0dl0opuxmNIW0S06cCZYxExeN18namaL5PoE3xIR
         hEZMJqka2MymTFUi/nmtT+cdt1AMr1I1CjiwEF84JNNp8tapM/3eeCao+gghEnLlxE+j
         H/2kObyn7VHo0xUlJFBmJIWGPbxuhBcJUHDQ0EUlX1nFCANi7Vd4lU99vBOua9DE/m5g
         /lg0RKg6Ffgen479ziDY5K5Fa5hVwKz4vYdyvBcH9+B8kSiipXP7Wd2biQa5kMD8iR7p
         p1NeRfEa824EOsB8zlt3cs15o/ljnbO/fn6af2xlxZSGv52tLfQN99hAYMsf6Q+KvnXE
         FtFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792380860; x=1792985660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+gpICvUOk5Bsu25IUENRujBQeDUSaz7AmQ+tkKJdfcs=;
        b=L9azMmLouNTZGFCRtASEPY8MAKOBdL3PNYOHm2dLrxtBuvdoOheTKLAefSak53w2jE
         JJWzT+Ahh3c1Z7DgkwMESKQ/cqfQY7esU2rVx28A94u9NF2wT/NARTu5G2ENV7FJFudZ
         eUNPOllwOcUNFzJu+oDj8GeK5sprX/Wg2nc2PXb6z523DmHzJaaIP5Im5Z+17MORegsu
         qqrZdRqV20Nk4LvDe7yyhe7tT3XOUkchOjeVGRPMfKKymbtNC9YA+fVm1h+1UL0S79Fq
         TLiENDlFwGIedSx798+ZjTZdt8wVOjXWFFStOFT+KZBy9Hl6uSmQ596P5rN5IFPLGvSP
         OFfQ==
X-Forwarded-Encrypted: i=1; AKwUvBxk2Tpyb3O9lSxbtcG1a+9uw2B9bVcNa1hAWP7rRxWZBwW8vmEY5BiSxRvjnOIUhoGx+w/8yBmhhk4eVT4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJr1olCwH2EC3Wgsu2XriPLdzcX/KfVjERPhhhrwYUMp9omMpxN
	wGVT7olHCF5oVA9vwHJnoBF/YU5raH4xCV+2+sFqwkqGp5GuAHc9OUwEUOXCsBVz
X-Gm-Gg: AYBFou38AJojATQEjHDS4BVcVzxMWDo3fOizBEj8+2pm6r/qEr60LJWP3/U3eeis8+9
	qwCcKBkY3YJ1NBwIh7teIQlxz7kryVe/cWCduaR0yHwMEGTlCv3poI7KQnA0L4OJl+UtISqvLBR
	4SEA7bxHJrREpA/nesFeyNCbQ/5b8gm78Cs2/T6AhPFXUCSEn0tdi3fxLhwfdf5T0cOhplb7jhd
	F/bTi4hNCUIXp206OSCkzRf3xoDEfq6zI0Ybj/fCr55DL320HxT1YhwCaQTRZaW5WvR1/+6DhVQ
	LevgyxrB6dbs7qgXBG2whzPapiz01yztjgZ7A116yDA6GZdOldFxUmCXyBUyw/WDbyZToJbzo/K
	GOpQQv7yuW9BctcgunKHc5e8go3pag15fWnwZ7+xIF9+wMnPvJPfIs1EZJ4+6pneq3bzCACWYoo
	ZunPd0YMEWvfFoEe0++6gdiBZuT/kT/SsktPlA+L2RGiwDLlOpEWB0Oq3mAWfxRQyu7vsnuYgjT
	bPQibDP4Vp7ShqxrcFB1MHHkWyZzZe/9cDEsiGT+UZw/Pny53I7LjIgA56HJqfMlTWsel/9+QQS
	g5K5HiLhvzRS3xxVubwbtWHwU7XheHFuQ2mplTZrHn02xUrD
X-Received: by 2002:a17:90b:5111:b0:3a8:7096:9b48 with SMTP id 98e67ed59e1d1-3acee293889mr6105920a91.1.1792380860248;
        Sun, 18 Oct 2026 20:34:20 -0700 (PDT)
Received: from EAIT-H54D9Q2FJQ.eait.uq.edu.au ([130.102.10.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc4872861sm15136144a91.7.2026.10.18.20.34.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 18 Oct 2026 20:34:19 -0700 (PDT)
From: Yu Zhang <yuz08559@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] usb: gadget: configfs: use-after-free of gadget strings during bind and under a bound gadget
Date: Mon, 19 Oct 2026 13:34:15 +1000
Message-ID: <20261019033415.73542-1-yuz08559@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

The gadget-side string configfs objects (the strings/<langid> directories
and the strings beneath them) are created, modified and destroyed with no
serialization against, and no lifetime coupling to, a bound gadget. This
gives two use-after-frees, both reproduced on an acm gadget over
dummy_hcd with KASAN. Both are root/configfs triggered.

== Background ==

Writing the UDC attribute (gadget_dev_desc_UDC_store()) runs
usb_gadget_register_driver() while holding gi->lock, and
configfs_composite_bind() -> configfs_attach_gadget_strings() then walks
gi->string_list and, per language, language->gadget_strings to build the
usb_string tables (the "the gi->lock is hold by the caller" path).

The configfs callbacks that build and tear those lists down do NOT take
gi->lock:
  - gadget_language_make() / gadget_language_attr_release() add/remove
    languages on gi->string_list;
  - gadget_language_string_make() / gadget_language_string_drop() add/
    remove strings on language->gadget_strings and adjust nstrings.
(Contrast function_make()/function_drop(), which take gi->lock around
gi->available_func.)

A store to the gadget's "UDC" attribute and a mkdir/rmdir of a child
strings/<langid> directory are not serialized by the configfs core: they
hold disjoint locks (the store holds the gadget-root fragment rwsem plus
gi->lock; the rmdir holds su_mutex plus the langid's own fragment rwsem
plus the strings/ i_rwsem), so they run concurrently on different CPUs.

== UAF #1: gi->string_list walked during bind vs. concurrent rmdir ==

configfs_attach_gadget_strings() dereferences a struct gadget_language
that a concurrent "rmdir strings/<langid>" frees:

  BUG: KASAN: slab-use-after-free in configfs_composite_bind+0x2ba/0xe70
  Read of size 4 at addr ffff8880085db900 by task ...   (language->nstrings)
   configfs_composite_bind+0x2ba/0xe70
   gadget_bind_driver+0x170/0x5f0
   really_probe+...
   gadget_dev_desc_UDC_store+0x179/0x220
   configfs_write_iter+0x1a7/0x250
   vfs_write+0x5df/0x940
  Allocated by task ...:
   gadget_language_make+0x93/0x340
   configfs_mkdir+...
   vfs_mkdir+0x1ed/0x4d0
   __x64_sys_mkdir+0x47/0x60
  Freed by task ...:
   kfree+...
   config_item_put+0x89/0xa0
   configfs_rmdir+0x42f/0x5b0
   __x64_sys_rmdir+0x34/0x50

== UAF #2: a bound gadget references strings that rmdir frees ==

configfs_attach_gadget_strings() stores raw pointers to each
language->manufacturer/product/serialnumber (and each string->string)
into the cdev's string tables; usb_gstrings_attach() does not copy the
string contents. Removing a language (or a string) with rmdir while the
gadget is bound frees those buffers in gadget_language_attr_release() /
gadget_string_release(), and the next host string request dereferences
them:

  BUG: KASAN: slab-use-after-free in strlen+0xe/0x40
  Read of size 1 at addr ffff8880065f2000 by task swapper/2/0  (GET_DESCRIPTOR)
   strlen+0xe/0x40
   usb_gadget_get_string+0xbb/0x1b0
   composite_setup+0x33fa/0x4690
   configfs_composite_setup+0xbb/0xd0
  Allocated by task ...:
   usb_string_copy+0xed/0x110
   gadget_language_product_store+0x22/0x60
  Freed by task ...:
   gadget_language_attr_release+0x36/0x60
   config_item_put+...
   configfs_rmdir+0x42f/0x5b0

== Reproduction ==

acm gadget on dummy_hcd (CONFIG_USB_DUMMY_HCD, CONFIG_USB_CONFIGFS,
CONFIG_USB_CONFIGFS_ACM), KASAN:

  mkdir g1; echo ... > g1/idVendor; echo ... > g1/idProduct
  mkdir g1/strings/0x409
  echo ... > g1/strings/0x409/{manufacturer,product,serialnumber}
  mkdir g1/functions/acm.0
  mkdir g1/configs/c.1
  ln -s g1/functions/acm.0 g1/configs/c.1/
  # race:
  echo <udc> > g1/UDC        &      # bind: walks the string lists
  rmdir g1/strings/0x409             # frees the language

UAF #1 fires during the bind walk; UAF #2 fires on the next host string
descriptor request after the language is freed under the bound gadget.
(I widened the two windows with a debug mdelay to make them
deterministic; without it they are narrow races.)

UAF #1 is a narrow race (bind vs. rmdir); UAF #2 does not even need a
race: removing a language under a bound gadget is enough, the next host
string request then reads freed memory.

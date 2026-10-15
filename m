Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C64A44F55D
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792080066; cv=none; b=SVSuONoF+khNu7Q/vsqYiIzMbFiuo0J61qlqOyyuPhLoBncXgDyHhI9hVpybhI8PdahP2KZrWFcUeQJJ7w35JGfr2EN/zFnrIXJxDpvYgabuX/68YgxmpkpPVK3zbLpt6oxHIx3yEKu5iwbkevjYJclpFnd2pVDLu57J1ttHJts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792080066; c=relaxed/simple;
	bh=DK4c55g/tzPTcIBg6XeoxcaeiamPH5AZ1Td+iwKZkD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KkP1rbqPdBB60DL7mNoGDv87eWdQ71YWhxUQ8xCuZo/1Kr3/27JO4YggijAeZEd/r3WGZzm5jkAtGKt5pP3AZi0Lw0bpbrkr9WRucvmCA9FE54G8XQTevG+VXFe+nASaaXwZTUyEp4RcU1DOto57xCWd+Nfm0DjeJ4CXM03WQxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=myVya/G1; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="myVya/G1"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-91b9e758c50so1794126d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1792080052; x=1792684852; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SbpT8BLJUAOEuxeA8KOnTCYBccRzkGTlx+5Bc7jHz9U=;
        b=myVya/G1/Nv5RG+UeumL2TYXPLnMvH9sZ4xBXpyadoSXM6SbQtySM2UX69OSvaXxc7
         W5u1rUQXYXJ0J+VJp1CoqXpi/QkR3h9jw06Eajeiuj4nkdmRf8Mkm7Cml0XshJPCJ5v7
         nD0xiVXVffrfezcCgaWjmqh1vhU9AcFA18g9M8BxHfNwEzVNBkRwiPgXdNufasE+l7H9
         A09rm2lI7mljgcZHBSrI/VtFf9qEIvmwN15Ju/ygX+Zts3gGAt5GgIZmgZ7utFk0mFIL
         tKd5H2PpR0D240hHrvtPOAlhl2PJ5vViCEG37XjIQfE/QGTvcmfGA5AFJ0fGrBAjdLre
         SN2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792080052; x=1792684852;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SbpT8BLJUAOEuxeA8KOnTCYBccRzkGTlx+5Bc7jHz9U=;
        b=W26opsWFOVXjFFE4YTE7MFfTvusNKQ1bqFTNJxdwSyUJml9J3+X41jHzKS5DQmDwEb
         e2nF7KJTr4lMtVhRcPFyKUcOakmliGNYqy2lpgrDavKqOFFR3phGKKbljmWtu4W29vST
         XPX5Rnug1I+8HYYz3jBusKpoKlxYKVUS1j1JEqA3cMTSn4BJir+kmtJHzWPZycRuHStV
         CFKUp793dXbIWTU+8dr7VZML/n+hIBc9EDgnKMGvThbt7M5bHbgbJrtIwDxsZxWCu1jZ
         kL83kjmimKVi4KU1/DvTbpbduhmDeCWdxNhWTh4tTAaZ82OX3AKwLGjezdO1/CEZYsys
         30rQ==
X-Forwarded-Encrypted: i=1; AKwUvBxjDYNRH4ZqGE5EUBbIWeNEXJWtzG/J/cQgJC9oM3bcHLnVtrCNnb8inIZ3McjyOIULncB5jlzbRwNkb3Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYJu61MPNPve/DleCRLhEKMPVuROklFd8OLbtSmpmO179hgD90JD
	MedM1Om16wz/JGYLbVsFmsx5bK+nuN8BJoxhfOZOkAM2q8VpTrGrZDt3dQEcB2X2oQ==
X-Gm-Gg: AYBFou1qLEjVYHGSG9I/NlCleztTkpptvFUnp5/FzlgXE5fj16DX4XW8QtXx2Rjj5gH
	t99m3gHNl45LRCPPGAumcduJrAqzxH63eoTQ6d8TUVU/2WVFLk1Qu9VEdxVoE6kl+Jqj9mKO0Ol
	/l9tnV/nZDD0FcFP6iG7iWzaaMklFSR8m/gqSxhUwitkfKJHVQQIw9v4lb4544axtVmBVd3MqsW
	dGTx/oTyug++PlaiOioUnt0V1W51P9E2HYXJzh3Oo9jZyEymfe0RfHDA4M88llcjX8VphKeddJc
	lWIvqRY90mo1q/O/VGa945kp9xQurxcCdBgsqWH2gNmWmJimOdF9OrwHTWkzAZQvZDNLOx2dIiH
	qiV816YIqnQXxW6LmCti92JJvQCkwvYDN72lGQUw3s0t/dXArLbUV+fcycbLpmGMb4rZOZ2yJFh
	THTH+S8aVUs1uRs95HYs9KVebEodNEQbbKvVKyG1/gca8jOvdHwAbRnQaL3KhhqQPE4XKMYACel
	dQv/0JY4SVT95WtnbE+ksyc7huItDOoIlaaUrCov/Ihw6P/wcRn
X-Received: by 2002:a05:6214:45a1:b0:914:3120:b7c3 with SMTP id 6a1803df08f44-91bc91c136fmr9205076d6.7.1792080051810;
        Thu, 15 Oct 2026 09:00:51 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97c4a7d9sm84867566d6.47.2026.10.15.09.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 09:00:51 -0700 (PDT)
Date: Thu, 15 Oct 2026 12:00:46 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jakub Kicinski <kuba@kernel.org>,
	=?iso-8859-1?Q?=D6mer?= Mete Kaya <omermetekaya0@gmail.com>,
	oneukum@suse.com, netdev@vger.kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	david.laight.linux@gmail.com,
	syzbot+04cd90bb99c6ef81a65d@syzkaller.appspotmail.com
Subject: [PATCH] USB: Documentation: Update description of completion
 callback context
Message-ID: <de582feb-a0aa-4fc8-9818-890014de32a9@rowland.harvard.edu>
References: <20261008094338.301a75fa@kernel.org>
 <06a81ea1-b17d-40bd-82d9-922de946b86f@rowland.harvard.edu>
 <2026100910-petition-embattled-94cb@gregkh>
 <20261012194902.aEq58Q6b@linutronix.de>
 <8545800a-a37f-482a-9b06-cbdd70312b7a@rowland.harvard.edu>
 <20261012212527.5sFqlGYu@linutronix.de>
 <41af30de-4725-4913-9ad8-54d1dea2d4b8@rowland.harvard.edu>
 <20261014191141.GxlJhR1e@linutronix.de>
 <89da3b1f-60e5-4f18-9592-3d6d7175c437@rowland.harvard.edu>
 <20261014220403.R38Gf0pW@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014220403.R38Gf0pW@linutronix.de>

The existing kerneldoc documentation for URB completion callbacks is
incorrect about the context in which the callbacks occur; it is not
always in_interrupt.  State explicitly that a callback may occur in
any context with no guarantees, and likewise for the status of
CPU-local interrupts.

Documentation update only; no code changes.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>

---

 drivers/usb/core/urb.c |    8 ++++++++
 include/linux/usb.h    |    7 ++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

Index: usb-devel/drivers/usb/core/urb.c
===================================================================
--- usb-devel.orig/drivers/usb/core/urb.c
+++ usb-devel/drivers/usb/core/urb.c
@@ -254,6 +254,14 @@ EXPORT_SYMBOL_GPL(usb_urb_ep_type_check)
  * request.  The completion handler may then immediately free or reuse that
  * URB.
  *
+ * The USB core makes no guarantees at all about the context in which
+ * the complete() callback is invoked.  It may be in process context,
+ * interrupt context, BH context, or anything else.  Also, local interrupts
+ * may be enabled or disabled.  To deal with this, the callback routine
+ * must always use the _irqsave and _irqrestore variants of things like
+ * spin_lock(), and it must always use GFP_ATOMIC for its memory
+ * allocation flags.
+ *
  * With few exceptions, USB device drivers should never access URB fields
  * provided by usbcore or the HCD until its complete() is called.
  * The exceptions relate to periodic transfer scheduling.  For both
Index: usb-devel/include/linux/usb.h
===================================================================
--- usb-devel.orig/include/linux/usb.h
+++ usb-devel/include/linux/usb.h
@@ -1605,7 +1605,12 @@ typedef void (*usb_complete_t)(struct ur
  *
  * Completion Callbacks:
  *
- * The completion callback is made in_interrupt(), and one of the first
+ * The completion callback can occur in any context: process, interrupt,
+ * BH, or anything else.  Also, interrupts may or may not be disabled on
+ * the local CPU when the callback runs.  A completion handler routine
+ * must not depend on any particular properties of its environment.
+ *
+ * One of the first
  * things that a completion handler should do is check the status field.
  * The status field is provided for all URBs.  It is used to report
  * unlinked URBs, and status for all non-ISO transfers.  It should not

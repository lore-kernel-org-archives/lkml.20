Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02C546A607
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789117308; cv=none; b=kRz3Eu7R5fKSpv/cTpS29G+/TzQqByRF4kl5pqU/By9DFqydCz8Luq6qr4n41AafqvZUUislKiWXlW94RcHdMlX/r7hiJ950Q7YjKY4Mm8KaalUv5yAHy6Cj835Ib8S6bDw0D8vlPqemgi/Be/L51ZEY49Q4hCVdydvqF9WwEzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789117308; c=relaxed/simple;
	bh=jZ2qMqO5eZVlGJ3aHfWX9Y4yYvUAlS6QZiIMvQHNRQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rrqA6rL5qhsndQs5If3ZymoVvoiTqq/Biqq0C+KEzYUXQ0IVWW6kwFl/ybx0TfrOfxxTDxkPDzDtcNih+KT3Nm6DfMJWA55JSI2jNDnVXtFCblJskF26DX2waPrB/1Quz+4M6FkT3yCS4W4E+ip8AXk3yGYLJE6crFdS8oANwYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YpyuaX5e; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YpyuaX5e"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7eb5bdb50fcso642607a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 02:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789117305; x=1789722105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xxbt6VBxlFS0O7thJuARW3qejAi/zI4cNWaBhSouUn0=;
        b=YpyuaX5e9OMO67M4hq1eYSzqcEkr8QBIPK8ncaSXH6WCuH60+nXR9g0CocyjowC2rO
         ZRCmfyZxynTSVUnD88A95Y1iubtM50Xb9bht/380MDMJzCStHzC5gBC3it2ryroUsbWw
         3szAJI4nkvwNknx1D8gmvJ8reyL+mXh3WTHQcGI/ibxA84KCydqsk2WeMr/PdqAdOTEM
         /ck5cCS8p0vyCGXOGOppnNkl2FuF2ZOFz3yQjEFoUg5xGso14IvHI6aJbG+OyigwBjpi
         JVy7sQ+wPeIzm722MqD5kWPJ4e3izsHILX1HCQM9z13O6OI/AcsEZQl83zMUgeG0DfZS
         f+rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789117305; x=1789722105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xxbt6VBxlFS0O7thJuARW3qejAi/zI4cNWaBhSouUn0=;
        b=ULYK4LyccmyDTma9Wt61vxbUBkcfNMyEGeCcwAuH1hgeyzZTtQ3Ziy7kUUtCJurz5U
         QJMaW5WZA02nXJwERPa1IE+JcbaSi8+C4jMS5ZleqanNpbdpg4aF3M7VZQX8CeAlX1w2
         AvNeD33PvbkHZwGlG+Ka8VmIQHpNYnAFCj0iPnEBNt+DWZd3qyRrq3F94I3qot6wKioy
         J2W7pUggKw6PlmfZCWxkoR3mG2+dCXJbGKf4oHrWO9cZ2TTyeMv7DktSCsGvKut7AmiR
         7p0emiusDIUBnYY8kEMxSsSgajXGcKYIziKQmyNjrzco1nsT7oszGOjw+zOJrqNfpzjL
         loGg==
X-Forwarded-Encrypted: i=1; AKwUvBw0MYc3RTkq6nS5wJlSKGOzbuOykKnM6Ao4YMrue5QjFxTqeMhgWiIqaAyW/xVJqnesB51h9X5a4tXBBVw=@vger.kernel.org
X-Gm-Message-State: AFuF++kk8XEUV8c9/Z7EIB/OuxQ4IssTUpNkU5NFGU8EsBsntrgVIf04
	/669ITfQhDZ01creVSu593hVeyLIaEK1Xz/0qJ95CtVlf4UdDZAWan36
X-Gm-Gg: AYBFou39f+XD8ZxPzkELFtJoZzgpIg4JTi4c2IymnpFdQdndYvHqtSFQlZXYwVi84P6
	VW/8RBKiVGAOFfLq9r8Wr2fBA+XujbjG4LI3Udek4BpBGXNm+Q8c0uxbPoxDbJBpAw13+saqICY
	U33iVz37/I8rVrFGvjKAlBAPXoX0z36ffXVUovKm81euFzFhVZo1OKX4JJmjZ1Hw0t/GpJD08XR
	cZ9XSuKhjNNu5Vu5aqE4S59hGVwddKi05elMdhnXBKtqYAhCRrlLI1ZqRoX1EiRJn9Ven/2gDei
	TdahS29v3BWXWyx1QzpX5cQ4DyW6vDHemrc+kPdEerukflP956m4BCnIzBcL3LLkFr7RsSHhgv4
	+ehR2tlPRLr4uwNiFJiniArkwZ1AO7l+t7la49k9ATWHn01z9fMlNAbefHXgp7kvq6HzGSldOWs
	dHYInSnV1LOEJ1t/swGOfKDh6Ycm51OTpg9dc4WOg2gvS6aXc3Po4MEhqHNfIQAIYBzC3cVRua5
	jzSdX8HNEp6
X-Received: by 2002:a4a:dbcf:0:b0:6b1:b68e:5109 with SMTP id 006d021491bc7-6c0bc2cdb2amr1631376eaf.33.1789117305422;
        Fri, 11 Sep 2026 02:01:45 -0700 (PDT)
Received: from amd.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf31c1sm4902177eec.1.2026.09.11.02.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 02:01:44 -0700 (PDT)
From: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Kees Cook <kees@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+28cf08dec5895bd562e6@syzkaller.appspotmail.com,
	Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
Subject: Re: [PATCH RESEND] usb: gadget: f_loopback: fix descriptor leak on unbind
Date: Fri, 11 Sep 2026 09:01:36 +0000
Message-ID: <20260911090136.64549-1-nagachaithanya9911@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026091028-launder-jockstrap-be0c@gregkh>
References: <20260808181504.462492-1-nagachaithanya9911@gmail.com> <20260902105153.3516793-1-nagachaithanya9911@gmail.com> <2026091028-launder-jockstrap-be0c@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Sep 10, 2026 at 06:32:50PM +0200, Greg KH wrote:
> How was this tested?  I don't see syzbot doing the test, did you?

I ran the syzbot reproducer from the reported bug against both an
unpatched and a patched kernel.

Both kernels were built from the same source tree and .config, with the
same compiler and QEMU environment; the patch was the only difference.

On the unpatched kernel, the reproducer triggered 3 "BUG: memory leak"
reports in 5 iterations.  All reported allocations originated from
loopback_bind() through usb_assign_descriptors() / usb_copy_descriptors():

  BUG: memory leak
  unreferenced object 0xffff888016dad4c0 (size 64):
    comm "repro", pid 5597, jiffies 4294942168
    backtrace (crc c8d54481):
      __kmalloc_noprof+0x391/0x540
      usb_copy_descriptors+0x6c/0x170
      usb_assign_descriptors+0x6c/0x180
      loopback_bind+0xf4/0x130
      usb_add_function+0xca/0x270
      configfs_composite_bind+0x6dc/0xa90
      gadget_bind_driver+0xf7/0x3e0
      ...
      gadget_dev_desc_UDC_store+0x153/0x1e0

On the patched kernel, I ran 25 reproducer iterations and observed no
"BUG: memory leak" reports.  I also performed three explicit kmemleak
scans, all of which were clean.

> And did you forget an Assisted-by: tag?

Yes, I did.  I will add:

  Assisted-by: Cursor:opus-5

in the next revision.

Regards,
Chaithanya

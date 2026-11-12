Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794484296;
	b=vRJj+wz5x3OsBCMcLoc5X5c7MBPx8w/BAGu90Z2IkevZVu6Qz7+zZdiKx3aWT0uBkxOI
	 Qib92bHv7WVOUdntV1Dy2/lXzRnE4YZbSq2b+d3DJeiurH+C4TEIf5SH7nvgUaA8x/DE7
	 QWsxZsDDEttM6w/Gb7f90Rt3mBwq04/qqdpFjtIAWpi09X9c+zGtuL7m3sOPj72eFxABe
	 l7zgN94sUSMaSeiBiPOn9z3HqFyzHx0udfBWhGOCrZAt0qOnkscfdiX9zYrZjA9wKGfge
	 t6r/vrpvfEP3cGJFNMJDGaY6zKWtVxcfahJQ2ejDHsZ3IVGU3zj4MCbWDKY5G5OuLlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794484296;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=L+9OvAGkA5co8PTaVpf/WHREVpFJgAvJ9utwws7KxK0=;
	b=XTMe/XXnXpt1ptz/7QmimFHrdwQgewwXxmDOCGCDrCMF8qBw1wTzvIt+p6T7aAkHpDYH
	 v++lvHVT857ImcW872lO4bK/1hr2FOCUv/cnQiw2CsjNO7WEPE9nsfwLF6GNxih1c0B/a
	 w1bG/Jzz0kcy9epsV53EnxiXh7FAmHnuqi5hCyfmWojUrKDeNRiJFMYFotgpfN2twKTU9
	 t5olUbikabWzdJWNdJ0JZ/HIL7u4LtzOqMWWdkZej0ZfMdoeEbOTWDdLKnVSZkKgM4PCr
	 hScjA1UnDTxZBlNMsvw5qlEowGA7CpA3XspPWq5740kgtuZf2406517lDEsvAxpR5bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=D7pI2T9a;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCBB606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:51:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CCBB606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=D7pI2T9a
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so8909235e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794484295; x=1795089095; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L+9OvAGkA5co8PTaVpf/WHREVpFJgAvJ9utwws7KxK0=;
        b=D7pI2T9aUlHUPB3rv6sO+Ov1nRrCVtdz1sKmcQ207kMrfnwO5xoLhaLFuNbGbc5clW
         clwEAKnGyjMJ2LLwb2wh1aM4aMxl+rixQrXW3MY1icYmfNkt/ZzMeI9ao7dxVIxRO4He
         8jZnfMnsZIvSeGrZPU9MRqkyZB+W65uY7ohwyGDLOVxP6CDhoUpMjEs3F082Pgy/GG9j
         FHtKk3iaMvmV18s+orFsSOOfahlQcJ1lss+O8QKnEJ3P+4mJsi0GrbznkXGj7jy1KX4c
         uDCuazl+Hz/TkjbQH4xBiEveaqiAKiFvr3OELpZjTq1APfpIx9l2vrbyPXv4LFYobk1b
         do0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794484295; x=1795089095;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L+9OvAGkA5co8PTaVpf/WHREVpFJgAvJ9utwws7KxK0=;
        b=Oa//N73avMgB6amMmdgUebsUfMO90mq6+Mulr4VNINsjmsbbNaJUilCclKJvBetlTm
         9z0G51YiKsNdq5gNXYXH+1Y9L5IXcPTOyCeqDbtBZ7gN0/qwZFb1+be/utdElST3ky/d
         XRb8XDpii43H+k51PeQ3bwwYgAwSsPMc3s3XARnLZwvEwiuXHUJ40OjVo2WdKvSGEzPz
         NStZt7VKi5HKhawH1hriiBLahUfD4J7BCDm2OzHVDC/AiRpC9QnY8mQW0SVCvB8ZXlMw
         +Bh1A/OWr0MMFmnPZqupBw7bP9vm7+U+nnF3ghuZp18ATTAYqWNC3rC8ZNbbPgTnITw0
         IXWA==
X-Forwarded-Encrypted: i=1; AL+hErEbFhPLiLeqEqmfkCCHJbp6ewujGKGZBbSfErY2HxZmDf07u4fZ5gd3wUb+FbPA9s8CTyk6G+HM1efhCOM=@vger.kernel.org
X-Gm-Message-State: APuU4Z91E/iGQmeVjrd9pMMRVqKD85EBVDETORH388llZBi5l95iB/lb
	QfUu25pG1e2K0DtvsOZ7uiaxEbuTSLZNM/WpQAXbDfXsrVj1mMMXUfSxK9F0kmYBpA==
X-Gm-Gg: AYBFou2Yg6O482hPGpUHgvycPiptZSpRQPJeatqI60jlgx8mMBgGe7ytuyBhCGP7m+X
	1WjnHt1g2USGoKaA/A3ixGW486F7DBawGpUjOWQ7nuWJzX42P26ffMCkR4PDvSXaI08FtIfwRMP
	pY3Rub8HIbUnQ/JsJSAGKggr1vT3w6xHyzSwGJJmW1tZQ127PRNoqt6g1v1EKmPrZoB55xuPXYH
	Ga80uNZm06ANYHHKhdQEXgoo68wJ1ZKhYUKyAfMnelTuNyLkqzBl3WW4Q71jTxWzhMApkAGaWwN
	+Szn0OSJ+rjtuZW4GcWWTCrmtNpQhwAqQWG6EVNaFxmJwBMS6hIiUCZCDpOZSW834udF9E2EvRK
	5MEIlSA4mz+okrOeZi2OOCPdA09OlyyINsBxgbeT1v0TyCiCRxvgH/1VlmZDqeKL49w62F31eoU
	/dJwt4vkUv0zfs+ngSk2OPd6PPP1d519gXVn1o9D4KtbqIsNZU4VJSmj8o5o0F8eG0+GaDNnKiH
	f//g84whGgIVDBr7X+oPdFq4dBBm5bOAdxVfz5sZpFUU8ow5DCeUQCeUz05EDX6EdgyfqKDwk1N
	AbPZ/qH2/AI95b6Grp1ATVUx7B/4PjNzQZLG2yJl9vGF4qEPsNZFOGpGKuVYr6/8/g==
X-Received: by 2002:a05:600c:a31c:b0:4bb:53e4:a7c5 with SMTP id 5b1f17b1804b1-4bb53e4a861mr3753135e9.14.1794484294459;
        Thu, 12 Nov 2026 03:51:34 -0800 (PST)
Received: from google.com (0.182.34.34.bc.googleusercontent.com. [34.34.182.0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e251c26sm63991125e9.1.2026.11.12.03.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:51:31 -0800 (PST)
Date: Thu, 12 Nov 2026 11:51:28 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Breno Leitao <leitao@debian.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	Steven Rostedt <srostedt@redhat.com>, kernel-team@meta.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] ring-buffer: Handle a reader taking the new head in
 rb_handle_head_page()
Message-ID: <avWoQGaDrrY9z9Cr@google.com>
References: <20261105-ring-buffer-head-moved-v2-1-05da40cebccc@debian.org>
 <20261105155729.0f9c7e4d@gandalf.local.home>
 <avGQnBjyUMwunknT@google.com>
 <20261110025202.78c8c03a@fedora>
 <avRuXVxVrp-Kjiqj@google.com>
 <20261112061423.59e02261@fedora>
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
In-Reply-To: <20261112061423.59e02261@fedora>

On Thu, Nov 12, 2026 at 06:14:23AM -0500, Steven Rostedt wrote:
> On Wed, 11 Nov 2026 13:32:13 +0000
> Vincent Donnefort <vdonnefort@google.com> wrote:
> 
> > Yes, now I spent more time on it, I believe it makes sense. I looked at what we
> > could do and I'm trying to use a temporary RB_PAGE_HEAD | RB_PAGE_UPDATE. This
> > link flag is then only converted to RB_PAGE_HEAD by the outer writer. I believe
> > this would fix the race entirely... However that means the reader spins as long
> > as the buffer writing is interrupted, which I admit is far from ideal.
> 
> But it is only interrupted by interrupts ;-) which should be fast.
> 
> No different than waiting for a spin lock whose owner got interrupted
> by an interrupt.
> 
> -- Steve

Yes hopefully it shouldn't be too terrible. But, as we disable interrupts on the
CPU doing the read, it's sort of propagating the latency from one CPU to the
other, which I believe wasn't the case so far, since an interrupt could
"release" the reader by setting HEAD.

Perhaps I could propagate a -EAGAIN back to ring_buffer_consume to temporarily
release rb_reader_lock() and try again there? But that would be a bit intrusive
as most of the functions are returning a ring_buffer_event * and not an int.

The attempt is here [1]. Sashiko had something to say but I haven't processed
yet how bad it is.

[1] https://lore.kernel.org/all/20261111160624.1294946-1-vdonnefort@google.com/

-- 
Vincent

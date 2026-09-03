Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E893D4D2EDF
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 15:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788448804; cv=none; b=o3mLegqi4bDUik8rjBI07lC9SIA+xAra5w38oFpocYihSVLX7AZSvo9ieDcgDbrUZ4fYRz+/3JWWzq7Ae8U5B8D86mcrj9Qn97AXNgruEXNg3eHhaQBbSTXOcCM6HFk+t8IRwt7p6L0fTClmAFKP3uJAcb5nSx+0lKMWIUpyYCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788448804; c=relaxed/simple;
	bh=jHZdAdF+lmGzPYsT8GrQUp9u1PkWPJu0bdv2XBa5BQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b91PeOuaRYMbjxUEbOwavGSenvxiqUjXow5ZYq4BSISEJ54eKalZ2ulbs1DwnVtMAJIwQBoPJyB0MjXPrs3p6QucAFJMNALki3UvjP8GEmvyBiQNMr70q2ZpVGCxxsIWPYPAQNsmd1VIo1Q8rfvzF5xIo4j4SGIBFxNfGS++a4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h0EVelC6; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h0EVelC6"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6a60f0dbeccso3513728a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788448801; x=1789053601; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aAKIuEKuV7qhY7WF80gvKc7qYwMnmaoC0K+ccLX7aeM=;
        b=h0EVelC6A3CVGqPBTfq5Ep+kk9QEZ78PoFsMeDqc1Aghi85+k4q5OODRiuV8WGbPBT
         kglaaxeZoSRzOYD7Bc1z3PNeScSf+YphLW9BQV1FINM4eneiOWrD8vb43ow2SwLtvs+L
         GEcjTREj/C797xEbY2iJ+kkQg0yPKacfKIU9346Xit1iuFyEcqDczo4erYuV5pC087qX
         ieS5osJW3BUbyc+S4B+SItRZmoSPF7KO2X8a/KcxwF2ZOiqnD/2MHCUgtj031ArU+5Hm
         XlJerFbtyQC4q14XWxA+ldJNs8+z5nVWZj42lM4JF0FZSeSjTa/72bDaQLfGkO1YKLr9
         Jt2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788448801; x=1789053601;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aAKIuEKuV7qhY7WF80gvKc7qYwMnmaoC0K+ccLX7aeM=;
        b=NI3X83bIE0dOTid4iETU8/CFbHpK6ViHs7iMClWrbZcxN+Sbq3kZB5vyCpOOaSeSp6
         KqAV0sKSpJUh1/Cf9xfQVan8uPDs/B2RVq4K97HPM4rNAA1pcx/IwST4F5HcUzAI/lnM
         65Y/klE33TV0s8HQjXNBxW/8KsiHGE34EGpati+kplHfwx3s6jy9IilXdBtmbx946cjW
         /aHcQ0Ye/kxBKcz4MhWVKf2Xrmn8514xHuulRGiJn1R800i6Mj47r12hGseux9Sfp2C/
         diX+TO6x7SnvNumPwlpd99+HSc0paRX8JXrI0I9jsv1sTQ6FU7VXHu9F1ZicBwQcAGHa
         XliA==
X-Forwarded-Encrypted: i=1; AKwUvBzV6aILe4ZdAcicyC4h5wo6Z1p5WLrTza+KlMkh2PpSJpbAA8/n0/tF0HepOXHS6kTUJzN85VFcpjR/I1Q=@vger.kernel.org
X-Gm-Message-State: AFuF++mWESJaHSj/+cFDYJseZ75j6TZnj/67LyTIwvnMaHvF4xbdvJc5
	n7VUCadMU6Qhf9bfwnUps0p2e2QXyTp/UL5sKY46MIAwLWKO1aFymhx0mZTjlvBZNw==
X-Gm-Gg: AYBFou0vfm59jCdYOjhjSLw/eire8WKpbc3EFgtZa5QtEIYQ0paklbLKj6WiV4KqQ4d
	E7kcfAUk0vq0Ow4K70YK3IXnvcgXfV33HEivrXeLtImD+fUPc+VNccJ67lYxaW54QKIhksuTBcZ
	Ls/Qp2Ll+IWwI6lt6U3TUqeP/ELZAT3xRbSrtNZAaMg7N6S4O9YhKkYmsFiLFWh2pM6x9tIXW4m
	IS4vKBIDKjohUn45LwD+SXDNduvCeBNzTEUOM1Umtk/DybVhZ3nudDXfOX3qa/Ku3NUdMmp91wZ
	AIlG5yrAEHTKkg5XfQp2sxLtH+KNRt6BV6q82x0yQyxpuO/1SRls+JElJsfWncsIOv+M0y+xJVQ
	7BiBZY2GeGlubBr8p6ovawr78QcodTw7shq8CGTqvaIhrpnDt8bX7a7MuiNfVsjZo80/P9a1A5G
	4o62L4nEjGwyEtlu7L2P9eM2tShNBtjTw4F5i4uSBEsJyMVXLQUe19PQI51oVycIF54xjXHUSXE
	MLjAAY0VlrGXCWhdPtnEpvp61V0eC+J
X-Received: by 2002:a05:6402:360c:b0:6a6:cc:269e with SMTP id 4fb4d7f45d1cf-6a68257bceamr9136219a12.8.1788448800426;
        Thu, 03 Sep 2026 08:20:00 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a69a010c72sm997336a12.8.2026.09.03.08.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:19:59 -0700 (PDT)
Date: Thu, 3 Sep 2026 16:19:55 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: mhiramat@kernel.org, linux-trace-kernel@vger.kernel.org,
	mathieu.desnoyers@efficios.com, kernel-team@android.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 0/4] ring-buffer: Fixes for subbuf resizing and
 persistent buffers
Message-ID: <apmQGwDuvjSn0gzP@google.com>
References: <20260901155445.1475405-1-vdonnefort@google.com>
 <20260903103116.6cb7c39c@gandalf.local.home>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903103116.6cb7c39c@gandalf.local.home>

On Thu, Sep 03, 2026 at 10:31:16AM -0400, Steven Rostedt wrote:
> On Tue,  1 Sep 2026 16:54:41 +0100
> Vincent Donnefort <vdonnefort@google.com> wrote:
> 
> > This series addresses multiple issues discovered with the dynamic ring
> > buffer resizing.
> > 
> > I have managed to reproduce a ring_buffer_read_page() race with
> > 
> >  $ while true; do for i in 8 16 32; do echo $i > /sys/kernel/tracing/buffer_subbuf_size_kb; sleep 0.1; done; done
> 
> Did you do anything else while running the above?
> 
> I ask because I ran this for several hours and it didn't produce anything.
> What bug does it supposed to trigger?
> 
> -- Steve

I clearly have been imprecise here.

I had "trace-record -e sched" and I have just verified with a print that it has
run into the reader->order != read_page->order case.

-- 
Vincent

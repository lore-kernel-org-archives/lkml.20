Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794403941;
	b=oeej90kStFU6adwPBaFtbkf8nKL+wLWU32FuAAgTnaUCU7IzXkLDXFfY3fCuBI0yG14T
	 iS2C5S/4p26SfkYachGrmcT/z3ULfrlw+ITzzxBunen5qPbnMcphUtqPPFedKGECeTO+L
	 HSnrL/BgIJhEbqAl1KYDjocj6ItBsM5JeZ+NZjqgLcHAp4Fyn7NBq3h7n9wUVrJay8FXt
	 DyeULRP7dLPSPnhYBpx5i0SHGhBb2SWKrMl0ZI/YUidVI1xMVFwD2+TY4hgpvJ78Eq43a
	 PvDYzcGdKapug7iq5CD+w9v/rOHUGZ8PCTkYsK7XhbHBmzKI421K/V1fK481eaagNOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794403941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=NVTyTjSD88ZslZBZa+qkaw0eEzwB/Yf3D99qESsb/J8=;
	b=koeJNaQmLhc6g9t+dlqUsq9QCe2MZF/2TWMXPyGw9tYWUFmy8pA1TqKYroLyEPKM/IwV
	 uimN5ptk+W9X1vTalRjig6SpMHVhOj3uVWUuSX2ikSpFTZgG3b91/RYk09VTGaRHWCOsg
	 CpA2/F6R+q5d15aGPk9OYD9u2eVrIPkJ79/+vUXhd8qS2lqdUdTEGpqVCBYYgiqYWwT3f
	 LTewy/EW8hDm7USx2Kqvc96r4XTJ4Th/ROhdIKre7Fd3ZGcr5PqRrG93115jM3hXZmpjH
	 tGockUqznQhdw8zWq2FaEWl5JzHLjZrhbqM5PdRQHxsIkMs2ZUtzhMF1E+1cC7B6vrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UlO7TVsp;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5D5606A338
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:32:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A5D5606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UlO7TVsp
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a214af2076so23509645e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 05:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794403939; x=1795008739; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NVTyTjSD88ZslZBZa+qkaw0eEzwB/Yf3D99qESsb/J8=;
        b=UlO7TVspUXSlocLLHY+xdNnTQFFzFI+0cINbb6Sg1Tn4yPiBCKR40++aZ4ooCKnCLV
         EfMcGds/wjr+WCLnHyUwfHvHSDhIHcRS+mQKDfTZkRlna5eTjk59Rr6CO81D+V2Aah/V
         WHODxTeVpICKMxLa5TqKOWGPiz7tHe8XdUGS0of9wMQXVB9c0XcwLVRHoDZDQ+v0/gFO
         hfAGITQFUVIZR7cJuVCwqF3mkrwZHBrVUtrgnp6RwsJ/6vG99PKxoysj4QELbPxe0+Mk
         iOByEbttPqohzAgTeNlgYnElPNG48arMMDUg8SafT7UYbFNfjdVgbRBwOtYOJA4r1irH
         WF1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794403939; x=1795008739;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NVTyTjSD88ZslZBZa+qkaw0eEzwB/Yf3D99qESsb/J8=;
        b=G2sR+jfqPUc7cyryZS6GFkI8titw3sPDiRND3TlE2wC0qvz7OjGX9vd2iu21TNL68Y
         tGSDzAguIldmGlXvGSlr6MlNfZjVizHI24IHecpSgshUb09ndNbCpjyeiu32x4EPrAmo
         1/qBY4KC0MdMKjVAihyxlJ8IPDYbL098GuFWvB88jTmTWjbTgtW/x1OKf6jAwoAgWVG0
         +yqUPCN4/wWazcIYIecVpQ2IccBECdTw9LLObxS3kPFIaRKm1CD8yGGhO5p1SDIMci7b
         Bb+LoBVRWyKRIUD+01B5EzwSimUo8XF1qVHpUTlOXSggCSORMIokFnIClhwtcsbOMqPR
         eTXQ==
X-Forwarded-Encrypted: i=1; AL+hErGQeEC4ibe0KU3KxPsZWZGBVREHF3NEgPcG7B8Su5Lx/Z0u4QUraFge2fTJ2+pm25ljKpDoFMqFDIbxEkY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dmwKvO6UpBrA/JWfjldiimzN8P8CIljk/a/pLVFFjGeAZCEUh
	/LB6H1JTRfNr4R49Obo7k1ufEQvcTWioJuP7DHJ+BGrf8uo7icwiisnP7rZecR7TGw==
X-Gm-Gg: AYBFou0HZfkhZDrdYJZMN2l1V6pHtRbQxLH/Y8Z384y6lilcgtzMopKdPmNsNEDfeKk
	8ei49Qugomw1Dz+GwPsajnP0qnxxGv5zJ86E7zZIUvVdccQq17VYFNKl7ThzwiyNHXWhovmIBhL
	y+V4VJyFrbIMlx4c6oy6l7LfKk4NW5nUPSlWF1Jx7XkQmp7Xw6qo9yruCYOPxQQV59AxvvJs0GQ
	hXb8wMweE9RTiw/vpKdhEYwTnyThAj7qjA6VmaZz7/kiQoBJZ5kEx9d4TGr6qsJ+8Bo1Gr/IBO1
	Qref2isMqpVI1iAEmGTCHKqS3sxwLNm6gUZ6KGFsJ31/DZMtTLZRXRpmlzxV3xyVJ8ySRXvfH0J
	1k4WVCIYJKMfdzXPVTyxUeeUbhoEWYaXM9zeLBpEk+PMqJ+qTFDWQYM91ugiAEDas1sY7jr8D7M
	qVwSeN5YNMeUyx3ugwpCOPfpt9LHeVISqakKwsjsBJMM5ZDCNzoRyIlZxJPue2/n+XmcbuJU4YS
	91y4KCjDQ27sMLj68HmNiXtE0yoI2JCEfRDxLNOqjxUMoXTjbwJAhulPcLIpVX2/XALz5oDdmFp
	/i7fmmCHuX2int52kQjju63yj1TB0e4PK03T7GYUgdDN8Zreegr17MwaANyinUk66A==
X-Received: by 2002:a05:600c:6214:b0:49c:fa20:cbfd with SMTP id 5b1f17b1804b1-4ba09375bb4mr41985575e9.20.1794403938536;
        Wed, 11 Nov 2026 05:32:18 -0800 (PST)
Received: from google.com (0.182.34.34.bc.googleusercontent.com. [34.34.182.0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0951fe22sm64107395e9.3.2026.11.11.05.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:32:17 -0800 (PST)
Date: Wed, 11 Nov 2026 13:32:13 +0000
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
Message-ID: <avRuXVxVrp-Kjiqj@google.com>
References: <20261105-ring-buffer-head-moved-v2-1-05da40cebccc@debian.org>
 <20261105155729.0f9c7e4d@gandalf.local.home>
 <avGQnBjyUMwunknT@google.com>
 <20261110025202.78c8c03a@fedora>
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
In-Reply-To: <20261110025202.78c8c03a@fedora>

On Tue, Nov 10, 2026 at 02:52:02AM -0500, Steven Rostedt wrote:
> On Mon, 9 Nov 2026 09:21:32 +0000
> Vincent Donnefort <vdonnefort@google.com> wrote:
> 
> > > The issue I think you hit was that we have two HEAD pages, when interrupts
> > > come in. That is, we can get a state of:
> > >   
> > >   --> subbuf --UPDATE--> subbuf --> subbuf --HEAD--> subbuf -->  
> > 
> > How we can end-up in this situation? The cmpxch will only swap HEAD for UPDATE. 
> 
> The cpu_buffer->head_page is only updated by the reader, when it did its last read.
> 
> Let's look at it one at a time:
> 
>                               cpu_buffer->head_page
>                      tail               |
>                       v                 v
>   +--> subbuf ----> subbuf --HEAD--> subbuf ----> subbuf ----> subbuf --+
>   |                                                                     |
>   +---------------------------------------------------------------------+
> 
> Then the writer moves the HEAD page around the buffer while there are
> no reads happening
> 
> 
>                               cpu_buffer->head_page
>                                 tail |
>                                   v  v
>   +--> subbuf ----> subbuf ----> subbuf --HEAD--> subbuf ----> subbuf --+
>   |                                                                     |
>   +---------------------------------------------------------------------+
> 
>                               cpu_buffer->head_page
>                                     |          tail
>                                     v            v
>   +--> subbuf ----> subbuf ----> subbuf ----> subbuf --HEAD--> subbuf --+
>   |                                                                     |
>   +---------------------------------------------------------------------+
> 
>                               cpu_buffer->head_page
>                                         |                      tail
>                                         v                        v
>   +-HEAD-> subbuf ----> subbuf ----> subbuf ----> subbuf ----> subbuf --+
>   |                                                                     |
>   +---------------------------------------------------------------------+
> 
>                               cpu_buffer->head_page
>         tail                             |
>           v                              v
>   +--> subbuf --HEAD--> subbuf ----> subbuf ----> subbuf ----> subbuf --+
>   |                                                                     |
>   +---------------------------------------------------------------------+
> 
> Now, I'll break up the update part:
> 
>                               cpu_buffer->head_page
>         tail                             |
>           v                              v
>   +--> subbuf --UPDATE--> subbuf ----> subbuf ----> subbuf ----> subbuf --+
>   |                                                                       |
>   +-----------------------------------------------------------------------+
> 
>                                  cpu_buffer->head_page
>         tail                                |
>           v                                 v
>   +--> subbuf --UPDATE--> subbuf --HEAD--> subbuf ----> subbuf ----> subbuf --+
>   |                                                                           |
>   +---------------------------------------------------------------------------+
> 
> An interrupt comes in and moves the head even more.
> 
>                                  cpu_buffer->head_page
>         tail                              |
>           v                               v
>   +--> subbuf --UPDATE--> subbuf ----> subbuf --HEAD--> subbuf ----> subbuf --+
>   |                                                                           |
>   +---------------------------------------------------------------------------+
> 
> Now  the reader decides to read again and starts between the UPDATE and the HEAD
> 
> 
>                                                  cpu_buffer->head_page
>         tail                                              |
>           v                                               v
>   +--> subbuf --UPDATE--> subbuf ----> subbuf --HEAD--> subbuf ----> subbuf --+
>   |                                                                           |
>   +---------------------------------------------------------------------------+
> 
> It finds a page with the HEAD pointer set but not the UPDATE pointer and does a swap!
> 
> 
>                                                         reader_page -----+
>                                                                          |
>                                                  cpu_buffer->head_page   |
>         tail                                                         |   |
>           v                                                          v   v
>   +--> subbuf --UPDATE--> subbuf ----> subbuf ----> subbuf --HEAD--> subbuf --+
>   |                                                                           |
>   +---------------------------------------------------------------------------+
> 
> Now the commit finishes and moves forward and will even hit a blank
> page but the last write is now on the reader page. This breaks the
> entire integrity of the ring buffer.
> 
> Does this make sense?
> 
> -- Steve

Yes, now I spent more time on it, I believe it makes sense. I looked at what we
could do and I'm trying to use a temporary RB_PAGE_HEAD | RB_PAGE_UPDATE. This
link flag is then only converted to RB_PAGE_HEAD by the outer writer. I believe
this would fix the race entirely... However that means the reader spins as long
as the buffer writing is interrupted, which I admit is far from ideal.

-- 
Vincent

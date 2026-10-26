Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793026695;
	b=iyjL/O1AC9+PeDzui883kbGG+8NffIvoPjhK4jaAsaS7O3UdICINdehmHKvWY0NfXUuz
	 I1BC9BmiJE1wPKshjbyDcNEEfItMmToa15IjT0i9Eo4W/BOWcGVzFTVcuaJpGs2nHD3xD
	 H04xB4Sex/qPHTB3DzhRK5+Y/BMce3vQNR1BYCSfGzZMAU2xaakVdh19v9uSVb2fWMZ8z
	 nmzQ/5LBbni0uAZd9zfKO/qgd3CFQZBnKHHpggVTvIuFoDH9WjejeojQQfVC4YYZpOFds
	 pyzfx+cGWoWoqDi23f0WdEnLM7IA8/3Mckk4ECWKoOeK5ycxT6AI67Mxl+d2vnhtZtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793026695;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=FJS89KuNZwh7/7cErKHYPAXh9YyRaZbbAgWp3J/Ttec=;
	b=GrDaRVe+nwimLH/upQIInBjVaLTpdFW7TvOqNMNIKW4dNi0rI946hyHj/wNOX+jMfi+T
	 j8oOOxzwxfctL1DiXJqzLx3umGdzeFiZYtGphhVhcJ2i7SglvoqimpaozDGbD5w0rgLdf
	 c6r7o9107tj+BzGyTanpdDnQCe7rAzqJymLaEy0UaT7ZKsgtwUWT9paV0Ab0spxv6W8V6
	 mxP1d3Y2gB5r52gr0QALkNf7rrTFUjl0RCgUa9umKCe0mnkUrQfkW1N/xoWDChSXzOe87
	 XEAzLQlHqfUmZru6bgJqzxp6Zt3LGLzlotWqrCLQpX49Y5lOfFBGbhrxOxJE/EjTTWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=hG6q6yQg;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE75606A322
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:58:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDE75606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=hG6q6yQg
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so19816885e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793026693; x=1793631493; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FJS89KuNZwh7/7cErKHYPAXh9YyRaZbbAgWp3J/Ttec=;
        b=hG6q6yQgnImNhH9iUb0H3TAMaZ6XUqV0ei3aaw2ghXRT929UaGAYimUg0iIa6VeFUh
         jWGG9Mq7QpZWkLoRa1nteywXfHeLQTJ12a1aoDgfV2RrIb9qpDNYmdxT0g50ad7o6O2v
         4lE3401qAWMKmJ/H0m4VF4Fj1zcJb0ymcxYv0OsnJH3/Z1zAaXev5JQYXoyYDbPwJyuG
         Rm8J/wtxoxGSMpuXBSdvW4nfI6zb2GiemVQqiv23xsuUIK/RrX8c8Kdvc78BWM9Pj0/m
         hoTQ4jXiTSbUSoF80Ob7exNxamKuuN3lHgnD4QNSoYxvS2+Asb5HlY6wqZf6vG1yWndd
         T9ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793026693; x=1793631493;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FJS89KuNZwh7/7cErKHYPAXh9YyRaZbbAgWp3J/Ttec=;
        b=0tU3EM5t6HA77ceQIKTQtWPal3pa2yAbpsV7paSGlX6tkGZne4ZN6BWEvdSVwW8y/Y
         5F3LklL4TLAVOV4FpifsWN5V/xjeTeB7VYN0AOXfeF3sFemwuS5euVNzv6ftkrFeyNif
         FZSks2+K0j95lLFhnRDMR5HmuwPtud7oIQunPq4nhWbxHc8CEJ4ErUqbDI0UO2ozDBZw
         eG+cmppYjXKzpiXQSOKyN9qbNTotlPXPte4M1j/CROsH7IZawKSrZe1rA6sHzwz0PDbB
         +KuC8tRG5f3yKWKk2xJM7rdy9gzkf2SnWjYmsNb/d58OFyH7RhOBQynm/BV5zMmz9drI
         NZtQ==
X-Forwarded-Encrypted: i=1; AKwUvBxzh2shulhIFtaQXbUomU/Fpsg1gQaaxJU6P4uWZub4nntctpkIdSnELkVJ7r9n1T1Vr0VpmRu2dCAVcpg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKYmf0IaXng/lSrxhpjzyW7X+Wp63TThCzCx/D94Q8P6HfAH342
	q0KbX2NGfh0uuraZOIdsBsEu7ZGYGkM4Fv8c0UaPiI0PE2w5Nnj+VkJX8N7HcZ4uDE4=
X-Gm-Gg: AYBFou0Ex9ZjrVM4qKy3OSRPZU62cU3oDcZWt2pq6lU7YzfKKlVWLjcDlI//yumIcKI
	sFil4cgehWuZvUDadGiz6h3iTm52fxGVQOwXuaMFjk3JpW7YCZtR9SrjYJpqe0XChBYOhTeGuDF
	9ePH9rK6fWAw4ABR5OBrMcMQ+6uOd6eopeWkyfDar61LAvxZKs2td/4VFX5whtcv/8Ku5WCyYxf
	nnrh33x44OIMqA2ftWOUrNGv7XG1WdlUrw1sNWaQ384+WG9h54AYYUWnO+ovgcBDie9ycrJ7oGy
	5MGcpIoEeiZGoHFna7jB7fILQuOt/8bgwgppGwqZNuOsjq7GbOQGHL3xhjjxoDPEeyHg5+H+X3W
	fzOw+BVTRepz9yTanrJ0X0nN2v9E9i2I+ynW9zXF0yUQyPRJk59C+lEpInlFS/pAiqjOn3gk9dL
	p1g0eH/MTKOwz9WjRT+ULMzrPr3Ht7mNLCjnxOKqKjhcgFfSD+QYNPCCuLC16PjXLiBMozYMhPW
	jZfDlYsezt+sDcwnJj5WfHtq9oVZYJKGh9SV0GzHmJXqMUjPPF6giQzPA==
X-Received: by 2002:a05:600c:4f50:b0:4a2:1050:aff with SMTP id 5b1f17b1804b1-4a35ac8c32emr168076125e9.6.1793026693314;
        Mon, 26 Oct 2026 07:58:13 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a08643dsm158480615e9.4.2026.10.26.07.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 07:58:11 -0700 (PDT)
Date: Mon, 26 Oct 2026 15:58:08 +0100
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Breno Leitao <leitao@debian.org>, chris@chrisdown.name,
	Sam Crossley <samuelcrossley@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Paolo Abeni <pabeni@redhat.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Simon Horman <horms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH RFC 0/2] netconsole: allow replaying the printk buffer on
 demand
Message-ID: <at9qgBucVm-QHnye@pathway.suse.cz>
References: <20261024-netcons-replay-upstream-v1-0-9613f38496e5@gmail.com>
 <87fqxskdpl.fsf@jogness.linutronix.de>
 <at84qygscue8crQi@gmail.com>
 <87a4o0k3qa.fsf@jogness.linutronix.de>
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
In-Reply-To: <87a4o0k3qa.fsf@jogness.linutronix.de>

On Mon 2026-10-26 14:15:49, John Ogness wrote:
> On 2026-10-26, Breno Leitao <leitao@debian.org> wrote:
> >> In the per-console loglevel series Chris Down introduces [2]
> >> /sys/class/console/ to sysfs. This is where we would put all the
> >> upcoming per-console knobs. I would expect a replay trigger would fit
> >> well there.
> >
> > That makes sense from a design perspective. Thanks for the direction.
> >
> > So the next step would be to add a basic /sys/class/console/, similar to
> > [2], and put a `revplay` entry in it. 
> >
> >
> > That would be about three patches:
> >
> >   1. Create /sys/class/console/, similar to [2] but without any loglevel
> >      handling. cdown can build on it when respinning the loglevel series.
> >   2. Add the per-console replay helper, similar to [3].
> >   3. Add the first entry (/sys/class/console/replay), which triggers the
> >      helper from patch 2.
> >
> > Is that what you have in mind?

Sounds good to me.

> Yes. But perhaps someone else wants to provide some feedback about this?

The "replay" approach looks like a big hammer. Many messages might get
duplicated, especially when the outage was small.

A better solution might be to do not increment con->nbcon_seq
when the transmission failed. And try it later again.

con->write_thread() currently does not return anything. I believe that
it is partly a historical limit. Two problems come to my mind:

   1. There used to be a global "console_seq" counter which was common
      for all console drivers. But we have a per-console counter since
      the commit a699449bb13b70b8bd1 ("printk: refactor and rework
      printing logic").

   2. There has never been a try-later logic. But is should be easier
      to add it now. We have the kthreads. And even the legacy loop
      is able to break when there is not progress.

Best regards,
Petr


> >> [2] https://lore.kernel.org/lkml/84b8d91693e56f6026271bc40553bcb6657ab24d.1764272407.git.chris@chrisdown.name/gy
> >
> > [3] https://lore.kernel.org/all/20261024-netcons-replay-upstream-v1-1-9613f38496e5@gmail.com/

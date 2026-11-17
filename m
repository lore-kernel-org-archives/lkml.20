Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905508;
	b=j8UZH3Wml5f8A1T7/KZSqAbrYOKr4V/cbIc2uIkFgPuXyo9InYOAQV+RwecS4AVbPLNS
	 PFy0QSgTdKihV67W/Usj2G2NwCkBsMWQNfVvuSBDBhOi0ol2qHh5CK7G0453Jw4B/AfWa
	 fqhTu55vCbPFwoPlVg1tBtG+QzvLMjHrWbAj42w6nmPYPn27NCl2RI/VFSuVBk72wIiGR
	 4HX0yzttOlNt4YMjfOWRWHb5Jc4Ccueug95DBuYpV5HWb2LjOWLSlREThUW5vcdxkx13I
	 kwHVRubnbENw8ZOISmvilMjg6lKPw6g+7SZEAhI/8fuZOiTYOYyUOvUnvhFi30tILZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905508;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=s4yCKzF4YDIiI5PlcqBi7tYBGUxCwcilhm4zOkc48Yg=;
	b=jZssLYIsWonxc4XvMTkE4MzaNaWi9u8Ro13/o+6nyOe9RHOo5Dg/KnY3FvIULKxgcw6Q
	 dgso0VgK5wkmb/WaZAtSC88gpooKB1+Q94NvszsBvwHoKhCY3OlefL8wB/qOfzGfDNdD4
	 ydSkz9a9UDSYLUnFGXFiuwGrr3LTntdnmTHcU8lA16K9FYupykAlN414kHnOTFfoibpfI
	 ARkt/2MRqzhIp07YC577kMqPjrQ187QvVWPza3BHIOKHT35apzyjPAKm550DZUmHVI3Ec
	 Snlw+ulSDrgwFgfCwwSzI23zD/NMWAo7YETB1es7bfJe+mnNtMEkWHEW/Vgfu/em72g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=hB58cieY;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F77606A33F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:51:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58F77606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=hB58cieY
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cdd9d0c9bbdso3262507a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:51:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794905508; x=1795510308;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:dkim-signature
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=s4yCKzF4YDIiI5PlcqBi7tYBGUxCwcilhm4zOkc48Yg=;
        b=b8SaWeE3zwDFpVwLrjsYR1MY0YeHM9LwyXBLrNmJ/aFxV28q1CavGODRIvpf+dDo9I
         NcFUTWcIUXj34KiUV5SlVBWDDKP5ciy73y87dCkSHWp91SnEzA6E9kk2JxqMk9LtHwQZ
         7aDsnGST/KMtZa0wh1JH99LrwpYjm9Ilci1atSbGu69YCWSk/aIyY+LHD0kDh4tQcTWw
         PzxKMaxeFQ1/EsSHyM/uk7v5wivIuOFF1AfLTWdYrzboZ8tQQFaE1IxPrCy2iwCgSt+A
         ZGXWjTGcsO1akNX+hDLAHIYtNIov06zdg5h4KBlOOiJxB/XDklmZ93aWIgWTEUTHaece
         PpEw==
X-Forwarded-Encrypted: i=1; AL+hErG2Wb05EpNj0tZ3cqrpSaLk33bVsdxhyeyM3N8WuHMV5vuzw+AJYQQxArIijC1gK+ZkIb4VwoN2IH4Q5iU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+IjpFs0O0ZF0RofqPqTyPF34oveQN9rDDSvvFzaQN5zuqEfeVy
	9sdw/qbcl5aRLuVY6q19FAPykUlSAj8LRnb3atKTVa9KMbvZzN8YknNMjYHlpgcEPhjqPivaNlj
	P/zTsBYVRnZhUmNNIyJVqBc65u9khHr8XfGkH01z75jDZokuFiIvpVnKnkQVZBiRCqdVN9B0/um
	LRfSu2LjnVr/BTdKYUpqriF/WkMMGidzjyAtbqcFpPR3ZgJ0aWRG+dfqOfTxqtFFl1rdRDfV94Q
	1fGAtRpGINMBzPvnMEUuA==
X-Gm-Gg: AZFdTZeyyM7Wy8+qGs6SuMlEGzBgbASl9WHP9lAFqf47SKqbJSUBEu+043A6xzsQi69
	uYk4EQYguUJMA6DjOZdT5+/ZkRf29ihBXaVwnG2TGprwcYqxJqSa1glcIKwcJM0pbSc5RlPs+gG
	nwY/eQXlIJdd9Xd8p+WYHuikEJk7nJLoUr2iJUi4IGt6B7H7lgOmKi4VdQO8NX/PYcBjsoYDSDt
	DBVLjmqXOwx2Lvn+gGmb+3u1wNnWRP2sSd60lIDncLsw5vmYhwz2d95Fgm0HENdoECZaF8M1k/w
	Vrc/rUg2yAdzYr+i41tZSK96qoc72Nb1sidpoF1qXe9JRAcfO2fvmrIEkTuxBFxfzcQxyMq4UXk
	69Rg5cCoHGknHfrpk/bt1c0h0G/xm0CZ8L+5TGSePhll/bF34qAwmbgO5wGfCok3Ai3WcxUW1lH
	MEoR8C3g3Wtx0iP09vucMC+HaRVPvkt9KAQdxiWA==
X-Received: by 2002:a17:90b:5687:b0:3ac:bc3d:6fe5 with SMTP id 98e67ed59e1d1-3b1b089e26fmr13296378a91.7.1794905507602;
        Tue, 17 Nov 2026 00:51:47 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3c050721csm174339a91.4.2026.11.17.00.51.47
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2026 00:51:47 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8b852fdd55aso5554591b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794905506; x=1795510306; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s4yCKzF4YDIiI5PlcqBi7tYBGUxCwcilhm4zOkc48Yg=;
        b=hB58cieY5b8UwhK1MBXmQ8KGG0LZz8/e5NSGWg6whcFiDUdWJ3ilIoNekl+HyBk0Dd
         qjsFbLQ8yyU9+rMOplOuiPp4mR7t5V+zOU66yJGPVJESgEh2RWlOY0arvu0YQBGVRKuZ
         7cpC3C1yzjKHMiQSkRxarMVSAyY80Q6QlP/9Y=
X-Forwarded-Encrypted: i=1; AL+hErHCyhB4mOpEBLE1QoCtsKrnK2owxxFUSUB+cKHMUocTVN5JbeSwd9PZTPX87udjRTD3rn2yXHLzsb0vfsc=@vger.kernel.org
X-Received: by 2002:a05:6a00:4215:b0:883:71f6:5fb with SMTP id d2e1a72fcca58-8beb5bacc27mr13819089b3a.13.1794905505993;
        Tue, 17 Nov 2026 00:51:45 -0800 (PST)
X-Received: by 2002:a05:6a00:4215:b0:883:71f6:5fb with SMTP id
 d2e1a72fcca58-8beb5bacc27mr13819068b3a.13.1794905505604; Tue, 17 Nov 2026
 00:51:45 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116074849.475815-1-stefan.chulski@broadcom.com>
 <CAKYAXd9KT=1vLYsnRKxmiM6pLJQNACXuodD8wNQzb8S5apiuRQ@mail.gmail.com>
 <CA+Fu+LPL7xqpV_vjjjehedOFtuuBqgZHZTSqJ+FgweUpYo2uBw@mail.gmail.com> <CAKYAXd--x9UajLQwzRUwxRZ7PFW5T02xyHdSAnThAo326p_kxw@mail.gmail.com>
In-Reply-To: <CAKYAXd--x9UajLQwzRUwxRZ7PFW5T02xyHdSAnThAo326p_kxw@mail.gmail.com>
From: Stefan Chulski <stefan.chulski@broadcom.com>
Date: Tue, 17 Nov 2026 10:51:33 +0200
X-Gm-Features: AclHuK_RHNY-A8YWsfLMtfZRg8kMifDdxlLsMR_xEYE8xYRbaSFIuqvBKZGGKlU
Message-ID: <CA+Fu+LPnXMd9rMtywkZL77XzLq8n+8AiBW2T8Cau10YnVbofiQ@mail.gmail.com>
Subject: Re: [PATCH RFC v1] ksmbd: add use_unbound_wq module parameter for the
 ksmbd-io workqueue
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Tom Talpey <tom@talpey.com>, 
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>, linux-cifs@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ilya Lifshits <ilya.lifshits@broadcom.com>, Huiwen He <hehuiwen@kylinos.cn>, 
	Gil Benamar <gil.benamar@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	bcm-kernel-feedback-list@broadcom.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Tue, Nov 17, 2026 at 3:34=E2=80=AFAM Namjae Jeon <linkinjeon@kernel.org>=
 wrote:
>
> On Mon, Nov 16, 2026 at 9:52=E2=80=AFPM Stefan Chulski
> <stefan.chulski@broadcom.com> wrote:
> >
> > On Mon, Nov 16, 2026 at 2:10=E2=80=AFPM Namjae Jeon <linkinjeon@kernel.=
org> wrote:
> >
> > While both address the underlying scheduling limitations of per-CPU
> > workqueues for ksmbd, my patch introduces the `use_unbound_wq` module
> > parameter rather than changing the behavior unconditionally. Because
> > the optimal behavior (cache locality vs. load balancing) heavily
> > depends on the specific workload and platform, this approach keeps the
> > existing per-CPU behavior as the default while allowing platforms to
> > easily opt-in to the unbound workqueue when it yields better
> > performance.
> Could you provide the benchmark setup and actual results? If
> WQ_UNBOUND generally performs better across representative workloads,
> We could make it the default and provide a module parameter to opt
> into WQ_PERCPU instead.

These are the results from our embedded systems featuring dual-core ARM CPU=
s.
The benchmark setup is fairly simple: writing to a USB disk over the
network. Because the network traffic is a single 5-tuple TCP stream,
it is pinned to one of the CPUs (depending on the 5-tuple hash).

We tested this on two different platforms and saw the following
throughput improvements:
Platform 1: Improved from 178 MB/s to 210 MB/s
Platform 2: Improved from 215 MB/s to 263 MB/s

Regards,
Stefan

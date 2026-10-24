Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792858138;
	b=3VNETJhulY1dheBanuHCTKVbes7q3RL64UpeI8BRJwMSM+yWaSwPtV453wBv9EnJRpUL
	 MZ/iYUF+WHiURRjHhNZCzMV3OGnRp8TLRKcALLq8im+ZmASzeH43StHLpbSOZzPtAXF3+
	 1VeKRPQ+kEQr0s7WJD1fifC7EAcumraKts7uWzme9VxerspUk3MeIT0BgwDjtPvgfybS8
	 doRzMrZmn7XOycS6O10+9PGHMsHir3bxWIx79FpUj0hnL7MW6MUzdODJPcvVQ6kYZEMfy
	 uylbLAw3OoTktau/1QD2q50M6QQxDlcbu77WJU+5t6FHYRuqBA5TlgpD8UNEhtDj+ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792858138;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=jqgo1XywgsdgGPVlo0B4zN6yPIeNTL0VXgREkra6lSU=;
	b=Fs6/J6/DIQ7AAKFamVY2UiFUEqzIFRHT4u6P4d0d5xx/YC1IDlJ+fyuWuySUNwBfc7jG
	 6+9fYsaT1OOXfoZ0Iog5AGbslHBgi8aY2C1ALunSgAG4bEtSOWeQAlBv5szIDI9qDHU+P
	 8oZsAsG+1o4U6NQXgYt+qFhRWElqky96qibcADD3oIHZgA4ejo5khSmYpKGEShvn5d9Ul
	 EgkHD8rNbHR07ya04v33U8Gisu3kxWqNdiN8Jm8aWbkSGQ/ja48YqAIWh+6dtU0/pkd7X
	 Wx5h706pW/5cp9GvkAOZqVQFFR3tT7FAWT7aM1vQjr3z5q2DffQ2j2IgcrkI4CYt+ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VN4LNyDR;
	arc=none smtp.remote-ip=209.85.221.182
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D78606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 16:08:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7D78606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VN4LNyDR
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5c9e7731b34so1360653e0c.2
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 09:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792858137; x=1793462937; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jqgo1XywgsdgGPVlo0B4zN6yPIeNTL0VXgREkra6lSU=;
        b=VN4LNyDRn0nF8VT5iTrawyuNKTNtSTLtnLK1Tp9Gir/5VxAldXkG4dm/WbYUgwbCTM
         7Z6/f1LYMDuxLtL7FEl0DkLpaKMqz7heaNTd6yfTAvuTyv97pzNT7Z/dAdD9eJiXB6iN
         2BbyOb3OM5AVgjoZkSPaqr+AEl/Us1oAtshkVkZLhX6U3UnkyivyDDzcheXp2qGNM6UO
         PNK9iUzL9DRTniSiLaSvpOvK5MD5TZ2QyhefdJCb/qiW5aE5QmlA2fWCv2iD5K0C6pQe
         cTiU45HAFCxhM2aKjWBOHJzS6UCrVys7+25yHI9MJvMjokmPavoheC+5Glq81WrPGGmA
         PG6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792858137; x=1793462937;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jqgo1XywgsdgGPVlo0B4zN6yPIeNTL0VXgREkra6lSU=;
        b=lSNwFtBR/GeE+MSpj/Jt4mU2jA5hl+F2cQ9EhpkhCzeaIMaMZ7SqxoV+7REyivfgr3
         DV+4ggDQXAPaeSKEhd3rY/WlzEjKGeuoUQZQm2oYnQf7qZ72BFpDYMIUkHNh/Ax0tsIH
         35TJwv23+nsdIpFSBwLl5V+Jn6oay6HLVmI8LE2w+pp3oYoliHapfRYyMrmaxsCvZ60W
         vfI+pmE6C1W1V7ydqPntZhFkjcZGIddECEZihHpufkzDNH4N1ROJ/piNH7JKqQf4exQb
         PVjr3Cm81Dbl7EcRt4mO5L/1Gvj7p9mSvgWBpyntZr/v8oIrepLbfcMxJybs7yPoJyCt
         WZow==
X-Forwarded-Encrypted: i=1; AKwUvBzCY3UF5bPfP/yfk27CJfxpdprQXqcmISBk1kBkCbXIp1LCvAaNXVRD4eOWheC7EXQJIJ3HPVlSqun9jCc=@vger.kernel.org
X-Gm-Message-State: AFq9FYI5vDBcd0yFiogkP32s1cC9VW32ujrTY5eAlsfkSr7snXeTRMAe
	TQpo8SkqoO0t3lVITB641AD/dw1kU+8bpk9IcO0hKlda5JF1M6AHSIeO
X-Gm-Gg: AYBFou3VwEhwIXap4RCzElpogRdb8F2rsPEaU5U4HYkFK54dThLyZPmVHTIRGHUdpbQ
	XSvJvk3kA5C9mQnFhPMyYqpFW1RbvuHI5OJ2hw0HyIFiFOiZbqdueI6AglGOzWIxnX8IYXtmVvm
	0v72F46po3L18oFkGz3j/bOmn2WnCNjlhp0kp92U2wS1wEqpYSEbZ5qtQ/holNtHzjDbH09uS7B
	99QsXkW4dP+6vlccc6H6La6TlFZ98LU+mXnNhk4scZ1EnQyOnufkefE/T80f1x/X3qaE/2D/fz3
	AZrjssdx+BzZSNoMNwbJxaUZnG5QsZyL9NJDIR8xV6aO+fHD3kPP8qHeWM4tTSZ7qAe+qDeqm+R
	GKG4RzMFZQKMCmpnnwJ8FIEi5a+4j1yTzVLaTRDIq+w1xe29Uyu2T7abPMEgNVV0/X31EhYUOyk
	/UrKHTJDt9rx+/pLWuShbIv4x50LhqI0Nkhfa0dS/ZWuoiTrzG/lPiEoQsLVO6EXQpQLeJz0L80
	+NadmGNhU1wuW5zKLOWVVzxEz3fNYRFY1x+6Cx8hJZLNf47lOX3t29n9nNTV2IxERm/weGNSmRM
	UhD9YjBplcE2FuoxeaEr0D1AGQQXg3wR8dUdDaF5gDNvuOY8fdIEj0dCn7HKYXdUlCbUXQoKcE3
	SKvUXTXm5or4FmXTnXSykBlaf1clDOuV+Vl90cT09
X-Received: by 2002:a05:6122:1c07:b0:5ea:a1ad:6376 with SMTP id 71dfb90a1353d-5ec230a26b8mr706060e0c.1.1792858136874;
        Sat, 24 Oct 2026 09:08:56 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec234277b8sm2521988e0c.8.2026.10.24.09.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 09:08:56 -0700 (PDT)
Date: Sat, 24 Oct 2026 12:08:55 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, 
 linux-kernel@vger.kernel.org
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Chris Arges <carges@cloudflare.com>, 
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
 Phil Sutter <phil@nwl.cc>, 
 Jason Wang <jasowangio@gmail.com>, 
 =?UTF-8?B?RXVnZW5pbyBQw6lyZXo=?= <eperezma@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 netdev@vger.kernel.org, 
 virtualization@lists.linux.dev, 
 Max Krasnyansky <maxk@qualcomm.com>, 
 Rusty Russell <rusty@rustcorp.com.au>
Message-ID: <willemdebruijn.kernel.288f04be304a@gmail.com>
In-Reply-To: <20261024113809-mutt-send-email-mst@kernel.org>
References: <cover.1792768096.git.mst@redhat.com>
 <20261024113809-mutt-send-email-mst@kernel.org>
Subject: Re: [PATCH net v6 0/5] more virtio-net csum hardening
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Michael S. Tsirkin wrote:
> On Fri, Oct 23, 2026 at 11:09:17AM -0400, Michael S. Tsirkin wrote:
> > 
> > Okay this seems to be converging.... But sashiko did find some issues I
> > thought are best fixed. Specifically I thought of a better way to handle
> > short gso in a tunnel - just clear tunnel gso! As a side effect we now
> > fix up the checksum for these dodgy packets like we did before, instead
> > of a drop. Good. And more false positives that prompted me to write a
> > bit more comments. So here goes.
> > 
> > Apologies for reposting so frequently, I know netdev bot will be unhappy
> > with that.  But Paulos's report made a lot of publicity, there is a lot
> > of people looking into this, so I feel there's value in defending
> > against all this class of issues sooner rather than later.
> > 
> > The issues were mostly found by code inspection, but all reproduced by
> > me in a VM.
> 
> Ugh. I found another wrinkle( Firewalls that shape the payload.
> They are currently seem to simply be hoping most traffic is CHECKSUM_PARTIAL and
> only looking at that, and that will break.
> 
> I am not sure what to do yet. Extending the sysctl knob to control what
> happens if validation fails: pass/drop/complete - is the best I could
> come up with. Or ignore the issue. Or just forget the complete at input hack
> and drop if we can't figure it out.

Sounds like such users will just have to disable the sysctl for now: pass.

And update their firewall, then reenable the sysctl?

Does adding a third drop option help in any way? The sysctl is the safety
valve to go back to old behavior.

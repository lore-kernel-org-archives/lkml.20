Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793727535;
	b=ArKeqeLnH9vbQAK8RhZ4NIzVP2wglsIjsNsSZaX1Q9eLp84Tq5KAgIwJvQGwHIRjVbKi
	 g1GhQyVoIRHazoIR/REIXWaADS2ddk7KVxMEyQDhxZMaXCpKxTWVStOLv9/YNH01+zjBh
	 jLnfU82SETBnI6JqviWPviWc/H46e0hME9fj/thBZ9iKvXIcWzKD9yCL86JFklAVlCJ/5
	 wYONdHDq44KRW221/Pi85/hayyKkc+vySfTQby247ZN9YWT4XyG9DUEuC7unTB8wJJaJK
	 qFBDahEmyyc4XfkEJZtoU988vmqdMPVpCjLSnnXPipl6VevuGNngxq0jhoy+IfqeRiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793727535;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:From:
	 To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=OkwjQcrA+9UHu8UElL0k3VjIuq9juyNW3QXudrampI4=;
	b=cCvJnj1u3GEE+rKgEcELyk0J/efjKT8u0l7h0c1nWS/GNQJVd7h1oJP7kUWQYNhsE07d
	 Xel5pw/6dKfzh3Nuyib1YAbQGZUKu4huv6AlJEucOpbvoz/w2O+5GLIRARbz2b3MJ7dIA
	 JN4a48rQ/8L7alXHbHaM/lGB8yv7/SA/7K1bGmlw/6Rwu7RUu/Hwt0T/UrAUt99lAr0Cs
	 ETm3opsClSz64rI5jav9HQAFmBzdS2toeTXur7QbUCFLTO+FHXv9YDWO/pFhdNRqMON8N
	 MabgSTUvs5ScZ9Fn0PIHxJTymN4ns88arJrEy/tUgy6eLMd+i7CRb2ZkWtRdlcWR7aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DEB606A328
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 17:38:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26DEB606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso36481215e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 09:38:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793727533; x=1794332333;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OkwjQcrA+9UHu8UElL0k3VjIuq9juyNW3QXudrampI4=;
        b=f5mFZ0Jzsa56AYsOuEXksy0WRLN6sjNjDKng+dW70uIfoIxa2gFqVhwIvH6haT1gjf
         PIeJVFsM5Kiy6WbVi+qYaO3wDzfJMO0/EHHc8/KpetoDVYwMw9T19qqNWjfLSUOjxStJ
         3dicZKiORE1Az09HMlbsdKCjMRylvn9YcYSnAbkH+VoDLqaBBJWcAVbS5Zf+xL1L2kVH
         53x3jNkt0tPbNxhSFgwqfUnP1igtzeB+gfQvu7kbG9JG9uXmvT5iUTpp7fJ0F1iIDvwy
         A6F0dnePE5Nk0rp556GIc0E6dA+aorS33Ue2vi+aYNXLkQOvCT3FwYhEMS2B3GNr8AJf
         o8sA==
X-Forwarded-Encrypted: i=1; AKwUvBxwu3YzwLB9IbBy/FOnvZ5g3WS5IxNUrkb0ZUQXg6TMFCLRKTn2KLKglrngQaoILi3hE26g95q7T4oWvTk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FNg3MQQnp3SOrnYA2bKsoaQQjt1t3pzSQFfhp9zVGV+dcXzeS
	/kJL+NhRxgrmzrvJSUejLgYmkikpeNBr0Z+OauBGBAI/4/03OXpkTMc=
X-Gm-Gg: AYBFou2n37E9fV7rhkfqz14+CjLV/XaB4xWjluhC37LqjOa6y5f/y4/fUl+PblfdggV
	X16ssHjC312TMADt/yktsvRs93fcjzCEU95Q6orXw8T4/p64UsqFeqiJ7mUAinHdmwy3nXl65b7
	uGMEfp95I9ryAjNyaR3VRGB3mHL5BIS3GOirvMCVhLXszFytaWNnrapY0JdfZdOQ9aZTVcBi/W9
	a78LFqw74CFLFxAR4wH1fnI1CDsDtVjIf4NigjSYbgANxsbOKcqz9YePuljhMQ9IHVoK6MMdD8A
	Pt7/ItaD8cCu38FgSb+E+hXvnBcz1ZgMNl9SDUBK3L/2tIv40R0uNo8L4iZzRl9OV7Xc5pbNH+A
	4Is0dEGy24/c9QXKWBOIYR9fsrLyK75o5s6UfOiMjLgElc9mIvJs9GedHuc5EpH5fmQbTdvPhDb
	MzhVhYzTurfjtAR9BWmlSanXC90t7Coi3sxYR0I905V5gwF2o7GPwVdgRk3jQE4GXticfvL5FzT
	SVkw0ge6SRDcax1kGif6n9fOCWdZxsilFmiGaofmhYZOf3xztj76twvFvnniBtDAobwOL6m1q82
	u/SzLoddznNgLEPq2MAaSxAE7miIZCJaBg6KWNk=
X-Received: by 2002:a05:600c:1f93:b0:4a5:75d2:c104 with SMTP id 5b1f17b1804b1-4ac17ffa050mr328285605e9.22.1793727533176;
        Tue, 03 Nov 2026 09:38:53 -0800 (PST)
Received: from [127.0.1.1] (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ad414e298bsm173637775e9.2.2026.11.03.09.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 09:38:52 -0800 (PST)
Message-ID: <6aea1c2c.950cae81.3a8700.c477@mx.google.com>
Date: Tue, 03 Nov 2026 09:38:52 -0800 (PST)
From: D. Manresa <dmanresa@gmail.com>
To: sakari.ailus@linux.intel.com, hansg@kernel.org
Cc: dan.scally@ideasonboard.com, mchehab@kernel.org, brgl@kernel.org,
 toorandom@gmail.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/2] media: ipu-bridge: survive module unload and reuse
 the software nodes on rebind
In-Reply-To: <20261026082549.662885-1-dmanresa@gmail.com>
References: <20261026082549.662885-1-dmanresa@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Please drop 2/2. Bart's driver core fix [1] removes the imbalance that
2/2 compensates for, so on top of it 2/2 leaks a reference instead of
saving one. 1/2 is independent of that and still stands on its own.

For whoever picks this up later: the rebind failure 2/2 was aimed at is
still there with [1] applied. ipu_bridge_init() only unregisters its
IPU HID node on its error path, and ipu6_pci_remove() does not tear the
bridge down, so a PCI remove/rescan leaves the node registered and the
next probe fails -EEXIST. Measured on a Surface Pro 7+ on 7.3 + [1].

The machine that produced the IPU6 numbers in this thread leaves my
hands at the end of the year and I have no other IPU6, so please do
not wait on me for retests.

[1] https://lore.kernel.org/all/20261023-swnode-dev-notify-balance-v2-0-948d9=
20a79f6@oss.qualcomm.com/

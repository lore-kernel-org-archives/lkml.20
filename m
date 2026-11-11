Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794378551;
	b=3x7J7clMOTSNI3EfjE9PUuYhSkGlObftV4vNVjlIMQbHYJcIeXaRy8DCveZjsthtsvES
	 9iBDxum6GwFSwhyZsrWAeeveBNij820FE8ZhpGJaOsyux3M67/7TQbemIoVIfPlnnjbyg
	 rVys9Sl6RH5r9CtMlCUJOwEVTL9HlK6HWEGUx6kZDSsRpJgl3xoDxfjPYU03ZpPUK5tGZ
	 FXa8q4llqm9heHR7xvmhiChda9E80mgDmaBo/KNRcH5YxM0VnaD7GYeVmNk79NFOOF294
	 hHT2YT0Y4ebFWNJIGlqCxXz9Tn7w9nXOfFFbj2EK6/B/HywvmRKj06Wz61U9mvaZqcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794378551;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=/WZuXTnG3QlqmY4khWAwpBN7iLQgfE+jMyzDq4k51ro=;
	b=xUb5ZMY7PXuns8G7hJwD0dmD2+ZLcV0l66FcxqrEUbSMf/QNJ2N6ZWDWNIOejVvJBtYO
	 bzaYoc8CtoZ7IjX5OUNTQOxDKhqOJV4wEk8TQEmWz/I2Sx11nZYS6y6Ze7dRcbavFYDkM
	 QI4ay+XOLLEtfIX4nvuD9PjNbJg/yUUrb0a7VN5vJzp7IxvcQ7SagiZLUOp4ZbmLV6lJe
	 Hc5gSceVjHZfDMevHtRvC6/ySLx5TG9h4MvBMEosCJDrZX0n2uxLW5vBnhvd8MPynGltw
	 FPgvYXdxgcbV6X2+V5ABYwpC6Sv2+8eD2NpxEVE1Qh8f9W2fd7pdtJsthVBIp2iO0yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ROY8Ge3E;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D08606A320
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:29:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1D08606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ROY8Ge3E
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so5625016eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794378550; x=1794983350; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/WZuXTnG3QlqmY4khWAwpBN7iLQgfE+jMyzDq4k51ro=;
        b=ROY8Ge3EJP4qcR5iNI21mlhLWXRkGQMfj6CVisQ3eBfqGQ8/ffyDnODxIS/AXaIHYc
         jUqz0aT+wulIgdLSKmxhc4hRcOA/zW3fq7vkb1z4or6dHIeJE56sRn11CP2coc+mUXHl
         J1bbFUN2oHzJE/8h3vHxsxFjaMjFylbaziU/5tPdZHdncUr7kaOyaq8tU8FXa1LXDKtf
         cXVJqGZr7aodKoOPumjVwtB6Y4dEXBTH87zOgh/ifiUeHwf1fi45fSEsDg8A1RqV9jJ5
         7yj5u4TDTil42RVje38/riSdWWQXSGyq0vjgLn8CVRCI3/nrAm3/aEg3Dt8MOJxy4Fpg
         /SbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794378550; x=1794983350;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/WZuXTnG3QlqmY4khWAwpBN7iLQgfE+jMyzDq4k51ro=;
        b=muwrpXt6LC4QQ6CDJQ4OZ4T8KaqnId25oWbUIUtB1/I8EQRhWD2ojmYiGheDgR5FYG
         0nMZqOdoRoem43kSKFbjn33t+zKMDLf4J6DBBA/ZoIdo0EruxBqUUX8GVF3HMDJ4pZdN
         zo4VdwTEGp9hIGgIRXGCOpu9aM/l2sNAe9WSzC2zWWqNQB3V2IYgwo6pyId76gCbj+kT
         Vtf9pGK+0w6zU19RhFfSM+oBDSCRXAEeEmzrN3II3X95s7t81VSNl5PXMhGiOdrrCzWj
         ughGXOroZPTEtdyNP89DA4sBX79riXeSnPdM/xyH7EaF0Xg0v6LRSsBKVAIMvmLGEKEQ
         kAxQ==
X-Forwarded-Encrypted: i=1; AL+hErGiypEtvmJZzZtvC4/G3lqNGhNpED0NZ4NHZqx4mIEVt2QgfMX065swGNmzlVp7NOiXwuUXGE3dM+vztSI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZMmhv5zXmbfiT3C8L75L2UpdpugWpAisyITM3PXXS1wZIyWFF
	HngpTMlF7y69i1VvWY2pvx2rMzBrIPXw21IefqtqG5kpIFFVET7UmFU7
X-Gm-Gg: AYBFou1DezeJOVm4JTnsAHLX7vCs3Ckg2ZH165IJ62TWG+8ahYut7weNKMcrkvXQ793
	uXRziw8wuW5yktPUe29nHLgg8qvz2/w2lZZewzc7LnLNc791lAgZJDECK9o97+iUibCWec7Oxn6
	I9FArwuTGBo7dtTqgNjM3M7YPqdmz6SYkXDSZSVUBefVYjzHqzQXYAQTgFkKiHHkIObo2yJ8WW6
	UJ89gGofSd5OzMs/JBxfUgKeP5Dg1ZB75wNwsMPoy4ZIxBFlKy6josstx1OPOQO+Ei7HmvIXAV3
	U38GHl5wlntFnCJI7sC35mSnry1gNX6CILZLuepal2Uior5OZ2aObIpgFUQWZaOcvGqvcY5EpUi
	ovWFqwEaoiYLWS+iAG8hpKM4++vO4iIzzEt+v+YYwCF3tLJ6b3RJgTQ7kftXTQqwne5K6mq5XeL
	6LaY7HBDJNH0xi1NOS4CpC0T7IaRjfKxO8HY7CFTR1w93uWlbl6PraLNbhA51YvYkErdxwfLphN
	GsA05JCYYVRCiZdkUCiL/3+vY5YLoLXvPmnVOSgYypHqjJ0Of2l3j9c9yZyqhvAjkx7F8jXN97M
	5DUEhJV7x+Rl0Q8mBEikh78d9c67N4kDw1NmLlB9AhKpAmPsauyXQ4JyXbpmhwk=
X-Received: by 2002:a05:7301:dcd:b0:370:d7fe:6585 with SMTP id 5a478bee46e88-37685c7a46dmr1921905eec.11.1794378549751;
        Tue, 10 Nov 2026 22:29:09 -0800 (PST)
Received: from [127.0.1.1] ([183.242.161.82])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751ff2ab59sm12812621eec.6.2026.11.10.22.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:29:09 -0800 (PST)
From: Chaosheng Qu <chaosheng.qu.linux@gmail.com>
To: linux-can@vger.kernel.org
Cc: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 0/2] can: publish tty->disc_data only after register_candev()
Date: Wed, 11 Nov 2026 14:40:00 +0800
Message-ID: <1794300000.12345.987654321@gmail.com>
In-Reply-To: <c9e14a02-c360-414f-9808-8801ba18544d@enpas.org>
References: <afc724d533dc3e7d6d423a641ecb6ca5b40451f7.1792118038.git.chaosheng.qu.linux@gmail.com>
	<e02d5a1d31bb8dbc6397e3469cd0578b85d78970.1792118038.git.chaosheng.qu.linux@gmail.com>
	<179289472575.8393.17187271051946169028@gmail.com>
	<c9e14a02-c360-414f-9808-8801ba18544d@enpas.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi Max,

Thank you for the thorough review, and for taking the time to work out why the
patch felt wrong. You are right, and I am dropping this approach.

The point I missed is the first one you made: "ldisc first, then netdev" is an
implicit contract in these two drivers, and my patch interleaves it. Even if
nothing races today, the next person to touch these functions would have to
reason about SMT safety that was previously not theirs to reason about. That is
swapping one trap for another, which is exactly what I claimed to be removing.

So v3 will use your alternative instead of mine, and nothing else:

	err = register_candev(dev);
	if (err) {
+		tty->disc_data = NULL;
		free_candev(dev);
		pr_err("can't register candev\n");
		return err;
	}

Same in can327. The ordering stays as it is, so the implicit contract is
untouched, and the failure path no longer leaves tty->disc_data pointing at
memory that free_candev() has just released. The commit message will say that
plainly, and will state why no barrier or extra locking is needed: the pointer
is read exactly where it was read before, and the only write on this path
happens before the interface can be brought up.

The sashiko report on 1/2 (a lost tty_wakeup while ldisc_sem is held) also goes
away with your version, since nothing is reordered any more.

On your question: yes. I use an AI assistant when I write patches, and the
disclosure line required by Documentation/process/coding-assistants.rst will be
on v3. Your instinct about why this one looked too neat is right: the assistant
was good at exactly one thing here, finding the smallest diff that removes the
dangling pointer, and moving the assignment is a smaller diff than clearing it.
That is the move that quietly crossed the SMT boundary. Knowing when the
smaller diff is the wrong one is still my job, and I got it wrong.

v3 in a day or two, after I have re-read both drivers end to end rather than
trusting the diff.

Thanks,
Chaosheng


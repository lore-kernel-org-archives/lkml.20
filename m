Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793750351;
	b=rCRyqPTUPgVy+p4eN1uYBGSndtDPuWnPm0wAmxGkuGJFcj6jWxGafnU3qBFCEUw2KWQU
	 5BisjSD3rq/tdL8l6BwHUvo7/Q41VW6chnD+QWWDbDu9A1tZZyx794/Mv+fNLQ1WL3Vo+
	 z1eFmd8r33jVtR6ScUsEXW7Z5ZePREIa8njXe6JxUYWl/t6Szr8DwLkoGw7Nb2wDwzaYX
	 8J7SyOcofjJD1vhotOGKHejjqK0vOu6Iy4IO3Lva0hjZZ4rlk6b0Y1iL/HBQ4uA7YDT+t
	 /14GMNqbiM1vSHtmLe9c+yah7JV9doeTDqmsbUVXXSAzZVLS8yjtbEaTik8an7wFjnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793750351;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:From:To:Cc:Subject:References:In-Reply-To;
	bh=9DuBOINHsvAa3+oM/36urWwZH0M8ilFtVOkyiuzlS/o=;
	b=Ec1h6vNVvEsFSz/2Al9tJA4OI2Lzbi9sDGuhxwtg4RQ5D07UdVxpMHhw5aUDMKyiP583
	 G+88fz8zAYRBcHkpU/5XyoYi8W6e27+vKN5X9aPiWT7amDrzWOp8RHV8790seTqtoWwIQ
	 qzZrIk3EHALJt/qsX0Z0kgYQnJ0wykf9QPUcdbsOWmvP4+bh4+WhNIoXBiIt/BTi7F1XV
	 qlhy+/NZdQzRmtpeWLdbiCyDULJzlsapXO/IlLrMHOAkbVxDcJ6hdHtSH648EfOLek7JJ
	 anzVVYZdOoiMOss0o+BPmIDfLX0oRETQ4kYlBuatYN+BHseEXMRJQ9KUy31MdTrw23A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paul-moore.com;
	spf=pass smtp.mailfrom=paul-moore.com;
	arc=none smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E344D606A338
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 23:59:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E344D606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-93e63ee7b4cso16731185a.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 15:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1793750350; x=1794355150; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9DuBOINHsvAa3+oM/36urWwZH0M8ilFtVOkyiuzlS/o=;
        b=GWG7UwpN2KPZH27oO5d/4HC7WWkiFgi3ICdUtpzqJbrVN0U4tmJxh8GcZuwUKzrDDM
         +Mum8kxq6dypiIEfZZKbvMK/qa/cGldqYRq5p6TmaKamcYG86RjMQ0XfsywiUnYRnsDo
         wXezLtC4esgw1qf8wWkJLA6wh/fpA0vsGNpoEyxCCo8DNvIMQx/B1LiD1YCH2p8RoeK2
         WFmGby7MVTHCfB5x+IzcticE+vF9zDblJcNQ9ophdFQAcsIk4e849Mx2VFumAy7ERqNE
         llOva0i6xLDM4PAWpIa5mXLy6gP8hiZ3nUjf5OOjr8TNfY3zfKtU8+poJqLIsqdvDT+v
         C04Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793750350; x=1794355150;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9DuBOINHsvAa3+oM/36urWwZH0M8ilFtVOkyiuzlS/o=;
        b=bWewcHn+RwL3+yeW2kUvmXdbForOtsQz9ZKOBetnTDU0a4eUdBaNXIO9OfOsHrmea1
         uKfsNMNPP2VaTDGvdf6crAC/RemAzWd/nnfDofvpNveJKN31Y6w5D1bNm+7JOG0R6wAp
         F31/793m7VnyfYXBUy/CfTkHPN/Hc6BNcElWT7g1HlWx56jpUZNSV9EtCVOzjC6gzqGG
         EDJho406O9ZgmWNKQcoolc54qhzFVX/HMvWqaVxHBABecKALz209mv88qaqwuxi3B34c
         07/1VwGGdkZrI47w7V0yWIHRQSQkH711iu8oh8lQn+98mD9MVSmZ1b/7USe/H6vO51Zd
         iSJg==
X-Forwarded-Encrypted: i=1; AKwUvBzW1rLQiBactsosWHCeR5MqWZ5Eidf1YQjXDjb+PByn2oFuc7svkwSRZ7HTlT8BtfF2KRnOQOJzFvbd1tY=@vger.kernel.org
X-Gm-Message-State: APuU4Z83LzXAdFGFzGaFaM4Z3lKZr4cjK5zM6pjS7rFgkHKlUVyyyv/9
	eLOZpbZvCkXpGMC4u/UHyNVXkj8avq9CL436vT86UWotIGYabOo7Kqc3O1vHb1m0Cw==
X-Gm-Gg: AYBFou3olvTJO8TH1zv0x5yc6aaM3hnCwjUl7GYrr/f2wYeG/KwQ1T+cVrIKYbMfBWS
	Vc41UAFZphe3M/gjTn37iD0p5q5+hSBitTfhu/xszVkubcYah1zPJIVvLqXOBTS+4oNlWTO4+xr
	q63NeWAsfYoqdIJmzOSfpTs4stkuLa7vpSvfPgASdvrSAIvhRIxrKUp1FWpr7kJX/l1sSlqWTWx
	Totuoq2iJeG3oI2n41niIAsKTDDob3LUouFr+uIC/nuUv6JGvYrJo+rWUwhoVd/weBBZOTd2OjK
	1kzQH2aVtJ287GsB1+xQ5ayJ8ALpkV7oIzbYktbSaAXAGKIBaEfHc9qMhqQloxDTBW6C5gwOfnB
	fp6VQg3Y5Fh2nE0FbrJc+ifMNwuYD7HsFBX267Po914pCNOyXqPThqAUlMYtw25dhR1mouaWu9s
	ix8S9t35aDdhbwrsF+u6+teKSbrfxwWWdStHPxbEuTOzb7d9GYToeHTg94xClgiF17aRf86AIok
	ql8IgEOlGGN5q+NgtC2IbBj6ssXDu5pxAmalWTzYeWVdxckIkmLafQc/L+W7YFBx+zygzlUHue+
	g0SqIbAPdYLUO4UfPssyZ4XpAK4DUA0u1W/bK+bBFoe++VOQRH8mdY2qPpbFJv7HoiIpi/5pW0u
	HRNPEEkaWlX4md6/SXQCKMb+PS6+yUw==
X-Received: by 2002:a05:620a:319e:b0:93e:c12c:f12f with SMTP id af79cd13be357-944217fe8ebmr2401561585a.74.1793750349668;
        Tue, 03 Nov 2026 15:59:09 -0800 (PST)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d48316f4sm57268885a.25.2026.11.03.15.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 15:59:08 -0800 (PST)
Date: Tue, 03 Nov 2026 18:59:07 -0500
Message-ID: <e43dbe68bfabfbaa2984ea5d923c6149@paul-moore.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20261103_1853/pstg-lib:20261103_1851/pstg-pwork:20261103_1853
From: Paul Moore <paul@paul-moore.com>
To: Babanpreet Singh <bbnpreetsingh@gmail.com>, Eric Paris <eparis@redhat.com>
Cc: audit@vger.kernel.org, linux-kernel@vger.kernel.org, Babanpreet Singh <bbnpreetsingh@gmail.com>, syzbot+39b8fea0641107a1ccee@syzkaller.appspotmail.com
Subject: Re: [PATCH v2] audit: annotate the lockless read of the audit control  lock owner
References: <20261008034403.7-1-bbnpreetsingh@gmail.com>
In-Reply-To: <20261008034403.7-1-bbnpreetsingh@gmail.com>

On Oct  7, 2026 Babanpreet Singh <bbnpreetsingh@gmail.com> wrote:
> 
> audit_ctl_owner_current() reads the lock owner without taking the lock
> and KCSAN complains about it. Only the current task can store itself as
> owner, so the check can't give a wrong answer. Mark the accesses with
> READ_ONCE() and WRITE_ONCE().
> 
> Reported-by: syzbot+39b8fea0641107a1ccee@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=39b8fea0641107a1ccee
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
> Reviewed-by: Bradley Morgan <brads@mainlining.org>
> Tested-by: Bradley Morgan <brads@mainlining.org> # Power10
> ---
> v2: drop the comment in audit_ctl_owner_current(). The KCSAN build of
> audit.o disassembles the same as v1.
> v1: https://lore.kernel.org/all/20261002011712.7-1-bbnpreetsingh@gmail.com/
> Compile tested only (gcc W=1 and the KCSAN instrumentation diff); I
> could not reproduce the race in QEMU.
> 
>  kernel/audit.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Merged into audit/dev, thanks!

--
paul-moore.com

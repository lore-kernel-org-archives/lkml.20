Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793841770;
	b=TDDsF8rVwbZVeS4DEthgr4Nw4cz/lis0LrYTob7ijz1xO1mzdikXhoWoAGIBXJdZzim6
	 B6fJuHEfZuPMvo5vtD83p+WlKLESUHxZ5jZtpDxrS1HscvFwuP4hAhg7JDthC9qF5R5j0
	 XQv0dTi3C/tB7k1gm1TLI3rx21U5MH/h4tHPh4mdiLEAmtLMFHtfWt/ov1Pc6Cc6MDtSf
	 CFmpSbdCAM3qezHGWbLIYVV4D3FKElcdGX2YHiqCgNXny2hSennSJV50silCC5bP7hKub
	 S0AJssbLDu1RBMzBZOSCI0IG+osUlr6egOdNBvsx5R8bKxM2qrWtSWJIaSLrwT6K9qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793841770;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PW259vEwVt6aepdEMnV/kf0Mt4lpxnzMAqh8bDDexfs=;
	b=tV1Ptb0CnM0YV5VzxFQ0g++U/ctNJrs2ruDD0gFnAum//MD63YnwBsXyqDIG7vbPKs2Y
	 hrjPpmUQnqO9aaouKdXOzuRLrpUA3m0TwYANDB2zsJfMro491fMISlBVSCEq2zxTMuoC8
	 e+KBVFlnTe96hQnBR8Tlm3fHsdn2ECF70hQ/KapsezsxQwT8EDngAPSmAe2JgNYbS/PP3
	 yKx6NARpUD+R1OeOoFcHjfOY0TZhsXDSUjoVHBoz26qa4PPOV+l8MyO09h7zCM4NO4I0x
	 gzHTHxejI08m0cITGWMJmoclcdBYWQqB0q0Ae268dXKoCBLTJQ9OOeu9bsAGSPFO18g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wXXqLWq5;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562DD606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 01:22:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 562DD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wXXqLWq5
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-15dd124bbe7so291935c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 17:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793841769; x=1794446569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PW259vEwVt6aepdEMnV/kf0Mt4lpxnzMAqh8bDDexfs=;
        b=wXXqLWq51EnKuCV8eczEg3m42Y8tLQoCeEt86ccSCmBF8iNWxTJiWbe/B5I9DX0Dam
         22BJ8WBPO1YrCZ6oc3u7dsit8THwZqmLvi3BWEly3Nq5gnMiXRcMrOJvIVOmf9Jbz+zt
         grivGH0X685Zjrt9HwEfUbejqxqsSN+I909TqS8Wbhi2BX0lWnGKjYBV7mjpAYDuILTn
         tbVRrbpIkAkYONNJuN5e6yaj/rmSDzAmSwjeGZN4EFKBOQpwbilT2eiS4KFAy+gWAwCt
         2JIG9VZ+5tD0O1GsVvVZyg9cSjLOdqQVqo+QvkBrF2PaR6ttnUZMv+Uv//WQovl1oqk/
         lvFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793841769; x=1794446569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PW259vEwVt6aepdEMnV/kf0Mt4lpxnzMAqh8bDDexfs=;
        b=2JmJtUJHWlS7KZXLddIl7EA7S9mmQVzS/9bWEGlCE2F8muC0EbEC6R80g+LEZ0tTof
         J1bg6P9bGbCNxB4DPDouMAaaDIArCIT9w19vjepropO8/hdvP3V6A1ZLtRkwmCURH2zt
         NV6EvW+l1v+bjiGeuNivjm6JuQ4uxPlrVADayOqCtMHprIltg1Yq8qCaznMhBclwPFYD
         V1onaMnagOkKYqvkOK+HxtdgBVAeVTtQDzyDqY1gw1y8wgDLenUAn9gv8x8uAF21icmV
         eoFxjM+Ehx62SRI3DB0tov0txTL+IKTLr4n9WBd0OjI20iJs4t4wnZMLv2zZRLwC0L6r
         XbOw==
X-Forwarded-Encrypted: i=1; AKwUvBzHDoKIA0LcHt24Xo3mM36kBVES2yo17vlKZe1Pan223ADPjK4xKxW70R5pzAb0q1jZnu/LUL42ACBEsjE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YE7RpwfXFi/w0Rtqba3ardbydBWgtjvXytBged1TxxZY87Gpw
	ZF1bJUymQffJZMjhHTNOL1HifbAjnk/nS7AZHOCLaij8Bvozk9vxu0Kl
X-Gm-Gg: AYBFou1OSSz3h4wZj19YyExSKH59pD4nvACXeUIHgz6O12doosFv9l3WXAk3AlPXBgT
	Fu+7oLIbra7qR95IPSrKXhq98mhePks7yTS2/FQ1GbEw5sOi04c+n/kHi4PEGZCXM4K+pTbG+ok
	fjbM11Atxdz0EmTRzzmeRPaptSocuG3EIldagWH6tp3b0IOInXpNg2ZUnWYkJ4PgGrMNQCaFV64
	G60g1N1+yEHIsnVBCpJiZi19R93FJed/ACLNkS5ZwDAlKlBFJ/qSeJTINDxMte8PhHKD9TwN/8o
	d/Z6fz8jRlahpdqsw+wVZrlFBHmZQB3zgliOuIS/7iqZ6D0ClVXOnoIA8ym/KHYL4zrxM9qTUj3
	B7rxMj4njnhYkSH3brG4C5KpBI0n6a4oCw+UegjtcG1eZszgjDeBJANMLlUiiV+owXBa9nckcqB
	pxLf1lUWN4xlhXdkh2pcxgqhruOdmw5TbsBke/8gEhSnS8bdJb7CB/NP9Anhm1F1OEwxQow09X5
	yOWQuOn8xi4epW2Mk/muemwaphQT/PyO/8Y+0Rd3MAG+YEiIShDhBDr502huKto5ZvJVnqm8OdW
	sXAntg3wHy3j9xcyOadf
X-Received: by 2002:a05:7022:281:20b0:1ac:91b6:8dfd with SMTP id a92af1059eb24-1ade9e3e335mr25492252c88.31.1793841769331;
        Wed, 04 Nov 2026 17:22:49 -0800 (PST)
Received: from ubuntu.. ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1bcedsm11526499c88.7.2026.11.04.17.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 17:22:48 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Josh Triplett <josh@joshtriplett.org>,
	=?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	rcu@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] srcu: Add list_splice_init_srcu()
Date: Wed,  4 Nov 2026 20:22:42 -0500
Message-ID: <20261105012242.623962-1-odys.yuan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <9f8c94ff-29e3-4ea5-b9ec-b04b2bc21b1c@paulmck-laptop>
References: <20261104-bug-nvme-remove-ns-srcu-v2-0-feb64ecb96ca@gmail.com> <20261104-bug-nvme-remove-ns-srcu-v2-1-feb64ecb96ca@gmail.com> <9f8c94ff-29e3-4ea5-b9ec-b04b2bc21b1c@paulmck-laptop>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Nov 04, 2026 at 09:14:12AM -0800, Paul E. McKenney wrote:
> I am not inalterably opposed to adding a list_splice_init_srcu(),
> especially if quite a few more users show up, but here is what I was
> expecting people to do:
>
> 	static void synchronize_my_srcu(void)
> 	{
> 		synchronize_srcu(&my_srcu);
> 	}
>
> 	...
>
> 	list_splice_init_rcu(l, h, synchronize_my_srcu);
>
> We need at least six uses of the above idiom to break even on the line
> of code required for introducing a list_splice_init_srcu().

That works for a global srcu_struct, but nvme has one per controller,
next to the list it protects:

	struct nvme_ctrl {
		...
		struct list_head namespaces;
		struct mutex namespaces_lock;
		struct srcu_struct srcu;
		...
	};

nvme_init_ctrl() calls init_srcu_struct(&ctrl->srcu) for every
controller, and readers walk the list under that controller's srcu,
e.g. nvme_wait_freeze():

	srcu_idx = srcu_read_lock(&ctrl->srcu);
	list_for_each_entry_srcu(ns, &ctrl->namespaces, list,
				 srcu_read_lock_held(&ctrl->srcu))
		blk_mq_freeze_queue_wait(ns->queue);
	srcu_read_unlock(&ctrl->srcu, srcu_idx);

nvme_remove_namespaces() thus has to wait on the srcu of the controller
being deleted, which a sync function that takes no argument can't get
at.

So the choice here is between list_splice_init_srcu(), as Christoph
suggested on v1, and open-coding the splice in nvme_remove_namespaces()
as v1 did. Which would you prefer?

Thanks,
Qiliang

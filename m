Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EF937E5D4
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 07:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787988881; cv=none; b=g1IaVzSDOudEhqe7rWLWCiv08TshnZ84eXGoH8yEMqWRSQR4AZycqchraizY5mbF5SVbE+gPQZz8rROovpmO40gj84YdkxsH2gStKfZrpAlVRABYeNsQN94NlaxKdve8EY7Rj99E/2y3tLej4MtK/nLnQMf7rpeAunGXbSETzas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787988881; c=relaxed/simple;
	bh=Q9A4HLLOLJ4VZXp2cZoje9vbqTGlzIJq57FlolcxsN4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LkWueEjN4o2EDJNmgrRsQDunAkDIiSWWsA/AGbJQLaf838Ea0A4loQnbXho9QGoi2au8OfjZlBOBG0DWSM9hhqoE3rxekbZ+Wz6shCvZOS8zmug2BjyY3vrXOR9SbJb6rENDoNc1LiqLSJYGORLkrkZ0JDSR8DmC/l00VIdo8ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NdSe0/bJ; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NdSe0/bJ"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d71a50caa9so22026625ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 00:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787988878; x=1788593678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4s3+xh6Th5r06sJ9n1pY67GE12kX/ek/r1hd+DmHod0=;
        b=NdSe0/bJ/l6qQxnYTCnoHNeijgFnGd0WhYquBENMPWDZ+lH6EN20MIZOPwHsaGj6H/
         nTRXGYKsh2Q4nAZaJHQOO6HSSe6tq3EJU/l+I1JXMoRjfd3g6hySrpVQjuRdlPA/uQgd
         oQh+tCGnQ6KJYOW8kcmOYDt53BaD8OoUZvkPWMG5J4yMwt8QGe4zvz7xx/2Uqabqqb6A
         vwPDmWXWSW4NqbLa1EJENuw7H4/LJTM8wA8ZGU5eIGr3+G41xvREVbHb0Yqqt8VE4fQo
         6Kb6XFrTplAjFWKAyAlAjPiRgvzbkxfFQAajeVW59PH2xn66W2QsS/YYf7ixqTd2VvL8
         e8lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787988878; x=1788593678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4s3+xh6Th5r06sJ9n1pY67GE12kX/ek/r1hd+DmHod0=;
        b=cMAesmXaybjGNCAKiyxUhmdhzva3pe52ho/pbUvIqtvYCW+GTPA5DeYn4Ts2HEZ46I
         2MI4XKUxw8cu/lohuhBEW81ujejLXF+qm14nfdeDeXHbOX0zMbGY7JMqjwiXVt6f3rtQ
         fXyKKn2XbhSayZRN3Y8afH53wbz+r33HusZC6zwjT+B9g8w0YLbH+IbtAe1dnvk6hCOs
         2GFkonny6FPSwVtQ0WltJjGqor/1Udt+Bx0Z2rEEk6bmNl1FV8w8tCoMoLuLpYCSzDtL
         SseEpfwulTkPanU0jpepuFQH24z7tR+mN9sfgYyiPPyMZCv/ZCWKSsfJ0xH1grStspc7
         5E+g==
X-Forwarded-Encrypted: i=1; AKwUvByaTVzDooT4VrdqRtqDTvK+dr5n9jmFoMQGMJpF4rm1U+STVShjziSGeiXpQu07eCBrUapEQkHcKwtPZ30=@vger.kernel.org
X-Gm-Message-State: AFuF++njx7tpmcKySGS8+Eb+w41VYaVVMuu/GHbWJtdkP37l/mqhqffn
	8XhjrScwnLi78V75RnAU7Xb5Xgd3m+JMYcXcHZw/KhZJ2K+uoUaOR+e2
X-Gm-Gg: AR+sD12CCAT1nLKC2SuLZFw0x+Cf4D7l+sWb9fUFXmtF8InViwrCqfqsdxKkFkyMmTz
	Q0ihaWpgsfEGp/bvRQ3qONFKLkxYD+mAP34PWJD+lWewemS7Bpfypnvp/9lumTbAxOHPcm11c7P
	8jrFLjUGN5mpAuseSCztK0kZsoJfAtDm/Q7k2T3iCRoVcI2i8tEdhF0PptVvMffHHeElk2xwH4d
	ErdbkD2Lvi+C2qzXgjfikfv/S6vw+rn8SrIzmP2+0Qy7YOrnjv+FMzW8ii1CsTLb4OkBx8C7qCK
	iPI2zpdCe5YV9hwjvsH84EAojkqf0Zwb0X94e/dJwbIJ6O3nxrfOn/4Brr7ddhYyhmWU25l0PVm
	uQXdOmzetLXtU91YFLZAytMhr1gLnhzgUVZGr8UXQb+3J967TqPTUl8qx2+C/bX1mbeKSM101fS
	sPw8aA7XNA8ELuIi9HfBtffNW5PYJ/NSN3RMm+wyLj9TRpSuYJLdL/4up74is1OzVZDBMqLKknD
	YNf+Lxu9pL5YI7eYHyptKJS30KXiD2+MDwh5gWppRlFkBv/SFpafpBYdtOnQSFWKzka9PRt+tn0
	cgEBMy8e5/JVOvX9zdBNYHnB2w==
X-Received: by 2002:a17:902:f54e:b0:2ca:61bc:317c with SMTP id d9443c01a7336-2d74def63d7mr207522675ad.13.1787988878335;
        Sat, 29 Aug 2026 00:34:38 -0700 (PDT)
Received: from LAPTOP-UUUVNN1I.localdomain (bb119-74-6-224.singnet.com.sg. [119.74.6.224])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-328713b944bsm12510169eec.27.2026.08.29.00.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 00:34:37 -0700 (PDT)
From: Wei Jie LAW <98lawweijie@gmail.com>
To: 98lawweijie@gmail.com,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: aduggan@synaptics.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v5] HID: rmi: fix OOB access with undersized RMI reports
Date: Sat, 29 Aug 2026 15:34:26 +0800
Message-ID: <20260829073426.16390-1-98lawweijie@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825103117.12180-1-98lawweijie@gmail.com>
References: <20260825103117.12180-1-98lawweijie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Impact information for this patch, in case it is useful for prioritising
it. No change to the patch is required.

I have a working local privilege escalation on this bug. An
attacker-controlled USB device plus an unprivileged process on the target
gives root. Both halves are needed -- it is not remote, and not
device-only.

The disclosure half needs is via USB-only. The initial commit 
already explains the vulnerable path.

Reproduced to a root shell on three kernels. All with KASLR, 
SLAB_FREELIST_RANDOM, SLAB_FREELIST_HARDENED, 
INIT_ON_ALLOC_DEFAULT_ON and HARDENED_USERCOPY
on, and no debug options or debug allocator:

  6.12.69+                  own config     RKC=n    root
  v6.12.105                 own config     RKC=n    root
  v6.12.105                 Ubuntu config  RKC=n    root
  Ubuntu 7.0.0-28-generic   stock          RKC=y    disclosure only

RKC is CONFIG_RANDOM_KMALLOC_CACHES, =y on current Ubuntu, n upstream.
The last two rows are a controlled pair: Ubuntu's own config, rebuilt on
v6.12.105 with that one option off and nothing else changed. With it off
the victim object is adjacent on the first plug and the chain completes;
with it on the device saw no usable neighbour in eight plugs. So on
Ubuntu that option is what stops the write. It does not stop the
disclosure -- KASLR still falls there.

Unsure if CONFIG_RANDOM_KMALLOC_CACHES=y will stop the write every
time or only most of the time as per-boot seed is fixed, and I have
only tested a single boot.

The bug still exists in LTS 6.12.y, as well as mainline. The
code dates to 9fb6bf02e3ad, so this reaches every supported tree.

I have not published the PoC and will not before this is merged. 
If it will be useful for review, do let me know and I will send it
privately to any of you who requests.

Thanks,
Wei Jie Law

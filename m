Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794920437;
	b=36coWDmwm+da+OBWabzal/bx5RhEREaU80IlshDOGiFGK+HCDFr6R2bSI4ry8CSlBMPv
	 pu/mCZ5IhxvrZ/H02jlqUBfb9vplZE2AlCUpMdsVLzAI3S0GeU06EdTHqHHw1t9y9PKM4
	 ZLgF7zWp4ZQXBu/6lkY/2i/R3OtmUpvNfsMqeLPJcxvh/4ji1aWMfdWaJ8+3pEHcxp6XV
	 gFF96nvquAgzO1gcSqyMBjH8hU4ioRjeodq1R1/TcFkkLEHHmpyJzf+QzD8RTuMhzeDv/
	 jz0c6WFRWofOyyKCh+Db9ESA7/wNHh8fDPhazbNk4HniZhfAKRRSqwhINNKuHYHK0Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920437;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1pou6eazVIXgzMzSicK2lENYxL4K+6GggzXTgkNl+FE=;
	b=LgembUllghNIXON6KRt2I3A8amOPWaF1qhxLO+8n8AXan08jqh4Dl6uvs3QWcMxXuImx
	 tSbO93rQY6Y0jKcDNZkF1jSRGH/3MbkTqGBnNWrwLInkh74TfpP1mmZbaSircszKRMVS8
	 +Ct7mr5tXJZAYVHEwCZAwjuHIa4pzyvtRSPNoCDoap0BvZbvT9koese5kMbAU1BpkGQq1
	 hll/j3OWs0oL8vKSOEKz52bHTbozymmQhFo5LjhNpMztd6OKbXPbMpLW9QasBLiRDTFTX
	 v/VxgX+IeizMsa14f42Z71q5VBtaeD41PMzLGYIbCPmbZm2/OTi5eXD51MLxd78dmpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E7PpaS6F;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B9C606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:00:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43B9C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E7PpaS6F
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so19469605e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794920435; x=1795525235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1pou6eazVIXgzMzSicK2lENYxL4K+6GggzXTgkNl+FE=;
        b=E7PpaS6FhetZjyMeTxICsrWjeqCx1d4FC0wXkU/i59upZv1WqNgukn4us5FQBQvPiM
         nuHNDjLjE8/O3fAYnqO3abBUSVD9zXGHaj08wJ/hEVyfaW94c/Gwy79fMxbBOlHlWmXr
         ofu7DUHp/rdDfZGy3yzsKjoondVyQvqXK4J1ho149XdGcPAVEXFWtgatvCT+t0CnYkUp
         CmxKMch0nZppHkRuLt6PWAS4aOned3F3V14N+p+kDwd6sCQZxu1gDN1rjrLdw5Bk0gN8
         Nk0yxweQ8A3aR0ls0KHfqzRqv/8Q1yKkI26Xe9Rcr/EdIkZGMQfITF7mHU0Rm7EXDjWq
         J9Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794920435; x=1795525235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1pou6eazVIXgzMzSicK2lENYxL4K+6GggzXTgkNl+FE=;
        b=0zxZHoYAgN4asdG2oxA1Apt18bmQyVLYgOTx1AbkNHrt387OemS7FFZOhFabW866G8
         vcW6fEuN3PDkIRJVBfhpqezz6gl/UXW07XjRqUkyWU0BUu+PB1SuiwrC7BTFsnfAdzE5
         YLBsbAO4X7GkzPu2bUDTMUyEQwmtVfv9I/BZy+PqD9FFUfBe9F6wwZUwFshMgl6jblzC
         rsnpOumguuN54aPkAWsbzzy4PkfXovmAVpdzxPS/M4HjdmKsW1PDKijshbQHU311cdNy
         mqieMhaJFMFkN2n1CwwiADWh+85y64/PFEy30EEJZFVO/UL21u5TraMVLPo+ByDMMRIf
         kxsA==
X-Forwarded-Encrypted: i=1; AL+hErEr/fDKs+M0yybpL1NbEaFcsXpuxMvCS9Ovx6jQgh13inFUCXF63hNdGO8jiHvE37zRjChBI6JZ0fZ++6E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9B1dKHWjv3Bd2FOP9y6o09GBNhrznY8lS0wisPp3XZEFxSX9P9
	Q5ppGrtmZ7K2YllRQRfWYyuO/0q4V5856Bvs1JvQKr5RqySmFxH8CGHb
X-Gm-Gg: AYBFou22hvL+LIjaBfF7ksbUwCvYAVQ+QPGgLUqKWrcvl5YUjlAWwKaiE3ZsCb9BG3w
	zpi72Q7ayEdVfPWWGssh0/z0dS8RZTRNQji0dccD5F8P7V0L86Ie381WtjJAHu1Z5xYgvPHKuqp
	BQdK4WW1MjjiptpHSOVJvpM2cZlrqk/XxpyBGxiUyPLrP9DwF0ClNu2Xghc0Y4w+KZagbMhqFvY
	jfcsAYYytmA9ceMSdP+w2YM2GY/79GgxxBvF33Gw7Kc8PRfeZf0rJhHUwz7NRBhS/9YehLhjHTj
	Qns+bpqwzBauZ5ybxXEekPdfyZNuiUt763c0i/2q1nPaIySt5E0KXkj3Bh4pn/eIYWSl7u3Tr/A
	7iOqb4Pf3It++PzN1REMa93TAfmm5uThiC/lQojJV5OirSXSQOfBtbz9SxDxSVjMnII0UC0LH7O
	KqRv5lY7dmcR2EnhxnbEdONkfaHW6ZolZJgbOSLzpc61qoWFle1YpSWAIm6C74JuAlHbrcJv8of
	HEwi4cwwnVR9Sw2B42GRspdlUeiQ92yo8FfMZQF8mLd40e7k4pynft7y0y60kk5XJMNnv0VpE6z
	OGnpcyn5Cq1lOH7NhatTs1QEKA==
X-Received: by 2002:a05:600c:3e06:b0:4bb:6947:3e1d with SMTP id 5b1f17b1804b1-4bb6947426bmr171284605e9.20.1794920435270;
        Tue, 17 Nov 2026 05:00:35 -0800 (PST)
Received: from victus-lab ([193.205.81.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7ad9430asm35683315e9.15.2026.11.17.05.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:00:34 -0800 (PST)
From: Yuri Andriaccio <yurand2000@gmail.com>
To: juri.lelli@redhat.com
Cc: bsegall@google.com,
	cgroups@vger.kernel.org,
	dietmar.eggemann@arm.com,
	hannes@cmpxchg.org,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	luca.abeni@santannapisa.it,
	mgorman@suse.de,
	mingo@redhat.com,
	mkoutny@suse.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	tj@kernel.org,
	vincent.guittot@linaro.org,
	vschneid@redhat.com,
	yuri.andriaccio@santannapisa.it
Subject: Re: [RFC PATCH v7 00/29] Hierarchical Constant Bandwidth Server
Date: Tue, 17 Nov 2026 14:00:33 +0100
Message-ID: <20261117130033.19195-1-yurand2000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <avsSdeZFb7CXnMro@jlelli-thinkpadt14gen4.remote.csb>
References: <avsSdeZFb7CXnMro@jlelli-thinkpadt14gen4.remote.csb>
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

Hi Juri,

Thanks for your reply. Sure, Sashiko raised a lot of stuff to look at, so it
makes more sense to look at the patch once (hopefully) these issues have been
fixed.

We would like to also address the interface issues which Tejun pointed out, so
if everyone agrees with out latest interface proposal, we will fix Sashiko's
issues and implement the final interface as intended for the next RFC v8.

As a side note, some of the raised issues are strictly related on how the
`cpuset` + `cpu` integration is implemented, so we'd like to have feedback on
the interface before fixing them.

Thanks and have a nice day,
Yuri

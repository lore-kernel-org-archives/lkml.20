Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=128.30.2.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793106242;
	b=G+Pe+g8kntFCKHlOjvIpvYIrH4AUaYUMU9rQW5xwPvt/P3WNxPWpNdnBqVyqwaPl8jgJ
	 kdBiOYCEJA/NO3JjkRDxeHSYZNzHMgWEMOe6bYt1ID2OBB9Bbiyp8oPd01JiCxBT03QMx
	 OM4HXgXXwOB20Yv7YA/MUTHTRlysde4f5Ma0z/nobl/3az1rcjxnaUHl3cIeNwWzJ7Tg4
	 uqszhp79usCF+GHlRBfYsNLlLFNo2gJUtyTmaFyBaoG0Wq5vCXi9U8hzI7dR4CjiO50l2
	 N3IL5sNR5aPr22I2XR5il2SBhVepAWXtJ6RaHuu2p7r7mC2BcHs87i8a5HqOZUphvkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793106242;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FMz8RaablssnkaAiL4pJE/9wSU7Jo/15ZzYihMTah+w=;
	b=aOlynbBavBhq+ZdEkfvhjtlth9wGz4Xl9t5HqnP0A9Gqb5mm8ufYVcBJIJhWfwCI5Kzy
	 pkf4759ovfxHNMdE7rEMLFRUdjhK41Qn2dPjkL5VfPwS7cXXk4d/sIE3TelQvI0ShYSYV
	 XN/lnMkdHoxvxhoQubwzqEt+Z1kbTip56DJGz7M942hLKE3HK4L12UjyxxP+JQa2cEEGf
	 svjafMFZltNVJ5+f8JnInBDSESVX/b5lpW7eU+r4cwOu0Fx8TtBM9rG7F2Pi7r/YSl9Kf
	 18KxIjG0UJ24dn3tA1F3JYqrpWJh4iw7cmlNM1kIFhXopbzbAnRkXpH0Wh5PCeymXJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=csail.mit.edu;
	spf=pass smtp.mailfrom=csail.mit.edu;
	dkim=pass header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.a=rsa-sha256 header.s=test20231205 header.b=lJU48JOL;
	arc=none smtp.remote-ip=128.30.2.78
Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B706606A324
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:04:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B706606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.a=rsa-sha256 header.s=test20231205 header.b=lJU48JOL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=outgoing.csail.mit.edu; s=test20231205; h=Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=FMz8RaablssnkaAiL4pJE/9wSU7Jo/15ZzYihMTah+w=; t=1793106240; x=1793970240; 
	b=lJU48JOLfu+RkNkruGJQyvIE+ytc+mY/H8XNJH9O1/majuGJkRbLx/2S4aoErDHyxI0zmbSBcNI
	MGMmWrFwvnyh5Vm0PzTlE2Qg6eTxixeD6ok2Yr4HzpLxbCO8XAecG0yWL2Fjcx/jw2Vqc3fTU9Ocm
	hQ4Y83xmNNOb52tThzmCzSQJH7nKFIBlX6449sorQk5W/tdYW4g5bWX2b9rktrvF6+5zw7cT2q8Bl
	qhgYrg3uxi9Fj/EmltxvfV1ihsxDM8EASgjfs8c5U6h/1Nnx5s+37BJ9Bxptr3ytAdpxYR0Fj58M7
	vJf4/dgURy6iBB2KqxQDAeKZIfDNBCbWZvhQ==;
Received: from mail-dl1-f42.google.com ([74.125.82.42])
	by outgoing2021.csail.mit.edu with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xLgqN-00BKP2-7h
	for linux-kernel@vger.kernel.org;
	Tue, 27 Oct 2026 09:03:59 -0400
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-18cdcfc05ffso5050353c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:03:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwqtKr8/orGnQv9Dj0Po1Fzu0V3xAldAjtwBUnCW1oTIVHD0zHP//puJ8P1OoNzIRjuXaJHFv8jbJrmCmI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIqwWIg0ok+f5FsvswXG33U3D2ZboFQdUVj7NeGh/IGtWcLwbnT
	uGQ7r4mPW7fF7hugb8Ypd0EVDGy8kHIzSnaNBh64yyqSRRHMXnRtrKtnWI3dLpNbYl2GDFUQAkK
	OoVgTsPpkypFDhWV1lwXTsbviONHJekU=
X-Received: by 2002:a05:7022:1407:b0:1a2:1a28:9348 with SMTP id
 a92af1059eb24-1a21a289389mr5533672c88.37.1793106238250; Tue, 27 Oct 2026
 06:03:58 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025124657.836229-1-nickolai@csail.mit.edu> <auBtGChHjceaFJ6E@jlelli-thinkpadt14gen4.remote.csb>
In-Reply-To: <auBtGChHjceaFJ6E@jlelli-thinkpadt14gen4.remote.csb>
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
Date: Tue, 27 Oct 2026 09:03:45 -0400
X-Gmail-Original-Message-ID: <CADGQE7F9fqReoMRzZoT-KyftPmTpk-ez3moGVb0vfm3doSoOFg@mail.gmail.com>
X-Gm-Features: AclHuK-yY1uKuDcujW5r3dTswGD4w9n3PH6dTdqljm6t0Ut53Z72oPU9UFlAkgQ
Message-ID: <CADGQE7F9fqReoMRzZoT-KyftPmTpk-ez3moGVb0vfm3doSoOFg@mail.gmail.com>
Subject: Re: [PATCH v1] sched/deadline: Fix this_bw on class change of a dying task
To: Juri Lelli <juri.lelli@redhat.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Luca Abeni <luca.abeni@santannapisa.it>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 5:21=E2=80=AFAM Juri Lelli <juri.lelli@redhat.com> =
wrote:
> I adapted the following to the set of other tests I maintain. You can
> find my attempt here [1]. If you want to create a MR please go ahead,
> otherwise I will merge mine (if you are OK with it :).
>
> 1 - https://github.com/jlelli/sched-deadline-tests/commit/ccea314c39957a9=
35113f6a8c058690a3a48133b

Sounds like a fine plan to me; thank you for picking this up!

Nickolai.

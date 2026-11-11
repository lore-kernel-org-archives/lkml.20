Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.75
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794396569;
	b=Mlc56Y0ISmIpSngDmO6As4yfwBCGw7Izck/Ljmn+9MU/CQlBjrLIGgvDSjG4D9OKpyW2
	 zdt8dzypaZRQoBU6ELNRjI3zxrsE3AEPycsY3mFDHfoiZzrSDEaJCkYsC0A2exyqX3Iam
	 sVZKn5aEqyGL2cwRozoLQuaYIugc6RlnGEjnSpkVlu6QgblxgXXAq6JHcM2ubFV9SE3JL
	 YKQ0xsTBXRRj+PplQRt22ZOt7wT4jcFizAiAM7UqLAOBA3agQWTdFcnZMjuoq7Ti2utV+
	 wjaB/ZF6te+XomwZ+NHX93HMGZNsPkY2qxI23+mSyPc/0hetvnfi2gsLktgohU7PEEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794396569;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zTtDGLue5JqVxGOZgA8LDHzbFgoJeRKQNOdcqpXnAX4=;
	b=Qt8amy1oa9lX1IUyNKQaD1ad1kqcubStobfpYZ79QozaYZyhWEktPrs2Ocongw+Fx1ZL
	 5JsBlAR9mmbTu4XhKoQzMtkSK/3OAXfDP4kHDYyBhaWM9oejmLzyxpJpnnPo5wQcGNQt8
	 PBFVrdv0O7OItGLqRrkjO9RoV+wWP7yuTi6ia0zDyGaQmGmXih1Zq53lBhqHsZ5RJsseE
	 5W1HckvhZmg+KACJt5D+424yby+ZVvkVkn2UigcR91KYzChiA1EIKWmR4zqk4v0MwvMGv
	 DzkrRVjGJL94wO1iIVKyKQoRweeBAaqLS6N/Ypvhw7B5+3KNeVMeGrqbrBEu+mkB0pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AUDKoIpN;
	arc=none smtp.remote-ip=74.125.225.75
Received: from mail-wr2-f11.google.com (mail-wr2-f11.google.com [74.125.225.75])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612C7606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:29:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 612C7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AUDKoIpN
Received: by mail-wr2-f11.google.com with SMTP id ffacd0b85a97d-48fdea35dafso1163639f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794396568; x=1795001368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zTtDGLue5JqVxGOZgA8LDHzbFgoJeRKQNOdcqpXnAX4=;
        b=AUDKoIpNLkyrldLXbo1ZDQ1otgEI/vNPvbgblUzXsd6GUuG+ssKADFJTm4mlhZLfJB
         e0CNjY4GgiUGS5jDBQyVQSHuSoQ2xik0QvLToaSnKfCajJXiXpAFTASAyXzWqqXoyUZV
         nWRI+54naZVSG88MTcp5WqQYt6GrzkXg5B8mXAgMl00pNfuU6ik7YvPsb7PQQAyRXXyH
         6gwhKSE2aZ4d54dBSrJ8JCAAZiEpQ/Y540Y6Z5QXH01WZj9+RblibfioYVpVKsUriOGn
         NQDqfm1zpSO1wMEvcDmpupAWl9kaPtrtMZP73bdn6nJIzzPWEbtwFbB8pS6Ln9PgbGXE
         /How==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794396568; x=1795001368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zTtDGLue5JqVxGOZgA8LDHzbFgoJeRKQNOdcqpXnAX4=;
        b=ciJ1yuEBe2zjaaRCF8wTAKK03sp1fVluufyEXvP3OiCwYcJhiHo0GimxLfJI81okeA
         nbNmqoqQo1fv30fMYBcz2IFSfFKueDCP4cjOfm2ZRid42RJ+L6ArGMe1Gk3ivKMcJ0fK
         HMb3Jdm1UlV962yy7LjIiRWrG1arPHEXRIVBAx+d7ezq2L1FRO3EubId2lT/TmfvySc3
         DpoZGZANf8jgV/QUP8KqnxR3oxh+r++6ZuQ2qd8j8V1N2zwuIJ6qQ5TXHjJgr6F5pbXB
         2CND3TQnO1+ZvhM/i2ikJzXtpYniaz+KQWVT4ch/JL8wMlTrM9QPgXv5o55YzlQtFta8
         CxXQ==
X-Forwarded-Encrypted: i=1; AL+hErFmZQ6+x8MAHAqP3pzGlsZzE8BjaA/aZQTeh+pXkSp/cpdxC9sVDp20xt2nXIx3irn5KQHM7Txk/Trvq7k=@vger.kernel.org
X-Gm-Message-State: APuU4Z9y204G3OXWjUbOE5g3+D/r1rJolbHSSNn3FBUcSiUQSK7GX3SH
	4sRs2d3/NfT8Lc5PjxAY2gyLqTpd1sTKJu06aoPYJ+Qw41F4sb43yi8f
X-Gm-Gg: AYBFou2QMyt+5OdRQBBh0t9yQSEgHCJCxmdHBXSd4OB3VFgJnK+7o1JMT99ZmA90Izg
	IG8Vhw0A0T5m0G2ke468dxOnpcZurpGDxPxIBTu0XIpVIVCBGLkUwKuk41yLhc6zt4rJwrLfzqn
	bmeROfk/7w+ZiSuQlXplQm+GxBt1jEP7EPxp497fFq3s3nFEHtB7wVQvTE55FZreqXABE1F2Q5/
	cTMI9pBr60LYJo/0l1XcAtfRZFXaEqPciKxk0CC0fjqo500ZIS68yCo58XWJ4iWdgMZNmPHKln7
	WVPuUaDfRK2bxJYHyuG3JXaWgcxm3TPzzoafuyKrcAYuCaY+/KsHuxldP41N7S6P84tTjY0DWOW
	pHHmG6veqYU+twe8w6J6ZUhzjOL1pPB+OAEKFQ1n/ZImmNPtz083fdTQ+XNvAR9VUbiGXu2X34s
	QgY1Ja+aBO/Fxv0+3JzBEp2WjsFnxGAnPFBkcpQ55biFR74EdktJd5A9OMknWXIHjsQYAdDAl58
	l7PVU6hP4qFvHc9tBAlKajUWK5obXE5Aoc99QqyUKN6i2QcGdLls3+gKlzEdHsJwbcyIQGMcHet
	g6DtHurFcIqD7X5uFTn0i2kgQfHqnnM=
X-Received: by 2002:a05:6000:250e:b0:48e:75f:477d with SMTP id ffacd0b85a97d-499c4814a86mr3885367f8f.7.1794396567358;
        Wed, 11 Nov 2026 03:29:27 -0800 (PST)
Received: from fedora41 ([2a01:e0a:1058:7c30:e315:b955:cb8b:b86b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835c37bdfsm10536016f8f.22.2026.11.11.03.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 03:29:27 -0800 (PST)
From: Timo Joannin <timo.joannin@gmail.com>
To: trintaeoitogc@gmail.com
Cc: axboe@kernel.dk,
	bvanassche@acm.org,
	josef@toxicpanda.com,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nbd@other.debian.org,
	syzbot+d7d72f3d467710442af0@syzkaller.appspotmail.com
Subject: Re: [PATCH] nbd: fix circular lock dependency
Date: Wed, 11 Nov 2026 12:29:21 +0100
Message-ID: <20261111112921.306969-1-timo.joannin@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111101919.215767-1-trintaeoitogc@gmail.com>
References: <20261111101919.215767-1-trintaeoitogc@gmail.com>
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

On Wed, Nov 11, 2026 at 0:40 AM, Bart Van Assche <bvanassche@acm.org> wrote:
> Moving nbd_get_socket() makes this patch much larger than necessary,
> which makes reviewing and backporting it harder. Adding a single
> nbd_reclassify_socket(sock) call in nbd_genl_reconnect_sock_cb() right
> after the nbd_get_socket() call is sufficient. 

Hi Guilherme and Bart,

Thanks for working on this! I'm currently fixing a possible deadlock
in wg_ratelimiter_uninit 
(Reported-by: syzbot+72fceb8393e04ce876d9@syzkaller.appspotmail.com)
involving cpu_hotplug_lock and slab_mutex.

My one syzbot test failed because of this lockdep
false positive that this patch addresses. I applied Bart's suggested 1-line
fix locally, and will see if it resolves the false positive.
I will be submitting my cpu_hotplug_lock fix separately.
I am looking forward to see your v2!

Thanks,
Timo Joannin

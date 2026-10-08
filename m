Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D963F3B7760
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 10:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791453994; cv=none; b=seodlpIgiFP82bl2I8w9C8qOgoIhYJRCQaLY4l0JOQgm0WiubE4F4gyP8mtLkyBnaRr2KKQb9iEBF/YxpCm6/kuIZG2fXOwl7r1jSV1pgKB8u/BbOCsXVkBzElL4rhN2GrppUKqoCDseV73Ci/cJ6B2RTVvj1ruCZF86rxd/snw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791453994; c=relaxed/simple;
	bh=JWj1nuzQ35N6wDOjwCmlhSw/qBTHjvsrFfWUXl3xZZ0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uOAHKTH6HDezGkBucWn7G2XAdSgIABIQRyMt0eyc4Bu24mmFlT99xHN1ssR1+qdp2bsBuI5LGPv6KlRClNRjNQEUqTYe1jGRwxjdCjcRY5IDyZb8quDKQXAJlrRyjRvTSnvuj3DdfVCnVX4HNgJS052OBgujGBtocHYqkPy3CtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=itEQ3qF1; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="itEQ3qF1"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-154e9d2d979so2985410c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 03:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791453992; x=1792058792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eCf6grt46A4djzAcjuzxJT4IZiodM5ZCyPT424FBF2c=;
        b=itEQ3qF1S17+BeT8nUNlD3RSVNUSW7LqSreVag4odzNPR4caEk2KX8LIMjnyB4XQ/A
         rx7VMmX0oGGzC9nM6HS19s+ckSQw1jmUm0EPPjAIS2kUgiyvF9Z/uL8RLKkkMicEUr2P
         QU/3CgOdKA7sln7StajzTyWutALd7gRJtpppY4zN2onlqHzb+DLaK9Hi57oKITkNX216
         18uv4G2HAHrHFW/1XvsdAut+9OwphqchICqgGqBMwtsIPPvP6tAX3i0QDJbY+33pe0il
         54HKN6nZCQzA53Qg23VBfzAzGu4dyKk0ecMKk6dJqcTs926UPXgnM/mJaiJlqMdnOrXb
         qQwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791453992; x=1792058792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eCf6grt46A4djzAcjuzxJT4IZiodM5ZCyPT424FBF2c=;
        b=uR/M79baJja6sPhKms+hHcBZFBPrZNVrjMUs9QzFQ9393HALwq8xrEQWxVTtsQqbqF
         0KjqVapWCIGH6D8IBA/WxOs1FODQLKM2yWkJGQdpyAaGpzB8j/7NyAFP+Kz6J0b+OCvD
         npfpGyekM+pG7Cg2ES6GSqoHhjVteXTECSx5VDuajnC8pGHfjvH82khsAcyavlW3Tu8u
         lcvxAInZZIDLgVIdaDgeG4v91J3xZb/3dGNo9kvxpxqKi/TfGfm37fOoOU5bHYP34z4+
         qhv63x6RHNZouR3nuwVaZ8y8QAeNta2Mh+zqcvYWlb7TQ/hQ0rdj0cEYy4K7nQrqV3r8
         r3Vg==
X-Forwarded-Encrypted: i=1; AKwUvBxM5XCmmv3cqc1wR2iQu9Vi6a9eiQ4+vR6qa83oUuOEf62+xMwiFusEiSmf4LC+xA8R/5LKO05Ksrj9xyg=@vger.kernel.org
X-Gm-Message-State: AFuF++n+7z9kpV+7bgaHdkbTMrS+VOrYKWXc/qcyT03c0kWKhN5Apm+Q
	GrB0VvduNvdpb3YADHQWg9Vr9M9z06jcTG7JBA6ARhkKnpqtOp1fJxgcYrNe+iyUX+Zwvw==
X-Gm-Gg: AYBFou1/iZ+rg9wiiusmJGkI9lfz+p9OjkLnNiv934QPrwCm863XL/Lylq3xPJWwWEU
	zrIkRGseM5lyRvmhBaOL1mg6TWTGJZplCMoIwEj3BqqeLfIBE8X+2Zautjq7ROwqlpHZqbxwnQg
	1pIf4WmqdjkzwaBrE3iKz4B+IB1nvoffacUP9QB9xA4qvii1JCEdIeY2N1M84fRKlkiX+38EV3w
	SdmFnXWWMUb6bSbgeBltzeqyf38T/e391ExK6LrTfsQZucJhW2lAgH3lOZqubGZzEFl1i3PpUbY
	pfDm1LD4VzWkds1rZDNo/XpC2bIfujMVskVi2f/QaYb+g9N6nF3bSNCwXqZCQcd8x5jnLS2ocrz
	PyqBbEl+ifEiRdWUTUXX3Teo9P95Ev3e78DFeMnDgFlS1W769s//CtovEsz1iCSSi+5ZPDuLWOB
	f+bYkGcjHHHqQmye+fehn0oqpDJtkuBbNI7Fldtb0jcHP1k08C5aYU0N3zfn4xWTKxn2EPlstAf
	QqgtXpiIJqP+WU6F30=
X-Received: by 2002:a05:701b:4584:b0:155:4a09:a228 with SMTP id a92af1059eb24-1659f86d47emr2222835c88.8.1791453991594;
        Thu, 08 Oct 2026 03:06:31 -0700 (PDT)
Received: from ramesh.. ([124.123.89.203])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1616980c3b7sm12992588c88.16.2026.10.08.03.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:06:31 -0700 (PDT)
From: T S Rameshkumar <rameshsv06@gmail.com>
X-Google-Original-From: T S Rameshkumar <rameshkumar.t@phytecembedded.in>
To: Petar Sakic <petar.sakic@ink.fish>
Cc: Matthieu Baerts <matttbe@kernel.org>,
	Mat Martineau <martineau@kernel.org>,
	Geliang Tang <geliang@kernel.org>,
	netdev@vger.kernel.org,
	mptcp@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mptcp: push queued data on passive TFO subflows becoming established
Date: Thu,  8 Oct 2026 15:35:20 +0530
Message-Id: <20261008100520.104205-1-rameshkumar.t@phytecembedded.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAFPPu1gU2Y-D+d4i3F0MoNkYK+e1U+=X3qf6QycjfKBw+8snPg@mail.gmail.com>
References: <CAFPPu1gU2Y-D+d4i3F0MoNkYK+e1U+=X3qf6QycjfKBw+8snPg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Petar, Matthieu, Mat,

Thanks for the feedback and confirmation!

Indeed, since the bug predates e00b63056fb4 and exists back to when server-side
Fast Open was originally introduced, the appropriate Fixes tag would be:

Fixes: fb7084501a61 ("mptcp: add support for TCP_FASTOPEN sockopt")

During our testing with simulated network latency in namespaces, we also found
that when the 3rd ACK arrives:
1. check_fully_established() marks subflow->fully_established = true.
2. But within tcp_ack(), the underlying TCP state is still TCP_SYN_RECV until
   tcp_rcv_state_process() sets it to TCP_ESTABLISHED.
3. Therefore, invoking the push in subflow_state_change() ensures the subflow
   is recognized as active by __tcp_can_send() and immediately flushes the
   queued write buffer.

I can send a [PATCH net v2] with the updated Fixes tag once maintainers review.

Thanks,
T S Rameshkumar

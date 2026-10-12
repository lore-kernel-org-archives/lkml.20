Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1284C30ACF1
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 04:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791781081; cv=none; b=eIXVgDZtATYWOLMgbo/g19tmGDD3N7mAmEcI3//NVr7b6wM4K9LQt6M3XQZUWlkHNf6pg6d5klLgDmiQSkcDYAunXBN6z9oZmtHXNdh61TGpp5xfTkliJLnDBSOJaFAhvIRbEGjGZnU5RV6p/dyyEJwHjN9L4pQUDZ5ktqk0pbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791781081; c=relaxed/simple;
	bh=VHRDacBvIcvaD3EeGZjqUhghQgLI0/sOWRk6kjCWSHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X+iY4hO7VLOBvfW9IKiPs6eKyuJXqYKJskpPvsiWd0k1kiHpe3Fv0C7UGRRmc1dyEQipJg0yQOhrE/kbPEueOYs6UHxG/5VaJspxAMxIIx2h/624FZVfLdxabPCY7zGQy16YvmNzWr1hWvyOSsIFvOyTYNkABaUhxG0dKXh7b4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ddcD+7oR; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ddcD+7oR"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-154e9d2d979so975485c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 21:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791781079; x=1792385879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4r2duJGpWXQRzkludK1kNjL6OFMP61EO9Bgn2dWvRnU=;
        b=ddcD+7oRxaxZGswhIygytO2hY0JtyP8knSGJ0w5COI9w2IPK1FcZE6b6BZ8jRFu/c/
         wBmcrIGMD/exIKKOF4OmakYsLLAINMeixgkQNB0TbYq1PN2wHa473Fx+f8pbIoGKbakR
         umItDo88LtXnuJgRTGrxQxwao3slT/ZpF2Q6thOFHTmKbk4rOryYTpu+Mk5+/LoLuznQ
         E6Im5AJjGr6erQjBMRMcfKdFAnc3jh3MNMoaIONcQzVHIr60EEdSlG4PoYzAozzCblhF
         K1GewhlnQGUA0mw1MFfjbpFuV+755RYVWXWLlTmPGZ5qnx87swlIv+yK49fhtT4wc3Rc
         Ahuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791781079; x=1792385879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4r2duJGpWXQRzkludK1kNjL6OFMP61EO9Bgn2dWvRnU=;
        b=zFdj6zYbRiQCMfluW/0JXI/F8f32qkVCUyB9PbISttHLAvFJqfpGwTQalaQ4fSqMfE
         x7CxW82HAty2julFfOzPBTNJk82ck2ZGNoK96NRYTmMeV5kyEhY3Qhst8xHj4sSs+2Cu
         0kxv+Qwknchn+3g5oZEU76GWM+z6Tdborjs8zrfTAN0acU599LaUTpMWy0T8Cq2g5cFR
         lkOR0DA+ahJwAUJqLLc+PKJ2afClImCMSo36ZTjQpqpXIP/ipVJM/VqcIs5l5yedsNJL
         61ZBfqc/kGvaErks1eYTw2AorSyECnWEWAViTGlCBJwxG1AFkY/e2JgAjTPScjZrp2mM
         PERA==
X-Forwarded-Encrypted: i=1; AKwUvBwO/IvTAkvffXv7ls100N39gy5W23ZoAGpUKSkAH4zziAhtx62rA2OBZ6tr9SsbjzKa6R5aLtw7bmkG5q4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQUVNtlHlAFmGOI2BLVdZW9rl+iaEu3SXjLKWS2SpuRKmIxVBl
	9cNA5SAbeVNdHlLl1H/D57Ki2A/k7NDVCdca8PUd8juiqJm52bpOlZZM
X-Gm-Gg: AYBFou0sjYIciCJEz2OE0j/hDYkFgUttRxjOqIvLqrXjj4M6DJEHhByN8TgnPAQZh7Y
	fE3OI5POIyeTNWI+n6SJAjacWiwaCibCStUbflOzd3keC8dL3Vct7MtlJfI71XQS66Wit/c+7CI
	eiGKlGnR2OtswY+SLEThYUXmU4poSidul6TbNyBrU/A8iuhxVgUsrNVCVhqlOCGgYJTTqhILF2T
	jbHheVvxUYgyUNQhRSgVVYwsYRAmMWtYB/iaRtkKYqtPgXeL0lmdkxnBra55F1kJveT89TMn++I
	VTFiO5h6546pOXEENxqoKKVymy2vJXJqwxPAhEmPmINkpx+pT1Dozqn2EQRUG44PQyzW+GtPJsx
	KxezotPJk1xJfstleBfjHHMX2XlNHYUe3ZNYn7UV0bUbC5EBchetI5A4c6Hff7Kp+G/mZCpd1A0
	NkVnVZCHMNUBPHdCKYYIDFKtdJY5i/hEd4GlBH+HaIaolzWZP/Je6whDYqmy/MlH/uvch+GtwCy
	iLXBo21z2sQAEySuKazaJEQ4gVqk1rBzdPwBYj9p7HRWZqdt3xV4RwdBI0R3oKfZ/DwxgBKf8xu
	22hrnECBez4cvnTvJKrozp75CjUijUe64joWgnsx29xiv5mlnyDmpq7EsYXcehxgBV3VsOebDeo
	JNoUUihoJtJ7aw5B/zRqvfc1d64TIg4bY9EUvrpr22PSs9RUoJI0NXc8=
X-Received: by 2002:a05:7023:889:b0:155:4a09:a228 with SMTP id a92af1059eb24-16a5afe5e1dmr11902752c88.8.1791781078853;
        Sun, 11 Oct 2026 21:57:58 -0700 (PDT)
Received: from FT6N242TWK ([223.181.119.248])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1699718c547sm25367340c88.3.2026.10.11.21.57.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 11 Oct 2026 21:57:58 -0700 (PDT)
From: Shashank Mohan Jain <jain.sm@gmail.com>
To: Eric Dumazet <edumazet@kernel.org>,
	Neal Cardwell <ncardwell@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	"David S. Miller" <davem@davemloft.net>
Cc: Kuniyuki Iwashima <kuniyu@google.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 0/2] tcp: keep the route window on the SYN when SO_RCVBUF is set before connect
Date: Mon, 12 Oct 2026 10:27:51 +0530
Message-ID: <20261012045751.47179-1-jain.sm@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <179171754826.2527009.561712354727529429@kernel.org>
References: <179171754826.2527009.561712354727529429@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, Oct 11, 2026, netdev-bot+sinfo@kernel.org wrote:
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>  - How the issue was discovered ...

Found by manual code inspection assisted by an LLM (Claude Code, Claude
Opus) while reviewing the networking changes that set window_clamp on
unconnected sockets, then confirmed before posting with the packetdrill
test included as patch 2/2 and a veth/netns reproducer. The patches
carry an "Assisted-by: LLM" tag for that reason.

Thanks,
Shashank

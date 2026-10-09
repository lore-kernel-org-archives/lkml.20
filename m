Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC7239C006
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 21:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791581875; cv=none; b=TKMPkG7DYAP1yfW6xHBIyXY6P6apc4AYxsqKexK7TcMHWX0oRSTFaeIFj1V5NcwjshiVYBlKV6lA1zbJBlsGmuEBMv/ABCLA0IeiOEc5eF6PV4D/BxLNuru86h4yw0SPjHfTJQcET2jhs3TQbGrMbfNvWvyUXa208I718WBpb/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791581875; c=relaxed/simple;
	bh=WFMQZ99UMpZplb7RsBAhDd2v9uvyJrKd1KhsSZExxLk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QLUEQTxNjlD1BkOtbaUe9D01GTFp9Z3e9ndeIz5lwHP5gcl2XSn9487U7bEJf73DCd4uyHq0oCVYZ6oiJdCe/Vq9bxGlOy/0ZbkBzR1gcaBiZ6UUuFrJhdKUoFtPsyPhZIrKTmzwiMffIoBIoYt8jiZ3B/+W4jaS6sYqQPKo2vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net; spf=pass smtp.mailfrom=blockcast.net; dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b=fDvypXHt; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b="fDvypXHt"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1419d3416ceso435886c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 14:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1791581874; x=1792186674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LbJd+F8HdwB4ZwrQUMxv51nPVS5BB9PcOKCpwSnYCy4=;
        b=fDvypXHteD+b2rYq3o/VbmtOvcKRJZDAFA8Opy87r7DsHL6uoA/6sejSfnjQaft7Mt
         AyHGSYqdDuDbTnB8y16ELq/ezeQVN/K3sIv8dpg+BPb5uQvW/hPq9ZJDPtLwfqtzUqQd
         +8bIQXyTwNU/ezu/zkGy6+v4KVvNl0hg+e3xaZXjS9Ls+yFYmV//+nAcgsUR+PFc6OB8
         YwyEGBdOlQy/T5NG9RG3mihyq5bAWYp9OsLCiMs5EUtZJSM+cOKnu9GW3HcaQ+MJONHv
         //zD22OSlANYdOxJ5Ty3VJD4B1ToIZDXeahI+JbW8Iod3vtHDbv9OsLZZ0yFkjfsEYSO
         DFFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791581874; x=1792186674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LbJd+F8HdwB4ZwrQUMxv51nPVS5BB9PcOKCpwSnYCy4=;
        b=WlH2ydJCEDKK2r6c2V8XFLkt1j8jDXyvKbZQZR4xUN9GDHLNFsABvrxuu7oEWfT7m7
         9DsEIdVjobZGRnuwXJU9/M9skH/KNQD7t2VSwiDWFgNFVvEysVPq2t2U1lQqQKwl0CC7
         Uv+/wsH14RgG8v/XWAqaOjArtR0FsWOR+UUvy9phsK5qnBYvNJp305Fbg/IuF8UiQyjG
         xg5GnZbS6j1o/FPeo8Ewt4FrxjRmfEHOQHNP5hlcJWfne75b9Rt7dWWD1yZ7Vz7kiS7A
         RNc8Q/0ruQc9cWSonkJpRLryU2UAhDv+QdXMTPW6UCNtC3xh3Lu5YWd7qX0zzGaeS45k
         +QNA==
X-Forwarded-Encrypted: i=1; AKwUvByXNAHIgOJAjIpUqFfdnZjuZHemZy8VhYYC1QGeRehc8yX3gYcCQK0IrP/u4fgRf+e3JoSPqtbelkEd43A=@vger.kernel.org
X-Gm-Message-State: AFq9FYIGEUq8gHmm8p5mxQTBxLXoowsKNP4WcD1cmNRLdip5/D2fhNvL
	TrGTJAd6MEM96AFxRy+JV6hB6tmbLhMIcGXIlV12IKa7sCuDWeS2XcfBxvKPf4J/WQXpq/lePwX
	KqTal51U=
X-Gm-Gg: AYBFou2oz5n5EvrSQ3Gw72Z3wpkwM78ieQRUn3EbL9fppHEQXPPF2cMrYRJfOXAqi3I
	4pMzPFWsa//Ns+9I4IufG5vysw5j1c2UUIPFT/1r4XilVhSBJ5YuC5r1teDcYbAYjUGFejTTgf9
	rRZ7aTcaCLcq7iLTUuus6pwFRpvRm1K2i29FNlhHd3cOj7gdPIM7fnHRMFX0j8aH/GYTszTUqjX
	gh7rM6l9fNLjznlUxYeaexLvzuKtYKch9d4ajYTGW4c5SvvPcvAibqlolxpBtwrJmpb0K9VueFS
	Hdid9A6e74BWTvcnHj0VCxnezSMKngzcs9eA/bnGv2uPzdLMqX1O71iBMxgE0grjtj9h5Bo0Z7K
	JSo1rs8jaT1vcHWPzwURioXQhoaRIzCJ5i//p5QdsWDVDHhq6kQJRE8nMzclZO8ksGaQwp5xYLx
	aJ72PzvIoVNAoWvi6hzKFbeil2YGLhfE+cNTlc5es+Zvq/3cRCnjBn0+wP6P4/jtulB0zMMTzqg
	4w0OJYzMTnX6idmTST/hTaYTsK1/xczWZYCQOn94hQuArs5zzA=
X-Received: by 2002:a05:701b:2412:b0:137:fa50:a242 with SMTP id a92af1059eb24-16a586a3183mr3726919c88.1.1791581872469;
        Fri, 09 Oct 2026 14:37:52 -0700 (PDT)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becb11sm7720280c88.4.2026.10.09.14.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 14:37:51 -0700 (PDT)
From: Omar Ramadan <omar@blockcast.net>
To: netdev-bot+sinfo@kernel.org
Cc: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Simon Horman <horms@kernel.org>
Subject: Re: [PATCH net v2 0/3] amt: fix relay tunnel keying and unauthenticated-Request DoS
Date: Fri,  9 Oct 2026 21:37:49 +0000
Message-ID: <20261009213749.2226283-1-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009201455.1904698-1-omar@blockcast.net>
References: <20261009201455.1904698-1-omar@blockcast.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks -- both are fair asks. Answers below; they are also reflected in
the v2 cover letter. v1 was generated against v7.1 and did not apply to
net, so this is answered against v2, which is posted against net with the
General Query patch dropped (that fix is already in net as afae89de73dd).
v2 is three patches.

How it was found
  Manual code inspection of the AMT relay path in drivers/net/amt.c, read
  against RFC 7450, with LLM assistance -- hence the Assisted-by: LLM
  trailer on patch 3/3. It was not a syzbot report or a static-analysis
  tool scan. Patch 1/3 (endpoint keying) came out of the same reading of
  amt_request_handler() and amt_update_handler() against RFC 7450 s4.2.2.

Whether it was triggered
  Found by inspection; not observed in production. These are availability
  and correctness defects, not memory-safety bugs, so there is no oops or
  stack trace to attach. The symptoms follow deterministically from the
  code the diffs change:

   - 3/3, exhaustion: amt_request_handler() allocated a tunnel before any
     validation of the source, so Relay Membership Requests from distinct
     spoofable source endpoints fill the table to max_tunnels (default
     128). Once full, further Requests are answered with ICMP_DEST_UNREACH
     to the (spoofed) source and genuine gateways are refused; re-sending
     once per amt_gmi() interval holds it full.
   - 3/3, desync: the pre-validation lookup jumped to the send path and
     overwrote an established tunnel's ->nonce/->mac, so a single spoofed
     Request carrying a known gateway's source endpoint made that
     gateway's next Membership Update fail the "Invalid MAC" check -- a
     silent one-packet denial that consumes no table slot.
   - 1/3, aliasing: address-only keying collapses two endpoints that share
     a source address (NAT, or one host using separate IPv4/IPv6 ports per
     RFC 7450 s4.2.2) onto one tunnel; the later Request wins and the
     earlier gateway silently stops receiving.

  I have not staged a live end-to-end exploit run -- the above is read
  from the code paths, not a captured trace.

Fix testing (this part is observed, not inferred)
  The three patches were applied to net and the kernel booted (arm64,
  QEMU via virtme-ng) with CONFIG_KASAN=y, CONFIG_PROVE_LOCKING=y,
  CONFIG_PROVE_RCU=y and CONFIG_DEBUG_LIST=y on top of
  tools/testing/selftests/net/config. tools/testing/selftests/net/amt.sh
  passes all six tests -- amt discovery, IPv4 and IPv6 multicast
  forwarding, and both IPv4/IPv6 traffic-forwarding torture cases all
  report [ OK ] -- with no KASAN, lockdep or RCU reports.

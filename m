Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793600496;
	b=5OcUiWyBWpdkQMOxyK+IH4Qp3W2b91x7qklrGbB1/uQhMOBtX60FVeu24KpDuQVi5CpM
	 IPX3CIKNUmJvBBFk+Q4SoZ97/LgqNjZbe01H1TFW36RBFchZqcjhPPvA5JzOQjgfR8Zn0
	 PqVT6zWlaMlEmERETLe3tKTMJVKoSQC9kSH34qoxOM+gYhwUfiuDYe9dR3McAHKmSxY50
	 OmtDq0VjMwcK8JfEbyAH4mJ3JZegK75OAw4NBSKE5nrPm6laOgrn1PKilc+IC8gG6amFj
	 Yi0GjjOIHOMm/adhbRExvCsGWm1BJR64ai1aJEZgwBLjsZ6iXJIGZk4BRmoVOezZ3AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793600496;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6I5GZeUN2pAjlsmZQiQqPXA5FlW6woKT3gvbw936o5s=;
	b=0Y17I1VFqZB3INf6H/UaPU6g9yd/Qv6T9KGKnwn4vjaMqatHdQGvKQhRwb/qMVumQqpm
	 di3SB8w9GQekmoxTOX07cJJVktxemMhQJxrCUnuhTc2B0fxmUzOC8pfDgEPrR37QdC+MS
	 RTkUdVOHiwUEMRQ3QEC8uCENpTb2twKbbVk6NI1uyehL/K/STnHbC6rB+uq+WAkLXLZI8
	 FtqOOviQAJMBz+LV27tuKocLXAe1Ed3km85y3faY/kR36VDPn5uI9QuriG6a0leiFDyNU
	 pafKWVNwGTc9wgK9++maUcLLYwnKpMKbQCTu5pJBf7N+M8U7XeJsgyTdJDA2CZNZbwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ag3Wv27h;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B7F606A339
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 06:21:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4B7F606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ag3Wv27h
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3a4b3ac8fb7so1554302a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 22:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1793600495; x=1794205295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6I5GZeUN2pAjlsmZQiQqPXA5FlW6woKT3gvbw936o5s=;
        b=ag3Wv27hyHXbOvgVVdI4F3IuF8G5IR1L3U+Yzi18VBgKxoROt9UdlY4DTa1xsvNAkA
         T8LQKEj+LfTg8ypiLjhqMzIGFPNNyn1La1sy390vILU++K4gZmR7TQbG5/doOenuW623
         9zo1P4HsmyPj7T1VqyZBgb29C0biXt6zBOm4cWvcqd+84wVIKIFFgDptjONcYTeG/DAb
         OfBRQAKfd6BilcH3Hl2G9q3Kwel/4LT3XvFP33jrtrGk9feZwkRwd/1A8o3MAePQrC26
         KfR1qiX0TpCv9CTQ3PCv+L8SbfVwt/WVZlPww7+RW8WZ83ZDt9iYblXF223EjdspGgS5
         TQYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793600495; x=1794205295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6I5GZeUN2pAjlsmZQiQqPXA5FlW6woKT3gvbw936o5s=;
        b=21FEwqp/q644C/SG3lsWQ/pLx5o7bcLGYFV7mjWA6KZxUyQTvUNocJlDRP1343XSeP
         YryS7knwTQuMNUbfXGlR76gW5V8/08jS9imJRZS7JVs5aD+gZgOwS7ITSUv3bnMVseYa
         XdvYhUBAQZ4ERpDIXa1lqBWVJUlS+OCUNyt2LbYlk3L8SwGGQYpp8aEpfvm8gwfNX9Fz
         MtvijuR18xJVmOwZsjCel681uN7oTXgjxFisKqTpT/ibhxGSGoBCj4wTLs7h1PjeS33z
         8AQF2eWIDCcEvVTUsOUqbcQhpO767we4TMFEgiqbwZDPxfmI5Yyy4z0P2Azq9fem7c27
         1bWg==
X-Forwarded-Encrypted: i=1; AKwUvBy7sK482H0Jqr/bYQllpicFtkV8Qo4wIKeqv7fnR+Dtmlt01xk1l2Dn0UmbG6au8dFIQAUhD6k4jSeF+/E=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dM/dATXENCj4bl2AnuwrSgsLQuYUDqhFRzcmNOPNVCpp/8mXk
	ANgJ+4DqYQ3HkcGS8ewcgYCTjTEK5mLxW2x/b+EZXjojoNnkoUFIN7CFliqQxG5BmOs=
X-Gm-Gg: AYBFou1NPbDBO7xqYgbi6WIXdIvr29B9sV8MwpmxY3PErf/+cTrv9GOxKQYdFV40JoD
	IrYBi31xCQAXxjVHkPvACp5giDZ6XA0o9BdoSf/ycQfHVRLa+j2GeM7LW7p7qJQ8k1gT+Ld1DQF
	Yq94fcvcmy0Nva7g0mmkwZWI8Aa5KPzzfo5NRHuKsfMddPzFz1w7SGnWvMnnXTFtTCq6G0mXnyo
	135FYNmZQ+P7RGyoTRtPInNBFTb5CxAOen/DLKuRU9193/gG93+9TiGVKrqIW4yleoszaDFWQkF
	sqgvQcFAsrbYWjLFh3e2CPqoOBE1C8aX0I6PTmGQFhVKTDACOMsi6izjExAoDCwpzHBD0zPyRoa
	DQ2wfVEnCEOivV1CTi9JAMTly1CeFKpsC/woidl3I+/3KpCjeX8IxdKEaOAsn7T16gYY/ph1FMR
	FrDl33pm9b/lWoQlU9iWz/MyDGPUoVFUNVT5Ic+9bRo6ZufcoFLXKWafHwqffa2YbQ5PEr8JVJJ
	5Vg0a4I1MRPGU4lDveBD0WxmvEJF8Nd9+BG/nj7NiII3Ot3DpFtx6q59OoVmvkZay+dUmDLz0RR
	iTg1I5SEZZjMC8e4RW+Gn90jPnKCvpb5U3zgTmE9j73HKKvfxWXFEmp+9QfcdoVZc46kK4MqneY
	c3HOiqOVE3aC/qJBWUcB1jSI9x7ltzCp6tsxdlw==
X-Received: by 2002:a17:90b:35c8:b0:3ac:9a5e:9ce7 with SMTP id 98e67ed59e1d1-3ae897aa7aemr7805282a91.49.1793600495142;
        Sun, 01 Nov 2026 22:21:35 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:d115:e4f4:23fd:61df])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e9bc6f7sm16685858a91.16.2026.11.01.22.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 22:21:34 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Leon Romanovsky <leon@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: Re: [PATCH v2 RESEND 0/2] RDMA/srp: bound the receive IU the target asks for
Date: Mon,  2 Nov 2026 15:21:25 +0900
Message-ID: <20261102062125.617482-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <418587e0-f727-4089-bc98-faaeb88ec308@acm.org>
References: <20261026055430.406487-1-yhlee@isslab.korea.ac.kr> <418587e0-f727-4089-bc98-faaeb88ec308@acm.org>
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

Reposted on top of v7.4-rc1 as v3. Only the commit message of 1/2 changed;
its KASAN report now comes from a real rxe connection. No code changes:

  https://lore.kernel.org/r/20261102061938.617371-1-yhlee@isslab.korea.ac.kr

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794315317;
	b=bFDz3uSmRDFzEE31qqDiX0DZekBkPrfywOhCTt60MTeERO/4wCTT9ZRkFYYhpaY/N4FP
	 Sg/LKq856WlsXVVGiTsjOvyrRsqktXyND2kdUWOdu4QyOBEkaheKrwfVRvC2V+6ZAEJwy
	 GnG8sRySyxQJi9rcqJnCLU5m3Ztzyc4oDNO/wYSk7p0tvU9nPDEzDgx5mOvmIS53xw1eE
	 ZUbbHWsIG0hj5tSpPxty2U6nyqFJL8A2MTNXSKZ2FUsBuNBRFAdcmA3oMMZc37b9syby/
	 pk/bpdnk4VpLCC0SnORHdalEYzXcXMtOC8vda/TFjpI8TjVdO/y0tIqXAcgpyXrrkVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794315317;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=y9a4dXZz2Gh7g55gQ4afYnhsZlVmNBXmZzJsbUHMreY=;
	b=ROqE8/Vv1pj7cALIH4UI57bnR6RoEkwipkBYpWDDZEhcn6Z+09KrTjTZIIvKcd2EDM1H
	 y21b7hx+4TUxhL8c+BkGyddHuXM9I2o09dOrEUZZcGZluYZAhKTZT3sn6NgZEA0XffVV+
	 UJTWQjX5pnbKs1zcJJoQ9szFfLBBRCDozzcT9/B101Hf8qWgxAnKbVeWpZWkKLvtILlof
	 9IPkbhLmhr4ci06Kc2L9ZEuJA/WJvE3RSm3NZ1K5q5a2aEpHFUL/+YS4bHO5Ya0FJGf5J
	 Nl8vZTQUIhv3cao/8gTT5goJFv9yVkacALZzHKb4BFXBP6t8FrOqb5diSF5+RDu0Viw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=HKElo7IS;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97D160A2612
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:55:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D97D160A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=HKElo7IS
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cdb1199bfd8so799029a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794315316; x=1794920116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y9a4dXZz2Gh7g55gQ4afYnhsZlVmNBXmZzJsbUHMreY=;
        b=HKElo7ISktPKWfb9xeQZupSjRFJ5M5d1kMcDar0ZaqBwFUrTylEq+AsYWADn5hN0fa
         gOLFwTr/tOo2+ScR5xdnmknTwTZtDLQD5eFUwJr1MR0qzll3IgBcKi5w0nIJv14MsnD8
         Fv+Z4RbppADwrGnnEvgeqNWjZ5jv1icT5/6KUJ/pzrC1bjBgHDxiqg9zKw5gGSkUoHF0
         wkiqPMXNs+41ltOOhSAySjGbzyjUuhdC6JWHM5/hnUUAopO12WmPr4GtgFKj7j8lhtMj
         AL7OgMejVq94e8pXnA1vkau7qQnT1SBA0a9ksb8bP20jPQiXc5y+oqi1SgZq4T+/ODar
         j7fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794315316; x=1794920116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y9a4dXZz2Gh7g55gQ4afYnhsZlVmNBXmZzJsbUHMreY=;
        b=IXhsoy/ggpWd3o4V3IJnGcn6gCdFylyEDiMZMIyo/JouKWuyGbOo2stQLeU18ozq2J
         xUJYcGnTIgwghi8rZG5v0ui7tH5qpdUEEumGXJebPR77kAEwvS7/uwo2dTiE1hIYNQOQ
         zbodAMMumZ26oOPx+Uemh1InMv9RQz95Bw6uTpO5rKNt9UbIWsbRudf19nHcHRVwESUE
         wh7LX1q4baVmG1ugNQP2F3KBAxgDQpjx1zSFof9VE9WsFw57El9yctDeUNpBkeen8h5G
         pvHorPMEHoYzjl5T+W1HYZ/Kbor/MvvVkga4v//1ckALoZvdwgZ0B1C5DGyHM87bzlxa
         js5w==
X-Forwarded-Encrypted: i=1; AL+hErEPdkaOZmSQ7D3kuEFdRtGCGQMJdiUUgKxSHR06pXY7oGhVzGScL2L0bFNiBI2JGFVwji+/CHK4JuJjCHo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+60uv6CFatoLGVhFjZPO3Me8cBpdsZQPPQ54jEdYpIVc70M1P0
	5CcagEkecyrQZpB5nmOw2M3Uk/iXZwTZF3OdIo0Jcn30B9dzY+dpmmI7/EH6DDKa2qE=
X-Gm-Gg: AYBFou3Ao34deFmmS1TpqX4psfKWVDgPdtpKUUqPhZrMpl6tKoe9vntZj8sduYEllwf
	B5YAgo2ByqLD3tXd7Pg1EGH9vp7YGFCBAxvbrLg1NBVASf/+3/SRWooCFi9kJAy5uOkBMPx3Kcq
	y9PT5SMiBVjKUKsyLmbEaIaizKK3wYrM8fpyK9O+S+lMzPOm/LzUspxGArnfieIV3kn7Jvk5lHc
	ZpKQ+ICIktzkHgdaLX461BqTkL3+udzi8jp6cFcvtbnEz8fkhM9LGzB8kfzQTexqICgPhALNvYX
	mkuUqIhryHXWWgB9/M3tvCNPQitQOy/w7WT8eBinU4T3vrpif8MQDjFG6S5fOuvpOJHU0kuAUDM
	S0IfG0JDzkeW9+sPljzKauWczNVYbXxDe/aXmVtqLWYbZbbTx2f2PJojFYnWB4xlpMnFgeGlZSo
	lDex+TtfTPfOZ1QlvJwq6RZNWybGey8ko8I7BSRgYSF7VS53dej1wBJIDPwfFgL/5rs4X6Ed46R
	zqttJL7MMa3/76a2W8u2sAjSmkc15L21ddmUI3CQFKwEIWhZewnSiH2oYZiijfvEdMAtbJYb7o/
	rhXvoQPS1yoYpWa1MfnK7Ht+Wr2jCoaZDswtQZ4arkhMKUH7ARGYljthJLzDzW49PhZgwqi7Kvr
	SZkc2/O/6RIV+EWn4yq7guTvM9xcSJDxwW1eRhQ==
X-Received: by 2002:a17:90b:1dcd:b0:3aa:fc22:8aad with SMTP id 98e67ed59e1d1-3b166d31305mr2579742a91.54.1794315316112;
        Tue, 10 Nov 2026 04:55:16 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:88e2:4271:a9b8:cc50])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1690eb517sm1631666a91.4.2026.11.10.04.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 04:55:15 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: sstabellini@kernel.org
Cc: jgross@suse.com,
	oleksandr_tyshchenko@epam.com,
	boris.ostrovsky@oracle.com,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/2] xen/pvcalls: destroy the per-socket workqueue on release
Date: Tue, 10 Nov 2026 21:55:08 +0900
Message-ID: <20261110125508.47483-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <604a9832-80ac-107c-b36f-4bb338519cbc@kernel.org>
References: <20261109122324.30134-1-yhlee@isslab.korea.ac.kr> <20261109122324.30134-3-yhlee@isslab.korea.ac.kr> <604a9832-80ac-107c-b36f-4bb338519cbc@kernel.org>
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

On Mon, 9 Nov 2026, Stefano Stabellini wrote:
> Please move the call to destroy_workqueue() just after flush_work().

Done in v2:
https://lore.kernel.org/all/20261110125002.46683-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee

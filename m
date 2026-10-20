Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792480602;
	b=Kmi6HM+NL9i2qO6m6qFdJ+75dFWCi3TXd5u28bEunl2+6ZnMnQwQ+m994r7lPh88/bZT
	 FbVXwSlKJuwmTKQet5/PaDVQHq+Z4HsiqYusGiLB8EjyXfxtRA0e6rsbYEHpDNpEkWQIX
	 eoORJoSxFHWvL6rKJFP6DrN2Xm2U7ORZN+xpFxUt7VpSxzw06CjmW45w3ccMsUz88vVyt
	 h1OWVbrHvyodg5k3TqHP0793toJnikQdhGOHfdqbCU1iuOHuG6ef7/1HG2vBeHiLuUk71
	 3lAAzYiRCiouP2wEiG36VZnDGvYgskTuY2qiLzxbWArhm0WvWKScwiLJD18qyjnOlCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792480602;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CDcVH90vElOma+PIBRsVBwzcSu6I/4oFPmDU468ryv8=;
	b=E3DmtmyyVxBAKJXuOCIzWpJT1dKYdBjwDirdTmWtjZ5tBJliPk+hux75/C8ZxSsEAExK
	 6npe1YO7+2165YtTiZ213zNIC01H3YfYqbPkJMlALLrOj2lj2jUkenHidbfh2aOOnIpDs
	 d8MI7QuMqQ4hX0kNdWzJK4wmAjKZwzwk+aR7XLudPmYMR6cqEGKPwq9y1fo3SbxAqUC6p
	 AFu0KbARGPSFIOLP5FJQYu4QzLXafxzavq2p5SuVaf7kb9bdHiBPXRPDQ9Cb8yoQvZJGA
	 +kyl8tBCNgQS7FZ7DPtoxbck6AmN+IrWtYmMzbWPZj5/k3X3srI18QQexB3lER7eR1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nvX+fDOL;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C698606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:16:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C698606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nvX+fDOL
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-353804b591eso5554653eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792480601; x=1793085401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CDcVH90vElOma+PIBRsVBwzcSu6I/4oFPmDU468ryv8=;
        b=nvX+fDOLVa8EIMURVKrdikuXBiDAj7FaY2/kaDslST+SgmSmMyJZ/OKks8Wm6q0e2K
         n2UCBxa2OBIpkW9eD+sPxrkOsTYBsEZwjCpko3fGQy9HwjvUXhQI4H+QvMDwX38Z+1FE
         63oKwQqCeR3ssCuntXa7ZwS0nZX6ExPIzim3T+iX8ehbg8gCZleSMCoPNcySejxweVeM
         hF6gmRvSLMvJr2rE7UcyuKRdkXc9Jmbo7J/f0hpm/Mctd6J8uXomXjBPiRA8nWtBWeUB
         j6vuAcrexOmKfs+ODomSPrf90w57xSnsEdgn2hHPpw7Vk+NUnpL7Yof6c2Utx4B5xwqH
         xs8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792480601; x=1793085401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CDcVH90vElOma+PIBRsVBwzcSu6I/4oFPmDU468ryv8=;
        b=KBs/MouD220OE9+gFqmtkQckmnC7cjzODjlKUEnJp4Y0vwm2Ul1+ea7U+bUYPk+85r
         BZjr1vzvjBcJ6OwhUV3B2OuB1ZayKqE06wL2jpLQ4xf/BuqJvpR+yE9Y5EUekMxukA63
         TvfHGlTgNLHJ57hAIjwwjoOIUTFpFxVkOvtu60CTvLx7a6+cBuoCUL3WyCb+rh0gVCsz
         +z8KjvWR+u8zkw9XL9f2AMAAiCvtb8T4tKbXYCXvYSDM8ecwxiQMZD/CUNudsmNjvu8E
         MC8VMbMBvkMmX5C+1R78d2ZDPPlJiy1fJJhZoefxSa7xkyX8vdg3E6hqD87t+TCs3KeP
         Rvzw==
X-Forwarded-Encrypted: i=1; AKwUvBwkBoJBErW9QWbxSPJAmrTie5ztQYLjKAprv7I3bXpT8q2/9rJtWABsZAosOGuh8Kinv02Ug035YfK4rH8=@vger.kernel.org
X-Gm-Message-State: AFq9FYK0yI/12Qn7/LVxOwAxjg4D1KQWIocohrS1uIx6/5O3WRyFuPJe
	Vjw/jBAbyL8cbFo74j0QRL7sJdvPfKEq7cIP7RmCyxjq3MVk+OSqreR5
X-Gm-Gg: AYBFou35kt1NG2Yias3rEk4xUWs4jzPXxsaKGfbdsewPfmqm6tvCkK44Efw09WwNsWP
	kEx8KMZV35gHNnoibG2J9c0LqL6mvrbpBLAvImiQhl9ZdssT0uftevymNZRzNB4x7rn74hek1AW
	F1czfQDDW3qgW10kjAZVdaC0dUz0pgB1mj6wIcTYEMQHIpxQKJ2RqRr3grsM2F6nLyExN0BQRtK
	UQvdYPcrMb9/ddJR3opYQi09ZJXXfIH+Df9lbHLeXIddrsbiKGEzhOwbZx4Zwbu/Pr9ejBlh3Vi
	WSV+XpIGKIuqvzOiRBlM7eNBYdTlGdcM/hC012n8FRjCKCB42AwTfxb6Si157/hVi0bK7RHRUf1
	i4nS5PGcte/rDuJE02HafUNA15DJ66kbvx0tYgwtEwV0hjQOu5wzD9JUp44RB6bhRqAppB2wdKu
	tOxEToF52EF/7i7QXcQn2Jfgg9gUlqp+en6p74Y6WGUdjXrwH+hyb1s/F+elHGDjUD1WTucg7dB
	Rx+Q3B4Vcn/KtcpjwoZCeo=
X-Received: by 2002:a05:693c:26c7:b0:35c:ef18:6a78 with SMTP id 5a478bee46e88-3619e925f33mr14707122eec.2.1792480601447;
        Tue, 20 Oct 2026 00:16:41 -0700 (PDT)
Received: from CHANDRUS-NITRO.localdomain ([106.200.8.36])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608219f838sm38434543eec.19.2026.10.20.00.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 00:16:41 -0700 (PDT)
From: Chandru Gopi <chandru.gopi.dev@gmail.com>
To: alex.aring@gmail.com,
	stefan@datenfreihafen.org,
	miquel.raynal@bootlin.com
Cc: maoyixie.tju@gmail.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	marcel@holtmann.org,
	linux-wpan@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chandru Gopi <chandru.gopi.dev@gmail.com>
Subject: Re: [PATCH wpan] ieee802154: look up the wpan_phy dump ifindex in the caller's netns
Date: Tue, 20 Oct 2026 07:20:44 +0000
Message-ID: <20261020072044.4971-1-chandru.gopi.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261020065125.896530-1-maoyixie.tju@gmail.com>
References: <20261020065125.896530-1-maoyixie.tju@gmail.com>
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

Tested on v7.3-rc7 (58161ead29e5) with the one-line change from this
patch applied, in x86_64 QEMU with two mac802154_hwsim radios. phy1 is
moved into a new netns and NL802154_CMD_GET_WPAN_PHY dumps are
requested from inside it. This covers the first two rows of your table:

                                         before       with change
  ifindex of own wpan1                   ENODEV       1 phy
  ifindex of init_net wpan0              empty dump   ENODEV

The unfiltered dump and the init_net baseline are unchanged. No
warnings were printed during the netns move. I did not test the
non-wpan ifindex case or the unprivileged user cases.

Tested-by: Chandru Gopi <chandru.gopi.dev@gmail.com>

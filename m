Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793028352;
	b=eB4OM7yOA2XpoV1WRhZGwNN1F+P1llbtOhCEdjaRsHuL5kNi+IhOLGJOJOnLRsAdvI0Y
	 +Bf0BZqO6ji2ObA99yM46B3KqBtQYiG35qoNdgD2TsvHi8PwW9yKTORwBbhXbrpDOLIlh
	 mmBmoxoxA0laZW0wCG8AfZOwptwb/3N6Tff4HmpQMhC+A7ADjyLppy2MRXxIWIhlY0qaC
	 nv8Jz8Ehl7lh9wD5D197CXGlGsSlMSqHDaahHKUATDLUnMpvPNJ6pOlZHqEHy0CKMEC+X
	 IDZdbj/dN4ncVztrlfuxkHglu4uJ9/GRbrxtOQtZd9aXLtMc2LFsgzeFkDmymrBlVMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793028352;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=c/MQjvVEIaGIIhFl2Ewnuj39H221k2u6PHHaq/5GTO0=;
	b=vGnk/q2IG5BiHCG9g/muqjgzbYRLJ+CCezvKJ8+rBRIdSK2LhCUjp4PkUu96hvkRVuyV
	 Jy1vjCj3lmoZ1rhka83usk7NMaK+gwIDKoBqFOG1xQzGwbXDdGFCDP3uu5S2NXykFsbgo
	 ZUiKg11LVb+xWbK2ziNtnaDGl6sxZNEQAD0E/KzCjBfKHkt+O+YAHc1PdN0EmRPU4yg51
	 vZkfz4eaTkFKoFqSmoi8ubS5bL/FDN9tdLpdLWPV7yHWg1ELw30UQ2RYwkLviKPVok+bx
	 IX7BJVYYCTy5Hr69yIv2Ewb5haKDYu+CunH7emStcOt5wlJar7pkBOWBZvmC+B125uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BCjv1FPk;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138F1606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:25:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 138F1606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BCjv1FPk
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so11468f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793028345; x=1793633145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c/MQjvVEIaGIIhFl2Ewnuj39H221k2u6PHHaq/5GTO0=;
        b=BCjv1FPkyBVCZwvsSAw+OzouYceN5Q2EkF8j3i/rNpHcmNSg5MWxtL9L8Fi/eS/v8y
         S+LoZxGEAzxeYH9iA41E/jD/zljQJV6LhWfOoTzzcmsJusxLxFUib/rjZzXn9Dll8wpu
         W2RwC9f4pY84bBccePLQ9xN1zcsAunpx9ykU/3Qa2SMAweZIaXauuWfhSvsiXId9i5m7
         ikjUieTG8KCKzbOJbZksiNychzJuXEfmigi4QejJeSdsYY+1gzTnEImrdO3Ws7poegPB
         Yb9hrn8pEoFXKigxh4j9nfebjwWXN/AovLUGhVJ3XFzgv3PEQhy2c2hXoY894V49QXoq
         cNaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793028345; x=1793633145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c/MQjvVEIaGIIhFl2Ewnuj39H221k2u6PHHaq/5GTO0=;
        b=WfAIGmVEbhbzOJFxaF9MYQ7a8kouEDLn0NFlJtgf6UUHE4vhmoe8pf8IMJsz5C6kBg
         DBXexRJLgB7fGTCRGErZRBYD25Zg/Z7xgDvC0X+I6TAVsdfraNk7SeIS5y39XLi8xXFe
         9s0QMtKCk4JIeb8bkCwfveTIDEzGjxTcpF6tI9/Bj1L4BjivcxJrQs0r/wKmmf60urGS
         LejjWGNTrZmswIBmPRG9lES4jx/LHNvwB578+a/5bt5dO/yqFQOf13V6IgifX9B1Bytu
         +fLiwawhGMYXyOWCdgXgcWybjhL0CMxvlTIGOAMS95ppW9kG1pjvKqOFvpwFgCY2E4bO
         tBGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzAcpteastByM9lqDP9kTt/NDrqZ7NcVjWhgwvQdvNjEFRmmM/nfyM/7jUP0unhTPc7EpjGk1qLf130VJo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYK0bwtwa149Wy578bGCOlEaP8KmsajXZ2aJ7RQZHtzROKYjwz
	lwWdOyhSQo1P1XfkfeKKFn05v5EvVgGm2jy2ii70rIUc/6p+9wpo77Sg
X-Gm-Gg: AYBFou0GFQz+T61KsEgPdR96C/DTJpexGsP2ESCntZC7V5y9hEN1bQNvFdffLv1nA4t
	yN0aMniexmKZG0l4GjsDReKpJFgdMyyT33ncTfc5a0wEnqAd0UzMmR3GKS63mj3+gfrkf4rqH4O
	kyt9aM0wvQMuIKyPLvUKzHJQ7gbjI+H9ZzY45cor5wK4yVdn4OFYPM/ZOh3iDG7MTOhs6QM5c93
	HgCT8KT0ouglDQTkBELhqZyh3QrGQu1YJwmPJjE+XHndpiyUSSwY+x6EDE0/F2qbr/J+fQ9wI8a
	AdjWm7DmueL99vVaCRj6BYpu+3O5T+ydsvAAuh1D1Yi7pruSWFB0sHHO99Sy0c3s81IHYEE0yxq
	ygWvl3ENBNycNV2qKS8qOaHKRboSDg7k05J4yWbsHdMRrdPeN4A6qrpfhNdQyawB22840WcG9YT
	EOOOiroXHr2+ZgUkbPmwjFH5eWFWsdltGZK7qSmQsSFGh77LRQGet8/YEfvl+1ipcI1+XYmTQf/
	kItIvSL4KMIdT4w091fZ0GtFdnAatF/ULAOcHFkMMYDJAj5cfj77cGzcDZEr2Q=
X-Received: by 2002:adf:fc4d:0:b0:48e:3c5f:a24e with SMTP id ffacd0b85a97d-48e3eb73979mr9752906f8f.11.1793028345178;
        Mon, 26 Oct 2026 08:25:45 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3705sm20057337f8f.45.2026.10.26.08.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 08:25:44 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH wireless] wifi: mac80211: abort chanswitch when leaving an IBSS
Date: Mon, 26 Oct 2026 16:25:43 +0100
Message-ID: <20261026152543.1272978-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <c8bc5affa75d7519b424ea98c07c1d6b65942347@linux.dev>
References: 
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

Hi Luka,

> So if I read it right, after leaving mid countdown and joining again, the
> next switch with a countdown now gets past mac80211 and runs into this in
> ath9k_htc_channel_switch_beacon():

You read it right, I reproduced it on an AR9271 with this patch. A mesh
point hits the same WARN already without it, since ieee80211_stop_mesh()
aborts the switch the same way.

Dropping csa_vif whenever beaconing stops is too much though: off
channel, e.g. a scan during the countdown, beaconing stops with the
switch still active, and the switch then never completes. So the fix
drops it only when the switch is no longer active, sent as "wifi:
ath9k_htc: clear csa_vif when a switch is aborted". This patch should
go in with or after that one.

Mehmet

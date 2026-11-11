Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794396728;
	b=y60h7ZZ+WDiMNrAoBmUB4n7CbskJXGXlQhWdaIQtDIPBJsJu3mAJEgeMYD5JJc+jgzhr
	 oevRq9yqNjM6b7G73b9pV9uGU2Bf3WEt9nLbBiZsEsO0d2QOxoxqtuZz7rfJSjzc9zpWs
	 bPmAOdFrD7OPaXj9NVfXHX3fiiCgviZ0hBUMkwypCcHn1nai6sHRrKOAPUo7zn822W7K9
	 TRZAxOMwoO2q0Cbt/8vOy49QqMisGsnwHcSS78Km0ryihDAy/PXBzqhvtfRnfaWo4USbC
	 NhsjScfCMMEjvq2avPNp3RmLY7+NCdnUbP2BgCGr907zaD/lxOcy9Vd9VuXEW063V8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794396728;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=VpkJYJaK67uI9nRJI+Hn9ZolwDO1Hn47PzK+oblw1iw=;
	b=y8XW3/wKfOxsvO1f28B3n9Gk7OUvgDSWYfvagZTw99KkJ5rl7hck5copAuEm9SUgcLp6
	 FT2eLh5EL95vAlqPluEsNqtKoBwt3Wm/q99vk++0BaczQ89QMSjg4Ms5uJZdzKTjrmSGy
	 8L88RJRbdBNG3A0AzryKBTwA3iHgYIDPl/do3WeqBaptn/hGeHyYEUknfYAhyJZIl4ITD
	 xfGdSkXPcWo/+wW5RKxs7b0Z/tXTtIwYdDZgeFBTS7mkXd3c/wO/DOEeh/6qyhatWHtH0
	 xfEzT5WlrtRn7bN6DfkGqe7q3MB5mR0PJjXQZd7eptcz9IQXe1D79GqgcRkAvTyGf/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p+D000AR;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3316C606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:32:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3316C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p+D000AR
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36e90071735so74117eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794396722; x=1795001522; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VpkJYJaK67uI9nRJI+Hn9ZolwDO1Hn47PzK+oblw1iw=;
        b=p+D000ARocQCD5EsUXfcpQ7KbC7A8NCdtezE0eeiKruNIpuxsEhmuEsr310yKjhdxY
         VUG4gMh3dceBBAHnFiNlWKGORAla0RJfZXQSZ/Yjofh+1p5iYyNFMbM7s8HNH1aYJzSo
         m4FJ6qf1TAE48ciLAcv+Ud4ZpeLA8rr9LgGHE5bjagT3WZ6ACZ7CHenV+qPlOlujAOAP
         TwjaK7Lh9CCdwRbEXuVb7zmLFqUuJ13k9mHE+2o1N9QNrVd8W0GjNhSrJOyiEW18B0E9
         ac0tqqGkAUwJGb+UVeMg87uyZ2GeYzh2Gsh14xOBxuVT8cjq7nPF7pynE859t6oP2F35
         Ip2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794396722; x=1795001522;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VpkJYJaK67uI9nRJI+Hn9ZolwDO1Hn47PzK+oblw1iw=;
        b=KGD4WC2CezYZjn/bINEack8xmcSu1nOrhG/uVGo1fwj95/9BBZphARUxUCpot1waOs
         tMBDVIwQrs8s5/N+XCi+0e5CLcIkUrSYF64GOgBW+IbTlPzqngEXCMZ9GPUY7nwzuwCb
         kB5oAH7fmvlaqpdHXkZ0qcXgk2QDFWLuK+DcipUZLBwdgez5Mkyn7aeGkiGBxO6F+qeD
         c1gUEU5J9SONush1QpqsUD8y4kCuK+MdSksR9z4NGTsqyfUTW7yJA7RXPnNwVhFM76Su
         UGXNZT6ae1qw0Zm94DPPh7uJwuZB3bxmcMsuRrwiJ0wA7SCqxYGscJp7CVIrQIk0xNYd
         krjg==
X-Forwarded-Encrypted: i=1; AL+hErGo/uRo6YXMvIrPpqTf8KqFOZ3xHNwb0pQkTquImNcHEM+GNU3XOhlEvjJigg6dcMQ1gtbxS2jwu7HcYpw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pFFIFpZRZVFQgoCYk6u1Cqp+M5hxC36F0N0AIDC6UpIHEeHJ+
	uGjE+F1UwK442V0YR6HPuLJ65xRD4AXrL0da/jxAj3/LK7A+5oXzePAjHbAuJ1CuODw=
X-Gm-Gg: AYBFou1/vFIn3l9n6a9mIhwLxH76Ho5aFS52x2kDleh9vcXXFaV8tfJFgHj0ZGqQki6
	U57J2jBszq56o6JT2t6CgC8/xfAujNUVyLdHEi8MDK9KFM/QdVjbT5k/OXPj+qDoUAhuVzjg5+F
	NgyrmwIavAd5hRKXj8wK/nlvLSUZbYs7y+/4YDYmjQ31yL20ByjZPXPwjAI/YiybzQTMzeprHE8
	B6bibgaxdzs+d64YWYGjiiG4gEtj9HpZ1FUULt5Nvfyl4GsPzxmplXgk3a4TS10eXYul/hN9Zom
	3Z32H/E4A4OgtA6+2uBFMOis+Sg1Q3cztqPAgFFL2BczkAjYKst+LXoAZ+ELr6/EOvNfGEtthSl
	aqDdhaRDlHqDktTYJ5hzqNUX7G89Y/mk/hRbmksCWUaMs9EChZ+egoemBkZ0Ru5/sTzvDE7aWSb
	nTmE2ElEinC+Ybuq7l77PDr3dcI13fqUGaE7LTQnWA9saxRG11RrIhW4UXrdjYpR1uRJm/ybxj4
	yfj+l04matv1fQN+R9hrKT0ZbrN56dzAy5jJjeVPKvZuNFWNXEv36w5rb/J8mmG3/70PleHFQ+7
	9HSDwVSSfEpzQzOwJocl4bxWGZZ5ZIv2XFr/6Usq/GBTtQmse9EtqSEpnOE3tndjOYI=
X-Received: by 2002:a05:693c:20cd:20b0:375:f846:5b3f with SMTP id 5a478bee46e88-3767fe8f34bmr4140295eec.0.1794396721865;
        Wed, 11 Nov 2026 03:32:01 -0800 (PST)
Received: from o6.lan ([2602:fce1:44f:115e::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375218c7c50sm30508177eec.29.2026.11.11.03.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 03:32:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 2/3] mm: remove CONFIG_ZSMALLOC_STAT
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: Nhat Pham <nphamcs@gmail.com>
Cc: Xueyuan Chen <xueyuan.chen21@gmail.com>, 
 Minchan Kim <minchan@kernel.org>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <CAKEwX=PNpMr5x4gTo_OK5D5EgKPDvZx2e2=95-4_SV8zq37VnQ@mail.gmail.com>
References: <20261109-zsmalloc_stat-v2-0-caee41684aba@gmail.com>
 <20261109-zsmalloc_stat-v2-2-caee41684aba@gmail.com>
 <CAKEwX=PNpMr5x4gTo_OK5D5EgKPDvZx2e2=95-4_SV8zq37VnQ@mail.gmail.com>
Date: Wed, 11 Nov 2026 19:31:57 +0800
Message-Id: <179439671723.2142163.87241960983612244.b4-reply@b4>
X-Mailer: b4 0.16.0

On 2026-11-10 08:03 -0700, Nhat Pham wrote:
> On Mon, Nov 9, 2026 at 5:59 AM Xueyuan Chen <xueyuan.chen21@gmail.com> wrote:
> >
> > The statistics interface now uses the debugfs API stubs directly, so
> > CONFIG_ZSMALLOC_STAT no longer controls any zsmalloc code.
> >
> > Remove the Kconfig entry. Replace the remaining CONFIG_ZSMALLOC_STAT
> > settings with CONFIG_DEBUG_FS=y.
> >
> > Suggested-by: Nhat Pham <nphamcs@gmail.com>
> > Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> 
> I wonder if we can just squash all 3 patches lol. Anyway, LGTM:
Haha, agreed. I'll squash all three into one in v3.
> 
> Reviewed-by: Nhat Pham <nphamcs@gmail.com>
> 
Thanks!


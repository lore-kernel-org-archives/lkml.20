Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794483649;
	b=3ZUZh92uKdrgPz9hjqeBBiVR6mTEBoORGdZGK6/HXa6Kmnx5N/9ClCy1IY7rL3AhgnNu
	 74RPB2MlKAq43ciuuOoUyhIHZYcjSiFIIZJ3nXwJiuH4by/YtPzGsqQ0t0c+Vam2msdQA
	 nVueDf26oKh+xvzZCcNMLugmYH7kFKfMz1xQY9E4FsvjUsF5QqJFCxg7EiYkaURi64AF8
	 Bu3pYNEwiQYtRen48bH5fQ0ChQffe2uetv+BkX6MTNLwlcaUPNBhQURmpOK9hUh2JTuH7
	 eq+2k6856ODuEXOrdJ1qA4uM3VfjWD3UlJ2IKUaFj9MeyEXzo3ObC3LSFRT0YMD1PhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794483649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=YeWP7Ew8IEw8W3Drb+1wADQhHaKMJ5pzT2VKjpcBucw=;
	b=hDgaIKbI91cDb1vcgUujiB9h0NRPr9n+x07mxco6iYk7KARXKVqeyQ5ANQtG82zjJ+pU
	 3uaIZQTD11TglDkdaMplSOLxvF9iiftdLYW7YSs6ZlwBgQwhZLjOBWGMqOsP9ywOMG5Ks
	 tjpbykD8YLQT1VY1tjT50RqsfM84Q9g1y3EuhK4c2HulpDCaqSur6FdxOVq4L3IWYTAOV
	 pC0F9CZj2hdQzeK4wlA/yaVfYUfwz4uKL8Q/xnFi8niGhH5uBtWGzeFwbArE8k2wecqKO
	 BMPpZVKGZx1bTSBkEIK5gzZFs8tGYaXgkOoBhQ7p6AGYx8+HynvtTbP3b0RJhvuNXkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M9lSSGlu;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFAE606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:40:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFFAE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M9lSSGlu
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3704d30b84fso5348815eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794483648; x=1795088448; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YeWP7Ew8IEw8W3Drb+1wADQhHaKMJ5pzT2VKjpcBucw=;
        b=M9lSSGluC9eUBh+le2/2HSaG4obwS415fqaTTfOC/Frn7T52MMUAP056NfK7KWW/zx
         9l52BkP1gdUFngvBcU934Ca2JsCItBYW9O2KBGmiYJZ56+JxorJ5F2D9Q2Y/RehO830p
         25hQ885YT3wbx9bgJg2iX2h90wIXDZ3mEdcP9M0jMCELOMt1sfmDTm7TDVcNJsqoR8//
         BHRmUhrrkhTe6LpYtpolp9NJPDUdmOo0XPM+UlSYWv3jOwKVNnLaBXHpLaNcwa54WS9v
         g/dAo5DvM1qHF+xG6yRSi20/SBiCVwd/5yFsyzNCkCi1tPbDxQNHL+r7440biVIAXacw
         zEdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794483648; x=1795088448;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YeWP7Ew8IEw8W3Drb+1wADQhHaKMJ5pzT2VKjpcBucw=;
        b=BMAVnqbAb+pRULBc6FpsoTm84AcEql5ubDeZ+OeiTNeKdd8AHNvWX+C1gXMpm/89aH
         sqTTW9+ZX1EZr6bkQdybL9kMQFrrHsGcpBUUj601o6uJajy4hXiv4WK/KlF7rqZQgaTZ
         nfgvnttgapOABYDB9HBfHEqRSSpMOT1/uEMkR5mUTB0i6Pj2bVmKx1wWTfcUKJsE1giE
         BbKYaQoO8ytoMaAazoZa5KOxyjAAw9eI+w3seNPmhZ9X4vD8DRePhGOMkx9U5XH5WA0w
         grCQrXo4nz/QkBULsG0S71TXaVvgHyatBcgEf32v+cZPSNqpOwmKaSGGiqdY25jZ8MMO
         xbgg==
X-Forwarded-Encrypted: i=1; AL+hErE2Lbx0WYSpFyCxOJ+J+4ktCnhxa7agIwevRnlpwoCfBShdQRvYevVxZpkEsp78ZC+tQcmar+ZbFzLdLA0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6dvNdBpvZ7Z/fYsZo+erzB1MiwUaoSpWQmD4eDM/WcM32XRCX
	C58Hc7TlfnenKPK3UZ6aD1U0ysv3N4DNW3qau6Dg5dKypalYlEjzlHy7
X-Gm-Gg: AYBFou0hSkYDfQUBmPpaaIhaStuUSWpB9vkGpa+R/nLnSA7dmmwnyQhJ9tK0WF2qFVs
	ozEv3iwgsFVEG18uxy5JUeMe9AoKL8+8ZCevx0Z/VsIElY0G1696+7LEkVkRNu6NuidxlZUko2/
	CF82dImDidINXYv+9ujs7tOdlClFLUGZj0MEw59ai38pF0o0fYpjlyWwYyCTtxnD/wRdqghP5vq
	TIuLY2VNrBLAuKgwM0JvJRhXIYeGa0//ZMTyDnbAzVsxn+Cj49qO+EtaW/fbtOH1oQ5Y5KyxaMp
	hkFvf4S6RWDa17YMeXWJc80PmBV/asQkD9zCZLK/SBl5gAUQghGQTlMXZkdSKzYS7iBM/lSkXP3
	WnTqRpyGxTBhZ1LZd9hmCNhZEzN0Gde2EY1bNq6A2fFjY/bhmCRqN1yWbVcqVWZMqxXKndnMraB
	w3dHrVdP9EDIQCiiLCe83915RRAOtuAq08CqGALgEv22fjdQ+9lJg2zVbtmVzclPkW4hLujSFEc
	jH1ABxklJIIZFmaywWc8pI2Gy/eArWrzMkcfELsD5RSxHmLbOTCUIL499ItSfGxie1L4gM98yk6
	ImZAiZOEmbQLjhwQdWPJu4a1U94UpQqNaKLrTX+QZZg=
X-Received: by 2002:a05:7300:2d2b:b0:36d:2704:6adf with SMTP id 5a478bee46e88-3768579df8bmr7841678eec.11.1794483647847;
        Thu, 12 Nov 2026 03:40:47 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([180.67.33.100])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060dc0csm29448853eec.14.2026.11.12.03.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:40:47 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Val Packett <val@packett.cool>,
	robin.clark@oss.qualcomm.com,
	lumag@kernel.org,
	abhinav.kumar@linux.dev,
	jesszhan0024@gmail.com,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	yongxing.mou@oss.qualcomm.com,
	Xilin Wu <sophon@radxa.com>
Subject: Re: drm/msm/dp: hold one runtime PM reference per plugged state
Date: Thu, 12 Nov 2026 20:40:46 +0900
Message-ID: <20261112114046.396-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <2ndbj5fk7tnmexirfulh25kwx6pjzsmp7vjczbhqdxxuw3fm5u@qx5qumdw6ng3>
References: <20260929130627.959-1-26rote@gmail.com> <018c6fae-49d3-4f89-8212-8c6b64a2829c@packett.cool> <2ndbj5fk7tnmexirfulh25kwx6pjzsmp7vjczbhqdxxuw3fm5u@qx5qumdw6ng3>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, 11 Nov 2026 19:13:45 +0200, Dmitry Baryshkov wrote:
> I'll fix that while applying

Thanks. Please take v3 [1] instead of this one, which you also
reviewed yesterday. It replaces this patch and depends on patch 6/9 of
the IRQ_HPD series v8 [2], which removes the plug handler part.

[1] https://lore.kernel.org/all/20261024051952.2006-1-26rote@gmail.com/
[2] https://lore.kernel.org/all/20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com/

Thanks,
Joonhoe Kim

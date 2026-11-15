Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794757433;
	b=FxcPt+VByvNuvzf5af/3XjMNMHYU9Tzw754hitdw1Ojmgjc+tQQqidgSPORHCPweU26k
	 o4swqY6UQLTWm4vCT+8zYxgIwtSDvWRE85rMmTaWu4Qe/q7x3yt1yCFCldx4EJLXZLd4L
	 Q2+oxC8xZccHaKEHexKbsmhHJ21hORiIniPyMrxp2ZSGLAQdwXRTqEgNLfFpzDMWXEKGG
	 GuJpxyNDQ2NNddVO2Qh0aEZXoUY/gXY2o+9zmIpBDlMsTEVXf2GKmDHaJuZTbMMmjrqIn
	 GzHnBdVzYrZOwlxn4XiHtih/WYC9jqzpXvh+oeTMEhRi+MCaxolVdEjq+mZzgGeI+EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794757433;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aQeEqSqLx+Kp/30sy6eZjaTFG/cEmbiqOE4nLKGI28I=;
	b=jJAfRTVYZpZiD5Q27qrOfuwNPHqmiC+G9ILnK6ZMK/jeu2K/mjRYF6TPDpjVJkljyT3r
	 Lx88iABOIaLdSFK60I5C1mLL9qn/xSQM1ZRGO/jAzg5e7VPu3Cj8FaY1QMBdWNRBGjQ7p
	 lBAOcMLrRSDkM8Ko3D/BfTKa35iNvcqmNRw1byJxL/7jfmNew3r/ybV9UjwvJj6CS7Xio
	 gd0ccZ/Bh9p2end+ewQZa3Y4a9e3iKkvxKr894R8y3RFv7Gqgnd9dDV75czViQ6soq5gt
	 SIfS8V5tIBFH6prPLzucLhLCyVaDaMz6FKa7A7yja0825wn3QfKUYIRhRHCz23UXELQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LQW6XtIt;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9966B606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 15:43:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9966B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LQW6XtIt
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33fb4680717so7464420eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 07:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794757432; x=1795362232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aQeEqSqLx+Kp/30sy6eZjaTFG/cEmbiqOE4nLKGI28I=;
        b=LQW6XtItJ3Y5xPLhFo4UcMi12xncRFb02s8hw5IpcQ4UQYFYH5ckAqv1dyx9T45lRW
         ZSNu2rnDwQZZDoBw2S1DuVj5B+W3BMG/jSTBz0iqnMtWJ2grChQ/hDUujfF3VyNMkJiE
         GD7U0TitCUXks1hTSWoQNdLJz8/mNviTk8+fR7/sLu/99e+PVejqdqkTztOnhhorX775
         2sbrCiQlBanwrSNt9xPx2UkS3miIbm7iRRG0tqJ8K7OOwV+N5RfG3PE+yZ8KkcLiD4JG
         Y7HwRMPheKpvy1EtWFxEGz/5i5hff3BLjzfN604qCOAiZnFEc/sV9hRA6LNpQ+33HiDy
         BAaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794757432; x=1795362232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aQeEqSqLx+Kp/30sy6eZjaTFG/cEmbiqOE4nLKGI28I=;
        b=yKuYs17COnZ03HaLfNwQ05OE5kEIcEgC0Y4ZRpkgY/hfpIaSuUE+0xXwiVXOEa9oL/
         v2+lPf6XCXSQbJBuk44ZdX1Mt33LOuSavRlQ4qMriyIlL+Bk5W2tf5vBn+EgXtjtM+S5
         MJvrT6BrG2gkDOovyFNp5I2Zo6Np9RTFgRzG9pqYLMLWiOxnOu8qUL0VY486m6E014+t
         axEVP8CYz4Gq3WVnhMNoRjbo87R65Rl2pwa6bwxmZIpc/YiFrcLGU952oaOMdodsNPxu
         po7CohHTFB7OnPWQVzqct03WdgTygXzjj5FBTC6vsyUeANbodaPE3x9aiHTVK5ymUHRS
         wkKg==
X-Forwarded-Encrypted: i=1; AL+hErFWctegvTv/CV56KuHfZLresXx3rxaQu3+LaLvLohzxqUIecLkn48wg2wcxowh3wwe+UdpIBKa8Tfllbe8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9M3Uo3HMYKgMwt1e2NYlNV7Mrxx2RR9cDF53j4cDyNjgJH9YTc
	8LKTE05zZ0PPO2ih5lic8MI7mhCXJfNAz9u/SWAGUAel5yq3li4DMd6W
X-Gm-Gg: AYBFou0jGm37LAulZLPyfsy5OAGVlpCfxwNlyFVa3LbTRtMzO7d3aRF2xPO86if82xb
	mH2lk2vagiZ2YXJAJvcz33whx8TiBGPkQ1Fwa2byKXTBWur39kXCh5hEffbBrh3AaYPB2FYuc2Z
	E8n6imFKhgYnDiWvzpO/rrpusiEfFBADDC9h7YvBJrKijXvzsx9Af866bAE2QXqZItg/RuOJEk+
	9fdGmKbv3mRJcFaKX55blGeGQWfm/LMj/4799PmVg0gazFcnLUNjNmf71+IgP5AsB0IjzybA3S2
	TG0OryQQvwbZRmVh/HTYWNJrjsRjm7k9t/aB5SLMi/hCf5FkA2hKj/wq0Wwf3U8FDkAoTb0YWmW
	Gc7bcNGQGdCMeNFyvpmNQh0NWP7wKr8nJhr6lTH+BJ3jBeFqjM/9pPfx+oRrQ4hXv4vhVZlGw4C
	Vrper8DBgGPdeGpeJ8BMaxUrmCbak71vDj3L555mgSlPT+ZknMwOlPL4ssJvZbnFL+S84+uvIH3
	fhak0Z37NywcgB4eagGphNM+ZRSSSKljD/ShoiEWX50lxEogGfU8Ybxtc0m5u8KIWZhxoTmTJ2j
	Ba89dA7p3dqPF9IVElQH0LK52Br9I3+wmIchyVR3p1rBkk+/O6wjowy40Qfa
X-Received: by 2002:a05:7301:52c5:b0:36c:a281:1bc with SMTP id 5a478bee46e88-37966a5ba74mr8291604eec.16.1794757431228;
        Sun, 15 Nov 2026 07:43:51 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:d1be:2710:af83:9beb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm26224242eec.13.2026.11.15.07.43.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Nov 2026 07:43:49 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH wireless v2] wifi: mac80211: parse wrapper TPE elements without an extension offset
Date: Sun, 15 Nov 2026 23:43:21 +0800
Message-ID: <20261115154321.78691-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <CACHPgzyxGEYJVCyGH6GJBvUdqG8zsfyRn5zxDiuj14tw3byXBw@mail.gmail.com>
References: <CACHPgzyxGEYJVCyGH6GJBvUdqG8zsfyRn5zxDiuj14tw3byXBw@mail.gmail.com>
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

Please do not apply either v1 or v2.

An agent used a Gmail connector to send emails during read-only review. It
sent v1 through that connector, then sent v2 without authorization. Gmail
line-wrapped both diffs, so neither public revision applies. Please treat
both messages as invalid.

A clean v3 will follow through git send-email.

Thanks,
Zhao

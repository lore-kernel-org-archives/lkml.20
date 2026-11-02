Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793630893;
	b=ZVgN3OADqhI9vjoC1aNG/F6ow48jC0n4E2fypVkBVQ+btb6IRdY+NUh+PvdcfsqpXXsj
	 xaxFu4EJpZ9vZs/r1lGzD0hnb2vuyHKo6PPDdjBV02hbR1urlrKrenisXSMWnLBOFo7+5
	 pPgM+x3YcVOywt7mJs8rroeHKjtOAqlUZX5Q9aDWAaedrZm9xbeU0QQT7lar/f64Yo4Ed
	 9JHeQWv8iOEjLko9h3cE9oZm59fdrQ+RX8SBzlSBHtbtW+ayBjFH5RYq0Z/K+sfBOYPf1
	 iGUojqd+qvrEuE5gT5tA3alx6fd/thC6mIA9C5emuTFAxteriyFkiNPDEOC3hQWwfPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793630893;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3pFwihf4OYIQkLrMqzaVR206v3bx6SADN/xgUl121K4=;
	b=XBqLYY1jGRm90oSjLJuFgfgiK2/cnrk+VpJuS7tFLpGjKg1zSiAL//3H4/ZoHgUytYI/
	 ZlgWH9sAK77NHBs6f6dYySLHOJhhY750wDaOxSquX8gegZZNc/YHMsodjrsYPjfsh+bZY
	 c1u5ciktgglbkYUmGq1Bw9oClTd2Kr2AVJFFXiL7mVqH4nZxPQdJYnZ0RGRYnM56nWdR1
	 UE4++3ixUsGbjzA7WeClEhR+/JPj/kotoFDhXrFVc+4KkeWHUKV9B0b/9sDPEL0ZXQlRn
	 ke/9+54um8mDAyfbG+iLANg88r2L3baDllRHIfYllwa8ql6sx4t77jSQ/DvX7d8nCjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y6xFp2Hn;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6177606AB8D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:48:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6177606AB8D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y6xFp2Hn
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36a315ed211so3776995eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 06:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793630892; x=1794235692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3pFwihf4OYIQkLrMqzaVR206v3bx6SADN/xgUl121K4=;
        b=y6xFp2HndvqH+7KbT6FlWKqYYXmGnaw8yV5oCA3j5x5oIrnGxUXebmo2/EQHdJm1ZW
         yvt6tNcAQu8yY6jBmUFF+FuHAF3D78xQUplQZWq67w2PdmO6fES/3F3Iv6cX0Pp8RJgo
         1UdTMDnL/ur6BMYLGyA1U6Z/SxTg5GHxF8rS4yxrv63ntQkJaDWMa1539TUyPL0Tj8y+
         zGVJ7RLDxFGGRJM2yuk9Lrvck1BMllEVLLU6dzN/NYfNulpi7F3os0qjqvOK3z6mSdBX
         dSzp17Jc2goem91Hemojdw8p2gvWO1o/NNzXaAGiJ4/MpiO1CU+entVD5P5KsOGEUzjK
         roxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793630892; x=1794235692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3pFwihf4OYIQkLrMqzaVR206v3bx6SADN/xgUl121K4=;
        b=MlzI18fAaaDF40O0WqpLIz/kc/XAv0O8EzJcYRtpCMQCOlz3PrrPhjh9cREjRfV6Lt
         ZNOjbtj7KdZfa31vYlTa04IG4oZKumVrsc6z5Hyn3GqMyV06pYbyFXkRlMKEw0vdq5cj
         tK9Ydm0WzfrGjwkatwxWzoU4YiGUfg3/aqpLGMHT+xN/8DgKPfFU2qW7/nXRwPbDrffm
         2fHQa9Lewz82R9tUXfsTn6wZBAFOWo/MA52SWuFqyx+jLsB7X7lp8WpAjPYT1wU7nQ5K
         mBB9QqZ84r1K0SVmAlgQjLGisOxnKgIdeMVYX7c9dJTlxxjSXmHJCa8bgzSFui09Vpr2
         R5DQ==
X-Forwarded-Encrypted: i=1; AKwUvByxyRtKAXLoGigwqQ4ah2TmcjOWRviNH+LWlg/vWbgKLwATscjU7xp8SAWNNsAXrDvX68+4p3smmJkNh6w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1h6FD1TSCwddKcDK5r9gDJoyJX+eJqdRoPGu1Pi21w0EhvvIf
	Njd745LbZlnyScfZ41hTkXyA7IhXKa5dwk8tLLe8oYX5yLC5ITEDZQYm
X-Gm-Gg: AYBFou1OUeIPgBHG77sMSrOImKICy8Pn7MhOGcOnW7qf6ceqFwSS1V6UsykO/tMo8/C
	E5ANPL95s7/pk9NSPHQamg8o987MLx1OsL7KZ6OAPGUhJ5o9yMczCbuBwlVwWmOQVExmuJADAv6
	Uy8I4YPtDWTfrt97R079CpDXnzIM2Oju/IY8v2b1HtrhHwfg+lT3T9jYJ1SrDIioJxoouTXMXdF
	D046sxLot86uSG9Fq8FylUEHL6HwilsFdBrpNJ+Cgt4ONuFBilU3AT6RweD6SlpDektnamQQWBc
	/SC4eKad6tKuf4OqfQxH+Du1vLTPrSp5EoXWXRK7ufclsEqnVVwB4JHIvK7Ums3vfdpoRlF+LPg
	XxGI/u2geDFlmeQ5Zgft+UzlmKaFUbMIzvS9G9Ib0n0aCjgT2PZqIKG70b4s2QxmeqtDZAG54/P
	l8GC9bXw1HAMYdibiC0nHYX7vv5XtM6sMEKDlnGrrkBBjMoLgu7NaXsv1RQE0NPoNxjItewcKI4
	MoU8XWHbHX0Y8+q5j6jk25LqvtBy9/2JsVPUQ+4/T5CGU1x6I4VXWMtpY9KOG4aI7Z45TGk27gK
	zFzkBHxNZb1Vgx91ljnSvItd3tGusxcVYWTkWe3iVmTJdbcVSWRO
X-Received: by 2002:a05:7301:f8d:b0:369:f1ca:5b24 with SMTP id 5a478bee46e88-36a42389011mr14274813eec.6.1793630891952;
        Mon, 02 Nov 2026 06:48:11 -0800 (PST)
Received: from localhost.localdomain ([103.178.205.93])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4291e38fsm44068418eec.15.2026.11.02.06.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:48:11 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: cezary.rojewski@intel.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	rosenp@gmail.com,
	sreekuttan2156239@gmail.com,
	tim.bird@sony.com,
	tiwai@suse.com
Subject: Re: [PATCH] ALSA: pcm: Fix source frame count calculation
Date: Mon,  2 Nov 2026 14:47:36 +0000
Message-ID: <20261102144736.3679-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87wlqv8ftw.wl-tiwai@suse.de>
References: <87wlqv8ftw.wl-tiwai@suse.de>
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

You're right. I checked the callback implementation, and 
"snd_pcm_plugin_client_channels()" always returns the input 
frame count. All plugins created through "snd_pcm_plugin_build()" 
use this callback.

So the condition "err != frames1" is not reached in the normal path. 
My patch is unnecessary. Sorry for the noise.

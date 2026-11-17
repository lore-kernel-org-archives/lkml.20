Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794918304;
	b=2ws7rnFsU848zXK4HkmwtxTR2kd0rQbFu7yeqPO6OGJX9ft1Y5KMYDlHL/exIGyp2rRk
	 ZK6PH9Ro2cXGnvS7X7Wje3NpymA0+kl6/ZkRVfN3elOgXTTO3EK9mCeThdhr8+hsPbFGv
	 3jlKs0rda6MZHmWjBkXoKFXYIg5a5YZTuev7kZqCwB1vNeK1VKN0Bay/AsfFjhOKSkJf0
	 WgvZafVzZb7wZfLkZdEnIwtekCTwl3x6rw3s7b2i9UVTDaniOgfeux5c7RlNH7tDiKPlh
	 j2GFD+PXzd7lO6bU5DiMcvGn1VRbe0qQd6YVqKqiQfqaTXMukhqAexlJEj/nRf6wcGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794918304;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=597o+fzVRa6upEiwDp/AfddNGeB1lk6wR6CKlinIETU=;
	b=4mg/g/6puHEH2HUHi5aRHQXi11WYr380IQ95f5p4l8s6v2iLbvJ3wW7Hrd+9zWoA2Nq9
	 7GVoH5PNtiJrTbVP3vsGndGAVo8JSmqTHiWQ7Ry1vqZxkCa9jelKghjDJSampupHPwMQY
	 spwDUG+zDXTHVz+W2LDBYHqk0afYdlGWs4cpsK8Q+6+uhbyAkp1oJEBKvi1wfp3+7SMOc
	 /PhUBL5gu7KG++8ido1tOERNn4LMKY7vQLboqjc1oWo3b39qQsEi1k/9/V2H3jo0inwrV
	 9/ZBJRE2hDnO9ohvg/q7YNfFcwTzlEsnYDk1mtTxOI5AxRb/rQm0JCEXqEWDAkhnESQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G+ycRSf2;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7469B606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:25:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7469B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G+ycRSf2
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so5380501a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794918304; x=1795523104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=597o+fzVRa6upEiwDp/AfddNGeB1lk6wR6CKlinIETU=;
        b=G+ycRSf2Ula43Yh/kEvsvmD4oWnif+OT//3vYs9KhggfF79vBUPXqhykPZIX/AaNJT
         Vk/vIaK0AbsgLH9n9j7vBOHXz8NrtPRKtFd8vSgyL/DnCzXnlarteIV8C4kBFWkl9nzF
         V74lpXC+9Fdn35+ZsdKTT7SszTJe5kv2RzYkqQ0WBPlCY9/mXqYGKqtPDsLQoyD01Hcp
         guFG4os5ptKp97uzmcvZYVgfMrXG3lwvNw/LXz75J8m4yBa0NIErZh0nUafK5QgWQ8PF
         mQyL6ZJZv1AG8p9p0+7+q3KW/sINMBnQQGSJsI8ddL3+No4KIN+zDIlQOWvjkjk2ayRU
         TMsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794918304; x=1795523104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=597o+fzVRa6upEiwDp/AfddNGeB1lk6wR6CKlinIETU=;
        b=mBUMYP5lCBdCTwjMpbPuF/i1asoxZReqnBecvTueQ3ZgmxhqmgD4AKmv46SSqx7xI2
         mAKqRwHT4lqDL9cLXVdDZ4+Hn6WL8mTX5tyVzd21BRqnloU8PxxB4oY8dqcs1+NRWf4q
         eLqEVLWHSB5EQp/SZ9+uCV1b6QYpWh5807fslnWcAEZrV3uk9NsMHprxqY0KrEqMVgUl
         7AXNxXbZhPGNIoU3iAxe0AumfeR3YQLsVfLg/mF34sfDRR78bRdvg7Al8eqWmBPcFQam
         yAf7yw6d0EUbEem/N0y1YGAgqz+mcvHgO+Ve83DvMPGdZQLrecggshe2+1S6dMmTJ/Ig
         2OOg==
X-Forwarded-Encrypted: i=1; AL+hErH3yBXjoehR+6GcKgsoStVw6UD9c3aCSUCLq+Av2mkH0D5EqdWZ8daIOLr/gXUFjBJJq42gwFgawZY3yoc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qqM8h97Y+kQrxLsrrdKug3B677/3rcOwC4PIejs+K1xXPAUvl
	Q7nTr28Cs9VEn0lmN55Js5JsfIQ+HXkWa6uU0z3IbKAUg64NxRLSwr1x
X-Gm-Gg: AZFdTZfOYA6OT/A1lCaTLtP6Arv50s4eQ/ytQNxyKQJgh8bs5bL0L1VFcVj+oKhYnL8
	/UJU3cmm68WPvwVARRmhNa3hd1A+USyjIOiqXFcGxg7puLa/gXKKaNED5XUlVZ84AtVpm8VsyBb
	VTFbZ6uke5/bPdx6YDPDXeQIfpGz7R8AxeeTMZ9+6kn2Rrt0W9U0jdrdvwkFVJYpF9kAuxS1391
	zxFuBDCoK3cUEoDXGet96jYpby3zoe8kpLiJiYEkeS/VSrA77AqCaZ61VUpVgNHliCIwUk17Jcj
	DOzFRgGxLUuiAiGkUcoZpj4gNCOAJsK8gev2yw4T9+dqFfo2z/i0cRzT6lKyqTL+aCg47gqkLNt
	QB73QMWwe4esenDJ02Wrh/XLzR9gm5ymUm1pN/1FMJnOh6zHcltPxwt74kmNgupKSjTkzaMxTIU
	LAXfG0fUG0bie994sYFa6AqaNTDqCBk3zy6wOIRtR5d9boz8k9qYkiS9aEuaL80w9SsQqNIp+GO
	aidDDGcT4KFUrpeUJz7bqG5WR8OmCdqQR4/xg0mOxD7fyqX0qpzP6whZCs0xxEgRV1ul5QnVoO4
	SfKvJQGeK6vuzh+63e4M3eAfhslF65jrcyywu+2d/ilS0YtkXevDmK33WM1nXy7akZ3hfDza3q1
	WF4FzhYjXKM+SUP7Deo7dDrStgtD5XBP1h9/55qJ2
X-Received: by 2002:a17:90b:54cb:b0:3ac:a139:1b14 with SMTP id 98e67ed59e1d1-3b1b0d39a69mr13351435a91.57.1794918303790;
        Tue, 17 Nov 2026 04:25:03 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac606d8csm4226371a91.16.2026.11.17.04.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:25:03 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Arnav Kapoor <kapoorarnav43@gmail.com>
Cc: HyeongJun An <sammiee5311@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] ASoC: SOF: control: fix volume, switch and enum value handling
Date: Tue, 17 Nov 2026 21:24:54 +0900
Message-ID: <20261117122454.2448997-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117105953.188645-1-kapoorarnav43@gmail.com>
References: <20261117105953.188645-1-kapoorarnav43@gmail.com>
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

Hello Arnav,

Patches 1 and 2 overlap with a patch I sent on 2026-11-14:
https://lore.kernel.org/all/20261114021730.2349347-1-sammiee5311@gmail.com/

Mark, I am fine with whichever version you prefer for those two.
Patches 3 and 4 are not covered by mine. I have a Tiger Lake laptop
with SOF and will test the series.

Best regards,
HyeongJun An

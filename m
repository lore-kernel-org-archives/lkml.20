Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701B04D5979
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792407409; cv=none; b=GuQEt4B4IlEEkuIqtbVEczRqdGtTiNigqzpoPfHxvUEcHybFlRS3sjmhL3gz81qGEc3L92cvRNLDYBnGQtAgiPL6I/ChauOAeNw9UZXvRBpgFBGFBQ4svKxFbco+Us1oXdVe76Z+loaoX73BpCH0wlJjZLue94EtYnWnlzLoMzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792407409; c=relaxed/simple;
	bh=2cDHITn9/rHN9K0ogaC3csc9nAYPxFcQwICaO2xLmKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mSHw8UqB6MTeAQ3lHTbfdmgY7TC0QyX/EkfKNBc8tEUuxb5dwR4Q6R2+c/K1TAeDoWnqlblEDkbmgT+Dm+xM8UG6YROxTIr8v7roODWzZ3S48aAsNztE87usruUHOmtauKWiLhKZdnlYsCFfYCFzhs1S1UJWFlK+m/eVqvpzhj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U2DK9xCd; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U2DK9xCd"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48df4f540ebso1018603f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792407405; x=1793012205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NeauCzO5ecKjHDuQguGvUZNFFmU3DC+5tCqSrByEIF0=;
        b=U2DK9xCd/PRX0rUCRuMM64RCP2NHv3hsaPeg9m2epUnTyVVbvM3dwmM5OiDb/O69YL
         76tYUtzvf/j5eq6s3tttZoe3V8D1VMZXm7IGEFCTTh+r0Fp6urlqcd3wz24kdtxp7b8i
         iyaIMn6OAjXt3sG/ACi6LtaDLW8jZgxwdJIlSIT8O2Q9mxvENwGUuzuKHIqgj8iilW1i
         2SLq1uV6Tn1HL7nOinHMCaiptRS6up5VrSbVBD6C/60zOdMa9I75FWjrCcTaeER570Wp
         M5cZFFrBVR4ts6+pQrK1yQpvsndKxhi444gkiqQJWs4mSYrkCc6LFaSTVUQs4b3Ue/VZ
         Yb7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792407405; x=1793012205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NeauCzO5ecKjHDuQguGvUZNFFmU3DC+5tCqSrByEIF0=;
        b=q+f6PHpLthVnC9tdLD9QUPGF7C//c5ZPUmbUgKVTqzhHuPAb+fUMHqqp4Xmf+NirzG
         qMARJOskqNQYd+YmiyHqP0MC9KQVjqPmRjVgEqwfz+iTsvbDW/M+bJfcemfgND2UL5PG
         4509ZCGKmpjyjmQTBA9+5E1AUsuhj0Zw5sMywbHh21HyaU9+e9n9V5sG1rRnZYMQ8Hbd
         8AZCmlW8aY0YRzsPNsu2JzGgka8fBn9fhrIdga5fRLYP4rrGpUK/GAYQoezbLWuYfFEd
         o3uducnEgF4fzUkxcCeREfTF0HObitAmBWLgHzlBGl3F0D8sFf21rYO2IYazLCzs2oT1
         FB9w==
X-Forwarded-Encrypted: i=1; AKwUvByj+fAvhFAlFC/w6zIGABaAPiNnnIOzVag1J/mhOaEFcMqh75fDbK5700008ni4oFXZ6JRPm0SjBC2PGLM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIRI61Epj8EYmKBE3ipeX5dntOo6dzKECeiO07wir48tFu18XFq
	dTnGIMny6YjbyLjGSo1ChPAFtXfgCrIPEikf53jvoQojA2pMyWoW/DXCEbkNLWpp3S8=
X-Gm-Gg: AYBFou3ijV0cB1dVNAPH1EAs7mt16e8XQaT+T/vU2uRf0b/FQXEoQjZnsInn1Gm3vFP
	7Oy4i16eXAaQdolHH+XWua0kDgsJSd9SSgA/3sxsZZ42jA/4pqVOpo+t/T9zdVd0077sPiiWzEz
	HQ49myVb1aJZFvKJVba+YFpJ0hQApXPfzsisi1JOoW6Griia4Dz1hcUP7rqOLEwFHSfC7+gJ8pW
	BV2gGlNWFbKQ67BHb1vmiYxOAi/EwL1opWaQnL7ZVO1zCfNNTNpy/bJp6nFCzKn9ubYB10srVOY
	WngCE4s/k1tSbxqjssm/N5XZMAsQ+NnNAWQej6VgYIAq3y5HbL0/RbMUxpRMIHsnW+hug42wluK
	HtXUQAjKkM32xGo9zmLhY3ZX0XAmOqkoy158mwRF2Zet7JW9+fumSMtnAzALQCceOl3kGU6UTiO
	jzqVOpYz4SpY20kuDQlloXcmiVnALOBdRXKAABpRtwJ4wcKKcN6FzXqJG7KS0bSjeqHZpXb3Wmq
	hLV
X-Received: by 2002:a05:6000:4915:b0:48e:d7c:4bc8 with SMTP id ffacd0b85a97d-48e0d7c4df8mr11376386f8f.7.1792407405195;
        Mon, 19 Oct 2026 03:56:45 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd5128f1sm22740936f8f.59.2026.10.19.03.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:56:44 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v6 2/2] wifi: rtw88: support channel switch in AP mode
Date: Mon, 19 Oct 2026 12:56:43 +0200
Message-ID: <20261019105643.3282423-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <f4aea8175e4f4082afd50fa94787137d@realtek.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Ping-Ke,

On 2026-10-19, Ping-Ke Shih wrote:
> It'd be better to see every count stays on the air. Will you implement
> to handle TBTT events? Can you share a draft first or a separate patch
> (e.g. patch 3/3 to improve missing count)?

The USB chips raise no TBTT interrupt, so the countdown work reads the
TSF and queues itself for 10 ms after the next TBTT. That gives a
download about 80 ms to run late before a beacon goes out without it;
one later than that is still followed by its successor at once, as in
v6. A TSF that moved by more than a beacon interval, an IBSS merge or
a reset, restarts the schedule from the TBTT ahead.

On the 8821CU the downloads land 13 to 22 ms after the TBTT; with a
60 ms delay on every second download the sniffer saw 9, 8, 7, 6, 5,
4, 3, 2, 1 for count 10, with 95 ms it saw 9, 8, 8, 6, 6, 4, 4, 2, 2,
and the AP switched at the same time in all cases.

The idea, on top of 2/2:

	/* csa_start: the first download goes with the TBTT ahead */
	tsf = read_tsf(rtwvif->port);     /* 64 bit, 0x560 for port 0 */
	csa_tbtt = tsf - tsf % beacon_int;
	csa_queue();

	/* csa_queue, after every download */
	csa_tbtt += beacon_int;           /* the TBTT this download is for */
	delay = csa_tbtt + 10ms - read_tsf();
	if (delay > beacon_int + 10ms || delay < -beacon_int)
		/* the TSF moved (IBSS merge, reset): start over */
		csa_tbtt = next TBTT after now, delay = csa_tbtt + 10ms - now;
	queue_delayed_work(csa_beacon_work, max(delay, 0));

So a download on time runs 10 ms after its TBTT; one late by less
than ~80 ms still makes the next beacon; one later than that gets a
delay of zero for its successor, the catch-up of v6. Nothing else
changes, the download and ieee80211_csa_finish() stay as they are.

One thing I do not have: the TSF registers of the ports other than 0,
for an AP that comes up next to a station interface. rtw88 only names
REG_USTIME_TSF; is it 0x568 for port 1, and where are ports 2 to 4?
If this is the way you want it, it becomes patch 3/3 of v7 with 1/2
and 2/2 unchanged.

Thanks,
Mehmet

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793888066;
	b=tsjgSsubrkEAEruvEmRHqIydBOEEHwyhwuCnx9AzmMKBfJlp7uz7RfqI4BdaDO0EZI62
	 A4bSsbAMo7Jo8AQG6CzJGatIWXIC41ouYM6BSwn7JbRfKmDLMw/n80Hp+h+RuI6J0ng6v
	 m2P8eXpt4ubLlvqUzaFi38r/BR/K/MjBk+L6mYNOlCW7LLcbMKSlLcdik58qClMHZPAiG
	 uVpWkn7DWELbnfpTcttwl6cdT+U4KtGMzhyKMhq/ln8/AwiIKAhILPTDYW95870LKQpzV
	 Ki/cL5PTSLpLPpma1a4jxMmHaqmtI0alT6dXLo7RABYwfbg8mGzsTap0bfxoQerx24w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793888066;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
	b=HTZj7vrqwL784Dg3aid8PZ5lyba5OMyUj4thFDSOTcSO/AmzUUKtj72dVvs6dpfdXeZb
	 OZVKS2KpZxNqhSapY6vF1d0ASXc5wo1XzAQfGqDu+HrYyf4EXVqevKYu0SPs5FDmpfiLO
	 Qc4wtLf3Pwc0mumkJqmtYSqCiM9fXPr2XKWhMVyX/VS2978GOnARcbAKjgwmHly74Yf0z
	 xdXwKmhqafxaBDqLgYG3U7uh2DhR9SW88Dd2VjsYr+ZEmGv56pxHUi3LQ5pyporISiENi
	 oUQn0XVMoMs1aBNAddWq8avLrN5h/fU/gvjAcsWRBRWahdOjtCaq5ErNw0cL0hjhR6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XfB5cgi9;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F58606A331
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:14:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7F58606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XfB5cgi9
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso5209177eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793888065; x=1794492865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=XfB5cgi9LHp3NkwPaC+DtMZZbSKB63/55LR2BLwVgihYMxwS+xooD0/5NZJ1GEVhyQ
         2Xt8QSwAm0xlRbn6Bv0FlwvOF67YGj2rm7ZBR4a0aKp2FhUPw+ib3WM3jF+Tpw7jzSsu
         +8iWohauLhCNpRhw1YVzhBulBBPiIEzDDSCU6ZOKcsjuOpyU5byBq/EARwRk9yoapZKv
         wSkR/83QKaSI2xsYvZu8PVwdQWG6TVvNPIFJLjKLBvBYsjRPFTNOIlC09DPl2EFdArtM
         Mf0Es/fT+0KBRgdlUAbX44ZIMghDe4jFpnQr7iB0WTtVCQKSSW0qjhOpQGSVX+WaNjl2
         M5ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793888065; x=1794492865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=NXQvZUZbsezeVtkg3AGs+8Cpfej2AYVOwwSTBedFcu+MX9dhczdcv6vwm1l0Ch9gUi
         OFvsIvC7p6xNFCvOGoSksUVJoDh6HOgyzE+c+M6sCYTmfM4OLuuw1P6GjerLlctammi9
         EJ7cbFHvw5gm7KmCp9/ZwOemvWkzTU+v89UTbUida9+eobBFS0eRL61416DJKbjBxth9
         Q2FJYGifXP+DdnNCkO2KnR217WEwvSrLyzyNllhzTS450Qx90J5iWqtwP/675NW6EwGd
         N7ACO7d1TYX4dHAj8uM6/k8VyfBqOkxy1o3uF7jgSIJh3q06L6kZaLV3q9A1g/IqBOrs
         iVDQ==
X-Gm-Message-State: APuU4Z9Rxr1CdorUVw9X9DN7WEMGecs5+MmBWoFU3kts3MXzFKieO5KI
	Rgc8+66al166aRGhpS1msnMUwVFDHTskMQo3KlSPVCirCUYNzvzYjFmY
X-Gm-Gg: AYBFou3xcS5VTqF/KPcbCkE9/EwuEca5ObB8aPB8+RfYMLsvto6f2iUwYFjkeuN1Q0M
	JVm+fC98iz7+CoCJcAXaPOgjuLb7PXAfj4X/WMydLyqW04yBbjy0zMZ4OerUzgCpIKFU/Pmj9V5
	MvCr/YDjSoOpCjbL290Sqag3oW7oo4OoCPgYzkqWbhlwVxhHAKu9FZ9cRlUxuIFHGFUqX/CC+Pe
	f/528v7tA7mz1B3z+jiExrFo73S8RDPKkz5TFdUyv+a39PUH1HDsM8dMxPQul1FstWzaBdDn52y
	X2/T/wMRJXb/BRLIKFRcjSEWB/2slaSiTW2l8IQmH9OC9qwgbs0MbcWTeba6lRc1IFscAzwXCCb
	ZXEDWEEtyK1y8sNq6Rv+8JggbNmNPR8oGMlWyuplj6kgEddTRS1mzQ/H8WHFSyk+MCC3+JAGarV
	qiK0sI+PZc2Kv23VyaKfrcFX9552+vVlUsKdobqbdfFNYAWsDcFFuy//A8L1g6UCp1SpCq31DBa
	QlkP+74UP+EpcGVabonWf9xrcFTC757gcECXLA2Qiy+txwVIJoA17OPEEwVsSv+JIvGYyc/kuMR
	p4SIO9TsO2Km32OnJ8XZ2v4mSC2vCzX7TE7as0yfQJMKcqOITT1ZqkJTr3tX8UEcovQ+ZFMuYw=
	=
X-Received: by 2002:a05:7022:f903:b0:149:cfa4:9b3b with SMTP id a92af1059eb24-1ac55776fa1mr29315626c88.3.1793888064798;
        Thu, 05 Nov 2026 06:14:24 -0800 (PST)
Received: from localhost.localdomain ([103.178.205.85])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4706bsm20987500c88.15.2026.11.05.06.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:14:24 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com,
	tiwai@suse.com
Subject: Re: [PATCH] ALSA: core: Validate device type for dynamic minors
Date: Thu,  5 Nov 2026 14:13:15 +0000
Message-ID: <20261105141315.2982-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <8733tfu39j.wl-tiwai@suse.de>
References: <8733tfu39j.wl-tiwai@suse.de>
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

Hi,

Thanks for applying the patch!

Best regards,
Sreeraj

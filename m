Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794607549;
	b=vYnAKx/zHryD2lajtonPEChQdD11BrNFyPvGAzjbcJjPnad441rMtF0OIQv2qs8qzA/s
	 uNNuRoFmi0A/iRp1gVwDUGB/4y4jWNZD/Xgkol46Hc2cEOoFKN8VLwHQpSkkw1upf+Dq9
	 yrmLOCbXzl/q1uM2s6UcYOteSYolJwpqU6ccvGBfWUyEXyGKBjGvXlG8k7fH/3W6woMI3
	 v1zfhnLrWqBgAle90I64hoQdB/8ULRiknDfdpvEe4C6icoDbXYp0fd10+S2qIIYm6qaSW
	 3t7fioV+bNJ1AJCDAtoSK+VE0xvupN+QTBPO0NIJ85l/RRUZ69Lt6VcxcYIAHxdia7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794607549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UuCcRaWcfhI534qP5WKzVNn48w3a+JItDciIOEIM+EM=;
	b=HD7MYXHRuoHJeblry6tZSDFLYWVtHSOTJY3cgQhxDMyLo2Jo1w9mWGpk009+rdDQZDTm
	 GXuRbjKSgkQ8D3VWgb6jIvjTVWcZEB80JC+Zl8ScxqxhhIbGPH66Qnbh/vyilCnd0eU1X
	 9/BzOZh0rej1TSI0holOuILv41RL6mo73SXE/yiVWT7HVjVbAfUQzAniKOJNlnz1Dx0rO
	 0tp0qCV+P2CxXKDkjkXgd8g7Xso9a4+BHbXK+AYkji0EWEXxm4wDVUbrnj67iOLSwCXx9
	 l9PTs046RDnSISocr02QkcsvnbBy9MIvQnt+AwbXqQxK+JGKZ3+/luwdu8UXZ450jsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q7fUvc7B;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A201606A899
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:05:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A201606A899
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q7fUvc7B
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb61185057so1314735e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794607548; x=1795212348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UuCcRaWcfhI534qP5WKzVNn48w3a+JItDciIOEIM+EM=;
        b=Q7fUvc7B+KCjlLEbd7LBof097PJOOZomD59SknDaa6DwF/nygvds24aEOnwTzjBnuN
         /MmbOZj2ihnF2jFoQJE4K1RNA2dcpUV2Szu0keHR1S0+hdypRBTdmnQdAVej53mX6MMd
         A8hpcn+4MVafT7vGDBfTM/Xkrlhb+1XR1yFU2e5T0prRvogpF6aecWknnJD3yvzUn4Ex
         IPu4HB9ZkQXsOh/DVyxOPMWtFUQYYOTdcPyDqsgWJumIFBPGkQuVj/jJSEjEajM7bw3V
         gLtsDSuDXyON1GYnI0CNZoC0pS1vqVZ6USfp+/Zh9S09a5pEmgMxWcTEGmnwmoLNF3kF
         Pz2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794607548; x=1795212348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UuCcRaWcfhI534qP5WKzVNn48w3a+JItDciIOEIM+EM=;
        b=GiD9JLoWged72a9WMrRBfFVKHHmLii4s6xFVoX2wYMXKYd7hG+UuQR/jwyMipU8WqE
         333vAPaQyEfvSgSNnSx9lf9jZXNkvi9rJJcHNMFKccDz0zsMxSEQdJo8T9ykFJIRiOL6
         KSEAgAUNH6bywri8UB55zYQpf3ovuQwLCp1cCEJYK0+kHMmqCyBGtmvffujTqZtGtLNx
         +jrV2GKuaAOrofR5jVdAowLL4ukpXDM89waVJgyZbYp4H4lqq3wZGvmnFP970dtA9VCE
         5f36I4lRnLTNYlLKYSPZnJf7xPD2BOe5lwYtSKW4L+wLi+xju8SFYdWz7EJEyxoHDmij
         KKrA==
X-Forwarded-Encrypted: i=1; AL+hErHKhY7dwz6LXNP7r2uKZdm20Gcn/IKJgOXoR2zjzszWvosXqgALqiQZh00t7ucS83qG/BkGQ7sFKWMC0yQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+iS0sgOAMyG1aDTgYO+RHNssHn5kgp0OpeLwPbpd/9ZKV80Q2P
	Y45aNGak9pwOFDeSryhII+SB/JvHD7HSNSdNF2Ioy2cVNFPDQjV6Rysi
X-Gm-Gg: AYBFou2npSlwWL1QP4aJ2bauwtOyk4fgvezSM+RSRaYD3HMTsEAk4P6t/sRFF3TlLuM
	kiPplpdZ8yAiunG+RQkzvVK9KaOvX9uKyChPyhsAEGCRn2kCTIW+f2MyyuUh9RJI7gCIsyqUYec
	J4CtkZ+1OGFKZzFzf/huhxAXKmMQycTaBlDfr6FPfh1N9CQlJXMPgEIKQd09JWEOqfDfpN/q2D4
	j87Unntdpl5Vj2KR8RP8dZRnA1TqLSAEJrVe0ABHK4HwRtymlt1kEaBz/Oi+oI/s50j03HvKoNc
	SzJSMKDXxQB4ynsUCYN2IeqqWbXD9/8UT5S4USe0sAXfVkFutkgyindkGUBMXHDKH8pojSvnKKH
	7+HqfZZsxg9r/EFzFCvWFatKFrzZUM/FOAHdTdyBwBJNAYpIdlW83HUysi+h260Ozq+ak2ofYph
	tY+ApxbMG1p8/cPtWMWwPP5xoWdo6TJ6fiCQPHPtSWJWKvTbWF4NtFulAYtLM6xLfJvf0BNwTuD
	9AQ83mS15Zu8qRg/B5p9TtvUX4X8sGxBjiS3Zlkn+pMAA8AiHy5WXT5qTfjtB33LblxGRLgpNr6
	CF8X/3IeVL415wnsZ1z73tLEI9xlunozHuul
X-Received: by 2002:a05:600c:470a:b0:4a0:b6:4619 with SMTP id 5b1f17b1804b1-4bb5599b358mr83112735e9.0.1794607547553;
        Fri, 13 Nov 2026 14:05:47 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55a0ffcdsm87834915e9.0.2026.11.13.14.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 14:05:47 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: Ping-Ke Shih <pkshih@realtek.com>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v10 3/3] wifi: rtw88: time the countdown downloads from the TBTT
Date: Fri, 13 Nov 2026 23:05:46 +0100
Message-ID: <20261113220546.826710-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <1D396970-35B7-4B0B-82E9-24B523AD69C2@linux.dev>
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

Thanks for the review.

> Could you check the beacon spacing in a capture with beacon_int=200? If
> it stays at 100 TU, that is a separate bug. Would you be willing to send
> a fix for that too?

You are right. With beacon_int 200 and 50 in hostapd, the beacons of an
RTL8822CE, RTL8822CU, RTL8822BU and RTL8821CU stay 102.4 ms apart on
the air, while the beacon interval field in them says 200 and 50. The
register reads 0x00640064 in every case. I will send a fix for it as a
separate patch.

> rtw88 sets BIT_DIS_TSF_UDT for AP and IBSS and has no reset_tsf op, so I
> think this mostly catches a download that ran more than a beacon
> interval late, not a TSF jump. Maybe say that in the comment?
>
> The start case computes the same next TBTT, so it could share this
> branch:

Yes to both. I will reword the comment and let the start case share
the branch in v11.

Best regards,
Mehmet

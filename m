Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793625403;
	b=NvztehRLGbziOujCs76AtOgKZVpnX9N4y+bBCM+AznMkWGULNar/mCF3O2mtoS7INZT9
	 fL9SZYHc8U/9SukeZlgwXJz4vzG/oWCxoaqLZMC9tuG/h24L2BBrKNTRS+aEAcGh2nQKw
	 CrBpJA0Guv18Y9xxsKtB/1AekVgnigycWKoeDVlobq6GJ5iCrLjVoiJ2N2B7NCRWpYTlM
	 Jqn4p1I1z4BX5pqMC2i8JKT7vztTHaHsS/nKBl93IU6Pu1v9rEyMK4gdagkdw7ZrHru+a
	 G3vdyN8r+sPT14Q5o5B6ZHPB/7wiIwH7ObEFwQbFX5y2RbgtlDVO7Y0D5pdqxbFGYrw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625403;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=+Oc6jTzV6cd//BNmZjbVeL349QlJ2qzTv71gr8ZXho8=;
	b=Yq28RugzxqlaGgBuF5Q2F6TbYq0NTvZXDd+A/qZeP/map/WB/bdYVrG3Hr73FrbIesmu
	 T1QlboRR0nAioBY4VglGhz5dGSOm19L9fhspSs1IANLbuuyM/w0hT0Ht+yr+h+VQOQyiy
	 P8w2upmjGZH4mhJOPuO+eXTRTDy0a9090mkc8QPGjHh6raPsEuq34WCEUBJKKg5Ai9ysG
	 Wxn3YO23e36d9NPHW8mTcXSrqXBFyUDB+5fpvT5PdSXVMlg9Uf5M938+ErXXqYvxQ0rSy
	 7+lZn5IcqmYYOuzMsVvOFZAkH1u61aWgSh7AjpN/DjF8a+27w2KO66WdCouXRc5Palw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uy0Iz1pE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26AE606A334
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:16:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C26AE606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uy0Iz1pE
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ad787e0593so1396935a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:16:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793625402; cv=none;
        d=google.com; s=arc-20260327;
        b=c8kzv2A6GahqV0upyg3gmZkLGlVqoo/v3php/6RmW0x4aRLlMRWtwE/KMEbY/whevg
         wqDoi6byHKWnEfyOfMBh1tYaseXRkCSjyFo0fZ1XRaawQFQ5TBmlZeMrJoBOeAR8afzr
         wltCyqrqWnRiCYkFHvuGI7gAwJa7aAj2XoIsnlNDC15xzdM0c51nNoAx/oAYqpHzEOaj
         ASyM4CX/maidTw62rBmzZNh3B0ife7LOEeXi3y3Cg9K7yxrGMRF47uMCNaCtqx49GE03
         CPGAHkKGWGZ4FDzJstqExY4DVKv9cI8cujQQeLD7e3nSyl0o8oe5QVOoaoSCmWid7Z02
         5dbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+Oc6jTzV6cd//BNmZjbVeL349QlJ2qzTv71gr8ZXho8=;
        fh=WDkF04rlED/mVSpq9ePVWIQcNLEXJXMX+JOAqwmUETQ=;
        b=EIY7i93Lc2qDPdxjj6Ock8Hafn/rzbZYTG//NmQzxjs9bzSGSzQiasRbYUEmW7+c1V
         Sm9FyGP44/KiV/AUIkP0kXfC4KLD0BdTEVoydeKHSzK90/cry/luL28nMc4tkPYq1Wcs
         l1Xnic3JHkxd52t3KNxFv+tqPzEw14E4U/KB/pLSuICBTnBxXnIFk0SLr2fA/bfVXkKR
         vMfJOxZAhZU3ITRMIgTKvZ2syKixxYru25pvtwMdbIzDZnSmp1KIRn+MdCU6LrLAh+ma
         ngKBGTVmnJWTUQMMKWVBBK3Ci33AZc0Poh511upsGXI1IiLNldcPL8Vhze99whCp2KEu
         rh4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793625402; x=1794230202; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Oc6jTzV6cd//BNmZjbVeL349QlJ2qzTv71gr8ZXho8=;
        b=uy0Iz1pEC0eUzpEdQgMeHeMmK5OS3w7cIZbWv9fE9oLf5OIXdSxaqsNpQ+xastIoLE
         LPeZ6CNQtd6XMk1oGnPDmARJHJVI/iH+2tE9UQHsGhdrhIjkfP0TPQ/hXndxj6u154Mr
         UuEHlNHuw247o5KfXxwO8d9KPK2ZqyomxScCKKaISJvbhxLl8L/5ndz1kSE92Ig2gAqB
         enjyLrRhcK0AXPb7rlhZS+I//73RYnacNK8s80zZovf1Q2Thac3GCo24g3d29PSuidMT
         5VYVuLkSULDIWS0VqgOEBKGxShHhTNZ4rIFjFpNinRx8Fg5C263vY4AqoS0+WKh3ktS/
         vinA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793625402; x=1794230202;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+Oc6jTzV6cd//BNmZjbVeL349QlJ2qzTv71gr8ZXho8=;
        b=coex+z+e8MG4SOcDO/gGAfMCik2sVlMCbmAN4aQE8SxUiaky3bHg1bDPiTHzfwURBz
         j8Wf1pC0pKIFq2EuJXmxflbcTQh1tF5znm5VL1J7CkVJXGdI8O1NwCIOEZfe1wKGP58F
         QuHmxSK1sw3EpyxZHVj+NjAb8tV9JdDv77mzAtGu3FO0F0wUkBppU1x/nwG8h4pf5AUm
         1QDCnyND3W1hlOTHwvWwk81gbkRdmZbz5Ii3tI6wx1v4xUEHcsTZC4QpKKvjbRAFIpV9
         yVLopNlMAxPSnQkZu4wlMHfTlKPN+57A+q3neqO0fhIKiQfNQAcR8zEKraU0MS+C3mk8
         22bQ==
X-Forwarded-Encrypted: i=1; AKwUvBxVVAzFPuiV3Xl+UhFD/sVcXDeVPT913Z1ruZzocqCyld7nKerXtT8YGWscI8pK7puLMCfTqb5KZ7mvL10=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yE2FMjuALeHce+4YMt6nRMPD2qXsQ5aqLcNWprFBp22Gyad8S
	NzBg0XuWCH+/Qhu3LfTZuI2UxFIYzdvy/8x5VNwBAXQ4D0YFNE+K7Z7eAfPS5VsgrSVF10oCpMq
	+MHwjzf5o/WWVCa+G+vrjCZFjbHfirA==
X-Gm-Gg: AYBFou2OEwOVdPXcY3d0TECmK8bysST/lSkRwJM6jqQtW1q7LYCJSsCIfGJoIzzk+Se
	oqjrOCAt41NMtVnS/PsEmGE7xVvs7wfEnTcTdNM0A2pBM4gmVe+vSK6GNo8ObO5wE8KS9T+aa0N
	qy5njrhi2O5WFijk2xZ96Dux0rxec3PWg9h4TRPGbKX9JuhR0skg4kddOh6Kz1sNP1/zC2mtAwc
	ofHkjnG2RIpoxJIjP9rq9NHHfxME24IODhjRUl+J2h3IM4SME1GF9VfULLJ8sgGuOG7llF0amSx
	SwHw376sNUhg9LbTbvJOeA6CeO1H+gcdjZv7AvOyEc0SVsxK6zirHzHUlJSLYJOsgTHQJ9HikUr
	ZeILrO/2OSoFO9zEan5zNHZ0B6F0yTJWrD1S1
X-Received: by 2002:a17:90b:3d8b:b0:3ac:aa8d:19eb with SMTP id
 98e67ed59e1d1-3ae89573c91mr7474736a91.3.1793625402141; Mon, 02 Nov 2026
 05:16:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102003607.341651-1-korryasdlerto@gmail.com> <bc9e2b99be871ef8c7e74a5ee7d573082cf61545.camel@mediatek.com>
In-Reply-To: <bc9e2b99be871ef8c7e74a5ee7d573082cf61545.camel@mediatek.com>
From: Asdlerto Korry <korryasdlerto@gmail.com>
Date: Mon, 2 Nov 2026 15:16:30 +0200
X-Gm-Features: AclHuK94KlhySgh0x-kcv11s1LNVnedbguG09GxxTbahbyWbf5_kpbfzXgsG3DA
Message-ID: <CAARotkefEP3aVTvHJn8d5JgWR7ra5y8_8K4msnA4Q8cg-HV3bQ@mail.gmail.com>
Subject: Re: [RFC PATCH] scsi: ufs: core: Allow error recovery before the
 device W-LUN exists
To: Peter Wang <peter.wang@mediatek.com>
Cc: "Martin K . Petersen" <mkp@kernel.org>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Bart Van Assche <bvanassche@acm.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Bean Huo <beanhuo@micron.com>, Can Guo <can.guo@oss.qualcomm.com>, 
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> I'm a bit curious why the first link startup fails, while
> the link startup after a reset and restore doesn't.
> Shouldn't these two flows be identical?
> I think the driver is designed on the assumption that the
> basic init must succeed, and that only a re-init can make
> recovery possible.

Hi Peter,

Thanks for the question, you are right. I went back to my notes:
the first init failure was caused by the board, not by the core.

The vendor device tree of this phone has the UFS VCC and VCCQ
supplies (PM7325 LDO7 and LDO9) without regulator-allow-set-load,
so regulator_set_load() from the UFS driver is a no-op and both LDOs
stay in low-power mode. Under the load of the first transfers the
device does not answer the NOP OUT, the host sees
TCx_REPLAY_TIMER_EXPIRED, and the PA error / LINERESET storm I
described only starts after that. With regulator-allow-set-load and
an HPM initial mode on those regulators, the first init succeeds
and the error handler is never needed.

Also, my claim that the device always comes up after the reset was
too strong: in my tests the second link startup succeeded, but
ufshcd_device_init() did not always complete.

So please drop this RFC. The races Sashiko pointed out are another
reason not to remove that check. Sorry for the noise, and thanks
for the review.

Asdlerto

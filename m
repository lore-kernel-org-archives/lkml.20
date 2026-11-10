Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304552;
	b=U7NEsNvi/eZOYlSDgh35TJ0o4y0MKZltrJBEk/DOqQSTQ9qoLNzJnZj9ZhZQv9sTBjgt
	 S1yKGSBsMaVtDzb+go392prn3TJMG0y5vaWnMJd5yxNcuSCsYdg6QFWwSjfDZRFFuTN9W
	 7sB5uC7GkSHgMNQrBN9pIsv5XloZEqjsOAs6jy0gqiL7+k7kBp7zBiAOzh4At2NTyV711
	 XUGWDmYnlGB7+VEt6mV70+0O5TIupXgF/MubdpcFg3bI1NADy25WYmYiUGlXbAk5fKPvA
	 D4xvKJ9pVnxNHOUCuWKpMS1Diisn3wXBrRsnrVRetuCBsgBKHLF1aXgODG39YaynS3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304552;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vkfhQhYqxqsCmC3P45GomLdqX19iHipfex8irFmVNrs=;
	b=UyqjE9m9zZITVYHEg+6DTj1ngua0+tKEHiwKOed5QlosiaLSZ867IAAyPe8x2I2bEDO0
	 yFaTtFWy5BGIJuTWNgRgXG/61bpBJA24AxAJ4a69npoVY6woE5tPtCVQvUlvHI1TqeBme
	 aY5heZoWFhtAagH3syAcfNjdC7Ez0qBbS+t64P2AbCIczeAzQbdnh8z2UTz6oj4TaAC1h
	 A8OY7mnyM+VYlGz88a8sHv/KAlv3HBvpAWgcWLqbUdl1bUeMc9t2DLuyUZvi/ZZgs+K+d
	 dcsZHyOBzr318Unl7xbgOAni3hkraFRvQtz2EyFkn1Xtbvu1A4BVO1MWaoKXkETpX5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KM6vE6ll;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32C5606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:55:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C32C5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KM6vE6ll
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1b3b4944abeso829186c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794304551; x=1794909351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vkfhQhYqxqsCmC3P45GomLdqX19iHipfex8irFmVNrs=;
        b=KM6vE6llTuRQYCxLWxxCDbfiXe1bNG283m9WyNS7EquaKX+PfKwGnah93ceCB/kIqT
         +gbXd6xNMAOlwYExsyACVU/fD3qmQG8UvZIj1AzhG+fjPXqDKWerTGaJmDSfw84zTmsj
         d95NV7Hjwxwp20m1dWrclYCqTV9JkuT6NgbUE2i52ZhiFLREjnmY53mldZO6bIPeFAcX
         lP/dDcoviJZ9Vb2iE2EEuO9sNVPO8CLfE/vmPux02YAE+DTUpRHE1vJQuu0I9VwnKpsz
         ADpUFBfISytimwY1qblRxuVvPLGXSuhaVPWmG87rdnkz0qgvn+qOsevEx57XWN1MBFq7
         fwNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794304551; x=1794909351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vkfhQhYqxqsCmC3P45GomLdqX19iHipfex8irFmVNrs=;
        b=UgXalIHUK9s3o1liunO98shYVRvCpW0QpQSDp6wS4NH+l4uAMLGmXI9XLlCxgiKYBq
         mM59Gyc53jv7HNQfT8FTF+g/XKDtq/xoEnMSFjB6lvHbIm44fAQEkUVVFXH8mY6TrAno
         JP+b2M5MkZ62XoW6w9e5M+Fd0Uh+XR5+9vb0dR1nlJ5KuqXMin4TKvy4gmrCQ89DMsJD
         rz7YLLtep7m9iidGxOV5xVZ50hYdWgTVXENJ0aYzCtQHOMOxtGqW7bXwFbs15MMNKWM4
         cFaHT9+oOowSMbqysIppgc1EK4xqP7E4lsGFBn1H6LEVYGj6WeNHy7EbvF2BhZSpxyNm
         if7A==
X-Forwarded-Encrypted: i=1; AL+hErHqxIHetmV6cNgRbsJnwrH1C4KMoK8O+vJm8FS1ji8kLh+t9+dvNqWUMQK121m9F3X1AeKvN8sr7aWl8kc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vyc37EkX15SkE0rUTb8NMzJ4ZQikSXlsQy92T7xOhqx6NlO3Z
	1w0TE/kieVj9cq1aJJrbgzSCFDknfsQ5mWjahYLN9Qlk2ZoQur2ZJoap
X-Gm-Gg: AYBFou23usFnO06wFvPck77ZuarLy06yVVtJCvQXSJzpCpAdriE/99dI9SvxouWBVRh
	47J04CtUq/9hvnyUOkIO9UmGgVUPbbrD11wJ99m6LuXEWsAwC98csDXmJMbRSYdsR5XB443GyTV
	UZLdtPkSqmwlZXPM/pr/Lyc4PA5q8y+y4MrobP5XD4TjqPukLMz08BLx+Ukh89e8Z0RuI3SpTdu
	VsP/Vmu8rnBrOAUmmGCLEsdMoQpQc17pVVISCFzVhkF1kvRWhr8j0Wr1xaYGt6V48zBSGkP6gSB
	9f+539pybCeP6c9H99WG1+7ONxT4J3hb409lC/isJkievQH990c59sYQMguLvzG0iKISC8nYILP
	ZcqaJXwZ36ypRVGpn/XwLG0UN66oad0sklK0dCYT8KaDxB0S2z4vDjBGMwrVORO/zvB532qH7sc
	aCxcHUItEN94c27ktgLElZMyW8BoYREoL9/dGR2/4z3q/AsMMKWSrZNwNZs3/FYdvsRkj00p/WV
	J9ckrzBbqgADSFFFi4CKQ+xB5lVMA7FiRASdJ6GBPTK3zZzS353Kt5JDnfk5vPg5vh+JvvKyxJQ
	p4OCtiyt9HaAkeYgT7Q+My+Az9LFdT+c9rrtwqTD6qEvnOZXcOJL52IXKpLBhgo68rhzfMb2i+q
	QMXorGQyGOc32A+LQf2q5QYOFCkP4T0TK3DdjkeRm/vnX
X-Received: by 2002:a05:7022:286:20b0:185:fd0c:4585 with SMTP id a92af1059eb24-1b3b61874demr2722263c88.33.1794304550708;
        Tue, 10 Nov 2026 01:55:50 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b75d42sm5203801c88.20.2026.11.10.01.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:55:42 -0800 (PST)
From: phucduc.bui@gmail.com
To: Maxim Kochetkov <fido_max@inbox.ru>,
	Andrew Jackson <Andrew.Jackson@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: Tim Bird <tim.bird@sony.com>,
	Yuri Zaporozhets <yuriz@vodafonemail.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 0/6] ASoC: dwc: Fix several issues in the I2S driver
Date: Tue, 10 Nov 2026 16:55:19 +0700
Message-ID: <20261110095525.504660-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series addresses several issues in the DesignWare I2S driver,
including clock rate calculation, DAI configuration, channel limits,
DMA FIFO sizing, and error handling.

Changes in v2:
 - Move the indentation and typo fixes into a separate commit.
 - Add a separate patch to propagate optional IRQ lookup errors.
 - Add Maxim Kochetkov's Reviewed-by tag.

Link v1: 
https://lore.kernel.org/all/20261106112940.53550-1-phucduc.bui@gmail.com/

Compile-tested only.

Best regards,
Phuc

bui duc phuc (6):
  ASoC: dwc: Fix bit clock rate in TDM mode
  ASoC: dwc: Fix error handling in dw_i2s_set_fmt()
  ASoC: dwc: Fix channels_max derived from COMP_PARAM_1
  ASoC: dwc: Fix DMA fifo_size calculation
  ASoC: dwc: Propagate optional IRQ lookup errors
  ASoC: dwc: Remove redundant error messages

 sound/soc/dwc/dwc-i2s.c | 57 +++++++++++++++++------------------------
 1 file changed, 23 insertions(+), 34 deletions(-)

-- 
2.43.0


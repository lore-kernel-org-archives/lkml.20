Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794884029;
	b=rNg+yvtGtbnj1vrOaItCz42WT9Lkx4zr6byYQDGpwk0MLatjvGQwyvlh/8baziKucxzg
	 G08sFBpa2XlZGWviIPtld5TmTjjHkVCVlGgtG4MqpKW/eH5rHro76UHp9SGUVoa1qGgCr
	 OywFVyS3RL1QRD+namXD4o8E/S2toqdm2cUcEOKZCBxZWhqKG8GN2ilmQwvNzANjgYBCz
	 +C/fjCaJQoQALRHkZ8G6UIPhvkmMR7SkxbbRxRhyf8k4gp5GyvZaixQvC1lUWU7AeE42W
	 RDyNf5uLJspDLGoQvD6bc4bmYKw858RPYO0niJcsc1RCIAuDa/CPEkWkWt/kIUtlGmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794884029;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uQmEnBy41LOTn8RxJD1AEVDSOb95B4r7foDkgo1mAGA=;
	b=vvLgt82bQEoWjL9/omkw8ypWwHhdJh3T6ttK5AqsCrHFu76RtlRVcaT3aM4Tg/BCpu8S
	 /l+W5j2XRY1oz8S0ENYbW32tRnS+YkqyE4PiMaFbVPk38KaKuvL6/jo/+0ZgzRCZLNl4I
	 +w2NLfyAXjht1yVyCzhd1I05jUnhQD3j6hf7lpo/anNPC0CC4/UET49kGdbZ8MIjbRPmA
	 /wE4wtB6IOoweQaQDzeXKjNz69Rz0P6SVqI+IZuOpRHhhFzs0ovt2ceROEOokm/o3+rX2
	 39yT3tuKJxw67kPphQ3EcNkzJESz5JiU0u0WY8lPB22kf+QGsBL0TkXJtbLrBpq9KLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mGlCNLOg;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCBC606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:53:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CCBC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mGlCNLOg
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36f8cdd30beso6893476eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794884029; x=1795488829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uQmEnBy41LOTn8RxJD1AEVDSOb95B4r7foDkgo1mAGA=;
        b=mGlCNLOgSxEgkGHl6RW7klQzxte23/3WOBSsw+gEXg7D7nW0JhRUyUlRX5sAD/kVvb
         958wYPd9B2Ru0KzHvrxZAhbIcuFXsY7XSqqgHV+Cap1fWKupxlc4GDe5Dx0n8h4WhVco
         L1TVyqYen75PGN7s3OSrUrebX5zkYwNm1EeZBcJDjQnIONIyJUhAH4J2WO4SY8q4RZt+
         lZmzjsQYrAWBZIS5tnuMNTLcSfHE/2Iq29eh2PWVnMAEZhk12zAt+AOmHw82nSytalio
         B+k/CPLVB5xP6duZGbLsZlzNCd7JM8RYd4gCVMGor8PJWnhTgVF0DWRcPVZSIPoAXR4l
         S27Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794884029; x=1795488829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uQmEnBy41LOTn8RxJD1AEVDSOb95B4r7foDkgo1mAGA=;
        b=ZDR8hrx4GuzEzQpZo0fJ/QiKzKKXTh102fq5AIuVDgv56ZJC08wcBN7d0qM04eaIQE
         To6OTaXZIc3dvJKerR6auzAglMqPFf4dfrwqd6KQP0AJVyoEneza/6Fa2ezVJKVQn+UI
         IHIe+jZeNio/sf7UfPQUCMcj40kbNyH5NL6mWTf2GemtrGogC2voZR0LbWlgyE6N/G0r
         smIgpj0/PHvh/hF+xdDngMuW7NbjZCtlWd+WHNRSsr9nwuOG9LKu2V0RoGdeC4GRD1gb
         kX11IG/n1N9yeJo1L6ClYsZiVOBDg5nsWHUPN13v6I7FZwizuA46f+8RcNr3109/fifG
         x7tg==
X-Forwarded-Encrypted: i=1; AL+hErHxj/fiMs2nbq3KpW1v8Si+gb5iUR4y0RtXjYeWTRpZscveJhVbFmjOmKDqCBiEHZeVfQojCALrftdB+Hw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qtCCQ+Je1qBcNToeOjNqPd4hNLAbfc6zK6PwJohOdHOfpGpU7
	JJ6YLWWObz5yaDdQs4QM8dOw/cDZbD0exu1ETZnHqUace7Hxy7VWeEp1
X-Gm-Gg: AZFdTZfrab4KPoOz0hMJiEW75H3yUWRRlQe2sRWk6xD2/F9nAZlzzBkEP7yQakfH0Qp
	HroCXj7D/yjs4ymhsM/EROeynMyQiJCiyF8aXxNLt9D+Jgchq1TmhTEJcOJ02dIC+2tvsO1Oie/
	YkJGzi5KDnC5ZqYk74jU3hL+ZAYGXhwECXYtw2AofyTVbI9XZvGGxEkqB9CEDUEnIO5iwdBfQWy
	pG+Ojnl2iQWnGyITSwb/JV4ne63vJ6LMGDWHRr9UIJx7XUaTxYpZFZzsLyIY8BH1pAOVPHQhiMm
	M8af1PhZSx7gv2id7R9EWaenzsgTqQuBPwxHMRGr7f2CoI1o2nMRyXusdp1E62N1fpVMMFoTJBp
	s+PqS45Tc4BKJ89vCY2qD054o+YwezHBFWMFS8mUI3I9GwWYtSOj2xuVx69P8odiN3AcbLmhOFo
	Om1h56Th36XrwY5b1mTLvPEICj/LVHYBD92fft4M4eN7Pzrhh+acxtMZZ9nlzElMKr2kz6lqlGC
	KiB00ffFzHEPEuNWkC2zCuhGM0oqnZfi9TU8IkowEu4Aq1X5ch8Cuu/rDpCcixQ97tUlZDU7Q5x
	EjlJ1Ghi2638z9rKpce1qqyNs77mkt1gDAlFxEWGSuh5zm50QJRLxBG8nlYgp4nRjbUHQRgsYrg
	h1hqjgfqm7IzjmxMuSt9eeO0+zQMsgWsqwHdBVpZ8x3hX
X-Received: by 2002:a05:7300:6148:b0:36a:7bb7:4609 with SMTP id 5a478bee46e88-37967dd7e1dmr19122519eec.34.1794884028527;
        Mon, 16 Nov 2026 18:53:48 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955e0d966sm39357368eec.15.2026.11.16.18.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 18:53:47 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kees Cook <kees+treewide@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/2] ASoC: adi: Use devm_clk_get_enabled()
Date: Tue, 17 Nov 2026 09:53:33 +0700
Message-ID: <20261117025335.7455-1-phucduc.bui@gmail.com>
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

This series uses devm_clk_get_enabled() to simplify clock management
in the ADI AXI I2S and SPDIF drivers, removing the need for manual
clock enable/disable handling.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (2):
  ASoC: adi: axi-i2s: Use devm_clk_get_enabled()
  ASoC: adi: axi-spdif: Use devm_clk_get_enabled()

 sound/soc/adi/axi-i2s.c   | 22 +++-------------------
 sound/soc/adi/axi-spdif.c | 22 +++-------------------
 2 files changed, 6 insertions(+), 38 deletions(-)

-- 
2.43.0


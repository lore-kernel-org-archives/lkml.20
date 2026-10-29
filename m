Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793260883;
	b=PIUA42/9c0PIUG07a8rc+6Mw88qWD+QN9fyXueAWjF12tDwxjZ7E73LUqi2vjtgWbHOQ
	 Zx6fHvjUq5w5b1hbYDxqFZIBvs2o3QyqIepOmuDs/gfr+j7jfFyIikBcwWR3u1n+bsJ18
	 V7E2/ey3siocyp0UoGsbO0ECvhtguRuZAf32lXTFTss1YRsj7sKbll02GrzE4HRZ7NiVl
	 bSHWq30nR/liUBsxcTAzOWVl+/JjRsG8SjYvr+ZM75UHHO14pm8JZ7G0A/tUmGsqEtfwx
	 YcQq7g98QlK68ZRuWoWO9ncRvYGuT6xg70LIBVDH27lVv8ed0DcNboDtvbm8n3TmyQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793260883;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fmCkT2dDJS7PEu2WSf4TIeZW/Ul2nvJCI1F+qx+k+nc=;
	b=qVEcSVZBWmBVWMBqTlDX2FT07MZ8wS19yOMJ9x8tQc4EoHg/G266V7n8m4D56ZoZg3oU
	 IhqItlnUyceLtH9D5ZKZ3IspqXe3LmUptNdNby7ZvRff+bAnsclQaiGW9m//UIxp6mNwI
	 K+Whw63LLwf9n0gZzyAev8djvHyR2waLGW10ED2/qeLSpPoAkQluO3K0F03tlvty2wD8w
	 uFaMQ4JQXsya7u4zA+Zykh1q6K7JtHuE55g0wy2ydR/+SExaqFM6xOmh0/942QRx+YLpl
	 EWsrkKmNeGGoVmUGNKRuidQDpdV1Kw2kfzezUo9ekFNDmR+st07VlrTfAOhcQy/042w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cBjF5Csz;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACCB606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:01:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5ACCB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cBjF5Csz
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cd6a7b62ce8so870693a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793260882; x=1793865682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fmCkT2dDJS7PEu2WSf4TIeZW/Ul2nvJCI1F+qx+k+nc=;
        b=cBjF5CszmWRXbpvtG7vbWvhDWrbRo014YxGmU9dZ6gwHVI65SP6owcCpKGMi2vTSxP
         ajr3FN24/h61HS+on4vVC3PToPL51UzJXyQmc0jgVjtzOJ6fk8H9O+AHa/JCGbLHDmR0
         TT1e1ZZr0lw1QRu3+t29FM1+XMIg+gspLg5NHxKQOc1/45sPE/7YXThAlpCl/WfjipkJ
         NkPg9BSD8U185av/shGLSvnl9VZ/O70VqPJC6yl13dvhhi5+Bpk0zsSOtlxq4mmm498l
         8/YTqOHCtZs5JxNYA7EZ96LFIHVVsDQ2hqJV/rbDbgpyRQjVIl2KvwsvanCgsn7MJ9Je
         VFLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793260882; x=1793865682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fmCkT2dDJS7PEu2WSf4TIeZW/Ul2nvJCI1F+qx+k+nc=;
        b=BqN5wYkUu6FTxv7rGQywJPUjjBztwN+pYrZsmiP3Q5OTxtFPrgC2GBQ+sisJZPbeCF
         qn9IdKba0iADPVwUzxDGZV7DPyMXxjHs10dPFehBHc2K4dRGrVxoNPAyXHzadZaVlqGs
         BVCyx3W2faz08/GHemvqS9YwdXIs4a4LHpd/SacguXmaG32nLyaC1ZH9W00UvPZmduCH
         fOmokYMHk3v6mF/lr0/mlGXE0D7Rv4UdfM9Xm+EqLqTf3m1vTMJeuUsPtJzdHX1gcgHo
         QJz0dTNq5gkStGo9dvtoq2DFu6Tv+9ItmGyvCPCdvDHFNrcOvKBj+tOMtMileZKCQr6w
         14cQ==
X-Forwarded-Encrypted: i=1; AKwUvBxDsy/XW1tUE0WCC51ygugQQTJ+qgKvvL8xAds8ZEk49yzyx1W71RRp/DhM+0RIcMAyKe3hGraP6yn2XAY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvABUlMQVmQqMlz/PH9EvodCTI+/9yRskh5JzYhwlgVRHp6tRB
	6Z/ZnTjmBz8CvrW8TCmhmzNuGL/bY/0t6vkHluwcsBeGaHNo9ZEDpphL
X-Gm-Gg: AYBFou2Uu+0skcE6lzfD9Bzq3tmBZDLq8wsu5fb2F1eZWVaBuEB7hU7TPAGeslcMuH6
	Gw5h8x2m3XvSp2Aks7H2AHUPZfCubAur+9eAaTfgiJPvaYecKKMzYGb/N8iRDhPTyazIxPzFfNt
	+dJecCdK1IQHKOlvO88FkpdvnzBUd8y7aKnJECae2dfV6AXAzuNMbj/kUXbZSoOCBmgpksLS4Zu
	+aF71QHLqPKmi71QXWSsBmF+cztYQn4RBEfTtFM4EM6C6mAkNlgOtuSoSHEy+1+V75mgOpzPiT1
	aO8ldtanWOYO0grNkF/4USGLCFjCZltWN4rVRZDMjK63VZ5ckBdeSFuIwUZze2fVqRckdp9N9Iz
	WOF7AUKOFEfCnJkb4QKp0H8a+xSV5aVB3R0RMOfI8NELLK1JwopPZ5D2G2CucNJ5tQ++dZCfp7I
	6COnoputfwcnWlNVNmBdMhzRvXVzkTPN7uPi9H2oKnYcQqHbrEG39NTeCchcMPnLaPu0TumiUVl
	hR3OAa711r8FjlUn4VlCm4LpthXlmAUIUq3tnfQ8XNqcPnF+75Ka996jec7JdQ4BHmDcalhqSX9
	p2DQkmaAcMqnZv43umm7F1b+Gdrg9rjjLpi3ANdpROBDP0yklSG0AW+LoovxCzX5QVjnEVirEvE
	gzkGcUG7Bl8lmHteL/tusZRderD6w9qKDRBaSQRKuGUWz
X-Received: by 2002:a17:90b:4cd2:b0:3ab:884b:659e with SMTP id 98e67ed59e1d1-3ae57f96d53mr3261282a91.9.1793260881559;
        Thu, 29 Oct 2026 01:01:21 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e7fe923sm3380289a91.8.2026.10.29.01.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:01:20 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/2] ASoC: hisilicon: Clean up hi6210-i2s
Date: Thu, 29 Oct 2026 15:01:07 +0700
Message-ID: <20261029080109.12240-1-phucduc.bui@gmail.com>
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

This series cleans up bit handling and clock cleanup in the
HiSilicon I2S driver.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (2):
  ASoC: hisilicon: Remove redundant bit clearing
  ASoC: hisilicon: Disable clocks in reverse order

 sound/soc/hisilicon/hi6210-i2s.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

-- 
2.43.0


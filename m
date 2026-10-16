Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4A530CD89
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792135525; cv=none; b=B5EOREdoFeZ+5zb5TCorUKqX45sdTVjoPvE8ZT1LjP5aLgi5FeDSCjr5HFcd7t1iee0BfBP3aPn8Fi5SBd6eVQIdyOyN8KRXpsWS9lmj6SM56/oODMT6vdru1roEFdtWgEzDO3P/BWltfg7RQNfQNTzoVq6LynfNDhq5u9qDgeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792135525; c=relaxed/simple;
	bh=Qbz8nuOiP9OofXx8GLDG3Qt+PgP64N4T7LZZ5fDHiXg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UsB3hLS2NvKc+LsuXhKMjNEmfXF4Dlxn6D46uEuqvSBoIrWhi9eqZi9hYzLVUAgWU5aWZ1/pOOtIyX6aVgB2iKznRx7oe6oqETw2a8HS+8wPfJsv+JjL8+TMOYk593rOVcNseJVveYcqRIV7eOCIH2Jf1WYh33RSmwOjdimQI1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VU/c62Yq; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VU/c62Yq"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cd62c570b5dso1590516a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 00:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792135524; x=1792740324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EgkUxGMv2Qr4zxs3DXvVEMujKxYkVD2LgF7+k73Afuk=;
        b=VU/c62YqJeA7mDPRb7saWKl5oYuFQm9wnEI7DDQikdJEQy2bYIY1pvTG8GnyIAuIQn
         FAHJhVUM/qGQElv+Jsw041T1twI/uYFxLIX1RYiLB4S7lzuWl+r7Bfr2+9VXxXIZFpxE
         Ri2OjIALu13vOPMMUVoGIFqu1a3sH4OJe0UXkil6q37p+ppeRqYYyZ38JbPvmgpIW2tx
         PDm8IcbmomzuJtNrZK5q/oDcbCORnS/iA+dkhug16FJf5yNyQTHuIay8wfin3o8GzK2d
         TNB7oS92CacZpLKaiDZWqCsUdovxOuj+hgaP8J544/Mq89a1c7jB4RtgxwhvQ62h/2Gr
         O7UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792135524; x=1792740324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EgkUxGMv2Qr4zxs3DXvVEMujKxYkVD2LgF7+k73Afuk=;
        b=KOVxsSprpdnrskzDlLn5yzzfx6wjZ9+abqwMWWeTuHB8hbrss61ApGPudygLMwGnlm
         TV8wZWs5/Y7jsragHrSrIUvaw01JsQMUIGEoLu1nacyzOyH8DrgUH998YuBiBJdZLqhW
         8OzzB8l+f9sincfdIH63QayoHLKr/2SFopYDU8R8/UYFUccXediQmcYNbMBzqdpU4yjm
         6LP1cAfov6LCSRjCn+SPMHAxbS93d4rAB8GLhq+oqheDkkff25qDXcWb/gPCzoEA3sC6
         PSgqjyG/fYyDs2bH+gCrf1b62xzm01tQslUv4tFSrqAxakLbWX1PemSU2mrFa18RbcMC
         8n7A==
X-Forwarded-Encrypted: i=1; AKwUvBwV7fHMakYSRm1ELJPzGx8xikQNGqIubbKQ2zlFRzIYgMAgzWkQK4njzSfvW6otpM9RfK96CeEeKxd3gxY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJMooDyUrDIeeWqq7X3EQhj8EybAseCnYJdpdYORSK4qDlQY4ag
	f77QVkqGluzNgR6pYxbLfEwL6+u5gmItI7m9rhryFWlSfFXWG0PwCs0x
X-Gm-Gg: AYBFou3KQzqdBICPRz6autWOL1e2nikOLrpL/pig0o1gKDXT8i+5ykdq9Vrjkls0afg
	GIMbEU2Pk5k9i93sWZo8FEqnNQOm0hpWfFygzBg0fDEn0OAkL6/6Mjl6WPeMVFSLrA+I2SVhbdT
	4vN9wqioyLcLQ4mh1ukc0q6jrhkFHvriFQxIhKlyeWczsobCssS+GOLc3NfWoREg7LIm3025s7W
	+Qah+Sg13+KJt4V7gxVwkf5GXs8aHHTqgpJuXdtzxTRudYM+8fWC63EDxBhdVPssA+t/0da+WrB
	vWmdeHSfRPRuJIPte8YlkGxigUD2ELX7oMFTXHh7FmWAFIfcFCyxwBYmhvcCG1asMzanHZFC8rE
	xQcfdDBYF78Nv4zD7V9LhM3ioRaZxlqXeuHHwj+o22tpas9L1E0BDD7CpW+vJQwreDbszWuXUxl
	erg2Nr/uEhy59Eg3NOTkXdChqkaI9Lh63EP9N0W6Qnfe2adGm+N96Icf7nx85YRjUAQ/at4CGhl
	oskeegXSLovpQW1lfjRsnRFwHIUu12C1lTG8APZESQ+xtxJYT1owAuNtTrnsvfQd3C0nHK9M1eB
	5yYXbS/QDA==
X-Received: by 2002:a05:6a21:790b:b0:3e1:fe81:b195 with SMTP id adf61e73a8af0-3e1fe81b890mr2910731637.49.1792135524162;
        Fri, 16 Oct 2026 00:25:24 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6549b6171sm615257a12.14.2026.10.16.00.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 00:25:23 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	support.opensource@diasemi.com,
	shenghao-ding@ti.com,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
	sen@ti.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] ASoC: codecs: Fix control definitions that write another control's register
Date: Fri, 16 Oct 2026 16:25:15 +0900
Message-ID: <cover.1792135144.git.sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These are more fixes found by the overlap scan from the first series
[1]. In each driver a control writes the register of another control.

[1] https://lore.kernel.org/all/20261008130953.2446692-1-sammiee5311@gmail.com/

HyeongJun An (4):
  ASoC: codecs: da732x: Fix definition of ADC2 EQ Overall Volume control
  ASoC: codecs: tlv320adc3xxx: Fix definition of AGC Target Level
    control
  ASoC: codecs: sta32x: Fix definition of Ch2 and Ch3 Volume Bypass
    controls
  ASoC: codecs: sta350: Fix definition of Ch2 and Ch3 Volume Bypass
    controls

 sound/soc/codecs/da732x.c        | 2 +-
 sound/soc/codecs/sta32x.c        | 4 ++--
 sound/soc/codecs/sta350.c        | 4 ++--
 sound/soc/codecs/tlv320adc3xxx.c | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.43.0


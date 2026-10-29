Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793260954;
	b=MeYzLiFvbdNoLsEFvJ7+BQGwTSSQ6Ihw/+Pr8vr+kKlvHENueWBp83L7ygQ5XbsZyogP
	 NvTzV7denQcmT6/ro1djYmgF35SEFdKJKrOcaWXsH1GDDYXBKyCAsMwQFfRWi9fvBd39G
	 rUBbaDEEcKLkEtGZmRgC5Bkl+CvU1YNjqA8UPXEkHgWKxlmJtgnb4ElAKoxagpf625wuV
	 WWenSWz73PCCNsgHD/rHjn+TBZYi/urVZ3f/C9iknR4zZBro5zdvcaVll0Tg0KVrTJAVb
	 X3MPeibCjyPMnLsnCokswg5aRcvWfVCSNeIW7tV3IkgLCoJhaRG/DhErVbsJwrNHwCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793260954;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=St2VWZiXtjKvJRuy6GbzBuRluyE1JtSs8Qqs+pKOUo8=;
	b=Sv4OQCKRbmz2dWcLD2fiTTXhYnlTVd2DDoJ1ERzhucSmh8VPYXQdXfc+Am7QXzkdEYnT
	 24FIXgtvYaPC/XJ1294iuVJJ9oTnOKYKrR2UpchSZKUGjY7uIKSSYtK/wjgK72dTt/bn4
	 WiLQIXQ0iyLsDyvwb90NODUSGm9hxnzLeo+GRDeMeYfUiNaBeTeMqTaR1SzS9u9ddlamM
	 1y9SHOFYC86s9nls3rRN7+qukcqPmEbjBneRZgWsT9cUZwod+Bg0JTNJdkCzLvQOt8k8B
	 uqjKtDjqT/QXXK5FXNqNwwCcgNhn4gVHAL82HsqheBfU5kOdpM6KHW13VqI4zt+iiLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Deg+Bpis;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADD4606A324
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:02:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4ADD4606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Deg+Bpis
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8a058315c79so937934b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793260953; x=1793865753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=St2VWZiXtjKvJRuy6GbzBuRluyE1JtSs8Qqs+pKOUo8=;
        b=Deg+BpistlKhDa3ssyrh63JbP2AhhKkJbefjG8vVLi4oMXu028EAimv/YtCOCkg10z
         AqOrxp9Ci7qRy0p9qqBtXAMcaMr3dAv0IRcaIUfd02eMY0KvvvPCWmrH98OUS8qPZPdB
         JF0k8Dea2Ty1MHCWfAYGP5u6s7X+HWTZgdecgJJL82UTSUWUgiE5x01ItSUrCQitTOhE
         stk+6205qqf7B0YDdGXm2scEd2EwyFZ1rsBQvl/5d5pFzU8XZKqTUN3QjxDciLoEGnhr
         liJmmf3huJGyLQM/enLoXo+kTqqaEWhEDos9XR3XkJGunPnwzRku052ZpE+XkTLSU04G
         RTTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793260953; x=1793865753;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=St2VWZiXtjKvJRuy6GbzBuRluyE1JtSs8Qqs+pKOUo8=;
        b=YAUg7eqTfDkQKUzyZMRQs7eva61sdm5mg0VLXkKCWbW3gZHlww2Ve/HW+IZdlvREmC
         zNg/IDMqXTu5+OksFBH49EgHPEytPdEpWGl7CbdzF9kU0Ea1jCioIv3lAbAfSJqzjSFV
         O51ccVQuGiu/07o9K8bTEioP0jPpKXy7U8fVXeRYNm1ZifMrp943AjqvNpfo7yrvKhV1
         Tko57l+0hMiRP4xMPihZwnMy8xByssBbuzJBHHFbC8vaq/S6v2sUCz4A3XVEmlo8XX4j
         pekgJbLMaesYUlDCAMTlT5i1TJm0q4W8KkXhig0Zm4bZh8qWTjG8F5ivzr+dKIRD6nXP
         /5FA==
X-Forwarded-Encrypted: i=1; AKwUvByDDRD4IxzsMPwDel7ZPnO279GcnxeHWxeEsmYoe9Mo298k03xMmss4yuUY0M9b1S1bpeqYm+hzh2gH1nI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKh3/C/meKbr7FNnsHIBOl2nKyQPkF5X/JTm7VwUeWLQ0Xcy3dA
	AVHaUQBCURf2iltzYFrihgtaG8fzbNcitmHnxJQudomC5FXmKV5YsjtQ
X-Gm-Gg: AYBFou32xcY75Px0hLoOuE+TrpEylfUG7gklaE4RWfqseU5gQqexx9EwX1JzTn21zDX
	kQX2q2D4ZKnFA09IkgIvkUj06IdLI6CMWAaGxdG8mVybrE9ab4bmKXZOU7x4Uf8jl3iU3H0OGXL
	QAyOn7zmOQmuLJmgVUS7AyVKXKWqG78U+GW+i3pIWpdvAeDP1l6l9ZYwHZOt/GYmESFalXdal5A
	CsugOKYdjmlJMUD5AcFDBGZQfkUCAT/UUPhxg+IGX601T82hEiNrYi2muKGq2Pt2hyEou9Wjrnn
	uo9y9XM0eBhfVwuhVHfxcu0wSKpIbmfdxPVUv5Pr8betSi1ZjyiTGQB0Zyz1Z9yBWF1via+luY/
	Mq7oSYqVNJq4wVXFyOgc7DVOuzx4LZRkIRJlMc72iOqkuOgCfvC3uybEz1hYuA9PgB/XSIbRFvk
	QbPklnlQAhyMWYq+6IbWoLe4R7ZnjXe0Nr+4r4oQQ3GF0ek5EqKQKhakMdON9dCv/8knJqiOLkt
	Ftdp7INexYg6iEOifBCdS8IpF6RYJAg+SpC70ayPRkn/x8M/s0eslAtxR9IDBATQq5spHiu9tdt
	NoiAfqFPbp9iPEBOrbY4ZJTuIFMYHLJXKbgZswba/FUJgkSLgIp+a+g2is9sZg4VXhS67cPJSUQ
	//JU4qdXRRFVjberXXqlDkUq89iN9t5GzFg7AfUXuYrTTfF47pa/iiPo51Og7cNu0wQ==
X-Received: by 2002:a05:6a00:a243:b0:8a0:3685:23a5 with SMTP id d2e1a72fcca58-8a6e83ac137mr4080730b3a.53.1793260953206;
        Thu, 29 Oct 2026 01:02:33 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc682d8sm5059547a12.18.2026.10.29.01.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:02:32 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	=?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/3] ASoC: google: Fix bugs in Chameleon v3 I2S driver
Date: Thu, 29 Oct 2026 15:01:40 +0700
Message-ID: <20261029080143.12304-1-phucduc.bui@gmail.com>
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

This series fixes a frame size calculation bug, preserves IRQ error codes, 
and removes a redundant error message in the Chameleon v3 I2S driver.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (3):
  ASoC: google: Fix frame size calculation in pointer callback
  ASoC: google: Propagate platform_get_irq() errors
  ASoC: google: Remove redundant error message

 sound/soc/google/chv3-i2s.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

-- 
2.43.0


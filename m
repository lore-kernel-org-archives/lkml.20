Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793053917;
	b=Ni5XCP0WwqcRlfi045vsUhjlsn6+FyuK3e7ivNXtC44pO3fr2V1cqrytiSBfcDrSYcZt
	 Lcuxcq8Uucf3pP8MzPr7Doi6SFk2lXraB5vN0ZwZ+hgJlki+Tp2Vbj8uM4fZIojxAK47X
	 JTHqYWMIqbXz4q1sqR0KQZPBQ1m5hU+GUj+GK4wUt+SePGlVfyOjqpPd+OHBUwmqLtC8w
	 Wfs9Fk4k9G8Hi52oOaXURUwSzccVycDsnw/j2LVsVOFUbqp9KeJgP1PGuKD3rXL+aUluP
	 AMK0mNWqV5GvbVaVSZIJgFEdcb2yLRgWIs2wJgu6I1encnmw0F2066vDZVjl7ViLVSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793053917;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=i66KXUTXEbPZ+43dRja9tAwpUa6R3X+N03pd/C5xTMU=;
	b=MBki2uejJ7ZEMIlnab+W2u00r57CRlVv2Y4lRoXPHnKLxfddLEbRZiEoM5zU2pywr1FH
	 K7F8Kc+PymohHOxm3iv29s4J6eD8KViSvhBBohVNjdZju+dPC/5iEgQDL+BTiCQ0dRf/Y
	 /5narCLsRl8PJwSJdq8UU2Wk7wqeRio3UiZEomlbPJ41RrfP6jkUpI2MFc7uQL9+bIGuQ
	 yr5aqWdFeaUU6Bk6/mLlBAfp7+xnYFlNgiK9VopzWfJW9ZGck6aDFFHptCztW4lv3Gbzh
	 Q18+qzBUgLIY52WYaXPnhcUzO4Lcjp0vbFsuqlFTxyc1kM863tDjFKy5nnisEDWCLSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=d0xMsaaB;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BDD606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 22:31:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26BDD606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=d0xMsaaB
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso17329335e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793053915; x=1793658715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i66KXUTXEbPZ+43dRja9tAwpUa6R3X+N03pd/C5xTMU=;
        b=d0xMsaaB4WGjhMGrkqJN3tX6vRJtYGRSPRYoGoe7IZO7UV4g1DmJdKOBC8MC0hTe9b
         M3dc8+Z6enUQtR4ba2NqVaQYFK+jToBuneUNHPAWzRyjufMRUUn7X8OAuPFaMViZacY5
         tGEeiCjn4N/mOuI8HmFE8f6psJFG15ukXejnByOU+7as89+1MJyIkdg8wVNmO/fkqaC+
         wMbr55l9WYeD5beBpoGhc+H5K6r22JrkwutGP69iz2rfdCfDuSors96/KLnr6vzWKuE2
         0dhNi2/o8cgV2Lyzyv5DWV3FwPeiIPdjANz9T/0C6n8lR2IHxr/u4l3wn57uy2rUtA5y
         9m9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793053915; x=1793658715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i66KXUTXEbPZ+43dRja9tAwpUa6R3X+N03pd/C5xTMU=;
        b=h6G2jQ7xe/mvZIpE9GdV3r5k65fdlSirDVN4zRCgO6gVtaO7DgTqPZjnYIi/Edv++L
         fjcIaiysII62iID1UbgDQgUu5oH1h6BlrZBM0PI8eBx3lgvcO3S/xZVDOfmbWqIsdGOm
         t1KlvagngjW+fuiyf5Ybn6dy2vjPnzqg5/GwBJaYACsSkP/VBmOD/maFqaUJOUd0Q8ve
         CYICCocXHsEe7ZdQ8bEv5FyMSys4+bOlgjKL0UKC9zhntAnU93rDwAAf344uarRB87DL
         wPfdkbRlwAIUpi6uyZMsH1xBV2wW0WaZQLaZNeS4yjpWsx/mGesOrlXMqJSZWuvNJ69B
         axhw==
X-Forwarded-Encrypted: i=1; AKwUvByBmDz6PTDXJCjy+ipaXsBrmAgp2NA4qlSO16hLBqtPcl9lxZfCU4D+uMCdkqv2KMPoN6n+gGt9HvXOV44=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBTJzfZLkJCZxFq8yle6ffhIqT1QdRtut8jMgYTH4HO/JqyroA
	2jNRxpUbCldYrRvMHcYVnsMe7CZzdP3epS4kdvvMLxan/Ibj8uDEMYc=
X-Gm-Gg: AYBFou0PN2GXHAdiconI9dNfQ/LPBcd+5FsWIi/Cr3w78dauITm+w7NYDZYdKlPYy3t
	EfmUpDGZLiyd885cG/UMo7r635+TkxA4sWpB7RE0B6kq6uJa5WP25rph6w+5hdQwyX6JNRHyI+J
	gxC+MahAd1Rr8YoIegzPJ0JK/NlwRlmpR1gnkxThS3flUhCKhli0fVJzOHLxdpB/Utzy/hfXxVU
	wx/an5jpYls9W4F6YhqtsNba3bcxFXqmjq4bsggjwFazHoPKXZaDi+aMi+N7kV8hgzFnvW9BvZu
	c8KXiVZSJ6JshM67u9T7/yA6s4Xktg/wPCzCjPfvep0+/g8amdy2l4JjSIQiBMRbtpcsQnqoNvK
	qrHJEgsiYprtT+ywKFUDEig245uMMplgb4NVMlqV1m7aZAc4aLvcG5jJNTCr1PACkGO1lQQ4BGi
	8QeiBKj/zO7HZpSc2d9AUxHVRzBg69gDlYKzC9aicf/S03baBLKXkEkkpAEQz216xpsbZWKxXSr
	jTSF1xTD5EeeExNhvWH/T0vd8hdb8giqpTF5Q==
X-Received: by 2002:a05:600c:a00c:b0:4a2:133:45e1 with SMTP id 5b1f17b1804b1-4a35acd56d8mr145273565e9.24.1793053915397;
        Mon, 26 Oct 2026 15:31:55 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ae28sm229743655e9.2.2026.10.26.15.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 15:31:54 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: Johannes Berg <johannes@sipsolutions.net>,
	Christian Lamparter <chunkeey@googlemail.com>,
	Stanislaw Gruszka <stf_xl@wp.pl>
Cc: Ivo van Doorn <ivdoorn@gmail.com>,
	"John W . Linville" <linville@tuxdriver.com>,
	Kees Cook <kees@kernel.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	tristan@talencesecurity.com
Subject: [PATCH v2 wireless 0/3] wifi: replace open-coded IE searches with cfg80211_find_ie()
Date: Mon, 26 Oct 2026 22:31:52 +0000
Message-ID: <20261026223153.2087218-1-tristan@talencesecurity.com>
X-Mailer: git-send-email 2.47.3
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

Three wireless drivers (carl9170, rt2x00, p54) each hand-roll their own
TIM IE search function.  Replace them with cfg80211_find_ie(), which
already provides a correct and well-tested IE search.

Changes in v2:
  - Replace the entire open-coded functions with cfg80211_find_ie()
    instead of only tightening the loop condition, per Johannes Berg.
  - Add pre-subtraction length guards in p54 to prevent unsigned
    underflow on truncated beacon frames.

Tristan Madani (3):
  wifi: carl9170: replace open-coded IE search with cfg80211_find_ie()
  wifi: rt2x00: replace open-coded IE search with cfg80211_find_ie()
  wifi: p54: replace open-coded IE search with cfg80211_find_ie()

 drivers/net/wireless/ath/carl9170/rx.c        | 27 ++++-------------
 drivers/net/wireless/intersil/p54/lmac.h      |  3 --
 drivers/net/wireless/intersil/p54/main.c      | 30 +++++--------------
 drivers/net/wireless/intersil/p54/txrx.c      | 12 ++++++--
 .../net/wireless/ralink/rt2x00/rt2x00dev.c    | 30 +++++--------------
 5 files changed, 29 insertions(+), 73 deletions(-)

-- 
2.47.3


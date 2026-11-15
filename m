Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794732239;
	b=FYog4P3FVWYKDvC0jcNZSiQS107SVmLDuYLlTt0sYZLsHKZi4+jXHS+nRSGHp1atBrdF
	 0hVDfSE1Q/BQGi/5hNDcGpCTZl1CKDpkPYXDsS8Z59SJ0Q14IKzdnjqPeTtq6HLLkLouZ
	 oo92auwWWv29zvieejqYPibS0YZ0XCXGu6dZdO5HBU8XSvFC9hHWFSGiUDvnCg1Bdz4oe
	 przk4lEshmCen0NcmgSfIhlv99Mi0EXFj/lE8rqrz2KsH+tarQpGCS/fW/6kNhFRFbhM+
	 2bsMeKq6Rm60F2+EvafDDXJVmcFFUO5KlVR+oeNMbgEZglKovY3IF+AnzMOouaB9SFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794732239;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LaVpmV0idlXMMI+f1VveIpghVZ4EjsJ9ZRyJU/LLjxI=;
	b=MWbiAnMOxeim2L4IRPrs77+llVAFLQq/FeiwdelevWrSPJgldyFZ4D7AuU7vlPOrrph7
	 A0KmggJc5Z+HAd/onuuIw3HtncpkuMMRv/cwLQmV7wEeshPpKT8fRUkTudtCXr9hon5wK
	 oeNxkSJczSgzekFVWwEwcWf/lTXlX8qcB9TTVz2T1ipy4w/jJM8IPQxtGp7d2GJOE36Ky
	 /KwzNpwmiWky71yBAFdsrYIarK74WLyHExSELqjhYvN7BrlDXWtOi8UVlrQ5xHFn/tLLY
	 vJu7uwvWe9BIgOo24BjILz1Rj/hK7MrPg2akNGcyuDlLtvBELXaZYTJig/HjI+6mSHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EIn+1UM6;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7021606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:43:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7021606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EIn+1UM6
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4d581da0aaso307171766b.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794732237; x=1795337037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LaVpmV0idlXMMI+f1VveIpghVZ4EjsJ9ZRyJU/LLjxI=;
        b=EIn+1UM6I9MphSz8e1d3b8lsbhAYFhuD6LODmakKs2seBRzp05T+dxJpqAm1mFbIF+
         T9kGVloMghiS/rRUx1NFi0Z3yOaqiv6JNnz3EhThAfl39twaDaSydmwh2BbdGqojSQcw
         YnBRUF7Iwl4IsFe2UpXO7wd0TDadQFhsoFaDnL3IAlR4l2j1IRfA7VYJVjGWUnwuOy2P
         /LQ3mwIg5KIcBkMLYh2nmKSO+v3z/QQpEpvJSBilPLUQkA6s+/euNCywbcyDo5U4PtDd
         D7jt8AY+3g7qmaNOzx8EjPrOOPAej2IiQcEsfof6yRJ+b2sSSZglZ7tHsRIDpHxAfT8W
         Vltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794732237; x=1795337037;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LaVpmV0idlXMMI+f1VveIpghVZ4EjsJ9ZRyJU/LLjxI=;
        b=FllzApM01wIqFbbi7GK7nLT/gUrCoPsjVhiaX7ANVMTPIf1qGQl/HPMxRUL89EWTeC
         izZ+XuU6TffMkK3NATNA/qL2RDo9nENdAGDLc0rIcxJB9D3UMYFeLMouR9PQpfnoTzMx
         1RcjUOYcpglvyyIwTDGs0eXPlEVEJNBZxtjV0NpyZDUnoPO82bczIeTlx3R02REuS5sI
         mHTuOLyTyI3uZLTzEFdmhqzk+JbJrONQVNtrhR83+OofGNdDsN8iJs1kD5rlMlLpKRUT
         NszJ3TI3YapdkaWXhC2c93yy/y9nSXeUOxzoKbKngaiJ039oeGtYPjajO9R/JtCbMslk
         A5ug==
X-Forwarded-Encrypted: i=1; AL+hErFgqTLvStKBfNFDJiebzh7/0vPAZhWbv1PDACsZxxlijhQgBZ3D5X1UMqhuqT0nY05zODlgVPlbVKTZ1EQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9w75XKbE60y0j6j/1shTiXmXwpquF6XVNBrZUw9xf7WLLCM6oz
	AuAYSDIOyamUdQhkAgM+WkHsftF5xGF9h5eGkaODVVvL2wIEpLH8tQyp
X-Gm-Gg: AYBFou1UWbJYoXIXc/Em9b7BNY3bkGp3gPXcYa1Fj8eFhEiQfzhmjEd21MlC4EVSRmJ
	strJhBkaG6cqnxdX+X4OFUI8tQZe5uIud0lx6RzWWYDYY/uYU2CFyfRY7WKTrgguVwrnLvYokRj
	2SjNgaf77uilIeSgGL52CUOMGnVNio0PbN0pTmjWCc5o6yDmZS2o9TznrZs1FWpR/Jt+0HbZQ1V
	8ry2jfeZanjjnTzlvaF5g40hg9VOnL4gDyQVg5sfMgfUZ6hmFSzxsuqgCPfdi7UcMeOystiDwjv
	xXAYjnV0E6Mdvvtqbarb+31sF2opJaFfe8JJs5Puq0IwakeD8y8/3Uvv7mxflZ4XEl8d3qo3kdK
	mi+Oc//dT5lqJ2Bvz4WsHHm08rIoEaXi1FUVQOAkbebbmJE9ZalLT37vh/jWRTQ73JUhJC3ZyTo
	cwd9rLK5zraEZasbapjajqHaf8twIVcdwZouqw5Wp8qZyWUhhUFFuIsbnYIpPwAhx6+1gkL+oJo
	2OYadnZLI0dMmuukpw/9pNLHm9nIC8gBIhTe108LrhsUOBn1mp+/COpy86DGmnaAX/3qk8ttFjr
	yty0FO/ApdZoCHqW7hijaM0UbX3awPdRpUWg0ZH6QLpgmsIe2clwXadbPIMapWmWuPWcBDL9eqe
	iOF3n4SdOWA==
X-Received: by 2002:a17:906:c14e:b0:c43:ae92:9ad with SMTP id a640c23a62f3a-c5096343974mr536243966b.17.1794732237050;
        Sun, 15 Nov 2026 00:43:57 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b979e9sm288937866b.85.2026.11.15.00.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:43:54 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] leds: lm3533: cleanups and support getting LED sources from DT
Date: Sun, 15 Nov 2026 10:43:45 +0200
Message-ID: <20261115084347.70592-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Refactor probe and switch do managed helpers, add support for configuring
LED sources from DT.

This patchset was derived from
https://lore.kernel.org/lkml/20261112081941.41363-1-clamor95@gmail.com/

Svyatoslav Ryhel (2):
  leds: lm3533: Clean up probe and use managed helpers
  leds: lm3533: Support getting LED sources from DT

 drivers/leds/leds-lm3533.c | 105 +++++++++++++++++++++++++------------
 1 file changed, 71 insertions(+), 34 deletions(-)

-- 
2.53.0


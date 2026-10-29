Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793298208;
	b=xY/AB5ma0qgXdFEmmWeenJqW6xaq9p3H4zhWS867bms3Ce1u0iRTY3W1ZTT7RmYZfAHf
	 4aiS7B6H+q7qvr+00jMfYQbI+f2Ug6OVU2r/LSvtYP2Yrse2A+JCw8o8CAwvXQ4aC9XU4
	 ST6jumcS3fA4J6cDvpmDuWMTRf9q/EH8w5foDhQGXOU8pqjBIpvE0VA3uktXjowINMEdk
	 xM0JWbofgGRuXnptsNLIGx9MfGHuPMR3F7XFK2FXI9TdxAg/b98A1EV+1pHnwfHFnVHoS
	 QJuMyDKOSCVLZj0xfRuNHWfjkxbXHsx+5YlvOsujCT28JPSEtAzi1Iodiq9ehPK/kow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793298208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=m7m/PP9iIYn4ZcYdo39mudQdZHZfOuXSk/uRU0Y3HEs=;
	b=3IoEIA/FhDCl1h/W56EP/QUY8HC2OJqrjVTGZAPM2IkuFmQoYlNUHnDX6vstbx3WtPev
	 eovoEGqNvfH0zLWNOlSkQb/Yo1dF+ktWUVzzLd785yu3T23WacohynVtklEc46sbFV1TS
	 LLO2KmBc8dnxJHbXnGhqfJiQFeQ1IykMbvGm6V4fiU4jJkQBSN/egTVQtpx9v5tCWJXbQ
	 eLutEINKYeVKyLezsKN0HtPry4fsmXPAHiATy+rq6tD7kihC8MUKtSgKGr0IxdDN5aUrZ
	 ac0U4aYm6WZP4p3mgYlTuaQm3UyyGuqsAZvDmx2gjcpO3T3wR6k++snBiId4nbrf6iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=avK8JkzH;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8246F606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:23:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8246F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=avK8JkzH
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a20be3b39eso2314595e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793298207; x=1793903007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m7m/PP9iIYn4ZcYdo39mudQdZHZfOuXSk/uRU0Y3HEs=;
        b=avK8JkzHO9LOAFxzR23C+ZNQFm02cZYvkYDS7m+0V1Wo5zuoWWBeGjKIFUeX9ZVxOL
         AyRihCRzBoUG8WnELFmgzSldcwqLGFTVsBUfqv44JeOodfr2JUdMKIVkISZVLJvncoia
         UOSKGDoZp879WfxMcKB3NtsnFx9Qt0uw0LaMwPcqgLsCx5Jew9Jz1TKavoz+Yi8Jb65/
         K1rFDnkkBuBe8IV0pdR1+oRo/PBN64SLKFDlXBNyhQdHhiXMII0EG5aNjEvPxDGI02P0
         tHyCilb2hSeK5juONERPDaumFrC0RBqKkq3SwhK0euXE9LgVum5gxqYYg2nSXG1a0tO5
         Kojg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793298207; x=1793903007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m7m/PP9iIYn4ZcYdo39mudQdZHZfOuXSk/uRU0Y3HEs=;
        b=OLWTVcd9DTuBPDwtIkpCCQg3YZbAZaxRfEyzf5rvtH+iEjaFbxKC38dBWujIzte7P0
         fBnhfNKBa1MlxR9cCTMPBzBkrM+yv3BDpoCfktLLWW59pMd9qZFCEdSOJTMCyrbWKPxW
         vRh51RdSQeLd23z3PS/q3/AsmaEYtspLH132cVEQR+4q8Bk/LbnpEunzHjdYMvfzfYjS
         51eAqDlzbxNhHi2iEdMNvqrOOEnnptTV/GYT+hZKsttgD7sCwQ3W4yKGNRgYj0/Eyrgs
         ZSj1xdZJLZEFBFTrlmKtpIefw0PQA2SZoAgqtKVZOtIqDW/UNyOvE90d/fTCBDtQDenP
         6yAQ==
X-Forwarded-Encrypted: i=1; AKwUvBwoI4u/YM4T/Ys+6Atl4+PIS1l3ePDljZZPh7icO0lQ0QYl+yGIbUpaH3DPJNVrJL5tKT6/rWuh+8BXDRE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKtOkmTX2uXdjuzRos+UPmWDXDEqz1RGWyyyxfSZ0Z9u8aIY0BS
	IR7/860ORPBdDKHwA0/+EIfjq5UuWr3gNjwQp356U5YgkrfBATLJecSm
X-Gm-Gg: AYBFou3gUwucXREQpwPLhE4wGQNCLgwq9al6bJv8TpFKYnoDaKHeTm/unMWlSTwcpUP
	ICpHOKO9tqWvrbMiwj4HP88k6xmOOMbz4dn/PI80aHp+oF8WZH+BR16GwW65IpajEbc1Qd4Kojt
	McAgrEC8TdpTGyhGARdOACTIfoIj3DIqAMgq0LQY1w5aytWy4N4cWy/zZFWp6OlzIZtR39+c/nr
	frZGlSHvNqF4qek+8jpTIuZ3pAdyOCaSl0SvzfgFTg1if/YRvvLEp3zw27zBwqrDC2TYEekCOb+
	J2OT6CXeFHIArMlQkqTetnqCkqlD4QzjqbzDRD07f39+D2x41tHI54sWqYtBu6m4c4Xr4odhh/Q
	9V0NDLxHdP3nxlU75qMhGu3grtNSzYkWUxdqvvFzWOOdcCeHVQG3tibv9qmtrU20Hs5nyuB5cRZ
	rjjxqscmUBnEi8JmcjwgRJnqmJuu1kdnzODbRM/VVnTEihFKGvkWD4v/cT1RoIVYFkTQx++z516
	Yjxdzm7czC/NuHZ49zP2zBZqJix+ILOeRY3Xn8XjVtlRcA1BqxZRWhKLIj7gKeM98OVElk2+Y4T
	6c9bJdlsEKBPu9KGYQklRrsi6AFC
X-Received: by 2002:a05:6000:268a:b0:48e:5d5e:c27b with SMTP id ffacd0b85a97d-48e6e514692mr459042f8f.6.1793298206614;
        Thu, 29 Oct 2026 11:23:26 -0700 (PDT)
Received: from debian.services.ir ([78.154.61.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e6eb97b29sm60896f8f.47.2026.10.29.11.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:23:26 -0700 (PDT)
From: Odin Mirdamadi <odin.mirdamadi@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Odin Mirdamadi <odin.mirdamadi@gmail.com>
Subject: [PATCH] staging: fbtft: fb_tinylcd: fix alignment checkpatch warning
Date: Thu, 29 Oct 2026 21:52:44 +0330
Message-ID: <20261029182244.173276-1-odin.mirdamadi@gmail.com>
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

Fix a coding style checkpatch warning where multi-line function argument
alignment did not match the opening parenthesis.

Signed-off-by: Odin Mirdamadi <odin.mirdamadi@gmail.com>
---
 drivers/staging/fbtft/fb_tinylcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fb_tinylcd.c b/drivers/staging/fbtft/fb_tinylcd.c
index afa8f1c74..d58b12472 100644
--- a/drivers/staging/fbtft/fb_tinylcd.c
+++ b/drivers/staging/fbtft/fb_tinylcd.c
@@ -38,7 +38,7 @@ static int init_display(struct fbtft_par *par)
 	write_reg(par, 0xE5, 0x00);
 	write_reg(par, 0xF0, 0x36, 0xA5, 0x53);
 	write_reg(par, 0xE0, 0x00, 0x35, 0x33, 0x00, 0x00, 0x00,
-		       0x00, 0x35, 0x33, 0x00, 0x00, 0x00);
+		  0x00, 0x35, 0x33, 0x00, 0x00, 0x00);
 	write_reg(par, MIPI_DCS_SET_PIXEL_FORMAT, 0x55);
 	write_reg(par, MIPI_DCS_EXIT_SLEEP_MODE);
 	fsleep(250);
-- 
2.47.3


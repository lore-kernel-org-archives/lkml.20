Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794329286;
	b=z8Nilmr2Vpm9ksNWoIL0myq34LKwQkv8SGfYV4AWZk5pkmL0Pm4eAGFrCNYapybc8OJi
	 A3V6Wrd7TeU971/q3K5k8ezr6/Tu5T5EZDrAVlF50vQWSu2ob9RdaCUSfbgdum0tovggP
	 6Wh2hHSSF2kBgEWiKCbTafZM68Z9vRqdJhFnV8+7VRrpInuT71hJJ0V5HH3b8FraPgsc5
	 gRwOKE7+cq7Yf4QewarkQVH+tUTyqfogfjrwFc28RucW7DP0C2Gl+sxkWcoIoW7y5pRkz
	 3Tai7LiZErEgoW7hm/zn8Yd8h555ZsujSvHXA2H9Y5UTW9I6Mx28vkBi6QuWNQA44Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794329286;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ZKnuTzByaSSbot1/XuQEQnimjuDaYE7NsL7Tsbajd8w=;
	b=gSR63wpg6z30IIpH+r/G2JLRbbaGdvunDvz11py9146rmkYbIDZYuBsE3FEMAmeDXcA8
	 ln7RnTStGQ63Eyw+nP6/ofqBeHznxb3m/gJ6gHzs68CBKZbJnUXqQ+YPrIZP1Xca0MRmp
	 7gghzJON34y4jwNuwO02llF0LdHDBKQiXA3EszX7POKQppQtQDDjTj9XkYKYtKv6poUxD
	 M2LrBRYKSW14MoZa5AuGmgNZAezLFptX0CWVSnXPlMwaOsRDRpHhFxXf0mr9keQg2n6Bx
	 pe52kzMAWj356MA9oWX/QW7qsvnZR+nZlpVkPn9kKlL0fsY6upVoUGZgw+muPl68iMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xPVmzV7b;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842B760A261B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:48:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 842B760A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xPVmzV7b
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso22095815e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794329285; x=1794934085; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZKnuTzByaSSbot1/XuQEQnimjuDaYE7NsL7Tsbajd8w=;
        b=xPVmzV7bBCrjPO5TMTPe8xuJ/kPsmNxM7HHYoJwmaBOTkYFeywQ6fnhiNiedU3v8dB
         BteQJq72nW7Y3CKSHy4B2FYKAcymZx6v5r5gG1PfaCYGKxLhptSBCVXIB3sE7878v9W1
         /dzawCpIwxYEX3MEgTn8Yy7zHZQJGB3Xm370JV5sx+qv5FVNHCwYEopJmlYixLhA5ZAr
         CQBJ2mI+bNZ3vDY3A5m7xXT5CEOH7xpruzqeAjOgbtOGA4rTDPD2nMKXvpRHKBzDquJV
         tPwKsFD2xgzXWzcOxfNPL0zAHEU8HT4tDtlewVnIum2K7u9SN6A4hpBfXtTrDBEwMhWE
         r2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794329285; x=1794934085;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZKnuTzByaSSbot1/XuQEQnimjuDaYE7NsL7Tsbajd8w=;
        b=QA3jxuEiWW6+Sits4mVp3A7+d7KVd2sW0q+qUJ0iARQYuis67p2dugA1Y7BcVyqOF/
         YsA3Np7ZQtDzFtp47Y7eMD85cwKfoq8ywsGbCftRyphpuJkVHoHHKj4YNHVdOk/1/bZp
         hIigpogdqYNAAGVVL8NLLquI8WAFUXks6OZ/mnUEO1srNbje796aoN3Ty7L2pgypRAP/
         jlhhOHKpGurvFt0Q5C68yqVfzbAGlwg5r8oM3y50E8+Tj1RVCtDOpz0mvJTzqrnHU0fO
         FQDy3XzGUj3I7Zq5kxDuK85bdhQtp66h3SgWE/fd4IjH6SEBN4SkcHYLiLxVVjY99tQH
         tRxg==
X-Forwarded-Encrypted: i=1; AL+hErES3Gp6yfK7LXUqfutqyYq1WGM62ssAJfRZMVxpd8DLyZ3Fo9D9VVM/JwJqu7kUon6bowq+kNZHx8ajnCE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+R992NU2ro0bd+wrbuykP6Wwf+B2BgNEVYzZ/FtHTmqkBoUQOn
	cbu8Sexl/bus5L8aCuQ2JgtZ0p2+mOeKVEzJhSHTmSKo/cEyc0sIGAIr
X-Gm-Gg: AYBFou3FaRxcn9th1ABtm58AnhibWVK6gn0kKIR+LZKaJEI9pOzhJ++fLL7OwL2RKdL
	j/wYos26KImiwFHOeS+fz1ef8o5dhWsKiDoTzbXbvlOR14fOBzqM3OJ6ErPz2oZJoAW8zzzC7Bh
	eHU9HKaCcxO1iMOpPneEjQJ6Cc/bZJMW/1Jfwle3LyrNgtVwlEI8h0YvijJ5EhujlLscNWWp21Y
	MRlwY45Qze58nGCYHbFcs2PsVoAcaW/I1eAqm/uBT9Aq6CFd6t4ciPRkkOdvz4pVYAoR1t6WAHH
	HSg9b3EbwWcp9nynj47wAlF5vVqQdO/FO++yk23dz56EHCXdF32X18TtN+Q1UAe6DF7zMbSTuYp
	BuaMr3MN59P/Td61W7aX6xnNjFh2FWKgVvkmGaDKcrUbILMPr8zjUgxtFEctlCsMEAmdjIKPr8n
	zVPn0RoBHoX6nZbqBRIJdyF56g4kyO4xOqUMG3p2HwGCHxL/MjW8pYiwhzMFXac7ijiCf72rX3J
	c3Sq/8gr8c7UmA+6tPVoyuc9Z3DQtcjOaB+OcrZw/fuR1AX4aUCLtTpUwpOCp/+MyEuYC003pf5
	Z9HBCOZ508a4BoNg/0YsFB+WdmI+XUwo7mmcEUtxovHvgSr1oQ18U5Dz/OhacNW5AfuE60FgSTd
	itMdf9IdtEpB6+8M=
X-Received: by 2002:a05:600c:3d05:b0:4a3:598e:e7a8 with SMTP id 5b1f17b1804b1-4ba0230519amr58148825e9.4.1794329284863;
        Tue, 10 Nov 2026 08:48:04 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0233e5d7sm58289665e9.1.2026.11.10.08.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:48:04 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Tue, 10 Nov 2026 17:47:50 +0100
Subject: [PATCH v3 4/5] firmware: raspberrypi: Document memory barriers in
 property list path
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-fix-raspberrypi-firmware-v3-4-e001feb542dd@gmail.com>
References: <20261110-fix-raspberrypi-firmware-v3-0-e001feb542dd@gmail.com>
In-Reply-To: <20261110-fix-raspberrypi-firmware-v3-0-e001feb542dd@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sander.speetjens@gmail.com, Manuel Ebner <manuelebnerli@mailbox.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1089;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=u/0CXjUNJhX1Rd5kE+A4P6p5kJKiKCpC4dI5cLjLhDQ=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBq80rA5oweI1D8pEFyiEAbgaJgSX6prZmEY9bqT
 Jj1+VYvTtCJAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCavNKwAAKCRB4zXhFDAXI
 Z5qFD/9snD3hL7PG1O7mpkf5M7Iw6hLyt6XYWllAf7G+6Yux6pLRVPnMwifq0GyoWl4JGCxI2Ra
 MatpWsIwzW64Kg2ZrtxDPQgUpmEz593N6XbUCZJyRdG8GKVWYHAdT5Xgb02zGJ/PAvyVxPuLZCm
 BeLi0SNzqH6/Rpg2FQBtR2VoPkSOx91ijpLngvFRMXDQKNxvwkGcgm9SqQaUHa9ozCaE10PWx9e
 7/qiD3SVPLbMXOQt6xNbp97QoKZ8Q6Pr74JIG246pRFAUfOxKB7mqGZbhi8IdhLQbQT60SAZg7y
 uQDhWedQMeUhcZqrZfiIHtupekcsuv7+rGWylMO/D/F4mv1hHZgBHf2r1hYr4uSNQiQVUZCpKAX
 b/N1P1sGiGkxggws1qDV24srGjfT3/o344MTKIFx9hkm2wvwgerJQFG6miNinZFjPS4/GZupD3S
 YJBCpvLPzZ6JgnmItPAmuK1t6Q78B5rxfIvddhh62jCYRN+TJAWsPQsIt5v0GMYv4Ac6RGQ6o5V
 XS+2cuuKv8Sxwd6QZw6mejnAKwzaPaCXlovUIZgP3Hz6tMMZeFp3T3dLjNqR/JlSF/ertZvNu2M
 GSlHZZRajR0SFiMkPkrV80ZTRBp9Svaphle/A8gAIAbJZ88cLtJOCJtfYpoWSuKmiZQ9avAqClU
 djHiFh09WZgfmFA==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867

Add comments explaining the wmb() before the firmware transaction and
the rmb() before reading the response, as required by coding style.

Reviewed-by: Manuel Ebner <manuelebnerli@mailbox.org>
Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
 drivers/firmware/raspberrypi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index 04163c3f385d..ef3326d5cf30 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -111,10 +111,12 @@ int rpi_firmware_property_list(struct rpi_firmware *fw,
 	buf[1] = RPI_FIRMWARE_STATUS_REQUEST;
 	memcpy(&buf[2], data, tag_size);
 	buf[size / 4 - 1] = RPI_FIRMWARE_PROPERTY_END;
+	/* Make sure the writes to the buffer are visible to the firmware. */
 	wmb();
 
 	ret = rpi_firmware_transaction(fw, MBOX_CHAN_PROPERTY, bus_addr);
 
+	/* Make sure we see the firmware's response before reading it. */
 	rmb();
 	memcpy(data, &buf[2], tag_size);
 	if (ret == 0 && buf[1] != RPI_FIRMWARE_STATUS_SUCCESS) {

-- 
2.56.0


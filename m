Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793624930;
	b=ZMCOaEQ405orVas96Cc8KshyLuoCjUzP3+HDt+qKjtd6nN0kdiow89FfrvR5WvH0YrHa
	 qxzfGkScbHnuE3mPwDuxqRklLJm5gUEP0ojQg3UefhskPY7blXtCWusjceD9s8q88nhmI
	 S0A8YwfPFsIX7vvTdmGJ66oRXULhMgzZ92P1aZ25DqX2kvMdYI6RDTyfqWG+hCqFJp6E3
	 5n+2Zb+pxwOg0mpZo7GEUIwX48eHFIsNf1pPiPQnTuG8GweZRaanh1basdZlIzxVbbZX2
	 voqI4XkNxhFKvuwj96EsOh2QglvemRNULBHFfhM2SAr75xS9JT936syxjq8hQ3RAUrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793624930;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HL+XsKXB5YzM8z1rqG2scE0MEUmB4Pwjr8ldlu8gNRA=;
	b=HorXsuqepjRqPtLeakJP+ZnF/0Grf2jWAATu/m9957NA7a3nKagn1nTbeYMMc9diDUO9
	 plDdZ8+l8Oebk8a/UdtHtgcTU+M6KzVmvjROJxTRRtWJGuNfUVAdB+K/I/Cdkn6mjRtkS
	 kSJfqKtZQ0rQr+M1dooFYAqQ3Bld7xkN0bmhxWkQuOSkrDqayLPwy3tlY1WhSZZG3HMtv
	 075mvEPLgXjTPbB2hWpdk3IB6XbLn1LjX54Lib3eqZN4m+LxFQFkyTRMb6378R8hUiiF7
	 NWhuuzAkIwF7rJReQUncPtySO8cPvK+BY0T6DDZnIkvb2uWBmoxPvaQ6UaRV+DsPXJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XbsWGetg;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC861606A331
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:08:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC861606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XbsWGetg
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3550c917fd3so4080661eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793624929; x=1794229729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HL+XsKXB5YzM8z1rqG2scE0MEUmB4Pwjr8ldlu8gNRA=;
        b=XbsWGetgfmeo7AMDc9fNFDg4AmwKw/yrJ9iTrdlAz7gsiKcMK4A7yO8bvXZ/jA63w8
         4eIjWWXACsgf7banwZHPjOL7D/zYnwn3fQo32N6YNKcJy1aSiGMeqCUnOLQ+QFV+QwhW
         mYoKy1WYy9sYOzXWSDPctygRPuD05zzyZG8Lwe2ekUdv4cWOF4tymkmjutlNW8ugoS/h
         VLxD6FMay1fu+Rd/3zrqPLn4Sg8g5AfIdyRlu611dyX+V+o30tlbii4vV57jdvF2Xv2m
         l4YYqKlKok0GMR7NaHDQBd2Vj/YBpUGHj1ACQEFKV8JKKvFEcHzZ0W9FaKmciwO1z26L
         auTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793624929; x=1794229729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HL+XsKXB5YzM8z1rqG2scE0MEUmB4Pwjr8ldlu8gNRA=;
        b=T6aconPSGoTJjkQ4nVKLYU1xf2dolEZ+dUibzpDPNXovj5uZPOBBZL0gV8FAsHrbuH
         zqEtxv1wyQ0ZFZdfFQaSb3yWXP4tIwUflKyVGxMYQMCY5bmD63GulR5GY/pKk7wMr3e5
         g1GLyWZ46YeryLiu/pkOdTZfgPtVBVEw+Nj4pp+31p0ttJ07eMD1mabhglyP/yL52fAP
         pQ5bf3xtkxC1KMfNpCSQtefKyT9wizmHkbOUhA2Kh4FoCK1Z/kzqJgkl9h8RGQ9LWDUZ
         1rmkIbLXph1CDI7g6XXPz/2Ibym2qQtnUjb3CbzZGakRHlvW6qa22Namp0mtGr/ByWws
         lSYQ==
X-Forwarded-Encrypted: i=1; AKwUvBxiwk7LEuRtj5ocg5N3J7ddEo9WCH5H+pPso2f2C+XKIv7t1aostw7ZfhOh9NS2ay2n+LlaVJqPq1d/m6A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9lrDDGUrd3Jy7QBcPjAxSfGHezjEng/LLdLnwg7YLrIWoneBO4
	waUP0kVw6tiG07UyUI2yel3Y6oTQ+OKm2UFnsfDUO1gvvPl5C8ZqJHtc
X-Gm-Gg: AYBFou1xV4r1VP+0pvBRW/EByZQ/U8TKjeU/If/ipxrs5oOLkldHZvZPSPWT1Knf/CZ
	S28oQGyTl2N6rptzrvQ2ze0AXIkN4XK5yYU5iyVwDhMK/7SfxsG/CwEwOHM21onesauLB1HS5Rm
	PuOqIwTiYnjITBcpm7H9EAEXPnAz1dy+lgggw4xzEEaHUCuVGIAohE8zhqb/9reg2vAc1Eju6u7
	iNf1YUzdWD2nzNsX21wyVhNNV1Dy2Tbybtf9sHi5NKil5lHrx7G7RSEINbxoT5AeBRuIkbZGwlo
	zLDZ7ImY3vIzMnjFi4IHkrPZzqrJQf2rc6seHjU4qeA9Tf23npAL3v6CeR5RAj5sXpMAna5eD/g
	j7IK2tZl5ufbOZrLfc/Evte5tBKX7IXMXd+G3TvAdh7X702SHaHTLbbSnxTpkEBcQtUlUUF3bKB
	Ndtlvjl/VnZbHuqQfUWB5PyWkDnaBzpZpzx6rr/dPj7VeMzFbWcDewzWe8P4H3wK7/efITmu3na
	IPUi+6UwTgoz+QPWMQXa+Wa/ZXaX21Qe6b9d08AYqkiITSUJSBFfLVWj7ob0bV6MMoX+USAsLr2
	qGbZ8zNmsr2LwVW3FkpI9LgJSLY=
X-Received: by 2002:a05:693c:601c:b0:36a:270:ce76 with SMTP id 5a478bee46e88-36a424de9abmr16340388eec.33.1793624929009;
        Mon, 02 Nov 2026 05:08:49 -0800 (PST)
Received: from localhost ([154.21.93.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a5eee0f20sm17056520eec.17.2026.11.02.05.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:08:48 -0800 (PST)
From: Yuan Yao <yaoyuan0329os@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Vishnu Sankar <vishnuocv@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuan Yao <yaoyuan0329os@gmail.com>
Subject: [PATCH 1/1] Input: trackpoint - Add new ELAN trackpoint device variant id 7
Date: Mon,  2 Nov 2026 21:08:36 +0800
Message-ID: <20261102130836.11863-2-yaoyuan0329os@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102130836.11863-1-yaoyuan0329os@gmail.com>
References: <20261102130836.11863-1-yaoyuan0329os@gmail.com>
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

The new ELAN trackpoint variant id 7 is found on thinkpad
X14 Gen1 laptop(Product Name: 21XMA006CD), it's now
incorrectly probed as Generic or Logitech PS/2 mouse.

Add ELAN variant id 7 to match the TP_READ_ID command
return value, probe the device as trackpoint correctly.

BEFORE:
input: PS/2 Generic Mouse as /devices/platform/i8042/serio1/input/input63

AFTER:
psmouse serio1: trackpoint: Elan_variant7 TrackPoint firmware: 0xa1, buttons: 3/3
input: TPPS/2 Elan_variant7 TrackPoint as /devices/platform/i8042/serio1/input/input65

Signed-off-by: Yuan Yao <yaoyuan0329os@gmail.com>
---
 drivers/input/mouse/trackpoint.c | 2 ++
 drivers/input/mouse/trackpoint.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/input/mouse/trackpoint.c b/drivers/input/mouse/trackpoint.c
index 3bd8fdf56cd3..f46fc1665c96 100644
--- a/drivers/input/mouse/trackpoint.c
+++ b/drivers/input/mouse/trackpoint.c
@@ -25,6 +25,7 @@ static const char * const trackpoint_variants[] = {
 	[TP_VARIANT_NXP]		= "NXP",
 	[TP_VARIANT_JYT_SYNAPTICS]	= "JYT_Synaptics",
 	[TP_VARIANT_SYNAPTICS]		= "Synaptics",
+	[TP_VARIANT_ELAN_ID_7]		= "Elan_variant7"
 };
 
 /*
@@ -283,6 +284,7 @@ static int trackpoint_start_protocol(struct psmouse *psmouse,
 	case TP_VARIANT_IBM:
 	case TP_VARIANT_ALPS:
 	case TP_VARIANT_ELAN:
+	case TP_VARIANT_ELAN_ID_7:
 	case TP_VARIANT_NXP:
 	case TP_VARIANT_JYT_SYNAPTICS:
 	case TP_VARIANT_SYNAPTICS:
diff --git a/drivers/input/mouse/trackpoint.h b/drivers/input/mouse/trackpoint.h
index 3e03cdb39449..b67fc228cf3e 100644
--- a/drivers/input/mouse/trackpoint.h
+++ b/drivers/input/mouse/trackpoint.h
@@ -30,6 +30,7 @@
 #define TP_VARIANT_NXP			0x04
 #define TP_VARIANT_JYT_SYNAPTICS	0x05
 #define TP_VARIANT_SYNAPTICS		0x06
+#define TP_VARIANT_ELAN_ID_7		0x07
 
 /*
  * Commands
-- 
2.56.0


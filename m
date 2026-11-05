Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793894352;
	b=YSvhFela1E2hJ50QkG7ncbOqLg2+S4NbSoqR3+fh4tgsoKXkEp52BXGX/mGfNsieWI+r
	 CMl9W3IWORf5cOOw46IEfQlRAgglvH3SVWITH+xkvtfG/Mrt9THaMbXSqF1A8Zx98l2RX
	 K4RoDyKyJsy3a++jCZZ0Qo/yrcMLukBw79v9lDw0yOyT5ghRNh6b6UFhf6h0S+pawVUWe
	 sV8VUmlvD1mdwFEYw7kFIMBMTKAJFrdxPNez9+/ZUoL0FWd5LmR2K97HbllU834t+VXIj
	 j5XjUT0zngdt2Wv9Vq1d7RuVUPViXo61BVYXk0zjZoRVeMJrZkAhAHfZT/NS9yTq23g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793894352;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=S7QYdpXb8VDeYDOCOQvmGRySrKCk7ngW17iUEjSNiJ0=;
	b=OEZz5WBvBprpe7R/ATfs2dsVVJCQZh0zW8z4jkagdhxWG6DwxbNrzQTmWJhVIJQ7F16E
	 6Ok2bEI0LBzXUvwa0tF50S2stlEVgYb7H9UYFXfIMTnIRrCyfGniZCzbvM6ISGR+2ZoPv
	 c3eYbSSang9Qy+47z00dPvNLRGwQKm+icL+005rz/Bipp8ioBgXBfDq7jRE4cSJyBP98l
	 9mr4ZnebPhxwMqJqIhFMf2t/wtgpzPSfJpd9V1aLBmd7s+gNdCB0GXSPZtH8rgFnPYIK+
	 9V5X9EcsM+s9WbsDpFBTffC7xC8xxtIAIHbsRAPLw+4GO+QYymkyEiK/Lu9yYRJMFwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=oBJuux5B;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD16F606A60D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:59:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD16F606A60D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=oBJuux5B
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c411e139259so230349466b.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793894350; x=1794499150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S7QYdpXb8VDeYDOCOQvmGRySrKCk7ngW17iUEjSNiJ0=;
        b=oBJuux5BZXbXohvAs8BXtCKEDm4A5nYeEBTurLzcXiE5wnnWy56MMp4YmfMPd/YnXI
         QQrMPuhnIdmWJ3sFnpZmhmyxLgxuzqYHtt55nPxZlPmS74xcC7FC/9H08lFZ91U2Zzih
         LsOHzaAJ4B4IVEOHUK+wSdJ5OI2JBysly0SVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793894350; x=1794499150;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S7QYdpXb8VDeYDOCOQvmGRySrKCk7ngW17iUEjSNiJ0=;
        b=n/PNO4i2XhOrn4zVJlP2AEYog9LY+Ja6JOKqUF5UZ5cHIYVadgrmI4K22cgortmmIp
         ucMQYIfmrNXjsUAylDjPu6VqlMV0O1bV34zr9BbfKZfkdU1YtcfrpE3cdyAiVFPzxNH+
         DhgOdU5zFPrpFFiXoIRgW0gS2QvWzTxC6g399prM52i+dHplDdQkuKgjN4AAuhixYtZI
         BC3hSTO/bfgppT1khkbs8iCOWcGJEoXZ7Ta5yrRvkVxltAjjCKZcFDwdJvHWLp1FbA/X
         nhIaxxBVi4/wLyPx2uMZEFJAPJXGXvUxxiXMAx9Lz7qZ2FGrciZ6LBbSMCtwcHK3/RGF
         Jt8w==
X-Forwarded-Encrypted: i=1; AKwUvBx7rHmRpoqW7FD7fsZym8YSTmOdUHdc1bSKTAObqKYgCLChx97w8xgqTpQ3IVVBmsFs7vpLieAq5OMTJQQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9w7QVJkLZ8RzLVpTnnjcFn6SaCyY+hQIOc+X6tkn/psphz8YBd
	26QJiZg6xw8jdXRDKt7fGpF/Lav5xUeKxGUYS6Et+puHgwmf/WjLfJ67lJr4QlX+4g==
X-Gm-Gg: AYBFou2mOMg2ImZRQ6gvFshBgnnOa2YEDztab77xPtPr/vKR2f5PwFstGEy3RYScfrc
	3LvT4cAxC1nOypPkdE9rIYpPdFbVliWIvtUpJH+zMKGtSKXG7zYc7WdZcqsqzIaguDpX8urKMrd
	0NFfYwRZbf/nyRakuxmw1YgTbcxsF6/cwGjvKRAVthKrObdbChHXYrLzAPHC2tusi7Ar9JfFM1i
	sKlvmMC3axuAp/5hSRKGw5Ch6JbuUvVscmC0yAfz4vwP8Zi8RVkUkg/1m0bYZ7ulKDpOhPLg4lx
	Hyt/8jyx7YpgVhP6Zefvoc03o/YsbantBGS/w+3G5SZI5z/ImLGUEsT0UPFRi7yQ+ColV7vexFX
	Q8uQe3TVpLOeFlfXVBNxVpDZRKYmW2+QcCLmOw+foKfrPSMFMtRKicps3MjjhcS0OOCMm6tD4Z+
	xcAlxjvYw5ELv9wkfKrY3NWJZ/Q5G8VBMq3O7Z/3oxi5hwO4twtfrMvChIvWAlojlzw0AwZIw9A
	cZzKPMZl3031vR7GpWaRdUM57nDIOgf9laGRPgxVTQ0JGwU9SrqT3iRZys8ckgNXXvMhcwO5su9
	GSQkpN0DvGBucHSzWS0X/yp+IPGorj4pyIpvo4UH1+sw66OCpFYpVC+e1OC6FPbIhYObrVlH
X-Received: by 2002:a17:906:c143:b0:c4c:b545:f29d with SMTP id a640c23a62f3a-c4d34ca20demr657966b.36.1793894350065;
        Thu, 05 Nov 2026 07:59:10 -0800 (PST)
Received: from localhost (103.45.147.34.bc.googleusercontent.com. [34.147.45.103])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-c4d0e43ea74sm189017566b.33.2026.11.05.07.59.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 07:59:09 -0800 (PST)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v4 0/2] USB Type-C mode selection
Date: Thu,  5 Nov 2026 15:59:04 +0000
Message-ID: <20261105155906.2670094-1-akuchynski@chromium.org>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
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

This patch series introduces priority-based alternate mode selection
support for cros_ec_typec. 
The base patch series and UCSI support was submitted here:
https://lore.kernel.org/all/20260119131824.2529334-1-akuchynski@chromium.org/

When AP-driven alternate mode selection is active, the driver enforces the
mode_selection bit for each registered Alternate Mode. This blocks
individual altmode drivers from self-activating. Once registration
completes, the driver evaluates USB4 capability. If USB4 is unsupported,
it falls back to priority-based negotiation via typec_mode_selection_start.

Additionally, we swap the registration sequence of the port's alternate
modes. Registering DisplayPort after Thunderbolt correctly ensures DP is
prioritized.

Changes in v4:
- Dropped typec_altmode_state_update() call in cros_typec_altmode.c as
  it is potentially unsafe.
- Added explicit partner usb mode setting via
  'typec_partner_set_usb_mode' upon successful USB4 mux configuration.
- Rebased on top of the latest platform-chrome tree.
Changes in v3:
- Replaced delay/timeout consts with macros.
- Downgraded USB4/mode selection error logs to dev_warn().
- Fixed comment formatting and added comment for DP/TBT order.
Changes in v2:
- Added this cover letter.
- Rebased on top of the latest platform-chrome tree.
- Tested on Redrix with Linux Fedora 7.3.0-rc5+.
v1 Link:
https://lore.kernel.org/all/20260129131928.794768-1-akuchynski@chromium.org/

Andrei Kuchynski (2):
  platform/chrome: cros_ec_typec: Enforce priority-based mode selection
  platform/chrome: cros_ec_typec: Reorder altmode registration

 drivers/platform/chrome/cros_ec_typec.c | 67 +++++++++++++++++++++----
 1 file changed, 56 insertions(+), 11 deletions(-)

-- 
2.56.0.398.g882cbad275-goog


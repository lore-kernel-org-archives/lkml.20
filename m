Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887251;
	b=BFtRp7HxM2Y8g7nNHEhAsiybovNKUMnzSK4XEr3NNfFH+ZmHnIEiW0Kb4qrYvjPOFi0v
	 gqm7KsfVD1nViZhWsJhBZt2Jhrvnxd78SuSAQLG8Fr60SCp1srC2j91brj80UmTtH6n3S
	 veMFEWONaKalB+Rjn/9yCDg/QR16I75Wf9ClpMCqGyRMk6smWw6etrqBI7rlv+Uuy+AXJ
	 yVbGz+ERYg6CEzBPAMB/RyDHCE66J0h3CWUQrTFpEnFKowzQ88WFNgojiNWWykB83GCCo
	 /FkHY+U3O8bySVNmIYaGG6QGopfYekgL4vR6dQatbOtR8yp9mu6GRsK0IyGWAINTfHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887251;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=s074/WGaEZodvb8MrBC/plqFT0cVs1hNQbBNRgLS+7A=;
	b=cPoqGe7EUBeAoP52rhSXRd06DcGJ8ZGHrCd7e52uKBbnbyGId6mT4snV7WlcjIwfHUdR
	 oF904T6UcZyzw8XPMspEWCVStdW3JrGCpEZNdIqFEm4YCU0C6xaKQOkDP/dCCuvGezYxp
	 HxiJKfqjeaukg71IEIXZ25TpwXdAbOdfU8dh0/P9ISkVFaS3XgFcgKxGeR1/REJX2SQ5N
	 QMkfUfG69SJXenbPkzjt1dEML7AriatJfEpoWS5EEdkPjmcCzx0Uvh8vmr5eY0NWh3Ocp
	 ewdTK/8b6k5NNQUzw/iOlwmxF+qeg9Z6u3biCLiYTkHpIY6dymXN4VIrANI3qE423FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nxY9Jccf;
	arc=none smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E943606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:00:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E943606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nxY9Jccf
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-67c08c7adadso506475d50.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793887249; x=1794492049; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=s074/WGaEZodvb8MrBC/plqFT0cVs1hNQbBNRgLS+7A=;
        b=nxY9JccfHr/AUQr5sZcoBDbdnqV2s5ymUY6k8leyIxTDI+P2/s3U/f4FtFBr5zEDy+
         hhjwvuWVVISEoxcC68qQC9W8qMSVsOw7dtqwzjGWKP1Gzo7O6+7mZxMJsZHzbB/KqlPK
         zKfSTNpzdR9y9YriGZWXguMcQFhPSbpcFILwe0zICxAFLuCt0qL2h+DubEOyPkJSLRrY
         gns4wXEEpBO/ooPpmQ7DbrOPDTh4PdF05cIZ3lQ+Q3X43+pUJRb+XZbu1g8jp62beAtU
         y4DOzWRswBA7uA4nO1VgbMWIA0KFVApSoQ0kgcP7XJwvF0W7e6IkM4IJBwvRQOvEIWVK
         88CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887249; x=1794492049;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=s074/WGaEZodvb8MrBC/plqFT0cVs1hNQbBNRgLS+7A=;
        b=tfSsPFmxxXFF8l0Lmic7D7u2ZLxQMc6aPflukjjPI5OONGQ1d0NPeTI/D+PJPMnDoV
         4nyzLowqtvgzh5IcjRme88vukVEsW00np3JIz0gmFu0pBRanCNznwXOfMO9e5ZQP/Z2p
         3w36hNCLpP1wabWvKwpzkivii3OaBWI7+3HPuAcn17jVTjYBWy6kPEsQC/K+bSBa7SVa
         lZl3aermpsd0wBUR66v1BXfPAKK61rjfBdzEokJBDJ391HLkclChYhOCHnVwpHaVb5Ew
         dD3Qm6SYK1UXWeGhU++ylRZu/fCNbj5a90OwK9GvjCcQsuuMa1hNtuD5IqsrbfEk8imn
         yliw==
X-Forwarded-Encrypted: i=1; AKwUvBzX3PwqcM5u61q3+4b8UUgVz5koNlJ7/VEXjzxvol0XJ7oEQXwS7oYF3pna7sYmvUrI+GTvg2BS6IV3knU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9h0G+ZoJFcV/pFneEqKZr8mTWatMjy7kLXLR/8GK5UnIu3vtu5
	0JjwOdbaIL9cpAs6+oLJmXeHiixk1DJeKIaom0azRNOHPkEAyLDKlVPBx6YSsW2T
X-Gm-Gg: AYBFou240DD+yuvM00KkuUWSyL5vvQ0sw7H5g9J4Kw0RoDkZwEpqrCUtySnF7vy5CY5
	Jz1w9N6OIgvPt4vcCqrS5XE11WTPNnaygDg6oyP5sISugo1Zp9KXdfvd3yteV4Lg/ofA/kRBGEE
	Xi5CTtFGo329VUdLBLPQYa+jstJJZWU/pQ04R4OAyhBrjEIoOTjygFTqK/Nc6GnBEJgeAymC1+v
	8wrTm9xCgQ5+f0nUng8OKP51dzL8B8UIWkzIJBsb9kbTIzbLpN0F0eCoze+3Xj5fmVIZpCj9E0v
	Ih1nObwRdbnJZi0lClxo/EK9ghFciks7b4cnVh5z3UNg7jHXrYNT9lZI2Glj31zm1avvrpZpufJ
	v3sdjs5vidcxHwnSJ8BAeutYsnw9l94/Z2e/s6Eh8ti28izj9FUurkXMGgaV1kPwQDshToclOzP
	uWzSSAoJTRAfIUyTw6HcM6fStBJdk6SqErNCMhKo8tPWrD8XXFM7JXWVcxFocV8Oy15R8lAIwLP
	tlz0xj9PfMiy6ef4BBDKB+UdmFWu6ByVgnRoT0rRkhWSRZOcJJjrFY7sbEUBVh6LzMynL5YZKCl
	MKvKxhrb5bDiNSS12RQj/J6NqvHiuh1/CY8BavP5AEKmc/LNSc6m12amQiqF3zhoK3nYlDjp+hS
	ucqZvaJYPa0wGHZ1r0rrWhIREa8B+KPe9z5FYQGK+RngGSyc5tn0VLEyxzDMY
X-Received: by 2002:a05:690e:d86:b0:679:bec4:aef with SMTP id 956f58d0204a3-67ba4fa93dcmr9290626d50.32.1793887249206;
        Thu, 05 Nov 2026 06:00:49 -0800 (PST)
Received: from lab01.myowncloud.network ([2601:cb:4000:1c5:5396:7ba1:d08a:ebca])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67bee202a69sm3492991d50.5.2026.11.05.06.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:00:45 -0800 (PST)
From: Amit Patole <amit.patole@gmail.com>
Date: Thu, 05 Nov 2026 09:00:36 -0500
Subject: [PATCH] jbd2: document the h_invalid handle flag
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
Message-Id: <20261105-kdoc-jbd2-h_invalid-v1-1-4bc224f7d0a2@gmail.com>
X-B4-Tracking: v=1; b=H4sIAASM7GoC/yXMQQqDMBBA0avIrDuQBKrVq0gRkxnraImSqBTEu
 5vq8i3+3yFyEI5QZTsE3iTK5BP0IwPXt/7DKJQMRplca/XEkSaHgyWDfSN+a79C+DJlQaTyTpc
 KUjkH7uR3Xev37bjagd3yX8FxnIQaoEB3AAAA
X-Change-ID: 20261105-kdoc-jbd2-h_invalid-8297dd06f190
To: Theodore Ts'o <tytso@mit.edu>, Jan Kara <jack@suse.com>, 
 Andreas Dilger <adilger@dilger.ca>
Cc: linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Amit Patole <amit.patole@gmail.com>
X-Mailer: b4 0.15.2

Commit 61e2a90a910c ("ext4: enable scoped NOFS when starting a handle
in nojournal mode") added the h_invalid bit to struct
jbd2_journal_handle but did not add it to the kernel-doc comment above
the structure, so kernel-doc now warns:

  include/linux/jbd2.h:523 struct member 'h_invalid' not described in
  'jbd2_journal_handle'

Describe the new flag. It is set by ext4_get_nojournal() on a handle
that is not attached to any journal and is tested by
ext4_handle_valid().

The warning was found by running scripts/kernel-doc over the headers
pulled into the htmldocs build. An AI coding assistant (Claude Opus
5.5) was used to locate the warning and draft this change; it was
verified with scripts/kernel-doc (no warnings left) and checkpatch.

Fixes: 61e2a90a910c ("ext4: enable scoped NOFS when starting a handle in nojournal mode")
Signed-off-by: Amit Patole <amit.patole@gmail.com>
---
Comment-only change. Built with W=1 on x86_64 (fs/jbd2/, fs/ext4/)
with no new warnings.
---
 include/linux/jbd2.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/jbd2.h b/include/linux/jbd2.h
index e3886963ba00..69f12366a09a 100644
--- a/include/linux/jbd2.h
+++ b/include/linux/jbd2.h
@@ -482,6 +482,7 @@ struct jbd2_revoke_table_s;
  * @h_sync: Flag for sync-on-close.
  * @h_reserved: Flag for handle for reserved credits.
  * @h_aborted: Flag indicating fatal error on handle.
+ * @h_invalid: Flag for a handle not attached to a journal (ext4 nojournal mode).
  * @h_type: For handle statistics.
  * @h_line_no: For handle statistics.
  * @h_start_jiffies: Handle Start time.

---
base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
change-id: 20261105-kdoc-jbd2-h_invalid-8297dd06f190

Best regards,
--  
Amit Patole <amit.patole@gmail.com>


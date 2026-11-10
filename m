Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794276410;
	b=QDLSnEIyW3U+UNNiuCdHIoehlzSi/f9R2wnHProQHwKO8MBWIN/4s9EsEaFh10eOFKGj
	 KFojpCqAFPVjPMYEmNhuttH3NDe5zq9edHzgQVVkvdfeY1MUDnpjwAX7U16uMgFOWfLdU
	 0Ik+rN2muW+aTcQ10SZDWbTEvKntS26uBVXCTCbJXsNCrtSYpzRf6NM3dRYpRMQMMKAms
	 sUiXhOqZ9pUuRHpQvR91FvTtdQRjZ8nChZa8CC88FzHxAN6TFDOc3sRsg0oUQ20M3APBR
	 M3lkdcFQjgLmWYQBh6XW+BW9MB4SxLSSFnB1rARzTsleVdwgbijzi+wDNF1HbdKz9GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794276410;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=YBgckZ7YOb7fe4+YR2v1CJm9q/fhedgcNMRGuz/XwV4=;
	b=irBpZ4fp3vfUmftfPr/2bO8jxUo+Xp9S9NtkaA8eK+cpWN1X9XrfkSUvwVKfCYNWgZUi
	 LAfWv0OuHW/e5adxoJfJ+I/pf5NB9wLf1SAWnrL10vkbd5jA8DN0T4Sba/3g5hcTSF91I
	 t5ER46Ut4EYRltD5PIaKPS8ys2P9eM9D4h4UmzaKWnsnG5TYJmGBuN6dlbdSKV1yP3a8p
	 vBNf4ryMHJAbotcJ1oXMgk4cOvNtGk5qu2mgbAaAV5g9SOxR0X+Wb+X+GNuj+l0YoI50S
	 HAzjhkKJ0ZlC8l6vwvWRRnDjuwf1sC3/KNTk91w4BuD9j3M1WLi4NjqTDjPgggz55Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--svv.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hMuXKmgA;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEC5606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:06:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADEC5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--svv.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hMuXKmgA
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36d69ab3c2bso2163641eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 18:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794276409; x=1794881209; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YBgckZ7YOb7fe4+YR2v1CJm9q/fhedgcNMRGuz/XwV4=;
        b=hMuXKmgAlxvjCv1tdg9wPUFKW6bfJ1nlFYZzhkjcFlWtoeLRoFqZeZFOKKqRBKuqc5
         qDB3U4AgTe5xaslef+rRLwkIGMNIx+uLKDPXYI5rSbymiGejA5zS5hl0gIQIdJjQiD0b
         uJua+RCqYfEsmPQIFbDsW38yTkARoN7EE3eQpBVch1aozOKvdPRGoV21HGCoHd0Y4UAp
         UDI6CgU9Bvc5gxfB4uvbNR+wGQboiwmAaqJ5YgF50hU31rtcCwpgwlp6EehYrDRbJ8fR
         Owhy7v1RpkRLld3XelimfhAn059UoRKE67zgeZMmqffHe0sSLbPTtJ41CXoMJP60Fs/3
         1Nvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794276409; x=1794881209;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YBgckZ7YOb7fe4+YR2v1CJm9q/fhedgcNMRGuz/XwV4=;
        b=pIDR86WbQyyjETMfFOh23sSPbfkp6DA1NAGn9gGktHjUL2n+neyTSeA2SQTYtkkGVN
         0bg0Saj/nWSUkR0oxt7W9eSSUG5C0H901hq4qOpxt/mEjhnjoeTqFVHFmhTLh/yug6Bc
         SHY7FimcCFUvhX7RlS/PMtfDr7jFRFBd7RtIauT1x0MiyjYgulbTsT71OC2uwPZxV/aZ
         62Pbfy9jSUYJ2P0fZjBNA8cbi/3cf+gkYRfIF+iDX9kAY42N+NHLK9nx6zfXMBRLitHa
         df1ieMD6YWFE0MQvgHyz23yZlyRGYmWIa5VvLRlDbGRmcYDKaOJj5ZUOZGEFV+omaeDc
         cpNw==
X-Forwarded-Encrypted: i=1; AL+hErGC7X0ZO+rYOp31M44XBEvxeGiECDIMEYetj5hlTf8sbEwiKZU2/oyO+6CjtnnYqDOHdtPJ/gS6VAlHMV0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/NeVKjzjMPiqwtT9hgz92ZFaCJKK8ylWK8EO/9aEGTmXukOmyZ
	kMEiv4eGbwEu3xVg8YBXI/OlSP1GtVAWRl4BUTDDu21Cz7c0D+0sCjaznLbH309hsHpIKg==
X-Received: from dysg19.prod.google.com ([2002:a05:7300:3d13:b0:36d:461b:fa1f])
 (user=svv job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:e9cd:10b0:36e:aa5c:7851
 with SMTP id 5a478bee46e88-3751f6593cbmr1699067eec.27.1794276408525; Mon, 09
 Nov 2026 18:06:48 -0800 (PST)
Date: Mon,  9 Nov 2026 18:06:29 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.506.g506a7eabc5-goog
Message-ID: <20261110020632.4003499-1-svv@google.com>
Subject: [PATCH 0/3] Input: add ABS_TWIST and support it in HID and Wacom
From: Siarhei Vishniakou <svv@google.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Ping Cheng <ping.cheng@wacom.com>, 
	Jason Gerecke <jason.gerecke@wacom.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Siarhei Vishniakou <svv@google.com>
Content-Type: text/plain; charset="UTF-8"

Some styli can report rotation along their long ("barrel") axis,
commonly referred to as "twist". While the HID specification defines
this usage as HID_DG_TWIST (0x000d0041) in the Digitizers page, there is
currently no corresponding evdev axis code to expose it to userspace.

Because evdev has no MSC_SCAN equivalent for axes, drivers and OEMs
currently work around this by mapping stylus twist onto unrelated axes
such as ABS_Z or ABS_RZ. As a result, userspace input stacks must
maintain device-specific workarounds to know which axis carries twist.

This series introduces a dedicated ABS_TWIST (0x1d) axis for single-tool
devices such as styli and wires it up in the HID subsystem:

1. Input: Define ABS_TWIST (0x1d) in input-event-codes.h and document it
   in event-codes.rst with resolution in units/radian.
2. HID: Map HID_DG_TWIST (0x000d0041) to ABS_TWIST in hid-input, compute
   its resolution in units/radian, and add KUnit test coverage.
3. HID: wacom: Report pen twist on ABS_TWIST in addition to ABS_Z so
   that userspace can use the standard axis while maintaining backward
   compatibility with existing applications that expect ABS_Z.

Siarhei Vishniakou (3):
  Input: add ABS_TWIST event code
  HID: input: map Digitizers Twist usage to ABS_TWIST
  HID: wacom: report ABS_TWIST alongside ABS_Z for pen twist

 Documentation/input/event-codes.rst    |  6 ++
 drivers/hid/hid-debug.c                |  1 +
 drivers/hid/hid-input-test.c           | 87 ++++++++++++++++++++++++++
 drivers/hid/hid-input.c                |  5 ++
 drivers/hid/wacom_wac.c                | 35 +++++++++--
 include/uapi/linux/input-event-codes.h |  1 +
 6 files changed, 129 insertions(+), 6 deletions(-)

-- 
2.56.0.455.g6c5a503b38-goog


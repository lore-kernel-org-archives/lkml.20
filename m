Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794760622;
	b=pF2C8mR+XI+72jSWEHYIG5XKueuZJGRUilLOI7G+0cq96rqQbgn0MSXihaV5vaqwXzke
	 D5DwJBPQO6vIEeQtrJ2f3Vpj7YhvUvxSToIjl6OBqZGWnWwoEjhaVeWTL0c2/S7D8arV7
	 pgAGAQKKD5xnux5O7xSa8bYD89Kc/gPk9ReJyNlMC/eam5d3P661rj4361ayXGgXKGGzN
	 Py2PKR+8TFltQkJvkINXg+OrNoHgPKLrb31CLm9VlWyBu+cPwu2S/vh42PG1mcyBc5qsJ
	 URxnOXMcszORhBxub/1b5ZRB5T9VSFkTEnP6dccr6smHubItpCnTHg5u2NzF5qR4/iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794760622;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=66eFvTzILz7v8GYJ646M/KNx3l9Ze59WpXHWIun61fo=;
	b=kFgdy9plhGgA3x5az1HL4IQdQbaA8JfJNZPM6I0YU8l51E8SG+4hdb+kQjO7qae30ooW
	 d9GAQT//HF9Srb485UsXWCZys8ebrTZp7m0qtCIFk6hsw/dT1hRMDYhanZCkAYzSUeTLg
	 5AVg6/TOSDGCg9525NOliXw7e/gEHlnW9gX2XfjAB3CWyxT3eTW3WKqpjR4+K3hn4wBhT
	 310TtnFYdBZWIG8lR0zZGQN+gY4OKZQmSEo/CDLuQWkz2ps6KV3dLnm3MtKveHii0HkNE
	 5NK4ODnvbYWnbODbe4IXjMokttoJ6JknyKshuySTwpXoMhj2MfzwATvRGsu0V185YiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d9XvUhNB;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A28606A327
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 16:37:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07A28606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d9XvUhNB
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-372bdb942dbso2417595eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794760621; x=1795365421; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=66eFvTzILz7v8GYJ646M/KNx3l9Ze59WpXHWIun61fo=;
        b=d9XvUhNB6gcJilbq/qVaSYTlvjM7qpIcZNV+6a1/xjLHbi7nWcAvm6+i1/cfAmwNXU
         7gEvF/WNqUT0V/lqPLgsAkGCbqA4NMpUGYFjTrOPrgpJht28+P+33txALcUYXsS4Xo4D
         KSfOUukp5w7kMOPT9nI41zFOpqp6WaeS/9QI61Ani2MwXl/89G/oX1kVm7Ur9yCnwWAc
         m6Mg4xN9Nz7s0Rwr6AOOTBHgLbuu2IlmVmL+IU5F3L8ruzsw6t6WuhwkGv1zKwR5x7KL
         CALD2xu/hp/bXLFjDwoYWd+gwKwLXhJnda9njxTLF3zLFDRZhQuqPYBI8YwnvNtzA/4R
         /L8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794760621; x=1795365421;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=66eFvTzILz7v8GYJ646M/KNx3l9Ze59WpXHWIun61fo=;
        b=d0UFaQAmoRnRVd14LMWQol5mhr8pHuImChrkV4t2oT2kt18Or1jluBvdUFzynhKASt
         YB8jUgi/C6zziXFx7jw+N+ERxaku66rNg3kwKpNIQxVSe+y1zV/PauqM3Dl6FfuY9sz5
         G+3cmxnKUbFTYeICQuydAx2I+JBVV5OtEvF2W7+qC4uBC/eo4a9FbG7+8c4Kq8GoaVJF
         X0BlKRZdtmnNoEECB4p69ZwErwoiUypjJMuI5n1IXYyK5hiputXV5VmChCMT7AUK6AYG
         O7NMwznWUK/7OUhw/BE7Nc0fECbO5P9AOIoiMcPY4DSPEBw/gtH890A3hYT3l+eeMtKO
         5jag==
X-Forwarded-Encrypted: i=1; AL+hErF+3D0czEf6UTAaOHUv2HPQ6pe9o571pF4B2F5FU36o115L1snsh342yav+KH3rURZyTfOEKbUVqI4voEY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uxbMlYDkueUQtU2uVwoyBQLfQWA/exaWF9agjMF9ALcAD+Owb
	nC1PzF2zbX3qI9enV7O4o+lWY7ucmsjzN7E/RQnZgCW2Y1SpT9Ik0Ci3717H0BX2AEE=
X-Gm-Gg: AYBFou1qCMRkohJ2m4ZhQWgU9uG0QesGYy0H7mlVbIclU+Yx23RSwAfIdbUt6Z9HPBa
	Fs2dfxFxUgdQwwpQICVRRnUePug+aHOTIhs7gaVYRCOfLmSLSbiDcV1ibyJiU0rAT442S6+HV3g
	piZ4/Cxidq9xKc2zYSZH76B8/47HS0Rkx2CCoz8atMBz3UdG0URXK+jXDXBQzaBISo1YpU0y646
	RKSLJjpGW1yrCTiiLjaPMBuk4UtfwoPgTNYqsoxk6YLHQ71xFEO6ypYg4nA3niVozYA0zG6brfi
	iWSjH34Y3u63Qrq+OfmeepfI+/RLgmvtbTPyFDQ2sVcPVdtDjr9E0L5AhOl2D4KjUdR6KNUGetu
	kWXVsVeQOckUBg89Mo6yVhYRVnfynnfB9I4xwpNLHBoK1sn92tT0/RxkNksPXuzGWKBFpBLMCOq
	Ggxnge5Fcq9UvPQF93LmJacuy8uxLpfyFRoFV/rUwzIZBwPichEwKdcyYeO0g14Kv5i/7B7xBsb
	06ZnLxKEWUuWgnPcuJG6TI7gdEv7y/68bL5jDfoon50K1JSULfjq90j8y9IZWA20ilRms+ISM+K
	6YlrqSSuEsDw29yqPINT9nAFW8fUtvsNV1gqMdglWwlYt5txuJqL19wpHYr0LxdedRoW
X-Received: by 2002:a05:7300:d40d:b0:360:d4c5:7243 with SMTP id 5a478bee46e88-37966e3a7cfmr8999460eec.11.1794760621065;
        Sun, 15 Nov 2026 08:37:01 -0800 (PST)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0c40sm27803763eec.28.2026.11.15.08.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 08:37:00 -0800 (PST)
From: Cheng Yongkang <teel4res@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] usb: core: resume clears needs_altsetting0 even on failure
Date: Sun, 15 Nov 2026 08:36:54 -0800
Message-Id: <20261115163654.226373-1-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Greg, Alan,

I hit a corner case in usb_resume_interface(). It needs a device that
fails SET_INTERFACE(0) both when the driver is unbound and again at
resume, so it may not be worth fixing.

needs_altsetting0 is handled in three places. usb_unbind_interface()
sets it when the switch to altsetting 0 fails, and
usb_probe_interface() clears it only after the switch succeeds. But
usb_resume_interface() clears it even when its deferred
usb_set_interface(..., 0) fails. probe then skips the switch, and the
next driver binds with the interface still at the old altsetting.

On v7.3 with raw-gadget and dummy_hcd, the gadget stalled
SET_INTERFACE(0) at unbind and at resume. usbtest then bound to the
interface while it was at altsetting 1, and its URB failed with
-ENOENT. The code is unchanged in next-20261113.

Clearing the flag only on success, as probe does, fixes it:

  -			usb_set_interface(udev, intf->altsetting[0].
  -					desc.bInterfaceNumber, 0);
  -			intf->needs_altsetting0 = 0;
  +			if (!usb_set_interface(udev, intf->altsetting[0].
  +					desc.bInterfaceNumber, 0))
  +				intf->needs_altsetting0 = 0;

With the version I tested, which also logged the error, probe retried
the switch and refused to bind while the gadget kept stalling, and
normal resume was unchanged. I can send a patch if you want one.

Thanks,
Cheng Yongkang

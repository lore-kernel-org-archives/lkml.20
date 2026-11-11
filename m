Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794424772;
	b=c53rGoXyrG4Xxa3V4oYLjr7FrX6wDzYwIVAk++J2DvQIyP8jE8noaUEpmBFCJV9k7iaS
	 0VhYe3/+ZkQx/upW5bwGtyT5gwzcLHs8Der3U0Joo+v0ihKF4bhvMotwg3YmAuZXCGf/U
	 pQwjBu2o3BEyJMbjZ0NR19/l53LfWuMfBct7/9mptwpzdmPO4Yv1/h9dJ4GGbYAxBB8tJ
	 BBQ1gDxhv1N/vbH7KZMbsA/GwNi6YFQ0cY7vLb/Otm33cLH5WoZffKMn37FiwS3cFJFhL
	 2htQEF2DctXQ9TfgrKbH2gDXuevF4UKcUMMp4deXROwt9JJKjHdEVXkIVzxHZItCEHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794424772;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=IJjJtd37bhn0A4un/SmSzJepmWgtq9m5kpl7Gylf3H0=;
	b=l8lWIII15TznKWF+UELAPedoc/hEBLdHZtsUETFjAe8ivpMmjVR4aCPhRZk+WMoHjxQo
	 MxGysCoLxvth+s4AbLKOJAsRl8jLDy3Pj98MKbMFh6/ShxJBf3AiyDAVbfRveQPQ8IEUk
	 TDh81FdjO9EPlVf7NMVWRyEVzNi4hiXjo0zfLaoj2JGVtdWIHjka5AONu7tuYqDZLhcCw
	 vzfvbyaghn7KwoxZG0dqK6nYgppGUm0/BKY5acyh28nNlCgYtaTbBjCJuX2iV93g9001c
	 /xU+qVBQL8XGBhF5go6WwQVxvp+UrLeuaPfRoNCt0DWOrovOQO2wCXd0LoKApMjBXKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p0EcXAFX;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A972606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:19:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A972606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p0EcXAFX
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so32716415e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794424770; x=1795029570; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IJjJtd37bhn0A4un/SmSzJepmWgtq9m5kpl7Gylf3H0=;
        b=p0EcXAFXU9q9ifEYI7vKYVUYK8A5/mDGfn7ZtWLcfGW233Ce+MJ0ffSBYi7sebPZRw
         sdtlb3uHcMjobi2JFa7Hby9VtO0cK9Hog8MApu3xzB91aifzSjQbMzxz9Atfs8B2/QhW
         FKrioSJaAex6vlYhK0pyWr0NmfBMNVNbu12EavPWDjzeT1WB01h94zAAzUwMCbpqnDru
         LVaerzSD9MszZL0eiEixU0Nf6tFbl/tpSytPs25TS5WK/oRAdkFzWiq2hvku3o6MlvNa
         za/UzMI0M0JVfttVbtRXPy9bhkxudUf0T4gLhz5oAT9aILPk99A7yM/9HGO/D67xAKEv
         Tcdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794424770; x=1795029570;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IJjJtd37bhn0A4un/SmSzJepmWgtq9m5kpl7Gylf3H0=;
        b=GgPQwCWlX0ZoiAMjW9nK7LpypB0AhkYCRIXNMDL38E9bAahNCVkQCqC+3ErYcr+Lqg
         RcNVBQWskaVygmQy7N4hHGr55ZKd4Rfkj0spCE9+4xsMdJ5uxpP6bmTTlQyqR+VEhA0O
         rpWZzOMew0v898LEwW7UW7iSlRLCskgQWapoVbEtEUGpkxvA4fzDauaIa1DcWOVZxZil
         zM3oX7qzQy5F8p31hYClA4gPONCHvLTAN5m/5TgpwEA13lZuGrz8P3Y3QRC+piNomggY
         gFpMhmpa8iB2Ervnt1jMo1WYF7gwVCdO3CSBj9mNcQ+M7xX934Ang3Q8+QNq/eE4lWeg
         tDRA==
X-Forwarded-Encrypted: i=1; AL+hErFQz8UAXu3ljQTEGws91V0uk56TJebq7YrI5OVV+oIZa9JcMAYQILtIly1wOZQr1HtpfJ+IBpjUhdU5p9g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0VE8O133GFK3L8MkQE6GfIhCshHV/qUDXIq6sKuKHCGbetL4S
	4mqAu+GiCe5fdnkx+h/ZVnkvAcNQI4VOnTA7PVAq135BBN8MSivI7GCU
X-Gm-Gg: AYBFou0k8/qjEEnKq2s02RWVPf4NcuP9NdAj68wDcVRKI1mkqXP3oGyRw3BUautAYL3
	HUduHbhYMI1Qm1zKVWBv2ZLxzHd1gCDhAztFl1v0X5pmNMwOXtJvbEuZE0x3m8v4IIm3hJQPKd5
	YJdoorUP/R+adkql5+VZWSqiMTHNqd1t1SVlTse5l2G+3v1DU7X5H4y4zHSYV637RSf/IKRkxtq
	FWu6LAvei7Qrux7c4vvq2Kd9F6o/jr04pUn5XBkyVOGmkZRkFZOKRST8Ph7SmVh9b/UdCvb+mzX
	gKSoEjOnih3gkHCAQvQzOZ8XUC2fhpGb+6wWpn5Hq+iV9EEeGEXkEfEXxLs7rq+KhSJkvXFeXij
	p2820JQd36BdjZbPBV9VJh9nyRHLtT+It/DGIN5U0toMP3L5cJOLqkzVy+wRZ3BOKI/Vl5qegET
	jUFlcoTQJ0JEGx4Km/1obQP8wl+Ls8XtNloAIYchJvpI3jIZjQOIL598MelZQNMzsho+xNKYQoa
	Sb1H/5XrcIaA04YTJo8XPnj0xdPTfW8E1oIJt1gQrY7YDYtZ0Mlg6UrvvqogJAgaGxIKhHNgi0R
	LRMa4MfO1NZIq/UD+ai++/APGz19OhhO00Oxw/tg/Ne/Mr0rRkPcE31V4cLikwH6El1IlLbtriD
	aAHAeZFU=
X-Received: by 2002:a05:600c:8b24:b0:4a2:1364:252b with SMTP id 5b1f17b1804b1-4ba09383fd2mr55404945e9.35.1794424770348;
        Wed, 11 Nov 2026 11:19:30 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e267dcdsm9345305e9.11.2026.11.11.11.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:19:29 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Subject: [PATCH 0/4] serial: vt8500: Clean up the probe
Date: Wed, 11 Nov 2026 23:19:15 +0400
Message-Id: <20261111-vt8500-serial-cleanup-v1-0-b33594a25f87@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMyw5AMBAAf0X2bJOWeP6KOFS7WJGSFpGIf1fMb
 Q4zF3hyTB7q6AJHB3tebBAZR6BHZQdCNsEhEUkuA3hsZSYEvpmaUc+k7L6i6XVVpJKMKQSEdnX
 U8/l9m/Z3v3cT6e2dwX0/pXvcF3kAAAA=
X-Change-ID: 20261111-vt8500-serial-cleanup-dfc9731edd70
To: Alexey Charkov <alchark@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Tony Prisk <linux@prisktech.co.nz>, 
 Alan Cox <alan@linux.intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-serial@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, 
 Wentao Liang <vulab@iscas.ac.cn>, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1049; i=alchark@gmail.com;
 h=from:subject:message-id; bh=+hTK6IV/HGfu+wOooMtgfojIoiSt4kZ6VzyBes7lhAA=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR92b8/8cXvSB7Tks9tGwI4jm/UavM6m5ajuODAOsXU+
 rbAzPhHHRNZGMS4GCzFFFnmfltiO9WIb9YuD4+vMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEx12DZGhnUynr/5Nv2+WBIRL36K9a/RgcIl/NtMF6/4onDAZWVEtBcjw+k7Nav
 PGc1wDVh2ULzAbpfJN9kZlaLlDdPmaTostJ6xmg8A
X-Developer-Key: i=alchark@gmail.com; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

The driver has been carrying legacy vestiges in the form of a bitmask and
a local array to track which ports should be numbered which, both of them
not really needed anymore with DT aliases and existing in-core tracking.

Remove them altogether to simplify the driver and get rid of leaks Sashiko
found. While here, also convert the clock handling to use the resource
managed API, and propagate errors from uart_add_one_port().

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
Alexey Charkov (4):
      serial: vt8500: Find console ports in the serial core state
      serial: vt8500: Use devm_clk_get_enabled()
      serial: vt8500: Handle uart_add_one_port() failure
      serial: vt8500: Drop the port index bitmap

 drivers/tty/serial/vt8500_serial.c | 81 +++++++++++---------------------------
 1 file changed, 22 insertions(+), 59 deletions(-)
---
base-commit: 793807ca13bf3072fc6d16ce6d90e9ab9beff2a5
change-id: 20261111-vt8500-serial-cleanup-dfc9731edd70

Best regards,
--  
Alexey Charkov <alchark@gmail.com>


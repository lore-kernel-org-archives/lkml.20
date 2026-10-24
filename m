Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792879637;
	b=wgM1tScc95vzK/w0jX5tFcvR9fV3XCUIvXCIBnAWOwIItcsomANZpRkZjkQ+9bBbsvMS
	 VNHDfVrL1PD7//dCYJtTICv6v4d8Slhd3kGQrGYvA2DftWb44T2fyIfe7O9M5NtU2Vnri
	 mHMqfK+yYoKqNwYFWDbcqrEJQpTThpsWBYN3YEvfTe+7uRzNTYRysv8t0DTDTK+XciV93
	 QjsxSEwbGfcNKTv7ORbhfB80Nc5mn+Ry3NtbsyybQKVF/X45Q140XdTs4eHYUtH7+awlx
	 OaqCjTYIWQWz7p5KV+2mnQu2SWBbTe/C0R0RJEc6VABgMZAruk4JjAISYaQLFC/vkPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792879637;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=McYURVHSivgc1y7QO81KCrd/LSo/Pg6FF1ntLro9Qvw=;
	b=o1MXKDVmA+6yE16fWBzb5qp36VPMBnyXhHmGn/V/n4M2931E0nKzls10+Qm9dnUlZK+a
	 ZUcVzfj5xSiDlBHzvvEUppl9nION13mArE4nIwQ+Ts0JCasczHz6dY2uzfc/jCBHHq9Z2
	 ZOUGuQ+K0oYdI67Ypx9dp5j131cngCkeiRk6oU5YYzOsD2GTjfpOUvCD+cgPAL5shmq97
	 Y3y0TIwE4kla4IK5ll5hjXHnkfj+vU4h+bYXZd3NCEyONNG3rXO4o9J1zRi7JXZimGJC1
	 daP6Vzkuj2LrvhjxLQ0O8gpRxS/wyt3KHi5xM6QqNNvITlbsgEDDjZnv2iP0KKsc+lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b="m/Yiaxx0";
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CBC606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 22:07:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20CBC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=m/Yiaxx0
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a208d93758so20817165e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 15:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792879634; x=1793484434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=McYURVHSivgc1y7QO81KCrd/LSo/Pg6FF1ntLro9Qvw=;
        b=m/Yiaxx0FIqI6y8cI2iuR0zdNsFeLRnz0FOtHgOsrzW+5KCuuPQugZ93Ke01QJE0CX
         bgEDUwewvdImvccpLlwzLdHkfPZWi2K/DoFq/lsKSQv0yIyu6uj8Svv8UWocoX/ECUi7
         Wv6KiU0K2hsSfxOzPqVVRrI+BT0H3JV3FlRPM0NckY3Xn3lnAdIWdBftRG/rBpPP8cbs
         8oJiQc4RsgtjfL3PzpAMPFlqZPHOD0V7FTsocJv8o7mW1CqfE2O+QX0+8uFQwxTd3ZgY
         Tj5hJwq8B/p2U7kBtr7+rtkWpbVQevAwMYQFJxGeWh61fK17emqcVXjCer/HZlmpxtTE
         WIEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792879634; x=1793484434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=McYURVHSivgc1y7QO81KCrd/LSo/Pg6FF1ntLro9Qvw=;
        b=V6FYf7PP6HQlzWvTYiarDggH2uf3INgI7UR/ZcXzdXDvYGdJ+MeZUV1Fw0KbHq3a3r
         +TU9R7rn92KEeEO/fp3qNmslQkoN9EQhUxdGiKs/n43j3xRvFSkn/v0oCea5BYO63aAm
         XQyIUzmpLK4v8G3wDp8qOjUOpISSyaln7LTlmU2Ar0ytpuWpEEnnX0MFmlgs7Au71kaO
         YzGZCySWXgCRsectCxLGIAL44O7dvv97ZozRMGbn0Xo03isjXb6qVH8ES0MM1sDQ0lyu
         qPNTJ/BN3UCqK3qzVWFhaYuFC1ewcterjMvc4zbTjbRIxZ6vhj7LRa9hCzC/RjKRIH/6
         EgBA==
X-Forwarded-Encrypted: i=1; AKwUvBxQV55hI7NBePjNYbh2Y6MV00pKC/cBlSkPCt/gite7dijf+fZB0eeW+P7EPjTj1LaoDT5YOxDS2CE1Ln0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJuBp5wAD4Hu72XboCB+8FB832kYptnBntsqm6PBNc6iAeDq3v7
	vX8JOLqas54SPJlg7p1P5mhyitZk2549dGHGHaJYgMypa0UOR3AnjbAXQZsJwJYTQRo=
X-Gm-Gg: AYBFou3xT4L636Oy3bqJNUqCtBKI8Lgj4Y2M5UEJU4fMW0O4E8u0H23x6VzknaVFzFT
	1edY5+azdL1VcpXuuPyuT2NzeuZJ8ClNRKMMrHbhMO3ccaZGHearUVGGED5vVBIHv0qTZRDgfZZ
	HxSIWlaVt9cRszPCYuTjzZ2ZcVkT5UHa8Z7ktdA63K3Rg53yTio6OH4OT0uojqbjQVKQJlaiITk
	naseOvoast7WG0Vy9oxyUZZ5PIPWsEg0B/LNEC2LFRKpmGZlORmnAavf0sztZEup93SokXYk5ju
	RCdJEjSKAfwZMpLH2OW8PkWWbLUDzzmm23/7AiQqeYAAVlfp1fRirCxj2t+nn6DNl1W955Q/LFm
	9aMr5FzPtehFsV6eyuVK6e6SHZ/TrbEEeipGXPZ3i5f592c4LOhrCTekiODSzTR09rcZPDwcpJz
	8hUBwtIKwlMS5RqFa37klkNMR9qMez+PYfa3U3XcS1V/zoDMSCXJah9RZO6B2ThDyygorJf3SZV
	kkrsx8Qp+Z1TBsYhsWxIhOhWrO4NUonaLhifE+z/Xg7CVYHWWwIq46/nQw067ml/zr9unm/nf8/
	JyLUzgJom66twDQSYtOuJJglLrhlzMA+n+MtY5CUJW5Trmr1Hl6dTHFVBQDmsrF1mehT
X-Received: by 2002:a05:600c:1906:b0:4a1:7bd4:d07d with SMTP id 5b1f17b1804b1-4a35acc3f50mr41010605e9.34.1792879634534;
        Sat, 24 Oct 2026 15:07:14 -0700 (PDT)
Received: from localhost.localdomain (2a01cb060184ad00bcfbae5efa3e0f0b.ipv6.abo.wanadoo.fr. [2a01:cb06:184:ad00:bcfb:ae5e:fa3e:f0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a06da5fsm53466635e9.3.2026.10.24.15.07.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 24 Oct 2026 15:07:14 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v2 0/2] serial: 8250_ingenic: Set UMR and UACR, add the X1600
Date: Sun, 25 Oct 2026 00:07:10 +0200
Message-ID: <20261024220712.23250-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
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

Ingenic UARTs carry a bit clock count (UMR) and a per-bit adjustment
(UACR) that the driver never sets, so a UART runs with whatever was left
there. On the X1600 of a HiBy R1 neither the vendor's 8 nor the reset
value 0 gives the 16 clocks a bit the 8250 divisor assumes, and the
Bluetooth chip on UART0 fails to set up. Patch 2 sets 16 and 0 at probe.

Changes since v1:
- Set UMR and UACR on every Ingenic UART rather than in an X1600 entry,
  as Nikolaus asked: the JZ4725, JZ4740, JZ4755, JZ4760, X1000, X1830,
  X2000 and X1600 programming manuals all have them at 0x24 and 0x28.
- Write 16 rather than the reset value: with UMR at 0 the R1's Bluetooth
  chip fails just as it does with 8.
- The binding keeps the X1600 compatible with the X1000's as fallback;
  the driver needs no entry of its own.
- Rebased on tty-next.

I could only test the X1600. On the other SoCs this writes the value the
divisor already assumes.

v1: https://lore.kernel.org/all/20261024051515.55639-1-olivier@mgcrea.io/

Olivier Louvignes (2):
  dt-bindings: serial: ingenic: Add the X1600
  serial: 8250_ingenic: Set UMR and UACR at probe

 .../devicetree/bindings/serial/ingenic,uart.yaml     |  3 +++
 drivers/tty/serial/8250/8250_ingenic.c               | 12 ++++++++++++
 2 files changed, 15 insertions(+)


base-commit: 1184f87e2790e8af9be3116f608d2e86b4792d7d
--
2.39.5


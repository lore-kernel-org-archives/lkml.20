Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.67
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793611965;
	b=phH3aW1zEyo90ZMlWHXNKXOHiNR4Pg9eVchSjacKVHcYEf6kKhnMs1FeuKVzGXu3y1Dz
	 j0bxORtqfNBKcYIfwqo/E/mgOQ0aNpeHOGyG9sngPnt4GwDDyUBIbDhdNpu/QqEoTEScl
	 rPUWEysUBwQLWrhoHi1RsvxDHD+BlwnMvxeZwZYMpMT+ZApyNSQjYZDmugkTya3OlCXTr
	 hVtH7JM7HsOei0V1U95zjbfbpgNnc8UlAJsx7KBnvfMK4VQkX9oPrOaZURIaHqCSCN8TW
	 Lncx7jmk7Hk/B1qwkaRzM8GxX65fbdf0kUKOLezKJUpKs/gj3QfTGBbJlCtdvBv245g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793611965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xFCr7dXRwZlmmMVL8y3jBXLGA8axSy+kDHY18LbXjXQ=;
	b=EwYG144Si52ylgGP9OOtnytHgM2wj3iWPiCbB8Ygk7I7u0cSQT7Ucpp23V+M4rkmuKKD
	 dnILChEZ6z1PjIxbIwbNfz3az0u9rvBo6To+gV37i+bWI8+h1IK0qkuxlvz49nCbWSLVE
	 pC2WgS+qlul3l+OYP80UvTQzg1F8EA/JDqYSoi+ItS+1z0o8Wu2X4ch32Ijk1FlExAXlP
	 MPJ1Te6Brt11mFvEGF/T1Cm23E9MGykcpZw4QF1j+gPy1xQSO2UBwn3+INQ1Vn2iHoqMB
	 DRNR68alN/Jy8N4a1lPZh7cYQXQXn4G6sruDULibXFOm06PyZtq/CpJqisG4Llhy61w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VpY7iYcj;
	arc=none smtp.remote-ip=209.85.208.67
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2D4606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:32:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A2D4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VpY7iYcj
Received: by mail-ed1-f67.google.com with SMTP id 4fb4d7f45d1cf-6b4a13789b0so3816805a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793611964; x=1794216764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xFCr7dXRwZlmmMVL8y3jBXLGA8axSy+kDHY18LbXjXQ=;
        b=VpY7iYcjUrBWCdENfOZeW2hM2MEUHu8ClikKdaH8ZbCV8gzKdAZO+YzEiuEtJXq9hR
         MUVFi53u4QOBEmQtWukqMS/LIWPko6fXl1Wlu3JWUgOwkkcbmyj9rtrIS4BnogPVursl
         44acph208sl2K9/UdsfI6VDo4Aq83AzQhJzKBNOtRnJP+Y5ghw8WmrXV3JTtZ29WDJk6
         2U/Mxa9xLC516jgZ9nAzKpr/pVDXHsj4owBPtL1cIpK7GqPGe0HWKHZKBCqR6m5GRf6M
         0gJW1fo97SBSIgWW0/e3CNRsMODLWABmy63MxVIiJ1UHE4iTQbKitwuN7J3JXIZtjg1s
         hbfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793611964; x=1794216764;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xFCr7dXRwZlmmMVL8y3jBXLGA8axSy+kDHY18LbXjXQ=;
        b=G9mJbXUHVqtt727fWfpAvvscWODcAJqPCBOG6fgr+UFZaA8T0WwZsW8x4EfAIVkL5t
         zF5FtvtwITUf0FPhVAM88pJAApUMkKYhZhBJ2sgaciMfcjFZd1H9jzoveyE4/v/mbcuq
         kkSkiVWJGnjEV5PTPceBBXGg02Kjjafwguz6BivFuL7MiWc8e6UzOir6BimkTiotJSyC
         ReHlnRxK4BZwC8xRbdJKeodChTjjdj2kZ1SD/VMy9wtSkar88AZvlwONj8fhachKxOSs
         o3cyQxtqQsOyDrNryYktkkUOj/nrZWgQaKUWMG/FejS78elQu2xP0gzPrNP5h/jMv1Yt
         YM7Q==
X-Forwarded-Encrypted: i=1; AKwUvBwT1S/5iMMbcU9zPqyiGW0vx6Eog5JxfX3Zetm2QzCadORlqxGT7RlCQOGYzoxQtfT8Stssp89NtPIZKT4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Uzu5D8Xn60GWf1czLm2tKeZdBRd6DKmfHPfnpkHJzHcj+DOVF
	Ke/3D9PXwI+Zv0Qi870kXEUeYTBHZuR643WvIttiP/CSlsjulzA599l+
X-Gm-Gg: AYBFou3clBwYQmucukaKuP7GQHo2RJtzkVlYa2vKehXBIgTlDhd/lp1k2bmLaPXBBM3
	zHYlpvc20wpB2/rWqJ3yURIDAp2MPFGhIXBskE3MTJMg/q/2TK74M6HVlU6VFb6+3LUcl0UVpKG
	kxaSbRzCrFA0ykTELGtVQEVrPiIXCddxyziysKGbo9mrtabyoS91caqYULSK3Hagc9piaOJZGO2
	24eaUCaEvxch/5pWoaC/7DXzg5Urzx2acaCGs9Wvn5o6pWHooKEpj5gFD36eScBMlid0I3atAIw
	+OWA1nDWaC1O3aBeYoqfYAULT+i+cluE90nvmDG3MKjTLPjSKpDwjDMXejqCUmPjwujzO2K7WUP
	yGnVqaPkOI6pB+FYOJqCb13OVWyXaYo+LigET7rAgMXCfchms+dLJNJUBiSz1RybPH4hz9Nqrha
	wMXY5fIyEORVCuv5xCE8WSQr8ZJkgnQMizvcuQnU5WEah93vKysJU5fc4gUaJcL/q6eROTHZblw
	mDNW3jE/U2cxafM+csSn6FxtxkTLJ1QIGx9LI/d5ndxho3CmOlgJ9Ckr9esNgSpWyiHd/0XCfzm
	Xcu6Y4Mxg9olNANqMs4XSJ9o80KBT0T/Hr18DLu5JM+hgQkGXH9vwfKN4ouz7DsQjF+AGHw2gBP
	FDqAHYZVNzkbbY2x1+GFjRkrHthV0ecwgR9b1MYiY2/1o5o/9Am12awaH
X-Received: by 2002:a05:6402:15d2:b0:6a9:8863:ada4 with SMTP id 4fb4d7f45d1cf-6b4b0b8288dmr6687683a12.3.1793611963451;
        Mon, 02 Nov 2026 01:32:43 -0800 (PST)
Received: from thi-server.fritz.box (dslb-092-076-089-226.092.076.pools.vodafone-ip.de. [92.76.89.226])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4eca0f2a0sm3214273a12.25.2026.11.02.01.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:32:40 -0800 (PST)
From: Thilo Zirnstein <thi.zirnstein@gmail.com>
To: michal.simek@amd.com,
	andi.shyti@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thilo Zirnstein <thi.zirnstein@gmail.com>
Subject: [PATCH v4 0/2] i2c: i2c-xiic: fix clearing of bnb irq and waiting/ clearing while atomic
Date: Mon,  2 Nov 2026 10:32:26 +0100
Message-ID: <20261102093228.2751576-1-thi.zirnstein@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Dear all,

This patch-series fixes the clearing routine for the bus not busy (bnb) irq
plus the waiting and clearing routines while in atomic context.

The bnb is used to indicate that the current transfer is done.
A high level view of the software flow for tx:

* init i2c controller
* prepare all registers ( fill fifo, enable irqs, ... )
* start i2c txfer
* clear and enable bnb
* wait for completion
* ( serve interrupts )
* ( bnb interrupt ): complete completion

The datasheet ( pg090-axi-iic, Interrupt-Status-Register ISR)
states that the bnb bit can only be cleared if
the bus busy bit in the status register is set.
So the iic controller must have recognized that their is some activity
on the bus. ( Start condition )

Currently the bnb bit is cleared without checking or waiting for this
condition. This can lead to spurious bnb interrupts.

Andi suggested to use an atomic-save function to wait for bnb.
This was applied for other waiting/ clearing functions, too.

Kind regards,

Thilo Zirnstein
---
Changes in v4
- Fix timeout argument of polling in atomic context

Changes in v3
- Use atomic-save functions for waiting and clearing.
- Fix intendation
- Unintentional changes removed

Changes in v2:
- Unintentional changes removed.
---

Thilo Zirnstein (2):
  i2c: i2c-xiic: fix clearing of bnb irq
  i2c: i2c-xiic: fix waiting/clearing while atomic

 drivers/i2c/busses/i2c-xiic.c | 70 ++++++++++++++++++++++++++++-------
 1 file changed, 57 insertions(+), 13 deletions(-)

--
2.43.0


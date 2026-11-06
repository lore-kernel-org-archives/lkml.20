Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=138.232.1.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793960410;
	b=q6ZIojMTdZPiGro/i4PMuGsUIJ5SpiIWBRys3sT5NVzDt01lWWmNINgBkR4b38eemtH2
	 GWgaK/xfB2KWKEvZtKXA6SSPXIq7QePePJQZRIdax9LScHj3vIWCR9CoxS+JfdImT+xAt
	 UWWiG92COYOQydrWrppag/wjmvaflhvGNh950+YVP4QijkXVnJls892dfx8pIZD9iVZ+q
	 XxXb2JC9JDMh+HHNEaJlAxKr/nIOxJVPeMNKVXifTWn2MkX3ABsngKiR19GagMJtG5id6
	 BU+N6L8cnlYshcj43kwbzqb1nplii6TT6ajzZPlHoL1cCwnToEaNiW5P+IhxxHHlTnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793960410;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Spam-Score:X-Scanned-By;
	bh=j0J/AAvRSre91wbOcWbf8T9zQQjZf9mg7zaJjxPd+uw=;
	b=lNj1ohF7MaEVyYPKUN6OHDy4QuhMi4Q59nKRHHpkRZYc1qL/P72+l25ZfXrsYWyrC/Ml
	 1zfgrIhXQ+ZOTGfZrDUrtUEoPwIFgQpuVW+DHh8JhxZjKKSPgSY+wtDfDJYbQNprl6Whv
	 66l1pDKU4KiLzAplr3rziS0UzlVc3RWApLK2XFgg0ehqo1kYmtxKaW4fzfAG6R8wh4+Zg
	 yPpY/acMeKnGcGcySDW6GoU3GWtNS9ieI5OM5FKGcYej+Of0EeAX6Zg9clI3yT0NHp/Xt
	 6CrU4Rfiff6XSFeXlGvreV+vbFLo4ON7L1RpoCMTdRH4vWbDiFRH19VH6efzvVrXS8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=student.uibk.ac.at;
	spf=pass smtp.mailfrom=student.uibk.ac.at;
	dkim=pass header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=A5AvGCtN;
	arc=none smtp.remote-ip=138.232.1.140
Received: from smtp.uibk.ac.at (smtp.uibk.ac.at [138.232.1.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388D3606D814;
	Fri,  6 Nov 2026 10:20:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 388D3606D814
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=A5AvGCtN
Received: from surface-pro-5 (ydWLT-U1-95-184.uibk.ac.at [172.25.95.184])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 6A6AJteV1864372
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 6 Nov 2026 11:19:57 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 6A6AJteV1864372
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1793960397;
	bh=j0J/AAvRSre91wbOcWbf8T9zQQjZf9mg7zaJjxPd+uw=;
	h=From:To:Cc:Subject:Date;
	b=A5AvGCtNIRiq5wvdg4l0UIl4PwlbF05GOzO6fDewG9F5iq2IPi5T8+Twm7/eznUzD
	 kVJrAZ4hJCIfxOiBIvCbT0qIHwbJqlgLbnzRuvVH9fhVjZrbkLnw9ba4ChpGbi+97L
	 IuG57cyFm/32sqUiH8Cky9zmGnu9619UtCkdx8xk=
From: christian.koever-draxl@student.uibk.ac.at
To: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com,
        jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
        sean@mess.org
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH v2 0/2] media: rc: meson-ir: wake the system from the remote
Date: Fri,  6 Nov 2026 11:19:52 +0100
Message-ID: <20261106101954.46907-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
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
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at

From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>

The suspend callback switches the decoder off, so a remote can never
wake the system from s2idle. With the wakeup-source property, keep the
decoder running and arm its interrupt as a wake source instead.

Suspend to RAM is not affected on S4: there the firmware watches the IR
receiver itself while the SoC is down and wakes the board on the power
key without this series.

Tested on an S905W2 box in s2idle: with the series the remote's power
key wakes it; with wakeup disabled for the receiver it does not.

Changes in v2:
- Commit message and cover: the series is about s2idle; deep suspend is
  woken by the firmware. The v1 test (suspend to RAM) did not exercise
  the change; replaced by an s2idle test with and without it (Martin).
- No code changes.
- Link to v1: https://lore.kernel.org/r/20261025192320.209446-1-christian.koever-draxl@student.uibk.ac.at

Tool use (Documentation/process/generated-content.rst):
This work was done with the help of an AI coding assistant, Claude
(Anthropic), used through Claude Code over many sessions. It did a large
part of the hands-on work: it read the vendor kernel and the firmware
interfaces, probed registers on the board, drafted the code and the
changelogs, and ran the builds, checkpatch, dt_binding_check and the
tests on the hardware. I directed the work, reviewed every change and
the final patches, and take responsibility for them. There is no single
prompt to quote; the sessions were of the form "find out why X fails on
this board, fix it, test it on the box".

Tested on an Amediatech X98Q TV box (Amlogic S905W2, S4 family, 2 GiB),
vendor U-Boot and BL31/OP-TEE, Linux 7.3 plus this work.

Christian Stefan Kövér-Draxl (2):
  dt-bindings: media: amlogic,meson6-ir: allow wakeup-source
  media: rc: meson-ir: allow the receiver to wake the system

 .../bindings/media/amlogic,meson6-ir.yaml       |  2 ++
 drivers/media/rc/meson-ir.c                     | 17 +++++++++++++++++
 2 files changed, 19 insertions(+)


base-commit: 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614
-- 
2.56.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=138.232.1.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792956216;
	b=JD+655LCCLROB0wlw1kMs15dO+5xdYME2/UANfjd0sGx0xQavFQ7NfhmpUnAm7gSxVhY
	 8/JtLXxSZztrSGH28yaCbb07yr970uxOzhhyQBsidTMGeVg4ERauq5/5jWCQ8lXyrgzhd
	 uCJAnmAhy7lm38yYtC6YyhwzLny1Z5MgWK4/U/75Mjzyxg2g0GYnr0eKCxj1ctTZ6yC4c
	 yiMhDWZ6cES4IcEr0KLSmNRKpi7FMThLK43BjBkQAJff861BBmPp37910nSSKzcoEfwwW
	 l+D3S27FmMAPAL2ade/9ee+/MxR1hGel1NnXauLq2WUFmRHs738nMFafRDfLuoGmgvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792956216;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Spam-Score:X-Scanned-By;
	bh=YR/ku/r1CH8uzsMyeZ4ooLK7adqbWucR46itDUvHlpQ=;
	b=STg0dtQOlgXsvBet4o8j5WvfiRQgazxvaqMuXMzcd6m4F8lbGFCT85ji0ylLrKytyrbG
	 lJQgtul86MaUn26X1f1xL4VI9gCg/admKhYNPXy9Sn6mmtKLuEp3VDA18biew+KAlyk1q
	 LaTyGpXNIiMFwCL0k40men67e+9zTObgSverflfsYKCeDby+eF4RZdw/1bpn0Rgz+N4BJ
	 9RgM5qAdvAZSFRlOvMzT51ytJkG5Dv7MDw/0I36Bx9+ex+IbTQsJZrwwKo0a8HhjqRfXO
	 kG6Z/4CQCE5VkeVx7st4Usp74G1am15Gpj6fDPwYOLfNA35mmxNtl7M7Y793Xx4O8fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=student.uibk.ac.at;
	spf=pass smtp.mailfrom=student.uibk.ac.at;
	dkim=pass header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=DL6Qz0tC;
	arc=none smtp.remote-ip=138.232.1.140
Received: from smtp.uibk.ac.at (smtp.uibk.ac.at [138.232.1.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6443C606A32C;
	Sun, 25 Oct 2026 19:23:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6443C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=DL6Qz0tC
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJNLM2517824
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:23:23 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJNLM2517824
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956204;
	bh=YR/ku/r1CH8uzsMyeZ4ooLK7adqbWucR46itDUvHlpQ=;
	h=From:To:Cc:Subject:Date;
	b=DL6Qz0tCwB4AP8LGGALNfCsKLicBE0SY/XdMy+SM6I7QHDoH4PUFv4skdG8sp7XCN
	 9RubkfJTZIwneMweoCuvsS2Qo/ntrsd7G+DxC7N312Y9h/owYLsikI8TQSfBNqE2fu
	 uH8QXRXUwL1sg9JiZsnvZcjRgaTX67+7VTDHkDSs=
From: christian.koever-draxl@student.uibk.ac.at
To: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com,
        jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
        sean@mess.org
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 0/2] media: rc: meson-ir: wake the system from the remote
Date: Sun, 25 Oct 2026 20:23:17 +0100
Message-ID: <20261025192320.209446-1-christian.koever-draxl@student.uibk.ac.at>
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
wake the system. With the wakeup-source property, keep the decoder
running and arm its interrupt as a wake source instead.

Tested: suspend to RAM on an S905W2 box, resumed by the remote.

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


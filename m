Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792740835;
	b=dIbJd2cTbIpr0oj8VkPwUjNUBe422Js5BRbc0h20PqoAbzWC0/TqD599GZiD4yvcCzNY
	 Uve4QcHHuxlJc0LkgQzoR/eIkXiZkfXdmgEtk/Fkf9kYgRDASuaT2GLY2+nbZ/0R67wjJ
	 3O0RzXJrxUvP5ld/XuvFgmBpWNkSpHuW1w3LhNjipfZMoSK5SBvFsdwU4mHcO5uEX73KV
	 RicJ90X5qc2h4caeOU00QB1bVRKhelQTkvXx3O01WqBRiowCd18RlJuFlL4aW0yspaOz2
	 2sFCNEYgFa6k9PrDYQtVLfWxSsOl6OUbe6am+TGXBmzeZCiS6FiJdSL/yidrPTMhCsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792740835;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=45to1KyNca3iZWz1ynFCrLebqSO0Gkuz8FnFEnoX6Vo=;
	b=ugV8nSW6uV3L6hKR+D6CUiDU6Mzm+PddRvCh4ap9iOULNh+yXFWgsEcjDZf39WKACznc
	 Pawm9nYdHtKsQeiTQAFwWPk3Ae9Yd6/ZbaLG0lo4A8MSR7S4qrVKVBbzxjYXm9TNfTLnO
	 /G95jH3J9wcax5fx3arxvbJ++Ps8BmfwnRokKTdHoEkpTuFbKtLpa98XWEWrf3cN5T5j2
	 Eh1N1O9sqruesUnYLHeJVVbd1sASCU/CyB8SiXY6llpc7VBdDxoGon/Knr2XYlbqiwVMX
	 QG9ePrUu0U7NHOmdd29GFxnehWY5U8la/QzLdRxVlLn4awSCKkQnLioaU+fiwPRyHXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dyqpZWIE;
	arc=none smtp.remote-ip=209.85.167.171
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4192606A320
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:33:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4192606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dyqpZWIE
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-53dbe9b8d6eso363523b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792740833; x=1793345633; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=45to1KyNca3iZWz1ynFCrLebqSO0Gkuz8FnFEnoX6Vo=;
        b=dyqpZWIELTK+QcpV07HE242SRzF85f2oO51gb8podc5WECcr/7BZ178up+12bEBo4Y
         xohK4fPpdON5O+wqd8wi3UoNQ5dalpgpxjHbZZin5mUTOLZbgzg0jovJpN4ICukRhfJu
         mwskBgX6s6uZTFoT7QGOsYdxyK2pQp/AdtwYI/2b9rUUeXwPtRj3BfuJDWr9QugYSIDu
         pUdAxUxcbU+8wwg4vipnVLJOFUrryX4M2HQ/RsyexRiUwMejsd1DwPDukEJjPsiRx2gx
         t1a9o5HJsBnyiplh7sWeC/L+ZKzah8Li84wQ+q3ewBNIWOv4F518JA5WUMciYLFVocre
         2Ahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792740833; x=1793345633;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=45to1KyNca3iZWz1ynFCrLebqSO0Gkuz8FnFEnoX6Vo=;
        b=BVmtDd7pFCvd8KqX4LtmFKTGX8eK9vGKRf5aFJERTah5zHy+HwIgyL2ABLXn0dSWXJ
         Ne6fL25FXvyn8+34T215jRfifsrymQtWaVwtn2HJa4Q+e6xGSEbek/pA13w0JOdnS4Oq
         XDaWWjkPRdl/OSMIBuTNQm1vtY3wBn+jCidKHH6aBZZ40585gDNp64G7Dptc8NenCjEj
         mdKaRqaCYGaq8zeRirxSPz+Uv1zS4yu/ddQSK+deLWeViMGOB+TYh8GAUJJSZ8/chs0r
         rneZ7fOvbN6l74KTh180DDzfs4JoIXbbjS1I2JM+7vOXkF6xzDb/xqs+ZZhg1kA+w2rb
         fHxA==
X-Gm-Message-State: AFq9FYLZkoStavYeDmf1hkqzrD8q1C39f8OHGmuo6NEU0rWzDWuSPTup
	bJhph0iLCv9GT9j2kpWllzhLJjibh06VFuz2JGSL/tmcuEy6Q6TVRqNM
X-Gm-Gg: AYBFou28Olkl9o57abhkb2zHudoX6zRmok8PcpRwjkfDJJ53S8R+5Q7slrJbBwOV/vX
	1mhUXq3VadG5KeERFMcuZBi4Naiv+6WSDBDUtnyPNR7Vf7lwdiEnhxgE32tf5ZdzUuA+dy0uvIF
	tjX9nk5lQaCKiX6FgVee+QWMKYJtfa2KQe2ZTfV4fHPzFErRtjEGYlb59XLbfKw2Zxrd8b7bW8I
	Xpvw/jay0kH6P4ToVvqd7Wi+zhu36A6obHUkhX3qXRL+5W0fYyOZhcsxfTFQeYPDGa52UZiwp7H
	ZP5MB5KjxZG1bthhCj6weqkIIonarESZdoQF5wfbwXM6Xg4jDqMorQDXPjGWnGYA1Of5GDCNFo7
	bUo4JP/vgd84uczHJvhOWEu83zpIxNyIDsAZBFO9NLdDroUGTt9Qn/wt5szZCb4kiq84HbgNZ9a
	1e6gNfYTX1d0Suy6AZdTa89CguvTaWb41SMGS10mDVQn7J/Cc3jy7cxF1DKRfrtUK6fqns/pmja
	WD5vmhQV94eWQniA8HJc0ql+IQW4UB0IeibGglo+R0A2I1UUmaucDkSveMsjzTvctLpf7cKvIaz
	6/aTrgu3yRSFUsp2jMQmhb2U6I2T1p9B65LNnkLIk8bDP5m3ESd+IdS0izgkOmRGS6A1F1xkbvj
	PtR/Rv+sOmdhoBYOwcSr64wSij4TVe7T/6GbshSTqWzASTHg42u/0NXxOM18NSEzRJ28akW3yJO
	PiFJ4=
X-Received: by 2002:a05:6808:c1b6:b0:4f5:1b84:8cd3 with SMTP id 5614622812f47-557eb4799f4mr2769761b6e.24.1792740833602;
        Fri, 23 Oct 2026 00:33:53 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55be9880a99sm909562b6e.14.2026.10.23.00.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:33:51 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH 0/3] serial: 8250_dw: describe the Allwinner H616 UART
 configuration
Date: Fri, 23 Oct 2026 01:33:48 -0600
Message-Id: <20261023-submit-h616-uart-fifo-v1-v1-0-e4a3bae2eba8@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqEMAxA0atI1gbagl14FXFRY6IZGJW2iiDe3
 TqzfIv/L0gclRO01QWRD026LgW2roDmsEyMOhaDM85b4xymffhqxtlbj3uIGUVlxcMiNUFoFG5
 oMFDyLbLo+Vt3/d+l/TDl9wf3/QBuxM/gfAAAAA==
X-Change-ID: 20261022-submit-h616-uart-fifo-v1-c5afcdfe5cb0
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

H616 has 256-byte UART FIFOs, but lacks the DesignWare component parameter
register used to discover their capacity. Its debug-divisor and RS485
registers also overlap offsets used to probe optional DesignWare features.

Add an H616 compatible and select a fixed port configuration with the
documented FIFO capacity and receive trigger levels. Preserve the
BUSY-safe integer divisor path and keep the UART gate enabled during
termios changes. Attach the existing 8250 DMA path using single-byte
peripheral bursts, with channel acquisition and PIO fallback handled
by the normal startup path.

The patches add the binding, driver configuration and SoC DTS compatible
in that order. Based on tty-next at 1184f87e2790.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
James Hilliard (3):
      dt-bindings: serial: snps-dw-apb-uart: add Allwinner H616
      serial: 8250_dw: configure the Allwinner H616 UART
      arm64: dts: allwinner: h616: identify the UART integration

 .../bindings/serial/snps-dw-apb-uart.yaml          |  1 +
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     | 12 +++---
 drivers/tty/serial/8250/8250.h                     |  1 +
 drivers/tty/serial/8250/8250_dw.c                  | 45 ++++++++++++++++++----
 drivers/tty/serial/8250/8250_port.c                |  8 ++++
 5 files changed, 54 insertions(+), 13 deletions(-)
---
base-commit: 1184f87e2790e8af9be3116f608d2e86b4792d7d
change-id: 20261022-submit-h616-uart-fifo-v1-c5afcdfe5cb0

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


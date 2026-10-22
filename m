Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792627743;
	b=tnnRiqf6ovPVWI4cyNA99GyjPm02piiVa+7bZE42hmQrpCYdR3RD1fjB3A0hNNV64qmj
	 HTZ20QVuYhGhhMBMEWJIykfMfxO6JPAdFsJUYzlmum5GX/glb2bJ6BF/cf3hkgJ3+Pfm5
	 5lcQsZRxE+RnuGvkiBIoxOlKW6HUB1gnwiJmO49wmSRqFm6l49Mg0OHv/DJ7n0XIN0qHc
	 9UQuEkzd9TS8qfuPPmGR3N0xFKuTmAAoOzUIcOwNE/vzA0PHx4mMpwoJp2dpKdz0SHAMF
	 78PCce9SISstZMQ/ua3xxatvfUFTzb6HDXx8jIQmd8Yo595RgfVojKkvdPwEmw5wfHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792627743;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=HsK5FhXQgYdk8C4XM4O6FqIbMCtFBfRXDuU2cOgaC2k=;
	b=ZxMdLu27nR6Sxg41oAjI9PXx1hXfkinxJHf55uRmzq/cpWtVBtLj1qnOigVPlob4z7Pr
	 IqP1kI4976ifDEsvTOu3dHjZ+qXBXQwy/U6zBKqf8TaPO9lU1DZa6IIvakTdRh+FljvcT
	 ideSta54P8mO0D4kHeRrtDA0DaYloKeUcymLmNVyDH6JoS7IpIEOmS5B9nTl67dzcABns
	 9c/0pvUeFlXGl2ZzKfwMjlNc5j6qnLqA1otohVW3hew980zVwmme2mYn8b7bYX0wDLERe
	 0ioFtiHnWKg3bAdjf4/YLIWH5voBX4b17WyKz2D4GUz+3qrJoXXSJCGaZBWdiB7ZWGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Aww9XYBI;
	arc=none smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE82606A332
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:09:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAE82606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Aww9XYBI
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6de2f213b7aso546450eaf.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792627742; x=1793232542; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HsK5FhXQgYdk8C4XM4O6FqIbMCtFBfRXDuU2cOgaC2k=;
        b=Aww9XYBIB3aViEaj1XiRiMh6jtBPGDGk8t2XnLmta7CnhmdVljVEmxhd6E2j8D+LLN
         oEPKuSx+t8c0d4sl41kgGynKw5wXarBDej05vkzuCpjBUrjGjWcVFo7CJj4KY7RuBniG
         fbdltUTVnZEWrWxZeGK6yxLZG9JAavUfHMoV7DRoTprsJ40wQCuZeVA/sjGXOz+Ybe1+
         nZZRZVtzGqxqK2cak/E8TNoyYZUPCu3c0hXODd5zAaRBLg8ByF5XAjbH6h4oJgmPnKcN
         VWLb2HCJw4YxyJ9OHmgrrOnAjW/MMbv07Kte5imS9M8S90WwegZLOfrFuHsEdobfSpnm
         eTlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792627742; x=1793232542;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HsK5FhXQgYdk8C4XM4O6FqIbMCtFBfRXDuU2cOgaC2k=;
        b=E9xgFdvU9IoHOdb/P0CfEhd6igZ3BmuzI2UnRD3kTetn/InpDMu/5106g1dsDczlfo
         nqKeftajU6jPnJu27vLKbEu/PcM/6ZffbsvrbxOLzvXwRhsqc1yNjY/ngkY7oiO1hApo
         jvtg3uR9pSEtmskfbnRh3MX0C5gWFUP7BcI56yHl50m5na0gfgXzE0rOM8gNPMoYgVLl
         /h+O6ncHGHldKgahp82i0W9KkwluyEMJy0392jFg1HTXyRLrN+oOq/96Z2FdmebZlYSM
         yvKHGM6vGsJqpcldaRMA3yFLIz6qfWQPXrhTZITY4IhhursPF0G+booBjgfgK5s/pBkI
         sG2A==
X-Forwarded-Encrypted: i=1; AKwUvBy/l3e32muRS6mwzSNFN7GFoTrcy1ZvyE9aToim+bBsCmfJDrQlwYfvJ+tinCisEbLFyK8cXV7EoWIt8FA=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4cX//fJOfzXqGWP/5gitXLO2QrKEeOtsiqYcFplSFBPIn6x/5
	zUCb0rDnPYL25O8ISAAUODvN5a70ln0G5AJ3oKsffjUeQUkmFUp1UYkX
X-Gm-Gg: AYBFou16EtMrcF+pdSflwmnwuT/ISWhljZCToPUdnksfUDbXK7MudytWc12+L6uCroU
	4TqosEkydzVU6hWD6JmRT5781/WEgmpJH+ShufzZiRJHkPpd+aTx4Cu9eZig65txG0jMbxufwfo
	SrI9Aa2I/PKNbp8aUxL5eArh7p2c10zKiSwajHU7NUBZ7vItyJId/dQxoMu749b3RXl6oDHp2a/
	Myp5hv9ZxvbyDX6lLjiLgFygrEBpd/nexq4MQhqwEBX5OcTYJprtTvzEd3L4eWctAfl/8I2dbBl
	90GBAJ7gQAIVQij41XVUvkOxn2BHv84P4KDqbSDd+crZZM6S7ZfWXYztRqJih4lcs3i3S09I4yj
	SSjcFYA/TAZjEcKEF6wsYhHjQEvqSBOky628EX9OFRYuupw8DdnmiRQGjBuy1/VoLpOd1wsXoMe
	5dd+3VuZ1VwvRu2FEiHzHGbmn2lTUMuGe96lpP37rzMvasdyuNI8SKbDiMfKlvmsmkxLVS6wTJa
	f0wMtsHEaxFBYElQ8CTo0+uym5yD3G797TQH5PKdXx9WtW49sUldYIpfCu+V6OoLHoKsIium4GI
	rVrgzBEh+xIjo5PaYev/GtflpVq24X5CoY2dAd5LG07BzUq2PeSv5UXigoVzcmHev6lxf+RObMb
	SsTuM9z0+kW3rNLMN7/JIX8atGVk1ZmPmgE1ffAVmCUMDJVB7J+jJvKl6e4DW4dg7FhaVTKJGMi
	pHnw==
X-Received: by 2002:a05:6820:5715:20b0:70a:1787:268a with SMTP id 006d021491bc7-70a178733admr1123581eaf.89.1792627737623;
        Wed, 21 Oct 2026 17:08:57 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70903bc246csm3281362eaf.10.2026.10.21.17.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 17:08:57 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH 0/2] clk: sunxi-ng: h616: export the APB2 clock
Date: Wed, 21 Oct 2026 18:08:54 -0600
Message-Id: <20261021-submit-sun50i-h616-apb2-clock-v1-v1-0-7b857ad1198d@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNwQ6CMBBEf4Xs2dW20Qr8ivHQrousYCEtEhLCv
 1v0NHmTyZsVEkfhBHWxQuRZkgwhgz4UQK0LT0Z5ZAajjNXKaEwf/5YpR7gowdZqi270BqkfqMN
 Zo61YOeKqrEoPWTNGbmT5Xdzuf86OF9O0e/eFd4nRRxeo3ausXuREfYfNEPF6PMO2fQE4WH1Sq
 AAAAA==
X-Change-ID: 20261021-submit-sun50i-h616-apb2-clock-v1-69e0ace9898b
To: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Expose APB2's existing clock ID so device trees can reference the UART baud
clock independently of the per-port bus gates. Add the public binding ID
first, then remove the redundant private definition.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---
James Hilliard (2):
      dt-bindings: clock: sun50i-h616: export the APB2 clock
      clk: sunxi-ng: h616: drop the private APB2 clock definition

 drivers/clk/sunxi-ng/ccu-sun50i-h616.h      | 3 +--
 include/dt-bindings/clock/sun50i-h616-ccu.h | 1 +
 2 files changed, 2 insertions(+), 2 deletions(-)
---
base-commit: 9ef62592b80c7ffb8cd987d889f659c1dc4f9f16
change-id: 20261021-submit-sun50i-h616-apb2-clock-v1-69e0ace9898b

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


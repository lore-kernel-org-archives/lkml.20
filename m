Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794398601;
	b=r2yNk0D2J6YjHp1+aVdVqVbMRlol2nDssyBMOfQ8PLq5hWNUwblujfgy/tR85W5Mcvhw
	 zpM+TmiJloBRADU5s06z6NpsmPunkbQLJe1cbDzLU4ZG17YMBHcUlGfy4avAI5/30aKqv
	 7j/8gvkTV3Oke9FyZ9v7suGN6zxQjVfrFg4kJtRzUidGrvc3tqPHO+kX1puMZ4usCI4uU
	 cM32voOW7tlODNNO+5COZE0kwjYtvK+q7tSbyMeGnPEywxXNnCUkvzLkZHyyjt8SqAxzJ
	 8NunjnPvLgtLIMmbys5aHUQOvY+9FTIR8wQ8Ya0zLSvVNjc4P52s7T6o4H9NFK370sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794398601;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=GV/jfsFbMmkXTAQ4EO3mdq+1dYga/vXLHfb1SaIoXw4=;
	b=QuqwtPAG/xv+aNDQzFaTK7ePh9CMFtty9sRFpLSvPupUdcMT+z1DpGKa29exF8FP/MRh
	 NM4H1VuhAXnCaHlv0SufZWZI+vXaYOlP/N43TY37SWb9AbCPW0KX7mulzyX31NKSXAtHf
	 9bwDvnBVUo3dEg7OJGt/5Fk3yRBBDzpDbgzwDmSfWEmJ19pCJMg017UM+ahlkklf2+3r+
	 ymF1wBbcJKMNPh6qDamn+RUlOm3t1ZRbb/FE0HRmPqwsPbh+GauR3p9PVSbXT8VWMukjf
	 XOs7CrfR+njfgjSIFo9lyh8uyoCmCo26OmHMXtwOOC7xpZIOt284k1cyPwmGwbtifCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pBkjc51O;
	arc=none smtp.remote-ip=74.125.224.46
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6CE606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:03:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D6CE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pBkjc51O
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-67bf3c6654fso3525939d50.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794398600; x=1795003400; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GV/jfsFbMmkXTAQ4EO3mdq+1dYga/vXLHfb1SaIoXw4=;
        b=pBkjc51OphVSOwhCdOltnrUOcIL+F7afGlrKKau62RTGi32/YVQDIKIW04qh/UBBvA
         QI6He6DncEKAh8cGRS71C2ZNdmAb0l2CUZ89Gs1s6LqPsE6pfoahu4VEMa4XBkqwfUnV
         94n4yWd735Iq8TPKDKK83KglYNHINHMWw/9s30LzxAQoVQZINKYU0oeC5PJyE3ACGrcU
         vdzVTUFzuj5u3sLLooVDjzbJhPmBU/FNyaRFESone2QJPCNr9EJqKwMIVMxB6xTPC2qz
         vvijN6NSqR5wM7NFuHwoBKaDLIC9QdlbHQKSMJGZISI9bO0miG5wxpybrtynJKh3wVtb
         Hh/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794398600; x=1795003400;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GV/jfsFbMmkXTAQ4EO3mdq+1dYga/vXLHfb1SaIoXw4=;
        b=LPRhNZuEHfpmHAqOubUaU8HxMhHV6ZnSk0qjUyjDb67bC75WWa6vUlGdhLpUQQXzk3
         vVkSzT3mMKGz7FrS8HWtO+OegZoZyRMFh3OKgHPTksGk2AT88+l56M6fbxXSdX47+N4s
         l0zicsebUwS+GMW5t8Y0Q19LWx50FviKaG7SEcbQgKujqifJFTMv9KYdLAfIp4XgSPOw
         UH0X7DfccQHhEB3D3qEpJtoErfmAmrJHZh7yXDvxcbDQbw5cIreA81kWbQoWeNsgyQlw
         fUvI7layEs+hfC86bcf69GmcHgND+yAGXCFRhzoFymS0xp0Eh/5s13kf2VRjtII7c/Jl
         uTxw==
X-Forwarded-Encrypted: i=1; AL+hErHf1TLeL2jg5Q91QYDXkywKDYjg2Dqq9CFiExBnhxQsPBu9WS7O2D0B3wz85tORYXUKV6kGQ5XW1u4OQ0k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8H9LaO+qgvDAXJJskjhYcZxZgLXMe359bPr4MNswWoEbHtxnso
	2dgFrdGdaa2rpxiBVd32Isa9+NnObW3xNZrPVZZ7xSNc2S3B3NYUlzai
X-Gm-Gg: AYBFou1/k7m7QXKr2/68zH4Ym9T8W0iTWjat/CprSCdiB+Xk8mnr+u2IZefb4cIYMaG
	4jNvXoCZ/u5emCv6It2HNlWPZbrYF59FpYtX+0LNgx9GdUu8hOZBmYnemeY7VXhtxLKskIo/aN9
	eZhsjR/Qk2Houlds6u7CPqn5qwoBkJw2QKKc8ZrTalsnbUp6q9bmUKO58mRuQDiV6bVLk0LHi7+
	/GX/oRETtbzqI1rn904XwU+J4ij1h6muJYGhjuHY8YT0nUGvDClmB1JsDB0+BW1XN36GwdlRfKB
	NOvka9Z8onxmMtPoY6mJqnmnZQvHkfYX5xrguRu1NMX3E6rZG28tYv+uGv4CAowFLm+GtRob92R
	voJHgEy1g/8Lxn+i29SuVnD8uA9ywHdxSaqtutrVvuh/dUqjFCsdcjvFD+ib7dS7tLQpuBgkhnn
	WqvCoz2ASreU3z6NFxaf8QCpgjxSS0F4fDuYO6eZXbHNHsPBgv11EwhQi2vyNAM6oWjkS3BNeS8
	GdFpp3cznxX4urWbVWdjrpASM2Q3ApaV6fWsBEuGkQyXFXcN60fUz98TP7FdMIVc3rcDiTnEBI8
	kTx05WsHc04VgpWnJrxGIh0VTSxUmt8G/nFyPASzJGlOyd2cnz4Nwv/8OdJ7uPEbaPYh/dNDdq2
	/1nJd8Mb7qecnBxmsdSjuuQjay5+5+ihZJ3xU6CA/9zz9dcYTTOkZ/Nq4eY4GClv5lQbJqOu0zZ
	w=
X-Received: by 2002:a05:690e:134c:b0:67c:33ba:4367 with SMTP id 956f58d0204a3-67c67fee82emr1588399d50.123.1794398599941;
        Wed, 11 Nov 2026 04:03:19 -0800 (PST)
Received: from MaquinaLab.. (189.27.147.77.dynamic.adsl.gvt.net.br. [189.27.147.77])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c58a09074sm4389527d50.18.2026.11.11.04.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 04:03:19 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Enzo Adriano <enzo.adriano.code@gmail.com>
Cc: andre.przywara@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>
Subject: Re: [PATCH v3 2/3] arm64: dts: allwinner: add A733 SoC description
Date: Wed, 11 Nov 2026 09:02:35 -0300
Message-ID: <20261111120240.32497-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <7c0ee4e609db5979d2a6598f46f40896b4f47a57.1794227241.git.enzo.adriano.code@gmail.com>
References: <cover.1794227241.git.enzo.adriano.code@gmail.com> <7c0ee4e609db5979d2a6598f46f40896b4f47a57.1794227241.git.enzo.adriano.code@gmail.com>
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

On 11/9/26 23:45, Enzo Adriano wrote:
> Provide the SoC description needed for the Cubie A7S console, PMIC and
> microSD support.

Tested-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com> # Radxa Cubie A7Z

I tested the A733 SoC dtsi with the posted prerequisite series and a
local board DT.

UART0, R-I2C0/AXP318W, RTC, MMC0 at 3.3 V (hash-checked reads and
writes), eight CPUs, PSCI reboot/power-off and 20 CPU hotplug cycles
worked. GPIO interrupts worked on both edges for PB, PC, PD, PE, PG, PH,
PJ and PK.

MMC0 card-detect hotplug needed my separate A733 EINT-mux fix. PI is not
exposed on this board, and I haven't tested the R-PIO interrupts or the
A7S-specific DT patches.

I'll send the A7Z board DT as a separate series based on this one.

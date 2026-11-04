Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793786387;
	b=v54SQuhkgPgaA/B4DWzl7r8gm653dq+ewa26gaWvluoChI24C6bW0rJ16G7TfY88Exd8
	 0HWOKhZiE7mxUQT6Qq/OnUPD5kAIRwBDFXBsvu5YDLRbSjD57HdQZGcelPCBkfTeNBoxG
	 /PStKEzx1Li1zsTbnECtDmMT5r/6orETzdPlxn3tsq7i9Xm9xkNUKBAZnpZMdKf4Vd7cU
	 rU7DBEUAmFPMyO7pb7QHfH7egRQM4KGIXiMS6g59wGwmWY1ICvwF7dKUekVfMHqeUL2s+
	 w2sjOkU8H6KJZoCoKw3b9qab2FzD/eTsTJZs8TLP6GHwT1RBM0elDHCpMSD5B8OyWvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793786387;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kVV+NwTV+9ZC8EqM9XWPxOExxnVbvCg7pip7E4xE4dU=;
	b=sXPRh+uiYip7vyeN7LqKSti3IErKMREuxNVKejrH1dub9Vgn8J1XT0sTzeIoxHWIx+bc
	 TsPe89u/13wZnpEgBqaa164GqCR31HkKknTcuJWQfSsCNfm0nVnpjVCAMv+ko1r4q4GqI
	 ef8l00fFpWhXHnZf/fsFATA06OUdJ6F5oogdvPSPWkJFklZwJzoQyKEXBxeYE8JsBWG2Y
	 VSGXudv9hdR/nUxHtnTEcBOwIUIy7+tSLmgVn72nLSK/1Ugr89+an9dPQR4/4XlJO0jth
	 cf+hPRHIkBVicnyeGNRUe9X6zXkIVDtfPSc0kIRQ3KTfX0Z8C9AjgIMg6WR66aJ7vHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="by0c4k/G";
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A33606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:59:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75A33606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=by0c4k/G
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1adbf62dd31so731893c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793786385; x=1794391185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kVV+NwTV+9ZC8EqM9XWPxOExxnVbvCg7pip7E4xE4dU=;
        b=by0c4k/G8PDiSTyd8V8QTZUxGYbRRFcRKl82h5qnXoTgfKo0vA+mUDh6kR5bVxygZ/
         bv9B2U0ziou9pEVt2+CcJXB946+SaYN1P/l0s6+O6e6SyXdgKZbXjeVACwDb3tgMXG8Y
         DqxoDy2h+bywhFbX5P6j6cLTaYXpPfZz0uDPfzT8mpoZfVjK8ZXegEgQ6maa71AiCxg+
         ZcakC+uC2+gVBHZEJhVw/d408RRh0mANBEyXuLqZDK3dUtO4SUVgdGi6DU0Qk99rldiL
         R6P6+vSoXRgCiLlWN2nk46QewI41qbNS7S9eaCZegKyIFwyZoUO1rHRcf1WKhzgn1tW3
         en2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793786385; x=1794391185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kVV+NwTV+9ZC8EqM9XWPxOExxnVbvCg7pip7E4xE4dU=;
        b=zQcsdhDX65IPkwquYcVTsgPPaeeGubnBZkD30NIH5OYgBI/FOMdLeT+yhKM/MqEnMe
         bkPVmDgi7Hl3R8pfEC0U13Q29tAs3sy0JHRvoM4fOKzMA2pz3bGDKLTr0CyhdZlKKWDI
         wMuy9aclJHwtWGsqhvI4TRHa3WISoCpqDyhlVx1KM+gb+X6clc4dT/lRZTIqcX+iZD0t
         pGsPG1NA4wClTd7XXsprF/gUkfm7Nic7LlbCp1183uRW5LrRDscMceB9b8jy3E11M/mQ
         8fKAKxZt7Qv0MlFXXXR4l7Y/X6yDER/4uT+nzJnUcr8dxM/J3S4jWRHBZNoJ0cYXzR5p
         PalA==
X-Forwarded-Encrypted: i=1; AKwUvBw0BY90WmiOX4rEr4XGGtHwHqA5N4dkK/cBn2RIr6YWWXxaIoeFSUuBUrpqplMs01Pp1TwbTrF2sPrQG6s=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KUdsq14naUsOxKj2azZQ2DMVEsrD2rKGc+TJLOoJ4XM6d0soK
	wnXzp0e3ONsyVLskSUme8GluccqxnafyGp6hmn2/fooIpg6gWL5jSlRt
X-Gm-Gg: AYBFou0WnOMrkES58NjM2GMMpgji731jKcRS85xSpzGqKLF+lboVdb3X9oPlpdcehgQ
	UWBY9BICNRJbJZ1P6lSwDorLS5JAO4voCuaW99Fi0+244HMwWyCYkkv8ORn57gubD7iZBJkmz0l
	5XYS+QYv0V9CUiCt3gBuzoq5x3qxpxqcfEvb/TavRBVObxZgCb52Wg3sMuuvWTj9a++iBFTtvPl
	+IdB0ADoMkdGRVSj0JYQOIKzFEeRBzf64/1avtZc+XfjGFvcnH4p9dlxo56tjxgIT12QRhLENg8
	1iKo2tOVc+NH1fRX1Ac4jCl5vbo7U+tWtjH5g4rgHDROnM1MIWT9G8obYUU1eJItF4DgVt0MMjW
	XZJdq60tdRhNwA294ZDroVeT2yEAPjbfTUZiE+MuUNcxNNd2ElTVMf9MiAsP+bg9eQB5wLPfBz0
	JcwaswQkkz5llkpoQqxy1eZN9uKaaIbKjw3C3zvtD/aW/YzhIAhlSy5XoA9ifcNXpBFqzhg5IhO
	ABpqp5c7QNaQcLz1oEA8jp9VxusmUknIlyyvJSIz+u2Jt1DN4vewDD590byPNbwn4djTOsITP3O
	wHI3x23PwsHmnEjlXqCEE1rFRhTbtPRie8kOI67NLvePFSU=
X-Received: by 2002:a05:7022:ea56:10b0:176:a225:e364 with SMTP id a92af1059eb24-1ac5de547afmr23249910c88.35.1793786385435;
        Wed, 04 Nov 2026 01:59:45 -0800 (PST)
Received: from localhost.localdomain ([121.101.131.247])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245b87c4asm6318999c88.3.2026.11.04.01.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:59:45 -0800 (PST)
From: Amir Hanip <killdeath104@gmail.com>
To: barnabas.czeman@mainlining.org
Cc: a39skl@gmail.com,
	abelvesa@kernel.org,
	andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	killdeath104@gmail.com,
	konrad.dybcio@oss.qualcomm.com,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Add Xiaomi Poco M3
Date: Wed,  4 Nov 2026 16:58:06 +0700
Message-ID: <20261104095806.18945-1-killdeath104@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <3ec43b1b00bca7506c1ca678c118f8c2@mainlining.org>
References: <3ec43b1b00bca7506c1ca678c118f8c2@mainlining.org>
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

On Mon, 02 Nov 2026 21:11:33 +0100, Barnabas Czeman wrote:
> I have checked it seems lemon have same adsp region like citrus.
> `pil_adsp_region@53800000`

Thanks for checking, Barnabas. Where did you see it for lemon, in a
downstream DT or in the stock firmware? If lemon's stock layout also
starts at 0x53800000, the 0x53400000/0x2600000 in the lemon DTS may
be worth rechecking.

I will keep the ADSP carve-out per variant in v3, since I cannot test
lemon. Adam, if you can try lemon with 0x53800000/0x2200000, the node
could move to the common dtsi in a follow-up.

Thanks,
Amir

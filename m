Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793745023;
	b=kVLODzgU2EN93+9mgC5aLZ8QO8JDOotD9fXBUEFUS+QtFbRgu3vmsJgWFevIQsI5JRRg
	 eYG5UuRT2ebxMiPUae/AFoq0wesFyuvC6XJhmWm2fwe1eikWOeEFcLdQdeuSp+pzvCnU3
	 kOAh5NooTqy2b9SoNiMMOi/GlJ6bKIUNcbc0BQBjiv+WQJqDnc0mb6TMCyPqJ3WYn+SHB
	 sKlbHBbsccu4kEl9MnoaoapHTyI5zjgyn833qNu3N+LTQ7+7c/VyDjBxnDt1IfFMvTVPa
	 leMwYfaA2xBJDyjb6kA7f/fJ3KvDPe9Txfjzh3YKTeSLeFEXbA4XfxoTgxNJ17czsfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793745023;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hgKtrYuVdHjTuyfAuNXo3fwBH4AA45vWJgvlpCPw6wI=;
	b=M84CYX2PTPEikkv8EH0eaAVOkVCZnG2j99I2xBva8oHBvMeIhm542soalwOy2bxyU2+I
	 VESOSGQEWlf62qsJqCxYROK+Em+WOvJTsABSwmv7capmH+S6GVnNy4+DXoIuoJbOgrpK5
	 LFVbUXTdIHoBSrEGvIeOMwsWfsONsnWjlfuTq7ERRIzYs/hDvaGEEC3oS3RRncyuUojcS
	 vE4spRdjroq4BLForoABqtqEYp+MCyIZ0419+otpE/tBc2LIB/xM7i3ufaVzVkZY99bGM
	 BVZXzdqtVkKe1PfE93XLFmPliPn1Dx7F02iLBXqPiOp756dm9JSNtG8gL9DdX8QgaoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W2dGWrOV;
	arc=none smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72ED3606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 22:30:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72ED3606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W2dGWrOV
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5ba35c0df4fso33686e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 14:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793745022; x=1794349822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hgKtrYuVdHjTuyfAuNXo3fwBH4AA45vWJgvlpCPw6wI=;
        b=W2dGWrOVUGv1ANZf3ckgVdemX0Kw/WCv73oR6CJXNdEtxjuzVsutJVdicfjM0W2jRL
         QC4487aiFQx3l74qyzXTrPeDLLGq7SaOiWOj3xwGHv3LmIoqSgYhmGQJ2gbHNFu/Keuk
         /5LgiOLVMpPMRkfTYbH6B+28sAZN5brxhXlF0CkjWJeGV3hVYb26mlLnYu7Za2l8nfP/
         4ZE9zuQE6N6THXzH4WfeXJxp6ukBJigrIFu0U+0vzTqSFhVEeQX4JNwiEmGmdtaTdY0H
         NNoUXUeaAwT81EKnTYjMLkzXWhM4W7dQ3hNOeI9r5lynQS7phtKGgD/wUMTtbUqZnXEQ
         yj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793745022; x=1794349822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hgKtrYuVdHjTuyfAuNXo3fwBH4AA45vWJgvlpCPw6wI=;
        b=lS0JN7ilJMmhXA50eUEIF5poyx1/jCzGP1e1Myva8Gi6c0Ztv4g6WigAkiRTJb+lXc
         Otirsx96MncskLc3NvppybGWxzpnwiUcuglfO0s4ahtvXp8E/X0nNoE4TYh0zcP+He0p
         Dm4YLy/xWUcq2RyJgNKwpmEbfaUE6xhn7Pzkke3nf0zTw5v2KTLSv8C6htNIkh7m27Zk
         gBbkemhknPEjwB2UVH2TRu4s4yVjayWbmZqNTeC7W9QQ+pb1RYAj/JzgE1Tgdn/Gjdt4
         OJtDjNM3vCKcWphNylGiWM1e8vnEBzBTQp79nomi+ld26x41CKuaNo4G5w3xh35aVTqC
         5TgQ==
X-Forwarded-Encrypted: i=1; AKwUvBxD/E2Toyz3W+dFuu4hoxAp5huZIyvyWjy9Itq0HZ9x+7ud+k55soNu610Kiln68/n+JXUiIRsCZ4uvsXY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zWYN8XcggKhqnJ08GU/Y1IPxe3tv9NA4JgcVnCHc1ODFp5gln
	QqkPnbrUblah1L9vn8r0MiUJ5PKm2+MBxV2hMkyPSECopX+5qfzX+H+Q
X-Gm-Gg: AYBFou3tM9Ua9sWpKfmqIP2PHAdbEv4ua9w0eo1k3tBHNaDX2bJpPPU49K6d1LjdLAT
	lEzuIH475ko2ns+66dD5tI/vKQZfQ3IzA+DmgLN4sdprWCxXY7wRsN1nyN42IRLDqD4S7S73wGb
	r7ShZfH0UetHBlhzfZTrtGB/d6jMYWGjAd4L/37KOS5aKio3R8rGZTZu9NdhgPsb0U5bokxGB4J
	7W5taYZUEqbLIN/YkkBjZe1wLUm8yxLh01IAK4j7RezE9y36R7r5xEMQCybMKXAaMdgXy+Ib0TL
	hV/6Pm/ieJIyZTuhE3aaYJjuGUI3XWDhS3J3jIDsmffBvdVIFYlIUXw+mHE8M5DnRzwfsEbSPpP
	xS3JF3mgo/H6t1fZWwKwwSoZ4w7uhxSiKWq14nVRL6vbDciTDmgrQLu0Oz4YsFRAbtqSs4HQMHe
	lDqgH3LoDzKQB6EgffqSuqsTXOw00FphF8nHYPFmd9bdxCEyp2cqcYxA3IQQC/fq6CIS5yacJB+
	gQwq1O/Pnp2c6tXpmc9Bv1XAlL4JmJ2W5y/XF3pYVoaBML1wMkxOpL7y8Z05/Hr8Nqo282ecOPz
	fcvPFraNMIP8TLjAjr/1v57rcTpM04IfZ/YE2acub2WVT7fwcKk1Wfj04PAi26NVX/3fSernzgu
	MD5++hquR57Z0ltvZ9Bickwq/MovGhsnxjkp99Q==
X-Received: by 2002:a05:6512:3f13:b0:5be:54c7:75f5 with SMTP id 2adb3069b0e04-5bfd95651a2mr5290197e87.18.1793745021435;
        Tue, 03 Nov 2026 14:30:21 -0800 (PST)
Received: from yantra.. (nekmmqti8d1bm4i6lqd-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:6004:6869:8249:b585])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bff38cf919sm113677e87.63.2026.11.03.14.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:30:20 -0800 (PST)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: paulius.zaleckas@gmail.com
Cc: Jonathan Cameron <jic23@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] iio: pressure: dps310: fix input checks and resets
Date: Wed,  4 Nov 2026 00:30:08 +0200
Message-ID: <20261103223008.12675-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029220635.18816-1-zoone.rupert@gmail.com>
References: <20261029220635.18816-1-zoone.rupert@gmail.com>
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

Hi Paulius,

Jonathan is holding this series for your Tested-by. Could you give it a
run on the ZTS8032 when you have time?

Rupesh

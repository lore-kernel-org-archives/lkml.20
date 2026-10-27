Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793089352;
	b=zyhbtS0NxXX2n2582LqLGdOXTI2scKIvYuKgbCP+UOe+IxBkni2vBPvHfNcDnabjvlJU
	 th/zjFmIj9l13nskZrFjwpiwfkSKm5VIvyUbpWHuJEX+FFjpFHwgqAXNdvcQsuFyxQoZ+
	 VHluUEstoqGvS980ynHSlRNgtiPNWxb8BUQl0cuKxwPwI5ligv6+YLch81o8trZjZSqXq
	 kLzVVLLKekcYcAyPAZiJO+fkJgkuqkCaEulpwvbIR1Cl1jfB0Ybiax1mySJt1hbHQdLtf
	 UeHX4gNhz7/4RXkomkDR8L0uSoD7M6kaXM12jqu6lxPRVFBQ+/rEABmJkCnDTjniXRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793089352;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+q+RfQ5Kwv1XNt4YuEC2Y4+X+a7USu5opNal/bTFsOw=;
	b=Hj+LxiyYtWu8QjDD6uH4qS4FBhLRXkMj7amtHOZE/Ghil/ZgzrQOJ/UO/zc18m1ZReoy
	 cVJPAYjgaLY/LzOhq8KB4lskRO5CoAPOYfJprnn3VLc3gRzqRkdpZSUbi6tXpHQsSv1Ig
	 VHkWg/k3e3z3BSCrZgfMmP4OAnQegmiucfXcSGo8fDORWsgcAee+9OMLViKWZRJSfH7j1
	 mZU2B+zytXtaNXm0fZhdGP8RMyqdJnFvXwEphrTCXm2TSajDRgUHiQXxjrs7t8mc+CHKs
	 mv5h8telPhBM7MOLCHy3/Qqay/DsQdeddknwNCdSWOnABkiQI2NaPI4kGocAweYXILg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZurG5xut;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E621606A329
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:22:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E621606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZurG5xut
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35829219da8so940776eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793089351; x=1793694151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+q+RfQ5Kwv1XNt4YuEC2Y4+X+a7USu5opNal/bTFsOw=;
        b=ZurG5xutDCh1J7m4GPD1L2fxDLreUhtXfCdJ/Qc0XSYIV3caH9ozgfgRsilfd9MiwM
         WqfYgBCJvBtKJGTxAl+ukXEnDIM+oLtaQcxAsC3+fO720QsZGx8qlGNHlPALrypI92GJ
         LtRZdAaL2NHqNNLZRIM4TJESul12xrc0r1TIg5UH/gfHCaqnsimeF1+ZeIaQZscH/hl9
         0bZr2dpbaagVpp2X2K5xAjUFcHdgy1jIaXKXDDvk/xUQyKR/N/yB2GpO2IxGfpypJz8E
         RB5Jsf1R2fhyL25ZB+LyOMYJn2pUClZkIcopdr9zlORMqMXbPvV8h+V+1lVYpFSV72Gj
         Eerw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793089351; x=1793694151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+q+RfQ5Kwv1XNt4YuEC2Y4+X+a7USu5opNal/bTFsOw=;
        b=1baTccqNf7WLgOd9OPDDLOaThVjC0CztiB7ijKDuvmL/Lu77YFj3P6u1keWKTGFq4f
         DR6LURDrgCv9/Gy6dw+WKyp80cVoXfhoZfFXtmjMCYH231i3vy2yIKB+UUuqgGBor+rq
         UzqQoahS33iC6BMBkg4NOLU8//hNBtYPFplb2SBdTUFMBMYr/cdhcxy7kQXG61t4BD/5
         86/HCBNBAEAJul4qc3013HrqXykxxYmeQYD4L4kXyWAtXh/jbmwORdUzBtWG7LJM467x
         IBHoHfqChs3zkFtgIMnIi/E1PSWRWxShPLyDlCkxpU5oAWO1PA9OFt4J8wNOh7VAAxb5
         KWtQ==
X-Forwarded-Encrypted: i=1; AKwUvByPILeffjq+6loWcAqLYoV8TyOseXhhWXHWLuLWYnvsY1OiYMBK40Yag10wnUeW9sXBj0j409GpHEMgWGk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLeKKzwvhrT6vv0HeOpVOwtjfB5J1DvRFb5eo38zzVbA9ff/ZkJ
	s6OMBZlnUppoHyxVR/dRIuEdtZSbtHUBPIYRe3oJGnBBjsJZ2mEB2kDE
X-Gm-Gg: AYBFou25LmPW8gyGeYsfO6DvEKLXKloe2rx5+nR+eH2dD9D6g5SC6ErJygW4kOUpPX9
	29SrLgDt/u4bXAAJ7H0EC5Oa/0mOnQ+NVmCpM7pDG7TB4YQSEGk9zm4D7WToqYPZJpS6w6l40bD
	7sE0uy5gkZ41Yl/q2SKBZtIuPInB5CAg9lf1PuenHa0bvRyBtYIFkaQQ7tboWmoIvWjpX0X04/K
	qG0JJWAuP5KZzCncYY8EE3/M46MtIevCnXMF+fOMkwgnFX5gSTpY3mmvdvwlfkPw2J8hAKlU+Tt
	qY+QJt4GBgMxYP3/BSw2JqYgrQIZdHHg0P+MA08M++FgOY7Nqoc/AFktTJ52L+W+6kHRyYVn7tw
	Z2RWegmSnj/txB4f/+AsM/a7hlKzOJVG8CsMCHtWSqrIxKVzDnHxjISGNMHZak8p13RwX2XnMtj
	rRmru5Uy32083X9zhqvsH0kCpJtALLP3ONhYUWUqH8dQmtBqzvzGsJSY8woMgOd+ew2ux1CNyzb
	6rc7xFsMZ4w5veMbGH7sEyHX08gy7Cr5FeCKO6SKZXxui4YNeA7qpfcFlGoqgk/Vmpz1tgWX5E3
	HM8odp4AnwvWoILqYGk38yL5UucROULMf0zKFKJyCCgsAA==
X-Received: by 2002:a05:7022:1703:b0:144:f0c6:ddac with SMTP id a92af1059eb24-1a3c53db509mr2547824c88.17.1793089350969;
        Tue, 27 Oct 2026 01:22:30 -0700 (PDT)
Received: from localhost.localdomain ([113.161.48.203])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0f81ea9sm37314409c88.11.2026.10.27.01.22.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 01:22:30 -0700 (PDT)
From: Adrian Nguyen <thenguyen1024@gmail.com>
To: Fabricio Akio <fabricioakio@gmail.com>
Cc: Casey Connolly <casey.connolly@linaro.org>,
	Sebastian Reichel <sre@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Robin Snyders <robin@snyders.xyz>,
	David Heidelberg <david@ixit.cz>,
	Richard Acayan <mailingradian@gmail.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] power: supply: qcom_smbx: report charger state changes
Date: Tue, 27 Oct 2026 15:22:15 +0700
Message-ID: <20261027082215.70983-1-thenguyen1024@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261003-qcom-smbx-chg-state-change-v1-0-fffaef446932@gmail.com>
References: <20261003-qcom-smbx-chg-state-change-v1-0-fffaef446932@gmail.com>
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

On Sat, 03 Oct 2026 16:45:20 -0300, Fabricio Akio wrote:
> qcom_smbx does not handle the charger's chg-state-change interrupt, so
> a charge completing is not notified and consumers can keep a stale
> status.

Tested on a Vsmart Active 1 (SDM660/PM660). Switching charge_behaviour
between inhibit-charge and auto now fires chg-state-change once per
switch, with a uevent carrying the new status. A charge_behaviour write
alone doesn't send one, so this is what lets userspace notice.

Tested-by: Adrian Nguyen <thenguyen1024@gmail.com> # Vsmart Active 1 (PM660)

(Test script and mail drafted with an LLM assistant.)

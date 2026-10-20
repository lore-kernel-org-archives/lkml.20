Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792519830;
	b=GFlPhaaIecEE/UujCq2Enf0E2xBSiYK/Mi11e7dZWY4h2GAzpGeTYzf+eZ7uXJ4rOcR6
	 ly599WDSmAwgxua9hj7JNqR3fq658FdRmHg6Hs3HSydIG2XivzZIUL0wDudPia+VnhqYg
	 xvdrvz5qNvXWsckURapMF6EA+H8tmpIMuGxM4hCbJ0r6j2S4gAfjpGRNRq+A7e2rQpi26
	 JesfUwUDAizPMCesGyV4Po0mkcDJ8Nt8VKCxm4HwnZ5+3gKtVF67+DEOJjYQVXWFu8QQf
	 NaxO4U5snXSHdoQIRGpkThkQ7AV6pCSnbe0O2WM73XFIrmFqeDHVQB2LXNpOJSoZFdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792519830;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/6BgZB1uMeWS0XRauHuUVvKezouU1iP9WGA2DOuIHe8=;
	b=F6rH7cYiu6Ep+ftAOJarcaeETYs3nvTkqLdZo3/zELsZgproMUyGTU91+/2fEf0vTiWE
	 WlYoL0cwlXRwlj06PteIgRo8W9t8rCaElceoUPMfwIweeuyTKeF4OUuJiLIXcLTajCIR+
	 9XvMyazRiqII/zXHUCcjB8wjZ/LGJIWbkbNIAE9snlyWZ04Gt4HJG5uOB68hyrzMMXF9W
	 EJVn/NDel4Rya3h7J4SJzjFoXPvQeNkfDLNlohCUuyXDW6giY6aqXyMnyuPtiB6BNeKeU
	 tlaIEBG1i6/qzOQQL/WoU4mMy6ibLXAoPjw4/4171omc+WDjGM5cGn7yAKgitWJOvDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ye6rukP0;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA80606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 18:10:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDA80606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ye6rukP0
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a0e1b0681bso24531435e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792519828; x=1793124628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/6BgZB1uMeWS0XRauHuUVvKezouU1iP9WGA2DOuIHe8=;
        b=Ye6rukP0icPBg5yA4loFUF/P25NgO1lCkbvI4IebI73fp1j+gNyAtUKvTozJG/W+Si
         vdSIQqvUMmPA/RQE/fe/+6Te+2pxSe1GCWLfrqIwpd4in0TRCRLwSuKgwVvzCqljxurg
         8JC+s+eqg1SBtTMPRlihaK3PILRNkd1zZYvfIcu5dOfVH+8EDM0fJ5dN6qu2/QSltfSP
         Zmnqg7KDp6Vr7EixGMdPRCzDZBMh9eOnLf8pZK/ZhWePzEbZBFKQpC/YiQcMcmcbqQt7
         26IEDWusl3rbJVu/+JOR6Y3rKwm4um4PuOlBZPhDEEK1aWuzLcYRtnpWyTpXnfDiRQiu
         lVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792519828; x=1793124628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/6BgZB1uMeWS0XRauHuUVvKezouU1iP9WGA2DOuIHe8=;
        b=N1o9C1B+mCry5uWKo5qn3Tqd79+MaUc8A1rA8T8957UaZcOnrdY/bitKIOuVDnjQcL
         sAFOUoS+EVFj+2lwdbq/VMT3NbIbuxrQo3e//cObxUsZTKEPXbDG4P1HxBTs6/OgiCaU
         2rOsEyv4MSAoYRswOSAvLBOhOfAWgzkDCaVzfcqNqLD6fjFaYReSxLC364e2BbCSKZ3W
         vKwfN1KgPfjXTIbfCo2ePPETqu5YSECXB5kFz9HukgJSXjYGim9wm3DAXx3pDiDCYED2
         urM7I8YQwdwigpF6a7ArkYy1YSHFeea6qrKu1Uzt8+Rsl9/LOmdBxKHYoIqF4B57vMAt
         Pg7Q==
X-Forwarded-Encrypted: i=1; AKwUvBxOkCN+rMJAV3PAuLAdV/ZdaV/wg1fqQQa8GcllZsbBAj+gATRSQ8Ogd1ZWebyPyWwHXg2YYLHngUSy14o=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVDmyoOybD3HGzusagL5j8+ESl8U9H70SXBvLC9pm11F3FuumB
	99ioHcj72UYQNVlxuxchrGPlEHiSGD0ErRJ+IZgW8F5CbjFOhD+drmti
X-Gm-Gg: AYBFou0etCoLpWs2zq+ebupgy0DX6FGqwQMW+bgSynknEnXHFU5oY0i7s25F3u5Ab6c
	6kYw4yOz67Ee2NCF6hghEMr+4btfhzIGlIUqqHYW2/aRihNBeIjtT7cnaqsGm9Z9fBCLscALjZX
	8OT6xDfiHnFEzepfPRiAkcseTgbR1wG9NcOAsccyjSLcSaB4DZrQwPT1BZkhJ8Ssxa3P+eFwEEV
	fMlswDTo11kxXA2ejqSf2QoG8dL93HmORKZ9+aIwRo86yGnFuYBEd8lDAjwGI+bRmD80bVUOu6Z
	qsBF+BHOPkXof8rYAKWlP0N+YdDoBq9PJBAyNIgjcHnTccSDUYdY3hk8Qgj6EI/VAOAkDuRQ1pX
	/JYvO4dGYCZVnoJZr4KJQWRhz6v3n0ocpA1oNhKUTq9q364CDi3IDJl9AW+VwZP43uTaeH5WcJZ
	dWYOYx2dJbehgDeo5B5poiFG/Gfs9oigVJGrLrposHzNWBHToGBeuald/X9M91pWcjbtXswlrxO
	BWuVeuVkhSgkg0A6ZJ5BYh4Wylpl8zTwjgBC8f/gXMq00rwLOVbamsI0xPV9lmTNySi2uZ2
X-Received: by 2002:a05:600c:3b09:b0:4a1:f7f4:7ced with SMTP id 5b1f17b1804b1-4a1f7f47d43mr54411835e9.17.1792519827775;
        Tue, 20 Oct 2026 11:10:27 -0700 (PDT)
Received: from SP11X1e.cable.virginm.net (cpc99340-croy26-2-0-cust244.19-2.cable.virginm.net. [80.193.62.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2581f0d4sm50665f8f.13.2026.10.20.11.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 11:10:27 -0700 (PDT)
From: George Neacsu <geocausa@gmail.com>
To: Sergey Lebedev <lsa.uz@pm.me>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Marshall <pm@petermarshall.ca>,
	Hao Yao <hao.yao@intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] media: i2c: Add ST VD55G0 global shutter sensor driver
Date: Tue, 20 Oct 2026 19:10:25 +0100
Message-ID: <20261020181025.8625-1-geocausa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261020142641.24808-1-lsa.uz@pm.me>
References: <20261019162722.25587-1-lsa.uz@pm.me> <20261019162722.25587-3-lsa.uz@pm.me> <179243379000.31842.4735750009847702427@gmail.com> <20261019193402.52923-1-lsa.uz@pm.me> <179247822513.25202.7960395606350309657@gmail.com> <20261020085200.60619-1-lsa.uz@pm.me> <de8c6003-c7b5-40f0-beab-4c3370b98f09@foss.st.com> <20261020142641.24808-1-lsa.uz@pm.me>
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

Hi Benjamin, Sergey,

On 20/10/2026 15:26, Sergey Lebedev wrote:
> So I agree the register itself
> should not matter there; something else in v1 probably does, and George
> can narrow it down on CAMSS better than I can.

You were both right, and I have to correct my earlier report.

I looked at the receiver side with a CSID change that only reads
registers at stream start. RDI0 is set up for data type 0x2b (RAW10),
VC 0, with no ECC or CRC errors, so CAMSS filters on the data type and
the ISL lines (DT 0x12) should not reach the buffer.

With that in place I reran the exact v1 module that stalled this morning:
same build, 403.2 MHz in the DT, and the ISL_ENABLE=0 write still in. It
streamed 5/5 frames, 120/120 at about 60.2 fps, and 10/10 on an
immediate restart. Builds that wrote 0 and builds that left the default
behaved the same, and read back 0x00 and 0x01 respectively.

To rule out the diagnostic reads changing the timing, I then booted
again with the unmodified CAMSS module and the same exact v1 module:
three rounds of 5, 120 and 10 frames, all complete, at about 60.2 fps,
with no CAMSS errors.

So clearing 0x0329 does not cause the stall on this machine. My earlier
A/B was a correlation, not the cause; something else in those runs made
the difference, and I have not pinned it down yet.

I tried to count the DT 0x12 packets directly with the CSID's
long-packet capture, but enabling that capture changed the behaviour
itself (one frame only), so it could not serve as a passive observer.

Sergey, the write can stay or go as you prefer; the Snapdragon model
does not need it dropped. The 403.2 MHz link frequency still stands.
I will test v2 on the X1E80100 and send a Tested-by if it passes.

Sorry for the noise.

Thanks,
George

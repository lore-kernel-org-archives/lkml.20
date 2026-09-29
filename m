Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016044FB9AC
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790697850; cv=none; b=ZMrQsmIGFAfMK0EJthXMP8gbXAOVN4N+npjkvpeGq1C7yMAvONEbOj39rryVSmzGwY9n5yzCEVrkEUkM1A+zU0IFU3pAaTYMwCljUDyKCCetUHCWj8zuJ4VGSDOuodmEVJdMZ0GJ/loHgiUXIfKv5k/fOqlp4nh0hc+qpU63cLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790697850; c=relaxed/simple;
	bh=pLD/sl+DuidRCJQ62k4a8dX9KYvP7sK6qHRTuXkXRok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bPFbb29KoP6XaWdNIIpedYRRxBSt8fAUoQFPkaOAcINmVKYT/q3r2bqIuC5iqXXvnMMEkkk0K4eui/aHDGVMzp834ZWb0S1vxp3hk1Yelt32uH6t92VcP7DxcoihHdrdRQ09OUld7mU5+UGOt9LMClSuQ9v2qJTqLQSyIDLZbG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lVAB2Svk; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lVAB2Svk"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4885a1480a2so2606573f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790697847; x=1791302647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pLD/sl+DuidRCJQ62k4a8dX9KYvP7sK6qHRTuXkXRok=;
        b=lVAB2SvkqU3/iBer8iA9jIDDUMLhtgPNp3JeVVDUoVL3RJrlgoR/CgK5qRxei0Vsy+
         CGab9xF4TP8/pfh2ZeNP0XgvyBBJ5BgKwJTga9jpBVrV9fH7lChbTuklDNe9+7ipkPhR
         iznV2J6xuyv79+qiWxND+qVxbyGS3zNKELK9YRZVMmdE2IMl4pEoaWl5odBOpvEeLyI8
         ble2N92lR7Bueq6i36hVWqZWt0khXs2Viw7aQi5pqiCiTiovg2i2qNKu306a41r4sRIj
         NNM7dw4PAESD14d/UD021KwceZvRS9U4/w8vmnYtd1ImtUhwPtAIWi4WVOm6+Y9S2apZ
         ucog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790697847; x=1791302647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pLD/sl+DuidRCJQ62k4a8dX9KYvP7sK6qHRTuXkXRok=;
        b=oxLG021TsmIymtZ971KU1nLiMBCBCAA4er2SNMLeORU/NisiBTwdTP2JzTwzmETkiA
         FIuTs3h5gcQrvvUIyWJSbdeHi4+m3aj+AMn3CTSfuVe7BiBzNK30uXbcRD6EZKQt6FBc
         vBGeveEoWgr8mxXfFe2UfXnASq7/2drBOpgbTB3AHI0r2ez1YY+q/j1z8oBIY5mgvWED
         2wZ4EPYXHQzSsbV4JU8WKxF6iGw19m7H9pFcrdhsOcorFfTby38eokgJw0nH/hzzx6Oy
         Bw/mNcxrdW0aagzmRbhMY0VRo68zko5w5NrEp+X+hLW9F82W6EqiaysaqJ5gtT5KYE5E
         pwbQ==
X-Forwarded-Encrypted: i=1; AKwUvBzp7SPR0GaxyEnBJgSq46sklJGdN2y+E+zXDUnC8dNkHypfme0vf9Cho4BR+Aeo5+8sCkTOQg4TujpkgCA=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0XicEn9TpJUSZlYRx68iLZS9lXSWka9dYC8vzh4icwWrUJWeZ
	IOWlLJNJa12ZVY+/AyvBczNIUQ2t74yYplxaedQ46LwgYmNzazWyb4g=
X-Gm-Gg: AYBFou2iYKi8kpPAWtofoGCQojgewTnEDdKcsclBoWmhh2W4J6iwGE08gm3jLNq5jUL
	kIu4LLQy53+mkIcN+nlqhOx6Srvxxpg8nuxnUWIhLoaQek5OdcOKdqf39K2uPY2kVrn4v6G1Zri
	WoBNBMZRFdZFiUyzkxg9GrbIBDvuRwJGCUEz1p8Nj6dy4tSRP/lyvcp8CMYc845RZ+tIQDwCKRH
	xp5IrAvk7Mjz5klAjyUNjcN1Ezb1lBuzqGPKANaEIczN0Y9qTs4pCjbo/cs6RG+3Fu8L9X9yznq
	MWWn0RyIxVSsjqR4E9UQw7papRCc8vRso73FLiWwSr5dU6liCt5D9LP6ohIBv+8i3xuCBkM0LYX
	c3h5XDmrqjnt3ml7OLwMlMaz4ZJmFZv+huLmxVxcBhQvpanGNMo3IT5DCqenn/2ZjVIhsvco/Td
	yJPqqCCECqrlaLUz3ibNimTyjC1HHaJFmqmB5M/7LWWlQIv//Nyvrx1GJddNedDQIQotbyylE=
X-Received: by 2002:a5d:64e7:0:b0:485:8c16:a34b with SMTP id ffacd0b85a97d-488716f4653mr29190815f8f.35.1790697847051;
        Tue, 29 Sep 2026 09:04:07 -0700 (PDT)
Received: from fedora ([46.8.219.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af505e699sm5133578f8f.20.2026.09.29.09.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:04:06 -0700 (PDT)
From: Vitaliy Sochnev <sochnev.v.74@gmail.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] thermal/drivers/airoha: Serialise access to the shared ADC
Date: Tue, 29 Sep 2026 19:03:56 +0300
Message-ID: <20260929160356.38468-1-sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <5c0317c1-f4df-4b2a-ab03-2a7b7132b1c6@oss.qualcomm.com>
References: <5c0317c1-f4df-4b2a-ab03-2a7b7132b1c6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 9/29/26 09:53, Daniel Lezcano wrote:
> On 9/15/26 21:11, Vitaliy Sochnev wrote:
>> Serialise the sequence, drop the cache, check the selection after
>> writing and after sampling, and return -EAGAIN if it does not hold.
>>
>> Signed-off-by: Vitaliy Sochnev <sochnev.v.74@gmail.com>
>> ---
>
> Should this have a Fixes: tag?

No. Before this series each device registers a single zone, and
thermal_zone_get_temp() serialises reads under the zone lock, so the
current driver never reads the ADC concurrently. The race appears with
patch 4/4, which registers a zone per sensor; this patch prepares for it.

I can state that in the commit message in v3 if you prefer.

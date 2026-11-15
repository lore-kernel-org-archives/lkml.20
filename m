Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794745467;
	b=kO4B17Oece9XL6RsL+Z23RumZp/QqGH8LXywORbAMF2OUC/u/PNEp30AZ24ErVBmuxvw
	 tKi01ADIEeS02ggbf2l/+qJu+jlU0H5whiYYX3mo77v6uO1ucQhl4+3FxrPrAIMNE9dAY
	 p5yWTHT2X5l0t9El8j0Iwl4XK+L5cUbmhpCjsrLRmnp70t+/zBJBi5mBlgXj0UbopSIfa
	 feIIEwMU/k82brxZy0fnYmlQTTccbQBLtisduo74/IjOcIlJT1XDpCUYXLEjNhyTaq0yj
	 33UyHtca+XKm6dB7eHNdBluDI7i/fL8Xo9S8riAqnTqD0vkJXqeuxMRs5cNmD8eTDHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794745467;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=+glsQERFZEZXq81RagwSLF6fsoyPTibQ4SkFNgoTuqY=;
	b=Ig+Mtu5o9Uj3VazFIUYZ9aT/MmgV2xOBXy3A4c4ByTjwuVe4Lnssu1UIsa+QHOKqYv0q
	 kLyDWzRiwJ4LyRW7evgAQc33qjrFcbAxykiLrxaB7vU9UMZXVgZfA/7n0zbuD+O7hYS8a
	 D3Ifn9Xy/DQfkrkZ2KBj8WfK4ywLQqO+L1rIEtRqcC4E7J9OggyTgjxRKVOAxvm9ebmt2
	 MUCfA1+QJKZrL74ZHFahqy6E8dsE0XoGed8UmjkwrD5xhTwmc7i5SfXffk5tuwdHEIkvn
	 8Yr/dRyqrkFB3ikd53nnKl4yaO1N4yOdzOg+xKOjyvxx/alNaHhtk9n1zbbbl7cfPEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=p82Yr65W;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C6B606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 12:24:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6C6B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=p82Yr65W
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2eddafe648aso18221585ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 04:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794745466; x=1795350266; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+glsQERFZEZXq81RagwSLF6fsoyPTibQ4SkFNgoTuqY=;
        b=p82Yr65WUgghLE3IX8cyCHO4Kpsp90pywE2m7kI9fyI8p/avnhWhnrKa7HCrerphbZ
         mQqlxJtzxf60Qv5UsnOG/ciycpQZy+5OHHAaEJb4wLocIvegXLaAtffVOLo1GDl8BkoR
         P0h7Je7Cnp17bm8A02TyEVE91IS1vbJ/NX5tK8C/mQMOZOs2l+5f6HNIVQ3TGCicHkGx
         AQZ59/CLA+DPkiFX50ulhDSeJYGTkLG+QgN5rsv1HnsgLxOvNxCM4w7/bzLTNg2kryxo
         jlvWRkVpRH0BNXj62BQeNKFS25XD75uQVMEz2xecWLgVLqInHPlLrxkK/zgJ7KNnhxGr
         p37g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794745466; x=1795350266;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+glsQERFZEZXq81RagwSLF6fsoyPTibQ4SkFNgoTuqY=;
        b=kyU9igC/eyQ6KLSMS7YtOH9S7lZk08F5dT4KRJl85oQRkIKq60vWzO+ruHgZSjiCBs
         FBJ3SDe7P+8/f5AYJq+Qk58mOpLAQWcabtm1KwBs5fRBKN3FlLL4HTAVzcRcEeHxuIBh
         8o11LchnLPd4hfgF8ulxTEOMqNmqfwneM8dz4DEj5AG/kO/cxamt93w1iQZCB7/c8XCs
         RNCFxML/PY+H/ONE/vTqZT95R0sq2mIelQG+7QHY/Cu/3VkEpIGADvJMA3ldHXSnVWbI
         UIrsRVl05LxKMh7CIXoQ9OaTQlo+gPIklmaT5c9ztfciP6z3u3gC9ANjDoegxnNeolWr
         WIrg==
X-Forwarded-Encrypted: i=1; AL+hErFu96gUozPamZhdSWH9kRO1OHVnPzpM/+16LEPpcoVXlpU1u6BUTwqg3rBL+15NtzuiFhQqvL6I0WIk0u0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9l9He0ZMAqlbWiweRT5xet2kK+DBBszh4jv0DwxtdG7RLwoq2H
	ApQLK7bbwDtNAKZ4r5SLNl20QjHJwlOD2k/Sz5RhKRIzGX78kamOmpf1yrS57KCEwFg=
X-Gm-Gg: AYBFou3l4/ZrAlA265ndwhTeUXlrQdq1QWRGCukrsEgxdUn67O4WI/LJKXL0hP3Yhnw
	Jf4NTUYcVZZXYD4lC5MCudksbkk4tqHWRZtwT5/xqSymnlPKhaiE3seyEb7Dtqfr2zHY3o5Kp8E
	bRUBlnIFwBB40/pKJDS7+Rd38fN2mDpV+YFxRcvo2bTupBbXiwcPUV1TAFfs4PWZ05E5myYdlwP
	7Gm/zZ3ennk4EsP5SGjuVew4UWVDmxXcLYBr9drl6zHvxoo8A/qgv+tVbJ/AckKhw46cn+88qNr
	VdENgsTH93MLA9bCHgtQDYUy9mdeRcMEpxXYY2eumnoWtBs57aFO/KSVN7LBiPbxcNTip68wEUH
	UOkhQxFlDaTYdUPgnhVlXgzOHKdlu4FP/5cFLmTfAOywv7U1S02gi8G/nZvTdA00pR09UrCNLJm
	QfVVNeaEqoIYNGVsiApjDNfFP7k4eaGR/o3OfiK/oVa+6H8C/kBKviL/ZDM+TYKoVvHtO8PXoqQ
	CPLRLe0KhQYkIw+qzgUC8ReXvMbemCqwubE4WoM3NVel1iqr6sx76DjgOpql9FVRljsQJl8iSWQ
	1QVtr72Qvot65Ik7dDB6Fj/JZFokj0pZ///RMes3viPy4iyMdDCqbkDcEhzelehmQ4+fZG8S9UD
	rHtIEVEGXlxK5yemfWgPTloVksFbRiwuiM9UMZg==
X-Received: by 2002:a17:902:cccf:b0:2e4:b37a:d583 with SMTP id d9443c01a7336-2ee0dcdca58mr70807355ad.61.1794745465955;
        Sun, 15 Nov 2026 04:24:25 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:35d0:694a:1071:9bae])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee10efc2easm27668285ad.1.2026.11.15.04.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 04:24:25 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: lduncan@suse.com,
	cleech@redhat.com,
	michael.christie@oracle.com,
	mkp@kernel.org,
	James.Bottomley@HansenPartnership.com
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] scsi: libiscsi: tighten management task completion
Date: Sun, 15 Nov 2026 21:24:15 +0900
Message-ID: <20261115122415.1446881-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113233938.397415-1-yhlee@isslab.korea.ac.kr>
References: <20261113233938.397415-1-yhlee@isslab.korea.ac.kr>
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

This is superseded by v3.  1/2 and 2/2 are unchanged there; v3 adds a
third patch that makes the transmit path hold a reference before it
publishes the state 1/2 tests, which is what the three issues raised
against 1/2 come down to.

https://lore.kernel.org/all/20261115122122.1446791-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee

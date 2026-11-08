Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794101012;
	b=fVSGAwbULCOsReUFW5hhUHu5dpIzmYGiJIBuBGOldh54qxTdw5QrqiAfYQzSgLca+kIH
	 EX95Q0fmSXFCvSB61IIp2//LvUDlB5yW6j54voLh8j3On9WXGyX1qVTkxnPffRYqK5oLr
	 tWSmrdq1z2BJTzkVePFyCRBE903Sg8qOUpJCjrAcwQgyHbghAcXN+9JcwGlPO0Eem9219
	 M2V2Na8C49BH3q9Q6U0p834Kkb5V1y8zvLbRfJn6oy41OohP0hXAGgbdu/NKftWI+n8ZK
	 nen3z3i8JY8Ty3ajfb2UjADNDXZFyhAIIY8LkZrERYAOJf89lfDFNeyQN2SdtK3bqNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794101012;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EaQPKJIgHcZvrcBYOXtJ/XqbYityXldTm39GT/47PWU=;
	b=3sCjaODU9xKVuHFMGVkWnGvREO/fXyKfFlNIFghguPzZS8ZYISMo1mXXapZYoc1/9/yu
	 juSEwET+XIKTz3pw4FIpB5OtVQXoIpQ0wiMfDg8B29u0K+zlGZF/CaXz8ts0pqYz4+SsB
	 KXer522pXcW33vASwNbcjI87CCxBYbUdGKmm61Y1xOGYxHqclJ0tds+WT8z772WB5w/dX
	 ApSAz4HcQ3nuJHudCQFFNZgko/aY/QPMb/fAfYvAyJ48M4S5SmQ4q+QYT3snJ202nBcI1
	 nT9Waf1TEYuAzwbjUnhoi24h6lSgrwNV3RMJOvzScjRSKg20GILSaGibsd4hh7YAu4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ve2niqA4;
	arc=none smtp.remote-ip=74.125.224.130
Received: from mail-yx2-f2.google.com (mail-yx2-f2.google.com [74.125.224.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F96A606A330
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 01:23:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F96A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ve2niqA4
Received: by mail-yx2-f2.google.com with SMTP id 956f58d0204a3-67beadb6dbfso70562d50.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 17:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794101011; x=1794705811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EaQPKJIgHcZvrcBYOXtJ/XqbYityXldTm39GT/47PWU=;
        b=ve2niqA4RDDgqG+tXiwhezhKV6NJswF1w8qz+PAiVqAlFyszJ747lOV6zyz0reC2oo
         yTj/ZXUixO8tzwURePEyX4s6MjwoJds/GXeP9+3LWbzHrnKop5kbdcqvB49a55P31421
         j3ilVims/jD1ENNWTKmYPtZuOEoXo4dE+nJ10Q/uQ7uKVFcdFAp6VOpWD7M/D3VzNwIO
         DFPhCk12Wgg2JRjAPfQP3mBXJ/YVXX8QOqelCM6gZU50wg7u0X/K0diqfQ9nvXmMvRJL
         FFt7EsQ4LU1xFLkC1d8HwHp8TJm6opmUDdT+MX2weBj0/fPXsLo/zfhm4ve+bojCd9IF
         XAXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794101011; x=1794705811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EaQPKJIgHcZvrcBYOXtJ/XqbYityXldTm39GT/47PWU=;
        b=FueNYGC1WnzgLwSMzYvae0OTLDPbAkza9CUi1wRJ0cwVUCpGulvsO3jjhPN4AwHem6
         g+d5704NP337O1erePRThmkoYNHdEdjjsyhUS9GXTI69/lugzWZAfZEND1wrzdsn4Rbv
         w/5rf3tlATOIn5FkiPTQC01xFrR0LKQVknf4ZHl6ZEluAeip4sOuvJT/e7WwyniWUhqA
         ZwYWyEz5/Wb5uamt7faqN5lyh5STbImIg/vWJ2zEXIdFi73KpyjP0AEId+p5XpvPpWuI
         33VpV2xghtI9yz1t3SO4f7gcS1b2wxr9j2bDM8E+H2KvxNKD39nb2bvGzI0iO1m6vRkH
         UBoQ==
X-Forwarded-Encrypted: i=1; AL+hErHSgCWm46HWtg9dsrMNZ1bIPDfskY4+lFYSdhRPP2WHE/hmKXpTQ4t0ovW9Ek7fW6nObKdT3lZFmYNUxrA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CDugAQosyKU6tz/HLimXWctdz+sQWHMon8WTo2PH0ptF+TbLS
	qd6i1reAl0Yxs3QJvVI6EPDSs8RuSCXrdA5XnQHwn+BPCiX0EX5Mxg5J
X-Gm-Gg: AYBFou1JfpOw4I3+YzPH32IWFmW9FYKB4d31ybcNSdbxiqNMDnbkRaUGsTE8GSha7HT
	BaEUhHMQv0ZRRgV3obEGavY6QoUJeyYu2qhg43mhxgLn+qhGsVxIvcF2q4S+LGnwsWODzLj53u6
	CRX/I4XRVPbsB+QF+K9nxs6G6S+x36kWK/d64mWW8dFCuznnpL/K907T/tFkCbNCttOSt+7ifH1
	9N7kovnIIPeGmG/9WIsIvVs9Yt5ugBji+tTYmFUb3BotQZQjzYNjz+/jpb+A03kaWvr2TkQHM2b
	K9fuwBu0mhxaudkoqudGgTatpRsNl1Puz3PxDaFHuCXXfJOXN60NN26nQaQ/4o+o5cpGFRx78JY
	JgHcjV+arefiQRV+DnlstBllvXibgDUauqs2RBBRR+xtJPkntWfLO3DaIBFujaLiUSl3Ig/nkQF
	HV/uRrvYx+MhVARcV0uk/8UzDlKY5SEZOd3Xi1cfpxv9WWYOHORoNdsKj9LYYEM858kmL4fWCsY
	ecJDcTLNjx2gQoik0CJY4aiu5iUekUWJqsLDGH4OsKVvoO1kLfvt5Tj3o69BUAu15avECiFz/Dd
	cogAR+VhE2zS90ln4+ctnzMQGha02md6iZ13g+cr
X-Received: by 2002:a05:690e:458a:20b0:67b:f91c:109c with SMTP id 956f58d0204a3-67c3d97b1bamr148961d50.46.1794101011020;
        Sat, 07 Nov 2026 17:23:31 -0800 (PST)
Received: from linuxmint.. ([2802:8010:9a07:a501:b0f7:cdff:6e05:69af])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b36c09705bsm4706447b3.43.2026.11.07.17.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 17:23:30 -0800 (PST)
From: Nehuen Lian Bova <nehuenlian.kernel@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] HID: wacom: replace sprintf calls with safer alternatives in wacom_sys.c
Date: Sat,  7 Nov 2026 22:23:27 -0300
Message-ID: <20261108012327.89115-1-nehuenlian.kernel@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CANRwn3SnB97Oeg4rKBiYX2DD9r51Km5Cf3kpnAn7s2xd42c0BA@mail.gmail.com>
References: <CANRwn3SnB97Oeg4rKBiYX2DD9r51Km5Cf3kpnAn7s2xd42c0BA@mail.gmail.com>
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

> If you're going through the effort to use snprintf the string, you
> might as well also read its return value to check to check for
> truncation (return value greater than or equal to size) and handle
> such an error condition appropriately.
>
> Jason (she/they)

I didn't check the return value because I noticed in almost every
situation snprintf() is used, the return value wasn't checked.

Anyway, would be a good idea to return -ENAMETOOLONG after 
checking if return value >= sizeof(bat_name)?
Or using scnprintf() instead of snprintf() could be a cleaner option?
:)

--
Nehuen Lian Bova

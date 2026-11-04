Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793822018;
	b=zeRB3OznAPHamZsyRsj+HV6cxkvw/a321zugqc9M1+fdwBtDTZ5uElRF9qQevqBkxubW
	 PyJpwAyE+Ub41g/4D+hXONGIuTGtgkfChQcUwjXyfMo3f5TGi6AO0V/KqCV5RJe32MGQZ
	 Ain//qkm18fYQZ3Rm0y5SwwdK81B5Gnor+0vo0ZXLs7mrVRSG4ATNWLog9RSyKb4ibmMm
	 dGPYw64ktQ6Fv5MpJ5BFhSlco6rNryaAIDVBP1dJdvRdz5Ko8kkT0q+pR2YYP5Z2vx2B0
	 RbtjoO8IOLQrjncykpkCvZ5NlOvPh2nPlwtXRRGbvavcBj0UAiD4Kv56kxfP5375oWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793822018;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=j77TQJheY9BNkuAUNT0wTTk7+HF7XEvTQj5keMW7u/I=;
	b=I3mm+WBCBeynTjiB+MB8LtLJeEs35unFTkmVXevdlHO7BTuwA9O7vz/Q1KdOpvclUc/m
	 1Q0f3CRB4vk40RY9mKbApIRNWGVM2i1hU6cXIPgiTMqTkPIGJbMaRH5hB2DhrnoxZtf6Z
	 ywG204wi5fCOg5EgeI9sJLtOSag3BDBGbg20iNn89XinPKXADwMCitFQz35p6DgwYuWnH
	 T0cupQj02+1poyn1J4K2kuJTxK+g++d7/045J/B+emlEgu+DkhZ30vuoBG+4Br4HgIxw7
	 2etFIAX/nGecqg+XDlta7Z04vpRYKy34QWcRqYK6DzrXPJd3ZbHmE31dlaOwWAHRH4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=snwKVTUy;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C628F609765B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 19:53:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C628F609765B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=snwKVTUy
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-15ea896ddc8so1943053c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 11:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793822017; x=1794426817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j77TQJheY9BNkuAUNT0wTTk7+HF7XEvTQj5keMW7u/I=;
        b=snwKVTUy9LvBIeZYEhCXzEnRQp2wodIFGKY4wUJ7ztWzLVbTd1bI4nr3mGXqrQXFPO
         83/HtfEisb8NH+6TKxRanc+LHldo4EqJ43kuJQJyWdqbEb2qaKJ6REpFD/Jt5EslTB+S
         zscnal0Mvh+NX91kiP+siOH9v7tqEITC6j8TarPFAWvrj5zWcfX48CLTn8neQnUjk0aG
         DdWT6beozrR7hgNmLfQYYUBVHi+K7i2h0gb1c9TLmiQO015gt7sDVMBLhaHB5Rgu8J3E
         vDvOsMZkyxTj1DF9F5rnA3mHVh2Jx0j8rAylzbJGVo40aem9854GCIhJgMsA/lSZgxl8
         K73A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793822017; x=1794426817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j77TQJheY9BNkuAUNT0wTTk7+HF7XEvTQj5keMW7u/I=;
        b=g7nHNcqx4V9Mx1mHgSMBfZosLEo5EZmnFY49NswUsTorlmNYlqNq9jHZe6R+cEBvHP
         XAVH58H3CY6MOoJHTzc3WLxt7XgceVokx5VqRzmBtuH3GEd8t991MuqaBJxVlcN0bCoY
         fbUlDA0yUzVoAsc99JQbpEGZ7WMPlpu2Rns8HdRc/NN+s85cN/er2elXJT8Z9A9zBH9d
         Vqoh1NQD78NFxL1O0NSzGgeutv6qEoZtgheM/mBJdLOvR1OPvEljJtCRw2+XYana6ZKG
         wJraa5fe19ebQci/Pz0w3bOZpufxcNOgmH/OS4RtX2/p73B0wPQMCu6uDZts3zmlqfbA
         Swrg==
X-Forwarded-Encrypted: i=1; AKwUvBwXKo9KrJuQCoGO6zRxBOf4KiNeTJbu3LRh2ZNVMJjDoz93osAdLtQsd4CPOp/iHGlQWSr25EQpoT4Gfig=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OMBay1o05EgqzTfd7slc+gAiQFvw8bpZ5Z0UX62KWlMGFtfXf
	dT+CqEf27QueASrvapC8s84t5SCu6Eh9k4U8XTODbWQgLB1OC63sNqQ=
X-Gm-Gg: AYBFou3d5zJxGy/6QHVuxTxVzkb3nTZ+WPHOwI8OlrOJ3G6gb9UrId2i4IltrSWS45C
	Al9JAISvOPZshGpmPZyPAtLzv2ANOgykLnGXM0qSk+Rgpjbgx1KFivbACfXN71C/5HzAK7bPSQZ
	SWkIO6/iJVCAohndU0SUVAKROQGCr+jLdmosfm49MEWeWyEDYqudyYOZeAzUAXQi+ds4+GuUKJo
	W+G51dO23iilHjIKt2yusbPl30641sQZG/oEfSZevWS68thimxmzDw4eVuLXeqJXLW+3uHeAFdu
	9QY67pZ25ls1fC/384rbjIHHVSafKKTEhnIFFdBbRmYmYGXgsCzT2FeRs60B8j8Dg0e0Tw8PMgY
	3NizP5hZJrH/90GVAFIRlZlPoGZiiX4r37AlFfFFIfETLqo0mI6crLD8cuyWmhAcQvB5ETXTQlR
	Nrmvr2rIjHf4DMkwjAJVP1ay5Gy9+VaDh+/je18SzOfXIx6azefO+drE0XMELdXGjXamynEeUGl
	UU7lkM0JQmiwuAFiO1NHK+LjftFIr3FfAh+DtSSEcyIVN1+T/v3SZsGIKt4UrhAstoKD4LwLE/r
	YXW0xa5rRDXzC9SA0D6aI7OVsZuHSCFa1Y3nl8pvqHHjHnB3fUMWUJg4bYjf1b3M
X-Received: by 2002:a05:701b:4241:20b0:143:2968:564c with SMTP id a92af1059eb24-1ac5b9cb040mr26455364c88.26.1793822016817;
        Wed, 04 Nov 2026 11:53:36 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.194.66.249])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c2d69asm9239684c88.11.2026.11.04.11.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:53:36 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: jic23@kernel.org
Cc: alexandre.belloni@bootlin.com,
	andy@kernel.org,
	asahi@lists.linux.dev,
	atharvatiwarilinuxdev@gmail.com,
	bhelgaas@google.com,
	bp@alien8.de,
	brgl@kernel.org,
	dave.hansen@linux.intel.com,
	dlechner@baylibre.com,
	dmitry.kasatkin@gmail.com,
	eric.snowberg@oracle.com,
	griffin@kroah.com,
	hansg@kernel.org,
	hpa@zytor.com,
	ilpo.jarvinen@linux.intel.com,
	j@jannau.net,
	jarkko@kernel.org,
	jmorris@namei.org,
	keyrings@vger.kernel.org,
	lee@kernel.org,
	lenb@kernel.org,
	linusw@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux@roeck-us.net,
	mfd@lists.linux.dev,
	mingo@redhat.com,
	neal@gompa.dev,
	nuno.sa@analog.com,
	paul@paul-moore.com,
	pavel@kernel.org,
	platform-driver-x86@vger.kernel.org,
	rafael@kernel.org,
	roberto.sassu@huawei.com,
	serge@hallyn.com,
	sre@kernel.org,
	sven@kernel.org,
	tglx@kernel.org,
	wim@linux-watchdog.org,
	x86@kernel.org,
	zohar@linux.ibm.com
Subject: [RFC PATCH 14/14] mfd/macsmc: add ioctl to access smc keys
Date: Wed,  4 Nov 2026 14:53:17 -0500
Message-ID: <20261104195317.8284-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261101013817.22d67ea7@jic23-hlaptop>
References: <20261101013817.22d67ea7@jic23-hlaptop>
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

> If this isn't matching some legacy interface, then we need more
> on what these do.  Maybe they are suited to some other kernel
> interface? In particular they might need the various controls
> on how destructive they are that something like fwctl brings.
> 
> Generally an arbitrary opaque path to firmware isn't a good idea...
> 
> Jonathan

Here its required, if we write CPU/GPU Pstates and PPT to
some keys (MSTS MSPC HE0N), we can reduce the temp by 10C
And We can fix the dreaded PROCHOT signals on macs, Giving
Same temps as macOS.

But you and Sasha are right, that exposing all keys is a
bad idea, so i have restricted writing to some keys only.

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794052196;
	b=gBtyGh37yAycambi+2zTc1awFL/1zDL+IExw4q2D5n+7rYZLTOJFLADH8Sz/xPO5wYHH
	 Bjy3//fmQ4RW5qDsxS0xu3HAbjoBIIKKqTZyru0adSMEe5OM3cm1naWPJ2tzZuosr5sov
	 oaO9xvJaBXgc70+o7jlIJ4nhF+xzAP9kvrv0CzLQoYZtrh+vLyyLPyIfQ2L35BLLYhKWR
	 K/yyrTxsh1NuLfZfrazk3gCF0SdZiHP0Rhc46adWq1yCA44g5XmjT/7rCS02B5ge90Hqo
	 8mNAyWFkK/obfZfEmOFN5r6ZhCUDfaQwMZYYwUFWg729gtFXwpZjmuzG4lexLBVtJEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794052196;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XyAS5PiGbQrSz8Sx2Wo0A/xoKEH1rMSm+d+qex7vHLE=;
	b=scMKntncCAA0o3Mxb9nV5DOUQqbxhd42tnvDKaKWPMwqP4ElT9mdnzPZtSQFxP8Qpk+o
	 dkqFZQZkS89Z33ORhzibJI99yqBEUYQy2tcy3bQgnKC55rW88q4tmzrNhRxv86KYPf7JD
	 WDKt1u8eeo8XrxE/kWEZOGhp3ZHUbs8hIZ5u1e8g/3wEObmgqUmLAMaX2QGKnZbuBDSSb
	 YrSVw2YzAsRaMSC4fFnqjXkypv3ZZMMrI7STv81qBBjGPWwnyqQghLvC097Ss0ozXIXcv
	 U1jgvq8fEFh6isiRMEgPn2GxlX9ECWsnhPZTNgrLMtLHKqK7C6bIjtRcJZ4k2i1U8ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y2gssrG9;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0777A606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 11:49:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0777A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y2gssrG9
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso2443051eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 03:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794052195; x=1794656995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XyAS5PiGbQrSz8Sx2Wo0A/xoKEH1rMSm+d+qex7vHLE=;
        b=y2gssrG9r9aWshWT9N2KWz1L1QDsOs8zNzWES5RIg4Olp3op9lbevJO5j6m0cSp6xq
         ZbKXTuUurXZ0T4f9vPkghNu9DKBmdEtiv8nb86U4YMX8ICYK4rcTmFAVqitVDbxrbsir
         fk5h6IcQGe3j7N2oJHD3ixjekD0WBVRKeNqtuMWFFNOLcVcSuC8fckW1yYOaScwX7Hcp
         jXv+Zp+oEs06ecTKrJBmrwtZtLIu+flVUAD+39J4UH/dnNoB+e1dSypVfd9Nqad/ZG35
         U7JJnpOwaFPw1SzArG3z0GeviOQmGuSb+748RdfyuIOW1P8BHGRqZS5tRO/0pAREGOch
         4KNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794052195; x=1794656995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XyAS5PiGbQrSz8Sx2Wo0A/xoKEH1rMSm+d+qex7vHLE=;
        b=bBQcVYQEERmsqxH3vk/gkR4GbrQJUvxLgh4sDCHRtI1LQ7IZbFCJNsaqxb1HyEYQsu
         9F5NNdDJpkYXOFcL6/cHtm6pecGYsdQzb5WBoI8akFirJARHK5er0ZhthNIFoTI1e3x7
         bY5FWdOY0YtcQzVQ7o20AJ/+ecPMk1yUruskJbZAacGMfj6ejSof1FxXKaLokkkAwNEA
         gN9rbRNrqspNTPNJ+6JwbW7IAXKtfwBuEP1BOdq4MsDWJVPxIsAuGp3FMeNNTOaZ0+nH
         fYgtCckeUr2+Jf3JqiG/KARk/2so4+KGgDgi+8SHTZTNziugI4BHLMaFS3T1JevwdMpx
         6VVQ==
X-Gm-Message-State: APuU4Z/XIDz+kFMTFFkjDWhKZSZwbRim+/vzsfu63+6N6nwFqpViLb/4
	KOJyqlQuI0BZSIpDuvP3xx0W6cRdWiL91hwGLCrOYzn8+vxOdFBBODeG
X-Gm-Gg: AYBFou2Wrwo8jUKcF0dFvBycqrGt/L6zNTDnmprN/H2HdKm4u6evwGMFAo4XHx8zEob
	+6yeHdRI71LJwNlST+YjI1XBn78euqp4LDz1DWS9NaDbOOTonKkz08wJsWs5WvTZ7le8oQkrvc0
	SGN1HmXvzjmBPJUgSY7DYq52bmCZo0arC8TmTR68lafoNZw4coUqIZrIgQC3i/msPM2EWXXeurb
	nXwA6B/aBKcPi+2vRdy9RtS9L0fOjbLoUyLLKnkSDwEpeM/j1lX44UgBQspo7SGYtFM/MLlG1kk
	ZSigPVqEOEkhPot/dRtMORUR648B1t5C9zXXPK+Yb3e8+b3on4vZV/sCPvpMe83dMdZK4kuz2Jp
	O9IVsI9r+VeXU/PBuMC0mz9pbRccRKujnBCxLdeNjX3m6OuZzt8pncDWW8JTfsQXl30uhyrXC23
	SocRK2T7911126NtPL1eUlV5D0doGRAt+zGRFIZkycDtCmNOdgXV9NS+LHCLx3nBIuZiACS9eDx
	vU/gvJ2VVzRd+yD1HXg4mD4E08p/qfw9FpvkOU5p5R5N0vpYhPfEqxsCtpx8xxi6UHkbdmRVd0C
	8t24YK6Dog3z//7XVFoyrFa8p32bdFW2srfvJ6SBzmqRD8jrMpgI
X-Received: by 2002:a05:7301:921:b0:36c:9bc6:3ec with SMTP id 5a478bee46e88-36f72cc1d9fmr7685316eec.3.1794052195020;
        Sat, 07 Nov 2026 03:49:55 -0800 (PST)
Received: from localhost.localdomain ([103.177.253.113])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa922c6c7sm19845277eec.10.2026.11.07.03.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 03:49:54 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com,
	tiwai@suse.com
Subject: Re: [PATCH v2] ALSA: control: Trim whitespace from sysfs input
Date: Sat,  7 Nov 2026 11:49:17 +0000
Message-ID: <20261107114917.2601-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87h5htypvw.wl-tiwai@suse.de>
References: <87h5htypvw.wl-tiwai@suse.de>
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

Thanks for applying the patch!

Best regards,
Sreeraj

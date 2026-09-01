Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A533472F8C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788256636; cv=none; b=K7L71vxxIlUlFlDciEnULZJAtdIyRf62r5vHigQZ0L0tOubVkgi1YXJvbaHEJkUqprMc2/Rr/lSvlESxQgnto+RMiPITGOuToTvJ0VfRZkQfmb4VacxM7Ul58HATz+bpGamv0iuyrrM+3PsaXOObTEGlwugHgLnOqRUjGlPR0Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788256636; c=relaxed/simple;
	bh=2Hd6DnrX3jtfzSXEiMwsfaoHLBGN/ImCBgsGX0PU0H8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o2RuIt8p+8o8dIDLEO7iXv3XtTHMWdQJ3gzv0FFxtbEOb6ddnLsW6Osz8RS1ayRvUSk30I+pKZBFdMU8WmMzVSbA1bkok7nkI8HnVMW6qt96kzU1Ml9yNuMmJULy0z+KcMPjQOuMzCEz1pEZjP22QGoc9AGT5UXN6dQ0T1LcvaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e6UVDbTi; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e6UVDbTi"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48433fad54aso1640260f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 02:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788256632; x=1788861432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Hd6DnrX3jtfzSXEiMwsfaoHLBGN/ImCBgsGX0PU0H8=;
        b=e6UVDbTiV6zqvgExAu+oV6M49AwGEXE+ydXJg/wnKEyHZUZRgWV89/3NczpZLrPrVV
         TljWoGVH/Ll24f0FzBCcX8fRNyeAJ4yhO/QTC6wN2WoUEjMYUiMmDx1AY4wrEoeWbNM7
         Z5HDY6QtUXzGRMQ+PL9b8O/o2xJA+iktBt36vlIiFmfaA1DcVReBUAG3WDQYSLSEOR8t
         q+KcxvjKHL+k7LsSKW9A6HE8Y8F6Sl/y6CA/z/9A2jj/U3WxlgneA1yYVymUph88SF2Z
         q2hg6NSvzjGc9vm5BUSWY9beWGBLxjQ4uoOJItBzkmPjBqyImANgbv0FMof5wphNWG8J
         pERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788256632; x=1788861432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Hd6DnrX3jtfzSXEiMwsfaoHLBGN/ImCBgsGX0PU0H8=;
        b=Bst33//+w9CwIL0Gx0sM3CTMBBZqhiYbIRWXQ8ix2k54z9EQwhBOOo4ToInv6dYSuC
         EZWBy3JFUxp8dCmXraHIJokFAys0Ovqpo1vmH9Z/XScAhSgf+wr89j6e4Fp6seGjqz8B
         +iHm8iKY44d4hWSn0/LjxI/rlY8gxdHZCqVn122GqUYsomoz6wm4aOdyJPsQ2Oxb46TL
         0/JGRv8sWdeW9PibA5UI9PsqeWHWR8dTJ1+vOje0DLYNSDotElRWA1HF8Rjmpv/t7Raa
         C+165mhS09HUhpIfWyWeAlE0xhuNoeh09JqEnu9zw1H7h36i4CcItXw+FCYimBA7R75f
         qVAA==
X-Forwarded-Encrypted: i=1; AKwUvBz8CETdwl0T2vAYrBE3jikJOt9MGXcbNFpp942Vageme9dn+/DUqNtYAkqDJAh9SdgRE3Ffsd0pyvgc3TE=@vger.kernel.org
X-Gm-Message-State: AFuF++nEmj00DOpa880JkVm2ls3TihlDMcyn4K8RZoVPHVgDPezAvJ2Y
	oFPL/8svIl+WE9eNHAv4OgICT+m0Exq7xhWl9ZVHE2Z9kelj04jBW4rk
X-Gm-Gg: AYBFou0XAYqdBAbZW6ybk+S8tdl//kZ3Fyin41K4voVONlC4GTd9PPJaBEwKmoNOjmJ
	TDN7x1cfU6voiZpbRy929WVd4QizJxuAJ2Jbp52jDQMbZ/p97m3LzmFH0MDW3q8PFiUtNbnmXHH
	k49R8j9dow+YaJSd/g0VVL5B/ls6AJydBggM8PShZ/YxNgok7sap1EcLhY4ASkSLlx78qy0Om8u
	DjCtDY12E2YWBtIPacmjRHGFN/UM5TvPE/y4Y3KiWthsvz3CDvml48iMEN+dz2V7c6ZS67I7NrD
	auHyqEcQS6skvvVo6xM/7Cd7AuUfsOfb0XUEBu7qTrK/T0afHgAoPJsXgpv/AL1lOhA8F7TtYGT
	Ih+RTgVvJSeV3ZJxxIX4QZUqnt/0w7+BIs7rFX8GqZBXFlztFcNZUpjijF3W7ZdeTfBKNrhVpWK
	TrPVxVoOVkqxbAbp4ct+5SpaTOPHA3wyG2zVx687pjsI66zZMYZ3NLXgjVc52CdqzTO8mjFBs94
	hjnD0j/Er0MqFwCBxqIFdSZ3Q==
X-Received: by 2002:a05:6000:104b:b0:484:3200:b7a1 with SMTP id ffacd0b85a97d-48440ff9366mr10930579f8f.13.1788256632094;
        Tue, 01 Sep 2026 02:57:12 -0700 (PDT)
Received: from raviolimobile.tail5f26fd.ts.net ([2001:b07:5d3a:fe75:6bf6:388b:455d:27bc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d3b86dsm3752395f8f.11.2026.09.01.02.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:57:11 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Jakob Berg Jespersen <dev@berg.pm>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Arsalan Naeem <naeemarsalan@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/6] media: i2c: ov5693: Gate the MIPI clock lane for non-continuous clock
Date: Tue,  1 Sep 2026 11:56:50 +0200
Message-ID: <20260901095650.43605-1-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <zDaw-AawkcNfIRsmWXbsPx2WDcg6ltaiPc7FZZTNp7DH-ACLsF98A3QDuuhX4iejr2-VLQYf48c1cingAI4i58i4t2dD4t45SfHr5d4MeOM=@berg.pm>
References: <20260720163819.104130-1-fernandorimoli11@gmail.com> <20260831181858.325109-1-fernandorimoli11@gmail.com> <20260831181858.325109-4-fernandorimoli11@gmail.com> <zDaw-AawkcNfIRsmWXbsPx2WDcg6ltaiPc7FZZTNp7DH-ACLsF98A3QDuuhX4iejr2-VLQYf48c1cingAI4i58i4t2dD4t45SfHr5d4MeOM=@berg.pm>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Jakob,

Thank you, and thanks for re-testing rather than letting the old tag stand.

I will carry the tag on patches 3 to 6 as you scoped it, and not on 1 and
2, since your machine enumerates INT33BE and neither of those is exercised
there.

The register read-back is the most valuable part. Nobody
had shown the mechanism working end to end before: 0x4800 reading 0x00
unpatched and 0x20 patched, with the chip ID as a bus control, demonstrates
that the bridge really did supply clock-noncontinuous, that the driver
acted on it, and that the read-modify-write set bit 5 and disturbed nothing
else.

Your unpatched result also corrects something I should fix. You saw 3 of 20
runs deliver frames without the series; on my Pro 9 the unpatched case is a
hard zero every time. So the failure is intermittent on Tiger Lake rather
than absolute, and patch 3's commit message currently reads as though it
always fails.

That is too strong given your data. In v5 I will say the receiver usually
fails to lock, note that it is intermittent on some units, and cite your 3
of 20 alongside my 0 of N.

Two smaller things from your mail worth recording. Your read of 0x00 on the
unpatched Tiger Lake machine confirms on a second IPU generation that the
whole-register write and the read-modify-write resolve to the same value,
so that argument in the cover letter is no longer only about my Pro 9. And
you have answered the caveat Zann580 attached to the 0x20 row on GitHub,
which was that the minimal value should be confirmed from a built module
rather than from a userspace poke before the patch was narrowed on its
strength. It now has been.

Thanks again,
Fernando

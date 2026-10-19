Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792443881;
	b=w6C+Bp5200SXAZg4hM2RYUFHli1L1FEJBbNtyqoq7hq3AyFjoZWUXCKpsZt3Dr7DU1P7
	 XdqKeNYyN51PpDyQ+OV/FIoHjRqzPEHLaRMaO75EXu5MU1tMHNHCM0b0O0ueWBpNDCaiO
	 Qleg6OUwS1OkXyGnxotvc5knkK/m3wOU+DYkjFHKYwsLs+rd0VMvWqJ+B4MHMPDXcWKzh
	 2jDys+u4bOwY9dzEH6Bo43DRCuH2JO0IKdj13eyTFc5+Qa8TC53F4J1NjIz5FNEQ6T2HM
	 kYdcX5rbAbNZFUkJHzp5WkWWn0EQX/4zEUjakSUOuIa4DwAPjaFcbSSM4B5ObWbhjoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792443881;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=M08jzXVRcq8BixAempEQDIhvMuLNwT78uXf1fNjRNEg=;
	b=zThs9Zg7pHGCMeKAoQZqloU5xXDRakAz1JActiCW/3Is2NYwoaOWR9bjLdNc6FQnviwR
	 B+5KcVCfgLFrjaKGZV66iVbTKoD/IxB1if9n0PSy6XrZ0z8hHI2kd4Sc7ro9fQdMC/d6m
	 AjJmUlcVoOPTJKHfq03fcNWNxI0ApvruTuz2l2jUQT5O9ZpdIf+pe0I9XXJh8fkguz7L1
	 Mkw5rZ8x6BROteH09Qtqq7naLNC3HurIxQ9in5b8e59AEUXsbMhXavZH3YSvdUweLqtQD
	 oMWwxUgK45PkqaqLnSCcqF9E2LsRxNx0bxTDH5Ww6JOw2F4d/qnqiXb15cM3l2ONByQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=etKJfmI3;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD205606A321
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:04:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD205606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=etKJfmI3
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1e34ecb02so12268185e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792443879; x=1793048679; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M08jzXVRcq8BixAempEQDIhvMuLNwT78uXf1fNjRNEg=;
        b=etKJfmI3pz0RenGUk/EVsOjQmVpoAYeQpwAOQ7Ey6s0WuKjDC55D4E3tv7kypdmF13
         cIltavdc2mIGVC4maS9QK0ttzOFpuzi4ZJYx4JD1jRG5ti+IbjOjz8DJ5mm6Ki8K1bY4
         f/q+NsnI2c0HKhBfz/N8F0rN30WoLJ7OW3JDareLSFeAqwiGMFJWKV+YtWyPdkWo4+fp
         qs7+wrQkZNki52j/qK6KPgv4yZCS94fDPbB2laHH1QEwYPoCEuYIYTo4R9Ka+DEHJrWe
         FoIDC9k7r6QJrEDV1W8so1qkEjR4Tw0Ziz/OwlywoSQDQNcRKpk3ACFG7OxTMz8f9dxv
         uBLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792443879; x=1793048679;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M08jzXVRcq8BixAempEQDIhvMuLNwT78uXf1fNjRNEg=;
        b=LWle/swGNa0zIjrjXszVg4alVSYskPvPnFhy7cHNnyJ0lqf4ysY7i1NSIIQN7k+1fq
         64YlyJ0q+urtbTvly5o2jMGkPEcHivdcYfBONRk7uu2iXz+EzsHck2cRsgb9Z8OliprM
         JAG0nJT7IPs8nBBjX56XV/TggSqmMXp+7MWSD9y1+XVLnNazyvp3MWzkFzsvvPO84hBi
         iWsyagHEHUavuSuzu9hJwzE0YniGDL2aH4o93WuVlpO1eq3Wm4wARCRpdgXzRqbcf6Nl
         auj44xVhH41Fa7Yysub3YHxqO9tIqvyS084ve16nMYJyHety3JS2oM+e8R3BiXRidxlg
         URPg==
X-Forwarded-Encrypted: i=1; AKwUvByopFwWfwDfByZWLAqDrIt8O3JCO4QnrJ4yuHosjkwsv8RMKe/gJVYrEM/VZPfv5NuFUXrfBcmo2bsEbsM=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3v5u03OWr4IXzBy23NoXrT2l/xD+0T6I5pb9lNqmGIyDofhm9
	3ODYDwLkz19VlJqJBXK05zPkyQY7yqyXNF9l4aNmQfxWCiACHvDnI7qc
X-Gm-Gg: AYBFou1S9P/Hiifa4zE4xndsqs8ZUPyNjpN7abupnxZr5SNSfm9oaRo85aYspET6U1C
	mYDyb1mJohLv9EKRo1/AsktEA/Riu6v2GVLDJNMUuBew3E27+BuiU8KQaH1Xa5zrzQYp2xR6T3A
	ydz9aB5YYCQGugDs5nAi7qtZckdgCa41eUrxCXz5us8wt6FhMR6NPio2lEuKdTbijivT9ppgaaS
	Fm8tGVb+Xi3A7qghYdlUxhqZGzdYV+RZm9mX4dF8GQO0ntxasJGnTD9bG+mWzunUQY39HTWfLOo
	g7FQdRrOBtllknslNnDdR+CvsANl1PV3oE2dzcq5jefg1ra7RMnBgTWvAJThCc1SUhbJXhElF6b
	EMRxCdUwsR2OqR0BwPQJNYQ5V+CCL5R9kthEMw0HBiGoixPCkJqoI2/9iKuSSRnOPPKtASOki0C
	Uoh1N0bawMUEpuM0rtfrZeXljsbfLW6GrmfKWF1RVmrzJsX15MHP/5wuvm82mCqNlrgwST06Ywe
	96pHLDLeLU=
X-Received: by 2002:a05:600c:608e:b0:4a1:e08e:46b5 with SMTP id 5b1f17b1804b1-4a1e08e4871mr124644295e9.16.1792443878968;
        Mon, 19 Oct 2026 14:04:38 -0700 (PDT)
Received: from ADRIAN-PC.lan ([171.22.87.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d8208e0sm1434971f8f.36.2026.10.19.14.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 14:04:37 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>
Subject: Re: [PATCH] tracing/osnoise: Add __printf attribute to osnoise_print()
Date: Mon, 19 Oct 2026 23:04:31 +0200
Message-Id: <20261019210431.190310-1-adriangarciacasado42@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261019205344.190022-1-adriangarciacasado42@gmail.com>
References: <20261019205344.190022-1-adriangarciacasado42@gmail.com>
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

Hi Steven, Masami,

Adding Arnd to CC -- I noticed in Patchwork that Arnd previously sent
this fix in June as patch [2/2] of series 1104700:

  https://lore.kernel.org/r/20260602150904.2258624-2-arnd@kernel.org

It looks like the whole series was marked "superseded" because [1/2]
touched lib/vsprintf.c and several headers across subsystems, so this
standalone [2/2] fix in trace_osnoise.c was never applied to
trace/for-next or mainline.

Sending it standalone here so it can be picked up independently.

Best regards,
Adrián

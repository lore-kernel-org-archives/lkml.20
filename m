Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794061797;
	b=fOQYBsUHmfouPmujDUBOcPZlr03QCmVJBcNNsRGK5EvBER17A1Hr5oOFKjqB0t6zDdhE
	 6pjpXYhU7YIwwqIcIbuai7WXwzU1HTA6kjsDKRmoHVArY02xwwTMyy1fjglMfDAwsUt2n
	 y68mAtLZ1JnXeHpohJE9OyncgwfA2IXjM/B6pZMJ3fltFU6rTTMiieNApEFFBCn1SfsF6
	 bjQC+PC1KOYPPKWECnTQxunyORMdGBD1rakk7Eud6vQNMuJ3uay8fOXc5YgbFaCPMqEYJ
	 JVPv+nLowdZy5Y0+lEAAOZNzFk2kmZ2h/qXSNCvn5huBvt/KvUr0YB3YhKE+fm91gyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794061797;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RHsKTspEYmdY59Tijtif/CKS+tTzCp3CkEwc3KhL80c=;
	b=27ytonUa8AeMKj7U8D6QNF5ZUtA7u6h1w19Csdxny8T7VFOqr8fzF0za6yHosQmge9Rr
	 eDIw3mTM69vM2u1amWs40KjG/RyMgxeFA0g+MmkBPWZhgXIQB1CZQqVktno/cG0Svbttz
	 R19nE+KaqkJ3V0buM7R88AFMKq9RxUJDmzICH+StU+HlCsLXE7AhU+PFzqFIQrSnTonIA
	 c79Sw9ptgkPN18HbIvB7FJ850ETPFy5RJiTwykljS+JCKU3xWVmyYs/YNxG6dVhUGChps
	 EeMWg1kAO242lOOkL5eWn8vr34s20DOZLtfMj7HG4CEwcrVOmNJ13wqoNCM2b83I8nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BOfe9G6p;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1EA606A330
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 14:29:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C1EA606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BOfe9G6p
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1a3c08d6928so2774680c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 06:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794061796; x=1794666596; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RHsKTspEYmdY59Tijtif/CKS+tTzCp3CkEwc3KhL80c=;
        b=BOfe9G6pAd1+FIxQ0xTSiHbk1JM1jWsYcfhmiL5E3UDl7d9DcqI/haUi1mipCV3VSC
         4L/7yk22492pFXYJjD9HoBBykpCz8kt2e/p0GrDVSOF8rGScoj8piTHCVTTsxwl2ju9C
         Lz7rBgnLpA/d9sV21XcuCvWMydyQ6XKXxH32mpBgz99guFizd2IK8AlBiTfGl3CaELU8
         QdT2XFBSD1Fke9JciqTTp+DNF6W7nqC8L1imQ+QXRjp4AMViIIri473fl8XSWhQeFUEq
         06CoY13+MNzuUYgTee/2edmxnoowa4/bs7YblDI+/xY2hEQa7yhAnbSAjFyeNUSbkoW+
         c9Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794061796; x=1794666596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RHsKTspEYmdY59Tijtif/CKS+tTzCp3CkEwc3KhL80c=;
        b=EVu9mrQ3FUxTYFiIU4EgXdlb6/9KMBRbtiWVBongzebo4ftwT3EcDJZw9z5JR8aNLa
         Gt4+QSxLIf1jJwaufzCh6FYRvgAjElYd5gX+Zeql1AoPr695B4eL1klW6TAvbfDpfgoh
         KEDQMigLNqUHcpVxzE7xNYnpOoxgNuX6SZhuSagG61B2v6KNBs1hAv4UE4BCiE72c7yp
         xrbm56HudkWzdAnMqvXkvQVW5OlAD7xiNu/nwYqu9TNQB3n4KelMfOARePkXgrVw4bJs
         4GNnTkZCeQoiqm7WxuaDGwND/eNs9yqMoV8JTwKc3McwmYVdM4hvyYWWECSflOWqLhgx
         gGuw==
X-Forwarded-Encrypted: i=1; AKwUvByB37cvhZF3tl4ZB3bEXGAOeXTJ860RQBVGLxLl2NKZxcUigoUF0AcK3ungU4CrtHYWMI8L0YN2e7TWSAw=@vger.kernel.org
X-Gm-Message-State: APuU4Z87XisYQomttzbJsM4ir/bJjsfIjK/IcES8sR4ivgYK0g4i7I3V
	xC0CuBkUJLNLmoEEksr3zNgNLokg1/poAw+ZY9+TG66CqDngxxbvYj6k
X-Gm-Gg: AYBFou282Ho+RtaewSgsh7vhU88LWjFVMu3ZRt3h/i+ggu3tHVWjG96OVpE8z8NZMcy
	OtO8USDcDiBmkYQ30L9LinjYB2T0oLmE1Xz4pGkw/xhcsY26OqAUVuh2E0TYT4fj/exOqebEqMr
	oO9u1SSEf2QEw/e33Ayq3TS5ghY9MLySTX17JgPlwnL6TlZyUUsuB4V/JZRkVbJT/84mkjO4dkU
	VyNkFGs6+fJkWKb3JV7OfCGF83YHckRevoTfhtj3rccPisi7g/FBQlVo4T1cpmOaGSOeXFa/xx0
	oWEwCZHD7YZz9CGKYJ4w0A1X5RpkjJ5YhEJwr2RXJWScYxDK0cSz4H/hq4pSXyIhoG5h+B5qTnM
	ZsP+Cp/mGUrCm0BOsg8iHBVC24W5i5DkJmADcEfj4q2nho4D8G8VvUKeocZPUJBP9or9yuzMDRg
	pnZLjP7ZBLSkP04zCryynKUI3bt+1mRuQXc7joe1E7gLqWlV2llkfUdSLfDFQ2NE/Hv1BGUu/V+
	NLcwfMK84pq9Wu8SSESLn/kYWxkW/+dde5Hhcfpy8O6rboymFXyhRXiwi8qAHMii/Te4NuCofq/
	MlNDAKUUyzmORYMXKYuiky4RUzrStzSUgC7/KSzSgXexlWnEUE4sO19lARwxT8TKKE4aD2o/gfN
	tQW48pdWwg4Pym8mPLAB6yK2Q6EnXMbUazSCA8s/sxTWPBhx99MLk1cKTKzL3Ww==
X-Received: by 2002:a05:7023:c01a:b0:190:da74:2c89 with SMTP id a92af1059eb24-1b25d334f7emr6852621c88.21.1794061796449;
        Sat, 07 Nov 2026 06:29:56 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4df114sm15593945c88.18.2026.11.07.06.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 06:29:55 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: HyeongJun An <sammiee5311@gmail.com>,
	Alyandra Zahran Nadhir <alyandra5b@gmail.com>,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ALSA: ump: clear stale RPN selector on NRPN change
Date: Sat,  7 Nov 2026 23:29:50 +0900
Message-ID: <20261107142950.125901-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <87pkwgyck9.wl-tiwai@suse.de>
References: <20261107111056.667-1-alyandra5b@gmail.com> <87pkwgyck9.wl-tiwai@suse.de>
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

Hello Takashi,

Thanks for adding me, and thanks Alyandra for the patches. Yes, this is
one of the cases from that thread.

I have patches for the other cases discussed there. They keep the
RPN/NRPN selection after a send and clear only the data, drop data when
nothing is selected, and handle a Null NRPN like a Null RPN. They also
need the same selector change as this patch.

I can send them on top of Alyandra's patches, or as one series that
includes the selector change, whichever you prefer.

Best regards,
HyeongJun An

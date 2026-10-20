Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792493268;
	b=TVlOcQgJUq/6TsqK6Q/IUi61q9pHQ+NAtUEKn2BJt0DRaUzdmjC7EDyIVUpAceNA0qyB
	 rGDuQr40/gUwaWBHEgkh9x2TQNsipzT8mwWXT5HeDFCnrIaWHrDYd45D1w1Uh8hTwRwks
	 wTgaMmrqcqR5VGoyOK2QXiC0etSchqP5vdzLhXgwEoDb0bq7HufRHFZ6AkUfNBqPI6Jkd
	 DiiY9QrINPcGMLXt2rLZq2BoodqgZjDucsbJhYkswcSF54V4PYRW+IynIYzTSu8SbbGUo
	 ZEfyAa8GT6IpqbB+C5oXRftngrQ3fRYvpBqsJB4DbQLNNtLKa9RCVyCpQ7AeGzQOFhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792493268;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=0yRGXMpxwUTECTA0OiqRhmW1BI9DpdkM0ZTAbE3p3cU=;
	b=fLW0saFNVy1AlbwRtJLFIXdcsPiPl2hL+t/Grgl0MO1+wGzrzH34jVPft5VWxTH6YbzL
	 c+l6O0jnCevq0dIDepnk/d8ecVL7mvkqps2kuRQ09kMWRiSLnEW2WZj4eRdMkHHDOPLl1
	 ASlUpiVk0VIRjMS4NdPHSOQyQHjPBBVCL/440PvIa5igXiIHDWPruJG1/RUlhbfdggv3Y
	 CE4s4VFB7Br1awvebTaWyzGW1BBvga4KdOwbK/3aPiPbvEWDYtYwj2ZPadP10As7zaqXc
	 1bkGzGXwls/VjNUHIwUOf96PCIf95d/b+rBVtqX/EErcFgE5UyahyK5zhUgaKRR1m3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JYrXLtbI;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98EC60A2601
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:47:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E98EC60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JYrXLtbI
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-16079d54c17so202252c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 03:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792493267; x=1793098067; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0yRGXMpxwUTECTA0OiqRhmW1BI9DpdkM0ZTAbE3p3cU=;
        b=JYrXLtbIFCXTKM/cTXXtiv/Y8JVYTDcHoZER3E4Nb7kDkRKdFX6BeaNmLOtAhp8Ya6
         dLmJUQ9N+TLQu6IAzgM9uo1kat4SU24m/CP5JMk63ifOZMiUtd5u+l/4SmCZsFdnQB/C
         Ux/GMryUZGOW9Of4dphU5cwdq0J1jimF9NTg7mCFjzaOSdtGqEAHH6m8Lf2m1HVJmcrV
         X7eNZuW0cug5+Iah0mXS8gr6ICaNNHZPZSvQTdvscfco16SCSudHS8fQe875Q3JqMxwB
         HDylZVhAkUijOhUcihLhgbY2K7mOYthCTCihzwmZDhof4IfDCiYFlQYvYrOeBglHfBDE
         Dkbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792493267; x=1793098067;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0yRGXMpxwUTECTA0OiqRhmW1BI9DpdkM0ZTAbE3p3cU=;
        b=l6c36fTEczhYv1PlQzznymmtlYFiTu1kZ06XRgB9bm90gwQufNu2aH0qXo1KV6l+0f
         BUipTH8MrVtP4HrzigMtXwJtisNasquwHyg9sITDW2nf5xSODpFe+dvFDEleD4G3Sriu
         uDiFxGjhcmdM5lU04cfOW2ZiQZ2BRD1jrNYfc1TNC7yTQwpfU8dN+chtFvJAK+J//KpC
         hCcmH8u59semfb5xMZYy/l5MA71VeXXAwW/aVTZH4t6TgxH1D/iaWiGa4CcrU+bkKtAF
         lAMsejIM5nNHGeX5iCWv7EELiSvU3gjDQWBHs9O6brcdxhN3v20lEqzCGLy0cq69nz/e
         Py1A==
X-Forwarded-Encrypted: i=1; AKwUvBwuVUCUp4XeysDZTnCTmlQ+OBBt4qo6FBR4Zcvik9fFaK70t0JHIZ1mP8BU00E69Fk1OqGkxfLClW8UiUQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLUUBkJHjXB+o3iaZkhGqf0tJb+Rt8jLEip+nZ6CRsahTqx4/Bb
	V7QWJfJ3pLxak0fVlOSxemm7PZO+6QxzoyYgaJpZMFLgwB7/llKo/nIU
X-Gm-Gg: AYBFou3FjBhhgrABAwTedNLmaRSmm0TBk3jato/VyG7uy6eUfdYLKZ+d/fM8xbvcDlW
	Xd/rWrJ3KlxcghVWnGZLha4TTUGSMp5C/ZY+vMScr0wMVUVb6h4dSe7j0RxXVxKctGLlV2rYVhL
	QNpurOBfbR1egue68ywkmvClbjAiH0WdfFegEjRTpyoA1CoLKECFzMl1PS3+8VKiiGrmAzbAcuD
	J9qnf/3YrfPdkKxjGJiQRSYO76ybnPdUxGpY8fz3vVKukEKoInl4NHGpzCt06A14hnBfrDcRv78
	GQJTHR9UyvRljJbQxH2ZVKictmAtfX2hQEIKrGHseZ36gXNLgLzIyUUYOHsNFzByXXXVeEX94u0
	dqT+GK8hTfZHgAXnVFYQwrC2KD2J8uNkqsB4pbROgFgyAqYG682xbGX3Xjhf5fXxqaRnfDh3ci/
	j8PIjDRKMTEdIuHwR3Mwjw1+kMY4FDwu+Pl6nHq06JTo7IvqPqpYxMLmPbJ0R9JZWvZEL7rAWLT
	SlPFcOEPUx9JYXJSI/ZqqiL9SwTk+YVK1QphcENEfcMJqDubwnLg/C4DtrNQhXwn0gYxg4tFzhw
	S6fYtrQ=
X-Received: by 2002:a05:701b:4511:20b0:151:2068:e81f with SMTP id a92af1059eb24-1851310a457mr14502929c88.27.1792493266915;
        Tue, 20 Oct 2026 03:47:46 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa7bbsm34662429c88.5.2026.10.20.03.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 03:47:46 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: linux-serial@vger.kernel.org,
	gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andriy.shevchenko@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>
Subject: Re: [PATCH v2 2/4] serial: 8250_dw: Only accept a contiguous DLF readback
Date: Tue, 20 Oct 2026 07:47:30 -0300
Message-ID: <20261020104730.28646-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <d992e18d-31ab-4937-8780-9c9dc423082a@kernel.org>
References: <cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com> <a79114e72d029732db6764935dde12aa5d497706.1792439398.git.vinicius.eduardo.pedrosa@gmail.com> <d992e18d-31ab-4937-8780-9c9dc423082a@kernel.org>
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

Hi Jiri,

On Tue, 20 Oct 2026, Jiri Slaby wrote:

> Do I understand correctly, that this equivalent to:
>   if (is_power_of_2(reg + 1))
> ?

Yes, given the existing reg != 0 check. I kept the explicit form in v2
to keep the change minimal, but I'll use

  reg && is_power_of_2(reg + 1)

in v3, it reads better.

The two forms only differ for U32_MAX, where reg + 1 wraps to 0. But that
isn't a valid DLF readback here.

Thanks,
Vinicius

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792687502;
	b=AMdQFq6GvBFJ8f1Nib4M4oLhq+8wy77iyFgGmD5P2kOA/M/HENd4pemjbvDMx4/G8NTF
	 GF27eeNBQkFc8WVAsuWIcVaBPRVEIBlq9SCKythe0cn2y6jjFHHsMZwgRoQ0LfetBawcB
	 KT5bYOv6tV0m6Mc4tG4eNBiAdlK/TZ3I8chVr/HYgr8AIi/bkKISKEcLe3Z6x3iw7q5GS
	 XsleqS54OPj5gOXIQkVdmguNjyzcxX98r+OqNvDk9lShj031YLj+5X3yoi34t7hvE4Cf9
	 e4MLoLkwEqltyYcfJd69FrFdodPLuWDj6BlIG6d1dNgfyurM6JBJ8Lnm4hiq+Zylvhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792687502;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CzD89pGzOgOnG8GG0pKfl9YPmTEtR6RkDZF0eraj8Us=;
	b=mmyzD+zk5a9l44fHWCMZbIQTIvlXhsocF5FzZZv4l00HHFf/fmXtmNRX5B8Vh8NI7NEl
	 mjU8KdfkP3RqydmQUzYbcxHyHWVyU7unAcAdG8vyrL1zlG4lIv1WB5NyyaaPjGGeUjB+J
	 UbkjHXCMiLnETNIei6g/ZpDwTBFKY114lZMDuih39QgAO6LQtGxZsHYaIJ4HjFpvuylbc
	 EHmChpuZpnDxT7whg6y+cqMC5ldAAubciPUv6I34r6q8Myld67A98NzQbwQpUGgf/1JEM
	 cpJW+jVctiVuB+c0ovVwuCnAT/TCXyTQ9k8cHKHpNtb2vnULq8bDq/GXo9VHRx23Paw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=S80lluzC;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735D6606A324
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:45:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 735D6606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=S80lluzC
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-185fd3a4ca3so1321955c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792687501; x=1793292301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CzD89pGzOgOnG8GG0pKfl9YPmTEtR6RkDZF0eraj8Us=;
        b=S80lluzC7icrs/ERi7dGlFC5QXVR2BCpoZU68Wn5HZxt55ADppNiFIU9geq7+fJVHr
         Ak1AlTlBn2Rjx6oDONicssTfvIKeQTHPXv53s9nmKLHDtjzZG9PM8sYoItMSnZmvlqsU
         3lL9UNsKIbm6woT18pVGhLK6WlwvjYD54kj742CDkoJPkFV09grXDci2gsbLlTsDjUq4
         J71JMzjJNPXaY7fk6QazAhnICbxG0uQYF+QE1CrquydvWJHooz+/efNoFYG9ukFmPKkU
         UGUUZpVB9wh4+EZcErazdk8fB1l3SXyYQOkhdtBQTWSJ6gs1Wtv0jMaAEiDqs4usAjhC
         SoWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792687501; x=1793292301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CzD89pGzOgOnG8GG0pKfl9YPmTEtR6RkDZF0eraj8Us=;
        b=oNDbTPCEaPVjM9arUuG0mKtpzLmWfzdlpppVhcpOi6a1HACpJG2JZyHkLz+hHXo1KM
         MF/OSaY/SY6FjicmNrln3kbIZDwAc+hUu/qIxJ4G/zPOeXZIIhHtFEJa34pJyz/oKUBr
         dd+JMqyQaxQ45+VKYi2f3X2cLmR776aB8abNYLBrvVZE1VFzutfaqcLMn7O2KO9wyx7e
         fxR6WTJ9r93M4K7UIm/nsh1EYPPgVJogYIR/zGZYx8ZxI6v1pDNmo38A2Ae066x2RI23
         qzpx0YKUQn/0hXef1r2akw8UIsKCL+o6o39FrS99FZkf6SHqmPuhOgNeWPFK9AjdOPjT
         w1fA==
X-Forwarded-Encrypted: i=1; AKwUvBzVSrjLO6T0FJbfNMyTsZe3vjzcPLAazmHm53ZtN4p2ZWjZNiRCMbLcT81bfj6hWszZQvfXdZ1nGHbV1/M=@vger.kernel.org
X-Gm-Message-State: AFq9FYKfn8Q/nc4NuIp7KRPMv18UOThuAcRyBR9QPPBgO6GGPmz/Xady
	ES1E56NGCNlYXzCndo02C3NiXTK1bPysfGZ1W0WbMhqbpezW6fnEVZ2a
X-Gm-Gg: AYBFou2GTZoZBCIL0PpYl0AEiVnzmByyaqs8e4Un2XYABRo8bHCpF+NDY76YflTw7SI
	trxEIo4yeTjbqK0vuhc0B8WzrlnvmLD6PeARI3r6G4+ExrTCYyBoTFx/UBP0l1D7Dti2sMTYc2I
	0tlj/lZMoFosCmDF7Y/2B61NL0bFAvhfZRanzZkYiDe4ODWpRYh2FoUuKRWRGROma9FXMOKfePi
	mLtfxMccmDbTm9gKr40BD3RXddHTbjErR4Xh7Aqdurs+HK46PmzJUxfwYDhEgJsaVL1AOf8vTm6
	XAJH/nL8BPFx7tGSZtL/XPYDRG7QBZjsjNMYb+h6L2i0kexl8EdTRi4bV8pICWLCNm2cqASYnyE
	Ft7gsuVnCbaTSxUyQbz3WbZNksa4PG6/5wxRqw0wRAkpyJTE7hvwYj+f2Ra73UVHDabLV3Hlrme
	05rr0X3wAgrk9ROBrg4TrrXTmeYglMybNCwoxhW8svPmCuLoP6I4SyRQBTT51TPkyfdIj92u+it
	+DYqGUgM8X/mXYHpIzFqSEJL2QHx7g95Fw+yFcDdd6lMRronk2yOMaNDCG5gU/PHtzHWHCLu7AG
	NEeJVDUsvPU3VzsZO2/V2sX4iPInljDjTe2N2mOHKMv1mKCAgBs3VS426KCagaIbinMAZ0yggDH
	UDS/+kmDW4Wk=
X-Received: by 2002:a05:7023:a8b:b0:143:72b1:9004 with SMTP id a92af1059eb24-190a87a3b70mr7623767c88.45.1792687501102;
        Thu, 22 Oct 2026 09:45:01 -0700 (PDT)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903a180adasm15841782c88.8.2026.10.22.09.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 09:45:00 -0700 (PDT)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Frank Li <Frank.li@oss.nxp.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-iio@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: adc: fsl-imx25-gcq: check the return value of the
Date: Thu, 22 Oct 2026 22:14:50 +0530
Message-ID: <20261022164452.201416-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ato7b3ydggC9X0_-@ashevche-desk.local>
References: <20261021225450.628499-1-kapoorarnav43@gmail.com> <ato7b3ydggC9X0_-@ashevche-desk.local>
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

(Resending as plain text, my earlier reply was rejected by one of the
lists.)

On Thu, Oct 22, 2026 at 07:35:59PM +0300, Andy Shevchenko wrote:
> I consider this change an unneeded churn until you come up with real life
> example of how MMIO fails

You and Frank are right. The regmap here is a plain
devm_regmap_init_mmio() without a clock, so the accesses can't return an
error, and the uninitialized-data case can't happen either. Please drop
this patch.

Thanks to both of you for the review. And Andy, thank you for going
through all of my patches today, the feedback has been very helpful.

Arnav

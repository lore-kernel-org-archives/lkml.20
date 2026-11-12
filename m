Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458801;
	b=am4qvMawICmwpGkkZY49IW9fd1jhP3iQ7wnZQvY7FomkdqXaGjkuN8K09cQyYGQvXi3r
	 bySa8WFt0GkA8NclX3DegTCgt1RayzFYMSVZmM6pa/lCSrxTLwJ23yKRkP+x5mCK3kRKI
	 AQNOAuQMWO8PZCFJ+CyayCzWviXccGagH8AxNsDIkxHuL/4cS31B0KpDmKqKWoZu+KECt
	 KLTObHwNNwhRoOqLRgcXHBwW9Ud8AoUSCdgl8DbZukE0+8asjbnk2lmqSrtHlh5PxM90e
	 wAm1ak15C/8WV08d5eIFosnCLdZU3tnDteROZ+iWi3n0IU5OpYa+D9c+1PUSIoTV/RQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458801;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=zDvPfFRo3Pr4rD5hC81MDhK2cGrLFWLL5uDGpA+teSE=;
	b=V78Qc/WQvkU8EciFxfQxQ7Jvb6zCqF7UZDWulyI2sK3RHYYhJj4AP0lmrxyxX1neHiVx
	 zT6WauX6skiXbUPQ9asjJMoT3OAb/57QlM/+UCg7dLvrF2Mt97GNgvAlnTW2n3JbmdAOt
	 el/XusQMPnBGyMc+7+NXUnnSgvkvnpb18c9X+3z25qeyDEiFX0QfAjSpRXWo2xrhjmorG
	 TpLITwaIFLCWTPlw0pQpjkwaU+h7zn+hkzb19rK1M2bBJgEHqWdvCdhDLxlp4rz/UkqfV
	 izb8xFRKBDnpOhj1UnZ8SkHPVkW/rQ/GJVxf3FYVTVTg5jjOAZTvJt3dPvLwYoetM/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dankook.ac.kr;
	spf=pass smtp.mailfrom=dankook.ac.kr;
	dkim=pass header.d=dankook-ac-kr.20260707.gappssmtp.com header.i=@dankook-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=pgKCVaYM;
	arc=none smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDC5606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:46:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DDC5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dankook.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dankook.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dankook-ac-kr.20260707.gappssmtp.com header.i=@dankook-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=pgKCVaYM
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b0cf2c0785so41286717b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dankook-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794458800; x=1795063600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zDvPfFRo3Pr4rD5hC81MDhK2cGrLFWLL5uDGpA+teSE=;
        b=pgKCVaYMmSN9Q0Pcz54NxSU6NNeEydxafVy5qI4A5GsCJD0sP6S2CdBDZCo4DgZmlH
         qKM6Xbh0+05zNkgEeA+JD2f8ZIL00aIW6AjRES7bvoImI9d/if4KjahdLDh3zfp0fhf5
         3Qew3wrmf4nPjXAaRA6CQI9kAv2ouCglE6kgFq/cgVGLUMLDD7IZFUD7ZID6qsLr38H9
         k4xarX1JWekftUl2dX/3XvCcJ4dLN4NxDY4JehCU/uapuNH6FFYyYcZyUBq/JtW5YFjd
         CZzmTvfUTWkrty4BBwSl7AgiQbOmXWIucACqsQ0VB7MUtfUr/mB6YKGV2nzQx3Fx0h32
         mGGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458800; x=1795063600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zDvPfFRo3Pr4rD5hC81MDhK2cGrLFWLL5uDGpA+teSE=;
        b=Okl18aypWsnauI+yOCRhRA7eJZ3BNzt+bWNgGOVcuCM+BmGJABh+40+WOFfFZcLzqA
         rLVnEZYC9pfKOU/+ZFVfJsA6l11FgLJ+6DLVvhEiWDEjfi3RaC0V46Xj1QZu+fanxm7P
         0awpuyC32gfCDkMD9EImuZ21aCr51y/Ur4bXJ0XuMeNBIYd/2z8I56yDAfrHGaiTREia
         HVUDzVO9xgDunfyzHau/A/aoAjoF7j9PodYrbYDXHZdHNdEoZBU4FfeL0Sbb6WNOifrN
         EFk7HrPxWUZz+sx62jZVMXCJrpHyD2TJNHTaIWwNzG7EZzfBtVRVJsIXxp1e50EcCRn9
         FAQA==
X-Forwarded-Encrypted: i=1; AL+hErE/skxGOpZqz5Cx4ViqN+NaxXpWl64cJCoTWUebVu0AORGqVNEGrUuv8gyiYLx7gCSXb+AjnzSE6NGWmrA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4i0Q+3y92YhYsgziesGWt/qtHPNA27ZrIUxFLlwwhOaZrNNTA
	4AHiY1Varexnxcys9kSJux9JXctmAN3+1wUKTEiqHOwLMfGxESCDXmrohpAqbLrWH6A=
X-Gm-Gg: AYBFou0izpj+VL2arHEwYjt35rCagZVm6XqoJWVXcLt0FBmXZIuyV/ZCdpNmzPh3JJR
	Rx76MxEEiztvLaGrk1jBeBXYtskm5nSxPYsJgGeolFq/semWZBjUgFyo88Zu5wpthOeRgdxEGXl
	gQ35L5zKQ8/GVoSg+sn/E9hPxJ7OMZ21YIeYVhj0O5megSoqqfM39+WsovvPFcht5HvWQvikpLm
	FZj9U+fStzWRGF5eibDHxVaTJy8OtuIDEavkETLdpP74tDdcraJSo2CsxiReIViIcpz2BUTNUOa
	onHvuQuu0wVYMMhv4Z/2JLpZU4BTxFm986AENgi2h3rJBpf9a/4WNf44rMdRV1C32TKt3wVxu8g
	g7dvjiidwR6liMyS9SLWpiPnLfu9T63kla33ItbPYTlLgLJoidqFnjgeQHE+/bTO/5/LfR9adwD
	RwLbLrbmwkK1wzQt8Q1TPbYs2RXHhU9zCS04IqXumQNMXitZfpXIRWPxnXUxDxui0Gm/baCCYhg
	a0vkaVqb+u8rwUvCQzR3VsctCjTE6etNSrDvOo497m0i5DByNIy347Up7YEOj5MQ1oe1d5r44q9
	Nlpbd6b8D11fGc5xeVB3CbptFQYaRSvm4HGtSpQTzPMNHg==
X-Received: by 2002:a05:690c:f95:b0:8b3:4a7a:599d with SMTP id 00721157ae682-8b3a81c2304mr30059597b3.86.1794458800536;
        Wed, 11 Nov 2026 20:46:40 -0800 (PST)
Received: from myarch ([220.149.255.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3933e0d01sm61919277b3.22.2026.11.11.20.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:46:39 -0800 (PST)
From: fixca <jaehoon1744@dankook.ac.kr>
X-Google-Original-From: fixca <jaehoon1744@gmail.com>
To: shumingf@realtek.com
Cc: broonie@kernel.org,
	Vijendar.Mukunda@amd.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	JaeHoon Kim <jaehoon1744@dankook.ac.kr>
Subject: Re: [PATCH RFC 0/1] ASoC: rt1320: LG gram 16Z95U speaker works with the BIOS init values
Date: Thu, 12 Nov 2026 13:46:24 +0900
Message-ID: <20261112044624.4395-1-jaehoon1744@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261112040143.6945-1-jaehoon1744@gmail.com>
References: <20261112040143.6945-1-jaehoon1744@gmail.com>
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

From: JaeHoon Kim <jaehoon1744@dankook.ac.kr>

Hi Shuming,

Please disregard this RFC. The BIOS init values are not needed: the
stock rt1320 driver works on this machine.

While narrowing the register groups down (after the Sashiko review,
which correctly pointed out that my table dropped the two PDE23 entries
and that 0x1000db15-0x1000db23 is the same command list in a different
order, not an L/R swap), the baseline with no BIOS values also played
sound. I then retested the unmodified v7.2.15 rt1320 driver, with only
the two ACP patches Mark applied, in three boot scenarios:

  boot                                   amp func_status   speaker
  cold boot (power fully removed)        0x61              works
  warm reboot Linux -> Linux             0x41              works
  Windows (speaker used) -> warm reboot  0x43              works

v7.2.15 has no audio related changes compared to v7.2.14, so I cannot
explain the silence I saw earlier on v7.2.14. It is no longer
reproducible; it may have been a stale amplifier state left over from
my earlier experiments. Once (also no longer reproducible) the RT1320
read back 0x81 for every register after a warm reboot, which only a
full power removal cleared. I will report back if either problem shows
up again.

The remaining open point is the one from before: no DSP firmware / RAE
files are loaded for this machine, so the speaker protection set up on
Windows is not active on Linux. If Realtek can provide those files for
the LG gram 16Z95U (SSID 1854:056c), I am happy to test them.

Sorry for the noise.

Thanks,
JaeHoon Kim

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714362;
	b=TlcJrL/Hldi0VMkqxJuemrR6wbL9jBURgjFp6+ssM9kT6HXzwq4n/P1woX33UsjxCiYJ
	 piRjKvK+JcEtcVm2u8rNXJMTs8ELFgfBBxcbNoLjtuU7e5YgKKOGKyTXlvptxyNbCEDzR
	 /EbQyVw/FS603t87VKjGjDAUvgIKa1Ix45s5Yvx97VF2f3jUR/JljuNdIm4ojJ0cQRQcv
	 xh7P0hVgSt5XKkT26FLKjsOUgF6Wih7vWwJ0Fcubqamkq8HFwMd9NbEJnhjB18eAegQhB
	 4L+HNkQ7XPCDDGPz2SBjeiIe2Mo4i1oGS2U9Arr46iH6DtaaqTnDgTGVQgaVZV5kYYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714362;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=ApeHudjpRw1j4fPKuyoZlTN6SSSk0BmJ7DVYBxcf3Y4=;
	b=y3U4rVryK/RE9EDDarN4CjU+vJ7dTvfxEgWmLyh/1bqqw9PrVIfo23eiYwmC5WfGxJAE
	 VG64mBkfpl+bV7Y7e/iRWkJCtJV50Y1mvt+frm1vgJR/XTytXiImMQJ1rh7Dw1WZKO4bQ
	 hAM/kfwpuuswVzCeaM5sj9nLcO+AZXWHXKptzE6k4BsrJf/hZoJZMlESWdty2ahWtwdF8
	 LiJSCubrh+DeMO4j0g8MZ0ODz3lC9xfXeTVD1xFinFIsCYk9/BcmdM/DyRfmhWUQuzKSV
	 3nF3JFbgkBoRqfAU/+buj7iNiihkqQlu4g2i4s4VFlEyuOFDLXjDc0JVmSZmTIq/iug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=RLtOpmE1;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C21606D811
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:59:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41C21606D811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=RLtOpmE1
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so1682512a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:59:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714362; x=1794319162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ApeHudjpRw1j4fPKuyoZlTN6SSSk0BmJ7DVYBxcf3Y4=;
        b=Tbkv+QAfV139Yb2/TfcNffM6KbveuQ8Rx3KzPNGRoYAV9bznkwJ+CDu3w66mOyPACD
         QikHtO8rHwq1cHTXAI9ATdbIRgbOEhNMCPk307hK7HaIx+yOIkpoP8AHHE/y1whXtQL3
         YBHtXcwTRgrKphRQR7hSSCVtsgXoYdlwEtgtp46U4MYYrcDEkgrwPXot4k2YhCQgwEw1
         8CyhcRBCGXmKVEZ2F3WjwASQvD86EcyvPd4wPLoBN1LDxmfNpW4KzpUFZmoFgrAAmbEj
         WLWsXyuaXg0RVovtawprbRdl0nhD+lJzPc4QeuXm0xh5ebTpemdcJ4uEgaLp1jVt+QAU
         1L3g==
X-Forwarded-Encrypted: i=1; AKwUvByVXuO7UcYm0INIKTH7IzdZJ8htHoRMuA6IoH5dVgoteGEl5L+ZsvOVPTgDxdOjgsLKXTt/n5mOq6A75ng=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kodDlLG/Y5FL1b22HiIdLMSLepGGQcCVz5tjAAclQfJi+Oav+
	joT3I7V0GfHFSpOy2oKNs2fHNP26vjHUIlxLP60ZbB3XPW4uvvkcSFwuscA+dS6AUI/XCSDB1Wd
	vsGu/mmFe32RpYDrOKeH+0r6DR/kekjeImdJ4QqvHqBC8rleq4uwTb7HVuWosxuVQ4hjcYkFvKP
	VYrFiinYGnEINpz4enCHtxG0gHxy00s/tLww0FZBI6Xt0nRm8x0CpalqOgA3zpzWJzKPvnSIogB
	PVJ6FVvJzfVv9nggJNHcog3LA==
X-Gm-Gg: AYBFou3QEHaH3by8DQilEJQi6YCH7XbrHp9AewSb8qZZoJTV3MxfGgzShEOuMm3DNdm
	e4PL9dz4U9tMK1ePRn/bxIWAyDaY4zF6dlCr04qH75gHsMZrkOEelC0io8VNN4XQntrnqO3kEIu
	ASu34Eb7sMcE1doZfXufh2FBWFA7ks7GMgf085EEM3Cx/6Ay08exgkrkV+dMYyK0zxbfVffKLBr
	JlwnwjIQZep5urHbOst4Wyg6R2nuqHco14ogbCWe1RDTLsCSsAqfVdz23/C2Y7vKi3vC0bPwf7z
	HO3ybox7/a8D8tiGejgqC61UJ+w8rmgZ+SNOEF/BcDvVp2m0VdGemgitBsuLxs9fluqnnrEhnIm
	PjKAVpI37AMSgBHigWp6Es5IRYJdrxpRMmEE3ncFyk08kHu5U/C1HegLHDNyfSrdaOzXzd3uUVM
	nDr3SzoaCmWyBl6wgEMEimNpwbOxikFaqbjuzugW8=
X-Received: by 2002:a17:90b:1645:b0:396:41d1:cbc7 with SMTP id 98e67ed59e1d1-3ae8957cf23mr10429090a91.3.1793714361400;
        Tue, 03 Nov 2026 05:59:21 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3aed16d1ab2sm1307366a91.1.2026.11.03.05.59.20
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Nov 2026 05:59:21 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1acbaf81bebso893622c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793714359; x=1794319159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ApeHudjpRw1j4fPKuyoZlTN6SSSk0BmJ7DVYBxcf3Y4=;
        b=RLtOpmE1mIOTbJbge1Tfnyerwmo6zO/iYqBQbf9QWS2xcTOjK0obPShjEMtTt7R7rz
         NQeZ3JrxK7CujzRlbWCtxOO1hHpt9EP+WAqNgsPq6ZaJ2oqio3DzBqqmFTnPcYmoyvy9
         ysRhg1SkNNOfUBU/0ccWKnXhh5FLB+5FNWhWs=
X-Forwarded-Encrypted: i=1; AKwUvBxUeyGFVEAZio9ALmI98QP+sJI0Pm1dwwC3YhHrpFt4TOdrNbGjT1Mun6mzIIFWLi4Oo5AvuJbdOoUMIto=@vger.kernel.org
X-Received: by 2002:a05:701b:4211:10b0:1a7:99b9:2eb9 with SMTP id a92af1059eb24-1ac5de4e8a1mr19735545c88.27.1793714359359;
        Tue, 03 Nov 2026 05:59:19 -0800 (PST)
X-Received: by 2002:a05:701b:4211:10b0:1a7:99b9:2eb9 with SMTP id a92af1059eb24-1ac5de4e8a1mr19735501c88.27.1793714358682;
        Tue, 03 Nov 2026 05:59:18 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458e07sm41658755c88.8.2026.11.03.05.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:59:17 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Michael Reeves <michael.reeves077@gmail.com>
Cc: Pieter-Paul Giesberts <pieterpg@broadcom.com>,
	"Franky Lin (Zhenhui)" <frankyl@broadcom.com>,
	Mathy Vanhoef <vanhoefm@gmail.com>,
	Kalle Valo <kvalo@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	asahi@lists.linux.dev,
	Hector Martin <marcan@marcan.st>,
	Daniel Berlin <dberlin@dberlin.org>,
	Janne Grunau <j@jannau.net>,
	linux-kernel@vger.kernel.org,
	Hante Meuleman <meuleman@broadcom.com>,
	linux-hardening@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH 03/13] wifi: brcmfmac: Fall back to RSSI-only default join preferences
Date: Tue,  3 Nov 2026 14:58:47 +0100
Message-ID: <20261103135856.3676311-4-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260925-brcm4388-submit-v1-3-b5cbc2cde2fb@gmail.com>
References: <20260925-brcm4388-submit-v1-3-b5cbc2cde2fb@gmail.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Fri, 25 Sep 2026 23:43:38 +1000, Michael Reeves <michael.reeves077@gmail.com> wrote:
> From: Michael Reeves <michael.reeves077@gmail.com>
>
> BCM4388 firmware rejects the default join preference containing a 5 GHz
> RSSI boost with -EBADE, but accepts an RSSI-only preference.
>
> Retry with RSSI-only selection only after -EBADE. Log other errors
> without retrying.
>

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend

> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c | 4 ++++
>  1 file changed, 4 insertions(+)

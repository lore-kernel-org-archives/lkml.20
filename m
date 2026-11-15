Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776816;
	b=U07EAlHXL9YWHXeH9IpNiE6UJA45VGSx2bUvYi0iR9f19f9bRcBj2TErqMCesl3u/vRa
	 zgDxbpR2qvoCdrqkG+N6IKzUhHPxRlXpUgTzqyupan5UU44m4q7IX75t1ecz5DQ10Cuij
	 D7RdU4/ajNvYuI3h5JWb8GWdk75riaKqJDW0TNSvVcYQMC0FNz3DuEkir21ESx9QaoSYO
	 jO6dE9LRLIvK8vFPTqtOsczIwiySJplMAyYtLMYaPk9dReZvEP0SXHpcP23VyOBkgU9mp
	 IfQEOUGHAJoRjE97m+1uMk34Mp4uEsenepadMngbnNX3NkVzcokjIWDxCPvg8mjO99g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776816;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=Hy5B50aWYdVKoabUEPf9kAEQZD5oIZknlEXK2QY/HkU=;
	b=P9L6Msx4hgvg+PcH5nuNGi8nvd0x3K7kWVk5d7pnOefelc8xWBtkw2rLfw7ekMZyOpks
	 Z3TiD10TlzBC2r8jiwG5VRQIrKCe5NofBpKAOahVppcZNozUeAtFGzBvw7db47g9/TVfm
	 N72pjxfMthvck8SVGuP4bVyVAEdI/aM2rsOYq4Z6cUv9GFO0gm0a5dZaC0wxJWEngKqXb
	 Zi/d0GO8/rxfal8HIq36HpBH9StIXUD1FoWcqj2ncWlQbmLW2j4ouXdSkYRBM2HQF8LvH
	 8hn5rRo+FFmsrN5uQ708i/HYIYCrVdEWat2I1TYqnNqB95PgedFkL1DH75OMPboog6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Pihjmq93;
	arc=none smtp.remote-ip=74.125.224.100
Received: from mail-yx1-f100.google.com (mail-yx1-f100.google.com [74.125.224.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FD3606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:06:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2FD3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Pihjmq93
Received: by mail-yx1-f100.google.com with SMTP id 956f58d0204a3-67bee1f693bso2241612d50.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:06:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776814; x=1795381614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hy5B50aWYdVKoabUEPf9kAEQZD5oIZknlEXK2QY/HkU=;
        b=N1v8OPd+zRRwgonQVoj75A8YmWO1Yc4hOuW2DVkNXdWcuHxZIJbWdU9Meji3zTJYxC
         MRUkvT4zqfd8D4NcO4918jpnOPKHZsEX25k94vlXU0O2RqkNvXe5Cu5Ho69SG8NLh/Yq
         aOngQPuKAIEE3IgoI2B8B8Fp4QuGPky7uDl+BkYL5qSmKqrKUM1hvnmvwGVON9/hUous
         9xaiqCHXS5h8OUHwUblHF28XtTxqdMtJZLqCd5uql0eXzBtwPd3N0PP2F3enIh8wnJ7P
         DMfWq3V7NFM3yuw6oayjDgjO+vGXjoYMc2GnYhvn76q2BBfVqHl6mVxi+YBrUoQIDhwz
         03Pw==
X-Forwarded-Encrypted: i=1; AL+hErG2JoDj9clp3lvhPFN36I8RGkdSKLAtSwhTSCTROc9GrgGvWd+nb6F2zTznWwm8WaSC6IQKQSBeXrZfoHI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wEB0og7OFKiVJp0Cgq7Gp9u//ytaARwwRyjahDwYVIdIXdEj6
	M1xF2CmK+Oug5MYOG5qwV/LIqh+N+c+OSSxTnQyuwXHYnEhBcdtJGntGoFzXZh1uSfkcEraRD6V
	IhVozTlp9BS/CzzMa6MMeg6725gKIyzNWAdTLc3tDdm/8fKINBQc9U2GDuD/yLaF/88JfSvbyZ5
	h1Sw6x9CdB8nqqAscjXCUMBmknSjia+Q0OzkmUVPQuby3M5SDLRLRcHJk9M9MNOkMwQnw9mmrbB
	J4uSbdP6oOxng5c6RFanBXlGQ==
X-Gm-Gg: AYBFou2eS/cl9HrhADMRfk7Eb/ojlgWtfsP/M5+sBEnd+YYwFS6nyXpbYp+ByUer9eI
	jxZVAnfJMJza9jaaVBMrJnvNXDB9Fkd+jFz9W+dWgZky87COAvgzZoWmnnV913ywRjyqG9S+0MI
	6+J/NnFQ78+cejmaaBZDVN1xfkPh0g6vlBTqVew6VcweL1I79JHnCp3lq79OiRieaT3l+PuTKWf
	Q6HcSRuoeMTjJsF1wrnbJT1nmlzvM4AVMgvCAT8K7Xox4WEZ3OAWdnQDPAzfQaVgGHeg6Zp+doJ
	t1Kj3srcpSp+5JMOXdttGUv6rj4TYO/BdZKyoK48D1FEUty2rfPTbsh2WpQ7la4KBLJrnnvfjr7
	XFUcCgbmyXi73UluCWDvo3z0tVQpufDAKa4tPQD8jxAado67HssQptq/jal6fjWu8M5V/diwL1/
	Rhf0qlB4v+Q41IsYLJCxkkHX8pMvulpi6QNAQ9IbY=
X-Received: by 2002:a05:690e:c8e:b0:67d:bb23:6312 with SMTP id 956f58d0204a3-67dbb2364femr226472d50.33.1794776814591;
        Sun, 15 Nov 2026 13:06:54 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-67da73dc66dsm25698d50.40.2026.11.15.13.06.54
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 15 Nov 2026 13:06:54 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0d568830so3646455eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794776813; x=1795381613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hy5B50aWYdVKoabUEPf9kAEQZD5oIZknlEXK2QY/HkU=;
        b=Pihjmq93+ydLw/QwqloP/87X/p2H2h8JbkfGEB7Zz37C4ErTSkKAtgkme/dLgDvNIH
         ETlniro1qPFH0xV3XKu8HichpOYLw3AfnBItaPu1Q5nr8RUaF60oMgMHcNDcMVuddW0D
         RIFKayaOlH7VCZvhe7RHhoP+yQ/FGeg+y4Zg0=
X-Forwarded-Encrypted: i=1; AL+hErEzqs51B5g5d2s1K2Je65obXsmEGLwqKhuYleA8tDy8OOKrikp6vuYGPqz+10QdV+eIzaZYpQTzZejZ1iA=@vger.kernel.org
X-Received: by 2002:a05:7300:e9ce:10b0:368:7c2d:a612 with SMTP id 5a478bee46e88-37966c4738fmr8998727eec.10.1794776813219;
        Sun, 15 Nov 2026 13:06:53 -0800 (PST)
X-Received: by 2002:a05:7300:e9ce:10b0:368:7c2d:a612 with SMTP id 5a478bee46e88-37966c4738fmr8998706eec.10.1794776812568;
        Sun, 15 Nov 2026 13:06:52 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316f2sm28693790eec.9.2026.11.15.13.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 13:06:51 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	Angus Ainslie <angus@akkea.ca>,
	Kalle Valo <kvalo@kernel.org>,
	kernel@puri.sm,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] wifi: brcmfmac: use ISO3166 country code fallback on 43752
Date: Sun, 15 Nov 2026 22:06:46 +0100
Message-ID: <20261115210646.889090-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261018-brcmfmac-country-code-v1-1-54d7cbcce035@puri.sm>
References: <20261018-brcmfmac-country-code-v1-1-54d7cbcce035@puri.sm>
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

On Sun, 18 Oct 2026 08:52:43 +0200, Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm> wrote:
> Without this, the interface stays confined to the country set by
> ccode iovar default value, which is usually 0 (global).
>
> Tested by verifying that enabling the fallback makes channel 13 APs
> visible in scans while in Poland without having to manually change
> the ccode variable.
>
> Fixes: d2587c57ffd8 ("brcmfmac: add 43752 SDIO ids and initialization")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 1 +
>  1 file changed, 1 insertion(+)

The subject does not indicate that this should go in the wireless tree
so wireless-next is assumed. The Fixes: and stable Cc: suggest this should
go in wireless tree and it does not apply to wireless-next tree. Please
clarify and send a v2 with [PATCH wireless] in the subject.

Regards,
Arend

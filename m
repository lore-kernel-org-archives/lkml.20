Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776591;
	b=pqmflSpuFYmvlIMHES4Quenr9Tm+L4yNmFDSUR6ZHeH3biUZm7cJdk/z+t+aftxl/pd0
	 CLUXLKqnMq70v1ce+wYe1bAtBLjOUl2ggSRl3ef4bXXKfxcwPcQf+1d5OT21miBuoFY8x
	 xYqUQZviOwkeTa4fSvSoO4HK760GW/8UKH7sD8AVmUAi/wKijDmSL4A2KhLwBuQO4lnKo
	 5i5ixcx80Meh2lNeXu8TNEkW8xb7Hn9TgEQJruPltYMbgV+pYI0O6iYb7aN0VsOIxCsS/
	 kkHNMYud9qAafkKI1ufsonWsYmOHe2OizvUxN5vLWfHVchq85s91dOZW7xkS9X03JOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776591;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=pbkTGs7YmlnL0Ccvd7jdso8Elsa8PtZvBDwPld53vBg=;
	b=IzIaijxI7tt64RZi15N0nGqGGTHzavgeMMcpvl+3hssZzLw+38WEFd0eU/HYX8mIkCcK
	 Bf76K9e82lkHAQ9dleVelwj+JRhTvXryu7bU4BEjlG/khqkTejrWYmQXi9iX4TbsrPEXX
	 TpLGg6MDsAqkQgVnOUEUbN+jEL0iWxBdVOZzD+YOqh6bN3tGuD0b0Dek7cyOTg3Yy4n1b
	 nZf0cWWoOPSPFayFFMqwksC75Js/Xi/9+HB+q+pkFVQcjhby2i1Ice0FmukYtos3m7thT
	 x2NUX38LN3IDrHdszNhIvRvUrLDdk6xbmzIeKTuhbSZOuxP4HjMxjyvN0i5h87oOlFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=gk0lnsvA;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E206606A32F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:03:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E206606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=gk0lnsvA
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3ace1f3897cso1369881a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:03:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776590; x=1795381390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pbkTGs7YmlnL0Ccvd7jdso8Elsa8PtZvBDwPld53vBg=;
        b=G9Lv/QeY5IYPjp0N6T4hXSAav4O1BxaExDZNPmD6rSLY+rsrn1W1pqIwPIk5arCzQH
         SnwsxxlOUshsu55SuzHDORl7I4wiCTWGj+G68ta6Kpt37VwO6HfXQEZWCx5UwaLrnKTt
         gxpFdSD0Nz+tA2SiAJKEZEx7zYDUfZ3/NgWMLQo3ryqYaaMbFlL1wBYGbeCDkSL25gYL
         zkSFuudyuaJkd/3+gcfj6I+eQgMlQYer1YNAAOMYXPgyIKiUhrKAXPdojG3ONV3MMHF+
         D8NttIXZH1k/1RGLh0pVlChgCFXvWjxKKz2M+O5u8eBq019bGfqyVNAj2oOuJ1MFsMvZ
         Y8yg==
X-Forwarded-Encrypted: i=1; AL+hErG1exEnvoX8qa8YgQRhBH5XywlCFfBgF9h2VzxeBsPEvdHlYcrmnT6WZ24cd33B+PMosMUcuV4GiH2JBL0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qoaf3KNndLbXWnusrLZqTkujZJNtw29nD/NzGBMK5CAih9LD7
	YUJLpcxoyB0GN1knyrov9bPn8dwMBiRNMvOnS+u8THw4KPm02JV69/IHzs2vdlcsyZmKbyRSjn/
	DQlEqv2dnchzZIqt0JA2uygrQsXFG3B6rgAfC/rk9GVbfI8DiJaRmsjyynpNYr+s41QBCgi8hor
	Sdfm46c/h6qH8j5O9MsKa2WeM2hGJf/Q1vzgiNWgl45zsYmL3VdRTaSq/ORjj8A29KkhX3JIj80
	5X7l+rIm95m8A05ODSMtbA=
X-Gm-Gg: AYBFou0xRI2DyKJaH3PdGdZipDrPUNcDeOSYsTI538u84m7GcuhX9MkvjBXmKqjlvO5
	vcF1ni8I32Luy+EO0Dl7lswHh6tK5tD86WxygGM4tGqCgmfDA/m1RnxbOoLshoNbelli7kLTMJc
	QWokO/LhUHNUVpYURHruKlbyy8tvRJSgGyk9BmFR1d1pyJdCF0fwSGzRs6nMaKbLoC8y4lZnTAv
	PboRjALvelqmPClIE8vXwCrcs1VodOohoRUYvIZZhj+3RXNKKnfy08mlhII+ECPxmwdpnWCzB0D
	oadOXx8ifYMlKyk1gvSrXwkmQQu/NucJKZbbCRO00o2hwu6UOTF4U3n5Nh/CZlsDLbsHnq+e2+D
	0iutDcNroKLa+rzFKU6isL1Vatvihjsy1Wt57wnXtOtHG5xqzIvQ1aJ5qNiDVt7H6f0dUt0y/Hd
	Xqc1ra+5gy+zl0Az+b/8RdRm4hSHCAYW1EB3y2KSc=
X-Received: by 2002:a17:90b:3d44:b0:3ae:5572:c4d1 with SMTP id 98e67ed59e1d1-3b1b0caba3amr7936542a91.62.1794776590475;
        Sun, 15 Nov 2026 13:03:10 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b197c1a3e7sm12693559a91.2.2026.11.15.13.03.09
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 15 Nov 2026 13:03:10 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-375f0fd31f4so1162894eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794776589; x=1795381389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pbkTGs7YmlnL0Ccvd7jdso8Elsa8PtZvBDwPld53vBg=;
        b=gk0lnsvAfYqWUBl/gOh+EmtoTgwo3fodsdsO2GzPSIGsc9j4E6rY9FRTzHGWNmNmK8
         /tDdzPe0snOmkw3bKvLI37xjOEsmxTFU826kMzDh1NXTGyTeNsUp3JCHLv2h+Bl0iPzL
         3TVArru5jN+X41F0mGZwoTgypp4vJYJeSily8=
X-Forwarded-Encrypted: i=1; AL+hErHPdgfyoPqfftTLWit87iJzzpfo2GW91BcID/cV6MEntKPSxVD+gb3fKWxmBrPVhUUW4brXYcHgEIpAbFA=@vger.kernel.org
X-Received: by 2002:a05:693c:638d:20b0:375:c862:31c with SMTP id 5a478bee46e88-379684b8190mr8857532eec.40.1794776588830;
        Sun, 15 Nov 2026 13:03:08 -0800 (PST)
X-Received: by 2002:a05:693c:638d:20b0:375:c862:31c with SMTP id 5a478bee46e88-379684b8190mr8857506eec.40.1794776588102;
        Sun, 15 Nov 2026 13:03:08 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d3e37sm31068797eec.24.2026.11.15.13.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 13:03:07 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Yossef Osman <Yossef.Osman@proton.me>,
	Aditya Garg <aditya.garg@linux.dev>,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH] wifi: brcmfmac: use a 200 ms power save timeout by default
Date: Sun, 15 Nov 2026 22:02:52 +0100
Message-ID: <20261115210253.883721-4-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104151626.70737-1-dev@deq.rocks>
References: <20261104151626.70737-1-dev@deq.rocks>
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

On Wed,  4 Nov 2026 16:16:26 +0100, Andre Eikmeyer wrote:
> cfg80211 calls set_power_mgmt with timeout -1 when userspace leaves the
> dynamic power save timeout to the driver, as NetworkManager does. brcmfmac clamps that to BRCMF_PS_MAX_TIMEOUT_MS, so the firmware
> stays awake for 2 s after every frame in PM_FAST mode and rarely sleeps
> with the background traffic of a typical network.
>
> Use 200 ms for -1. macOS 15.4.1 sets pm2_sleep_ret to 200 ms on the
> BCM4377 of a MacBookAir9,1, seen in a trace of its iovar calls across a
> sleep and wake cycle. Measured on a MacBookPro15,1, idle with WLAN
> associated:
>
>   pm2_sleep_ret 2000 ms: 11.2 W system power
>   pm2_sleep_ret  200 ms:  9.2 W
>   WLAN off:               8.8 W
>
> Tested-by: Yossef Osman <Yossef.Osman@proton.me>
> Tested-by: Aditya Garg <aditya.garg@linux.dev>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 4 ++++
>  1 file changed, 4 insertions(+)

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend

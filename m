Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A5330ACF0
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 04:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791262194; cv=none; b=kJpQ2ZeuK4SlfIdboxxAPsncqTsQc8SiozVjT3HsyozmwwBjdXJDb9UdnKEKbkcKScmCncN4nFlcm2J1Fts1fH3mtLoCAEyF9h7ZJdwU362ER9NUA6nPnMqOkZD4DeRMcdlwDOKIlYCDZHZ+saWzA3XsPbmQSsb5z3oVxAcFwMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791262194; c=relaxed/simple;
	bh=AuKSq5zNoEPdcTVeayPv4nEkgGoFgwVt4mAnVV9DlsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gzWIw/PZqZyYAO3RnKM2XMw6lAvmSmzhuSdYLINIO0b/tcNx90ubcBd0EXxHkWy8Q3/stclx5iySBN98WoY8o0rLgtIhb1rTR9ZUwNOaSz0Q+cJmQDjosgLLmLSRtiONzBeTx/K4Zisir04twPRmp+PgkWc3Yg4/MI+C+WStPEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rYSiGKkW; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rYSiGKkW"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-31490970b97so173067eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 21:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791262193; x=1791866993; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YrEcoU9FcHdWMW/WvsPqp/tm10NVhSMWvPzpSIVGh4U=;
        b=rYSiGKkW9Zg1QiIvUQZbBbwvqUxoMH1rCicktV6hbOBX6jtsUZaHzkC/xVWIVCmD9H
         GvCDFkvBcJ+BEanOBx0cevccynvToIJBC7by63nan9UdZfGpMDOGmv/RdrfgCc4GX2tq
         DlZDbmOcHhRIIGtfqI+kH7sHtQCdTJoAERKDViebOWXrIWBWPXGMDaJsb5ullbxvT3A0
         Opnlu6hcRYCpzPB1q+Cq+4z80i0jsrKR1Mih8I8g+UON32iv2TFW9F9hjp2ioxWPJB03
         cpKF9bTkV4JgnksFAvniSlgBRau41Pqwcr9SxxoZrT9lrjh7jCyX6L6yn++lcoyU21Pu
         TdCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791262193; x=1791866993;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YrEcoU9FcHdWMW/WvsPqp/tm10NVhSMWvPzpSIVGh4U=;
        b=M0JxyEix10ZmU6nzU07zzniyzGt7enPbxBL1obON5sbC2QfQQ93Bb8AWQjF6JfN5ue
         3sp71qciZYElFkIlyKW5lXKay+4FcKUZmaZH9dou6M4SyQBBMgglc6zTDENvHTbocPWl
         Jgt7zXmGz1eTr3C3ibCTxfSUKi0sTHtmeZo2jWig8Cqmv1C99mfIRS1gI6V/eopbh4Fg
         wPaVuf2l1rw00wwyHSHSrCD+Bl1RYw/IMLKWfaUIkI5OAd7VMuJFx5hAtftgTNKU3rG6
         Sf6GmtrUKvNGPHJZZSE+klrOKZD4OHxf3SCroBB2blktztzC6NV9FMMzeQTKGfiU0pNH
         7lYg==
X-Forwarded-Encrypted: i=1; AKwUvBwlCha13trl/fO0KBgLI7NN7MNH1cP4e9x+inF/2HjqhLuhoc4MX4qKq3kGqmSBmZ11cEe9IBHLdRTo9gs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKAxubYtmEeqCFR5lKfnVncnubTxbabqQuk86HRwD4TYPvIjEr/
	btwbwdW7z+8Mbs2Xh/62inlKS/536dvhL5fBiGPdKaDcl34+mxVM1j5D
X-Gm-Gg: AYBFou0AJTjBwi+sJIk3XpjygqIGIqvalLkPlbB6+LSzXOC5ujVtbtYZmgj72Xhj6qt
	/uh3nGIvvQIV2I0yIai2XmWJSX+sWc7aXwZ1HPE2VylEXOl1c6bpTOV/L8xR0IO3DetoXsf5hnj
	1HkSseNxI44TU1+m2adpi55scviil8sS8ALT7WbghFhgW5yHRe/udya+cqhyTYyV0N5DKttUFT7
	YCvtGKlslmpkjlfkOVaj+npszx/0PSVVUzKlPIpPcvN/0DFLSrNaFZyWnZjCsRZHEGqkXVtAMS9
	wkfNaRiW/6ik3MwP1i//OUEmUCJUgWxyQGRNvl0HBWRRcOeWHcF+JtZBsCWiLxWTMca++4/ejH5
	dfCVwe/57r9t8z66WcdnZecQCd8rt7hAXkkwFp3obSBfbbiWytFO6Vf227M3R7W9nCC2IwS3Fur
	u+r9E8+ejs+17IdYT+tChwDepe1SgaLM5a9MOxo4SOq2Oi0rZ86UVJUN4L71CCLkxuAvj9xnmfW
	99RPtFR1HoaVt1j/vBUjDLK/wZbpzaAG1G2fq0aL0Vf96mnE8Ybb/9dWowE7e6p0ns=
X-Received: by 2002:a05:693c:26cb:b0:351:4b50:4063 with SMTP id 5a478bee46e88-3514e383ee3mr193472eec.37.1791262192567;
        Mon, 05 Oct 2026 21:49:52 -0700 (PDT)
Received: from archlinux ([2405:201:1b:20ef:de2d:6e5b:74df:ad41])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35146abff39sm3568320eec.21.2026.10.05.21.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 21:49:52 -0700 (PDT)
Date: Tue, 6 Oct 2026 10:19:45 +0530
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: Shuwen Bao <baoshuwen2013@outlook.com>
Cc: Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Emre Cecanpunar <emreleno@gmail.com>, 
	Suryansh Singh <technosfan14@gmail.com>, Radhey Kalra <radheykalra901@gmail.com>, 
	=?utf-8?B?S8O8csWfYXQgQWJheWzEsQ==?= <hello@kursatabayli.dev>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86: hp-wmi: add support for OMEN 16-am2xxx
 boards
Message-ID: <asR9Q8Xia4ijLvXM@archlinux>
References: <SI2PR04MB58957D08A31E56D73C751885A2862@SI2PR04MB5895.apcprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <SI2PR04MB58957D08A31E56D73C751885A2862@SI2PR04MB5895.apcprd04.prod.outlook.com>

On Sat, Sep 19, 2026 at 09:24:25AM +0800, Shuwen Bao wrote:
>The HP HyperX OMEN 16-am2xxx (DMI board 8F1C, 26C1 platform cycle,
>Arrow Lake-HXR) is listed in the OMEN Command Center device
>capability table with DisplayName "HyperX OMEN 16" and the
>"PerformanceControl" feature, but is missing from the kernel's
>omen_thermal_profile_boards whitelist. The thermal profile path is
>therefore not enabled and the embedded controller keeps the CPU
>pinned at the default frequency cap while running Linux.
>
>Add 8F1C to the OMEN thermal profile board list. On this platform
>the EC firmware also arms its own thermal profile revert timer (EC
>offset 0x63, armed with 0x5a when performance is selected) and
>switches back to the balanced profile once it expires, so also add
>the board to omen_timed_thermal_profile_boards in order to have the
>driver clear the timer and set the NOTIMER|TURBO flags when
>switching to the performance profile. Testing further showed that
>this board uses v0 commands, so also add it to
>omen_thermal_profile_force_v0_boards.
>
>Tested on a HyperX OMEN 16-am2xxx: after loading the patched hp-wmi
>module the platform_profile interface is exposed, and switching to
>the performance profile raises the CPU from a ~2.9 GHz (P-core) /
>2.6 GHz (E-core) cap to ~4.8 GHz / ~4.3 GHz under a single-thread
>load. The EC then reports the performance profile (0x31) with the
>NOTIMER|TURBO flags set (0x62=0x06) and the revert timer cleared
>(0x63=0x00); a plain write of the profile without those flags
>instead arms the timer (0x63=0x5a) and the profile reverts to
>balanced when it expires.

Hi Shuwen Bao,

I was working a patch[1] involving omen_timed_thermal_profile_boards[]
and needed some diagostic info. Would you mind attaching the acpidump
for your board 8F1C?

Thanks!

[1]: https://lore.kernel.org/platform-driver-x86/asPy5Q5wNYaMzTqJ@archlinux/#m922ff6cf9a68285d2b0f64e578fd6d2d6fa573f4

>Signed-off-by: Shuwen Bao <baoshuwen2013@outlook.com>
>---
> drivers/platform/x86/hp/hp-wmi.c | 3 +++
> 1 file changed, 3 insertions(+)
>
>diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
>index 615b4cf6fc45..f229da54366a 100644
>--- a/drivers/platform/x86/hp/hp-wmi.c
>+++ b/drivers/platform/x86/hp/hp-wmi.c
>@@ -211,6 +211,7 @@ static const char * const omen_thermal_profile_boards[] = {
> 	"8BAD",
> 	"8C58",
> 	"8E41",
>+	"8F1C",
> };
>
> /* DMI Board names of Omen laptops that are specifically set to be thermal
>@@ -220,6 +221,7 @@ static const char * const omen_thermal_profile_boards[] = {
> static const char * const omen_thermal_profile_force_v0_boards[] = {
> 	"8607",
> 	"8746", "8747", "8748", "8749", "874A",
>+	"8F1C",
> };
>
> /* DMI board names of Omen laptops that have a thermal profile timer which will
>@@ -229,6 +231,7 @@ static const char * const omen_thermal_profile_force_v0_boards[] = {
> static const char * const omen_timed_thermal_profile_boards[] = {
> 	"8A15", "8A42",
> 	"8BAD",
>+	"8F1C",
> };
>
> /* DMI Board names of Victus 16-d laptops */
>-- 
>2.53.0
>

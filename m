Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.247
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794209137;
	b=gKhRQhJjt1KoVudc8VBjX1Ios2U+cNk0BnReRE0P8caY8b+C9QJ8khi/Ud43T7rhCwI5
	 Vewnb1C5K2cy8HphkysVqsa+/4Gt2C9scMTyGDZ+fTF769rGqgWiEM9U41EH/FTdk0luS
	 IM6lUs4emUgjvlBzjyqlodaMDfJn1FEJyvInmqKlxAkudA31MD1rLt3UHIHIyZ3dVh5yv
	 tJFzCli6fIe4oQEMuXmGS/8e2vq8Gnk+w/pDrxZ2LXIFt5nHSdd3IsSnBdnYAiaxlNwFM
	 2f1YQTpF2c2Z79yePmxpiVHy6RnVlInugPMx60Nw4x4s4ZQZV9gbyHpSNrUkxpU1zhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794209137;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=YHXccpFDMaLgpxwFRumTVl0AHaueUPNTlnLxC93XK3g=;
	b=iOrAo3Sox04YURLY7NewXJdoKPF7F2AZrI35uIu8tDl2a5IAPMtnsI8qplpyx6MpLd0B
	 m8l5qQaMJS3LbWv/EFAbF9fM6H8qYT/Gh8bepK2AMJZhTJhD0YWX2pd0JiLrWPHNTV3G9
	 bALQ0o6ZetnYcytISKfSh2cSHSPadYnXmhjNYWJYkbnMcjNut7sPvLeM4g4cbAgJmXz7+
	 OlIYaCR0BulYAV7JYGoOYLd0YAwdvYXu4yLwi6rIVU4wzIIyh4Lu4bsa3Uc5dTAUFxBP0
	 EmjAJRZoDwZOawB6HaWvmw1K4kU2QSnZtmThabRvf4ab+m7SBNtK8kgHVsZyM7RT8Ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="Mm/TQpG/";
	arc=none smtp.remote-ip=91.218.175.247
Received: from mta0.migadu.com (out-247.mta0.migadu.com [91.218.175.247])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C59606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 07:25:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68C59606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Mm/TQpG/
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=YHXccpFDMaLgpxwFRumTVl0AHaueUPNTlnLxC93XK3g=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794209134; v=1; x=1794813934;
 b=Mm/TQpG/mPPvbNXim/V+x0XsoNCGipNQ8wJHrXnHDC0VdlOREvwJHDd6lR9jBHwUeQdAwIV2
 M2QNu/iXcc78YBNlHJzjuPr2/8QKoUQcibwBcxlMOghAgE6HO+rgTrfziZ4gtvLH0BiEf3+Z5Nu
 EI9YZPl3XdzWmJMuh9Mhc6as=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 27019bf8a3881414;
	Mon, 09 Nov 2026 07:25:33 +0000
X-Mizu-Trace-ID: 27019bf8a3881414
X-Migadu-Flow: FLOW_OUT
Date: Mon, 09 Nov 2026 08:25:28 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Jie Feng <hjf3108@gmail.com>
CC: Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v2_7/7=5D_wifi=3A_rtw88=3A_88?=
 =?US-ASCII?Q?12a=2C_8821a=3A_respect_peer_A-MPDU_size_limits?=
In-Reply-To: <CABOQOSXFXW4bVmnKpE25U_q+ru2Y+NZQGPsBnhTVGuWH4WBkPw@mail.gmail.com>
References: <20261031070950.425176-1-hjf3108@gmail.com> <20261031070950.425176-8-hjf3108@gmail.com> <ada56d168f44385c12672eee9f4a750716e6de67@linux.dev> <CABOQOSXFXW4bVmnKpE25U_q+ru2Y+NZQGPsBnhTVGuWH4WBkPw@mail.gmail.com>
Message-ID: <6CC165AE-91C8-42B6-BF8F-3CE1D3528378@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

Hi Jie Feng,

On November 8, 2026 7:09:40 PM GMT+01:00, Jie Feng <hjf3108@gmail.com>
wrote:
>On Sat, 7 Nov 2026 at 00:35, Luka Gejak <luka.gejak@linux.dev> wrote:

>> This is the same as rtw8812a_set_ampdu_factor() apart from the limit.
>> Maybe a single rtw88xxa_set_ampdu_factor() that picks the limit by chip
>> id, like rtw88xxa_set_crystal_cap() in patch 5 does for the mask?
> I feel that this one would not deduplicate much code and defeats the
> point of a
> per chip set_ampdu_factor callback anyway.

Fair enough. It is only two lines, and a shared helper would need an
export and a chip id check on top, so keeping them separate is fine
with me.


Best regards,
Luka Gejak

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793481628;
	b=KWJoNgADjJxAnetayoVVYFkcQoy7I5BJFDfu5hzJ89K/Cz2rxV+s8voNMdj6TkKJS9SG
	 vQBSg404hTn77S06qmg14CEfLf9B6OiIpEDF4xqKglLvsjFGs0IXD2QqbAkf/rmNpP1HM
	 7NEI5R/lNwN66lfKnt5zUUIHYhNrQf01C30pc/tG8fDzEkrM0wRQBI45jJAYin61Pea9Q
	 tD8zrArmSJcPrxMr9P0VMr2VXuvL6Mg8iXV7tVMGC+5fFE9GBOFC8Bu11JkipoC+8aS90
	 Luv29GdcqDHhgVfgKI5cm8YYMSzUjOcN/LG8YpFySjtUl+3OZmCxkbM1lRcCDSYXDaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793481628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5oO48QroBf27PsYGGHmHN7zXVNR27HEcFdEaw8Jvf4M=;
	b=F37DdH0herEV8YgwRPihGyb0Tvk7H+6rChCUTe9sMhtUNryodwbLxwoWnVzJBNbaBVIu
	 vwTFF304jTK3Sj13VSoepDmfjdNOlqQWQCiI5ImCEvW8aQZPKHwOGrZfJIeAUI43wGhLV
	 G+PP47NBSyR/yb2yg/JJkLMOMhv85cSXIXpb2/kcoeLq2emdB/Of/T3sa6W7U9r0846mX
	 EKVvZi85N/Dccpa0pVQbdm3Z0X4mTsjgaQsadUTXcNz9fVhH7VG3wgkM7mgqM70gLVwUs
	 aLI6cO2Qf4IGmELjwB8CqIfFuYveBb4A4dPbtblTfup9Xifp15EKR3h6PDMhbFh1XOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bbgVpCAC;
	arc=none smtp.remote-ip=209.85.219.54
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FACF606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 21:20:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FACF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bbgVpCAC
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-91c79f306e9so21766126d6.3
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 14:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793481626; x=1794086426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5oO48QroBf27PsYGGHmHN7zXVNR27HEcFdEaw8Jvf4M=;
        b=bbgVpCACNIJKaEXqjXPbwSCtT/Y/hMmvrJQ8UlU8JazRNUb+I4ByO46ZSWAIzFpToM
         gEd76yJjwfz4K0AT1y2UO7Gt4UjhAQARZzLwsnXY3ByYYt6D7zhEbWA+N6Kq9oFZYbzZ
         nxv/PGKp1xqQ3tCkuaDWPIp5L6GJzlO+k+03msKXCfvnm6stlGJdDigc07pFqE/FDnty
         yrncJyM82Ke3Sl53VoQRJxfaOmb+6JpBFjIchZJjBOUCltbh39Nnm3vBCOXjRMuDwpHS
         QqWclIzs6bc9mqa69c8OdAFD24mjE71ifQw7mp6Up/X5xqY80eLZTLrxTT+v/zEPngxl
         35HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793481626; x=1794086426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5oO48QroBf27PsYGGHmHN7zXVNR27HEcFdEaw8Jvf4M=;
        b=xB4b5yJ8SiMojpbH0gj2n+QmM8ZRRbGjrZryNR57TFD77QmP9ov+nDdAY0BvDaD+di
         vXe16b8ErTS6k1zqW1E5VTvJxjw2foUdbPgQLDqc1fQGobG/5GWKUF87e6EQNA45eIJu
         wgS5STDF0prQnwa6SUTJE9Clo6/ibgPqDm4eyPf0k7hhxAgY1aPFm+p/CFIX8zKuBPpu
         Y1OVMNxStLTurX0XyMn2+Jqtlhy/Qiry/TNm+IuEztGICcxUKofYG+jbnyJeTTWMjqkm
         b/AU5GmRdYJhjzASnhPM/0sAR2sM/Hwqgxh56MpdgDcrHEVDVNiGU7OUTgysXpcBqVx6
         29xw==
X-Forwarded-Encrypted: i=1; AKwUvBxSMoWZ9x37+T5WL5IQJpkfMUKVT5EKgrsVJaoqpWzoU9a6BYmaTg+hjVvHTWV2S5kAmpBwJqW0up7y7Rk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQ7tOEQC0bRNJnLhJkGfGa9XQwArlqn37GIrPfdWIMrfElQxd0
	KUcH/5yyXBYTjS1O9Cf/ayATQfV4q22/4dwmw5ZVeMLHhwc/sz5aTqTY
X-Gm-Gg: AYBFou3a4aT70OZe27iCKslWksPYabrfCJ3AMa1JlLdyTycbaQ9aI8t1zIQja8Gs7uV
	IuuI3OTmJcfgl5ngGHgfhb6tQ/y0M2ah8/VGXOKdtT2QS491fjAaxgx+pkv5Pi2nthEqh1jyQaD
	eWQmicdCKccYXVoLlKE/gZ8DVbNT9yhpSk9CwzngP/4A2pvBVqI1CxI+EnKj8WhQsHGl2Tb4uLM
	qKfR37Yk2NMmVuuZPwqQLolYtakEf8Xi+ZuXmT3NRXa63imcduPEjERsfAHHxpzirqv/pOBJAxn
	aBypPpCtZ4CNisyroCwFG3T+c9EkHDI4jAsK5zKrAcCq/vAjxcLIcENQxhj83tRstiSjnx5S4fM
	/IkYWYHHzmdRZVAmQ/LKOdjUL0EvmLq1RJpBYcnO5weYmD6i05SERr7FdyPXn3MKJBwd4UlE26G
	dy1WHqXmJ0itshWTiUXmATs371zPBGzWf8YjC3P6lGPfq94s4BauEh47nbptiuigucxSvezb1Tq
	eSO8gj8CmypNCCHK2K5tJq3bf2d1GyPqHs8dJnwlB04q5lge8kHihqPb1pOS6/lonbjDO4kPqFY
	bpeSAU5asQ4m1e0/L0ESlB/84YCankXLhYI=
X-Received: by 2002:a05:6214:dac:b0:91c:7bae:44d4 with SMTP id 6a1803df08f44-91ca4b8ac36mr101071016d6.49.1793481626582;
        Sat, 31 Oct 2026 14:20:26 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca805239esm50019006d6.28.2026.10.31.14.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 14:20:25 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: Ping-Ke Shih <pkshih@realtek.com>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v9 3/3] wifi: rtw88: time the countdown downloads from the TBTT
Date: Sat, 31 Oct 2026 22:20:23 +0100
Message-ID: <20261031212023.3296837-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <6a4c37826646abbf833e49aadee7701a3dd4e96a@linux.dev>
References: 
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

Hi Luka,

> Could the TSF also be read before rtw_fw_download_rsvd_page(), so that
> only a TBTT after the download started is taken as one that may have
> sent the first count?

You are right about the bug, but the TSF read before the download does
not cover all of it. The download is two writes, the whole reserved
page and then the beacon again, and both clear BIT_EN_BCN_FUNCTION.
Measured on an RTL8821CU with a sniffer, from a TSF read just before
the download:

- a TBTT before the first write (0.75 ms) sends the old beacon;
- from there to about 0.6 ms after the second write (2.9 ms), 82 of 89
  TBTTs sent no beacon and 7 the old one;
- later TBTTs send the CSA beacon. v9 reads the TSF at 3.4 ms.

With a count of 5 and the TBTT forced into place:

- v9, TBTT 2 ms before the start: count 4 never went out (3 2 1 on
  the air), 6 of 6;
- TSF read before the download, TBTT in the download: lost in 5 of 6;
- without the back-off, so that no earlier TBTT is taken as the one
  that sent the first count: no count lost in 12 of 12, with the TBTT
  before the start or in the download.

With a count of 2 in the v9 case, a Windows station re-associated after
each of 10 switches, and after none of 10 without the back-off.

So v10 drops the back-off. A TBTT in the last 0.5 ms before the TSF
read then sends the first count twice (4 4 3 2 1, 6 of 6 when forced
there), and the AP switches one beacon interval late; the Windows
station stayed associated in 8 of 8 such switches. A lost count is
worse: with a count of 2 no CSA beacon goes out at all. I will check it
on the 8822CE when it arrives.

Mehmet

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794697008;
	b=u/ocurJV6N/pe+ENo/ERaArwEL2LzMvfdrH2fx3YY5XllAKUIYKS2s4+R3DbUezO0cSY
	 wb1JIVTfqk6+ciUjl4ZS344kiWwQQ7cpXOx+XddzkOdU4H30rqhxWtcRWzVKw4D9EWKUL
	 y90m2SOqTph3pUivXn8YBG1OAYt97EjfnLiJiYNAgTLETWpOkL7akeExor2r6nGpuwe1N
	 MWGo8qfufXaAS7XP1HMS8ocNjbMYee4on4/7ZuIQsDi9PT4QKksAGkeUvIo2qMpcxobfr
	 rPiJzCpFtvSYSBTE1xszJ0DFKFVONcHjOtEKy8Kexbyo56Wr4INGwuBy1UMMZkN5tFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794697008;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gQ8gDJLRQlElR0wWw/QqmoQfKumrgn/Rw4A6LOdpZ/8=;
	b=DujR0ZtYl0pUx7taWAOIQRA353yDg3xgApHDIHehF+3dOrjyvuitBTmb1qnHmsMcjzXI
	 j389PWDPPhvtcV+r9OgvPuH0Ohzrz0ABKKRsoTIh87GsseAfO3OrYuklcS5sJ/tdXm5Ov
	 ndbhwfmz48EZKKYwMrv+MZdcJuTX23+Ix4SK31tKmT0twEkg9tqdrFPJ8fnNPBa+ETOtb
	 VeK8qWgjwU6DNF5WtoMXx3akmXLETkxS3TJfFHUiOgmw0xH9uZ9XttxUIss4bNP+zf822
	 vkZNIwdvZWuj3QG6+EsbjhDfCGlXxwHeqfYB2HBbbuHc/i02Rg5dXdt+mfnnw0zj/vQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=dxsXFo9v;
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F905606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 22:56:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F905606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=dxsXFo9v
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b56bbf8330so3164391a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794697006; x=1795301806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gQ8gDJLRQlElR0wWw/QqmoQfKumrgn/Rw4A6LOdpZ/8=;
        b=dxsXFo9v8Cceh8DUkimonj6sh6I9ELXwgJRVQvLl89FVICkNoNCOUhu+75CYtjjgsw
         B6AkJFVAhuFj5d5+UTrbCdYiA1jdTQJ4Bd3KmmGeXOsk0D3ZBlAS6807VghOboKA9oiY
         RK26PO39NA+NuzRtVrUVmjH8H2gTOr5JnU7zIziIvxqpzduKAafSUel6lVctM2jGEcPH
         QWkU2icUjyKRJVYScMgLZW+FKYb/ciH6V9DDp/SqThkczXdp34/J9ddbcHrnPKVTmn5M
         y52jb6nLBT01EljK7HVaMqPfHbWZURKKmMgv1SUgZ+d/YCAGH9XNamhxjuJ6FZwZrafD
         aVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794697006; x=1795301806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gQ8gDJLRQlElR0wWw/QqmoQfKumrgn/Rw4A6LOdpZ/8=;
        b=RJhNRXLD8UqqlrnMJoZn/MUP4FBlmbwThJh9MBdkHfJ3+Jcddfef6NJcDUX5kY1C7X
         1n+Tn4lJSM2GcYAN4G3foE4D0MZ6CSkFklRicUSQgIFiTY6UrQtoVZqTzRe2L5ck4eeb
         RXdPG9+rUGuqoP2ndLQjEYLDy0/dfTkX2wlu5YPiS3x3+UPYzmiflSM4arh9puarnfm8
         pPhcXOtWULEo+BbdyaKqGd07JPt3+j/f1t6xYQXbQrlDD4KeukNOB9BTxK5Oo4hI+mhe
         Fo4aWx89XbaXRBUDwFHdFBiY9WDTBGv09lybMFp3SFY5ohVlvs/X6vLOg76K7646LI/V
         jkHg==
X-Forwarded-Encrypted: i=1; AL+hErFO7tc4rZMFVsuZMFH8fmEph9k3TsP4BqfmvL+jqj7pVtj09KYs7Buf0eRhuddAP3vYhruO47WyCgDGjRk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jRR6wY7vAOsexmuT3I+j1Gpl8zANGAE2JjCS9oPMr0HwpGo9J
	Diz+uSZJzE9MfO85tJUBRaFTXG7I2n1NX6yfNlvs2LSe/3rEmKJygUYCR5HlSRi4AQ==
X-Gm-Gg: AYBFou1BbM+KZ7ZwO8qUa64T3/I9ckQJ9D28LbvLGgryoCA5x82QKVHUlrHqGNh/xp5
	e5ao3PhXlcCVUxlE/E9uMMdHkP5bhY7qnMmPiyk1ftZkmInynYmTAMeq3fbajwOyY/LVFEYIoU5
	MXrst43nWOLN2TAju9kIYTRgNGfaB5YRvQPlCBwFH68sUQnYXwNWgHr2BJiRDwOuzA49KuUyvQJ
	DhxXWaLql0cYtt7O99zqNReWHpFrA5/dsjWMp59SxjLMCzimkzWhlEXSYtMfNgQt23NcCh2M1+s
	EMUQbdRdNvfCwITZfmIU+JzSxuY/O9LBRDSqr3xO+FcJTkheKg/0GgAvFN0MitYpY2t67sKVxKW
	T0j1mWgywlgPPCU6RXvqF/gEtXKKh1NQIwvOJzSMF2QSAAwqRjulbTk83qbwZod2YWazG7GVKkQ
	d5fBqh6bIWdNv8UjLKpT1NppN2SbyujTQpMPh+gOEHgR2UeJqCd+12DTdpDt9nIPZy5c3Tz+VVy
	MMNKjyOCkblKTJgWy1Z/QK48b277Yn4TdNObA6bo/+MYNfdNz2jhWOT4TSBnHXvyrsVIUTsQuFM
	bvaD7X+GpNwDE5WPiLgq/SszoFXOi8NJ77JLaG4N7RYPaXYBYo35eCHolWNxgThazPSbg8E1WJV
	1RBDAumr7qURFkDQ76XLqoa7jisKlGOVfEHZQBCK2xWJoo+lHlx3XH7jfqNIVoXB9hQ0f2HpCDg
	1f0hQOtWIdgRr1nJ3aQXoRGVld5Poa+E3cyJIEX/CRrr4UwYDKIpOsp3AflQpduOP/8PeNyylQ2
	36VVNORTrEep93g5BGGk0MBjebGVGulGGK/V6a4ZGOrKKwA0kYsgI6Fkw9F6cl+6ZgHWu89oL/o
	942Zu4CMCJlVbZ3BRVk5BaN+I+hWsEe3VVLt5eXifCafh2dCPFcc77hBZrbIWCBh
X-Received: by 2002:a05:6402:14d0:b0:6b6:e857:19d4 with SMTP id 4fb4d7f45d1cf-6b7c0bbc8ffmr4343531a12.11.1794697005786;
        Sat, 14 Nov 2026 14:56:45 -0800 (PST)
Received: from Desktop.fritz.box (p200300f24709e8006da21e9e53ecde1c.dip0.t-ipconnect.de. [2003:f2:4709:e800:6da2:1e9e:53ec:de1c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23c757esm2751595a12.17.2026.11.14.14.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 14:56:44 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	John Crispin <john@phrozen.org>,
	Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Rajkumar Manoharan <rmanohar@codeaurora.org>,
	kbuild test robot <lkp@intel.com>
Subject: [PATCH ath-next v2 0/2] wifi: ath11k: do not fail down transitions of the station state
Date: Sat, 14 Nov 2026 23:56:41 +0100
Message-ID: <20261114225643.962015-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
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

mac80211 warns when a driver fails a down transition of the station
state, and ath11k does so while the firmware is down. Patch 2 fixes that.
Patch 1 is new: with the firmware down, a key whose removal failed stayed
in peer->keys[] although mac80211 had freed it.

I used Claude (Anthropic) to help write these patches.

Tested on an IPQ8074 AP (hw2.0 AHB, WLAN.HK.2.12-01460): the firmware was
crashed through debugfs and the station deleted at once. In 3 of 3 runs
with this series station del returned 0 with no mac80211 warning and no
key removal error, and the station re-associated. With the v1 patch alone,
one run logged "failed to remove peer key 0: -108" and "failed to clear all
peer keys for vdev 0: -108".

Changes in v2:
- New patch 1.
- Patch 2: continue the host cleanup after a failed early vdev stop and
  a failed RTS/CTS update instead of returning from them (Sashiko review
  of v1).

v1: https://lore.kernel.org/all/20261101174422.1275413-1-julius@bairaktaris.de/

Julius Bairaktaris (2):
  wifi: ath11k: forget a key the firmware failed to remove
  wifi: ath11k: do not fail down transitions of the station state

 drivers/net/wireless/ath/ath11k/mac.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)


base-commit: 1be6c8d3027d4a421dc46b93a89a196c61945614
-- 
2.53.0


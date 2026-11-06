Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793994506;
	b=IR9zfGcGfJZuS0spum2kyDab4L6AEhJ59gzM2KtfIQnY7jXTRGjFxLYgAB4n2Uh7MOe9
	 9p48Dh0ro+PV7kr6jHkYMXb/sVt24VNP68gYN0M5nyD/QIU4SwDay37BU8cKJhMKn5KU9
	 l2VRaZzGIxwJ53P5FULa/rNNULgrGJG0y2i14OtcjoHVlB5b7O/Mtu1Jqu6CMumls+a3s
	 tkGCtqqCSYOZrtyHb7xsV9oDevfWKEoG/7ImRYQvRPY4m1I+5Hv3AGUOSj3r8XN+O937V
	 SW4kjHIjxZDXUhGZwmhftl7YS7AzcUNGb9UlUQ47KrBP0ZEnFeubIvzzfeWV4LcK01g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793994506;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=I/21Es773AUDvFmxDpw0bwxLoX1T07xfM8g2Md/BJQ4=;
	b=rr6C6VjzQjlmpkhG7UTHXzOK7G+VeRWdAXNYyRFjm7RA6YyPyE+Z5+eg6b+bL4x9nDQw
	 MVRIXcH5w59J/yDn1J6v/xBsHaveQI56C+3Lt+8EwNepCZyE65yMsqtgOZZjUS+wIUYYl
	 REvuWc+G3lwdvZttra2d6tM0mjk5FvJEoelRJrd3AisrFvK8LQ9S4rq2Dsv2FjCELq0+/
	 yb+dTtEuM6qiH4FS0HBJygGSjl+9HkQLRLHtTEEGQiBJUzLMhRpY/UPXaO4U22CVVDAR8
	 P34NnNUUwpI8c1cN/ScEpKXjjQl375VdKLPAgzgetM/92HKTUTll/pRQ4YqxTWjUZ5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="rC/vlYBA";
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17D4606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 19:48:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A17D4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rC/vlYBA
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-491846221ffso927470f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 11:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793994504; x=1794599304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I/21Es773AUDvFmxDpw0bwxLoX1T07xfM8g2Md/BJQ4=;
        b=rC/vlYBAxEILAObsPB3tcl+bFuhtNG7RLstWYCnjjx2nBh4dndY5yFt6tE7obdPcC0
         vcQ6/Bmt/U2uWAAAcznQhNK5v6huZqVaA1kskZIo9ZOaXtA4VA/tNufCk80J/2xOOMS0
         cUFmzpOX/ZrAxPMGUxDMNDXnoPMtO9YtsDIi2FX5fo0fAGsib8Xu6pcdsWQjdeqh2J9P
         zYRjiRPdNGs9yxI9xGUX91h5qgeXdqWM3xHJomG9oXkfnx+Ov5RgLrUkbmP+ApOwj5+x
         C/Xp8K/e17UlhCuf7cq2Ga1VPW+6gIcc8OisRssgTgq+TpMI9gjZ1CWWFyJjw6AcpMPv
         pL9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793994504; x=1794599304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I/21Es773AUDvFmxDpw0bwxLoX1T07xfM8g2Md/BJQ4=;
        b=b2nWKV7/xxMu49R1o7auDPbbo3vx5a08NWxEA1foI88ZcHVeW+Se4bJ/eVP7SwFFcR
         WDMyeN8U9xv9jFNKBrWmmpzZ9APmyZmndRJSxkTdYCn5wf2zJE6B5chi/Zbbkhw0X8zB
         RIR/vt3lqpZ/ZZnx6yRXc5Yme3OiIHbdoXvJBNRdfjlHvHNmQvPhWBCwRVlYvddRysLh
         QQKjMTL6wwWx5nUUE+BBhpa/EjRxKRp2bnm5QsGi4dwkEJh244g4OnGgpm5y+T+aTjk3
         ahaI465kmuw7N4/7gN3uXfy9vQGWcWH+Qps5CZlhxtmgJ5GyqcYqQVa2oaA51qj2U1T9
         TRJw==
X-Forwarded-Encrypted: i=1; AL+hErG1t1wCChYfVO1qA/zzFwHz+enI+bEPvTHE8406YdTkseT5PyXXV0p/UhRJQomCypvDjj5hQXXNxt61C7k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YKTxSrB2wjLVZuBmxm+dWTG/eZ6D40yKncIzfGeEDGZEOc4ct
	u30Bdu+d6iiuG7jG3mbVg4f5vpuX+g2+7gioWR/jz6HHfituXQOA2oSB
X-Gm-Gg: AYBFou09fcimZwcbx0At1TLkp9D9Hg0dI5ix5tZ1hb6n30f0djrPuRm7/6zsz4g70j8
	is4g4E+Dql/Qjgxze2FFxNC0ku8IwEf/H2UuAa+Yr9XFbxc+F0BZTXaICPCTtK994MrY06B2Rwe
	/xnLe++PxNpeyLif453QnHWeAa4ix2q0fUHc5+Z8t6NmesC6Bj0vGzInsc0jR+mQVv1cGk8L6vb
	/U3H7PkX08qmy65qvkaUAToJTbnAYUZ3u2UiavkzPq0gxDV3ZOXtGA6CpNjlS2FB19kdcvwDoai
	qNKV6r0xihsqlcQPS3dQ5VoW8cR3H0sDya3pp/vRPXTqoxPceB72aBT5nfDb0ZmuOcNcDUAw3rP
	4g9jiVQ3QJKbTvgu7fh+x0HgdHcvIK/0qFlyOFGmpeL7XFrLlKocqoo8EJacS0Pw80eAuN/3xdj
	TIJ+bwmc/TuFPHRt/E1qqyEEMxXuIVxG8MJnsMH4U1lQXfHY3gPj2PFE4JBWkthluBvLj4OO+nk
	sE7KvhhhoWyOZgo5XGHXTEsYKKaF+JCP+kqgZeI57jYu1hGUryU2b7v3KLOhf+DdlHnW+eYejPI
	+Ff5BEeUGX/2DqN584Oh7Ko042M03MQ=
X-Received: by 2002:a05:6000:1acd:b0:490:9fe2:6a39 with SMTP id ffacd0b85a97d-49275fe4e8fmr6979074f8f.20.1793994503735;
        Fri, 06 Nov 2026 11:48:23 -0800 (PST)
Received: from hp-z640.fritz.box ([64.43.161.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d73286cdsm4928130f8f.28.2026.11.06.11.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 11:48:23 -0800 (PST)
From: Owen O'Hehir <oo.hehir@gmail.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Heiko Stuebner <heiko@sntech.de>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: Re: [PATCH v7 00/19] drm: starfive: jh7110: Enable display subsystem
Date: Fri,  6 Nov 2026 19:48:22 +0000
Message-ID: <20261106194822.4153919-1-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106-jh7110-clean-send-v7-0-68f7ea9913db@samsung.com>
References: <20261106-jh7110-clean-send-v7-0-68f7ea9913db@samsung.com>
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

Tested on a VisionFive 2 v1.3B with this series and the v7 PHY series
on next-20261105. All 24 modes the sink advertises set with modetest,
from 1920x1080@60 down to 640x480, including the mixed sync polarity
modes 1680x1050@59.88, 1280x800@59.91 and 720x400@70.08, with nothing
in dmesg.

One thing outside this series: the modetest pattern showed small black
bars until I wrote 200 MB of other data, which pushed the pattern out of
the CPU cache into memory, after which it was clean. The U74 has no
Svpbmt, so the dumb buffer mapping stays cached here. My v5 run had the
SiFive uncached-alias errata patches applied and did not show it.

Tested-by: Owen O'Hehir <oo.hehir@gmail.com>

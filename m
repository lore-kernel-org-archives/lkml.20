Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794818497;
	b=LPCe6fuvzU8CoGR8Ah13DyXFAXKOw0SqpHpC+RH34ZMwzyqMt8EuIOPxirXvW4j+XlHJ
	 OcHiGnV09lOKQ455GIigPITAU16/hOWyNN6Cujt4N9iGYQxSHtnmB9eFBFRcpb/OTcjB0
	 7I4LqrP2n8g3s9HEo8oMTIRkDGYGRKt8M/IC/VEZZDAQYuKVxKy+yFzaspiVn4nHu4qD2
	 y0GSieizxPDEXK+MjoLAy8GFzr73wuxcFsOltNepvolMFDkeEzyQXDV1m/TiBiK+/KJHl
	 qh5ijPjcpcxRQBGgMJboB+zJYJGuoJ17rwld2o5PssoNHElqRB4R5xRDWLr1wc8u02g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794818497;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=P3nMcjWv+xj29nx8pWfGlhho4ATOaCrbxLj/pbD7y/Y=;
	b=mhGf6KMkdztxLFrl/Bz3Zv++E/87RlVqhecNcr1yflEiITTjgQMDo2j4AeM1ITLGVs/d
	 Rgf4woetpHYyQAlbDtLb3bw1GZY5uGCwaKDnSuvuIsgcc1rV5MRipUYzeaWMF9LT6r6Lf
	 TyYQzG+E8EMbdMZBL2J+d7/eCG0Pp9rIwP4lwTNkOaV3d5BFxqzpA9+tItw0PFbnOri55
	 HN3nDbBMJpJMiOywSfKVbhExTudt1yR3NaXQyYjGOJ8k4pSujDG5U2SDczKtWM/6xikhQ
	 xy4m/21GAoQotKeHnGdnL/z36KKx0Ux/3nCON7lFkqbnkXaXWoNlRUUh60+vhuxl7TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZP00IxpJ;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC7C606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:41:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDC7C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZP00IxpJ
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a68f888a41so2182955e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 00:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794818495; x=1795423295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P3nMcjWv+xj29nx8pWfGlhho4ATOaCrbxLj/pbD7y/Y=;
        b=ZP00IxpJab14kKuRe88DihMZ3sUGLLnAMoZbx6Kfw/eLGuEOaKx/tjV0jOXIOl3pQZ
         Uj7XXlwgBYHGEFZDvny58xVO230lxGiGvctM28rK3d+IBntRZxpQPLZUOUgw63x2iwKs
         jHaUfpoqubX4l80Db0RtAhYQ/O53yLrYu7P0rhfryHreBVsprNjewnuwhGfIzZTleO5w
         HSTtY+8UBL1aWSM+9/b3UwVyTx+hsoHZ4+DKhotoGZISxO8PgLuqLeUIY4M7Jo+1zMc9
         iYmYe4Sn442PJKjCzAbuRm9fSjl4FszpAWcaaeGvBntjfXbCVaYuRS/VmwAwGmsiAMmG
         Zrjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794818495; x=1795423295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P3nMcjWv+xj29nx8pWfGlhho4ATOaCrbxLj/pbD7y/Y=;
        b=L3QScA9MY1QVp+Ziop026ve2PQYs3vWfmmzzi5ji2+1BvU4mrn2EjJod9c9skLxHWt
         MiX6oIkYsnsWw2GjJtIj9hVRi+LOGf4DUtpyoRQf/J1LssGkqXmv7StFzGP0QujxbKVY
         SzHgURNkg5L5ptTqIKQg43UJX8Pzt/MLn53bDohyWHmS27ufOkLeu5vdPL8lPL72kcVO
         mUjTat2hpWFgeMR5uhE/KShzIXXKqGeVRq2rGJmiHs+90CkRc9nAYx4eQIJpgVqExQCt
         57IZQ+DBpip0ZwrzI07w4OSijDo2QUa7pEh5lWV6pCK1fXNV4Jna/kMD6vbN+8LMR6qp
         KA2g==
X-Forwarded-Encrypted: i=1; AL+hErGFrdRvcgjE6YN+kCr9wYXCEmd8X3cufqwqYZi0QH3jGWzdQRugiqP0LcfhMZ0Nq1AFTYLRM7Ei3NWs+8g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VRf3Gv8BPV8CEVJLlQayFXbmXmtrZzvQOLtffu0cpgrzTJyf+
	Qxipjjhoq/Q30wjPiYpIgqAQCHADsba4tl3oaQBLqzHtqbhfndQ1jnCL
X-Gm-Gg: AYBFou0efK3DxcsTHSDanweLayZDwjA34bMCf5svHnyWlYp+gFehGJQiGVIJHM0N8rx
	0OLhHM9UkGm7l5Gz1Th9NitvE8ByLY47QcINs3WnkEnGwoiRFoTYv5qHl9pSZufmE68535fv9IR
	k7NQylb27YzyMWnhZHJNK+tyeeN4pAby6FmRwb67jQIDPg1CSzx7Uf06tUBD1szRfj0rCCqdoaL
	4q4M4e7D8kVwISMol+H6Zu3520oaa2C5iov9gu+oWnCmvHgJaqG2UtJugICs6giJsRY3/WX0kBm
	biBhkjaIOJSUbMK6vkxd/PW2F099jhBGEmJLcjyZf9D+qwVkRcU468yuQl53fjf/bbjWMob/s8G
	IDz+Cd4ZKFBWU4OZRDfewzgFKHKm64C+ceNfM6RstzvfKsqdnthze6nHFWiti8jKBYERB+65W/E
	mC7hgWYZXpN5QTHK4RYRgUgvqe/ZqEJ+TLmVHz4ZTEyAO1P3dCtRTGmQbdYRy5gF7ES31iQYMlK
	s9+4NxiTfGNvlw6HC1/Bf+wccJBlnkYRSs5LJZVPzL9tphqZc+Qfew+fi3ZHijPkja7dhWxNpWZ
	IHqYCULO5n+XTWpRNvy1O5kln1OzQBFuCTib/aKMSsYX7fc79u+gfnidYCL/h8u0LKR6/PUH
X-Received: by 2002:a05:600c:8a17:20b0:4b6:2242:d0be with SMTP id 5b1f17b1804b1-4bb5599b367mr158884065e9.0.1794818494950;
        Mon, 16 Nov 2026 00:41:34 -0800 (PST)
Received: from Nuel20.localdomain ([105.112.221.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb62d5ec30sm284300555e9.15.2026.11.16.00.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 00:41:33 -0800 (PST)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: Tianyi Gao <tianyi@cloudflare.com>,
	Hangbin Liu <hangbin.liu@linux.dev>
Cc: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	kuba@kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	skhan@linuxfoundation.org,
	Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Subject: [PATCH net v3 0/2] selftests: net: veth: propagate check failures to exit status
Date: Mon, 16 Nov 2026 09:41:05 +0100
Message-ID: <20261116084107.6675-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAG4wq-cd01i7YrcFPmma=BXUcwn_PK=wneKW=vyEBYzQ3Bn7QA@mail.gmail.com>
References: <CAG4wq-cd01i7YrcFPmma=BXUcwn_PK=wneKW=vyEBYzQ3Bn7QA@mail.gmail.com>
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

Four checks in tools/testing/selftests/net/veth.sh report failure
without setting ret, so the script exits 0 even when they fail. Fix
all four: chk_channels() plus the three "bad setting" negative tests
spotted by Tianyi during review of v2.

Changes v2 -> v3:
- Add Tianyi Gao's Tested-by to patch 1 (thanks!).
- Add patch 2 fixing the remaining three checks.

Changes v1 -> v2:
- Correct Fixes tag to 1ec2230fc721.

Omokefe Emmanuel Onanaroghene (2):
  selftests: net: veth: propagate channel-check failures to exit status
  selftests: net: veth: propagate bad-settings check failures to exit
    status

 tools/testing/selftests/net/veth.sh | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

-- 
2.43.0


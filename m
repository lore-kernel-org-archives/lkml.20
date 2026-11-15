Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794772417;
	b=XMjrVr1+yuBsDVuIARxVygXaPxOKXYP2WkL3SxXSnM6B8GqWc7uihbRcHbSgHdK00+w8
	 Q+yeDSnwsyzpKFM+9wgv01PIa7PN2PfTYEgTMN2gEWg/3INGSVUUCBLmlyrxYYD210M88
	 J049kr+8D6B80gF0rqAcvTvKMKB57tQLlCitGBoWyTjkSuDvo3CbNOW07C4lLZdTHiJPj
	 GrMsgsuLzKH1RHPLHAP+l8qqMKkh8STmOdoT4G4giKb81TWu6gODhV6UahR57r3JZQ99m
	 CB959zF8waaXvOYVsLOOfByorOMFMBmbk+ZD0W6CPC6hiQ9mEqntiFsYCot46PiNOkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794772417;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NG+dV1vzBAA0WTXtplktelRpJlV/CnJBfii0WUODBd0=;
	b=szzitBoX+wTnQWDK8z8G+x6PQW7+7YjtaskFaFEvUJs6YlknXdEpV+x1pgFJrFLAMXiX
	 EHo7NbWdCoN9FXmrwsu34zGEo7JUqJ0JRK4bABqD2ujSxTxCBXJND+Mve49uzw8jF2YAD
	 daVZ1XnRFwYxXHmqT99/K7noDTZA/C0EUwHUFgcrLCayE7kUcNTyH7MmJazFtv6Q6XNA4
	 oG8ndL8+0JZF0sDYyplN3URpbFGcwdsoBVGcIdpImRWzc9+v3tAZBBZ0jx1pxAVeiPK3u
	 H7eZRyzLz0knfIG7DWSIVU17w/SxEWZkY7Xk4PG8hs4a77Cz8neg0JMnm+dWu3smArg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="kY3/E1YZ";
	arc=none smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267D5606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 19:53:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 267D5606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kY3/E1YZ
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b30ff12f84so16875167b3.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 11:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794772415; x=1795377215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NG+dV1vzBAA0WTXtplktelRpJlV/CnJBfii0WUODBd0=;
        b=kY3/E1YZiXjLYzpt8f4chxg5H47ilbSO/Z+cjEbZ5NBMIDzMLGidnjZzJxnxHWvOp/
         ErC0dEA69DbXttreubjS7g3nHQRS/U1axGzQHD1IYISJbtS89wkbAtt35N2NJ6kSbvBS
         xcCnwbZfGfUKNkwXqMtMik1ui9aBLw9KCmpoPzjPzJeGWbg3Is+iG9T/sESyLCoocgqb
         hIkfB+xEL04KD6SttAl5+sFik8c7ZrPzFvceT7uv9Jj3/ovI0+VWqGJIot4vyk0xdquD
         VR4nGl7xhArdaqihx+A832uZRLiLzlQnc31kF5wvV04aZsctJ445Y6ha/wfHC3TwEfoB
         OClg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794772415; x=1795377215;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NG+dV1vzBAA0WTXtplktelRpJlV/CnJBfii0WUODBd0=;
        b=PKUAk7pVaQUxhLMUazT2zb/1FIqxJ/TB+MvlZryqT/Nome+CAw/BNZ4Vv3AAJHw4Ev
         nwCgzlZVOoA7/WpR21lDvs1FPxMQmHh3RKVYxnK3paOPO3Zht5MN4pPovWLV+YsZVrcA
         hx398FbnuIB6QQ/TPOj87hEDcBJSHAVv8fIzdHFqhwSQ/G/XY8hlmg2+mlnMmrlIqObZ
         HvnUx7Qheti28xjNyR1KkHZzGMbi8tBWEPEsk2MtWgEUf5Sv5Hz4lv4CRuuCtT1x/4y4
         5bAatZkzVPZZQQ/UlmOExXyRFiy3/PA/3qWW7CYrL5flcSocvarmF7LBy73KinsXyOGh
         GBow==
X-Forwarded-Encrypted: i=1; AL+hErGo+tkEKiHPLuaOTVNO7JpXlJXtBIx+yhmic/0tsuet/mS2dHGtaS0xbgJwWVF8siD08Zs3k3kw1m5n5uc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1iVTTERjp5bYduAWNFBTKhPMXZqLHUTDNEBeYtGOKzLI10fBS
	UyHjnm6GGYeR6wTup/AVZuJR71Fa8OexDQERxYAiLCxOh073BIsSsPi/
X-Gm-Gg: AYBFou1kCK0GPHSNOPQEE4fi+gk6yShXfBJPPkafIvi9Kn7oItSA4aKLMf+jVYrDMp0
	nh3ATwuWJQacj1Wke43Y33OnKLOxaT9o8DSViElbpE+R4q/em8X/cf3y4p5uA4ZF0T8TSqWo7/y
	U2bCcD6hkb2C9ZeVTRISCo3hdWENvxOWdPSzf6C/Y8isDRMvMI77mqol/QJXkOHeoHM3dSVaVy8
	TlVj3I0PPgw3gQ9NbgMs8Mzi66+OWIAKe4z2G0oN1qqIV8R8LNgR6iJa5MsK0VBTERnHvEM8F+v
	wp8Yxhl9nbeb2xM1hsJSjkI9HxTuGt82EZTUKzAhfFHr+4NssYXVulTlz2Rge7oQzwxQGrxvxS2
	xsh3x1M65CgEAKa0UxpgCC9I/tIL/Ep8g5nSaQwiBfDnIgkhnQ1PVjLYzlg9gWlrvzSBNIqSIbI
	oqakbUNpMHXNZST9U4/fLSQ12Kj82Q2nF5g5huQ3s9LkVjYk1oMFu1GYI9Yn+YxQ/BTI/5owBat
	JK72exYq01zWauzKuvVaWni5iHGP8qCb+ktLkgtezM2DiFHcN6jJds7Wpu/ZmY/lmZFu1AkRvP9
	PpwPq1ZEh5nNYVlZB02Z+hdIE4CanjWKCts1c3R5ddSyjbE5eBP9hqzxj3eLzoAsAm3+YnY9p2a
	P/BVCJvaE7WCC69zDDotL7a+XMZaKJ0RzovAE7fH9bT4dxAhlFQ==
X-Received: by 2002:a05:690c:e089:b0:8b4:deb1:4aef with SMTP id 00721157ae682-8b4deb14fc9mr347347b3.0.1794772415144;
        Sun, 15 Nov 2026 11:53:35 -0800 (PST)
Received: from localhost.localdomain (179-252-148-65.user3p.v-tal.net.br. [179.252.148.65])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa9da90bsm69816367b3.37.2026.11.15.11.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 11:53:34 -0800 (PST)
From: Artur <arturfaleiros1254@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Max Chou <max.chou@realtek.com>,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artur <arturfaleiros1254@gmail.com>
Subject: [PATCH 0/2] Bluetooth: btrtl: Don't return NULL from btrtl_initialize()
Date: Sun, 15 Nov 2026 19:53:11 +0000
Message-ID: <20261115195313.20809-1-arturfaleiros1254@gmail.com>
X-Mailer: git-send-email 2.43.0
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

btrtl_initialize() has two error paths that jump to err_free while
'ret' is still 0, so the function returns ERR_PTR(0), which is NULL.
Both callers only check the result with IS_ERR() and then dereference
the pointer.

Patch 1 fixes the path taken when reading the RTL_SEC_PROJ register
fails. It can be hit by a controller that times out or answers the
vendor command with an error during setup.

Patch 2 fixes the path taken when allocating the skb for the drop
firmware vendor command fails.

The two bugs come from different commits, so they are fixed in
separate patches with their own Fixes: tags.

Testing: compile tested only, on x86_64 against mainline commit
fa2933aac170 (after v7.4-rc2), with W=1 and sparse, without new
warnings. smatch no longer reports "passing zero to 'ERR_PTR'" in
btrtl_initialize() after patch 2. The error paths have not been
exercised at runtime: no Realtek Bluetooth controller was available
and no reproducer was written. drivers/bluetooth/btrtl.c is identical
in bluetooth-next, so the series applies there as well.

The bugs were found with smatch while checking the Bluetooth USB
drivers. The analysis, the fixes and the descriptions were prepared
with the help of an AI coding assistant (Claude Opus 5.5).

Artur (2):
  Bluetooth: btrtl: Return an error when reading the key id fails
  Bluetooth: btrtl: Set an error code when skb allocation fails

 drivers/bluetooth/btrtl.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)


base-commit: fa2933aac170dd19c6a7f0d7b81a8f537e40915c
-- 
2.43.0


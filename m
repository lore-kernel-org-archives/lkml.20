Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793603501;
	b=2OnwrYXTOOZC0ZzEwxYNrUdCXLULC0FHnvJ6lPav4m/tr3o0zEtU5rz08X2G6DRMxwSS
	 3qqxkmET5852m898Rmt426/uTAm/uVm23cCVyrIs4kZ1NQcCS944QEBD0BD2yORttlLkC
	 BNM2NKHWEDHLZlIX/c3yFMe/URjRyx8HcPRx72tZueKvxCBpHbs8/OlWN3bmDVP1CnmCC
	 la76tib9CDVJX+ZUN4aLq6/+HR9+VVhr1S77Zv7dYyO8XQw0rRfcW5BUuMyxiiAh3SPm7
	 DgdV8Z41IxDzL6rPsP69rqGYtsBQTnOAK9gIIhMGzVWf2RghC5yc66Fx1MzuAYzpPaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793603501;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cjMrlf73d/dR/H5YIZ+t5tvJwic85OyZY/jSmLYQsrw=;
	b=KZixl7AAf1VQkH8T1gBkc1U2a9yaVxKQUPAWtIv46ycik1Hww5qU3emGsEE/r347Rpt9
	 EHV+HHzkzjhQxKirkP+LsTZ//LyXGlMoUqp001V3B3XPC8xerlujjQ6Ah8O8YJx6cvfwT
	 gm1jmiSNtmXE+NUrURMKH3SycTcY4h7J9Kq8bPydYS7GQuzFUgPgkNlwmGYjxEwT3DHkg
	 N0pccEFqHW5eH1j7JwuuCqDkJtHFw6c+ulqgl4PqCO+PbZqBc7GhRB7nCCXdYyRl0dAul
	 mmeP+grlWwr7/yE3bH1OGP4OX8tvakmvWb4ObUctWVA4u46y0aLy1r53P4gZMAqgGvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hWzOTL7v;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B709606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 07:11:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B709606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hWzOTL7v
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8a0880a46e7so1246669b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 23:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793603500; x=1794208300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cjMrlf73d/dR/H5YIZ+t5tvJwic85OyZY/jSmLYQsrw=;
        b=hWzOTL7vworSJYm4WD+vsFzEKX6ZeHfXWzTOPU0GloELBoLtRif46ODKrye77naSMt
         DUujgg9udXIvhMynOvlSu37TWaGRSYZMaA9Zr7H6FK7gHaln+512j22VOgfztKadEyDj
         3YSAaOuAFs1snDBj/1IQL5bQR3qx36kPvVm3PGUpzXAnenc2ppUvaaMSLo7StnDrVdSa
         xkIVehYfmCAnpbA5yo9L/bTS5cQBc7QmZpEk4bh5l13sLqYi1va8T9vQ97N5heEqfQ5+
         Zu0sPiZefFK+fV/2Io3noHM5mkeEWdLpOPANjghXUZjqFpiLpT2vk2FHjIpRgzM3rZa/
         qPtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793603500; x=1794208300;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cjMrlf73d/dR/H5YIZ+t5tvJwic85OyZY/jSmLYQsrw=;
        b=YirP1MJKwY1ywgeNFI5uy1izb1Vkmyc81WwPcfD7BJ5RLHuU7zj7mUbk/+A20j7+w+
         e5TShg7J6gINzFfDblP305s90GqDe2/RGSAugVxEFk7t21YVQ0DuEe/VHp8VvnOKZOlr
         PzitIfbG4yaoCQNlsu9l7AmtuMJKCb/KOoKgFv6ryY7fS3iNxuZW/ACmFz4zym/Yx/cQ
         FBQN+083odOu5BjTDho3JWD9YFPR/T4oYS5s2tXssUSCn5jWlCpo0mNxSIpi1sPVj5ET
         irGRIZYs/cPf07Vm/sHnma58F69AOmiiCf2HKwZ86wklZkemuo+QBL39NZ1/Osy81LYy
         HG4w==
X-Forwarded-Encrypted: i=1; AKwUvBwbII3AOqymkjhnWwJ2COVwvr65YVCPStuv8lVRozuoWBaWTVJw8nx7IRSE9KFBKaLWIbvY4nMXhXS/WMc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKg6Fs0RYoAA+9+FI+CKvKqZYiQfPUSIseX7jtfeJZNHv6icsxc
	mG1+a/j900BLwsr6sTCcsi3R6zh8EjPuv40cf11IOszHjpSg45gkcrKZ
X-Gm-Gg: AYBFou2iZ/2Ilsb7jkxUdZ6pQ1LbDXI7q/NiX5ZQYVPaiCiTnpf5+NkLtegW98zmL0m
	FY/EiTanBMjDZunt6qvYydwW4oXKvEBTsmkBiVssDC03J3eh1v+g7AB7jrIR79A/IusLPvbWkhb
	ZMuUBAyShI/hcXjojAJ27mbnixV5zhZnZzPrqzVcFzGPEGYZmbdZylDc1dKK3OeST/hr1MllLAe
	JdLbZSr4t2oBfmEtH5LA42sFLzkt4LzY4Fgzebge3tQePO+a3+iEZ3tLoamwQNceLlh1HUd9djW
	MKIvQAsD7qPvwPi6xdPs8ynrsAgkRPnLArT3P6UwU0c3Kt2mkSwaGrBmwKx6Bje3vHhveF1Zot0
	MsjLkoTXE4vHHfkVDY5QGsRXPMONfh2FUMiODBR3ZTwmep153vD9RaNc1oGE1i15jwRcUknmFC/
	DqjVHCftWL8Iw4rTt/MTOll+mAbYBfhRPiVneFxwAkC96At9znBt45PJO9NhM4lsDPTWI+KNneg
	deXgWqZWiCDoARGMea4dIoEsCje0O3amfXIo5MirDnOO6t1sjUS9ffa8CqUrlATovF4vPwSra+f
	Ce3uH8pyGDuCnJTKeeEFXSc2tjUDoiyGExJynHuLlgJCw1gY1bni
X-Received: by 2002:a05:6a00:3988:b0:8a0:582c:5c09 with SMTP id d2e1a72fcca58-8a8322ac827mr8145182b3a.25.1793603499839;
        Sun, 01 Nov 2026 23:11:39 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:28::4:396])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8abab0c6c6esm1140566b3a.48.2026.11.01.23.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 23:11:39 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 0/4] net: dsa: motorcomm: ACL fixup
Date: Mon,  2 Nov 2026 15:11:12 +0800
Message-ID: <20261102071119.3435180-1-mmyangfl@gmail.com>
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

Various ACL defects. Found by LLM and manually verified (on YT9215).

David Yang (4):
  net: dsa: motorcomm: Fix extack message on unsupported TC actions
  net: dsa: motorcomm: Fix IPv4/IPv6 address key dispatch in flower
  net: dsa: motorcomm: Stop at the first terminal flower action
  net: dsa: motorcomm: Delete the ACL rule of the port being unbound

 drivers/net/dsa/motorcomm/tc.c | 87 ++++++++++++++++++----------------
 1 file changed, 45 insertions(+), 42 deletions(-)

-- 
2.53.0


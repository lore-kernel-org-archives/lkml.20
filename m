Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793197243;
	b=i5jINi5S98xhGSvNSAgAyjXeOKtUlznkxp9OzhINJzVu8ZojqgaeKX5HRcSSFCtCCXOo
	 ed1p14ey+/JVGe9dHxMPv5ehAh/bMq1XU/4jookFKuW2xsg1Lo28ArYKSygWPxuoi3h9a
	 WAMPMJQqMk+AKqLS69JOk8Kfm5zGp04asRKbzrauojO3UesuMHaGj8SjYpM3uRmedVpua
	 QdQltllpT53tp0bxps/smWC9EGi4po/6Rguf/bcCXY577d6s0TKu8pEDa9tVTynUaMwET
	 XVWSYO5MYCyJUdW9MiMocJrZn2w/Sw3JcRDuOBo7rQCVpj9JTb4OBpiRGf3dlnCxXBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197243;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6n8IW/uLeuiPSehxbUOrC5l5QcKl9RaPrUD5nySkR/A=;
	b=HLfXgYz7Pt1DmmwNpeQ5HZp7sU30aQadGsirIoAu+LHOpVy+1A1oM5nxHWiUDDMjtBIb
	 /xUShOna0zzkVFSYqSD8OjHx8M87Edng/Gnz6dViR01yNiRv5Ige5O3ZUSIpa1BWLfjGQ
	 5Dm8BS1Mqr16kchHrsuI4CpF1kPSb+JtbwRwF0Tgp+FIG7gqH+0neiZRtrKy+T5xG8Pae
	 bLD7cILPznV0zp7ZP5ZTZYANTv7ekwtocopQjQspepBQMI2+egHjaPfMLsfhmiT13NY7+
	 PVmlBkO4gzqQ3k31xyW6PohJvZ29J1jwVSHm7krimS8YEtu1DRvuTqlAuq/TmlsxANg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="sjSmWs/L";
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9106F606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:20:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9106F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sjSmWs/L
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cd6acc50b8dso562510a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793197243; x=1793802043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6n8IW/uLeuiPSehxbUOrC5l5QcKl9RaPrUD5nySkR/A=;
        b=sjSmWs/LBhPuYyzDNDvi8REjdT7mYhQCsdWh6VwjVLKtvFc3gQXVaXNXV/msBoUS2k
         4OSrqCw/XHsCXZhVzfzBxrZnCv93DLDZ0pukBrTCBf6PC5TkrzMiWsWZGlU7rO4vGCga
         OTNfZjdfUYbD0Vi47ykpTv2wHSrOyeEwlrMytfCTrM+r2evVAFnm3EWxvLfjdZR4RsmH
         G0NlwvCqyEboxkYKLhlqbV4ZssD7/c8yBC3GsjZFu4hiO1bDUJAV6lN2XWMC6JIxMYfL
         8QRxCoKbOnReHNWQ3eK1pDC6wQ23bhjMJBG9tzXr9f84TQOEPK3pXbTFngacazjs8Sgc
         B6nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793197243; x=1793802043;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6n8IW/uLeuiPSehxbUOrC5l5QcKl9RaPrUD5nySkR/A=;
        b=VBi9oAXZy47Zbn0kI98A9MtCHeq65DoyEFVkif3qFkDdLuVtPv5b2bLnWkFYT/PPPO
         nh3rw7oltx160YYWD827gz54strXK3Ch8rCZFyRuJFJ7akxodxeTXvx1cpZ7jgBl54rV
         ukdYrs0Q9oRanH9rqoUI6F/a17/IcgFhAOAEERYlY3Uc/F6QYfl4UzPuNypnF5T0NTQH
         fvD3aLag5j/B96DXVB3ijLp6kz/jzWrj74DzXg/T+kEQUOHdTeZYvf1ZR9QQ7mf6wHPj
         o9ye1Ev5ZJmjk5hvlzK18vaQYxhvd2qwAtNV7w0lFFFiQF86LO1FVMxpLwh/tj2I0ELZ
         kQGA==
X-Forwarded-Encrypted: i=1; AKwUvBzlLdYUwgxQMiGaMSBhMuVKjIcgdA88evNMnK0b4i0vK9wGE22/49zcUgY8FEbmEBI+Q4PO86tOcaR+8A0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLx1SQzIKThoXwACiSnMKvUFpZO7VDWcIVv3mid0sj1rC5ZfJra
	lx625GZtTljVmb3395DSX/+WETMmDaPR7HF+M0/r4Mh36kbNI5r4XRSW
X-Gm-Gg: AYBFou3yywqvslMR2M5WFWPTBs8ju/fi1ajk291+Q8LadM2QXeub6GTawLEuZGyNFDW
	aCSsNLKvta0j5AkDEUzr9ruXIvY97GwQTscWELbfgrpNkcC36v/vCrMV5a01jv5Ci8MIAnz/ioG
	oGn5e55fmcxVPIzQfFH3Wuxs/x3UmnLx7fr4YSOUdXIKgwr4pyM8J6LHivIsC4l2R7U/GcQe1Ip
	ZXZmigT41+gKiVohURVclpYT7niP3cG+cFQ+7PL5VJczlhTcttmLX667o5ugobUuSp0m0iv4V/K
	KkDaer7mqbxYeXiNigb6DPib1wSsUzVED/T9+UqB3jhhdZ9hJpKXOgCVuVB3Ps8pZfuux2Oymzc
	sR6cquzssl3yRIaxFV4rBDsIWnkyTA8rFDJWy44x6QLDYZO308aI7sVAmfWem4WddbWn3/VbnNl
	siq+rO6vdh1rK+DARhHIxMzs7ZTTTXc6VJkW8Cq0/fD0vtVYoLVufGWQjrb65YtZXQeYXyjSYTQ
	Dk3FlIfxXIi2LDRiJKGpk8AEZ4oD1mth1F5+zqiRmWtjyx/gKPcSn1wxIPcmC+rfHtGu2krCRwb
	gEWYcawLtGpMSJYuTXLtesaemRlFVGBEyltnndMrnWtMne8/IyuY6X0yKaYPofj/Zzefig==
X-Received: by 2002:a17:90b:574b:b0:3a4:acde:1e3b with SMTP id 98e67ed59e1d1-3ae57f637b8mr1772644a91.13.1793197242672;
        Wed, 28 Oct 2026 07:20:42 -0700 (PDT)
Received: from KRHW1CJW23.bytedance.net ([139.177.225.227])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a501083sm3765987a91.8.2026.10.28.07.20.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 07:20:42 -0700 (PDT)
From: Zhao Li <enderaoelyther@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Jiangshan Yi <yijiangshan@kylinos.cn>,
	Arend van Spriel <arend.vanspriel@broadcom.com>,
	Stefan Hansson <newbyte@postmarketos.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Ville Nummela <ville.nummela@kempower.com>,
	Jeongjun Park <aha310510@gmail.com>,
	Fariya Fatima <fariyaf@gmail.com>,
	"John W. Linville" <linville@tuxdriver.com>,
	Amitkumar Karwar <amit.karwar@redpinesignals.com>,
	Prameela Rani Garnepudi <prameela.j04cs@gmail.com>,
	Siva Rebbagondla <siva.rebbagondla@redpinesignals.com>,
	Kalle Valo <kvalo@kernel.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] wifi: rsi: stop packet threads before bus teardown
Date: Wed, 28 Oct 2026 22:20:13 +0800
Message-ID: <20261028142015.10717-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Stop the WLAN RX and TX threads before mac80211 or bus teardown. Then
stop coexistence TX after HCI unregister and before USB reset or SDIO
chip reset and function disable. Probe failures are covered before
buffer freeing or function disable.

Patch 1 makes repeated thread stops safe and prevents the WLAN TX loop
from draining queued packets after a stop request. Patch 2 does the same
for coexistence TX without adding an exported core-to-bus wrapper.

The driver is orphaned and the series was not run on RS9113 or RS9116
hardware. Testing from device users would be helpful.
LLM assistance was used to review this series.

Zhao Li (2):
  wifi: rsi: stop WLAN threads before teardown
  wifi: rsi: stop coexistence TX before bus teardown

 drivers/net/wireless/rsi/rsi_91x_coex.c |  3 +++
 drivers/net/wireless/rsi/rsi_91x_core.c |  2 +-
 drivers/net/wireless/rsi/rsi_91x_sdio.c |  5 +++++
 drivers/net/wireless/rsi/rsi_91x_usb.c  | 15 +++++++++++----
 drivers/net/wireless/rsi/rsi_coex.h     | 12 ++++++++++++
 drivers/net/wireless/rsi/rsi_common.h   |  4 ++++
 6 files changed, 36 insertions(+), 5 deletions(-)


base-commit: 25e73f1d6868c759c8eb56cad4e411692c5341b4
-- 
2.56.0


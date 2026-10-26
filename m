Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793010102;
	b=HxYmwiA+qcT3g3FSL+PYyne6alONe7CLg44PPRjRKPx6IRuPfrl/AJOzrqX3055Pxm98
	 qLVMDQ6GTB7gWWqS3Xa06xL39i/ssuuIyG++JXdxv1XXf5s/SsTMy6xltutAvRwMxgIPV
	 9K2JMJT7DXzuSOgbBkBJDIljM/nVuHuEyyh6utAJm4/U5COe+268QIMcJ7IBVZONTveLR
	 hvfIOXfNRQl/tyJOD4Jls7rvJ9SmaKqStNKFwZar3zBhMQzNOEW0fLk7FRrKq5AaA6/Uo
	 468PVLxtp/zwypeBkfm5kAsrDmD/Cq4gjkXR644GyPtbUg4dwv7v5pNzmmHj6qIw+4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793010102;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ekcPeRS4977QsjC9hWodQ7fRVCdNhWDisPpyBhUx7KM=;
	b=CrD/+lw1OZogvQKwqzL6ngU1Yr1vclRFuV1B3Kk6psHmSTuC1Lx+i5p5e7NR9LQYJwvi
	 ANiFCCNZYSKirM8xVka1YAuuTRkNMSd7p7PpgyagiGvnYjxfnfqk3gWY+fkDdVrblcEVP
	 yuRi/WY1b+Fy2pn6lB3lLMCrI9PXrfOBIBEqtJJ+BD5tQUShjbpwIld2Qx8228fRiQqby
	 lFrVVYlthPHUQioOL21iwk3CB2ayw4Bol++seeXTD3Fa+I8/M2xJI39kRCieW39H2gwxI
	 euzS0rn2uejOHT6kCOO/EaFCva24um9Cv1cgaUfiAF3KZAB76Bb+SbeLVBQ8LJicfsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Y+QqoQaH;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DE3606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:21:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9DE3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Y+QqoQaH
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso1046629a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793010101; x=1793614901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ekcPeRS4977QsjC9hWodQ7fRVCdNhWDisPpyBhUx7KM=;
        b=Y+QqoQaHWvndyk0v1/pT2GKi0Y6qxMVWpgSyu2oQhIN90TZtTS0S1k/bRYTXcXYlAQ
         GJXg2sNLycOPe4g2EVKV3IsDuxcuXlC+LLSzHzkim7MpAho+BMmieczDvo4UDbTGjWkX
         JUm+7ImRQrbL+mn0t95PeXMU5LYlp0FRd2+S0ngFWGD1xCCFWtz2Nse0XsJ38Xo8Qk/y
         nxyxMn1Kih1OJsRKbDqhWRc0gqCVZsQe4/9CiEnJPFj3XyV+vh1lMyrLTKfggXaRM5yh
         V4L/4RGqM8Jh/OhhbjPUHD21vaV6rBxntBgQFpqmBtA4JXeP2TFvLbWKzf+X8HwBc8u4
         PPTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793010101; x=1793614901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ekcPeRS4977QsjC9hWodQ7fRVCdNhWDisPpyBhUx7KM=;
        b=cxtJ1MYY8QfWFxxIKoUKGFFn6X2hOao4GR7BI54lm2ygGiUjwYh/0BhCemUzuiMvOY
         Pcp4BmRLaCQG36r9PqZy3LqgPHqYiDTx96LxbQmIeTb9FQ9wexLL3frk8BpLaBFAdsz7
         ZZsO+x+wJT6SZEgHcSROf6H8Vvo+fLROaPUgU0iATFYdY+XHRDK7dfZDzKTQV3J27dqe
         x1uXyiSMaDbqSUbbT4Lcwiw3m0iLSBTRI0HWq2lexHYSatHDXMN5vaJ2OPuTkVTff3p5
         DhKd/cY8VEd3vmzuBTmRfl5FlGbyTetOh6zetQqRUbPgq1Y7muMAPmii2oscSF8Qgm5x
         yQTA==
X-Forwarded-Encrypted: i=1; AKwUvByHm7YJquZVdMj4P+MhNFbQ37EiPGP71U0QfZomksJ7RXwVdX/ilAOA1BqtJeVYls3qp14kr/HuoqMOILU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZmZJxU7mX2q3A5GXHJWWheZFvISDBJ7JtGN6BEVplAFRr6MYD
	UBu/mYJ3vVMIm61lhPaSpyOFolcNn6ceQccrX7Xkgqmst+a9CNpSpjmC
X-Gm-Gg: AYBFou2mmOHxw6NzJa+B6dXPyhLZgYaoMpFOOm18kOBx4zKNgH11HoUUZYfHJEm77nq
	VMcZWhfn83WmiJ7Lg49Zl3Kb9P3GdiYe2FvGs7ZJX3jwXuKc1SMh6DGjgOQG01fkK0d5QqflvBN
	vNIRwzprVHUvJv006IlNUiSohX9KO7MGEAKb/dd/VLzMW9tRGblCPAnMrUeF1+aWwpEiCkix4tn
	d1iexiUkfzlbb213ymexI/jfS5fS8Du0qP/Wxx9Vs7DA0monsZ4JShXpFImkYNiXSppaec+YBcb
	x5QR1mvw60w2PEgO7PJlg6Qm1Pg0+AsS3/OIgGR9r/UoUQMiaKk8u9kDoo2L+JfJJ5kKHMzcRbI
	8Yak01pqmhicTcxDA3EFxCQZmU2gRE9vs9RaD5w1FVYLCtzWjy8HKUevu+4PGRs5JamacVWjoBP
	kBBgkvk0sta6tX8hOVuyaKMg6UOjbui9Muu841BKfbUp00pjr+ZhU8MUzwiwWXxdmbfMeSepXqR
	6DYEh0ky+r5Y1iHxsiL2l1jQUXCuA1UqTgO6g==
X-Received: by 2002:a17:90b:4d8c:b0:3ac:a521:95e with SMTP id 98e67ed59e1d1-3adead4f7ebmr5516241a91.47.1793010101173;
        Mon, 26 Oct 2026 03:21:41 -0700 (PDT)
Received: from qby-nixos-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebe6af0dsm7877467a91.5.2026.10.26.03.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:21:40 -0700 (PDT)
From: Mingyou Chen <qby140326@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>
Cc: KentoNion <kento@kekto.ru>,
	platform-driver-x86@vger.kernel.org,
	ted eric <ericted8810@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	linux-kernel@vger.kernel.org,
	Chris Taraszka <chris@miget.com>,
	Matias Civadda <matias.civadda2342001@gmail.com>,
	=?UTF-8?q?=E9=AB=98=20=E4=BF=8A=E6=96=87?= <btx342@gmail.com>,
	powerfullz <wleizc7319@gmail.com>,
	=?UTF-8?q?=E5=AD=99=20=E8=AA=89=E9=93=AD?= <wolf109909@outlook.com>,
	=?UTF-8?q?Milo=C5=A1=20Vlku?= <vlku.milos.fun@gmail.com>,
	Rsplwe <i@rsplwe.com>,
	Bozhen Peng <bozhenpeng93@gmail.com>,
	Anton Karasev <uselessfire@gmail.com>,
	Jame Jao <jaojame6@gmail.com>,
	Serhiy Shliapuhin <shlyapugin@gmail.com>,
	Mingyou Chen <qby140326@gmail.com>,
	Nika Krasnova <nika@nikableh.moe>
Subject: [PATCH v14 3/6] platform/x86: bitland-mifs-wmi: Add Redmi mic-mute key entries
Date: Mon, 26 Oct 2026 18:20:58 +0800
Message-ID: <20261026102101.224568-4-qby140326@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026102101.224568-1-qby140326@gmail.com>
References: <20261026102101.224568-1-qby140326@gmail.com>
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

Add the missing Redmibook mic-mute hotkey definitions to the shared
sparse keymap table:
- 0x00002101
- 0x00012101

Reported-by: Nika Krasnova <nika@nikableh.moe>
Link:
https://lore.kernel.org/platform-driver-x86/20260531123345.237521-1-nika@nikableh.moe/
Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
 drivers/platform/x86/bitland-mifs-wmi.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index 9afa2e2764b0..0d7815c2faf9 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -111,7 +111,7 @@ enum bitland_mifs_event_id {
 	WMI_EVENT_CPU_FAN_SPEED		= 26,
 	WMI_EVENT_CONFIG		= 27,
 	WMI_EVENT_GPU_FAN_SPEED		= 32,
-	WMI_EVENT_WIN_KEY_LOCK		= 33,
+	WMI_EVENT_MIC_MUTE		= 33,
 	WMI_EVENT_RESERVED_23		= 34,
 	WMI_EVENT_OPEN_APP		= 35,
 };
@@ -636,6 +636,10 @@ static const struct key_entry bitland_mifs_wmi_keymap[] = {
 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_SWITCHVIDEOMODE, 0, 0), { KEY_SWITCHVIDEOMODE } },
 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_REFRESH_RATE, 0, 0), { KEY_REFRESH_RATE_TOGGLE } },
 
+	/* Mic-mute key */
+	{ KE_KEY,    BI_HOTKEY_CODE(WMI_EVENT_MIC_MUTE, 0, 0), { KEY_MICMUTE } },
+	{ KE_KEY,    BI_HOTKEY_CODE(WMI_EVENT_MIC_MUTE, 1, 0), { KEY_MICMUTE } },
+
 	/* AI button has code for each position */
 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_FN_5, 1, 0), { KEY_ASSISTANT } },
 
-- 
2.56.0


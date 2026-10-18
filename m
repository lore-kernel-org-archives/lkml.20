Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4B449BD6E
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 12:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792327697; cv=none; b=gbrvjL6FJBj1QPlNTCZ883tFirKuopLROj+VXuYl/Tr4350cFOh+WgZ5x47eCb1NETrdv3B+NpMweIyUkNakYLsD96IAskZ1coCAAU9GkehN/2X4qoPF8WWNm6BIxtdtCgdjZuMDokPj26BRgZEqf0AQNe2yg9vlJ7sBjEtLF/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792327697; c=relaxed/simple;
	bh=JGXECXC6xZr/Eyn43PpFIVXEFthBlTFDxiV67azmVEE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=liz3jxNP8mrTy8BmUkhEzkLb8wOlBWWOjObYDFGef2CglsRyy3f7eWiMDyWj4BA6FTNKBFfs52mlPyNQkSngR4lsVE40IfwnIrp+6WQFkW69H8EstRweAbaoyQosBbrGU//WnECrHWxq0raCDby55ensjfO/KaWGhjrfqi3Tqtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KQrrX12S; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KQrrX12S"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-89f639ba307so405336b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 05:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792327691; x=1792932491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iBh1W1r4OnuF4Pt6IO/5HABgD5isNR4NzKmXEXpqF8E=;
        b=KQrrX12SO66jkI/AC27cpLAHLSkR7MDA3Zyx0nEfeNVfcrjvCRhU7Ztfw2jlxK+ZDr
         8oXgWzugu7dWcAaCgzpq2nBGuqQPkrpGkU5+YecciRCz8kHKSr3rrVYnC6F/TJLltp06
         OlaKCoDrHz1DPH4bjQkcvPNdrQILnAP8NvnZEfG+j6kkCk2ShK/T7eUCgOC3L6ku2gI/
         H6IyvSm4Oc0WSgc26/VEadLEep4h8RwrSjL4JK7hhPaxHGjTdfORYU20UOgU03+zaGo1
         9GTXr8M0WLEj3LHtj+Ph9mwFxJHC201PXFc/donYznz7kWARrs+8j3OU8DsBY7zFlpeW
         QBYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792327691; x=1792932491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iBh1W1r4OnuF4Pt6IO/5HABgD5isNR4NzKmXEXpqF8E=;
        b=UGGmglI5Xc/jdYm+pXkJuHvveLgDcWecec/CydBAIA+rETCKIaL58LUIQczIFuxyJD
         JITyhlAOJN3zrkviNbEuSsj8amG8kjlIt1MO8YgIVZg3Z1QvrGfhG8qPFPLDmDswIS58
         rAMr1NcZVi/0N+Jk6N2aXyA6+LZXHs6roIp8b33f64sr9WEOqYqswDsYYgEsV+9z70z5
         2QrJoXL4EQKAZy0fTksHv+MYpBzFPkgqF6OKVxUWWuxUIMdHTxyH4a0p+i0C3/vQChZO
         F56xKkFKykwOpvhsM1czLDDVaksZkpBdCkQ16tvn1xZTsSIHquttqVXNO7nqVArCq90S
         yM1A==
X-Forwarded-Encrypted: i=1; AKwUvByR38rbERj//efr0FlKyDYiJmecRRQRjVOUjnvDYHoj3q6WKSZyHiW6oaSVaf9rLZSSxdKMsKbwXGl3C0o=@vger.kernel.org
X-Gm-Message-State: AFq9FYIlGGfEVEJCbZ/lPcRLDKkP+l3KzGTcT4ndJW0d26Kq5pOY8AtW
	Pjj9ewzuNTbNJ09l3CLdqI6QzJOW1fQ/46NrAcWQvvul81USAjE6ObT+
X-Gm-Gg: AYBFou0AVps4fqhAcuVkHzpNgUiFdXLcmseaNIjBvxSroW6mK9v2fRLYlaoQZORoLIl
	2VxM1t/rwctXhXxHKJhGjeVpoo0OwQyouzmXcfAZWducx9cbPjxWmURRvRGl8JdM5zrDgYl6YA6
	seeMJu7fuFl/RIiiMytHFMufB2Je9QmiSkTsCoZgT+Hs+il0IuCvEjRVx9VrVnUIlXm4fcxy9TN
	y2WYbrrvG5fPYNicWqz1y21ehtqX9xYdHqNJB9wwiSATmPnkVR8JPK0Cd7hUEAoIKshDbpJEnJv
	6qQUPpTqibevdHns7+T/pSj/TlRLOJf58WxBtGzOoottd6OXsEVlBGjQy6dCgln8han/j0dT5fS
	Yztp+/8TlVvDkb11/R/jIOmp3tuqIKA4+TecRwCoFIGxkJX9tYBqtCaapdtdCVAeUIoaEPaKTGt
	Q4A262EfvJN6JjeyB9N00iYp+LMNibC+Zy2r0DKw7Lw5wRbNd/S+RU9XuBb2IeO7moF0Vx6/q0q
	Bi4Hi73G23SOzJ66+yd3hM=
X-Received: by 2002:a05:6a21:4c13:b0:3e1:7b85:5a95 with SMTP id adf61e73a8af0-3e2260392c3mr3625358637.28.1792327690991;
        Sun, 18 Oct 2026 05:48:10 -0700 (PDT)
Received: from jmoon ([118.220.156.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6549ee946sm2804669a12.20.2026.10.18.05.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 05:48:10 -0700 (PDT)
From: Jinmo Yang <jinmo44.yang@gmail.com>
To: ping.cheng@wacom.com,
	jason.gerecke@wacom.com,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Jinmo Yang <jinmo44.yang@gmail.com>,
	"Claude Opus 4.6" <noreply@anthropic.com>
Subject: [PATCH v3 3/6] HID: wacom: add NULL pad_input guard to wacom_intuos_pad()
Date: Sun, 18 Oct 2026 21:47:52 +0900
Message-ID: <20261018124755.850888-4-jinmo44.yang@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261018124755.850888-1-jinmo44.yang@gmail.com>
References: <20260927041138.4112920-1-jinmo44.yang@gmail.com>
 <20261018124755.850888-1-jinmo44.yang@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

wacom_intuos_pad() uses wacom->pad_input throughout, but pad_input can
be NULL when wacom_setup_pad_input_capabilities() returns -ENODEV during
a successful probe.

Place the guard after the data[0] report-ID check and return 1 so the
report is consumed. Returning 0 would let the caller fall through to
wacom_intuos_inout(), which would misparse the pad packet as a pen
event.

Fixes: 10059cdc0ad0 ("Input: wacom - split out the pad device for Intuos/Cintiq")
Signed-off-by: Jinmo Yang <jinmo44.yang@gmail.com>
Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>
---
 drivers/hid/wacom_wac.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index bec8dbec5bc3..65829de86363 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -581,6 +581,12 @@ static int wacom_intuos_pad(struct wacom_wac *wacom)
 	      data[0] == WACOM_REPORT_CINTIQPAD))
 		return 0;
 
+	if (!input) {
+		dev_warn_once(&container_of(wacom, struct wacom, wacom_wac)->hdev->dev,
+			      "%s: pad_input is NULL\n", __func__);
+		return 1; /* consume the report to prevent fall-through */
+	}
+
 	if (features->type >= INTUOS4S && features->type <= INTUOS4L) {
 		buttons = (data[3] << 1) | (data[2] & 0x01);
 		ring1 = data[1];
-- 
2.53.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032197;
	b=amnIpL5JCx1O2Xi32JnjmRls+rEYzIr/mXdE6zL+hqVDNpXYIhS6veoWEYrM5qz7cjb6
	 cs0p5syJ7yLsTdD1A7TMEfzcF2E5YEo0LOm3T46fgMoVAclsPxJM7TXOiLU0TG8XtC5DJ
	 lwRHJltx5/UEn0MtQnkRiZKGa3xt1Y2iLz+THnXLl4MYld61K8wSdpAFSskmZ7nVk2IQd
	 16Lcy4tuvKjZTNR9hRyNA2rFDgR2LZWesSercJH1CXIgJtpSRwkqk+IPvg6dgFEok+Mnq
	 IeYoqUT2NkjIO1FElEIX+etjk+l0y3bY+EbHDzTSOjMJMCLFFcfZBKQIpuJ7Zk1yX4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032197;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=08drD1ymTUi9hsmUJNZ4ArGmW7O1mMyycL0HsIwG3PI=;
	b=Ldna1lJy9CV3yUmCAlfa+1kOlWU0yCZbziuFlk5MNShf9FEVkyjzQeG/b+lz5Su329TI
	 9LWSAvEcJr/y5y7djEKXKaQuNqEm6x9d3FaT6PNKYIptTzpHohq3wEf5w+NrRTx9qkniW
	 kXdvhHmTXf2Kr8MgIsAqK6owdo5CLpoV2d1uNBLxDI8AeqNMdGZiO9/GmFs2JcCPVMz9g
	 Rp94o3AI++ngTnCGP+2vb8Q0uG+ame/YXw/qgBgx44XQp5hEkC4jwrZI/ee4XfqX7jjcC
	 rKJlcHoSQWFojyg1QWskIZO7fsXvyX9vYq9aAYxbr8E41XtBBg9uD2WM8bLK2Qn9XlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="amHo/jsa";
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9735160A260E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:29:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9735160A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=amHo/jsa
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so20101795e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793032195; x=1793636995; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=08drD1ymTUi9hsmUJNZ4ArGmW7O1mMyycL0HsIwG3PI=;
        b=amHo/jsag43OcljCOXW4vz3z8ua3VyuUOPYTMKVde2FieVi/yc1yuhS8dDJuoP+jjA
         N+BU+M/cvgwzNqMlGcOYDTxuEviYmgKV4ruodeCVF6OGBO7obOkqNT2pGlGABrjFPt3O
         vsDLsrPrgmcbPS2KPTbjPmyceoHK2Lqxfi+yG80uJqltRWWlejpRGr9lwsNvl7HtecdU
         iCOIRkJ+ywNsy5s0HCsba4eDp4Bb5oZX4b9M9hjNVNcj17Z35yXWilh/QLYZf/h+z1QU
         v/IK5VMp+NJMpUQCcPttzbOTJ9c/o5oqEsr1ZtF8tzMCizTWSIFBNuUdZr/cWtSIJ5og
         HpfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032195; x=1793636995;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=08drD1ymTUi9hsmUJNZ4ArGmW7O1mMyycL0HsIwG3PI=;
        b=HOdUAdfL5l1r1vn+th9s0xr7f0s57LV+YNIBmoR6jSIUQB1IbGzvTjB6ZDvYtVBdFE
         ojTxJF5+sCwa5fm6CrxI7A17BUsyMJ72aFnokdoQVOjLUWcIhq7g8Cc7Uptlan28aT/Q
         0OdMbH3sqcrpgERv5yRam6rru+0Po2EwTfsW11Po/EdVzqxX2nUvtqB3BdB0pivYAr8L
         pAnrWqpLsRJ1TXuNnwYRG58JVrCwjWQColluSeDQAAJwnJt+EuevwC07lu0d1N9/q9zH
         PMYb1GVc+t9Xh2fXGGJwLWDA8tbn6X0OrH6TcjpnBAZ1QaXFPxZxlpVBM8+EwNYOqUBy
         srLw==
X-Forwarded-Encrypted: i=1; AKwUvBxwpLU7CvviflSvoQJuAq16K/05EiCkDlsbL8XwniJgYJyVUjQu1JiygxL417o6bttLWsQ+cqfBn5Hm280=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4J/pjzKnMQouQcT4+pASE8SyQwyiOqqiPb6gmSsPD99bgP2jF
	ksHk1rlpgZvLZgCWUScEgAohpb5cz6Pe3N32+Qfgsk0zdGc22YWWS4iSDtln95n7Ybw=
X-Gm-Gg: AYBFou312XLNBPkwv+Q9DCVx8IzV0v2KsPefBE/6o6OFx4q+VnJ08B7r767w736K00b
	LPxtGHr3cwqGjXTKITnl4BKQ7cw3DTdPsEJ1fOIvY1PJI2vElNtdCTxqazpPltLlbzkbyMt0r8G
	haszTu2IjToLE/iIKMa7EZrCZiWxJFt5pDLboHnDvdawIztrWQmp7TL1+NzDffia7S7WORuRRSq
	xX6lIR5xXcxObJtiEX/abjfYkrq+7+7n0mpl8Sfy/NnobPNt7M+UDSRGqIbprNX3EMYTczDT1zq
	MV53DvLwewmmMDPH2W3OVdkPkNVoQ30n1mdvZVcsxnjzFuqgUtKd4UsQN5GUksfx9veoTga8Viq
	ZdVzbZxx3MzC8oU5+hSEhHYFjbxCJpokBa6YyW7IC0dxDHazuk6woeYE8UL/STCxRMdNvzrxlEB
	ZvV+xsDlKYjNCjxtz41zPYiUSx4bUVsLM6j1rkiemWTQqiRHq6inEaJYDzH3QhX/i9IDuST9BFS
	mYtWT+rgMVPcNS+yQJTtjkINvJ51nu8WwBc8rpZzHKGpAajaRVhpaa0S6GvwZO2nZcuarUAshF/
	vU6ZstjdKp5rQMYkU2Jwi9GsBQIp/2MjAblnqvdpsGx1
X-Received: by 2002:a05:600c:4e43:b0:4a3:5991:719 with SMTP id 5b1f17b1804b1-4a7776698f9mr22225345e9.31.1793032195002;
        Mon, 26 Oct 2026 09:29:55 -0700 (PDT)
Received: from localhost (p200300f65f19a904cbccaa7a4d73ac15.dip0.t-ipconnect.de. [2003:f6:5f19:a904:cbcc:aa7a:4d73:ac15])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e3ebd49afsm17669401f8f.35.2026.10.26.09.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:29:54 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: "Enrico Weigelt, metux IT consult" <info@metux.net>,
	Viresh Kumar <vireshk@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH v3 16/22] gpio: virtio: Use a named initializer for virtio_device_id array
Date: Mon, 26 Oct 2026 17:28:27 +0100
Message-ID:  <214191c76607fa156b8c9d9209ec8f4e49a4b44d.1793030820.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1793030820.git.u.kleine-koenig@baylibre.com>
References: <cover.1793030820.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1078; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=HvLKZnIb7RtprxLD/D+7QxSMDdlX02hi9zaVYI1agxw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq33/E2/88AYjCtY1NH3iLuLQmQBlGZKTuZPwEN I+ROn5ltvSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCat9/xAAKCRCPgPtYfRL+ Ti09CACXlBrBIggIPRy7K+bnoOgAplGl7A2GNsIbOzirBWsIaPJ2sZoYQcdMyaUJ7dyRvMEXVbW 4L0MenSBLD1aCJBa1sMnYOMhhp8r5UL7zjAmh/SiFLr6pzbUPdtgqE5PTo7t6yueD2k3HBmQ/0x 3aepLEUro6ABLL8k3sKyfLFK18CuxIYb5BggqhKSQHjbN661TVZHaT+oFi1PkgaCWI0qSMn2jMB cizrNJq1w7ITdmWFrRo/RdJELM8a1EnZw/2y3/Whjc6kVbLVxxnBHm6F7wsZhJLgDCdt4dPBhLC dnbcvS1DmGYvPVju+7LvCxleQFfL7OzCNCctALVZU66wcsq3
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

This patch doesn't modify the compiled array, only its representation in
source form benefits.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-virtio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
index ed6e0e90fa8a..42871db05ec1 100644
--- a/drivers/gpio/gpio-virtio.c
+++ b/drivers/gpio/gpio-virtio.c
@@ -646,7 +646,7 @@ static void virtio_gpio_remove(struct virtio_device *vdev)
 }
 
 static const struct virtio_device_id id_table[] = {
-	{ VIRTIO_ID_GPIO, VIRTIO_DEV_ANY_ID },
+	{ .device = VIRTIO_ID_GPIO, .vendor = VIRTIO_DEV_ANY_ID },
 	{},
 };
 MODULE_DEVICE_TABLE(virtio, id_table);
-- 
2.56.0.rc1


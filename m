Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A8B13C908
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 05:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790744507; cv=none; b=c44Wp7cYkk7lduazcK8RZ7elWbKSwYkqjtzi7Nd1WOM3eutkJBmAz2uc/PA32NE814AsZ3YOnO6QXYKNxge3WAy30wYsTpFReiFLp/cytRe8IbDZMqV3P6H8BnWYcvrfPurXXwW/UyzJ6x0ULS1gynfRW1q/10KPw+2DcwJv9zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790744507; c=relaxed/simple;
	bh=lhoiz6FiPuo8GkR8U9OsrZhP58wDWfewgXOY4y0kleg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YqNjLkCHza43NO8TrhRgl8lCo+0/M6LvT8zv/P2AZaw4yC3edMxNNUrEbjy+VVmLp/89Ceso8HgkmHcijgYfY6qt7qgvVMF2gRFZkaahw2VFh2YU8AsC7LUSA8nDrmxuQgf1v9F6Wla9GsK+nq+6eLCnLHZ3c19Tdo3reBLl9bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MbO8PJRy; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MbO8PJRy"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34c0b552ccfso563944eec.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 22:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790744505; x=1791349305; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=K4tDF58WJFDkkKGBxhBoU4IV4oQ/VCzA24mY/WFJHOs=;
        b=MbO8PJRyDQ+oWtxrMdpMqHo8ugyUn/rKt41Bh3uVVGRxbJO22CrwC9DfU6e41Ucgul
         fEYvgdQ6aAsrvYTDqXYayPV+TOQRdAyj/NG0Gten9qrJL27gJi4MTXFlnuIvRIXW1uPZ
         wvqb4TD/TO+3f0CxPZzFup42t4qthSvX6G5vnNi49h/dOpcKPQzgwWTxnU38YAVe6Fbm
         I6hfubGdCpygqyGhxG1ZkgKu4OSCF6qtI0rvTLEsVDKqYMTDHQInTBraEwjUqncG7je0
         OMc1gcjzdSzWh+f/OEZ8hdj8VORpba5fQou/P0mX6VAfNa7Gz/sXH417gPa7k4Ao7T8b
         2sSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790744505; x=1791349305;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=K4tDF58WJFDkkKGBxhBoU4IV4oQ/VCzA24mY/WFJHOs=;
        b=EwA+N1oPHxXQvF6lUH7LvzZnnLYTpR9WVsIi9elPIPBaOtcMu6Ap1ClMAftB4sElT8
         RwRIgAdA3P+t0yRM/9GwmdszBRoX69OrIUf7GGfkrU8ZdU8tscI69FtUkChMSJVwGsBP
         3FhMkm2e+P4QWevZXWHMO4d21Sp5gE8Zuzu6RdMd3aciIV2dgRMj5JgiCEjyqWWbUneI
         8wk9ZAYVFAZ9ks/qupxmDcGVDXYw2i1KOcbbOlKAD5lTxeWHghnEsm8+nW5SE58PVvDf
         QfIzI29T12VqNXUmSKV+3bfc4kmzygezA5Yd9Tj37dGjZR7QV5tw+/otZ014u6dsx7v3
         9bYw==
X-Forwarded-Encrypted: i=1; AKwUvByG5p3N77engAMgBi6vpL5oZp4P5un+ZSJ3yY1nkgf1zPa90FtL8qsJXZlx2C5Uo85Bm7Ue8ourw0KZVYw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIsY13TwGuRboQCYrMAYJjAw8EsE6bNpVcuIutGFsPVWYECR0Ik
	weUxf99XfqhcDTn/0x9WEkE27yT5xVWjjEaOxDxt/xeq21dXv39+oJ6c
X-Gm-Gg: AYBFou1liBDagQjHdD28iUeyrTzeMZfNbwL0X/Ajj4xygWb3AOrwGmQ+IpWeVT2IOcR
	5DHljl62axoQ/QtlxoWL1Z9/HPwjTXM4RtvwvBdoC4MIgHNDr7kZGo31PvY108xa2zsRXrxbP7w
	N+KaKlrKtJO1vlcfH1FD/jb+YBrUemm5LK1kXDXeYHPKhsPmi0u/RKyD5EJnflsRygNus0tSL8f
	MRYL3A900D7tm75tTwBjga1CiOevBlZzSdbrr/qdUSLxLu9dOoXEYvjEnXdDsdbg+sqeXY8Dqn+
	CYudJAdoZj6GoR6tYQrSUCgubrazC6SVFCcuBw7I/Cw3HcO6e6Dp+QCh6mNxh01ONm4+/czMC8p
	WVuC/EbhefsiXlL1fQuYWHzryw6V6qKKGZzyosftaFTaonGKy7ojilGErXvitbUdbKLa14YLFL7
	F4MG0iRFiLvIuJ1RioGCIxwnaKbEyyIM6OeQ4DQt18p9Iti78bcHL0TXx51WnsJj8S5U+zMeGx4
	V4ze/JtXK09fNzGUAkxEeMqeFlHLMmZ0LBhNbaLtWwTYcuVFYC/u1Z2gmQ7Nmw=
X-Received: by 2002:a05:7300:fa07:b0:33c:3134:f45 with SMTP id 5a478bee46e88-34cd907665bmr572401eec.5.1790744505331;
        Tue, 29 Sep 2026 22:01:45 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:101a:5ce6:a15e:d8ca])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf613b0c4sm778125eec.28.2026.09.29.22.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 22:01:44 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v2 0/2] platform/x86: thinkpad_acpi: cleanup conversions
Date: Tue, 29 Sep 2026 21:59:09 -0700
Message-Id: <20260929-thinkpad-acpi-cleanup-v2-0-88e176953a4b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB2XvGoC/0XMQQ6DIBRF0a0YxsUgUSoddR9NBxS++qsCATRtj
 HsvtoMOb/Le2UiEgBDJpdhIgBUjOpuDnwqiB2V7oGhyE864YJJLmga0o1eGKu2R6gmUXTxtTQ1
 nLmohmSH56wN0+Pq6t/uv4/J4gk4Hdiy64OaMBVB/v2WCiUryphS8qVtOK2pmTOFdJhfcOLj12
 s8Kp1K7mez7B25iuZq9AAAA
X-Change-ID: 20260929-thinkpad-acpi-cleanup-8d4e7264690d
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Nitin Joshi <nitjoshi@gmail.com>, platform-driver-x86@vger.kernel.org, 
 ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Ali_Ahmet_Memi=C5=9F?= <aliamemis@disroot.org>
X-Mailer: b4 0.17-dev-6c14f

This series converts thinkpad_acpi resource management to use helpers
from linux/cleanup.h:
- Convert conditional mutex lock calls to ACQUIRE() and ACQUIRE_ERR()
- Use __free(kfree) for local pointer allocations

Changes in v2:
- Dropped patch 1 ("convert mutex_lock() to guard(mutex)") as it was
  already applied upstream.
- Preserved 0 return value on failure in brightness_get().
- Fixed auxmac_init() to avoid setting auxmac to "unavailable" before
  evaluating the MACA ACPI method.
- Collected Reviewed-by and Tested-by trailers.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Dmitry Torokhov (2):
      platform/x86: thinkpad_acpi: convert conditional mutex locks to ACQUIRE_ERR()
      platform/x86: thinkpad_acpi: use __free(kfree) for automatic cleanup

 drivers/platform/x86/lenovo/thinkpad_acpi.c | 190 +++++++++++++---------------
 1 file changed, 87 insertions(+), 103 deletions(-)
---
base-commit: 6474fa070f2b8013b4b87350b775b8c3be6e8aac
change-id: 20260929-thinkpad-acpi-cleanup-8d4e7264690d

Thanks.

-- 
Dmitry


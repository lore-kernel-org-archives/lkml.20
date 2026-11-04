Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793778134;
	b=cOcgbfTNWvJdK6CXAgXa8uMgzZ4c2l9C19i9/RX5mTggobIbfp0tM5A5j3TKelp+tgc2
	 hN6rDoZ6Kdws2DDbbGQPljMSXsYsM6qg8MfNyDhlkJrCwTNJEZflANE38VAOwRmLfQztZ
	 LI4ZeUyuyG4Iv9nWBY2K0Wnx3M98EEJqfhhwKDmUGxCrV6smxiCBNBhtuiD2fnLqsC4ym
	 ospnX+jsU9/R9cVjSqzIpqgxbFEVvuv0ZxrdqYuQ18XkAftQjxn6+5iiwIko1v5B9byfa
	 Rb7cjqUPkZ4CYMogEubAkjeRTQMxUc7K43UA+iQMIyvhkkxYc2I2weYUM7gB5q7HeiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793778134;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XgGz0RsBeuTAkb9+mf6U3WsqonKJkMfHigPc4/u2i24=;
	b=17ovNr4AKO/s/q9MK+Cn7nRldZYWHhl7XHPBWYFI0wX6wJDI8XPcdEjxwbR+9nsScy4u
	 Y8AXc1bUqjaeDn5wzxSwxRVJYBJhKjSjbUbfNEf86jzoDcVRgzOBiDE2hKlWvqjKqRAGx
	 kY2NAJy5KpyjBXcCzPTBzJyCAmRbk1rdMors92B5T1bjs6QJ/GUT+xnXPGxDAPdU8lbp2
	 yJTv5De6G609/+QdoMNw1xDE7MNUTkF2FBtclEmcFahCuYKc1wrsU7fDlxRpDG9cKJ1fr
	 YxCWKdjRYLaf/mp+9hqhdRTFQKAQqouEy77mBbOFFzfcU7i1nYWT5gVHg8IPoO176jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GFkDsZM1;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEFA606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 07:42:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADEFA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GFkDsZM1
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1aefd1bf74aso306511c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 23:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793778132; x=1794382932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XgGz0RsBeuTAkb9+mf6U3WsqonKJkMfHigPc4/u2i24=;
        b=GFkDsZM1X2fvZz7fpFxwGKgbV3Y0f2EwxqtIEVZ7CppVOXupPs01n2FGhSODJ/HwCo
         8rMt6ha9VIM2fp74g86DkY7D85F9IdDGoovji5s68uv60eOKq1gYRGvlKEGsU+7Ddgv2
         jUt/tVb9mYlKeN/vKv//GH+bPwgiAV8hU6vY6HAbMEfWtEdsT8+xbVLML/BIznkhoahK
         1naS7Et+tMlJlVjSNDZq85Sk+48UYxBW8Ebh0dYTLU8Z/yyoDQp4/jzCQemr1QdI6j8K
         YvT8pb27yUltIZbjOwM7Rw8wOaP9ZH19nIjhCqNLYeSpt/IkS6+hXsUvbaFbDgothKNy
         HlJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793778132; x=1794382932;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XgGz0RsBeuTAkb9+mf6U3WsqonKJkMfHigPc4/u2i24=;
        b=vRd6h7Ufaicna9sGNvTk5obw5cr53dPVJcnFxpi2eLLFyVM9xIiR0brzpgF0F4RSJT
         6ohIX+WvI8wZXKCuFGaQMAYsgpqhhqYJ3obmYgBBu34hTWTf9MYZw/ehYW/Yti//QDDe
         4jXu9FCfMMnqtfRcDHxTWipAc2x1FuJotfMqCYqNbG188n+UV/QRzk1BqeWeDzuFlv21
         tmDCnvz+jbHJfKw/dZiDcBNsIW58nfQ9KmeMuE9x+ImT2YSUBGy4A5vbSOSUYeGUZR6p
         XJnEEVOEQYnvYRWdniyqF+QUfcjczV3aUgxT/+81mbGd4QN643xRZ7L1Vc5yDjD/oKwg
         0CJQ==
X-Forwarded-Encrypted: i=1; AKwUvBxpTvWUi2MWNzzqeL7X1Xb9r92fabR/k1vwO/ESkSL4gGJJNSub1xOxAcvBOtB1LFr+EPuBQSKLs6H1MvQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+SU8rfjs6ehbl5eHRSjjyB9rXvcmOdan/7V33jthBlbJ+rzKTZ
	zex7eTXfj7hj0wVNT4bpSz/oz5QJaCHSZ/8PAFVAiOqL69PAUh74XT3i
X-Gm-Gg: AYBFou0xGDN+e66vigvWaBRsjAAPKwdkCfrpPGWMJWs5uHVAE3dlZ5vKurfwndrmKxF
	yaEIhjWzaMTdmBUedz5f7mQuU/zLpcAqfPMi9e9eXiV2BlfZVhx5xhVV530Sy+vM7xfWys2Ny0d
	iaue/Idf0fj6PgdBkeiHSP1uitIOXOTnxF9NUGytgJ8aWWpzHvsjmv4k1w9O3PmCeLsNAOjhbT3
	uLlso1YOVeBBiQbJ+Rlnmcx8Qt7Q0286VbWJU1Au+hacSDtNjmCLYXq00QUJmZbTk9ZuGCgiSxD
	Wh3+AwA8kWqMVY5OS+KgufwG3maQovjCvXpJE4i3P6fcSk7Me7GQB3I6LxYFkMQJNIWWsVi+GtG
	TfWc8Ekq2zo3JdYAjOrIA7iKnSuy6zkij/rueIAal3CsRoMDQALCSaz+nG3ex4Jja17cqVM1Zq8
	jGKDtct2WlD/l17zzPeHjQWmdgZ5DAqcvogBWsS+IQBzHtGnpKiG/gQZH5g4K4eptcDRiNkW6Eo
	gpACABGGJ2c2dUPmJ1mc66Iq3d6H0y0XUlpgDGUXgilSCFazM/QOy5YaJUlQpm+RGRb5TjOWyhv
	J06GM5BGzfDmsi8/Y7m/6Lu2UjNZUgp8DCcx+JBq1yxfalBF7uls3+iAyCwld4osu92JV9qilA=
	=
X-Received: by 2002:a05:7022:4588:b0:1a7:4c5f:57e9 with SMTP id a92af1059eb24-1a94b852aabmr36592212c88.27.1793778132148;
        Tue, 03 Nov 2026 23:42:12 -0800 (PST)
Received: from 192.168.1.71 ([2402:a00:163:2ce9:c926:5826:36de:3b37])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c290sm5318385c88.5.2026.11.03.23.42.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 23:42:11 -0800 (PST)
From: Ajit Singh <blfizzyy@gmail.com>
To: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	romain.gantois@bootlin.com,
	heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>
Subject: [PATCH v1 0/2] usb: typec: mux: tusb1046: add HPD_IN override support
Date: Wed,  4 Nov 2026 13:12:00 +0530
Message-ID: <20261104074202.76712-1-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
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

For boards where HPD_IN is not asserted by hardware, the TUSB1046
allows software to force it high over I2C using the HPDIN_OVERRIDE
bit in the General register (0x0A).

Add the optional ti,hpd-in-override property and driver support
to force HPD_IN high when DisplayPort mode is selected, and clear
the override when switching to USB or Safe mode.

Ajit Singh (2):
  dt-bindings: usb: ti,tusb1046: document HPD_IN override
  usb: typec: mux: tusb1046: support HPD_IN override

 .../devicetree/bindings/usb/ti,tusb1046.yaml       |  9 +++++++++
 drivers/usb/typec/mux/tusb1046.c                   | 14 ++++++++++++++
 2 files changed, 23 insertions(+)

-- 
2.50.1 (Apple Git-155)


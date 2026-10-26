Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793010084;
	b=4Rc5yb+5EMi4jE2ubmFD6U04lgZXF4fWroAyytWQ3AfAVN1CYv+jj6rvei3zQLSsfjnU
	 qGMZESpUVWRPZSm8eoYD1QaWg3Q3f4HKICGNVjMafQAztEyVZ5hGBVIELySeDqGv3bMVM
	 Bl5JK9eL7zVjIpkYpaWpGuyHRMIzQ6FsDZ6up2kijviJqD+CmpWO6iLcluLaxbYbYVQee
	 jrhRCDV3uiWJjxjpsBP6dOjsVdzINhTdfFfMpYwdZhzVWo6YELYm8jw3XVNqHMJ/gn599
	 0G2xrq72eW2IIocXD63Xe8DXqeIwIILgyPXPdBKyYXNuMYhgecA6ZX28RVpUYisEu/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793010084;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=niELS6JRnslThgR0Pj7eeKqfPmjyBK1n52jf6VpJ/k8=;
	b=4KC3SOdZtMBOx4gaojDD3r8/I8oTrnIFzSS06R1doRDN9xfiVJzQ45js7tfwqfPWGoAI
	 bpzRPxIvvVD+N0z6r5X7ZPzPW8GKY7CrVCPDBWECudBEfNM4/Ohmgi1rK6jbHX+24Uv/g
	 CAv6jQ9XZk999EXh+cySAr9JXXyweoP6UnuaFeFe96dCnw2SpEXsgJHGtKjMqj3EgtWRX
	 1gTfI4kEy0wno5/zfLvH5BUGs0yi8WbfDXmZFmmQb+TjI4CjG3E7S2mtRupSTaQxoKJmE
	 tXeG6Vimnv1bRbwZzUUGJcrykqwVBTb+zZ73qQFuzupSnrXAQkERBsz8ENrv70EHSow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="Hau1K/L8";
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDF0606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:21:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FDF0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Hau1K/L8
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d577so1973516a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793010083; x=1793614883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=niELS6JRnslThgR0Pj7eeKqfPmjyBK1n52jf6VpJ/k8=;
        b=Hau1K/L8iu04LqcD1OTzAHK4RHRVoyV4BlxyI3OVeDnEoedl7KmaF+Nuw2ro6e9JiX
         3u0nUbn9F54z6pFJc0ijbxGQGtWLRzkkVn2rlQRq7PPU+cVhbyShP3dYmQTZPVdlPrv4
         ACeV4hiAzv73oqsclhkvdOk9a2ID7ey0MZNFrc0z4Mc34ZPVwOrScSpWyBaL+tufEuLA
         CAGj6yeKap0+65nxWR65EhCef4AKga9qGelA2ood0T6vE8+Va9ys3oAUOYHxovBOJs1I
         hnUtV7myl6u2RWbwp4pNSysknC0EaZMAsDlHUo6NmOr21MbTQSmGb+FC4O/IxEbcU6iq
         MskA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793010083; x=1793614883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=niELS6JRnslThgR0Pj7eeKqfPmjyBK1n52jf6VpJ/k8=;
        b=agPBw5507ej498FFG2at26nU2V6NvBqUtxW9TcMjpuXvgYeuih47PpEbVZC9rm1fGE
         B+gUH5nBgjs5rni4pdcVHcK9/d8mroTfseYSDeKs8YmzP77qvnUIXohhzr163IR9dqMR
         CCxo0t7lwFrmLr+YO3+/OvcyQ/d+Rgla+UnpvebQaqYckUK+60Pqnc5Fd/3jqjtzNV+i
         nzJvW5Jwe1VEjom17A6JWyMVlywaSToj7Cq/6e3rjlVGzp7fOqXb+167ONXGbsevaUHh
         BYkarWhWuywziFvk8aztj2K8wK5eFrK1h4Dg1yqCLL6/9gz6HnFnz/eZL7trfN+Xrszi
         hxxw==
X-Forwarded-Encrypted: i=1; AKwUvBwxJKgV1E2rBkqT4vii5a9NlYXV+lNZhs3faJhXVnAUaMyJIl28ifd9Y6u3ffhBqpFmeLw53Moqkr1gU7I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJLNhqkudr0ISGYiLxyM9APKIKrKiRcblpXDDjvlHiyLVwlj1fM
	PREZd6tgbHHDDdesuMmZcssJLW6JZoywif+5TcObugRKFyXeCnmNoNbM
X-Gm-Gg: AYBFou19ACemx+ck771YY/0mRobqJyvs2jtgsQr6gZGZtc9vvviD8MrUIAUFOzgkvbL
	SUw4+dB984NCYxrFJIrX5mnyZVZBsis4l24mGfm2xa1KmAenrXany9EgVq1E1MP3+EFlmUacre5
	v8cV1oMNdyJfR1RDkp4oYWguhjhaXREUdKe6cUk5FtROi1PFU+k3QjBEvRIROPWhZtSBNbRxGGY
	KK5RIQf/K/b8Jggl29FFh8WJzqj7gywoctVMwHo7ExHtZ/K4JPj6BBmV77JrCnI25ts2hI8fbF8
	qlFP40xagGRYxArXL779sRmfgBGl/3jppSSz759rLLUVRroIQk+o+L6AV1u6Jy7nFZ4NKrx0xLV
	y9QnP5pN12ZJ/PoDjukn6DRtKn2aPZLzgIeuL41BdwO07r9ZBCMiQwIf/W06OrZONMSo8iJTTqO
	i2rNv4gNKNAjTlPhT/W2gu+PRBlTi2rgB3qwhku/Ax1osskILTOrJmemtAlkBH9Cuaw644WjEXm
	9dw/Qke1nEvMSgxWjrIPl5Bl3k54/WS6ISrumbRdYjX56uYMbitWDWrKUY=
X-Received: by 2002:a17:90b:588d:b0:3ac:9c37:9426 with SMTP id 98e67ed59e1d1-3adead48e48mr5768532a91.31.1793010083558;
        Mon, 26 Oct 2026 03:21:23 -0700 (PDT)
Received: from qby-nixos-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebe6af0dsm7877467a91.5.2026.10.26.03.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:21:23 -0700 (PDT)
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
	Mingyou Chen <qby140326@gmail.com>
Subject: [PATCH v14 1/6] MAINTAINERS: Add maintainer entry of bitland-mifs-wmi driver
Date: Mon, 26 Oct 2026 18:20:56 +0800
Message-ID: <20261026102101.224568-2-qby140326@gmail.com>
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

Add a new maintainer entry for the bitland-mifs-wmi platform driver.

Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 508912fb4e54..250c471e674d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23044,6 +23044,13 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/redmi-wmi.c
 
+BITLAND LAPTOP DRIVER
+M:	Mingyou Chen <qby140326@gmail.com>
+M:	Ilya Gladyshev <ilya.gladyshev@linux.dev>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/x86/bitland-mifs-wmi.c
+
 REDPINE WIRELESS DRIVER
 L:	linux-wireless@vger.kernel.org
 S:	Orphan
-- 
2.56.0


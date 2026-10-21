Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792586080;
	b=rX016qJev8UMEeIZftyep1/tvjUe/ulKa5jVAS3gyn4zg5aV6B10l/+SdcPxEa3LrPT4
	 +zAWNIfFoCyBs8VgqUK6im41Eav9Hsc9wOprM7QqcQDX5yVTTKGgmRa8MfJ7nbenh4uTR
	 tac778R6Ppi5znaUr02CIE1AL60lc+Fjt8qAKbZNZDkz0thQpkkIPZxiXZcxe7ABJoIbJ
	 ZFeTOWmAfCXWBU8q5NXMdJRygcIwqUFxpUZ+PNrEvPBV6z7zeW6MfgVNzOEpk9kfwzr6d
	 ClIyWPNQ0ih+mBcmiDCMfS8mKerfFzx3Ejw95YjZ+1P9EpYrmSYZe3KTo3OjphEdDzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792586080;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=f4nusZtPfvxWEJGgkitB1nCWYQpN5wwU721sOcYgMrU=;
	b=4WTXZKtmfkv7WpRQgC8FaX9Na63K5b1hNllJCAZ4ic3XPj1XOGjqTdun2sBbiPnFxPt/
	 99cEVUCImJ6DGIeeFwn+y1oiZ8EBNPpWMDCnaZBfUPhSDyk5fYJ9/l1DzZlfaOYgD12a3
	 VPZaDewlUtcpXvASjUXTe/7QwiRzzwndvyEErbq3q+yKQ8WkiyHQk6gzZ3/5zCAYVBM7d
	 pmF+XNgUUXMvb7OKehNPJZJcOO88SOGeobrwpv1KxP9GO386R5MmHTxGmpnLstvRfhNfx
	 24UYT5v3vzFgMFqa2qxToh41eyS2uPknFasmBTqmafytJ5EZDi7dJ6jt9o5miBNUnrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qNv+xtka;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C68260A2616
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:34:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C68260A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qNv+xtka
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d577so602480a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792586080; x=1793190880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f4nusZtPfvxWEJGgkitB1nCWYQpN5wwU721sOcYgMrU=;
        b=qNv+xtkaj9e8fvQN/Lf6TTHgGBcsZ2dVz5uTfDNP5Zok9HBqV6y01ZfVzhk72M3MWG
         vf1SUBBm8nMDULiTdREYrInujFA1RQe8ZqSY82qzea3WijkG0ULtWczetNnNIqEBWNUO
         FzHVLBpiFs5FVWYW6zyLQks2a0yItZimoNIXbfzMI9Vy1gaU/DqecYfB4NkI9JGQFFzO
         30kRCNTh2QRYQp6kYJ1U3ST4Kzm9w+BLbUl7X7rHIcCpwSoVC5gRCIGKUspLBEtR21wk
         m/JELyWEmJohGFMvHJfLY1I24K+jxSwjKm0od0E/ZKf5I9F1+wEy+4LqbUpzwd31SfQp
         lKuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792586080; x=1793190880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f4nusZtPfvxWEJGgkitB1nCWYQpN5wwU721sOcYgMrU=;
        b=sdaUBKlMmd00MhQbX+0dn+PAF9QxxtJoz1nOyREtxgt3TrCUfoYvzRPSCdb0eHSIQv
         +U3VNMyfVBgp4BQAhS5z60ZAHK+zimJGRMZL6iwV0h7YkuF6VbgNPalV0GJZ/30gZU/I
         qHHOH2kXEznpJJa/6fUH/z6FWEbXqtfKzYuhOKaLw5nv9ICQlS1pUjM4+mk7tn6vOb+l
         HapGLJ2+++B1ntP4KM6ExWrQE0HBCcHXwBhKmmaxpnBGctUPnulUcz9GXxGJA4qQdHyf
         cKh8o3hLhK4Aapsp99Wpte51WMGWzFjbEB6uzDqD7nq/4rxB5fmCpTCbraTj8tHOq9Tt
         1IOg==
X-Forwarded-Encrypted: i=1; AKwUvBxu7pPU7p/y4yIyv2d74s00JFkfSX8VhIsgL0acMh/JGGp1OpTTxKZpj/l+wF7LwnJUgKesYmWI9uUcszg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIcVe34JTXE377qZomPvD0cRSsP360qJMdd6rQm9jgaAE4RaHxA
	ERBlc/waH7gMYuvTninIZ6MVhuYM1zfxKbVlWlgj/dxu9NzIqoF47618
X-Gm-Gg: AYBFou0pfocaprjCXiteBz60LJeaO01EWyuFfGRqy3fkj/8Z8VgxggiAxiyid9+KCv1
	gCMkz5ARXVAwZHTREU0kSypkLBEL8K7WmBgVp2asZp0cRNt5AZ2QVwQqJu1bLvBSB9hDrzqyPEh
	sRluUes6TGBbTo7BGtDzBjQDh8sDzINECFrFOYCsGB+rUOp4KUQ2/7LusOiQuG5EBBcL9P/exn0
	J7laAOU80S0/gB+SNvRKUZ/vz0i5oKL4b6wf7hdw8/vW9K8l6KyzwIgQ9QFXqmhAu31sz0gM0YB
	Omk4BrhsHdv8C/6PFCA7QVwxwJmMITsplvlTXArsEkpDeSNIJDVApP9fr2WqzguLxD5DUDfA32G
	id4WpiT/SLfh9VAFqWOOtu9z7JiKfobRvNa5RC463zQIAAaUpoK191xGcw8H5N1cze6svzCgGEx
	efFTv1zzOlei/7f1FSIcyVztMEX1loVyxUJdZUZKEDSx64Cq9N8M3Go4kmvdXvDCDObzHPRhTtZ
	v0zQQIDOQ9hpkIS2uZvTXNAcNmYPVkhA+UAFdWhL7RL6u9x0sHZtUvGKw==
X-Received: by 2002:a17:90b:28c5:b0:3ab:be66:ddba with SMTP id 98e67ed59e1d1-3ad86f44cddmr1574310a91.23.1792586079881;
        Wed, 21 Oct 2026 05:34:39 -0700 (PDT)
Received: from qby-nixos-laptop ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad85f56b03sm1823615a91.3.2026.10.21.05.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 05:34:38 -0700 (PDT)
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
Subject: [PATCH v13 1/7] MAINTAINERS: Add maintainer entry of bitland-mifs-wmi driver
Date: Wed, 21 Oct 2026 20:34:08 +0800
Message-ID: <20261021123414.25516-2-qby140326@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021123414.25516-1-qby140326@gmail.com>
References: <20261021123414.25516-1-qby140326@gmail.com>
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
index cfce3571ac01..63d2fec54e86 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23043,6 +23043,13 @@ L:	platform-driver-x86@vger.kernel.org
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


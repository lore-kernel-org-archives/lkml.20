Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E9D3AAF57
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 21:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788210835; cv=none; b=R6+6Vgdp9Hcvx8A8KqRLpcEKteUy+iVRedNM6NITOSt5Fm7PKCwiWHX1J0XKvXswKI9a6ZNOXCpnDZl0QeA92H6MtyLdDQK/BuE7BrsnQABERZQj4tiE95bAVaWlIgETeFluplvPO9FnJZrcIC5qX0IJ+H3LLfEVU5ju/JZSgcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788210835; c=relaxed/simple;
	bh=c1kpDXLLAzdZm5rs2ETbE/7TO3I2DSL19IHJCzFyRZI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XLvjE5tZ1821dx8Upeb6L6qFuAG3oqfQYgnpmp+GrBy1jt0xChh2uY0y9dskyMlbaD/9mhozzamaIi0pu1WIYav9YLIyD3f5Lw34fD3lD7k9RZBFtQUuu7KUq7GMbA27SbzBSzBwVROPxRPv7ooTnrnf3iLyA1n/bEMBS/63ctg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nXWSjwf1; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nXWSjwf1"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso45896965e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788210832; x=1788815632; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XKzkLe41uuu5Pw2n4p3dvsG3NzOD2toE69Y9PiVCR9A=;
        b=nXWSjwf1Pe+QzVmgqXnvx4/2Fk5Hp+41P10kd4zaUKvX+SHGXATDour8IvfhD/IB6s
         fwroRok09w/MNgNT9duDvII/bKzoH8t2ODHv9Xsq7KDsysEXqNliuIYak33sELzBp24j
         4AVuiQzLlUR4aHb0uBwZDtT8O8/tvjnHDRupg3rkSyFdU7Wbdo1oU/NUqhy4B6OC+jmE
         +Hkn1sC0J8VgGCDOnChkQZB7PkQWkvXRss9vuYq7wn0/Vnvlikeu/TxKuDKpOzf8JWlf
         H8cm46THE+z5JSfSHZT7loGAKrR7rNjWx70dDT+mYpE6UduVoS23XpkxYNJH02yMYd6p
         WlIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788210832; x=1788815632;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XKzkLe41uuu5Pw2n4p3dvsG3NzOD2toE69Y9PiVCR9A=;
        b=L714t7ysb32ERq53iQhQo2tx8KPLbuBR0EvjU6+7FbqNyp0ymW2KvJreZfmXiEJ6CN
         kxBECYggysTmNwCkPiyEi3EaqKemv20KiANsc8tP0hRQfgzhDSbllwVaoEHa8Z8YTRoD
         us8WEpbVhIZ2tybhnHy/0TtaCvmPZIf43n1lfTvzsQjxWX4YJxFZQgtnK5zEthk99AEc
         yObTdTRq+QGN+lIpDJkijKBzOuijJkZ7L/oOLxOFMl62jMc6m9jaBqxAdxSQ1wwK88qh
         Y5QVqs3iRIWZfWqTlMaikola0WapgENEpIRN8iiXlZZ3/c8BgxdMIvq3gsTYJ5EVkARq
         yfFA==
X-Forwarded-Encrypted: i=1; AHgh+RrUiueW7hq2zu6EdeM6D+nOkKyIRGlc1jkOPNpDbGfsaaIsLpGpHWxi6+w2usV4xW/Cl0QBc+yIAGHYxSA=@vger.kernel.org
X-Gm-Message-State: AFuF++n+1OSYk37MKDSdskmfq0nMuXNDLJ8P7UGTw97nb7Ne/HCTlUj2
	mciRbrBZdowu4vx5tvkES9YzKgQF1R7X4E8FF0IQ9ug2Vk/lLY5mGrHK
X-Gm-Gg: AR+sD12g63MUPdP0fkZmdqUgpWs6+u3AApCPauQ14+mEJwhvlsWbxjSY4wFB6iLAr5a
	c2oh1ASNrHvXdSal9eu/D3UIQ8cBL1tDIHl4z6BU2487A7vpa+SlEf4zb6mhVaTNH7/HM1q6VFs
	ZdPNYvYmZgiEmpa+94Qib+UNb/BJvUAeH8tkVO0rDIqvVoJuzxpczHPO4i16n0+sSIS38LJHS93
	E5dN1tkwXUN77bFNfInV6f72CPs+4TaWlFzSAjhsHzts2W8b0dkI8JoiutQV1V6hWMeZprI15fO
	miJ/3TcLnODU4D+hVQCb3H8a58guR5EkkL9rTi+akGwZn7gITaDIzyQ1oeksWpYjTnLQsLVqwm1
	8DgrCvctS4w6QM71Lh12VzrvERfV8iJ578jWxIvc/qaB49ac0of9k5++lqtrWvNj+Jp3JfV6cSf
	V6VhtqW8d0klYbFLbF8JAAiCXPaA9jHDI0eCUuoT6I6yQ7osWJpGeNWyA6r6DAOObuOBZ33VelN
	8/TP/CXkalWSb1RMO9p+7qinKrPmSiKmgGWr68y+gcXZyhHU+L/2pkiu9qKbDn7MA0mtlTdWx3F
	WtvAPSv7x6RbJlZpMFHXWBl+hS+E2Np+zt8lA0rh3cK+OjiWe2urVHc+KOFPvQl4BBhabOAMZK7
	Qpr2PJ1ueRcgPeqx2mSoSsMaw
X-Received: by 2002:a05:600c:3584:b0:49c:dada:30b7 with SMTP id 5b1f17b1804b1-49cdada30e1mr69494335e9.2.1788210831846;
        Mon, 31 Aug 2026 14:13:51 -0700 (PDT)
Received: from [192.168.1.187] ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce1754csm17695925e9.10.2026.08.31.14.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 14:13:51 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Mon, 31 Aug 2026 23:13:40 +0200
Subject: [PATCH v2 10/11] iio: temperature: tsys02d: reorder headers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-kernel-header-removal-v2-10-b92b580ef5eb@gmail.com>
References: <20260831-kernel-header-removal-v2-0-b92b580ef5eb@gmail.com>
In-Reply-To: <20260831-kernel-header-removal-v2-0-b92b580ef5eb@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Crt Mori <cmo@melexis.com>, 
 Puranjay Mohan <puranjay@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joshua Crofts <joshua.crofts1@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788210819; l=842;
 i=joshua.crofts1@gmail.com; s=20260530; h=from:subject:message-id;
 bh=c1kpDXLLAzdZm5rs2ETbE/7TO3I2DSL19IHJCzFyRZI=;
 b=/9T0HwT2kFNaIK5SxjBYoSNF4M4fJ0efFXJu9yZX4lr3Iv2RiwO4bP03Dc1illoS3q6eFB4Rd
 XZymG4VHGU6AgaEiPmRVWvPZLN1dRZiVyJocbctFdLobZCUPouIRnUP
X-Developer-Key: i=joshua.crofts1@gmail.com; a=ed25519;
 pk=RTDOoVwgeL4oFdASj9U+cxJuIjXuXk73zkjnGOJKbEo=

Sort the headers alphabetically and group the IIO specific headers
separately.

No functional change.

Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 drivers/iio/temperature/tsys02d.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/temperature/tsys02d.c b/drivers/iio/temperature/tsys02d.c
index 3ef72347456e..377e27b45fdd 100644
--- a/drivers/iio/temperature/tsys02d.c
+++ b/drivers/iio/temperature/tsys02d.c
@@ -10,11 +10,12 @@
  *  http://www.meas-spec.com/downloads/Digital_Sensor_TSYS02D.pdf
  */
 
-#include <linux/init.h>
 #include <linux/device.h>
+#include <linux/init.h>
 #include <linux/kernel.h>
-#include <linux/stat.h>
 #include <linux/module.h>
+#include <linux/stat.h>
+
 #include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
 

-- 
2.55.0


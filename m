Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794731472;
	b=uJKROd4zFYo0VJswTWRnXx/JF8SzHXBm8b31tVbEfe2ve2nxVXrUm1D2WQN2RXqBj3ao
	 +0nUTO6XQncsC8L7VS0sDyQAVNRfUAry8riw/JUNk2WAEwfgVCytlQZvjIJX/EsQGWP2L
	 uT2MtTBg/HYdCyyH5cUgtSZDcg0cQG6NrImGUrfC2nZvJA1uAvbVBDvXQcu4O4iqV9lku
	 gs1+O7ryTgirCZVO85e64rtN9Y7vAYqH0EYgmzINknaMDSfIm2I2DHbfcKEzyGPrJk8x8
	 nH4ajUqkKu1lIUq73jxgNifmhrs2rIhRva9d8D39TOZpEi1Asbvi0Ieh2rJRVhXZpSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794731472;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zuSlxP/wZehSt0jCPWAa5AKI3q/TR1ZMAo89fzmDo6s=;
	b=jbzZkeeY7T5zCc2VF5Q4FGgE3dG+ey/7tMfYo2Ttmule4YRD2dc73C6M1lSTZ6mBIHjj
	 +VUfYglsV1zpawkZI/kaXVYuFiiaI2UFXgOVRp5H8iIkl84oJrwJbGlD6ABFSpdVlcpDK
	 y9lUogP9782ok3/M/Co2v68JzrNF7jEFkNl8HMn9qUk3IHkGZXwkyVCJjKBXY5UuLbdzK
	 dGccmUS3E9fESB5mHFec/Q033SwHd9FkknGEObBYByYg15AaYMwr+11Q6c+l8XR+d7Ue7
	 f0reOLOv/j/FfzzpYzmUEGP3XvAJvUkfrs2LtRnox5MkwMOKsnZAIPVRwBOAeD+dPuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b1ZcCoPt;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AD5606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:31:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1AD5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b1ZcCoPt
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b4bd3d98bfso3655073a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794731470; x=1795336270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zuSlxP/wZehSt0jCPWAa5AKI3q/TR1ZMAo89fzmDo6s=;
        b=b1ZcCoPtryXV2AC72mGe3XYRkd6Hb9ynWgrJFia3BIgx4xI+Y/7FZ8ELverDnFrmfh
         KtJANrjQtLz5C7dpINAV+qb1ZbFmoR0ZtdnlLwJBkjRQRf3+KaU93X1E0rz+WixvlcsH
         Xn9R5YFcZ2iKe+V5CexVcEZOpV+UuZyoY8M29oPnrFQuyB1+5v2MvZx4iy8j5lCZeDhM
         Q+2whO4e/XF+u7DDPYaS0D7Iw1KmS6TEuVwoyR51VUl1CzjsUV93ra/H/buP12zXquNI
         7OkkM70vS2uRgz0Id/W0DID0tZBCazEGwsM1QBBMYGX2fvdUAIEJzefTBwAK1QtpiAho
         plzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794731470; x=1795336270;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zuSlxP/wZehSt0jCPWAa5AKI3q/TR1ZMAo89fzmDo6s=;
        b=kMpmELxpY8QC5ipkS3bTlwbMA846BTi7FKfjTrv85Nmabf/2hmaADKyPKiaNnwXg4z
         00vZ81St4uPiffxi5r3vgdOz07DJQEXGQRtW3UYNiavMcchk8gHNpe3/NrGHUnzGvqJC
         XTvIlzhVM9anRHkIK9BIDChymk0swwEzOGqX4GOvK9pIuwfermWAQM17ZvycnTPRKA2X
         69GMbPY95A7u3X8dQSSH4EetcHtq+pFEZULN88czda67+YsDHtFmEP33k3Ep0ZwhujAW
         MoXjnWd23qQ/n69YsQFpNRSzkbd2dJPNhI4zXjL88TJWev269Goa7UJrPXtWnWIOEa39
         gu0A==
X-Forwarded-Encrypted: i=1; AL+hErFT/RuCB5otIjzM+JEZsYq58qw2BB/TikFa6uaRYgXES0VjNozbvZIMxxkYwNDMwYGHRDPoTgFCG+jVKhs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8VfRmQRNYv7J6CZYVXcjVPXzLX0kasd8rKbgCMDHZ97/vHMOEk
	joIeL2AUaF1TV2ldIrUhpNYl5pQuG7Y1G8LAf139jmXjby/RE7Ckrb4s
X-Gm-Gg: AYBFou08Gi7xvx8h8pYa18z8vvcefyGPNsjy/B7k7/6ckgt4ZJ3OVFz94L2YCmZExsh
	fhsvXVmO9lAMb96+AADF4znOBOQt+L8OZjjlQ6B+yUGkY6nlyqQJ6xrgyiVMg+wb4AhuKwxaNJH
	7tPpx5LNJM/fuIX/o4W0LZDD/OdCzXqHdrjRnS/KMMDAVkgRbpigaFv4qz+4jc7DCa/ubBTfkCj
	G1GQIA07Ajh98odyvqv1pLz9Nz9T+yajZgTrBWm9mVFNhFi14dJrdeM2cn/8KNsI6KxUwfLBN+5
	NMY8dF23Eyb6DyZh/eBjKbsW4M2FD7/nhf7kI5KElpTmAhR/4X0rZZy/r3t54Z+mTKksDll13M2
	ECfUhE1VDMmoBLGoVhcUFv2obvcGQxkMAK21LhIvwQQFTgla30GVw5Tl1aBXm8SG+dREFs+J+S6
	hBIRHf69gqp4wO9l7VNtBI7Z2XuIaNlLbo15iT1cf+hQQPLORO+dXM6/vTETzg4E9FAkICrTdbr
	mzqL2rKQfAcl7cGbmBjnkM5T+5lz7m3goplKK3p1WZaLi5y1I/l87b6UgtEWUwWlVHSLGBMDseA
	VeMZSX5+tdo1GWo9rA9t6EiOhdOSkYUZwq661yTZLja+n/s4uiwTnGZOTxbVi97knM8Ad54qJm+
	ei3AeolAS1w==
X-Received: by 2002:a17:907:96a3:b0:c1c:4a80:30c4 with SMTP id a640c23a62f3a-c50962eeff0mr571434666b.11.1794731470128;
        Sun, 15 Nov 2026 00:31:10 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c50d9009bc9sm14019666b.15.2026.11.15.00.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:31:09 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] iio: core: Export iio_find_channel_from_si() helper
Date: Sun, 15 Nov 2026 10:30:49 +0200
Message-ID: <20261115083049.46840-1-clamor95@gmail.com>
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

Export iio_find_channel_from_si() in the Industrial I/O (IIO) core to
allow modular drivers to locate channel specifications by scan index.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/iio/industrialio-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-core.c
index 825cf7f32059b..b59983d35239f 100644
--- a/drivers/iio/industrialio-core.c
+++ b/drivers/iio/industrialio-core.c
@@ -325,6 +325,7 @@ const struct iio_chan_spec
 			return &indio_dev->channels[i];
 	return NULL;
 }
+EXPORT_SYMBOL_GPL(iio_find_channel_from_si);
 
 /* This turns up an awful lot */
 ssize_t iio_read_const_attr(struct device *dev,
-- 
2.53.0


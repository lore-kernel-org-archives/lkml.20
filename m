Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794936395;
	b=qP+g+ARLYWxABSJvzAXBbglLtUDHgp5e70Or/IrsDDEOfEXlfUm1Krmblrjf87pDRUxT
	 wPq6xUTex1TFHGhlnoKMD2lrl7Azu74K6B7zBG8sG++tEvi5wz5HAMIvyV22sKOnewAMZ
	 G0CbPJ3fOn+rLZWo5y5V5U6NLMNr7upsjXmBH6DHD+WBeCp8N5aXzjVYg++KDFpxG7b2X
	 DHBPAWK1vZL++XN+12NNsdzIn1bSdtfUvzDjqaEAPHEV4q0OZbohGsKWb7IjZ7qD9Tpyl
	 xAv3+DT+Q4vRkHhwWEXDR56wNN0xSvvFE8kx+5hbj+I1kxY6Qyonpgmb5MoxP/hPF/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936395;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ilc5G8/+9aQdYBwvZEflFTD39tX1L4K1WEy9bWOEMNM=;
	b=kKhDNonyiA1untUozr9EN6O/7btaFCJOXwspOQ3sJdNvu7d25wdAnkJhPLCXBTd/bxvW
	 9+lQKo4TpL+34FRSQQtDftrmFyFpuLNc47HXeq//dECQmYmZL2uK68wPAXCqIVuBf1rDO
	 C2za7ILFoVA0yvEeaYW8l7tI2IVfBAucb+uyEMWUd08s5AibmKHus7ee5ioMR7BVPxezs
	 TnB7m3wO0tt8zwySoKEEy0tW4j7InsUKK2Tar3C3y7lLUNFQ3f1KI+FbJF6a9UMCAfvRv
	 igrmDJgb17X42TUe1nFBf68H//pV1wzu8dT5vg0lZFXq8vMXR59JkI8IKcBe9v/Jqkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B80da3Sk;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462D8606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:26:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 462D8606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B80da3Sk
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-37198ed3727so1423191eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794936394; x=1795541194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ilc5G8/+9aQdYBwvZEflFTD39tX1L4K1WEy9bWOEMNM=;
        b=B80da3SkgBI11VadNDdAFufDegu8m3LbosxJ910Pb03+r/lraAIaeoWVSAyTuAKbU2
         /XWZf2yp0sgkjPdPjoEhhXBcw6eU+x9qN4PbpyqMlPcydZM0g6kAvK1LrS5diujAmtIw
         L/1aN6JoRkr22C+na+CwR4sI1dHML/+YZROfBtqQmD7+YuoDAd9fLAFTJqncqpcva6/U
         HMIdo4hI3KL3ALTOIUAdiTVTIy9dG3OAw6FTMW6hoJY/DKISbzvV569JB2VJR8tiAz8g
         rmDIebT1J3lhY9JQ1awTQ578oy6Ns2qnbPF4FQ0HlLzO7zq6l6xUQwlev9MXenEYi2Gm
         Q6kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936394; x=1795541194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ilc5G8/+9aQdYBwvZEflFTD39tX1L4K1WEy9bWOEMNM=;
        b=rKeGNPGChUQf+6MGi4tW1a73bGvHGzEZtFlAuw9ND4IvQQW+N7GfUu27nTjh1QeJ7r
         UAjU+UG3i/YWlvOjDILxXS20oM9E3p8r9oK8Z+PjlXu8kNdbjA0MoyNsanletdjDjYv5
         soumHOB1FMQM7dFXKdTP04kf8Op08XmTq2dR2BgrMiqKjnv2LaGdLAxHSTGGFGUDsE69
         naIq22a0gsNp0hw+gbahZwPqKVsVqyucI0BJCDCKVk6qfutDgBpVxVH50h4F1oeb7+pe
         N7c7U7ir3Jv36hXzjE8XPn9YLo3QUnyzpm7bg26IHoF4wa/C26naGp7zRIba3+dkmZ/m
         2T/Q==
X-Forwarded-Encrypted: i=1; AL+hErHTtciVKQx6tkJIcghMbYHG4xdWTpR78sYeI9eXxrDrvvyyB7ai7OU9SgpPtK0n+qSr+v3/Vbvh95R2TTE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gFWBvo8o7Se0xxWE3xSlDZ9RkmLWWT4cJyKANqOBlBqIED2lV
	04e1lsP7TsxKsPSo6gKGuQPg/tLc02U17OgmPTPzLpWTgrVIasSIWe/Y
X-Gm-Gg: AYBFou0guh51E+Bp4KEpw2N/jngDM/fJuwzLTlgHUfhX15XHHUd1I9omjfB6EzsbIJm
	kNWdVGAapHBkuMuBhoHwaPQOGgG2+mlA7rfT9uY8vnrFDY0nPx78K8JEjqRY68+gDGsQwg3trEP
	glqv/YK/bYS+Ed8yIJa+ET0OG4uoJqgmGCHfV6HYIsZwFRZVVbPqDKmQyOVtlkxY7Yw4LEd6WqO
	DF7Hz8M38S3VayTNU9KwF56nvji0xskvC9LQbEPyh77WxQjfmnQk37jp529+AIDiilAp+iJLrro
	TO5YFzyB+RIrVZKO8EaV4wwUbrt42+4IAWCSHurbbEgle2WBWBDxlZsUzowoVhE+IDGkVnCHVs2
	ldJa3sfdV2ZIMBC/F3wXN+t7IPrKth1oo4Jg4z9IElwVODNsn2m5XZtAdlVkYA81n0xD371rTG8
	hJVVVvuRrKqq8yDDZQcTG0pDzZxArrCJeTX02keIn1h4dTyW/Hdj4p20eYd2AFjYpikL9/oMl01
	XNXDsfMzjLqmA3XuBKVoVxObm5uoXcPpyRe8V7W+mpvcTM4IQU34A3rhLD4lYzF0Ev/XZxKIj13
	O2vNF/iCrmy1hp40zRpKa5NiA5yQF4jWw+gv2ejYo/qw/Q3k+bcp66pqEqXJrwnx5ke03XH/LOo
	XLjxnSzoxZ3lVgw46nWWgDapWrMu+3TBHOXEW09GRFtkB1UhnIry2sX5OsViLcRavyyJI9uP4Ew
	mkKMbiYlfEN6OAOCTfhkT2LD7Q52u4766eRL1LsegYN9FEAhtkei6LH0U7uNPBYSE=
X-Received: by 2002:a05:701a:cc90:20b0:1b5:32d6:6784 with SMTP id a92af1059eb24-1b53a470058mr2566794c88.20.1794936394335;
        Tue, 17 Nov 2026 09:26:34 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5329ec87bsm14263079c88.0.2026.11.17.09.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:26:33 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Gwendal Grignou <gwendal@chromium.org>,
	Daniel Campello <campello@chromium.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH v3 2/2] MAINTAINERS: add a reviewer entry for the Semtech SX9xxx proximity drivers
Date: Tue, 17 Nov 2026 22:56:09 +0530
Message-ID: <20261117172612.25535-3-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117172612.25535-1-kapoorarnav43@gmail.com>
References: <20261117172612.25535-1-kapoorarnav43@gmail.com>
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

The Semtech SX9310, SX9324, SX9360 and SX9500 proximity sensor drivers
and the shared sx_common code have no MAINTAINERS entry, so
get_maintainer.pl only lists the IIO maintainers and reviewers for them.

Add an entry with me as reviewer. There is no M: or L: line: the IIO
subsystem entry already covers these files, so maintenance and the
mailing list come from there.

Suggested-by: Jonathan Cameron <jic23@kernel.org>
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0017755f593b..f1fd14dfa448 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25448,6 +25448,14 @@ F:	include/uapi/linux/selinux_netlink.h
 F:	scripts/selinux/
 F:	security/selinux/
 
+SEMTECH SX9XXX PROXIMITY SENSOR DRIVERS
+R:	Arnav Kapoor <kapoorarnav43@gmail.com>
+F:	drivers/iio/proximity/sx9310.c
+F:	drivers/iio/proximity/sx9324.c
+F:	drivers/iio/proximity/sx9360.c
+F:	drivers/iio/proximity/sx9500.c
+F:	drivers/iio/proximity/sx_common.*
+
 SENSABLE PHANTOM
 M:	Jiri Slaby <jirislaby@kernel.org>
 S:	Maintained
-- 
2.53.0


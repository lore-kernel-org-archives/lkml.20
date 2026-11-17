Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913802;
	b=OiZU7TYbHNixaG33I3EkvaWjQJoyeKcMnV3f9u/uzoahxyIf2rEq/x4w6IycKfClq3zD
	 EdadmNz5HnAXFt6YiHxBDN9ImQBnV1/oy98Bbqz+ac8h4QViGCN5csLm4RMVH8ZbCmlGx
	 6cxoF38sbnIuShcM6tIa2m2jxd+Y1aC9bOBO4zX2ux8xG+sB9JTzMeovffPuu0bNnXK4C
	 YU/Ji5bP79wwap3YfEQ3YYWLPa1miUZP0VFvyYIfVn80QSDnF2Ad7MG1swUf9W2yI1NUh
	 y0VIKoSeDJHtNUSA2MpjQDYG4DpRwOJJaiXPM+LZBkUECOA05basJWUC39d7zpF5YaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913802;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3ISBPwk8qHeSYB//k/N7PsmIgbDqodoqheEua22OWtQ=;
	b=wsjaRDDCIJc/Cyi8P2EH8meFH/8fR2h0x0IYmEr8jp6T+/4YhDGW/O5Q4hSzsWWwzTR1
	 yjezd8XASXMRFCW2NcvOEGyWGAOfr7ERw163Oj0olUcD4MyLKwvl/YXVzcLP+KbG3L+RU
	 /xD1V7o2fvKmJufxEYwqI7YNyBYZ1Bn7I/HuyVXAbXyJIhkkFGGYTeLvu1Lp3XEZj1VS0
	 s7eDmGm1n+nssJK+CLGlMAJt/IMp6o9rqpxqlogSz+GdGkug6oliuP8ywZ2SEV1p3DsKS
	 ljvyfEvwyr9Ew50k92GxUj4GQt9emp1EzQUx11bg1Ppa7lN68n8EMVvMhWMMMHx82TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oc6zcNdi;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAA1606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:10:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCAA1606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oc6zcNdi
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3282db206d3so12303216eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794913801; x=1795518601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ISBPwk8qHeSYB//k/N7PsmIgbDqodoqheEua22OWtQ=;
        b=Oc6zcNdixWMFm76SSUKnhzYY8q3Nwt6oTBJekaFpoPYmoHhI+COcHchpx4Jr95eMTQ
         Nfd63rfs8Yo0TLi3ipADabObZ9bGEr0JC0cfc9xthBZsQOAA88TPcgCm3jM0udHc189f
         I8InqFADNT2BtjxtOItrIKnfBMX5cYATYNzllUrxmPCNnTyIkgQOg+n6GAFKrwdZzRtY
         eNribh2r/hC2ZKT1sEEoT/Tq3lbGEFPj56TRm3zPslCvlvFwo/SlSK3acvyKhb0xxDat
         uM1Bk/qca/JjR2qEP7YCPmfe7S2+32OFa9upCuTC+L3zgKANaT2jh8Z+qXMSSsMFUFoq
         +RqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794913801; x=1795518601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3ISBPwk8qHeSYB//k/N7PsmIgbDqodoqheEua22OWtQ=;
        b=KU4bbrTKt0QWj/Gr125mHUHHCh0Et3R70fr8PGxOsT8tUv9fXRNsJ3SvNjiU5r66Ys
         9HdieSMJ2Duaf3dy6xLvFDz8sjX9+Wctl3musB3nCGRsPKTYGLqcVu3+MRoc0UrxcL7N
         Hmglbm0EPve/kC0DEdg5aBbB7MynzdNCIZeaQEcjmuKhKxIjYa5HxQI6KPNBU6twqJD/
         o3Uq1H4ugZmVm67FWxiGSmZXfdSn3zA4AlLaULypPdXOyz0qiw9ev9P77xw4Kmbsjv/k
         rzfN/HoiMhCI2gkpSSqy6SbP8T/UoN5dTuNHMAKgjb0udk7IWAtgsYccFAEa7w/pFCsJ
         Qp9w==
X-Forwarded-Encrypted: i=1; AL+hErF54ofrNZIgPJH2Es8IDz493h9fhFuNQTiBkoRFBE+aaJ45RlPjmmYuuDYqx2DvFvOyAvpe5hK6ImCYTRE=@vger.kernel.org
X-Gm-Message-State: APuU4Z816QGHXT2NyhNQWkeOd/adNPkeGr09YLjMsAbrfjPklZ7848k4
	fo+Ov386YVmHStj7hP9jyA1Weh6Khq7ca2M6tl2P0sn2Dq0GMXADgGyG
X-Gm-Gg: AZFdTZdyYToSRSCZGGn4fvE8FZreGYoLW1RBh09jNzo5N/pQuXSHk+KVKKusVuq7kxX
	FULJpJ6KWh8xI1cV9dc0t+/ruT6HU+KswJFbzICsyNalMge7iVflcVjHI6xAmuwKkbufz/MQqVu
	vPW1agK5Un/Zqjh9s02QDjO4w31pMYajr6UtmFC3tvX2Gd7MbOcfEhNyFtBAOYhMXlLfMtLzBE4
	BfJRhp8hjHxft7TknwwiSSGHQdJqVhDWDvXhlAyPndso4pm6SRr1Xmqvye2Cl8uhM4MABhvWsp+
	3oJBhHd1p+LYyqOTt4+grJBqhoI1hJ9kSymLA5apIwMe3raTD6q8BzeIh2/fafFh2SeYykU18Lx
	C2F5+NePVXaIjSrRNOQClBVmsepsLlNl6pV7CYEVv0Y+pfAJrALW2W3fDkpE89W9phFnfJ4TuO7
	cvAs7CfrUuDpKZ0hxh7e9+F308IucQ3KgB0Pydwr1/ex7fjCvmFJmHZQQ+BTJfvzhuDc4JLY8nu
	Bkr/agg5vDORlMp0unskf+kgrcCklYpp3gaiS66W5F8K/O+xW4LIBvDZmLD+YysiEG1bK64u36d
	4oStTRMG81Rc+efBeGzxLAHFEsVfLAYaCn97zVdr5cMazvHsVB5LQPQhS+TNExe+WrXWDgTOhWG
	nmIlBtVGbkxNQu/OJm3zLZFf8KckMcnwP2EU8UMXgTEjDv52+KFeIPUJwCgdybS6O0rNDbboqaZ
	Hn9nGbIggnt35XqTY+9hwConxeq/YDNFLXDfhgkGQ3kPY=
X-Received: by 2002:a05:693c:87d6:10b0:380:c2ee:4035 with SMTP id 5a478bee46e88-380c2ee41bfmr2990992eec.16.1794913800913;
        Tue, 17 Nov 2026 03:10:00 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-381a55555dbsm5560475eec.10.2026.11.17.03.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:10:00 -0800 (PST)
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
Subject: [PATCH v2 2/2] MAINTAINERS: add a reviewer entry for the Semtech SX9xxx proximity drivers
Date: Tue, 17 Nov 2026 16:39:35 +0530
Message-ID: <20261117110939.214932-3-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117110939.214932-1-kapoorarnav43@gmail.com>
References: <20261117110939.214932-1-kapoorarnav43@gmail.com>
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

Add an entry with me as reviewer. There is no M: line, so maintenance
falls back to the IIO subsystem entry, as Jonathan suggested [1].

Link: https://lore.kernel.org/all/20261117031830.69ac22f5@jic23-hlaptop/ [1]
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 MAINTAINERS | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0017755f593b..94797863d881 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25448,6 +25448,19 @@ F:	include/uapi/linux/selinux_netlink.h
 F:	scripts/selinux/
 F:	security/selinux/
 
+SEMTECH SX9XXX PROXIMITY SENSOR DRIVERS
+R:	Arnav Kapoor <kapoorarnav43@gmail.com>
+L:	linux-iio@vger.kernel.org
+F:	Documentation/devicetree/bindings/iio/proximity/semtech,sx9310.yaml
+F:	Documentation/devicetree/bindings/iio/proximity/semtech,sx9324.yaml
+F:	Documentation/devicetree/bindings/iio/proximity/semtech,sx9360.yaml
+F:	Documentation/devicetree/bindings/iio/proximity/semtech,sx9500.yaml
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


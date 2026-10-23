Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792798107;
	b=i/YM9b5PLKN6iVN7gfIco6pECFi7yOEcaTeqH55rz9lRBoSwbvONISwFSG4l9thf1als
	 GCOFVK+a6+CWDX8vV/4OiZtoswtslHKIqYDdOBAbO6Cdv7FSEGjKfKtG14XnRtXLXHdIN
	 /KW8iVOSVqWVkjrEzKtkeS3EIdfwAWG90eso4j4TG2ky/OrCkdhKWrquhaNCJMiDV1P9g
	 SRYZT3w5pfLFPE3vApIr+HoMFpoXI4jPVyjpf71LLOeYBm2D4IWOoVIJxeGA02hR/4N+K
	 msE7c+rJ2JRNZ6/LbBVf9+9x7ezaNgF6x9ToznE7/H6xDnBl4N8E3fGqCGuvK5yMD2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792798107;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=973K8gxbulZk7sOwqCbvcqPXZuufZsqlMFSnTIy+oT0=;
	b=pFuGkSDQaYmfDAYd96DfZylkn/opzzhi807/xEx+cnoWJZDcBOtu0jn2kW66ytb3tYGf
	 DJZnMVv0hJDduQjIKADEUfx0X/v5tRTIdWJ2XoZcvXqQuTTeVicS1akk+Uj9QDxMO7NjS
	 NeBRmsKkpZqGa7gJ5solk4tie/e/fyt7KZjPYz7tseoZ4IGaLCwJsSzihh/1BcXG7mROn
	 d+l1mqjmqSCv+WrtBPOAmmZjHOLqqJjxBFIfDRJ1jue5H4N2u7RV7BnYcHeHPZFMDmKi2
	 RiKEOYpldlRdOUJSALNGaslk8txdj2oxofb5MmUnQerBsLKpvGbgQIJgD3nbO0eMmQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BQbw40QD;
	arc=none smtp.remote-ip=209.85.221.179
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA86606A329
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:28:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BA86606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BQbw40QD
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5eaf34452a9so1150674e0c.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792798105; x=1793402905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=973K8gxbulZk7sOwqCbvcqPXZuufZsqlMFSnTIy+oT0=;
        b=BQbw40QDAKRu8+3TjMKa/v8X7jcocc8T8huszEtUew3vOrml7+lRxcp/7Si4A1Y4DH
         QhFMcRGKocT1tP0AHyjN5tfdno1w03Htt+NjNdKwlLtw3MudQCxZyJ06Pz6y6ctOnsM/
         TUySTs3t6CQABiZ2CT15a+mJt+Doq02KNtrnCypa+pZbuig8E8EsndW/kICBd8tZlH8W
         wg1PBfh29+QP4h/vfrK7zHVz7tT2i9fJCzPa8x2A4yBSEEG4pNbZk+37omwhUTHx/pq6
         v//msPQ0ZeCWBVYZcYaXEQexRnuZokQ4dzE0Z/Hn2BBesmck4kHWVz4OiK2XDkV+OljR
         pymQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792798105; x=1793402905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=973K8gxbulZk7sOwqCbvcqPXZuufZsqlMFSnTIy+oT0=;
        b=LeA5/EfeM4JrPymLExhhOcDYP/en7viH/u3MKRkdF4F7sQzbfInJxeFPkfhLsSGuBS
         lb/HpFwYZIfM7KE/Orwg9jx8TnsLb4mRvrntKz0SikkeoBvNBXsmvAE1YihPHxaDbmxt
         JuE9Sr/0LPvaZ/c79R4O/CEWSEp3q1hc2kjlfvoeGDyUmxfIruvNhXRHay2su8OrRuXL
         tc1ex0sw/FTuoFRj+s5s/0rem3pUL+PjereEjhxJC4P6RzLHDLcxuz6xsSJkoexve0fS
         SthKd69jkuVXDzxPmyFUz313TsLqoHD1hjHEDc9Y2j1z1jCW5bi/MExZx2+JVNMN0uiu
         iYFw==
X-Forwarded-Encrypted: i=1; AKwUvByrfFMzKAkC2r7MQzo6jPM1idByuLOFpsWfZoKS2pEmzY7w8v6yC0S6g+VYiO1+qYZzSvRD9FrICwD1wKE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcuYoxsHsR6dQklY3ctRiBBbflyFIby+wAsLI5Y+9/YwWhkhxO
	X9LJvGlT5wBnU3CA34NTfPv6umyHxwpk7qwaCjVc2OeZVCzVaSywdY7K
X-Gm-Gg: AYBFou3Z6SWgFxne7pljz3prUUcd09c+NNUykUNagGSyAhlnn5nPS0/09GGGoEQFRXC
	xljUh2JvmlAaVEbpA9LuFBY2OS2nu1YZNCGKZ2ceazwrC7RXMGUwW8O46KV6+HEXlfhryHK4hU7
	xXtYgWRqmmTzQYZYjXpnS8QC1pJN20iaXJ6qi0Rocjm82644gV+CBME+L7u5lOjbNCEOg7YK4ou
	bUgv7AO5WGYz1sEh8tx/7lVVLYXTmzYItZzGMG9qtpkrUztvNRZF836yWc3GbHozIB9dlXx1aj8
	c+dZYUmSAtb1+w7Mvc2LlrbUkxYAQX0eAHpHQYL2vDlk1GluSGdPEEigpDrBmyt1xlC8bDimeCo
	XTIq8/vJrcrNiJrE7L68mRGOaDjNt6b42lwXU8+CChqaCTBzbeKj8jD3qSn0DdbAi6fhaJFxyla
	TzWyt5gCvPXgSJ5uuGeNZpwIwQI4b06fci1WwlwveKeGCpJNfFgOECBVWFXaWWZ/yjnTUXOOYNz
	8+LjqFADo+v9q0NOZQoRAGeL60MatndXBfhxFfe5nG4YT+Y/rruUNmCmv/i0uzfIaxAbSgmkkvg
	qhXueUEcglgGVEzHRdKSKR8=
X-Received: by 2002:a05:6122:e20c:b0:5ea:c3bc:c54b with SMTP id 71dfb90a1353d-5ec235319d8mr97456e0c.3.1792798105155;
        Fri, 23 Oct 2026 16:28:25 -0700 (PDT)
Received: from Biostar-A520MT ([187.94.15.233])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec234a940bsm418764e0c.15.2026.10.23.16.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:28:24 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [PATCH v2 1/1] MAINTAINERS: mark HPFS as orphaned
Date: Fri, 23 Oct 2026 20:28:07 -0300
Message-ID: <20261023232807.206097-2-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261023232807.206097-1-breno3011alves@gmail.com>
References: <20261023151850.96475-0-breno3011alves@gmail.com>
 <20261023232807.206097-1-breno3011alves@gmail.com>
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

HPFS has had no active maintenance for a long time.  Mikulas Patocka,
who is listed as the maintainer, has confirmed that he uses HPFS only
for personal data shared with OS/2 and is not actively maintaining the
code.  The only changes to fs/hpfs/ in recent years are drive-by
cleanups, not functional fixes.

Mark the filesystem as orphaned so that patches are routed to the
linux-fsdevel mailing list, and drop the stale maintainer and website
entries.

The driver remains in the tree.  A future removal can be proposed if
no new maintainer or additional users step up.

Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 MAINTAINERS | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7336600952c8..83685243c8f6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12064,9 +12064,8 @@ F:	arch/x86/include/asm/hpet.h
 F:	arch/x86/kernel/hpet.c
 
 HPFS FILESYSTEM
-M:	Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>
-S:	Maintained
-W:	http://artax.karlin.mff.cuni.cz/~mikulas/vyplody/hpfs/index-e.cgi
+L:	linux-fsdevel@vger.kernel.org
+S:	Orphan
 F:	fs/hpfs/
 
 HS3001 Hardware Temperature and Humidity Sensor
-- 
2.56.0


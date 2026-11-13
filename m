Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=87.98.180.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794555894;
	b=qeBS7BRCrvKEyB27vKX3A85XS23fDvT18zZt+b6P2Jwk3p6lPblXJljKaoqBafi3bsHl
	 gYEFOhLWmmxY1c8rNEFVNAgbPybuOPtVcU02mstuc1Vjf9Wv8MPF8ChGrE/LpILhv104L
	 Ij1Fwh93T1EtyBrzNr4IU9Xlh5u5Xyo/Gj9o7WZg4JhQuv4b+GiVbw5gB4NRgz1KBdhke
	 abdbeUFOAjhCfeEXxRpZ8g0VwzUDdFDPN8v4k4+hek/tkZM9L/rW7XKN0K4IbwHz8uGW3
	 NxUTQw347NAuQMSce+WK5VTigBAZ7X+nuSZU2h7ybh23+/NWbhuoKqb9titLNbk9V6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794555894;
	h=DMARC-Filter:Received:Received:Received:X-OVh-ClientIp:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:x-ovh-tracer-id:X-VR-SPAMSTATE:
	 X-VR-SPAMSCORE:X-VR-SPAMCAUSE:DKIM-Signature;
	bh=geFjrhTrW/m8F1nN4gMrD2uUOWJQ73zEFUUwYTOtIgI=;
	b=VVJNwjOi3lzg+w/yTkM+S0VjdqMT0ZVSVHF+Xh3wdm/ujRA3b94ZCZOWIzRrIOzpZ1KS
	 XZ+cte6SiWQwiDTryCmkoSFqXk4CgPJeUcFKOUZr4Wi0YJbryOPU74LdEI2cbbi1fMUiO
	 DywOS/LJRiO7P2PPS2eTUOgfm8xo0SyFlEcNwgOZ2zGylZd7nWYDuUV5i5mMsxlKHiLpx
	 ixzCnpr7jmWaetIplR3gJzQAqpdR0ddR9MUpdNZZikBtGRJ1HS/UfIMlbdbf3ZpKS3how
	 Q/O0rTEignm+k+4PSYTO2swQ8rvcQBqPQeuF+kTFRmiBwjZDaczLBZzgl4SDQWITENg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=3mdeb.com;
	spf=pass smtp.mailfrom=3mdeb.com;
	dkim=pass header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b=Ukxl5whR;
	arc=none smtp.remote-ip=87.98.180.21
Received: from 15.mo581.mail-out.ovh.net (15.mo581.mail-out.ovh.net [87.98.180.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48FC606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:44:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B48FC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b=Ukxl5whR
Received: from director8.ghost.mail-out.ovh.net (unknown [10.110.54.164])
	by mo581.mail-out.ovh.net (Postfix) with ESMTP id 4jQq650w3Yz622h
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:44:45 +0000 (UTC)
Received: from ghost-submission-7ccd8bbbb6-cl275 (unknown [10.108.42.118])
	by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 7045BC0105;
	Fri, 13 Nov 2026 07:44:43 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.109])
	by ghost-submission-7ccd8bbbb6-cl275 with ESMTPSA
	id Hrv+B+u/9mr5jjgAjijQbg
	(envelope-from <filip.golas@3mdeb.com>); Fri, 13 Nov 2026 07:44:43 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-109S0035fd8fd59-fd24-4b76-b524-baffcc7691da,
                    F6EB7A3E9421D9EE3A955D9585EDAC62A977302C) smtp.auth=filip.golas@3mdeb.com
X-OVh-ClientIp:37.47.248.243
From: =?UTF-8?q?Filip=20Go=C5=82a=C5=9B?= <filip.golas@3mdeb.com>
To: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal.kopec@3mdeb.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	=?UTF-8?q?Filip=20Go=C5=82a=C5=9B?= <filip.golas@3mdeb.com>
Subject: [PATCH 0/3] platform/x86: dasharo-acpi: Add fan control
Date: Fri, 13 Nov 2026 08:43:44 +0100
Message-ID: <20261113074347.2301465-1-filip.golas@3mdeb.com>
X-Mailer: git-send-email 2.56.0
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
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 13829710031199793135
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTGasz4azIijZcfQ44mRKseIDVRsJQHwcOwAbF4H3kx1SQD7h3hkz98gtOrr6Bng12qdsgmykVIz6lNsTPEFTmCD6ZK/Twk3VftjDcXmuV/25X9lwtOXhEMu52cE4AcRJk10sROmbG3Sgoi5fj+FqSZZhI3aMxRSsr4S0nblorxNaY6siLWkJ7gI7glRT5NcyzvfFnpqtj1OIBpWxKlgKoO+J1IYkAc8JIXvwvTuryUeHm1rK3hjDDSowqChUb86FY5dKt2QiORJ+XCwNsyKe87PpN6xwRVIJhlLPfpOxYH/PkgjadnZkuPXF2x+ZPDWpHRNbIJxa1RRHueD5rSGnveNnYpO8Z0Rk98CX6d0ShTGkli35B9QZG9yY7anDCt7LMYFLy3YmAQ68N52y6nHLymJ5AZwznf4K8Tc2yuKvrDa2TOejWdVoM4jd9QixYsdReXctnMr+45lMxFJkDCLp3t3K1Ug+LqO4H7HYqcBX5bEZSXoLYJa7OQuGFA72hYquDvTI5yGtIGf50xWn8WenIKR0Pnp4XmseDdoI2KMkEYWqkyFZb3k2Kp6MWOa7Dq09kIZnKJnTgkcfV7aYS4NTorqLggxxLwMdv+hjcWkUF/9VT1wU0FrLd8fiCKKDPlJuAHABRLQ8RC3LFbMhzxlgG9RbQQg46VgOqe/fMRelLmSlg
DKIM-Signature: a=rsa-sha256; bh=geFjrhTrW/m8F1nN4gMrD2uUOWJQ73zEFUUwYTOtIgI=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1794555885; v=1;
 b=Ukxl5whRcGvht74lukK5aNZ2blRrCJrKkkhwNnyy32XcAcy9E08Ygu2tmMCNxSCu4Q09NU8+
 eAemVeV+FDFB3+hWHZsKfQG6HxRae8v8Y92O7COhncwCXdhjxwnX/0Mthd6nHoxaSmmg2LEMnx6
 nsXTqltJ5Kyly8YtPw3oaoFL2nXHIdG78cFJnyNXMh+xNhJiqkXHjzC5nmX7SSADO8c8QSCVr6N
 ySTrtpu8fOnRrUNhMxRLQdO434xZ8TYktROCwZ3K3fk4TlB/iO0Io17TL/0+S8EeHzEc1ScG5oM
 OBDRJYkE7kb1n7TGFc74kS6HC+qv/z2t5evF8X178M/zw==

Add the capability to directly control fan PWM and configure the fan
curves. The initial version of the driver only supported monitoring
the fans.

Tested on a NovaCustom V560TU laptop with a pre-release
Dasharo firmware implementing the relevant methods.

Filip Gołaś (3):
  platform/x86: dasharo-acpi: Extract dasharo_call() from
    dasharo_read_channel()
  platform/x86: dasharo-acpi: Add fan mode and PWM write support
  platform/x86: dasharo-acpi: Add EC fan curve support

 drivers/platform/x86/dasharo-acpi.c | 317 ++++++++++++++++++++++++----
 1 file changed, 279 insertions(+), 38 deletions(-)

-- 
2.56.0


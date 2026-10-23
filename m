Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792722467;
	b=Eu1ys5dgi9jEAiN1YA47N9M6h4uUykn2JQgU84Poh0ksOeETVCdFH3Han+jWPZxN74gS
	 9vVRK6Ol2kEM9EuuhY5bPsCIoZm5zWYHHgOqaJfiKjfaHADJZrvlTOa1xc8aCRcMkSk0b
	 ZKeVN2PZdB8tI/vomX+2X9Q0Q/fLDiVpnIy32ZYOXQIWyl66oxLz8xJywQlEIPZWmhnOY
	 9FmWVJczuC67fAJGaOJobFBK2lztQ/Fz0+eOCFnKdqE4tbEdh6qWpgCwWtfEbrvE9SKEj
	 zPSUOD41AKgH7qJVXMtpYzcHOVMBSuv8GxnbJ1uYvpir+xrzHBCp+eEwU8tZirhP1Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792722467;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xkWlWpp4ZDY1peCYRRrpWTS72BRYKnKp7I3EGpvyDNc=;
	b=pmaW2zdn/4Ehv3lBwXhDHX/U5ZSoWJqTjICnAdLZeJLBialEjOx3sRr5Lnx+eo509BA1
	 rLMeZao35sJdzGouK5MjKQLcWT/I3OM3rG0b5x/K/2awTF2eohRb21JcVRE/YIFbIP878
	 VKH0cd6ogRGdJsY2BmCgDaK6RtUdoksZG2AU3a8IIEeAWMVwMnrZDHCMIF91kVbGjjlwa
	 5IYVYqHW4H6xYdodacy24LaQ7jy0v13mmmDKEX3U3mdjd8rvSLhinHTETo9HRxTrnnhAY
	 JMPZzltpXjY8fV97tSWvfrG3/mF4hSUTVEH7HWp3k6+OPId4iPjqbCorWCQfjhDaY1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vjxlES7E;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD46606A319
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:27:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AD46606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vjxlES7E
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a214af2076so545295e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 19:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792722465; x=1793327265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xkWlWpp4ZDY1peCYRRrpWTS72BRYKnKp7I3EGpvyDNc=;
        b=vjxlES7ERA9ylXyarlVH8ZtF18N+6PhWmD9vSbbmhm6v2WgHu8ISe/mciBrDfAFHEH
         JBJo0XzmZIFOzJ5PMNTuV0+PpLsqQluFgKhX6R2Kx18W0R44IWnwOB23aTbjaNC3fePn
         UW7Xn7sNMvDK7cqfgtx5Jfx/7oCt+Z9KyACg44sxEYvGAK3ZaNxEyJ+YADNRjYdYRpcY
         gs/2Qmo1TkKuLZ0f8Y8VsvJeV6PCAyu4SaYu7llLG4DYD+bVyOcyS3gI+9JmQA+y6xli
         iQBbuhSrn6C+EsHq2iKAqBJOfls+XVM+PiV0O0sA2Q5brbBJ5CA/bfMZgwItgGe8xyRJ
         TV+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792722465; x=1793327265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xkWlWpp4ZDY1peCYRRrpWTS72BRYKnKp7I3EGpvyDNc=;
        b=K84O3GvIdqJFUQVdha04HnMzTL/Y8iT9gj3ZXzzRL0W+MTL++F0Gj4R/5QOaEtSNKJ
         TcqFar/Q2d5w+FYa5zPAW8/WztTCT24WsZ09v1Fg8qluU2W5PhFfHndUNyNaZNm6Ktuy
         jUopmogVPR/9OISOSL+cGi9TK4Te3LM0mMAUrNNJ5tmGATrbQ9dyGHOoiMqfsglf1FeN
         oIRiGHhCZ2l2pIHIqpiPde02appz5wWbsJlNhXTEYtIOuMlDwroSmcAom6+0AwuSuF0f
         sGIVQK3oHu5k1diSsfkIFiB1UZuxq4D6sn8XHSqZPETH1vFvuY1C38VhKD0t3mmuyJou
         ltYw==
X-Forwarded-Encrypted: i=1; AKwUvBzBb+n5f3OpWtWPTiZDn8h/J+R7rr7uGemyxVh+eY02etvO1pujgh3+CWL2pXlu8Tfd6j41NGDDgP+WlAE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvf3eucJfakWzU+7SI5CQNwSQr8QD2auoPgpwCG+i236C6n1WR
	rApL1z43a4Pt5E61OLSjHT//bBQoIbcwSWoO9p48UyhPvL/YBECVEvb0gDQdjwqkgLU=
X-Gm-Gg: AYBFou3Lc5H+qLggD8mKSHNRURrt+/yof8HTXoZSj0s0Vu/NLR3aJavbrC1ZyhScSGh
	pRW4yVDifJnkHuQE2xltXgX8osohRjSXRz33qqv1MpOj0jcKSCsDxQhAgWD3VPIsO5C+XnNWC6o
	zwqV56quzCgXI/7vioKOe4Zew/iBKuthtb1UXa1KozOOR1j+SDeNfkFamrfF9F3tz6W4w2LPGnW
	1JHjPynBasOiYoWN4iOx9CC2Ss9foGCG/wjQHH8iCI8xDbfOxFLoiHqSglKZl1It7NmodF4Ioom
	Uz+6gryZ/mWdWpPWYbNdyfbxKFOlx2OI5DHFVCH/p/QmfAhI3hPT36S/W4YeWTty5gfGoxZIi8p
	KC/yHVYK1bMXDSDecivjAUt5Pyx9O5lrWQYYQgj+pNoM+GaHxydBvLlhOeiTW1PmAz+0pWc+MrV
	/7YpILNQ3tkhV4PRVciNGC/5cKvX/AHnz5lm+s5jGmewhBbJ+MOg8OOZkl78m7jRc8+E3e5sSzQ
	al767dnDX54lfJ7ehUEXsgyKlTgxGKpne7eqjnEm/VEP0eQ
X-Received: by 2002:a05:600c:1909:b0:4a2:1398:dd05 with SMTP id 5b1f17b1804b1-4a21398df21mr9609765e9.16.1792722465522;
        Thu, 22 Oct 2026 19:27:45 -0700 (PDT)
Received: from sagittarius-a ([51.37.82.204])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a210487d16sm39075525e9.15.2026.10.22.19.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 19:27:45 -0700 (PDT)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
To: bod@kernel.org
Cc: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Amend Bryan O'Donoghue greybus email
Date: Fri, 23 Oct 2026 03:27:43 +0100
Message-ID: <20261023022743.3763279-1-bod@kernel.org>
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
Content-Transfer-Encoding: 8bit

From: Bryan O'Donoghue <bod@kernel.org>

Remove old email address and convert to current kernel.org address.

Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e8d5b020b7614..2276751fc8c45 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11313,7 +11313,7 @@ F:	drivers/staging/greybus/spilib.c
 F:	drivers/staging/greybus/spilib.h
 
 GREYBUS LOOPBACK DRIVER
-M:	Bryan O'Donoghue <pure.logic@nexus-software.ie>
+M:	Bryan O'Donoghue <bod@kernel.org>
 S:	Maintained
 F:	drivers/staging/greybus/loopback.c
 
-- 
2.56.0


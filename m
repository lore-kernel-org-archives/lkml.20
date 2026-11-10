Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794321775;
	b=RHYmjJYnAJatR0bKdZc+LAW60c//8Q7geeLYvr2rq3MR47kGPqwi9Bmc5gX0EHABDEzg
	 NWZwbFzm4E1ld8YM1HQ9aJcy0Hc8ycIdu1erZbFnkvyQ93Tgh2ra1gr5yf2J1C0LlTIH7
	 Vki0peeda0g1Ce1e4drkXlOs9l/7kraCgrJb3IXB2oX1sYlzwhUBZfdZq+UdG1RQzan14
	 6ZeULqHxwEL4dziJb+in6+b3ltqZ3VuaOf1jsYCqIexIbg0rkBNg9xkXEMzb6IqV+gLg4
	 osCCS7o+3KOkTVlLIylsTXe5vMLmZmkHCsAAT8ADJLd6yHHnUw7mE+fxz1DOQb97vCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794321775;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=FyR1eRHBGrfB78SYu73CLnspxYBcARWpLcHazJI/mnY=;
	b=iB6XgPwBKOzQXx/pwuSwlkpDfKsQxRBAMLNL5iXjoxEGpk4aFo7SK+B3Rh5gJTdlESCL
	 UXalFIRXoi0AGZGYnoGhiux2yhrmEBsttKR6XytR0CRVKlA8mUQ5ke7FKdh9nHfzuiyr0
	 4IzgYexYlyRKFUWCzdx7NICk03nd9AgueIOKv6gfjcdM9rhSDCjgSHuwwtyhBASSRaIob
	 q3qm8H0VDdJrbRqZ5eXH7mYUP3QGrf+wvRz6Kmy0CQn8ePcr02UxJW4NClEqxySv7l+de
	 IOa+QE4OxNNLo3485pf9raAjXkNm7AFVcfi0fMTLQt/MFq0+7Ko/G4rZY6rlXS+xX2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=SdQmmc8u;
	arc=none smtp.remote-ip=209.85.160.45
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C1760A2639
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:42:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81C1760A2639
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=SdQmmc8u
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-490d838b425so1095960fac.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1794321773; x=1794926573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FyR1eRHBGrfB78SYu73CLnspxYBcARWpLcHazJI/mnY=;
        b=SdQmmc8uypmUTAEP01ZneslKLhvqElE+/RKnTDTraiFomw0flpaAWGixIWiDs5qKYE
         jeJU2kPttO7sMmCZrX6cQ+PVte40inXU0yzvHe14lD99x+EMZfx3mjTSyjpYMP7sY/jR
         jnsyAXcpi3p2ITOKiARh5Hukq2hYc5qTDeWwywZdQ9ppFar7WQs7FbcuTbzxeZERDJzK
         HvWLHsuLQfZYt4p2mI1/jBHBdeO4Bk0YrFLDpLeMuvCHUCvWwZykb9/dfowQzphyqnNi
         2T3Ike+aMJB4Is6GsDpf54XTGTzfqY2NC9SkNDwgzOsewHZOJ8JG3Z2+KEuGe5t7r75K
         akHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794321773; x=1794926573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FyR1eRHBGrfB78SYu73CLnspxYBcARWpLcHazJI/mnY=;
        b=Jc8ZWZvrTsmhw8a8JoO+ShYBkuzy8h8w/5a2N3ISe9gRnaA69YxBBfy9OZurjNUXAa
         WiPb+1Vosg5xACc7I60O7tUt8vNCoFawCKvwndtQ7JVJy9IH/juh8UEywiAehJQSW0lG
         IQyFCS1SgtMx/eC47Xhf7C7A0QwxAhSUK/D7KPgN0H9XEkc/xa6qSV1C77VGHcYy190A
         3YD+3o8odQggTjQSIFu3UDUwptHdpbZ+0ydKkNZbOLXYUn4LqQ8iyCkIhywm0rEWkpy5
         gllGTQN46FlW3axuD6efDCOa45jjBLC9NyF27/qIg7cyfvyaZPHnGr6cAUfK1Rn/xfCN
         o3ZQ==
X-Gm-Message-State: APuU4Z/MDQeAou0xbEMtOibjILcu2BVq742gH7DmTLBcJk2rs/AQgsbg
	Z1HLeyhauNdk4if+aH2KEI3Um4ta+n1NPQ8gnEhJfKoB18CaP4kGVs/b4nuvEJTkbKCDCDRePEO
	ONXkSiMvX4g==
X-Gm-Gg: AYBFou2FSGpMdmFCKpn6KSm5iA+rojIYNDZk86HejpWJ/xf2fAOdXUbNcG4oK6NRzIv
	QCNzuAWTM1NpUdtJlqLaWCTqQUxh5v8cZZotIvqgto97Q9sy8SWqCgUJqr8elrK8uYqJ/pMGcd7
	mBBFRdrHwrScrTEu7bqMD2MuPEOkwEHOdeVQRhXS+t5NdJK6JKSp36fVOLEUg04+EnOEXxTplNV
	9cpSWVBAvlKpTKbduBn1pho+Igq495ywWA5B9BKgq1rjPXIVGdMGMYb1/pSwNat1BrzYNBohjm0
	flgEht5XtD1q5kwSACE+7xW8vG65YUmhtpYPLGiQM3J1Q9ReL0GUs1V3rSSSGpSo2HhVLiZ0bYP
	fPjGO1YaU1k+xJeczACgkPaZyX1H7qkwFYsaPKzN9klJcmbIHukXQKYD91j59V1Qudt+N/sG2AK
	Hyi09zuqmiPMYvhCRQ7yrBnHkcnH5mBAfzlRKuYLNRUbUEZn4D8EsNlVmJBOyU0utJiSdVE7czd
	E3JBXnohGqX6RzkVXa27slFLNFjr43YuLRCNVMgcpPxg4gIqYq3aNrNG11zzatGTPsBYoA+7zVP
	OFGD0PFforBauDhIXnO/czsQo9RShjiR1d5HSTphmbAlUKvYfBu5Jbw=
X-Received: by 2002:a05:6808:1787:b0:564:347c:5a7c with SMTP id 5614622812f47-5683cd801f3mr2300661b6e.59.1794321773462;
        Tue, 10 Nov 2026 06:42:53 -0800 (PST)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56902ae3906sm2262112b6e.2.2026.11.10.06.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 06:42:53 -0800 (PST)
From: Alex Elder <elder@riscstar.com>
To: akpm@linux-foundation.org,
	kuba@kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] mailmap: add an alias for Alex Elder
Date: Tue, 10 Nov 2026 08:42:47 -0600
Message-ID: <20261110144250.656840-1-elder@riscstar.com>
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

Add an entry to .mailmap to indicate that <elder@riscstar.com> represents
the same person as <elder@kernel.org>.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index 7fb33babc9312..f0478024ffc6b 100644
--- a/.mailmap
+++ b/.mailmap
@@ -64,6 +64,7 @@ Alex Elder <elder@kernel.org> <elder@ieee.org>
 Alex Elder <elder@kernel.org> <elder@inktank.com>
 Alex Elder <elder@kernel.org> <elder@linaro.org>
 Alex Elder <elder@kernel.org> <elder@newdream.net>
+Alex Elder <elder@kernel.org> <elder@riscstar.com>
 Alex Hung <alexhung@gmail.com> <alex.hung@canonical.com>
 Alex Shi <alexs@kernel.org> <alex.shi@intel.com>
 Alex Shi <alexs@kernel.org> <alex.shi@linaro.org>
-- 
2.53.0


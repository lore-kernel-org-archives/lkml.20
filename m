Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794466279;
	b=j6UQVBWslysG2TLAKU54amEIcqySvTf4nRKDBN3K4PUmQ+sQ6Cxvm7y1yotQLYb66dZj
	 F3NHBtIE/59SyQYi6JLSJJQjiK6csjzMGFkiXsSYE2FgUApG9Ddxu36Ml0bRXzozfGt1Q
	 6I+i0P0CEH7/jN2+bn0R47cbbqigG8kzgukWH9H4x6r2P+pJq8LLHbBD832wI5w8608OD
	 U3lEobQ2+8zGBVulIIEvtsmFj9RGTxSmRWfQeDu+0818mhGsW9tpTDTmvtKKLlYbn4//+
	 eRoj73H+//ewOcPjvK3zuaYZoiUCuN9qdcSBohG7Wjp3xoM0RJn571RJS/W2NxPd3/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466279;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=y4XjNgQPHn8vfXK6a1wosIhFOQwX7Ap8Le+1JlmH6b4=;
	b=gszdInCafudEmwTRyO9EJ6OqZs2I5dy8wdO/VHwg+k50womaYQXtlzccPI2zW7cI9wFf
	 iH4tsllCRnaM8eXA2YxmvoZWwBQqlV3dvhJUdtmlvkLEJH7xADIiO6hegi+TDNU20D0DP
	 eALxVknv9YI2W1bfSjFoi2vcYcJ2VwCqm4pcZ50+zCHO11ztME7J6KC3TRKM7mJeuW2jG
	 zi1JokZZpDy9aMWHRGT5GKlLQityv/KUnbA3JZfJfB5e3Ta63Oh8nxhLtcbso0NwHBEBb
	 LuHPGfY4Wi2UqPUtoSsdpfsz+6Pk3tFyXexRZhawklU3AdfUJppwChSRF7sVHGMyhbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sv+lNKsz;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C974606A88C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:51:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C974606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sv+lNKsz
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-37600b0db49so506186eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794466279; x=1795071079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y4XjNgQPHn8vfXK6a1wosIhFOQwX7Ap8Le+1JlmH6b4=;
        b=sv+lNKszUjGRjLU71mdMXRs6USKmf+ajpNsLredZ5TwyQnpfJqCZv+g/swdX7GHqjV
         QNYIR/4Bdcemq7WYZts6iLR2Mv5fJx4rur2UfNvISKUR1ZvyJLr+ZbTF8rP68LO4Yv7v
         IsVL2GWFfmaIgvFl9Dv4k95WBjE6h2Y55Eu0u0yTCYHPX7LwbLJzS7vxZeKsCjW9HKxZ
         tKHA6aGGZ7kO3ToVfzU0R+AbuTLxBxz8lCrlAmhTH+UHEN0zbSm6jdRr02tfJBuwIAw5
         M/ruwW0zfq5WPBNQRvy2rAB01xh6RxDjsoIwayKZ5M8BwT7/iVwMWhVK/mKGoQGlFDxX
         rnfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466279; x=1795071079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y4XjNgQPHn8vfXK6a1wosIhFOQwX7Ap8Le+1JlmH6b4=;
        b=1st6QgOFxhH0MgursuTZtaVwLlX47nJXnD1QUTrsP3+mRu11heHXWdU9xUZhMRtvHL
         lECnskQsAED+6ml5wHrD5orLjkzTfV0vULSPXiqG7w7MVgqumroxaOKKXLmOgdy+S+7W
         VwstP2Zx3S3vXNgyh9Q9nu/Ellv4Id/8sabga5YljiKC8BDDYtg/8p2Y/bnz2ERgzKxN
         fQDfK6LptbaUVHhe5xn2VVumb0xTKepaVo/42jPnB+y+KtZM10vRru82Ivz0DFwzG2uG
         b56NlfwZsuCS017i30nucLyxxjeIR5tm9wy6SNWoLeBwSYewn9PG8YTUnaK683OQkJuO
         WCkA==
X-Forwarded-Encrypted: i=1; AL+hErH1pUYC4cHpKMI8R0qxzb63JMOQa9p+yIrPu037xaWKQqAC2MbwCTo6b4gwQDGFblQvdj0SBeLj/UYjces=@vger.kernel.org
X-Gm-Message-State: APuU4Z90Y4Q4Dht+LE/G3f0zfSs8v/rEszUHLkFkK2SpUDkjAIWaMYJP
	QgXX9cc2GnmxfkZ4mtIizkL8aiIgjH8cseJhl8/vgEIr3jp8Qbs/DhqW
X-Gm-Gg: AYBFou0PSBgUzsazOIPsoIPN7s2vX090NfIg4I6oTllP/CbMRMqQU4qpsiU6Kf8rfMd
	54D9tYhiBtL6f9pieq84qmS/Ih4WZ3tXgwq7bkgi2CWpF3TZv99lM9KqWjbiH307RNgLvasth7j
	jN2qOb1NILtJ/jD8jkglMJxuUtbTPi+EW4VWejvR+rbCNfJ2/pqJwPTfMjoh4M/E5ekFhf5Va42
	Lb/0evlJHPaRNwYeCN/ioQsCK6azzfRwUoyEi68BaS0MJUYfwowlYaQOCstP1LBZ+1cQoTdOahi
	kvGv9zPDMb1wez99uXxKh7qCypUlF12lOKg59+afvZBKObqQLZJWnaWlikuE0uszR+HsFKGi/iR
	XdpDd+sxthYnEifeaEltxUU2hLhspAMuqXCOFwpZ2rDWEqx/+gBc/x4kSib3nXRZxy/R6OWWSp4
	THrAUSw2xG6gKCtPC+UQ0FXKs5NPUKRjbEWtha2bIJtFK1n7r/AMdKbQ/LcFKpT/bGRUrfz5k46
	Rrp9JwNtQ8JuSdRvzLZa0E5JC/Iojqh1cuVWidU8UstNeDU0e9lTGTPXAMTvSIQWL996EIfeYyi
	DOJmlyIQ08xlfDLiOsy6X/wpstDr1HCmFUpAJCd5QsCHC5FJ9fLB/EBVeFPDY+72qGCs4gnHyZL
	XM5bBphP/B+M9PYBr
X-Received: by 2002:a05:7301:4104:b0:36d:dcdb:70c5 with SMTP id 5a478bee46e88-377e15f06femr2247708eec.20.1794466278411;
        Wed, 11 Nov 2026 22:51:18 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:182d:659:ffce:39a4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375215d8889sm24547205eec.27.2026.11.11.22.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 22:51:17 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jaewon Kim <jaewon02.kim@samsung.com>,
	Hyunhee Kim <hyunhee.kim@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Pankaj Dubey <pankaj.dubey@samsung.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Input: regulator-haptic - drop platform data support and style fixes
Date: Wed, 11 Nov 2026 22:51:13 -0800
Message-ID: <20261112065115.1803973-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
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

This short series removes unused legacy platform data support and its
header file from the regulator-haptic driver (as all users configure the
device via Device Tree) and fixes minor coding style issues.

Thanks.

Dmitry Torokhov (2):
  Input: regulator-haptic - drop platform data support
  Input: regulator-haptic - fix coding style issues

 drivers/input/misc/regulator-haptic.c         | 29 ++++++-------------
 .../linux/platform_data/regulator-haptic.h    | 26 -----------------
 2 files changed, 9 insertions(+), 46 deletions(-)
 delete mode 100644 include/linux/platform_data/regulator-haptic.h

-- 
2.56.0.567.gdb80ae8cd5-goog


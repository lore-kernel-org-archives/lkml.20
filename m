Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794209396;
	b=rMmgqm7ZzlYKdak0GqYtqXVUHBOMTT28pReikDfncC1w22KhVb3Ptw/q1yR/li0RKLl1
	 6SM4LHtSkgJpkG1QoHS8FK7q/wo4/izwQPcLtPhIxh5UFsHIn/m4NvscFcG3iFIYerdXw
	 tUfh5h5/cCjkZ+g+2/grzVi2k1eLVyDRrbw0XNx6MI9N64KHV9tLIyzzqz0iautIpqf8p
	 dvg4JmOUg1UGMYGflD9N/PuTYZK40FgWSliZ4SwUkPQSj6D0WrOdN82TgfmyPxdTEQJC8
	 FEhyAMHyWt+VA8IxuBURFEn3Cit1r0Lbe9gPKwEH4Nn6EA7vDnWM7ZxYIHTJUH01+fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794209396;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+iS8GsvwX998BKoi2x1NItUNP3KaRUAQFikRJSM616w=;
	b=mAr54c+7opBLf5aUoJmno+m5Ulx4EGTej65YEtDcvm5izmP/e6uei/PLpjYQUmD1Lcqx
	 7TWQuc+IUQiJ8t6FAzx5/p6d+PJ163CAK5G+h0rqeFRLGR42Knhw1w/12cuL5kzNlSECc
	 Zdho1LtorsfN7WDOiBaULYGnI0U+W9aA3HA/2Sobxj8eZdeW6MKuvwJSzwWZMccfqpGvA
	 otEB1UXRpwY+BDFjfZZ9gmyc9z4PNHEOolUvle9h7gjbIK3uy3dRMbjkHZH4A8KLXUDqc
	 1oYAThrjSbM3SUu1d+w7bmlMtkjxAyooY/gR0g8azqDS6gHyH3SCvT/mWIKVVeYj1lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MhleE8Wx;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC05606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 07:29:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDC05606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MhleE8Wx
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b1ce85287aso473927c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 23:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794209395; x=1794814195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+iS8GsvwX998BKoi2x1NItUNP3KaRUAQFikRJSM616w=;
        b=MhleE8WxP8f/9gwFta6ieKkHTh6bne+8NEHiWL8t5AxaXp7jMdEnYIog2f9ztkLUjs
         ycWkBQ7XlP7c6mSYsJfkafzZ1IYL7AAXvtkM7dhQOl2TyE9b0shpMeXXeAceYGF17tjf
         9YxFhQU54N7KJZb3P0lB3p7vCXOcP/dDYiFvSdSS45D2JZjWwrVsYOFJGJwqT5LsuKzQ
         FsO6hbrLnxhFNroAd0hNFjcyLqeEW4+eEaB+vRPHOuLeZmXpkGz6knlQE3QT/F6P6Rr4
         X5eA5P4/kR5jWATKoatn+tSUWmzxIY9U7mAGwcd3IKP5rS3d7J3OKIG7DsuUzfwQxNcu
         CnyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794209395; x=1794814195;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+iS8GsvwX998BKoi2x1NItUNP3KaRUAQFikRJSM616w=;
        b=hLeCBV8gYdA6lI/uJy8qwJxrjfE4YmnkHRReQJxzXM3IVhVFHupoEXz5B76p6WjGlV
         1TGjIOqCCZliUZoZnFEYMvx7kR+gkzlDxJVv0h/nocjRjvIL+ZzwucZoRRbDxFs+nIBH
         zhzpLd9XsYOffbR+mTUwjo6SJTaWM/E7rfK9BxW90WOm5rZqXNq2FSRG8gfysHX2iI+k
         kFjSo1WqKsBTZj1pk7T1st0YvIswTFsHsFRu46zStgEF+FoeUzKIcAYW8LJ7zFFWn5Ef
         d4BvKTZP3g/m/agdoUrPlyT7AMIEOMoDPICdDqJt9l3INk480ix7anoHn0+o9HyzJ1XH
         CB5A==
X-Forwarded-Encrypted: i=1; AL+hErGvag8G9bdYaBU6ZF4WgUmd1BcchFV+OxqIZO8EUbWAdtPGHPfGVDfFb/HkKvFTBevPRrzHavaTD0gbI2s=@vger.kernel.org
X-Gm-Message-State: APuU4Z99yp6rhhvbDeQyPTtL6j2SXXcYzMZG1nrUPBSuQkpndlSWHwrE
	hYR00Iz3OUvInroaJaaamc5Dn0Q6DaUMGmoqa19+iQo6olNAZEB2qoy7MgMpMw==
X-Gm-Gg: AYBFou2Z+GRVDRfkVI61j9CY6vV4olQJTOcT8yOddubQu6jh4ZM6O62rY1Afes7flU+
	V7PD6IOsODryyYZ8PQ0CAumcnZkjYITZCPpIeCdYtzOsCcaNsp7hcgK3w0RWoZLLFYhpFr4QnlZ
	6xxur551+941NxrUah5nEbYItq62icsq+uhTPndDXeJJ2fXfJXCs4q7+6ujbfeumDBviHGnk1Fa
	RTzGxkWSje83iA21JU3pY8rkVhiYyCqMjJM0q4YsJmU4AWzWzCQ7eQePriRI7uylGtC5cM1ulPu
	UMx+DgGNy4vtgYUJ7gFgGDF9JIoCJo70ocWPblS5GIRx+dUPA2+3lmaAu+jvdrc3Pj+9LxbHrqU
	FzXc+m/z03+lvoGh9yAEldvKhZ3wqDMK6O9jB4k8WNOTSbhvGugyLoqWHPG+gMkKe2Exr6DcOgh
	KsPkgmrs9YjKRxsBJ4rKm6/oYwzdLprQs2Da2dBH7DmZ858MjIKlX0aoSTY2dPRSJ/TPjzWq8iS
	Nis02UAQ/lFu/8/7OksOezcx9sfbe04ySYtqcsi8+/uXelBAluE+92VazjyFCLvIVOaA6T97RD1
	Arib1vNQXLUw4gwUpVGF9n/9l4VqZc+DCsMZuD+GbhJSQQ+LCBjTjpvgbTxfHMqIFHqxsFbeeX2
	jIJH/X6WkLn9eCor6
X-Received: by 2002:a05:701b:231a:b0:1ae:4ead:8cef with SMTP id a92af1059eb24-1b39feb43a3mr5081732c88.30.1794209394874;
        Sun, 08 Nov 2026 23:29:54 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:3588:b56:78bf:db5e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3771f0e0fsm15265320c88.20.2026.11.08.23.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 23:29:54 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Felipe Balbi <balbi@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Hyunjung Ko <hj351016@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Input: remove unused lm8323 and lm8333 keypad drivers
Date: Sun,  8 Nov 2026 23:29:48 -0800
Message-ID: <20261109072950.3474308-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.506.g506a7eabc5-goog
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

Both the LM8323 and LM8333 keypad drivers strictly require legacy
platform data, lack Device Tree or generic device property support, and
have no users in mainline.

Follow up on the earlier mailing list inquiry [1] (where Wolfram Sang
confirmed that LM8333 can be dropped and no objections were raised for
either driver) and remove both drivers along with their platform data
headers.

[1] https://lore.kernel.org/r/Zr6I9RB5mibU_12N@google.com

Thanks.

Dmitry Torokhov (2):
  Input: lm8323 - remove driver
  Input: lm8333 - remove driver

 drivers/input/keyboard/Kconfig       |  22 -
 drivers/input/keyboard/Makefile      |   2 -
 drivers/input/keyboard/lm8323.c      | 813 ---------------------------
 drivers/input/keyboard/lm8333.c      | 213 -------
 include/linux/input/lm8333.h         |  24 -
 include/linux/platform_data/lm8323.h |  34 --
 6 files changed, 1108 deletions(-)
 delete mode 100644 drivers/input/keyboard/lm8323.c
 delete mode 100644 drivers/input/keyboard/lm8333.c
 delete mode 100644 include/linux/input/lm8333.h
 delete mode 100644 include/linux/platform_data/lm8323.h

-- 
2.56.0.506.g506a7eabc5-goog


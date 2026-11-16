Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862444;
	b=X7rUl5JdhUrl00PxESUuSorX/gMyYBF6o7adFtqXHoNVnZe05Wk11rEOfmzz5iIqTluH
	 6f1TeuQ0fx3023mDV9MrbwuRA+Dyu/WZ7dtJNqKpFT+dBQEGIRhPGR1Cc+EvNrRoQpPHq
	 CbgvlTxws8cL+NtJaKsQvP4yKZVCvwPY0SOK00opQlOBQQ35N7+Nnd7F0cxRjsYq6mml3
	 BqRKsI0rYXB4S3IQuUMbtmLVz07q4aaj/pR1LSprRf28fsnyEUTQvkj04wwI7Iim98XYU
	 uUx0vGOzUsEptENoSYFZFeHgi3KS0Hgpfz/A38DqMNTjo6/1PNKJiI6+OI0Uqa8CVPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862444;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lks8iSR/YB9Fv1EKmwN4RwxJYQhW1H8zwNcnF60o0Bg=;
	b=DWeQYfwv4jyQv+o5Aw9xvqzLWH6V1743Ff5TvxuyOCAHhwiAaUfKCX1tBTLyl7v2chL5
	 +JkR/V9KckAVC6g6EOHp1iNs1+CNGI8sfkC+3uNsiAiIKFclFbHKEnV1xrmXSsk8/yf9j
	 IECTGsZxnXEr3D/hbplCp2adEHDf6BNyQDn2CDJmSA68hvjBXQhvgfDamOatoirJi0slI
	 0hXI+G4AZfRkV29wngKJWODibhuJwzOrxZkAA9wagkCh+uZea20Nq8RBNsbLdPFWvhI7O
	 23ZWO0rN4HWEUozkBUNipdT96dt9xRFlXDgTPYA9bVVEyZnfTQvRGYSl7Zbws9gmolA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J2vettTH;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A21606A886
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:54:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0A21606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J2vettTH
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-37628596783so6576524eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794862443; x=1795467243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lks8iSR/YB9Fv1EKmwN4RwxJYQhW1H8zwNcnF60o0Bg=;
        b=J2vettTHgsS3OLXWhZpK71if72T6oJJ5C9sEEdbna2c8iwlSnH996+tXAzKcgCa/MK
         i6BilnY49BHNkt8TGEXFgyEMbw59KzEqMejO5gKAJx1oAoBFE+x/5LmhyiVswt3dJj2l
         HCKhHT2UKcwBSgrR9t02XBj8iYFtYC0/ntdcytpJJrd4BXG9E3J2xpMEoP0KIag3sJet
         paOXKI8MBwKyNp9VFZXUHoOMIs0b6nHqwuKSkqFJiM1cu+XBfQScuCSQ4+hyY/j0+iuc
         N/tfv44r3j6lFxSGEmHIs+lZyMiQFyOT9GCtxOUbx/EtdZ/JzTGuVooHN3y3j+wkm7fX
         S17A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794862443; x=1795467243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lks8iSR/YB9Fv1EKmwN4RwxJYQhW1H8zwNcnF60o0Bg=;
        b=nH88vVk9/2yNof2ZKSsfu5AEv3g7oLwFdYjqk3Jn25LyCAb3zVm7RPyCtiQXrp6NuO
         wq9NG01lTpPsLjjeFzp5ZXgZSWVmrHNY/58x02eEABqZlEda2f7ERCfMHd9HSJrdHFUX
         sRg+A+oeJolroBLwxWcD3GZwSHKkt6GxTzkX3kY/wTMRn0Mp+xdvcbM83Sk+M3A4XyXd
         ZI3oXbqGtTPn1MDJAF8vTZwfwQYhl6WWz7HcbugGYEsoWzrHmbrge6TV7s+sQhMl5NGm
         RKYygy1CqNkEYxzOaHsd6UqJCTke+bzVpITIDPaWHcbQY8JGD4MRdjqxzbjnvy9T5qL/
         yVbw==
X-Forwarded-Encrypted: i=1; AL+hErG0GchyRuPuHi4zMm7VcNEo+7HgrGlKD79w2lcXxtgzsIX6eDqGfP1uUe80JpZBuPBPjnFMSu0MG5TRZds=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Hd7VsanACM+QVsuctA3c0vnGPKB7UtB8R6OAhWTGNJe8OJRE7
	prtt4uIbGLaNCXDmGNrbfZA8pTg8lJV5FuEmKpB8fo0r4qouNmtDZFNa
X-Gm-Gg: AYBFou3kaNZxaoI/lLavGk5TM37TGx9IShALpS3m2VI4+3ShBZY1SgsDJJLZgXaYpu2
	41iqVp9ookxzJZ1s2X7FMBwZS+tA19jnoMTF7t5zbo/jwsg8fPQ5NdAIoRx99a9z7QOUMe/pwJF
	uKdKPSk+WbelDG2cxXHAJUrC+eYhRbXDL00pg7VSvWEHUWdlXwOSRtrSZIqf+FkeSqFBI+h7yZ2
	tFdKc3sPx7d1g6HC1/sDLr882bTNd5q6dAlc8PyiGpK78mVDsc5vkwRC8D+qUSa9Hd9OTr5qdYZ
	A7f3bJNc9QGh7JWXWvLfspARupJgvI0hhqDe7Jbm/0VESrE639YoLimGa4ARGKsNPOBiOdgBIYk
	RP5K1lQnvjZo8pd48PCRk2/qXLScYTon78vtJCLWCI9OeO55r16xOVlf4XCKqKls6JDcsAWVluA
	4JxrZ+sA7Y2MZ7MufTO2HC8CWK52aDizF//dzdZXb28xnU/2EJV2l6yCuMDfXFnWXEclr1kG+j7
	MTcgWueoezYxDcgoNR7KILnVQ+RtzHg06EZSy81kdLEZraS7mTQJ7+Ub1SvKv4m7GN/c9TSyr/o
	EW4jV8aqAjq5y7hthtsZjcHxCl68IKgYd0DhCeEaFc+q+4tKs69sP5NgCfqhAA4aIRCmHiJUoMF
	bUtrazjLROS+g2/ljgKtcLivxaeAuqfIchPRmxHUECl7u9XMNB+PfB6gThAq3uzy86JBP2Lafgi
	xAhX+9GWQJp55/lQ+HUUW2FvjmbuO7+IE3DPwpI3p79w==
X-Received: by 2002:a05:7022:130a:b0:1b3:beea:eee5 with SMTP id a92af1059eb24-1b5030613cemr9666041c88.1.1794862442632;
        Mon, 16 Nov 2026 12:54:02 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b524049e0asm15293497c88.4.2026.11.16.12.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:54:02 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Gwendal Grignou <gwendal@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH 6/6] iio: proximity: sx9360: reject negative hysteresis values
Date: Tue, 17 Nov 2026 02:23:14 +0530
Message-ID: <20261116205320.26070-7-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116205320.26070-1-kapoorarnav43@gmail.com>
References: <20261116205320.26070-1-kapoorarnav43@gmail.com>
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

sx9360_write_hysteresis() copies the value into an unsigned int before
comparing it with the threshold, so a negative value becomes a large
one, passes the "val >= pthresh >> 2" check and sets the largest
hysteresis instead of being rejected. Return -EINVAL for negative
values.

Fixes: 1cdb4c47f7f5 ("iio:proximity:sx9360: Add sx9360 support")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/iio/proximity/sx9360.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/iio/proximity/sx9360.c b/drivers/iio/proximity/sx9360.c
index 26190f9c6c1f..9989b0dbeae0 100644
--- a/drivers/iio/proximity/sx9360.c
+++ b/drivers/iio/proximity/sx9360.c
@@ -529,6 +529,9 @@ static int sx9360_write_hysteresis(struct sx_common_data *data, int _val)
 	unsigned int hyst, val = _val;
 	int ret, pthresh;
 
+	if (_val < 0)
+		return -EINVAL;
+
 	ret = sx9360_read_thresh(data, &pthresh);
 	if (ret < 0)
 		return ret;
-- 
2.53.0


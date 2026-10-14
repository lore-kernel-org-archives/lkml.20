Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6352361974
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792005299; cv=none; b=c9UjMlzZD5YhNtgg6bMJPr/F0Bnhb19hVavowlQMT6pMw/F3w2hJlVH627Hg2Khp7Ui0Ie0lZRXeQ+t2q43WZjwOd1rIrHt2q1u4sN2QSXsOCEYfIlFPVbyHJjHaTDaDVBsID08/MsHz5QLmnBVsLsYTs7rEKwHZwWWGu6a3WpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792005299; c=relaxed/simple;
	bh=FV7m1Tx7xLuG6Y0N8DNSf/MbH3xm5SYL912cdbUD3Dk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LoS3P+z0Ee1l+sAsDEQguGUvth4wmqUUAsWM9qn4QIy4lrH6P+m2LaFjiMWP8ERaFGULog4xHCrQK6QfwRlcS0bmTTxR6XHAAtq+FBVOa8qoKx+Kfbe7NcNLPP+I9mAzXWlmbddUeKtus5f8AM3yDo9eEyS9lQdt6ylRlXwrwWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=GEZrCHJt; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="GEZrCHJt"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-15dd124bbe7so262127c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1792005298; x=1792610098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FV7m1Tx7xLuG6Y0N8DNSf/MbH3xm5SYL912cdbUD3Dk=;
        b=GEZrCHJtjjOxska6BqVeIPG3iw9eU1ulncaUapxlufhg4p4BRqoeFRjp3Jr+YDnYGK
         EFDMXbVQ0Bga2u03eMQdxpWoGwCtUbCFhDoJ4prdFFMgBWDphDEfYIfexBG4WSBCOpSm
         yto+R6xypAOX2tyOwMJeR/DSmdeRSPSr716AqK0aGVl9nplItAIeroelWg0s+UIN55OL
         cfghCosa8HFF51aOOofrQABJJk0y5jbhlBuHChOsUXMkFTpOBNmGgVn/2LTKGLjA4CYN
         aV8V2p/gD/YVDCveUaaLDBDjPgGdwFHkeR2YcnntF5zdjfVG7wqo3ojyRAeDQzuZNXZo
         LjqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792005298; x=1792610098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FV7m1Tx7xLuG6Y0N8DNSf/MbH3xm5SYL912cdbUD3Dk=;
        b=uchaKsSKnmKtPrIYxex0AbdA/BWYJChm55THjLs4Ej2J+3qMo9HDCJsmPkfL4kgOoG
         TnbsI/V5sM0McqOfzfrJ1I99u1Pz4EiaiVNL72aGZymKhXGBx18D1Eb/z9ck344yXMRj
         z8Bg4/i7pdnHE6PMg4/Faac+Ef0ej0mLUroOnvv/wtRkDinw+rgSql26RcwjYIEWE5rt
         qIBUfLPqzy0Yw+wDmlvJmbNQ7+wW0PNWsWpRb1DCXBZZ6rj3hldifhywwdBrVDWx7XMf
         Sk0ZZNHHqVpN7nAJqz7tHDs/DP5IXGtg6bBpFXNZ9QSCz7hToAS3uT4efhePoWSp2unW
         EoHw==
X-Forwarded-Encrypted: i=1; AKwUvBwNZRN/qr9D2TsUZ+UrTiYtPqiWuBprQgwgDXhETAC0R29Xul8PVzS0MVgp279H27dE18evrE9yQEq4I2w=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3EdurJeMrDNU7KLCTyxLrMJhQ5lcm7AUbAwOE0uR1JgyBehFr
	CFriCOm2J2PXXw3XYt+SRMwvuWUzGmJhQixJKlK9QHI2Ze62TfBzr5yyTyavy/wP29o=
X-Gm-Gg: AYBFou19RkIj0OYPPU2s13QEnLRajdzsNWIcGNcCgb8lyEHVH/fB7UY6NqVSgq/1FgW
	Mf0ZyPu3pCoAX1bUIxuwD42RCLwhGHP0E0ihvFgbBBHYdjbOK/7LfbEthEL3Ay3Kf29usCAv8fa
	2YRd5i4kWkBtrWxyrH48LvvgtDre+rrXV/+XfwQHoIbADKlnxwWVXiescFnzCQOZJpDH+pHCW+C
	KNcj6bIM9rNvnnRwc1wcaauMB+U3huHpKE0uVcdDyS9Yc7lxcggkhiPtDAbmXHIJ3f50lXudLJ/
	X2d1zZgM6iuuuiWopXYAYNdVxpOq0Mr+OecHaFc1pyZeQTo6jJ0F25+dXTh7hFr9q/8XoQtml0s
	Lr0LUHYDdBzv6ZpqNkyNiIzGZoeyLYRc5j21MCVcVg2urcs4Y2hfqBLiNlDhNYFAEE6RkXS6ziq
	oxyemOLudrL1n3lgkTgNYiKGqC5LQ9I2lHA24sZO4nb2mCpLTxTlLP2CTQzGBIF7wE3sBWSf4cb
	r3JPRzfNgWQBjU3YG41IuYPdKYOLwVpWWJ939nArZYNQ2nl2WOtheD/rS3HzcirWstIrr+f1g7y
	hP2CjA==
X-Received: by 2002:a05:701a:c90a:b0:147:9ad0:cf10 with SMTP id a92af1059eb24-16a610ca3d6mr22170835c88.47.1792005297751;
        Wed, 14 Oct 2026 12:14:57 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:39d1:d8de:aae7:23dd])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16997c21ff3sm49019099c88.2.2026.10.14.12.14.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 Oct 2026 12:14:56 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: abdun.nihaal@gmail.com,
	christian.gromm@microchip.com,
	error27@gmail.com,
	gregkh@linuxfoundation.org,
	johan@kernel.org,
	knavaneeth786@gmail.com,
	linux-kernel@vger.kernel.org,
	parthiban.veerasooran@microchip.com
Subject: [PATCH 6.6.y 0/2] CVE-2025-71272, CVE-2026-43317: backport fix series
Date: Wed, 14 Oct 2026 15:14:50 -0400
Message-ID: <20261014191452.23814-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Please consider this backport series for CVE-2025-71272, CVE-2026-43317 to
6.6.y.

Apply the patches in this order:
1. most: core: fix resource leak in most_register_interface error paths (fix)
2. most: core: fix leak on early registration failure (fix)

Patch 1 initializes the interface device before ID allocation and releases
the device, ID and private storage on registration failures.

Patch 2 moves callback and channel-count validation after device
initialization so those early failures also release the device. The code
changes in both patches are identical to upstream.

The complete fix is already present in 6.12.y, 6.18.y and 7.2.y.

Build-tested only as part of a cumulative 6.6.y series: x86_64 objects
(allmodconfig, CONFIG_WERROR=y); no runtime testing.

An LLM assisted with preparing these backports.

Thanks,
Artem Dinaburg

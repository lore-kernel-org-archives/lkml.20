Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9568438E5C4
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 19:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791487110; cv=none; b=GGCTto8wLC5zS4VWuyD9wncRcGwQuRu132qPblxBA7koW8ivDbQTGVQNHEhNy5DIyzZ54VgWc2MYCFzmVsQcjJgJkFVOV7mckXLR4/qxV2LsySNd+ikdHxktCZJ6cNzKsRqOoWtcaKweblw+C8SlMwomhkSm2uNnzXtF7+x2prk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791487110; c=relaxed/simple;
	bh=8sWdTI2zKbvIUpzyNgL4cwCK1Y9JFEfvBdTqcuw7MEs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VZJ3xZ02abO3l/jwODaVRgXCa5Gi1YlNB4ditJSDsRaOkP7vjIeWSNLUjiQyXFIbI8U/Wd2HDATZxHZSP5jSIhK7CYivkFaqeCx1miVpcwbrmoQwq9E5/emv531YF1z3OS5shrxuU5XOIKiI3Xz9j7ul8ZeZsrnsm2mKori7/K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=f5JsRbsT; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="f5JsRbsT"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-351775aa1c0so1823811eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 12:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1791487109; x=1792091909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pOSWDS5/Ihvyp+1XM6mV0GAPNEch8iMG3fi5kmx4byo=;
        b=f5JsRbsTJXog35XU2qcpkVcOiuFL5lyg5RiI4mRsz+Y0IsnQoWQrupXTmMvqZkxopT
         N1IyC+gLA3WIOTAsmP+JFxCsj5lRoC4TmaqR1PT7D5i1yXAyWAl+KwN6+BwqoDf1DyqA
         TOcF4x8APuYOXIKjWuvpsCuyyRU6ih0VLJfTwWC09XMe1y4qNSQLKnlKi0rkDOHzONNG
         EtlYsLOGEmFNO5grjXj/mps/45YzXXs50Le7SCd9+LIjh7YVXjaZCc576vcu/1FYpgUN
         JVwjkO0Kvg/NInp/xA+Wpe5hRbnXtvGMmK3Xbq+7T7Iury+Y2v5D5SsdS7N694A0QWhV
         uILA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791487109; x=1792091909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pOSWDS5/Ihvyp+1XM6mV0GAPNEch8iMG3fi5kmx4byo=;
        b=J39OUV60QH4c3sCc1pGnTfuVw6KMQEtowm2ljmXwrZQPQvRfYG2gRyeNOrILJ07bk4
         8fetWqiOmgby7lJ1Yatq3ManrCptGHMBcMO9ufplGu5Q6tCXa9i69sN8t7+cbw17rBcW
         U4hL11DAX26tusPQEot8RqptMbLgqjacpX2lEsMNkoI/3LEiJmPtTfTsU1W3TXfDx2X+
         C0Ve9h3+t7dmd5sR1nGragkt1EHO6s8zIbJU2DEThq6C7OnAf2PY9EaLksSvqszwDvqD
         JR5otU1dTMzDDXBaGkgU3+UwQUc5pBgufyVXx8uXFK6lAHLa9hRD+2/rIa1xuEjp4EMx
         5jcg==
X-Forwarded-Encrypted: i=1; AKwUvBzdqczPjToL15x3Vv492D0icPGkqdQB0xIoi8c7TclWfQS1C0i9tlbOl0Wm82CGGBFxrw+rJ2dhGUg+p4o=@vger.kernel.org
X-Gm-Message-State: AFq9FYKT4dMIgzgPRsv0bYLU+6KtK0et+xrh9Zdua3FR3wZjviHPu9BW
	cIZFk1098C8DIB5xiKJcl/DZkOGZDLbA+VNv93SW8wzVEMggURDPo74vboti/Gnp7qQ=
X-Gm-Gg: AYBFou2PWXQCG40oNOVScf/YA9TkjnCw2/nLvxhMVMfbLgu1GYPk5H3LsGI9reIiHbp
	fHjr62bCvOXfJUsaPO+zsVAt6qfk74/3Aauq0CfTac+oUghVMnE9aBtx45D2SeDPPxppLrafDnU
	tsE3LsOZ5reaKLInW6YCBxEsFJQZsB61Ihxer9qIDxSvlV/83BydV/LXKmhF2R/T7G8sPtiDsEM
	0ghL4jtVK669nuUxutbUNLpuFdMWqPgKZYf8IwgmTCpK1qf0riN3SkbMlRnlq+5aiPERLvUdPKK
	dVhMkT40gkbaZ2d60wQTXg8hl44rNddIEkIt9pV7KtzSBqy66fEJJNqhKwC8vJ0g8ePO9MwR+/K
	GbFJRVORmZIngePtEliM3pslv2UQkkd2Kaz1XcZfqArPJyYxldx7+HbCWKiKnjkNf+nmU0dYdP+
	EJX918wszVhvSKH0Zxq6YxH63f5lb4Em9gjqiTv7kDVGKK2Brqnl2tKiyW1SMboGlGO6cCGR5Jp
	xWHcCFInyIRlBgsG5ew2Dh0wPizhEHrSsv/LD6MdmdEYy54O4gRBMbC23ypyXu/IIytthhqBGQw
	qBzT0Q==
X-Received: by 2002:a05:693c:8941:10b0:351:1f66:469b with SMTP id 5a478bee46e88-3515dc54ec0mr7434477eec.2.1791487108233;
        Thu, 08 Oct 2026 12:18:28 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:bc88:5ec1:4f8a:5b23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c841579sm117933eec.4.2026.10.08.12.18.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 12:18:27 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Marco Scardovi <scardracs@disroot.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	jay.xu@rock-chips.com
Subject: [PATCH 6.6.y 0/2] gpio: backport CVE-2026-53226, CVE-2026-64241
Date: Thu,  8 Oct 2026 15:18:19 -0400
Message-ID: <20261008191824.98662-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg, Sasha, and maintainers,

I'm working through the smaller CVE backports still missing from 6.6.y.
These 2 upstream changes belong together for CVE-2026-53226,
CVE-2026-64241. They must be applied in this order because the later change
depends on or completes the earlier one.

The complete series is already present in 6.12.y, 6.18.y, and 7.2.y.

Could you please consider this series for 6.6.y?

Thanks,
Artem Dinaburg

Series:
  1. gpio: rockchip: teardown bugs and resource leaks
  2. gpio: rockchip: fix generic IRQ chip leak on remove

base: v6.6.157 (79643295eba17affbd16ca97f3ef04c90266b28c) plus stable-queue
revision 958ddf240a33ef26b1771be944f0ea6c3b597472

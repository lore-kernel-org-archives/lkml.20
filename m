Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4ABC4E3EC4
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 15:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449805; cv=none; b=F4zRsfMpJ074ngtwc1IOkX4em5s2BHpry50LqMdY8P4z7Sg/igb7JQajD1nT+JkZ/s0bKP0M1VheKSlOQ/UQIAuMK6a4RSZOye/Z5CoFjRqcMXSokDLYnaoPT3GsjJQhfhIQJZQUyaESIt5+NH1DnF6iTMvXsOODQj6JpEW4i/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449805; c=relaxed/simple;
	bh=qsFwjBfu2NKtEcsDviKHxw63ntmppkT8r3P6UxlkbOc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qokWk90z/BdyHizRdn/3qk/KZ9ZhxgQ8pmhN/mIdNb3Z4Q6Xj7xe+bthVMS1effKWSChxN6MGxONRy7iSDiGgMmK1vCdNeridOANTtXRvCHptPND1X1b/XkpxNO99AB+UkckjuosGwg51a3vnLslGhNbEdHQkLG1/Sn7ker59bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VvpVhIdC; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VvpVhIdC"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so22435e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788449800; x=1789054600; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ShvhKa6MyfZ1jEWheQQ6SuhEnn7upG8Sh84fZvzR0n8=;
        b=VvpVhIdCDu+E+q9D3ZMVDm1AVd6kHCs8u0qRwDmqS02aZUnA7DlhlUPPj6QjbNNkC3
         a+ImcYMOjILsuXRZ6hJUOFHTcyBnqhQH/TxOaYKBs0qhUuK3R04YL9oa7zp1HiT9Yzjq
         5x9JkMwVTPgUcFbNdq8I9gUSH+rPfLEZgk+3scg/AQ3W/4tYr60jkTWurl6ozeAo2jzM
         khFaxl5svuz8sNmDY9yug7HyKgx4NpgsjkIXP0bYPrEJqA9h1uDlZ8lM/P/tBy4Ugt2n
         C/k6OGdKx54xCJZ6kePdrBgxzp5Kv0RzPQwr0erX1g+ClUEwZpbhbjQIxGVvl5HW7KRa
         37yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788449800; x=1789054600;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ShvhKa6MyfZ1jEWheQQ6SuhEnn7upG8Sh84fZvzR0n8=;
        b=U0fa2E1ZE5l+VXh4VD8uJjFcLh1+kC4zxQK/6pihoXELpDu1at9kyR+gPdjYOQnCt5
         sZBkE5AZxWgSdU3FIiAZ5dnD5CwSIRuAl/XCB6Pe+S1AYho6scKtTNn/LdivSEgJqOm4
         58y35UFot9a3gNUV2dZ2+GdjUKClw9Lk+m7Vqmp4WeWhtHWy3kZorBxEEjjSymEo07B3
         ffUF0x8gw7DFBAkMp47SsV8t4+Q2enMEGrlIh+4u9avO1cgViSYdQFBI2iFeXhELrdEC
         Krv4JxW6mMyZOJmNyUq8ym7E4+7Mqau7a8czx9vdrhEfO+WRNuaKZFgx88DD+SBug7hS
         w2Fw==
X-Gm-Message-State: AFuF++miIVC7oTAlcLiFeSoB6UrdySXuB3TVnxDKCxwsl3nU6xI7GRdD
	qTTMgqKcRcwBxklIJXotCv/rIn4EAUNUDlDt/3/Lm92JNDUhQNELSIY=
X-Gm-Gg: AYBFou3x3KMmoYIHOjasS2xkn9K+HGi4J/7OENNdwGYAiJapcZZcCkbxt+c8ag4e+k6
	TdhW1+M8DBqN8ipTXknQQshpP3ZfliA6B3fagpl1KIcvgn+v8EWzVVUED6VNcnjz7EEbOQMOG8X
	Knok1HNCGr93MSg7bSexeNyKZiIvTvwnLVb8sRqXqyyU3fcRR+VEyT9S34H3XEJGjEmQP93OYdw
	F5gtB4DNw+YKPxjDAeWmwa3IMXdFsEAgMZVltjKRe2f3ZNoACDe9Kncw/SpbGI8adhzEldnVIvx
	PvK32wBvn6ZTu+LvJiNpiIjTkFBBGeJ7zpHcjYb7UEPEE4FIXWOVRZus6N3KxFLrSGFJ8UtZBUP
	cFoJ6A5I5YmVRUKksDh7NYIWrVEkeobxg/IGaunNDKG9MbwB06JKvrdqP3CyYn2e3AAJuako9/O
	XqgBk6f+O37h8TqF0bDagCuy+WQN19ovILJE3s0pYTMkpTNBGCQnUWGpk3sClk3lurwiJ/JIYoz
	07Ud/TlijUmpZW/Lbzd7zGPzORxAtqUTdssZAiPSHVpgkDH2WxP2znr0xvimxr1m1VuaERlRVHf
	p9TlW+MBBlkvsCc=
X-Received: by 2002:a05:600c:3495:b0:49c:ee36:10fc with SMTP id 5b1f17b1804b1-49cee361162mr166580795e9.8.1788449799511;
        Thu, 03 Sep 2026 08:36:39 -0700 (PDT)
Received: from nn ([2001:1ab8:1003:0:5454:f357:ba89:4e22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce831af89sm75568425e9.1.2026.09.03.08.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:36:39 -0700 (PDT)
Sender: N B <gen.benner@gmail.com>
From: =?UTF-8?q?Nerijus=20Bend=C5=BEi=C5=ABnas?= <nerijus.bendziunas@gmail.com>
To: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] wifi: ath9k: skip the departing channel's noise floor on USB fast changes
Date: Thu,  3 Sep 2026 18:36:17 +0300
Message-ID: <20260903153617.990995-6-nerijus.bendziunas@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903153617.990995-1-nerijus.bendziunas@gmail.com>
References: <20260903153617.990995-1-nerijus.bendziunas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

ath9k_hw_reset() reads the noise floor of the channel it is leaving so
that channel's calibration history stays current. The readout is several
register reads, which on the USB devices are as many synchronous WMI
round trips, and a frequency-hopping monitor pays them on every hop for
a value that only matters if the radio returns to that channel later.

Leave the readout out when a fast channel change is asked for on a USB
device. Periodic calibration refreshes the history while a channel is in
use, and the arriving channel's noise floor is loaded either way, so
only a channel that is left and revisited without calibrating in between
sees an older history.

Signed-off-by: Nerijus Bendžiūnas <nerijus.bendziunas@gmail.com>
---
 drivers/net/wireless/ath/ath9k/hw.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath9k/hw.c b/drivers/net/wireless/ath/ath9k/hw.c
index d204cdf3fa8f..64fefbec46d5 100644
--- a/drivers/net/wireless/ath/ath9k/hw.c
+++ b/drivers/net/wireless/ath/ath9k/hw.c
@@ -1878,7 +1878,13 @@ int ath9k_hw_reset(struct ath_hw *ah, struct ath9k_channel *chan,
 	if (!ath9k_hw_setpower(ah, ATH9K_PM_AWAKE))
 		return -EIO;
 
-	if (ah->curchan && !ah->chip_fullsleep)
+	/*
+	 * Over USB the departing channel's noise-floor readout costs several
+	 * round trips and only feeds its history; the fast path reloads the
+	 * arriving channel's noise floor regardless.
+	 */
+	if (ah->curchan && !ah->chip_fullsleep &&
+	    !(fastcc && common->bus_ops->ath_bus_type == ATH_USB))
 		ath9k_hw_getnf(ah, ah->curchan);
 
 	ah->caldata = caldata;
-- 
2.55.0


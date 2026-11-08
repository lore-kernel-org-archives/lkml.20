Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794127939;
	b=pWdBJfM68lAVHYUSakGY3pM26yoWVplgYW2p/ohtFwrkb1yQcJRhJ9j+rE3wqhWry+Le
	 smuzjNoZbfMOCEIKeGdv2pDq/Oix/EuvZ2Vvt95yD7f+n2SxBMec9d6R7FpKrQntiVqfi
	 HnI5w4fuDEheaXb5w0NNx/sGKkfvZfO4NrbwPxvgPdDclhKPr7B10RB+AoQkuwsDVS7Y+
	 41E+jyZKnMNaxmVKUkgKzUT1+OBKIdshPv2lsFPhsZNSz5BaEbZNDbof4XR2y/edWOCbR
	 lpT3MKzzrZIB/nt30bqg9NVWnhJe2Gp3+jnY1zyRe5co761Uew9qV29eiRCan8u9NRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794127939;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dNhQGc3GPqKfSByEN1B7roZuoogyK4AK7uxo1IzV568=;
	b=gC9qerQXzqRHBgf8dd0DC67Vr4pFajiiNlaOrcP/31qgACz7nSiUsLfraX+cWUwJvjFq
	 OI3hMzF7BvZYofvcRLGTc8GICwcYFE8QQLMsqzAiG1aM/IopqPQ/04BSLEa5OPd7ybmaK
	 OvmtrxKklVv9lNMIgSDGd7TmPCH2Z1pvUE1IGio5SkJ9k7PO/WZpW5xgRXsJitZ7Vp4WU
	 itJFOYE8tBKxwhLDl40w3iEmjfxUeqP29t2KCQ7i5GTcciGndJ0TrUEuYZOV2trhXIAhg
	 YN0Wx/WQQLIoROAc6Ya4VteNrH0dypGsMzjGVacHkK8wGTFEuodbp95tEpuy9aB6tKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t6nUdRJC;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD65606A321
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 08:52:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FD65606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t6nUdRJC
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36f8cdd30beso724671eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 00:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794127938; x=1794732738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dNhQGc3GPqKfSByEN1B7roZuoogyK4AK7uxo1IzV568=;
        b=t6nUdRJCrrmLJvKtxAzPiaebfS1X9UZEi1vO0XMOtoqyCud0B7PYNRU2rBVcCg7zFZ
         znGnhe7xhGV4o8PnHPYf+qugcDCI4ouyrbXSU8EeV2spPcoW5mmNVXOGKigOphZSpdik
         014J/cwsGLfAedkuea2Rwx0O1mBcXS5PXX28bn580YJCqWfKx2T1lUq/V3GF+knhGrwZ
         AenQ4R+WwWZ6CvzNoinqk3/rsV0kIgFE/MnhrRmuDrQhzOnq1e8lAJg5A4fgoCyDI+Hk
         1EA/JRvXqiK0nekj1OYpqRAoes06dZbWjabhtvJJZJoMQijz9eSDN/WyCDSFOUnJPJ0v
         zcsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794127938; x=1794732738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dNhQGc3GPqKfSByEN1B7roZuoogyK4AK7uxo1IzV568=;
        b=Dm4vWg1iiGUaUgJP0ohP2DUNWfpPqTydME0UuwcEMrKHepbHIK/Ol4UMyXHDYYHzNp
         5uXgz/9VbKrCVEVq2BdRIPgHz464mPDsIZW3HlSN0ZhliULB/0lhz8U5V3JwAohMf54V
         At41D+Y/5iGBU+733ei/iwlM45l6A5idqUzf6GY8KPj4vcFuM5357RZVABYE3WlF8C2m
         UGRLzGb5wEuoqdC+L6Gi3lHhTmIkoZNAJE7hXc3QjMNRtlQZl/7pfbRT/MKzWK/HucW6
         JqwiTmNL6liv3R+HXjwG1qZ9CqvUoHjjXM+1tWQohIZgg2l6e8OdG2RWSHI1sQOCdnRD
         axzQ==
X-Forwarded-Encrypted: i=1; AL+hErEL7NrGv1pNFUKTGuvfR/C0cNx0ZBo75QdO/zqN9rFhTrVa3kw+vxK+pUb+6XC+Im9ZtgHZLWSnLH4Stkc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nJHva36CiyZUdI64yjtGFaVWyh6yRtsfm43iLej8CEOn60DR3
	76M8CktzlH0VwqqPlYyMuy6P2uksemD8mm1HGF1KyhBFLDogmgozPRwC
X-Gm-Gg: AYBFou03kdvxcLhg93Xwvb1gdXJJSrbaIRrqfTCQDYWau9mfeKAK1dNq/Vi3uW9BCqa
	xp6wY/bLyWGMzIIrYc8ST+W75s6ux4gP7GwujXcj6yShikze4+QQk1+xSn8GYcEggWGLgJ3JbA5
	qg+SkNXsCgBDv7c7IYVnWQ14GFNtzlttP5auplq3DGX7TchQoIBDkIprBdMVl319ydIEJU/YC+n
	7QQH+7hnXzU3RHldTmcmwrdFib+agfdGLJZbzXkQHkUPITJdxBCQmffHUxUogNpRTBE3p0fV8pq
	R/Zev7q4fnlIyL773vCKa9CWWIH8BNwj0nU8M5DikVu/MyaeRBZEBZeWaSblbwL2OKROpM9rSBG
	1aeYvlBOOixsZNejdLbJXHUG3pWjahDSevV9tBQMOvp+zRkwbpfSICSVN4yX5+HPkXQih/hehoz
	gOeUTLeIeXHWRg2qhR+w4El9H74JIq2Wty40eVC0nQ9zF91sA6/gX7YDf3/9L8aa6eGt1MzkodU
	1ELG7n17cnTbRYCtrzcuvXl+csmfpU2uw4LEaRIbKdDdOdqcHbUkrjfawDNsNAJnN4Kde2UdY3s
	+FWsVvmWiqpogdOchaLFVQCUHxINdyygr5xSllf4VwizNfFoT7274NHifvPq
X-Received: by 2002:a05:693c:41db:10b0:351:4866:255c with SMTP id 5a478bee46e88-3725e82af56mr2079362eec.32.1794127938349;
        Sun, 08 Nov 2026 00:52:18 -0800 (PST)
Received: from xploitoverload ([2409:40c1:6412:e5b:5516:cd42:6c8f:c918])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372667d60absm4050694eec.26.2026.11.08.00.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 00:52:17 -0800 (PST)
From: Kalpesh Solanki <skalpesh942@gmail.com>
To: pkshih@realtek.com
Cc: luka.gejak@linux.dev,
	kvalo@kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kalpesh Solanki <skalpesh942@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 1/2] wifi: rtw88: clear RTW_FLAG_RESTARTING in rtw_ops_stop()
Date: Sun,  8 Nov 2026 14:21:24 +0530
Message-ID: <20261108085126.331784-2-skalpesh942@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108085126.331784-1-skalpesh942@gmail.com>
References: <20261108085126.331784-1-skalpesh942@gmail.com>
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

When mac80211 stops or suspends the device without WoWLAN,
drv_reconfig_complete() is never invoked with
IEEE80211_RECONFIG_TYPE_RESTART. If firmware recovery was queued or
running during this transition, RTW_FLAG_RESTARTING remains set
permanently, preventing all subsequent firmware recoveries until the
driver is reloaded.

Clear RTW_FLAG_RESTARTING in rtw_ops_stop() so that the driver always
starts with a clean recovery state when the interface is brought back
up.

Fixes: 5c831644e1f4 ("rtw88: handle and recover when firmware crash")
Cc: stable@vger.kernel.org
Signed-off-by: Kalpesh Solanki <skalpesh942@gmail.com>
---
v3:
 - New patch in v3 addressing the pre-existing RTW_FLAG_RESTARTING gap.

 drivers/net/wireless/realtek/rtw88/mac80211.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/realtek/rtw88/mac80211.c b/drivers/net/wireless/realtek/rtw88/mac80211.c
index 5e40cf06a9e..7c86da9e939 100644
--- a/drivers/net/wireless/realtek/rtw88/mac80211.c
+++ b/drivers/net/wireless/realtek/rtw88/mac80211.c
@@ -67,6 +67,7 @@ static void rtw_ops_stop(struct ieee80211_hw *hw, bool suspend)
 	struct rtw_dev *rtwdev = hw->priv;
 
 	mutex_lock(&rtwdev->mutex);
+	clear_bit(RTW_FLAG_RESTARTING, rtwdev->flags);
 	rtw_core_stop(rtwdev);
 	mutex_unlock(&rtwdev->mutex);
 }
-- 
2.53.0


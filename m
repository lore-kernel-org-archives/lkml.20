Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8642C0269
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788874599; cv=none; b=A9/n88M5kDvd9lq/cmi4ccHYuL4D7deH/57RYVxV90Ep7FKB42btXrQfw3dfmpKixEF7c2Req/LceBsjh2QjZ4g7dA3FWc/pejSb07m/32wd4yTkX6VoO9WL6whYjR8iSOITVix3wTuYSkj9rqi1KlQeiGWT3vkLG91MftbsXvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788874599; c=relaxed/simple;
	bh=vkSrwpgV5JMC0Es79U5v7Gmcys29XZ3okUYq0XQB02Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lxOPs7x8G+iu5pE3EkK9FPRfMxaUZqt/H5JNvYkFpdd831Ugf70Uu9xU/gDHsquSdDjfSsNuMwWiLGdsmv2Tx/8ryWah1DIP4DmGrJCZD7E6m341ynpFGQnU+BqnGGIQTi0laACssb5KpgS+1eYFqXGJg8Tp6WAIlgwxAqMYVO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oxj0WBH+; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oxj0WBH+"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd5faa1cfso904935e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788874589; x=1789479389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vkSrwpgV5JMC0Es79U5v7Gmcys29XZ3okUYq0XQB02Q=;
        b=Oxj0WBH+29wp0G3wF1o87hJZmLiWjwK3IDaxK4rkcs5g4yih0V5XYMWckjuYdlp3Wx
         GiF3vLW0q1QFXfAZ5LC8vBEAt6DXR4o7KSv8PW7Od7Uz3wbf60YK0/E2trWIHW920DkK
         dyh/1B7yuniqlYqbZYSLmWbyqOHw4k7NUfSjtccYsHG1L3xFpEvck7bOzRNpyIwX73oa
         //3VPpBRfL3AS0p/ZUC8HuyZBFb4/HuSzfDHrggWq4EnBnlCetevfzplhuFQf0xocwWv
         HkoTN5jc2/TX7GCSiv6FkyMCM/AP+wMZLwFnxOZwhEascGZ/ZcRWZWWv1G6GY1cVoLRZ
         rQXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788874589; x=1789479389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vkSrwpgV5JMC0Es79U5v7Gmcys29XZ3okUYq0XQB02Q=;
        b=ML21aGgorASNFDY/DT+ex4ewQHkpqygjuJ8Y/EIMRjKUb8DyFBAnE3FKlzs8t3jZdm
         9zLk1IMb8kqyz+HsqRl8AlFViyl6UPm1pcTU+NFLOz3JDm9Pif1+SBdHIiVLO8loSN3R
         yMUFKB9geV+p7AsT8jzxSJb5Wdd/wUkPjR4tyrVrA2vkepYmHcki+a2LNHpfrA8hNlR2
         GcxxlJ4wG5SJYlhS78PHU1Bb1GCSfux/kUru1aLieA/4BmPW56k6FdBDdyni7IFC5yf0
         0IPySTyNC0DSHhCVp0jJh+IKDECS3K2RrFDWBE8wRYYRi3gV15/ykC8jVSJcuZpJPPxS
         0nzw==
X-Forwarded-Encrypted: i=1; AKwUvByxWVWhlDGsJjzSOZMZ+8jaSgNZYdE58glv5Ar/X7QT6AK9miFjmPomSgy3gpGP/gh8KEa2t2nyVwNGp8I=@vger.kernel.org
X-Gm-Message-State: AFuF++l8M5AnXH6XhvpCwpbBCp+K6hDLaHyoLGi2Rxzrvtqj6jh6hci6
	GZkdvhQ57dKBdTWpoLZiIzF4r4ugUKn1fDYhaN703nl6f+BOh49sXtMVsE9QnqyC
X-Gm-Gg: AYBFou3LIWmNIGtVduoX7gVCTHIbcBi9R14oIpTF3VB2BkNGlYvedkHwOVSMVyBBQtU
	fViCZqOlr+APA7+n03zFHP39nVRArAiqIUp8KdHo8eSqWFJpg6o1O8UmHNoIiW6HVlB+Yb3rVjm
	c5M0OzX1xwB2JWejmPK4EFnnE/Dib/og6XP8bZfueUE6WXBWeI1/MpnA474RDTeKyWzeaiHfnxu
	mH9iXju+WhpLTkYWd0QmJkWcEtsurJ0sIuGaA5FxTdIlKLm9Km6mV3yzsuz/IDZfOH6wEQEew0/
	hMAISDydIBM/pYP7rK1W3XTdx1hOAQW12K8p/oCzR2dUlDbwlz0PoKtVqKYjcEmqWH3BhxFc6Tk
	FkfsEuLjw2R5f2aPCRFccWcwCoWSxx/i76qNAG94LQ0wzQl8zVVYPvMSrSWI9NfWBdwZphW326D
	P0DI+jow9QKdY6XjW0VRfE0SKKshc7ZbeSsIfT6uOVmuyEyY7ZflmZ2H1hnN6DOF4SUw8zOnHMX
	y/FGUndP15yfgYerQ5Qy0mE4y/ay5d83OoYutMEXBOGiKDx+wxSEjYrbFsrRJ046BXm
X-Received: by 2002:a05:600c:8b2e:b0:49c:cbf4:572b with SMTP id 5b1f17b1804b1-49d01dcc1fdmr181152325e9.2.1788874588385;
        Tue, 08 Sep 2026 06:36:28 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B825D0079B84A36A788F67A.dsl.pool.telekom.hu. [2001:4c4e:1b82:5d00:79b8:4a36:a788:f67a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f815bsm293320765e9.4.2026.09.08.06.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:36:28 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Frank Zhang <rmxpzlb@gmail.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	dmitry.baryshkov@oss.qualcomm.com,
	heiko@sntech.de,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	neil.armstrong@linaro.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] drm/bridge: dw-hdmi-qp: Guard clear_audio_infoframe when PHY is down
Date: Tue,  8 Sep 2026 15:35:12 +0200
Message-ID: <20260908133513.9302-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ap_3zjRWm5-RXKKx@venus>
References: <20260908070220.41574-1-rmxpzlb@gmail.com> <ap_3zjRWm5-RXKKx@venus>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Frank, Sebastian,

Just so the tag is not lost when the split goes away: what I tested and
what my Tested-by is about is the tmds_char_rate check on the path that
runs from hdmi_codec_shutdown(), not the introduction of the second
function. With ftrace I confirmed the check is what stops the register
access, so folding it back into the original function as Sebastian
suggests does not change anything I measured, and the tag applies to
that form as well.

If you would still rather have it re-tested on the simplified version,
send v6 and I will run the same reproducer and confirm.

Igor

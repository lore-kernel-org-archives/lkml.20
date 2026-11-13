Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567967;
	b=26mffghY7VFSxaNxlXQkGfYoSpQ8airirnzmcXNZ/rwELWfK0P/xGHrBDjV1pe2bvWMA
	 H9m+pOybs92eBz37E23ygf3HheWK54dh7KVtTDo1HfyFZKZncim7UjjBi97X2PhEH68vl
	 SCnAV0cBMbMsrb0gJPDIgfP3elu03BQUY6Mf7kga7FrzsdgvL16GvsR4JwbDibO/CbJkA
	 d0xXfNt5jW6uYkML8iQKDo5wuFBvMNjkipvdJWtur3y4w5qn3OwBKUMfkN1c3KnzzKcei
	 X6hh6pEl+76o/IAw4zUmTo1rSmMS2ZYYGa+PNZOZF26WWLJirRbfH4a3pJjSxNsBFtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567967;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=XrW7G5FyBzep2SPN1JxS+delxFE3whqu9e2tanyOyU0=;
	b=E/wecHorUHbYOYpILh7h9/Ly0LaeE75kKdncT5nrPKJ6K1R9ByfYa1dsAFLHByDWbQfr
	 dYWlS7LAqizYGOOpkRA0P7sVqVXncXDwCz5l7CDn7jiLDeTfICXxon6u/qD99BZEPqC6B
	 KkDpjw+OS9XWGTGo6U/R27mkmUnFraSLO3AY1PJIPyrlK9RXfd+916G4e29P8j0cVE+jw
	 zPB0qq1rkZkgBSPZN8SZoPZIdaJEUUwXrRM4R1pTF6CESBXQjj/4q6Ka+Ls6J3us1KXG+
	 OohsNIy2edcGyTHKGRjFmApSXyv0VulPOFgjlXtkleE7ExRX5v2pT14WqLx90mpudgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ZY2nfALx;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CA460A5BE1
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:06:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49CA460A5BE1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ZY2nfALx
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49d05d51553so3801105e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794567966; x=1795172766; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XrW7G5FyBzep2SPN1JxS+delxFE3whqu9e2tanyOyU0=;
        b=ZY2nfALxjoIqtLxDWq+N83+aq2JVAXblAHXir6aFsW98BH9XPWBy4Y1gAQeaeXhRDn
         bjsUR8vRn0SfmxaPk2IvfN8uy87kSzl8GWgcOEf/HmuCQYg2THqN/zT2+GgmA2avUFm5
         Kyr+SBAkEExe5JCwvLzpJzZdFccOn/KAJ/7wwTFO9k0z9jw1ioBZmn6ZpuRhrwNUliT3
         QAqB7Vh35a1o9xUF0akov74l+QM6ziVV1YMuX9PqJ9YEMV02bL2GnWZUhfkfsoAxk+2R
         dI4PBC9AT36vP00ka2prF757t865oXHIrhPyNv3wdRxZj28+o1vZa9bwCFBUZYp3pgny
         ytmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567966; x=1795172766;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XrW7G5FyBzep2SPN1JxS+delxFE3whqu9e2tanyOyU0=;
        b=CMpq6b8XFJQsDGl4dxaydF5/tKIfj9qBgw0ZwRrJ74f02gfg2S332GyXCoYMVczwhL
         YPWyjVAHG+ro2mTe4a7ex6BJdPCgvXpw62AufwkVjJxhWq3vdPZE+suM7M/4szFJXdmo
         ty/V5wm/WCmkgIzqPObcGw+GWQOsEVlu3lYrjFcxLGrJs6lcO5WCx+Vm9aBJullvy4Hu
         jpcjqmnRqKAFUKP370rSUrOlfUtUuiT/b+5qyZ+H7y21cch7VH0NIHn7YMEDt+YmExad
         qlwB8lrEgVmlVjWzo3TF57qK8bHieMED04F2rXl+U/xNpJlHrgKt9ik2eNGn8Y7C/Cus
         FC6g==
X-Forwarded-Encrypted: i=1; AL+hErHGsGLG8AFXPTJ/EmhMAh+RDYnfwFqwGzQ5KUplc82iWXDwMyIpKrtZFMB4Bzbhr7lmr/2j7/WVG+5tDIU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wjkAZE8c4UrUHtyKU8tNMKx8BFzTq9INb4ZECPkt3iYvYxQkN
	ysUlOEKMuCZb8/bcv2LE+j8iA7lK/OTXOuhjfapnoLuPeeRhSJvV9hRe7BSv/ESCOPs=
X-Gm-Gg: AYBFou2PH+STo9252r1IiMbo3DgyJnz7G3+Phy0IaLgNZ9Apcd0T2Msbf7iyIVijAy6
	ybvSYWTtLZYMTbZsTlANlTk9+3r/Fb5Ur1LvzPkjJgBOjfEHqKueoJ7F7pRGgRJGlPdw00tfc2k
	jpnty5Wq+m7849ICvufcaYLjao49q19eNCjYa6CnD4oNHPQQzS2Fkldj3juOmbqT6jjn2tYo3sQ
	NY2L/sh/X3wlmmboGz7Lt9Gox7OhNwdBZmZolk+58hgILbXclICNnUtm7D8LxVRv1KMW/AtCx64
	oXxsCeuvgSvdKFIWoJvTTqNjp90sNj1KtbhQwgMmQNzcL9fT7mjvgLQQERKg14AweW5cn7+AUjo
	PGhPqId2YcqAogu/ji5dQG23hzH55YLwqPq9puv41ha4aDvYqUhXoO+XRNbrhEvbU7Q5jf3hdx7
	zOcmfE4/DHe2/k+KEbRUjRVAvjThTB/qF8E4Wr3g0hItPJg0JYL12Ubl2Bc93JFkIYfzBZp5QpO
	XLQF6vd0xmCJeN8KlP4JwSe+8FArIz5tpCZJ40EEWvu1erszC+EEURyF1t8phgWmfuKeSZnVIVb
	rKP2k9m2nFRoojVRC/bZAdhWCwkC+56ZI0O3jU3SKlI4b4aUPx8=
X-Received: by 2002:a05:600c:3b16:b0:4a2:267:25b3 with SMTP id 5b1f17b1804b1-4bb55ab4493mr46428875e9.35.1794567965726;
        Fri, 13 Nov 2026 03:06:05 -0800 (PST)
Received: from localhost (128.33.83.79.rev.sfr.net. [79.83.33.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2969e7sm128332475e9.10.2026.11.13.03.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:06:05 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 13 Nov 2026 12:05:31 +0100
Subject: [PATCH v2 05/11] firmware: arm_scmi: stop reading past
 PINCTRL_LIST_ASSOCIATIONS replies
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261113-clegoffic-pinctrl-scmi-gpio-v2-5-faccb4685d88@baylibre.com>
References: <20261113-clegoffic-pinctrl-scmi-gpio-v2-0-faccb4685d88@baylibre.com>
In-Reply-To: <20261113-clegoffic-pinctrl-scmi-gpio-v2-0-faccb4685d88@baylibre.com>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
X-Mailer: b4 0.17-dev

The transport cuts a reply larger than the receive buffer, but the iterator
still reads every identifier the reply announces. Return an error instead.

Fixes: 2145af01b9cb ("firmware: arm_scmi: Add basic support for SCMI v3.2 pincontrol protocol")
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/firmware/arm/scmi/pinctrl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/firmware/arm/scmi/pinctrl.c b/drivers/firmware/arm/scmi/pinctrl.c
index 18761ffbf893..b071d31b5c33 100644
--- a/drivers/firmware/arm/scmi/pinctrl.c
+++ b/drivers/firmware/arm/scmi/pinctrl.c
@@ -265,6 +265,9 @@ static int iter_pinctrl_assoc_update_state(struct scmi_iterator_state *st,
 	st->num_returned = RETURNED(r->flags);
 	st->num_remaining = REMAINING(r->flags);
 
+	if (st->rx_len < sizeof(*r) + sizeof(r->array[0]) * st->num_returned)
+		return -EINVAL;
+
 	return 0;
 }
 

-- 
2.56.1


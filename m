Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4278236A03A
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 20:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787863870; cv=none; b=J9+Clkzc1XKp0HaX0Jyi7XLYwchm/+f3UPguYpwS0zVSRvg9oIYFFEgQoYZnxThmRHmb1YROdbThoLmEw6NgYfMAjkmXd5gYeLNgraWtTh3pLYXbwviDqwGpNagRgQSu4z25rxp8rrF5tOziSX2uU/LFz68BVjorWMY7U5W2ECI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787863870; c=relaxed/simple;
	bh=Ufx0P8rDIIn9ux40wvheeHx/pbxLVtKnnNJRtf1/UGc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XM8y2AR3aWSVKrmg/xTmPvoi08YY9/vPfy1Dm9vPVHKzleED2XD8VbYHpbqGcZACW8jDsTVwtpBDzHWSpaCBUUuPMMq17VEi6VKYuea4y6W0bOR7dD1QT1bXjE393VrobHeuK3FZahTGL3ds4UeEO0+EG9HqWsDm7EeUftrUnWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=STQWa0hY; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="STQWa0hY"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso9658095e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 13:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787863867; x=1788468667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4l9pXpzpCQlA5EBOndwC9CK6cDBlGTJk1glTt5sjEdM=;
        b=STQWa0hYfUjcUsQHpHhLUNMgnoeJhTGIGZrgIvMFkuSNH+SeFZOl9sNNxajfEy035m
         xdBWZ3xHKjTrum5nYUWb4uWEwfJY5H40ZkWIkdfNuU323KLPSAQhXfOOyhMnp/pTrVg/
         uo4Nofa1Rv/eYJebhfRxqrmeAar5QKKu1qcvtJQkSz0gVRoWTC/SbTUUDuuzCeS0mM7E
         82GmwgF0/uA5dP9c0DMNnRgot85fpE702hdK/SIhPyeVhaXIuIoCU4ybA+2FFdCpCSao
         dd2oAwRPNxSSLZgBlvomoqJSaOqMwcTkyd69JR4+7mQdlz2SCNA4oRA4FaMh3qCQfPvN
         LnLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787863867; x=1788468667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4l9pXpzpCQlA5EBOndwC9CK6cDBlGTJk1glTt5sjEdM=;
        b=rryVd/btUVd9SEvnoyECByMi77Ij8Ddm2e+x6W/2upsXSWNQI1bP0koc9orcY4yizF
         pfrxRsgA/0ViuPx3c4k14RYnR79j6RH2tezMASR1r0nxpetpsKcQ5qG9wy54DHStxBKC
         tMyw7L/YwBZp5oYEBwqqfi+AjmVolUpoK5erLvaBMMYLYk5BGIy0ttbyJc/21cxhrVBF
         Ue2Pg7QmSQS6LqJal3vf2Rx90yzMr6mC2Vms3wd/XpLgh/0+3eVcWji5gPOqKfprK3gj
         PooGx342HNY6rdIMkzF17WXPS1vBTliSqnaSpVYGw9jzpbLV8RKJ8574W4DHE+TeZGZ6
         BkeQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr/0vMcklKFCihRq2Xydm5R09saGpsGxgbBvfvpV6MlLG+nz8hLCU4cGnWXPr4v+iRzSCly8dirfXtdIUU=@vger.kernel.org
X-Gm-Message-State: AFuF++k3KtwggFRfwNN2RA1zJhC1dCuwEQE0q23p1/EPuBgDu8cJPuEh
	CevAJElaO01Q7mn7tKsYe311joD87mQKMLjlaei/3Ejzxo4Z/MyVIJxQ
X-Gm-Gg: AR+sD10IfmzCxLDy62j4jULk8N7MQupxAs/o4/BkCFWKZanWD857j+UfOeQITp+u3/H
	8+tg3QPloIQteVnAjiGvkg2fM7tF8QGhSEuvDlYNNx8yZRg7RkktlnhersDx2CoEAA9sk9j3IFY
	H4dQg0JwScWILDpIv9Ov/X8qqEpMOeiricWj4ej/jVH6XGDMp2E1j/geBBb/PX5d4DxNXY/Sg9p
	4tJSJ9Iy6KX75FabOOQFf5tZ1kKbE772YOQf51TiD/RQnf8cyxuSaImkODZUImj9LNRaTg6UnF3
	BtlJe2bN+9hrxPyxrCbwL47lHNuM3opCOAJRgokgN1PEQqmlMz14VRkTCdBvdxBGigJb6Gl/fhW
	VdtDox+pEGWcXBM77OiuBSPRpsUuXdRvfaOXThgwQEqIDACdXEwMOZ/08u8r3CUKu8KRQLXGctA
	7KcUJeZ9zXVjhu90+1fq4fAQMeCCA/dtnFMU1WixrPpx2oB3rXdCMm2+5wVgM=
X-Received: by 2002:a05:600c:8b26:b0:49a:ce8f:1a5e with SMTP id 5b1f17b1804b1-49b91a2bab2mr27494655e9.2.1787863867220;
        Thu, 27 Aug 2026 13:51:07 -0700 (PDT)
Received: from m2.. ([37.142.156.156])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49b926874fdsm6458095e9.4.2026.08.27.13.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 13:51:06 -0700 (PDT)
From: Michael Zaidman <michael.zaidman@gmail.com>
To: linusw@kernel.org
Cc: jikos@kernel.org,
	bentiss@kernel.org,
	brgl@kernel.org,
	germain.hebert@ca.abb.com,
	rio@r26.me,
	brunoceg1@gmail.com,
	contact@christina-quast.de,
	linux-input@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/13] HID: ft260: gpio: group sysfs attrs per HID interface
Date: Thu, 27 Aug 2026 23:50:55 +0300
Message-ID: <20260827205055.17510-1-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAD++jLmugu4-1_XvqwV1xYw0L8F3V6CDP8qW3PCSvVWY6gqh4w@mail.gmail.com>
References: <CAD++jLmugu4-1_XvqwV1xYw0L8F3V6CDP8qW3PCSvVWY6gqh4w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 25 Aug 2026 at 10:13 +0200, Linus Walleij wrote:
> Drop "gpio" from the subject of this patch, it's all about sysfs
> nothung else.

Agreed, the patch regroups the whole attribute set, I2C and UART
ones included. v2 will use:

  HID: ft260: group sysfs attrs per HID interface

Thanks,
Michael

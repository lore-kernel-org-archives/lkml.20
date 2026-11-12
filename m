Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794461534;
	b=cj9b/J8P98g0fV8VrP+pBzVv4uvYLyFZCKrE9iDFsIgXfsvmbHlVZVJrCJZr7wUf3BVA
	 jWcRLFq2kw5+nk4dcrxdOcsElgZl0P57NCJp2e13m/P2MHD2pyryPXkFnPRoQtjpdjv5m
	 Op4iew1XowwkbZMJN3PGY3ByNvZ4XMxkR9JxqcUoIjB4nxZL1Ss44N/4lnZNdyFV+Z/eH
	 ae5S1D8ntUoLJIsR5j3zjlJLdHZcbFuFELmY9lW4p5u4Ul4T4+0XleKRgxyfOex9mTfwy
	 RuwMKtJaq0LJtRo5rpkeDffL4LjUKGT0GgVNhe8pDp5/x5Scy3wWUaOSeNmkhHFqoSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794461534;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8bdUIArMEVujVxSnFXg7ASEB4w5yQy9UWzwj4XRgu74=;
	b=4XsMlpJBcZ74iBfOkC+7ttfksm8dpteqd44Moo7dzq0POfWbUucDSiNHiI9R2cdhVR9x
	 d91gpC9bnoDKb8KRliwyxksUn/F6s3UbbKxkMSgW0LVKLMAUvqftBVpM984A7UmWcOhkk
	 8o4dPAuytqyzKcF6RJLifFt5olOLAFWfiNB9MK15LLkI6HNZ7yUsotzNKiITuuyVPUrRD
	 4yWDsyhIG2P+zDjK0tFCu9WhSdwMA1adXUsFLpXM9WbwblNXrYmfgPUwqZDyU3guZjyxs
	 xM9ii2ZKKwdLHyUwTY0OXuiFA62WSjIoXyGwOXTwQzQPIuSoeAXnTHp11h3ApsRu6Tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KiVa2YK+;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39930606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:32:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39930606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KiVa2YK+
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cdb2e0062bbso1556275a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794461533; x=1795066333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8bdUIArMEVujVxSnFXg7ASEB4w5yQy9UWzwj4XRgu74=;
        b=KiVa2YK++8rPL+oDHtSbC6BXxg610PnN71TSFaCQMwH/7WEm10m1RZKAFK1g6LlMnF
         nbW+3+RfwUzWgD+d6i7L22JK/N87HiZPTpPbDhnjfMEXA275IkjSlNYSE769FL48ANrF
         PCwNR1nnrfDKWG6Qss/5VxsBk+quH/Vrp0dgBeDX00ZpaSFCG9QNHGeV104Kd3nDZnrq
         rIGJf+jMY9hu8xvTm2bCqEQ9Zu95m583Q6IM7pNuxVQloMQncqpbK0FzAV7m2dnF1Sn2
         V3T1MDFPqTorXyMwm0h6FM1WEguLp6ryEKiPydHS3SGwqqe/+h99W1Tbzu4IALH1exFm
         iwMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794461533; x=1795066333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8bdUIArMEVujVxSnFXg7ASEB4w5yQy9UWzwj4XRgu74=;
        b=krdKLNVZ5S0d6OFGma3Gm8jiAMsjzB86oMoXdPpT3ZZA93WbOXB/U//n5ZrKqMXq+2
         Ufk5G3ciD3cvp16b+K5/tk81m5zg+3sY7SIqFkIdukuVvq3xGQSpbJPPlkeh3c+75TOb
         vtT53zDGYUrqcCQXZWVoM2jkeYPStJcwk5yo4jdZKsy670kqayzf/FlRHuLpV8iRDUqC
         RDE23ZUr/2BbxUE4ywg6KWZuouAid2yKYH8V8LMWJwBfO3bNjz8AL1l/8io05X5Ajb+K
         Jl8m4PSLkZViTe3esr7qBCszdsR1SOKzQE/Jy4W+30EOMoWzZJbkEyhwfIKWAywlWiCK
         noAA==
X-Forwarded-Encrypted: i=1; AL+hErF8/yOwVojBkA+dezbhq6eyN1heDTSvUYZUZMByeZvrF+IjT2qrTziV39ZRyzRXmcoVhvLPb+iaJzNZytg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8V4cmzn3yfbfKyhxuEy/lFWTI8CKBEpSVAegNElgsHrhopGkk/
	Ce/QXp/UNWB5IAvswhi6opNcVmZ4XyF5ogk0VSMyBHbNa3y4BUO/6wIP
X-Gm-Gg: AYBFou0p2k5UNZl3ZHmSo98Zvn2Z6M0+a9T+kXzpcp7BXoAjAcYzfwF9j2tZ9ifM9JS
	tFQC4AkhpZMVpu8hcTqQ1pqUkOCxzVGM4nrT2/5Ac7ZtS16eT3h+JTkhYUF+IpACu2qo5q+j49M
	72ZIAhjuYCr8BxOvzhaTFr6iyem+28r4nIGHlqjrT05xJbmensJwob0I/yWeC+e8K23qCBmhtmf
	bPxeeUcE7ItZ65P92zxF+366bLjHh/UrrGpZk/aCucwUvxum7OybH4e75lT/iwnXkZf2PN1Bl04
	GGT6tUW9suMuhrYq1G+u839xZ2hVa3+G2jL7SxzC9xzRVi+F8UPFE/pZBcAxDKKHliyqRAsMMtG
	gNqLGZqhqiGuqb/mJ93HjWhyxPyFYeQxonTiSbXjdYuyVOxJy4iVe44R7ekkxoTYnlDobCU5P0K
	BBdoZ579xgZY3pPw0Xd9K8dQhOqW3pv9pQ/6cRdsAnUyPN+n4Uk8SuVveFhbAoS+GSbF5VcAwjC
	T4eFI8azwKqUZMFs+66C7EM31c2JMsF7vc4DHN7580jPD5tzc7B1p+NGgaflZyvsh1EDkP3g9wB
	Bbo4l8ZUwULQuNda3eKqbAQOlpmTDM9tov8fANkfYmkmqjV1E37NNK8zASZy94FfN3QrLVBh769
	GLJQpp1QWKh6dvGNs
X-Received: by 2002:a17:90b:33c6:b0:3b0:9e2c:9b61 with SMTP id 98e67ed59e1d1-3b182ee21e0mr4536093a91.35.1794461533487;
        Wed, 11 Nov 2026 21:32:13 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:182d:659:ffce:39a4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b181b9419bsm3600558a91.0.2026.11.11.21.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 21:32:12 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Benjamin Tissoires <bentiss@kernel.org>,
	Jiri Kosina <jikos@kernel.org>
Cc: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Michael Zaidman <michael.zaidman@gmail.com>,
	Rishi Gupta <gupt21@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Andrej Shadura <andrew@shadura.me>,
	Johannes Roith <johannes@gnu-linux.rocks>,
	linux-input@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] HID: hidraw: Encapsulate struct hidraw and make hidraw.h private
Date: Wed, 11 Nov 2026 21:32:08 -0800
Message-ID: <20261112053208.1397505-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
In-Reply-To: <20261016-test-hidraw-base-v2-0-153f67a20cad@gmail.com>
References: <20261016-test-hidraw-base-v2-0-153f67a20cad@gmail.com>
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

Hi Benjamin,

On Fri, Oct 16, 2026 at 03:41:47PM -0700, Dmitry Torokhov wrote:
> This series cleans up internal HID core and hidraw header boundaries.
> 
> First, internal HID core declarations and unused symbol exports are
> moved out of include/linux/hid.h into a private drivers/hid/hid-core.h
> header. Next, a hidraw_instance() accessor is introduced in
> include/linux/hidraw.h so HID drivers that only need the hidraw minor
> number for naming or debug logging no longer dereference struct hidraw
> directly. After converting the drivers and dropping unused
> linux/hidraw.h includes, hidraw.h is moved to drivers/hid/hidraw.h and
> struct hidraw along with its internal buffer and list structures are
> made private to drivers/hid/hidraw.c.

Gentle ping on v2 of this series. I verified that it still merges
cleanly onto next-20261109. Could you please take a look?

Thanks.

-- 
Dmitry

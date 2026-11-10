Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794278014;
	b=0Ue0TqEvMHSkPY/zRHN1Vr50RF8CgVi8/BXfbIUlgDd3LSFr5wRvgF8a2//opddmwNfm
	 yZVbJBqkdWbhBFcpQp0Osrb7uUHauttRDxuT2ZG5UJzg/auo1t7suW8ifEeU0519X9cEF
	 txanqSagGBATi3RQ1T7G32FvwJC4f6rllEzT5tjih6kmV5FF4uh+yBb2ztfXX3Z5qws5y
	 UdgEfIL9DC0NCnRE3Tudrpjc0trmqEl2tZBORWtxoxAj/dx0GI9mIrfiBXoZwDZTODW7T
	 AeNVIOqwpe829KJeZ+cZe8fyxt5+hUvBppIstUllJ8SuwkikkOMDxJHgQuGYb2bYMfQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794278014;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:In-Reply-To:References:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Ir6+0LktXyNV5hGF4yG0Zsi8r3P+hNjzS2NcO8JzLHM=;
	b=Q0+Xhea0C6GG7NVQHznRJoiMta6e0BRULtkbqKrH0wt4fzIhrTB8WJduK5zjKwkDcm1w
	 Zw1olcQae+2wxgxeX1GuySXObLei+6KVh+5XZukimMKdl7PPyQU53IYR022hfzmxWq04r
	 RWNcY8uj1iLaV8uKrA+pM0xpw8vyf5zX5oJicz2JM0Pp59JYS85fYiu2SUwHgQYue+YF+
	 SBCAcTXnoqARxfIFv5jNmbZy9bhFPlRlX2GQwmmrUKyE3zFRdXWa1n4RrYpml1gA+ykO/
	 TfoE7+WzFwSxAq5JlVLF0exd8LhYRR7IN9Z3XPM5Ddwbl6EQxtffuy3l1enJqP9qJIw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yPwTGqod;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085A1606A32E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:33:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 085A1606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yPwTGqod
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b5669a5100so2077874a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 18:33:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794278012; cv=none;
        d=google.com; s=arc-20260327;
        b=Spgy9Qtwb+8+vBHXPWgK+7nzfRDdaBuofFx5TH+CS1ZMt4ZzK1MhzdW0GVWDnWruTB
         yP3n+7QyTK3/ZY4MqMWmnU+NMwRzARSytptvKMX1uNvhu8Ke/X2YYZzvfMH0neH04yaY
         0N+s9cMQ/A+nTrmQ3MPlk9xuE1hB6sxZv6OpWxuuqi7QRTUeFek+6hPsQt0akEr91W9p
         kBaFvmm/zU6la9+ND1q9hLKlLIrL/7jfG1RFSiCoQnSYvds77lCpmxEBqO20MyrV9f3c
         Q2IR7ChEYjS3+KC+Rr/m9BSESeYDVXmph+SejHGOHi+dIi+G134cEPKUC/mmR70akmu7
         1euA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=Ir6+0LktXyNV5hGF4yG0Zsi8r3P+hNjzS2NcO8JzLHM=;
        fh=ryTEiopt3mEpnTH/TSWzghNHY7DVktfL60SKG9hk5Fs=;
        b=KZtZMZYWqNHBPMwEvUWn7c8Yfepb7qdQA4xYc7tZOxpJEl3hzvUGr89A1CjNmgtxs0
         fFyis14iWnhJMk/x0ExFhI12kc4cv0lelSTIfJN+0H69cX9UvcnGoXE1L7NhnsOhJN18
         ky9TKysPPW000om+tdL0lKSWFjipQ0V9/HDSyYM110+IJZ9mJNGlqNO9CXWhnnPhOL4t
         PeuWXf1pFVPsi6FYyVbu/f41Rih3if+PavkaSPPlq1ToYr2SEUfbYBwTEx6SesB1gQRo
         8dY9sIiZfmr68PFulqRPHRqqiwbRgPUbRaP6nf5TkqeWwv3T2JLygGJu3kD5yBVWJ9+b
         eERg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794278012; x=1794882812; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ir6+0LktXyNV5hGF4yG0Zsi8r3P+hNjzS2NcO8JzLHM=;
        b=yPwTGqodd7n8H1mxcfS43lExUvi0jzQJU+ntBIlR4pprDZdl1TVrV7IbOibnNXcuNF
         DfuCSXoUIjxEK/WuoROirOzkOtDBCuOYUf8FTQuhGN/3OSpvmWL9upVt+5OSUY+BA1Md
         EP51Wv7G3gWQ/TjLOxX/nlHk+lT/lByA+C9Y2XOloW3P50RtVZOHu1p6THXe4zxqIZWc
         HtA5gxGAzy6tlbJp2T5twXh+f6WvRnTzeFgFCgRnDBNd8qMU9WETLMADtfnjGT3rP6aR
         8umd9BDxeT55xe3RiTcauiFKWvpIAeV9D8cmRfLcw/X/L8yNYtl1ln9HMc2idk8YD0Yp
         R4bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794278012; x=1794882812;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ir6+0LktXyNV5hGF4yG0Zsi8r3P+hNjzS2NcO8JzLHM=;
        b=OZKM/ztv0eHAi3WuW46PL+zq5j4rIpQnIO7yfRiN0hg1AUjygMCRYrhwLX0W3vpM5U
         MIn1lI5v27MqUbd9HPSPMTpbhEka0tiub92AXYCWfBqfaMdOmo5QA9lOf+TUTJHE8iR7
         p0LbecrNWC7lqUerXzClILLEXE1rNGGxz9qQxkUdRWOUcAUw+cOGAwgl3wWb2kCq+Ar+
         HSRNtncl0T8CZIZEFVf754h3yqF5piPEIaR/4CRFe1nf9y8RZEvYDBNJk+bo7yursu8Z
         8fThEGXAaL2OGy9r0k//JMBnTqiEpIfRbTHvBNTsdl0EGB9fL2CUijTqVs9ZPfFwgwta
         Rj1A==
X-Forwarded-Encrypted: i=1; AL+hErFMIiQPHvt/kQ4I7pvyDvqfa/x5CLv0lasajqfnlFMK+qw/wZWHCxBQH6AmIQA5wS3mfhTLKar3+l0sYGQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bsjWUkpfKptOXWFO9wb+ssl7qdNrtZTuYEVGCuYO4o20zttHe
	yTY4WyXxpfAjkA3VFPACBc85Nb7nZ59E2/aZPQ/zHsjaENStVbc11qzBt76PhJkdJ54ZSLrVmYz
	bXrFUjCcy7I9TEXfs/vORvxtsjsSRag==
X-Gm-Gg: AYBFou3xkLV+f/I0ONYdGeyzXsBP+iIDTLQOBhp+8yMS77kcZr0W6JKUZca063sWmCB
	jkqoTn8Z8QTNRmSQSrsNIvZwCk01DPPjJDD0IM0u4S0jxmLcSATyUGadkO7OF5HyU1dRswBO6JA
	LilEVaD/PyFXMO3lsxyTmu+a8u+JBY4KG/JMN3dNwQZH52gpRhB4niX48FVFBO17xOXOMcw1Bur
	G1gyyCk/uZuJs2DThmi/uWN3ezsZIrO5wv71+YGowXtBYRZUcdHNS7rGP3xiUReVoOAprf2hrHz
	TV7PLsP2d4mqKBeRPP57YggigpW6YNoCaKXr7YcixgqW+YDqlNkLuyiJefDick1tyw288GuSm32
	WBvl+2e1ZrlN60TiNZ0t4QpJUjG4BY5pM63jVD1UiX6NQ7XcvEiEvtJu5XNx/7YaGCkRJs0O+V3
	5F5TmWYueSqyiBOpSAyxXMLwvZQKrw3rlWaG9M0CLT4cS1XW6EkGwZ3UX8XtXDZBcQ
X-Received: by 2002:a17:906:c150:b0:c2c:d06f:cf89 with SMTP id
 a640c23a62f3a-c50491bd3b6mr89682666b.2.1794278012315; Mon, 09 Nov 2026
 18:33:32 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 10 Nov 2026 02:33:30 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Myeonghun Pak <mhun512@gmail.com>
In-Reply-To: <CAGEsz8Gb=4JS4OAFKppe=LW6JYa2ssJ8APdJJX2Ou_BhzEvZxg@mail.gmail.com>
References: <CAGEsz8Gb=4JS4OAFKppe=LW6JYa2ssJ8APdJJX2Ou_BhzEvZxg@mail.gmail.com>
Date: Tue, 10 Nov 2026 02:33:30 +0000
X-Gm-Features: AclHuK8--TocW2ifUYfCFyXaag8s9F_8MyrCNuCPPkZVo7e4LGqYlTsfOEWdPSA
Message-ID: <CAGEsz8HEtP7c-JSV=LvhTH9k5uRxq4z+4GgypbE-gmCurghong@mail.gmail.com>
Subject: [PATCH v2 1/2] mfd: core: Reject failed IRQ domain mappings
To: Lee Jones <lee@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Sebastian Reichel <sre@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Ijae Kim <ae878000@gmail.com>, 
	patches@opensource.cirrus.com, mfd@lists.linux.dev, 
	linux-input@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

irq_create_mapping() returns zero on failure. Storing that value in a
child IRQ resource lets registration succeed with an invalid IRQ. The
child then fails to probe, and retrying its probe cannot repair the
resource after a transient allocation failure.

Return -ENOMEM through the existing resource cleanup path when mapping
fails, before registering the child. Leave successful mappings owned by
the IRQ domain provider, since other consumers may share them.

Fixes: c94bb233a9fe ("mfd: Make MFD core code Device Tree and IRQ domain aware")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

---
No hardware testing.

diff --git a/drivers/mfd/mfd-core.c b/drivers/mfd/mfd-core.c
index 16ad4fd26..e00f31402 100644
--- a/drivers/mfd/mfd-core.c
+++ b/drivers/mfd/mfd-core.c
@@ -255,6 +255,10 @@ static int mfd_add_device(struct device *parent, int id,
 					cell->resources[r].end);
 				res[r].start = res[r].end = irq_create_mapping(
 					domain, cell->resources[r].start);
+				if (!res[r].start) {
+					ret = -ENOMEM;
+					goto fail_res_conflict;
+				}
 			} else {
 				res[r].start = irq_base +
 					cell->resources[r].start;


On Tue, 10 Nov 2026 02:32:49 +0000, Myeonghun Pak <mhun512@gmail.com> wrote:
> Hi Lee and Dmitry,
>
> This series fixes WM831x IRQ resource mismatches and follows Dmitry's
> request for managed onkey IRQ/work cleanup and MFD-provided mapped IRQs.
> The provider and consumers are converted together to keep their IRQ
> resources consistent.
>
> Changes since v1:
> - Use managed IRQ/work cleanup instead of storing the onkey IRQ.
> - Move IRQ mapping into MFD and update all platform consumers.
> - Reject failed mappings and unwind consumers before removing the domain.
> - Retain polling for release detection; the chip only interrupts on assertion.
> - Drop the previous Reviewed-by tag because the implementation changed
>   substantially.
>
> Compile-tested with LLVM, W=1 (arm64), for all 11 changed C objects.
> No hardware testing.
>
> Previous discussion:
> https://lore.kernel.org/r/atJycIEnUZKVdTjW@google.com
>
> Thanks,
> Myeonghun

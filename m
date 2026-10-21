Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792585549;
	b=J48YS/gQwAd14G8tk3OB+aSDob8YlU4KX4E7vPRXL3i4a+dai2UCpqAFMUOnGaO494Yq
	 srvpcyX47VHW3SNNTM1gLTgc0M0+EvYColm8oYwcf6hvfhXXBS8l5NlI5rcqmB6EC2lTW
	 W3j6FprcmppCh8vE8G/O7hD11ULAjmyYbQMFweiwCVm8smJkgD82CL0wUMEJcozED/1yJ
	 Imp6N4vNLS/AGcjlvWWPRX4ACMUs+wchm9dgsh2AcihwqRd8u3IeD5D/XMZQkkk9aN4gO
	 d94MFvPbS1fv0HOoK9qW+waNSr2LbXB7LccR928T0qj/nyupxQ7ZgHrcSJMeoW0XUVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=tw5g1r1nRIeROllP7HVmms/FbIqd5DbEqN/vD2LQLR4=;
	b=bFla9RfOtLKJBxZN33pJrPfroCJE5oiJ6YnPlkKs0DUDZYplNZ5wpB/3rW+y8G39WtDU
	 H54QqN+kl8ue2/SDnq4eKlJY2ZwEh0j4+i0TcD7vI/S79Cs6/TsZEAFgbreH4w2Z72ZhB
	 KIUxKTlXalHIq5hrWtQOJ0+5bMuuO5dNpsWptN9lS3ehMYfLsv7hpKTPPvhfWYnhUlgbV
	 zVrSXU2wieWqLC4KVBkROBD60l+xSXEH8nU3yY2B+oqzh0o8z0GjLkcpT6d8LTL+pWDE1
	 5yINSf+k0cjbigEP/LzzkuJdTMgLLPXCIVNjt4jqmBvuUb8I8EoG9obheSugt3zCVOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=h0QJuRcR;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A589606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:25:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A589606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=h0QJuRcR
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso5447875e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792585547; x=1793190347; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tw5g1r1nRIeROllP7HVmms/FbIqd5DbEqN/vD2LQLR4=;
        b=h0QJuRcR1wIpBgBWmFyNpzP/7+EphSWfN88IpwgTjOS8HoKxKWlLkOdE79LO99kEAm
         Tf8nYbzJO5wUgFTFa+McC8WDh9L5aVbr39Z/Oo6wUVT2da0sM6gMX+RM9GNLEL/VYDMZ
         J5GfkZYm+GWvRtlqSGewn2/QsNJq/ww5CnTMP6GMHWA+tJ+L/kbLcGkke2BKglRs554P
         +z5ILgZT1SUnyrsWpsKhKIFPKK6dH85WzjCebGgWEfZxK3WpWi6+Te9Aionl5bTDlOCj
         uA0ofWyktva1x19hA1kuJg3N6DCpI3XBLJT63NdeERg8dS1lSbbEdxP0OgyCfmeqjCVV
         tTYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792585547; x=1793190347;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tw5g1r1nRIeROllP7HVmms/FbIqd5DbEqN/vD2LQLR4=;
        b=Fa37OH0+FZ8ui5YJd4xI6tH+XIbJSfLo/cjY0WIk/Rryff18rPx67Xjizq2kzzoV1C
         jZq7UNQ3NlBhNBa/IKQ/LmYfHKCjc97EfUBRZI9CcWcHCjlm44BQpEMTemfcWbSwxsxP
         78GoU6DycO76MmTnfywtSvKo111Jf84yMSPTndnlKfSTN26+KcE2jZtzIF681KQvLyBS
         q+4IY8Kxc1Er6+D+dMzEfdEKQwzYHvYOS5CCm865Ts6JB37sggj4ihRkKHOrRIK0TWyd
         Yb75F4U1xGa1VF4WH6PA9+tX3PfY/RSgNjuMQhVvXWsGnvQKgppxS0uK72HCsQAJfRkh
         iyxA==
X-Forwarded-Encrypted: i=1; AKwUvBw7/z/kGoIQ075H2unj8xIT0fjQUdHY2LCIh3DSA61E3mgt1ruypWYvDtqqvMVWAPKY29x++InjBEn3ciA=@vger.kernel.org
X-Gm-Message-State: AFq9FYImsmDAcBnpITbysgXIYVbX09V9RMJWk+Mgghl0CRLkx1+Igrlk
	qIhi5vSTzGl+XbRsdG7Uq0QM1Q34VgRJevx1eObZ8VcZj7k89an0tLrz
X-Gm-Gg: AYBFou18qz64jMdP/gGFbrEtMrdZSbsqvuC0hHAIOVztOaIASwdtv9FnRj1UZC9Syz9
	BpGOElNKO2I52C4sdJW16nDJqB6ZDvJqovbwU4l9/NQjR+kD3owi/BYpQ9ZhKzav9qibsIz1epN
	SyiBRrs+cug6HK/wQ+RtUNryyV51mjsrYSmXci+ka0rT4s+fzyYTiHyLzVIX6OP6Wrv+Jx37/Wx
	eQ1JaC8UymXw+0MRntukBcS83pUToObOgGsjcf7axiVLNpaejM+9Gm0cRMaC8ceQEh8oAF5OEWY
	QRakMUIa4expU+gb9G6lh7uKxUq6AM+/pxbid8QVuQygEb4kKhSjX8wOXtqBxJjv5P+1T+Z/o3p
	9opPv14y+CB/nEEiJ5cws2YNTKW00tWwApXXkni4X5QKXNqNmm9J6gm5IEsGFT7wz/fThG5ePQw
	eT25hYKk+BiJ0rMk5ILgb+EIS4KJGGQX68UlHmpq9wdohk1YQeVUUPLHkAzAlF2SXHNBeRuJvwW
	2+jC1hUEkKHJThooxAeeHzqLrL7BPE95PoQhq0ZHSEMCOZ+A/EU+YfLFGZxE1dUeUuPQrw6xeFp
	gE52mODWFqi8amRI
X-Received: by 2002:a05:600c:34ca:b0:4a0:eae0:769a with SMTP id 5b1f17b1804b1-4a1fdd39e68mr40596705e9.28.1792585546664;
        Wed, 21 Oct 2026 05:25:46 -0700 (PDT)
Received: from localhost.localdomain ([194.154.195.114])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1fb698ce0sm80474875e9.2.2026.10.21.05.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 05:25:46 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] phy: qcom: qmp-combo: check qmp_combo_com_init() in the typec callbacks
Date: Wed, 21 Oct 2026 14:25:37 +0200
Message-ID: <179258553740.5769.1577871699525688695@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <90e14985-be2c-41cb-be74-60ca1829322e@oss.qualcomm.com>
References: <90e14985-be2c-41cb-be74-60ca1829322e@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Static, as the v3 cover letter says ("found by inspection. It needs the
bringup to fail"). qmp_combo_com_init() can only fail in
regulator_bulk_enable(), the reset assert/deassert or the clock enables,
and none of those has ever failed on this machine across several hundred
boots with the dock plugged, unplugged and flipped. What I did hit is
patch 1, the "already disabled" warnings from the altmode worker once
runtime PM is allowed from userspace. That log is in 1/2.

To see what Sashiko's scenario actually does I made the forced bringup
fail once by fault injection (return -EIO after the reset assert, i.e.
the com_init() error path runs: regulators off, PHY in reset) and flipped
the dock cable. On next-20261020 with 1/2 applied and the bringup path
otherwise stock: dwc3's phy_power_on() immediately reports "phy
initialization timed-out", and from then on USB3 and DP on that port are
dead while USB2 keeps working. Unplugging the dock runs phy_power_off()
on the unpowered PHY. The writes are swallowed, no SEA on this SoC, but
nothing recovers either: a replug in the same orientation never
re-initialises the PHY because the driver still counts it as up. So no
panic, a silently dead port until the next orientation change.

2/2 doesn't fix that, it only stops the register writes in the callback
itself. I have a v4 that drops 2/2 and instead stops the Type-C
callbacks from releasing and re-acquiring the regulators and clocks on
every orientation or mode change. They only reset and reprogram the
common block, so a failed reconfiguration can no longer leave the PHY
counted as up with its power off. With the same injection on that code
the callback returns the error, the PHY stays powered, and the next
Type-C event brings USB3 and DP back.

Konrad, do you want v4 with that change, or .. ?

Oleg

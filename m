Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794818356;
	b=r4KcaU9/lEAqrzS75QAG5ZrfX+g2AobDR3+IG+5Rzm1mUZldMbZKgOrdKshjp0qiYanP
	 9kcyy9tuLy4icgmoCrJOOXBphSNWN0Sm+LabKWDvyixr6x7UNLo/xKwEIp1cnpxBvByUf
	 Lrft4LDZJZa9ZLKokJ4S0rLpDuys1/xpUeuqy2Lkeg9nSfWqJKhOvIQPIemyA/voqAZoq
	 L5G8MFe5Rm5jLph1K1HRLOiMeWyxvFA9gviJrcglw46PUwFRxQbiZeOPKg9IRqnmjLUYf
	 Y6yzlttK6XePbwwd2t35RhnqPq2w0hX9JpzclVgiEK4xsW6REH3AgIM2LnPpdhwVo+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794818356;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GSln0dgCtCb5NYN7ycmhGMDAWgf5IcHRxJsc0mjSO+k=;
	b=fNT+EtQUMXUiP5RWJMn8tSaPJVlblIAB5ud+RVDC80Aa069FmF9oROoQmTpaUByH73dv
	 KjgjlcTVmJ1svtnocc1c4Gt2oykuAmT0oBBP4WW1VQIPOAkmjxGCrHhTCia6XBgaF17HU
	 XgVtndlA1Huf3TzQfI82Hhsvx4gUTWx9DS8rcCpTdFsubXSCw9KehCMSa/QvQc6hBeiFq
	 8hsATCMTqcU9kplSgmqhQM4ohQHeovAQZchy8CJMyZPxqjOb/rhkNvgFTJh5yOzY1ZHUT
	 YEaSBCy/GIVFm74yaAQvZCrqyK88rC2TVy5r+dnVduObz82IdWkVzdB55p0hpIfGpOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tsFTamSo;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C16A606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:39:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C16A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tsFTamSo
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cdb15cd8558so1131186a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 00:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794818355; x=1795423155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GSln0dgCtCb5NYN7ycmhGMDAWgf5IcHRxJsc0mjSO+k=;
        b=tsFTamSomiR+GLKFISpDKDvQ5p3W01tAMOnHBeL5SoE0r19R8f5QdYLQhKjXs/FBYh
         feffXB/05XEHW5zOXdHiuXnyxPxduKmOYPVFik31hT8xlg5cbFlqXhmqOogWCGltks+8
         Ab+zWXYY/pv0F/2+zKktYs6rFgpa3g5wzYvXIjWfDWDxXHo/0YVPd9nkr8jUWwJ2bpkB
         mg958FFeq+ksp0ZHiD8SJW2A6AB2383yNeGxV0XGyfr+C85reeJ0OFCtub8Ze0O1mHBG
         /hDNFsjXu228ETzod9MfJIOU8MIvG1yJIAobkVH0pWCEEDkyj0ynmSISgKKwdccAjSRI
         52ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794818355; x=1795423155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GSln0dgCtCb5NYN7ycmhGMDAWgf5IcHRxJsc0mjSO+k=;
        b=AzKjwOFBamnw0ortiZmGQFySQgUsyLEjcsDXQ4CUBIxCBrkxPTE/u3EOwDhci5H/GF
         ZDL9LDRRX08KRUOT9AdRnB/JPQjqn1CrNW9JmhAdVcSb9Sv9mi+HIt8ogolD46G5SO+M
         AxTsKrYBbILCHBPrvx9gzA9plall7UqfI+gQAmIQwmFDM6nuLTybNoqOGagnDb/VypG+
         PXnB08o9jSCZtE9YdjuKNMulk3aMkHDlvO3TukHv70qs/sBI62AKSK2BvJqWszPouYkW
         2J+tHwhiC6Ybn1DTIB3bW5XkRWJq1OgQxnmCu0KPv7b4uQnhdhML6Y0okEFfjW9geSRR
         JMlg==
X-Forwarded-Encrypted: i=1; AL+hErEcDzQu1duahWKLdkuJNfM4JEBhwOtReLH8puGvS5eUYDIhZntGo123nS5/O/mRS6vVmR0+nfaPd80LHQA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6s9Rf6HIdo4lz4WbtOOvrrOc9CJn8UKK3DRrh8B3a6+3AiZST
	3TufPZdDP40OhsjHwiP2Jeyls9d0zky++c73xjn6IwB6v/1IFuKOgdsb
X-Gm-Gg: AZFdTZdCMyxaEJZ6cZwsxCHzWnyx943KRCx5MGr9rnubResfC6Zj7fpmb66bZ/UwPn9
	9NH2Aui6HaJy3DZ5ykSxqZ+pveMSXfxih18/p426EQFKBfJwRuS0NRNaH2t3KNXHDBzQo3Cp5Tc
	eB4d8zLZpIYJ34wgmCadRT+q/CgX4vLMY8WqUyNkquRqHaIwz0R0Bv9KD6JEiSFho+UPPdzaGoo
	3S0ClwVZX4LddL/1cnLBizkDiXkpWe4mb0FH6OIVAditcl4rL2sf91oQewe7pIKD1MTPUZ/NfwE
	uiwZQz5EEM+YfIcfm6PVXKBIzsDHq/3kidPDAX8hA6zkHh5LGbfz6wc9CWupvgxG1CBnmjpgBSZ
	5JvnqyatBhZDGChVlU8ytKlhirPUVYEIl7hXz0djXnXS3FUIXFDCtK7NSkfBYnfYH50tlV/0HIu
	lOe1CkDyiOgvYRGVqjY7KwkxFS7f1DfmRsmwaihll++ue/jAStLAnxxy1jFpOXTp/2uG7O9ZOOl
	Rs04c9mf6smvmaxs4wDaEiCee/3VftPsViZAHLEpZNgUxEdc+e+odxRiWEnrjWQAD9WDVAE3g2e
	Q1psjfyTGTgAmh+b8E7Xf9Tio2PTxCxuWqeCpFHVenVw+5kaZdAyIiH0Xx8=
X-Received: by 2002:a17:90b:4f85:b0:3b0:91ce:6720 with SMTP id 98e67ed59e1d1-3b1b0a1ef3emr8998420a91.30.1794818355362;
        Mon, 16 Nov 2026 00:39:15 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:90a:5f11:9056:5eea])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d32ea0sm20238697a91.15.2026.11.16.00.39.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Nov 2026 00:39:15 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Michael McAllister <me@michaelmcallister.org>
Cc: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	brgl@kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_bgodavar@quicinc.com,
	lumag@kernel.org,
	mka@chromium.org,
	markus.probst@posteo.de,
	shuai.zhang@oss.qualcomm.com
Subject: Re: [PATCH v2 2/4] Bluetooth: qca: Power off after unregistering the HCI device
Date: Mon, 16 Nov 2026 16:38:46 +0800
Message-ID: <20261116083846.85334-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <179468159400.2456.12381703314197227930.wcn3950-poweroff-v2-2@michaelmcallister.org>
References: <179468159400.2456.12381703314197227930.wcn3950-poweroff-v2-2@michaelmcallister.org>
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

Hi Michael,

On Sat, Nov 14, 2026 at 06:39:54PM +0000, Michael McAllister wrote:
> +	/* Drain HCI setup before clearing protocol readiness. */
> +	if (test_bit(HCI_UART_REGISTERED, &hu->flags))
> +		hci_unregister_dev(hdev);
> +

Moving hci_unregister_dev() ahead of the hu->tx_skb cleanup also closes
an existing race for every hci_serdev protocol, not only QCA. Since
21139b3ac62a ("Bluetooth: hci_serdev: Fix use-after-free in
hci_uart_unregister_device()"), unregister frees hu->tx_skb before
hci_unregister_dev(), so a concurrent HCI close or reset already inside
hci_uart_flush() can use or free the same partial frame. Calling
hci_unregister_dev() first waits for that path via hdev->req_lock, which
hci_dev_do_close() holds across the close.

What the series leaves open is the same flush-vs-TX race on an ordinary
close. Your HCI_UNREGISTER early returns keep hci_uart_flush() away from
hu->tx_skb while unbinding, but HCIDEVDOWN and HCIDEVRESET both reach
that free through hci_dev_close_sync() with the flag still clear, and
hci_uart_flush() does not stop write_work first, so it can free a
partial frame that hci_uart_write_work() is still sending. With your
series applied, a test hook that keeps a partial frame in hu->tx_skb
across a close reproduces it under KASAN: a slab-use-after-free read in
hci_uart_write_work() and a double free from the close path. The device
reopens and transmits afterwards, so this is the live path rather than
teardown.

I have sent a fix for hci_uart_flush() that stops write_work there:

https://lore.kernel.org/r/20261116080538.66575-1-enderaoelyther@gmail.com

It is based on bluetooth-next without your series; your HCI_UNREGISTER
check in hci_uart_flush() goes above its new lines. With it on top of
your series the same test is clean and the device still transmits after
a reopen. I will drop my narrower unregister patch in favour of yours.

Would you consider splitting the hci_serdev.c part of this patch into
its own commit with Fixes: 21139b3ac62a, so it can reach stable without
the QCA power changes?

Thanks,
Zhao

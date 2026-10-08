Received: from sender-op-o15.zoho.eu (sender-op-o15.zoho.eu [136.143.169.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1E82EEE8C
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 14:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791469228; cv=pass; b=MHq7/qiiYrlGr8INTuCg3/IICHm397Aq9b0mv3jLMtLAfPMJ6xqBFXmX3n0H/u76uiIQUC0sgY0jiJhA8kfuIauRnovrzT0yqDTnJoyt/Y5ajcla+nw9g7vVLLS8Gi3lvWstpDLDA9F2HgtqID/p+WdJdB/tNOMBKbPpq5Kmbyk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791469228; c=relaxed/simple;
	bh=7H7GHV2tpd9DQz0mx8nIagNiDC6A1GJJbocolPx7T98=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DchKRWN1NJAQm3byQmaQMKWwaXqQ9YcjRpSlibcfuie1zlTlomFcmfW37fWrY39S56dUZmrIGg926f6xPXwYgBLTyDzm4QVp6wdyIEgyuWtR+JToZPqvAcLRMhSozOdi2gmlxWBzzZc5svrZf701RsXl+1qAYQTn8B2jPKFBkiQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iav.lv; spf=pass smtp.mailfrom=iav.lv; dkim=pass (1024-bit key) header.d=iav.lv header.i=iav@iav.lv header.b=PWfaoUeh; arc=pass smtp.client-ip=136.143.169.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iav.lv
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iav.lv
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iav.lv header.i=iav@iav.lv header.b="PWfaoUeh"
ARC-Seal: i=1; a=rsa-sha256; t=1791469199; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=B9eUFbUFWwy+2EylRYhJhGUtWUmB8HuyzXWW0t6BvoWrSKpDj1lgBTy/WOJoyy0dclVDPeyKiwtvUFT8Kk0kc3WbGwheHcHfcAiD6vXUktcDDPbpUM+9tOYxhesMzB7yKULBDZbKfAgNGFvzLtE0N+keg/qqnAXXvdlL5/PJhe8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1791469199; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7H7GHV2tpd9DQz0mx8nIagNiDC6A1GJJbocolPx7T98=; 
	b=fpfGEzomxY5Qk7S8L75uDxyhpCXzletoUou2RkZ+uAmi5yDgow/Wlne75r2uXzGrmMbaSPwguXRQo/PQGSe45/THWial4zGM4rx8SLt+YiWTiqDv83+1awd8x4SWJu6hKR35jjnZ4sWWABqWTyIFypzbq8GSOcWbu406R49Z3p4=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791469199;
	s=zoho; d=iav.lv; i=iav@iav.lv;
	h=Date:Date:Message-ID:From:From:To:To:Cc:Cc:Subject:Subject:In-Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=7H7GHV2tpd9DQz0mx8nIagNiDC6A1GJJbocolPx7T98=;
	b=PWfaoUeh8JsfEE2VS9gnSMNZgcBJuy0C8d6EJrBqI1DjFTk4lyxYG4Hk1KKAB/xz
	IWUyL4reb45QH+TTHeV1JPQx11dbrbixSf6Hq8ca0OYuO/xab5LgIO+joINrUcVgpQI
	Y5fIxXl9rDD0/GnvDx1P4pFcvcvlFV9/BWjiRCr4=
Received: by smtp.zoho.eu with SMTPS id 1791469196359881.6653594573447;
	Thu, 8 Oct 2026 16:19:56 +0200 (CEST)
Date: Thu, 08 Oct 2026 17:19:54 +0300
Message-ID: <a12a6d283cd8382311117c6b95bfee23.iav@iav.lv>
From: Igor Velkov <iav@iav.lv>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, iav@iav.lv
Subject: Re: [PATCH] irqchip/meson-gpio: Allow the GPIO interrupts to wake the system
In-Reply-To: <70897195-0ffc-4d80-80d4-e60f87c6101e@linaro.org>
References: <20261008-meson-gpio-wake-v1-1-b0af1598d469@iav.lv> <70897195-0ffc-4d80-80d4-e60f87c6101e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.10.2026 10:36, Neil Armstrong wrote:
> The code sound valid but the this paragraph means nothing, adding or removing
> IRQCHIP_SKIP_SET_WAKE should not change the fact PCF8563 would wake up the ODROID-HC4
> since the BL301 firmware hardcodes which gpio can wakeup.

The test was suspend-to-idle, not mem. The SoC never enters the firmware
suspend there, so BL301 does not pick the wakeup source: the CPUs sit in
cpuidle and any interrupt left enabled in the GIC brings them out.

Whether that wakes the *system* is decided by genirq. suspend_device_irqs()
keeps an interrupt enabled only when irqd_is_wakeup_set(), and that is what
enable_irq_wake() sets. Without the flag enable_irq_wake() fails with
-ENXIO, the interrupt is suspended, and when it fires the flow handler
masks it (irq_can_handle_actions(): irqd_irq_disabled -> IRQS_PENDING,
mask_irq()). The alarm fires once, nothing calls pm_system_irq_wakeup(),
s2idle carries on and the board stays asleep until a power cycle. With the
flag the interrupt is armed, pm_system_irq_wakeup() ends s2idle, and
/sys/power/pm_wakeup_irq shows the alarm. That is the 4/4 against 0/1.

> I guess this flag simply removes an error when setting the gpio as wakeup source
> which means nothing in this platform anyway. So please rephrase.

For mem you are right: the firmware chooses the wakeup sources and this
flag changes nothing there. v2 will say s2idle explicitly and describe the
mechanism above.

Igor

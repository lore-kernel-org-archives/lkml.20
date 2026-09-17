Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B874DEC22
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 19:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789672862; cv=pass; b=X9oqQT+gOADsXy3jVP5AGen2ph7g0xDYX00rK3vHHvJdSd9rPEz0uv5oUr5K6PERB/VUf4kldijyU7FEFYPL+gtMOQWsVR9ABlLqCSYhxX6sYVWO+fzONWj4awjCiYQl2DL7uSS7fRiWEUfk/002Uvs6EdMQKWTdIACZocFzWtk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789672862; c=relaxed/simple;
	bh=b9QDa9jgDjFjOwt4VJXvXKJT/NU+qXv7vzZtc7dxTcM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=jIJTr5arpj1FcU2TyCnred8PAs6sYUY+ipNCp0IohTyUjRNPNyyohd80kMJSFdd++mjCkGpRJtoWLJ9XXr6cJmLj0htH3l957zdoKx4N4UeD+bz5mAaDjg9cLE4fKw/J5h74nmB/IkAwRoLsi1hJOIJ6q/GmohF+/nJZiP19gFo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pD7jIUHs; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pD7jIUHs"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a9984f9adcso2080517a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:21:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789672859; cv=none;
        d=google.com; s=arc-20260327;
        b=GBwBD/lBxZQ5LXYeTOOvU7C9ev2vVqrRnGUc7gIeAeYVprhsy9aPGNHwFU52t5NDtY
         TpFPl4X76XF90y1mWeV+LY1tIV6CCwVvdjTwmhnspXhRzSS9DCenUdhwxvDDbenz3tW5
         Jv4Fi0bo+YAIDTaxb2HkGFTKR2wpYefYUBA/huj3oSPh+6be/78wEmP83YcjrwkRCLo7
         iIwoyBmHdEE623v2iNMVxrO3cPJhj/MPNiDodVvwlv78ajesq8OJhfJSybjDKu8vKMk2
         tHy2puk195I9EnyVVQFdXqVaUsFWMfwFNygFVyRWtCiMfsJDY/YSSTKZGx5hQmnYp73i
         /SLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=J/A6MwTJDB3NeP/eALr2ie67LMze+zYTRsIK1+3o4Qg=;
        fh=JcnJhjgt2lGr9YqadnyMQykM6LTTCSpoHjGMilc7uKY=;
        b=WdHNaX4WVfvd9IieDDqzGbpzQdxslLJnO4AFzFpiFvJi0bHhEmkBeuwnxQ6R76BfL9
         71GZ5i4fI3devqZCB8zFBR/6W43D4+XBnBh9sERK6VFH8jP82tE0kYJhVOyNeNZbgLeM
         XasFkMp0Et1ypaAlPVVY9cvTdpCWul112jgY1zQRcjJ3ty89+yUux5gx4fIXdrifoP7G
         P1qCzWlgFn9fpVwPppIajcp3Uib8gLdHZz668NaFIymihHCe/38J2reMoFdbfGvwsVVT
         v4focgspEsM04PvioiN0u1nZuDzOdyYdPu/RETe449ajpqQ2xBgnfG1OgMvuxDO0S82M
         89DA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789672859; x=1790277659; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J/A6MwTJDB3NeP/eALr2ie67LMze+zYTRsIK1+3o4Qg=;
        b=pD7jIUHsle3TBiQoOzuUuhbnc+dlnQP5N2AZvLOedAR4lMChd273hY8o7AUmPzhsol
         uV5bXZS6hAiKHkyg3X+pOTxqUlH5dXzSibYAvDdvIO0xBeG5QNViygc00le4zhHLkM+l
         KCyVOYuca+XdgxtPgRQqVvHynGK0AJxoLVx4Ki2JCnP5eIR9JBSxMbBbJZVSAmbem7RW
         R3Su80xiNWQrDpPBbXoGtm08CAk5kcIrWiSRhSTXhl0Bw9xKVETuV6cVKskBRyr7+FPK
         GNuR9Lax0UecR2pXSkqOPwSf/gDtmQ/227u2U5Ep5FJxMjxHyg9YoVgSadcyUlntB7rx
         wFTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789672859; x=1790277659;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=J/A6MwTJDB3NeP/eALr2ie67LMze+zYTRsIK1+3o4Qg=;
        b=tZ8gpnxhysikpVZaRyfuEFsY+9+DHl2joNf5us8MM1wAGNCGoe/NVkjM2ACF9RZX7j
         2QRxKYCwTL/VREZsocKfnVWk1xuUPp6B4xt3j79VoNthUZQY4tzSKZP852AujVyTy8cf
         P2XS3gvM+qpGULOW4zknToue9C014zqy5qsct/OS41dilgwigt3P/NsCD+kIwqEZARTC
         aayGpANDwG6L87TuSNDYKHa3s4ClvgKh7xhauisI6/buIgc6ROfZBfU/JxvaPDY8Yuw4
         85Pd1zrIQXCrp2pg154JDsErUUifCq7Estj1epjNTUXkWbNHz/bxIvxHQVpDvwICu5ZZ
         cr8Q==
X-Forwarded-Encrypted: i=1; AKwUvByY8bhk0Zp5IKVyz+ooiobQJndHRtjsTV3tWe1sJ7gg1zOeoZWFzxCxX03vpCrMfe0DBj6sog6s19BfogQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mwXn2DhpKEoeCHia8U9iAxmRWWVOmDBEnHEqA+pY8BUm+MA/3I
	6S+mtvBfgAlwXSJXBnfOeAOPowYsqDRV5lfd4zMuH+9rCZDHhT27l/1TtI2e4hepc5+SsJYSIvz
	bbd7N4Iktn1ax6WDrCeaMc0bh5wUnhg==
X-Gm-Gg: AYBFou2SUV3wmyuofp92kV1Ckt1+vmfuuXjP2QakoBzwl+ok4SeeCbK4VBER8l530yP
	rFSf7MkRf/G7hcocr7Y0P+xCvqMpT+cdoEis9KOpjtpga0AdOeoLNGZ9jJU1MkgG1bBk+Ap0L00
	3qzIrrDM3iOjPmPMaxy1XJkM5m/Oc5hri81YeOK3HzbGLogkV3Mizzn2uZCZpoAYuKNgzI5Mc9l
	4D7b762tlH4keHdLoq4bB+gdr5s5mtcQyC2/Q8yV16bfT+9xs1iRe1W24t2CJWaZNxOno5NNCen
	UeOqXxq4qyE9JFOIkmDzf0uaP7uMIUkJL/O2dKiugyM6MQsFNAslAJrQTUtxnTxgeb8RH6Do08S
	KDqTCG+EMvR0NJha5LUXGcswJ2Wk45AvGj28xX6cl26p1HPnezv/rSB9pK1ikcsj4SkLX
X-Received: by 2002:a05:6402:234e:b0:6a9:bc61:7f80 with SMTP id
 4fb4d7f45d1cf-6aa22418ee6mr5676940a12.27.1789672858973; Thu, 17 Sep 2026
 12:20:58 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 17 Sep 2026 19:20:58 +0000
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 17 Sep 2026 19:20:58 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Myeonghun Pak <mhun512@gmail.com>
Date: Thu, 17 Sep 2026 19:20:58 +0000
X-Gm-Features: AcwNN1WxTWOhjEb7bBl6eypOV0BHfRXqW5W6uIymGwW7YeDpfpFb9TiYbq7J4Ek
Message-ID: <CAGEsz8F2eKsmV_tymO+9UD5xkS_tWhZo-b9Xom1_SiKuc-BCqg@mail.gmail.com>
Subject: [PATCH] usb: gadget: tegra-xudc: Disable port reset work on removal
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ijae Kim <ae878000@gmail.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The port status interrupt can schedule port_reset_war_work to handle the
Tegra210 port reset workaround. The remove path does not cancel this
work, so it can run after the PHYs and controller resources have been
released and access freed memory.

Disable and drain port_reset_war_work before tearing down the controller.
Use disable_delayed_work_sync() so that the interrupt handler cannot
queue the work again while the managed IRQ is still registered.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 49db427232fe ("usb: gadget: Add UDC driver for tegra XUSB
device mode controller")
Cc: stable@vger.kernel.org # 6.10+
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/usb/gadget/udc/tegra-xudc.c |    1 +
 1 file changed, 1 insertion(+)

--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -3926,6 +3926,7 @@

 	pm_runtime_get_sync(xudc->dev);

+	disable_delayed_work_sync(&xudc->port_reset_war_work);
 	cancel_delayed_work_sync(&xudc->plc_reset_work);
 	cancel_work_sync(&xudc->usb_role_sw_work);

base-commit: df2908090cda368b01ff43709f51890076c56157
-- 
2.47.1

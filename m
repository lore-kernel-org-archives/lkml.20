Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792682210;
	b=GqmN20073ACCkdngBLP3zDDha033bZJHyQ3P2fteD9Du2BHBz40lzRbTLdeqRxe5sWnX
	 Gqm5uhI0GbipUOt4Rig8pWKZdwDcvJVubYUcAvtfCcWGqvU1toMlcp79JWgGLlckOh4rz
	 36du5uBAAichIZkgsJbIiq2uu10960DhE5A9TBHt3+g2luz5H3Jp9ZHbXAwkI2/hhsBjV
	 4SwpXCG4HioJHliYONt7pGZdQg4xWCZ+iTQD8q8MnUAmH2bIheLobzJ2/+mIvMawWwcap
	 vxPEF8lPY8gC3BUCVzdKaJSov5kA9eiVplUGH0gb7gLdCDej5jxuo+pGnjH2SRhIwbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792682210;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=DOHXnXj9H0hCXUUYqqbghfjLZTExI37IMuLDbNTswLI=;
	b=vMlgXJQUUmX+jSWVQHoQJ1yfbl89Qd6NY1F0uBbmMnJ1C/E2Eav5jjhHPa/syt7jvXPo
	 ViwhyKZ8DKF2/23fSubc8f2Y41IqtMdaTyzNFMfDdZQVB/GOah8kI8Jw+ieKralCbY9Ot
	 f1ZcP2KK+uyrvnG3eFIjt7HOixkfEeMIbWtzx//A6HvO8QY7o+HaHRZCU4WMncHhz4ToM
	 w910LENhxD+sEST++vIpBBo/dANje0liC0Uv/wxeXdT6Svisq0rgFWbfwaPTSp+gfULtP
	 3l3kebsfcEWZVCVhrV/+ZiO9rCAbz/t7wKVtL1fmRUXghW0A9Vihl4Zf71Of1V/xUMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=d4iKLn02;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF6E606B383
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:16:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABF6E606B383
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=d4iKLn02
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-70b875f6f13so9338eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792682208; x=1793287008; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DOHXnXj9H0hCXUUYqqbghfjLZTExI37IMuLDbNTswLI=;
        b=d4iKLn02OTqL+KMfhrnOAAthWUA2hmMU3XVU59+ctqrRUNPLQABODb8zadkrhFSRxE
         otlH/r1nXGDgqIRTySVkbFTiQZVHJ8G+sPnbxU5NxbyvujYUud+GBL4hFdEv5u3MfYEj
         hqwhE2MM2lnsTkZZti76o+DGtR+F/jYCGWowrZ2Qyqonne+KHcWV6GljpEfboGurQ/iv
         H/xELW09uua04J3nm2O1Ksf5pgGptGI5q+2I5dvCORCv+r0XhDeQ7J+rw6CfTHytzQx2
         Xx6ImduwR9A7Wrkcw/BsQuep3JMXoUOugOhxufy6I9aARJDj68LwOs+7sfSN56aL5LJO
         1Y2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792682208; x=1793287008;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DOHXnXj9H0hCXUUYqqbghfjLZTExI37IMuLDbNTswLI=;
        b=yXeuLusf59L1s3WYiCRzct9X9bXhecesgQzxC+yLV8nd8M4z1ne0dUvsgpSpsiLyak
         kIHid5xi/CL2GQVV+6gzlecrv4+vl1vkRM/7FVWo/uu7MPPn82wtQNL/hQHmXZy6LZjU
         HxvoZioBxpYcaaWr6CDSMqpa9Bg/sinfZwdulgHisRASdHQhFi+UUgUbIza6+8bnSAn+
         z+PlQ3ZqpkVcVIbtuWqlD1b1douPZYuNhPIebbiTk/tYCI8udXJ154zBWtFQ4F+lsW72
         CUCLQiqsrzq+/FPzzvQY0gAWQTW2rQo2qkHuuYh0ocetaLqqq78kRFKGF+DVzBrLHhPl
         RB2g==
X-Forwarded-Encrypted: i=1; AKwUvBxjma2Ul6pu0SYzmarEfhIvwtgky4zsXRMZPAla/tMf7D0rrWCW2FEU5dt8US3Z/uQ+2PAPntR7L8QhsDU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQz2V7eRjxUlrxXZ34Nud4pfw+3ttUTW15utjrKQSWcct3V1Fq
	yiUiWtCm91nPDSzSKxuQhn2OvSaEOYb4ph2L/8qSot7N0H0fjAJGlgPE
X-Gm-Gg: AYBFou2ZkPHwVM5FKYR8zvdeEWlOSq9UfdbNwrMeP6Z1kQxXwwh6nEGqCs8v1zetiyx
	D6qyoxZIKsSBGYhoWOBYUnCgl2QseWGoW1GYpik//EMCGpX9oxeXaowxOwZq2V70gjVIm7GUwIR
	5ZHeLDGv5A5co0BNxJuqHIAW36q4SGPhtuxnBHlqVgoa3sZnz99dCAapJb36f2wXNxsQN0TuEgf
	c/goi7s+xtods/IRFrp7pTHMaIH0bPgvwk2iY1uCqyskaVLen9uVN4/wMVdxLpoWrMhe0hXyp3a
	Pr/U5Q49wI56AlvoWodIMXLEjSRWVkw3dCoRJkM0JICYGFh7w9JiVes/c6/rIcKvcO3Zw78DMGD
	myOuM8IsCyVXG0YnbVjKjCx7jVIbe9sIKoLjtk1vIODGUtqI0JzlaXIQYm/OpdB2UybtH4sOJcV
	G5Nu4K/17UAxxHLW4HF13cgVmNmoyCu6JgKPyvZrMMH1MtjYCWyowClTxSlzuF+4F6QrVQeJXA8
	HTf/Dwn1a6vPnS6RK1Ny5wvDch0SZBR+eQ9IwReJ8xlgLxEK2pcy60/LIL0M8Ni0a5vW3Cnj+X/
	CqluubnDpft2mRCFfscgRprqNZehRC0kRMz6i8MLQALgHf6+v9mwemnx1H4lSYsQFgVVMuc4Xxm
	5xKUCohJUQ1oc5XWnvp0+6yfvo1MqvlqCjAos0aP+AkPLNi3Qu1GAcEMWXRtiZWQI6x40/BEqH+
	c4TRI=
X-Received: by 2002:a05:6820:997:b0:6dd:4f30:258f with SMTP id 006d021491bc7-70940d5b3f2mr3229186eaf.56.1792682208643;
        Thu, 22 Oct 2026 08:16:48 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a7d5eb8fc0sm4685631fac.1.2026.10.22.08.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 08:16:47 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 22 Oct 2026 09:16:41 -0600
Subject: [PATCH net v5 1/5] ptp: drain virtual clock sysfs operations
 before unregistering children
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-ptp-vclock-sampling-v5-1-06ceace17bac@gmail.com>
References: <20261022-ptp-vclock-sampling-v5-0-06ceace17bac@gmail.com>
In-Reply-To: <20261022-ptp-vclock-sampling-v5-0-06ceace17bac@gmail.com>
To: netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Yangbo Lu <yangbo.lu@nxp.com>, 
 Miroslav Lichvar <mlichvar@redhat.com>
Cc: Eric Dumazet <edumazet@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, 
 Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Parent clock removal walks its virtual clocks before removing the
n_vclocks sysfs attribute. The mutex taken by ptp_vclock_in_use() is
released before that walk, so a concurrent sysfs deletion can pick the
same child and unregister and free its ptp_vclock a second time. A
reference held by the device iterator does not protect that separately
allocated virtual clock.

Remove n_vclocks before walking the children. Removing the attribute
prevents new stores and drains stores already running, without holding
n_vclocks_mux across a callback that needs that mutex. Skip virtual
clocks, which do not have this attribute.

This race was found by code inspection of virtual-clock registration
failure cleanup and parent removal.

Fixes: bfcbb76b0f59 ("ptp: unregister virtual clocks when unregistering physical clock.")
Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/ptp/ptp_clock.c   | 5 +++++
 drivers/ptp/ptp_private.h | 1 +
 drivers/ptp/ptp_sysfs.c   | 6 ++++++
 3 files changed, 12 insertions(+)

diff --git a/drivers/ptp/ptp_clock.c b/drivers/ptp/ptp_clock.c
index 4111342d64f0..47ffc773065a 100644
--- a/drivers/ptp/ptp_clock.c
+++ b/drivers/ptp/ptp_clock.c
@@ -508,6 +508,11 @@ static int unregister_vclock(struct device *dev, void *data)
 
 int ptp_clock_unregister(struct ptp_clock *ptp)
 {
+	/*
+	 * Stop and drain virtual-clock creation and deletion before walking the
+	 * children. Do not hold n_vclocks_mux while waiting for sysfs callbacks.
+	 */
+	ptp_vclock_remove_sysfs(ptp);
 	if (ptp_vclock_in_use(ptp)) {
 		device_for_each_child(&ptp->dev, NULL, unregister_vclock);
 	}
diff --git a/drivers/ptp/ptp_private.h b/drivers/ptp/ptp_private.h
index db4039d642b4..ec8633126d6b 100644
--- a/drivers/ptp/ptp_private.h
+++ b/drivers/ptp/ptp_private.h
@@ -169,6 +169,7 @@ extern const struct attribute_group *ptp_groups[];
 
 int ptp_populate_pin_groups(struct ptp_clock *ptp);
 void ptp_cleanup_pin_groups(struct ptp_clock *ptp);
+void ptp_vclock_remove_sysfs(struct ptp_clock *ptp);
 
 struct ptp_vclock *ptp_vclock_register(struct ptp_clock *pclock);
 void ptp_vclock_unregister(struct ptp_vclock *vclock);
diff --git a/drivers/ptp/ptp_sysfs.c b/drivers/ptp/ptp_sysfs.c
index dc398c6b7528..53388b123198 100644
--- a/drivers/ptp/ptp_sysfs.c
+++ b/drivers/ptp/ptp_sysfs.c
@@ -263,6 +263,12 @@ static ssize_t n_vclocks_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(n_vclocks);
 
+void ptp_vclock_remove_sysfs(struct ptp_clock *ptp)
+{
+	if (!ptp->is_virtual_clock)
+		device_remove_file(&ptp->dev, &dev_attr_n_vclocks);
+}
+
 static ssize_t max_vclocks_show(struct device *dev,
 				struct device_attribute *attr, char *page)
 {

-- 
2.53.0


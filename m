Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2CA3563F6
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 18:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791743490; cv=none; b=DcKPriOLGKO+LHeEfAqeilLfHG0MGsvKxbEcLHO3vsQyYUSK+gfNh1NUHAra2so/UMDMEft0xwqFO4006U8d+f4kQK16K8R00yvf9RGsyS4jr3p3oOhgwsDHJueVKAJFtL81kn2Ei794hH8bfCOFrWRKCpelq/UGDshu2nLNwls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791743490; c=relaxed/simple;
	bh=qhTz5OXbSUDAJ4e9N0LFC8LqDDii9uCxNuOIii6UFuA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eLja13Bj5cF2U/8kBxbIS70Lc5bY4JFfHHvLGYEh0imtty7GS2ImkcR8h0Gl5UJU+SG0y69AgbhDwZjUXPTEJ0zIjrp0pLTppfd8H2liBrDh535Mj3i2GDMGdBKsaqL9GzywY9MEK9vflyLqM6I2Dg1hlTkuuuEqHfQy32z2zXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cLRENY6a; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cLRENY6a"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a020e65269so6892675e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 11:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791743488; x=1792348288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qhTz5OXbSUDAJ4e9N0LFC8LqDDii9uCxNuOIii6UFuA=;
        b=cLRENY6aPKuaK/kV5pOd5qEkaSMve7bOy/8ptyU0+ZG0kiCXwB47jip4lOpFnK/RPb
         72g3FDUrRvezABOgBzXPSsiBWp/JhG2yjLaIdfp6b4fKBtbv74jcvpBMAXyOuiuPcNDu
         v9vZXTkumaqOsvx2cll73qbT6U7xMlhEbdqDYxYDMl8zyja8qkVAZKfPTdpZm/q1AB6e
         lwA+XhyLDYD31ItiDV2WNeA4a8UZzrzURirYWOQGqXhUR6EW90y6w3NlV9s9sQ8FiGAK
         5zo/TdeHe3dR4gWJBTBWD1hCbX9VgRdEo00OnkKKKyEcKTbERgKIcVfd/CoDh0pEUjuZ
         U45w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791743488; x=1792348288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qhTz5OXbSUDAJ4e9N0LFC8LqDDii9uCxNuOIii6UFuA=;
        b=pM+3tBZtEY+N9EhXrm3edI8T97lougnXAmR3bSyDQ63Onmwlb4fCorc22wRs7MsqAP
         gyAPtCobfunohT0S0MCK6EfreAHwo56DLr+LLeNnsK0w6/tmcaz8ZkiAmxurEmiMbx4e
         fq50EkldoI/lBsXAd0eLHoiWPTZ+KImwU4OqHyO6xWEvHqbeLT5oBeA/8VStrhhQnIuY
         K5SKeqiLo0SmelVqQSKLfhAym0TRvkcLOwF1OJmTTvzH+wLq1LvhWaKEmeBnm/5Fd+Eg
         02ILtFCZ9joFxvP4NjyAWlBt2vC4kfUkddVHPQyurhz33KFOA4E29y/Db0Qx1ubgpbwZ
         PydQ==
X-Forwarded-Encrypted: i=1; AKwUvBwhHWowQ9qFn8ByacUSRb/A4xNwsSNMQ1Igg3q2XVkwS4sV8BxfkpqpIXc7dIOImNo79fAQxem+3eoZ6Fk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTiqns0U20Nm38YkB4aJe8aG75F52YpMyhvTfkTPwdMrrEL6Oc
	adrEVv9GpQKQDVGuY0YPsLgAIfTFK7QwHdY/1VEfdBV2iqCFXqEZ5s2c
X-Gm-Gg: AYBFou0mDc6SN9gCqzoo17yPNDY/QI+UO0MTpDJv5X73CAF39h+++qWSg/p701ryVZl
	XMYr2MTeRqVm4b5SJiub6nasuXlM/Ap3MKsupkJyxq4VSPOMCA3eORsg1laP7TnAPDVzjCzce2k
	D1TEWvALKyk/fvNy5ob7OCAW3GO2luxhMX/mu2UPE0WVUArTwegAhj3f0CxREW+9X5tw8L7fPkY
	0UtQlLxXLLXug72Lqp60xpPedWwrXNtAa724zVHLUQJL3qLt4kSkHX7GxQGRvlyEO8C3rpfZIae
	r5m8yNEnRfexyuDeL9FMlftAyTkIwq4PfaFLWYg3Sp9DTB0mH5yKaLTTryWKkS0aIfycP2u197V
	BO8tvjaqJv3RZb2VsoXHau5lFvQbh2ZE6oCcTJLRdGpIvUkaRT6K2YnfhoCPbq9iDFQINNX80BW
	atys8Etn3u4adtR3geBe2rxOHnBqGJYkod1B92C8FY/3v290D5d12NkgojFe9srPGKNmoBTxiaN
	9cHZlqfkUmPRw3+vBYi6Tfyisfs4RM/H/f6W/dch+w4j+w=
X-Received: by 2002:a05:600c:4fc1:b0:49d:2536:402e with SMTP id 5b1f17b1804b1-4a19a9cf1e6mr31519075e9.30.1791743487757;
        Sun, 11 Oct 2026 11:31:27 -0700 (PDT)
Received: from localhost.localdomain (87-205-122-125.dynamic.inetia.pl. [87.205.122.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db98c2800sm15253614f8f.26.2026.10.11.11.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 11:31:27 -0700 (PDT)
From: Kyrylo Biryuk <illofspeed@gmail.com>
To: linux-ide@vger.kernel.org
Cc: dlemoal@kernel.org,
	cassel@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] ata: libahci: re-enable FBS after error handling on a port multiplier
Date: Sun, 11 Oct 2026 20:31:26 +0200
Message-ID: <20261011183126.389-1-illofspeed@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261011180236.735-1-illofspeed@gmail.com>
References: <20261011180236.735-1-illofspeed@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An automated review (Sashiko) of this patch pointed out that
ahci_enable_fbs() writes PxFBS.EN after hpriv->stop_engine(), which
clears PxCMD.ST but leaves PxCMD.FRE set, and asked whether that could
upset strict controllers.

For the record: this patch only adds a third caller of the existing
helper. ahci_pmp_attach() (every boot with a port multiplier, after
ahci_start_port() has enabled FIS reception) and ahci_do_softreset()
(after a successful fan-out softreset) already call ahci_enable_fbs()
with the port in the same state, so the patch does not change when or
how PxFBS.EN is written. If the helper should also stop FIS reception
around the write, that would be a separate change to ahci_enable_fbs()
and ahci_disable_fbs(); I am happy to look into it if the maintainers
think it is worth doing.

Tested on the 88SE9235 + 88SM9705 setup from the commit message: the
hot-plug now ends with "re-enabling FBS after error handling" and
"FBS is enabled", and parallel reads behind the multiplier scale again.

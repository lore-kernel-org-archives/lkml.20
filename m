Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702A0364EB1
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789357523; cv=none; b=uGDKsiNRMjVEMP5oDTBymI2m5yzKoHVwc1Ue4EyevtlpYJbWexihgZewx2WgP5EyPA7Ot5uB/v2x0/pRiJwQJKRbk67hwwlJTfYS3gsoO70BKc12xHSMYq55v/NXDUshJjcB0obx9XEL9EVE54nVmVbIOfWyCYU3en+mr3ZN5UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789357523; c=relaxed/simple;
	bh=nEQvniAYjY06dN8L1spstzHJeZhroLN3mj4n6Tpd8Ks=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rwAUI6JTMEQRVCFpCvAl/pCk9gpgjEH/BDpmXbLtrpdnFksXr7jpGdNps9tBvCi5YwGwK/wDqqPc0zMC+srZuhNn7Jm8RIOkLNGMHj+c9fAnE/Oe6Frsx+WV4nDsL57Zn56pdbNzpVf8oe6t9q7DKhNqFP82EuLUYlZ1gkHHZYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZvPQeMVE; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZvPQeMVE"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93a0f3f7031so51981885a.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789357519; x=1789962319; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Hx4IFiiUO6XLO/s3kNZnWsmhsivyvUzhEVkE3MQOHQ0=;
        b=ZvPQeMVE8DjMEOHmkhr9iHf4i78JMcq/FTl0nn/tWK8ZtQMWzCskRffu44RTt+Lfyk
         ktZQ0EGiAuAadgkoK7mBPRn1PxklCksCyuuH3fboyKDGHdOrU5Q/RJhPiVIKOnRDZ+OY
         nqnpNh35W76+PM+O/+2XcPkCjjS28IMaiOVQG2imlAoQ6Rj6jqvAHesGJyGNHvQNPiJJ
         8b8OqpDg2iEt6l7q0Bg7HfXIU5+hyqnZyL/RKIKaKHAJN7Vq07154DhgWFQaAWQUwSkf
         adSJDykU8UeQthHdZs7vxIwZLyAA4fJrL2Yit8bfbbefhsA2xErkVetz0nVAtkvOm+Xk
         ZOsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789357519; x=1789962319;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hx4IFiiUO6XLO/s3kNZnWsmhsivyvUzhEVkE3MQOHQ0=;
        b=S0Bb2TULFIw8YaeTj6TFsAnUvfbpeFeWSzZ7gUaTjrWdLkLE5gcMEvxxuDLClDxpGB
         /pJgG5SGkXxl8ugx2vl3REWulQhZoTynP234GiRi47WlO9XcmR5Wt8u/t5IaVGyB3BaE
         5MkNmLabU59TSsfFgzVFPNwib/IdX7AN93Fq26rqJCGKRh1Zx8krd2zvdL2HcKFiLY2Q
         qFn92Srpu93fxqr4WDBJ0RrKkQjqKBv2yEy9bYP2hsXH6YkHEGtfawWIcExJlE6FVwGM
         QlONtgO0YlCkzXGu9/WWa4gIf19f3BH1p4+woGJcS5UaK4k1YOkmPusoBgKhATeMRn4c
         NsnA==
X-Forwarded-Encrypted: i=1; AKwUvBy3g3coZutDydFN4WQw+3B4KosuEUPPkQ+IbnxqjINglGxixHoLxWgWZaoTU2hrWb6Iwy+nnnc0yALFixU=@vger.kernel.org
X-Gm-Message-State: AFuF++n4QKmGRn2BO5ykESnWcVtFeCL91Sty+cC+jzFY9G9/zRAsZXWr
	A+v56Royh1LCNFRrYL2kxo6eYb6I5O9/y+ZXQUH/0bZOVAWlQWdLBUru
X-Gm-Gg: AYBFou1khtEN7i+UueOvvyeyD8oHF9qhlBCr/cqIOmC6DFwdYmfCu9X/b65fY+Vcez8
	4ULGbiT7vYWMFvMBSbh57wjHqacUbpebNA9miB074Gr2L4hAy9D4CJgRhfOO8WyFeM5wDkTHbhQ
	k2FIhg6m8T/m2neOVyeC15lxSroXy6p4zlhoh1uX4bRTTf+mG+xaOQ/8K5udlDmHDwIiYTM3gKv
	86Rwt4DKyKppT65u39GPGEiJn0W18cRhX3RbzGYSApgP/YTMyLcSZ+fQBVh+dG9dEe3wO1Mtl1z
	jV/RYajTbnSzMi8QaLkzioX3OY9WzwwiN54cH768q4HG/zrwg3qBnExD2+bJE8nJWBeXO0lkkVF
	3XjGZgj3iBCLpG6sSXmU2wxqhHclf4aWN5m5Xax8DcQ4v0/nGhgLn7g0tILSmsTAAeGpHnr8XN6
	ukgHbzgyU98PtJUk4bIZVlAd1surj6to51GPZhaJIqYyE2TOYsk4suNT5hi2TX0lBG6mUa5nq0E
	r8Hhvg6OfqJUe7vVYRpgQUGRHVb
X-Received: by 2002:a05:620a:31a0:b0:939:2d77:d6a8 with SMTP id af79cd13be357-93a299eaab1mr121544585a.34.1789357519511;
        Sun, 13 Sep 2026 20:45:19 -0700 (PDT)
Received: from i4-l-hqh5357-03.ad.psu.edu ([130.203.139.71])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93a26921baesm104710585a.24.2026.09.13.20.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:45:19 -0700 (PDT)
From: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Shuangpeng Bai <shuangpeng.kernel@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] iio: adc: ti-ads112c14: add continuous mode support
Date: Sun, 13 Sep 2026 23:44:23 -0400
Message-ID: <20260914034428.2165528-1-shuangpeng.kernel@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901025147.583b3f61@jic23-huawei>
References: <20260901025147.583b3f61@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jonathan,

I took another look at current_trigger_store() following your comment
about the possible TOCTOU there. There may also be a trigger lifetime
issue in the attach path.

I checked mainline commit
fd73f4a6659897191fa0d40695fe370925dd3780 (Linux 7.3-rc3).

The reference acquired by current_trigger_store() becomes the reference
held by indio_dev->trig, while iio_trigger_attach_poll_func() does not
take an additional device reference to the trigger.

For example, hi8435 uses INDIO_EVENT_TRIGGERED and allows changing its
trigger, so these stores reach attach/detach. Assume the consumer stays
registered, initially has no trigger, and T is a sysfs trigger with no
other users. No one writes trigger_now.

With two independently opened current_trigger files, the stores can run
concurrently because kernfs only serializes each open file:

  A: select T via current_trigger_store()
       acquire reference; indio_dev->trig = T
       iio_trigger_attach_poll_func(T, pollfunc_event)
         allocate pf->irq; request_threaded_irq() succeeds and returns
         <preempt before reading trig->ops>

  B: remove T via iio-trig-sysfs's remove_trigger
       iio_trigger_unregister(T)
       irq_work_sync(&t->work)
       iio_trigger_free(T)
     clear current_trigger with "\n"
       oldtrig = T; indio_dev->trig = NULL
       iio_trigger_detach_poll_func(T, pollfunc_event)
       iio_trigger_put(T) -> iio_trig_release() -> kfree(T)

  A: resume in iio_trigger_attach_poll_func()
       if (trig->ops && trig->ops->set_trigger_state && notinuse)
           ^ possible UAF

The consumer reference keeps T alive after removal, but B's clearing
store can drop the last reference while A is still in attach.

At the pause point the IRQ is installed, so B can detach it. T->ops is
NULL, and free_irq() does not wait for the enclosing attach call.

I have only checked this by source review and do not have a reproducer
or KASAN trace.

Does this race look possible to you?

Best,
Shuangpeng

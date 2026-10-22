Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792682215;
	b=bOQe1eyaTv9+2RWaPGjlwNgFG+IIb2X5G7wBIMHVBc2ZxYQNnwe7LAK81ulipqX7tz+T
	 1QjzLWrmmCtGGX9xfvWBWuk3eTGOXqajXhUh+AX+3rsvMd8NbEbXejTRBGtmlzMVKggJF
	 nTKNDmzSHBlh419tNbuM2sJc1Ch/8Dy5q/++e2NsKy/FyOJ309HireDFauwIAQ4NvwWjW
	 IU4eC2nypGeYSNYhrvIDuU6nEDO076oNcsA/nrl63kUn4qh1hbNGJmb3FKz6a9cPaoygV
	 8jXcTybTjz3pjoxzhjW8/ygWBBIwoy2PYlGdzh7ZycuIXrWaqF8G9kn+wmwo35d3ihQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792682215;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=dOGTVagpmg3SkovNg8gY9NJcdR0snicKiJ3IvwwYIZg=;
	b=vX8Hb9Hvdat0+mZUnaZgpxuX5BjDxHRQvyOBysH8Ddxj0p8oPK/UeFtmV4oe8/h+qCOv
	 fg2Qhs5UfRvsJ0uOMuY4oNtDKe7+ulAXbBmYceXrKQZeX92+5crWvooe6or8KmLtLTlvk
	 yGLX0M3GdKDTZDLHuV9YRRBfOJCx82A0PJ5QvYKRdV1c6x3gQpuhTJoObXd0adRfgvwPb
	 fkdTvjOEw26LEKB/oGkhI2/KXtjMeci1PHrTycruOrwKRr1ThTbnZXLGWTCR67X10TJrZ
	 9Y9jV5gR0nFANnNcMDBDw9TKRNsVH9VTIEVA8X4egiOB/lGTqIm1TVapJUtuUBD9CkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gmBMmMgI;
	arc=none smtp.remote-ip=209.85.160.44
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B84606B383
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:16:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77B84606B383
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gmBMmMgI
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-4932b13c4ccso1007919fac.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792682213; x=1793287013; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dOGTVagpmg3SkovNg8gY9NJcdR0snicKiJ3IvwwYIZg=;
        b=gmBMmMgIv4ChXTLyXqT937GGjYbZfczKHrXmdNzdGzgWcCdX672S2Av+RP7IvBbpoW
         P+oSJBLvyK7sqC/Wj4736VDoy4ySLsvfgnQ5Oo4la5n5Ox/E9GPWxTYc9TfKoBVg/AnS
         e06cNuJW9GME9Cnb53Imly4VcE9Huc+iC1a0MkyGZSJli0EzifEs1b0yDCDcc1UydBbr
         6QEsdEFCVS55JVEDjgO/ZH0M7TYCOw5ZDAQuvwzbKkF4ExYHuJ6ee30qmP/0Vn0eT1mT
         3xHAQio+la6q2KCYUDiwb4JwHrlgbgtZN1DEXXafy5A47BcPQM8AHr76vIdtX+CpKS/f
         z+Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792682213; x=1793287013;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dOGTVagpmg3SkovNg8gY9NJcdR0snicKiJ3IvwwYIZg=;
        b=K2GrMgWDYL+9kPm9nu8enc5c+0yxAUsxcrj4s3ZcORTgGUhTU6awrQ0s9DeJJhhNI/
         4r25TE2U1NzeyHmajYEPL7IfqLTzGtWZDcI/f77xXKb3K2iPCkrgkSeYccIfb4I6FMPD
         p78TDCOHwZormfUWEkNbufNpQ1Tx81sWec3vS3FMYbOLW2ppeVPlKYXpW7fXq5Iei5EG
         xfAICEk8UGVbRAFHCktxPu1AijKiJDqXoNTwiSHamufncnJPtD08FguUwx0RE+w1JMcH
         WxXMqiwDspUjreV11IDQGtuq7RpoXdd80EZZGotzQyFlWLP1+M7fxtAW+vYo9UZCycyx
         PevA==
X-Forwarded-Encrypted: i=1; AKwUvBz5m/plhjAKWSMvvo/7NF1HXeJMLbnR1EJyWWxXtjnOtaje5E5CStEJ4I6fNegPowcJemHV5BV4r7lAvBw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLcpjYpN8OnGtx3Y55VPyVB5h1umVI9aSc6XuscSDq/NepbWpF9
	aCuJltlHC1I0hdD2NNu84Ayp7nVvGIZnWh/SAL/j5iytx1GpE7JzaD7l
X-Gm-Gg: AYBFou06NLfXEXqX5mzEoumwxFS68L4x87xU5v13YQFBm354cqUNhOjWyMbmGMlb3ny
	Enf6P8RRttVh19ZrHdQv52PTcPvcCOOTE2kLsfr8esfxZIQAtPOmDloMuaw4pLu1BI8HC8WPYqW
	hZdExcB/B+wIfHMF6zZxvokMh3IrTOacu3hz/+gRuU+d1xmwiGC3ZJP//aIASiXU7qCR5/rHB6e
	oqPPMuwCvkeND4llKDWZAOMzwWkalbmY4DfOhvDu/8A9yx6JA4h2Al76oNQPdEx/q+MouoSGokm
	oF/GaWwpkV4e+vt+L8SEFejSE7/xaY0WioEPehnEyyxuVOYq5RTu9SHY86B97Hv2PM2dafm7a7d
	5tip4tsXuvVLLNxjDg7wGLbssnTjYm3VkcchSKvxnGgD2lHRzQsLSM3F7+GnHOdfRRPLXX+6NEY
	hiN4j9Pwk5R47qYARWslcH12ahgzd+6XHhv/uAOM3lFPusK1iORYDvCgPx+0e6oz/vH7t3X+AnE
	+OFfLmHnbampHXsifxjj3ewFV1G6MK+0U9XoLg1nVFl39VHeDHtctHKnuKzpWUopXbVB1izIMlt
	QBCA8AhWyCbXg2TsIRUKbNYwRxCJprupk7ymC72Cq/pXWCqwgUXhprO6Rhpf2KZRAgKn3WG0k+B
	z7Zs9IE1F3bLpefBmnjZreqAqM1egntrYaEasllLQdnH+3g6gTBdCniwTV3B8vox5pN8qdfPzFe
	FrqQgf
X-Received: by 2002:a05:6871:78c:b0:447:1ceb:7cc6 with SMTP id 586e51a60fabf-4a7dc1b02bemr3328201fac.15.1792682213322;
        Thu, 22 Oct 2026 08:16:53 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a7d5eb8fc0sm4685631fac.1.2026.10.22.08.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 08:16:49 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 22 Oct 2026 09:16:42 -0600
Subject: [PATCH net v5 2/5] ptp: unwind partially completed virtual clock
 creation
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
Message-Id: <20261022-ptp-vclock-sampling-v5-2-06ceace17bac@gmail.com>
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

n_vclocks_store() publishes the new clock count only after every child
has been registered. If a later registration fails, it returns without
unregistering the children already created by that request. Those clocks
are left out of n_vclocks, and a subsequent request can overwrite their
index entries without removing them.

Unregister the newly created children in reverse order and clear their
index entries on failure. Leave the previously installed clocks and
their count unchanged. The n_vclocks mutex serializes this rollback with
other sysfs changes, and parent removal drains the store before walking
the children.

This was found by code inspection while adding initial PHC sample error
handling to virtual clock registration.

Fixes: 73f37068d540 ("ptp: support ptp physical/virtual clocks conversion")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/ptp/ptp_sysfs.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/ptp/ptp_sysfs.c b/drivers/ptp/ptp_sysfs.c
index 53388b123198..fabc1c9b1752 100644
--- a/drivers/ptp/ptp_sysfs.c
+++ b/drivers/ptp/ptp_sysfs.c
@@ -225,7 +225,7 @@ static ssize_t n_vclocks_store(struct device *dev,
 		for (i = 0; i < num - ptp->n_vclocks; i++) {
 			vclock = ptp_vclock_register(ptp);
 			if (!vclock)
-				goto out;
+				goto err_register;
 
 			*(ptp->vclock_index + ptp->n_vclocks + i) =
 				vclock->clock->index;
@@ -257,6 +257,12 @@ static ssize_t n_vclocks_store(struct device *dev,
 	mutex_unlock(&ptp->n_vclocks_mux);
 
 	return count;
+err_register:
+	num = i;
+	if (num)
+		device_for_each_child_reverse(dev, &num, unregister_vclock);
+	for (num = 0; num < i; num++)
+		ptp->vclock_index[ptp->n_vclocks + num] = -1;
 out:
 	mutex_unlock(&ptp->n_vclocks_mux);
 	return err;

-- 
2.53.0


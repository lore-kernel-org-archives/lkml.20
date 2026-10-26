Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793038298;
	b=uu7esFC7Xx4QNGSDoT/rrvluBAlxFAkgqZM88jRjcnBPdG/ldAqfQO1IZvbYQelniKxy
	 0zewT3LRw1UHiattjg3zyOcooE9AKRebaU/9UW6SYI5nAEoeYGGmwKw530kUt1VjW2skf
	 DmSdx9q+9p1xcfBRiAqt7jUZFdxA8SG2/2SJz5JFmPHZ1TA9Hg+ujlM1AEcKSbuzEAo6n
	 G5Ybti79Xt1if5pqjiUn0+GokCNpy9FxMZKd8dN376s8h2Aj3rTsDGrZ7FDGVRZyV9AJA
	 Evv/l4Zv2Sa8dnIjhMgYZEbc+27xeAlfT7/Ghq1dXsuL1MqkGDVhlnkwof9bzvcLZAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793038298;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=dOGTVagpmg3SkovNg8gY9NJcdR0snicKiJ3IvwwYIZg=;
	b=heX8tpBYnoQLDYeyMTMX/RRsaAiCq/y2spD3WdyT85W1e6AxAHgsbK3HxOGRfaXJ7agT
	 3IqNQ8WG8qBIH/NZYVsDGR6mzPbPjVZVP0hwBacvz7sXU+pDi2BNpe8iOZRQx28YLwYll
	 QyFGG23zEZSVCuqZqqRC16pvsginsyiMZuljOpfJJGv2+IRfJ+7ZLCQ9vW/0KGv1FMLTx
	 q78T3sl92hiK5JW/Z0Ezdoi9AFO1toZ/vPnu8ZnF4GnNDIiSkIN9AApPOweTJHbEXv0u5
	 x4D3tt029E5DaMXV7ayojJwQ/RbbBqANGzElbDOC+N2su1mjf385Bkm8sXqVd0QdlgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cmObIIJ1;
	arc=none smtp.remote-ip=209.85.167.178
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F121606A320
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:11:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F121606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cmObIIJ1
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-55e0090c580so387129b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793038296; x=1793643096; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dOGTVagpmg3SkovNg8gY9NJcdR0snicKiJ3IvwwYIZg=;
        b=cmObIIJ1y5lLS+rOt1FJahAjY3FkSDXqyLEj08rkBVk/02Lg2RpA+LIB9s5doTjHP7
         sQ0accUQzwFFmiVjen6O89mfmJoBKgdr5jOUzqUS37vQBsT2j+HL9mRSX4Uean7WWMEm
         8oeNd6pUtZOdcnPMGxqIFfIesEX2xSIxnA96WxIIaS0Mw5+E+57V1N/aE/m+9bvkRK5/
         Webx4FIxOSHvthzyLx3P4Qt50w1GC8oiRoIW4U0ntfaBffBDret6RFfQa0wiacSy40Th
         X6jAScYzXyjLD0KYGrmympQ2WFiyw9E7vGI6ZnFhuPp2NfJe58rkhi9eSYOyspkhOOUz
         9rQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793038296; x=1793643096;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dOGTVagpmg3SkovNg8gY9NJcdR0snicKiJ3IvwwYIZg=;
        b=2OWCBrd2sywSWrmzuZCb0mmbWVZ1ApmAhI5mEVqnj+CBLuQ45oFYxr7jylfEv0uaGu
         plMwju4L72OR6hb6eltEPFmggmxgtB7hfCO408Sj16mSjvdlys3fIRjVWohO5+xliF56
         ek/9/wjs30wrnmtgmqOHP2KQdY2sdwq0dgRTE137hxqTG59Fcziv/XwTL+/VPTg5OAtK
         IVmOOApf3AEq1v3NcEavTGzGbcXD1fCMQmRBFYy1JFiLKIXRbqhYZUSTIV4Pypk+9TOC
         6h5hjxEIGTnf3ocr9S9bqSmXppto+GBSv2EYWK6e6402Nbw1NqD3OGrGnS98T+mg+FZ5
         6Z6Q==
X-Forwarded-Encrypted: i=1; AKwUvBxMxugx2dj+K48nS494GXTlHk+Oq0ziqoc9rqmq7brEBoW1l1zQniisHRKXVFt/SP84Arsq50vQmgbt62g=@vger.kernel.org
X-Gm-Message-State: AFq9FYLfvlvtw2WT6ZMVZo+LCvYNfnvXbL0JOPvMwLFHJpFFsWPGUJ1Z
	gxUdJ2ODm7Gnr/3G/54jsPgXQWy/YIXE7E24R2lwESL5XGWXmMcRAuCO
X-Gm-Gg: AYBFou3GTXW9/B4TTtn7MrrGpLZ7i4vzlcY2UizY1E3S252cWoxlB8hFLWFyGPtmhe8
	fjrkZL4D+HG0jBBtDD8/eBHqy1JLtDRu4BW8sYbCClWE+ZybHUiuv1+PZme2TfMu4ZWYzpAnF0O
	v1MAAZfeuX9KtrdY72RHLIG/oyESOLbH8cA45OEjcKLlnrM/dMR9C9Wh00TSkNIld3nrEpRpUSh
	M28B+84OVv1s7+pM+XkOO8S8OsTIU0jQ7cKpWfjI1WPsVy7s5ukygOZ3+dlUeRrJtM19CHFGfkY
	GhokxYjHNOk+811eOKLez6qDSN2Rp5N7FBjt4iKArKBtzxy/h+/g9NJMNuE4iAHPKPWg1dbcqTv
	W7VdD06NanA9TdA+e49NudtLaBErUGSixX+K9AC7qUa9hsY42Wda1QLOL/bzyEc2Eb6OcI64hzS
	dxJrX8oJ4Qh2El1pLpRs/EdV5POwwfxIjPuvvKRRKTiSCBDczuzQ27tdEmdW6tftNw+K0n7r7MA
	4PN5ESn1+l+ahKgO1nOq6aDBeb8kWSTOsTsvyB2OsBlCX/x2e3JpyAi2eqdUbZ60HHuvNZlcX/U
	Cy5+Puer/FHSnnYA0eV04sy/yUC+RDPIcCt0qTdaUeaVXHIiJ0QKU7HRRJVoP8NoY7gSLxuYKIW
	p4W0mXpDfpLr9ZQ83c+Gjo5oy3YL2fZaozCQ73bhtoJ1M39n9lIhVXLeIsUKHRqe3ucVz9fiFzN
	iX4dkeyVQprYhRb6LpgtdGQElh5OjmYCt51XbdKt0S3SkVw1x7QLA=
X-Received: by 2002:a05:6808:19a5:b0:4d6:90f3:74b1 with SMTP id 5614622812f47-55c003aceacmr5817075b6e.49.1793038296382;
        Mon, 26 Oct 2026 11:11:36 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c043115bcsm5795251b6e.15.2026.10.26.11.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:11:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 26 Oct 2026 12:11:28 -0600
Subject: [PATCH net v6 2/5] ptp: unwind partially completed virtual clock
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
Message-Id: <20261026-ptp-vclock-sampling-v6-2-e705612541f1@gmail.com>
References: <20261026-ptp-vclock-sampling-v6-0-e705612541f1@gmail.com>
In-Reply-To: <20261026-ptp-vclock-sampling-v6-0-e705612541f1@gmail.com>
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


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792695176;
	b=g0j70VLomh5gJKiR2nKwGG0kWtKFVtmhOmVFtTWJV2SzGShypK8T6khxmIYsBZ7mYSmE
	 GljCtFRhq2qdO7F+7gtNU3NvSf0c6FBZvoSfE45PFdmlAdL5/jSYRvyBrAjopGSK68EGD
	 KWhGTf8SKmAChyrArBh8vfNmXrEvHSYlOLUMCetKH9EiSGLRHxJVwSZYsJJJy4InIkbEy
	 upk5nuEwXcbHz88zSzRpfLx9ANOl6npNt+IM+Sc2tzgTHOzbKTxKUW8qDogEQz+NmEepD
	 Uk2tISQXHpkCrNS4hXwOn/nmZOA6FVowXKt1kFoxxbSmgB0XnBuMhVY7n+7s5Y908+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792695176;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=iUu/R+fBQNIMW0hUqQNheGWUYLG4zuBOi30rdtyLED0=;
	b=UELuTDqqDfva3Mkr18KCCo/g8EZO6eD4h1VDDOi/x9BWqRwjjJfeXekp2xeThUTQCoZS
	 VnOCxryfpyCVHOfGj7tFIBVRJHn8URc3xxMF+l1qlaH4MiREPLm23LWz5P6BWpPPfjIhL
	 NtY118vkLj8n/boUrmLR4vwAOSb4saskgKdElafUWHnPEfPBg+iv1zIAlR0JX48rFV7h/
	 mZRVcLVMsayBbwK61Vopks1kQk+9QY7pGmdbtjQZUpl7SB3dQTZVx5fee2nKvu1tYYXCE
	 smMbZzWgUadUzCudIqG84qZeaVCpMsWQGuzjop1F99kTqXA6L3FkWyzDT0VwXZN7Flw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=P9v8HJvl;
	arc=none smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4952560A2622
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:52:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4952560A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=P9v8HJvl
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-70b875f6f13so94694eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792695174; x=1793299974; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iUu/R+fBQNIMW0hUqQNheGWUYLG4zuBOi30rdtyLED0=;
        b=P9v8HJvlMMQn/I0jrZo9LW4QekCfzsbPcKDzCG5Gzku+A4Z0mQP+5wl2UdUnmSaSEz
         oK0TZgnRqOE8h3/SQL1R8vbvgzqU9bmZ+lOJZyK+r33IJIhVFSgH7qCeXIAeHRcDCUy0
         rgqVYwjMOPf3bx2XCmkFsvAPjdeGhsRk904q/4wv2Wcjle5tBOda1jvYlimhAf6kwY6h
         amrrKPs5g3BsZiFR0qA7NcQ0ERBn2L0gLhHk3TTTR1XdJVhA9kRprO7gmGbsnSAEkYc8
         8wzHiU0Ura/HV1Ipn4TO27c0qvzjUSb4v4PLPmtoKHftkogeL718sDeBg7PxYHDIwvyg
         baww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792695174; x=1793299974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iUu/R+fBQNIMW0hUqQNheGWUYLG4zuBOi30rdtyLED0=;
        b=QL5uotwiuz2C6iA0DqF8+rJGpk84ncZ79uxT9pMljZZcvYCGSAmDVNRqIv/XISyCqc
         7yZcyekZ+hIA0W7S8Q1rwCwFj1Jf6/amr1zJ/1her4w6rh+ruslMrGeOBzLUG5O4+FRk
         oGmhmZGq/MfV/56SeJx7VHKCfe2OhkHYh2ij2IQMFAJp4QEuMl3061tDxnV1MKVoLR56
         DKbqdmpMHPgZK0sp3ot06238hiQ+T+ShL0eI+SxzLotHUFGD141t8i9GLa1FOMT+H4kp
         sECQNcEjql1o+lO7uTCw2YmDU1mEI7oXw0HugZLpes3vTOq3Q8JdlYwlN+UQepLSsxGO
         Yv3g==
X-Forwarded-Encrypted: i=1; AKwUvBzHfhWTHAM7Wrh/XWrs1R5beICKv240BdV06e2aJ/FY2MHGQh/18hxWZEwk0YadYfH/erSaJt3eYgB6RBc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKC2D1YzOnTNiNgsT+BP/7ZIqcBymGLILSFoPVSlGb26fSscOOR
	/YckKkmm+QXOI3D+YF80jTQHXmvxKJKtqgrlbd4PQPoS3htOqtAekStQ
X-Gm-Gg: AYBFou1+uaGA87bESiCM8aUFoQfpL9hMQBla76ledeLOE6haOD3xvir0x8V9MQbGPxX
	eX77DTqFOxfzJH2MA66cpsZqhyDDF4m1AkT1RhxzHQ1GuxlwzMabfkxLau2LaFaAPDVl8iOvSWV
	Vc+t+wpxle8dVElOoGF0rxgMW8GyECGW4wgs91yGeQj/nOq6ybax1ArhgFvsSShhJP1sq8pxn6S
	TxopwqtL6mrJI9liRBFpcOll31zWX3pX4itmABspBzgoXafE71BKovystLB9nReA9JyeX96K632
	P91yNcKb9V1QCFcHTW5NuXRFtQO9eJ0kF3yNVeGgY5LY0Y9Cf5ZAgNJsKX98Bc6TNxZ1SNM+O/U
	fVRYoPnj5dxcukOlkvdUoevLSOfbgQKQnvpdsfZIqmHM+Nh4aIvAFKRztAdWekSfMEdsnlSIRKN
	kHu73HHqjjZ86P/CQvsKvAIzrdKljDhC0H7TpFbmx2mavGoawEHXDdnw4QJxPxTs4EFJrabgyja
	kjTAe25ztoYnE6G/GCI2gu4vrZDI+/BWJdrrrqyRFe1j43GhZvOTsfywSZHrDiCJ05yg8MMVyWu
	062RUN/h7wAexsh0if7cSStU2JvblLt7Y1I58zUcH55hmDe0XG3cdQi04QCLPRZ7DkNt4bqS/m3
	D6D3174wxu1+GzF4lqBKBRujV+lTkKT953wbbQB6IDDL/KppnhJgfkfIaiiD40Ibgg55zJEQWxx
	Xh0v4=
X-Received: by 2002:a05:6820:5601:b0:704:4ad:9c5e with SMTP id 006d021491bc7-70b88a1cf2dmr160306eaf.26.1792695174166;
        Thu, 22 Oct 2026 11:52:54 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84f7703d288sm536083a34.4.2026.10.22.11.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 11:52:53 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 22 Oct 2026 12:52:51 -0600
Subject: [PATCH v2 4/4] dmaengine: dw: synchronize completion callbacks
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
Message-Id: <20261022-submit-dw-dma-synchronize-v1-v2-4-5244e94dca8c@gmail.com>
References: <20261022-submit-dw-dma-synchronize-v1-v2-0-5244e94dca8c@gmail.com>
In-Reply-To: <20261022-submit-dw-dma-synchronize-v1-v2-0-5244e94dca8c@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: Serge Semin <fancer.lancer@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 dmaengine@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2

The controller tasklet can remove a descriptor from active_list and
invoke its callback outside the channel lock. Terminating the channel
does not wait for that callback, and there is no device_synchronize
hook. A client can therefore reuse callback state or release its buffers
after dmaengine_synchronize() while an old callback still uses them.

Disable and re-enable the controller tasklet from device_synchronize,
outside the channel lock. Disabling waits for an executing tasklet,
including descriptors it already removed from the channel lists. After
termination, a later tasklet run cannot acquire another descriptor from
the terminated channel. Clients must continue to exclude new submissions
on that channel until synchronization finishes.

The tasklet is shared, so other channels may schedule it while this wait
is in progress. Preserve those pending runs: tasklet_kill() temporarily
owns the scheduling bit and can consume a concurrent scheduling request,
leaving controller interrupts masked. The disable/enable pair leaves the
scheduling bit and pending tasklet queue intact. Other channels' hardware
transfers continue, though their callbacks may be briefly deferred.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/sashiko-outbox-180707@kernel.org
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw/core.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index 1df028970c4a..9e5e526f7672 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -942,6 +942,19 @@ static int dwc_terminate_all(struct dma_chan *chan)
 	return 0;
 }
 
+static void dwc_synchronize(struct dma_chan *chan)
+{
+	struct dw_dma *dw = to_dw_dma(chan->device);
+
+	/*
+	 * Termination removes the channel's descriptors from the lists, but a
+	 * running tasklet may still own a completed descriptor and its callback.
+	 * Wait for that run without losing schedules from the other channels.
+	 */
+	tasklet_disable(&dw->tasklet);
+	tasklet_enable(&dw->tasklet);
+}
+
 static struct dw_desc *dwc_find_desc(struct dw_dma_chan *dwc, dma_cookie_t c)
 {
 	struct dw_desc *desc;
@@ -1333,6 +1346,7 @@ int do_dma_probe(struct dw_dma_chip *chip)
 	dw->dma.device_pause = dwc_pause;
 	dw->dma.device_resume = dwc_resume;
 	dw->dma.device_terminate_all = dwc_terminate_all;
+	dw->dma.device_synchronize = dwc_synchronize;
 
 	dw->dma.device_tx_status = dwc_tx_status;
 	dw->dma.device_issue_pending = dwc_issue_pending;

-- 
2.53.0


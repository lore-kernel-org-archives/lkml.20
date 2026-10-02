Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B2033E346
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 01:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790905634; cv=none; b=HhnKIjTModZ2wys1Tacsr8vsyvVv7csGj+F5FMqmQxNwpbrBwqZGDCRFhLjNyTHlS58SQW5OSnabO1GfE0ZRCNa0+YxRQ6EC3vvLrjS+p0kZmTR2fvSbVBCvRjylcgt9OW6zl7GXGq6QTvrtd1UUVvk9T7b9SL/BtZkjPpaDGec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790905634; c=relaxed/simple;
	bh=Si+F8QwszeOIn9X/7uuoUtNeu6jhOSRpc0dSuUMJZi0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m882mA3becolRxVvdA4RISeHEjb2VScEbzSZUvHkRvCFY94Ak2MDoEiuSMoQvKsBCCVGyisvYIPyb7CtDRlXV5dFxEKhPHuYYsf5WMLjXSMzl5f6kWLZfjkp8KqxcxOP0q8D2HSPvfsHC9Q4Jqv7403gziO22uGe58rrkV2LArM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rMuc1mJW; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rMuc1mJW"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747ed9866so50155715ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 18:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790905633; x=1791510433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5knTdO8QKiMk4hOKzMIwvsIoTWuR8tgoTbzdeallV4I=;
        b=rMuc1mJWjnssnNP31zfm2Dz3fYcWmOHJjohEhaOZuZBd1WzyGtN4FUVvz7vnSgWFsr
         FQhdtKYu4urb2lnEqY4Kx/64oP2X7R6KKGzRKm1dkd3AkVjGeGNDKt8I67Cy3ZlTg6l5
         hocGUzG61/3VnPSv6a2SXOKaMPzXnKaaTo9RWGFsQDN7zKck1duRXXIIJaDWQTha1LQy
         hC7/MEbfF47qUOvqv4sQ0yWzgHBZtHVsjnswvdzeC5CbhR69FwkrT9S1YQ1jilcb0Ykn
         LUAFEmXuQ9dB6cJlrgmlf25M5Bn/wTZcsbh1KopXvYNjbNU2vVuyni5fOYhN4xuz4s+M
         n0jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790905633; x=1791510433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5knTdO8QKiMk4hOKzMIwvsIoTWuR8tgoTbzdeallV4I=;
        b=O2CtzSIc0JNOnNimz8l++j/Tf7EFmM3xOps+SGRoPHlO3aggf2YhhYYmhNlWdscaRN
         d/NubOVmOherH3qN/JSORX0GCVgh2CYA50jJpcDrqqrugxxY8+gRB1dOIMiRipRxJ9DT
         sHBdklE5rksu6AGDYNtdxmOtt3dwrZTPzP9aYnWTfcba0HZB90CSzoFWgBH/3PxEGyjb
         Wha+jjvLgb9KHHj3/yyGuLoOkbGaGxo2he5TTPk3XQ+gFcFKOBNQyriN01gIP6elz416
         5o0WzdX7PkP178zE1A44HwBZxWP3XjWSW2QJ4XUKEKRNih6hWgYiEF9ZXgADIp1OGDz1
         uu3A==
X-Forwarded-Encrypted: i=1; AKwUvBzEDGa9VY9laEdRNEJX6FF6Y+YRG0kf56aODO9+dh2Z/wFPl/grs2Wzx+X9kNtnV+yXByrusV+hw3tIDoI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOzZpBxlZh/OYxsFzD6FWZ1OoFMRpSLfFeBQXHi+OC4hi0SPgu
	sV6tlQSVm+z3oY2dj9HILeEH79aPJ+TXwkJlOiPI3J14sQ5/KzjU26/L
X-Gm-Gg: AYBFou0hV9WvkzdtVmY7SrsAgcHJQSQENPnfVl+01wHYSfadGBTTS8P9N7XcrH53k1w
	rF9llHl/eSAfWQTzGkeFVGrA6ki9RCF5S84KsPbhCoHL8k2fyJjdiht1nN7dus/qi1geshxrZ4g
	OgnuBDf/p1cDEHdbGpXBsYaUuKgWAIpraEECpuUsh1Sz7TQZq54ELpvXAO12C6vIJMa7VC8meDD
	7Q5xEONrrSD6n+GPqliRh/ASPfg4l4F1r0Go99xDr+Rxf6uw+AG7Huh7eCSuTUS5nZFoHpjpx+a
	ZGsokP9olDv2Q0WrPF27mJC9a1xA3jekVWKku76hrT1I764CyeVnVuNkWkz0xI3kh2GjfmjluTW
	cbmXDU1EiIjG1apSG4MQvvbwQrBDL0rebWAw/ChOnlaAcyBb6JoMhuROZN2XSRGYb+zlctWoj4b
	gcciqL7y8PCyl4Fh9/rjP1+CtWUCuAxhIZWr5eL2pWPAg/01YCWba846jog718r6ii+W4A8fTWP
	PPdgGTCDBpvMFHomlmovQ==
X-Received: by 2002:a17:903:41c8:b0:2dd:9b53:f9ba with SMTP id d9443c01a7336-2e499f0d051mr11523125ad.1.1790905632439;
        Thu, 01 Oct 2026 18:47:12 -0700 (PDT)
Received: from u.. (61-222-64-201.hinet-ip.hinet.net. [61.222.64.201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f6ceaedsm2675645ad.49.2026.10.01.18.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 18:47:11 -0700 (PDT)
From: Tim JH Chen <tim770802@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	johannes@sipsolutions.net,
	loic.poulain@oss.qualcomm.com,
	ryazanov.s.a@gmail.com,
	chandrashekar.devegowda@intel.com,
	haijun.liu@mediatek.com,
	ricardo.martinez@linux.intel.com,
	linux-kernel@vger.kernel.org,
	tim.jh.chen@wnc.com.tw,
	Chih.Hung.Huang@wnc.com.tw,
	Tim JH Chen <tim770802@gmail.com>
Subject: [PATCH net v6 4/4] net: wwan: t7xx: complete NAPI on the not-started RX poll early return
Date: Fri,  2 Oct 2026 09:46:38 +0800
Message-ID: <20261002014638.47981-5-tim770802@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002014638.47981-1-tim770802@gmail.com>
References: <20261002014638.47981-1-tim770802@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

t7xx_dpmaif_napi_rx_poll() has an early return taken when the RX queue is
no longer started:

	if (!rxq->que_started) {
		atomic_set(&rxq->rx_processing, 0);
		pm_runtime_put_autosuspend(rxq->dpmaif_ctrl->dev);
		dev_err(..., "Work RXQ: %d has not been started\n", rxq->index);
		return work_done;
	}

work_done is 0 here, so the poll returns less than the budget without
calling napi_complete_done(). Per __napi_poll() (net/core/dev.c) a poll
that returns less than the budget is assumed to have completed the NAPI
itself, so the core does not reschedule it. NAPI_STATE_SCHED is therefore
left set and the NAPI is never polled again.

t7xx_dpmaif_rx_stop() clears que_started without completing the NAPI, on
the MD_STATE_EXCEPTION teardown path as well as on system suspend, so the
next poll takes this early return and strands NAPI_STATE_SCHED. A later
netdev close then hangs:

	t7xx_ccmni_close()
	  t7xx_ccmni_disable_napi()
	    napi_synchronize()	<- spins on NAPI_STATE_SCHED forever

napi_synchronize() runs with rtnl_lock held, so every subsequent rtnl
operation blocks and the network stack wedges (a hung task, not a soft
lockup).

Complete the NAPI on this early return so NAPI_STATE_SCHED is cleared and
napi_synchronize() can make progress. The sleep-lock retry branch just
below already calls napi_complete_done() before rescheduling, so only the
not-started branch needs the fix.

This is a pre-existing bug, independent of the TX/RX data path vs system
PM suspend race fixed earlier in this series. It was only reached once
that race stopped soft-locking the CPU before the teardown could run.

Fixes: d642b012df70 ("net: wwan: t7xx: Add data path interface")
Signed-off-by: Tim JH Chen <tim770802@gmail.com>
---
 drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c b/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c
index 0e1174ee611d..6272956fe053 100644
--- a/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c
+++ b/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c
@@ -848,6 +848,12 @@ int t7xx_dpmaif_napi_rx_poll(struct napi_struct *napi, const int budget)
 		atomic_set(&rxq->rx_processing, 0);
 		pm_runtime_put_autosuspend(rxq->dpmaif_ctrl->dev);
 		dev_err(rxq->dpmaif_ctrl->dev, "Work RXQ: %d has not been started\n", rxq->index);
+		/* Returning work_done < budget without completing the NAPI would
+		 * leave NAPI_STATE_SCHED set, hanging a later napi_synchronize()
+		 * in t7xx_ccmni_disable_napi() (which holds rtnl_lock). Complete
+		 * it here so the queue is cleanly unscheduled after rx_stop().
+		 */
+		napi_complete_done(napi, work_done);
 		return work_done;
 	}
 
-- 
2.43.0


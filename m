Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794100491;
	b=Pm88+f3pXBoWFUxE4IWNv/YHNNK1F2nfFJZvkScyOv3lnXAWGUHlhI/DLmSPTuABBbb6
	 Qrrs7TswgVk0JDMmvJoyw1Wl0qkCIqP86BzRWAINRF4PFK7NJf1mmU+/AbMCoN1JKZ+w9
	 B4dyLgITlGY/cnnlVzKg3Za8GH4Q6+4cAS20ukcJ1VgNG4+urnJ3g71RPiQDhDfVLpwW6
	 cj5cNoWWLrXzz1tzx1dLKqelj6MWelYIExQ2FqVq/mpz9oBU3h0QUZ1gncdD0lOM7LMl6
	 NFr4ZZH7ykBTHPbccsWMuZVMJBFb/nD9+luGpHlsqk4Ku6bzSD9utONGl5qVifwWLpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794100491;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=axwt+uxCb6RU8443n13TL3SuB1RoRoLly/8X+nI0FOg=;
	b=yrvak0gbBObD2rTszg+fYcBx5ttjEulkX4/9tDkn5S3O+MYouDbB8isPhQjoSg03dogp
	 Ro7OcuEMzNucmhtqyTx/Wz3LX7Y5xGQs5r7njDOSjiNwNYCo5sirLK0LCd9tiA5GiYuQQ
	 HHYwafbT9bEvhTxCRfp99YbdeNbov8rIc5jtDxoJBuMVXd//G7bBzz5l0aY6T1LN4tZNb
	 oJVtmWBresIw2lfJ4xjJg7mo/91FM9bt4+KzGPh7W5odzzByq7/HbF0JqKE1udfPhSjSR
	 q3GTM/yE2LLY2ssnE0SqoO3QhUSSD6qtGr8uNqiwvpYq/tkIMTBCYkJasyTRerdRTzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="0t+oH/FE";
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880A2606A326
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 01:14:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 880A2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0t+oH/FE
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-370a1bc464cso308867eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 17:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794100491; x=1794705291; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=axwt+uxCb6RU8443n13TL3SuB1RoRoLly/8X+nI0FOg=;
        b=0t+oH/FEVlwKVw82di9mc8QPdeFhVI1yhRjfU70Xq4qrzEnJhZAI5EETICWbhKTbf8
         bjQP3sWRLoBjXbVostnQNvM6VlQjNNgt8Hh3GGRU+ybYOtrySUDAB1kS1Xt4kT4sgyHl
         sOW1ye6GUx7t55/IHBN3+tJk0nCnbFlE6NvOn3YwZFLTyxPGJ7eghs8VvBIOi8fmtH4O
         5cNGsNurIVvNCDa/W0OlLk50w7ZZy2N7vvCQew+QdaaEFschyKzPZdLIShlG2gv2bcqg
         CkNMkAteLWWdAIOrcoRvZ11NpivIql5UkHJBQ03jelVs1cOrV19CdPfPtVTvp8F7WYEe
         fwBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794100491; x=1794705291;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=axwt+uxCb6RU8443n13TL3SuB1RoRoLly/8X+nI0FOg=;
        b=f+L5bTJJgb67Qke4C1OyJibHRJunoXA4DhRbZ57MRkzEPFT12wLU/4atuO0wj5GzWt
         XHQSPBCgJgAh/kI2AlEZdyavVq5+L4cH5v81NVYX5l0idjRVOa8JQwDf07OxnJvnc91r
         79aTmfcra0FmHO5ksMMNJKbKVAFQdc6x5SzbFSGMOv0jc7y/WbtZpnKbN4acFBhP+M9y
         REUFBW74VJKa/zT9RdSVZEpOm3JA32ZnOlWcuTbxJMQWpvy2LBjkre3MBbSgeMhtIBGK
         Qh4N8EJISkl9D+SNkkoP0epUT00s3OFBUNPBNIAcBpVEjMMejbfjKWiwfnU5D0VrPfXC
         LLEQ==
X-Forwarded-Encrypted: i=1; AKwUvBzjoLWNT/2Nc3582aEGTtu2ZooiR4B+ytoG9ov7K755sHO+Sd1R1i+i1tTaXn1i60UT5K7QIr/FT1/sqAA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9r9S/MIGX7X4CO0m9Deks7TqiEDsAU8X5qSexaJICohRs8A8WW
	oPCTj2EcNGSMSEIne/M9WD4gO/5T/YJRrJCrI/nwOx7CKlxJU3M8PG0t
X-Gm-Gg: AYBFou0x+1nVzdnH0jbjzy8uESmLojXzpZ0WEvQbMEsTP+KaE9sDc3/yYYe93WdE+cY
	nMt2IT+OzdGn/6Wyxicdpu4FhVkQtdi0mRwiWiHz4DqAtkY9UaCWEC75sSq4DCrDKAFasm78tTh
	SKxtMlu9mmqXMP9QtK5JZswEtocCicGJkQlS+Y39IuMZLCw7IDJiLsoyqJVFFiHlfy9BZQqzN5p
	8wdKyiLFOg5DowcTiyR8LLr/UxTnrDHfNIVFVqKDcnkHlD1jdg5psQStDICxiaWm/KQLDgBjGoa
	rUZc4NGzuQYxOqEDKgo6oqWBC4YyW4ln1/E9N1qTOF2qJvl/HNe5YtrUnksGJkDbR0e8LfytA4T
	wBi7T4ep+fwOKrjgCldkX2cB1RjuzOgDDKKO9NEwrRZGsnfYzC4KNELjAksZGgz3GC/rHYl0Ias
	NBji/ONolTEWTT0Bmlw4JKc4uNl8MrgbAB39loN+6Rxmq4s4bDKjONrSEROTA916BUqIxUrYcj4
	W9LhizRFiG0NssFzyA9EcmIxXEL8V72kdZ8vsl7YvtJAJ5kWYy6RaIcTeyqu7lJtVeEOruF2cG6
	67pDy2d2ZbbQMZRrz022Hj6F4/3iqD1KO7dCfADZS6SX9TMFN8BIvMHxCFWW1IfWSw==
X-Received: by 2002:a05:693c:62da:b0:36f:4615:9747 with SMTP id 5a478bee46e88-3724ff5a59dmr908439eec.0.1794100490242;
        Sat, 07 Nov 2026 17:14:50 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372656187f8sm1335220eec.5.2026.11.07.17.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 17:14:49 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mahadevan P <mahadevan.p@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 00/35] drm/msm/dp: Add MST support for MSM chipsets
Date: Sun,  8 Nov 2026 10:14:50 +0900
Message-ID: <20261108011450.4428-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
References: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I tested this series on the Lenovo Y700 Gen 5 (TB323FU, Kaanapali):
DP0 over USB-C (pmic_glink altmode) to a dual-screen monitor with a
built-in Realtek MST hub (two 1920x1200@60 sinks), with the built-in
dual-DSI 1904x3040 panel also on. The base is Linux v7.3, not
linux-next, with Dmitry's "drm: handle IRQ_HPD events correctly" v8
[1] (the cover letter lists v5) and this series. A few hunks were
adapted to other patches I carry. On hpd v8 the second hunk of 34/35 is
not needed, because msm_dp_bridge_hpd_notify() already handles the
plug before IRQ_HPD.

With three local changes, both screens show separate desktops next to
the built-in panel and come back after s2idle.

1. The plugged_lock / mode_config.mutex deadlock that Sashiko reported
   on 32/35 happens at boot with the monitor attached. The stacks are
   in my reply there [2]. I dropped 32/35.

From the cover letter:

> With 4x4K monitors, due to lack of layer mixers that combination will not
> work but this can be supported as well after some rework on the DPU side.

2. With all three displays on, the commit for the second MST screen
   fails:

   [drm:_dpu_rm_check_lm_and_get_connected_blks] [dpu error]LM_4, invalid DSPP_-1
   [drm:_dpu_rm_check_lm_and_get_connected_blks] [dpu error]LM_5, invalid DSPP_-1
   [drm:_dpu_rm_check_lm_and_get_connected_blks] [dpu error]LM_6, invalid DSPP_-1
   [drm:_dpu_rm_check_lm_and_get_connected_blks] [dpu error]LM_7, invalid DSPP_-1
   [drm:_dpu_rm_make_reservation] [dpu error]unable to find appropriate mixers
   [drm:dpu_rm_reserve] [dpu error]failed to reserve hw resources: -119

   The compositor sets a CTM on every CRTC, identity when unused
   (adding or removing a CTM later forces a modeset that reassigns
   resources), so each CRTC asks for one DSPP per LM. Kaanapali has
   DSPPs only on LM 0-3. The built-in panel takes LM 0-1, and the
   first MST screen takes LM 2-3 because 1920 > MAX_HDISPLAY_SPLIT
   (1080), which leaves no DSPP for the second MST screen.

   This is a DPU topology issue rather than an MST one; MST just makes
   three active CRTCs easy to reach. Locally, a CRTC that needs DSPPs
   uses one LM up to max_mixer_width (2560) instead of
   MAX_HDISPLAY_SPLIT, and the two MST screens then get LM 2 and LM 3.
   This touches the same decision as Mahadevan's LM rework [3], which
   drops max_mixer_width, so I have not sent it as a patch.

   Mahadevan, should a CRTC that needs DSPPs prefer a single LM
   whenever the mode fits in one, on top of your rework?

3. s2idle with both MST screens active hangs in resume. The console is
   suspended; the printk ring in the RAM dump shows devices resuming,
   nothing from DRM, and then "watchdog0: pretimeout event". The
   rtcwake task is stuck in an AUX transfer in resume, while the MST
   stream is re-enabled:

    wait_for_completion_timeout
    msm_dp_aux_cmd_fifo_tx
    msm_dp_aux_transfer
    drm_dp_dpcd_access
    drm_dp_dpcd_write
    drm_dp_dpcd_write_data
    drm_dp_dpcd_write_payload
    drm_dp_create_payload_at_dfp
    drm_dp_add_payload_part1
    msm_dp_mst_stream_enable
    dpu_encoder_mst_atomic_enable
    drm_atomic_helper_commit_encoder_bridge_enable
    drm_atomic_helper_commit_modeset_enables
    ...
    drm_atomic_helper_resume
    drm_mode_config_helper_resume
    msm_kms_pm_complete
    dpm_complete

   Several kworkers wait for a modeset lock in
   drm_self_refresh_helper_entry_work().

   At the hang active_stream_cnt is 0 but link_ready is 1, so
   msm_dp_display_prepare_link() returns early and the payload write
   goes over a link that system suspend has powered down
   (aux->retry_cnt, the count of consecutive AUX failures, was 107).
   While mst_active is set,
   msm_dp_mst_stream_post_disable() does not unprepare the link after
   the last stream, so nothing tears it down for system suspend.

   The series also does not call drm_dp_mst_topology_mgr_suspend() or
   drm_dp_mst_topology_mgr_resume(); i915, nouveau and amdgpu call
   them around their atomic suspend and resume.

   Locally, the DP system-suspend callback calls
   drm_dp_mst_topology_mgr_suspend() and, when MST is active, tears
   the link down through the unprepare path (clearing link_ready)
   before pm_runtime_force_suspend(). On resume, after
   pm_runtime_force_resume(), it re-inits the PHY and AUX and calls
   drm_dp_mst_topology_mgr_resume(mgr, true); if that fails, it turns
   MST off and sends a hotplug event. With that, 3 of 3 RTC-woken
   s2idle cycles resumed with both screens on. After the third the
   topology was rebuilt (the MST connectors came back under new
   names). I can send this as a patch on top of the next version of
   this series if you want it.

Unplug and replug mostly works. When it failed (3 of 6 sequences),
the hub had dropped HPD or stopped answering AUX right after the
plug, and one or both screens stayed dark; the stock Android kernel
shows similar failures with this monitor.

Not tested: daisy chain, 4K, audio over MST (no audio sink here).
If it helps, I can test the next version of this series on this
device.

[1] https://lore.kernel.org/all/20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com/
[2] https://lore.kernel.org/all/20261108010724.4061-1-26rote@gmail.com/
[3] https://lore.kernel.org/all/20261008-lm_fixes_final-v4-0-fa986071c3c1@oss.qualcomm.com/

Thanks,
Joonhoe Kim

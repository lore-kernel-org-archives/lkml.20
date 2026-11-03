Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793713905;
	b=1Hy0qBYrz7c9aM3CZZ+iSBIU/06DZcm8O3k5LYYlED7qkLtdhqSoCnJs/IVj9aXhIA/Z
	 S9m8XmBI/BiVJOSJtt5MXrk08mIUgRd9iMhqVZahBMMkNtDv5TvzdWKSzYtT1Ka89l5sx
	 2Uulla/S37xr1apG7Z3+GwQAZXoPXRA6oMvCM3pqFjw/t+HWO+6y0pSajBlAq9XM9nxqv
	 iFByeiIZTL4RmTcNb1p1v18FOWIZGgHpcsvsZd7h81ZzC/ycV2ilLnqKC8mb4go/s8deH
	 mv0+Y2YPgPxMWFv3iBmFgk4CJ5SZIOnPJNyP2aYVM5Hrl4ed8j2n+eoyzpak/9Fn6sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793713905;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=eZFocSGQWUyjjZwOU15rPwT7Iy8HDoBofRSNVrSiUk4=;
	b=fTE+YnvhpXNleiIPtdByaRYYITqF3OqEfhdxLyLj33zEqu2/5+WnMdWeIm2acMKkZvbs
	 6OgAF1DvoI572aw5P/sikgEf8RSI4nNvTAsO2a6069dmnpZ/AeeFkDNad3n/kdau7+NOR
	 +I1CAE3hOUJ693sFZ/sdugSZ0cge2/JaOdsYhQfBaxFAIZnL7aGt3SktcrmdZH4Cr1RJV
	 UCDxXNKPyGc8sZ3mRKLQ2oq/CyfKs4HX6KaA1Hor3KHgivqaI6RGAfQsgJIY6g+7yxtVo
	 4nN9qk784w+vTpRlzj1W4wj20FijzjkJoymv6x3nr6WtBAs+Wt8rE+ogAEgZudvCHLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pzpRkNjI;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D67460A2602
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:51:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D67460A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pzpRkNjI
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-14fc585291cso3309083c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793713904; x=1794318704; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eZFocSGQWUyjjZwOU15rPwT7Iy8HDoBofRSNVrSiUk4=;
        b=pzpRkNjIpgiHGoKx3KKRV/CEkYc4cBGWD2J2bG64XNSZKhlcKu+VYtqtrXo8cglhwX
         Y+ZvHsk5IUi3SQwXBhBvFo9OiN5pHbzW8EPRN2kfqjfpsY0DBDkzbq8EzjHObqANqKfx
         29haryzpvvPZSDB+cxmYXKE9azchjzZbCvRaSRH1W59wHucvO0m3iPk1YwJzX4pW4IuY
         sc3mv2Kbzdbq1kXdWEnCfHxpUSROK+5wa0dLC1taXBB6OjV9XhRN8ZN4eA04XN4tFz74
         G6mi6YTWnjCzj758ezmO3DaI+YsHLJV/boWQCAvzrKkiNMYfWsvaSoFu1Sh8fWFabPO/
         OV+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793713904; x=1794318704;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eZFocSGQWUyjjZwOU15rPwT7Iy8HDoBofRSNVrSiUk4=;
        b=QXQ+sELxjAig0biBEQYAVUdd2xuLMfJWvUGABUFJCWEBW/vd8JogjdJdEtAXnzdUDM
         7Cl6Yj6tOWde0v9mSi0O7DommFxiU2ZjHJ/t6ciJleYj74eN+KTaXkFiOXYC1FZHQWFD
         FNDhEDosKnirdeufwjG2KlowkZ1BEBQgvy/qgeQU9jDjm1IowYyBoEc5PR7UKLwlnNwM
         AoAUjlWLNAiMngSuQSPRu/wrpIs8vbTAUKFjH8VDmcbB9L6H5Tt2oZaZXffTLmnwt+AW
         PktuvhEyjwmAix5HZW/t+4j0kS7hmmktGOzyGCjVAXoAjSxO9UBGCaHra35lcvHeE5Fm
         XLHQ==
X-Forwarded-Encrypted: i=1; AKwUvByVTdPbG+pyismW99R9yA3/uHzeX+9vC+IZ94SEq9A/C2mpovKHBelbQ8gfKUmowgEiE+GH/X6zqZKHY9A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8UzQFvLbu3XCpBiNLKXUd64zIQqS/12ksqhTdkxtL3UJl3sXKU
	XESwn5qt5uxdikWtDr/RQXNzvzlP8vtyu6EgZ1iywbnIf75624yjRhLy
X-Gm-Gg: AYBFou3gNBcV4CIyT4Cfw3K3JAzwJbc4CUakh0F1EtKW4bbq5TcqDBrd/ca29RuSqpf
	1FyQlsN4Fx9QXiokagbRZJq7xfKP0jjmrvRiD0CPG1S9fhUIW99w6gBwYKlvdGgDp7k/r1oiQfg
	UP4xzGhYAQiydSGRzvFHkAxHEyN2AJiFYRhpheg4MRdDHzkqMRwgnqfIxg0RXfATvEfzW/HsYfF
	AqRRjvsFEbuS6xzdNBmdXDgkotCwih05gDiheIHvPFMSGMAVjsgi391ccuUVpvlzv8lfUFu1xKF
	bDLsU7qRgoLHUOcVfdyc9PgPRUKfuh9VgHgm6AQUulka/QT6Y3pFIk+xivZq0qh/4UbHFDGsFk6
	8b8yYpS5qjA+2ncCRDYkXEwqJTvaWAIk+tlR5XkT63MvyJVK4T78NzMibNgRbHi6BcvjjXn/dse
	25JR0mTXWuBAeQyeYVwiBfuh3gn/Sa4EtL8GwKs6dgXnPeqkIs8oJK8YDziUgKRP5FjTWPhKJ9J
	nYO6LNBvABtx1EJfg3ONwvSOnYf+LICTRo1Q33TS+nYX00QA4bqTeCcM2AKL21A04nhJdaZuxLP
	9frzmb0fHscQYZC3Y1zY52rzoRTFFTaXlU6E0UMN+UCCzEZ4mM8Zp6rbDWSD9emlOw==
X-Received: by 2002:a05:7022:4392:b0:1a4:c892:b14f with SMTP id a92af1059eb24-1ac5de53bc8mr32355285c88.29.1793713904238;
        Tue, 03 Nov 2026 05:51:44 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1aed79b3dfcsm46918499c88.12.2026.11.03.05.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:51:43 -0800 (PST)
From: joonhoekim <26rote@gmail.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Joonhoe Kim <26rote@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	dragon@radxa.com,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 09/20] drm/msm/dp: Unwind resources when enabling a stream fails
Date: Tue,  3 Nov 2026 22:51:40 +0900
Message-ID: <20261103135141.1993-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261009-msm-dp-hdr10-v2-9-1835d4966da3@radxa.com>
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com> <20261009-msm-dp-hdr10-v2-9-1835d4966da3@radxa.com>
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

From: Joonhoe Kim <26rote@gmail.com>

On Fri, 09 Oct 2026 11:16:01 +0800, Xilin Wu wrote:
> Stream enable can fail after acquiring a runtime PM reference or
> starting the link. Returning directly leaks those resources, while a
> later disable can release a reference that was never acquired.

This leak breaks USB on a Lenovo Y700 Gen 5 (TB323FU, Kaanapali). I
tried parts of 08/20 and this patch as a fix for it. The result was
worse.

The sequence, seen with kprobes on v7.3 with out-of-tree board
support:

- A USB-C monitor is unplugged during s2idle. On resume, the stream
  enable trains the link to the gone sink and fails. Nothing releases
  the DP PHY init taken for it.

- At the next suspend entry (booted with no_console_suspend, so fbcon
  restores the old mode), an enable on the disconnected connector
  powers the DP PHY on, and msm_dp_ctrl_enable_mainlink_clocks() fails
  with -EBUSY. The PHY power is not released either.

- The DP side now holds the QMP combo PHY. On the next resume,
  qmp_combo_usb_init() skips the common block init, and
  qmp_combo_usb_power_on() times out waiting for PHYSTATUS. The dwc3
  resume fails with -110, and USB stays down until reboot.

On top of v7.3 I applied only the PHY power tracking from 08/20, the
power-off on the link clock failure from this patch, and a backport of
1bda647ce61b ("drm/msm/dp: move link-level teardown from
display_disable to display_unprepare") from msm-next. Then the same
unplug during s2idle crashed the SoC:

  [drm:msm_dp_ctrl_link_train_1_2] *ERROR* link training #1 on phy 0 failed. ret=-110
  ...
  [drm:msm_dp_display_atomic_enable] *ERROR* DP display prepare failed, rc=-104
  [drm:dpu_encoder_phys_vid_wait_for_commit_done:583] [dpu error]vblank timeout: a0820302
  [drm:dpu_encoder_phys_vid_disable] *ERROR* wait disable failed: id:37 intf:0 ret:-110

The device then reset into its crash dump mode. It crashed the same way
once more, after a failed link training during repeated VT switches
with the monitor attached. There the log went on 10 ms later with:

  qcom_q6v5_pas d00000.remoteproc: fatal error received: sys_m_smsm.c:503:TZ force stop

Without these changes I saw the same failed enable and "wait disable
failed" three times, with no crash.

My guess is that the DP PHY, which clocks the DPU video interface, is
now turned off while that interface is still enabled. I have not
confirmed it. So I can't give a Tested-by. The PHY leak is still open
here.

Thanks,
Joonhoe Kim

Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4511847884B
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 15:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792335729; cv=none; b=IdRZ8Es+jR7sbUSy+nIBOF91v9SjCCurgMcKqlWLdj1CYDnjYU25CHEZhq6DykzOvyErNBHRbOZZmahIDuqlgMwGm9VcxfgHu0Oc6N5A53gv8DXiGCoYqGK5Ik1oS8D5DGdqytWIRC1mH3VF66QJL8ak69u6oSHee/cKlz8AYlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792335729; c=relaxed/simple;
	bh=z0Km2k2D1mJ6dM2Hmvxg7g9Ao1AZQvMjeu6Q2oeQFSs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=niIDfB9Bt8iyoxp+RR3CG0zd74z5RCD/qnmbMdZjSbyzSqdBubf6EoHKD5X3PeEAVf+Z2tB6c2om6QkHDV6vVHpACfekrCoEiAds9c/Krpv1KIi7H82qGCryElXQHJnuI6f8aSs5bCY120O60RPpWDzH2yxZk43GvXJQ0kwjDgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JYfumyuq; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JYfumyuq"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a01933b584so9330445e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 08:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792335725; x=1792940525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SXjjXTjLoJQT0XADS1g6ySrPzWmkII17X3EnvsTPyZk=;
        b=JYfumyuqEmATM+/JgfMC/xw6gm6gr03ZOrc8GW8mdQbu3rAuRoe7sj0aZ5n4++I8br
         IzrkzuYkBRZIP5ikXd+1O5f2AQvtS/af9lzqNCHPpGZa9hkWYtt/yyP1TmwCrgJHrJI9
         CWWO1duJNUIvWMjxCpasaI64cRjIVcWqpt+/pu1IvyTLZUjomg1bF92y/7VyRAKnQvbe
         haaOTxehDuZg34GH18QavejEYFyJoSexDZjOFvZ7BiobCCLUGXS/st779rJ9Vga0xsVE
         FCzew7iNFw36GkgNJ+vo8qBebRp/9LY/1AkYyWlHZWtogf5r1ojyx+2v3TGtB5/lMRYq
         ceVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792335725; x=1792940525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SXjjXTjLoJQT0XADS1g6ySrPzWmkII17X3EnvsTPyZk=;
        b=JQPF4w395kBklPml3BY5WnwjR6+0BfyPpsiCgDh64n54I34y0XJhy22L48gUEv+Jxk
         2R93febBXnhoa1HOiY7xSG9nAsnQ+OtsW7evyeG2MrhCqvioYOlXX42PfHjneBejc4l0
         1mp0l0Fpgi/zXoyhSqLCo5aowpZ47mxnlx/95OgA/LTXlbWzqwamTBKPo2MdzYRa0YfK
         IuLqs6xzHzoCwXrD1RIk7OEp4S5/NpbBxcwyJwpZ0sFRrTRQmkr2Q534RrvmXVqM1eT/
         UOXX90YENSqMa/baCuH0rnoVsM7DMMhETtbqbARtUxHl3Pi6XQ1/r7bpROgej6sBB0Ff
         RapQ==
X-Forwarded-Encrypted: i=1; AKwUvBzUZNeQpjJc/ixM5WA2j7sTSZWmT9OIJAHHqg7TIMB4xR+x00wF0VKkdZtD2ra4qyzz9AIl0qCp/7P22mk=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+aFNRbO4DQnpjYC60ZJMU6f1fD+aUXwFEyFjN8GgDhBYpa9ll
	cvWl+84jFOKaiZfMaCK7CcMmq3cE17RVmlOZDIiEnay4yWY401wLdGPc
X-Gm-Gg: AYBFou0Wk7ztHlDK9CQVBqK8hJtMx0Nt6ylm0WCENvK44Sh4jX6gKZ2rnBTAQFzHf2C
	0fMhv/eECXILAhW1Kxe0+agD30h59vXKYp0014Xr5rxl47F/gj1KkLsidjbfhmfSruQGhiKhj2C
	ZsChjxmhvXtnmv4pN3twGzWPt3qZdF9cXL2XSuy+NwPJUXg2Lzzsa2J4KqVAvcRxzcMGlY3v4zr
	irqtKBlXN5iG6Ii4rwJM85vlnsljUC/UAWTy2Qhrcy33RE9mN19BIaT3yFccv4Or3vU+KHzQKgb
	nJeF+Nzq8K4moV1dDI7BKXFMgLtXwAS6A9hsiGCPHepDS0SeilTNjientX3fPWmq6Rn7cDNbmbt
	miN7A9rBbQp6HV+Kv7Q/dvSbWfmwf/C6BhVEogUQ//WM6L7qZ3N9j5jv7iDlADAxLU0lgUzIscS
	y5H7tOz6gHWctkRDoT4ycFPQvo5u7DTq9HOLQkTm9OloZU3IDQvVGweYwS3GUl1ZhUgzuOCqCL8
	PkDZjPNVNIFIxfHCA==
X-Received: by 2002:a05:600c:6303:b0:4a1:d462:5bff with SMTP id 5b1f17b1804b1-4a1d75e6ef4mr107131555e9.8.1792335725365;
        Sun, 18 Oct 2026 08:02:05 -0700 (PDT)
Received: from localhost.localdomain ([2a00:1e98:f021:77b0:6dda:aa9c:23f5:c12])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8af2fcesm224773225e9.8.2026.10.18.08.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 08:02:04 -0700 (PDT)
From: Vladyslav Tymoshchuk <tvlad744@gmail.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Joonhoe Kim <26rote@gmail.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Casey Connolly <casey.connolly@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladyslav Tymoshchuk <tvlad744@gmail.com>
Subject: Re: [PATCH RFC] usb: typec: ucsi: Schedule connector worker on freezable workqueue
Date: Sun, 18 Oct 2026 18:01:36 +0300
Message-ID: <20261018150136.5896-1-tvlad744@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
In-Reply-To: <20261016125044.1085-1-26rote@gmail.com>
References: <20250205-ucsi-schedule-conn-worker-on-freezable-wq-v1-1-107d1356b77b@linaro.org> <dp5ohy5piss7osycibuke7kwnfl5elnmc6gfvqgfh6mzzrldla@sru3ylzrtuea> <20261016125044.1085-1-26rote@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Abel, Joonhoe,

On Fri, 16 Oct 2026 21:50:44 +0900, Joonhoe Kim wrote:
> and the system never resumes. With this patch on v7.3-rc4 it resumes
> normally (2 of 2) and the change is handled after thaw.

I see the same on SM8750 (OnePlus Pad 3; the board DT is still local),
v7.3-rc5 plus board patches, but here it is the USB role switch that
breaks, not an i2c retimer or switch. The port is in device role,
connected to a PC. Unplugging the cable during s2idle resets the
board, every time I tried it without this change. My tree also has
local ucsi_glink and qcom_battmgr changes that make a cable plug or
unplug wake the system, similar to Jishnu Prakash's ucsi_glink patch.

A failing run, with times from "PM: resume from suspend-to-idle":

  +12.5 ms  ucsi_handle_connector_change() starts (noirq phase)
  +16.0 ms  GET_CONNECTOR_STATUS and ->connector_status() are done
  +16.8 ms  ucsi_partner_change() calls
            usb_role_switch_set_role(USB_ROLE_NONE)

Nothing is logged after that. The role switch is dwc3 with the
dwc3-qcom glue, and the glue's role notifier writes to QSCRATCH while
the glue clocks are still off. They only come back in
dwc3_qcom_pm_resume(), about 1 s after the resume message. The
pm_runtime_resume_and_get() in the notifier succeeds without doing
anything, as runtime PM is disabled at that point. In a debug build
that skips only the usb_role_switch_set_role() call, the same unplug
resumes fine. The GLINK side works in that window, as the UCSI
commands complete; what breaks is what the connector work calls into.

With the connector work on system_freezable_wq, both unplug runs
resumed (2 of 2). The work started 1.50 and 1.54 s after the resume
message, right after "Restarting tasks", and the partner was removed
without errors. I tested the same queue_work() change behind a module
parameter in my test build, not the patch as posted. The
pmic_glink_altmode worker was on the freezable workqueue too, as with
7d0767c5cd87, but it never runs here (no DP partner).

Plugging in during s2idle survives only because the PPM reports the
partner type in a later event, about 1.4 s after the first one, by
which time dwc3_qcom_pm_resume() has run. The first event still
registers the partner in the noirq phase, and the kernel warns:

  typec port0-partner: PM: parent port0 should not be sleeping

> On Dmitry's question: freezing the ucsi_glink notify_work instead would
> also hold back command completions (ucsi_notify_common() ->
> complete()), so a command in flight at freeze time would wait for
> UCSI_TIMEOUT_MS. That is from reading the code, not tested.

One more data point on that question. Here the unplug notification has
to get through during s2idle, as it is what wakes the system, and
GLINK itself works in that window. Only the connector work has to
wait. So a GLINK rework would need both parts that 7d0767c5cd87
describes: letting the notification wake the system, and queueing it
until the system has resumed. From reading the code, dropping
IRQF_NO_SUSPEND would not be enough on its own: the interrupt would
then be re-enabled at the end of the noirq phase, before
dwc3_qcom_pm_resume() runs in the normal resume phase. I can test such
a rework on this board. Until then, this change does for the connector
work what 7d0767c5cd87 does for the altmode worker.

Tested-by: Vladyslav Tymoshchuk <tvlad744@gmail.com> # OnePlus Pad 3 (SM8750)

Separately, I've sent a patch so that the dwc3-qcom role notifier does
not touch the hardware while the glue is suspended [1]; with it alone,
the unplug resumes here too (2 of 2). That does not help the PS8830
and FSA4480 cases, so this change is still needed. I can test a
respin on this board.

[1] https://lore.kernel.org/linux-usb/20261018143126.3978-1-tvlad744@gmail.com/

Thanks,
Vladyslav

(I used an AI assistant, Claude, for the analysis and to draft this
mail; the tests ran on my device.)

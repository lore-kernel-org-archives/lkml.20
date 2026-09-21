Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911023C3C07
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 23:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790032140; cv=none; b=IVOjJmpRM/e47tp/37yFSDfup8PHUUs8EqdqdzV104c1mOuH3BJDvu087u9e0u2wRKHJRx2rueqMZKJqEGBIdJvzfhza5s05s8zWVOWLOCf0VYVCreKQ0j6S6g3ySqbklyBYsG7bs0lsLc4CarcefcI/ImU/jtC7nFv1+0XTyL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790032140; c=relaxed/simple;
	bh=FjE6m4Wu22yRUqg3eOb2AwP40X2TKH7xNOyBefmJeU8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ywu82veucdHmpNfz9V/v74PQ2eB1p2EyK9tO0FK6IbUf52Q9GbjAmvw4aIJ0ILR8sqTu0yAS8RZ4vMeeKnxZmjAXpKUsLma3fp2NC3CVe0cXOpeKKWkeeLLzjEamnkoLQDULd5cdKXJwg0G4f9vjCieZZkRFpMZe2OQIl2hSuoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E4E1Ym6e; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E4E1Ym6e"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-93910cc46c4so339612585a.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790032135; x=1790636935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=V+7FtZo0KfJZuE7MAZ0TFcA4sMr0zM/AKrTXBM06+cw=;
        b=E4E1Ym6emMwVocXYNi+rPgWOOJKOZ4J06QPIFyy4mPzFOhLXcdda85G8rlxZQxQTtv
         wIY+2w2zm+vfv/7DdXkF3MAh0Iybkc7bEEv8gj19wEHBD19srwDS+ueb4dbxcWZcdhvz
         eq5DwOrvSLQ8x3s6S/7aOZp0o7BNjLSgb2U4IHTwcsWQRyySoazNHDynQILNlVLIJ/dV
         f+vI9J9PctGd0hv7pNUuOV5C4ulykOknlLzx3heTi8knqcfEu+z18aqdibrLY//bEblO
         0O7jsirA2TiQEYy1e28J81p1BaOD3swJZD1PCcy21xYWgtomwimoRzsnBfXo/mXJpHbk
         ZOGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790032135; x=1790636935;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V+7FtZo0KfJZuE7MAZ0TFcA4sMr0zM/AKrTXBM06+cw=;
        b=L3JL2CTf4jdD3kaQfqK7vSxNPJR83iUeGPEEZpHyOZYobF/cO1cAs66SkB0rxDfoDK
         iQdhjhsr/rBopyU65kwr8ay9waSKqzNmcKwolVAKWuAg8GsM1Kr34o3HfEc/Vy/80fh7
         170PPqK5qLBMLGCScV/IJKTCQNL2s0fwva8WyM4gp54Rg8ojsyF8T9+P7j0XAW0GMU/a
         jeHdXKOiqiqP0PIv+BKpXHtt0LxS6AYXW6OaTLfmxzIYlpktPl0CaTfAGbKdpgjQypRH
         3xA69xsb9/chl687h+cvIlCwQeCAgouzKxTeSQ/xFmerlWVjDsLcizRg8OX7qn2jTCcy
         BUTQ==
X-Forwarded-Encrypted: i=1; AKwUvBzuV8DmzS+YBtsqZV9N72dNxFAiNoKEt5e1Ts9havLf1xaKc4qNICCZxcQAYeCSJeaysweVij+0AfjZSkI=@vger.kernel.org
X-Gm-Message-State: AFuF++nRdGNLCpiHRPE/vClZk4kY1VpvPMn2xaSAjzSHR2RcRFgmwNg6
	GAGAZTSIXuNIYOeSaPW6fzRJh7+DRFCvszkRHGiOZtMhOTbsexKrldk=
X-Gm-Gg: AYBFou3iRI/cbDwXqcs3yxeNlXYMlt9t4ZQP5xj9ziA/YUU3BKwcq3zeAJK6U7Md8lg
	HUywLxe8gNRlSw1erMGgTgjFEiIR0jcuoPkJr30yZdGX6bk74PsLY884eEXxTW7t8sTqAiQgrUj
	MN3M7XFBvwMXehEdhkeZyCzxxv8LCIty5T9hQKI0oJtjJ2e+zFcx1Ngyqe30I+d8I9SFF4HFnBF
	5ml9XEl5RLXAgzaDqOLBnccrkmCjsAZUGCgLcHL3DjArOqH7NkWkWKh7VXIU084TDACo98+5df6
	s2zvReTwJOpBkMxJt9eyixODi8Z/3iS+Ra2R5X7ABSP6Mz0RsRRQMCyP5NzDDwDtkBxfLwrMosK
	kRQjy1D/eE0YSD45HCiiukgDkF4jsbv8IfQJPSKboF1r1YB/dBGROeo/89q+NgE19ArbkKnt1sr
	jRtC84rIIZ9osAF4dwmvuniGe4bKWgHl2/wrtRkAwWdZhacnRqD2Rk0mHup135ufFcMsL5DrsMT
	MPhSTwZUDT2kC9jrndJaopIVbGM6BMrBhJuzVgLHHrYE26NtZLPD7jeYiOJMB9XMvWWWVwIDcCS
	BeRG3tfr34fVdYRAl+XbN4sV8qgF
X-Received: by 2002:a05:620a:4008:b0:939:6dbd:de57 with SMTP id af79cd13be357-93c198e81d8mr92373885a.32.1790032135435;
        Mon, 21 Sep 2026 16:08:55 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c19a7f592sm39933985a.17.2026.09.21.16.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 16:08:54 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-usb@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 0/2] usb: gadget: tegra-xudc: Fix removal-time work races
Date: Mon, 21 Sep 2026 19:08:46 -0400
Message-ID: <20260921230849.502492-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two producers outlive tegra_xudc_remove(), from different commits.
Only the delayed-work fix needs an API added in v6.10.

The devm port-status IRQ queues port_reset_war_work and plc_reset_work.
disable_delayed_work_sync() rejects a later queue.

The PHY notifier queues usb_role_sw_work and is not devres-managed.
Unregister it, then keep cancel_work_sync().  That applies below v6.10.

Changes in v2:
- Split the Fixes tags.  Only patch 2/2 is marked # 6.10+.
- Keep each Fixes tag on one line. (Thierry Reding)
- Disable plc_reset_work too.  The port-status IRQ can requeue it.
  (Thierry Reding)
- Unregister the VBUS notifier before draining usb_role_sw_work.

Myeonghun Pak (2):
  usb: gadget: tegra-xudc: Unregister VBUS notifier
  usb: gadget: tegra-xudc: Disable reset delayed works

 drivers/usb/gadget/udc/tegra-xudc.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)


base-commit: 238650ef6c7c7cca08e032527329424c9fbd70e5
-- 
2.53.0


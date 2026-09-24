Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30964A2E00
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790271203; cv=none; b=dc152dqTolIj9yDTDESIuk8Pz3h4cKLApIQVx9+fAVazHi8i5L6shj3xUdDHGrOHkrbqBE1Lf+P54Q9JiTtEzYZNMUHcB2tgBoG3GEKkhyC3VnDbcgAgSetCd0XuOK6wfJxKmZEhtz+GTZieGgUpyxxRGTDZAsNU6uzxFs/zo7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790271203; c=relaxed/simple;
	bh=ASZGUpiJMVkvMttdqEm5jfbM3f66Xwz6p0aUu3bPRYY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=onbgvig5uV9Vx8m3QmlxJqlQQkegNPFMpHZ7DGmOJQ0UKl5AQtyhDmNeo/bDjo96bQZ/xH8PVZyQcrfFe1llrjidNRRvTKr1UdIEwLc3l1DOC68P82YVbeJgJi4LCzZhvAsqjCPYJlwXEgEzOWjo34UjDjCpwGfqGmLjtBrMuzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=QHWqx5Ww; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="QHWqx5Ww"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccd4f99dso106475a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1790271200; x=1790876000; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TEYtUOQOXH98BowHh4021SUx4WWxmZ7LAdMLKV6U6Lw=;
        b=QHWqx5WwTZjCWUMBk5z9DUTrZKJMmv4N/N7KL49RSc76FXCW2fxu3e+LV5oNzFFOSL
         genwZsLygurVFmYXE4kWHa6N9wojrmym8f8v1IYuL8Dqx03Pdl1+jnHWb4Nfd4AQVFcY
         yHoi43PW80lU4QYXAtKH02C2vzNThtfjccYxcWw+mYQVoYhRCqhmp3kl2EtbNurKSuxV
         RuxLss31Er1sFI+S4eMnOTo3RKlRUeQRzcXwG8F1MmNqFgT+j9uTmwSPx+8Pyh6j5kJ4
         43I/I+9KWVrc5PVCRzGnK8wuMcVW2arAJe6Bp3u5qF3a4VDVAmemwySO6ULNLDt4AYK4
         8ChA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790271200; x=1790876000;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TEYtUOQOXH98BowHh4021SUx4WWxmZ7LAdMLKV6U6Lw=;
        b=0aMPumU1imkDTFEi4ggR/HHKHgAQWBOIXQprv7BbJ0Jx3aAy/7BneiSJx7/WfOJNN9
         QzUI04p5cLroAdaRCNH9zsn1JdE9vWhH8H9SgdqBnzAC9CdutU/DK7EK4EUzWkQoRA/r
         HAZUYxc1qfR3+DERU8qCZ8F5/1Oe83TbEbg7kPw1pcvcGRrf+MwZRpE+LiDDfMd3AdUE
         T48RX0qaVjPozfp47yprhp3dDh0ttXjCnu/K9UHJXeb/9xfCmgUEh9jaENh59iZT6ZCA
         1CdSxW860Q6a+ntQxr8WS94A6bLVT991JnopEfyNDfzgY9ticWnR1tKLKkF6IvHXbIYz
         uJbA==
X-Forwarded-Encrypted: i=1; AKwUvBz30Hfd/7EkwgCaZDtp7RPzYZuExDddJWO8xccJ9bqf7mNjP2RoTW5gTbn/Cw3i2MMdxj3O28hxTizKpEQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kZcajgQoIGC8vf2anYAPSBC2odNyJEaFHdHWB7Xlf5KYHlrvDW
	rSUsjIaFnB7qhILz9LJ8CxJC6+K3hsEueqekOWs4tJc8JYoWoGpW4REPA08b24OKWGY=
X-Gm-Gg: AYBFou0CY8UZc5AbcEvE3BVmaFVbqEOfyNcj1tLQ/iemj6vmPgI7Mjb0L/8uiCkS51A
	BeA5Xmtq6ahsWI/ulTTts44XygS7x9mqH8u2Ia+91GmKsyBOfk+Gjm/SvVcPUNSud2WvWR3K2yL
	BdxA3QOizSXLNB9wMc0kWyyRq8txExfXNrEhhpAWVFlJHlmeYveTi26oyxzHdAEDIljYh0BUg86
	e7nku5whOY4wlGChnYdlJyyGifptoVzN48SrGeEgnJdtZFiFSyoHQWulq1cEp/R83YhUftv7iSU
	Bo7ueFVlboaAu+JynuGj999GTkd0TAP49phGLSnVFIvDD7X1OyENIjl+vLhHnr8qL6jNDydAqG7
	lSDEFGmgQwv4kqYdjN1bO+jk9yne6CguQGa7e4VLhnh9WqVkW6oTWudfiMSn0yOFS6C7/Io/ext
	/67NJWk5PNOPccRknAIbd4SLfJwi71pPOXnoG98NEApV9/CVHwp7dQK+BqcNxOO3MjQwOxIQQdr
	v5PWGq1YMZY7ay90WxDZqH5JET54P/MHAARXAfpHjps+n1EoPWIvG8EXmEpUOuDjz1VqgY=
X-Received: by 2002:a17:90b:180d:b0:39e:58fc:1d73 with SMTP id 98e67ed59e1d1-3a098d962eamr3209318a91.23.1790271199889;
        Thu, 24 Sep 2026 10:33:19 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:f875:3165:4649:e818])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0972f2cc3sm6097171a91.6.2026.09.24.10.33.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 24 Sep 2026 10:33:19 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Yong Zhi <yong.zhi@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Dan Scally <djrscally@gmail.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	=?utf-8?q?Fabian_W=C3=BCthrich?= <me@fabwu.ch>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH 6.1.y] media: ipu-bridge: Fix null pointer deref on SSDB/PLD parsing warnings
Date: Thu, 24 Sep 2026 13:33:12 -0400
Message-ID: <20260924173315.87556-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Hans de Goede <hdegoede@redhat.com>

[ Upstream commit 284be5693163343e1cf17c03917eecd1d6681bcf ]

When ipu_bridge_parse_rotation() and ipu_bridge_parse_orientation() run
sensor->adev is not set yet.

So if either of the dev_warn() calls about unknown values are hit this
will lead to a NULL pointer deref.

Set sensor->adev earlier, with a borrowed ref to avoid making unrolling
on errors harder, to fix this.

Fixes: 485aa3df0dff ("media: ipu3-cio2: Parse sensor orientation and rotation")
Cc: Fabian Wüthrich <me@fabwu.ch>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

[ Backport to 6.1.y: apply the sensor adev assignment in this tree's
  older ipu3/cio2-bridge.c and cio2_bridge_connect_sensor(). ]
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Hi Greg, Sasha, and IPU bridge maintainers,

I am continuing with CVE backports still missing from 6.1.y.
This fix is inherited by v6.6 and every later mainline release, but 6.1.y
still has the affected code. The target-specific adjustment is described
in the bracketed note above.

Could you please queue it for 6.1.y?

Thanks,
Artem Dinaburg

CVE: CVE-2023-53336

Build: This patch was included in an x86_64 allmodconfig and
CONFIG_WERROR=y build.
It produced vmlinux and modules with no new warnings or errors.

AI assistance: An LLM helped find, adapt, and validate this
backport; I reviewed the patch and test output.

 drivers/media/pci/intel/ipu3/cio2-bridge.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.c b/drivers/media/pci/intel/ipu3/cio2-bridge.c
index df6c94da2f6ad8..e68b735a150a9d 100644
--- a/drivers/media/pci/intel/ipu3/cio2-bridge.c
+++ b/drivers/media/pci/intel/ipu3/cio2-bridge.c
@@ -280,6 +280,11 @@ static int cio2_bridge_connect_sensor(const struct cio2_sensor_config *cfg,
 		}
 
 		sensor = &bridge->sensors[bridge->n_sensors];
+		/*
+		 * Borrow our adev ref to the sensor for now, on success
+		 * acpi_dev_get(adev) is done further below.
+		 */
+		sensor->adev = adev;
 		strscpy(sensor->name, cfg->hid, sizeof(sensor->name));
 
 		ret = cio2_bridge_read_acpi_buffer(adev, "SSDB",
-- 
2.39.5


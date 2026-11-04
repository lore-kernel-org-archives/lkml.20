Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793804265;
	b=nkxSDImh48arL5CXG90Qr8MM5GDxD8AT3lmSWkyA0w16xkSAY5pW/ES483OxtrydlX+D
	 DG8ycfYW4TNOBrUj1wPLKs7F4i1+ePmZ56rWJOTRf5PKSXUkdywC+iu+nxweLAMRLXIPB
	 1dbgsHk6EVdg2MFP4XSSO4EdF+tbRq8HWmRG9ZL7lTNff386r4mTzuGHt+f1kwZ2zBvJS
	 cA1e3GvRv6pYAgheiCM1CPg5oOFZcSWFUUtK+mLJc3AgZwZ9G24F0NraMwDU5fTZGq78J
	 2vpemQj+eokzKHuS8FyoYrR5nT5VBvWagCG+NpDH2nsbe5sdysqXHmabaqeAw/XvQwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793804265;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KUz2D34UCSVw+yqhvoh+RPWtDjdbKvsiINtzwSInBU8=;
	b=2nlWtSB+vHN3gjKVQFY1wnOoJr+YDwwAe6BH5xDs6kNftfS1WJw2Es6YYfsy18XObJb6
	 NlUYba8+lRqXB0L+R8We1u/ZyAxxJFQqOVyZJDbLYIXVu1BQpkJUAhh2WDRRg/bpfl7gy
	 YwLnlyhXA4YaSmQHfiwrQ3NzwYyJp3TjNeoI55RIqvyWyZ8970eA2yMLCisK+34dVrycS
	 BqDBb0vh16dgbXsg3XrRZbvo9Gwg7KgT5h0+mOoCuYG9+BgEIpIMb2CZ0RIKu110qct4x
	 XHZsi+eq7G4cQmxc+AKdVi2YwDuS53wDiN4glTms3bZ3iV+/FVt2KQ9l+/scwIchY3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=grische.xyz;
	spf=pass smtp.mailfrom=grische.xyz;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7960C606A332
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:57:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7960C606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grische.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grische.xyz
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e10a70540so505698f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 06:57:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793804263; x=1794409063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KUz2D34UCSVw+yqhvoh+RPWtDjdbKvsiINtzwSInBU8=;
        b=nYvkX/jAUqNGFSZIMX4UHWVJ0MKoLG0y3GWv+YMy8IwGGBAgbXF9FaRjstrlwvfYOH
         Tm6hzeqCLCSSMgtCpwwXRuBCAxhN69p44UHqtvrVxiQafopKHqvdxwGvqFWKTVRGl9xO
         93s0GbyvNWtUuYaKHHUFrP+HfcO6fJIWMO7iCWyh30w7UO+gR4MxaZ+85yCB6tXGhSJd
         6fZEJgY1ihkDx+Zp7+kPkGJOFRVt+y3NuRm38V7ASad2QPVqVfzNgD+GjjAlOgLvcqLy
         HC/27eewdlFtyolZZp2oX4Gvzt1V+VRdYjEgmChHrpubch6/2PGQ1qOFqjOuh+g5eZL/
         68Qw==
X-Forwarded-Encrypted: i=1; AKwUvBzFG2E+izMaVIboidk3Khz4gtCsPR6hy/HiE75Eqc6l1hCtuIxD1OmovXztkLDVheTtmzZjFdR0VVk3l60=@vger.kernel.org
X-Gm-Message-State: APuU4Z/q8Hb2j7XlvePC1anvpGYd8/mTm9nbb/5HNF2z/zh4+32HtbAM
	I1BK86TovjijNSkNey32o4RZLGKNWJklN9rvNJzyPxnoAe0MOr0u+A83bEiAL7ZvMfk=
X-Gm-Gg: AYBFou1QAZYLxclRgvI2rGyMi3LdB0cwUD6y/Wld/KHsfMG0Y4lKrGbSLPy37Fn7gwz
	mczJ/1qa7kljAAgaeh6CRZbQB6wE+FIBBaTL0xoSpaGVVaNT4DoxLt+t7yNEoLAtqQg6lAv4VEd
	xwYPBvxdpe4BsUsTgTqH7LJSeH8khVxvTKSORPBy8GtXXkuL+4/sf0y+eBHJLCShArMx3NHwCWg
	56wg7hZ35PmNks4AqArb3SjjIpK3t4Kdm41gjWv7MKuenMWHmEHqHUEO0LCyjJ6kRIQmxwfO6e+
	E12f1wj9TBfWit2Ic4RZIb4JKSq24S7I1tggWsKw0gO9hnc6imKSlbBXXbiXdT+FrFOv3/barOO
	AvQYmWZOuMNUNd7gLPaiCxCBgvgd/cr5VpiON9wwXwFCOT6k3QnPza1j9lbzPmS8s4w1+sFBz0i
	JzMXzJ8peLAqr7IqZpbthcg1G9Xsb4v/OpXP25m4BUoiFNr1H2Hg6jj83VbkVqIyQLiIALGdL5h
	0xGKWFmuFZ+zOKChyQEfdIb8jyNWGZe4Gw2t0M/7mrH+rhr2cMxQJ9p2Ql1JsQnoi2XoTtcdg95
	t4MTGkYDBkMjUdNNrftV8AQ9chU+9nRJXsMa08sSd1+bg3g=
X-Received: by 2002:a05:6000:310f:b0:488:83f7:6352 with SMTP id ffacd0b85a97d-48e6e2c33admr32579809f8f.4.1793804262816;
        Wed, 04 Nov 2026 06:57:42 -0800 (PST)
Received: from lake ([2a02:810d:d09:1b65:4366:70cb:bf82:f8ac])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fecf8ef85sm4830051f8f.27.2026.11.04.06.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:57:42 -0800 (PST)
From: Christian Schmidbauer <opensource@grische.xyz>
To: Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Christian Schmidbauer <opensource@grische.xyz>
Subject: [PATCH 1/2] thermal/drivers/qcom/tsens: Drop __init from init_common()
Date: Wed,  4 Nov 2026 15:57:39 +0100
Message-ID: <20261104145740.2623473-2-opensource@grische.xyz>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104145740.2623473-1-opensource@grische.xyz>
References: <20261104145740.2623473-1-opensource@grische.xyz>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several tsens_ops instances store init_common() as their ->init
callback, which tsens_probe() calls through priv->ops->init().
init_common() is marked __init, but tsens_probe() is a normal platform
driver probe and can run after free_initmem().

This happens on IPQ8064 when CONFIG_IPQ_LCC_806X is disabled.  In
qcom-ipq8064.dtsi the tsens node is a child of gcc, which uses a clock
from the LCC.  Because no driver binds the LCC, fw_devlink defers the
probe of gcc until deferred_probe_timeout_work_func() runs.
deferred_probe_initcall() schedules that work to run
CONFIG_DRIVER_DEFERRED_PROBE_TIMEOUT seconds later, when kernel_init()
has already freed init memory.  On an Aruba AP-325 the probe then
crashes:

  Unable to handle kernel execution of memory at virtual address c0e1ffe0
  Workqueue: events_unbound deferred_probe_work_func
  PC is at init_common+0x0/0x540
  LR is at tsens_probe+0x138/0x4b4

With CONFIG_QCOM_TSENS=m the driver has the same problem, because the
module loader frees __init code once the module's init function returns
and a later bind then calls into freed memory.

Removing __init from init_common() covers the ops that store it
directly, but the per-SoC init functions that wrap it are also marked
__init and need the same change.

Tested on an Aruba AP-325.

Fixes: 9066073c6c27 ("thermal: qcom: tsens: Add a skeletal TSENS drivers")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5
Signed-off-by: Christian Schmidbauer <opensource@grische.xyz>
---
 drivers/thermal/qcom/tsens.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
index 4d7013fc79d6..710c78aff8bc 100644
--- a/drivers/thermal/qcom/tsens.c
+++ b/drivers/thermal/qcom/tsens.c
@@ -929,7 +929,7 @@ static const struct regmap_config tsens_srot_config = {
 	.reg_stride	= 4,
 };
 
-int __init init_common(struct tsens_priv *priv)
+int init_common(struct tsens_priv *priv)
 {
 	void __iomem *tm_base, *srot_base;
 	struct device *dev = priv->dev;
-- 
2.54.0


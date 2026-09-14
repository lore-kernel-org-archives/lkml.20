Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB63A331A63
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789377293; cv=none; b=Pnxr2r8LNCO2MNWgb0oHP4t9MpHIQPGPHElVY6rPivKv7PJ+A72gQmnAWQaQyGUAUgYejU39SfV9ftntlz6OqWsRiaF4gGrsoobAT6w/54jo85pwsaE08gkrWEfS6UE6Sr5CsNmCHQY00ZXW7XnAjbCGpPCW5s2Xt0stCwDJd2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789377293; c=relaxed/simple;
	bh=GpQvmXJKaX/jCUsCqpqIRB1D9KEM7Tyldr2xTwaFULM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W6hNLK5Id0xqVcYEQHN4gpdTenLoGT9dqyulexLTFfhIHymnGoooIkAx56I3uqKXJKMHTkWcHNzM+5ctxJUw8bgJh0s21xDN+C/SPreHHSNUYpky2nqcyaDS7sfIdhp9HOxBDj0pKMubFnaE6uMI21wSWfSbO1OAWtD03113MbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=DoXVc4TO; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="DoXVc4TO"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-482ea739de2so2024110f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1789377290; x=1789982090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=swXbAXeu7dbjlR8kjOxhq96ObvL9yW1PSiyfjSJ6wxs=;
        b=DoXVc4TOC2HjL/M9ZoRzgwxRkO2/1ssSqaLALgbAeMnlmpuy1fsw3Lgi2LSgsKz0z+
         WpCBric22a3rbE7PSsf/mGYj3tVucy6Z+p41m6A3NZ6kNprbidrLKeyiZoYw0HPbPGRR
         3e+qMEmWTfuVLzzxN9iVD6earjA0vL3S/tEglJ1TY/C3sp9AlTZu89N/IjcWqTcf7K3D
         yjh4OksrgylSOVS9hV8Mg6K3p1gbaayNi3EXtJj8AFcanxHXLY/CdfxtPsBqnS2CQ9oW
         GYjTblpChl72yBvYsA3UMMNH8h9K7lio/i/PO0zd2K4p56S6Sw0RAHxAF14C64pvtm2Y
         oHNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789377290; x=1789982090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=swXbAXeu7dbjlR8kjOxhq96ObvL9yW1PSiyfjSJ6wxs=;
        b=aKEoufKYDmTJiV3Mp5C1x1y2lgwTmsGtsieqxb98vEzlCPC8IwqaKrtrCcHb9p9kgU
         Xg8OxbczQi8jk0uhMK9PFOz7QgDfcotsmr1EINN596kNkrKPyhUrvi8yDdCk6UdSm8Wt
         gQt2WF9SVE2qAX2ZXuRr1sCcQvKfOsmfnqgSZE+vf/4Zvl7bvDVAQcsSXRm4mZGxJFWl
         lWOL/HeVyMaSF2IqlBk6jefdEsFQNAEqRKuwS7ceIswtzmMDPjZzqhn8y16g9JvhSp/z
         kdPzIFftQWWji61lFTHQEw4NpvnnppZL8u2XwrVUv2CDvxfoE3OYkkwT0g77MMRUF/qQ
         UW4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzcoKcWc4IlFB+9t741WaMRlHSgWGC2+q6bOhi832w2SGZ2+uvAQ2SfIyqj9/x5IfZNRj2Zp65wIF9jbEM=@vger.kernel.org
X-Gm-Message-State: AFuF++mJmCOnxgiLi9FqYkkubv2ZzxgW0VZLxEDphyIuVrpcv8aHRDoQ
	VZlavznPkIuO6wY+aBsnR9WwB4KaO5SIqf0t99k/IpMqI2M0UdiTN1/9nPsxkVGM
X-Gm-Gg: AYBFou3hV359guvGmDx9iGO/PVrsyzrfwmi2YsQTCEuCjF/PYLTWcYmoXy6+0hj1tzt
	WMHwgffhIE+T16VmxOSM/0h4R1IREdLaJmgxP7bTz29wnsrIxa0iFMraG9NHxN900Q4PEuYz7C3
	LjjgJ8m+CNuOjv32y7jiQj/m2The+8LzgeJqVW/xQfDEEq+CJ0its9212kKK/MVd/NLCyLiSB1D
	j/8AxqdyJ4/5VrAueMmWmzrDmk1g1UUP968veym0vDbmSFZRjbbDum8c3JOaBemDI1Lx0jOMQ/I
	tK4tOkNNi6jt4BFpEjKe02zuzfum7a6NXjBmbK2atPGDPS+mSP614iT/a+PUgoRI6yuPpgUOpA/
	fUnnnAEM5ZnBryDs8fqrQioWsopTMqsWZEc+fxpqHjxNKMDUknfI7DtQ9dV8fgK7cNUXXxXKJjQ
	3HaDKNaKDJYTdkh8X3FfNltUpCKen6Ejzy/GKw9ud6L/rQvn67JUpzbs8ZRE9rhZTPxnSBwO9/Y
	/OZsUW7u8fsnYX0T/7egwDX6xmiTlQVj1oh+JFm6YXD9JkZ4+LEFsXnFbSiqGpdOBVFOP5MOw==
X-Received: by 2002:a05:600c:a08:b0:49c:fc6e:a3d5 with SMTP id 5b1f17b1804b1-49e7a66cb16mr18300495e9.20.1789377289815;
        Mon, 14 Sep 2026 02:14:49 -0700 (PDT)
Received: from omarchy.lan (p200300dec74de0474f67e4b61f2de2c6.dip0.t-ipconnect.de. [2003:de:c74d:e047:4f67:e4b6:1f2d:e2c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6aac22bbsm154490965e9.0.2026.09.14.02.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:14:48 -0700 (PDT)
From: Manuel Knitza <manuel.knitza@googlemail.com>
To: junjie.cao@intel.com
Cc: miguel.vadillo@intel.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	hpa@redhat.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manuel Knitza <manuel.knitza@googlemail.com>
Subject: Re: [PATCH] media: i2c: cvs: Get the wake IRQ without claiming the GPIO
Date: Mon, 14 Sep 2026 11:13:51 +0200
Message-ID: <20260914091355.148477-1-manuel.knitza@googlemail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908105717.496232-1-junjie.cao@intel.com>
References: <20260908105717.496232-1-junjie.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tested-by: Manuel Knitza <manuel.knitza@googlemail.com>

Answering the DA16260 question you asked in the ipu-bridge thread, and
giving the tag here where it belongs.

Dell XPS 16 DA16260, INTC10E1, ov08x40, linux-ptl 7.2.3. No spk-id
conflict: all four CS35L56 amplifiers bind, no -EBUSY, audio works.

Note what that does and does not show. I am running your change, but as
a DKMS copy of drivers/media/i2c/cvs rather than a kernel build - Arch
derived configs cannot enable CONFIG_VIDEO_INTEL_CVS, exactly as you
described, so the Omarchy packaging carries the in-tree driver as a DKMS
module and applies this patch verbatim on top (omacom/omarchy-pkgs#418).
So it is a test of the patched code, not of the unpatched driver on this
model - I never ran that, and cannot say whether the DA16260 would have
hit the conflict without it.

The rest of your analysis matches what I see. With vision-drivers gated
out and the in-tree driver bound, the graph is as intended:

  intel_cvs i2c-INTC10E1:00: Quirks: 0x7a (VID:0x06cb PID:0x0701)
  intel_ipu7_isys: bind Intel CVS nlanes is 2 port is 0
  intel_ipu7_isys: All sensor registration completed.

"Intel CVS" sits between ov08x40 and Intel IPU7 CSI2 0 on
/dev/v4l-subdev4, the sensor enumerates and frames flow. The
manage.c:1502 WARNING from the out-of-tree module is gone too, since that
driver never had the IRQF_ONESHOT issue.

Thanks for the correction in the other thread - I had claimed there was
no in-tree CVS driver, which was wrong.

Assisted-by: Claude Code:claude-opus-5

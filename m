Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5B02E7391
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789372487; cv=none; b=stXaKzWSsKy29YHgkPIEc9111+nEfDLBTwtduHgS68jkxg+F7wAT6V/lYz/cyAC+WcnigJ2kBkrXkFt9cXm9vwrWeh0toi/fyWoQ+qvsWiamPvFOBi4dCSgwvMKhmh/vanWhrXeturqZbDZCbRCxZdmeX6gBpvDQ3C0Mb0BEXwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789372487; c=relaxed/simple;
	bh=GpQvmXJKaX/jCUsCqpqIRB1D9KEM7Tyldr2xTwaFULM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jk95xT0COaVqXwFFneQCl/w4JZku5k8uSp+6oydTlhUz8GD4W9kJFQ+W2kdwX1s27N3shqjzLo9MICFU7g4r99h6Rg4c1GLl9fzOw/Y+m94AdzBdTKpT78px2micK90j4qPCMTDgLLegSRJo7906bifYIV7rE21ETNHET2w8k7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=eCZ6wa9T; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="eCZ6wa9T"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6356f6bso1352306f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1789372483; x=1789977283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=swXbAXeu7dbjlR8kjOxhq96ObvL9yW1PSiyfjSJ6wxs=;
        b=eCZ6wa9THSMlsxUcY/gR/KKTgpmel4mKetzFzUKhIygHsqUabUti9XUcC6QMolrF7h
         ygHAAnInXI3EbK2j8EiStXpxASR62su4B1PZDaD6ImNMhUWgMVFh3W8z58YV+5Z4DBi9
         DWO9dvXBWWdyWoylfpMl8/CxkgtWyWBvTxIc/5UQENkd5FnfvAiX8zJRiUusB5U8SvtP
         4nHrAhcHdMH9EH4qdagcaJxN6+BAlg698heIWbnY5+u2jXASkQf2ai3oUSyQ9rxm6OpF
         +uT8RrehQPbMbCL8CND2T5YODyFQjwlKXjYOZmSN1bV2m1NKVR0ppxgle8WSlQmx1vYH
         /pmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789372483; x=1789977283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=swXbAXeu7dbjlR8kjOxhq96ObvL9yW1PSiyfjSJ6wxs=;
        b=FAgCYkkjOFUKKmO6wIsSMuTo9/W54caO8qZqK25V8meoLIEt7QWBrVcEEIUx6SMMN7
         BzHvx5K6yrS9jUvh478+iGDvhJeFwCSXdyuYoW2TtEbUzicKC/y2ntj+/XrBS+ph7ub/
         hYmWCrtNMH0J0M1DbFSB9GY6I4ah14vxX+UZoFxBckapuYF3/LZUgBd3X3wM+/aKe+8C
         gyK3jvkZzC+O0SR8y4RQksex8rWBc2+211+h+XwjGtG1Iqb6VtQJ4mf/F3MAa8vTCeVg
         UZK6KBa7uIqzxjGP1UMmZi3NLQqQJC9353Hvxx2x8OVbcMsNvY3p0JjnLjnulpmqCETd
         oC0w==
X-Forwarded-Encrypted: i=1; AKwUvBwwPfhA3LXyI72yhuA819ml2JZ1ZhnVkvoRl2Q0z9SiE4S8/dip4hxb/pUEYtIKmTbUV4iE3h6hkT/0mYA=@vger.kernel.org
X-Gm-Message-State: AFuF++kWHY0dl4yBZUjaqdEHtFIeNN4f+YqoB8/oVm3UO+GOBh81E7jG
	7Z1ZvLoc/liOW/hlAFkwIkf7WKfmWy5xjWrghKztjI6zxTfbgeGJ9/ZN
X-Gm-Gg: AYBFou2Y/Vc6uj1qX0yjOa+BBP118US5/TOpkYRfkf38UCVOY31eocQXs0sI0YUVWmD
	0M5QVzHIh3NwC4aUYi13qzF7eS9G5h1zX9+Ook9B08ShBxDvwkepwOjcpj2JP3L4Voc5M7Yc+to
	s/7JKoMNXl6ksGdGyxHbdp7tCv+PsasF0TDLmicPai02EQQbVeVbc16LGBlVV97CDmLklwdRM9L
	+U7MyFx58HQ2KMDKHQYKi7z8HW7uD+J6jvQl5ai77KzkfVH5qOODvzuVg2LJ7T3Ny1hKgPsEdcG
	sn5Ee7A1S5zzlXOwnERNncZwc+OW8NANdfzqKdOsUz+uXikCDvP0WHXGGh2nEvafXc7B1e5C3YC
	S5RwgcRBS+XsS5Bv1Sl9NwuXYGsKcEBFiiI6f6asrH+AScz7qM1SpnLth5w/7zgNlgeO0L11L7z
	06jPn4/mc9sgXIauDsHnAkpYr1jbnGC034dnmf+3LXGvNX63+f6TWCTWG6fw4b+Ds2GekQoyULB
	hgbT4IZ0I9Xy3lglbkhDDXoWhWB7HWE/lzWogT8KpydhheoafZQDDrD2ScVUkoeZrU5kGJQhA==
X-Received: by 2002:a5d:64ce:0:b0:484:3314:eff6 with SMTP id ffacd0b85a97d-48702b3ce87mr2771348f8f.28.1789372483452;
        Mon, 14 Sep 2026 00:54:43 -0700 (PDT)
Received: from omarchy.lan (p200300dec74de0474f67e4b61f2de2c6.dip0.t-ipconnect.de. [2003:de:c74d:e047:4f67:e4b6:1f2d:e2c6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb35f3d9sm24224096f8f.35.2026.09.14.00.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:54:42 -0700 (PDT)
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
Date: Mon, 14 Sep 2026 09:50:43 +0200
Message-ID: <20260914075354.38975-1-manuel.knitza@googlemail.com>
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

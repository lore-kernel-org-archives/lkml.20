Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03EFF39936D
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790664970; cv=none; b=FdiF0dM8jwUbJz6rQTBehMpmUlLqXCk5B6M29XegA808d3/m5g2xA0q1utPEU56EW3/T6OW7S/nIQnfGjMexRW5zQMpVH3UwBnxBjrVKkrwsXoMOMu+ZqX6cV9+rj1Y7CfKFpkyxs021MlbLXnpV1l2SOzecl7J5b/U06y6eiNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790664970; c=relaxed/simple;
	bh=4pzOI0dqfXOjphwaIy4ajDJicrR2uXepG+CBQhlx9B0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rOl5R0J4J/+ZMoIuUxJ6olXfY1AP/drVBipevrScB+aOKp47l5ssu+HMWTUSmZtb4WJwwQG65XzUllC+sRJ1ovByorhIwXq+VK4qxlS12nknnIWZhdwe0omElGYDK1TgB0Rh205QMU2ByZGUACH3haV2sK4AxW46QIX1RhUVleo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rdgcsq2j; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rdgcsq2j"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so23530565e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 23:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790664967; x=1791269767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4pzOI0dqfXOjphwaIy4ajDJicrR2uXepG+CBQhlx9B0=;
        b=rdgcsq2jogvyYVZ6AQUJuQZ7ogp3Pn9kGrMmAqsWTpRFGDI4Jv2mUqqZIASe2CysIJ
         BmQqzYrXjZ3+buCrKXJAVLFAxLxAYCk++M9sIkjqmMPpiC0zzeB2uQKl3b2w3O95jsn1
         RBm1qb0ooMqofVoQ3xsiyaarS44YfDo94q56L80kPp1z7HG496GrU4A88Lf+oeIgFWF4
         zw1pizGoaF0Pwwp8zducgS7ZwmEnWRYle1ZbCxrCtdJERi8IMxGA7gnLa4Xe4D/y37OZ
         I5fuXLd0Zt0o0sR+RMXRVoUCwrrVgyuD52fALJVM69WSTPZ9unI8dbuy9iqxVVMF4xUY
         WW6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790664967; x=1791269767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4pzOI0dqfXOjphwaIy4ajDJicrR2uXepG+CBQhlx9B0=;
        b=sg3wnZFg5StiniHGofLIdbpbomprLG8Lgd2jr5d91717t4M1wR1fcSoU7RMoTwQQQY
         DGuMdrBrHPBbMyzOF5i8Ww4Yf5kBLMRQy9i3ilYgWsbOjHxnBrLhex/WA5r8PPHcWfj8
         Cmnb/YS7pjnI5G5iAQpELxPDuHD0rUBQLKMIiM0wIge1mHktJx2QOamg0WEjk+Qs/h6P
         1sQhVjBNgzfhEOdixT8iNfqPZVWeeJJFKcxZzbTeDO8IUA8CQDrv7j8nqZBYkyrQbAaY
         G/tJSICvZDevOAwSKmODwrpWqXFJyd669J3sjma8AG0EzsOTyyvtTV5I5TIVF30sj8hm
         PCyQ==
X-Forwarded-Encrypted: i=1; AKwUvBw6DejTRSIvEIYLbevANL5l6G5jB4JMFugWQKCSQ9U0SdS0QpPI3jckAE8ceRXTTvXHqB/V0LmR2uYj8wQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nNgalVPIP5G3BqFLQIMdQ3gYj523VSO2KsHx96Jc2IONmnHJcC
	98HhisuPst0vCAC8om60a5iIExuQ4IsE8twUN9H+cXK3rcfPK0LH+nd6
X-Gm-Gg: AYBFou07viDivmUnTQDIdVLA4f24/4XHOHIAL+72c89EzrhTD7kokNgRYIKWbV9iH3S
	6bh/nKgloCgUBwlXAtLxBbIRcluOuXoPG63oIHZ6dMd8NPiFWKVs2y1i3JsSkgmn9liGtsQ+Xnu
	d5bXdiwxaVZLcNGhEl3md85V1mS1Rdrbxo8JkH4Sq7GV8DVrVF0faC3RuK2DPtD5uBNV1+StUmT
	yF67nxCTUKpOEXo/QQHdG0t6veQvlOlKdehQ+TPwTRo9mHQN6p9qU0sNZ7jaUDz91k5xyjU5slI
	Lri/+nRa/FRB1LWp63/34jSFMsnIH2LwHbN6aUssoWOdMEWyF0Rf984pN421+WolPd1e8MINuDu
	P6lhrkOeZz9uQuF+vew5Y86jD9Q2uJVsPx7kK8cM8xQCUC4BV4/VRPThrVScKVkveW8//VfxdKQ
	2FLfmTORE+gv4673EYBHaj8RH7SHEkcr8Cppr2YSk69w8xpTNHt9LGU0WckkH/86QHoJjTjwcvQ
	w21yOctjwF/cKN+RsT6ThndztGBGk2xhACBsdKpU/OEEAoTZdqTCpLPxyfYDX6h+WzKkEN3ubDA
	erwObwhutJkvWRNWP/RyL2bc+A/u4C3aAsAFsme4evKt/FRD05CMaeQPx8/DFD8SMi7UVytXuKZ
	Cm/k22rkf/5FiEO+k
X-Received: by 2002:a05:600c:c4a3:b0:4a0:a34:f6fe with SMTP id 5b1f17b1804b1-4a00a34f7ffmr46104355e9.17.1790664966699;
        Mon, 28 Sep 2026 23:56:06 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9c32-f801-0451-cc94-d3ca-f56b.310.pool.telefonica.de. [2a02:3100:9c32:f801:451:cc94:d3ca:f56b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af507611csm1570357f8f.22.2026.09.28.23.56.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 28 Sep 2026 23:56:06 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: sashiko-bot@kernel.org
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] udmabuf: respect the device's maximum segment size
Date: Tue, 29 Sep 2026 08:56:01 +0200
Message-Id: <20260929065601.99518-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260929060028.371041F00893@smtp.kernel.org>
References: <20260929054835.94118-1-kmehltretter@gmail.com> <20260929060028.371041F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Sep 29, 2026 at 06:00:27AM +0000, sashiko-bot@kernel.org wrote:
> On architectures with a 256KB PAGE_SIZE (such as Hexagon or PowerPC), this
> new validation evaluates to 65536 < 262144, unconditionally returning
> -EINVAL and breaking all CPU mappings.

Right, the misc device has no dma_parms, so it gets the 64K default and
sync fails with 256K pages

The misc device has no real segment limit, so for v3 I'll give it
dma_parms with an unlimited max segment size and keep the -EINVAL for
importers that report a limit below PAGE_SIZE.

Karl

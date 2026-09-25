Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F67520B80B
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 20:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790366563; cv=none; b=Xsx3eog5+CdxQe9t7F9xua2T6d/0ByLhPnG7keRdhoMu/JkEqbu+Xgm77QG8sAwgxNnf6nJI5c+zrWGSkAf65VHNywoO0S43EfG+ufNHI9UgOMAUh6L2LXR4kB20UuJqV2F+OL3SGXqC2eafB5ExFefSeT1SikfDTShoeRfa2GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790366563; c=relaxed/simple;
	bh=fH/v0xQwVL8zAl8eE3jm1Pxc6yiD7bQawrdos1k8S/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pzDJW/kSBlCObZx0iqJ3d3t4d0oWvPsV++GFqnwioBf5BhTL44FwwRpECn0ymXnjfEKr4KuB8dzJwXWAQdlx804Xozh0lKz44QEO6adJRi2dPybYue3gRZVi817TXklNltvCXTpKDeugsn2tjEALoQ6M91yvMr14oXSCkzCQl4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZZL8YUY7; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZZL8YUY7"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d822dso9403965e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790366560; x=1790971360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fH/v0xQwVL8zAl8eE3jm1Pxc6yiD7bQawrdos1k8S/4=;
        b=ZZL8YUY7cE/Q1bL3JIJA2gll/9AL2xJwPx5aYDtxYgFQezHmUeXpQWAsuMkRyNfWkS
         yBpo45ZCUItUwwnj8hF4Qw0UgCsAwjVX+qkzEG8JWbDP3Z9UcpHGxQ64+X50MAXSL2xK
         Kdk311uvKQRGIsNdQaBpaBOeDBgP5dn4PahwYas6pT4JsZJESAn9xT2HSWCaKd1GYL3O
         hTM/5/PziFQmq7T7jlDlMFI8lsS/ZneLulEuwfYRt+4N/QU3NOu5U4kawwZhxdT8w85C
         5jiXN2UrU3SnxFMHiZOKyv/hpavRyDAKtz8LsgEnxcg/kShec1L2Bbupd7LGIuPY4H0o
         2/KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790366560; x=1790971360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fH/v0xQwVL8zAl8eE3jm1Pxc6yiD7bQawrdos1k8S/4=;
        b=K7jbwpR11eX99UTQmO+iIptOG5KEyTsgt86xv/TvS5ar2aOYAqx3l/2CVmT0vN+RTY
         9jUbrcIw78P3fBxPGxXriD0uOEsCy1G60Mu1w2faQbOPhEP1RvK/8J+N9Jc394cHaOEU
         mvcGGgrC+A9qc9N1UszfCBhb0niCTT3n2ndzTlxrCRKMfdsPCdlQPSh7hJyoUS8tCydw
         nZ0HI27yMNMR3+VyNzdKulWr21k3CwXR6sAsRpfUSWPSiIlP5G2glm+6tY40lLaLW7dc
         9t1ihjQteapFHWXXK4YhBUOHtaqAG1kkJJHguTe3GSYNTzr69Yr3OdVYJAunEF+SkMR5
         MIfQ==
X-Forwarded-Encrypted: i=1; AKwUvBxROYsyM5E4kkKsIoWFTFrmzNq6FfDZkOtRDP/TxpKxqitH8ml0xq99sP1lZAdEYns6pQu4K20gOI2ryvU=@vger.kernel.org
X-Gm-Message-State: AFuF++kppweemGisZJUkIqXbUH5oX8S/+ZupuVrGqJjuwLpuIJW4bYBQ
	PdZjAXKBmrGGgPXtjU71tp9cM2cQBSrXpL+hhToOrMseDeV9Nq2aNnBF
X-Gm-Gg: AYBFou0Nh4qEGY/6NA+VqhnF7kxDeKTpoz+n2tYshQYqPF+BObmQ/lSOQvlPmcJuBgs
	zysQyDNRgaodp7vpWKM1tMXatdZsYT+9178rW0F/i7IsdZQQB78Qg3mNsGskd+jA4CLBz69WCm5
	stASLxsf2Cx5tC9QmZqxMyLOEv6tz4HPWxuEUG6PnKo1GH9+3yQsCJU4BGQOHvVU7/dlVQuAWFs
	9vJUhZA0Dhpd0YSRaew7WeLRkoINcUPSlKBMgYTwC8urfvUxRXS3OZH3O2uMLNjFLNlZgmhkFU7
	z1pH3GSqPQpMzr8Xz2gLZ0LQBgRUmSBtMOlaq47TCseWb0uPwPdxp21xt+pdPW6tENTt/sTTCWe
	cat+4cEQ1wB8irFLBAm/tYp5Dm9KIw7WZ8tcoL27zZ30FvJqmar2jIVWzMM92MtrAeJZPJ2vbOD
	DXD15mx7csZ1wYGBd5YtQqAgWnUNHFJO4BlFWDI/427EECwAvQ2gG65bZ0vryvh8Uhatd/piBIa
	0Y0Lv0Y77/G3deaOTZCLKTVCeU5aU9ShNocdoRW6V7UoNt7m+A0HBD6g4yYU+PS
X-Received: by 2002:a05:600c:46cb:b0:49c:dada:30b7 with SMTP id 5b1f17b1804b1-49fe7b52f06mr110563725e9.2.1790366559601;
        Fri, 25 Sep 2026 13:02:39 -0700 (PDT)
Received: from cachyos-x8664 (159.red-83-38-226.dynamicip.rima-tde.net. [83.38.226.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff285550asm51693255e9.3.2026.09.25.13.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 13:02:39 -0700 (PDT)
From: German Pablo Lindo <germanpapulindez@gmail.com>
To: lsa.uz@pm.me
Cc: andre.gilerson@gmail.com,
	conor+dt@kernel.org,
	dan.scally@ideasonboard.com,
	devicetree@vger.kernel.org,
	germanpapulindez@gmail.com,
	hansg@kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	robh@kernel.org,
	sakari.ailus@linux.intel.com,
	sashiko-bot@kernel.org
Subject: Compilation error in [PATCH v7 0/3] Add support for the Sony IMX681 camera sensor
Date: Fri, 25 Sep 2026 22:02:38 +0200
Message-ID: <20260925200238.12765-1-germanpapulindez@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923211816.89954-1-lsa.uz@pm.me>
References: <20260923211816.89954-1-lsa.uz@pm.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For this patches i used Cachy os with the kernel 7.3-rc4 both for compilation and applying the patches

After applying this set of patches, a make error popped up every time this patches where used, after testing i isolated the problem to the 2/3 patch, this problem seems also present in v4, v5, v6, v7 and other camera-related patches as https://lore.kernel.org/linux-media/20260918221705.323510-1-pm@petermarshall.ca/ that adds support for an IR camera

I do not know the cause of the problem and may be fixed in the future, until then, i wont be able to test this drivers

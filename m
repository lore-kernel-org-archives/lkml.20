Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926CD2FDC20
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 15:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791301015; cv=none; b=JXsIB4C1R6/L0gjuRXCt4sJV5ghSVeq80jCgDoLZcXstM4hxwl8WRzu1ZoSirj1Ay8gtKVLcKNxxhNPNHqxQzi+CdF6kvraVYUIjc8YyBgyb4suMOhijbiKdP+g7YEkgFaalODEbiF8M5uy2ISYw8InJLd0H9KIZ6GvvbldMrz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791301015; c=relaxed/simple;
	bh=YgIV9R8R7lN3e7PO5eiRn5CtkNayP6wx8pWhx3zR4kk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rcCjMHgdGbro9QAA0/KsZyfdmBYJqfywgDfi1RXqxbjIuPILDGI8clOGotIwgqIWKIBj0wZebphYkOavsa8I7cEY++Sh3d+vVz3dyZ8iryQxCYIPL/4Cm9gNZEVuX7Ds8EWxJQG7NQ8hJHkJ1IpFpFN+ELNbtFL5WTM3CSL0eUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NYniTAiR; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NYniTAiR"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48bbb06e746so1607677f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 08:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791301012; x=1791905812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qaQeSjk9Sbx45aXo0TjHg6DDwFZBLFYkE2gFb53/iBY=;
        b=NYniTAiR2p7NHJBHUsxorj0S5Y5st5qHbhqAr6RI7+29bsn22YS23GFj97zlorO/bA
         OxY5cuXERqdkB11KikqXjAYPTqtZO827pBoNe4TJAGth4lJPBLSfyzhRtXyngyD6XAwC
         znqFfHLuufEYoUmYPc4To5YRZhUu39Uk1/45vuugNK20fiPmG70UuwL/j4IPZIWFsTdL
         K8zPeTyYX4UWy7xSFrMkt/yOzBSc7yurYYQf7nwsStFFV5sxH8k8Kv5nqfkYWeMV19QE
         /X/GpLNBAtRC2bdTFmiqzd9KiGsw57JAFZIPhlf7TcnNwUP8XhQogQzDEtmgi6J0gqyC
         a/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791301012; x=1791905812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qaQeSjk9Sbx45aXo0TjHg6DDwFZBLFYkE2gFb53/iBY=;
        b=JZpMaVON6H+diGRLoxs4Y8wFT1UaIAzS+719zR9iHxkksBdeeK3XgMZKSumVcwd9kR
         qtZGWpuZS+B4nL2c5lZFmy7LccX0U/q9ySZeu3ra4zKMgMgQCR2rb980qQIDbttpk074
         Rc0nM390zLq8gkACPYVJsOPPc7VYsNJHIsaGOBDAyIZrmoZ2awnd+ZMQlA06LnQih9Si
         l897H3BrCelbsDnms581yJ3rTevYaWY+zuldjtt5iK5rIYPxAih2RZwlg1yDOOk2H638
         kBP+uMkPDOUJXA5+QizGMM6BvnFBusH/UT7ANUihsuH+2MoZZkqynJSwdXtUVvzCdgxL
         N1Bw==
X-Forwarded-Encrypted: i=1; AKwUvBznucfqi0rQSRDEln7vLxwvPc9XC0pe8Rx/yvG6lEdJ1aGGlAf2k9U8NoMYqfb8Hd5JmikUlVdfRVI06aQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJtMxovj1Qr+x3pLLE9IAy1oeQ3oMsxA1mHToEZveSkzcUkv6lE
	05Mztzvaz+RSVb/HFz2dkQ+Vmo9xzp+1RJdSYPmm90cHzHqWyx5X26pJ
X-Gm-Gg: AYBFou35uli6F0qyzjlgtJaUYPWXPBcfNk8cUH9H9YMRYRAyGwG7uUBns/zGl5ZalJk
	voqPkwWuGxNcqOxhfe8BKtL8MZ05NqFZ0crvCwrHydo//orUlK2+e4S1vxBYoE7HuvgK+eM4tQx
	GR/T8SdwxMr6DJeyKB8bZQVp1OXg/Rh1Xh5ZHk3ijlPIvEzM3l/w8sFZLtFmyE7tkeGNsx4JCsg
	GKYLvTGUPIACwfNZOQNyCFkDxYL+xS1Q4pqTISQh7AIS8B0AZU5Vi4TMPBkFYCjkpOAKpi57HT3
	3gklVpXAcvW9DW4eZkrxbw1og/QlkgAh/47m98HPUsJJ8eZ4yMG1OsCan36KWkqsvgr0hTtYRsJ
	/v2appeel0GrSvF4cSRmq1vVU4ICyyP5bS6WWJyG/b3w1++XniMyWX0VGAwsxRirIwUmSYOxYAd
	Nk2rNKqPyu5iLYkWxdRWDVI2r0owZIn6C8oBSjGw6KyJm+ZcWvFe/7BZ7qv/0sPSi1sguk6YU6f
	EYih6O7Ngmc1aF8XAM=
X-Received: by 2002:a05:6000:3c7:b0:488:8a3d:b58a with SMTP id ffacd0b85a97d-48c4801b97bmr19026243f8f.53.1791301011482;
        Tue, 06 Oct 2026 08:36:51 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3b502sm243489f8f.52.2026.10.06.08.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 08:36:50 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/1] media: i2c: mt9m114: Add get_fwnode_pad operation for IFP
Date: Tue,  6 Oct 2026 18:36:18 +0300
Message-ID: <20261006153619.304520-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, the driver's binding exposes only one endpoint, which maps to
the IFP subdevice's SOURCE pad. This configuration causes failures for
many devices using this camera because both the DT binding and the
one-to-one pad mapping logic map the endpoint to the wrong pad. Fix this
by implementing the get_fwnode_pad operation for the IFP, which correctly
matches the endpoint to the corresponding IFP pad.

---
Changes in v2:
- adjusted coding style as asked by Laurent Pinchart
---

Svyatoslav Ryhel (1):
  media: i2c: mt9m114: Add get_fwnode_pad operation for IFP

 drivers/media/i2c/mt9m114.c | 39 +++++++++++++++++++++++++++----------
 1 file changed, 29 insertions(+), 10 deletions(-)

-- 
2.53.0


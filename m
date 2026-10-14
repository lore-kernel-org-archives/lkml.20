Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB05449992
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792005302; cv=none; b=W6QdkbOJsSOxgwsd4hVViBc0oyFjWzaOirYGYqnGRvAzMQj8VukqK5YJgexqCiuXqxficqfu2btzM3gaLqu8YUAreMXjHuqBxh99UlTfxINmqdlWN2J9UIU6zXtCanFeVKpWrEHw45m0tlIFgu612r8ndWwf72tiRgkpGufken8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792005302; c=relaxed/simple;
	bh=4k5R6X+967iEiVHJkSfqzFjyA3rQIAZllOrkBNBJbyU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h02ddtkQoS5eT0HrdUXnNeTPw/IFmkiiS11r8gj57qTCdQs//FQtl0kjy72H/eqevw8boWzwk598HsltAID4oLiCdyeEfGwdvR7eUoVZB3zuEKrYHUIVfV5Rmja+iuIvRq1pz4c1BW6IY4YxW/BCZOY/ZjdH9rmnPJ6ji+JI/v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=OcneHf+u; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="OcneHf+u"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-15168a20b47so2953943c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1792005300; x=1792610100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uJX9tbrkxLissc+elU21oJkG09TSA3mjb5IfMC20d2I=;
        b=OcneHf+uVrN2PniOVGTPhkY3Z0eGqcVVK2/1+2YGdsU5EFp3iQUbRKFGMG6u7XELMd
         D5rf0UiQCo0xaEsyLbMTQdRvCvwuanR88ynlmrIDfRHezcuKeeK1sft8ZBjHxTRtUcuM
         XhgNgoq40jc+7rz9vNo24OazDmy+kv4uPBwuW0JO8NwgRs8oQFDw+cQ9gLx45LTJvnE8
         JlwsT6T5sNZVAxGc3JXdlA19v6f+GPXWdQv8mWL4GQX2bgxzqPNzy0YqsJ5PxnEpjLIa
         J7UrvRSQfWkjkmH1F39PJTeOXoek92eddv9nIG9n5K0DuUD4ascZCw5XrDr8a2vVnJDU
         7tEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792005300; x=1792610100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uJX9tbrkxLissc+elU21oJkG09TSA3mjb5IfMC20d2I=;
        b=ZCVVzx7pc4GicsKExnZnwNhNN72tWXwo8e1pN1HyWwxHFS4w0ucMnRddRfkqzBlRiA
         XdyhTxTWGocBXH166Ebs7kspv6gWcORPCbZ74pLXoNIJ6OPvor9KHDNvxtWpr9kIE1C2
         kwOXf+SsCShy2trsB1ugDuipEKCTZzZb/XORkdFaEg/tESJquWiRnbV/hxh3gpx8xzuP
         xVegioXTMjNn5Vb/nSmJgeQo1NC/tRE5kry2gIcCdEZcvaBhIgG9cwmEeLbF9qPW2yhy
         RcJJqmAII5zMWoLNa5eq77pg+8Ej7SPEJoAPzIs2xHmM1wD6WCH4irTESfwq4MUFy7qX
         mHpw==
X-Forwarded-Encrypted: i=1; AKwUvBzyRRqW4I+Iy5kDNZVlRfWeluoV37zPfdMjRihJAZSWe3OQl7ibKnan8y2c9CI/wZgYwzxtwKLvI36VGvE=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+LH0F8gHhA8kmwl9C0VpOmm6mIggAwFRqezhDhAacTVKzbtEx
	fuBASH8UWVAY35cChOxOhyzknikCgqMvnh0iuA7fxe2+slSeuAeBibFS1LyvWapT1Sw=
X-Gm-Gg: AYBFou0701iKRUU+ln6mwsC8mf8WITligLjtht5l/MTHhWLQMouGkFR+MI22iioNYtn
	Ef91WgfAYnAjwSXlu9WGYWNhGcKCeWTWgqtlj17WGpGp+f0BOR+iOJOVERY7LJ7gHT8+g7sFMHs
	aKIaMm89GsHiJzVg8J7yGzKxqWHT2LCWeCC5JVd08/nnHuHp/EG3IfwTapywpd6jtBsCAdPogl/
	Dv+qI+IUXiIlMH0/Psi+IVuAmAj+d3L7uNhZlV6MxQ2yGYYT8G5odacZby1Re/nrgzA/zF3x+my
	RiDeEtsMWZlaN6a6LE2aCihyvTuyr1/oPWEO/4FfjoNgI+N2T7ZFeYy0UYNUzpACy0OaTmtJODQ
	eik6X2XVpANKqjx6uohNwFHWZNul1u3NtjtCF2PgpvsKCwSk8AjCk1RQrOQ29kBA1b5JqQGLPam
	IdkFjOK6J9FfhNwE/0Y8jj1pmymnmkoOLfbHeltCEyobmzUH1AeLByu54sCSG3WTWE40uav4Ur2
	PNYXWtluGIDurLzvXJ6sw3PRI+d8RNNVrZQEFvQpZh+TVDOD27sabdytqMuwrNJb3mvbdo=
X-Received: by 2002:a05:7022:297:20b0:14a:8df8:56b1 with SMTP id a92af1059eb24-16a5ef28a5bmr20711674c88.22.1792005299739;
        Wed, 14 Oct 2026 12:14:59 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:39d1:d8de:aae7:23dd])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16997c21ff3sm49019099c88.2.2026.10.14.12.14.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 Oct 2026 12:14:58 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: abdun.nihaal@gmail.com,
	christian.gromm@microchip.com,
	error27@gmail.com,
	gregkh@linuxfoundation.org,
	knavaneeth786@gmail.com,
	linux-kernel@vger.kernel.org,
	parthiban.veerasooran@microchip.com
Subject: [PATCH 6.6.y 1/2] most: core: fix resource leak in most_register_interface error paths
Date: Wed, 14 Oct 2026 15:14:51 -0400
Message-ID: <20261014191452.23814-2-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014191452.23814-1-artem@trailofbits.com>
References: <20261014191452.23814-1-artem@trailofbits.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Navaneeth K <knavaneeth786@gmail.com>

[ Upstream commit 1f4c9d8a1021281750c6cda126d6f8a40cc24e71 ]

The function most_register_interface() did not correctly release resources
if it failed early (before registering the device). In these cases, it
returned an error code immediately, leaking the memory allocated for the
interface.

Fix this by initializing the device early via device_initialize() and
calling put_device() on all error paths.

The most_register_interface() is expected to call put_device() on
error which frees the resources allocated in the caller. The
put_device() either calls release_mdev() or dim2_release(),
depending on the caller.

Switch to using device_add() instead of device_register() to handle
the split initialization.

Acked-by: Abdun Nihaal <abdun.nihaal@gmail.com>
Signed-off-by: Navaneeth K <knavaneeth786@gmail.com>
Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
Link: https://patch.msgid.link/20251127165337.19172-1-knavaneeth786@gmail.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Hi,

Please consider this backport of the fix for CVE-2025-71272 to 6.6.y.

The code changes are identical to upstream.

The complete fix is already present in 6.12.y, 6.18.y and 7.2.y.

Build-tested only as part of a cumulative 6.6.y series: x86_64 objects
(allmodconfig, CONFIG_WERROR=y); no runtime testing.

Thanks,
Artem Dinaburg

 drivers/most/core.c |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/most/core.c b/drivers/most/core.c
index 5d073b3d2796754d278e4de84de0eb3bf43dd8d0..0fbf06d34e0b968e6444877af981322a3793d406 100644
--- a/drivers/most/core.c
+++ b/drivers/most/core.c
@@ -1286,15 +1286,19 @@ int most_register_interface(struct most_interface *iface)
 	    !iface->poison_channel || (iface->num_channels > MAX_CHANNELS))
 		return -EINVAL;
 
+	device_initialize(iface->dev);
+
 	id = ida_simple_get(&mdev_id, 0, 0, GFP_KERNEL);
 	if (id < 0) {
 		dev_err(iface->dev, "Failed to allocate device ID\n");
+		put_device(iface->dev);
 		return id;
 	}
 
 	iface->p = kzalloc(sizeof(*iface->p), GFP_KERNEL);
 	if (!iface->p) {
 		ida_simple_remove(&mdev_id, id);
+		put_device(iface->dev);
 		return -ENOMEM;
 	}
 
@@ -1304,7 +1308,7 @@ int most_register_interface(struct most_interface *iface)
 	iface->dev->bus = &mostbus;
 	iface->dev->groups = interface_attr_groups;
 	dev_set_drvdata(iface->dev, iface);
-	if (device_register(iface->dev)) {
+	if (device_add(iface->dev)) {
 		dev_err(iface->dev, "Failed to register interface device\n");
 		kfree(iface->p);
 		put_device(iface->dev);

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794330175;
	b=5d0W7rE3b2NvFhU/jg/VhlnVpnRsWcg2Mfjdskk9gGaPfLf/06JmcKJh1rnRDBNnpWmX
	 I1hQ3jmcdkzcmIMAmBx6Kfs9xA5zHz97MbDQvGecrYOB/7Ma0tHn/pUR6Ato6giNWlLNj
	 2saQVt7hpdDDDv+A97/Ntdr9p1ewEcER9PkttbpoYZeN/qMO6X5oa1sMRNFpalR9BD+vU
	 v1fXKfrTFdM2xECf8/hwos3/TNMA5UIchhYcpAJW+I+fnQG1r2+OiFAxsdG7ZErCXAGtw
	 PI2oPR/q31P3Mj5cJJUWxZFe0XUjWe73EEWRm1EVGP5WtTAxqfzLALdBVcsHperW5gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794330175;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:To:Cc:References:Subject:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=ozoC35JH09JXF0SoFXDETE/OXFxO44zArTqmVJlRrnw=;
	b=ZSIp6RZH1dAx8A7sonYkLN+/2QjQtw1OgTlHjdnzwo90xM3bbjMVNHRlLAzDZNFyL7rN
	 IPNkaVaS6E+yZZEfmkQZzRo6n3pTcSyWUitrHvbkcoXC65E0uXme8+/ACRGZ37KAtL3BI
	 hjFbzp0zqWEVlho5J/J4DNK6kRfte0mltH5TZDPkGVua3eneeRKUQW9rwgEoTjjkPZqqT
	 hJaBhsfrM2JDJIkSVhoAS0wVl65gSm/7ZO2HBjCdSjhLR6o1CM5sqeCvcshDMsguviDkv
	 qnCuBkdZX4Ex3+6meHRJB6GR/BXjdqgtZbsFu14IrsohcjeE6FrstwMfh2p9/G8DCFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=hQD9mPgX;
	arc=none smtp.remote-ip=185.125.188.123
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C313F606A323
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:02:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C313F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=hQD9mPgX
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1ACBF3F9D9
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1794330166;
	bh=ozoC35JH09JXF0SoFXDETE/OXFxO44zArTqmVJlRrnw=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type;
	b=hQD9mPgXugfhtIhDcvsq4SZThekNRzFT3sMIjicEtPufbY6ARxAAxLQP9WwXgY4CC
	 aR/wvfhIAOuf3xGqJZo7ygWk+aKNtZBVp7lmCnO9LJjMhM5KrxcmeB8bpIIiHRMrzY
	 PrQkHf/lANfXuOSU36xUjcvWW5YuG7yc9cPxFeqpveHCwXebfEbaeOUTnysB/U1Bfa
	 CPGExOBT+QlJol/ka/7z/wx722r0mcwCR5XGgD0Q5CsXjt2jIbL03XUfyNoMmsSoTh
	 azWcf7ngIBV/oFBaUnd03Yo25hSnHRyOScMrPajLZzJy5tRQmcPlyGJChgcodsy58N
	 FmaWQlVn+De1Ouo/qWit8uxUXwv+CoTiMTgzmtBj9+o9QGitYLGM8c7Q/jbx1Yas5Y
	 Y/48ZWEGk1Yw3ZMsowhzD+KSuKGreYgOQSxMwuhcsT8w3gjGieQ12dOUI6ZXkWpzhG
	 8sMIACnv7Y4gRSVmbu8/sq3RVbNdvF6kvTeBTqiOTSECV65jVm7E9GQMzEHXuE4I6+
	 4yxISxem7RcOd1JlrFHtBjJWAIfBc13cDpxb24Pe6pnOiyz2sJ0yOQF8Nn30Xsj4Se
	 9g6K+eeCapUKBWNEHlb7hd/cxrT1Mr+c02r8iPBVBUvKS9yvI67OBzeGZE5fHy1WgH
	 wOfMNs7ArNDVqstymZ1zmUTA=
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48df02b91f9so1488683f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:02:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794330165; x=1794934965;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ozoC35JH09JXF0SoFXDETE/OXFxO44zArTqmVJlRrnw=;
        b=0FFFgaj5jsqGqW4+ydO0KTTrVMDyvy8jsonCSTM2QLkUat9vXCCLo6zGIVnJhEyWlX
         PYUr6CH5E3ohR3Sy7u+O1mqtiv5r9mwhibk/22RnYA/EDHwOwXnKuIlvM62S021NroIT
         jmMh9Y5tozK7um6ceGL00LutoiEXObY6HKFCg6mPzPojkzB0eX+yuu9VbZtbHQyuyGow
         cG+F7n5iM0Pnzc6+vEeqrns1WZJDxqplb0pmrLw03WVLmnJojgZsLw1SJo+xHCgN43QD
         D1Ns5orEa88QB3FuFZFfpI9vkoFYctErD6yusT2XrCi9PEPQr24ycNPqSpw6kYeYWX1n
         /Deg==
X-Forwarded-Encrypted: i=1; AL+hErHkCCXczboIanC/LHimA63pYK+64008vXJAtQl4g7DQhlckGGyYC0EqjuPNv1yeyxl8KST7tNPFjq5WqqQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0DaWWIdKw1hN3jZTJKpUrSLvjmIVU5HS0YZDOj4CEZff9TALV
	Y3zdFfIlTQqHCZKdgIk3tnXrLvGE9BfzI4GkoobZzJKqK72buMDsRy73PaaRcR+rNE68sD32CZA
	QjePuBfpwitGf4iD+ySDNTmv9uq2rYJ1lcer7S52BEy4DTG5vvF/GWEjT8dEA+D/IYE0JP/JF/c
	9T7Mv2ew==
X-Gm-Gg: AYBFou14cP0igiY+k9FtorZiOi7rmKKkraqCXDxkjywmHx5I6tc/IpSPs8aGbJZgLzm
	SuCbZn5+iYl//jE8YGlCZBPlCvXdPYuNgyvfssokKBzH0hr//ljdiUbLB/fL8wwWm5pSiURjtyE
	w8wwua69cBoAN7+iL++ucpqxu7EcqAy4T8JdvkAlSgHGdMo6wy7cUtTCiuARv0ldL7Eh/MNcNyP
	OGO6DoihlEBOujAlhjh2dwKqAuEoUf5lV96zh36jO6BXkkF3B7o4jWVpmfxgq8KeBw8OZFJeMt7
	jep7N2jHXRhN60L48hLRWM7XaeED8XjQFplhY707qfu+i/bGGtvoa6y82rz7uA4xVe1nS24ftlc
	jXuz2j+9CHt3XRlGLoR6lzL57rTZFUwkMy5DBWq7C5a8+Afl37IK5lfBBE7E+394Nt3UWOXgMjy
	8ndYdj3oWhFtEA9P6KY7hIUgVnm9m0Aj3K58bKxS4tpnEaUBVaPu43
X-Received: by 2002:a05:6000:607:b0:48e:eb:56c5 with SMTP id ffacd0b85a97d-49992cc6a24mr288606f8f.8.1794330165615;
        Tue, 10 Nov 2026 09:02:45 -0800 (PST)
X-Received: by 2002:a05:6000:607:b0:48e:eb:56c5 with SMTP id ffacd0b85a97d-49992cc6a24mr288536f8f.8.1794330165190;
        Tue, 10 Nov 2026 09:02:45 -0800 (PST)
Received: from ?IPV6:2a01:cb19:9432:11ec::c98? (2a01cb19943211ec0000000000000c98.ipv6.abo.wanadoo.fr. [2a01:cb19:9432:11ec::c98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49836c83432sm5386247f8f.58.2026.11.10.09.02.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 09:02:44 -0800 (PST)
Message-ID: <546efd00-ddaf-47f4-9387-2635785a1bf5@canonical.com>
Date: Tue, 10 Nov 2026 18:02:42 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: devnull+codykang.hk.gmail.com@kernel.org
Cc: airlied@gmail.com, alex@ghiti.fr, aou@eecs.berkeley.edu,
 bmasney@redhat.com, codykang.hk@gmail.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, dlan@kernel.org, docular.xu@gmail.com,
 dri-devel@lists.freedesktop.org, heylenay@4d2.org, krzk+dt@kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-riscv@lists.infradead.org,
 maarten.lankhorst@linux.intel.com, me@ziyao.cc, mripard@kernel.org,
 mturquette@baylibre.com, neil.armstrong@linaro.org, p.zabel@pengutronix.de,
 palmer@dabbelt.com, pjw@kernel.org, robh@kernel.org, sboyd@kernel.org,
 simona@ffwll.ch, spacemit@lists.linux.dev, tzimmermann@suse.de,
 u.kleine-koenig@baylibre.com, vkoul@kernel.org
References: <20260809-k3-display-v2-11-327d7910bf71@gmail.com>
Subject: Re: [PATCH v2 11/17] drm/spacemit: add Saturn DPU DRM device driver
Content-Language: en-US
From: Sarah Emery <sarah.emery@canonical.com>
In-Reply-To: <20260809-k3-display-v2-11-327d7910bf71@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

We have incorporated this patchset into the Ubuntu kernel for display 
support on the K3 platforms.

During testing, we found an issue: the screen would display artifacts 
all over, kind of like black lines blinking.

I have implemented the following patch to fix the issue:

drm/spacemit: map scanout buffers write-combining

The K3 display controller is not DMA-coherent: the DPU fetches scanout
buffers straight from memory while fbcon and userspace write them through
a cached CPU mapping. The shmem helpers clean the buffer only once, when
the sg table is first built, so nothing flushes later CPU writes. Dirty
cache lines shadow what the DPU scans out, and erased fbcon text lingers
on screen until the lines are evicted by chance.

Add a gem_create_object() hook that sets map_wc on the shmem objects.
The K3 harts implement Svpbmt, so the CPU mapping becomes genuinely
non-cacheable and writes reach memory immediately; the one-time clean in
dma_map_sgtable() still covers the initial contents.

---
  drivers/gpu/drm/spacemit/spacemit_drm.c | 16 ++++++++++++++++
  1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/spacemit/spacemit_drm.c 
b/drivers/gpu/drm/spacemit/spacemit_drm.c
index 12b2fe8b6fc99..fe354219b996d 100644
--- a/drivers/gpu/drm/spacemit/spacemit_drm.c
+++ b/drivers/gpu/drm/spacemit/spacemit_drm.c
@@ -12,6 +12,7 @@
  #include <drm/drm_fbdev_shmem.h>
  #include <linux/component.h>
  #include <linux/of_graph.h>
+#include <linux/slab.h>

  #include "spacemit_drm.h"
  #include "spacemit_crtc.h"
@@ -75,6 +76,20 @@ int spacemit_drm_mode_config_init(struct drm_device *drm)
         return 0;
  }

+static struct drm_gem_object *spacemit_gem_create_object(struct 
drm_device *drm,
+                                                        size_t size)
+{
+       struct drm_gem_shmem_object *shmem;
+
+       shmem = kzalloc_obj(*shmem);
+       if (!shmem)
+               return ERR_PTR(-ENOMEM);
+
+       shmem->map_wc = true;
+
+       return &shmem->base;
+}
+
  DEFINE_DRM_GEM_FOPS(spacemit_drm_fops);

  struct drm_driver spacemit_drm_drv = {
@@ -82,6 +97,7 @@ struct drm_driver spacemit_drm_drv = {
         .fops = &spacemit_drm_fops,

         DRM_GEM_SHMEM_DRIVER_OPS,
+       .gem_create_object = spacemit_gem_create_object,
         DRM_FBDEV_SHMEM_DRIVER_OPS,

         .name           = DRIVER_NAME,
--

I'm sending this here in the hope that it will be useful for a future 
revision.
Is there a v3 in preparation?

Thanks,

Sarah

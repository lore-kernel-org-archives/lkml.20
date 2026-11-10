Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794311882;
	b=DVEJZdXa3J+92bzSYB51FYxoLBBJzTKwOxLXISHYk78zgci0hhLZzNR7ByxQ46o6vPeK
	 yiZ+XBVSJmAwjwK5hgf/tLftuQyJwRdt/FRDhMY5nM84+JXTOEppa2o21PDcFmPEWormK
	 eDYkE9LixoHWwHH2YI04e4cRuLo5bbj5f/X43PdWkBdNc79hYlzQHfgmReBpp0dA1vPMB
	 th7jDwE50rpmapDELzOWZ2dwFP3MnvcT975c/BupQp1ptStHQjj9mAYQDzSKP/CyZg6fp
	 xjwIRq2JspZRnhz1dx9d7VZpU7UdrTvu3exHJTOqgZP8+n/iBer/6SXiyFK571+RGuA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794311882;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=NtZdO6nOLG1xCmYrcxMOJxxZ01jNgWBM1JEvDfWm2HM=;
	b=hVcA3c3VLTCes09a2GssPEFQCKBfdolmbSDZe7GcYTtw68FAu1qbeofoAaLDOmzyS4tA
	 IiT9RmtxioGdfFK9uKAkiimTnyDf9AKTs7g7dUWNQfeOOWDoGGAkw+JNAwibPbJTA7G6V
	 4mNwyi7wkT9nbQPRpBfpR6RoH1QbZx8IgC8mS3NWD9CJh0aDY7Nf0AQfdym1wNS7Rq/xN
	 Icq0mGqCCAIB+qX87P6ff3TkByVOFzA8b0NQYd4E/ZttUoDxzeWFwN2hUJWK/7fcg1bhf
	 FfPhnDAJ/+149LMK+VT+0tm2CVZs+SULSHdYqcLJ5z+i+b6I2E8pmjkN01HnlzxPuIg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RPx4PYCo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C225B606A338
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:58:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C225B606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RPx4PYCo
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b0cf2c0785so18744777b3.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:58:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794311880; cv=none;
        d=google.com; s=arc-20260327;
        b=FNhR2pIen+bjoNpbhAWxxt3IpgvVlg7JbhKdwOmQLXPaWz8uNae8HAEHSYVsg/uN9d
         T8EKuKpw9ny7WVwyGSGIZBRE7EwQtDYvu9csJolvjYjR/gsNc78sFFRD+Ih3Obvp1DmH
         bJPb9QNSVQu3LXAdyamViiyaEY7AIivs6SgXlM/LJlynu601I6Js1D4ceD0RtlAYmOpb
         Wy06Hj9ji3KJKUFQxvjl3nko3eIKS0zX2SRCRTNopXDFY/EfbLFb7zZCBirm8WQ9p2qy
         0fFCXEsw0zTGW6R63vH+kby7DOGoO4sEmnqM1MqM7Fb4Yl+/6k8YN3jtNc4fy/17Cofk
         wPPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=NtZdO6nOLG1xCmYrcxMOJxxZ01jNgWBM1JEvDfWm2HM=;
        fh=CqnOL0LUai7b5C5snoDfV2aHMW3aAkZdrVRgZ8smAFE=;
        b=h5TctkJE4elcqCG9NeZ6syoAaSKoRqbj79WAyxx67viP22xZtcpcq2xAE2ZlJpGPW4
         7T8w6bMgzqHYOPywX3mzWwrx/prSMa2jVunRuiT9k29hAbE6z2SPzTfij1cXHNIAAV7s
         fQRXG0JFpLJH6d3hN0X+DFMoLAJ3dNOqpcugNyL0QiQtTV8jHsbvU7qKmxuGQpTUkpNR
         qC5GZbiQNL+74pTfvii2hMRuLMRMwVDSYxuXN9qkUCh2aCjfw/Q0LViYsbopMazNzFWj
         +uV4poXgRNUS+TqWeg4qALggtBMriTOe6vYsKBtZzCxXyLqz8AiVFSUUv4yo/jpN3JnD
         7a3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794311880; x=1794916680; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NtZdO6nOLG1xCmYrcxMOJxxZ01jNgWBM1JEvDfWm2HM=;
        b=RPx4PYCo+eQDGb6sDAICjWjaCPe0dhtI4Z6JcpQz1JiMCy86nu+iiC4IQPcXoWjYz+
         6xFkQR8JrSzzlg9TNoBSqgIBs41KlhNJ6PKsA4DqahjoHidcFnKRS600vBbgAkPsBbGB
         y0auxKikS9dguD4RpK/1lVJuE3ujbXkln6DqhZbCCu9dIF10VUFLRHQD5zcgXqmwNtLG
         322hNoaqUECQRVVYX9VgH4VsEfBLo43Xn2T1HsXhLazGOcDp3WMDxJMTb8fyUKRkVGtN
         W2VRHl9GWoR2HHS8ppVP6P4PT5cZen3Uc6meTl65pofsgp7OmboTp71W0mqjjOEWPbY/
         o9Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794311880; x=1794916680;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NtZdO6nOLG1xCmYrcxMOJxxZ01jNgWBM1JEvDfWm2HM=;
        b=Bik5YKJGaFOKMAYGfKGhzHzEH4sM/ZNXsgzscXCqQgd0i9Jyhy9E4RSSK34yFVp/im
         iUb8pb1fWtt3MDwH2igIv02kYt09fUiK1Uzr5k3uhbSksIYWmhEZFWMb9BAiBwJwi3Ol
         db1EXqQa8uFwfVdvEIAmuiNlymHFWGtVJPG4vfNsnYMQbL0kPpnQKfXt5SYjMEKqYW5w
         hh9YAagQ9PT6swoWAbRJlv4YloOHAxEOkj3mMcyATJwSZk7sFgKtP06mlDD2WlADzsIt
         Z4BPdfRZRzXD7j519UnnSKlCo8fvk9N4nW5WhSyOWmOQ3RjMeZLd9B8uMqP1kSDPfERl
         +icg==
X-Forwarded-Encrypted: i=1; AL+hErGwfKyWpaLVPA2eS7pazXB0KBjU4P7t0+ImvA13noa0eIgfs8EeUfsEAVWlkFAA+BDQTCbudfWHlZkcyos=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lCQObEwjMR0+t5libLLd8s02Qo05TVHYFIQIXijFqwcxCCn1P
	dt+sEkNR4m+r5N8VdqjiEtz9LED/xAWjUxjYvlZATKbCMRquiiGGlA/AuwwTgpqqt8UIIS+Gnlr
	4gxHYFj0LX4/pqQ2f4vxtK0LUxJqKtZU=
X-Gm-Gg: AYBFou0gCpdIkq9eYxEFwq6CaLUdVn0OYa1Afs141FZy89JlJ7riV632xX86qPQYho+
	azpCIDmg/2WrR5x281vIIP2HfZRVPfPTatc/SkbwtlseXJYzc0U76kWPVZ5eVnxsoVbaDRiY67l
	c94hyRxDEWv2PUMAY4e7AndQJwQMNthGpH3uU8WX5fhPj0eUO2o8OEZfc2K+PQq9O80mjZbaHrG
	Tvza9lxrpqqc7ZYSSSTvuhUCOT7mEdcN6cCpkqnPIGZu1oW5nSuaRQh8TC7OXIibilWN7h4tdKA
	GgBGKiMfPErKDx49h4UUvYfvv8SajulybvSddDNQI7nI0gCM72R+EA3rkItr41wRUdmh4WThhGu
	3lo6viLzEhobuTaVPNqxvUW7c7v03XZni6d+WfhiFlrBslw+ZXA7AsA==
X-Received: by 2002:a05:690c:dc6:b0:8b0:f0cc:db0e with SMTP id
 00721157ae682-8b392c3d7b0mr12234627b3.78.1794311880452; Tue, 10 Nov 2026
 03:58:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: =?UTF-8?Q?Kincses_Benj=C3=A1min?= <kincses.benjamin2007@gmail.com>
Date: Tue, 10 Nov 2026 12:57:49 +0100
X-Gm-Features: AclHuK-790e-YG3XMXcbn9JCn1hGEUSurN1poH3-rodvAOagUfzcQKHK3R5q3Ng
Message-ID: <CAB9ndWsADtrZNFLafOoO7qAdgWncBbKbBkLVv4P8b6jyTwx4qw@mail.gmail.com>
Subject: [PATCH] staging: media: atomisp: fix spelling in hmm_bo log messages
To: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Three hmm_bo log messages misspell the past tense of 'bind'.
Fix them to use 'bound', as listed in scripts/spelling.txt.
Only string literals are changed; no functional change.

Signed-off-by: Benjamin Kincses <kincses.benjamin2007@gmail.com>
---
 drivers/staging/media/atomisp/pci/hmm/hmm_bo.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
index 0a8f401..1fc5c1e 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm_bo.c
@@ -448,7 +448,7 @@ void hmm_bo_release(struct hmm_buffer_object *bo)
        }

        if (bo->status & HMM_BO_BINDED) {
-               dev_warn(atomisp_dev, "the bo is still binded, unbind
it first...\n");
+               dev_warn(atomisp_dev, "the bo is still bound, unbind
it first...\n");
                hmm_bo_unbind(bo);
        }

@@ -830,7 +830,7 @@ int hmm_bo_bind(struct hmm_buffer_object *bo)

 status_err2:
        mutex_unlock(&bo->mutex);
-       dev_err(atomisp_dev, "buffer object already binded.\n");
+       dev_err(atomisp_dev, "buffer object already bound.\n");
        return -EINVAL;
 status_err1:
        mutex_unlock(&bo->mutex);
@@ -882,7 +882,7 @@ void hmm_bo_unbind(struct hmm_buffer_object *bo)
 status_err:
        mutex_unlock(&bo->mutex);
        dev_err(atomisp_dev,
-               "buffer vm or page not allocated or not binded yet.\n");
+               "buffer vm or page not allocated or not bound yet.\n");
 }

 int hmm_bo_binded(struct hmm_buffer_object *bo)

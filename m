Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792447002;
	b=QsKONXUMpSoXVfft9kv9PSBpU/0kXSV8OI9du+z6nu9zuvlL+yTdc7VKTpoyl5Nd+llX
	 GqB12M/c8yd+mATxcFsxCMw2YvD90FBQcVX6GNt/+Bj/dcQXEUgLmSsVt3yk4sJQ1p8Ni
	 6ZQckltEUAq9T177Q0KiyCxP6fjIrjnicCt/9ElcIZ+ebxFesCoyjcxYA3X23pAjEQtGf
	 +3+cRR1Tuzl7SKM7EvdIXbToivJ3CfUzWYrzOCTH1h6bFaysEZFcMTOs6xf+TujwHllGV
	 OpZkV9mGzvT3upSO/oj4Fwdk91CFh7QBSBgUexTKPr2JvwVVmTcu5pimtiFPTV095zg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792447002;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:From:MIME-Version:In-Reply-To:References:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=hfQ+jS733ACKP96HHpjKWBqcD0MjsSHnKcHO4UU8xAY=;
	b=0Q5AIPgOko12DWoTQd8xR/aPNNjTh/gOzC9e0lSFnG0duEhgCG01aCVbTIGJqd0Z4tre
	 gXHuCG0bwWqqBAx4i65SkP6xcNFTXlNLDOLgelNNUspEbz1a5PjfJNSJ8QxPknDWO42n8
	 /4IpLVISoEQjmusbzSJhz2y3ThfVbaOhpSPUTbKdpzRz+N7aID/Ff+QIkKMnVlExsL7DI
	 bMx69KMnq09ZnwLdExP2UhBXmLnhxMCEd0eyGQygkXJUP9d1Wr4+qUqaPX90bPm9H+1nz
	 B4iUvq22NbyNZidnU+P23YAubYPNkAJtzU7M8tL6C5VLDmARMJ752o6GRweoo/jCEqQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=carboniste.com;
	spf=pass smtp.mailfrom=carboniste.com;
	dkim=pass header.d=carboniste.com header.i=@carboniste.com header.a=rsa-sha256 header.s=google header.b=Cund1o5Z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D28A606A326
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:56:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D28A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=carboniste.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=carboniste.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=carboniste.com header.i=@carboniste.com header.a=rsa-sha256 header.s=google header.b=Cund1o5Z
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b0f1dfef72so2626687b3.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:56:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792447001; cv=none;
        d=google.com; s=arc-20260327;
        b=J88MR5PMAf8QAtbADiQFSVupef1NC3UNhLSRYWmzt8HHd+8qLScaN1psVKigkMZZ3Z
         a3mWzdyx31nESTLo82T3jL74yxKW8CRqzBSMS/tdX1ZEWg5lni82n/llUKwAPdn72VB1
         ZzGSuW5FcjC0sxF4US41jwFD4lJJSsdrrjvcngvSD60NBahYf+9rnwWUE+vAWw9hX1mc
         Sb7Nm3z6H5baMa8V2jbOzQGyROh0pjjTPkTXKIEVV3uBoPgn+f3iMmcvt8mRJu9nsYJp
         rt10YqRO3gAVZnxDpFKP7CUp11HceyOpR7mhXRQjYOMdc5q+CBk8lwkUw2IZX5jga8JQ
         OTKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:mime-version
         :from:dkim-signature;
        bh=hfQ+jS733ACKP96HHpjKWBqcD0MjsSHnKcHO4UU8xAY=;
        fh=3AcaWjt15jIa2qCBZQ2plQYOeVYehwVsAtGCurA/97s=;
        b=eDHo2wDNXfxQmpDq+IwcNKsrPAvgrGL+5oFAjSbcS/N6mZYjbjcPHvVq3xaMPi/5lW
         nJdPnK54ianqTyQ4b34v6KUbYz7YaaVegI+w8mpkd/LbDyERGNpwziTkStSroQBQ0RBc
         M70tONRaJ4PHf76cmOJLk1LZr0oDANrBPLK5ODaABl1YM/gQbmx1+pqLl+aLQCNGOgIP
         8ctpG0s8RToNTiEfqZBfwj/1pqO2D0AcYCKUab0+m/qhUNqfTDxtd151cpgTNhnQUgCq
         9UBZZZZJE3ueFsBxJzSNMIi4u950rvSoRjJjaKBJ5yzq+QVCJTvjki1ckHEu8AfYj7vv
         3+7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=carboniste.com; s=google; t=1792447001; x=1793051801; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hfQ+jS733ACKP96HHpjKWBqcD0MjsSHnKcHO4UU8xAY=;
        b=Cund1o5ZqCZBKom/OktIo42Wr7rJNM+69jXu6ROfSUglSGtopu+b7PhzbsuM2BofG/
         GOVopqtuhL0iseAibNRab+LlQLi7PL0rWjKpW5+g7Gr9LAFm13+J9tbAEZNqR32JHxch
         e/Kw8Zr/pGZHiHhqTapqYidfh7jYizpcurvZMD1odceRUByVtCKHaV+WLu7jMHu5qQUJ
         4Q6+1PMOWdo1rv2X3z8V0Y8GVztQZPw7D8WNKTgPB6AsxBP14ikugxcm5UYJjaIS4gdy
         dtCBEHwlYagUqoSt2Xxi5Oas5nUr6QUC1Ge7+WkjGz7j+SRfi4EtpfDONRLSsH+zgprZ
         H80g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792447001; x=1793051801;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hfQ+jS733ACKP96HHpjKWBqcD0MjsSHnKcHO4UU8xAY=;
        b=eqYuzv13Im3SXR6XhTc51pD0TMXXy7bnnDHu6HainLS5IhR56zOo2lR4C5A5//4qNM
         zc+hcJz8DBkw+AqLlnteYRP3VLBVr7VD13GZLXrbUS9MOI5EDT4LRDnK+CCdnM0hJKoE
         p67CYG1eAH7h9kBSvoxl3X3ESedHF2pCUnBSEgZWBmFhzOugsOO6fA36WBbVrflvYa4F
         AwRAfZRVlD38v78a9WGc6kq17QnzxIK9gtWDZZxS7NvlXrVWUInk7Zr//+EPXqgKeAc0
         JH40lpI05a7I6S0JPatDAUGGD3s/+molBIoQ7HTZrxjTI+u2tGO7ZE8rSghbnPYpkqZR
         Sq+Q==
X-Forwarded-Encrypted: i=1; AKwUvBwKTW8HQjz5tKAeJCGn5D7poP3M3ti3aKyVEfY+kWJrTMkZwQ5L/dcB0sqPR9V7qVjkzhImVdlHUWBCUoo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKwhhgkgn6VxpDkjkZ+RBQuaJ3QzsZjU6O7Mbu0KLPBGTuw7jaY
	Ni6T63bZLqaql2/639syG8v2XvhUsCZlWxOFFFqoLxFSKG7RRTXgbdsYL4HdokFdFy731c0g2J7
	IebOCD1bVdzD0FsupgifofjRUHlhrReD5YofvEVSGz1E=
X-Gm-Gg: AYBFou2K9ri/usQ9Ou+lpmAr2wOr//Eq9V+/EggU1GuPjSCIfbOhlTW0C/5nk370PZ2
	wRYYtsChC3zRby/G1XE0hQe86XDKm7a8+cyWKwAnKmeflNixGWvKs22iLnauDWAIJQjERGQMI3D
	9gKxosc1N03YWZ6GwlwjegYT7qe3gD5GFczwYr0Tzx+nfeID4GjfqW6thlJx3fRrpFeOy9Q0+r2
	t8y5PxmG+RtY292G+/ed7HanW+s9H35+aVT++1XWP3OQjRh0focYiAJXut1MDxQM98+BGUM5ugm
	m5MS1/6KyyXoL4rBVkbXv7SmCiCxveD1MD22jQCOzem7gx2vkEKRHx21
X-Received: by 2002:a05:690c:6087:b0:8b0:da84:d1c1 with SMTP id
 00721157ae682-8b0f1f1a89fmr50010287b3.0.1792447001503; Mon, 19 Oct 2026
 14:56:41 -0700 (PDT)
Received: from 658150881093 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 19 Oct 2026 16:56:41 -0500
Received: from 658150881093 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 19 Oct 2026 16:56:41 -0500
From: Dan Person <it@carboniste.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <CABZx5Lu3ShYsPtEsKFfL+Ch6G6KywH9eZ8e=YDYgJqu-k33kJw@mail.gmail.com>
References: <CABZx5Lu3ShYsPtEsKFfL+Ch6G6KywH9eZ8e=YDYgJqu-k33kJw@mail.gmail.com>
Date: Mon, 19 Oct 2026 16:56:41 -0500
X-Gm-Features: AclHuK_L8gKWrmqgSiS8AR93-eVN6EwDlvmWSGt_6EHD3gKd8pPByh9qH28A9RE
Message-ID: <CABZx5LtgeKWUj70LkVaibOEV1ftqi7d=BYE_ug6MdvVxhiCL9Q@mail.gmail.com>
Subject: [PATCH 2/2] media: ipu-bridge: Add OmniVision OV9234
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@intel.com>
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add the OmniVision OV9234 (ACPI OVTI9234), used as the IR camera of the
Lenovo ThinkPad X1 Carbon Gen 11. It uses one data lane with a 180 MHz
link frequency.

Signed-off-by: Dan Person <it@carboniste.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c
b/drivers/media/pci/intel/ipu-bridge.c
index 32cc95a..b0bef21 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -93,6 +93,8 @@ static const struct ipu_sensor_config
ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("OVTI2680", 1, 331200000),
 	/* Omnivision OV8856 */
 	IPU_SENSOR_CONFIG("OVTI8856", 3, 180000000, 360000000, 720000000),
+	/* Omnivision OV9234 */
+	IPU_SENSOR_CONFIG("OVTI9234", 1, 180000000),
 	/* Sony IMX471 */
 	IPU_SENSOR_CONFIG("SONY471A", 1, 200000000),
 	/* Toshiba T4KA3 */
-- 
2.53.0

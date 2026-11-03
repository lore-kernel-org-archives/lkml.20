Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793738198;
	b=X9wFxR7XFYY7pGZrnYFD0ahH/6ITTI3IAXaTopPbm2QIi9nsnr0AXU6zU6kco3wiY7LN
	 qVUQLEPfB5hWY4fQ/RV24ldUMe+9gCnjmmJrjc0cvZ25YdD6EwwVCXTmDEsj/LCjLzI8r
	 oQ37hth1fH+C1vO6gpDkTxZyRV4kHUr9fUQRHG/YXQhwi2nW5f2ctaT46qrga3b0KNHgV
	 634Py2h7b4AVKMD4qekoEeActegeUkG9SHtWZdUgUJu1h1NO4J/OoOjcidB/qpT4oXCYT
	 Tz6Md3Wr4p0Tp/cPqxqIRiDXz7PGx8QIJF/jRTjgIP0uCRwzJRnZ5PWNUf8Qz3rhhCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793738198;
	h=DMARC-Filter:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=tpEII053p3mhNfn30gTOffmnMpSklTjLEUHLptTr0Fo=;
	b=w0TcurI3hpSrRmZomI6eHdk45G8GmZvEw94KptOy0IxfxT8O56bMWEEI9x2+wN+PddPP
	 rk2HN1eH84Kj+mfNAp072PiHgwapq4qhsl2HIKece0xWuNB3ihGdZ50tIIqOP9ZbFeYOA
	 eLze/rCYB16xp7BZ/C0FUeEvYUU4Ugm2ZmfJ4kBWtJtEHRUX3Ue8JNWy/zF8e+qX5820Y
	 9mJTHl4diKaRXX97gK70Jk5MaHmQLwne3YjHqUlTSZQMXdkjG469XfBgY1df9ysBRpuvd
	 vTai7q1CGwtehOCFHxoL0y5JVEh1IsY4T98KJBBpHLxkL+9AwIzlPrD8U2EFItR460g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=hFKFYw+G;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12815606A31B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:36:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12815606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=hFKFYw+G
ARC-Seal: i=1; a=rsa-sha256; t=1793738181; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DDlv12rk9rKzIaATLgnXoA5qSygbFakFdb2HP2wuok52/9mXkeZCrQ9RMCWvlpNJT+nEE8l169Wn8+Qff6uW8g5jk642lebxuTVMaqi39UjPB1TLJvjz4ffCPrlLIhKw8RvvuxDoPavu+cwoCvhRgMV8ulD8qy3w5su5gYtaflI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1793738181; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=tpEII053p3mhNfn30gTOffmnMpSklTjLEUHLptTr0Fo=; 
	b=A1VdwA2cJWG+2HQBAN0TwdXvdyS3zprerKo0d9uwb2avh/iHBBEouZ7V+Mr4l8X2Lw9HIg4lX+1uOBV8+L2iIg6v74kqddme8iXb727wYWRD76YbM/Y6A1jbE3CfoYjxVBw5dzffKc20t8U6U3THeQSkcZ83c/0OvamOeVNAGYk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: a=rsa-sha256; b=hFKFYw+GppvQihmNZVs5V7WsYuzDn2H6ftn5z17WLIO0kBLDDsjaUQ7dFoTVBVIs0oXDfsiU3w3s+G9+bmm5ygt5uTHVhv6vl6+Rll//NwB90U4vuEoBzE3B8YDYY6ie1ju6HZJzHTse4CVw7xOKnhX1d1fdPI5JnSLfJ7SyER8=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=tpEII053p3mhNfn30gTOffmnMpSklTjLEUHLptTr0Fo=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 179373818058011.607757256583909;
	Tue, 3 Nov 2026 12:36:20 -0800 (PST)
From: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Subject: [PATCH v2 0/2] Two small perfcnt fixes for Panfrost
Date: Tue, 03 Nov 2026 20:36:07 +0000
Message-Id: <20261103-panfrost-reset-races-fixes-v2-0-454207b1d4e3@collabora.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32Nyw6CMBBFf4V0bU3b8BBX/odh0Q5TqUFKZpBoC
 P9uwbh1c5OTuXPPIhgpIItztgjCOXCIQwJzyAR0drihDG1iYZQptdK5HO3gKfIkCRlTWkCWPrx
 Slr7wJi/qFmon0sBIuB/S/7X5Mj/dHWHaFrdGF3iK9N7ts956P1HxTzRrqaRzVQ66OpVWuQvEv
 rcukj1CfIhmXdcP2oDCydoAAAA=
X-Change-ID: 20261014-panfrost-reset-races-fixes-6f5f2459dc9b
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
 =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1929;
 i=adrian.larumbe@collabora.com; h=from:subject:message-id;
 bh=E8MnxMy9vF68TqjM4+LG2zhCzTUUYzvJPrza97Mqc28=;
 b=owEB7QES/pANAwAKAQ4mfkzuU0M9AcsmYgBq6kW5xYci1qak3iNu7yOhtteIgrBtPP7wwv6gF
 oljX8uUUmeJAbMEAAEKAB0WIQQyQDDowAUXXfk3B6QOJn5M7lNDPQUCaupFuQAKCRAOJn5M7lND
 PWT4C/4u/2kZE1A5PwP3aJUIDLQDPl0lIn+HeqBrYVh8YwHgbOawQ/N+jGobl5lKWj50aKIS52p
 bLXv0O59VAuV9nR+iU/LBlO3rVESHxU0rqewzdFOzdAWJZaoniNyuXjMufzLGcoqTK5sj3RDDIF
 ABuBqEFO4DrIHhJLBShoFBcCL0yTxhGdn1u1RLl1cLwmfLzzGWBctcoKwPY75KiX+PencehfItq
 ayOR0xxy2eEPLHDhCcg2RtAVJKwEsQozMRVPSxmQYeyMf7si9TDMDbyNY3AMtnC0e+lER6oGuIl
 Gd6g+iBeO2yIKofll8pneGk87WrgroXGYWE1D5bai9gINTIt7eFc79tbdrT62GvaEC+i+7dA73H
 73I04s4UOFTLrHv4voT5b7mwD9OgHxw8Z7wp2FTNQP+u09ApEZcpxaJBwHry8ZUZy06pj0lSXrN
 vN5Ma7cYmUQ/nv1OrXk2AKUTyf9I+oNy2kU4QsSjyftxQvvOMftHcC/IBOs4pBKWDs9vQ=
X-Developer-Key: i=adrian.larumbe@collabora.com; a=openpgp;
 fpr=324030E8C005175DF93707A40E267E4CEE53433D

To: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh@kernel.org>
To: Steven Price <steven.price@arm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>

First fix makes sure cycle counter is enabled when starting a new
session. This is required by some profiling frameworks like
Perfetto. Second fix deals with a recently-introduced race condition.

---
Changes in v2:
- Added review trailers.
- Removed warning from cycle count reference check.
- Link to v1: https://patch.msgid.link/20261015-panfrost-reset-races-fixes-v1-0-bb74c1786a0b@collabora.com

To: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh@kernel.org>
To: Steven Price <steven.price@arm.com>
To: Adrián Larumbe <adrian.larumbe@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org

---
Adrián Larumbe (1):
      drm/panfrost: Fix race when restoring reset state in perfcnt

Boris Brezillon (1):
      drm/panfrost: Enable cycle counting when perfcnt is enabled

 drivers/gpu/drm/panfrost/panfrost_gpu.c     |  6 +++---
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c | 18 ++++++++++--------
 2 files changed, 13 insertions(+), 11 deletions(-)
---
base-commit: 6f7098738fff3ec7393f924343188cb8e6ebc5d2
change-id: 20261014-panfrost-reset-races-fixes-6f5f2459dc9b

Best regards,
--  
Adrián Larumbe <adrian.larumbe@collabora.com>


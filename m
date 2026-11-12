Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794503543;
	b=rR5YMzjkCxhZ0K0F39So/R3+cz6oBZ6Ywzf2O5D1Wd3Z+m2tJpZjXHVqWmDNDcwfYuw2
	 kW/4bvR+hEOsrhnyUWmh6saytiSVLldvrXWXU+AZeB7NiGjlAQqUPwC387K2mC08wqJbP
	 ZZzwNPSiPqwXqGH0zxzqNeMpsvxTqQwxyIMaDcIa8xUfZ8kL94afqXHTtJf4+Mo+W813A
	 z+sLFP27g/hx7S8tMa0+Sc1CrInU69uFYB3Ek6CZom6oX+3iTSl62NCNnhLwq+mzedJmm
	 tJl7W+VcSHXEzhkR0tYYmnb+Acb3/9FEq1EbB63vj00ua3hVxMYOYhaF10KyC1aWOmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794503543;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=khMH15UrWwDPVaDjMg8F/SoPd4LjFp0hVV0BhxLmj3M=;
	b=z++awUBa+uQLZIEme5jge2x5HidliQD4Z97f8b1OFSsXo0rxeJzZhU4Bin9iODFJmhzp
	 xDfyqX/CmYItGhH/Py+qK2PQxHg+/RtLbV8T5v6N+YxBx2b0fCY8+2c1tXeR8DmC9jXoz
	 lzgq7s/sUltWTNRFrjRJqtYN/8I6uAFF+jhRFqdSBwjaBG1slY29v7VOxUUAxqCIwyzsw
	 bCZl4hboEV3yWJ8GUAQpyNUhq9jHR0B/NCKW420azvFWuzvaxTIowYKjd+DwQswSvczwg
	 mbyG3k702WTefj1XxGrGrsZO+1Tqgy7zIPIg6zxzmtSWD+bWBscgeQCkEKevtPP03LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=furiosa.ai;
	spf=none smtp.mailfrom=furiosa.ai;
	dkim=pass header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b=gnV7VT+V;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF57F606A89A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:12:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF57F606A89A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b=gnV7VT+V
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b17cf2fa0aso2145207a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1794503542; x=1795108342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=khMH15UrWwDPVaDjMg8F/SoPd4LjFp0hVV0BhxLmj3M=;
        b=gnV7VT+VVXt6AJyodyjy+I8CYfyUgmlvE4YxFvtWM3hSwXpwO/Bcg6yACfOT41bLsD
         pxDhRY+vh246IaV3eRfnA/VxL+/xDX3bOkwYQXdTOYWIB7T36NKup0Hf6TrVwrmaMCP6
         uR/7OpzA2w+I9UT2VxqMGODWVCTGyLFnNmTK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794503542; x=1795108342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=khMH15UrWwDPVaDjMg8F/SoPd4LjFp0hVV0BhxLmj3M=;
        b=OF8/5f7q8Na4srOw4DHswg9Q5NpySxlP9i9TKz0XFSQFa8DIzEEZLzSi1dmzVwLG/P
         5LzOkR4tBVgfAgQv4wmf7SAwj+jQKf3mxIxlnPtflyUAImRnj/l8r3iM3p5zlgJUnplY
         uhcfeMCdoKJgCo7EZEd6eKSTFR+zAB94/3HnJybn/31TVfUBGdRYddb6Ru9gXg/3racM
         QWNVk4yozndcLkvi9DFoghiT8C9Ggw6O4j9uhy2l3XU4Y+yslsT5Sb+clv4tBURUzGEv
         Bh0+eStZTkFPk/Im5GBBzncitNwQau0L1kAn8TNGuvelF49LSlG4+raKekGeA61bpxRE
         G4Bw==
X-Forwarded-Encrypted: i=1; AL+hErFmsZP142z5StroodCAA/Kb0t3awSRUHCHKNBImcPTAqm6vNhjJ544IIZIvL++XAr9t1Ucir/lW37+LnLI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NNGR7Gt9i+oDd0tDRK7Ye3PZ3MJvw1pzi55uFmvusdTg4oqzs
	x9QPVyvEJn8yvhVGA9SbsLsdEn7UZd0x+Qqg5p/XtrFcytTfrIiUuQh/97xF21ouZC8=
X-Gm-Gg: AYBFou3Wi2XEuGb/YKz/piYTjU6HuipSs6F5sD77eqqF68+7btE0xKUP9Zzx2B2UMMs
	patuiFrJm3CCrtCzDsoByK7sKVYplQJOvexZWbkbfGNOPr+2ud3Eja8zuHL2mRusa3Xnqw/pQyY
	9bKKklVGguIKbcCLulA5I8pdilYLLCxeZDtjLDqshCXqrQpmHQtb6fYyWMFt89N1Od5noScekSP
	tColiHzJHJtpuL2WSA4mswRnmZyYjtdFFSNuZUid54hvEqyhQNVAXSTmTKiHnXmTxWnuq7CtyG0
	/nTC9RSj/sjcs30yG6aj2FAEn+rcX/N7R5/2gWStVlyltltCykdEg7JKsNqCo4sIDGyBtJhJWsT
	qVgMVKjdotODEFqhxzkaePdJvN0KVTTRQOxNfC/KdULTup2tYdBZi1NbL3pQobOzCEH5OQNnONR
	YMlqp+9+NiSLjgwjvgD/IFhQHjrHw2i01btO//IBVvjzPsWjZXKLRNDNdl10GKc0SzSCZhy8VmO
	fJy80nmeEoa7XpVp7wMFJy/YdAUAScmtrS/DpCSrJzMybRGKUW7E7zZ+mN9x2iwnb+OGtmdvM2+
	fGBTgFGjLZTOHtD3BJU/kqtucH1EuyOsWDj2TvH2tI7Mftk+W8hjmLCJzOvI9sywk6k6IqigXZS
	KCfRJhkRcfXvX
X-Received: by 2002:a17:90b:3e8e:b0:3ac:9d83:885e with SMTP id 98e67ed59e1d1-3b182f3e594mr7100466a91.52.1794503541921;
        Thu, 12 Nov 2026 09:12:21 -0800 (PST)
Received: from rock-5b-plus ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1ae981c55sm263682a91.1.2026.11.12.09.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:12:21 -0800 (PST)
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Philipp Stanner <phasta@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Matthew Brost <matthew.brost@intel.com>,
	ckoenig.leichtzumerken@gmail.com
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
	mcanal@igalia.com,
	Heiko Stuebner <heiko@sntech.de>,
	Gyeyoung Baek <gye976@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sidong Yang <sidong.yang@furiosa.ai>
Subject: [PATCH v5 2/2] accel/rocket: Report NPU usage through fdinfo
Date: Fri, 13 Nov 2026 02:11:44 +0900
Message-ID: <20261112171144.3151554-3-sidong.yang@furiosa.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112171144.3151554-1-sidong.yang@furiosa.ai>
References: <20261112171144.3151554-1-sidong.yang@furiosa.ai>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no way to tell how much of the NPU a client uses. Implement the
DRM usage stats: report the runtime of the client's scheduler entity as
drm-engine-npu, along with drm_show_memory_stats() for the BOs.

The cores are identical, so they are reported as a single engine with
drm-engine-capacity-npu set to rdev->max_cores, the number of core
slots.

Document the keys in the rocket driver documentation.

Signed-off-by: Sidong Yang <sidong.yang@furiosa.ai>
---
 Documentation/accel/rocket/index.rst  | 28 +++++++++++++++++++++++++++
 Documentation/gpu/drm-usage-stats.rst |  1 +
 drivers/accel/rocket/rocket_drv.c     | 21 +++++++++++++++++++-
 3 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/Documentation/accel/rocket/index.rst b/Documentation/accel/rocket/index.rst
index 70f97bccf100..8ae785b65a53 100644
--- a/Documentation/accel/rocket/index.rst
+++ b/Documentation/accel/rocket/index.rst
@@ -17,3 +17,31 @@ project.
 Hardware currently supported:
 
 * RK3588
+
+.. _rocket-usage-stats:
+
+Rocket DRM client usage stats implementation
+============================================
+
+The accel/rocket driver implements the DRM client usage stats specification as
+documented in :ref:`drm-client-usage-stats`.
+
+The NPU cores are reported as a single engine, npu, with a capacity equal to the
+number of cores. The time is summed over all cores and is accounted by the DRM
+GPU scheduler, from when a job is handed to a core until its fence signals.
+
+Example of the output showing the implemented key value pairs:
+
+::
+
+        pos:	0
+        flags:	02400002
+        mnt_id:	33
+        ino:	755
+        drm-driver:	rocket
+        drm-client-id:	263
+        drm-engine-npu:	2384122043 ns
+        drm-engine-capacity-npu:	3
+        drm-total-memory:	24216 KiB
+        drm-shared-memory:	0
+        drm-active-memory:	3000 KiB
diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
index 70b7cfcc194f..288764730d23 100644
--- a/Documentation/gpu/drm-usage-stats.rst
+++ b/Documentation/gpu/drm-usage-stats.rst
@@ -218,3 +218,4 @@ Driver specific implementations
 * :ref:`panthor-usage-stats`
 * :ref:`xe-usage-stats`
 * :ref:`amdxdna-usage-stats`
+* :ref:`rocket-usage-stats`
diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/rocket_drv.c
index 5d7805c41dc3..351be60b1228 100644
--- a/drivers/accel/rocket/rocket_drv.c
+++ b/drivers/accel/rocket/rocket_drv.c
@@ -3,8 +3,10 @@
 
 #include <drm/drm_accel.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_file.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_ioctl.h>
+#include <drm/drm_print.h>
 #include <drm/rocket_accel.h>
 #include <linux/clk.h>
 #include <linux/err.h>
@@ -139,7 +141,23 @@ static const struct drm_ioctl_desc rocket_drm_driver_ioctls[] = {
 	ROCKET_IOCTL(FINI_BO, fini_bo),
 };
 
-DEFINE_DRM_ACCEL_FOPS(rocket_accel_driver_fops);
+static void rocket_show_fdinfo(struct drm_printer *p, struct drm_file *file)
+{
+	struct rocket_device *rdev = to_rocket_device(file->minor->dev);
+	struct rocket_file_priv *rocket_priv = file->driver_priv;
+
+	drm_printf(p, "drm-engine-npu:\t%llu ns\n",
+		   drm_sched_entity_get_runtime(&rocket_priv->sched_entity));
+	drm_printf(p, "drm-engine-capacity-npu:\t%u\n", rdev->max_cores);
+
+	drm_show_memory_stats(p, file);
+}
+
+static const struct file_operations rocket_accel_driver_fops = {
+	.owner = THIS_MODULE,
+	DRM_ACCEL_FOPS,
+	.show_fdinfo = drm_show_fdinfo,
+};
 
 /*
  * Rocket driver version:
@@ -150,6 +168,7 @@ static const struct drm_driver rocket_drm_driver = {
 	.open			= rocket_open,
 	.postclose		= rocket_postclose,
 	.gem_create_object	= rocket_gem_create_object,
+	.show_fdinfo		= rocket_show_fdinfo,
 	.ioctls			= rocket_drm_driver_ioctls,
 	.num_ioctls		= ARRAY_SIZE(rocket_drm_driver_ioctls),
 	.fops			= &rocket_accel_driver_fops,
-- 
2.53.0


Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E906D525A90
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790064098; cv=none; b=l8Mc+1FuAYDws84NMikd1Vuh2niiqvVA0gubyhgUtYpePqShbl5hmkY7+FggkrH99SduHnVluPuK/gMqK1t0fWS2YCXMfW/pJa5CI/qyRpsQ2v+gNaG/DuyRJ2CnSCaDadNFR0sIlYBMmQPQRT6JyVtx+PfiLTqQUpFP7uZ0Xh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790064098; c=relaxed/simple;
	bh=R/0rtgRVcCRx4mq+bwcXP9RyWXmNvIpagAFBrXuOlAs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PDtPc0QF1ovm38Ob/o9HQbKOfEB2s0dqKQN9mPxOmx6M7IqSW9FE7skDmt6mqk9QyUmh8SBwBoAoJj/525Qr3fSHvu8m04J48EEe+jVwOH8i1x57f3n6sxIqsspgGrIkvyZdKGcNEYMgr/+qCjVh8iS6jpCoIni+xhH/g+7cwHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pSDIbHGM; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pSDIbHGM"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48436686a40so356919f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790064091; x=1790668891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uM6eJlIue+3ZnByR9U7PRXrgVvVnosyPWdGdGl87I7k=;
        b=pSDIbHGMCkMsnOvAmWiH+7BNamsOOkQmKnpQmUjfiSrtl/Qx7W2bP128l4zLWyvh7x
         N8J3TqVWkjw2RWE6Zahs2B5jPlaQPiUlAwYHbRguDL8TK6+lWSlQ0GArNmbiOgfZDZQC
         5RN3xHLeSB3KeilmXbQHhVnP1ZKOeTxNF3/CQ6ADqar79a1xCKVq23cIgnCy/q0DVGq4
         3cy/qop0K7sQhwhy3ncvdjMFzGezKhCADrO6UXs5S+EqfW2XbfBIwEjo0iemc7TZ5qjk
         sC3Yh2eaq5xWiedEG4Z6J9c3JjPzfUl8Gjut6r/7mBdxMUCTvhwub22Y1Uh2kRsz+gpR
         VMjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790064091; x=1790668891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uM6eJlIue+3ZnByR9U7PRXrgVvVnosyPWdGdGl87I7k=;
        b=H4VcZ+iP6dhqDs8XR+t0ghlUv/4Nv+OWJqsBF4btWTSJdsT3REw3QrNalNKdksqmMP
         KJdUUHFBEnavpifBA9eSuHiw09Ko4qrpeyjvJxc9vPzNz+n0z51JMIcvOPUDk3rGRKMD
         ljiNRW8vqQw2QqRXKAf9rTVj3zfto8VcDxHQH1tnxxfMzDjTYfzraizFfCn7HXOOQTeo
         SORCYPJS41W4mCaYLuW0m8t+ehJDwqPTMlpu8l0Z+aoZlSJ+zWUExiB7NfKL9IJNf53H
         r9H78dYLlCn0VrQpAGKdNi6Vn2GdGOQvZIdv3RHGof7gCtzktMMplr2rZ6DnFKRJ0lRv
         OR0w==
X-Forwarded-Encrypted: i=1; AKwUvBzZ2frp7BBEqodguKImPL7oe6ZSmoqdmPoW4kUSww0NkoV0DLJl0CsybTj/gcjsMCO3GcrweChVt8GChFg=@vger.kernel.org
X-Gm-Message-State: AFuF++neUa09udIdxozIqM/qQCJsHUVf0CiFwmASwp+VnTNWk3mTos2N
	ZAL1jUrLO+B7qS+0AhRsp4ZrG2hzGesehg2ry7OP0K3uWIocn1Y3yzvp
X-Gm-Gg: AYBFou1apa8vDFcFnQ3lml+PRa29GMQzIVRwMMT+y3ptrpWHA4Y82O65XZQsx9oJtvZ
	EhcobHsiDoPC1qFO8aMCOOWZqBd51ED1js7OmPQvGwNMV5/Hr9sVZaqoXXDFrJHy3AuwZf+n+TY
	pdHUks4CzbVAEO0qAvVyAc72FjZ6QQK71zmDgZkvmWkVHWVVuQgGPDpPbtNWfbXnruMWtXcocEs
	1SNuxN039Sm5yBK7hklZRn5WzSUIz7XiZqPmZs5LBzmGpC/gRyr393VNBOmUHHnjQTeaLbWy/Yo
	e1MYhQ/oHRNR6x9ywaCJ5V9ySV8EybZ2xg3nWRf2xJWf18vryAq46l+DESyCwlMFhJJ0XVdutV0
	4RZ9r/unCs9ptkCBltx/PBGcQuFwRzRLv8WDcoLFbrMiQYR316o/Z351X0toEGObAoPDL3TZE9R
	SdJiufzCHPycj6Z1ptyqcMA7gc8WO2ofsiAW7DWIMWNg6GzHLcGfYD5zqb9RTbJYh/LsS0y9A3W
	NbnMq+rdWKpbzwsM6V4axDsRvUaCpOFcRW7VCMrGx8z4Sw0P7rAsRj5QrJkJk6HrwTeiu/WcPO/
	Mb55
X-Received: by 2002:a05:600c:1d1b:b0:49e:7cc6:ec88 with SMTP id 5b1f17b1804b1-49fc7e00555mr163235615e9.1.1790064089430;
        Tue, 22 Sep 2026 01:01:29 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B80530056971C6280202175.dsl.pool.telekom.hu. [2001:4c4e:1b80:5300:5697:1c62:8020:2175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdaaf97e2sm18248625e9.2.2026.09.22.01.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:01:29 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Sidong Yang <sidong.yang@furiosa.ai>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jiaxing Hu <gahing@gahingwoo.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Jonas Karlman <jonas@kwiboo.se>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	=?UTF-8?q?H=C3=BCseyin=20BIYIK?= <boogiepop@gmx.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH v2 03/11] accel/rocket: search every core slot when looking up a scheduler
Date: Tue, 22 Sep 2026 10:01:06 +0200
Message-ID: <20260922080114.44662-4-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922080114.44662-1-royalnet026@gmail.com>
References: <20260922080114.44662-1-royalnet026@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sched_to_core() walks rdev->cores[] up to rdev->num_cores, and
rocket_remove() decrements num_cores for every core it removes. Unbind a
core that is not the last one and the cores behind it fall outside the
search, so sched_to_core() returns NULL for a core that is still bound and
still running jobs. Neither caller checks the result:

  rocket_job_run():      rocket_fence_create(core), core->dev
  rocket_job_timedout(): dev_err(core->dev, "NPU job timed out")

Unbinding the middle core of the three on an RK3588 while three clients are
submitting to all of them faults twice, once from the surviving core's
job queue and once from its reset work:

  KASAN: null-ptr-deref in range [0x0000000000000220-0x0000000000000227]
  Workqueue: fdad0000.npu drm_sched_run_job_work [gpu_sched]
  pc : rocket_job_run+0x234/0x838 [rocket]
  Call trace:
   rocket_job_run+0x234/0x838 [rocket]
   drm_sched_run_job_work+0x2cc/0xad8 [gpu_sched]
   process_one_work+0x640/0x14f0

  KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
  Workqueue: rocket-reset-2 drm_sched_job_timedout [gpu_sched]
  pc : rocket_job_timedout+0xf0/0x1e0 [rocket]
  Call trace:
   rocket_job_timedout+0xf0/0x1e0 [rocket]
   drm_sched_job_timedout+0x188/0x6a0 [gpu_sched]

Both are the third core: the workqueue names are its device and its
core->index, and it was left at slot 2 while num_cores had dropped to 2.

Search all the slots that were allocated, the way find_core_for_dev() now
does. A core that is still bound is then found, and the two callers get
the pointer they already assume they have.

This does not make unbinding one core out of several safe. An open client
keeps an entity pointing at the scheduler of the core that went away:
drm_sched reports it as not ready for every job that lands on it, and the
client waits in dma_fence_default_wait for a fence that will never signal.
Stopping the NULL dereference is what belongs in a fix; the rest wants
more thought.

Reported-by: Sidong Yang <sidong.yang@furiosa.ai>
Closes: https://lore.kernel.org/dri-devel/apwUewaRnoTNXHCt@rock-5b-plus/
Fixes: 0810d5ad88a1 ("accel/rocket: Add job submission IOCTL")
Cc: stable@vger.kernel.org
Assisted-by: LLM sparse checkpatch
Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
---
Unchanged from the standalone posting, which this series supersedes:
https://lore.kernel.org/r/20260905150432.7477-1-royalnet026@gmail.com

 drivers/accel/rocket/rocket_job.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
index f404355058185..4bc4f9c8ee403 100644
--- a/drivers/accel/rocket/rocket_job.c
+++ b/drivers/accel/rocket/rocket_job.c
@@ -283,7 +283,7 @@ static struct rocket_core *sched_to_core(struct rocket_device *rdev,
 {
 	unsigned int core;
 
-	for (core = 0; core < rdev->num_cores; core++) {
+	for (core = 0; core < rdev->max_cores; core++) {
 		if (&rdev->cores[core].sched == sched)
 			return &rdev->cores[core];
 	}
-- 
2.43.0


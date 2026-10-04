Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E52E35F602
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 02:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791080788; cv=none; b=VsyH4hV4dlwhiw2xYbdtENJ17hD3O7MoAbwp4CMA1Nsf5EH+VtDvYiNTa9F6ZMYAyBJVEc9IK85XYqxoC4T0+GuSLunpyTYc7h2ERHmweSqQ0rFiaodzAKpkINqx1q8I2Z0r0ua30lSJELnqE4+mvVmUWG/PYcmKxovATkYpyc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791080788; c=relaxed/simple;
	bh=emEZYzcpxTLoGOoO9FREghtqhbTyxBUSTdBs6pX27Wg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=exjXH2E+kUUiJttrDobMPmrxN7TWcPDqJ9p7tSjZyke0XhaydOCv1UGwd01lJmb5/3mqCI9B859JP2TmQLTCdeGttkIuGA0qbVlmNO77WQDForSmv4TImjkJmo5uCZeoaehIqhND5aJF7vxOlPZEHcaB+m7h0C+Y6FcCOmAcXhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oqrxMJnb; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oqrxMJnb"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-81eaf8e18bdso963525a34.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 19:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791080786; x=1791685586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pudvm4t8lLEQxc0z90DUb4vG+6ClTKnvhH/OoKD5ihE=;
        b=oqrxMJnbE4szwzur7lRWrnJuCZUadz+Z8OR0arkcJnCGXlOfBR6HDwIJPkLT67FFjt
         Z8qEsSpRMqtt9ZzN/fV7hMhIbaFTcveSar/j2y70sfzWoLx7+xCQqz24WrQqlgbg9fQ8
         eDguxqg9JND7Q3Rt04FdyY9TQMBVXYGZZw6erVbFO/RZSDExwSOQ2U6AkCPiRR0ysDUr
         XtU/SnUHTPQyWmOz+l97S5wQP7kNjJVusqF0g7pK2XBn9splH6WLPLfLy7lGRaCP3h0p
         mtQlzhXdYhdLA4QLr3R8t4xMj2yGxfYezfoABqx1PwVuhrP6mWzmnPlSFJSoiac4w6Yt
         WBjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791080786; x=1791685586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pudvm4t8lLEQxc0z90DUb4vG+6ClTKnvhH/OoKD5ihE=;
        b=uzXaGXkBX9DKjCOdBpWDxdkxYDCqohIMncKFau0XPVSlZV5LC9JRAkj51zS2E5KX3z
         GaTJykZyOKDZtD69gRDmJ8LNIO6C6BfVytiDbX2Ek40lSeknaev9vbqztGSX1sc4q4W1
         kMuKDBjR3PEstll8Yyf4bEdmaEnEBiZx40rzx/MN5bPpg54Q+754qVHwhPQGO/EvXcqr
         lVSfF2hJYPrpMTW8PoZdKTrW52PrKnlAciNF9UM5MChh54T4lotwBxHv25jNImY2h+iX
         LJwzoNDzHJuSbeE5gQ2V+w+uGurOzSFOtXtsfQJyGTQ7Q/RrqTq3/UlJMiCNt0ae0Wwh
         UI/Q==
X-Forwarded-Encrypted: i=1; AKwUvBxuY+Rn4rOMGlnrbXXMfw/vl2AfAW9RIiGdXfP0XW/3n2Or1EWq+boOorZUJOcy9MLl4m1FwAjXdyrD/UQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lnuEkNsDZqZRRP5vasOZtT5ozjjkCU2lUk3D1lIyUPJOXkOmJm
	v2XGl5KcNDGZRfZCPkmtJ8SYz69rep00mb1xf/DlaI2iBsKmtv8qC3pF
X-Gm-Gg: AYBFou0Iw6A+4S/7NmtIEJBpwcFXL/lSPdGkxxuahGj4fmZYU0LQ/8AstOCWjfuvkw6
	zqG6ILg8/Jy76zS4JzB8To+DdDvVtzc5vu/2qxkjI7+pGiB7KIKP2JSuzQjFwK1SgHDUJmE7gxK
	VNGbi+YKatynV6UBNkQEe3Z8SUbT8p2tlCc32o+4KlG948Nnc0ZIuo04cFbxsd8V+wzvOqCgopg
	XFPl4nlmjtVVDOabM+o5ORfTUo3KoPMwRqhxsersWB0MKRLyXbqvjNAaAgYouAGSiHJPdU2SORJ
	6g2VckDWtSjMr24+pCdy418qJH6R0cf+g6Py1a8YsNZ7lcwKED8ZGYE7Vd8+rl4r463FYXdmS92
	BVQNc1Qvtz2AAq1tK6bXRX8Mqg3OJjqfevK4PGmzxrSs8zxJVdF2ZJrxfiXozDMRMWKaiIie8Tm
	XVFMtUpcJ7qfghHUsXQXMI5H0+3YRvH0E6jxBTHzra6vPgnb6tUO4HuT+IsDcHFKAas9uUZMVk+
	jlNjIQ6V2S5E/SUjbldXDxZ3iWwYlcC8v5I0ordVsHQ0+vzg4O4xhKLvBStB71ba8tu03vKDS0G
	6j2dynd86L37EY/jnkxPPd1rnFzrAIFUCJOVKr5AzMrAOQFoMwRAVuT9q0jts3rMM5rw29HwPhN
	PDjgnbfamW0C0eSgLebt0SBGXD1MEJ8g=
X-Received: by 2002:a05:6808:4fe9:b0:4e8:bce4:993d with SMTP id 5614622812f47-4f679edd300mr4833547b6e.11.1791080785808;
        Sat, 03 Oct 2026 19:26:25 -0700 (PDT)
Received: from ThinkPad-X1-Carbon-Gen-12-nixos.rudd-tetra.ts.net (174-16-208-129.hlrn.qwest.net. [174.16.208.129])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-49e1b2e3664sm5158233fac.7.2026.10.03.19.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 19:26:25 -0700 (PDT)
From: Jonathan Gopel <jgopel@gmail.com>
To: andreas.noever@gmail.com,
	westeri@kernel.org,
	YehezkelShB@gmail.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan Gopel <jgopel@gmail.com>
Subject: [PATCH] thunderbolt: Do not RPM complete unrelated subtrees on unplug
Date: Sat,  3 Oct 2026 20:26:04 -0600
Message-ID: <20261004022604.359663-1-jgopel@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a Thunderbolt device is unplugged, that switch and every switch
subsequent to it on the bus device list is `complete()`d, not just its
child devices. In the case of multiple domains, it may cause, eg, an
attempt to `complete()` the uninitialized domain 1 root switch RPM
completion on unplug of a switch from domain 0 (though ordering is not
guaranteed numerically sorted).

I initially noticed this issue on a Dell XPS9720 when the system would
seem to sporadically not wake after unplugging a Thunderbolt dock. I
tried multiple kernel versions including v7.2.7 and v7.3-rc4 to see if
that resolved the issue, but the issue persisted. Eventually I found
that I could consistently generate a kernel Oops reporting a page fault
at 0xffff_ffff_ffff_fff8 on unplug from one side of the laptop and went
bug hunting. I became suspicious of the `bus_for_each_dev()` walk that I
ultimately ended up changing. To confirm this issue, I did an eBPF trace
of `bus_for_each_dev()`, `complete_rpm()`, and `complete()` while
unplugging in a variety of situations and found that an unplug from
domain 0 tries to `complete_rpm()` domain 1's switch, whose RPM
completion is not initialized and thus is holding a null wait-list
pointer, triggering the page fault.

Here are the key sections of that eBPF trace. Note that HEAD denotes the
completion's own wait-list HEAD:

```
RESCAN_ENTER domain=0

COMPLETE rescan_domain=0 target=0-1 target_domain=0
         route=0x1 parent=0-0 unplugged=1
COMPLETION done=0 head=HEAD next=HEAD prev=HEAD

BUS_WALK domain=0 start=0-1 callback=complete_rpm
CALLBACK_ENTER rescan_domain=0 dev=1-0 parent=domain1 is_switch=1

COMPLETE rescan_domain=0 target=1-0 target_domain=1
         route=0x0 parent=domain1 unplugged=0
COMPLETION done=0 head=HEAD next=0 prev=0

        complete+5
        complete_rpm+43
        bus_for_each_dev+133
        icm_free_unplugged_children+250
        icm_rescan_work+42
```

To fix this, I have reused some of the adjacent logic to recursively
walk and `complete()` only the unplugged switch and its descendants.

I only have a single system with multiple Thunderbolt domains - the Dell
XPS9720. I am consistently able to reproduce the Oops on that system.
Since running with this patch, I have not seen the Oops reoccur. I have
also tested it on a Thinkpad X1-Gen12, and that system boots and runs
well with it, but it only has a single Thunderbolt domain, so it does
not exercise the multi-domain failure case.

Signed-off-by: Jonathan Gopel <jgopel@gmail.com>
---
 drivers/thunderbolt/icm.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/thunderbolt/icm.c b/drivers/thunderbolt/icm.c
index 669807f0eaf8..d6801d8b669b 100644
--- a/drivers/thunderbolt/icm.c
+++ b/drivers/thunderbolt/icm.c
@@ -2068,13 +2068,16 @@ static void icm_unplug_children(struct tb_switch *sw)
 	}
 }
 
-static int complete_rpm(struct device *dev, void *data)
+static void complete_rpm(struct tb_switch *sw)
 {
-	struct tb_switch *sw = tb_to_switch(dev);
+	struct tb_port *port;
 
-	if (sw)
-		complete(&sw->rpm_complete);
-	return 0;
+	complete(&sw->rpm_complete);
+
+	tb_switch_for_each_port(sw, port) {
+		if (tb_port_has_remote(port))
+			complete_rpm(port->remote->sw);
+	}
 }
 
 static void remove_unplugged_switch(struct tb_switch *sw)
@@ -2088,8 +2091,7 @@ static void remove_unplugged_switch(struct tb_switch *sw)
 	 * tb_switch_remove() calls pm_runtime_get_sync() that then waits
 	 * for it.
 	 */
-	complete_rpm(&sw->dev, NULL);
-	bus_for_each_dev(&tb_bus_type, &sw->dev, NULL, complete_rpm);
+	complete_rpm(sw);
 	tb_switch_remove(sw);
 
 	pm_runtime_mark_last_busy(parent);
-- 
2.55.0


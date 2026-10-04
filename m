Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653C746E007
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 17:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791134070; cv=none; b=InLbKF+NLNbU9qVSNbCO46Tsh9kFQWdW3RKn2UUx7exVup7NADfZdrqxANHW82VZvvi32N5vs1UYN2wLztjH6vEm0uAwm3EW2XNg6Z0LOEcibgtY2wbGur/YJLHKaU8uqeTA+OOheRcHzij2SWkJRrje4q8JcqF6BpLSIEFuFAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791134070; c=relaxed/simple;
	bh=vfsZLTdTVidlI53hMyq/CeT6SvqlKRmwRggX6mTnL78=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Po0g6yqFgWj11Ib2CnprstXqQY/emKpwyXhbB2X+VXO3f1rQXdnofVmNWVdaKKUA8Lc/LUqMeUewN5XEuxWDXVejU/pNpi/SJvK4O2QJD3RCn/XKppGXjZqSDSwcDJL/fODUzLQUT1DSInKGuP12Y2/dzPtJT1fz43CLqusySU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mUXWfurg; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mUXWfurg"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466cc9b4b63so161456fac.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 10:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791134064; x=1791738864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GCGb25zEU2Mob3oRjLf8cEiLXGHHAlkDlqIrIRbuytQ=;
        b=mUXWfurg5wPgglP6W5eCKRhyFOx0teS2EDT6XuIAqHJE/Uj4NMQVIBeUv1Pkc404/8
         3pWI7ez76fpB2IszT62+L1fIPoWyNRswc6PDoKHc1A6Gsdlx2QckYOJGggfd5X2dryaC
         5kQBLEIaCnB2gQQkwrGcGsdkRvX4XtyjFIglIJpkCQkEK8nrnWBudB81U7hSWQYY+Mnt
         wM/T94SVvj4sUVpbu8DEL+TSvZIZvZ06DfQUQ1is+EQhMmUELPtjyYQr3KecqnZHm3W1
         zHVW+zPNOX9mu/shT/3BkZVvgtYk5JXLkrzZdKK3X5KT8hgiVLs+1h/ySh4W4x7wJZDu
         5E1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791134064; x=1791738864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GCGb25zEU2Mob3oRjLf8cEiLXGHHAlkDlqIrIRbuytQ=;
        b=Lpmm0JbzIO140wNaSIXo0URCmDOGWklxJUOHQpUTsGQ0v6Tf423kRUg7SnCdssruhw
         8xFPRJSS0KoRfxBA7Zj41fnkbE4HT4pS6i+sORgbHbWkEAu2aEZwl1JIhZoFhv7ufHcp
         +wF5GxMuLvdyz76IOGq8UQSkeuY8mAPkAOszq6Frg6Tq6l92rXrLw9rSf958JdW79lJG
         1ciUCmjDlk6dEq22kOzerdQ47Opp6JHtXJJOGEqkbwTInfJ/sWjF9Y/4hukwqHt9d+Md
         Hvyxsrh/cPRfE4lh4p3NkmU/E3+vt8BF1lr+OH7J3WPVLHQszsb/FFQsBh5khP6j9/9H
         01WQ==
X-Forwarded-Encrypted: i=1; AKwUvBzqPgZzniwZRr4IBFr52MND2kDzkNDrSml8JiqqOFts0jzIlq5HOSPSJor9VEm6IStKe8myWaclzuh8DjA=@vger.kernel.org
X-Gm-Message-State: AFuF++nTQaPQ7KqeK1sfxAVnDbbpwB6AmXdE2z7P6ktwPbhQYoXd2Kc5
	LrDBQr1nBz2LSzWsb4EibSIxPLX69Qph4fNP2GCYxDs39rabY4zth0uf7K98fw==
X-Gm-Gg: AYBFou2jcTrFGWo0UvxJi2Ya29a/7r9fLGNWG5svxqZRzfg39NtelDcb9YiiXsuyWMv
	BUHqOBzU0zpxYo/VMaeJOhEU1QTlBWCXZByaKOQ8IGWkLc3D91j1l1Ykdoa42ybStexLye7wRxU
	ziO6+hwId1ZMRhCKaLMmnvO/U9mV+4CFRGLXOicTL7kbR4jL4W0BpPZJhNUXRzm1yfDNnGUga6N
	oDcNmwVB1HPV4z5Cu8I23mtWeE4BSn5VHxDtu3jj9bXwGrl+hEH1+nHbcPGDJUTPaX6QJx6PH5F
	JfD6I4wizhBKVFJFtH21KR4yFAVwd3YiHLdhZNSPyjPWre5/db8PQymEOY/sDLlAmDl1XIgbd+C
	q9ILLMzf76I3IYQXdMZMNM+qtrdBEIU/54UZoeNCk9GVxq6pdbhhRLvye/TuOqtkZKL90u217bU
	x/eH6Y8ipPVB/qs+kDy1KO+7PE+D6synRrFs/diJyUM9EK3ul2l4pauPCWMCgculY4fyRvp6kQB
	r30/8SvdyGSg2lYsEuC6Rn8pEyYVwle+NyHDU51QU3UPraNEDQu+VoQBoLWNrE79tvJPufF4zxE
	FbR1WeeDo748pKDEsL0Fw+Xah0nDX0IMGnCEUDKar9uUqcd1bDXnLXvyTnX15xSobvmev3vS45k
	=
X-Received: by 2002:a05:6820:2009:b0:6e1:9b50:eb05 with SMTP id 006d021491bc7-6e19b50ef5dmr2320612eaf.46.1791134064255;
        Sun, 04 Oct 2026 10:14:24 -0700 (PDT)
Received: from XPS-17-9720-nixos (174-16-208-129.hlrn.qwest.net. [174.16.208.129])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6df3a1cfa53sm9173230eaf.5.2026.10.04.10.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 10:14:23 -0700 (PDT)
From: Jonathan Gopel <jgopel@gmail.com>
To: mika.westerberg@linux.intel.com
Cc: andreas.noever@gmail.com,
	westeri@kernel.org,
	YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan Gopel <jgopel@gmail.com>
Subject: [PATCH v2] thunderbolt: Do not RPM complete unrelated subtrees on unplug
Date: Sun,  4 Oct 2026 11:13:50 -0600
Message-ID: <20261004171404.448474-1-jgopel@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261004120255.GI176164@black.igk.intel.com>
References: <20261004120255.GI176164@black.igk.intel.com>
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

This patch gates the `complete()` on an additional condition - that the
Thunderbolt domain matches the domain of the device that was unplugged.

I only have a single system with multiple Thunderbolt domains - the Dell
XPS9720. I am consistently able to reproduce the Oops on that system.
Since running with this patch, I have not seen the Oops reoccur. I have
also tested it on a Thinkpad X1-Gen12, and that system boots and runs
well with it, but it only has a single Thunderbolt domain, so it does
not exercise the multi-domain failure case.

Assisted by: LLM
Signed-off-by: Jonathan Gopel <jgopel@gmail.com>
---
 drivers/thunderbolt/icm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/thunderbolt/icm.c b/drivers/thunderbolt/icm.c
index 669807f0eaf8..c1e6b2ea63cb 100644
--- a/drivers/thunderbolt/icm.c
+++ b/drivers/thunderbolt/icm.c
@@ -2071,9 +2071,9 @@ static void icm_unplug_children(struct tb_switch *sw)
 static int complete_rpm(struct device *dev, void *data)
 {
 	struct tb_switch *sw = tb_to_switch(dev);
-
-	if (sw)
+	if (sw && sw->tb == (struct tb *)data) {
 		complete(&sw->rpm_complete);
+	}
 	return 0;
 }
 
@@ -2088,8 +2088,8 @@ static void remove_unplugged_switch(struct tb_switch *sw)
 	 * tb_switch_remove() calls pm_runtime_get_sync() that then waits
 	 * for it.
 	 */
-	complete_rpm(&sw->dev, NULL);
-	bus_for_each_dev(&tb_bus_type, &sw->dev, NULL, complete_rpm);
+	complete_rpm(&sw->dev, sw->tb);
+	bus_for_each_dev(&tb_bus_type, &sw->dev, sw->tb, complete_rpm);
 	tb_switch_remove(sw);
 
 	pm_runtime_mark_last_busy(parent);
-- 
2.55.0


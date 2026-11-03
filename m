Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793716817;
	b=BOdlcj4NmAuVEoAeT/HZmDrLFYe3IoZdW/in+F1x6cDvn2cox7UTh3vl5jqWF1zEZK04
	 6vufVAdynGZ3lj2cpH/N5Nd4U/Sihc0rIaXfjg9VAv6HIrMZt+vLGUmGYls12RCeYpCSm
	 vRzOYHVKR128TGUtYNlUdWyEkkufyJvDm4IXwW2IKGTGWyrt5xzU4xpEwoKCfGZGdwIb1
	 3I1yYFYguUWL86CzawzWfy316+9VnpHBYEeS04zxhlSoV1fkRB3ojfx/GeR6sx5IbAs2y
	 fsZ2A9/fV5YctG/qqPoJiVyyUtxC73NFb47QkJRQKRd2TlNyGNSdWItYTy4Djd6owLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716817;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Gs5+MUVCUFpHGD304h1ti8CPR/+CDqRB4o1YL2rOSQE=;
	b=sEx1R6N3LyawF9OygBx7xi3UjcASqnFIy9epT6pJl+81TX8X4G4kUMNd93HPa0EfdZc5
	 jJLzOQ612IgzblCpomJfZlwUge6Wn0VKm2BUAuQgdFppOu0Okj4EUNXaZHwRyNCa/HkFg
	 AKJdP8vfehgCmjx6wyAcgYqTyWHgmKS66jK4Y0gIDr72yPzysCy/kLDH1TccINyTye6Av
	 RsGQLhIJkMW/jWdWhffE4Rzz09DVd1eGlvzkGtTzlz9aJzlUBGCrUiLPe8nqGHo/nYsiF
	 oxX9pww3OpAFP3lAivtLHipqLCuzNdr7+Wc2MnGguxYsPPsz1mx/JMt28Hekt9MVDew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gq4Sjd1n;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF54606D829
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:40:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AF54606D829
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gq4Sjd1n
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e9d1114320so33758865ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793716816; x=1794321616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gs5+MUVCUFpHGD304h1ti8CPR/+CDqRB4o1YL2rOSQE=;
        b=Gq4Sjd1nkr806ZfkHPCD8I+Wq7PFRBibp43p12T5dqn6XYKP0JgKCuSbp0Ffqpj9tJ
         JFuN2zand4F1B0DFfBUO/9SUwHIYMKiELFyoj2ov8BFFaZbrqKKLraB1qtQ7dKKqzlXy
         cBG9yXObS+fpxB9b8aCxG6CkZUBl4gMfDW6LID7aZ29CyvlL9cCY9ipkVqD0yLQTs8jD
         6rEYgND1oVlM+Qgyf7J62X2yF9e60GjrbHpvfy6kci2JQkRjVsPuwNOObhvToqAyO1c3
         Bxh401YLw5NKUiUW/STsm3vghJ1m71Ee0eKDtAhqDPVOaD9Wy/PTbeXqjNIjjQIOoY66
         nEYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793716816; x=1794321616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gs5+MUVCUFpHGD304h1ti8CPR/+CDqRB4o1YL2rOSQE=;
        b=Ivbp9yVXikDU1rC+8ujZKu3hv8QK/NkJoSIOhaqaxRHTcb7zPmslJ86ZowwMSBjVwT
         ihGVp7kSX2iX0oyzOJu57xJIDDRXQskTviL5sq0lAC47Qal/9WlsdWxJKmqbGZguk4aK
         Yk7B0/utOGbWezRNcS6xLHmeOI3bkNXA1/PkLJUfMMYSk61tbk4Yjcc/X4D3sIDPrfDO
         isyW4bgvKmUE0vxlB6NMIiJaiVSmCmiXjdrlZ/Y7Cbz+4GxBNwezTh/Hr23SfK3eStxh
         z+udFylU4puYAWHeaDFzt4dFmskLoApugM8Dmxz3fDzy1tHhje3q91eg5FM8NO3ie6X6
         EHaw==
X-Forwarded-Encrypted: i=1; AKwUvBwYJCxNeCHzMRGOB6nP8ZorIMFa+sR1cUjo41otah1HuC0VzLxG03eOKKXTtIda4phFOkTl77kC00Qx770=@vger.kernel.org
X-Gm-Message-State: APuU4Z9R3nPXGQs2701TdwLvMylkLWrtbXO2Wowhvl/rB8PJrWAtmkEr
	zE5H/DnteHCyQDHzrCrLdxhj+D+Mc70CYjwSmGeAjozrbyVwAI2EPLBR
X-Gm-Gg: AYBFou0+0TwdNnEIwCtIUc9aF00tG+CTuCEKDLFlfIJ+JLk3hv7JQKhfaik3YoDvp8R
	OUiUm0GBGZ+Vc4nZrZKbfH8tNkrVe/7emUR/kcZLIZRBAEjScIF9lfOyR7u83oHk4JgHe5D+Blw
	waEruBK+tVvj+NLyAQtUdgVBCkvEG9a2z0jJdi30QUtqS0xoRoWHxlQWBCQ88jqC97GipRdPDvL
	AfDUCojxRVDF7filkGqjR4yPw7w/z1ZGdB5shECBi1OLoy5nVBTtMWU67wNEMYxLaMhD13pHasn
	u0gXbHSJxUwg8ynXXF2wJMCOPD91OBXgojgt2zbbxWdR+zKDF9ZJwqkxrlDkcD23CPLruB0qU9M
	NZyKqe6UdRHv2UqOaHvVoccY958J1kbUqE8acJPY71RcUksPdv8u9esoj0pThiKJeM7JfEc0gU+
	9tvp9G+mx6NMPnW6gR2wRw9LgPLSuCa/iTa6E+2AXf23erhLboIn8W6DPZcun1CoCNpRHHsbkQU
	yhEffVI2Abwxl0NbyWDwcDjAwConx2Ju3HeN7SyU82O5KnnTjAgthb20fzrb+902iINzGzgeFIg
	RYl40dD8s0ZeGDsVcHfWuPmGoda2/4k1OvvoVJMraQjPA49jf5ov/kVrGuFIXSinbg==
X-Received: by 2002:a17:902:cec9:b0:2e8:5202:aa8c with SMTP id d9443c01a7336-2eb364f0a21mr124331295ad.48.1793716816439;
        Tue, 03 Nov 2026 06:40:16 -0800 (PST)
Received: from localhost.localdomain ([2400:d802:dd7:8000:314f:4575:be3:a064])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39052edasm42898465ad.4.2026.11.03.06.40.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 06:40:16 -0800 (PST)
From: Yuqiang Sun <izaiahsun@gmail.com>
To: haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com
Cc: mhklinux@outlook.com,
	stephen@networkplumber.org,
	linmq006@gmail.com,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v3 1/2] Drivers: hv: vmbus: Keep the channel when vmbus_add_channel_kobj() fails
Date: Tue,  3 Nov 2026 22:40:05 +0800
Message-ID: <20261103144006.69857-2-izaiahsun@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103144006.69857-1-izaiahsun@gmail.com>
References: <20261103144006.69857-1-izaiahsun@gmail.com>
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

The channel is freed by the release of its kobject, and free_channel()
drops that reference. Since commit 8bc69f86328e ("Drivers: hv: vmbus:
Fix memory leak in vmbus_add_channel_kobj"), vmbus_add_channel_kobj()
also drops it when it fails, as kobject_init_and_add() asks for. That
frees the channel, and both callers then go on with it:
vmbus_add_channel_work() unlinks a sub-channel, unmaps and releases its
relid and calls free_channel(), a use after free and a second
kobject_put(); for a primary channel, vmbus_device_register() unwinds
through vmbus_device_release(), which removes the channel too.

The kobject is also only initialized in vmbus_add_channel_kobj(), so the
error paths before it, for instance a vmbus_device_create() failure in
vmbus_add_channel_work(), call free_channel() on a kobject that was
never initialized: kobject_put() warns and does nothing, so the channel
is leaked, and removing the attribute group from a kobject that is not
in sysfs warns as well.

Initialize the kobject when the channel is allocated, so that
free_channel() is the one place that drops its reference on every path.
vmbus_add_channel_kobj() then only adds it, and leaves the reference to
its callers when it fails. Remove the attribute group only if the
kobject was added.

Fixes: c2e5df616e1a ("vmbus: add per-channel sysfs info")
Fixes: 8bc69f86328e ("Drivers: hv: vmbus: Fix memory leak in vmbus_add_channel_kobj")
Cc: stable@vger.kernel.org
Signed-off-by: Yuqiang Sun <izaiahsun@gmail.com>
---

Notes:
    The bug was found with kbound, a research static analysis prototype.
    The patch, the changelog and the test setup were written with the help
    of an AI coding assistant (Claude); I have reviewed them and tested them
    as described in the cover letter.

 drivers/hv/channel_mgmt.c |  5 +++--
 drivers/hv/hyperv_vmbus.h |  1 +
 drivers/hv/vmbus_drv.c    | 25 ++++++++++++++++++-------
 3 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/drivers/hv/channel_mgmt.c b/drivers/hv/channel_mgmt.c
index c42def04ac41..cb1d8d76928f 100644
--- a/drivers/hv/channel_mgmt.c
+++ b/drivers/hv/channel_mgmt.c
@@ -367,6 +367,7 @@ static struct vmbus_channel *alloc_channel(void)
 		     vmbus_on_event, (unsigned long)channel);
 
 	hv_ringbuffer_pre_init(channel);
+	vmbus_init_channel_kobj(channel);
 
 	return channel;
 }
@@ -663,8 +664,8 @@ static void vmbus_process_offer(struct vmbus_channel *newchannel)
 			mutex_unlock(&vmbus_connection.channel_mutex);
 			cpus_read_unlock();
 			/*
-			 * Don't call free_channel(), because newchannel->kobj
-			 * is not initialized yet.
+			 * Don't call free_channel(): newchannel was never
+			 * added, and its kobject holds nothing yet.
 			 */
 			kfree(newchannel);
 			WARN_ON_ONCE(1);
diff --git a/drivers/hv/hyperv_vmbus.h b/drivers/hv/hyperv_vmbus.h
index 33923621a5a3..7865a519dd7f 100644
--- a/drivers/hv/hyperv_vmbus.h
+++ b/drivers/hv/hyperv_vmbus.h
@@ -408,6 +408,7 @@ struct hv_device *vmbus_device_create(const guid_t *type,
 
 int vmbus_device_register(struct hv_device *child_device_obj);
 void vmbus_device_unregister(struct hv_device *device_obj);
+void vmbus_init_channel_kobj(struct vmbus_channel *channel);
 int vmbus_add_channel_kobj(struct hv_device *device_obj,
 			   struct vmbus_channel *channel);
 
diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
index 4692687cdbf3..fc0f16f51266 100644
--- a/drivers/hv/vmbus_drv.c
+++ b/drivers/hv/vmbus_drv.c
@@ -2084,6 +2084,15 @@ int hv_remove_ring_sysfs(struct vmbus_channel *channel)
 }
 EXPORT_SYMBOL_GPL(hv_remove_ring_sysfs);
 
+/*
+ * vmbus_init_channel_kobj - initialize the kobject that holds the channel's
+ * lifetime; free_channel() drops its reference
+ */
+void vmbus_init_channel_kobj(struct vmbus_channel *channel)
+{
+	kobject_init(&channel->kobj, &vmbus_chan_ktype);
+}
+
 /*
  * vmbus_add_channel_kobj - setup a sub-directory under device/channels
  */
@@ -2094,13 +2103,14 @@ int vmbus_add_channel_kobj(struct hv_device *dev, struct vmbus_channel *channel)
 	u32 relid = channel->offermsg.child_relid;
 	int ret;
 
+	/*
+	 * On failure the kobject keeps its reference: the callers' error
+	 * paths drop it in free_channel(), which also frees the channel.
+	 */
 	kobj->kset = dev->channels_kset;
-	ret = kobject_init_and_add(kobj, &vmbus_chan_ktype, NULL,
-				   "%u", relid);
-	if (ret) {
-		kobject_put(kobj);
+	ret = kobject_add(kobj, NULL, "%u", relid);
+	if (ret)
 		return ret;
-	}
 
 	ret = sysfs_create_group(kobj, &vmbus_chan_group);
 
@@ -2109,7 +2119,6 @@ int vmbus_add_channel_kobj(struct hv_device *dev, struct vmbus_channel *channel)
 		 * The calling functions' error handling paths will cleanup the
 		 * empty channel directory.
 		 */
-		kobject_put(kobj);
 		dev_err(device, "Unable to set up channel sysfs files\n");
 		return ret;
 	}
@@ -2124,7 +2133,9 @@ int vmbus_add_channel_kobj(struct hv_device *dev, struct vmbus_channel *channel)
  */
 void vmbus_remove_channel_attr_group(struct vmbus_channel *channel)
 {
-	sysfs_remove_group(&channel->kobj, &vmbus_chan_group);
+	/* A channel that failed before vmbus_add_channel_kobj() has none */
+	if (channel->kobj.state_in_sysfs)
+		sysfs_remove_group(&channel->kobj, &vmbus_chan_group);
 }
 
 /*
-- 
2.53.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792464660;
	b=mKVNWjueD79VF2wOFrdfQmLMq5fqgDACzIEm60BO51tYGEx0ENedfxZAWOpyhpKhPH3s
	 1Iw42Hqi+pNk4z9ChUor6K7o6rRr5MrA+pi2Bj+EkrsqEC3NJOAqCxbW65wzEK86JD9qS
	 CO1qruU2nzIoov0c5AYdQg/ecN+CItNC6ExiJH1FinEliXBqUDKEcvOVksV+DkU9pU4LU
	 vn7Nngyc7T7hLsPNAkZ6aDDYlQ0xeBSX6hDdbWch6dhtsnfyTXHRlAmArbe+DNyfDOZ9r
	 j7sW/myy3M4oXPp7Ou2lIShNDFqCRrMP26khrwZAdGmAk0z5fEjIn2cJd/jVdE9/kHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792464660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YrHXlTj62K9347P7OmkxD9vCvcqzaK1MyEYVZ/+sypU=;
	b=a6BBALiuesOvc65S1Wsr8e7k10gZMmpuOxeLmH0IxzvmNv1KjRUjdZ39YI3Fqw1B0ye7
	 vMLjOCLNs5+K205XVmet9WItxLQ2Dr8sZ7UB/uwCS35X9obHh6zVF8+QeqHygHO93ZVqJ
	 Haj59E/NSipMlykStzvJQY9RRT53jC+h2bXsBCAnJxtKUDRrYRRdM3d7FRddgMLj+E+V+
	 u9am2RQLs418viScxh2704uXyvMNvlzCzLONGnF5IjSzBImFz472pw4K5dKhyGwgbpdg4
	 KEFJMTLNRScJeupSRe/NWmtL/cLgUT5DNGEGE9xX84uWMhT2La1h7RtVGHl791G+Hgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DRml406R;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B6D606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 02:51:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39B6D606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DRml406R
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso1090784a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792464659; x=1793069459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YrHXlTj62K9347P7OmkxD9vCvcqzaK1MyEYVZ/+sypU=;
        b=DRml406RG57NaOdh3ED/sNM7uMKO6h2ZVf4JyUI7Yk9/FGJXnsLtzqX2zgSBgjPwMx
         MV3k0gwCdFs566QTZVddeTG2eTcpk9xAYqMwr/sgLL0WKB/ZjBYrV3aOznguUjFaL54G
         d/cVRElUpyNt4HQQOka3Us+qQBakbxpqVWa1TqM0BepWGCv7DXKxOQsFS6MB6Lbcnr2v
         Q0z5vjX7HcL7+IrK7teMhWmMl4hTcyCjnrAdeTjC2cTO6f2UFGa/MywT8kZv9pZ0D+pc
         xfm4oOeHPxFb5dhfSpCWSxytZ4X+huZfO2E/X7kQeE4xO/RdgzbqjDiPpJvhUJ3YHpv3
         Tiuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792464659; x=1793069459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YrHXlTj62K9347P7OmkxD9vCvcqzaK1MyEYVZ/+sypU=;
        b=Zk+UDfLUrqQaOLEAeQrHEPxsuRpZiZKe3SisfZDmVeEipCVdMmQKORgDno4fUAT1IQ
         Zwz3Wn5FNNKouqDI9Ldm1999GVpIFE3JfWYN7dlqzVFZCFjUlKSOEkFVkS7TqWWAyDQp
         JoduL+6CI+LarQ0B4Riek2ZDCKTPAzaVdsZy8ZYBxsdqcBHHRPXIHYDB43ELUaes6e6f
         oatoBVqTUBv40xzW4XGAtn47dsh8ndty/O9Clw75HqkJYVDl564cL6ih8rsEmB7Q2Jh3
         uVU5Ub656upTQ7bpk4hZ5E3T6LJKj7Byl5KPKKwoflUjwe9YouF9GRs3+5WueHB65wgY
         zECQ==
X-Forwarded-Encrypted: i=1; AKwUvBwfiiZBuIVKze96NgAx8bZW/LQC7Thb9TLtHXM8pIMI18pAjO93GOmjdRcYklFU1SKTl/oJ3TOs1O1CksA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJLVAKf7SP2oSD0oLRbB9P8AkB8uBBmmdzryJvPxmqt+W3mGlLs
	Atk+Np+tnDeXRiTn6Y8V2KBbxfXnguhHRmRHyMmbHS7CkqD2GxQ+wTGQcGk0/i5l
X-Gm-Gg: AYBFou2hHSllAwJN6NWiWYgPMZMOMTJxf0u/hOdgKF2roE8Bn5Op72gAejDR6TYrk8v
	u3vMyCRe4NQLSQng77NVTs+dU8mLGe/0GxLocRryOPoaM3jYlnUTHAZLOJg4uEHfHq1xvqQrWu9
	bF+0T3tGm9CK7P4hy32lQ8T79kQ8/ctyM+5y8Stp9B6dhE9Ltd03lCH7KhlnOWXpvs3qONBS6Iw
	FPkXSZKqz1ZmW46eiD292FoLJOI05Xe7mBhFzWaheyDljrIWNTfeIAgb+gOIDPckbKIY3aF3nqo
	SVgUhIhEmpYSiAAkJbNtQjro79M+ltYulyb/eMdOwfC4X1pJKK5mJ3V/ARYqtoXCkN9GeSChx1Y
	8DP55resDuM8Ww5HnhCHBUA3WzkeTdvQvMq4KWOu94s/887CpjsoBsr0m+xP+hiC4i/GK14GdDj
	DvEFuwsuXUVctYV8O4W7VASit4tweB4MMK/VwXYAzttnCyeYEEiFxS21Nf0soOmm9O6U1aiEgSG
	hoZb5NPYW3zQjhNwgCC8jtxJJFUU8aNzizh6knAHWnjD84KkjYrTraq0I+pZTfyvL7l5jHacXn0
	aOYuZ8Wa3Gfsexfi4SrQu6w+NPehB6uWoevAZBBGP8Nj3O09
X-Received: by 2002:a05:6a20:a121:b0:3de:76da:6b9 with SMTP id adf61e73a8af0-3e226057ab4mr8478461637.68.1792464659552;
        Mon, 19 Oct 2026 19:50:59 -0700 (PDT)
Received: from EAIT-H54D9Q2FJQ.eait.uq.edu.au ([130.102.10.249])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f579464besm4613442b3a.34.2026.10.19.19.50.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 19 Oct 2026 19:50:58 -0700 (PDT)
From: Yu Zhang <yuz08559@gmail.com>
To: Keith Busch <kbusch@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>
Cc: Maurizio Lombardi <mlombard@arkamax.eu>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yu Zhang <yuz08559@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] nvmet: take subsys->lock while force-reconnecting in nvmet_subsys_attr_qid_max_store()
Date: Tue, 20 Oct 2026 12:50:47 +1000
Message-ID: <20261020025047.88297-1-yuz08559@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014054727.53183-1-yuz08559@gmail.com>
References: <20261014054727.53183-1-yuz08559@gmail.com>
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

nvmet_subsys_attr_qid_max_store() sets subsys->max_qid and then walks
subsys->ctrls to force every controller to reconnect, but it holds only
nvmet_config_sem (for write).  subsys->ctrls is protected by subsys->lock:
nvmet_alloc_ctrl() adds an entry under subsys->lock, and nvmet_ctrl_free()
removes it under subsys->lock with list_del() + kfree() (not kfree_rcu).
The free path takes no nvmet_config_sem, so the two locks are independent.

A controller teardown (host disconnect, keep-alive timeout or fatal error
-> nvmet_sq_destroy() -> nvmet_ctrl_put() -> nvmet_ctrl_free()) can
therefore list_del() an entry while qid_max_store() is iterating the list,
corrupting the walk.

KASAN, concurrent "echo 128 > .../subsystems/<nqn>/attr_qid_max" racing
nvme-loop controllers connecting and disconnecting, panics in seconds:

  BUG: KASAN: null-ptr-deref in nvmet_subsys_attr_qid_max_store+0x10d/0x1b0
  Read of size 8 at addr 0000000000000090
  Call Trace:
   nvmet_subsys_attr_qid_max_store+0x10d/0x1b0
   configfs_write_iter+0x1a7/0x250
   vfs_write+0x5df/0x940
   ksys_write+0xfd/0x1e0

(also seen as a general-protection fault dereferencing a LIST_POISON
pointer at the same instruction.)

Take subsys->lock around the list_for_each_entry() loop, matching every
other subsys->ctrls accessor.  ->delete_ctrl() only queues asynchronous
controller teardown, so it does not re-enter subsys->lock under the loop.

Fixes: 3e980f5995e0 ("nvmet: expose max queues to configfs")
Cc: stable@vger.kernel.org
Signed-off-by: Yu Zhang <yuz08559@gmail.com>
Tested-by: Yu Zhang <yuz08559@gmail.com>
---
 drivers/nvme/target/configfs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/nvme/target/configfs.c b/drivers/nvme/target/configfs.c
index 2b69ffc..23418fa 100644
--- a/drivers/nvme/target/configfs.c
+++ b/drivers/nvme/target/configfs.c
@@ -1684,8 +1684,10 @@ static ssize_t nvmet_subsys_attr_qid_max_store(struct config_item *item,
 	subsys->max_qid = qid_max;
 
 	/* Force reconnect */
+	mutex_lock(&subsys->lock);
 	list_for_each_entry(ctrl, &subsys->ctrls, subsys_entry)
 		ctrl->ops->delete_ctrl(ctrl);
+	mutex_unlock(&subsys->lock);
 	up_write(&nvmet_config_sem);
 
 	return cnt;
-- 
2.43.0


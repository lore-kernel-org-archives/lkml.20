Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821103CA4A9
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 18:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789929040; cv=none; b=Th7AI1aAi3qupimiCTA6QB+SUFT9npuTP8uGDCS/ms1uWT1Gw9d9UveUjShw0xfEtaOutKBLl/LSyBs5pf47OQqEFFWNZzUoA9o5yub+a2k5wsbVW33128Bp9Cv/IWZXojNFfByDRg7YO4UzH3RoUTc/HhtcViUVplDGCiUc5wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789929040; c=relaxed/simple;
	bh=FZt6CXZo2bmv8xm8GIXDwWDNfGUWLjZWl34Anyu+s40=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wau+pDvxJsUnBvbKO1Nyiwvt0LsA7IUqqgLyackzU2rCJhc/lohcNTaXXilvjZsSes38vweGORXmBsrCoY8KdvzIF6b8RnhprYmDgaqI0+8c+IHvOcXUffxANZrWAPHPWFrIbOF3J25McQ3CnwKcyU4sbw1y9u/JOYPkEpKFYZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=InLIRJ+q; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="InLIRJ+q"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469b2e1d5so2416836b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 11:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1789929038; x=1790533838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UBOnOOrLTxtHRzBhBZsycN4YkbFFBvPMpRlDpWA+7GA=;
        b=InLIRJ+qI6981Ex7D2vVGVAko3gT6HhPZxhbTBMZHGrizOHjr77gEHzjQpXP3nTQ9a
         qk/5zZPOemC+z/2mXCwKNOeY0HQy2krH1ILTQOnjdwl7cGyNl41QdyLGvLPhiO3jvNMh
         HH90H4QoYv5vIHqETLJiaNa/uATh94ugUgPjclAtFe5NbH2HPhK14zZJt8nkJgKCEsuX
         cZ9uUpqNK7+IuWz1Tp0dbOU9aWbyADTQouXBsJwXeafj0tGJFe9yALfoCJBjGacSyxVP
         bJZ2hxShxIfUmzCC8VSRmiiEEEhPMnP1UkuTRdvSZo68rl8sdM06A8TqOTut1dxfSD7R
         UhWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789929038; x=1790533838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UBOnOOrLTxtHRzBhBZsycN4YkbFFBvPMpRlDpWA+7GA=;
        b=vwGrj/+bXgLXu4MalRC6zTGXyYLmaFSlOE4GN/g9X/k8x6MrLx8h0/ERM2+C0D3CRS
         5gwYqjfTMihTUGxs6lMzJwu2Usdbhvb15jSMsmO5dz7jgHMRYlcNh3KCqlU/OTacNkC9
         sMhh2yIOjcEyYIeUaidGfVJIPftOmFhx3cvcZ/c7VWagip+9n94xMSGdXvvV9TKYhsYf
         5D58PyQJ8TDsGbfzM8HHqj29dfRNvZ/nKihXIm1SAApJ2ZA/gptJrLQJvv4UEgC2K1FY
         crDdXJSyv6Z/2mj+thg8YCcHbUvDweBjBDn9w5YNFwEBnmwr2rgTeQHpMjwXtmqXxSGO
         qrMg==
X-Forwarded-Encrypted: i=1; AKwUvBwnv01AXdP2Nww76/rM0WJ9jFeYhG4wYpnm7/5wDPapycboL6DzBbstK6OEG0UIXXAXlYblt9uPvwVUyZE=@vger.kernel.org
X-Gm-Message-State: AFuF++mZ+2UbstfxCdBfyS1XGS+rT4Ds/Lp4T9hhX2MiLrzYGbDHpYXj
	1yG61+OICXZRkl8LWPEUQeFcyzehAltxkDFmPlRiIjiylnWz+i3dCh5/HwCcaSERw2c=
X-Gm-Gg: AYBFou3YKe1GS97AapeMCfvNrXtm4um1k5O+Iv9YfOdd62EzZNjNgD5sD4oXaLCCTWy
	Prz8aCYAhJOiIxIL0ERP4CXPJrdlpoHML0ggdJiEAt1YWGm6v6Y05zeLFOUYgVOjfJRFRd3xTrN
	UedNV2Ca4TwAU8iHxYJ1PQ6ht01jQrYGKwMgiNxqlp+pi/bYBC7QrFYe2t/0vzgrt20lVh+43dr
	wApsgzoPf31JdKiMlbyggIt97Lll4P0XTdWluAmFHUpJDKoakxK5WU0TRrUTPGH9PjQ2w+C3OAr
	mHKo3Ou0fCTatYKBQgKHGMNRbqW7GYSY04XcjEHGIV0xXSx9GvTqQkGw3ahg23MV3rs7eQQaAfu
	fKd7QbPM2UUlNWbBAqMLStJUirfI4x0QxCUqpc7y1jMP1N7BmuAWASaqs+1t4emWFicyjle+4IB
	OGpnvVPmJ2JLbzCdh4IjYlVI9M4rcnyA9Th3HZJSI/XgS7BHZsJFN/CO2z
X-Received: by 2002:a05:6a20:4386:b0:3da:b761:80c0 with SMTP id adf61e73a8af0-3dd8c424e85mr15235108637.14.1789929037653;
        Sun, 20 Sep 2026 11:30:37 -0700 (PDT)
Received: from ceto ([2607:fb90:9c20:5ac0::1d8c])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-144da432647sm20924589c88.5.2026.09.20.11.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 11:30:37 -0700 (PDT)
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: Justin Tee <justin.tee@broadcom.com>,
	Naresh Gottumukkala <nareshgottumukkala83@gmail.com>,
	Paul Ely <paul.ely@broadcom.com>,
	Hannes Reinecke <hare@kernel.org>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	James Smart <jsmart833426@gmail.com>,
	Randy Jennings <randyj@purestorage.com>,
	Mohamed Khalfella <mkhalfella@purestorage.com>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 14/18] nvme-fc: Use CCR to recover controller that hits an error
Date: Sun, 20 Sep 2026 11:28:12 -0700
Message-ID: <20260920182936.2317916-15-mkhalfella@purestorage.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260920182936.2317916-1-mkhalfella@purestorage.com>
References: <20260920182936.2317916-1-mkhalfella@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An alive nvme controller that hits an error now will move to FENCING
state instead of RESETTING state. ctrl->fencing_work attempts CCR to
terminate inflight IOs. Regardless of the success or failure of CCR
operation the controller is transitioned to RESETTING state to continue
error recovery process.

Signed-off-by: Mohamed Khalfella <mkhalfella@purestorage.com>
---
 drivers/nvme/host/fc.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/nvme/host/fc.c b/drivers/nvme/host/fc.c
index 5a530aa37641..42671cca439f 100644
--- a/drivers/nvme/host/fc.c
+++ b/drivers/nvme/host/fc.c
@@ -166,6 +166,7 @@ struct nvme_fc_ctrl {
 	struct blk_mq_tag_set	admin_tag_set;
 	struct blk_mq_tag_set	tag_set;
 
+	struct work_struct	fencing_work;
 	struct work_struct	ioerr_work;
 	struct delayed_work	connect_work;
 
@@ -990,6 +991,7 @@ static void nvme_fc_ctrl_put(struct nvme_fc_ctrl *);
 static int nvme_fc_ctrl_get(struct nvme_fc_ctrl *);
 
 static void nvme_fc_error_recovery(struct nvme_fc_ctrl *ctrl);
+static void nvme_fc_delete_association(struct nvme_fc_ctrl *ctrl);
 
 static void
 __nvme_fc_finish_ls_req(struct nvmefc_ls_req_op *lsop)
@@ -1870,6 +1872,30 @@ __nvme_fc_fcpop_chk_teardowns(struct nvme_fc_ctrl *ctrl,
 	}
 }
 
+static void nvme_fc_fencing_work(struct work_struct *work)
+{
+	struct nvme_fc_ctrl *fc_ctrl =
+			container_of(work, struct nvme_fc_ctrl, fencing_work);
+	struct nvme_ctrl *ctrl = &fc_ctrl->ctrl;
+	unsigned long rem;
+
+	/*
+	 * Tear the association down now so the LLDD can finish unregistering
+	 * the remoteport/localport while the fencing this controller.
+	 */
+	nvme_stop_keep_alive(ctrl);
+	cancel_work_sync(&ctrl->async_event_work);
+	nvme_fc_delete_association(fc_ctrl);
+
+	rem = nvme_fence_ctrl(ctrl);
+	if (rem)
+		dev_info(ctrl->device, "CCR failed, starting error recovery\n");
+
+	nvme_change_ctrl_state(ctrl, NVME_CTRL_FENCED);
+	if (nvme_change_ctrl_state(ctrl, NVME_CTRL_RESETTING))
+		queue_work(nvme_reset_wq, &fc_ctrl->ioerr_work);
+}
+
 static void
 nvme_fc_ctrl_ioerr_work(struct work_struct *work)
 {
@@ -1950,6 +1976,14 @@ nvme_fc_start_ioerr_recovery(struct nvme_fc_ctrl *ctrl, char *errmsg)
 		return;
 	}
 
+	if (nvme_change_ctrl_state(&ctrl->ctrl, NVME_CTRL_FENCING)) {
+		dev_warn(ctrl->ctrl.device,
+			 "NVME-FC{%d}: starting controller fencing %s\n",
+			 ctrl->cnum, errmsg);
+		queue_work(nvme_wq, &ctrl->fencing_work);
+		return;
+	}
+
 	if (nvme_change_ctrl_state(&ctrl->ctrl, NVME_CTRL_RESETTING)) {
 		dev_warn(ctrl->ctrl.device, "NVME-FC{%d}: starting error recovery %s\n",
 			 ctrl->cnum, errmsg);
@@ -2463,6 +2497,12 @@ nvme_fc_ctrl_get(struct nvme_fc_ctrl *ctrl)
 	return kref_get_unless_zero(&ctrl->ref);
 }
 
+static void
+nvme_fc_stop_ctrl(struct nvme_ctrl *nctrl)
+{
+	flush_work(&to_fc_ctrl(nctrl)->fencing_work);
+}
+
 /*
  * All accesses from nvme core layer done - can now free the
  * controller. Called after last nvme_put_ctrl() call
@@ -3428,6 +3468,7 @@ static const struct nvme_ctrl_ops nvme_fc_ctrl_ops = {
 	.submit_async_event	= nvme_fc_submit_async_event,
 	.delete_ctrl		= nvme_fc_delete_ctrl,
 	.get_address		= nvmf_get_address,
+	.stop_ctrl		= nvme_fc_stop_ctrl,
 	.get_virt_boundary	= nvmf_get_virt_boundary,
 };
 
@@ -3547,6 +3588,7 @@ nvme_fc_alloc_ctrl(struct device *dev, struct nvmf_ctrl_options *opts,
 
 	INIT_WORK(&ctrl->ctrl.reset_work, nvme_fc_reset_ctrl_work);
 	INIT_DELAYED_WORK(&ctrl->connect_work, nvme_fc_connect_ctrl_work);
+	INIT_WORK(&ctrl->fencing_work, nvme_fc_fencing_work);
 	INIT_WORK(&ctrl->ioerr_work, nvme_fc_ctrl_ioerr_work);
 	spin_lock_init(&ctrl->lock);
 
-- 
2.55.0


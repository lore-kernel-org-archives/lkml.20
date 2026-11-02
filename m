Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793579788;
	b=KpuD82tRCsEMOCYtoIHlTMiUs8BH4U71fJAs9pvDKUX4nt8gvmuGp65HyHCYHHZ4/9VX
	 aYHnDPbFsHZLn6Z1hIqUTXSl7y664o2J1kp7Mgn1G8CCaCwRPPc/biUix/rs9erxQkUZH
	 WeGoG+wBvPu8vds4ozxa4NZpqcR4Vnx2Usb1Wg/ZedEf8cgWmbudCQbIb2YH98W8hBRQx
	 c3REe6HcH9VOMRWbM467uNNkXD+C7CQ3gMSjoGqLHnQz8WwpsdalVDxlejNYRJ1aTX0B0
	 fWm9wQ1973Fv5KVOBbqLmHw207FYXDeUBkONVHd1Nz71hsZOyWMQnmLB41HMfRvfTyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793579788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=d5I/3o3ZMDmTHhqki/RL15OKEhwf2lx/PeEsYN29HFM=;
	b=2NQEs75u58o2d03m1sNztmCd7Ty4MtvBMJ7m8ajHgnYTDBeFaEtZ+ZAc3RWjrYqVURgj
	 1OJeHdC7tOVDQvQ1H095SAwPnNCkRksah5OU7qMmt1ts8AaYgtQwht9Wi1QciEMIC1DvD
	 4GbpllT7DmVw+MC72cKAkuHstNu6qQ0s8nt5Dz794vQ5/ubk7y9VHwsrSjUKQGm7Uk4FV
	 PzYmwKxV69Q49Q1fBYG0Ti0s6HuRSw56qasF1l0kw7JKCmM5oXhfInxWrmM9MyDUzQC2U
	 yWA5yCmgQcg4y7w4+TQzhHZKnv5VL+zWHNb9YVeeHc9wQBsxJZXF20fx3ZXjpeLzvGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mCsT9VkB;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D35606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 00:36:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96D35606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mCsT9VkB
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a208d93758so25960585e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 16:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793579786; x=1794184586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d5I/3o3ZMDmTHhqki/RL15OKEhwf2lx/PeEsYN29HFM=;
        b=mCsT9VkBi31Q/07PhFPnoQyS8sTl+vy7CHR/3/MgntufJMCCERNwr2dA08BepuRIJn
         Jo8Iqd/a8TGougUUFsKMEXkjZXNUEVi/67EPw6/9OitQWRIkM8c4c+IC4ahoWroHNc9J
         kf7vSNvWX2ZCdoFGTDKRswi8fLboxdbzWtm4vNggw0JoaVP/oI8i3v0tKBe5ddxFz6Y4
         zGwOujyrTbdDJKwGbNhALIzvSyn6sKOcqLrxA27A+zTZqNC/IL0BCTEQfegmqrrdy9u3
         Oa107eopoqYAhcQ+o1zziZOFkdqknyP9K5/3WeBmMdvC0yq0PdDLlc3JXuKPHOoiQ9eq
         H1vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793579786; x=1794184586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d5I/3o3ZMDmTHhqki/RL15OKEhwf2lx/PeEsYN29HFM=;
        b=N13rLc4R6R7dz+HwEj4Ki+My0PlAjvdkQ8BUOLDjINaf6e9/m3B4uk11NU9PzhcJva
         urSJwaMGajpjZve2AY4DmvbhmDgImpHZvG4sPQNJkzsur4kCANkBfoc3OOrgZOHnSWg3
         SepbDr5/aOVea7R6lTsq9x3GAv4W8fA6ibIPWFw8yxxzD1J1gKJW9uF5BOb7csYyxzEf
         tSAyX1p4/fbJCuRyfDLNd2QNlypyN2MayEI4b2sKsjqBadUZ8zV4dunZKP8fz3plS+Uf
         3LoPQtKF7RnOWjoJySNPign3enczCTkx2IcHZDLCymz6F5iZeRLUvFfjKHpLOEsYrXDG
         BBjQ==
X-Forwarded-Encrypted: i=1; AKwUvBzxtApxBEiIW1y8SPqcAaULblbAhXxfIQ4RWoO7yaqVVV+Xm3lxWx3b/98RXgNUiJJJFOa0LuyL/3BcWsI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIhPSHvKRut59aK88nJZN5nqQicpyM/TFB3VXXxTN/uOvprufzj
	wTl9pvbKkl3YoFCZ2G0xt740v/MUaoTAYwp7QQvfpQNBTZVZHQBtLpxcmi/ZLx0=
X-Gm-Gg: AYBFou08QPVdpZvxAp2VcfA8F7FjW9rL+5P1xM9OchIkZD6nKDglPH0XTA0GsNlyiG7
	jBJcsjYvYttTyd8KWllK1bxaX0n28UpnM+WCsvmIkMslZ4WAfGjuK2J/satMIabsEYrBSkVEwnx
	iVD2obAiIbrM27/j7TftkdQhEmmOQD+2LZVoQngvHONB8CtCqGOkGj45LBpzbwoTfIIHSda4Qkb
	Jar4bBppgVQkUuth6JsspQpvMBWlyEfRMJUwzspnRmDuQ6Nj05l1dQUBZZVSwqmofK2Yzgkhu9q
	yHpwjGGzh477PjqasoMqot1SI+jgHMeUdQe1hnTYETcH9pRb+l2v/t/Xr/0w3Ns6BDWAycBbQXg
	RvTvI3CWvQGQdXXeyoVAdKDQtUNPyfmCHkbCar1r9eTP70yWc6Kimzodnl5dIwLpbImSeSQ+gf3
	zBPzfNb0ltvvavvlTnw2VOJjlu9Ck3L+J7qxthF6b8p6tIoVwsefj5OPl/S0FIxAU9f+bZaVQN+
	wxp7kSD4o1icq1vhdNRUKPMD79HTkKzj5TJbaNZ2HFvxWRz6tpIHHA+VTCCf0PeBtS8+0BW1xQS
	7PhR/xRi6O8TGxnt09VurAqW02OlEIG0qp3u
X-Received: by 2002:a05:600c:5397:b0:4a4:4d57:8462 with SMTP id 5b1f17b1804b1-4ac18b7e65bmr197850895e9.24.1793579785959;
        Sun, 01 Nov 2026 16:36:25 -0800 (PST)
Received: from sasha-User.lan ([185.159.163.49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa813d2950sm302007805e9.8.2026.11.01.16.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 16:36:25 -0800 (PST)
From: Asdlerto Korry <korryasdlerto@gmail.com>
To: "Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Bart Van Assche <bvanassche@acm.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Bean Huo <beanhuo@micron.com>,
	Peter Wang <peter.wang@mediatek.com>,
	Can Guo <can.guo@oss.qualcomm.com>,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Asdlerto Korry <korryasdlerto@gmail.com>
Subject: [RFC PATCH] scsi: ufs: core: Allow error recovery before the device W-LUN exists
Date: Mon,  2 Nov 2026 02:36:07 +0200
Message-Id: <20261102003607.341651-1-korryasdlerto@gmail.com>
X-Mailer: git-send-email 2.25.1
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

ufshcd_err_handling_should_stop() returns true while hba->ufs_device_wlun
is NULL, i.e. until the first probe has added the device W-LUN. If the
link fails during that first probe (for example NOP OUT failing after
link startup), the error handler therefore never resets the host or the
link: it only marks the state operational and returns, and the probe
keeps failing until it gives up.

On a Samsung Galaxy M52 5G (SM7325) the first link startup regularly
ends in PA errors (LINERESET). With the W-LUN check removed, the error
handler performs a real host reset and restore and the device comes up;
without it, it never does.

Removing the check exposes three places that dereference
hba->ufs_device_wlun unconditionally on this path:
ufshcd_rpm_get_sync()/ufshcd_rpm_put(), ufshcd_err_handling_prepare()
and ufshcd_recover_pm_error(). Skip the W-LUN runtime PM handling there
when the W-LUN does not exist yet; there is nothing to resume and no
regular SCSI I/O before it is added.

Note: the error handler then calls ufshcd_verify_dev_init() through
ufshcd_reset_and_restore() while the tag set is quiesced. This needs the
pseudo SCSI device queue to be unquiesced in ufshcd_err_handling_prepare()
(as done upstream), otherwise blk_execute_rq() waits forever.

Signed-off-by: Asdlerto Korry <korryasdlerto@gmail.com>
---
 drivers/ufs/core/ufshcd-priv.h |  4 ++++
 drivers/ufs/core/ufshcd.c      | 13 +++++++++----
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/ufs/core/ufshcd-priv.h b/drivers/ufs/core/ufshcd-priv.h
index e55c2a02c1f5..2cb0d542d114 100644
--- a/drivers/ufs/core/ufshcd-priv.h
+++ b/drivers/ufs/core/ufshcd-priv.h
@@ -385,6 +385,8 @@ static inline int ufshcd_update_ee_usr_mask(struct ufs_hba *hba,
 
 static inline int ufshcd_rpm_get_sync(struct ufs_hba *hba)
 {
+	if (!hba->ufs_device_wlun)
+		return 0;
 	return pm_runtime_get_sync(&hba->ufs_device_wlun->sdev_gendev);
 }
 
@@ -410,6 +412,8 @@ static inline int ufshcd_rpm_resume(struct ufs_hba *hba)
 
 static inline void ufshcd_rpm_put(struct ufs_hba *hba)
 {
+	if (!hba->ufs_device_wlun)
+		return;
 	pm_runtime_put(&hba->ufs_device_wlun->sdev_gendev);
 }
 
diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index fd52deb72d21..9767fbc7b870 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -6876,8 +6876,9 @@ static void ufshcd_err_handling_prepare(struct ufs_hba *hba)
 	 */
 	pm_runtime_get_sync(hba->dev);
 	ufshcd_rpm_get_sync(hba);
-	if (pm_runtime_status_suspended(&hba->ufs_device_wlun->sdev_gendev) ||
-	    hba->is_sys_suspended) {
+	if (hba->ufs_device_wlun &&
+	    (pm_runtime_status_suspended(&hba->ufs_device_wlun->sdev_gendev) ||
+	     hba->is_sys_suspended)) {
 		enum ufs_pm_op pm_op;
 
 		/*
@@ -6926,7 +6927,6 @@ static void ufshcd_err_handling_unprepare(struct ufs_hba *hba)
 static inline bool ufshcd_err_handling_should_stop(struct ufs_hba *hba)
 {
 	return (!hba->is_powered || hba->shutting_down ||
-		!hba->ufs_device_wlun ||
 		hba->ufshcd_state == UFSHCD_STATE_ERROR ||
 		(!(hba->saved_err || hba->saved_uic_err || hba->force_reset ||
 		   ufshcd_is_link_broken(hba))));
@@ -6935,12 +6935,17 @@ static inline bool ufshcd_err_handling_should_stop(struct ufs_hba *hba)
 #ifdef CONFIG_PM
 static void ufshcd_recover_pm_error(struct ufs_hba *hba)
 {
-	struct scsi_target *starget = hba->ufs_device_wlun->sdev_target;
+	struct scsi_target *starget;
 	struct Scsi_Host *shost = hba->host;
 	struct scsi_device *sdev;
 	struct request_queue *q;
 	bool resume_sdev_queues = false;
 
+	/* Nothing to recover before the device W-LUN has been added */
+	if (!hba->ufs_device_wlun)
+		return;
+	starget = hba->ufs_device_wlun->sdev_target;
+
 	hba->is_sys_suspended = false;
 
 	/*
-- 
2.25.1


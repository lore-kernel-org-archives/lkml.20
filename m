Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794460546;
	b=R2D58RIhBVObVO/qUWgXUIx61S6psMRHWx1PYpcXYH5yOQuYo7WzV5fHKJ6gSDeWq5LH
	 ZOxCjxf0tvWF8ttZ3b+pd2KGtujLc+VkdYYTia2uvSsNEKz4UN99Xkax1RQUmoGWlC7r2
	 OQo3bc3rTuZ2zxYX9SWKQrsvjlKwXkC7Mfc95QDjSLvTIk+h828vQSjUl5Mn5+bpNm5Jm
	 a8kcs1iNTDpcAtFWUWEPMVELceazDtBFR0ade8oQdOEXXvNEvW6Xp0gIggVbMFRoQ3gUp
	 0sSmNmYC43C8y9+i0ISfk4JXD4Ny2ay+TJKeMY1RCyAMYfXAct3OAlDMDtJIbbhW9jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794460546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=uhCrUZrfKuI9xdGiRCa6me3H0RB/NgF8erfFCV58p0g=;
	b=J6CVpd4bn071y+qtfA8bzcl0O4eJk6Ur73UrbnZ1r9QAczMfpuObzqkcKxDteW0fyW5Y
	 Cs5gOTPZPIRy5iCAAHYrT+DI8dvsIH89lsKKmtYJYx1DzherrJSAF3u7yelR8tDqMJ7B/
	 QqC+b4LqWiRdNrvKDkpOx86eRZs835sRxBmgm71CtRyb6eQ7AKevTKj0th5VN7yiPhdoK
	 PO334p3QZsM1jW0fD9b2Ku2Q4RZfHHKPApVstXRjo1HkWy9BVtCGU2Klra6tGb6Wzaw/f
	 E4yer3a+gCYtfJAO/SB3SurVQzmp1MW12ARpSQ4A1dYY4ToqaNplC8i0KWDrKz2B09g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="ayjKsB/S";
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DCB606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:15:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7DCB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ayjKsB/S
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b18a173e48so3570a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794460545; x=1795065345; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uhCrUZrfKuI9xdGiRCa6me3H0RB/NgF8erfFCV58p0g=;
        b=ayjKsB/ST0f5tCKgVeMMt5bQM0zaGFl6+GjwRcvAdT2ZBsthuLmrsbNoQIsPBwViuL
         xTDD1dKaIdGA64VUQrfsT9gUnpfPe/DZM2AShlOCRVY15SihFIr2VUIo/FmPCq2YkJva
         RC2SykQsBBLCTLcF7fELfSkfRY869hYdLnlqwULsEIEZRB5SOZyihcnaDfsXqMut+6AJ
         XlzVv20dUgBDWA2gfMQlRb5oLob8Q1ETJLsYihr8DJbELhITrKn+8jHrAFWqPu1O21/e
         m9FzYq2KO3oDafCvePl5WOgXsRy4R9epRpOt6HsCoaPpht1oKFOsLrvPqrm+/l5CLJd+
         jFAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794460545; x=1795065345;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uhCrUZrfKuI9xdGiRCa6me3H0RB/NgF8erfFCV58p0g=;
        b=zZcljmXf0i+SIvNEoqLlgcS3fG9zTs2ppH13fDo1z20JUSfB98L7AZrdy5q7DELTwH
         PbTU4nWxJ1z6iBxjLr/fHux8ClstGwCzTnY7n9Q7rY3iVrU0H8YDgnOlngIRhL324FEh
         nKEuzdmY9bT6mWhoY+ihCd+7mI9rOdIVuFs1O5D3C+EkjrVdvEvIIFFwyJn/5JXJxdb3
         1tFtnwil+CA00bUK/PGB3dG6RtEZVzvMf1/vG87adYGuX0lRYpmKI0PAJcmSc5+ndgig
         aJkBLuoYw7bB0qjBq7XzB7Ap1K+R5cNdEOKXMXb1VeBzyHf85QCOjrb90dnOLwqU9i8L
         H2HQ==
X-Forwarded-Encrypted: i=1; AL+hErGLopnPf3c9nN2wGZ3uAu8A8cGBnXHjwVvnR3Kw1EinPaonMFhy2JzJzXnpjQNZovHwVlyZtA1Eic82Drs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ad+PRpdGQ6+2xK5Oc5r+MSEwABqiPGQfovYOSOJIaGAnGF2dp
	m+X1I8M0ZqhJCt5IsuXSI+ficS/PCtJir1C8+AQaceuOCghvmRfHmRB7BVh8Fd7a8n0GBMkFC63
	4HcLFu6Ll9GN8LQCFSl3XpQ==
X-Received: from pjbci22.prod.google.com ([2002:a17:90a:fc96:b0:3ae:d16c:c4c1])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4f45:b0:3a4:945e:bc33 with SMTP id 98e67ed59e1d1-3b182ff36acmr4347171a91.47.1794460544841;
 Wed, 11 Nov 2026 21:15:44 -0800 (PST)
Date: Thu, 12 Nov 2026 13:15:33 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
Message-ID: <20261112051542.1539779-1-stanleyjhu@google.com>
Subject: [PATCH 0/9] scsi: ufs: core: Fix device management and PM recovery
From: Stanley Jhu <stanleyjhu@google.com>
To: linux-scsi@vger.kernel.org, "Martin K. Petersen" <mkp@kernel.org>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
	Bart Van Assche <bvanassche@acm.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Avri Altman <avri.altman@sandisk.com>, Bean Huo <beanhuo@micron.com>, 
	Peter Wang <peter.wang@mediatek.com>, Stanley Chu <stanley.chu@mediatek.com>, 
	Can Guo <quic_cang@quicinc.com>, "Bao D. Nguyen" <quic_nguyenb@quicinc.com>, 
	Asutosh Das <quic_asutoshd@quicinc.com>, Hongjie Fang <hongjiefang@asrmicro.com>, 
	Praveen Talari <praveen.talari@oss.qualcomm.com>, HOYOUNG SEO <hy50.seo@samsung.com>, 
	Brian Kao <powenkao@google.com>, Jens Axboe <axboe@kernel.dk>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

A UFS PM callback holds hba->dev_cmd.lock and the only reserved tag
while it sends device management and START STOP UNIT commands. When
one of these commands times out, ufshcd_eh_timed_out() resets the host
inline, but the reset path needs the same lock and tag, so it
deadlocks or fails. The error handler can also reset the host while
the PM callback is still using it.

This series:
- skips the MCQ completion queue poll when error handling preparation
  left the queues unconfigured (patch 1/9).
- hands PM command timeouts to ufshcd_err_handler() instead of
  resetting the host inline, and fails later PM commands fast
  (patches 2/9 to 4/9).
- disables W-LUN runtime PM during error handling instead of calling
  ufshcd_rpm_get_sync(), so the error handler powers up the host
  itself (patches 5/9 and 6/9).
- keeps the host variant power state balanced across error handling,
  resumes the UFS device W-LUN and wakes suspended logical units after
  a successful reset, and makes the error handler wait for a running
  PM callback (patches 7/9 to 9/9).

Based on mkp/scsi 7.4/scsi-fixes (e550f2b2b4aa) plus Hoyoung Seo's v10
series [1]. On this base, its patch 4/4 needs a context fixup in
__ufshcd_wl_resume() because of commit 6da1bc55c060 ("scsi: ufs: core:
Keep clock-gating hold on failed W-LUN runtime resume").

This series folds in [2] and supersedes [3].

[1] https://lore.kernel.org/r/2052256418.81794387787276.JavaMail.epsvc@epcpadp2new
[2] https://lore.kernel.org/r/20261104112744.1630864-1-stanleyjhu@google.com
[3] https://lore.kernel.org/r/20261105071518.1458428-1-stanleyjhu@google.com

Brian Kao (1):
  scsi: ufs: core: Do not recover the link concurrently with a PM
    callback

Stanley Jhu (8):
  scsi: ufs: core: Do not poll unconfigured MCQ queues in the error
    handler
  scsi: ufs: core: Defer link recovery on reserved PM command timeout
  scsi: ufs: core: Wait for the reserved tag in
    ufshcd_get_dev_mgmt_cmd()
  scsi: ufs: core: Fail PM commands fast when fatal recovery is
    scheduled
  scsi: ufs: core: Disable W-LUN runtime PM in
    ufshcd_err_handling_prepare()
  block: Keep RPM_ACTIVE in blk_pre_runtime_resume() when already active
  scsi: ufs: core: Unwind variant resume in EH when reset fails
  scsi: ufs: core: Wake suspended consumer queues after host reset

 block/blk-pm.c                 |  13 +-
 drivers/ufs/core/ufshcd-priv.h |  19 ++-
 drivers/ufs/core/ufshcd.c      | 244 ++++++++++++++++++++++-----------
 include/ufs/ufshcd.h           |   3 +
 4 files changed, 189 insertions(+), 90 deletions(-)


base-commit: e550f2b2b4aab4c5f12db89d04d8978ce4ed7b4e
prerequisite-patch-id: 0c2cfc48bd97246e47ce689a3a8a364c18a56621
prerequisite-patch-id: 9a413c053d618cedfc6a1a439469bc49a51e060a
prerequisite-patch-id: 961b8b65ac8c9fd1b95d0901347cf504632531e4
prerequisite-patch-id: 9f5c103bac288c258b541cff3742a69fd07892f1
-- 
2.56.0.506.g506a7eabc5-goog


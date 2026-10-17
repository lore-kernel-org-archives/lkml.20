Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102D04CF47E
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 13:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792243858; cv=none; b=IhqGGo4+LfzOYxUWFM9fUV5H0j/xr1WosiMU3x6E+SycmwCAzK1XFKbFXkg/O6iA6njMbA4fDzSKYM/hTU5Do2MTq5L2p+KeKAjODCXIJ6e3ljuYg3uJ0uX+wGDQjFgwZk1ItN86zlekCRccxanXZaHxsgywFdlEoe/bycyBjiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792243858; c=relaxed/simple;
	bh=FQMJxj30Jbh8Y1kO8a4BCGr9W3VcLELopHi5oh2lXiU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cr3N2mlEv6Fl4RrfbgqDhpmmZQk+x/qxPh95Q9ZQw3zQco/2X5b1jVK3KzX2fkcXEUK1/TVeKWwEBrQje0tkat/Ml8R568kVmnowSZfJ2rv/Y6sWOMKVUJO8tPAOehvBV3pUcKYuhaP5zAu0zYPsUWMQUik4CwQwrgokENGc2wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZZ/9JNdv; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZZ/9JNdv"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ac5b090d16so515204a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 06:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792243852; x=1792848652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7HdD63cIO1sGwME46dAp51tBAKzD7lOoAch50AxvXAQ=;
        b=ZZ/9JNdvROD2022jkf0P/0i9VRnIky1kthf4IBkA7L7MOLg3jOdWIpubmscKhXabhv
         6dmctlfM6BTjwyuXhjWRAyvWfDK2Aj4ThCt+aHkQLPUCMCL+xADpP1szhySA2O7zuDzz
         6Jh4PgmskpQpdb10B0ixrYw/+XxxaJkIAqgws+c2Mv0sBgqdXbPeuEWocFuWutOt2Rh2
         o5Wig1ImLL49XUDwsappFMy98fBewODCuroFcKNyg6UT+Q0uwhRyfunIU9qKBJmbjton
         SSCayQnzFzkTJEaHhiPZTMjF+UADEyRUEhM675S1gwveQtMUhs8txG/nH+Bzh4Pds4a1
         Iw2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792243852; x=1792848652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7HdD63cIO1sGwME46dAp51tBAKzD7lOoAch50AxvXAQ=;
        b=Mv7Jn5xgJORwidIVVgcerkfU3t7BNqXU9O6X3MqKUFF3JN69av6qXZ1famBB6lak3t
         M9EjKkyoDviHV0tupsYSQkC4IkVrgS5ZJ816oOzBaSiOclUjskYNw8DczacyDPoNw81k
         C7bqkiCTlX0EnStZStw24xuhKNo8J2yzfiVRFm7ipk499TqPo3advT2WuiOVtCGnafvL
         ogwWKo4C/Q3bXCSwEuf4IeaqARD9ZFWhqfElyyctZ3CgylvGf/3opk40ABGRmFgqWZaf
         uZg9Atdiq3JSU2nQAln2oVPiIR5AR6NFHcy2rXEhK9Zb8Y8E0j+eX8jYjS4wE366Rs2g
         wdnA==
X-Forwarded-Encrypted: i=1; AKwUvBylaNRKlvCxU9QA8VhYAa+B4R6iGRu2pYaLy4Q2V0xnzWebRVb2f9DJS9dhlX+sS9GjE9uAoSsDLSpfOHw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKD5AtphPjo8IwLmeSmFgYureUkqUB/p7RroD3gfan4Nq9CevwB
	JLTmCOxZq50tzS43fCNEVv86QAwK1noSu2xUwUnwj51Ad0Fj0aGtpIDW
X-Gm-Gg: AYBFou2iisr3aG1CsZ5rSy7aF8FnlZQP3FNxMq1+AsSmGvagrfW8jt9jM5s94iMnOnK
	0W3apVI48aAWkA8QtfT96WI0xptGn1xOroFtAf3vwKaOTq9PY1dYCcArmS65pkDn1U82um34MIR
	RlHCVzIKSVAwM3PH2nRRyMAFAn5ULaiUSR/m6vWgOgjc6JPjKgU1++63Ad8xRc4hVzYM7RiDEfz
	znfuv1kGql6Q8D/V99BtBOoUTfr3EyC1NidAobx303itWa244zP2yb+JBTzeKcmkKv7KnTA0POI
	JS2DJ/ePOKTDttqN5GPmqi4TUXvoNqdAoERk+OnKzQ1wpK7gMInff7UN+0R4BAWP2EHW0xd1j9w
	ypXSjuu6JNS9YUGJ6TT0JtinTq+5J7m2TAVnV+Z3sOo/2n58cOcg/9kHQ68wj3fpL18fcmKJ1Wx
	NDDXKmebqGW5qVo3mS4cQ1ZFTtQN+DxJoU3mNiHCMgE54mjyWBu6mQ+EqT3q6sp9HsD9+YFtvJ/
	Dro5UjJmQ7fQzVCG2whYV+mfB49/9OG0IM/Mw/74DE1whBymTFrUe+O8CuiBioTwckVUKEgt29v
	uEUCFO2igdQYp3a1fblm2Pd+3QuGF50R2TIIoQFEaRYGnfXC
X-Received: by 2002:a17:90b:3e85:b0:3ac:36c7:c144 with SMTP id 98e67ed59e1d1-3acef2b4edamr1516587a91.28.1792243852151;
        Sat, 17 Oct 2026 06:30:52 -0700 (PDT)
Received: from EAIT-H54D9Q2FJQ.eait.uq.edu.au ([130.102.10.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac9474b52fsm14952942a91.9.2026.10.17.06.30.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 17 Oct 2026 06:30:51 -0700 (PDT)
From: Yu Zhang <yuz08559@gmail.com>
To: Mike Christie <michael.christie@oracle.com>
Cc: Dmitry Bogdanov <d.bogdanov@yadro.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	target-devel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yu Zhang <yuz08559@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] scsi: target: release SAM task attribute on the abort path
Date: Sat, 17 Oct 2026 23:30:42 +1000
Message-ID: <20261017133042.54305-1-yuz08559@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A command that has started execution and is then aborted is completed
through target_handle_abort() (target_cmd_interrupted() ->
target_abort_work()), which bypasses target_complete_ok_work().

target_handle_abort() never calls transport_complete_task_attr(), the
only function that releases the SAM task-attribute accounting a command
takes in target_handle_task_attr() at execute time: for a SIMPLE command
the dev->non_ordered reference, and for an ORDERED command the
dev->ordered_sync_in_progress state (cleared, and non_ordered
resurrected, by transport_complete_ordered_sync()).

The normal completion path (target_complete_ok_work()) and the failure
path (transport_generic_request_failure()) both call
transport_complete_task_attr() before handling the command; the abort
path does not, so aborting an in-flight command leaks the accounting:

 - Aborting an in-flight SIMPLE command leaks a dev->non_ordered
   reference. A later ORDERED command then waits forever for non_ordered
   to drain and every subsequent command piles up on
   dev->delayed_cmd_list, wedging all I/O to the device.

 - Aborting an in-flight ORDERED command leaves
   dev->ordered_sync_in_progress set forever, so target_do_delayed_work()
   never makes progress and all subsequent commands to the device hang.

Call transport_complete_task_attr() from target_handle_abort() as the
completion and failure paths do. It is a no-op for commands that never
set SCF_TASK_ATTR_SET (e.g. task management requests) and is idempotent
via that flag, so it is also safe on the failure path that already
called it before dispatching to target_abort_work().

Reproduced over an iSCSI session to a demo-mode LIO target backed by a
dm-delay device: an ORDERED WRITE held in flight at the backend is
aborted with ABORT_TASK, after which a follow-up command never completes
(device wedged); with this patch the follow-up command completes
normally.

Fixes: ed1227e08099 ("scsi: target: Fix ordered tag handling")
Cc: stable@vger.kernel.org
Signed-off-by: Yu Zhang <yuz08559@gmail.com>
---
 drivers/target/target_core_transport.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/target/target_core_transport.c b/drivers/target/target_core_transport.c
index 1111111..2222222 100644
--- a/drivers/target/target_core_transport.c
+++ b/drivers/target/target_core_transport.c
@@ -870,6 +870,8 @@ static void target_handle_abort(struct se_cmd *cmd)

 	WARN_ON_ONCE(kref_read(&cmd->cmd_kref) == 0);

+	transport_complete_task_attr(cmd);
+
 	transport_lun_remove_cmd(cmd);

 	transport_cmd_check_stop_to_fabric(cmd);
--
2.43.0

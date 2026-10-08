Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32403976BA
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 17:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791480840; cv=none; b=ccuzvfWv91JWdcsTL55uQaLLmET0MPZBxeyEy1Xex7FJvnycEKKFWMzkhu5iFFAcGTt6wIC/+3/YvLWTC9pLve1b6idLjoYBTkwdXRovn62bYoKEacFiOAXzHf/YizH12LeBRSr6w3L8FcUB5uEOjcSOLh1xSmsfFPuzxX3ZG+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791480840; c=relaxed/simple;
	bh=2Dy8NcG3RR4epT6g2CrsOvKssEwIyXFc/uFqGfl3ubA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=BJdgu3tffeRVHcftGAjNT1yxMrdkqEnYp4M8mLKZTvoWRW6jladubi7+vMIY5xM1TFwI7gCgEFjFipyryFypful1I15BLGnTpLnImmW5WjQa/0PM/Knc32vbL3xmgRhFYPMgpvuR5wx6DWINn3sC8lM2iHx1B9vZCkx59r88PZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--brianvv.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dYZDvsUJ; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--brianvv.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dYZDvsUJ"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e818ca61bfso7130885ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 10:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791480838; x=1792085638; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oL7DYN1cPQUBG7i6wjoO+oNk4/EoYeE3qdEtA4etZEc=;
        b=dYZDvsUJN2L49BDdITuSWUfH0MqxGt5yWi+2l2n9mFUgfVThge8AojXnAw1pzOUC4x
         AY8V7IgcFCUvdWLJNOmk+K38WXRJRjefTB5QHc16AamE3nYawXVQdxzmyVIc19JLxXzX
         d9p3v7AoeQCcLhdLqGsDlpPYqXsPpENeVlEYnXGgiZFs2AtMd+JLmtQI7L8zD1/e3zd6
         k1TkDIPcGmCnBDsMqlOdoStJTWU8E5HPAZuKG1wCunGEWKLsuQhzX3P6CtRqValzpIn5
         Cl/gFrCX75yxgymc/IYGkXIg8dNgloC/kJFHgSEYWvk8JNvMvxY8s6BcT+DNSZvc+gto
         HPgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791480838; x=1792085638;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oL7DYN1cPQUBG7i6wjoO+oNk4/EoYeE3qdEtA4etZEc=;
        b=Ddo+Ags4Tisr8F9DtBtOPhzNrH2MzpM3v9CZarSfeE8pOX9HdRxaXUrXbet9GE+bFx
         obwwTX8wvUtu0sv/2JbW4pJohCqJXdo8TmdFagrcJu4JJ5zswk4kLwWPaT8BBB+q2Tcp
         EIYWq0O76yiTmznOtsRa3WNNr9kMo/NBGaEvHNhiY86y7eYJ+FCmLHR7+c3DntPjSk9p
         X71VOi0bY7BwLou4kCkroYFUwmn5XCEd/0UQlUh7f1m/UckCWMKOH3oVCI4WuAZlLocN
         huhxLfsAl0nG3eHwTZfBYm5wT7LtbUgj3ch+y3ToyYtjH15FJDdcByYcjgGemPYhFiyH
         Y8/Q==
X-Forwarded-Encrypted: i=1; AKwUvBxOawPteaaoZbYFMaFFpbRrNv8rG4ruuiwkkeIXjZn/BzINTJx8A3NtU783xXoOF5r/5gt5RajM9hwlq2Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzKn9qwfsw+eOfXeSoZfkIg4BNqCMePs9T9AwOtZVqn9e64OFi
	+aqMiR+klsq+cIJHlpFz9RlVxzvNGGKkmli7MDOVmxBA/LJuxKd4BBSxnT0pzPP/9dWAB6VcFqs
	NwgTIdMYulg==
X-Received: from plrs9.prod.google.com ([2002:a17:902:b189:b0:2e2:f2a4:dd99])
 (user=brianvv job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d983:b0:2e5:4604:c375
 with SMTP id d9443c01a7336-2e60056530amr54905285ad.48.1791480837419; Thu, 08
 Oct 2026 10:33:57 -0700 (PDT)
Date: Thu,  8 Oct 2026 17:33:34 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261008173334.2881475-1-brianvv@google.com>
Subject: [iwl-net PATCH] idpf: wait for the reset completed state in idpf_check_reset_complete()
From: Brian Vazquez <brianvv@google.com>
To: Brian Vazquez <brianvv.kernel@gmail.com>, Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, intel-wired-lan@lists.osuosl.org, 
	netdev@vger.kernel.org
Cc: Madhu Chittim <madhu.chittim@intel.com>, 
	Pavan Kumar Linga <pavan.kumar.linga@intel.com>, Joshua Hay <joshua.a.hay@intel.com>, 
	Shailendra Bhatnagar <shailendra.bhatnagar@intel.com>, 
	Sridhar Samudrala <sridhar.samudrala@intel.com>, linux-kernel@vger.kernel.org, 
	David Decotigny <decot@google.com>, Li Li <boolli@google.com>, 
	Emil Tantilov <emil.s.tantilov@intel.com>, Brian Vazquez <brianvv@google.com>
Content-Type: text/plain; charset="UTF-8"

PFGEN_RSTAT[1:0] / VFGEN_RSTAT[1:0] (PFR_STATE / VFR_STATE) encode the
function reset progress as a 2-bit state, not a flag:

  00b - reset in progress
  01b - reset completed, written by the control plane
  10b - function active, written by the control plane once the function
        has completed VIRTCHNL2_OP_VERSION
  11b - reserved

idpf_check_reset_complete() tests (reg_val & rstat_m) as a boolean, with
rstat_m = GENMASK(1, 0), so any non-zero state is taken as "completed",
although only 01b carries that meaning.

That only works if hardware moves the field to 00b as soon as the reset
is triggered. On the devices tested it does not: PFSWR transitions
PFR_STATE to 00b only when the field currently reads 01b. When the
function is active (10b) the field keeps its value until the control
plane finishes the reset and writes 01b, which takes a few hundred
milliseconds.

Consequently, on a hard reset of an active function
(IDPF_HR_FUNC_RESET) the first poll sees 10b, returns immediately, the
driver re-creates the mailbox and sends VIRTCHNL2_OP_VERSION while the
reset is still being processed. The control plane tears the mailbox
down underneath it, VERSION is never answered, and the driver sits in a
60 second virtchnl timeout (-ETIME) before going through a second hard
reset which then succeeds.

Make idpf_check_reset_complete() wait for the state to be exactly 01b.
This is the stricter reading of the register definition and it does not
depend on how the field got to its current value: functions that are
still in progress (00b) or active (10b) keep polling until the control
plane reports completion.

Fixes: 8077c727561a ("idpf: add controlq init and reset checks")
Signed-off-by: Brian Vazquez <brianvv@google.com>
---
 drivers/net/ethernet/intel/idpf/idpf.h     | 2 ++
 drivers/net/ethernet/intel/idpf/idpf_lib.c | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/intel/idpf/idpf.h b/drivers/net/ethernet/intel/idpf/idpf.h
index 470bc23c844c..ce8a1bd0ec8b 100644
--- a/drivers/net/ethernet/intel/idpf/idpf.h
+++ b/drivers/net/ethernet/intel/idpf/idpf.h
@@ -166,6 +166,8 @@ struct idpf_netdev_priv {
 	spinlock_t stats_lock;
 };
 
+#define IDPF_RSTAT_COMPLETE		0x01
+
 /**
  * struct idpf_reset_reg - Reset register offsets/masks
  * @rstat: Reset status register
diff --git a/drivers/net/ethernet/intel/idpf/idpf_lib.c b/drivers/net/ethernet/intel/idpf/idpf_lib.c
index 2c148377540c..a827e0fa67c8 100644
--- a/drivers/net/ethernet/intel/idpf/idpf_lib.c
+++ b/drivers/net/ethernet/intel/idpf/idpf_lib.c
@@ -1870,7 +1870,8 @@ static int idpf_check_reset_complete(struct idpf_adapter *adapter,
 		 * register for us yet and 0xFFFFFFFF is not a valid value for
 		 * the register, so treat that as invalid.
 		 */
-		if (reg_val != 0xFFFFFFFF && (reg_val & reset_reg->rstat_m))
+		if (reg_val != 0xFFFFFFFF &&
+		    (reg_val & reset_reg->rstat_m) == IDPF_RSTAT_COMPLETE)
 			return 0;
 
 		usleep_range(5000, 10000);
-- 
2.56.0.385.gd3acb90ef8-goog


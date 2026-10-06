Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1063B6C09
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 13:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791294513; cv=none; b=iXfofY1BeMv7BALpVJxDVmJ2dbeBJmrNzChupjVWrM+ybr+qXgRsUgvbdQrbgn8gTwnqvaWFfaS+VnJ87Mqlvs54L+IYMorNxm8KySyfF1BbfKO2h+ge3G3U0alu+SfXPedr9ptWJiTOIIZ1vplars7ykFpDk/lGscAB2FZ6EGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791294513; c=relaxed/simple;
	bh=sXxftY5MlqhWkRikS2j2X15s7NsWoRRwngFct5FbixU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ElCGUtf9MXIixQb6qsr1bSFlaRXMLAwN2oemUfdHwn3f/IF6FVJljTrHJl/F6E2EPez5VJduU3Qvd9JaMlgSVcShP78X5kJbVFva0uZPPETpU2U/cvX4tLB9ubB+sRNogltsZTYa63QTr+WVNLCCDzNrqVw9oUQWNBRRlQDhJVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=gfcLNLsy; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="gfcLNLsy"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso1342344a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 06:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791294509; x=1791899309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9XEy23Wuh2CC0adDPD2wxP8CV5aCTN0+vshsMj048aQ=;
        b=gfcLNLsy7t2R0jGU9LzxPYTd2wNewBfZPYg4n5If0QQDMopwgzrfl1EGWu2RgVlwpg
         rRq0kBckLLXSgqZ9NI/WfIN1jLvA9fSlKtTiZlKYKLPfCdKjT1C8Xo02/GNZezqrSg1i
         qIr+lYIKG4jh9aGOYxIOj7GSwVmrdEBuOyYMjh6TDsll88EPXh4qxRUAL4f6oaffHQM3
         Pcdkxq4QgdAxS891pwcIg015o33vPhl8lq0ryF7NkypIuF+qE9rqLSeZdxiKSvuBTZap
         kE1cc1JZ7lS/twkHS0wVld8Rp03Y4PDviyRuFRE+cXdeSL4gqfYkFILDLKlmrxMkIV/x
         gfiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791294509; x=1791899309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9XEy23Wuh2CC0adDPD2wxP8CV5aCTN0+vshsMj048aQ=;
        b=KfIbjWXXRt7nKEd+FaNtOX0NqoJZ6h0KI4BG34Kh0EBPVyPqV0/GeW4ISVMWFaWhTC
         Uu/cC9yv1xOsSFcT62wb8SBqdaC39ekfzzi7zv7FL2vSqFDdZhiLpzbFr/ZnCAI708DA
         biKT7MfDNWrR8AOivSwZexXOcZoujV9QEtV1kh2hStdNsl/DUab1DP+NeeKf1rVvkzjS
         qldcjgwYvBxtnjfHfLbqiAEv2XquoY4wpEL038lLCWRiSdh6FKR4Y07xl2S8TcuBh942
         a2cRVpF8fHYd+0iGBnQjzs5vHhiK0BDVsjh49OrwX72MYLZJGtOGMr2Ti2yjmiWrZaxx
         ypAA==
X-Forwarded-Encrypted: i=1; AKwUvByaaeJ2nL1Jvu9d2ZNYZRsNAsRHDxF8VS2HI6w8LNlrCgeuriV2/v3bkrh/wglDOmfeZ/cycjUHbKQY4jE=@vger.kernel.org
X-Gm-Message-State: AFuF++k7u/Cy7XCD+9xIetYBKP/7/gtjIhEg8R+8UldzEnqp6EmuDgMF
	dAmxJPKZM/nWiT48SSm5jXIBov87pROGj1OBuNz8yBWn3Ay0ZmeiHPA5cIthjR3X01M=
X-Gm-Gg: AYBFou0PaVv3ZxrwYaqB9PNa4VDEQjwrALim+v2vXBJ2kPc1Rdwx305LwSM54LKlWVN
	hFT5MeD6AQQahC/Vyew3s14sXfO4NwCMmlvoy9KgvBnGsoTJMgTFz61Llnw9lDuo8QcEDpnRrK8
	vtMnl6L8iMMSd686GO2D/R09qVmQKV+c/ReZH1whkXM2OxT9PkjaO4Q83tBE6QXwkyXKMP2XP8A
	PUexqfNpudeLbJcx5m9oO044xLo7vcHQVDEVm7s6JuguW1UFBvFQyLHz1X4v3caYiHEzA2iP/CG
	0i6EitDwYfhVNZN66v0oL2jNnHeFcKd7nfDgJXPioIOCF71lwe0pG/PBPOD9pbM6QuL0nhSqrqJ
	n63J+3z2/kGllQ6U3eop0aUf7vJIw6frA8D2SpOWKxsB/t8KZnLzCHfCV18cB6huRyY5Q46+hGy
	5VpNDTgeLYdGergAxg7uu51+l44h94DrL6FNzJpa3P6ttURU3w2E53p2h4tsf8C0M+nw1gQhsJx
	gY2RR6Vox6e8n+WrDIjIg==
X-Received: by 2002:a05:6a21:6e0c:b0:3da:5eda:d167 with SMTP id adf61e73a8af0-3e0d698c618mr9754395637.5.1791294509614;
        Tue, 06 Oct 2026 06:48:29 -0700 (PDT)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:a229:268f:9226:1ba3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ccf99acacb2sm1167538a12.22.2026.10.06.06.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 06:48:29 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Hannes Reinecke <hare@suse.de>,
	Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Yehyeong Lee <yhlee@isslab.korea.ac.kr>,
	stable@vger.kernel.org
Subject: [PATCH] nvme-auth: fail when the controller does not authenticate itself
Date: Tue,  6 Oct 2026 22:48:05 +0900
Message-ID: <20261006134807.518056-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nvme_auth_process_dhchap_success1() returns success as soon as the
controller clears the rvalid flag in its DH-HMAC-CHAP success1 message,
without looking at whether the host had asked the controller to
authenticate.  A host configured with a controller secret sends a
challenge in its reply, computes the expected controller response, and
sets chap->bi_directional; if the controller then answers with
rvalid = 0 the response is never compared, the host still sends
success2, and the queue is marked as authenticated.

A malicious or man-in-the-middle controller therefore only has to clear
one flag to turn the configured bidirectional authentication into a
one-way one, without holding any secret of its own.  The target side
already treats the mirror image of this as fatal: when the host supplied
a challenge but no controller key is configured, nvmet_auth_success1()
fails the authentication rather than answering with rvalid = 0.

Refuse the connection if the controller returns no response although
bidirectional authentication was requested.  chap->bi_directional is the
right condition rather than ctrl->ctrl_key, because secure concatenation
sends a challenge only to derive the PSK and deliberately clears
bi_directional; a one-way setup without a controller secret keeps
returning success as before.

Fixes: f50fff73d620 ("nvme: implement In-Band authentication")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
Reproduced over an nvmet loop target modified to omit rvalid in its
SUCCESS1 (standing in for a controller that does not authenticate itself),
with the host configured for bidirectional authentication.  There is no
oops; this is an authentication-logic flaw, so the evidence is the host's
dmesg.

Unpatched, the host accepts the connection and never validates a controller
response (note the absence of any "controller authenticated" line):

  nvme nvme0: qid 0: authenticated with hash hmac(sha256) dhgroup null
  nvme nvme0: qid 0: authenticated
  nvme nvme0: new ctrl: "nqn.2026-10.test:authsubsys"

With the patch the same controller is refused:

  nvme nvme0: qid 0: controller did not authenticate
  nvme nvme0: qid 0: authentication failed, error -129

 drivers/nvme/host/auth.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/host/auth.c b/drivers/nvme/host/auth.c
index e55920642f2c1..cbb38935fa227 100644
--- a/drivers/nvme/host/auth.c
+++ b/drivers/nvme/host/auth.c
@@ -358,8 +358,21 @@ static int nvme_auth_process_dhchap_success1(struct nvme_ctrl *ctrl,
 			 nvme_auth_hmac_name(chap->hash_id),
 			 nvme_auth_dhgroup_name(chap->dhgroup_id));
 
-	if (!data->rvalid)
+	if (!data->rvalid) {
+		/*
+		 * The controller did not return a response.  If we asked it to
+		 * authenticate itself the session must not be used, otherwise
+		 * mutual authentication would silently degrade to one-way.
+		 */
+		if (chap->bi_directional) {
+			dev_warn(ctrl->device,
+				 "qid %d: controller did not authenticate\n",
+				 chap->qid);
+			chap->status = NVME_AUTH_DHCHAP_FAILURE_FAILED;
+			return -ECONNREFUSED;
+		}
 		return 0;
+	}
 
 	/* Validate controller response */
 	if (crypto_memneq(chap->response, data->rval, data->hl)) {
-- 
2.43.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794300552;
	b=yjh+HxiTyec7+znkt2Wfp8lUXmWKGjrEHgSfH6KSm2BsLrJFpXaerdVpmD2I8/tooNKQ
	 hA0NeRkniaXYBOSu2XfJpNLkddMEfOQwVhh/R2ExDjGzxFQVwkZlp8iFTQ9QGJp2JrQP+
	 0qNkDY0GhGQ8OW0mTnlna7wJY/gWvHbm5yH1cawCWU+XB1c9oQr42Vkh0vA+kdB+5iRkn
	 2J/Q6Y1/snTkl7hkqCvypRCP07AIVKMgkjL35lnTltrz3qr0Byw+xhgByEIeQ778i1XZy
	 Nfg3nkrGQdsEWwE0N+rEiLh9mPvbl7cirfkgJuN78SuKpnPc8gBg7x+MXJ1KpKI4iQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794300552;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=+jpP9hHBLdvkPKqqx3Eoy4sT1PswK17YP171LAP+8rw=;
	b=PnNgNJfcrDYtol+ZCl/YmAHxJJzGPLcdlzZiT+6NuDpxwWjqRq7IOJ13AgVLhHlBsieo
	 3jJsA+Cg7wop3aO33328POCsH3IEnj6Nv1QR45kAlWm+DQWRZQMT9Ffd7pj2t23PbnTfV
	 ZlbObga5J/RKQxbQEqEIV1WJ32+USUvyb/svxybMkQNaBLnxSQpBEwQ9vYRQh+b/nePNW
	 lbSdUfP4yMYIa4+469WOBhcN3WQ6m5/g7Ve3F4IrT6s+9s00I9N/3fr8XJzK0uX+xTj7j
	 lR7suYVpjJxLw1q5FxA3ZbUBWodQqSXHS69jhsnSW53eSzq4G7Q4zkTrN51CxeRyCRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qETT+gTm;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4D3606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:49:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A4D3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qETT+gTm
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36a315ed211so2049926eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794300551; x=1794905351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+jpP9hHBLdvkPKqqx3Eoy4sT1PswK17YP171LAP+8rw=;
        b=qETT+gTmKnFSPNo83MbCr6TDSRXbiNG6AUb8oWIXCPeKr21+qWyIZzL8WV1EtG+26R
         p2P9D1O4WTWr3zM2oNUG928gnCyw1fEM2Hh5S6DQvocSJR9v6lR1/CWGcCXMhvQe4wYA
         /zYrpAUIPKK91XehOoiBoJ03usdt2lsSX9F0AqZa8CpgLWET84pN6XYNryQ5bPlViOty
         KNtLiiCSoKLG67QWaE0u4bs64eKekLec+u5ATGThoF9Gaewcc41egu+yWADpk9e9/6fw
         YA8TEPyrVpaz8KJHleLimUsOL/G/Ew9GM5glnQuUKoqZP8tm8kwmkb5JSerzR+xY8qiQ
         tuBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794300551; x=1794905351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+jpP9hHBLdvkPKqqx3Eoy4sT1PswK17YP171LAP+8rw=;
        b=skWZDvuRnOyH3dKtrrld0E1toPVpq8eIvqMwWF4SMJZARzwzhvsJWAsciG1hRkfbYQ
         VQ5lYsf+Lj2FZme9SmE76SVZ3Lt+QdbeSB5dGwrBCmOE9qV/vtAy429IbP+VbUuwQPxT
         9Y5dlvk6tZ7HwuYM+TLa3e24tTn27fqBnIliMNB5sQ9CJGtocPkeQEqA9TsxiNR3hP09
         Tbgf8PuuwxdxPZ6CRwcFZfDrervO99SUIYLuge4s5cKC4Hn/AHiUhpcCTa+5biDhoCvP
         aiCVXXOVvyn7eNiUIiqFlLd3l4QqMVbITYA+56y+mckwEJaYC7xkzgH0kzXE/rZ3Z5uq
         cxfQ==
X-Gm-Message-State: APuU4Z9BKMQIG0pvEPlOecBd1BBwGuhGxpPnb499ggBE/giNAOMZavCI
	tI6SzsEIy83v778c0YxNEAt7a2KlKByA80zUf2LD2kf0UfJPwjyb4rCp
X-Gm-Gg: AYBFou0TnxhRQkrxJBt2vyl3CJet+jtIKwWgAxUgLQb410l6+lVAp2ncQRYDxy310RX
	CQmqgqRNPGZH+ZGTg+s6ipTJAPfbe+cI0LWe2uF/SkgeCbB/SNTQDcEB9UzZQ/BznUybs7sjYly
	qXA/rrPmOcluneX/JcrjJxjS6P/VTdqpE+rIdfIm5+n/IKx5aQKN2q7otsFebwZn1fcksY/s7P7
	4LiJo1TSKLN1JK5QoniAy9EvEDWsw4SXgUJDvFEI+Nwga4hjbIkWb6DHuE0qEe7fTyt58Wawf7F
	/W8VOp9OMRYntifUjWgAGalGe4USIIf3yAJ2rVS5Snm0iAtDFeX97UtnZ235BjoJ2RbMrI6V+sV
	ZOmE6mt2jbLmqUsX2X7Q99zn4Aq9pV0pQMCXXAimtLv+xFz6QlSy0ETB3mb74bpntKaxSg2LMZ/
	LkvzjlUOVhS8lmeFnrE9G5CXn3FJybQjC5FYBIm2Ya7z3GN2wjxPo6pM/xn0FJzD5UNinHNWvTg
	cgU/iRPkcZ5RZWr5auiPDtRkubRlDG/hOhQG65X97YhxY3z1ZjM8U/DYqnmyBtLS06Q/ydrAfLe
	FrX0G1GcDGg7sLu4fSZuuNxjW/VMLPeBLftmW02ZS0t5YaJUkUF5
X-Received: by 2002:a05:7300:e9d6:10b0:36a:647b:2d7a with SMTP id 5a478bee46e88-37503f67618mr3036430eec.0.1794300550852;
        Tue, 10 Nov 2026 00:49:10 -0800 (PST)
Received: from localhost.localdomain ([103.179.231.100])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e76e2sm5897214eec.24.2026.11.10.00.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 00:49:09 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: hare@kernel.org,
	hare@suse.de,
	hch@lst.de,
	kbusch@kernel.org,
	kch@nvidia.com,
	sagi@grimberg.me
Cc: linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] nvmet: clean up DH group state on initialization failure
Date: Tue, 10 Nov 2026 08:48:32 +0000
Message-ID: <20261110084832.3508-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
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

nvmet_setup_dhgroup() leaves the DH transform and group ID
initialized when private-key generation, public-key allocation,
or public-key generation fails.

A subsequent invocation with the same DH group incorrectly
returns success because the existing transform and group ID
are treated as proof of successful initialization.

Release the transform and reset the group state on initialization
failures so that subsequent attempts can properly retry setup.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 drivers/nvme/target/auth.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/target/auth.c b/drivers/nvme/target/auth.c
index ccba84b1344e..7733d50de708 100644
--- a/drivers/nvme/target/auth.c
+++ b/drivers/nvme/target/auth.c
@@ -105,6 +105,10 @@ int nvmet_setup_dhgroup(struct nvmet_ctrl *ctrl, u8 dhgroup_id)
 		if (ret < 0) {
 			pr_debug("%s: ctrl %d failed to generate private key, err %d\n",
 				 __func__, ctrl->cntlid, ret);
+			crypto_free_kpp(ctrl->dh_tfm);
+			ctrl->dh_tfm = NULL;
+			ctrl->dh_gid = 0;
+			ctrl->dh_keysize = 0;
 			kfree_sensitive(ctrl->dh_key);
 			ctrl->dh_key = NULL;
 			return ret;
@@ -115,6 +119,10 @@ int nvmet_setup_dhgroup(struct nvmet_ctrl *ctrl, u8 dhgroup_id)
 		if (!ctrl->dh_key) {
 			pr_warn("ctrl %d failed to allocate public key\n",
 				ctrl->cntlid);
+			crypto_free_kpp(ctrl->dh_tfm);
+			ctrl->dh_tfm = NULL;
+			ctrl->dh_gid = 0;
+			ctrl->dh_keysize = 0;
 			return -ENOMEM;
 		}
 		ret = nvme_auth_gen_pubkey(ctrl->dh_tfm, ctrl->dh_key,
@@ -122,8 +130,12 @@ int nvmet_setup_dhgroup(struct nvmet_ctrl *ctrl, u8 dhgroup_id)
 		if (ret < 0) {
 			pr_warn("ctrl %d failed to generate public key\n",
 				ctrl->cntlid);
-			kfree(ctrl->dh_key);
+			kfree_sensitive(ctrl->dh_key);
 			ctrl->dh_key = NULL;
+			crypto_free_kpp(ctrl->dh_tfm);
+			ctrl->dh_tfm = NULL;
+			ctrl->dh_gid = 0;
+			ctrl->dh_keysize = 0;
 		}
 	}
 
-- 
2.55.0


Received: from mail-lr2-f5.google.com (mail-lr2-f5.google.com [74.125.230.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADAB3B19B4
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 11:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789473236; cv=none; b=V064WbH4Rqs1DrSVsgURD9fKtAdhkRQwG7lUXhZcA/q0wg315dDWRsK1+TjMXA+ZuAcGjuvrCb0URT7Zf5JldL6oPiHujeQ4oEvDvXqc+b+uLOaRtENwXdY3q7ri+OPTYpGidkS4wh0FzuRJD1c0s8F5J5U6vHdh6IV4Cjx6IRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789473236; c=relaxed/simple;
	bh=qgr/p3hceS3VtgKFOnDdhJhC8P/qNGt2W9yjpLkmnOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cFw48I9bSdgEzFePw5mMkbnt2SwvgIz47HjkMJkGIhv/fD/Z/bSdjnrW7DY9Vjkh2+bzHffWLWcYVytXY4OMamF6aXfC3Wk3QuNlfsneLdpLndXTYP0CSRRy9K7kd4dodqtkUqhw11rA+Ek57bizW2OAC9IEwNrUEyvKISGEv5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N7rYIU+3; arc=none smtp.client-ip=74.125.230.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N7rYIU+3"
Received: by mail-lr2-f5.google.com with SMTP id 38308e7fff4ca-3a20b70da4cso24274961fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 04:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789473232; x=1790078032; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SP8o/AX4s37clPQoDD9t4nYTrUrCAlJE0QLNgt9QK14=;
        b=N7rYIU+3peTYpJ6+Eo+6/R4yh4LZxpwXDBZxezGYcAFt4k4g0hU+/R6BO+6Mmwt7UX
         wq+WBy7M0I8E2uJoz3Iq4uJktYwWxTokY8YouPPFtmN8mb/ObYRKWEI3Hzp7dSCR6HSp
         uZytBroAVqYbDBdDmZruoQ8COCo69G9NdHIzNboxSv7KdccbEqZ7tjCI9BBMFKFm0Ofj
         1NdMC9VhMoGb0CRwuYwfLOuB/416ZFCnedSMcdPwu6XZ15UsVfbhcQQWJZWhn1Cw3c4P
         AGVhlMdZBwk06MdT2XjFsqq+0VpWuyZcDp1wdzFD20xUz3z3SL6uIgrCpyHFGYxLh+zV
         ugiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789473232; x=1790078032;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SP8o/AX4s37clPQoDD9t4nYTrUrCAlJE0QLNgt9QK14=;
        b=jgIEr3tbHWHcVqC1yEifYG8tyftT5/eqpXxx3kanoZtHxFlvqOPe9AGa9L9pAYQQMB
         g5lrpu1QKdSJO0sc0uetDTY4HBCn9F/6Uth7s8StkOTcPlq3At4Hw+4HBUdT/4ZHPVOI
         EJbKJ6+0Ff/J8pVcjewXhgPYlj3MdlS1yHausz/j4hLBmyMLYEDm9lE22fhkhgYlhDlD
         1hwKCULIH40Zo99s5NDkib02pqV6N99/+Bzogngsqy+8MevGKiYE1+xLXQ+Bf/MZqaqe
         jSOCvWeQVdqnIHLjuT4O1JUY1xoOpEldFHnLgtvI8kzADEeVwLOPvcz/OtS5WptPRazV
         iPSQ==
X-Forwarded-Encrypted: i=1; AKwUvBxGKjBdd8HXbOVJWE++Kxi6BN1TPRrd3GIVPNpthyDm8IWyv8VqYYUszsNZ2Zezw84Ab8+TDKRfXh8Osqo=@vger.kernel.org
X-Gm-Message-State: AFuF++nBUSD6cmFQQnT0I8WToyF32JUVP7WX8ebDjir7vNAruhrD7fxP
	9xDhkzeZRx0JQLNNHUnePaYitsmIEnS7M32S3WiEUFTYNPll+J3OCLGX
X-Gm-Gg: AYBFou2uClKas6JJRbpDJCekyCT97dlqkXOWIQqtXz2A/P8X9ykcCkEi0h7KVPBwX0T
	7oYeXsGlj+k4CBB05AsJKUr59PzY+DexgMc83BkW4LXkgzm3GobELH9fW0vFNucAFx8Ki2mIU+U
	RZb3YQYM1/1hZt/IraugYNNuCQJUVSBBvyuRPxW960lBtGrZNe90Bw3f+sjCBqaxclaWSON22CQ
	egd+QkonCcu+ZTYEO/tZIKXjqq6RXCJ8HBAktCrniVlBRuL3B5j+3EFclZOPBdeGp4qzG94yznw
	8RdurbV6JwijpRAJLiYm+SZtX2/GvqVueD7xKWjfFNZTytHD26HhQrPPl3Dcx7GikSAJzSXPb4G
	3TDjVoH7N1PpbbOWcjlLD0onwEIwVgh0ATJsrUgiFZDi/gLK0HMB5FKb+hyJcdDpX4MCu/6fMRh
	tH5Ji7H3QDFiUcZFQtXQcMiTk3V1jmDYIiibVATczb/ID8DCnzlnds22nkZub7tsCkpdowTy/HW
	tH40lICVZ2VUufuMw==
X-Received: by 2002:a05:6512:15a8:b0:5b7:6107:eb77 with SMTP id 2adb3069b0e04-5b8ae6afaf4mr1574809e87.33.1789473231548;
        Tue, 15 Sep 2026 04:53:51 -0700 (PDT)
Received: from localhost.localdomain ([78.40.184.2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a0457238sm3216340e87.16.2026.09.15.04.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 04:53:51 -0700 (PDT)
From: Roman Demidov <roman.demidov.nn@gmail.com>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Roman Demidov <roman.demidov.nn@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	Tim Guttzeit <t.guttzeit@tuxedocomputers.com>,
	Werner Sembach <wse@tuxedocomputers.com>,
	Kailang Yang <kailang@realtek.com>,
	Zhang Heng <zhangheng@kylinos.cn>,
	Sean Rhodes <sean@starlabs.systems>,
	Damien Dagorn <damien.dagorn29@gmail.com>,
	Martin Hamilton <m@martinh.net>,
	Bharat Dev Burman <bharat.singh7924@gmail.com>,
	Lei Huang <huanglei@kylinos.cn>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
	Lucas Tanure <tanureal@opensource.cirrus.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Denis Arefev <arefev@swemel.ru>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 6.1 v2] ALSA: hda: Fix missing pointer check in hda_component_manager_init function
Date: Tue, 15 Sep 2026 14:53:39 +0300
Message-ID: <20260915115340.105976-1-roman.demidov.nn@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Denis Arefev <arefev@swemel.ru>

commit 1cf11d80db5df805b538c942269e05a65bcaf5bc upstream.

The __component_match_add function may assign the 'matchptr' pointer
the value ERR_PTR(-ENOMEM), which will subsequently be dereferenced.

The call stack leading to the error looks like this:

hda_component_manager_init
|-> component_match_add
    |-> component_match_add_release
        |-> __component_match_add ( ... ,**matchptr, ... )
            |-> *matchptr = ERR_PTR(-ENOMEM);       // assign
|-> component_master_add_with_match( ...  match)
    |-> component_match_realloc(match, match->num); // dereference

Add IS_ERR() check to prevent the crash.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: ae7abe36e352 ("ALSA: hda/realtek: Add CS35L41 support for Thinkpad laptops")
Signed-off-by: Denis Arefev <arefev@swemel.ru>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
[Roman: Instead of modifying hda_component_manager_init() (which does not
yet exist in version 6.1), a check needs to be added to the
cs35l41_generic_fixup() function—the very function introduced by the
offending commit, which calls component_match_add() without verifying its
successful completion.]
Signed-off-by: Roman Demidov <roman.demidov.nn@gmail.com>
---
Backport fix for CVE-2025-40097
v2: 6.6 is missing 1cf11d80db5d ("ALSA: hda: Fix missing pointer check in
hda_component_manager_init function") as well, and it is the newer tree,
so 6.1 cannot go first here.
A 6.6 version also needs one more hunk than this: 6.6 has a second
unguarded component_match_add() in tas2781_generic_fixup() alongside the
cs35l41_generic_fixup() one.
Send a v2 covering 6.6, both call sites, and 6.1 
as Sasha Levin <sashal@kernel.org> suggested.

 sound/pci/hda/patch_realtek.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 7b4fd95c66f9..9e6846a37d67 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7021,6 +7021,11 @@ static void cs35l41_generic_fixup(struct hda_codec *cdc, int action, const char
 			spec->comps[i].codec = cdc;
 			component_match_add(dev, &spec->match,
 					    comp_match_cs35l41_dev_name, rec);
+			if (IS_ERR(spec->match)) {
+				codec_err(cdc, "Fail to add component %ld\n",
+					  PTR_ERR(spec->match));
+				return;
+			}
 		}
 		ret = component_master_add_with_match(dev, &comp_master_ops, spec->match);
 		if (ret)
-- 
2.53.0


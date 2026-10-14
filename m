Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A23479880
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792005684; cv=none; b=c5hovlRUbOilC9o8oOuPn5X6Kt5JWgvKyywYfKGktTRacCjgRdBqir5lVT/fSKuoXGFBxybn9dOhnb5XLO1/Afo82UkkEW7xi3lUeALJh1k1vRYHVS+QgXcrQk8ravB1ebO16jVJtwVX9WnZKT3ljumrtGFXWa23nTs0VsnEaWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792005684; c=relaxed/simple;
	bh=UrMyo00SNY2ABPsFiD1pr1qfiLMNapahXhN5HWuZbvA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rAbijKibca4eUaywlVZu8Gstn694vHNItcBAg7JWyQa0SnX/wsYDmJfpy3z+8n6sF5JE9D1CgGGURTnRtXKsgenZYmxryRLKClSG9ZLab9lLdGY3NASCDv0fyisnGK6R/8VdWRBDnQGWCZClCKqGGwWuVZ+RXOysUm6bevCtdHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=H1gVrXDD; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="H1gVrXDD"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-353804b591eso7946935eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1792005681; x=1792610481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FKWPHyXm/RBE3XBdWdQ17S7GMceJugCqc25wfMm20QQ=;
        b=H1gVrXDDyQ8UIHoIheY/+RwT1BBtBVvr01/IgjHfyZE7qdDB2zt7DWFgONB1MGERH7
         54ifE5QIzGtLNpgOKoVBC+4nLj4LCAQDu3eSPf/l5DB4JRZN0GNgUMlKinpJaBlJIn9m
         Jl32acUW65YGx7i80VXQLOc/kSCrsaH2tc0H4DjPk5EJszqKvXF9taA6jt9CWqIEs/7n
         6jJj4fdU92UuAu3uOThf3UwkkgCd8Dfc8VX8MXdt/oQvnzppu4iejtPSLZ44k7TIfHR3
         Dv4/vkZeg1JRpumV2kljA9C8WjgCSAG30fzdrZI/DM4f7AtaBSmKKdvBBytwDqC0vkHN
         iH0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792005681; x=1792610481;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FKWPHyXm/RBE3XBdWdQ17S7GMceJugCqc25wfMm20QQ=;
        b=GLVzm8uL6N/VmeDOvK5CntIrXivmPD6Y3rQo7+o/Fkuzih+kMDpUJUDwu5xWVzz6OO
         +o3eHqipNa3qVCdwc4gjQN7wW6T53s0lkmfiAEStA6U+i+kXxJaDUrkwrHIXrHfctURw
         hUpdxEIW3EsCF9sQazbMVoqiLqHJGorV/621QSz7YPmoA18SQ5PuXJbt67SrCwR1SLAo
         7Cf1Ik/egK6pcm4l6MTjHZ8Dicdsakvpl/NH21/MxYYYTyOiMEdMrCU7mABTuouX4ddH
         3UbL19HFQmUNlUrKKrFc9veMacJPCQR9wvM2hGedBi1QkzgRSZ2Oryk/wBAF5RL3aeR2
         DCPw==
X-Gm-Message-State: AFq9FYLEDWwg6NzaQYQUcBarg+hGKZY/tlQwzzLne2nGSE8b91+oTdjs
	i/r8Ud7taNSyIUastLYWx6ZnuBc5fYZ8YMBal4fnX3M2/X8VM148CCPpywwSpmbviMM=
X-Gm-Gg: AYBFou2HefoWueNofIa4WZygheKXfcK+Q8nYxavaKWbT5Mb587ijbFfEl+VVgIX8l7K
	ARn29uE/ZslYW1SFbVc53Qjq+8tmP5gNs8LUBmNTlKl51CGH/x6H0YtpODLJDbIRsL/OyQ3RiUr
	cmX6qHOUt7YPccFQ9Q3FyH/koOjclcU17mPd/j+FZl0cHwZjamE1gzodUm60TqXrzn1mPiQ2vgt
	Bgba11ZMPmiu5rxCeWX0p60GolySyONaoAG/c0PnvyQj40X3iDPDyXuEoc+K/iCBDJEHRzLYQax
	LcKQ9bXGfnVWTo4UCSHWeH6zlwgEbz8yOb2XzX9/aTu31oselTqOvsPMXAblnZPkgk0F15WS5V7
	7wGD42R0KKPhnU41q238voM9zzAf2h1HhoqvziwziNFs03tLtgwF3jkPQbSC7DGJyMmg/5HjU75
	0a7C1y3ealQ2kFu9q8m1s43ut3adWLxRU1IZZVcVrlVpWthsilKqnG7B8hmdNtQxfScQjVcGyYS
	7MT17eMtRoKb1fBW/EIXnpMHjFqxYUNOkmXX3rCeaalhuKxVW+NloDmIwl3HBFTZJeQCz4=
X-Received: by 2002:a05:7301:53c1:b0:351:5cb5:53f7 with SMTP id 5a478bee46e88-3537dedd531mr23549875eec.3.1792005681162;
        Wed, 14 Oct 2026 12:21:21 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:39d1:d8de:aae7:23dd])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35b29c2f861sm38670979eec.11.2026.10.14.12.21.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 Oct 2026 12:21:19 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	tiwai@suse.de
Subject: [PATCH 6.6.y] ALSA: control: Don't add invalid kcontrols to LED layer
Date: Wed, 14 Oct 2026 15:21:15 -0400
Message-ID: <20261014192115.24210-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Takashi Iwai <tiwai@suse.de>

[ Upstream commit 74e3b979ce8b78a690f8b94ccf2e2c965f7f5c11 ]

The kcontrol LED state layer tries to track the all associated
kcontrol elements with naive assumptions that they are readable.
But one can create a write-only element that has no get callback (even
a user element can do it), and this may lead to a NULL dereference at
the call chain of snd_ctl_led_notify(), as found by syzkaller.

For avoiding the Oops, add a sanity check of the kcontrol's info and
get callbacks, and just skip the invalid kcontrols before assigning
the kctl to the LED layer.

Reported-by: syzbot+b7fe2760ea6f1ee44b4d@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/6a9007b3.1d9ded08.62e62.00cd.GAE@google.com
Fixes: 22d8de62f11b ("ALSA: control - add generic LED trigger module as the new control layer")
Reviewed-by: Jaroslav Kysela <perex@perex.cz>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Link: https://patch.msgid.link/20260827113951.893291-1-tiwai@suse.de
Assisted-by: LLM
[ Backport to 6.6.y: After the target's locked control lookup, reject
  missing info/get callbacks via the existing unlock label so
  controls_rwsem and the card reference are released. ]
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Hi,

Please consider this backport of the fix for CVE-2026-90060 to 6.6.y.

The code changes are identical to upstream, except missing-callback
failure uses the target unlock label; see the bracketed backport note
above.

The complete fix is already present in 6.12.y, 6.18.y and 7.2.y.

Build-tested only as part of a cumulative 6.6.y series: x86_64 objects
(allmodconfig, CONFIG_WERROR=y); no runtime testing.

Thanks,
Artem Dinaburg

 sound/core/control_led.c |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index 15acb07c651502d4dc22f72bcc9e3a47923caf5e..639d86e4dd1623df612ead223a11e049fbf39afb 100644
--- a/sound/core/control_led.c
+++ b/sound/core/control_led.c
@@ -253,6 +253,10 @@ static int snd_ctl_led_set_id(int card_number, struct snd_ctl_elem_id *id,
 		down_write(&card->controls_rwsem);
 		kctl = snd_ctl_find_id_locked(card, id);
 		if (kctl) {
+			if (!kctl->info || !kctl->get) {
+				err = -EINVAL;
+				goto unlock;
+			}
 			ioff = snd_ctl_get_ioff(kctl, id);
 			vd = &kctl->vd[ioff];
 			access = vd->access & SNDRV_CTL_ELEM_ACCESS_LED_MASK;

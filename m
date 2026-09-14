Received: from mail-wr2-f9.google.com (mail-wr2-f9.google.com [74.125.225.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237FF39CCEA
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789373162; cv=none; b=AJccuX7B707CaN33XTD4m/NhR9hRsa6Z0ib+DfE1zUxk9ZKDKF1wNKNexfh8mHIdwiGiql6CKUxMdVmO3R2QZqzRJ9hOdcSpBAoYyXWZkpcOdBUlT2IEGmbRNv3HafPiNb/2/OsNJiR6t7pxrsPTdI7pIvZb77d2dQkPGOdsPm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789373162; c=relaxed/simple;
	bh=y//kUZXKT1lm5smHXcQPc8RjdKiy2djCT6Sh2UKuGrM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WbdPpUq3oFc/TIKtD4RY0O+Df8tdPiKPfj1Pv+crV6Xr/7GJ/9NEQgTRN7TZsjm9Ex9eAabL3jADLzZ97TjlugOr958fV4waSdliX5Wj/ngibVGnYNEa7JoJAOj85VonJZGXk2j0rtUNpMf6PUv0u0QL8MuXTEmJr80c7bTtn0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DIboSOHp; arc=none smtp.client-ip=74.125.225.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DIboSOHp"
Received: by mail-wr2-f9.google.com with SMTP id ffacd0b85a97d-4858866f7ffso765898f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789373159; x=1789977959; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4pyHVI/MA8Y1XwfEMB96UsVZKJ18D0ODeQhP8/x0ooA=;
        b=DIboSOHp71g+gAidKhoHoI5DlXHYyoMald+oKM6BEJ+y7FDhb4OIjryImgf5/0CfR+
         rNjl7cgZIcTh6dvuR8eN/Kx2n+s3JAbz/jv8HeR6Tdh2m3/eD7imdwRAsKC6pgNH0/CE
         p+hGbSeQ9XQCERylsGU7jf8M7K/xzwCRiVy+gs6p6DTEkDLgVh0Kpp8yNBZXUmWVTS7M
         Zp0rF2okHEccyG+s95Gp2ifoM8RoEs7G8631Bm6cM1bEnqbwPL9gb7RySawbCZ1tXYqA
         XePztLKBBP//uB0vsRNLKKE1iOQBcXLEvy8xwxqoYPPb78y9ahAxmJphLU0tOzHMee7b
         K+dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789373159; x=1789977959;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4pyHVI/MA8Y1XwfEMB96UsVZKJ18D0ODeQhP8/x0ooA=;
        b=CsC07mlE15tlbW0/hENaBjRZXG1SvEziiz6pOs8NrejAsOFPDTu7ElYqddtliO7SZi
         yK3kE5aDs+/E+dNGIO69Qv+mWx61cjJHQXuGoT5SWdclZu6jRSOEfrKYDV/pMOUMkruG
         OysRl3gIpLC+1S99OmIiDK7s0JidDEnA59kTGU4wRU/1RkfMKjRHcJbHIkkP9TRwPJCI
         k6mhxxtCTUhz6fckauqvfKAsw39A3CRU1qnj4sbWb3bZ3AtoegV/xiOOa0OsG5+Hustc
         t0++GrhHdjIZVEt0xyisokYUSUgHbHpaqGXx9AywSJ+Etg74OpyJMxHF6xRQgYf8d4j3
         AZYg==
X-Forwarded-Encrypted: i=1; AKwUvBxjw2lX+H2ztjwcpP6u0TCqnOR6vVs7xLOc7TmiZxA7IzROwdqSVIzJaFEVZaSLPVBd6AiZ22GUwqAjHxk=@vger.kernel.org
X-Gm-Message-State: AFuF++lfZ4zBppUlKGAY2Xj4jLUZyYvc/oBE2ZSrlknBXX9nObhh2YyN
	xr1C+47sZgMuo3lvkRROucSbKmeW+U6xvWHS4BEfMHnnZy4Aj7ZYApzE
X-Gm-Gg: AYBFou3umBrNbPTf9tOGH0rGgdgfK76nKHxaOvnu/ZaP7ZlFI5KcsBm8RlCtbdNwSEW
	WRH2xD8N9/3Een+WEwE0nZ1+obk3iyqtOhAuOT3SxMMzKAu2sj8a5HgQaqQvOKUX37keQ5pzpXX
	pBxNs2AWtO8gV6/dHkxc+Ul5rLTnLWY7v5VuXttg8IXSYW8mDMpnAftyfZ5dcT/unFX7iYS+4qo
	n2SpWF43kWNTCKtE+gMi9u5wHSvOt6xQ3Q3XClcgJWm5A59QixJsLWINqc1wgsc+SURpZsErnrQ
	QMaQ/VbSwlYFrx8nCCc/4oZZ7pf2p/erxijxm6mtwyGdLemBver2VQbeyfeliqBNWt9D4y0oQno
	IEoA7sGq3v+Wk4vPh8hQUTPS4LCfujme9w6wO6Q0pA+AZevVr8aDqPcp19AzLppuORuSXtnw3ja
	/ypKZQeuMNVLHGYs9USexFeg7+834Aj/CPcScSmi7+8SWKV+gVYQeM1l7wTpbEnaFCNPFxtuRzY
	KTHniSkg9hPYiYw
X-Received: by 2002:a05:6000:4281:b0:485:8c17:9761 with SMTP id ffacd0b85a97d-48702aff858mr1622347f8f.35.1789373158956;
        Mon, 14 Sep 2026 01:05:58 -0700 (PDT)
Received: from localhost.localdomain ([78.40.184.2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32e6f1sm24339329f8f.6.2026.09.14.01.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 01:05:58 -0700 (PDT)
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
	Denis Arefev <arefev@swemel.ru>,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 6.1] ALSA: hda: Fix missing pointer check in hda_component_manager_init function
Date: Mon, 14 Sep 2026 11:05:45 +0300
Message-ID: <20260914080546.11947-1-roman.demidov.nn@gmail.com>
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
Cc: stable@vger.kernel.org
Signed-off-by: Denis Arefev <arefev@swemel.ru>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
[Roman: Instead of modifying hda_component_manager_init() (which does not
yet exist in version 6.1), a check needs to be added to the
cs35l41_generic_fixup() function—the very function introduced by the
offending commit, which calls component_match_add() without verifying its
successful completion.]
Signed-off-by: Roman Demidov <roman.demidov.nn@gmail.com>
---
Backport fix for BDU:2026-03984

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


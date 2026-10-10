Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9944AA02A
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 16:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791651477; cv=none; b=pyloALIzJp156+TBAiHymFm05liaJMyCL0dGHrcZNcotbqAJ1Cu6ssxeWFhmMY84q8AyfMsIXJyATVUHII4Aa7nmJJeAOwM1gKwsQjGCkMg1xdfJIC32nxkSUv7SU5YeZrOXV9gzkxawYswelwvedny2AIK2WbGjlumGMzTW8L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791651477; c=relaxed/simple;
	bh=cCygBRnMP9qERVWg/AOW2yQhPMFxQNWL4sUKuOITqrg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IJQN0D+XtUelzNsC0VoZhA66X2O+8VFwkhQucvGfUGwalYjZuHMOhgNgcy3tHCP23F8X3xUc2SIwgz9XRBOK3EP0V9HlepVe3fDe/eZmayRtYlul856LIryjpmsqfX7p1rpQauFAEmAWWn4ZG8Q8xFV69liF2NyuHdRLbScKhXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu; spf=pass smtp.mailfrom=cs.unc.edu; dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b=DjPsyFW5; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b="DjPsyFW5"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-92f0b5ed131so96920685a.3
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 09:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1791651474; x=1792256274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y+aWrByMnnkP34ycFrZEpngJ9FZ+gHc4fELs0PSjAVk=;
        b=DjPsyFW5zmnAsatxO7s5gEhwTpUJaOQIRq4mTanJZf0OCr9r3SxpjhMhC6ij5IceDm
         jJSXrsJZhNkMtG2j8TnXZSJGUvlFb9q+pZeN0qQhrIjENywK2ixRvgWRzybo4is+vmUg
         Wu5EHePou4C9EdEQIxPDY5SIpxEO3kjeFGtXj/wyrUbykSz72ckbNYogfrQdcUQax51g
         YYHEovKwGNDvXpufoisy0+w33eqB238jCAWH9QONTto8jmdAtENnOIdK28fxZYRPOx4K
         tFuC28+q4fDViKZF99PVD2NGWbNULGnIJvKl+1yYBd3a5l29ZlLDBS6WIjbCywDBPtWG
         Tr9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791651474; x=1792256274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y+aWrByMnnkP34ycFrZEpngJ9FZ+gHc4fELs0PSjAVk=;
        b=pib7WLJIM6MI4cdkh5vutzc+q76AofXffJGhzZV5bOufQHNeUtz0xhuvtvLjE6xlyw
         c4fHoqnS+7cicCuw1rI/Fkw6CQuQi8Rxv5JMA9ZA2nTLLb+OjXBfm9WmThV92ZY53Ngp
         6ZqZFg6IDPWieKCgPahUiNLPGOxS8Yzi3oetws/QcmaRi6eXrBznW+YVqfLietcgrTlb
         0uI90ddBnbcYNH9ObWXI+1qAcnyBxvuoUrJ/EdCDApyrlPbO778MG2us7uqumk7prYmK
         hLcRjwMn81xw4Crm5yeIIUHQ5LaxjmPglFwPY4X6FzLtlnKynZp09BMYHt71uBl0sB+n
         MPKA==
X-Forwarded-Encrypted: i=1; AKwUvByD38mjsA6NE2SlGq3FO2+OIARzJMxrmUsdaLs2CAY6/5b8jzOp4GbdkFGc/jWgC1woYxOTneI8aftKt/k=@vger.kernel.org
X-Gm-Message-State: AFq9FYLAYYb/8EJkOUakLBr37rJUhIzzTwVHcDvs+Wvt78q4BaHdBoIL
	Q18jjP+J1314pWu1M+ClQHPlqlHe4LdQ3blk/RgULtHMC7GmxlpL0zTjZiNbvV4NJg==
X-Gm-Gg: AYBFou0bfzHuE5og/c0rIy2WFLkbXTyTLDNbDW6eASCf4ZyayUqB62E6Xh9wRfywjme
	24/5h0waBiqpqju97mRvhLSUJl/DkH9bXb5uOe4nItw2NRBUiuo8VTf8ViebavV9rFz8+nREpf5
	/eYjlfg+OmRfpa4XWZKH2MhzlhXtqwdnqRja61iN0UjTH+RgZoaRQcWMqpN47XkLjg/YZJJLzPM
	Pcu7n3dtHlE6Kdrs2Ld4y/VQ5lZh3BAH7dPGiVIZ5hq80n30ZOf6a/OGtzXo5CR7kiWdSstNmIg
	UMOVO6K5Dc3CSZ97L9yT2RxrG6C0XAg11ioTZ+n1xy46I7eHgVWDFwF8I0dOwmYYEcrdKbq1GBV
	N1kKpasSh/WZWSH4u7SlJwUBuGIphG9ZCTyuEwv422CZRoNGC8pMt20+EPFMmNzRY09IeBMyFVE
	To6Gyxeq3dXf7AinrXLB4s9zcuwMnqa/0mCKT75eHnSvw1GsidFk1iHs22ubKSjuy3QyZg3dPZk
	hGTBkj4JQnd6MB3UNyieA==
X-Received: by 2002:a05:620a:c53:b0:93c:779f:3e02 with SMTP id af79cd13be357-93ebd0c0021mr871221285a.11.1791651472163;
        Sat, 10 Oct 2026 09:57:52 -0700 (PDT)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb98488aasm459739185a.7.2026.10.10.09.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 09:57:51 -0700 (PDT)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	daehojeong@google.com,
	joannechien@google.com,
	stable@vger.kernel.org
Subject: [PATCH] f2fs: allow empty strings for journaled quota options
Date: Sat, 10 Oct 2026 12:57:50 -0400
Message-ID: <20261010165750.509939-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 2a3db1e02ce0 ("f2fs: allow empty mount string for
Opt_usr|grp|projjquota") added support for passing usrjquota,
grpjquota and prjjquota as flags to disable journaled quotas.

However, it also replaced fsparam_string_empty() with fsparam_string(),
which rejects an empty string. As of now, mount(2) and
fsconfig(FSCONFIG_SET_STRING) reject usrjquota=, grpjquota= and
prjjquota= with EINVAL, although these forms are still documented in
Documentation/filesystems/f2fs.rst.

The issue can be reproduced on an F2FS device with:

    mount -t f2fs -o usrjquota= /dev/loop5 /mnt/f

Before this commit, the command succeeds. Afterwards, it fails with
EINVAL and logs "f2fs: Bad value for 'usrjquota'".
The same failure occurs when remounting to clear a quota file name.

This patch will restore fsparam_string_empty() for the three options
while retaining the flag entries, so both forms are accepted.

Fixes: 2a3db1e02ce0 ("f2fs: allow empty mount string for Opt_usr|grp|projjquota")
Cc: stable@vger.kernel.org # 7.1+
Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
 fs/f2fs/super.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 1314b6ccced9..3867094b25f6 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -338,11 +338,11 @@ static const struct fs_parameter_spec f2fs_param_specs[] = {
 	fsparam_flag("usrquota", Opt_usrquota),
 	fsparam_flag("grpquota", Opt_grpquota),
 	fsparam_flag("prjquota", Opt_prjquota),
-	fsparam_string("usrjquota", Opt_usrjquota),
+	fsparam_string_empty("usrjquota", Opt_usrjquota),
 	fsparam_flag("usrjquota", Opt_usrjquota),
-	fsparam_string("grpjquota", Opt_grpjquota),
+	fsparam_string_empty("grpjquota", Opt_grpjquota),
 	fsparam_flag("grpjquota", Opt_grpjquota),
-	fsparam_string("prjjquota", Opt_prjjquota),
+	fsparam_string_empty("prjjquota", Opt_prjjquota),
 	fsparam_flag("prjjquota", Opt_prjjquota),
 	fsparam_flag("nat_bits", Opt_nat_bits),
 	fsparam_enum("jqfmt", Opt_jqfmt, f2fs_param_jqfmt),
-- 
2.53.0


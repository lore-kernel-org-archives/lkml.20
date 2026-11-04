Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793826547;
	b=28YrTADxKN0I4MNNkNTWxWrNyeSMwU9qKkf7+ErWTFcaRY0D9ruiPwkkPdT5JMO/9SOD
	 MV79NJVtyeRWYWC/ExdV0VP/NhapvqglU1HMcOZbopuOLVp8apyEQ10yU2pcyhZok6K89
	 3nD5d11mFGLoaLgkqU53rWptOyKkz+3pDEfNuFY5Gq5LXsCd0lc+OAyVU8+Loi6Tfa59x
	 scu13ZjW6FDpzafdayozmRCcltnYWYw8SH5dyZSx8RLmYaGA2QpqdbFTn8+DHYjn12QCG
	 6wzWH80PuIeuC35JGVLdrIK51jUbLJ/EiqCJsLnoXuTDqdpWe1dFT+DMMWbKQiVZlGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793826547;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=irqZ6/3MyiMekC4JKIQxGO3/LPhRZcckOlSBTK+F8dQ=;
	b=yEff0p5/BJNu2d5JyN6cQRCNsTrWbd7LZvfhUBiCip3lm2eMXxsAOC5mGP+hczOZaBWS
	 x84ONCTZeDXY/twe43TIxjW13CCjUwtRP5JL/EFM77FZe+Dr1tmKT4BNNECke6c3HsDD0
	 EWXW1dBvZDEszhQKNCHW0Y9sE7g0MGtJCHNr6Jz+gN7dV1ThZqE2J9uZb/ns0/SR51bRP
	 VXAzx7KP1Mw9e01SoIr8yjX4h8rIDETEE/cO6LHdTHz9w1L1OcKm3KehedqfrrgczbNU1
	 l6iM/BK8on/kiJlGRnskZMhjXaW3GVaUnjh96un83Xmwra4FqeE2FHP+tZsY18RLimQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UEg7oruh;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813E7609CAFB
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 21:09:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 813E7609CAFB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UEg7oruh
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso10351005e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 13:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793826546; x=1794431346; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=irqZ6/3MyiMekC4JKIQxGO3/LPhRZcckOlSBTK+F8dQ=;
        b=UEg7oruhJEBaj6ZB2neW6iSWvxxOKi0Wv37wuZBin/3EppB4M0EOSjSnRf5+lMJzSF
         X3P0nqm/4cMEfx0KlrClvKbM/Br7UFji3TzrxtfCC6Sf9mx1UcopnkK728VVYbQ7l7OX
         STE6EC0EJCt/njfoPJMnCO4ZZfskJpaN+ztgkQ7RBbF0WND7fy88qzn8aFXXW6EvyQ0n
         8HXhyxkVdFJVfOo6DuR/NPDbLrepl6n3wm155kLXN1VajbJvz4Jbtbk6i1DsW+G/WlYx
         m9IiGgWz/pn+oFCfwTzgKhP/zqzUvvajiIth+ab3ZxiZki6c7lvTaDKWuEfwHw0Axw0A
         D6NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793826546; x=1794431346;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=irqZ6/3MyiMekC4JKIQxGO3/LPhRZcckOlSBTK+F8dQ=;
        b=duKSQOkErhTHo5Mkrw0iGjvV5Og5VvWRXnk5vXWpXtXz/GzTXNGQAv9AFqXZyMMgKp
         Wfiw1AH5uPglrUCTEI0eO4N7w+DR+1aWMaLylqBc2P40s4YmpCX9Ds2XlEovi3jFqbF1
         HukCCU2DJ9+oTvIZzuajxaP5sOdvZUXyMvNM09gSHQilmAVKExxsTX2rERKg38x4Sp6k
         AmIzemQZOhyr1BiZS3WDI6d7c+GnJ4uQDSlqum3MTfPIiaqb1ExOAYokK4eTcOECEtIJ
         HqxI4Rmqc2xFY0PjDsEU8qXoTFaKYCUspJaguTO+ZdZ16s3jIGldtYIRWdDwY3XStF4K
         eXyA==
X-Forwarded-Encrypted: i=1; AKwUvBwg75IdRp+kUu3lkar57iZbSktmSX3X6r9SYxLmf3I4HjvmNvL3zSzsVry6s41Z9vIP5g6jchDtWtM6AaY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/plVnPOqpNCnUfer++c6hIH/TZc0+0vsEpf2QU5iaHGVFunHuE
	1inFQGRsupBs1fwNIlOmIDE3sP+02m42qxLOoqSvzpnMLTGUXCZdKQ0e
X-Gm-Gg: AYBFou2LaYu3/GRSO+a7I9g6fb11VuKIP52v7Ucl1AJ+p6WPVDLtxdRsIToUR5oIsnX
	gkQEudAhUAhHLdOoVTBDNvhP1OGdLn0pG7rIxlpy3j/b6GerfZhGg3sf1yXLWbwAqQpAcG0ZVYM
	yLONvm5ZTUnevKFB49AYDX9tqqGKnUtcc8J5lNtpmSkQXiitWThf6sbCJOgsJlbZy4cGdjJcDkE
	4s98oOjiBFXPn+hvmImhSbFIhUTRDODjHvhSOi5qeJ+0MusYtbHTooisa9wIJqkqSF5/aR7EBhd
	V9R5E3NMPXWsiCFLLwu9v7XmxsG94fp0YMHXv8+trjeuVKAVQzvPFoplrjQfJOhW0FHrJQ9/O6z
	OKQBs3Khel0nhP56LdIL9nzIrKxe0v+fJ5fN51/W2yOjNbnnGmCCHXRL7GmNc9mAv/eZai9jvd2
	YXJIS9dVMhU6/2NmpJBJ0PpIZeF3VRqNVEuPpxw6moNpuMyhyW+APrTqC1+IwTBMo/7QUyw3uNX
	lr+Yc0tOKkZMMTxcZGv+N7lOwPMFDULuLGsfCrXzne6PQ8U9gC0wUed8nJoWpQxcBh4SJYpjWSJ
	jRHmf6FxUkuIiU3e2r9vC7K/S4Fno6LE3SWzBjdO4f/kvklJZMwHQQ==
X-Received: by 2002:a05:600c:1d07:b0:4a0:23f:8b0d with SMTP id 5b1f17b1804b1-4ac150b229cmr403893635e9.2.1793826545784;
        Wed, 04 Nov 2026 13:09:05 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b433ebd278sm70399275e9.3.2026.11.04.13.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:09:05 -0800 (PST)
From: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Date: Wed, 04 Nov 2026 22:08:53 +0100
Subject: [PATCH v2 07/27] selftests/landlock: Fix the ruleset_fd check in
 empty_or_same_ruleset
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261104-selftests-refactor-v2-7-c52f23f7ce33@gmail.com>
References: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
In-Reply-To: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
X-Mailer: b4 0.15.2

ASSERT_LE(-1, ruleset_fd) is always true, so the test does not check
that creating a ruleset with an empty handled_access_fs fails.  Check
for -1 instead.

Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/fs_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/landlock/fs_test.c b/tools/testing/selftests/landlock/fs_test.c
index f725882fa4a7..7d399c097c93 100644
--- a/tools/testing/selftests/landlock/fs_test.c
+++ b/tools/testing/selftests/landlock/fs_test.c
@@ -1456,7 +1456,7 @@ TEST_F_FORK(layout1, empty_or_same_ruleset)
 	/* Tests empty handled_access_fs. */
 	ruleset_fd =
 		landlock_create_ruleset(&ruleset_attr, sizeof(ruleset_attr), 0);
-	ASSERT_LE(-1, ruleset_fd);
+	ASSERT_EQ(-1, ruleset_fd);
 	ASSERT_EQ(ENOMSG, errno);
 
 	/* Enforces policy which denies read access to all files. */

-- 
2.56.0


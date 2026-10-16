Received: from mail-wr2-f9.google.com (mail-wr2-f9.google.com [74.125.225.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F5038B12D
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 21:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792185336; cv=none; b=g9C7Sor8yGUsvertYVscXLhWf/mYPZW0M9xpnjnHTjc0zu0wFxEHxbx5OdPfctxsLgvaWjEeXuCw1kAfIDOi/XdaJ0XzDUIFRJMZ5sjOP/UegmeUCLJiAk/ogO95gI7r8hLohuiOI4utXq+tuE5N7w7OBI+0VEiPRxWktTCRj1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792185336; c=relaxed/simple;
	bh=VDhoRC8pTDDxagB5+GaxGajkPzB08MIxYPYh76G6PGs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PXJSmIsWUqXC6rQHA+L0XKvbRWQfqZObBijTqSShf/IOOkMz5g3mZlnP2bh1dIBiJK1d7wj3NXVSx/nciEOyaTV/oJwzly5zYtHwZrRqUfpIy3g+pLfYqKSKuPj9Uq9YrUGlcSaixmq/7cFRFkGBDXVIAcueCuMgPgYXWgi/1DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dVJeVWnq; arc=none smtp.client-ip=74.125.225.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dVJeVWnq"
Received: by mail-wr2-f9.google.com with SMTP id ffacd0b85a97d-48af4c25844so91511f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792185333; x=1792790133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W2AfFv0+pkUutze//OvmWv+PrVpNHb3Li7gq4EBtbHs=;
        b=dVJeVWnqNTi8jo6oCJP9rDF9gKyVs8ayD/61KFN8EGsQTtLunuTOAFdVm4QP+debYE
         HCGSI3ThznGImZX82J0+c4cpaHMDr6NspRRPrlyTAmBSMYOepVfP0y/Fp2OitvGmeTcy
         WEN/QbhInKSDty303dTPUU/oGBrjvWTquWlNQgwFkpjNfIDXYMEZ0Eibh4f+Zy6Ok7/f
         sRSX7ciPg4zh+73boWRuXnKAW+1HLusyVeyHj6asU5uGPK2pOaT7kcsvNCg/quA1d52r
         iRgBDyJQazcLtmFcE4mVm1d2Z7Dsf3CLulSxooVqOyiVJL6fEvd23J3DMgCX/D4ozi0l
         fwAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792185333; x=1792790133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W2AfFv0+pkUutze//OvmWv+PrVpNHb3Li7gq4EBtbHs=;
        b=Ssp5Ove3WJ4spqEBDnKWhF0uY7MDuBNhywTcmFX2eKrnLX3XBodnQeVl8c8rLElCeU
         BNSgn17yFA3YAX1lPQl09Wza8ZzPlBHqZbxn4j0MJXDEwjomLNVVmcYIvT2FJ/J5+QM8
         tHsZwDBW+kBjMXUmGm/RZotU74z4VmnCYSTvM6Xs6ocmEOSwCQr4myLN6ObsxIk+0aky
         MWE/a/7tXwgtJM2M+OQq9rRINytPELYcFaBz5yvv6vdNaFAQF6+xSfA69l0xhL5swyL6
         5vhX4GiCtksZYKHyZDasnjT3/NU2u1mCo9CO6WkS5DfyYEj9ZSbx39xeGVd5DRnOxssI
         +BFA==
X-Forwarded-Encrypted: i=1; AKwUvBy1pucAP1eqMLcl7/7JVu2nrqkYHoIZvQTil2TbHTukGuHmEFgLiU2W0geEdtS37II3PzRfpECWnqk4/DQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYI6N8MKx13UIHBL0iAP1NDbRytRmOVQ12+VbBrMUm0vh0vIIZLf
	0QCxEUoWp8QBWhPTB+LJ9L1x7YMks9EqVj849ccgUP5BDxzCt/fgjUkL
X-Gm-Gg: AYBFou2/rTXHA9iUTnsndkon55JvAaJ9GFN0E3d/3BpiIsI/OqrshKyQB8Ot9O8qpqx
	G36vhuG5Ws1ndFExXwFssDw7CAsWYn3m8cKYTQd0K6TAEU5aoktCJKBjS1dltRrbqVkRoUqCQy6
	PtHEH8w6Qc7exE3tZwsYdHxn7BCTA/KkfgKSlCgF6ZjGclR/2AWEdFStHK5Y8lWNbUpmd9tzF7Y
	ZnKULO2kXbabsaSJpiW2t6yBLICGqxFbBw9cj36VrnFbuIzu1E6WSGY9NHpg++Owzs04H5fOhPg
	HWwd/5thHTw4ChYJjm57OxrxFcxs/ilH91lIB2XtYBNZ8gwVf9nzKp5WEG5dwkxn7waclRTYVfG
	7vA6oQT2rZsencLygYT1kbcnQlbstTtF+9fsx6gmtwLB8KcTCGcQzoSn6bKaoHGjMsiqJ85z5o+
	zTNzz6OazgjtNZpal+prWz1m+SzCvt7cMvjCFggr+fBV9Usy5Nxw4+v33jLgWOJhctGT6cdBZUX
	hwZRsiRPeYz0Q==
X-Received: by 2002:a05:6000:29d2:b0:48c:7386:af18 with SMTP id ffacd0b85a97d-48e079803d2mr1032038f8f.8.1792185332701;
        Fri, 16 Oct 2026 14:15:32 -0700 (PDT)
Received: from serhat-ubuntu.home ([212.253.205.12])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4e7ff1sm7864622f8f.25.2026.10.16.14.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 14:15:32 -0700 (PDT)
From: Serhat Kumral <serhatkumral1@gmail.com>
To: Bart Van Assche <bvanassche@acm.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>
Cc: linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Serhat Kumral <serhatkumral1@gmail.com>
Subject: [PATCH] RDMA/srp: Avoid reading uninitialized has_port on srp_parse_in() failure
Date: Sat, 17 Oct 2026 00:15:09 +0300
Message-ID: <20261016211509.12973-1-serhatkumral1@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

srp_parse_in() returns -ENOMEM without initializing *has_port if
kstrdup() fails. Only check has_port when srp_parse_in() succeeds.

Fixes: bcef5b721568 ("RDMA/srp: Accept again source addresses that do not have a port number")
Signed-off-by: Serhat Kumral <serhatkumral1@gmail.com>
---
found by smatch:
- drivers/infiniband/ulp/srp/ib_srp.c:3502 srp_parse_options() error: uninitialized symbol 'has_port'.

 drivers/infiniband/ulp/srp/ib_srp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/ulp/srp/ib_srp.c b/drivers/infiniband/ulp/srp/ib_srp.c
index 955f36efeebd..5811f02df980 100644
--- a/drivers/infiniband/ulp/srp/ib_srp.c
+++ b/drivers/infiniband/ulp/srp/ib_srp.c
@@ -3499,7 +3499,7 @@ static int srp_parse_options(struct net *net, const char *buf,
 			}
 			ret = srp_parse_in(net, &target->rdma_cm.dst.ss, p,
 					   &has_port);
-			if (!has_port)
+			if (ret == 0 && !has_port)
 				ret = -EINVAL;
 			if (ret < 0) {
 				pr_warn("bad dest parameter '%s'\n", p);
-- 
2.53.0


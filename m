Received: from mail-pj2-f7.google.com (mail-pj2-f7.google.com [74.125.227.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D29481FA5
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045019; cv=none; b=n4UGTwFeqGof1DORuiT/5iXvoG7sJ0gzWIi8krTZRr6DFigUSrKI2BXiPMbPHv5Fc263vHu3Q1GQF/l4RIse9wwYyaPp7JtcytucXnrih1Jj84isquSlBAgzJJH8xwFeyRf57hr4C4bJpFvu7VGvF4RTEkSsPKoz6m8oUpzHwxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045019; c=relaxed/simple;
	bh=oJDx02QBjgsUudphGfqnzaLMDriPreO77tPh8ouH7rQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r9TJKpCHYnZkbm4vPM5CQqINPDw9+hUESdjnhNgj6BHz9Q5mByC5f2nRmGhTeaobluSmA0XofrIKY0XB6/+z7VI+TZahpxjXK/t/GhiuVcABQRZfnFhwroxJW0T4tKiAgLI7G8IDS+ZyDnTGvGx/ofEukW296Lk1yyny+LCDCtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P8azFBTG; arc=none smtp.client-ip=74.125.227.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P8azFBTG"
Received: by mail-pj2-f7.google.com with SMTP id 98e67ed59e1d1-398da2bdcb9so2685842a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 05:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045018; x=1789649818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CKchm62sZ86IgrB2SwATbeij5NNcxRfyf4EvG63ewTA=;
        b=P8azFBTGaE+wpjInY2JQnJuaozk6oB67P9/Hv3RKgpw9kqxxj0G5vJESPByqB5rqN4
         +Z/wDFRHoDI/oN9DvD93x3wYLV8x8nn4hnDQ+Y1Gtw7UbvgBtVi//qLj9sbtfhW0mbyh
         P1WjNiNIuWOydg6acrDDUlcA3Yo1xuo+a1FD3iU9acOqDyv6F05VX5tshzTXp2pq20ti
         lqlWqaPc34KqmPUDgGJoSIhdT4GJjW7xyOJU4Z9n6osf2jcIfyhhPQTNVsFcPyKUgo8W
         NVFyWkOOgAJXMFLX0yxibXDS4EwV4dX1KmE7rynBtZb4u5eysWJoKbqcufQI9KBcIo/u
         pA+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045018; x=1789649818;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CKchm62sZ86IgrB2SwATbeij5NNcxRfyf4EvG63ewTA=;
        b=BbML31AfL+dFPrxS33NEOQCGtNNRHUbigITo+o3SOUTNEpdJ7udZ28Cds9JYBIOPXm
         fs5l7yteA15i5AlL+B9vtK27L1vXoyqg80NVlyFdQtKj1hflVD7PUzARZbZM2oFPlUwm
         w9drWd42GFAYPJOFkR9hP1vj2b0qH+XKe5wWZoqFrocuqceL73ysK5JKrUfjPWpsNNjL
         hCOihuceKY1aECEps4ko5eNBKG7K5MyW22rzQ7zdJU9hKovyyCRLv2P9LS1JJMc7W14S
         m8ItCfEuuCdlHBGV9aMQwOp17XOyz/1o429EHck67S2thjQ1sBrssIKY2KNIrjsKtBUn
         mLRA==
X-Forwarded-Encrypted: i=1; AKwUvBwG0g3aOYlO55etH4TvJq6GhX3E3vyZ3xp7mM71tUeWpVnF+XEyMUnSdCksLRa/rSFb/Ik4saTFRKTVCsI=@vger.kernel.org
X-Gm-Message-State: AFuF++kG7aEvKTem1OyVp1Kt5aCk0BJq8xqw41zOJdofPSVxFaoqFNYE
	HHSFkWgn5CQ54q/AAxt7jSq92XcHWt8P84lOEmsIRBnsPnMU/Ur7S49FW46K7laDOycFAQ==
X-Gm-Gg: AYBFou3sIMvkSCK7pd4fvXn9HGrMFDJB75xtc2h6P5Gxht3scH3SvXiMFkAutQ1174I
	x3ghdHa2p0l4Qoa9v9I+aLLX02o7HP1zIF0soJDuhHREXFZb/cky862k83ooOU05GU9pzHuFta/
	lyO5fmv0d3v969JK3VCav3NtRLyrII5ExFXg22QZ0c9fTny+QGJNsgAvowWF4s+VRM/86kD7cM0
	UCk2Kea+HYUi4SiKfSPJmE3ILVcQ0t6JomtBqWlNsold1aXOrGjHW7FiSKhHbl2rDWptLBJIETO
	THbpBMpRZzI0mqBk3pBuB/fKUJlN4rBp1E/XllNmFl0t7MJ0/GA3uEG0+qTj+5/je6dmt5z8mu2
	BuG1LQgdv/yNqGp1B1UgNWzZxOQ1xXQtzlw8aqfvdEeb7XpmDoJjkr/upg2+gsR+/1iiNYvrUVo
	HtdmsMxp1PI/yolWiLgw2v0PUKb0QpQ5CirELou08ETgSeFpd5H7eG5zGRUQ==
X-Received: by 2002:a17:90a:d44b:b0:398:d93a:b343 with SMTP id 98e67ed59e1d1-39d709e7326mr12383992a91.3.1789045017611;
        Thu, 10 Sep 2026 05:56:57 -0700 (PDT)
Received: from fedora ([69.5.53.41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e9014cbsm4800488a91.16.2026.09.10.05.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:56:57 -0700 (PDT)
From: Tianyi Chen <diannaaav@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joel Savitz <jsavitz@redhat.com>
Subject: [PATCH v3 RESEND 0/2] selftests/mm: Validate selections and scope memfd_secret setup
Date: Thu, 10 Sep 2026 20:56:43 +0800
Message-ID: <20260910125645.285866-1-diannaaav@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

run_vmtests.sh can reach test setup after invalid options or category
selections. Its memfd_secret preparation can also change ptrace_scope
when that category was not selected.

Patch 1 rejects invalid selections before setup. Patch 2 gates
memfd_secret preparation on category selection and executable presence.

The patches and commit messages are unchanged from v3. This resend uses
git send-email through Gmail's SMTP server to send the patches inline.
Before resending, I sent them to my SpaceMail mailbox and verified the
received contents and whitespace. Both patches passed git apply --check
and git am, and the resulting trees matched the original commits.

David, this is my first time setting up Gmail SMTP for patch submission.
I'm very sorry for the formatting problems I caused and for taking up
so much of your time. Thank you for your patience.

Changes in v3:
- Initialize VM_SELFTEST_ITEMS to "default" before getopts, as David
  suggested. Only -t changes the selection.
- Use Assisted-by: LLM in both patches.
- Carry David's Acked-by on patch 2, unchanged from v2.

Tianyi Chen (2):
  selftests/mm: Reject invalid test selections before running tests
  selftests/mm: Only prepare ptrace_scope when memfd_secret is selected

 tools/testing/selftests/mm/run_vmtests.sh | 28 +++++++++++++++++++----
 1 file changed, 23 insertions(+), 5 deletions(-)

-- 
2.55.0


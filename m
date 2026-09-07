Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452DC3769E6
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 04:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788755985; cv=none; b=iq4md0YiB9vKu8s7QCoryFDoyDnsl3KXA3PlfOev3SqGl9om4fS7YYsi2Vyik+AEhR/3XVFygA54T9TNvSmSKiW9jJL/BosNBzQ9PIir9REV0KHXDDe09AtpiOI4m6XHbUqx+iXE1D60b4bu8zuqFwW90FyOMoDIHYiQcEm0Re8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788755985; c=relaxed/simple;
	bh=ZOTfKCoBvZ8X2fVSiTYkgdUHIl/7Lb1bKVTydTmegio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mj9Q7FPsdqJUat9Np99Qz6Dvq6ObJmTlljENF9jmrD+Wm2pQ+Dw4omvuOrHVfQGBnl051GwiUHgm4U0lddMgjfKh7tRGPPrGxACCXPmMDiizh2vQjtJRRo9hUGDaTDDWPV6mPCLYK0INt5iVjyvhHCA5icfYVOXZ0qtbSTKnuyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jB9+06aM; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jB9+06aM"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so3585644a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 21:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788755984; x=1789360784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OkhbZBCj7/qm8qxVuCQ8rZEnICP00ztj13alA8D5Jug=;
        b=jB9+06aMGeghjbaf8KZqg2nk8p91iRXw5yKOOod25YJlrIkXVwoHW8Y7Rvr9tO2Gpp
         5O5bKLo3iNRW3hSLLT+crSvh2/ePc+DF3UC4jNxzqoH1BohbY0TZKny52T3tuv0z3cWO
         Leksncjkab1ThGNVc71B6rT4pg/rHVzMtyvo++kgTWWOdgwNHH7JD5zdeanqPBkFdh/t
         8DWg6Qql0tWjnn3BBtRRCKMeZ+M1ZzylVas0vozI4SvT8Egq4tvM0K7sjH1V68mR9Qmm
         iub4r2ry7g3POHdhh48b01t3sLHx2go+iGs0i4srYwzy7C6ixs44hFw9eCqb0wqbVZmj
         oLhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788755984; x=1789360784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OkhbZBCj7/qm8qxVuCQ8rZEnICP00ztj13alA8D5Jug=;
        b=cznLn7d34Pa0uR3OtMmGMHYmelp0ewIH/Q5jnyb8/b7NyRq/RqFMObv6rgUeSEMRRw
         XgpwIg1Y3J/vVI4EMCIAJwmFa4piPuIOM/c3Jim07oR5p4xiBRM/5Z3+HczXivf477uR
         3ET1Pk+Pwd8BLHbQABI1OENSyHnaJz7Uc+PkQj/kcG/z/h6rRVUXQ4gSnJi9y09CsQb3
         tEvalhaiZ13yvmgnWgrSYoMQ2zpQ7r6tms+MqmxJnbnNuDiVDNh8LkplHDpw4I7FeyUB
         5ik/qaWE+M/RDRj+87AHRz1yx/myAcEVOwhF717ViPtEPTQtB3otGcqh7GqETCgzDN69
         F6EA==
X-Gm-Message-State: AFuF++lGsMzASGqRYOtnvbya/VxDGgtVJGWLAdG4flfMGOWfNG9L+jSQ
	wfqsStqzOtG8hU5+R2Sx694CtArJn8euVzxhAIDW/CoLHDoH6RSvfNc1sJLy9qFa
X-Gm-Gg: AYBFou0nxYoyEud4xtBYP2CRJHiFJR2f0vyqauwLKzRuGweGB/+QGQD92tl1/FWSvH9
	ebJNvXU3E3nPz8Vk5DjREowiCo+vE3cTsxbwrkNXfX7VTeqpeoyydqXF7dugiJ2PQ77hsNtV+Mv
	KNci3jFWwumq12mWmY8XmWdLH7Gkfo5u51XcxfW6pBKdibSkslAVfg9xG8JavzC4jQ3V36geXFi
	tG8MlmiEp3zUvoaPq6rcTE50A0/utPvOsDpthQ/Iar2nqDQRAJMWjYOSThGZ8XdWmg6wAcQJ73D
	cG2hnVPaWsjEezDA63clOSvjdJdbmFDmTD8H8f2V2QnTaaFRngoizSmJzGZT/LWUYbmAWKaGw5V
	wpaScYc+efM8MShjMo3HiWqizXyYDv+XftRAGucQ8g+LIXAOtW6f31fdYIwiRhoxqpq0at6BUeP
	LrqenX7KexK18qG+yxlJJyFt9J+iO/zF05t0SKem0ZC+Z97jw/FwytcSZeHn68K9t8vpTt2JSB1
	wRmlOb1opO8cw==
X-Received: by 2002:a17:90b:50cc:b0:398:9be8:ea65 with SMTP id 98e67ed59e1d1-39b261d9da7mr35674011a91.18.1788755983574;
        Sun, 06 Sep 2026 21:39:43 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b123731sm22649867eec.18.2026.09.06.21.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:39:43 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: linux-kernel@vger.kernel.org,
	oe-linux-nfc@lists.linux.dev
Subject: Re: [PATCH] nfc: fix typo "occured" in comments
Date: Mon,  7 Sep 2026 10:09:32 +0530
Message-ID: <20260907043933.33452-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <dc3ba062-a548-4a9b-984e-a8f2473606dd@ixit.cz>
References: <dc3ba062-a548-4a9b-984e-a8f2473606dd@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

You are right, and codespell is in fact where these came from - I ran it
across the tree and fed the results through checkpatch.  The model was used
for the packaging around that, not for finding the words, which in
hindsight was not a good use of it.

Thanks for the extra hits.  If you would like them fixed I can fold

  drivers/nfc/fdp/fdp.c        nd  ==> and
  drivers/nfc/fdp/i2c.c:270    inclue ==> include

into a v2 of this patch, though "nd" there is part of "2nd" in at least
some of those lines and needs reading before it is changed - which is the
mistake I have already made elsewhere in this series.  Let me know if you
want the v2.

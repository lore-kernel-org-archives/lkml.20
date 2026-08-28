Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4D63AAF7D
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787894666; cv=pass; b=nk+M632RgK3kah7gQ2DDFxlp43lXkOvFQc0UdkwZcZaq0PbX+yivsV33BYnuH7/coeouUWOie0lSG74dQaWn6xonnIK2aEtg9yVVGfk4aBM8oheYZFlO/c/STWpzEBrIcZdShjIZB8phyoojhlmPLXHhv6Gk9bMgc2idomRW3ZI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787894666; c=relaxed/simple;
	bh=/N0uzy0FZsu1Y9xZms37ZL6HAxKN9Lom5nL6Q7KlBHE=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=G7FDJKLZmJozR2S/ZEL5i7wBxBe08hy6csFanKbF5pfh23X9kPWGx9/JGIWkmh0mk7YC27bHfPXw3wdUaFY3RfEFp2jla/eJ5V8uxkCYSWy3HSK4h3nzCzra1KPHBXanEIV4obTvdUJ/Ji18fQy8/jbEQQ7foI8B8xhPqGJLL94=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=FZ3ivsFZ; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="FZ3ivsFZ"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d712281f8bso7296675ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:24:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787894665; cv=none;
        d=google.com; s=arc-20260327;
        b=IRX/kSLXampLHXf4jf4ZjjcFIolAv1kQGHIXztaO3BHha91G5YgNv0Ng9uEBBEIFo1
         zezaUOLgdcZuxPO6dCo+ORwN6hn+2vI618kMXnKKgdquu8cmHQ9yhsKq+i/tdz/8qNuH
         GcaCzAx9WyReSTehtfXmIM73MUybyTZ6uJMNbCtEQ85gFoO8tMvC3GaY6l3jwZ7NJFI4
         mzQFeQL0Mm0AB3nVGatoFxjA1JjbmhQUZdZOT8CwKBWoR3mTG5sBdmr+ejAzSaUaxiSW
         dnFDH6wrtmW+DDTip73h5OCVI3/PqMNYiNI6zYBk1HbOjqBgeTsclkk9Ql4QGSfjvBj8
         HiMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=t6ge+4rjKAN+FuryIFM1Y13Gml851HvRLQf+orDcsDw=;
        fh=uZ8e2b9RSN89lq9VAOlRVPMNleYG5KHPRe2Jdns9s7g=;
        b=KqiV8GzZnXL0dhJx6pABkSTGB7vx+OGNsQJMRwhD5Hhubv4iuhEDiSr3G9NG1Auvuo
         euxoafgGu0w75FzesKdxMT+OrshltVH/v3IdWZK98bD8WiFPkRvkTqe8xp+8PEJjbhUn
         zFzf8fjNRJUxw63goOwVS4A1wGwEsgK3YxAlpgGZXfBfcHN6Hm4L6tGTM8BARSHPNoug
         Sq/maN3WD36uarPZnEC3qUBWiH/2CE8yMZgVnFEcSJOSC+VWDZi5ZrsuT/uP+N9EimQW
         OXO2yl6guN2KstqMchW57dNNQNzzPNoM9yBP3loj3YOB0PURjnsdrNL/v1EVM2CZZMwU
         zYWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787894665; x=1788499465; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t6ge+4rjKAN+FuryIFM1Y13Gml851HvRLQf+orDcsDw=;
        b=FZ3ivsFZSQkFppW/tcIcY6mySiGOj6f6JCXV/W0S7LEkTpa20z0xD3GImzokpZHCS+
         qzKCUV1Ub3y0GiMfkaZzOGViV3QFsbaLG92y9YdxY9X5hXvs4OvooS5t8UwlwAVO3zJ2
         AweT3f618UBQFz1jY5qzD9IQUWsVKZ0xkhxu7IOMAnj4tc09JkkPaTbbD1N0VDX2SwVv
         Yv9G/R/c1efD9o34mrSg0ceGPyMxp05hLC1L02m2qHtYjjKxGMP8r5wpqHeJYUFRQgg0
         R1AcDA+tZci1fVnt1o4W52vy2CclUlBi131PViolW55No4fXG0UN54YBa+lFw3Rb6aw9
         /PbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787894665; x=1788499465;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=t6ge+4rjKAN+FuryIFM1Y13Gml851HvRLQf+orDcsDw=;
        b=gVOe3U2nUYfJC1UAKRj4Etgc4+UBtKQw/Pqytk2dkOmKEHcVC5w26KJ6OexthO0/rv
         2Id3RsH/V+QCwKaIoUSyKfXWarPvvkg/rgoXycbTU6NKvf6vlqjk3KUcgGG2ncpWaFIj
         dINpQWpznfOVG79wfpLVwZAEXNymMEEPMyUfhIOrl+esAbEydRcj6uEGos5TCH0uv1L0
         BLCeDDeMwySkWEy4FRAD5ZcMBnaEQ7FkZmbPddMjmKxV0Gs5jhtlt+9FafPraTYkvR0d
         xsD7LCnCfkYgr+vBZGdH7NhaaCaKLZVpJBiEXkj2IdHLdloJfBt8p1Sq7Y4ihGcZ8QO2
         Fy0g==
X-Forwarded-Encrypted: i=1; AHgh+RpXZBTCjOYIx2tIN3PuhQHw2hdrTDJe6sbePTdi4HUmziSoQRozeGQbUlMaiNIiZOeUXBwaEzUiQ9LmlR8=@vger.kernel.org
X-Gm-Message-State: AFuF++nVsWrF3MbhGeG2bvwGsy+RGlFc6HdYSt3R4Aoe+UWLUjttaIu/
	dON9RxVGODm/DW7gOShzdPljwcFxYA9L3lnsFVUSJv/QmA867SH7NVUzVYZGfam/XRNm+mFRw8V
	5aSpolbzewRB0wDKkXjtClpdEjy/rUfg8qGhzjkLx
X-Gm-Gg: AR+sD13Yrzv/8niIK+0xIR8uSgM/lVZjlzHo6yiy2yhJslwnARMvksWEcG0yoPTQWkA
	0F9YTvzUlxdh1uY3M9rmlwlBBlJfenu/lfZFJTKnQS4/nsGsoQkqvEnrERZJ893pznnmq71qjgv
	mn5BuXeA+65HVZ5SLga4AkLz2l0YLzxKYQ4GN7kIsNSKudXe52alaMCi50YScLgLaNSoHKqQTVy
	Ce6STNoEtQ2NW5+HXzPjq+3p+gmVLwiktF8r5n6dLiAui43m8p2tvk04G5tlSwj0Qrq7WSt1be4
	UGXX4yQzi9HCq05UZmMvxDwK2VPTtZmMFrKuDktj/gcKZtlJ5hNT98o6Mmnj7+gOMEf9CeI8rZK
	t5CjMiVNb0hiX2+ArVEdSOq/IhNFnE+5ZWA==
X-Received: by 2002:a17:90b:2d04:b0:390:8361:a532 with SMTP id
 98e67ed59e1d1-396d0ebfb40mr10058385a91.7.1787894664037; Thu, 27 Aug 2026
 22:24:24 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:24:23 -0700
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:24:23 -0700
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 22:24:23 -0700
X-Gm-Features: AcwNN1VFL8_MdPn4zI5OdJpCi_zXdIWFKWP7ESJ1rGGyvAhUld26kpCEScc4fJQ
Message-ID: <CA+0ovCgWLB4bJ3KwbdJbtEuP2u8cB8TDAvobtxs=6x9YYfgWQw@mail.gmail.com>
Subject: [BUG] description_show (MOST core) -- NULL-ptr-deref: the sysfs
 attribute derefs dev_get_drvdata() without a NULL check
To: Parthiban Veerasooran <parthiban.veerasooran@microchip.com>, 
	Christian Gromm <christian.gromm@microchip.com>
Cc: falemi@asu.edu, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

As part of the kernel research at ASU's SEFCOM
lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/136-most-description_show-null-drvdata/

  Oops: general protection fault, probably for non-canonical address
0xdffffc0000000004: 0000 [#1] SMP KASAN NOPTI
  KASAN: null-ptr-deref in range [0x0000000000000020-0x0000000000000027]
  RIP: 0010:description_show+0x46/0x80
  Call Trace:
   description_show+0x46/0x80
   dev_attr_show+0x58/0xc0
   sysfs_kf_seq_show+0x331/0x490
   seq_read_iter+0x4ef/0xe10
   vfs_read+0x582/0xa70
   ksys_read+0x150/0x270
  Kernel panic - not syncing: Fatal exception

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,

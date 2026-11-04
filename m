Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793768246;
	b=ffZo5fNIdJLyXoRdgSfbq/e6BDANgOkTbm4O5v9mDrjAF5SEcO55DYyAsFz/FSdyekbh
	 h8C7ae93WPEDtkw+FAEXJ5k/F2XiBcId9B+2CrXjssuJWvh2WiOkZgSoj4IIh2Fn5GBxA
	 BFLC105yMFZB2Rttn2nRWQaFk/wBTEfFyCspfx30ydx1Cry+PV0r7g8eoONE16fF620tl
	 jJcOHka/Tcl3TLnyyxgZ2Az2a1c1GfMIJ5v0Acv6IaKuUnyJXtEDhX9HbghGjBOxH2/JV
	 hiZGvkY353X88wu+crd94F26l9sA5W1kizIvKkUJF0g3JvGvKE98F0LO1vNsLfrFhig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793768246;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=oSQWRaHuT9P3jPPbUAbS1V5b/cTlk91uVXvr0QmSpEM=;
	b=nuf9j2SwjipwBTCzM9Mk7fL5Z5e0gJqn7vgwYRWekjnB6cs4vTwel4hAyOauFUleAm5g
	 5q+YACxMawSU04djv+/kjjz19DRXctPEPKCGyFPO3sF14whbfE8lG1c4IfXdehWOzP0fx
	 hJMX3FsS3dqzG75Kmrqh/JgHOkrAEiQccP5+T4IAb9ZWhK7oEV3m1oyEEFiJqipjPxaww
	 NwdfJNrhggQZ9fLZltqFCzn2VPVi+9RfrPLIPavnXRRt/qBFAn2xjIr8NXedO0XnMwQaE
	 wMxYZTdeCxatXwNTcutzoNoVC+6MsV847xbV2lDIDJ6T6sJweVw+sonI8aWaBm4lyhw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mf7yzasZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43288606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 04:57:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43288606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mf7yzasZ
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8a06b436dffso124143b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 20:57:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793768245; cv=none;
        d=google.com; s=arc-20260327;
        b=DlhtJXe2veX2EY+q0y39eYX57h4cClzzdF9m24JJepHQGPAYxYSnFO1oCVFmRhVtjH
         5BGdBLDUa/nnqPwOUWUqiejVJ/iE7WdhIFxAXDBHje6+L4n0E/NiZSN+FX7DnlqB0ajK
         tLcIRPx4u7FF6wxGuWehU7A7XBXwGEqrSe01MuehC2DCpe+8Q15cOE9IxqqeGmc42Wel
         Qb8c39LEETSL4JqI1sfRbPqJIvNV4Z6DWp5lMO3SUCOQW2H9BAgAhZDbTq3dRB13ETUZ
         Ul1VPC8EfTNSz+MPC5VpajrKH0Qs5Q0eufPQLi3+nOM+H76LfTSp9STtGJa8YOdb8Rkv
         +fxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=oSQWRaHuT9P3jPPbUAbS1V5b/cTlk91uVXvr0QmSpEM=;
        fh=6RudjI8w5axzdvETjgmsnfL7tu3QnSf0NMD5McCWdJo=;
        b=BBw//ixOCK7jy1suJlnmAGvbcaNQJz4JN26RVnC3KglTdQ/6vMznYeDyNI/gfkoYWO
         5U1PUYVdws69Jf/IOxvQtdR6mQ3ZCs18f6wtnvjBVAtMiarrMXwKRurVlvdgjYskEud5
         FqganSamYQl7aNEVgPkSIDDLHVFtleZ4a0DtfOvZqIGyFTRy6ivRVyrHe+6JHWhiriLQ
         sYbAvaYSA9oCfJTEbUkD1AqTzCtW1PejLWhGrmM01+aupXcVbfDn6TEjorFINotOjp8H
         s52pQquUko1okQbqZBGBPbVnovbqFSUEmPyb3vrUBQqzTJb5XZz36ocdIhXEL7Bib316
         S77A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793768245; x=1794373045; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oSQWRaHuT9P3jPPbUAbS1V5b/cTlk91uVXvr0QmSpEM=;
        b=mf7yzasZQZ0QcK2Pz7Q4re3BDFWEdVUySDWbvmDqRUuJ8F9t+drd+JXZc8S6QBl3vS
         RfTnoJ023pYWHTR+f7j5HUbh3lpEgDVQr/2zkP0S6H0LCMjhjZsPY5OjTuJExCF0cJ6q
         Nb5e8EUSp8erOOsEoNt7HuSxXYFuKgobpFLVYHR1r5PEm9MQUgdoku0WK1oNPNOXTQ3X
         5ao8woIZhNyZ5QmmNG1BJmBBaQ2akRuaWVx7nvSBNoEdeph17qZqTMC/sEzz/yGanWKs
         Nrp9g9YoXNNYIOC07ZnZL//tiyDFcSyF4vGXTT3bHXsE8rm7JmxXg1heWt/dOvx0YYaD
         RYFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793768245; x=1794373045;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oSQWRaHuT9P3jPPbUAbS1V5b/cTlk91uVXvr0QmSpEM=;
        b=xAwlMdrrEeTBY2gOAZvCVlRjs0u8QNmPkaQZo73oqjAuJYLhsyw8xUc14soaqFwQg4
         qfgJZJxGoOzJcB7Fj2x8qODNNqwe4VbCU4V/0M45QW2U+XXw5gd0u6OQQKeHGf/jXZ5k
         ZfSPhcI4Xm0zG3qtUKxkxH/rSda0pJK8ol8LeXUVOptJAEBS0KAcywkUt1qfC87HKPW3
         V29S7+o43gU+mQNIZYyPHq4oAti9YtleBFL0ijsfIIvL8KZgckClVzJ/j8lVnMgx+WxP
         7hdK2A8kK62wWsjX/oFrvS1Z+qcTjZpbog6VI5nnwsMfqmhPHwI5XVMd7VLrGvoK+0f5
         TmRg==
X-Forwarded-Encrypted: i=1; AKwUvByfxo9+DuW6lBgGDf2totHefQgLUTfFAwiIimUmamRFVNL8V/2Jt+kVz4FsfvwA7q5eMN5tdexU7JX5tNU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8D/BZ4CSBLG1qSWVPYz7D20kYhQPr+yGE/qNVoLpJqF1Hj5aqe
	Gx9yCVZUAr5NbDVrRuEZ6LI/x8kHX47CD+JbUkLL+qKQEsiyQxzppW7GAoKZwMKMaPZwud0mQeZ
	CrqvT6aBYvamh9zyoir7wryLsecTfQJs=
X-Gm-Gg: AYBFou16iNChu3oo9XIu9erumsPP3J7yqDliIS/aEnggiaZ04KAZVkgUP2xBvyHnlAh
	MR9KUj29BOZGlAe3SyBFd+jKMyWyVlTwvJl+a9FLBLpURf9FKG1qAjv18xCvmYG7XlOmThno1+6
	mAs7plx6QZ+lsh6GoS+VaRQrrZF0lviG4jdCSAlgss7sxeX7YOwAIeiyZ/iYmWYz7LHl878A36T
	wV+6CIxqs4BJX76vW9kIiKFeqSwhg18/+pamzLOnbOaXWkFLxCFgvnAC2JDlLfnnN5Om5MIF2vK
	rzUGqyt6I6uGZ4HoScfVkJFLxzG+4XzfVFvl68+BtRz7TxetRAg2yKhcLSPCrluhr9m6PLu9083
	XbMaEgMYS1ssGrp4kadY2FOmNCvX4O3H5wEUuBX9m4kx2176+x4Wrik+u1XLJA95ctkKb
X-Received: by 2002:a05:6a00:a909:b0:878:3538:8f7e with SMTP id
 d2e1a72fcca58-8a9bffd147emr12603280b3a.44.1793768245422; Tue, 03 Nov 2026
 20:57:25 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: zhang san <shunsheng1218@gmail.com>
Date: Wed, 4 Nov 2026 12:57:12 +0800
X-Gm-Features: AclHuK_9sX6apGpL7I3jhbMpE7I-fnGbe34tz6B2DEkf1dEoT8V9eyumRzrqBaU
Message-ID: <CAGTEBTY2EhOHwmWhB0_YdnP-nMyGzzhnwH+ta9yeynHD-Y0JyQ@mail.gmail.com>
Subject: [RFC] spi: handling a stuck queue worker during controller unregister
To: broonie@kernel.org
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

We would appreciate guidance on the cleanup policy when the SPI queue
worker does not stop during controller unregister.

If spi_stop_queue() times out, spi_destroy_queue() may return without
destroying the worker. Our reading of the subsequent
spi_unregister_controller() cleanup path suggests that the controller
and child spi_device objects can be released while a stuck
__spi_pump_messages() operation still accesses them.

Using a synthetic SPI controller whose transfer_one() stalls beyond
the queue-stop timeout, we reproduced 80 KASAN use-after-free reports
on Linux v7.4-rc1 (6628e7d4c6b2). We explored three approaches:

A. Keep an additional reference to the controller while allowing
normal cleanup. This left 16 KASAN reports, involving released child
spi_device state.
B. Preserve the controller and child-device tree on queue teardown
failure. This removed the observed KASAN reports but leaves
substantial resources registered and allocated.
C. Preserve the child devices while continuing some controller-level
unregister operations. This is a design option that has not been
implemented or tested.

We do not propose approach B as a ready-to-merge fix: keeping the
entire registered tree can have unacceptable resource and visibility
consequences. Nor do we have evidence yet that approach C is correct.

Would it be preferable to ensure per-message ownership of the
controller and child device until the pump has definitely terminated,
or is there a safer failure policy already used elsewhere in the SPI
core?

We can provide the prototype diffs, KASAN traces, and test setup
privately. The experiments used a synthetic controller, so hardware
equivalence remains to be established.

If a patch is proposed, please CC me so I can run our KASAN reproducer
against that exact revision and offer a Tested-by tag after a
successful test. If the reported lifetime issue or a concrete design
suggestion informs a later fix, please feel free to reference this
thread in the commit message for attribution and review history.

This analysis originated from an AI-assisted audit and was reviewed
and tested by us.

Best regards
Yaohan Li

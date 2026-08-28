Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC59517B425
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787896354; cv=pass; b=OEYPWIfNs15g6S6FGP7lU8siiQiBZ4CF4o4KC1nrAMM0cT1cGTBzyTN3diGFZXe0QpXbx/OlqChll76erHj/e6doRQtD5rwhiixPA6NgWA56gzk02eXa2K06MvnGCZNb6g9X7Ur9zXWKKq7RgFD0U77Q7p22YEdC123odiAIHPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787896354; c=relaxed/simple;
	bh=usahOBnxvXC2AQ8/d4BKxTHAJUwY1FvkqTENx+qHQZY=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=HcX/6LXSuD/tBBX/RJOuap/k4sOg/wV16yG3t+Y9ie8kwP+4QkW3UW48l3sKxKWvtFRk4MSJprOSvvsUPDX1i8OT4j3K4wJLqj412Bb27UitbmogPe/JkuWvqjZIAuBWyDkABPIPcHZkUsO6/1dB2zZQjLkA24zmGEVvjRsMeAE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=KN3eZu8Z; arc=pass smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="KN3eZu8Z"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3964e76d0f4so536547a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:52:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787896352; cv=none;
        d=google.com; s=arc-20260327;
        b=JbPBbT2S+dCex67nIEkbYGddzFTVvHqT5aCdnV6tX0oD5qxXEZC20iESxhA8ZtwGvJ
         bW66JTaez1Wx/sgiEKf0yzfqM5kqpuD69kaav699tcsqXt58IRs6Q2LueCjeDoJBZ75A
         T6h/uoKfJvrRprm/DvgD43NfOK9/wf1IHhwGkUJHeBdaWHeyZ1XV6kc51J7+vemYgjFZ
         LwoRa5MGOoV8F321T4HZWeq8OXylUszQjL5z92v+Xfr0JJ+TCRD76xYP2wm24okyDPoS
         WmMrRfznTfviFqSeSCyqKzDdSj1stYXt3Y+DIFPknxzLGMSfd5mcIcD5aR9Kfnu4mvNS
         6cbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=jwFH7WepPcBgyi2vprtCONHJ2oI40q37ZuojfGEDWc8=;
        fh=E2SnoMYgZnb4HWpb82eWSkuYCDntyX1fHScRgQcEu/U=;
        b=sDnfWfEnEn1Kpi4bPR3n4xKdh/OhSRi4Nndacq783JmcmBEzsc1twIEfeky5B58AjS
         vTLrwOHTHii4JpggAxy7ZZSUwU/ogvoZuOnNUtuCMUPFiJ7gSy1G19vMBRIMhAwbTphp
         4hPHLHgs9qvHcURPXuOxm1plszKLSXFi03QC95Gb2mkhaEa0n4lplc1oeV7CGGO7KPBt
         BybQRJKZZgbAEAydp7vy+5Z2W19Jnl+B4dscooJzMJRQywHj1Fc/NNf2ynu758+P85xj
         CmxgiE73YfzwHnxDyfPTLyZUdh/rudNFsmAT7X63x/dQlH6BzLF7flBNRQwQkxTSWq7W
         S/LA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1787896352; x=1788501152; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jwFH7WepPcBgyi2vprtCONHJ2oI40q37ZuojfGEDWc8=;
        b=KN3eZu8ZNXhWloBFiHcPXn6ezeDEgMD9urDEslYjRAU5246rqzNMIchhWB5Feht2XB
         Q8NsukRRYGh+WaZwdO6RuP7OnzyejAZ++KQY2TaPlqXdHX2GWs0eDd61B78ceQedGsKV
         JQj7DptanX1TirHQrXlIPs0FPitZrot3h51EgQFKniCSV1jw9XGWOgrqDNXQmklAZFvz
         DW8wuN4OOYoF8mv2A4cnaTOLozBFam7ATLfUDsJSdQyg+aG4b5NvZgGTqrMALigCD7ne
         v36TN8EtlqsSgvUpNG+lWRbOy71SvNAgW1SeYaq40Ykkgs7tKZYySZoAVoNkaze1Ea6E
         6Qtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787896352; x=1788501152;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jwFH7WepPcBgyi2vprtCONHJ2oI40q37ZuojfGEDWc8=;
        b=K6OVyX6m4YorbZYb4Lmwh+Il5qysdseXgQ6Tz/brlX6zJAl0nXJRAQ32tMPMW9jkWq
         ZSjBvhgLQJ0GW5tPJD/q1eYmB4DoWgO172h1C6qNzkcvonG3fgIK1OThAaetmoWGx1R5
         9k+vH56cyxBVdZYXZKb5pumWENE2qdMEXMMxKOYkAY5MQ9bth3nIkZOt1TDYuJh6cVhr
         v0mNj17dtkck/RCshvK+0IbK0t9ZI3MUb8v7L8+R0r6JfdH7eQzJBhXwbarRyH4jOVCK
         A+POd5kIfWX6TI/730v/oJHyP/WWRWUrUJxk4PjRqkMNe8U0OvyoeccDvFG3LRQ+7RGW
         x8nQ==
X-Forwarded-Encrypted: i=1; AHgh+RrtTM0wtmKogbjOmZLR6NZvlGzGI8amohhKjuQoohIH7YCZ5xBli0h77nT/d9xkvrY9bz45jeliofwJykU=@vger.kernel.org
X-Gm-Message-State: AFuF++mOo3xR4Z9yH0QiEwl8SyNE4BSaa4VDEwVNv0QoznVfhfcxuFqI
	nwn7G1iuixKrVt6w/dmjeRTag4+ikIDAnptFUw6jV1XmDu8Vf0qtigCdNWlRJXuqcYsHjBf4Hon
	qaoMQmInXWdTCF0oO7ICDrjITn4mAvaV9YrQvTQ8PW4W8pNCYzPwlMg==
X-Gm-Gg: AR+sD107q1zOR4EeFNVj4npRb8fK6Gr6k0VMmsBePBELh3WPxPMSVWVO5LjnlzMenW5
	StojM8U2H4n3VVxyKwWniQl68N/mztpqzThjEVwG1ysvOEfNnemvZ18VO22HmyLoyEOZ4HxIl0D
	kij7L+0C1Vv7wlSJciltuXfkrQO9AZiMCuh7OXajRZt1k/Ai4UIzkbcFA+zkxPHUNwqXCtvkilW
	OCA44do9jT74J5NqykwnqIdEXteSDLFhsm/muJZp0jrW4q5SIY2DKbFxu+vdgzR7J4kT1T8MMh4
	cKdOWm74C+9etRJfWi9KkhmT+YirHGO3Y1WaWsUr46APobBRE4zKCOxH5us2fvuY11Rh2CYfSyV
	+iM+eG+rd2Ob5sJnk8RQZdlgfP9xMGdDd
X-Received: by 2002:a17:90b:2552:b0:38e:9045:babe with SMTP id
 98e67ed59e1d1-396d0f02a58mr9085786a91.7.1787896351210; Thu, 27 Aug 2026
 22:52:31 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:52:30 -0700
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 22:52:30 -0700
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 27 Aug 2026 22:52:30 -0700
X-Gm-Features: AcwNN1XVKD5-gBLP7U231hld4bet4lDjxXLHpGMVQ_reZr84s2L6KyyKDEvtY4Q
Message-ID: <CA+0ovCihE2_pxLimjmmR8NMz4g-ie8dvvq1jmAj-Om33y3Vzfg@mail.gmail.com>
Subject: [BUG] WARNING in ib_drain_rq
To: Jason Gunthorpe <jgg@nvidia.com>, Leon Romanovsky <leonro@nvidia.com>, Jack Wang <jinpu.wang@ionos.com>, 
	"Md . Haris Iqbal" <haris.iqbal@ionos.com>
Cc: falemi@asu.edu, linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

As part of the kernel research at ASU's SEFCOM
lab, we hit the crash below. Crash reports can be found here:

  https://github.com/farhad-alemi/public_bug_reports/tree/main/198-warning-in-ib-drain-rq/

  failed to drain recv queue: -12
  WARNING: drivers/infiniband/core/verbs.c:2948 at __ib_drain_rq
drivers/infiniband/core/verbs.c:2948 [inline], CPU#1: kworker/1:3/5056
  WARNING: drivers/infiniband/core/verbs.c:2948 at
ib_drain_rq+0x30c/0x590 drivers/infiniband/core/verbs.c:3078, CPU#1:
kworker/1:3/5056
  RIP: 0010:ib_drain_rq+0x30f/0x590 drivers/infiniband/core/verbs.c:3078
  Call Trace:
   ib_drain_rq+0x30f/0x590 drivers/infiniband/core/verbs.c:3078
   ib_drain_qp+0x1bb/0x430 drivers/infiniband/core/verbs.c:3102
   stop_cm drivers/infiniband/ulp/rtrs/rtrs-clt.c:1763 [inline]
   rtrs_clt_stop_and_destroy_conns+0x216/0x1650
drivers/infiniband/ulp/rtrs/rtrs-clt.c:2210
   rtrs_clt_err_recovery_work+0x67/0xc0
drivers/infiniband/ulp/rtrs/rtrs-clt.c:1524
   process_scheduled_works+0x881/0x1170 kernel/workqueue.c:3397
   worker_thread+0x988/0xde0 kernel/workqueue.c:3478
   kthread+0x333/0x420 kernel/kthread.c:436
  Kernel panic - not syncing: kernel: panic_on_warn set ...

Our reproducer.c is available upon request.

Happy to test a patch if that would help.

Regards,

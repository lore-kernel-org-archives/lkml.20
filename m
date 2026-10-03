Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EEA3750DB
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 17:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791047721; cv=none; b=mX8uVka/RPtn00u/8vrYQJQaANuegJJzhTZLbw2phJz4yzwLLQb4vzaJB41Sup6OAOw4Y+nKEf46JwGH3LGGsJJMDtZpVI7UhLPXIvqlC6AjvdZKEBHxlNZ7rfajE0XLkfK9J+35DyTLzpa64CqjBSEej9fhLJa0c3/qBx1BSEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791047721; c=relaxed/simple;
	bh=AXUMRRZoPMPFxEpSNvNWVsESjh1oYmMGz3UfImx+sQU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sr2NtPojpP1UZDDDV/RcdH0QFQdDWr1ljpt9r5riXMeAtgYgluWa6dCU/BGDSSMnGyiYR/ePdNyoltNvEMmTwMFY88ef3jfwZHdJEjKm99j1wTRp5xS+o84SbMAlKt1z9Ph75LloZfO7Z+I+JPj2I0oxUV55l/FLwjmLoAXgEYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pWFRMzj3; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pWFRMzj3"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso217635a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 10:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791047720; x=1791652520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uKKIWNoUfZgNMr9RhsbAI6Qq26Nyd/284yBj3K33Njw=;
        b=pWFRMzj3DWEAhma5JXm6sQzQQ55z2JF/fAqT0Bh8deSMembyo08yQGZq3pGIyKLP4D
         TyWK+yGPTTKEuziYPxiV0GkZuB9stn5JX5dOJmqmDZChoUi8RL6bw8NPZwaN9lwwtiCA
         04NnuoHKe4PcG6AaruHzCIm10/1pArUZXEr3zynZI+kfBtnhYVL+d9nwyACyWgpZNK33
         bQLmCuhxaQa5UNyttrrCdrtCKRPr/+790TYOxZtqQHE9oI5wgViLOKePMuytK0Yh7T8a
         ShnE3VOg0Yfsmty728vnPkI6EUlxhPf/GK4kvPYNsd2UUbAe4WaV/OdEc0XWu5bzsGJh
         rM9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791047720; x=1791652520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uKKIWNoUfZgNMr9RhsbAI6Qq26Nyd/284yBj3K33Njw=;
        b=BN1xd5gbRhAtQFlFRS/W+heRvK5yk7MNRh3N7TJxof6z42exMjPG5PoaRU50nxJYN9
         M0wqmUBAy3vzlCXe18Lra/mg5J/bhZbYTgZKhnDyAOh7dmm9CwmWnTLFhGhULebeXz50
         lCOFS0/F78iruNqN87douxb2nwmqdQVeA0fFQbjSu3+C/bKxGf1ixQay0SYnCcTr8aeT
         1rj3eK5nulB4fQ5CdocYKE5z/H+cBwTkA1OTKVV1gGnOgxP83RHVS8k0DFVYhJEHsuGC
         GXxOKd/AqHBqT790pSsqyyHgaBUqUw8b9Lmi6nDEXFr7lQ0KPyjqoiaEdaJJB0BBruJN
         5B1g==
X-Forwarded-Encrypted: i=1; AKwUvByKMEsZf5mpc9U/94+BYn3WxX4npcgtRXDtBWf2uofuQE00NncoBQfF4Np2beykptcyctRHzmr8xNLFFgc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJ0iZsH4V6eGc3ghy6n9uWfvOKG1e7/Wha6paNlw2e/vp0WShn
	29zldEywGw010MFOObpLm3W9WcQtAVj1S95D6TgElkeoDVGOJIaqzMxH
X-Gm-Gg: AYBFou0gahhYL6+Hya5BimGzAg+7Np0vMWuw3h46eaGCv97plJ+q35nmtuh10OMLEon
	jr1gOo5mOGwsARd3dzFoqkCvANn7UHdOyANCJh1hFEd/dIKdqe6OdnnACQdFyWDLkmDizuQ2SC0
	A3pSj38D8f4KxnxHtFy+331kA5hgpo0R5sSy2hUKoS6Hbd9FVGMXU4QIzGnn1Fbrjjzr/U1M1a6
	xYg5E/XUPEHo2lQIK1t9SLt8C1mBFSV8LAzNY9AMkPwoCWXcW9MA7ClSp00Lla0NNrWIaTnUI/O
	gNmZ/aXZZccWpziEbLW3MOxMyh13aczLz2qe9A+dWWf+4iybE7IWmd1VccgY4WWm5ZUMgWBNNrE
	LyzSPtn/vRytgpOhbYMGv0UM4XTf05RDxWfpuT/RO03vcPmOEk2FR/BTbJ4oCuAI4C+3fvtuFn5
	Bm8F2e/e7POVlQSkYeIN0f574Ycg6wlIcWAQMWBrjFBkwkkRJCBWY0FQU+/RRsVoTR9PvCMM11L
	RukBXHCo9CGHkTorMfzs4Spaw70nJSY/WcGSxs4ZKRUzQB3C58c
X-Received: by 2002:a17:90b:3ec1:b0:39e:6a81:f34b with SMTP id 98e67ed59e1d1-3a7873dc91amr2356347a91.37.1791047719604;
        Sat, 03 Oct 2026 10:15:19 -0700 (PDT)
Received: from casta ([2401:d800:1f1:cd06:9f1f:eeb6:21ad:cee5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a5150sm3587419a91.1.2026.10.03.10.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 10:15:18 -0700 (PDT)
From: Nguyen Duy Nhat Anh <neganhat@gmail.com>
To: adrianox@gmail.com
Cc: code@tyhicks.com,
	ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+03c68e42ce4b33f7ce9b@syzkaller.appspotmail.com
Subject: Re: ecryptfs: validate auth tok payload size
Date: Sun,  4 Oct 2026 00:13:52 +0700
Message-ID: <20261003171352.10244-1-neganhat@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001213915.1326602-1-adrianox@gmail.com>
References: <20261001213915.1326602-1-adrianox@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Adriano,

I noticed this patch touches the exact same lines as a bug fix I submitted 
earlier for ecryptfs (the ecryptfs_get_key_payload_data fix):
https://lore.kernel.org/all/20260917044558.41677-1-neganhat@gmail.com/T/

Since your patch expands on this area, could you please add my 
Co-developed-by or Reported-by tag to this series?

Thanks,
Anh

Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CB433BBBD
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 01:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789177700; cv=none; b=fUY0EfJmJPku1Sy3dcz9NP3lHpOZrXxqKf+MJyiqswbL37lgDb+vPCdNv8PCr6IMBXiORjyYlhfoVwbA5R6czjusaYCG2zzEmZ5emIkK9uCotWkbVc1cqx5qR1GCHQt8pR1eFgcKxjdUG9ZleU2Dov52pNBLZ6f92vWmO0M1uC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789177700; c=relaxed/simple;
	bh=u06mvMx/nyGRx2ZwItUdVoG3cF9jttBAKDzjNvDn2Qc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LK7y8hQQZeP5IMDoIcV3PC85OfH/UBnHorSY6f7684dPh3WmrCNL12MDqnBTbRnqf5zxCSxbdtdk8JP1Zu9VFVtRP+2E/lkPupBVwLq7QMyq15scbf3eE8iFbOOVI+LNH9WaLuKIdt0ba5zzltmzseHNQwgyynDDUX0hqaWjWIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yh7OL5Z+; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yh7OL5Z+"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso1627388a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 18:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789177699; x=1789782499; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AJTaf2bDSpdzSk6z7WG/DeZkUq5zAHBzTOO9sxhYvuY=;
        b=Yh7OL5Z+KuE1GvJGtKX/pcGMbtvZsVB53/Oh1SId+ya0PYtrB4/qWLcqP1fSBy40sx
         YfhgS6Z0nvYOKkDMhLf3ub7+3iQT7kID7XLU4JJ+XRhRzvN+RBMqVY5QBFfrv4O9pYx9
         nG/ht+OZvtjugWkX35Ly8n/u3jVe3j6Nq9lmD3VzL3q8Wx9RG0kjsR3HZNRnEXDpAZTf
         whtNJTNLx0bT0uA+4vI/RjRLRTf5etMaaxdC/WUojcL3Kh3mcFV0xaqjO2zlsVVKaV0n
         u2c20gRbs2C/HALpLxirbOqIbdc5veIvVwWBr0NTfi+nW50kbHj3AQDY1G/C5xIRu2Mk
         vBQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789177699; x=1789782499;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AJTaf2bDSpdzSk6z7WG/DeZkUq5zAHBzTOO9sxhYvuY=;
        b=HONdzqOHk26ejgMLOLwhCcAvKKzhXzDmnnsmRWEljeGBUumToduVhbBXWLpq+vGHis
         EkZympD8WzIcingjWN6hr0p7+0DNW60Q93WrIrPbXpMidHE4OkyLWQtlkXkc8WxuxISM
         btrXzNFBBT1kjshbKWC1sa35UrA/yOZH1xrNVUkVXXtv74fargVtDQb54s5xZ0zaHP1B
         ed1k+N+M5bBE3nU/fKuoY7fdHANfSi/4so7sQOZayyl7v3h28ZnfY1TapdEa5JrchtUA
         0Z7q3uaGqOiZz1aAgl1dVLIXYyZpKP9kn8HbjA7puhSyBYf+vjVWfwQdxi938/xxgouQ
         rfNA==
X-Forwarded-Encrypted: i=1; AKwUvBxgQH84SBuc+3oiW7/N4BmIXcwHUAWSF9124l/kGWDK5kL2erO8qrT18fXLFnuFayiV+fCseDUq6n+PH8U=@vger.kernel.org
X-Gm-Message-State: AFuF++l7BPcUJpBQGW5BHf9ydUHedoCmkVZPk6PwdMIQR6jkuGWsDs6O
	gb/IEbW9jwEsJp2F6GZVaIu5+58PRFo53gBvopXJHRez2YcDWfINTtk=
X-Gm-Gg: AYBFou32xjpGDZ0yvBF4OOb83sMTiPKQ7iq9TXV+YdoF1FsGWkuffd7ew8EvxrHeh14
	w3NVRnJf3HyK5qXKFpO7MYW46wCBxdRNUImPwsV5iyx4m6pDpIKbVOYW9oKxv5daUcjfGyHE3BJ
	Hl3+6NvdK5JsK8UoJZhhjtdM0050vJG4bHciUhKxY03qNOfcJWGhv5J8Ob1QtesjzlL9i7m7VF7
	5hMuXs8ijAEjZjxN2i/Pu5vAavHS78SiVjuQ2ok0WnlHq73wZ+aBfdoX7W+2HmYXrwas/pqc8lz
	qz4Y2jBMJonvS3XYycZAR/OGtMsTJW/+Za7p+Xq9jXHIWWSUxblN7cPV5uhFyk3cBL8guFRkBDC
	Yq2ybtM8IQLAgMwpNCOT++Pce3cwT1wE3yaCDhTXMMbXrixdklYnscEVd7QQJzflJOL/+PMGspS
	YkPTHhmzfE/Pc2knROQcqwHnLCG+y/devv9VCD76MwDNzWjLqM8od4hyPt6gVtxqYrJNwOvtLYC
	ueC7pVrc4XckO/OS2OrwMWxKg==
X-Received: by 2002:a17:90b:2689:b0:398:9bd1:3211 with SMTP id 98e67ed59e1d1-39d9c21eb06mr10847998a91.18.1789177698853;
        Fri, 11 Sep 2026 18:48:18 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([211.230.25.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d94bafb3bsm7912064a91.1.2026.09.11.18.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 18:48:18 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	phasta@kernel.org
Cc: Donggeun Yoo <donggeunyoo.kernel@gmail.com>,
	Philipp Stanner <phasta@mailbox.org>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	Luben Tuikov <ltuikov89@gmail.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: drm/sched: run queues freed before the TDR that drm_sched_fini() waits for
Date: Sat, 12 Sep 2026 10:48:12 +0900
Message-ID: <20260912014812.2115452-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <363aa83e-7c72-4592-a8ca-46f0ab56e4c5@amd.com>
References: <20260910054605.634135-1-donggeunyoo.kernel@gmail.com> <6f52dcbb040b8ba796b56311e9a77465d111c868.camel@mailbox.org> <df7b0d1e-5a74-445b-90fe-fae30cee4cb3@amd.com> <20260910084408.703333-1-donggeunyoo.kernel@gmail.com> <363aa83e-7c72-4592-a8ca-46f0ab56e4c5@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 9/10/26 15:58, Christian König wrote:
> That is a really good point, canceling the timeout handler should indeed
> happen before freeing the runqueues.

Posted, in a separate thread:

  https://lore.kernel.org/dri-devel/20260910121601.805032-1-donggeunyoo.kernel@gmail.com/

> Oh, that is completely broken behavior of the KUnit test case. I suggest to
> fix that as well.

Agreed - it never signals the hardware fence, on purpose, only to find out
whether the sequence was reachable at all. A local probe, not something
meant for the tree.

Regards,
Donggeun

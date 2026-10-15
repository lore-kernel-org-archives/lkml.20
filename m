Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B044F85D4
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792079553; cv=none; b=DI0u11c4Aa2UiyDUWpSn5EW0WRZaRXlf03cnMTy45Dgojprl44mf4ZImTZXEy0ZnRwQ2XH9yAC7ruYUWDWBBvtkHgUBj3t5qyxWaQPtCXZCVkQVRBvuMBljclhy96ouQAV5elXu7MR8Qk6QbqVl+M26t/NxFHeFOLRi+WGor0sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792079553; c=relaxed/simple;
	bh=8+TCZ/zrpvva3iiL9OUxATXfSB4Da998tMTbnuEx5QY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s75D4YNQr0PivAByxQyMCea0PzIxVytitmNlezgcp5Zlmp2UE6gxO5+a+S59IBBqkXGyluDCQxgXjoygqaaCixfSMIFHnFeY0SHs6IuymkM7vL96OAGRtr7iDKWAlJw++7zIUNSoWG2JNTojQT55/DN7Q6RuQkjnniR4QhGUDwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SmtnTtFm; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SmtnTtFm"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso21414845e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792079541; x=1792684341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AHZqp2tUL+jR2ac8WD4oADqX9Z4sM0KD+dcaF1HV3NU=;
        b=SmtnTtFm8vO9k+tlGe/PFyR4FCyq5uyshYnCTbSN/ImvLGEHZtL4P/o9Xvomrd8AG1
         5gv1495Eqv23P1iwbFaACmegZztRjo/9RxFA7Z1xfkSWQ3NZV5kUTGFOaCkwsuXcBvvt
         FghwSjz4Vj8ohvWqFIUYy/NACCxx0P4ymZktYH9hRQE8UYig05Zzuw7gsrHCBL9t0ep5
         zfOKB7zNuFHLAs/Zx3/EVInZN/THVGma+1YBU9aHEYolT5BQsT/cP4ZfDqs0xirKbYHH
         pEe4coy9EFZJHT7PwCtUTzv7Jg/t7w3iwZZTwTMBaomIPwkeV68vww/sAT7G52Ufy+42
         iOeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792079541; x=1792684341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AHZqp2tUL+jR2ac8WD4oADqX9Z4sM0KD+dcaF1HV3NU=;
        b=VRc9Q5wxOhZhi1gUCVeHf1yK9zUkTCoHJ0NKjDAHpzHiLvAJeUbpYIjjkGwaX3Nsb2
         aEmZL+pSqGxVieTHD7FnCfn3Df26/TXlMkWMsBHHqysEqxrjVML3q5KM4V+NncCIv2l5
         WWVuq8YVe9T2EjjzIfgHQW7GUaLMYPsupnZmqdi9NQnlcKWxrMREJFz1ParnPR4r61M9
         k0s5fr8qIYe+V1wvQeI862DHjGS2Otv4RWyU8M9pZq4dZGerPpXoR/H6x8whBZumDQOY
         KnfyQTtWlcU1ey44g+5MO4D1ngrpLcbBRu9HeWsOFs9JMHqrCOR4zDcIObA2l3PR7KUF
         4Oaw==
X-Forwarded-Encrypted: i=1; AKwUvBxAEqEad39N4uQ/onwS0nP7gYynAirKKbXxYojhmch6TvPjEXiqdQRG94xQViZp32O7+UUwwZHwkRs2IG8=@vger.kernel.org
X-Gm-Message-State: AFq9FYILq9YCnaSG5Hp4yWukNmfROHfSrulK4LFPj41Md673Iz09WW9Y
	3DuR/qUrhwKNrq5JEOQKcdLaVGtOngLFzexiNVxO/Xf5XAhLEJaeSgLw
X-Gm-Gg: AYBFou0jT/KHV/RT7lrpQNhdzxLF6HCdZfWQxuaDWxSCm2pLDu1OJ10uLcARU87yrsm
	7Lc0zNAmvTfzfwijzh5sULIDJJX3XF8TxQc4xhUq9jmIfXVz8MfZHc0Gh5ZOY5JSmHMsnjfOVPI
	MklftPnfhVERnxRZ5ZY3AdvtfgEF9x6R4JmZkaJotnWqm8ATINWUvKHowhQqE22MSiBW8+dQ2el
	2cWUruvFdeaMTN9mW7oM0NkPn0qcdJZf4DZtXk16camRdsZ6ug5dG0t/cQaE9RHQppKHw5ONZMU
	ou1WqFtWJI1Wq/mv05hV9qlmSFNwDY2HJFmlFG5t9gdv/2pZZBZIHiSmQfuFJlwZeb3l4pHfff/
	Uj1543+h68uBKRYGi3yuF6JoRYS61tW219Je4H0gMWAwpRBE2yM/WGH9WuVwQrRhtOwl1+YkF/c
	RJ+rOVTz+5c+vexgi5p2l03G6V/hEBfbZ8wIKAInGBonTjRY4MoXRDS0VcAtvSmArQHy6vPzTIc
	7fdfJ0Hs4LOEDrCacJRh+I0qn992UWgQoma0cqqdL/MXw==
X-Received: by 2002:a05:600c:620b:b0:49c:fc6c:be19 with SMTP id 5b1f17b1804b1-4a18e4d12e7mr366480965e9.31.1792079540501;
        Thu, 15 Oct 2026 08:52:20 -0700 (PDT)
Received: from andreayoga.wind3.hub ([31.189.109.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd993caesm157053315e9.12.2026.10.15.08.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 08:52:20 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Samarth Narang <samarth.colleges@gmail.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Joao Martins <joao.m.martins@oracle.com>,
	Alex Williamson <alex@shazbot.org>,
	Yishai Hadas <yishaih@nvidia.com>,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/4] iommufd/iova_bitmap: Clip recorded ranges to the bitmap
Date: Thu, 15 Oct 2026 17:52:13 +0200
Message-ID: <20261015155214.472218-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015002647.GA3575173@nvidia.com>
References: <20260925161142.189813-1-parri.andrea@gmail.com> <20260925161142.189813-2-parri.andrea@gmail.com> <20261015002647.GA3575173@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Oct 14, 2026 at 09:26:47PM -0300, Jason Gunthorpe wrote:
> If we silently truncate that to the range of the bitmap, like this
> does, then we also are silently lossing dirty marks. The userspace
> will call again with an iova range stepped ahead and instead of seeing
> the early blocks being dirty they will be marked as clean.

Right, the clip turns an overrun into silent dirty loss; failing the
call is better.

I also saw your reply to Samarth's record_dirty() patch [1]: with both
changes, a dirty entry that is not wholly inside the bitmap fails the
call.  Samarth offered to send a v2 of both patches; I'm happy to leave
1/4 to whichever of you prefers and rebase my tests on top.

A few things I'd like to check before I rework the rest:

1) The dirty bit is still cleared when the record fails.  In the
   record_dirty() you proposed, as in visit_dirty() in io-pgtable-arm,
   the entry is made clean unless IOMMU_DIRTY_NO_CLEAR, whatever
   iova_bitmap_set() did.  With start_va rounded down to the entry, a
   query that starts or ends inside a dirty huge IOPTE now fails this
   way too, and a retry with an aligned range sees the entry clean.  Is
   -EPROTO meant to be fatal for userspace (e.g. abort the migration),
   or should the clear be skipped once bitmap->err is set?

2) Could you point me at the patch that adds bitmap->err?  On mainline
   iommu_read_and_clear_dirty() ignores the return of
   iova_bitmap_for_each() and returns 0, so I assume that patch also
   changes this.  Does it cover the VFIO DMA logging path as well
   (vfio_device_log_read_and_clear(), with mlx5 and pds calling
   iova_bitmap_set())?

3) Patch 2 tests the clip, so with your change it fails: the 1M IOPTE
   at MOCK_APERTURE_START is rejected whole against the 128K query, and
   bitmap[0] stays clear.  I can respin it to expect EPROTO, keep the
   guard check past the bitmap, and add a query that starts inside the
   IOPTE, on top of the bitmap->err patch.

Patches 3 and 4 still apply, I think: iova = 0 with length = 0 passes
iommufd_check_iova_range(), and __iommu_read_and_clear_dirty() then
walks [0, ULONG_MAX].  With your check nothing gets recorded, but the
dirty bits it walks over are still cleared.

[1] https://lore.kernel.org/all/20261015003412.GA13920@nvidia.com/

Thanks,
  Andrea

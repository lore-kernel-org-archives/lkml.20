Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794353777;
	b=2qlly1FjDugsln6UQGLpFO9Wabtz+N3r7O45UOQAD6jnCGjQLUO3hCqXo3U39pRQcssT
	 bsixWd6RuDKse03Vl4fqqqPwv/8PNhHBePAJ1Yblo8s+IrN9eTJzEWRzhA5hxTu2QuYyp
	 s52H4UV8b/Cyb65Uo0JjW1ZIiSFl4Jc+VeqFVBd2Gxc23numagGAjQcflsCggVqNxhwfN
	 i+SQinNowAdLA+3M+9hBTQCZ5a6RZ7/86zf23otJrJ8EWHYrwydV6zOhJcliIVcWZSFrE
	 /Bylqm6+xj+2s9tD7usOZ0rosBZ86FPN/z45mr7lSk2fbtDVW4rsyzaFqONuh+V+Mmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794353777;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9j40vAAQxWU/iVBPss+tYuSkGZovCJ/UyhmWEuObdcw=;
	b=17xUA97ceAt2aX74C9GdDp66f3QorkJqrX1JCw1waNuTv3g1tW4t/YCSsOlNZUG2WnjH
	 fT0bdHrAckY1tBjE3/LP7IZ2zLHGGIAYOyAEGJrnNbrx4Mkkon+ZMYIm+VKdeyJV13Lm4
	 4C2i7km+EeO29KTSLFrrNcr6mHM3EXlaaLhGyZdkpVxfI/ds37O54OALoe3HXKrIchWIW
	 BqeDi5q3zPzuIrHsMatUm/5n4IPBOAoIQeFBXSOmtKryG1Qa7rsTGD7DbIT/T/ib7J7Qg
	 8zieTVopqHE9sbp3HVUKi/6FYx0zAxqjVKBJI5um1BnIOI5Q0tPP6GmPNBPhPegObYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dubeyko.com;
	spf=pass smtp.mailfrom=dubeyko.com;
	dkim=pass header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Y4wSKttz;
	arc=none smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A846E606A326
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:36:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A846E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Y4wSKttz
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b331cad3cfso21525727b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20260707.gappssmtp.com; s=20260707; t=1794353775; x=1794958575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9j40vAAQxWU/iVBPss+tYuSkGZovCJ/UyhmWEuObdcw=;
        b=Y4wSKttzb+XEpQBmS61mROvznHqsOvQ0mrkGAHS39dCaYJWPbf+rFxjRL31CCiKuTh
         vy0jsr6bEAFdm4Q++G/3C8V+U/OwhTkLhAJYxhuych6NwDvvnTWZMbL77DIZnppTOT/+
         nBdfg0Ui72qiqCimp+6RjMMSnTzWjUjiwYJstvgQOtHyNjfy4p8SSchlzJMlHGdo2FPn
         HyQq0OOAjz+rmn7j7N0Md5GTIF6GQX8PsPc9AJfjLH9J5qTjS5UzFhfDnq3H1RHy2Ed2
         Ewa6pkYLECxPdXw5yGnQfCWEpgCfx6SRUUYoeJd60DdiCGUDp+OQn6FUOOpHbf9/aOMl
         vgqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794353775; x=1794958575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9j40vAAQxWU/iVBPss+tYuSkGZovCJ/UyhmWEuObdcw=;
        b=0l0RC5VIHwheoeMZSr/mzRwg5V5Oq/qW2PZEDtMElwQvKhF4oF222O3HHIhI6eQnx2
         N/5XXG4dAp4R9/5e4p/yTiV0e3ulVBEfFRRT4kfdo/e6zKKkq4GyTjzy78nE4i93aIL4
         ysY83nQFeVqSDAAk9VVWoI3D7BWdNrUEn9DxxCVHO+m5GBLWKfNhCfAFfWNUCwmqGKF6
         mOs9krf0nW+hSKQITcCGDJUFsOLRGK5zR3aENJ8qMR0Tk35PukQBxlSPvvWwnIYhY/tQ
         m6cUaCqbLEl47kyHmD1wjnlZUIngTINJCW42pM988XnDX+lKGdAU4IjGYGLHFwIV0Vdo
         Er8A==
X-Forwarded-Encrypted: i=1; AL+hErFGjJrYsFvvtNH8W5VfEo8GtA6xYmSx/sOqSf6dPYLHc9jsep0Bb9onR/lMjO5Ngdwcxfup0qqMlWhcBzU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/X6Sf+ENyRXLHBjxevRdGOw1Tq5/03blqa645O/F0k2KYb1hLT
	HBot+2qCvqSbl6HpsivBV6WVxtKs2Idcb9algiKqDfydogIkocpGshkTOU+Q2xNd1zA=
X-Gm-Gg: AYBFou2/0UKEYONW2l9XtvFO8WSrdbk+Q4uCni3oobLNReX45v3TYMN5NTCM6rSulee
	1imcd7M4mm6ojpvBLqzUCAXGEPJcPzzPo5ZUXBy2gXTPiOpdWsx3kSMl4Ds8KC1WAen16Lj99p0
	f6KSdND3/7ZJDwFIgGJJ1eivLCARYGsjOSFTm5UXN3XUpM1v9Fy3bL1pBXQCeSe61OmyVBADgAT
	NbuezR/rKvOeH1aoFzb1efg782v6wEFMeKXzWe5fsBeML6i19a4LqngXIC0roo/CMeTidVlbZ/v
	doLqLprXUl5353vhjZZLp+G39t7sYGWcCgio0uB7GfqvkmQVQhu0TSDGIHZXAV46DLOpWvZzqQu
	//Wqzwll/pc0k+HuzDZhDJMefXKQN9F5vEior3rbThYXhlU5adN6pL5DY3/o4heuU0PrJkNTbgJ
	P36jO6jgQA24hnJnue3xXSbcdTbwiESJeZ8lkKM+5GEC2ryiyMX/fSQ8mN8Wvi30Ibk0NA0XZet
	QcOYeaJ1SqJG/42KdJrMIYzZmRw9UDdEgnWFCOLXWCJ1Ql9nt1iiim7rMAi9IwzQJ81Iby1zabD
	Gd1AAwzpxu8fsvrtuQSZrJ5nfmThkmNDdvxnPHX3RlkYiX14EZksdoJLaV9DLXDH2sFAML8DycO
	ZPU2/2JnMNv8OmPPIFMCBVcfTwlTRoxmbd88AcZ6zxTXb3ptfRL4sr8WeE/Ept+SM9qvMBMbUCn
	n44gfyx5z+xaQrxA7S
X-Received: by 2002:a05:690c:ec2:b0:8b3:361f:5d77 with SMTP id 00721157ae682-8b3a8120d7cmr8569287b3.26.1794353775437;
        Tue, 10 Nov 2026 15:36:15 -0800 (PST)
Received: from system76-laptop.attlocal.net ([2600:1700:6476:1430:1541:987e:e160:f038])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3933d1047sm31652577b3.19.2026.11.10.15.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 15:36:14 -0800 (PST)
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: glaubitz@physik.fu-berlin.de,
	frank.li@vivo.com
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vdubeyko@coreweave.com,
	Viacheslav Dubeyko <slava@dubeyko.com>
Subject: [PATCH 0/2] hfs/hfsplus: release preallocated blocks on truncate
Date: Tue, 10 Nov 2026 15:36:07 -0800
Message-ID: <20261110233609.561557-1-slava@dubeyko.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HFS and HFS+ extend a fork in whole clumps, and when an inode
is loaded the number of allocated blocks comes from the on-disk
physical size of the fork, while i_size and phys_size come from
the logical size. So the fork can hold more blocks than i_size
needs even when phys_size equals i_size.

hfs_file_truncate() and hfsplus_file_truncate() return early when
i_size equals phys_size, before comparing the required block
count with the allocated one. This logic has been added
to avoid dirtying an unchanged inode, but it also skips
releasing the extra blocks:

 - a file whose size is aligned on the block size keeps its clump
   preallocation after the last close;

 - the catalog delete path does not free the data fork and relies
   on truncating the inode to zero size, so a file with zero
   logical size but allocated blocks leaves those blocks marked
   as used in the bitmap after it has been deleted.

Make the early return happen only when neither the
size nor the allocation needs to be trimmed, which keeps the
original intent of not dirtying an unchanged inode.

Viacheslav Dubeyko (2):
  hfsplus: release preallocated blocks in hfsplus_file_truncate()
  hfs: release preallocated blocks in hfs_file_truncate()

 fs/hfs/extent.c      | 13 +++++++++++--
 fs/hfsplus/extents.c | 11 +++++++++--
 2 files changed, 20 insertions(+), 4 deletions(-)

-- 
2.43.0


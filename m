Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD9F3472075
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 08:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788251704; cv=none; b=psKaZwFhkZVmzKVtD3z4a0N9gsj2m6XHd82YfTzlzkj5TG3ELmprp9MXbK9Ecvjl8bsIA96xIPJyAVyi0gm4V0HXelFd6eak5Kd2gWVIQmoh57xQJN9U8Yx6CHckL2looh7ntCyEup8lzSXqr1TCI4dRW92fqSsBI9tNe+RSqHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788251704; c=relaxed/simple;
	bh=ETkI6KJwrnZVt7KfNbAKEIpYILxfFfSNE/VjjwuUITY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WTDoCSee95gESExmKriY4bnqsZyd/Z3O/7MrCdyxzC6bvF1TDLdA3WiL2ODq/EqD7dRNVOeTxRjIflN5bEaJHW1WyIhgWldYrwEXjqokxi2w4ls21+TOOdREpzye3KsOlS9xobItDF2rkSVsClQRnMABU/7KwMrH+VS/7lD8vw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=uYgRFuVQ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="uYgRFuVQ"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 84065143D;
	Tue,  1 Sep 2026 01:34:57 -0700 (PDT)
Received: from a081061.blr.arm.com (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A204D3F882;
	Tue,  1 Sep 2026 01:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788251701; bh=ETkI6KJwrnZVt7KfNbAKEIpYILxfFfSNE/VjjwuUITY=;
	h=From:To:Cc:Subject:Date:From;
	b=uYgRFuVQUMgMQG7UwlgbJDgKFs5OSgi9I/EkkKtaj90JAbxq3XDpY9tqH0aOMPn+W
	 9sqS2bUvRH6RmFm/7qXLqUpah8AQ9CneKlG0kiw4UyqxUryDzee2ftGbFmSI4qqVPQ
	 vTlavXRxVp3pLtfLhXQRZjgKiooAj+MIVuhuJ1ss=
From: Sarthak Sharma <sarthak.sharma@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Kiryl Shutsemau <kas@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Sarthak Sharma <sarthak.sharma@arm.com>
Subject: [PATCH v3 0/2] mm/gup_test: prevent overflow and report actual pinned bytes
Date: Tue,  1 Sep 2026 14:04:50 +0530
Message-ID: <20260901083452.115365-1-sarthak.sharma@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__gup_test_ioctl() accepts the number of pages per call from userspace. Its
batch end calculation can overflow and wrap around, bypassing the existing
check. This can cause GUP to write beyond the allocated pages array. This
issue was reported by Sashiko.

Also, gup->size is calculated from address difference instead of the actual
pages pinned. This can report partial pages pinned as covering the whole
requested range.

Prevent overflow by clamping each batch before calculating next and
report the actual bytes pinned.

Changes in v3:
- Add a new patch to prevent overflow in GUP batch calculation

Changes in v2:
- Fix a typo in the commit message

Previous versions:
v2: https://lore.kernel.org/all/20260831101304.162867-1-sarthak.sharma@arm.com/
v1: https://lore.kernel.org/all/20260831064808.77768-1-sarthak.sharma@arm.com/

Sarthak Sharma (2):
  mm/gup_test: prevent overflow in GUP batch calculation
  mm/gup_test: report actual pinned bytes

 mm/gup_test.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

-- 
2.53.0


Received: from e234-50.smtp-out.ap-northeast-1.amazonses.com (e234-50.smtp-out.ap-northeast-1.amazonses.com [23.251.234.50])
	(using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2427C4229D0;
	Wed, 30 Sep 2026 07:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.251.234.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790752097; cv=none; b=HklmMsPyDbxWUn09O3OrZVpfAjPsltnHUs+xExlu/ALkZudlP4YiOSkQfXux2z003AqLGq4EIEkbD3+16i6Y7tUnLV4lF2OUyiYNuJZFMDujO6R/Utih8ZaVpBYRiWiZWJPOeScJpnQca4BsX4GPZisklBXddnHKgDHdu5+g57Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790752097; c=relaxed/simple;
	bh=0b9Mt1fRp9dkXfm1i0Z5QIcqasaDZg/0ym/iNvEF6sc=;
	h=From:To:Cc:Subject:Message-ID:Date:MIME-Version:Content-Type; b=chmWHKPD6dg9LER5zLLun+S6VvhpfBvdAIw9ESQ6WZ9dTkedGIyjY3b3Ev65XAtmU1e24xMS66vwOIBE6zwJjjD7IR1xD8DJgGwrpOou6I9zGkRuxpNYn2SJvRy1k0NeP7rCSW8baIkq6ZHwSbL/nTOtTK9nAj9M8uYLfMA/Y/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fqwqf.xyz; spf=pass smtp.mailfrom=send.fqwqf.xyz; dkim=pass (1024-bit key) header.d=fqwqf.xyz header.i=@fqwqf.xyz header.b=MRVnZzHk; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=Qnvqu1V0; arc=none smtp.client-ip=23.251.234.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fqwqf.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=send.fqwqf.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fqwqf.xyz header.i=@fqwqf.xyz header.b="MRVnZzHk";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="Qnvqu1V0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple; s=resend;
	d=fqwqf.xyz; t=1790752093;
	h=From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type;
	bh=0b9Mt1fRp9dkXfm1i0Z5QIcqasaDZg/0ym/iNvEF6sc=;
	b=MRVnZzHkzcgQh3Gqguxeh9kosMsLDaDTpaJj5qf+rt4C7raBC6cEA8khYsHl/1tE
	kNT08sfddcIvu/3ddw8lyWH1+WaH1rHMbYj9J9rTQXfI1jP9JfleFL3IrmQaDUhqPVN
	rojavqfXkVJnE5WP1DIBF11wPw5RIIYg5a4rlJ+8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=zh4gjftm6etwoq6afzugpky45synznly; d=amazonses.com; t=1790752093;
	h=From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type:Feedback-ID;
	bh=0b9Mt1fRp9dkXfm1i0Z5QIcqasaDZg/0ym/iNvEF6sc=;
	b=Qnvqu1V0KN5ssDiDzVrWfdEG8E/hiLuQiqIKwm/F4iIboz64C1EIrRz2sdMSQz58
	gnL6cwuads7EmdIsLl2GqoquBmuwqK57u2wIwoXubfN0BHKNXND+q9O+fpLvAiDoM3T
	UTEkb/FVbDj9/u1NBhSsLFKA9fYz46mfuqWV+GzE=
X-Mailer: git-send-email 2.53.0
From: Jizhou Tong <fqwqf@fqwqf.xyz>
To: sakari.ailus@linux.intel.com, benjamin.mugnier@foss.st.com, 
	sylvain.petinot@foss.st.com
Cc: mchehab@kernel.org, hverkuil@kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] media: i2c: vd55g1: preserve stream errors and
 always attempt stop
Message-ID: <010601a0f1247437-3d2d5494-0cd2-414c-af01-a7618c8602f3-000000@ap-northeast-1.amazonses.com>
Content-Transfer-Encoding: 7bit
Date: Wed, 30 Sep 2026 07:08:13 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Feedback-ID: :1.ap-northeast-1.6BGMgStFQE7EJYq5syaCRzdneEHVt/+DAaGDrqUmDs9QLO4/SllUBZ3fHvnZ8rcAX/3IjUyTRgi5JFZsWrikFHwlPJqCkqEMlxDFM4JXh+ycxH/J5Tudg5bGdz6h4331g1L1EFsGR8kuYNfGLsrxz4Nym4YXoPcZxeVkrHry4Zx21n8vEVLEjc7s+OCM8PU9:1.ap-northeast-1.DTXDV/V9GPBWozcllKo8innbNB2qs2O/3F8XZSzd9ZM=:AmazonSES
X-SES-Outgoing: 2026.09.30-23.251.234.50

This series fixes two error paths in the VD55G1 driver. Stream-start
currently replaces the original error with -EINVAL. On stream-off, a
failed exposure read prevents the subsequent stop command from being
issued because the CCI error accumulator remains set.

Preserve the stream-start error and handle the exposure read separately
from the stop sequence. The first patch builds on 5931eed35cb6, which
fixed the earlier false-success return.

Based on Linux 7.3-rc5.

Validation:
- ARM64 W=1 driver-object build.
- ASan/UBSan tests of the actual functions: twelve start failure points
  with three error codes, and eight stream-off error combinations.
- Hardware use on a Surface Laptop 7 with downstream VD55G0 support;
  normal IR capture and face authentication have been working.

Jizhou Tong (2):
  media: i2c: vd55g1: preserve the stream-start error
  media: i2c: vd55g1: stop streaming after an exposure read error

 drivers/media/i2c/vd55g1.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)


base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
-- 
2.53.0


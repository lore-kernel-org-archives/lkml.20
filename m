Received: from e234-57.smtp-out.ap-northeast-1.amazonses.com (e234-57.smtp-out.ap-northeast-1.amazonses.com [23.251.234.57])
	(using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261773CB57D;
	Sat, 10 Oct 2026 09:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.251.234.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791624187; cv=none; b=mNChu6RW6B4wim/xfBUwbgY+X64e0bBqFGC2IZAYz2pLa+GB7tlszJzsploH/SWwl/j4Z6l5gyy67Afuz2t/HewWnqM2QVItqP9d60FmUPgZsrPw9NPi1hBs5OJOTqeUnaoJLXZN5K7KzmihddECwWtK8BauWkqL8hbYRoHr298=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791624187; c=relaxed/simple;
	bh=B9kex4NsnNpN/MWYiMi+0pc6eJm9BclHL0rBP/yQXPw=;
	h=From:To:Cc:Subject:Message-ID:Date:MIME-Version:Content-Type; b=dfkYB6/pWImh0Ft4aKTPy+rmVXSbeRWqO5tb0yP2Zo7XFjEW99yNH9VKV2BT5nKl/rIeN3SisO8eK3/Z+Ek7T6br9EHidJlluY1NrkjX0SDto49ciS4JqkX8R2iLlkeHJ/RzBHcXCVOrLHDqWIUiJjzZs4Re8LoQpnjVbJzTORc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fqwqf.xyz; spf=pass smtp.mailfrom=send.fqwqf.xyz; dkim=pass (1024-bit key) header.d=fqwqf.xyz header.i=@fqwqf.xyz header.b=NCnf8iV2; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=P1AtECkx; arc=none smtp.client-ip=23.251.234.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fqwqf.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=send.fqwqf.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fqwqf.xyz header.i=@fqwqf.xyz header.b="NCnf8iV2";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="P1AtECkx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple; s=resend;
	d=fqwqf.xyz; t=1791624185;
	h=From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type;
	bh=B9kex4NsnNpN/MWYiMi+0pc6eJm9BclHL0rBP/yQXPw=;
	b=NCnf8iV2sEtJGLGdldD0D2p2NTmn0nQC3A1z60AWuFkqWUd+XfBDpj7MhYH/L7nA
	ZLic0S2cJr6o5jjYUnoirorG0sFoidGpq9hOfJCpRDwitkEkOsUtFPMG60+w/spQGqx
	/+qt5/aLP/NUkDfJAa8zAA5/5J8x3NkR2kkvnLB8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=zh4gjftm6etwoq6afzugpky45synznly; d=amazonses.com; t=1791624185;
	h=From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type:Feedback-ID;
	bh=B9kex4NsnNpN/MWYiMi+0pc6eJm9BclHL0rBP/yQXPw=;
	b=P1AtECkx17Iz9r4vSNrXwag7EZ5OgjxlXuvyUZnHNSzE0NjuPe+7oXXCuhWRXZhV
	Q5icENW4vbCI+aPEruv/kNY+VsAQzku/3O1iyym5jK+xM1agc6avYPnsTxORQQym2UC
	z5ulJ3uxp0kXT/wOk6ChuJdnhhgP8rcRCsr2vpGM=
X-Mailer: git-send-email 2.53.0
From: fQwQf <fqwqf@fqwqf.xyz>
To: sakari.ailus@linux.intel.com, benjamin.mugnier@foss.st.com, 
	sylvain.petinot@foss.st.com
Cc: mchehab@kernel.org, hverkuil@kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] media: i2c: vd55g1: preserve stream errors and
 always attempt stop
Message-ID: <010601a1251f83a6-b487de82-23f8-461b-99c2-dbf401de2158-000000@ap-northeast-1.amazonses.com>
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 09:23:04 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Feedback-ID: :1.ap-northeast-1.6BGMgStFQE7EJYq5syaCRzdneEHVt/+DAaGDrqUmDs9QLO4/SllUBZ3fHvnZ8rcAX/3IjUyTRgi5JFZsWrikFHwlPJqCkqEMlxDFM4JXh+ycxH/J5Tudg5bGdz6h4331g1L1EFsGR8kuYNfGLsrxz4Nym4YXoPcZxeVkrHry4Zx21n8vEVLEjc7s+OCM8PU9:1.ap-northeast-1.DTXDV/V9GPBWozcllKo8innbNB2qs2O/3F8XZSzd9ZM=:AmazonSES
X-SES-Outgoing: 2026.10.10-23.251.234.57

This series fixes two error paths in the VD55G1 driver. Stream-start
currently replaces the original error with -EINVAL. On stream-off, a
failed exposure read prevents the subsequent stop command from being
issued because the CCI error accumulator remains set.

Preserve the stream-start error and handle the exposure read separately
from the stop sequence. The first patch builds on 5931eed35cb6, which
fixed the earlier false-success return.

Changes in v2:
- Drop both Fixes tags as requested by Benjamin Mugnier.
- No code changes.

Link to v1:
https://lore.kernel.org/all/010601a0f1247437-3d2d5494-0cd2-414=
c-af01-a7618c8602f3-000000@ap-northeast-1.amazonses.com/

Based on Linux 7.3-rc5; also applies to current media-next
(ee2e9bf41d3e) as checked on 9 October 2026.

Validation:
- ARM64 W=3D1 driver-object build.
- ASan/UBSan tests of the actual =
functions: twelve start failure points
  with three error codes, and eight =
stream-off error combinations.
- Hardware use on a Surface Laptop 7 with =
downstream VD55G0 support;
  normal IR capture and face authentication have=
 been working.

fQwQf (2):
  media: i2c: vd55g1: preserve the stream-start =
error
  media: i2c: vd55g1: stop streaming after an exposure read error

 drivers/media/i2c/vd55g1.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1=
 deletion(-)


base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
--=20
2.53.0


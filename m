Received: from e234-50.smtp-out.ap-northeast-1.amazonses.com (e234-50.smtp-out.ap-northeast-1.amazonses.com [23.251.234.50])
	(using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7064E35C6B9;
	Tue, 13 Oct 2026 02:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.251.234.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791860088; cv=none; b=m2ypO3a2d6KK1GKPFxoHqB2hHmOsJ2BEDjSXXZypEe5x8OfrzhriUjkhcF5MREPXKzqYo6ypzQvYXLLf3ryKSTo/DL9THVGdjW8jj356lapj3Xlsr5aEDedrA/yp3kR1KOYNef00PzqkjC7R4m1V+OQxo2WZecabNijS/PZvt3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791860088; c=relaxed/simple;
	bh=GykdN22DStWRxfuN1UT2DN5EKhN0r6TdYnKSTCbgCmQ=;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Date:
	 MIME-Version:Content-Type; b=VE5VSd0INs3vh/x10Er7RWNb/bfA9jfW6CkIgjb/ytsJ6iJmbs7fmylap3BN9yc7eArHfxjKCQplHt690wsIoy8FfdR9E5yqYQGpX9xBi9leiiCGtik6WvZjR7llwY0x3HWdMUe33Fdo8DNVHJVYmWjQppQSNMob/YUGfhaMP8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fqwqf.xyz; spf=pass smtp.mailfrom=send.fqwqf.xyz; dkim=pass (1024-bit key) header.d=fqwqf.xyz header.i=@fqwqf.xyz header.b=Lt1A3Qm3; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=OZlZg0FV; arc=none smtp.client-ip=23.251.234.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fqwqf.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=send.fqwqf.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fqwqf.xyz header.i=@fqwqf.xyz header.b="Lt1A3Qm3";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="OZlZg0FV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple; s=resend;
	d=fqwqf.xyz; t=1791860086;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type;
	bh=GykdN22DStWRxfuN1UT2DN5EKhN0r6TdYnKSTCbgCmQ=;
	b=Lt1A3Qm3hxa7XTDrzVaA52z65t7NY+nf7RFvYzSWM+YguvIdgVmv/GTDkolGB+Th
	4sWExWchNONjY98kj8VaTyeH4Sv6unRW2aQyT5lh1Q9vVdCj24DqFgYJdAUBuS0fY5m
	LgHKnzaPK94PKLTn+Y0UyQMrXemy21kg8/nWcOxQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=zh4gjftm6etwoq6afzugpky45synznly; d=amazonses.com; t=1791860086;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type:Feedback-ID;
	bh=GykdN22DStWRxfuN1UT2DN5EKhN0r6TdYnKSTCbgCmQ=;
	b=OZlZg0FV/9Fhwn33EiDfQZBVXTgcsCgxLrsBQYrleaD+zDgreQXUKwIsKcl2AAqz
	JOSrjx/1T3iT7DCE+8dWQcUF3EYdJjU5DV1RTnhdiJAak1ZUx57JNqsQrbAalnmDoi1
	xEiKlrnb9ontwMkViRouoPXNmWXHQaEIwVdSXfVM=
In-Reply-To:
 <010601a1251f83a6-b487de82-23f8-461b-99c2-dbf401de2158-000000@ap-northeast-1.amazonses.com>
References:
 <010601a1251f83a6-b487de82-23f8-461b-99c2-dbf401de2158-000000@ap-northeast-1.amazonses.com>
X-Mailer: git-send-email 2.53.0
From: Jizhou Tong <fqwqf@fqwqf.xyz>
To: sakari.ailus@linux.intel.com, benjamin.mugnier@foss.st.com, 
	sylvain.petinot@foss.st.com
Cc: mchehab@kernel.org, hverkuil@kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] media: i2c: vd55g1: preserve stream errors and
 always attempt stop
Message-ID: <010601a1332f1462-5fb80a97-80fa-4d49-bed0-555152da0354-000000@ap-northeast-1.amazonses.com>
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 02:54:45 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Feedback-ID: :1.ap-northeast-1.6BGMgStFQE7EJYq5syaCRzdneEHVt/+DAaGDrqUmDs9QLO4/SllUBZ3fHvnZ8rcAX/3IjUyTRgi5JFZsWrikFHwlPJqCkqEMlxDFM4JXh+ycxH/J5Tudg5bGdz6h4331g1L1EFsGR8kuYNfGLsrxz4Nym4YXoPcZxeVkrHry4Zx21n8vEVLEjc7s+OCM8PU9:1.ap-northeast-1.DTXDV/V9GPBWozcllKo8innbNB2qs2O/3F8XZSzd9ZM=:AmazonSES
X-SES-Outgoing: 2026.10.13-23.251.234.50

This series fixes two error paths in the VD55G1 driver. Stream-start
currently replaces the original error with -EINVAL. On stream-off, a
failed exposure read prevents the subsequent stop command from being
issued because the CCI error accumulator remains set.

Preserve the stream-start error and handle the exposure read separately
from the stop sequence. The first patch builds on 5931eed35cb6, which
fixed the earlier false-success return.

Changes in v3:
- Reference the documented CCI error-accumulator behavior in the
  stream-off comment.
- No functional changes from v2.

Changes in v2:
- Drop both Fixes tags as requested by Benjamin Mugnier.
- No source changes from v1.

v2: https://lore.kernel.=
org/all/010601a1251f83a6-b487de82-23f8-461b-99c2-dbf401de2158-000000@ap-nor=
theast-1.amazonses.com/

Based on Linux 7.3-rc5. Rechecked against mainline=
 24a19b953e2a and
media-next d7e7bca71698 on 12 October 2026; both issues =
remain.

Validation:
- ARM64 W=3D1 driver-object build.
- ASan/UBSan tests of the actual functions: twelve start failure points
  with three error codes, and eight stream-off error combinations.
- Media CI for v2 passed builds, static analysis, ABI checks, checkpatch
  and virtual-device tests.
- Hardware use on a Surface Laptop 7 with =
downstream VD55G0 support;
  normal IR capture and face authentication have=
 been working.

Jizhou Tong (2):
  media: i2c: vd55g1: preserve the =
stream-start error
  media: i2c: vd55g1: stop streaming after an exposure =
read error

 drivers/media/i2c/vd55g1.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)


base-commit: =
72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
--=20
2.53.0


Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5795146D092
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788189745; cv=none; b=I6s1F//8DlxfbZ/Y+qMULD3YcxSCC28tdIBYAQagpvsuwSo+sq/7SZxOt89ACNN3YDs/wBgQQnnHFUb7g7bXY2RX4q02SmBMSW4pvYvFt6MJEaF51E2wDIvlAAYCK4zekDdSoHu3txYBD4697n+bVk1aTmBWWGmjo8cg3YX1g1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788189745; c=relaxed/simple;
	bh=a7QmT6D6ZzTDIpRpEEw8yAEqutSch+PYx1h132MhJHU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Iwt0KvXvJdnSOb+K41fqcKJE67U64QFPgIYQEw4OVe/NAHS4A893FQIQeFk1VAxZ+v5l3824Ri/7QLfhFetLEc7uvpb0ncyMLHH/tHw+QrA7thIXd/LPOVOyEGZOdldlyUCtFsRAFEXyQ1isxFlEhkj/2Y4dafSOfoe99YXVtic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cjRUNgT6; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cjRUNgT6"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4843e9c5960so719096f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788189743; x=1788794543; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xAabvW/LFOQnUFGSsqKGiAJ7IJMbUXTCA25C9OFUDGo=;
        b=cjRUNgT6hqSgSQAIwljHckZ5jpp0orCXSXgTlzO5D9jCW7aiEz3cZwF/h8UxsyaECM
         ArsWJjWIL2tSb7lN7Pv28Xb0i47sz50rDl8oXsSSNOM97XoJQZ7aEPsIEOvagbMOaDZ1
         Yv7Cmgqk4XoIKE7oqsNUvGSfaeLpGVRZprHJFSwlk/UtBhZRgWr1yqbuSAWbutPedTWH
         dApZChhOX03OvVLr4sgwbxN98ZLgWQT2TMmGeMDwv7uQmHovWXWvZG0FSBKBhIA9umrh
         25mgtPwjJj9qChd3JylVj/isOCpfMdiokvEi/2TEyML4vgxkd500p0dxjxUuC0RMJPjj
         xX8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788189743; x=1788794543;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xAabvW/LFOQnUFGSsqKGiAJ7IJMbUXTCA25C9OFUDGo=;
        b=B98XCnM/Jy8gQN4rag20VCbV/W6A7++tQvgWjwGjPEpwqUkwajhOQcg3uXL1VhzgzL
         9MIrZKmFOevi6NqDgDpDhG8Yp5f6gp/oL1wzvoCBLiVnz3fPlLnoye79l8wX0PeS51Hk
         QsmqPxTjB3vMvPBhz5+kU2XvYEMNCxseKSDfHCvZeuzjOcHtRvZd2piG8BJhigIxX45F
         h219VlGQr4ZujtaxnhCR26nSZ1Q0OjOkbn/JgHsktUUY2+Fmpf23meHHKJoZAY1C/jJI
         CQCDMjML4RvzTuaiquUd4jiZIIvgmQVJXlqIwv62BpnnWmhSUxzgYr6+mRjmcHd1TM0Y
         AAZQ==
X-Forwarded-Encrypted: i=1; AKwUvBwXiWuGsyp7cTvtkaSDVgG76cU01qPqFZ16YLmfHosk/pvlvit/X7zjaK9rGbY24D53Zb2QpLIkDIe+WXM=@vger.kernel.org
X-Gm-Message-State: AFuF++lSj2x5Isq7uuq3dRi4Zqp9f+9tNBRYsOpZVB/I3rmTqx3bBt90
	q7ya/I2T68Yq+t0sHcpFPe5kQLSSYOjTAlPuEKLiZ2QpYdoR/CwK0vd8
X-Gm-Gg: AYBFou20m+EbcFciUp34JiljNLlx5mfjJmcM7rZoHlIO5UQ9hqD4YNcmsaiWy7Uq98s
	4gF8NfYKa7Jn0R9a4LU2EKjMCxop3r8Lv9VdBlmNaqAzE3pr5hMDpoyR4C0hMKUS7Y4VtduG7kn
	X0FemrO3JOZr/Io8zA0klYv9zhZ7uHH+cD5SWbEIVkkQDD44/SV43yW3ByK1qrJz6nHWXa71BsO
	rxTg6NZW8OBWWV0xhXF14KRWdyMzmonrAqjruVMgz4YTyCWz25qLgERK9tGBDFPS6SVUCv3fbvV
	fg9FlvzuiGJItvMPqg03hiEg22oTU7sD5sxE6n64BA8G/Atg1lcoRjhJXduSaWeyW6FQjvA9pb/
	/TkeDqFbuLF1QSKEVKEKBBG456W5CQeZfe7sXROpaA+abxsWoreptzjrNd5ftWGEmM7XQ4HzeTO
	tGZQQlGjhxo1+unQkIa9ao6oT2a5b7+3QjEDwflyaHSUvCmwc4tGDF06WtLZnk3tPxzCU5JsT7M
	UXS08hvwfkvjMoqhv2Qb91G
X-Received: by 2002:a5d:5d12:0:b0:484:3313:fd87 with SMTP id ffacd0b85a97d-484331400a9mr27452685f8f.28.1788189742553;
        Mon, 31 Aug 2026 08:22:22 -0700 (PDT)
Received: from unix.. (244.red-81-44-253.staticip.rima-tde.net. [81.44.253.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-484322ce2a6sm17342585f8f.19.2026.08.31.08.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:22:14 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
Subject: [PATCH v1 0/2] Input: evdev/uinput errno alignment
Date: Mon, 31 Aug 2026 12:21:54 -0300
Message-ID: <20260831152156.166514-1-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

Two small fixes so ioctl failures match what helpers and uapi docs
already document.

Patch 1 propagates the return value of input_ff_effect_from_user()
from EVIOCSFF instead of always mapping failures to -EFAULT (wrong
size becomes -EINVAL).

Patch 2 returns -EINVAL for UI_ABS_SETUP when the axis code is out of
range (was -ERANGE) and rejects ABS_MT_SLOT with a non-zero minimum.

Base: v7.3-rc1

Tested: built bzImage with CONFIG_INPUT_UINPUT=y and CONFIG_INPUT_EVDEV=y;
QEMU initramfs smoke:

  - UI_ABS_SETUP with code > ABS_MAX → EINVAL
  - UI_ABS_SETUP ABS_MT_SLOT with min != 0 → EINVAL
  - EVIOCSFF with wrong size → EINVAL

Thanks,
Iván

Iván Ezequiel Rodriguez (2):
  Input: evdev: propagate EVIOCSFF copy errors correctly
  Input: uinput: align UI_ABS_SETUP validation with uapi docs

 drivers/input/evdev.c       | 5 +++--
 drivers/input/misc/uinput.c | 9 ++++++++-
 2 files changed, 11 insertions(+), 3 deletions(-)

-- 
2.43.0

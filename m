Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62EA4C4F6A
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 15:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791213691; cv=none; b=bSA65v/ftBEIFapja/dJxPjMxUs00VYEeDn5bX9srN3si3zxQrOG+KK86GCsxSmjA/Z7pHvgte37hbC73q18SxC2k8yrEft44L4O+QJ+of41lwnQ22vTMeX1Z6pRno6caBDytIpOw8F0CB7zxeW4WbLY56WZGxQNflQGmuUKBE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791213691; c=relaxed/simple;
	bh=tSJ7DA2uB4DJctm4lIPofOqJU6pfSFeFKaeAUMVo3Ik=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=GeKdOlZtAwTgV8sAImxLtajXDf7Kaa79phpZIlzGa/QHZUKroR/c6pt+UPkm1UJtvh3dQIWaefDqYeQHzCFXyzl920Alca3q2YdFddavipAbuXQ8ZpMprbLkEa6mNIlWxzjDzRq2VYhf4u7l9rllRzw8ulqVMzFvROhjs2E2kM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e66390995so12248265e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 08:21:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791213688; x=1791818488;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:reply-to:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5xwy1bVKutOBgBtdDauDgxu1J//ur8mtxlnL5sPwa+I=;
        b=pK/Hn0CdhHjv/gOfXAbEnCIE1S/HH0dh9a2b+D5T25ACm+X31IpD7mY69uTobH3Wji
         YkPfBGyoeBOL5lRGc4PSUVB+zmgJvfZxPZgDdEe8+0iMgVnB1/t370FD1ie9tnf52Oid
         dwJwNN3YWQ8GmPRYoWProjEr/6l8DG0UubqZug02eXN5rvPO5wX74N+EzmJs1Jasi0O7
         Nxg9M/bmuUeGXndJgLMM+ZudmD4fFWmM+8o/DFbIh61W7u732zQTZ0k5iUGPNArR64az
         r8K4oZtN/MsAdCe+6Ct5lwBIJAvLdEGsea442UE+Sb7q+KrqPuLU+NjctvwkYNatg6NA
         zE4A==
X-Forwarded-Encrypted: i=1; AKwUvBzcgCtRCEmE/miHuSp5T9b4OE4Gi+YHGnWI7bGLEU1EMsPcr8uIyfz1wZhhQc/pESKbRoyMKJK3TUrzvwQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mkS8Ske09ROpDY/DFo4l9u36Fco+zcILf1rnXJlnbDGxrxEHaq
	eiCZVPP8nQ6OXeR5QYcoaA+fbLPDNrzBKgYQ8x3SNHVyZNz3H4/ReatuaU/fkaYVtx4=
X-Gm-Gg: AYBFou1R2bveDZ0EagbvgSLmyNFTfNkXtX48v8CfThhD29CRK0xHQJWpbe1HoEdgRk9
	in2SjXT3IBA26eLKH1CRbcLHL95EPeEUYgkJGuCFbUC5A9DuqemgRB0CzX22JPSllFticWuk2xC
	SIfzaR5PBQ+lyZdJQKn1q/BicqEp6xbGeu3UIsEuXSp7JA1oVXGVdzzqAMKswaRFIH7win61wsp
	Th4wdRj48vs2Y/qLlpBUg+eHOUah9FXdrid1BSairha+rz5afvbtB3KuFK3Vk6Q3rSS8e9Uq4jW
	uT/7p4qEmzYR87iNy3useVevL6uzDmfElhXLAG+PyjDygHYUzJR6EBnSlAnsJuxS1vTEeLJ2Wj6
	COhw+VfaqOj2KtTUShzNkawF6Iu+HH0yoUFf7T0Ntt6WsQ1M4NXDhwseSkMPJLPDHr14CouqnAV
	EnF+CbjjMOULET+dz8xd3lmtu3Rka1v/pFrs5eZx5KCFqassnpWkJ51UCLLZHg8JUp0BEXqsh3T
	Ucc1myuy1fphnZZpUdfn063RZ7rK03Lp6oZMg==
X-Received: by 2002:a05:600c:6217:b0:4a0:1aa0:7cfa with SMTP id 5b1f17b1804b1-4a027583efbmr163836505e9.12.1791213687918;
        Mon, 05 Oct 2026 08:21:27 -0700 (PDT)
Received: from [10.68.32.41] (bba-217-165-185-173.alshamil.net.ae. [217.165.185.173])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178542326sm1279635e9.5.2026.10.05.08.21.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 08:21:27 -0700 (PDT)
Message-ID: <348194a3-e542-45df-8be9-eaed588c07a7@linux.com>
Date: Mon, 5 Oct 2026 19:21:25 +0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: efremov@linux.com
Content-Language: en-US, ru-RU
To: Jens Axboe <axboe@kernel.dk>
Cc: Karl Mehltretter <kmehltretter@gmail.com>, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org
From: "Denis Efremov (Oracle)" <efremov@linux.com>
Subject: [GIT PULL] Floppy fixes for 7.4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jens,

Floppy fixes for the 7.4 merge window, based on your for-7.4/block
branch.

Please pull

The following changes since commit 9690943353cec1690a715e000ba6a74e5139f530:

  block: amiflop: synchronize flush timer before track flush (2026-10-01 08:37:58 -0600)

are available in the Git repository at:

  https://github.com/evdenis/linux-floppy.git tags/floppy-for-7.4

for you to fetch changes up to bb38473f1bcb287567f2fa7980e483a778092504:

  floppy: return the drive state flags from the 32-bit FDGETDRVSTAT (2026-10-05 18:59:41 +0400)

----------------------------------------------------------------
Floppy fixes for 7.4

Six fixes for long-standing floppy bugs, most of them found by syzbot
or by race detectors:

- Flush pending work before releasing the IRQ and DMA when no FDC is
  found, from Karl Mehltretter. The work queued by the probe could run
  after the IRQ and DMA were already freed ("work still pending").

- Unregister the platform device when add_disk() fails, from Guangshuo
  Li. The failing drive's device stayed registered after the module
  was unloaded, and reading its sysfs attributes oopsed on freed module
  memory.

- Return early from reset_interrupt() when cont is already NULL, from
  Yang Xiuwei. This fixes the syzbot GPF in reset_interrupt(). I decided
  to take v1 as a partial solution; the full fix will require
  additional rework.

- Replace volatile on command_status with READ_ONCE()/WRITE_ONCE() and
  annotate floppy_work_fn and current_type[], from Cen Zhang. No
  functional change.

- Don't keep a pointer to a stack buffer in timeout_message.
  show_floppy() printed it from the interrupt handler after
  request_done() had returned (syzbot KASAN report).

- Copy the drive state flags in the 32-bit FDGETDRVSTAT and
  FDPOLLDRVSTAT. Since 4.13 the compat path returned flags == 0, so
  32-bit fdutils saw every disk as write-protected and never saw a
  disk change.

Tested in QEMU with a floppy test suite (including the compat ioctls
from 32-bit userspace, and fdutils/mtools/dosfstools workflows) on
KASAN and KCSAN kernels, with no new warnings.

Signed-off-by: Denis Efremov (Oracle) <efremov@linux.com>

----------------------------------------------------------------
Cen Zhang (1):
      floppy: annotate data-races around command_status and floppy_work_fn

Denis Efremov (Oracle) (2):
      floppy: don't store a stack buffer in timeout_message
      floppy: return the drive state flags from the 32-bit FDGETDRVSTAT

Guangshuo Li (1):
      floppy: unregister platform device on add_disk failure

Karl Mehltretter (1):
      floppy: flush pending work before releasing resources on init failure

Yang Xiuwei (1):
      floppy: avoid NULL deref in reset_interrupt when cont is cleared

 drivers/block/floppy.c | 56 ++++++++++++++++++++++++++++++--------------------
 1 file changed, 34 insertions(+), 22 deletions(-)

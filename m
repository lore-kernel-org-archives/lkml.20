Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792979392;
	b=u4yV/XyaW2TV43V4MAc+Y3Sfb6ubSznW1PkgOUugQvX0N3+N5v2XPZ3ARMxf16IskYTl
	 mwmYoS+x7rjc5x6JLXRx49NFfUEb0skRa2c9mmD3S2am3BZsafW2m1VcLe37iu/2rS1Ny
	 HvvOAgd6iYZip/PewLgjSXX6hdQc2aJ/0/WyLWDKhj4zOMB17EKWmCCx6anhPJZV6ABkm
	 XRdDp9Qwngv7JZcZ2i6kQwGzLQ+2Gy1Ss1i1sbscgEe3j0MKHSFaK/mdevb+e8caJvGwP
	 e5KHqOkMpIcCXoKhVWnnqIFHtkqXVYCb7T8kSJ8cEVD6xwwVpyjxAdcPIHV+PyLzIHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792979392;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AN3Hjw/HZft2MXUgGNWgsqw3kkl3NUYJU0ViE8j1aeU=;
	b=x2FHf/OSCyLM2UOrINF/HFipQSISTd3oNsMohWZX6eTrs/qxfy7NdguYgbh1xU1cGRiL
	 mIkhX/+tssL9o32Ev8y1axcUnFoxOeC+UzM9eNlPJ4usAUO8Nw0fCvtshKB9f3zXudrfO
	 rtHbwUblsyMc7FrC7NGANNzGNQZ7mSMyArgMFCpsjGopTP+w1y1wlUbVkeBwfaI8uoJtW
	 Ua/tYAo/+kFbcyyqKkMJk+jWgpfaF25idUMCl0P5Ixx1uO26gMHIqzgYP7chrYJxSnRD6
	 1YsK/HsrxHOd8dQyIzKNI9S5VPT+BA0HWKniHrWRuntttaFz1MVI5Jh5NLOd8KZWtAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=aOD24LJr;
	arc=none smtp.remote-ip=209.85.217.41
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF2C606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:49:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFF2C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=aOD24LJr
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-77bf892b496so763343137.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 18:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792979391; x=1793584191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AN3Hjw/HZft2MXUgGNWgsqw3kkl3NUYJU0ViE8j1aeU=;
        b=aOD24LJrfDvg8u9uruLVXXfxTwTkeGpltStOTXyCoMQ4f/ufxIgEuHjZrUtuhh1uqW
         C9vOMjR1Ag0qZdLVBpZfZtHIUZEzOFE+cbscEh/RqLfrpEfAkkTQa0A8RG07kU+nX/PE
         HBOn9Gc3dNZPPW5ttkJERs9vNZpKtXPasD93QhAYS8mNlqy5RLfbQaIn+xfmT2HKEKFE
         R6+9F+aw/pLhLklHdkzO18ETKTbEiATuBPVNzZcFG+weSyjvEUwtglP4rFCLUV32zFtV
         Yo9GGD9fMYtcS0sWF7gSHAcF4F4cHUzbrwGCv3S4xrD5t6kXuLn1sMb+il0RPOAyclww
         aGYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792979391; x=1793584191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AN3Hjw/HZft2MXUgGNWgsqw3kkl3NUYJU0ViE8j1aeU=;
        b=gX+LJVQSp21BFNbR3w8056MjJ8BLUaAqsmQsfgqL8N98XvKaJ7+LzRPVxPANmPaTD8
         GmMJc5M7qLr3BjHFpirZv46plcsFotS5JCqeJjhLLLsPnbAAtPB+dhm28wmp24vJNOVt
         B6O7AOEl70XAJyQqVDjwwUHQ3OjJ/IN+y36RzKgUwAf8v/iOR+GMRJIfnlUGBDko437V
         /iAa2IDI0fgz0K5/j+CVvYfEBUIBAQd44Eg8R/DczG9rwgucpp00sGp8IKykVHAb50zA
         J3gUrj3VsWiPa2WmuHMImCxSUkuHRHVQu//naC0wmjIpdA4Cdr42WnWYco1UiYXO4PN3
         3thw==
X-Forwarded-Encrypted: i=1; AKwUvBzubm6+OEqcvMAwfIKJM6utDkJcjAW9JphtLiQIMSLH/T2dMSz1P082ZKW8L9JjpAhw+/MGaavMkqK4QFE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLg6pzAvNAroFYo0Ur2wLIlDAxJpo03NVQ5dkyWbIIOrMmsAJF/
	BrvyAYEb20a1mRzy4LuOjP/aRiTNwjg36hIbDvhW24smbfteEp8BnX+SuaBZJPm1fC9bFohx7CU
	/MigP
X-Gm-Gg: AYBFou3VC1czElkvYkNsMisCXx8n40l3iS1GGWtyWGO+aLwDdCkALZ8064nR5hqiWA+
	bdd/07fbNZGKFTTDIdGtCF9l84vxozTiBFYqpOj2fc4q+RjzExy2rskPGwxj1bjb4wDc1dM6Jik
	rPN79WUptjKHYWm1q9D8cnc48AVwOQBRU9EhR9KOHPKzeMtD9XP3Ie09GM3H/54zkpO5zfrLqOm
	UiPpfaNLx4MM+CtgvCUeyR1JRLZTLDUU9jejjO85MdSoAEZQKco4IFDvO9Hlyndog7bOypyuXlr
	xvgJK5PMCKDTfQMX/Rc5aJ0EPebv/xHw34iHODndVjW8zUqkROBDSODuzbD16ASFvVVGX5hKgSk
	MyiBeTluPe/KMh4/D9BtPvzvUzz0HOwDZ5BDnWM/AEduNOEuHDuwdn4rZAYrYv7m+KJtUpEmal/
	eS6Z7B9bCJunm1SqMHYgyPd6rwnqmYtAan3kdUEkiJyyHvbuyia7o7IDfxVccCUMPHP2XPhgvlO
	TrafDcgqifeawlGGfhMmz7gYoa4Voi4vFuzNKR0O4viMM28lc1i0Qn1DqWNnA1QqVTni25VyvOp
	Ap+3FO6omXUd/GIF8ZSXtc2wXoqsfU0dwtCuQstzkQszSGLyT1kOQnPHYONwISmO9UK1pbqcY4V
	k
X-Received: by 2002:a05:6102:5ccc:b0:7cc:2a3c:9a33 with SMTP id ada2fe7eead31-7ce5ce4d7d4mr1365539137.34.1792979390767;
        Sun, 25 Oct 2026 18:49:50 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7ce5df73970sm6099917137.1.2026.10.25.18.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 18:49:50 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	vipinsh@google.com,
	linux-kernel@vger.kernel.org,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	graf@amazon.com
Subject: [PATCH v4 0/3] liveupdate: Add LIVEUPDATE_SESSION_FREEZE ioctl
Date: Sun, 25 Oct 2026 21:49:43 -0400
Message-ID: <20261026014948.162559-1-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
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

Currently, LUO sessions are frozen automatically only inside the
reboot(LINUX_REBOOT_CMD_KEXEC) path, where luo_session_serialize()
iterates through all outgoing sessions under global write locks and
freezes them serially during shutdown.

This series introduces the LIVEUPDATE_SESSION_FREEZE ioctl on session
file descriptors so userspace can freeze a session as soon as it is done
with it, rather than delaying until auto-freeze at kexec time. Because
luo_session_freeze() only acquires the per-session mutex, userspace can
also freeze multiple sessions concurrently in advance, reducing kexec
blackout time.

Once frozen, no further files can be preserved in the session and
subsequent freeze attempts return -EBUSY (or -EINVAL on incoming
sessions). During kexec, already-frozen sessions skip the late
auto-freeze step; if an early-frozen session is closed before kexec, its
files are rolled back via .unfreeze() before being unpreserved.

This series is based on liveupdate/next commit 27be83a12b24 ("Merge
branch 'lu-pci-preservation' into next").

Changelog:
v4:
- Split out a preparatory patch that drops struct luo_file_set_ser *
  from luo_file_freeze() / luo_file_unfreeze() and moves file_set_ser
  handling into luo_session_serialize_one() /
  luo_session_unserialize_one() (Suggested by Mike Rapoport).
- Few more nits from Mike.
v3:
- Renamed session->frozen to session->user_frozen, - Pratyush
- Added Reviewed-by's
v2:
- Rebased onto liveupdate/next (commit 27be83a12b24 ("Merge branch
  'lu-pci-preservation' into next")) and split out early session freeze
  into a standalone series (tmpfs preservation and its per-file user
  argument plumbing were spun out into a separate series).
- Patch 1:
  - Drop struct luo_file_set_ser * from luo_file_freeze() and
    luo_file_unfreeze(), and rename the session helpers to
    luo_session_serialize_one() / luo_session_unserialize_one() so all
    of struct luo_session_ser is populated and cleared in one place
    (Suggested by Pratyush Yadav).
  - Unfreeze the session's files if luo_ucmd_respond() fails in
    luo_session_freeze().
  - Update remaining reboot-only wording in luo_file.c kernel-doc
    comments.
- Patch 2:
  - Add checks verifying that non-zero reserved bits and freezing an
    incoming post-kexec session fail with -EINVAL.
Link: https://lore.kernel.org/all/20261015093816.2438942-1-pasha.tatashin@soleen.com/ # v1

Pasha Tatashin (3):
  liveupdate: Move file_set_ser handling to session serialization
    helpers
  liveupdate: Add LIVEUPDATE_SESSION_FREEZE ioctl to freeze sessions
    early
  selftests: liveupdate: Add tests for LIVEUPDATE_SESSION_FREEZE

 include/linux/liveupdate.h                    |  3 +-
 include/uapi/linux/liveupdate.h               | 25 ++++++
 kernel/liveupdate/luo_file.c                  | 73 +++++++---------
 kernel/liveupdate/luo_internal.h              |  9 +-
 kernel/liveupdate/luo_session.c               | 87 +++++++++++++++----
 mm/memfd_luo.c                                |  5 +-
 .../liveupdate/lib/include/libliveupdate.h    |  1 +
 .../selftests/liveupdate/lib/lu_utils.c       | 10 +++
 .../testing/selftests/liveupdate/liveupdate.c | 45 ++++++++++
 .../selftests/liveupdate/luo_kexec_simple.c   |  8 ++
 10 files changed, 203 insertions(+), 63 deletions(-)

-- 
2.56.0.307.g5fe7bd680c-goog


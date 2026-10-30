Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793379666;
	b=0pxnBeYZ3tp+QehfOILLI9Kpo5ir6e5dZuCWEx97totaKrAvGpJUozhzmuLIzHRxcuuO
	 O2GZ09WAv6CgS5aBRlIdQwyAqLcVRuPYCTPamYrbR7JuIVw38kQ1B+ZlyUDfo/Lc7P+uc
	 EBCiwAsiYBHmsFMmIOXdJzl+QEXRUVhmiH4goyBM0VKzSsXkYDNrks/lKm+BitoLwUi/6
	 XRPA2Prh6yY+CMtKy7jgTszGtbZsjqFkRIMtq99N4ZDy5FxM1ZQSaVrxutXjAJrdR+Ysu
	 6ajIDItuKXKDO0kABT/Lm+Hzg0U2h0ueekeWitWab0rGNVgLhaXYbau9j+Dvk/H8XdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793379666;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=7N/AcTlGe83vxTjpCzdB0J4XQ6LBuOM/UG4MzfOUgIc=;
	b=ZkI6jVda0ZIBpOXa12dGm++lZK8TRkyNP5cBj5GjkgRZ5i1tLU9x9lavUzdfAaShe4cm
	 uuXoO7mhITPNIRDSrLiKoe5Sn2YYZ2QfemclvbY/lQbBXgwO1LOBywdUBzvNZLh2Oz3oG
	 bRdBOHf1w1RfmKtfkHRkzx+NskniosfLVGgQJnElyPvxBkhHhvLOG0NfLkdaytHd5yPVG
	 2KvpTt+OsEjsl7kgHbio5c1dnZgno9bvhuR5vE6Uqql2GFtX2vbEY9zKj16hAMwVYwQOX
	 VtjDEGxo42BwCOe2uejyj5GYXv8dfJL0yUoysgrYKmYhZFvQjHlsmiAKyPhB3KJtKAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yM5w6leR;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDDE606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:01:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FDDE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yM5w6leR
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso907197f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793379665; x=1793984465; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7N/AcTlGe83vxTjpCzdB0J4XQ6LBuOM/UG4MzfOUgIc=;
        b=yM5w6leRa2ChVRYGNHPLUzxT0TAjhGmbXR8T1nYEpFhvp4B/17T+8Y0Mmgl947BoHi
         yIQu7/Kce8YxZ6JlFCmRgLq/uSmLz9w/g1+ay8NwtFr/Scz4/k7FEIy8FWjsC4YQKVwC
         1yKOJeoVEVBj6t0yOg17L57HzeKjkxrvNTXgqLXRAVxODk6bF8pXW7v+VeqcPMb9mAA5
         tBjuiLt0eP8Z9Nug0IjwerEqTlUnc8xWLQjJ63TM5TuSqXn2tSYzh/3zCeQEakclpXRe
         AE6l47N4xW22MwRCqXuLYh6ig3+jXoIxR9vKcEyOZ63YMAae7g1/E1L28RXR0/UawXHL
         Ryeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793379665; x=1793984465;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7N/AcTlGe83vxTjpCzdB0J4XQ6LBuOM/UG4MzfOUgIc=;
        b=ttJjPjrCEdxqeCcV6xuURcgad4pmicPtacoPSFZV2ybK1d1he8hh563SgVutzHR5mw
         MsTcfT7y86tWuSaUGlFAw1sK5yoKxe8O4bhvpQieCDhF9vfW6YzCuHGEGoPg2a9/Sau7
         LMgjUl37G5xT0MnoeHtWpatizK/1PE5KImVFrl/yMH/L3609d+U7/sfLrD6Su9WHTpvq
         41RERpAH/1pR83eJDiFPkU6KDTEB8E6CMWIUHI23b97KP6XkKKGl+d/9NL5jrTEaSodc
         TosxnMRO2bNJNbqm+mvlPvKw3AW1zBStAcNcqCJNuUMWC0OPi2E/1/Sj9/S6gt7EWbaO
         fTrQ==
X-Forwarded-Encrypted: i=1; AKwUvBzqupifbeXCMdXUkd3PwllLRyS5Nr0C4xgAvUAMitFLvlUODfmqnEikWucp9ryCVVjjEGCgdp4MYwAnEdE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKU0D6FcxoAz2rKHoSVmBN59Uk9tIkdN6ePiyKZr2a7O0dz5A51
	77H8v5frekvdWopA8RwcyRG+6alqfpWcUA+GmHnhw50uCLkwafMFViO0
X-Gm-Gg: AYBFou11lpKm5a74LaVX87zJopz+JBpAdx32W3DbUWisNdthBQlc+rbDG9xspdua1l6
	7YymjbyVxZJ+3lTkEMnR9u2Rm7+Zd5T8eo3g3iDlqz5MIVcaPV81PL4w1E91V7yKXjrg10d2CAX
	i0tap2b0+eYajRADvCj6rmqWB7z3d50i6lj5ivNT5hIatT9famK2aHhW3bnjvkOeciRJHj3i6wG
	m+GtOUx9KYaehSkrwPyTriM32iVzUoZfHwwqPNfT3e62QeNH2n8YfEUH33fnnDDpQ8WXT3aVhue
	nJRMzwLG/aRz4YbkhW6zlXtcSvjrPbV+XG+fHscik0MP5pL+PEbt7zxrQ8xZiaR56M1Qp2fkFgb
	EAsqr2Lqn9Q8YJwcvdrYk5/0e433o0/zsmSk/89hq0yYOpPQSX7yrHV9Bi1sAtzznEopPew+Kw9
	5nNeXSWlityEaroq1toqop4fQvv/olrNCcUGLrjF0l+JIL9XDkaWXnKKSgsbMurwO19RwwhMKq4
	MCY8VKldYLjI3+BrKfn60GhzpChwc3fotIn9pN05BEG1Kq7VhI+uPFF+aj+/KNC17TXWfUwAtt5
	cToPRuD9cBP8uw+gUrKOYz4b3s89hE21Y3v+j3F5ueJvdaxDDPVhKBG0Hbcca+ai0Q==
X-Received: by 2002:a05:600c:468b:b0:4a1:e225:b122 with SMTP id 5b1f17b1804b1-4ac182dcb7amr64266985e9.14.1793379664392;
        Fri, 30 Oct 2026 10:01:04 -0700 (PDT)
Received: from unix.. (244.red-81-44-253.staticip.rima-tde.net. [81.44.253.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac0950d533sm41126555e9.3.2026.10.30.10.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:01:03 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/1] selftests/arm64: GCS must survive io_uring SQPOLL worker exit
Date: Fri, 30 Oct 2026 14:00:45 -0300
Message-ID: <20261030170046.439736-1-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179330742036.2531571.12603232226357262067.b4-ty@b4>
References: <179330742036.2531571.12603232226357262067.b4-ty@b4>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

As suggested, a separate kselftest for the io_uring/SQPOLL worker
path that gcs_reset_thread() also covers.

SQPOLL is create_io_thread() (args->fn + CLONE_VM). Without the reset,
worker exit unmaps the parent's GCS. The test waits for iou-sqp-* to
leave /proc/self/task after close (teardown is async), then checks the
parent ss VMA count.

QEMU virt/max: pass with the reset; SIGSEGV on an unpatched kernel.

Iván Ezequiel Rodriguez (1):
  selftests/arm64: GCS must survive io_uring SQPOLL worker exit

 tools/testing/selftests/arm64/gcs/Makefile    |   2 +-
 .../selftests/arm64/gcs/gcs-uring-worker.c    | 254 ++++++++++++++++++
 2 files changed, 255 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/arm64/gcs/gcs-uring-worker.c

-- 
2.43.0


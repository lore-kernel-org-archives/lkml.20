Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9484D2FDC28
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 01:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788572226; cv=none; b=j6doF+jdv4VTxFvLFPJhtl3kHSsLfI1O+iT7PPrvTGzlsO9qwB43nTm5DMD1JOo//LRNua8G68pfLZDMsbeKXB99/DJRJR8bwo4oeSB+Hkywd0RY5o2c/Dof0iM1UVzUd6d78ZWbnpuArVUTadrpXLVLXuNc05YzOfC+DIUolvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788572226; c=relaxed/simple;
	bh=2+R38dE/rYL18jObAqOL2LUQT4XT2rnhSc5Wn0ZdOug=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iSy/FFhWoOqSvwxrnLqIidxHoOQpDnKO8Hyd1//iTQwMySngV2IMe1d8FM8KdgaIE0NUTA7CZqxECb98GFtQLEbJNickSXWFlFGBUcs7ik6moMgLiMbn84MJ/vj3zQPo4Skf1k129/QkRZNuoKzdDicS1+XPSq8fZ+n0ahqiPu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lpyE5uLt; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lpyE5uLt"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49cca4ffdcfso13367355e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 18:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788572223; x=1789177023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5E9ZNXmH/bEcRkt+bIVyhckBwD8jjU50Tm6Jae4Vz+U=;
        b=lpyE5uLtS4ohR0tXuo/C0TpO4DRtGfStF2HL83qdO5RVCwq/+q9a+JnRURK3CNCX99
         h0Y+3VWH79pPKcX+S7LFTsWfjQEoZLz81ScgRoHHDqrh1mfDJPJbUW/6HgrF0SB8AusJ
         yw2Hp4l57rRxSXWdmxedVozGRbXFiNp5fX0L7ASTM30xC4XLmecpYAlNfjr0BFksjMkq
         hXBM5HG4gArq0fZi7bm5GPE04mXXtncbJdnDh1r9mOTMCBw+Gd0pVrpeBC0pnXXAwsCn
         y8XDMkRcreHRpNL7E5n1AxzTr9ZPoLAgbK+4+8hXanyVI5heDp59Nulf8S3udn5CJGdw
         HGxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788572223; x=1789177023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5E9ZNXmH/bEcRkt+bIVyhckBwD8jjU50Tm6Jae4Vz+U=;
        b=CcLlGDQ9Oz0MTqdocm51++jcny1HJNPv8BFGATmgkTllQ//XBD9a1hKCsXGGtaDenC
         t2feBuosF7zpw9n2NVS621px/8+CvF1a9U1IpKm3x5nqEvfaQPngIs7XKAiHRi82JqQw
         d/nX+92j3oCeUxY3XUeqsDMdQS44NlpP61T2tPgLo/JDHfeGTRHo6A4mYJz7ZFTEyqLV
         tv2+swrG4cHFSi+58DRgdaly7P/fhESqmlDAGa88MVF2A8Wix8MXyR2fevVU4/o9OMVw
         5htVEEGK0mRxKopSZvRB+FN20KpYed227V+3DWdCxluZnH6gYcfEf9658skPiAUdsZZF
         m1MQ==
X-Forwarded-Encrypted: i=1; AKwUvByb2MFnwfEM8rWEaFu9AywpHRXLpoiXOU9iVC3qNThDUhxc9T+GWtKMk1Mwz1Yf4nCan780rKo3DkkVTSw=@vger.kernel.org
X-Gm-Message-State: AFuF++kuN/46o4POfb2hfvL4AGCjFp/1DyY1t/ZX4kiRh3/dUGNHuWH3
	9hhAbB62GxG4G7ZewnyVsSeRU6THo4g87osgmXODfHM4duzFZ15hRyklocPTRoBk
X-Gm-Gg: AYBFou0zHV8DEk45gw2Kq0WiUSa3+7w2xFFvmCSAzhePx1U3XsEzlqgkOkeDgYCkwQx
	W4qllfXkcFNUP7UgkFmjP1zLgTbPNkP8/km7OUIgy9yxbC846yAUwA6mv9uP3AAQXxHJgUbwhve
	p9rKGTPVgTVtdGGa1YLRAH6OFU+yZu7Y9AkHYQQO70uuSyEApwyb7ObHITgmf6m1TlH4CiNZYB0
	TufbCH6wRy9/UdNBwP5bP4AfFN1W7FQPa5OO9fG25aNee0CE/ckqV2RbBUM3KWt05rudQMaPZLq
	CpI6raobEGdPABffvzP5COLzi5JpQqFRQQgF1p/OuCN42Bn73ExH9oaryieyEnC5kG7O4UlvgYO
	m16BBxnX2mFvhzspMtP0OG1WaBrFP/eVt5EyUlkGQIh/H8jz/W3ioSmqMc8lqBA0t5xfYLjtuld
	m84/p0NSh73RvR2NWdVlPDuVrDQsQ7MQGDB/CUwGXbdw0b0j4XsjARLaAVVr6RPxTFKQvhFapmU
	OaoentQgvoFZA4p/VUi2S+3YspOXReeUNlslO8yHTU6kvnAr5WA2r7LTfaZjFdTk2fLK9bwxWYC
	KfEr/absFG51GH6KbCSNhZFjgjMY+p9M8hLwokYQTvQJFn4+OgV/GrQdYE+NPZgGe7c=
X-Received: by 2002:a05:600c:8b25:b0:49c:fc6e:a3da with SMTP id 5b1f17b1804b1-49cfc6ea704mr72161775e9.25.1788572222669;
        Fri, 04 Sep 2026 18:37:02 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4f2-6901-14a0-23ad-a35e-aa8c.310.pool.telefonica.de. [2a02:3100:a4f2:6901:14a0:23ad:a35e:aa8c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf75ce49esm185612945e9.1.2026.09.04.18.37.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 04 Sep 2026 18:37:02 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Kees Cook <kees@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	James Morris <jamorris@linux.microsoft.com>,
	Ke Wu <mikewu@google.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] loadpin: Fix stale KEXEC_VERIFY_SIG reference in documentation
Date: Sat,  5 Sep 2026 03:36:55 +0200
Message-Id: <20260905013655.58665-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 99d5cadfde2b ("kexec_file: split KEXEC_VERIFY_SIG into KEXEC_SIG
and KEXEC_SIG_FORCE") removed CONFIG_KEXEC_VERIFY_SIG but left the
LoadPin documentation pointing at it. Refer to CONFIG_KEXEC_SIG instead.

While at it, clean up the grammar of the sentence.

Fixes: 99d5cadfde2b ("kexec_file: split KEXEC_VERIFY_SIG into KEXEC_SIG and KEXEC_SIG_FORCE")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/admin-guide/LSM/LoadPin.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/LSM/LoadPin.rst b/Documentation/admin-guide/LSM/LoadPin.rst
index dd3ca68b5df1..a90fd9dac960 100644
--- a/Documentation/admin-guide/LSM/LoadPin.rst
+++ b/Documentation/admin-guide/LSM/LoadPin.rst
@@ -23,9 +23,9 @@ sysctl allows for easy testing on systems with a mutable filesystem.)
 It's also possible to exclude specific file types from LoadPin using kernel
 command line option "``loadpin.exclude``". By default, all files are
 included, but they can be excluded using kernel command line option such
-as "``loadpin.exclude=kernel-module,kexec-image``". This allows to use
+as "``loadpin.exclude=kernel-module,kexec-image``". This allows using
 different mechanisms such as ``CONFIG_MODULE_SIG`` and
-``CONFIG_KEXEC_VERIFY_SIG`` to verify kernel module and kernel image while
-still use LoadPin to protect the integrity of other files kernel loads. The
-full list of valid file types can be found in ``kernel_read_file_str``
-defined in ``include/linux/kernel_read_file.h``.
+``CONFIG_KEXEC_SIG`` to verify kernel modules and kernel images while
+still using LoadPin to protect the integrity of other files the kernel
+loads. The full list of valid file types can be found in
+``kernel_read_file_str`` defined in ``include/linux/kernel_read_file.h``.
-- 
2.53.0

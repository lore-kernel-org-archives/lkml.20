Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3353DE44C
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787911511; cv=none; b=g2k/wjDpWWzvVsgCOqtTPkRhbd0gKfHLUt7/Kg486mJj4Oj0AX7IveOSkzgwi1M1G58KAt2E5jDbA946KqeD8lmZikKLJwBiohjthyGvMgvXj1tPAMyHfGHtXXfpUPq94uInRwrcuB7AJF0CCSfRc73YTJBfmqIUP7xuutdy1RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787911511; c=relaxed/simple;
	bh=mILYzbTZ2GaDj3TTz42yyBO/Sxo3TDeaWaMVqnGTeyY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U7G1Xd/Bhfhwu2YQB7ixf8zc0pb5ef7i7Mxgiv9i03gy2HsaGMwwg7s5flE9JCSkKErz9MgJprWscKKYfO4vJX+xFpN+dnd1cocojV+Qek5FvgihCzHNjU0Xp+9ABChfx5GbQ/sX3UNW5GlWLSAytvx7Ys9lHaDUZTinqnCfyuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gCJXTIHF; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gCJXTIHF"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-45837e52d8aso1035849fac.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 03:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787911509; x=1788516309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wxDSwI58Hg9WLzpMbIoMXB8tq4Si1PHsyjAYb0WqTqM=;
        b=gCJXTIHFlYrpqHmuhoIy691VZ4ySFfelUEBK32GuFyZIgEYnFKp43uFSsnoVX8ufxM
         84lqa8IqbOGRfmDAfoC/IJ9S6TQk8d2k8cE7Or6kBqDspjzGSZzIDBr5lg7PzHw4mY3O
         pDtTV5rbrqJ1c8XTqWnubZm3ra9OLaijLzY43d3b9V8BM3ACnHlY0EOMGcYDavnfy1mP
         uK17qCdfi8G8ZfW2uy6K8AAMUGm+LLGl5z9pXCXwwbyADz4YTW2IRSpmBkYc6FrPjLlb
         66lFNMQS3IWgoNK0/fhok4L5GIanOzEJlFg+L4PbVTB/9/zSDDDN79U/WqnDT1K/kasL
         486g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787911509; x=1788516309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wxDSwI58Hg9WLzpMbIoMXB8tq4Si1PHsyjAYb0WqTqM=;
        b=lIsp6GxcgZid3OSDAtmV1yMT787slaCF0ykaKVDEm4juLEfXdUhEW5dUrfVXN5JecC
         2F4lvDrAXJylG9yEeqyslm3X0HspiAQOTeRSOv9na4cD4XZwMHYv1nu2D+SExNxQyqsO
         ma8RIUB086s+BL3BWmkAuw4OiQUJ2j59PKyH4vgCWOhx1NV1dR+Gagtfpn18FWFK8S8u
         m5LGLYUxlGujFe6qaQa2Lw/lTGytLxgjJC3lcrdkJGPv+cFLTjgRwjW3UUiNNEhvxuBu
         mWZpYxTYeGH+tRtg89kqUiDf6ljpaVyTNqYt7hZQKQGRxRn4lvt/SJlM0tFoM8K7hI4M
         I9nA==
X-Gm-Message-State: AFuF++nRFkiBBx4BC9es3IhCpu5SoNHzpeZ9Iqy4i5PXUrVHfoyaKF7e
	utvjTh5IrTwln96iybYv+RWU51l5Eu7njMIIYBUJ+3zwRR3+80SA7odEdJJJIg==
X-Gm-Gg: AR+sD12ZYH+r5MndIQjmBWYq6xUq2efzRVf9DJ3K2oxYkwnUBM2HT3bJCm+bBFieq1P
	CZoRu2SubQm4K0Qkn8ogRrDHYH7O5p73QWKChMGXNj1wXh1c58uapnwplA3OKHLiZpUFtQ6IS1x
	W3jxqW45iPtaY8fBh4FlOExGuD4Jm2KBGDbI7cBkLxjRrb2qC7ioLxT5qcy5hqSfiuIP6jIuBI3
	1Jyd6Ar2CgWmhvdIKo8wgKuOmcxGrJborz8Vc0U51o124mr2LCOTRHQKQPdyhwPwZIdpK4btHNr
	1Aoy5uMcZg7zSmJG0DURdXfDZEHnVsMKCJUbhli08tcwNQez2u6c6PKadTZ8i9M2oDJV0oDBw/8
	hPHMkl4ryKRbqnrOOj4C0RsbiD+sKFaMVI4qvyK8MJ3JFXcISQddjZtHWQ4HafriqT3fIebJlI7
	T39vk2RmWIKjz62rItNYjFRo+GpyJG55araqwEsiAze23Cm1j2SH2Tw0ImP6XWbbafZmDqqQYND
	0Q637mo1HCPmF+U+CitgeSwHtnk9cjx/tFHJDN3N+buk92hd0QwaSeMcseI80GtLAiWU3uvDAKz
	s1txj+c=
X-Received: by 2002:a05:6820:f0c:b0:6b1:7798:a80e with SMTP id 006d021491bc7-6b1c63f392emr5311434eaf.6.1787911508963;
        Fri, 28 Aug 2026 03:05:08 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net ([2601:647:4d7e:c9e0:ca98:dcb5:85a9:f03f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d3fdf6sm5863108c88.6.2026.08.28.03.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 03:05:08 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>
Subject: [PULL 0/3] xtensa updates for v7.3
Date: Fri, 28 Aug 2026 03:04:55 -0700
Message-ID: <20260828100455.1303506-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

please pull the following updates for the Xtensa architecture.

The following changes since commit 028ef9c96e96197026887c0f092424679298aae8:

  Linux 7.0 (2026-04-12 13:48:06 -0700)

are available in the Git repository at:

  https://github.com/jcmvbkbc/linux-xtensa.git tags/xtensa-20260828

for you to fetch changes up to eb049bdbf2b98d103d93daef44a5e1a0164d01eb:

  xtensa: remove unused setup_profiling_timer function (2026-08-24 05:16:01 -0700)

----------------------------------------------------------------
Xtensa updates for v7.3

- use strnlen() to improve iss_console_write()
- remove unused function setup_profiling_timer()
- fix CONFIG_XTENSA_CALIBRATE_CCOUNT macro name in comment

----------------------------------------------------------------
Anthony Iliopoulos (1):
      xtensa: remove unused setup_profiling_timer function

Ethan Nelson-Moore (1):
      xtensa: correct CONFIG_XTENSA_CALIBRATE_CCOUNT macro name in comment

Thorsten Blum (1):
      tty: xtensa/iss: use strnlen to improve iss_console_write

 arch/xtensa/include/asm/platform.h  | 2 +-
 arch/xtensa/kernel/smp.c            | 7 -------
 arch/xtensa/kernel/time.c           | 1 -
 arch/xtensa/platforms/iss/console.c | 5 +++--
 4 files changed, 4 insertions(+), 11 deletions(-)

-- 
Thanks.
-- Max

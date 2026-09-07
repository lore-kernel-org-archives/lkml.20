Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEAD63932C3
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788799180; cv=none; b=qmvp1rFRUW4i/Wzo1OxO+CC/2RB94/ofh3sTCgDYM6QKc5knC11xZb/qh0TbUn10MRICmP1E/0KltCgkKh2JKO81LWR/5qMmPZQv82q8K2DIzY3aAh3u6KQ9iG2OanOQeINlXRXv/6s3SVwkVZTtO2yCwwmon1ScTjk0H+12dvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788799180; c=relaxed/simple;
	bh=JScLvDY1v4ZXDmdRrVKEysuuyxpgWjgoIm5gZeod+cc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oqexmywoCainQTtjdOKZsdyvgFti2oHwwvuw4oJ8S8C3JfD8c3zjaiN+s2cm7x+QGdl6QQL34/ZPyWmxCxd/JcXWJflOysCrNcNKpWHlomHYFBbTj8Pjs0OK5VfvjGpUvOcwYJ5I3eDU0tN6xawVKQo1QqWlYSP/+1ixY573DZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gZrfW8Fd; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gZrfW8Fd"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c2637dd37c1so236838366b.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 09:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788799177; x=1789403977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PtaQqVSlZuFX18DeVPVqwMKwClza0Yn6Bnu05r8m2bg=;
        b=gZrfW8FdDX8V0jv9m6KpwNKdrnt4lHPBlDsIEuo/LaVewlK1+CvQs/UHN3ZaPYfVsB
         HJV0VZeEyNTKTUF087+sbO7spEpAXS/Wdm891jOjqbSH6BQqgJidW5ZSKVQySIHqznzL
         TmcqLdrSRymDQyBPMPNnGQO304ljoODI0Y8GTIRHbVWtOrjLtP1+0WOJaEfWL7GMGm/r
         Vg461isbIpI8SY6exvzD94m+GsyO7R1yU3B4gwDNhGRsdBqU89KyzqMj4iHn74mJF8ds
         5wF45BYdDxtn8FLsfSh6dFcMxuS9vxBnuLUqimygEoRTXGHfMN4OcsvXS5eBvzPdTHbT
         WciQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788799177; x=1789403977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PtaQqVSlZuFX18DeVPVqwMKwClza0Yn6Bnu05r8m2bg=;
        b=nJoGlyv/OMUKykziE0W5kddwa9JveeowcyMEBJqcOfJ7IsiLqr+HPlKLCHtVKVS4dh
         LZR6qCRJvatpuJhE2TSjfzLPpifxORZ9hXlDKvsFK8TTFniRL0o4/EfKwuvbx4/aAajy
         JiE146MMfNNxA7kmy3QWqfEZCUxfaLz090M0txWhvV7h+HaOh8c7e3D7ir+ximo9lTPK
         E0qm36QEeArtQsMlBSzUh19UVBD+3G+tsfYKXgL6QMnX2199vcHJRE9EjZw4gK2yRfpj
         j4C2B8iIIfELAGZxd233ixkD7os4kLHwA1zWrALjsAzmosOtXBkQ3kdx8nWWpysBpRn2
         B8VQ==
X-Forwarded-Encrypted: i=1; AKwUvBxT4oVPEFFrzre8sVl2bQNgX/nvolupzKK4JtTS3WHerBeBBa47ZJ7d0Oo7WlqmxMjYhsVmDiFyW3MjDNI=@vger.kernel.org
X-Gm-Message-State: AFuF++n3wj5rEugQFKfbFHxIwDLXA4u/sksYUB+KkE9SGFUMfouyprWx
	AA9Mx5UW5LJNnBegMYiVAv+ywYILtpRHxzXQYl8Hxorp5xjkL+1wAcFh
X-Gm-Gg: AYBFou14oPh3hDrRF8fPAkIn8EgXyt+4HzXid3NqFdeVXmpDJGQBxnIZcma5JUeHngz
	HqjJUhHr3lKAvX30xOWBh5ekDfjRWgAmpZaEAPuoCFOdbbKZbV7h8IwOFlb3HCok7/4YTp6e4Pv
	otbSVvBz6kSMhq+DpFBWHmyQoy2Hq6SP8GSdawl0PoOuz9ozprAKqHnumf9BX4JA5TDTfxY5bVa
	4328eTmeE1zPeivuGsL3VS/61vxvBBE1xzlqF/SkI0u7D4jeHUUIEuLBgJ9Z3WMm740AG88/19I
	KC9FH/SoVqFhPkmgDGd7EQQbs+QZm7bWcGu7ViboPu8F2dxgkX7Jsev05u8f2BM1IdDBCe1obGz
	qC7yUhP2v5gSxEv0CxX3MPCRTMucnEQnVs3CzLSoG9SHFZd8utEN9KY8wx93B0cQlUdSYl2YejH
	LPZ0sMCxvkkVcyHBdTofsMNEEP89MLfRg1UIEFbwQicU5G+xr4sL3z/yVO+S4cGe+FJAzB4vnzP
	Md5ychj0A==
X-Received: by 2002:a17:907:6ea3:b0:c26:1649:47b6 with SMTP id a640c23a62f3a-c261649567dmr733976366b.44.1788799176674;
        Mon, 07 Sep 2026 09:39:36 -0700 (PDT)
Received: from grower.astralinux.ru ([82.22.172.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d4a8b89sm483434766b.10.2026.09.07.09.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 09:39:36 -0700 (PDT)
From: Alexander Martyniuk <alexevgmart@gmail.com>
To: alexevgmart@gmail.com,
	stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: karolherbst@gmail.com,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	mhiramat@kernel.org,
	mingo@kernel.org,
	nouveau@lists.freedesktop.org,
	ppaalanen@gmail.com,
	rostedt@goodmis.org,
	tglx@linutronix.de,
	Ingo Molnar <mingo@elte.hu>,
	linux-trace-kernel@vger.kernel.org
Subject: [PATCH v2 5.15/6.1/6.6 0/2] tracing/mmiotrace: Add NULL check for mmio_trace_array in logging functions
Date: Mon,  7 Sep 2026 19:39:17 +0300
Message-ID: <20260907163919.183961-1-alexevgmart@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902122613.442176-1-alexevgmart@gmail.com>
References: <20260902122613.442176-1-alexevgmart@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Backport fix for CVE-2026-80689.

Masami Hiramatsu (Google) (1):
  tracing/mmiotrace: Add NULL check for mmio_trace_array in logging
    functions

Steven Rostedt (1):
  tracing/mmiotrace: Remove reference to unused per CPU data pointer

 kernel/trace/trace_mmiotrace.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

-- 
2.43.0


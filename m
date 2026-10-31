Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.161
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793483826;
	b=q8ePlygHNOpy9jQLtcIIDHelJbYJxa2FgsvqJf/itv2DTx0mNnRypImA1tSZdxMl+GEl
	 MbrPRMxvGxe8pW8siacmbU3nzOsSmhwAiSeo6N7f69eQWfjhTCVtJokEIn+z6via++6DB
	 K39yv8ZtttNg0zyAlitj2/YnmIY+oAhO+fo3LlPt239bS3ov4PmAu1ODVug8p1AK0Qd9l
	 5emtDT+LkULtU/M0tJVSEerPr012n2fVm+aINBY5qzwboBPB33wVP+/7QfM8X8uP2Qv4k
	 +Kbeix24E4bpCRX0Z51yJ9hW14tErgBB8VQhrjzpYdaZjlew3k/JNzWhujf3p6uJPTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793483826;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Rspamd-Queue-Id;
	bh=qfzGNiaYyEMORFtY8Ei8nisce4Apsfe/vB+EPdpQ9as=;
	b=43UkASQe8eMlBt+VQ3FvfqOGC8NG45F1sWj5dsom7iyogRWz5KZ3RwXTg4vMxNx8fCO/
	 LbnXup6RgGmPUgnTNiaMxUcaT2ewUw3VYwEWG7KjJrs7SwU8vn3XCzOadQEXojxbS+aD4
	 tadMHTl+e4HUeMQhgiv40JmlpFjmsipaGvNVJIXRHoODgGCSVrjr80JYn/9puR0fvHjlF
	 F4/rvuKjnSE9TQ5nj2IBsfwfYe/dmqsWBGTwy4uZNXD+i/pwXOaGLkzTPpxrdw1fc8TOk
	 ng+82H9VHN0qENNkegEQSq7Zf9N+263rodywYepnnUnPtM33difOKVpy4Y9k6DGHVPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hsal.es;
	spf=pass smtp.mailfrom=hsal.es;
	dkim=pass header.d=hsal.es header.i=@hsal.es header.a=rsa-sha256 header.s=MBO0001 header.b="oJNrw0X/";
	arc=none smtp.remote-ip=80.241.56.161
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB63606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 21:57:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DB63606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hsal.es
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hsal.es
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hsal.es header.i=@hsal.es header.a=rsa-sha256 header.s=MBO0001 header.b=oJNrw0X/
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4jHBdV2QjqzKp1j;
	Sat, 31 Oct 2026 22:57:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hsal.es; s=MBO0001;
	t=1793483822;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qfzGNiaYyEMORFtY8Ei8nisce4Apsfe/vB+EPdpQ9as=;
	b=oJNrw0X/3EPwm/RCRHmlI+8LXbSCRHtnE2dgRvG9xfZVAWvj8mWqDOMk4xIA+Ct2EQWNJo
	v+kojkhkPymYGzSKX/OOyylVmeLuebPHrikhvIt43UVjjWHKtns1wjIhmz9ivSSggxBg4l
	+XET4ZQPRZCgodhTOe8vWtNkKTnjC7H4nPGeEKCD3JmmjH/2bo0zk5HKw71+JCNKMDZLxy
	NrN9JyVEwhi/D22ZMvSNCrN57qA54ELPhstyI6Ln/5uCwn6Ay9uCkL2ylrQlf4gmFSlETw
	JlDkElprXz/auyw9LzzuCjtyouO67MhYv8YVc9vVw/8t/Lsu85ZroXaZ+fKdTw==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of hugo@hsal.es designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=hugo@hsal.es
From: Hugo Sales <hugo@hsal.es>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] drm/client: Clear stale cmdline modes before the 1024x768 clone pass
Date: Sat, 31 Oct 2026 21:56:58 +0000
Message-ID: <20261031215700.1077873-1-hugo@hsal.es>
X-Mailer: git-send-email 2.56.0
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
X-Rspamd-Queue-Id: 4jHBdV2QjqzKp1j

drm_client_target_cloned() first tries to clone with the mode each
connector got from the kernel's video= option, then falls back to
1024x768 on every connector. The fallback keeps the modes the first
pass left behind, so a connector that has a video= mode set and no
1024x768 mode can make it report a clone with modes that differ. On a
single-CRTC device one connector then gets no CRTC

Patch 1 frees those modes before the fallback. Patch 2 adds a KUnit
test that fails without it

Sashiko flagged this while reviewing my fbdev probe series [1]. I
haven't hit it on hardware: it needs a single-CRTC device with two
connected outputs and video= set on only some of them, and it only shows
on the fbdev console. The KUnit test reproduces it, but how often it
happens on real systems is unconfirmed

[1] https://lore.kernel.org/all/20261024165355.2782145-1-hugo@hsal.es/

Hugo Sales (2):
  drm/client: Clear cmdline modes before the 1024x768 clone pass
  drm/tests: client-modeset: Test cloning with video= on one connector

 drivers/gpu/drm/drm_client_modeset.c          |   2 +
 .../gpu/drm/tests/drm_client_modeset_test.c   | 109 +++++++++++++++++-
 2 files changed, 110 insertions(+), 1 deletion(-)


base-commit: a1e63ab695ad76850ab9787b9eb6aab695dc2965
-- 
2.56.0


Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907EC472555
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 17:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791136114; cv=none; b=N8gQeNkVKIIHG4Yz+TcLCtjWqceQim+K0NdbYo8E2GYzC6WlBBiruT3E/wuMawwWU7uujz5lg+CSuSdLaDru8TBFZYi6mBl838QKfzfn4elAa6nKhyt+zrbmZ7vJxNhMPxBbm+3QTSbXz+X8jQ3mbKBKszbl0dsbilXbSQ8k9Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791136114; c=relaxed/simple;
	bh=G72FOe6vB52SJZXIcRuK/7ZBI/HZrs7VTHWt5fH0Adc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OaQWVRvaeq7MpGG6i4Ug9PB5CyFWNxbKdPTOA97Py9nYrnjmWHPtxWGCFhvQ7kI/SO5kt0rDbnBFSfNIk28IcILmB5aW4hyuEc+R57MGqz9dEcVlnqWzhWF+ariaJ9/Szg3YfQjku1o0YFE2Svn5bO4s5+2JqcIKU5xezrtonIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=db3OKAga; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="db3OKAga"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34c0b552ccfso648917eec.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 10:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791136110; x=1791740910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hSyonq7GuE136y5TdaelJvSFEDKLphkXWnoinxX8KQM=;
        b=db3OKAgapdcadvc3knCWKgghj5dhmac/kiLXnYFqjMR+WV7dN4dg2DRm9FdEzs913E
         7zP1i44OQepwP3aEmYfJR7/iCNuEr171sk4CIZGQ5ZBG5CKY9FP3tBzDN6PiBj3r4MDn
         eDFOI+JdJ7hpW9q67+UY12M88S6Y5qMzDWBJ87Nt9T8i2V0vyeY73ebfQW+NhP/WTD3o
         PhblTvnarUrJhfSLSpKI9kTmyjIWOxmuLjBRAiYmOJjl6jMADk02aWTB2/B3NtUpfKVs
         wkl1n4xabRsu0XuVDeJJJLyWowh1dNd4r25mim1mSBsUz1c0U+bdtcsXgl+fgZItqJ5n
         0zXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791136110; x=1791740910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hSyonq7GuE136y5TdaelJvSFEDKLphkXWnoinxX8KQM=;
        b=orwxslYv/TwczN7qTSKrKwaVO4RU1AhneCuOPC6FVte4iDUNxBcoAHq0UDFLr7KAtb
         D95gIyWaKYCcbnUgGr6e9fGJ6eQpUyfcY+EM/X8vZ/2Q/lyBNAXw3MtXyLx2oX2YBlbA
         7HFQ9C6zzRfdEHJNib46V6qw5blsR5RuYL55k1HVF0HLq5C/djcOfjaBHaaKFR+jb8L1
         2qZUDPDe+qiTAZvgcSHGsrCvRJObN5X+xe+VjDMbW6JIhnCD1aZD5KHYonLQFVaapdTq
         vCtb1jz46oKYcoTKcGFptvWSJk60ih4YlvN0LoEldgO3UDvfYeacZ8IcKzq/fG6pYBCP
         HBhQ==
X-Forwarded-Encrypted: i=1; AKwUvBxzAK9ZuLWbYT2m+jnOiGoMopTU/Ayw+vPkHCzhw6RWruZw9JOq14HpkopIw3QXRwUr+9UFa7lsCHay3Fs=@vger.kernel.org
X-Gm-Message-State: AFuF++mOfbd0abXHJbuWPTRaznOSrBmVM2emkI5qO7DG5RUbIongLz7u
	8yvI+dP71b7nL27gVaruZUUbpcaGO6HCirQasbz8grN/9vnDaKBkdLb6
X-Gm-Gg: AYBFou0yxAeRfyTfXc/nPmJDs3o1crPjpYJCroKZlovIFJl8vT3xsrlkjOJr1FDGlvW
	75Tut2KmBpU+kbecW/SpL/eQvwbe6hGdNuJDuuV/3Y/XvdO7qM0kKdelcctpAGFX7tVplAnBu6P
	blySh7+HLNeHrYBXK+ObqSnsBp9cu56HJsquRT6jH7e4OxgkcMxw5McVu0leqXwel2aLoX8I90f
	dl64E5GjdVoBM7IbMVCYaJ29Dj9fqETSTxkymqafcq2bZCR90enXDQ8aHqA4KSKSIrkVYexQ+Yv
	LGrPhZ5hWsX9RG2NjpYBKIEQwY2d45N5VQBkWhYYkv2DfJl/wShvVWnrtuzrA0wCQzEd8Js58a6
	jKKABNfIoofNydKtVZn4+/7GgkrZglu0MZ/KK+iGLWHbIf4DEw8GbvZ9ZpZ/bGYGfDN6gTPmOFY
	M1YMe6p5L96HYLnYX+Grh8/4Cy0Vp1uabx8hYyZj7wze9akcX0TasGmAF09uo4q4VagR+jxcNxh
	xl/f0U9/Gtv07RL3KhHcg==
X-Received: by 2002:a05:7022:238b:b0:14d:c53a:f6a0 with SMTP id a92af1059eb24-14f5bc00823mr15119758c88.13.1791136110388;
        Sun, 04 Oct 2026 10:48:30 -0700 (PDT)
Received: from umang-Inspiron-3501 ([2401:4900:1f3b:8187:3c41:9181:ca6a:23ec])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-151fce9a619sm13937787c88.14.2026.10.04.10.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 10:48:30 -0700 (PDT)
From: Umang Pokhriyal <umangpokhriyall@gmail.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowangio@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2] tap: report IFF_DETACH_QUEUE in TUNGETIFF
Date: Sun,  4 Oct 2026 23:17:38 +0530
Message-ID: <20261004174739.36179-1-umangpokhriyall@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tun sets IFF_DETACH_QUEUE in the flags returned by TUNGETIFF when the
queue is detached, since commit 3d407a80b62f ("tun: Report whether the
queue is attached or not"). tap does not, so userspace cannot tell a
detached macvtap or ipvtap queue from an attached one.

Cloud Hypervisor ran into this when checking queue state on macvtap.

Report the flag from q->enabled, as tun does. Unlike tun, tap accepts
TUNSETIFF on a bound fd, so ignore IFF_DETACH_QUEUE there to keep
writing the TUNGETIFF flags back working.

Assisted-by: LLM
Signed-off-by: Umang Pokhriyal <umangpokhriyall@gmail.com>
---

Notes:
    v2:
      - ignore IFF_DETACH_QUEUE in TUNSETIFF so the TUNGETIFF flags can be
        written back, and describe the change as parity with tun (Sashiko)
      - drop Willem's Reviewed-by because of the new TUNSETIFF hunk
    v1: https://lore.kernel.org/netdev/20260929142238.41742-1-umangpokhriyall@gmail.com/

 drivers/net/tap.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/tap.c b/drivers/net/tap.c
index ff67d99deb39e..832439b8a8988 100644
--- a/drivers/net/tap.c
+++ b/drivers/net/tap.c
@@ -932,6 +932,9 @@ static long tap_ioctl(struct file *file, unsigned int cmd,
 		if (get_user(u, &ifr->ifr_flags))
 			return -EFAULT;
 
+		/* TUNGETIFF may report IFF_DETACH_QUEUE, ignore it here */
+		u &= ~IFF_DETACH_QUEUE;
+
 		ret = 0;
 		if ((u & ~TAP_IFFEATURES) != (IFF_NO_PI | IFF_TAP))
 			ret = -EINVAL;
@@ -950,6 +953,8 @@ static long tap_ioctl(struct file *file, unsigned int cmd,
 
 		ret = 0;
 		u = q->flags;
+		if (!q->enabled)
+			u |= IFF_DETACH_QUEUE;
 		if (copy_to_user(&ifr->ifr_name, tap->dev->name, IFNAMSIZ) ||
 		    put_user(u, &ifr->ifr_flags))
 			ret = -EFAULT;

base-commit: cfb7793d1bc0f7d90571611979654cf1b3886b29
-- 
2.53.0


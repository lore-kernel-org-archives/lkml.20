Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F6F4AA416
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789493471; cv=none; b=CbPHY6V1fsVpGXKv9KJeA4c66FJIMwxt1RbXPZq+S/QJdP6LQWPt7pgMjbNGYLVOOMaiS6BqgNKESOj1EHIGMNllvtmcgplqeKALUXd/0Ugp9H/xOSaIrs1KF9KcAEq4KC30y+zOg5B+0IZwXj47pFb5XNGKsVkH0la4Tovcqoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789493471; c=relaxed/simple;
	bh=1L41fDFcwJhnqwC3iHJYWgVyCIQZycnmy2yM9XthIjo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ezXCqZE/owoigrjzT9kT85ESzIwf12SlVr5OJQgbvwJyvMIXXMJhxE9qASNOrZAkpBdxNv8/c8gxRScmiHQ090a778pX10qQ4Oa/+njUiyjD9BziVM+zKrBDowAKUUAj8vlTG1r+98pFs9vtrAdXfU8YJvlqmPXoCjYWCq89RR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oxIAC1a+; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oxIAC1a+"
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-786c3d55c99so723734137.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789493467; x=1790098267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RgblY6L8XKeLM/vcFnT7fWo1z7GUneU5Hum0ZMmOcJE=;
        b=oxIAC1a+UZ+J75VEHH2IzFKpwEeCcYfBwKmlierodh1vG/bMJaGH+qLXPFhFYmiuJM
         ldjoKSl5YcMqxQN5f9E8jr8po7mTnEeUBgAJsipixKbs1/vMqf9rdqyi3llik5emzIFa
         gqHDrXymdiU+9xxhfgTWBt6dqxfKZKvCU8mdH8v0pjdQPTLp1wTwj9xFiRpj1EBbOTnN
         vsnZQUv6mAFWE7KrasvC/EGfKCEm4VMT/yE3mZzpFCFlM8V0/2/aMP588NuVQm96o5L3
         zRU51FI79U4ZJTgO/B397rPcWlIXg+ide6sbGxB+1aJkNRVDwampwZ04P2IuMSFx6Nio
         HUFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789493467; x=1790098267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RgblY6L8XKeLM/vcFnT7fWo1z7GUneU5Hum0ZMmOcJE=;
        b=SCzLKCKUda3MGK5MNjKgDI5pZTYLGA1IagUP8hiqLZw0sSqlmFng39KUN8PLAW4kb8
         0bXqxezxB8RgULc6vWz6mzYAS9m6NLSKwxnWkAcxLZgpoCy/897dMIcC9jesNoPl9Cqg
         A6yjvf0T7CSbJdkDk4K0hzEjors2C3m7Zv3jNT7/3hQ++uGtvqdOPg+7g9WPQIr36HPM
         5WQwt32mfs/0CNmTnTcPCYRHXfeTsjwrXq8+o9JX1m5B3Ok0zdkfuryuodNb56HIBs+g
         iTdF4P+KJaMLAbFDMZMnz+7rjASsn/oU6CB+LSwisGpGbcekkdeO7b673Qv1E2eBH2lr
         fLcw==
X-Forwarded-Encrypted: i=1; AKwUvBwXGTrWsmxehaodhnhkQUDO84W9i7CYjc080JHbd9+YhBTaS7WOmm/swa8C2tbAlM2XbhEJSRdd/p6RJ3w=@vger.kernel.org
X-Gm-Message-State: AFuF++mQ7dbYSXeqFZWzfn4uy0d7DCmxHLy0hb2oX7SZvSW4jE5BVcSf
	KrUNYLuTYOlHdblQr13tYqgGulZgc5IZ59S+odbOpnb6AxkjJGd4tEHw
X-Gm-Gg: AYBFou2OC/7XmmvWBvgjIEJB7nxxbzNDvMTzxNm5aapTKM+4+tjvlv9aBnH/p+csNjY
	2bcMHTquepFI7OD8OjDyb/cyoY0RW/AgIYv2wFNsg8RWjxWs4/wZFiYEVT5xm6Cr9DWrfwjWk/R
	wVOfheAij0+lrSF3TC871r/qYImAh+pE3ccSLAhFHqdxvjw5Hpvm8NNhuMtG1QEtBwhI7s8uAOZ
	nqxFsgV0pGP9EfAp/kvL1AmBw+KU9coRLbKday/jQDHh+r1mIs9/l4fYJjhSBljeHmVIo9g9TiZ
	/BsE3M2wyrHt9zRxQ+P13j3M3sAYESvbrImg9wv6fG5R6hJq9dnD2Xsh5aDwUsPOFRiBWLNZscN
	l+gfXt4NRsFaLFKurA8tmVP96XyEW+ZXot/5lBNr7b61pOEsUAGvQxCbDEIUg4R1pC+Sc0Tf3Lr
	56pMj+mIJfJ2MBhRBlG7xWJiLBNA2L5SdoSYZC/C7Amzl3yxgCxywxbvO9MjYFEols
X-Received: by 2002:a05:6102:8687:10b0:799:f608:79e6 with SMTP id ada2fe7eead31-79d2319d752mr2295720137.1.1789493465871;
        Tue, 15 Sep 2026 10:31:05 -0700 (PDT)
Received: from beelink.. ([187.13.206.89])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-79fb104b2a6sm310677137.3.2026.09.15.10.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 10:31:05 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: Bobby Eshleman <bobbyeshleman@meta.com>,
	Luigi Leonardi <leonardi@redhat.com>,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	virtualization@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Subject: [PATCH v3] vsock: ignore empty child namespace mode writes
Date: Tue, 15 Sep 2026 14:30:50 -0300
Message-ID: <20260915173050.3176344-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915141547.3010692-1-qwe.aldo@gmail.com>
References: <20260915141547.3010692-1-qwe.aldo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__vsock_net_mode_string() returns success without updating new_mode when
the transfer length is zero. Its caller then reads the uninitialized enum
and may permanently store a stack-derived value in the write-once child
mode.

Return before calling __vsock_net_mode_string() when *lenp is zero so
that the helper is never invoked with nothing to parse and new_mode is
never read uninitialized. This also prevents an empty write from
locking the current mode.

Fixes: eafb64f40ca4 ("vsock: add netns to vsock core")
Cc: stable@vger.kernel.org
Reviewed-by: Luigi Leonardi <leonardi@redhat.com>
Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
---

Changes in v3:
  - Move the !*lenp early return before __vsock_net_mode_string()
    instead of after it, as suggested by Stefano Garzarella.
  - Add missing maintainer CCs per get_maintainer.pl.
  - Add Luigi's Reviewed-by.

Changes in v2:
  - Return early instead of initializing new_mode to the current
    value, which would silently consume the write-once transition.

 net/vmw_vsock/af_vsock.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
index 622dbd0467..XXXXXXX 100644
--- a/net/vmw_vsock/af_vsock.c
+++ b/net/vmw_vsock/af_vsock.c
@@ -2879,6 +2879,9 @@ static int vsock_net_child_mode_string(const struct ctl_table *table, int write,

 	net = container_of(table->data, struct net, vsock.child_ns_mode);

+	if (!*lenp)
+		return 0;
+
 	ret = __vsock_net_mode_string(table, write, buffer, lenp, ppos,
 				      vsock_net_child_mode(net), &new_mode);
 	if (ret)

--
2.43.0

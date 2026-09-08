Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26EC4B04AE
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 23:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788911123; cv=none; b=jxqbbHti9emOOb1wxkCF/H9JH0YCeTc8zckjTfxKljDtgmwjSMMGGoZcO3vNDStaj/hglOs6IGlqVshRM/py4C2qD2IOAN82dAudfvhTL0V3/Jm4v6NnO9l7Z0g6Pu77bBSIPirpXQCZHSKuhc9GklZ0k4FIvUcasKCrDSvEaUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788911123; c=relaxed/simple;
	bh=UNHyV5Vp2KGWRl3CC0o5xYWyjuskR4xDHkSn9B/vuNw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MCxYPExb8SGmTXCqxqpeqzt59+qEJ0iJ8uSgKfMWda4qLbFOKwR19TE1rFWf2NXixFtuImczrJNOqEofRagmTWgfYeDV6RVFRlai1CVOtyDdbGD6ZOo82YyCxbGNm68/VrrYsOSCos88A0Y45wu4fW0PeeQOFyjQqa3Fd0vpBdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H/wSnJDq; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H/wSnJDq"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-936c02e58dfso445663785a.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 16:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788911121; x=1789515921; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HOpcOU9vheynx/fQ+9xFXI+Vv0lGzJ7j1NxiFmEU3PU=;
        b=H/wSnJDqIDu9xA+aumqQ8Fz7nrkXyMM/weEBnGM54W7yWWvKQyJMk39MSDmkqTz7n2
         o8aR4+bcjhGjXdCBMYBheAEtUfsM/UTe6VNZjfSBWImT6VIQjql8/IRJIZw3jh3W4n+Y
         lYJDEBm9ouj5D68MjBlUtgVuA73Em1FUK1b6voRrk+LiAd0sN7Zk0XK2CkFWPCE1eKrb
         BnFi20hDMowcJi7tjuwnwc66xddt54mHBtQkq65VOPYXA9p7wtce5hgj9EQtdj7gukmW
         ZVso8Gc7GIHrHX4fRWETmaq+fb7Glo33t5Vkhy0Ld/UgPzXA7UlSESHiNb7hYVo3BU9x
         ECJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788911121; x=1789515921;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HOpcOU9vheynx/fQ+9xFXI+Vv0lGzJ7j1NxiFmEU3PU=;
        b=S+OkRephidGZ3YsKihnMoiKc78hp8PHJRHF72XzUf8CQK2p/YxRN/ngb/+mm7FCh63
         dY7UDUy8Kn17Tk1Ve1Z907/CW4y9MWHtk74AGDA7dtJSQrgRpD3xh0Bk6KbSuIOpPF/K
         W2TGM4wKo+S4A79tniK1tBlb7m2HDjtMA9k8EovH8cbEdswGN7fZ3ePxuHc1a6PAJwNL
         UE/aK9MMglmVxQHbFRjGSwFeCAdATMVzIdLDv/BYWi9oXf2Pvvqeeta9m3OYGBnaL+kd
         pCN93+Yptr69YYsgqpVg7Ddfzd9otAh8zuoG5VUK/MJyQTBvh6GU/FGSEkGD2YoQVJTk
         vqGg==
X-Forwarded-Encrypted: i=1; AKwUvBxjbHbi831Nz+dPIoDHaG4N33QRXJdE3//KoGzK9g73oxrpmixR75ZOc9bW6U7yp9QRYdDY+s0wHStpdqA=@vger.kernel.org
X-Gm-Message-State: AFuF++mSzrd15T6QHUFZX9JhOTPW1T9YDZUpOmWYlMpZiqnCemLWVt7A
	BfDoXDCUAmW12TXOvkCc3vivdXElbNaf9WxhiPGBo7DsaK8mQP8SWG0I
X-Gm-Gg: AYBFou1e/lez4xC152iyAJJh8Trj/zf3/A0XTXo16h08OXfY9ATNLLWs+UGX1YV9LOI
	Ha695/AaiNh1UuQmYD+LmcpGOtHqoOzrTDoavZgOpOMkiKsnZ2kIYJ4CuVoTwfF2J2BC/yFoOU3
	yrKELNWOlszH0QHuJPucrFF9/vC3raIHPv3fwZSmSTGmWpV/wWs+VU5Qd9T99DOFsFkKeqlFgV5
	nragsZDzwOazFDas7jYMr7cv5aV84ubbBkrI14kOakG7rrmaHsVPHQfvca0SbqeK05Cr0LfT83h
	wkJjYHlR+lsyMdq8G0rrs0o3OXGdbY8ZUPp74SKakFX+b/U78d32/jjZrr38T9YR+5+O5lU8UfR
	U+yFhE5L5dwE9tV4NLd9UKT+v3qUH07MklhsFEmOgyE3AxSrK2NK4pvofH6GtfQmHc4oK3Eakjq
	6kvvY8A6P2HEjHaiD5cYFc0ggm8hVczuGDA6JO1QKf1VuVd057PU3dkx+POhpFZeRZOA73JWfrO
	M3Jc+HiJvI=
X-Received: by 2002:a05:620a:c0e:b0:939:1acd:7d9 with SMTP id af79cd13be357-939802f7bbdmr2380037685a.4.1788911120570;
        Tue, 08 Sep 2026 16:45:20 -0700 (PDT)
Received: from elster.cvl.swallow.glass ([2606:8e80:692f:3320:980c:c29f:b4b9:c06a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939aff54ae0sm551872585a.8.2026.09.08.16.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 16:45:20 -0700 (PDT)
From: Taylor Bates <tmbates12@gmail.com>
Date: Tue, 08 Sep 2026 19:45:09 -0400
Subject: [PATCH net-next 3/4] tools: ynl: stop find_kernel_root() spinning
 at the filesystem root
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-ynl-robustness-v1-3-f255214c0f30@gmail.com>
References: <20260908-ynl-robustness-v1-0-f255214c0f30@gmail.com>
In-Reply-To: <20260908-ynl-robustness-v1-0-f255214c0f30@gmail.com>
To: Donald Hunter <donald.hunter@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Jiri Pirko <jiri@resnulli.us>, 
 Stanislav Fomichev <sdf@fomichev.me>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Taylor Bates <tmbates12@gmail.com>
X-Mailer: b4 0.15.2

In the current pyynl tooling, the find_kernel_root() function
contains a loop that climbs up the directory tree relative to the
spec file until it finds a MAINTAINERS file. If ynl_gen_c.py is run
in-tree it terminates properly in the root of the kernel tree.

The relative directory returned is then used to build the provenance
comment. The path of the root directory that it terminates at is
thrown away immediately at the call site:

  _, spec_kernel = find_kernel_root(args.spec)

However, if it is run out-of-tree and does not find a MAINTAINERS
file in any of the directories, find_kernel_root() reaches "/".
Since os.path.dirname() is idempotent at "/", the while True: has no
exit.

This can be reproduced on today's tree if the specs are copied to
a directory outside of the kernel tree:

  mkdir -p /tmp/ynl-oot/specs
  cp Documentation/netlink/netlink-raw.yaml /tmp/ynl-oot/
  cp Documentation/netlink/specs/rt-link.yaml /tmp/ynl-oot/specs/
  tools/net/ynl/pyynl/ynl_gen_c.py --spec /tmp/ynl-oot/specs/rt-link.yaml \
      --mode uapi --header

The fallback implemented in this patch still
provides a usable output:

  /* Do not edit directly, auto-generated from: */
  /*	tmp/ynl-oot/specs/rt-link.yaml */

Fixes: be5bea1cc0bf ("net: add basic C code generators for Netlink")
Signed-off-by: Taylor Bates <tmbates12@gmail.com>
---
 tools/net/ynl/pyynl/ynl_gen_c.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/net/ynl/pyynl/ynl_gen_c.py b/tools/net/ynl/pyynl/ynl_gen_c.py
index 2b3483db1b60..1c422141d2d7 100755
--- a/tools/net/ynl/pyynl/ynl_gen_c.py
+++ b/tools/net/ynl/pyynl/ynl_gen_c.py
@@ -3449,7 +3449,12 @@ def find_kernel_root(full_path):
     sub_path = ''
     while True:
         sub_path = os.path.join(os.path.basename(full_path), sub_path)
-        full_path = os.path.dirname(full_path)
+        parent = os.path.dirname(full_path)
+        if parent == full_path:
+            # Reached the filesystem root without finding a kernel tree, fall
+            # back to the path given.
+            return None, sub_path[:-1]
+        full_path = parent
         maintainers = os.path.join(full_path, "MAINTAINERS")
         if os.path.exists(maintainers):
             return full_path, sub_path[:-1]

-- 
2.55.0


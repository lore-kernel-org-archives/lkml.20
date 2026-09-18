Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA20A4F3EA8
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789737388; cv=none; b=EOZRSQcrR9xszBqMdgKd1KBju6ElxVNtb0+G+7qwmzFdVvlr/sty+A7Ek4a7lvdgACc67uTsuinwtWRsE3+EBnx9zpaRG0GYi79JmftIKewct9FSVdGxXrGorI3cwmCIqrUwp+MgaK7oDmHSPC/I/xyzP6rYCHghO+q6D8Kpq4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789737388; c=relaxed/simple;
	bh=4iYlSPBFdYVbmaQ+n6xg76xhNoVAGw/DSdwQgm6frLA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KLV0S7K2nh/SdM76LWIZV3Nti7f1AK/6YfgzO1WWjbQjQHfVUnEJQFptmqy/32O75BiZwpUX9ggOKLb8mcMr1JbLGJVECn7hjFGkABOY27gi6wX0sUjEJbOs0VmRgIzv4qFwI0/uC+QwtC4MsGZBk2L8BtjIghVRjv/AmS74G4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J+7+ZeDA; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J+7+ZeDA"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4858bc96fabso583284f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789737385; x=1790342185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NPknZ1WGs+5VI15GYbHYggwlCsBgDjKJicFWFVELHwY=;
        b=J+7+ZeDA+gXPKSKz4aNcyf874ZousFOxqqC3Y6bQTSTzeafyAqzpy8Q7R7E+uLA92D
         /+ykZWKfqB1I/rq4K/BQrtTUu10gVGh52vL8FvJ9yKZOKRiudAV7aDLgcOnGuRg6nxpm
         PtCIBu/ktVpuUpFlhhheO5H7G5gOiJveXEQUXnoDEVqX9Wv55CIY48EiX/KLOaMMR4uY
         /J0CMFZIDtQE+2QNY9T0cshPNudznFy8qdEEZiu+n2KoSYZAEKf+cG053r8oLnGYroA8
         WacZjNV6jBMclMaP08DUrrcXVQyvZa79keP80GpsARCIMRtWyD3dTtRydpqvPs7J+gYa
         M++A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789737385; x=1790342185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NPknZ1WGs+5VI15GYbHYggwlCsBgDjKJicFWFVELHwY=;
        b=o9enhyVO+ldM5GfW/xsywAYY1s3Aani2Tsee7+Xpf7+Rx7Kq1Jtzusmtvc8NKuLwNB
         pVGwgs/Xk7+f0OibL6UCNkB2letSUERW3F4oC5VAvu34hLtBYXM1qtmffPmD4itqBs/C
         wJUkZPqWOcyDnGZNPbXgQAOj08wtcKA6tdCGO/jiHmnWstHb6J9jYvFvZLlNeU8wRfeb
         QK0T6TJ5pNOPvhQPFvYre3vBDGszL3KmQfMo64s0F22stwGlcUaF4nRwZp+WSDmiVBjf
         /bZ6/KeO5Ua+qQLstul3QZP4Z0ZSmIPFJKXUcp4GRv6jXEvtd3QQlS3T06oyFRr57Wi1
         YuAg==
X-Forwarded-Encrypted: i=1; AKwUvBwhmwBnVEgXIy8DHE7fSgR3xqtKr2tmuWP9D/I6yOlE9PRK3+0dAWhRHu+IaHNLalDMws4x0YZgujeHZfY=@vger.kernel.org
X-Gm-Message-State: AFuF++nJwrjI8HytdfXZfBSNQxdBZNf7JuLK9cYhLoD0LDkQcxH7yHV4
	7CXgRm5TzTC7h61P5YZCamA0GmEvP7LdKypx9ShiqgGeVG5XtxUnIQLf
X-Gm-Gg: AYBFou2u4qfPuD0e/Zu8Dkr28HAtgbVAw48Q9khGAoXP1KZSOgkr2SixEOu4z6fnKZQ
	rm/4IhsnAF/upiOB8/3Wmmdptz9DngX1AC/GWss8uptuOzSHplF9XO0C3kQo8KL2lJKoP9tNI5Q
	3FbhaFo5lb0iT7B8FKvJRnSE5G8GWWKE81if10X1prtpR7tr/HDmLeTx9U1z1nfHy9MswDzJPUs
	UkR/pXmL3kljyB8UDyWZjtpJ/RV3nPXzH01OlWVIl77a5hIpr2TPw1408kIvIcy2/iBRJiLic4E
	NqHtJxe67xNehXuzKEj4c123T9j2RJomUk/ogUbPPv0ArCvIQ/dytNqZBuNCmf/IQueqYZ+aCEk
	bR2nuwuczxVXkJ9eOIT8W+GMXPMxe8IeTa7sTsfV4Yen85oTKAEML4E4dncKvcVkJdSQcgIhYPO
	lwZ6d/wq6Elf2p1KMin9xa7Xra+dW0UCxH7KiVRxuoyiev+np/8lhMo780VQMAj8WmKG3yIL5xg
	8mbBD4ZWKU=
X-Received: by 2002:a05:6000:4548:b0:487:221f:a2e1 with SMTP id ffacd0b85a97d-487221fa2f6mr1255469f8f.55.1789737384792;
        Fri, 18 Sep 2026 06:16:24 -0700 (PDT)
Received: from fra-x8664.wind3.hub ([151.16.209.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-487200829e1sm4487572f8f.34.2026.09.18.06.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:16:24 -0700 (PDT)
From: Francesco Magazzu <postadelmaga@gmail.com>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>,
	Karol Herbst <kherbst@redhat.com>
Subject: [PATCH v3 2/4] drm/nouveau/clk: don't use the pstate cursor after the loop
Date: Fri, 18 Sep 2026 15:16:18 +0200
Message-ID: <20260918131620.405133-3-postadelmaga@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918131620.405133-1-postadelmaga@gmail.com>
References: <20260918131620.405133-1-postadelmaga@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nvkm_pstate_prog() walks clk->states looking for the entry at index
'pstatei' and then keeps using the list_for_each_entry cursor after the
loop.  This is not triggerable today: every caller clamps the index
against clk->state_nr before calling, so the loop always breaks on a real
entry.  It is safe by virtue of what the callers happen to do, not by
anything the function itself checks.

Should a caller ever pass an index that is not on the list, the cursor
would point at the list head rather than at a pstate, and the
pstate->base.domain[] and pstate->fanspeed accesses that follow would read
past it.  Rather than leave that trap in place for the next caller, track
whether the entry was found and return -EINVAL if it was not.

No functional change.

Signed-off-by: Francesco Magazzu <postadelmaga@gmail.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
index 5da82db71..a43246ae6 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
@@ -270,13 +270,19 @@ nvkm_pstate_prog(struct nvkm_clk *clk, int pstatei)
 	struct nvkm_fb *fb = subdev->device->fb;
 	struct nvkm_pci *pci = subdev->device->pci;
 	struct nvkm_pstate *pstate;
+	bool found = false;
 	int ret, idx = 0;
 
 	list_for_each_entry(pstate, &clk->states, head) {
-		if (idx++ == pstatei)
+		if (idx++ == pstatei) {
+			found = true;
 			break;
+		}
 	}
 
+	if (!found)
+		return -EINVAL;
+
 	nvkm_debug(subdev, "setting performance state %d\n", pstatei);
 	clk->pstate = pstatei;
 
-- 
2.55.0


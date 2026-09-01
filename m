Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3583AE71E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 01:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788226175; cv=none; b=bynum8zCknPxpkHCogO1bONy86mxE/46xvNIXMGIM6cRe9xEIXOG5ZDVXpaZZuKYPUCfYAVFsryYQ4in5Z41ReO3spX+BJ/zA0o2tGHoIdfx66rA4nKCBjK2XD9tNqdOQHiLf2PlZkDvpHFIFXLjmdII4zLSp00qa/cQaYzTjNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788226175; c=relaxed/simple;
	bh=ZEr0m0+64zDKVxyN/0o4Ov6n71mrZ2+8QMK6RrzeH1A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S5b88kaviHX/JUJ57mbSdaomga6RjyaE9E4M4Lzda9AkaSP0mqdJufAyDsZmncGN0CKOLQOzBLB7RiKZpYK01TOs5RfZxucIfjxVEJ21KBFuIs/1XYQQ3B5Qc/r78Fss1Qxt/tYbC/Hw8gV2OhXiO5mQ3StE9keWlnamxfmL6f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=CyNtx+5e; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="CyNtx+5e"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-398c1101c1bso2433246a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1788226171; x=1788830971; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hBX4D8QE2oULZc7c2LUsXpSCt3UMpyQ0mFmC05VzQfo=;
        b=CyNtx+5edej+b31Nq+lbzo/25LvgaIkVP56AknZAlQ/TW3i0y5jo4rmfR6qBq4gELZ
         7R8guBLMcHzMEbi3DByKayyxFDWFitfS+t83OWa/CLuBwxzhSsr1zDPPcbKDrBvHauB0
         0oS58idDmmnnDimxxf4YkplyXFdMgvSGYnDXJ+w0zggAI6tv1fIlbhj2h7OLzZA7RhYO
         L+yroD6D197Em5Q43Og5Uw0uV0iFe08ro8niCYLWgf5PID7LPZkI3eR8LtwGhcOA57s4
         cDQejMjn9l6sA/icaOZ7eyBpB9Fg8A/mSzykyxIJLM2DXjsPs+76C3CtaBPHejPz22io
         SX+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788226171; x=1788830971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hBX4D8QE2oULZc7c2LUsXpSCt3UMpyQ0mFmC05VzQfo=;
        b=kJIbZe3g9qcFs9ivPzcbxkAfWbbTFPeFK64P5bQivMqrKoQ8J8yp0LtVVpX2vsuPE8
         jt1ymIJjiAperuRtkOAWiHkUxNx9IqsUB4ymGP3tm/qTbmX79PlyYOALg1OXq3sHUamm
         1oQhVWIh6Cfo0+McW9vc/uhwKYxkhGwREphXG7QA+c2vZUhfIruyPO6cv9cUjgD/2eW1
         LPkcjlzkklwdEq2wbjuShXOZ0wOLG64TXNlPfemMAa2zY9/PHp8/J2l2M7jXVjnOYTH1
         LOJCyksa3CMaL5PMIXsvX3NG4z2S4QKG3lRinv61aZJQps9E7bCRK/vC6M7whJui5Jbi
         q6Tg==
X-Forwarded-Encrypted: i=1; AKwUvBzLqTCu5gbeNxFb9V5H+5AEGPGgKOw+DQ2GGAT0Fvbov8CTfIZSDST1IeKAm0GTS5w+uAO298nZjNkFd5w=@vger.kernel.org
X-Gm-Message-State: AFuF++kmRVKVkdgGyZXBG/dwWXLw8vCzl7dCU5IU+TJZgahEWL7C4CTu
	9inrO+LwtHdmvckG4sp0rbbmnC3jN/NaDHHqlQLyOLGVtvECD4UByqS1WTQYm2SFHEioHnZDqJx
	XaeSc
X-Gm-Gg: AYBFou0/thW71TyXatEKPnBVyWQGTTjH+OSyZYLXs6tOAcKzgfI66KM4G4ntX3FsQiS
	uqhaKUU7NPjQWps7iBKlfR3vAd7uuVq5WrSFKJcFXZu8cBex8oPtL3loaArSOpcbzyExv/h2GCT
	0Exgn+ghvhfhHEOtpZXCIVSjtpTNWBxloNrEtiHPRiUxv+C/0E3rA9ZBj9oa28VT/iTc7VuYRty
	OqnxM+sFFOjFx2TCbkj8VxMPNxbHL2nJ2P5iRVyKzrTa3Mh+0iULcNohQradDD61KiJI8F8v9O5
	3/ENiIt2dtQyJFOfschsVT1wP2+8g8LJg93MtnDg8cITABULsw+PWn+Sfb2rSv/nr7Wm+XyGbsX
	plSLWg36sVRip4rdkIWSv7gtzJ/Rcy+4hgW3Yk7f0jUOakebuzfi3h9bzgw6rFSBYgOmac1AQCl
	jHmxopy7UAQn+VUq7n6sfePsg2HF8mPgtarDsdoTRQszD4GbyuK2X8rEytkcJzN9I=
X-Received: by 2002:a17:90b:3910:b0:398:9beb:5c17 with SMTP id 98e67ed59e1d1-3989beb6373mr27864091a91.18.1788226170796;
        Mon, 31 Aug 2026 18:29:30 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b5bef7683sm19390817eec.12.2026.08.31.18.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 18:29:30 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Mon, 31 Aug 2026 18:29:23 -0700
Subject: [PATCH v7 05/10] of/overlay: only treat a positive changeset id as
 registered
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-nh-of-alias-overlay-v7-5-02754604805a@nexthop.ai>
References: <20260831-nh-of-alias-overlay-v7-0-02754604805a@nexthop.ai>
In-Reply-To: <20260831-nh-of-alias-overlay-v7-0-02754604805a@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Frank Rowand <frowand.list@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Shawn Guo <shawnguo@kernel.org>, 
 Grant Likely <grant.likely@secretlab.ca>, 
 Grant Likely <grant.likely@linaro.org>, 
 Pantelis Antoniou <pantelis.antoniou@konsulko.com>, 
 David Daney <david.daney@cavium.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, stable@vger.kernel.org, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788226164; l=1525;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=ZEr0m0+64zDKVxyN/0o4Ov6n71mrZ2+8QMK6RrzeH1A=;
 b=hOe8J1vYL2U09NmjwTYJSOrQFA7DNmF3EOkLkPXnYsNk+jJbWbFKlsze1cF9Yq0lUHJ8KfHMI
 7J0cR1HTouxC43Hs5CV3JfLFr+LvPKVX6Z7V1+3GCJoKm8nCYIdCStj
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

of_overlay_fdt_apply() stores the idr_alloc() return value in
ovcs->id before checking it. On failure the stored id is negative,
free_overlay_changeset()'s "if (ovcs->id)" check passes, idr_remove()
is called with a negative id and list_del() runs on ovcs->ovcs_list,
which is not initialized until after the id allocation. An allocation
failure at that point dereferences NULL.

Make free_overlay_changeset() treat only a strict-positive id as
registered. The rest of the function already copes with a
partially-initialized ovcs, so the error path stays a plain
goto err_free_ovcs.

Fixes: 61b4de4e0b38 ("of: overlay: minor restructuring")
Cc: stable@vger.kernel.org
Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Assisted-by: Claude:claude-fable-5 [Claude Code]
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/of/overlay.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 284c9bc6c9cf..9b9f198a1d70 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -860,7 +860,8 @@ static void free_overlay_changeset(struct overlay_changeset *ovcs)
 	if (ovcs->cset.entries.next)
 		of_changeset_destroy(&ovcs->cset);
 
-	if (ovcs->id) {
+	/* a failed idr_alloc() leaves its negative error in ovcs->id */
+	if (ovcs->id > 0) {
 		idr_remove(&ovcs_idr, ovcs->id);
 		list_del(&ovcs->ovcs_list);
 		ovcs->id = 0;

-- 
2.54.0


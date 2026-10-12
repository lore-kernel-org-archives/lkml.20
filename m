Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E073750BE
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 01:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791770088; cv=none; b=nW9PKC6IFaChnfohTPvODzTlbYQ87dq3CJrKCXjGIAm4ezlEBYiy3HR+Rx9EntnuUXphiQxJrkBqN4rVsO+hEN2MgskreLi/ZUtRyGhtZc1vvYcvZf4r2EapHsh7kRDlhPSY6UiZMkqa8x/js7A1t4Mrtj6II2qgj+TLU2sZrTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791770088; c=relaxed/simple;
	bh=Vv44zoZjSwsy57vVHtTQCTd9X5ufs796pWyfNK+I8iM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J8C5OendqFLPYSGOyAn+OOlr81p9xpuuo8UrLU35CME6SKAB6yvNdMXzcq617hb7mPVYuoTFTNp5MNs20V8ceYclNV48Dqsdo5EYy11civXjPn24iPX95u3dpWFKVkIS9aXcsb3LlxgueZv71Rpnkr7wi1SA6ITIt82JqFgNxlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DJwuBwvG; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DJwuBwvG"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-154e9d2d979so926987c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 18:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791770086; x=1792374886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zQpTLhFBOP9kFD8lNbHZGg4fyvNfgM4FjUkj5Z4R+aI=;
        b=DJwuBwvGXrLt8txeBIJ4tk6qrpnMjqyyZrjBKQ73u1RQV8KU4fg++WSNFW2ovB0xc7
         NX0q3yf9LbkdqHKrCst0kqNHymahCkyJCxuRVBYmMxlinf8rSCV46uXa5hp2AF67MKCF
         yAQbzJ/hPGXKw08Erbt90JYSKYEf3Gk3EgWN7Uhyqa3aRs59DxcKuADm2XNjqZse5pZs
         PqF7cm585nP03pzjUG2p/Z7KPckQubbwp1FaUZaBffU6sy/Vj/vuhwtCMJRVsVIxUtFu
         kHIYd390kJsDZRLxFSimu5/N6j+yZhF0hK8SqwPXZEzy1rb1FCB3V757R285MkQg2tcr
         WNsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791770086; x=1792374886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zQpTLhFBOP9kFD8lNbHZGg4fyvNfgM4FjUkj5Z4R+aI=;
        b=tiEhB0qCQ0+McsRH8yIziy6q6SqMA9dduXHxmsqp2vlX8MlFI/awbYghE+3ndT7xtD
         eqXlR2jT6el9UQgi+jufa2ltc/q6i2Y8wbpbZuHn8Heb218C5yPGyJP+Xv01AKUejgQO
         jz4aSn28/aH9bgDi9zeGh0p/ZuJQVmJ/EoVq2zAUfVYht8jcjUpiHEcXEkiMyDh0iSRd
         Z24A9zGS9QgIpy4cmCWz/J18Ev+RfzishJeLgj3J22E0GhjXa//XtUuU02y5d+mamJVk
         90+naSyr37ySXEdOSrzah151AmrgbNHQLNytgCG1bjPwveDAiSXUkQWf3Cj4Mbn9cnQD
         L2pg==
X-Forwarded-Encrypted: i=1; AKwUvBzcqUg5AMlwcHl12185xImFCaD6JsaYDA7Vn8Zh02hGT6leVisA0XyXwxFuraoQ1RqwU0jkUVwgaqAB930=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfHJOVxB/dcSbDFb279Y6w0HbuAqrecSGQlYY2qk7nJGk1e6TX
	MePWqkoDC7xV9JKVM/ZESdcb6jZZKGxGXWUBnth4ulP3PKc7fWbvqjz5X/Tg1w==
X-Gm-Gg: AYBFou1+PpvUU3IRDU0m0xbxGyOpitDopQ09JLrXuPBATj1MEpyMNoJHPCaVtO1WI48
	rRXGqmLAXk+aRtIpsQGLuPHyKNOwZ0zjd5tHN7ElW9L2Mf2W7TooHVybiaUiN7dVqFDh8mbR1rk
	fmmh+eghBVObYPDCz7uyCMn/OdU5pnGd4Axsjig7a4+jvzTJmXixQmsC5uxUs4OS4dRtpKuqfqJ
	OV9/c00DCEzFajUOBK/5CnYqzCgEn/eet/9U8pvnUDoiAofDlQ+hJYgAqzoLU5o1ty3XDEzToyN
	5ymm2cq3lWyPXcDFWDEvKB5MyxEGOJeJtAahCPAP8M9nQv4BUj42wsAvLofqepmHb0ZAFq2SI/1
	NDnsRx8T96X3mBWf931C9hDYmdXxhlMD7VXat7PokH8EC5S4oH1NTtUgFXL5ZhkhQlP/U1pwVFg
	n44kZISUKbgLwbVmRqvbLyN0OuJjdpa7SAKA+EDBzeEhVRW5mGBTepRJtNekd59LaRrZbHjXRLY
	Rx992w9d7T6jAU5GMDZce93G5vIUKdG+C1vYKYNullTRe2MrwsjwniAnYjOmqH9s8BuPo+Pck8l
	JnP5mVEdwidGVg==
X-Received: by 2002:a05:7022:b048:20b0:158:b944:b15 with SMTP id a92af1059eb24-16a5ec48b20mr11870984c88.22.1791770085560;
        Sun, 11 Oct 2026 18:54:45 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a567bd18sm24908130c88.21.2026.10.11.18.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 18:54:45 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Linus Walleij <linusw@kernel.org>
Cc: Darian Biastoch <d.biastoch@gmail.com>,
	Andreas Kaessens <akaessens@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2] pinctrl: mcp23s08: Propagate reset GPIO errors
Date: Mon, 12 Oct 2026 08:54:33 +0700
Message-ID: <20261012015433.6155-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

devm_gpiod_get_optional() may return -EPROBE_DEFER or other errors,
but mcp23s08_probe_one() currently ignores them.

Check the return value and propagate errors from the reset GPIO lookup.

Fixes: 4e73bfa3ee37 ("pinctrl: mcp23s08: Add optional reset GPIO")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 -return ERR_PTR(-EPROBE_DEFER) instead of uninitialized ret variable

 drivers/pinctrl/pinctrl-mcp23s08.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index cc668f84bf8b..259ac02134c6 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -613,6 +613,9 @@ int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 	mcp->chip.owner = THIS_MODULE;
 
 	mcp->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(mcp->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(mcp->reset_gpio),
+				     "failed to get reset GPIO\n");
 
 	/* verify MCP_IOCON.SEQOP = 0, so sequential reads work,
 	 * and MCP_IOCON.HAEN = 1, so we work with all chips.
-- 
2.43.0


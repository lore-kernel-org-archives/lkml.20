Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4204B36606A
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 02:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789006766; cv=none; b=hyyQfNMcD8AvzfsbBxchEmvPIxfTlOqUtolPC1+cwrSKdgtuxqlZehcCzkCdcobKEtR8g/wQv1TAcDrjcCJQ5niskXMWSNLQouhdFntjhfxQiQulnFMoR1hSbLWjgs7G3ZQ9wCEdcv9wcV2VwNuFdZ3kRA1g2H5RUdC9MEk8SVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789006766; c=relaxed/simple;
	bh=4ssMfydNhx0e/pAaE8tlH9aVyGRcmjwMRizcNlTI8CA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hB5T6y1Dt1Fcth8AQrMa2K7uhX4nqfYwu11U3N8eRiUuvlhapsT7xxjMb+3doSjSUHAQ7sPXmY5pYElqWWxne9BLe2atpF5cfkCdp+/Rll6FnVxVwSPp8hdQmoceVXi4N2KJv2KqR7PUKspMKj1KD86lcK0WLiMpQByYyD26Qx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=ValuYGQX; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="ValuYGQX"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-92e85499ffbso520567885a.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 19:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1789006764; x=1789611564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W2pS9qh/eX0ccyCJkHhJeDU7kKBDT75Cqi6iNrcLGYE=;
        b=ValuYGQXfCCWanqWXroSgxt9zS97nTJOUIiv5uUOVJbLCDJTBkBzIuDcD3T7xXp3tR
         NiZi5l1lKWkEn654MHOFmxFHD2cVpVwcLH4IhPIG/NTZaJ6WJ92KkVUsjXYwY5dDJ8I8
         Ypf0gh6VD0XWJ7LNe4ryPJ++6gu7d1WloZv8Rp790XEggsAWVVI0MsSRVI1MfmT9SRNH
         MqO7+W+L006dQZzDqzPxnp6UH9E1lJS00pTPhCru3w8+AzMHG+oeRBs7zDLtHCWPUgv3
         WsB2Xx9CB2x8hxjQUSCtqFUeXBrh3fBsyiOZF8jPMN/pqSZeHbr7awH5sT4mBFqoTZ18
         B1dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789006764; x=1789611564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W2pS9qh/eX0ccyCJkHhJeDU7kKBDT75Cqi6iNrcLGYE=;
        b=b3ZNxLAzDSLMIMNqM55WHrI+8TeMY9y6BwuT6ThM8TbFLBMrv4XazfpLQ2s9iQ3bxg
         xQTCxQdtwjNCMkQE9Ig6wqw04lNh+MH617itgiQU2jdn5Lh9SuzKApOufirfhli+pgud
         ktfbCWZ5i3qLt4zHDxx6IYxRpcBby84+MI5y3ioyQXO2XdhrVoZ/hDPlT7aZR7FsengP
         1HlFjFLvoBFyc+j8rtwtKeQl06f4AQ/59c9qMtgAzo8BCcQnLj3njQVxWiIGqIk297+N
         ABAfW/lX8k2IsrDVx+XNgxoBSPgfa4EHY3l9AIQ4Wc6BPCbs+oF8JivWHO2qtQ+E0M7x
         Z2rw==
X-Forwarded-Encrypted: i=1; AKwUvBzQBGvEjZ24IDwrKFl8iJNNQGtxWE8Rh46CrBz/d2ZTF4k6VuzI9MTvAo0XFedoj6a9EYKdIkqDhqZsQsw=@vger.kernel.org
X-Gm-Message-State: AFuF++nyiEJQJYIlHO+uwBxESWjoySHPtNIdMJfzrzoBLl8iFMEBcJs2
	jWisUsHszywxLuc2gKqH3oee0b7D1KcJ3M9WHj9NW9aycgkbRvgxI0zsUB6UrQ2Qhlk=
X-Gm-Gg: AYBFou0T8J9crtgPF98sUvJ6OEsSeFlDwx2AZUXAW/VooN8sZQr1dFkvdAAd88huNLo
	IAui1X4ZI5spgoUSP1s3uKiA96LpEY1DfaZ7PdR3Ul11vYondtD7PHERvMt3WSvFt7pb4V3gZHl
	gB8iJUJgs4y+N/IRTjYopWv/s5vq0jx/9vMmlf1Q0iMhSZJpFkGSfXR8p6sy9YvsWdB0KBYrC8e
	bJeQX+nMzCIIJ8wW9QDNuJTU2pBWAp+MfruQIgLjyV6zZAPH6TeyRhf47MLIR2OZndHeSxwvgCY
	URNvnx9vXXvvcdJPpXgOKsaN/S/ydAAigqpk/ODab8OGvZKoneeB4iQsalAPV8Hs2E9oSiPXxwv
	xEj70pJFSADbCIH6JYo5aZHrsbveMQml9PSS77ZxnYRJ6DWXjbGU4FlWjJvFIU2QDjCcnB7I1rO
	n4ySHS8sGLDn41xUJlaRD4FOG1Bl9wfUjFa6A9PR0Vi1IpssnYGCDe2Nr4rTIuW4JxL8rLQNsY2
	BI=
X-Received: by 2002:a05:620a:44cf:b0:939:3571:bb90 with SMTP id af79cd13be357-9398042909bmr4404190585a.24.1789006764168;
        Wed, 09 Sep 2026 19:19:24 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fb70fbdsm1561375585a.32.2026.09.09.19.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 19:19:23 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: bhelgaas@google.com
Cc: lizhi.hou@amd.com,
	herve.codina@bootlin.com,
	andrea.porta@suse.com,
	daniel@riscstar.com,
	mohdayaa@qti.qualcomm.com,
	lbiancon@qti.qualcomm.com,
	mani@kernel.org,
	robh@kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] PCI: of: make a flags argument optional
Date: Wed,  9 Sep 2026 21:19:16 -0500
Message-ID: <20260910021919.3421449-2-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260910021919.3421449-1-elder@riscstar.com>
References: <20260910021919.3421449-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The address of a u32 object is passed to of_pci_get_addr_flags() so
it can be filled with the computed flags value.

Allow a null pointer to be passed, so that the validity of the
resource's flags can be checked without filling in the flags value.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
v2: - Moved this patch to this series

 drivers/pci/of_property.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/of_property.c b/drivers/pci/of_property.c
index 1e5d7dde467b8..a6c0cca986bdc 100644
--- a/drivers/pci/of_property.c
+++ b/drivers/pci/of_property.c
@@ -82,9 +82,11 @@ static int of_pci_get_addr_flags(const struct resource *res, u32 *flags)
 	else
 		return -EINVAL;
 
-	*flags = FIELD_PREP(OF_PCI_ADDR_FIELD_SS, ss);
-	if (res->flags & IORESOURCE_PREFETCH)
-		*flags |= OF_PCI_ADDR_FIELD_PREFETCH;
+	if (flags) {
+		*flags = FIELD_PREP(OF_PCI_ADDR_FIELD_SS, ss);
+		if (res->flags & IORESOURCE_PREFETCH)
+			*flags |= OF_PCI_ADDR_FIELD_PREFETCH;
+	}
 
 	return 0;
 }
-- 
2.53.0


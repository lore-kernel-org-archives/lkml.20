Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C5D388E58
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 07:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789890125; cv=none; b=JnqpuLpcvYJnaaqg/wHcqo94A/vpZocnmt3H+9b6hrMwpGF9StJ8yl+DOJQtTzYA7M7cDsBLx4SrNXmEyUV0qroUcQEG0wAQvwxM9Bl9dOlJ2viAEDN8RJGr6tnVfUpXuMauRkgdvDFz75m+t+0hCsPS3mhxlopeO50eglotyDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789890125; c=relaxed/simple;
	bh=rR8igBMAONQFWgxQpNWCSbKEmSHIFF7JAQyn8OzbeWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gfus+XNm+KuwSQ7utSzhQWb/eh6R3HbhBL1LiguFKMWEa5rm1nj5dm0c8mjglpR6Q3yretL7WGPtK6OUWTsjaegJAP5H7OiJ0FYzWNs2uxpVZilvRdv+pc0rDc2x+w5wjVRDXgcKIvO4Abjhz2sUGMSACpWa6lOsco4GJmtKCug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gMGEWhou; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gMGEWhou"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d391aso13386665e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 00:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789890122; x=1790494922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/80n/32ltdJ41KKMohbSQctzxjiK+R/dgCUJ2IHiZLA=;
        b=gMGEWhouKOE8UhwGLxCX1Ke5iCvNgFTz+rApskftLbzIZO4g0DZJUo5vIsI1tC9Xk+
         aU3kT2QYexzX325H5kNb3BVNDDmBcFATw5+It3rJQAcv3KjoEYXussBCHDiEUYXE1Jhr
         yInQPWZDBGS08YcrpIw8sAvm/Fv8ckMrVcT1SBpGUE/n7F3XKh5c++rYchrhYTh3isAL
         LJOQ0aRrSa651o27PHCEvPVcY4Vt36lUHEt+t1kw/hf0dvkaZmYXS7NEKCIuOvsHpnMH
         /IFS9jWadFgtD33EIpk2Boy/pmkrauqyXWJg9NIj68PiZi9LttH8B3cyQUcDSKMIqCsO
         A0Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789890122; x=1790494922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/80n/32ltdJ41KKMohbSQctzxjiK+R/dgCUJ2IHiZLA=;
        b=f8yB7IHjB2Ys2FicSdcRHfXQ/I0zEkxLeSJQ8N8hCRXoAQs2BXVuD2Wqh7WtkhWCNI
         kdphVPNjeOu34/tYb38RqKptcK9MlsFprgPe1BdBvY4SPqgvcyqyu2LuZw3zLUZ1opgc
         y3zntw89/2PP29AzGJNML2R89T2eKWu2rKxcBTFajLUk9m5yXx+KNWkXt7gTj8iEqSaq
         pYdlKeY6gVlwiUHJBQPXBcKznYSjKXS6W5NxRHOHEI0N6cKfzd+TeBYZ6+Raxwb3gH8s
         nFZccaQa2I9oxr25CCsbdJBAVLlX83tmtmXWJWwU/y0FJiQw8i+Tg48q0aEExcmsJ1xC
         cpEQ==
X-Forwarded-Encrypted: i=1; AKwUvBx1fXDccGL0Pa7z+YtzerYNkEN8cXk0K/NNXl6lzmRqDF6X0HxQD0IvkJswkKq8wH7ZycHyw6OA2dXupNk=@vger.kernel.org
X-Gm-Message-State: AFuF++k3MVO9wgN/lBt+Adiw2CJNHexPlp2itzQFKORCCO24izFj+sec
	L6LiCLZDFd8VtWNhiS6HSeEXQVepDPwPG58BRr733xzO/3LTtBC+Egbs
X-Gm-Gg: AYBFou1XcBuCw4t+I+D+5Nw9s8X8XzU4QpFk7M/Oi+664NeoOTVYuv3KcLCtgkkh8fA
	uRsE3cDxegZaE6antOVUUoVbtPDY6TzxsZ4Ljm0D/Gb49DoKcYFk4sns8ALMHQo2UMWQUMm/GQP
	C5UFm2On19ilQxDJlhjU3eOX1qv/+pwzeTao42suWac+CCD/Em52psGBb1sa4ZPVlEtEZmCVR99
	nZhXvQ+TXll+/gwL+LPkECi1Df2YHv/atiuig1GqxPnuAYl2GEow9m4lMjSyRP/1UlTAxkOJiRE
	dQA1+T076yB99aJikTlAm7IRIqS5BPuHchhXv9agyIu88icsWWPBZ8ocVC7fsacgtp23sBe7hJR
	vvf/svI60L542qHARDXSkHITspcsRdkSTy3NP2eXobYl9mYzHE+qNFg/o0dqkcx5ou7c6zRxqG9
	IOmZxJ3MdJizkcQ0Ez+85X3szNqUEa6AX6cMVSHiATQjUgXjCSwu3p8X8TjN1ye2+t8M/8UJyUO
	o7SoGgF59oGdphIfM8uP+W8WdBA7SJlquayvKRFqNyOxCOtTEjDgHqv
X-Received: by 2002:a05:600c:3b29:b0:499:79b9:e220 with SMTP id 5b1f17b1804b1-49fc56aab12mr100245185e9.10.1789890122462;
        Sun, 20 Sep 2026 00:42:02 -0700 (PDT)
Received: from voyt-laptop-dell ([92.115.55.221])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc5748e56sm185405135e9.2.2026.09.20.00.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 00:42:01 -0700 (PDT)
From: Dmitry Voytik <voytikd@gmail.com>
To: Nicolas Schier <nsc@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>
Cc: Rong Zhang <i@rong.moe>,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Dmitry Voytik <voytikd@gmail.com>
Subject: [PATCH v2] scripts/config: honor $KBUILD_OUTPUT by default
Date: Sun, 20 Sep 2026 09:41:16 +0200
Message-ID: <20260920074116.71926-1-voytikd@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260920064350.17999-1-voytikd@gmail.com>
References: <20260920064350.17999-1-voytikd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If $KBUILD_OUTPUT is set, use it by default if --file is not passed.

Fix the issue when the script silently updates a stale .config in
the root directory, while the user expects ${KBUILD_OUTPUT}/.config
to be updated.
The problem can be worked around with --file, but this is easy to miss,
and is inconsistent with how the Makefile and other tools work
(e.g., scripts/diffconfig).

Signed-off-by: Dmitry Voytik <voytikd@gmail.com>
---
v2:
 - Addressed comments by sashiko:
   - https://sashiko.dev/#/patchset/20260920064350.17999-1-voytikd%40gmail.com
   - use basename when --refresh is used
   - remove echo which can be misleading when --file is passed
v1:
 - https://lore.kernel.org/all/20260920064350.17999-1-voytikd@gmail.com/
---
 scripts/config | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/config b/scripts/config
index 32428ea909c2..cdee67157fe1 100755
--- a/scripts/config
+++ b/scripts/config
@@ -130,6 +130,10 @@ on_exit() {
 trap on_exit EXIT
 
 FN=.config
+if [ -n "${KBUILD_OUTPUT}" ]; then
+	FN=${KBUILD_OUTPUT}/${FN}
+fi
+
 CMDS=()
 while [[ $# -gt 0 ]]; do
 	if [ "$1" = "--file" ]; then
@@ -229,7 +233,7 @@ while [ "$1" != "" ] ; do
 		;;
 
 	--refresh)
-		yes "" | make oldconfig KCONFIG_CONFIG=$FN
+		yes "" | make oldconfig KCONFIG_CONFIG=$(basename $FN)
 		;;
 
 	*)
-- 
2.55.0


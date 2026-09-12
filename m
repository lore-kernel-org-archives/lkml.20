Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B1B390613
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 19:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789242950; cv=none; b=ERo/P7d6Tjwqdv3GBgN1+Ml8yohVTCjv2mBP1H2YGmH5Xc1T5aqP4Nzik5BDcoIhtthff3iNVtToqZVogXnJY52QQ5EY9foTE6ZbeUtLJTSCYB/NSfoaVlzixvxYuBnKMN60QCtis+e/7ZA6meSW6k59OP+5apY30nCktDW3yF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789242950; c=relaxed/simple;
	bh=6WBpY++pP4wmpap/0jVFlCXobQj6RCxIU3+Y23QnWmU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GdUi5Og3u64cP6aPNCjw2qRKlMbHl9gGFPybDnGljuKO52Hpicj9kfQQZUhxH92JTA8ZD/iMbDgYu7RmYyBdvkFo6xIyTz/U6zBHTO9HX+aTLH1FKxRfjwkTLhjV2DAYEtEyCB1uca3ggiZz7jE8P9+Rfcb4Z7xRiIgQd6JtyY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HJeK0VnX; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HJeK0VnX"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-86d43cdee51so19064187b3.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 12:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789242947; x=1789847747; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h/xtiDuXddajfEeaRITCEbehQWNBkWU4am5Icja8HbQ=;
        b=HJeK0VnXP9ECADtzJcxWj//e1WtIUx3EPRMeyFHQAG+5wJslD3Y/wCo6VUAJnWO9ho
         TJYZl47xdPMzcapMIyaJVpIg2qJZChQ8Bg+TwOf0KVNObfS2XHxG5REz8R/PoRL/nOBc
         5QcYOUymylfrozIXclI40okjR+lbFBsAY5DG72bkfTnARRayribPR67dvZI1+NJq7eaZ
         xqJ97J7CIGwfAiS3Cy2pyK1EWCJKcltOWmRnYr9pL0sd5fl/hkZ/hHo1PQbPB9PyLe+T
         sCCG3L10Ihy9dbN15QZpwg54UH23T2ryDTliZ2c9vmYUy6rlg0w1qdLXJ0cNB5ahc9nH
         Zdcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789242947; x=1789847747;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h/xtiDuXddajfEeaRITCEbehQWNBkWU4am5Icja8HbQ=;
        b=cCd1IGjhDClZKDDL+pa53FdsiYL7yObvbzetlFozKh8w+0HdsvBDtE7xI7wzkxl6YR
         iO8Hgi6zyk5YjWSVQnj1M7hVKavyaeoI6e2NmsZIlfYWFFV/XKpDLDDf6PTGnjQajbX/
         T7n/wvx+9DG8ZFVbXbu94+cdn6NERkAHPxHaNjRaP09GIdNIqkDZJVyIZgZ+mtGJYmKi
         dIA0WfWrjfzqHjgznx/rniG+WlzcZRto04cuc/oOedNiMIYPPY9KxCI91e+Rpya0cS+/
         OsQcmtjBvBlTiAtG0+XeGXjMRuYIa9b6XjYMiWTpBcMEgx9RUhnPvGrB0ET9gMJTqsLl
         9ObA==
X-Gm-Message-State: AFuF++nGpYtdbCGLTNHc/eu/YK90kahlXxb2Q88DQGGS1KtvabdlT4Ak
	dG/W6f1fPgKdoLckVbEs7JOgrfbffKkSxS6ePXk0dbRQB30FXT1sGe895dcqpYGb
X-Gm-Gg: AYBFou3Omi4GGGwxjPpzjRb8CThxGqgbP51b+wKAjZDmFn1eYu8XSydMt9/uxn06fmC
	/ogx7U+qye2B++9mcTlRoExauvWulcAg7mIggPLdLdnq+j/er1YJoFvCinbtpKiX1U9XEs+O72L
	ylFiaVrpjgN5Bm+qLUW/RHVAwcyfmrZhFwHlVJxlhG4utoF3PalfkuW/va6Y54Dqjmwy54RXtsm
	xtNGmQhRMKXmiHcuQZdKAHnvg2YnkpHiaJz/B5Js2WAmu6DNyTM0swUgrZ+eqKv1UE+gNvgBMJh
	duk6HMDeuR3yBDtTl0fx29UnhqXUKjhBRdlrzjx3MNwPtZbHGMJVWZs0vWdfNYYOQbEfOalZGbK
	zgLYbbL6wvc1z0DLmrtxM007PMNFnWpC8xHIQHK3lzHhscA7ianKTHQxk51Icp5Lz5E9AxhHOYs
	1bvy27SWdEsEcY7HOF2W3SF1BRkWE+XAeCtHjZgiVpx/nOlK8t6QGEubIFX3xi+7rPXVKKnLlo
X-Received: by 2002:a05:690c:dc9:b0:873:17c9:afca with SMTP id 00721157ae682-884af455988mr32505057b3.29.1789242947517;
        Sat, 12 Sep 2026 12:55:47 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-88487ea6026sm22569527b3.32.2026.09.12.12.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 12:55:46 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 12 Sep 2026 15:55:43 -0400
Subject: [PATCH 1/3] xz: add arch-specific tuning for alpha
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-alpha-kernel-compression-v1-1-ce9d55330193@gmail.com>
References: <20260912-alpha-kernel-compression-v1-0-ce9d55330193@gmail.com>
In-Reply-To: <20260912-alpha-kernel-compression-v1-0-ce9d55330193@gmail.com>
To: Lasse Collin <lasse.collin@tukaani.org>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Nick Terrell <terrelln@fb.com>, 
 David Sterba <dsterba@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1237; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=6WBpY++pP4wmpap/0jVFlCXobQj6RCxIU3+Y23QnWmU=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLKWrrP3bfLPW3lE+iqTE+MCvXx+4yTf6EX3GjYt2tX/6
 /D5i33/Oz6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOaae3MY/ils79i75e
 nlO12C2Zdv35omH5VzkFN8i9JNRuF/dZ5NJzwYGZZ/0hP9xvTiRSXn6VxD05OT22b+if7TsuHwt
 LzV+10VV/EDAA==
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Alpha has fixed-length, 4-byte-aligned instructions and no XZ BCJ
filter, so it wants the same LZMA2 settings as the other 4-byte-aligned
targets. Without an entry it hits the default case, which warns

  scripts/xz_wrap.sh: Arch-specific tuning is missing for 'alpha'

and conservatively assumes 2-byte alignment. Alpha gains HAVE_KERNEL_XZ
later in this series; the correct alignment also shrinks a UP1500
kernel's XZ image from 6469320 to 6448840 bytes.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 scripts/xz_wrap.sh | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/xz_wrap.sh b/scripts/xz_wrap.sh
index f19369687030..5af0d9045cbc 100755
--- a/scripts/xz_wrap.sh
+++ b/scripts/xz_wrap.sh
@@ -10,6 +10,7 @@
 # XZ-compressed kernel isn't currently supported on every listed arch.
 #
 #   Arch        Align   Notes
+#   alpha         4
 #   arm          2/4    ARM and ARM-Thumb2
 #   arm64         4
 #   csky          2
@@ -44,6 +45,10 @@ BCJ=
 # Set the BCJ filter if one is available.
 # It must match the #ifdef usage in lib/decompress_unxz.c.
 case $SRCARCH in
+	alpha)
+		ALIGN=4
+		;;
+
 	arm)
 		if is_enabled CONFIG_THUMB2_KERNEL; then
 			ALIGN=2

-- 
2.54.0


Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6737B44AB95
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788518477; cv=none; b=BJUtIquai7didNHfFr9y/NBzebDsP/E/xivYmjmMLL65Oy5BjhF7/q1xGrz92aQat07NccKA8pGNjzce28eirxjXj6rEPYUXNIYPIiYfLGvr18xH4ymigJz3yUauN7dH2yMRlgsW8j45syKiKRuuremH1oGHq9u0GFGfjY8IVus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788518477; c=relaxed/simple;
	bh=qAMoU5VvG2ycHMCA+HEkihysJRjSyeGeDWWh2V1vMLA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Au8h2t9ApdGEXaUHNCwTdJqzyIasuh3aGZB0tX2svulqgHoKZdp6OUjU4iskgQaEYBTTEBcasSp/xzOKVYV26pgO988817UctestNPCf8Zc15Kq/aOx2qINZVU8XN9l6pQFrwJ21bfb1XNE91Y3dkBqxnHXYsaAz1+fUCMqP3qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eqBrispl; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eqBrispl"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7f4e596e393so875013a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788518474; x=1789123274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gbHB8X3TB8UIpQ4SSGqqJDBBoeCerCEXcuSI+3sPA2w=;
        b=eqBrispl160N8iH/69nDEq4Qg0RirTM3xPN/SEH+4Kmi+1Ceq/jLO2IjhHh7qhO5Oi
         3nW8ev3vbb+3l4X2fNR8F++Z3sybrD81+eXyX0rTbnXLN5G5fl9XuNvK04niCi767ky3
         jmOo0VtSqi78xpfcfyJdhUP121BgvWXMqthFfof2oROLxeFPL8kE4ItOnj3+pxHW3Mi9
         dGX8AJo0IKyp5rGxG4IsLCoveVxFv1SKx6m7TMnlQHFeLOg8caVvkxjh9qoeVuv9h5EO
         /Fqb7uIKwepuEIdBKKUcHrfqef6p1ykknYMirqSgRdgZzDQNSZPakL3JWY9dyoUK2aAI
         pP6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788518474; x=1789123274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gbHB8X3TB8UIpQ4SSGqqJDBBoeCerCEXcuSI+3sPA2w=;
        b=mal/6oXvc0EYKyeRm2qIzoH9eKKj/vJGfLgGbaFNyreZSiAMJdvOGkkcR/+AhPp4j8
         2Kfxp6cyZSnPXR7gM6rYcFZwMdDSosCj2dxS8ZgZOfd/c91yIhDTmNjeeSbHVGbxf6qR
         IP4iR4/fbomd/z4BMpa5j1hXnkPsNmQJqdyP3v7lZsJwm20rSoVdSsxGqMqUkW4C/nMC
         lfigWD57v0BkqHbnrvF0oPE+W9KNigAjIrz0pczQ+Rwo4RH6toxG4VUJcH1OjpuFB3xW
         wFftL2muC6YlSZ0k4H2k7Hnyx/D4FpT9eyqoBX1h0ofz9lLXjxqSHczeuy9fwPrH9Nm+
         17Xw==
X-Gm-Message-State: AFuF++kb3Qm8aJBYdEfpk56/LCu9WmE2LpSEUG6uE1WIVJfb77QixujQ
	pFFlZtua12gJ9en2WKhTwDMUwgmRIY4fh1wQFDSLqoYabBTG+Vf8eIO9
X-Gm-Gg: AYBFou1aHzp2qItBvKAK9V4qnsTLIkWCznl18kiTC1G2DF+m8cia2IM01Vo11J1QPC0
	X7ToqCGqEaCCoSn8ZdQ9IGJ8iRZpyyL1ujmwn7WhxSO5bDQi7+e0dTEjC5UjZneBDmU0HDfAOF2
	1iBxAwHHfBDLbF85n4FQRsqvVqW+Xy0OWWIqDYbI03QEEnJ1d7wGevNkQZAKKjvz6Wmk0G7YmKf
	MIX7bxDJKhjWNmzjE/uQ8JcBpFJVh1RZ1BMwzDbj/yO2rK4jDvGQJ605KwvN7LomB8FiJOGTtZj
	LdLmNCBQ4uc0ZEJs+JJ8+ljUMnGlTbwPI/qOYj8+lgTaI8zLepQyQQbWX8VX4t6iwakj4N+fptr
	Eu5hSKWpnl4jDfm6KpNaT27LoKKS0hfMx/k5l7QsE6/9m2dFeiiRIsEXiGqvGLhBQEP5PY2tQAb
	3ibP14ur4xNaz6Tyes1EUZ6E1fpxhLPT1chfii02PP9XvnkusxCuI1EC72dERhUWcbwDFXKomiB
	bbWQbqv8tynwYPM13BqcjRStgsUZ0dNPJJR/w==
X-Received: by 2002:a05:6820:4c09:b0:6b7:83c5:fdf4 with SMTP id 006d021491bc7-6b783c603ccmr1048794eaf.53.1788518473912;
        Fri, 04 Sep 2026 03:41:13 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435ec2bsm5319267c88.3.2026.09.04.03.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:41:13 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH 1/2] mdio-mux: fix typo "framwork" in comment
Date: Fri,  4 Sep 2026 16:11:04 +0530
Message-ID: <20260904104107.12832-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904104107.12832-1-hemanth.selam@gmail.com>
References: <20260904104107.12832-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "framwork" to "framework", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 include/linux/mdio-mux.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mdio-mux.h b/include/linux/mdio-mux.h
index a5d58f221939..e2af9cb8e017 100644
--- a/include/linux/mdio-mux.h
+++ b/include/linux/mdio-mux.h
@@ -1,5 +1,5 @@
 /*
- * MDIO bus multiplexer framwork.
+ * MDIO bus multiplexer framework.
  *
  * This file is subject to the terms and conditions of the GNU General Public
  * License.  See the file "COPYING" in the main directory of this archive
-- 
2.48.1


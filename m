Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00E53783AD
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 04:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788756433; cv=none; b=t2O+SxDhn0LwR9wcKhp0C3AUjW0VzUYJdnb5W6lf74T8cxiEvLREi3XE5NQRGjKLql5y5zt6JeA+xgslzx9LZmcG5gJaBPeiqTjtQxZDw6jWwMC+GQwQMdRwuU/fVnswR90RuTok1UOx04I9KYrs0d0k/VkV3Qp/RJJARSK5m9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788756433; c=relaxed/simple;
	bh=28CwM7uG1p3vuCzKbtzlq/qDnwNKbf0LJtWSP4H0WpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LiBm1GqkvruwITbEPNu7CBsVJK4sPOA9LLNsFKoqa4RHtt6ozHqnfwqzc2cCRIEF/6F1SDOtr40dfxyIWsMqoQG6tcgbu36NnYDXuR9P5rpuiBCLtYMrDUs8WbEIJjaONfSMcSg5s0lBeROrUBynnr2U/M1FB4qeLKZ+HE/tekM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EowoqGdB; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EowoqGdB"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2db3305f94fso19029435ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 21:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756431; x=1789361231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HKo7xCAaFCwynzSXE8UAxpEKoPZkRC4FGf6Fh0e3Vic=;
        b=EowoqGdBdKysovNE4nqQo5Qdu/Aj73V6UdiFK1+144eb3yMGvZ9G4aArLMjfmjhmR1
         q8Zcor6BW6lFmqQhdFkAQyxlQR+j7PW5BoVZJmZ8lFECFvYx5sBohUOI1GYB+xvOs73W
         1a72rrVIhPodvyyNGq3X7mf7rZ8haGOzzpSYOIDIEZVYc6WiB1NLIwCVjgHKkdtsDmCt
         fxU9oy00f6vXT7tIKkZGcH3zj7Lqe5zu/BClJsiwYuGy9TFX0vEgLeTKamwKItxrJDWb
         DSj19k410yemh3R4El+ttc8IbmxxldPDN1LYh/rxFidQCbavqq8I5hn4epzugN3szP9i
         lGXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756431; x=1789361231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HKo7xCAaFCwynzSXE8UAxpEKoPZkRC4FGf6Fh0e3Vic=;
        b=Hmgi5Xb0DUBLVHZ3MJkSjVhGfAhRarI/emqsjz8S/zhXaDEq9DxzYBfBWuHmsDT+1g
         ll9doEy2M4esC+noMTJQdZYgQeQ9IHAbdTX3MkkXS1jxtaxCc0OfhblKoV03u9eSHIQs
         hXOP6rir0oe5DRGoAkCWwhC8zwSsErRQNYV9Km+MnnT5SqTwstFy6kDJZARc4GjlOUPU
         zgV3oBfOMAnccUZJr8ztdcL7xLRTR2lgnGZsQE2KAdETJKaISEi3OhGj3itPdVBIb+25
         SV3UFmWLNQyatfnahfPVm2DlcxJIjRCAsj9/d2vGpvf50kE/btZtXiRE3VzlprE6FAKZ
         RFoA==
X-Forwarded-Encrypted: i=1; AKwUvByKhcBAi5/wBvp+h4tYcy8OoKUD8zzobull1inyiG70GcxYm/t8XyrX2mTuEQHMpdUpBeI4T+BGyDwPMho=@vger.kernel.org
X-Gm-Message-State: AFuF++nVMCgZpLMYh0IDAUqTXaLfdSamFZxNPpIRJgyouoZ3G0+gDKtw
	/Afd2in0Jcun7Aq+odIW91nhILkhFxvIn1rSAk/C+kDXt/9nB4wG4AM1
X-Gm-Gg: AYBFou2O51Sv4znutHgz+wT70Pps6yHo3CTtvTiog5bjXAYVuCxAvmeRMKlmBFZesOx
	cYw276gG8wezA/PzV22fPN/tHPDGbKma2pG5wc5bGBPH5JgM/VmXPA48mXzuHGJjFte7cu1pBYr
	K306aOzFEgHPViqqMw+kBJrk9d0C0Gj+DgdHm5MXSoq/TC4JO3Scdnu+A9WX6FrqUiHXOmlv0aM
	L4RtkIUCQp/PC82ngiIBWMYc2N2aTR0uS8sINh/112Y/0zC6CkAnGR4BX0WE4uMX4s7kVpPDQkv
	fFVk36fe692Zm6Gf+/EW9fAIRsXaDLOcFj5EwbEHi5BF5VAF7wHwmCeWySGcvXlEUMVpJr8Il3o
	9go7oyw5HKd3WL8cutK7UPSoEhFCwZzEhTI8rdJ0JFcVWIgCDowgxeOMxr9xuKGepim1SqT0nuO
	FLbWuP6aXUKzM83XIqDV6xwajsA6i6qIcWrXk9UPckwseKugEMIyEp6q0ClExE6BtDb4ymHDIbo
	d1iH7qGA8NpHA==
X-Received: by 2002:a17:902:c40e:b0:2d0:cc92:f7ae with SMTP id d9443c01a7336-2db125ce071mr279426685ad.3.1788756430578;
        Sun, 06 Sep 2026 21:47:10 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm37844565eec.16.2026.09.06.21.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:47:10 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Sudarsana Kalluru <skalluru@marvell.com>,
	Manish Chopra <manishc@marvell.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	Edward Cree <ecree.xilinx@gmail.com>,
	Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-net-drivers@amd.com,
	linux-kselftest@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 5/6] selftests: net: fix repeated word 'use' in comment
Date: Mon,  7 Sep 2026 10:16:34 +0530
Message-ID: <20260907044635.7141-6-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907044635.7141-1-hemanth.selam@gmail.com>
References: <20260907044635.7141-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the second 'use', reported by checkpatch.pl as a possible repeated
word.  Only touches a comment, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 tools/testing/selftests/net/xfrm_policy.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/xfrm_policy.sh b/tools/testing/selftests/net/xfrm_policy.sh
index 3eeeeffb4005..6294e49a46e0 100755
--- a/tools/testing/selftests/net/xfrm_policy.sh
+++ b/tools/testing/selftests/net/xfrm_policy.sh
@@ -242,7 +242,7 @@ check_exceptions()
 		echo "PASS: ping to .254 bypassed ipsec tunnel ($logpostfix)"
 	fi
 
-	# ping to .253 should use use ipsec due to direct policy exception.
+	# ping to .253 should use ipsec due to direct policy exception.
 	check_xfrm 1 253
 	if [ $? -ne 0 ]; then
 		echo "FAIL: expected ping to .253 to use ipsec tunnel ($logpostfix)"

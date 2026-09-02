Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD97040DB45
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 21:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788384309; cv=none; b=RV7MpfzmrsKgAWTnoiH2vM/Rh8jQrUMX+7O+v77Vh/aPzT2+XvEbKV0fu6GSfa8TCFuW93gM/OXWUeuBacvT8nRxodxCUdIeqa08is19yAUGtqcOZcw/ESkCYCyy7CIc8b7OghAkvwpuHVr8slV3k8imAReo4Q/oVGoqxLUjAXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788384309; c=relaxed/simple;
	bh=TC6K4z7ck8SSx5BuirQQfQ7OTQjsbasn05mpdHufobA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GAPioesqZPARkigTikUQ+gijbTszCFhROEfdord5nR8OZ0YUGhWtw3/TNWlr+3Wy23wP2d+VzhcAAgyhRMbM1RoAFAYTxwJ9ZyY+iSzQAK7ki1PPHxm9RqsRlEGvouvePnJIdygdUHUnYJzoxbnbP364WXx0tk4FYE3nC+4uFE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O/XoD/QN; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O/XoD/QN"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-854f8068301so975125b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 14:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788384299; x=1788989099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J5D1dk8TTzni4YmYfyjK0gzjxKAFCRBFSbYWu7aGl84=;
        b=O/XoD/QNgJwKDgH9GWtt6yf2dlOWchDpgl3FXS/MUqrZv1FLh48/suVWfzsQo0x26l
         ozEraiYlB2kX2+XVmUf/vRCR+kJvauRMTUviEvYr1zh2ZCRUgtVapOGJRQxX7k9s1bGD
         bjMMhkVQxbw80NVoQZGKa6N7iAI+ydH6Log/1aZuUTiVftCSN9l34Rw1R9cNxvPfRvX+
         RqHCfRz3gZvHHQ6hhUuMQ0EhllK3xgvw6D8K7E//n8N9WjIqeiYgmBsfEgqG24Xl9Hjb
         9/aYFTJLZe/+WHpTwahWOkfZlirrm1WTlsXBVK69L8UkjmfXCognEiP2gF1BMPJeblxp
         nasA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788384299; x=1788989099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J5D1dk8TTzni4YmYfyjK0gzjxKAFCRBFSbYWu7aGl84=;
        b=PUPLq5OVRr0oMoqFFN0h6uDKUzpu3Eu7X8EEa262wbZBtMr8WvB91b866GHf+9kd/i
         WyM6fh+fr4dwUZyu9gonuC6T196BcCe2lNV/SCItWo0gQUR8igCDpRmBQD6tRVCfM3GE
         NeImWmyfRonXOUQ8sL7cV8T9q7USexHdy/CIGoTuqUvgHOqHILrkh0i0SBOYLJnblwop
         Tp8K+87QhM2BxlgSpf17VElXkkd9VI3D6rjjqVrg7dTCxJVCQtAKOVjc6Y9IWuS9f0ok
         gGxYzIrv9ZduHBaT4TU3oHynmOtORp5xQegAvX7SOY5p0x8qwLngwABBy1mcj8T+bBzA
         o/vg==
X-Forwarded-Encrypted: i=1; AKwUvByBNA57LKWGdSRhHMAY4Pue8a4ameVRy4geK19jQ0Tx1+BK8gcwuDQjEa7z4TVpFsIUBgyUoyZ2SR8Npzg=@vger.kernel.org
X-Gm-Message-State: AFuF++mPB/eB7mQOLg7SwBigmjnj+r02FnpwdzlJoRft+Ux0ublOJuGg
	uFbQ3txmI9j3zAjMVrg7QtjJ2NR4/iuVghqPuqXH2dpsiIQqyv7igzRn
X-Gm-Gg: AYBFou05HHCfoXHUKdbWYMcmivKDvNiuDxQQN0eAhRXctCfTlxy1Zh4vrUHXRSNPxqB
	tF7y8bdkCGeE9c5I64czGB4p5kBUEk1d/ubvHPqtqjRYRjGqlpUFjtZWe88U2reeC54vHmW07lF
	AULc3f/zLMesCsu6Q9LAi1+vIVX6GFwuIzKum7SRK71CAwiLiCB6TZ9QmRZX79wfiVnOZIX+mHG
	Xk/EiTHCKt4vvJDbMva1Wsv2YBOh4fO9a+jxO7wrAiKBb8kA+uBKNHvoPaTF4x+PmeO3XioMTI0
	rAeD5EhFcLQTyI8V0qvcuC8MyE4SAp8ekIMmJww8MD+7G3U//qCA6DbMoJRKRvBcRDHzBEqhgeu
	3V++jyYy0XL2oNDOUGBFaRr3Sc/QHPhppEtLzYsFAJE2ygLIa2VqakWGjFhZZFUZALvxgUmBJfD
	WmJAYHe6F9Hb3MVYzgUzKk73puNrV7DSfBt1voapAokXMgeyvZFbykogsclD48vrHffZN7prXfH
	bRX7zHkVeTek09WgMiKrqF5jhIqSrpreU24o22jVOq/VabRXBqSnbvVJ5aLNV+mkkdhaK5OZ3aM
	vtM3151SeM8mR3VcJGGsz9LJ1aO+M4WCMYY2Sg==
X-Received: by 2002:a05:6a21:1644:b0:3d0:c5c0:d9b3 with SMTP id adf61e73a8af0-3d9ae3baf35mr13245780637.18.1788384298968;
        Wed, 02 Sep 2026 14:24:58 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc43d40c55fsm90890a12.19.2026.09.02.14.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 14:24:57 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-i2c@vger.kernel.org
Cc: Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2 0/3] use devm and get irq in probe
Date: Wed,  2 Sep 2026 14:24:53 -0700
Message-ID: <20260902212456.289608-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplifies probe slightly and handles potential -EPROBE_DEFER a bit better.

v2: reword descriptions slightly. Handle iic_force_poll before getting the irq.

Rosen Penev (3):
  i2c: ibm_iic: ioremap with platform pointer
  i2c: ibm_iic: get the irq early in probe
  i2c: ibm_iic: use devm for main allocation

 drivers/i2c/busses/i2c-ibm_iic.c | 65 +++++++++++++++-----------------
 1 file changed, 31 insertions(+), 34 deletions(-)

-- 
2.55.0


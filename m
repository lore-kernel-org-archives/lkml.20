Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E644C10EA
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 14:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791470754; cv=none; b=sVb6QpcHKFhWbKXmpE9ueMSmmfgRwhXFVCYANMbR746yjKZLjcNUWC1MSwjPwVxDPGO3ZW6t0uz+So/H2bJQQThm/ldNSPrV51M5Ulfxlc02031Q91h245FoLWJSZUFAiCkCLqL7J9jyq7NhHDJT/oJ2JZVBjpsxn9gc7OHPYng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791470754; c=relaxed/simple;
	bh=QWiEB4RSp+V5dH/Aqgan5cJwk52VX6Ezefo/QbSJRDo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kjDHjGu730g5Jj9O7PL1AX9NnGDVpSImkTk8G1Btf7+5k40s+FsDikJjvq26sIKMZB5aAZFACeEwndLdxV/KJUu2lTlmaMunoI0u6F8NGa4j0Q7Ld791JJXYCXpxkd3ABsihxyBg8fb7+buau1FyPfTbPUuBEqyFWVc+WECzF0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IjcKIrXu; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IjcKIrXu"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-34c4a0868b6so4907158eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 07:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791470746; x=1792075546; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=j461oAza6kS+xdmD4uBj9+ZclxkG9bJ1dHy6LksUEcc=;
        b=IjcKIrXuDd07i4JEO77UIWs+t/F2XhdlV87wEUaxb/jFhJA9sbLeb8pWl5blS2YDsi
         biJKt+hz7GULWp9p1fQoPR3lX29DtuUWcs/AH3VAIwBQUHW+jzl1afA38CNVK/OQzIb8
         +Z3Zzj4w+niFJ+AJ1mpmkg1zpY4nzeFjH320u0BjnjLn95Bc1KBoyWBh/yAsSMR8CY+5
         MlMtY//M306gy7jQglNwvhijXN/VeS2abtK6DNWyNBO7ZEXrFwE2FLmltaWqf7JI4zoh
         KgAs8xPvC//dJK7k//s+bI+8kmsH+NhYKn29TY9KAeSZqerKTK15DBCjmHuzAs162+BA
         yx6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791470746; x=1792075546;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=j461oAza6kS+xdmD4uBj9+ZclxkG9bJ1dHy6LksUEcc=;
        b=bUdK4xp2i4VjOfpbxkwKuVRmj9NTP45rXF/mMR95KTfk0HUkmNvljdcbR9fEthEWva
         1FdsLCtaQR0YqJ6DubmZ6he8i1baGFkraa5b2BfI8TluYn1hM1o+UwhHIC1YWa6wJH/T
         DhJLzpRLiwGAqqZIXmYzV70z7mU4y2Nemh2S7p/7lekOr5KxOxBJU4bYXf+DmvBTp99/
         KTW40vGGWvm2q4P+dAMObCHgCiYo1ShrmzRjzhr5w8PKNSvWyRv5aa3u2/OZ7Ejppnua
         fXplU8gwnaww5OniuJnQUQkEfuBimJsXiaMbN3Uf6E3vWqHwqTnTrIbv46iBCSruOjRm
         MyIw==
X-Forwarded-Encrypted: i=1; AKwUvBwm+XZJ3LJILwJ05mqEVYMlPFAWvv3Ngtn7jL4Xc7qKhHYuSxra/URW9/crUP7rp8yeIDdMEjk/fpu6xms=@vger.kernel.org
X-Gm-Message-State: AFuF++mdQWysn68x5bbZOn9JsglS/VvxW9Jdvlrz49c0IRJ5+Cg/8F2e
	9R3VMKNh8p2LJp3TujWJIqWSFLDLTizNunkzxUhAhMw6wv99ze5cCPc2
X-Gm-Gg: AYBFou04u0ksr1NzIgyhMPlLcLfd+2yHd7kmXYaJ2+JeFsB6mGrlEc0ufjbjusbOMaA
	qPl43xKo3J5B+DtbuzKMIR5re3zIMrM2Ng3sMteeBN9LVLZKht6VfTmKvwyh1l8Y+1M3KeoeH45
	canAjO3bkEnSGRCeEiqh+5UXDBnfBMBRJQ0TeZfXyP0C6tRuRmmUPLPJE9pAeS7SdKeJsT1TDRa
	dxF76HZ5s3sK6OJ5c/3gcNUDJPgEnu//VYZ2JbZK4oO7Uer3XvXSc1joLRUiTmkT5zqYoVBBxeq
	j7NG4ZWXn6U8BPCJUXppgHNeVHza5tUgLV9x3xyFrvSA6oon34vPWrkxV3xiEydkW45A8Rf4siJ
	G1K2lNqxifyNLWbSF54pk/2wZ7DRPJeVy2YntwyrAblZyVD0rssVSVtjoAfyW05fgL+1RYdYTR7
	9Srtr/Wo/kW0RrBHtVZcimlXkWyjHyVaHKKs9SVTY+cysKjTyvUX8HHjvXfFjJMGK/Qw==
X-Received: by 2002:a05:7301:1291:b0:343:5f5f:eef0 with SMTP id 5a478bee46e88-351778bb61fmr4464528eec.21.1791470745880;
        Thu, 08 Oct 2026 07:45:45 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515aff5dd6sm17913731eec.26.2026.10.08.07.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:45:44 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Subject: [PATCH 0/2] selftests: ublk: fix the fault_inject delay
Date: Thu, 08 Oct 2026 22:45:38 +0800
Message-Id: <20261008-bug-ublk-selftest-fault-inject-delay-v1-0-a96af7ead06e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJKsx2oC/x3NQQrCMBBA0auUWTuQhBDEq4iLSTupoyFKJilK6
 d0NLt/m/x2Uq7DCZdqh8iYqrzJgTxPMdyoroyzD4IwL1pgzxr5ij/mJyjk11oaJem4o5cFzw4U
 zfdEHJm99JOcCjNS7cpLPf3O9HccPoattinYAAAA=
To: Ming Lei <tom.leiming@gmail.com>, Shuah Khan <shuah@kernel.org>, 
 Jens Axboe <axboe@kernel.dk>, Uday Shankar <ushankar@purestorage.com>
Cc: Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

The delay set by --delay_us on the fault_inject target is lost in two
ways. Its timespec is read after it has gone out of scope, which makes
generic_06 fail, and any other completion on the ring ends it early when
more than one I/O is in flight. Patch 1 keeps the timespec alive until
the SQE is submitted, and patch 2 makes the delay a pure timeout.

With both patches, a 1 s delay holds every I/O for 1.000 s at queue
depth 4.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
Qiliang Yuan (2):
      selftests: ublk: don't keep the fault_inject timespec on the stack
      selftests: ublk: make the fault_inject delay a pure timeout

 tools/testing/selftests/ublk/fault_inject.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)
---
base-commit: e1274a6bc40a4618f6fbaebbdc51cca865d51bed
change-id: 20261008-bug-ublk-selftest-fault-inject-delay-46ea414ba226

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>


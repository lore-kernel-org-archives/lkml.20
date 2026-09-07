Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C39D2DEA61
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 04:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788756284; cv=none; b=LtFWZq4Q2hC3k7hafE81JU2fXEN+QlWl2FdES65qRCCrWifxAkFALnbWdQ/7YMvR4dXxL60xmjxQM7hsL4e7gu9FFyoXEEuWFpksN2t42mQmCslQnK6E/epIbyeOjpBWQFs4z5ejwXvbciKCnCol4EYJ0fihfOmZcNMlf2pQD4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788756284; c=relaxed/simple;
	bh=ISslVk0idEPj7E8QqGvX7pQ3utIJ/ZKVkkttDiU8+jk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BC4sdvGo3yaZKLuF0fNRjM+ZE1WlIa3Vy99CN6XWaukU/u8OGrA9iGfTZ8Af8jzu+rcpDC8mtL0jKzQ5pHXUw5q/NiY7NxtUMDgyZn0ixxTBvjYBLFNPUvYaA5sQUWl5IZY9JzwjLFgpL4TIRUDYMrA3kmm6UVd8OFtl0rSmxVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gxFodInM; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gxFodInM"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc1b838f9b6so3383140a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 21:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756283; x=1789361083; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tEZDkgun1SxnDcq7CXUxTgN3EXXb5PDIeu9LnAI4BVA=;
        b=gxFodInMO3dgr8EB1INb/DmeIPnllFpru4Tm7fPSy1fk9KZaIBeEDFSdHmTVDCPIw4
         E4uC74XppQYtbmmN8V4ZzwOM1ojubEVJFyrQAGFft/l0F+PA08elarzNmvp1zrGClxe5
         pyIqtmrMPNWbL202sQ67X2DFEr7b1atJ+kKK9fFFK6cOv2Ev3hrNLBPGmeyEMr8zcjkT
         TfOK0fNPspsM8vkcNQjUHpdVWGnPB81OVxuTbmkZVltPA2MfcMLztMqgi6nruLOmXlWA
         0lU+/5KQ21xPWrrIapVXGKJWUue5U8WW4NEEW3o6Jax7rqBh0DFAZmHH6lksWLLQCOFU
         GfwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756283; x=1789361083;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tEZDkgun1SxnDcq7CXUxTgN3EXXb5PDIeu9LnAI4BVA=;
        b=kTQNu1T1wq7gDjPdwIHTZv6HfsrlBVnUrF6Y5LdHc2yJMJ8sosXwUgbGYIGEHUPJU1
         ATUwtenyATyp1bH7vVwpOexl/AjtVxOnF6x7K2XjWJMFY2/iTEv9yHHvX8csL/BBvHIF
         OQ3cuZv1zOSv6vNqwGhcdengssdOwYP/JJdYsz1nK2Nl4bqBpLpIyWuxs65bI5L4uHX5
         +lw4yUuZ8yNThLr9codNp52+MDD4at5OrJJB8GohK9AshuLkv96oop+vaMmyPSoSP5a4
         2ZdQntN5t3EtgHT5U8yNruUh/UIQ5+y2eBUN5ChvkojCT+4OAmJi/5TtYA/4sHbut6hG
         cLhw==
X-Forwarded-Encrypted: i=1; AKwUvBy+iugf7IsK1B94KckxqDLkoHrHuRtFKyiCb+EdCyORPqfMRBiDK3wP0IE43W5H00Mi2HkeOdpRK1gTkgc=@vger.kernel.org
X-Gm-Message-State: AFuF++m2zgpEKEClz3CDxZVr5vOCyInjBCBXYL7kSfZHdZaKCkixvd9m
	r8HM8x1jMUZJHnjZ6eqA0zMxP8Y2hgqkEKM+Oh6FrM29d9GFkiUerHVj
X-Gm-Gg: AYBFou0mo8AtV3YZWiKxBEVifH+2SPE3LtF53ZPqru2xXPth0amAqc9vzMdNz2wnZD4
	YTYPlFUQ/yUkrhJOXO62Rlh+JIGjAtDOWUu7i5DFdOpqVBL0dQBf3Hg1CkHp0w+JPu9tcEdUGwq
	IFCRaLsQSutCemP0M+yRjP7rq6ZPdtxjbRhBFSRnaAwRgG9qhUVOF9vlIxzTSBjx6wuC6yzZMXa
	wDc+dUoZ1fk2MiI7EYeQFtpNANBIVdtohQUWc73Wsi2HRo6k9kAlYAXz4ZYgz7CbN/2b0+JPjcI
	Ad52QTxbPhJ4PREy88C968lFi2RC6DkA2lFzDBcPVtd/XQYmNsHe9Zv0RnK8g/Dn26HXXcwO2GY
	zl32sw/f5rMSNv1V9b+a3V/msUGVMllsDpkpZtlIM8VCp5S5AaLkl/7GkH5I/dGqoYU5TdA+gT0
	Zl+y3GV/9p5mNDRiWzJRXelgypM+/9dEsU7TVHhkrKHBP9jhOcpVjHMMJsYjq8RiVu4HDH0vUcS
	UrGrOy9B6kGvQ==
X-Received: by 2002:a17:90b:2ecd:b0:396:40e6:f631 with SMTP id 98e67ed59e1d1-39b2609f306mr35329992a91.3.1788756282789;
        Sun, 06 Sep 2026 21:44:42 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm37823751eec.16.2026.09.06.21.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:44:42 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v2 0/3] arm64: fix typos in comments
Date: Mon,  7 Sep 2026 10:14:31 +0530
Message-ID: <20260907044434.4682-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is v2 of the spelling fixes for this tree.

Changes since v1:
The pauth.c change is corrected: the doubled 'is' is a misspelt 'it is',
so v1 deleted the wrong word.  Spotted by Fuad Tabba.

Only comments change; no code is touched.

 arch/arm64/kvm/hyp/entry.S                           | 2 +-
 arch/arm64/kvm/pauth.c                               | 2 +-
 tools/testing/selftests/kvm/arm64/debug-exceptions.c | 2 +-
 tools/testing/selftests/kvm/arm64/hypercalls.c       | 4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)


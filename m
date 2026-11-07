Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794036830;
	b=Rvdj8WVOdgy4tDdULh0rcNFoD5b+Ude7PycvAKZF/nKvubxVZ7U3G0lvHvLW3intaED1
	 hQwfvaBfVdwhfOhsiC9TKh8sJqsx0NEdrNRG7OZtMHcMv/cErekBkZQyjpMSHkkz3kZHE
	 1s4bb3BJr4JC72q8oOZLbHnwj22PDEwGF6fS9I9oGWLIPdiP7g3cApPX0inleB2iOR32N
	 gGGGdyoGmQ+OdYOyOkvR/MOyvDGmGxvQHsR2cWEcdui8XDq8G+MieM0a+ZHcTc736t/rj
	 tx/cos7MSCeMjBNwoDZsa8qxDMqGcnv991VrkgXrA9KRepI8aH0qrQUp24lMIWUtMQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794036830;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YFZRmCfQkWp9l98IMbH5VkBf2tDBMZN1QOvzm/n0/Ek=;
	b=5l4Cp4OSmI0j3ZZYSPlnVlbjjgNX9gDOBVF/bD9AQGwpZgDs9+2fdhVKUbC8kBPlDoYK
	 yxUN55Rh0dQod3ZJ2tULBe53XKOQwVCjDr5SRhPPd6rLKcrVJ2RK3QKHq6BJe/FmNbbhZ
	 R6GIgAGL6ahULPTUnQ6elmn7IITl0DDwmO+tWkxTBARnyCBvqtCTbGPGXuLPvyQ8s9BcD
	 xB2Qcw4nc/xK/8uYoSFPq5huvR+auhN8kRuDQFcl24kffnCAmnV+mwKeSg1qNyH8OrTpF
	 pn6aQAYunRjs8c884TDFRMuDh6Nq6BmAzVRhwmqhqOT36I73Py3J8KfF7/SE+8yvrEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OrpxnUKZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C7F606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 07:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OrpxnUKZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E091B1F0089F;
	Sat,  7 Nov 2026 07:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794036829;
	bh=YFZRmCfQkWp9l98IMbH5VkBf2tDBMZN1QOvzm/n0/Ek=;
	h=From:To:Cc:Subject:Date;
	b=OrpxnUKZ9n9S2pN6xJmZV65t8uBDUFiJ4lH0YwEi2xm3FWo8q+0fcd+4HzXfczeoP
	 2uutuIREt3xoDSKJzOlrSJu2lZNdHg7uOQlMwzXOFkADgWCq3QCYGpCzHN2kNIAwdC
	 15u3DioQMCR41YjiXY/FKcKdcshWKH6myFG2ziGYD4OadAFCOyPVBCA6eYv21eZrPw
	 NMCP+FELW1efVOmW2gvhmW9pzkxozKYI6mjYSWgJkyJAcOXdNBt/s/cRPEl6TnKiib
	 k1lqCbtLnrA7K4/gdFk1diN7VwBaFIp70t3VuFWeikG5C6o8kHcvRhPIGU7hgoHNEQ
	 yFnbSQmlKpCqg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Tejun Heo <tj@kernel.org>,
	Dennis Zhou <dennis@kernel.org>,
	Christoph Lameter <cl@gentwo.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org
Subject: [PATCH 0/4] arm64: Fix instrumentation escapes from noinstr path
Date: Sat,  7 Nov 2026 15:13:35 +0800
Message-ID: <20261107071339.17467-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Code marked with noinstr can only safely call other noinstr or
__always_inline functions. When reading arm64 source code, I found
necessary noinstr markers is missing somewhere. So I asked AI to scan
the arm64, this series is the result.

Jisheng Zhang (4):
  arm64: percpu: Always inline helpers used by noinstr code
  arm64: entry: Always inline helpers used by non-instrumentable paths
  arm64: stacktrace: Always inline internal stack boundary helpers
  arm64: alternatives: Make branch and ADRP offset helpers noinst

 arch/arm64/include/asm/cpufeature.h        |  8 +--
 arch/arm64/include/asm/entry-common.h      |  2 +-
 arch/arm64/include/asm/fpsimd.h            |  4 +-
 arch/arm64/include/asm/mte-kasan.h         |  4 +-
 arch/arm64/include/asm/mte.h               |  6 +--
 arch/arm64/include/asm/percpu.h            |  6 +--
 arch/arm64/include/asm/stacktrace.h        | 16 +++---
 arch/arm64/include/asm/stacktrace/common.h | 12 ++---
 arch/arm64/lib/insn.c                      | 57 ++++++++++++++--------
 9 files changed, 66 insertions(+), 49 deletions(-)

-- 
2.55.0


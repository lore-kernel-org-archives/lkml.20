Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793275667;
	b=5TcwB9XMMz+DE2291OPb5hqLUmJx/qxh81tb0hs+oaGGCNZgHW9bpotNXXQJLzBUQvxr
	 LDE4rnZ2NZQIIs63+JbpYaxJWG21QZHOlFLn8CKLk7IEWjKebXr34nJ+JG/qgWBbhc0eK
	 FW/EdMgK6Mta74A5ScH6e72DdpFDLSJy07igx9TaaYXTN9W6OhrlmXqK4yo9H+9YzkIcr
	 8HIvrvmc3IQiN7N6yNpiUpAzUIYChkmeeuInTYgl0WzbVLoTiSEYoTE5bt3BMRofGPO2y
	 GfKao3/7kGg7zNBFvoutHMZf3M7EXuqXIQzRajw2OSCcbDjvz6KG606XEZmdw449u9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793275667;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=inpyt3Rrb7RnvCQP0qSRx5Fwr/dkOoWZ2t8y/zEuWDc=;
	b=2l8jRTjvaDoG5k1rHUi/to17HNxT8JRRPPPdIq+VB3Ny2u0T1lHWlOqy+CSYr1Tox2yt
	 Sp1mGzwmEBedYW5CAHKgRpubBtOrLHC/Z6Orc2kxYLvQVAofIWerhADG4RhsVLt9hMIPp
	 xExsPXGn+8Vyy3EkOsdoOTNh2z/0euaUIiAhBY6eautfjqGge0P5xPynGQDOC0Kex3Xpo
	 AbjLbxonqKPdAIbS8qUpIa6fe/NzjmNwbe0F53w/69dCfKd5/ENb3Z1RkQpYaPDLwwyGZ
	 cW5iwpZwyvBxf3oc1OQmRub47+Kyir4kiQdDyAYTH0cdmH3WEshO+GJuAPyV8NcbKfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="bHTtW/Aw";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCB6606A326
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 12:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bHTtW/Aw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F328D1F031E0;
	Thu, 29 Oct 2026 12:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793275666;
	bh=inpyt3Rrb7RnvCQP0qSRx5Fwr/dkOoWZ2t8y/zEuWDc=;
	h=From:Date:Subject:To:Cc;
	b=bHTtW/AwHG6+/BFJ+L/1jf66oFYksGYaLDFUeWlYTcG3ebpWd0N7xkISM9U+wzFuI
	 PRg46AV7Abokc4xSwhCusoHAQmjlLhoQrKv44fOCAG2SHgEJMXH3bgK/E9Ba3kOegN
	 fkHBHE290wcMT37tIN+db4CxQ+WOsNjQJ//K1m/opM7VPG+n5wwrxjwzSh8F4jCgWm
	 XhYn9cih1wSHQiCFtyR9pg9yLxow3eJ6iPic2mI7fCGYMHkCxTcEB/7TK1alGuunFs
	 md/ALlZya8X5hgJ3COOFAK4sAggoO8dhqDZycrUqNbNRKcalyQ/e9Wy7uf1/2eXaI4
	 yy62EUa5u8gMA==
From: Michael Ellerman <mpe@kernel.org>
Date: Thu, 29 Oct 2026 23:07:12 +1100
Subject: [PATCH] riscv: defconfig: Disable COMPAT_BRK
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-compat-brk-v1-1-5b2cf86eb453@kernel.org>
X-B4-Tracking: v=1; b=H4sIAO8242oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAyNL3eT83ILEEt2komxdc3MzI7MUE9OkFJMkJaCGgqLUtMwKsGHRsbW
 1AL56+T5cAAAA
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Michael Ellerman <mpe@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1793275642; l=1793;
 i=mpe@kernel.org; h=from:subject:message-id;
 bh=M6mNXQk4Rnm5+SV8gIzGNpeDCGaYM+xtfU0KRGAdG6s=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgQtFOQ8VZI/Axk0Fks/N12S7JhYPye
 mYAoMsJQX+ym0QAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QNRGYIVXiRV+Peg96k3unoeKtipr/oFog0mT6Q6xxwSXInD5thnx7G8DfjTcmB3mM5lbtme44y3
 OKVy5o/Mblgw=
X-Developer-Key: i=mpe@kernel.org; a=openssh;
 fpr=SHA256:xCm/G0UENYxMIqGzk+n5LBC6uWXo4GA2D0VGpX86Mrw

COMPAT_BRK defaults to y, which disables brk (heap) randomisation by
default (ie. randomize_va_space=1 by default) for compatibility with
"ancient" binaries, in particular libc5 based binaries.

libc5 predates RISC-V, so there can't be any libc5 binaries for RISC-V.

COMPAT_BRK was introduced in 2008, commit 32a932332c8b
("brk randomization: introduce CONFIG_COMPAT_BRK"). But even then the
only non-libc5 binaries mentioned as being broken were ~5 year old
versions of emacs (see commit c1d171a00294 ("x86: randomize brk")).

Distro kernels for riscv64 also disable it, including Debian, Fedora,
openSUSE and Ubuntu. So even if there were riscv binaries out there
that rely on it, no mainstream distro would support them.

Most other architectures already disable COMPAT_BRK in their primary
defconfigs, including arm64, x86_64, powerpc, s390, loongarch and
sparc64, as do the riscv nommu defconfigs. It is also disabled in
kernel/configs/hardening.config.

So disable COMPAT_BRK in the riscv defconfig so that brk is randomised
by default, matching distro and other arch configs.

Signed-off-by: Michael Ellerman <mpe@kernel.org>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 04ae305d5511..933cbf2735ec 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -52,6 +52,7 @@ CONFIG_JUMP_LABEL=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_BLK_DEV_THROTTLING=y
+# CONFIG_COMPAT_BRK is not set
 CONFIG_SPARSEMEM_MANUAL=y
 CONFIG_NET=y
 CONFIG_PACKET=y

---
base-commit: 6d0933ae9d46674a6ea63a87e9e9ab4e662670c9
change-id: 20261029-compat-brk-77626d45bd4b

Best regards,
-- 
Michael Ellerman <mpe@kernel.org>


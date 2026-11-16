Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794832789;
	b=jGTIVgo5S29VEafT1EW7yS75EisAusiArOkDTI/fgiv0FkTtALYvn8uP8bt6Obe/xh0O
	 VhhJw3ClhRRtTFZ+tvWPshlBRmET66t9m/qNNLjJV2HlLlYesGrfw+oqJOgEAAekd4GBK
	 OuK4fl6cx6PELJrWE/ZgbALVCV2yZDPkJ7fsxS25GrbQ8z0eFeC7+SWHkUJgy0PmcOvag
	 yHqwFO42+aWeHVptuZCB+YM+d20jn4OW2kOogrFFb2qFSo+6jfJWPOXwSnNOQqWmcKKTh
	 gteFJMx4/XguNRIKCpxPlWLLtau31tJYm+118fGscBLIf0jmDVNA/gwEVKuWwz4nUIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794832789;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=qYZNH5ull+rUJX0GdeHnQBkscSp5iB8gNDpwy3jm5tE=;
	b=dehpu5EcyvmoG2tOpNGwmMIEeRBBT2mhvRvQqB3h/sHSPqh0WBXOqzxi/pv0k8+Gs9ww
	 C2yUUfOYCmWARnGdQWRwU9e8/PnDaa03S6NPk8/6ReEo1wSOMwlMtzNv8R5QIYuz2aO3Q
	 8uC6EEv/Vtfoc235StucoaKfnDU6/yITZ7tryHN03QKkhBWwVJRIqZviPTDHiBfhyakBg
	 LiFzGsfdoL9gyYcx4JuNIIbhqT7GICyGeIJwmulHSqvtA5J+/ajsECJ6C1lxXvVjh2YGE
	 YQJgzxE0aXC7l/IqVebxIsj2OjZG21KRqA/txm/2wIQaadRbeWn0vXylGZ0mWZ5txkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZsnHcRBA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BC7606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZsnHcRBA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 122281F000C4;
	Mon, 16 Nov 2026 12:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794832788;
	bh=qYZNH5ull+rUJX0GdeHnQBkscSp5iB8gNDpwy3jm5tE=;
	h=From:To:Cc:Subject:Date;
	b=ZsnHcRBA6e1Yi/2FIxcuHXX19o6EawdLxftZuOYsuh5Ycb8JTckTkrBBAGDXzwEWN
	 eydZiBv10WtNvOu77EYw1j6sWlVHhd7S2R/mYJoNMmgtdPNHkLojAqfiJRC0nbibyE
	 nCWHED5e/vk9hQJsuAU0ykRY05Apj4C5xk9wQ9TsNLNk9YpnR3aUE9Hj4+9xaTWHN+
	 IHzABSHdGxkww96sneXsaTiBJiGRR0zCX+nxA/X68yhPxcNgTeTKowJAehegq3qoDb
	 ejxWhAypmUFD8gd6+teSAvQIMLvjf7izavzAl7tgVYNyb79aqek6zcnE03st0Lt6M4
	 rrKGAxgZ5MawA==
From: Thorsten Blum <blum@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	"Pratyush Yadav (Google)" <pratyush@kernel.org>,
	Grzegorz Jaszczyk <jaszczyk@chromium.org>,
	Breno Leitao <leitao@debian.org>,
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
	Thorsten Blum <blum@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] x86/setup: Remove redundant RAMDISK_* definitions
Date: Mon, 16 Nov 2026 13:38:55 +0100
Message-ID: <20261116123855.173481-3-blum@kernel.org>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=969; i=blum@kernel.org; h=from:subject; bh=9Bt7UIx9bpUAaYAb7LYVUA2LSIIFr9dCi9y7UPQfOEI=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFm/fsbPeMYdm/je8eW/030blsyX/ry0Yl5rdE/VrFn3W 4TP3dU81VHKwiDGxSArpsjyYNaPGb6lNZWbTCJ2wsxhZQIZwsDFKQATqeBj+O+xWmvHX68Lb83D ljVbHrfxkDvzeVv2XdUvv7VjP65U2qDH8N/zWdTbjGWRTtyrS+yubXN7e0ucI+2int1strlXN+/ 9V8QEAA==
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

All three RAMDISK_* macros are already defined in asm/bootparam.h, and
only RAMDISK_IMAGE_START_MASK is used in setup.c.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/x86/kernel/setup.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index 19fc8e1714e6..fd45af11e0e1 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -36,6 +36,7 @@
 
 #include <asm/apic.h>
 #include <asm/bios_ebda.h>
+#include <asm/bootparam.h>
 #include <asm/bugs.h>
 #include <asm/cacheinfo.h>
 #include <asm/coco.h>
@@ -221,10 +222,6 @@ extern int root_mountflags;
 
 unsigned long saved_video_mode;
 
-#define RAMDISK_IMAGE_START_MASK	0x07FF
-#define RAMDISK_PROMPT_FLAG		0x8000
-#define RAMDISK_LOAD_FLAG		0x4000
-
 static char __initdata command_line[COMMAND_LINE_SIZE];
 #ifdef CONFIG_CMDLINE_BOOL
 char builtin_cmdline[COMMAND_LINE_SIZE] = CONFIG_CMDLINE;

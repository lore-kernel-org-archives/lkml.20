Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191ED3750CF
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790788221; cv=none; b=tcA3r1F99FGfllCxh9LAGUok1n4ASqQFIuXcoJ6XRnkszqXi+8y7btGzsIgxh/o3I97dtMJNjCsoVurEAfJqOvayjhY9AZDpxz+kAZoFUGgrTIUneWVzDKf/S8XTJc00eZAPaSjP8j9AaRHN5PmI+/fGqoiQUkgjEXO9k4BY0AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790788221; c=relaxed/simple;
	bh=ci1urjiWH/bMKD2Pezpdx3iZ8pWRRbO1MXaJKDV3p/k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NECszkoIoauO36gh/QbX6BtnEGjnUZnRQHU3OBNWXbxKP+a4EY1kLdRdoc+apPg/b+k5zMdwmuDO6Lx14zzg0DLHlY9babLR0vdCO0SNVOauU3tf0eEFbwIQSoab040vUHgRnSIDMuTAjhdpAaW4xkRam5zoaZh7bntx41pYhQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G9elaha4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G9elaha4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88B971F00898;
	Wed, 30 Sep 2026 17:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790788219;
	bh=tRE9jVcQaB9L5l25LliMME+MsBNb/ftr1C1a5utqkF4=;
	h=From:Date:Subject:To:Cc;
	b=G9elaha4xp8vDsr81R7A7TMT4RHsS2drLb2pLIJYTtzB2tZcZMMBLoziWg7NvacAg
	 PiC2KSFbHn+zOcaJULTpLQswSgXgcY56ssBEZZttGW8PGglfv+xFsMpXpWCj+COM71
	 dMaD6proXuuq4lX3b3KJ4igud879nSLYjMuHpa2SurYi7598j8s1kgaLOvvkpNJTwp
	 228rVcGigLzJU6gFZWULht+cP+Zz46cPMSXO6rrt/lm4zJKpzI0ssdV70TaaRvyHCj
	 CceQF6pdy+EZcaXrg2Jrol8grCf3TsgXOkplq71lcd4RabO9LIMv7PQgZ8zKXMJ8+m
	 W1gahRWU1iHJg==
From: Drew Fustini <fustini@kernel.org>
Date: Wed, 30 Sep 2026 10:10:18 -0700
Subject: [PATCH] MAINTAINERS: Move RISC-V T-Head SoC tree to kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-b4-thead-maintainers-tree-v1-1-12d077a36f4b@kernel.org>
X-B4-Tracking: v=1; b=H4sIAHlCvWoC/yXMwQrCMBCE4Vcpe3YhhhqMryIe0mZqVzDKbipC6
 bsb9TCH7zD/SgYVGJ26lRQvMXmUhv2uo3FO5QqW3Eze+eCijzz0XGekzPckpbZBjasC3IfJIxy
 iy/lI7f9UTPL+tc+Xv20ZbhjrN0jb9gHhZ9TCfQAAAA==
X-Change-ID: 20260929-b4-thead-maintainers-tree-46f2e6590dd8
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Drew Fustini <fustini@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1020; i=fustini@kernel.org;
 h=from:subject:message-id; bh=ci1urjiWH/bMKD2Pezpdx3iZ8pWRRbO1MXaJKDV3p/k=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWTtdar+5HDh6Ktb33uj1ZSKXlj1heoIthn9+Pmea4VT0
 ObOjVPSO0pZGMS4GGTFFFk2fci7sMQr9OuC+S+2wcxhZQIZwsDFKQATcT3M8M/2Ar9V+rIv7xkZ
 HWxyZJ91qy9NPeq98uu5pyunXfnN5JrJ8E/N878qd6v4ebklChylc1309nzge5M7d0furgntea3
 BT3kA
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010

Update the T-Head SoC entry to reflect that the branches are hosted on
kernel.org.

Signed-off-by: Drew Fustini <fustini@kernel.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da74d00c..7e8b59e1fc18 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23619,7 +23619,7 @@ M:	Fu Wei <wefu@redhat.com>
 L:	linux-riscv@lists.infradead.org
 S:	Maintained
 Q:	https://patchwork.kernel.org/project/riscv-thead/list/
-T:	git https://github.com/pdp7/linux.git
+T:	git https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git
 F:	Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
 F:	Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
 F:	Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260929-b4-thead-maintainers-tree-46f2e6590dd8

Best regards,
--  
Drew Fustini (Tenstorrent) <fustini@kernel.org>


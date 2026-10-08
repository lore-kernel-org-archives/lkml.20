Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE75F3C37A3
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 10:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791453689; cv=none; b=L1L3BdR9n+6qSEoH8a0xdF1CcjzWqd/PzZ8m2AN4SrNgdDYq8qGax9fThpKVrTXHQ7vUptD7lLkRewKzv2AdLjWpuOA1qlVSTk5fcryrHIb4Ig4ovgBk6EDQld5UR4HxtiUuObfdXpns+ph9+9mG3Hh+KdcOeZHEzxsKYaXd6w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791453689; c=relaxed/simple;
	bh=FFrjKrSzg18icEIMIFgfBg/1O3JCK+uZfrBM2shMOYg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VIBqvyJaEYUhT6lak+chTNwbIWKO1wYd7SZa3DKXY/wBh0GbaSRS6MxKcvkYGnQo2qntcT8OkFWCiOzfogO65vN65boGrTL7JFF7OXVsHFqF5babL6TJ20NugSbWEs9Ixqyac/Gw3EmYvPE4Tj0RWw9814Lu8XUgFAvKo+bbaqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lkblp1xy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lkblp1xy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F6221F000FF;
	Thu,  8 Oct 2026 10:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791453688;
	bh=58NOIAVU+aDuURCxpbJrXXes8s/Io5sAlBdycm4JRFA=;
	h=From:To:Cc:Subject:Date;
	b=Lkblp1xyZSpmcrLxwKlAefIc+lXUVWfL44eT2ZC43KYcivg9AdX0M6wIHkfM8/VOS
	 CSfRxG29TOaotIHR/6wUfVzEVjXmEzj5R5Z/1/sZR9dk6jUVnDevWJxhMpT5TjzuX9
	 3FsNPIGmBPxtL3TL07N8KioPdCULUcC4oyr52sgL4E7KhC5D88wxWc18e2FakuiQDF
	 b8yCsciEDZj3E8zqcCeut2xHyJJoSXt2klCOERyyo6u5L1sDr+BTMEWb3f3StdV7qW
	 AcGL6keM6+gXHkh2vCl8PVfSPiWvQxNCZZwQMFhYqMJp9lup9Qea0tqPjHL4y3rctK
	 OgCtFfYVtdZ0w==
From: Thorsten Blum <blum@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Cc: Thorsten Blum <blum@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] x86/early_printk: Use bool for the keep flag
Date: Thu,  8 Oct 2026 12:00:46 +0200
Message-ID: <20261008100047.184420-2-blum@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1168; i=blum@kernel.org; h=from:subject; bh=FFrjKrSzg18icEIMIFgfBg/1O3JCK+uZfrBM2shMOYg=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFnHM8+7fQyxSbj6vVLw6lzxV/dYRSTszE6fZW4RffFfP 6Shqpqpo5SFQYyLQVZMkeXBrB8zfEtrKjeZROyEmcPKBDKEgYtTACby+i8jw7kjgtv7166r2rLp 7sPO5d5rUzw4jNLFAkt+ZLqt8V91O4KR4c/J3acWXRPqNuJ27eo6+e6g6k9zm7B70k5XgmWS17S t4AEA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

The keep flag is only used as a boolean. Change its type to bool. Use
pr_crit() instead of printk(KERN_CRIT) while at it.

No functional change.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/x86/kernel/early_printk.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/early_printk.c b/arch/x86/kernel/early_printk.c
index cba75306e5b6..28e4ed9de17f 100644
--- a/arch/x86/kernel/early_printk.c
+++ b/arch/x86/kernel/early_printk.c
@@ -370,11 +370,10 @@ static struct console early_serial_console = {
 	.index =	-1,
 };
 
-static void early_console_register(struct console *con, int keep_early)
+static void early_console_register(struct console *con, bool keep_early)
 {
 	if (con->index != -1) {
-		printk(KERN_CRIT "ERROR: earlyprintk= %s already used\n",
-		       con->name);
+		pr_crit("ERROR: earlyprintk= %s already used\n", con->name);
 		return;
 	}
 	early_console = con;
@@ -387,7 +386,7 @@ static void early_console_register(struct console *con, int keep_early)
 
 static int __init setup_early_printk(char *buf)
 {
-	int keep;
+	bool keep;
 
 	if (!buf)
 		return 0;

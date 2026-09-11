Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB42729B76C;
	Fri, 11 Sep 2026 02:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789095576; cv=none; b=Ak6o86+m1/X6slMnocgCHBOAMrL6BfCsYPTKzi9jGnRMiFjKrt1kegMgWallPvXOb9CB1czHgQ4oyE0GM4Zo+2Goow7chmVhe+N2UVo69PoQqdStuKpTe8p8Ve519ZPIEkq2gTRt8nZrNDPxvmV+Nx5W+2aG5JOybPv+GVb6JGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789095576; c=relaxed/simple;
	bh=zA7Wsnvvnvjwjl7+SO9V70+t939fT0x50MX+ijDGZ2E=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=m8JoIWApoSNo2tvoam7kQGMc7QZcoJAo+FzBdfUVUi7SkG+z3H3nC33DRDMkBwzH2WqwyN24CTBIEMidt5VzW5/igMt6Uj4UtvRnP/rRfXcmiOQ/mg3svvaySFQ1OG8zT3FCM8x6VxTQhPUEPlbZz2Vsfs5nogoL7YVr1JUc6+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=yZtzWZ8p; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=cjKgCGZh; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="yZtzWZ8p";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cjKgCGZh"
Date: Fri, 11 Sep 2026 02:59:30 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789095572;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yfdu43UKtN26lW+YeSkxS8RErNn5YRHy8JcybcwQX3k=;
	b=yZtzWZ8phCjkTbEIqFfr4ozp5B6igoGePBee2QIg8O26FDMxY7HYqg4hvOen8ndgmAmUYt
	01JYF/wOLmaanuNT/wpUkLP0IdtB1fd/DJByPewTldCekO5BR0xamWaslvpI3aM78r36wN
	A4kaCmaBE2XmJ1IL4sT0n3cz25OikA66i+sAsk3xXcF9SAesjt1CSq+Mgm3i3vYy3aBZur
	Rx97wH5MJ7Xerel6SwEPB4S3URmUtD7RAJAxb3p9+UuQWpVDm5bRRv5zyQezN62DI2h+4V
	xAuPTmbd4tRUlbfHTtyZ34yXENQw5xgxzv15c5t2F6/LP9RskUfoR6dRgtHq9Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789095572;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yfdu43UKtN26lW+YeSkxS8RErNn5YRHy8JcybcwQX3k=;
	b=cjKgCGZh/BElnb3/POQSL+Kbbz3sFfAXvZRIV86CE2XE+EGQZOF6jjfV1cwzMQtTUn9C+G
	yGWRyR7RtP2qmRAA==
From: "tip-bot2 for Yazen Ghannam" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/urgent] x86/amd_node: Fix PCI device reference counting in
 amd_smn_init()
Cc: Sashiko <sashiko-bot@kernel.org>, Yazen Ghannam <yazen.ghannam@amd.com>,
 "Borislav Petkov (AMD)" <bp@alien8.de>,
 "Mario Limonciello (AMD)" <superm1@kernel.org>,  <stable@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260903154325.74343-1-yazen.ghannam@amd.com>
References: <20260903154325.74343-1-yazen.ghannam@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178909557054.623050.1361689103147231956.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/urgent branch of tip:

Commit-ID:     27600805e62f800bacf990354632eae4e487d34c
Gitweb:        https://git.kernel.org/tip/27600805e62f800bacf990354632eae4e48=
7d34c
Author:        Yazen Ghannam <yazen.ghannam@amd.com>
AuthorDate:    Thu, 03 Sep 2026 10:43:25 -05:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Thu, 10 Sep 2026 18:05:43 -07:00

x86/amd_node: Fix PCI device reference counting in amd_smn_init()

The local "root" pointer is a temporary variable used during the device
search. Therefore, refcount related to the search iterators should be cleaned
up after the search is complete.

Use the __free() cleanup macro to ensure the refcount is decremented when the
temporary pointer goes out of scope.

Additionally, increment the refcount when caching a root pointer. This ensures
the in-use refcount is separate from the temporary search refcounting.

Finally, drop the redundant "root =3D NULL" before the second search loop. The
pci_get_class() iterator always decrements the refcount of its "from"
argument, so the first loop can only fall through with "root" already NULL.

Fixes: 0a4b61d9c2e4 ("x86/amd_node: Fix AMD root device caching")
Closes: https://sashiko.dev/#/patchset/20260806160159.230453-1-jason.andryuk%=
40amd.com
Reported-by: Sashiko <sashiko-bot@kernel.org>
Assisted-by: LLM
Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Cc: <stable@kernel.org>
Link: https://patch.msgid.link/20260903154325.74343-1-yazen.ghannam@amd.com
---
 arch/x86/kernel/amd_node.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/amd_node.c b/arch/x86/kernel/amd_node.c
index 7625857..b7926ba 100644
--- a/arch/x86/kernel/amd_node.c
+++ b/arch/x86/kernel/amd_node.c
@@ -251,7 +251,7 @@ __setup("amd_smn_debugfs_enable", amd_smn_enable_dfs);
 static int __init amd_smn_init(void)
 {
 	u16 count, num_roots, roots_per_node, node, num_nodes;
-	struct pci_dev *root;
+	struct pci_dev *root __free(pci_dev_put) =3D NULL;
=20
 	if (!cpu_feature_enabled(X86_FEATURE_ZEN))
 		return 0;
@@ -262,7 +262,6 @@ static int __init amd_smn_init(void)
 		return 0;
=20
 	num_roots =3D 0;
-	root =3D NULL;
 	while ((root =3D get_next_root(root))) {
 		pci_dbg(root, "Reserving PCI config space\n");
=20
@@ -299,14 +298,13 @@ static int __init amd_smn_init(void)
=20
 	count =3D 0;
 	node =3D 0;
-	root =3D NULL;
 	while (node < num_nodes && (root =3D get_next_root(root))) {
 		/* Use one root for each node and skip the rest. */
 		if (count++ % roots_per_node)
 			continue;
=20
 		pci_dbg(root, "is root for AMD node %u\n", node);
-		amd_roots[node++] =3D root;
+		amd_roots[node++] =3D pci_dev_get(root);
 	}
=20
 	if (enable_dfs) {

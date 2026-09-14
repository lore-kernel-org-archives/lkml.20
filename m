Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA4941CB4C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789382577; cv=none; b=twcwWL4J6eaOe8i/Q7o6eFqtuLnVlkiNNuYpvSl1WzscJIL3oopPNAVKTqkGzZ/w0J8Bpqk4cgvuzXsStFmgYFR71YDTp4uro1qMmJs6dl4H2BU1aato29Jt+oPFXDqfK7nEd0WJnJGQiXTpAnsBYuDCGCavnK0KD/s3ZlskgNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789382577; c=relaxed/simple;
	bh=+BbvenQMNXTIOAVBoBW26VkcDlBYYGupfmkeRmBT70k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Eoc/R/i1iIpmU41L7nO5YbLkEB4okyDX3t6JGaQ+kYgS1tIINiPj+hH73cVfbXN/CT1pM194D2pS1YppgpOsONOUFr+Lkj1LDv++lEgZtOG/VZTxTPcRrBvpGZC6DvMqkvQlc51UGVl9f+2i5ttmJVN9PZCllFHH6PRNpZe+QGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K3sT7Gdo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K3sT7Gdo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7B6C1F000FF;
	Mon, 14 Sep 2026 10:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789382576;
	bh=ciCy+irl3CVqSBupfnZoZAqhk9D/bI5E8bqRZzqlV70=;
	h=From:To:Cc:Subject:Date;
	b=K3sT7GdouZcF/iLX7zGY1V45rI3nO/AFFRtzWEtUa2GIgCq02MRpr657Gzi6LUzED
	 Hb9aNNdp4oIqtp2Xdt+AUAZuJQxYWn7eVtCPl7ik0p5+YlKCIkcYdu5LiHmNyZntbK
	 m5u+eaeRJo2qF4eR1dPpl71NDovpPxrVfkc4ttbEuYUNrEuYgnyY7M1a0qXRGVT++E
	 3UAZKyqix/KGyaewuUen65Uk3h2FCJyzNJIX5x+9vxpqeVDEYEznR/sDg8RrZXxV+B
	 /IiPxytjQJe1etNHP54TR6a5PlAIP74Si2AMhWOlmmMZ8hZbScizCnedMVvUQlr2Ff
	 R+M94u5vhWr8g==
From: Thorsten Blum <blum@kernel.org>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Thorsten Blum <blum@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/boot: Simplify serial console control flow
Date: Mon, 14 Sep 2026 12:41:36 +0200
Message-ID: <20260914104136.74312-3-blum@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2032; i=blum@kernel.org; h=from:subject; bh=+BbvenQMNXTIOAVBoBW26VkcDlBYYGupfmkeRmBT70k=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFnLzycoupzoSOh705Z5S693+mvP40XRBqbzfrJt5HjR8 ipFZ8LPjlIWBjEuBlkxRZYHs37M8C2tqdxkErETZg4rE8gQBi5OAZjIbFaGP3wT76nole91PvuI I/rvAnuGlRV1vkWXHh5RsFWc7/KPyYvhr3S4wP37+7751ZeuOhUZc+PU8byr75vup0/KbEt2Xvb lKB8A
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

In serial_get_stdout_devp() and serial_console_init(), remove the goto
statements and return NULL and rc directly.

In serial_console_init(), handle errors early to reduce indentation.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/powerpc/boot/serial.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/boot/serial.c b/arch/powerpc/boot/serial.c
index 1d221ff420fd..f46943c21a22 100644
--- a/arch/powerpc/boot/serial.c
+++ b/arch/powerpc/boot/serial.c
@@ -87,19 +87,18 @@ static void *serial_get_stdout_devp(void)
 
 	devp = finddevice("/chosen");
 	if (devp == NULL)
-		goto err_out;
+		return NULL;
 
 	if (getprop(devp, "linux,stdout-path", path, MAX_PATH_LEN) > 0 ||
 		getprop(devp, "stdout-path", path, MAX_PATH_LEN) > 0) {
 		devp = finddevice(path);
 		if (devp == NULL)
-			goto err_out;
+			return NULL;
 
 		if ((getprop(devp, "device_type", devtype, sizeof(devtype)) > 0)
 				&& !strcmp(devtype, "serial"))
 			return devp;
 	}
-err_out:
 	return NULL;
 }
 
@@ -113,7 +112,7 @@ int serial_console_init(void)
 
 	devp = serial_get_stdout_devp();
 	if (devp == NULL)
-		goto err_out;
+		return rc;
 
 	if (dt_is_compatible(devp, "ns16550") ||
 	    dt_is_compatible(devp, "pnpPNP,501"))
@@ -134,19 +133,16 @@ int serial_console_init(void)
 		rc = opal_console_init(devp, &serial_cd);
 #endif
 
-	/* Add other serial console driver calls here */
+	if (rc)
+		return rc;
 
-	if (!rc) {
-		console_ops.open = serial_open;
-		console_ops.write = serial_write;
-		console_ops.close = serial_close;
-		console_ops.data = &serial_cd;
+	console_ops.open = serial_open;
+	console_ops.write = serial_write;
+	console_ops.close = serial_close;
+	console_ops.data = &serial_cd;
 
-		if (serial_cd.getc)
-			console_ops.edit_cmdline = serial_edit_cmdline;
+	if (serial_cd.getc)
+		console_ops.edit_cmdline = serial_edit_cmdline;
 
-		return 0;
-	}
-err_out:
-	return -1;
+	return 0;
 }

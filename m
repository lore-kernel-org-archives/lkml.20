Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A22F2D0C63
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789571602; cv=none; b=YZ8W/mh9SAvK777CKGYwXAi0XToQx5qrqJRKYNvehvar93n9FkpEEe7fF0nU6Vd9xqyPUmt2Su8wIcivqQpDEPl0gzI9xT+Aapa0c+1luOwb6iTaSI/mULZUdrZaMghHo4xwqrN9ku/VQVRgquUkcP83vWEBLvJkyqf5jT8s9Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789571602; c=relaxed/simple;
	bh=hkj1eYUfDe8QekhEvX19k7VsTERrsklhsYarx3TxM5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eRylhlMutInWaCFxsm3O0MzcWpTM7BMi0yMIPLEAN6CCjG5gSBQR1DTia6JJoV/PrLps0r4iCuJBTd18z+ZbdClkePN9Lj1rUSEMShjywIqeKXdEQ4KYe0WkDnTyqZFyDaAHRmZmpZ+mgWqydK9DwWunUquOjIjFtnkBuUWcz+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R1debaM0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R1debaM0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 164491F000FF;
	Wed, 16 Sep 2026 15:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789571601;
	bh=EfiDcpeJiDNKPvZl61Ff5PtwQjnEBlm97861RTojIS4=;
	h=From:To:Cc:Subject:Date;
	b=R1debaM03SBh1osZZ+x21/1BLJ7fdq57H8PS88WeA1QRyjNn1Fxqv6emg/X2wh4sD
	 dU+2TZt95mAwYcyxNKFWSwlA7BtGgvOEIEQkR/i87AemVLoMpCx5+/xUEYqy2Iai1A
	 QTbVdR7E6CthArqNyPDY2m1uxIRfNKsiuYMia4Pc32ntHCIR5LDMULsQ9x4TSr2HVI
	 p/lzV1xKpLnTNoRVHcv8Zq1AjC0xYIUTj0usBg+VKEdKA2LuXsdRbWBEjCOAc4ssVz
	 dnEKdEhEjvyK+3g/L5dLUis9AN5ngXDca7AN2BnYf3PCBY4KrR5QQ54ftsNlhJX0zn
	 VimiNyilaxSFA==
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
Subject: [PATCH] powerpc/sysfs: Remove redundant wait time clamps
Date: Wed, 16 Sep 2026 17:12:54 +0200
Message-ID: <20260916151254.120629-2-blum@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=953; i=blum@kernel.org; h=from:subject; bh=hkj1eYUfDe8QekhEvX19k7VsTERrsklhsYarx3TxM5Y=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFmrNn775Dxhdsz6i5ZSubf5H8lvez01sOBXA29ajuGl/ SF/wuUnd5SyMIhxMciKKbI8mPVjhm9pTeUmk4idMHNYmUCGMHBxCsBELuoz/GZZtWtut1vcTttz N2L22nTkqPbssFGXCun8+qq6uWda0wlGhsVC01v4Yr+utmAUbDs42yU59JqKCUPdnxiNB1kMbyR qeAA=
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

The wait times are u64 and cannot be negative. Remove the redundant
clamps.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/powerpc/kernel/sysfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/sysfs.c b/arch/powerpc/kernel/sysfs.c
index 329c1690b5ed..2100c5e2c821 100644
--- a/arch/powerpc/kernel/sysfs.c
+++ b/arch/powerpc/kernel/sysfs.c
@@ -338,7 +338,7 @@ static ssize_t show_pw20_wait_time(struct device *dev,
 		time = pw20_wt;
 	}
 
-	return sysfs_emit(buf, "%llu\n", time > 0 ? time : 0);
+	return sysfs_emit(buf, "%llu\n", time);
 }
 
 static void set_pw20_wait_entry_bit(void *val)
@@ -460,7 +460,7 @@ static ssize_t show_altivec_idle_wait_time(struct device *dev,
 		time = altivec_idle_wt;
 	}
 
-	return sysfs_emit(buf, "%llu\n", time > 0 ? time : 0);
+	return sysfs_emit(buf, "%llu\n", time);
 }
 
 static void set_altivec_idle_wait_entry_bit(void *val)

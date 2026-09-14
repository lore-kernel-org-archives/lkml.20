Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383C2351C13
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 21:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789423148; cv=none; b=LFet+GK/skAuoALiOzT6BhmLU88o9qVjOhEW7SEDSoDwdd5+JFYmT7+6/wUe+xV3+xbfnLwIKbDYOXoMI+AsbmCCoapfp75prre9K6dN8lAvF5Z03+NB7mvfaCZayV7CVDi7pQi7IfvQkBSxKxmZQkhiiJY8/ugHtzoaaHdPM7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789423148; c=relaxed/simple;
	bh=RX0WDJXWEEI7e/dXQep77AMT/tE7x4fspdCWYxL7dWI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kNJqifsckwgpNvS8THa2Fh36+k5TuJ50if36NWB3ozsbpon1Yuv9VwPya3f4l4uquuzWvN6Fr41erenH1UNPC8/pJZcfdvG1IIWr25GOF5iByTUgFUta8txSmbRtjYwk+WBSdla1Gw1iJ6fc0QTsoiYQFjPcBDMzb2ABiuamhdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TG+DkYh+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TG+DkYh+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 712561F000FF;
	Mon, 14 Sep 2026 21:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789423147;
	bh=10BkpJc4PjNAt5xN3gpTNWKZE08C1lHzMleua/sqrds=;
	h=From:To:Cc:Subject:Date;
	b=TG+DkYh+/3zm6wyq4ULPMxisV95apu7xTSEKg4Xgvp1tFIflUO9O3VDDqCKNWRWai
	 TGPTKLwwtwu9VYyejBb5tx2k+4N1qRXSCUpJiqKNWSWtpVsNDMFBMM450KM1j1vv/4
	 qj8xVSD9isPOiAMLDLdj8+2Gkc4oCnAbNjAEAK9n8LCwAYVv6hJqJ0cWSdB12Kctw3
	 7j/Pd5PJ0gs63+OgZp+N1xi07eRNXP3LKIfu+i7/OkNbldF1MqJ4Fw48rwS00AAvwg
	 jLdm2uDHtic7Eyyrg15dSPE3MauQl690M+LEIKbe5rz23VGtWF5YH2bRs25WCddvuG
	 +iCUuZ7onenBA==
From: Thorsten Blum <blum@kernel.org>
To: Geoff Levand <geoff@infradead.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: Thorsten Blum <blum@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/ps3: Simplify control flow in ps3_{virq,irq_plug}_setup()
Date: Mon, 14 Sep 2026 23:59:00 +0200
Message-ID: <20260914215900.84712-2-blum@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1989; i=blum@kernel.org; h=from:subject; bh=RX0WDJXWEEI7e/dXQep77AMT/tE7x4fspdCWYxL7dWI=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFkr8lQiBZaZ1P+PWvNif+4V09mxQk0LnPyjwuJ6dYsqZ wckFap3lLIwiHExyIopsjyY9WOGb2lN5SaTiJ0wc1iZQIYwcHEKwETOhDL8Zju6+MPG81JJDdLL PP7bpt6K85nN97Mx8UTjqcbfPlEJvxkZ2q9P11i9tOziu77/Uovn7z+0NXRXo4PY15Iozk1SOnE 7WQE=
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

In ps3_virq_setup() and ps3_irq_plug_setup(), remove the goto statements
and handle errors directly.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/powerpc/platforms/ps3/interrupt.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/platforms/ps3/interrupt.c b/arch/powerpc/platforms/ps3/interrupt.c
index a4ad4b49eef7..358611638258 100644
--- a/arch/powerpc/platforms/ps3/interrupt.c
+++ b/arch/powerpc/platforms/ps3/interrupt.c
@@ -184,8 +184,7 @@ static int ps3_virq_setup(enum ps3_cpu_binding cpu, unsigned long outlet,
 	if (!*virq) {
 		FAIL("%s:%d: irq_create_mapping failed: outlet %lu\n",
 			__func__, __LINE__, outlet);
-		result = -ENOMEM;
-		goto fail_create;
+		return -ENOMEM;
 	}
 
 	DBG("%s:%d: outlet %lu => cpu %u, virq %u\n", __func__, __LINE__,
@@ -196,17 +195,13 @@ static int ps3_virq_setup(enum ps3_cpu_binding cpu, unsigned long outlet,
 	if (result) {
 		FAIL("%s:%d: irq_set_chip_data failed\n",
 			__func__, __LINE__);
-		goto fail_set;
+		irq_dispose_mapping(*virq);
+		return result;
 	}
 
 	ps3_chip_mask(irq_get_irq_data(*virq));
 
 	return result;
-
-fail_set:
-	irq_dispose_mapping(*virq);
-fail_create:
-	return result;
 }
 
 /**
@@ -250,7 +245,7 @@ int ps3_irq_plug_setup(enum ps3_cpu_binding cpu, unsigned long outlet,
 
 	if (result) {
 		FAIL("%s:%d: ps3_virq_setup failed\n", __func__, __LINE__);
-		goto fail_setup;
+		return result;
 	}
 
 	pd = irq_get_chip_data(*virq);
@@ -263,16 +258,11 @@ int ps3_irq_plug_setup(enum ps3_cpu_binding cpu, unsigned long outlet,
 	if (result) {
 		FAIL("%s:%d: lv1_connect_irq_plug_ext failed: %s\n",
 		__func__, __LINE__, ps3_result(result));
-		result = -EPERM;
-		goto fail_connect;
+		ps3_virq_destroy(*virq);
+		return -EPERM;
 	}
 
 	return result;
-
-fail_connect:
-	ps3_virq_destroy(*virq);
-fail_setup:
-	return result;
 }
 EXPORT_SYMBOL_GPL(ps3_irq_plug_setup);
 

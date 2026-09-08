Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702125650F2;
	Tue,  8 Sep 2026 15:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788882863; cv=none; b=CRFNuhVSUCOmk91ghhEVnlDjq5SjBTKreYwmwowoCAMw9ROjl3oXIeWQC4kf15AlqNJ4Y4IUjsVOKpndHRBlTOg48tZWQWcgzm798PqVs/dvqOPjylkAvT4WijJZJX5GnDXobX/kU4MIfMUn5MFwAOfvck8Lt3I1ppUWu4Xs5Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788882863; c=relaxed/simple;
	bh=PKcu7TVKY5CsKFdYN4BMMgIvv5Whp9L1pKzeC+DbeMw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HIzcQXa8wIUHb+1XHsuLrYdUSNSo6Q9buakT17r5t2/oj4aLevh3IgMhSoIG0BCXNsWhF9HGJ/gSd7ld9E4qSFLcK8MgT5au0wXh4kYrD3wrTFFkJNlFcGywzLPJ1LTSE1KgdJUOTLPJI0WaAPK5wwB+z31lh/58BvLlZFipP2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=tPx0SCKd; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=YgRJ8XQM; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="tPx0SCKd";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="YgRJ8XQM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1788882854; bh=PKcu7TVKY5CsKFdYN4BMMgIvv5Whp9L1pKzeC+DbeMw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tPx0SCKd23uv7EY23UehwdkFvNlDMxm1mtLJoirOI1DVxbGL5dbfraDiQXemEVvOo
	 j01vxj5nVQwO8I4NrNSMXTzDRvAmTwjFXdBuGxv4XF1ZzET5Pxh9ixtaRUl63CqiJH
	 9pllA8UBpLZXi9DekBQkA6bYWEj2gDmbkE5b3/E8QHl78wy21/61KTVwni6X35d+3O
	 6bFWz9Sd5E6DtcVdHnKw6uGV1BVjrq/eiwHEL5OOxnZFF92kfgRpLB4VNKLM3ofxU5
	 J8mX8SLY86RlvVCuXTj36B9dHPxnPqeba7RMvS6gjePatUTYv6buQ5qrbwBdnjPNou
	 RwbPPtxkIAGuw==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id 5325A4145E; Tue, 08 Sep 2026 16:54:14 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1788882853; bh=PKcu7TVKY5CsKFdYN4BMMgIvv5Whp9L1pKzeC+DbeMw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YgRJ8XQMrWXX4pH+kmwSoV48Duz+wme5V4JhhEQ0qO9QDaim4HDzTaS/bn71NGsyo
	 gK60rB6OO3Sx1zBg1r9a8OYkxGXxdZhk3MJt17KNz5rNsErtmqeMBJvhlooML0BRuy
	 NRnpPpQv/Mchm3gcqHpMyb0CJrGrs01AVVgW8ZzwdmhCw/bbmLN/6GEWli7WdVzYAs
	 PVdjnQeqpE9Jh3cuNW/oO6ni91HWVIY86DMzwAk6JWBxEe4+I6+QO6lr/oLBFAwSyU
	 3cS3poehxeuIG5viJL4SvT02FVOBEaKpyZDRFajobrKJQftoAYumOniy9lRsHdLwHK
	 qv1i4gSdBVYkA==
Received: from maru.home (host86-150-50-53.range86-150.btcentralplus.com [86.150.50.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id BAB934144E;
	Tue, 08 Sep 2026 16:54:13 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rik van Riel <riel@surriel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 11/19] media: nuvoton-cir: Remove unused struct field
Date: Tue,  8 Sep 2026 16:51:59 +0100
Message-ID: <62ce53fd68adad99e673de5b5d100a581a471252.1788882189.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788882189.git.sean@mess.org>
References: <cover.1788882189.git.sean@mess.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Never assigned or read.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/nuvoton-cir.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/rc/nuvoton-cir.h b/drivers/media/rc/nuvoton-cir.h
index ed7d93beaa28..e66e3cfedeec 100644
--- a/drivers/media/rc/nuvoton-cir.h
+++ b/drivers/media/rc/nuvoton-cir.h
@@ -77,9 +77,6 @@ struct nvt_dev {
 	/* hardware id */
 	u8 chip_major;
 	u8 chip_minor;
-
-	/* carrier period = 1 / frequency */
-	u32 carrier;
 };
 
 /* buffer packet constants */
-- 
2.55.0


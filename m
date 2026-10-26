Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793014012;
	b=pz4aAUcLhhPSNs2KAuJDixdez9DdcY97Fl9rIPziegZ7YT7OSmRzQ0cUOAsWXdOEBv/a
	 aqLf9Nrsd2yAPz+1lEMG9dMwlYuIxJ3gFnocYOGUpG5h8XihoQ/IdIrMXsXIjaTbVA1xW
	 u6nzY1UTsKKddfmI5ZCOHFuR6XX5XcnWJc+9ZWMGHeJDk0VeIgVOsA5JM6JGp31SsYzkd
	 2K4KKabdEdrTYqSf1fIHdrbcoUYBZxD8/ecjDXL4G3MPT29rwuaa9F42/W4KxO72Kuytc
	 3CR77QH43oD5bau8friGfrRCzCll4+ZeHd4Xg2xhTPNJxGmC1Sl0BjFlyFv11MSk7zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014012;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Date:Message-ID:In-Reply-To:References;
	bh=sEilWQt6Xf8SeL6f3xmlWFKcnQWSknDf8DdIPF1cvBk=;
	b=IDQkemIUyCrPjisaYlVtvpRyFtKdF8RBQsfZdiP9zh2dc4TrNDAffDLU8mDgdvnIWSPq
	 EeMgzQz1Pa8tRCfa+SQysy5YmHqnqQTXza4f4YkMsPoX//rvh3O9/V7msC5ADNnzjXxcf
	 /P2kbbgAiTu8vLMleeQYWbyidLkC38aKgKEmiYtrL+ET7/qyrvfEqKI/6p9olC15X1Qg6
	 pJlc6h1BWrpnClt047+TKqik3UdBmRZU8sTU3rrdFHxDge/tq5uOLXMFx1IQF7HuDeDSe
	 TkDRoat61nlgDUjHDb6bU4x/A/YIYSbGyROoGs3Oxs1xneUduY2cpyhaTB2eZEmR2eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ip3R1yKG;
	arc=none smtp.remote-ip=74.125.227.133
Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFEF606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:26:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DFEF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ip3R1yKG
Received: by mail-pj2-f5.google.com with SMTP id d9443c01a7336-2e7c8213b09so7601495ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793014012; x=1793618812; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:content-transfer-encoding
         :content-type:mime-version:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sEilWQt6Xf8SeL6f3xmlWFKcnQWSknDf8DdIPF1cvBk=;
        b=ip3R1yKGlZoaSpGvnTajMCMIJ8NcqyWohhMV+OctYZNpWfTXSXSbAQoD/6i6j2/bnU
         vuzAyTfUOXfcJdKl5OGTYTcw3JKNsR+YhKpm6Tb/6sdeL2l0EE5YrFX9SX8v0GEfDQ9T
         cp5JL7QHBdi4Kt+YgyRrMzlaLXZnukqnngDFh67ZI4iMawQYKI7qG54rWmyLOxWeL0Wg
         hLFs9ra1p1PbHQO6zgOPSqPPEZNU/DPdXNWOSFxpafz9HNexWLckfPQz8UFwolyOfo4/
         dCRAACYguNN/BbtYsoOZ8/p6qUmJwQvP6W7j/qh/4BHPsFe4y7b7ZvT8e8KNWPLxEcZx
         EOTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793014012; x=1793618812;
        h=references:in-reply-to:message-id:date:content-transfer-encoding
         :content-type:mime-version:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sEilWQt6Xf8SeL6f3xmlWFKcnQWSknDf8DdIPF1cvBk=;
        b=ZAFxF6ojswnO6AmnSnHJrzJ1642NcjNQpzcC6ahcxFqbBxUQheaZmxxWV/tLkZ4QW8
         S0nhiAC7D1WQXIO4W345+28byabnzFiPnVzLEgJsEGWbJvwqgg6EJuKyjSBStNYgSy0L
         lmcgXOtYTCFhwMt5Hw6XtZaZ5ov8KghTbCZegH+ZQwXRI7yc13c724Vqwe6xFI1+Kf19
         y3PWyKb98pmkiFzlDh5fXom6a/r8n0zeV2WUWRMafidJkkOVTqTJEjAhHw/VFOTwNuMO
         oJMtiU/nKJcFvFl/iWr2mKhZScKhDpS5GoqcQSG+QHdYr18fAJiRF9qSk0QosFyFg45U
         lxHQ==
X-Forwarded-Encrypted: i=1; AKwUvByfd4U0t80XVsn0MZMWkC159lrP8C4j1UyORrA/isOeneFEAlFfKMMcZbGP8aS7GGN7ykVJoCdR3/+mwBs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgkEfiOfqoTEDnNYjIR1/ZMnW+l6hNfuPRcJpStmRI+KELR7AB
	pLK9foszbR4+xlHfKKY9/zKvY1pAzGUTW7JofjX0sWqMmU9pkBPNzcxQ
X-Gm-Gg: AYBFou1YN4lvebdN+z9hl9eH0yWMLYpbd7no00TUA1lM2dUL+I3RJjye/Q+0ElIunuD
	3DKRmcwWCRRNj2VcT2Lf8zBm7R9set8xOubcm2F6qH3gbZuyxZVIvVGpWknzgwb8VoBz/axn2rQ
	KitAnJRDFmp1aXuGGd+4lUTf/L/cKSCv2xZ7YODRFgY44grN07IrmMI5JtNgWrMKswwR6NefX26
	Of9tnbH8KyTlaFLNLOudUHq0K9aOACqk2KfJF9ImZUySPpYvOMiNlo5Ua/dorDHyf3TpSskEvOV
	3ZjLz0uo+6doOH+42NfzTcIgqYsypr8Gc+bVMZYUNmG4XwPPIeV4qsNHmZkm8tORqMCsMePmDiX
	cPg8Hs8+Il1wH6kLPfVE/1rlveMhtrdZFEkXX3CTucj7yWbH35G859G+I5nYR2dB/1ENuixLu7C
	EYBsuEqU1hIi8Th4dk8JniA3d6hRA5YWSorZCE0Emq1cww2RWa2yhXenhpQd/E2d0tD1zoed43E
	QOrcwHDyo44lWXHIXSF3AYHuBPvIWzS5/a+MDdkpCasW48sk1PSxJa/uGRzv0H/mBofbTPmL16c
	xSQvkQuKeXFvOorxLxyT8cAIpLNUZ7kQNH02+x1IpiHs5u/dkW/u
X-Received: by 2002:a17:90b:548e:b0:3ac:8741:e2e4 with SMTP id 98e67ed59e1d1-3adeafad105mr5506790a91.52.1793014011466;
        Mon, 26 Oct 2026 04:26:51 -0700 (PDT)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebe9078asm7950626a91.10.2026.10.26.04.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:26:51 -0700 (PDT)
From: Aveline Noir <jm5905938@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Manuel Ebner <manuelebnerli@mailbox.org>,
 damon@lists.linux.dev,
 linux-mm@kvack.org,
 linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 7/8] Docs/mm/damon/maintainer-profile: fix subject-verb agreement
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Date: Mon, 26 Oct 2026 22:14:39 +1100
Message-ID: <179301327249.2.2109326531018240569.damon-docs-grammar-7@gmail.com>
In-Reply-To: <179301327249.2.4690198998605536207.damon-docs-grammar-0@gmail.com>
References: <179301327249.2.4690198998605536207.damon-docs-grammar-0@gmail.com>

"The DAMON maintainer usually work" should be "works".

Signed-off-by: Aveline Noir <jm5905938@gmail.com>
---
 Documentation/mm/damon/maintainer-profile.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/mm/damon/maintainer-profile.rst b/Documentation/mm/damon/maintainer-profile.rst
index a7c135233937..c48269032024 100644
--- a/Documentation/mm/damon/maintainer-profile.rst
+++ b/Documentation/mm/damon/maintainer-profile.rst
@@ -63,7 +63,7 @@ management subsystem maintainer.
 Review cadence
 --------------
 
-The DAMON maintainer usually work in a flexible way, except early morning in PT
+The DAMON maintainer usually works in a flexible way, except early morning in PT
 (Pacific Time).  The response to patches will occasionally be slow.  Do not
 hesitate to send a ping if you have not heard back within a week of sending a
 patch.

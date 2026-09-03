Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79943876DE
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 05:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788411864; cv=none; b=gsFlEGAQsg/Th6KT/Ij5+oRpq5zPclqpuPzYJqy0cTQ+3tMKHMxaGkkmgDvk/+vUufUs56SkiFwRRS9MOFxUaAp76d8ueYRyDVoP1zh8RDZA7dLB/zaxszRfKQQHocr63BT1lKW2d5LRgyy/dL0zq7SDa53us0+umEPBPB7aBxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788411864; c=relaxed/simple;
	bh=TxSug8GaIvkXasGJIWsbCDvuwZipb/MbKAObHtXieQE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QB4Yeua30StzyT0HYnuw6JVrSbVELiVb+VClh5P8PUepkyyXVJYCj22KkF1PmkK1bcjnDQuDPwqF903/98Kr3oFCWYAwlln2eFJLsOWlwfhNgh5AfWDbU2R1Qvz07jVOJDfsiLMmHoc5DWXaov7qg3VH2ZCVXHGqs1cTloK5yL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o562Uhz6; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o562Uhz6"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-43bf9548df4so1595287fac.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 22:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788411861; x=1789016661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qnzA1LripjTBwtxcTu8BftK9JlapIwYmZXXSesBCbuM=;
        b=o562Uhz6/wqSuwLsp4M6601aalFnVNrtTzI5ffQcSKerHuLmIMvyNpMad3yPAyvABl
         8V36SGw16EWMUY2kQb6VoM6+hl1hQhhalTXOBb5GufEby5mFsIultLUE1ynCoXapgk+U
         PVflQcNpeLL6/nfM2AUe3qzlR/7UFIRLu6FFdt+nC7IXtpGKJ/b/dBWWULEgWSzBm9AZ
         N/DvsMW9aZWYaAzhQseG6Si7pN5TD+mRfcrQHcb6vHpj5/B39bo01WoITXTPgV6UMsgE
         yUN/2zvQCFqxZJRITlmxHy3zQXyCFc3YsAKZqdZ0u/4179qtaqEI9MKO7Hm8PaRtzJWU
         naHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788411861; x=1789016661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qnzA1LripjTBwtxcTu8BftK9JlapIwYmZXXSesBCbuM=;
        b=n2Yix5v5aLBI3cljVcsFiZ1Twby4ZpX/RWV4U5mB98h24QRFB8Sji0kbi4g1DMQ+hH
         X8UZnvBSduSRSM5y9NVX1KUHAI6PwN0nbdldApbAUPBPaLKh/9KTFcsSr8Y6oYQYnm8n
         LVowC9d4tafAOiiy0Qq71DnLs1OMMpPfAxFBwhbt2k/JD7tjHiHzYfN8XoydfMRIg/C6
         y1xmBWnD+E7tnFJeTbepp/IoA7pwrq5nOyHWtO6WCqBzjSZf4yQ1AiU5lLE8EOc5QawY
         YEtHa3L8eGFX+QFkJHKTvG9+/wp5UIJLjW9jVBfixYgzRWhPHXYJ8iKhhqswQN+5I43L
         fdXg==
X-Gm-Message-State: AFuF++mGEuDlqTNvm6lNAGiR/hhJ3fhFFachcyuCMQFVeoISRLm8KVXu
	+FwBPQsswm+6u3Z7H9CcCJyDNoYDAGwDqyaC1cMryTXCiXPzGjnf8An7
X-Gm-Gg: AYBFou1ppsV1KDd3eM2lMCYzTZUUXPXn3cMQNXwDgSB71Hjx0oIseIYDdY0Ycy6R7ge
	aoLp3jcCpJBKXO2rE0KOMFfemcNNyYXt3ZpTV5JYk2RgUPyuC8zLhK5uMGu9Aj2BlWrmrusfl1N
	JYEYIDUBnPaIK/bhs7Xt1B4xJ8xbZyp9Iy6umxc3VCm4OARYXTsdqc7kryHRV6pHN8c10TRa8BH
	xGkx+zRDtnvBmS5RmeIBG8e4A9bvMoHE9wk/eM8hZUDOKCw1E163q7MA5nXXSUubQ0/XscHsLfq
	A3+wyxOhqP6PJKEpUDHRCW2N3Gpzifl9lm54WM4pQEhjGlpg5PJ7oYq5Q4YnkKKpen9bTkTV7ep
	TeBOMYA6pZAi7t03rKgkbnU5k/TtgenXeYElZS1+ilYWKMVNxJn35Ys+tMEbGgyD6u/0QVXrG7V
	j3TAkxhY94j/LTfZ3tkhuUmG8XRtf8v+PuFcTQ1f69JaGI8tOucqAkE5CfdK/7wBT7rqAcAaMvS
	0xS5wGo53ei
X-Received: by 2002:a05:6870:31ab:b0:46a:8e29:4a03 with SMTP id 586e51a60fabf-46f8732871dmr8938507fac.13.1788411861435;
        Wed, 02 Sep 2026 22:04:21 -0700 (PDT)
Received: from cachyos-x8664 ([177.245.224.138])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-46f30baa0d4sm6394986fac.6.2026.09.02.22.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 22:04:20 -0700 (PDT)
From: Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org
Subject: [PATCH v2] Documentation: arm: nwfpe: update stale document references
Date: Wed,  2 Sep 2026 23:03:44 -0600
Message-ID: <20260903050344.7104-1-diegomancera.dev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903025115.43333-1-diegomancera.dev@gmail.com>
References: <20260903025115.43333-1-diegomancera.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NetWinder FPE introduction still refers to README.FPE and TODO,
which were renamed to netwinder-fpe.rst and todo.rst when the
documentation was converted to reStructuredText.

Replace the stale filenames and fix the accompanying grammar.

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com>
---
Changes in v2:
- Use explicit .rst filenames as suggested by Randy Dunlap.

---
 Documentation/arch/arm/nwfpe/nwfpe.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/arch/arm/nwfpe/nwfpe.rst b/Documentation/arch/arm/nwfpe/nwfpe.rst
index 35cd90dacbff..0136c7260d22 100644
--- a/Documentation/arch/arm/nwfpe/nwfpe.rst
+++ b/Documentation/arch/arm/nwfpe/nwfpe.rst
@@ -33,9 +33,9 @@ double precision and extended double precision formats.  The port of
 SoftFloat to the ARM was done by Phil Blundell, based on an earlier
 port of SoftFloat version 1 by Neil Carson for NetBSD/arm32.
 
-The file README.FPE contains a description of what has been implemented
-so far in the emulator.  The file TODO contains a information on what
-remains to be done, and other ideas for the emulator.
+The netwinder-fpe.rst document contains a description of what has been
+implemented so far in the emulator.  The todo.rst document contains
+information on what remains to be done, and other ideas for the emulator.
 
 Bug reports, comments, suggestions should be directed to me at
 <scottb@netwinder.org>.  General reports of "this program doesn't
-- 
2.55.0

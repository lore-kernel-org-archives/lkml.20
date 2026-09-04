Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631423793D3
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788521588; cv=none; b=bPuI9J0+dFiNshVO4mP6aZteRPfdNvlFacNyPOMpMemp/oiqoCzn+jh45bhNyxeqAaNKI5ydXbi0F4qL3PywGEo+TDumGJU9u87NrJZGZ+EsT4wxFrL1gyoipKAhJg0dKns6zsDK2hiKepXp9mg9bmFL+IKv3gWFLRcspkQawDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788521588; c=relaxed/simple;
	bh=UwgLMIrmDPHPdVOs4f2CMMUTct58tVKlcy6cqzCatsM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mltjja9cd1z/9+heLkwPQeZTOsYWGR2DpYeijwcxftiVIkStTv82VcVDZRiXTkzUsWjJu58N5CMGMsHbh04jXlipreEeAvYIl4qS9RVX3IkE9nIUdAS5f/F2j6xDtu94F0xcnBJTxs4UqsD0T4MJfRtGjLLzLyjLZRGepwEsKS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qm3SQAIo; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qm3SQAIo"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7f5934ba2a5so462119a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788521585; x=1789126385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=euVKfdJ7nhmJ+/QxZ/Ovr4SAaOtQvGgHZZQ0sz9pYzY=;
        b=Qm3SQAIoVzmyXvBomgy8GeJL/yMPwD+r+POgVCp0i/Y0e0n7LgegJx8ZJlEmQGUA18
         2dNBB65C+L79WrbCmWAopMRpvM1QMFJ3lr8pqi6TMPk97gg3HD4nM5duddd/XamJmVh+
         XdNr2D1xlEwrYcTN4qnU53gLsGWRFIS4msbYTR3NbJKCHrMpllpVlIskTCHmHpkMu376
         AyEJ4n7ugT49wjFDiZ3bFkniwtplt6xtG0D75t2E3CHkr/MPbrCiyippmoTNyr8Kcxk9
         EGfyBFNjrcF0C5cdiPpwM65BkO54AWvYBpvYQDgwsYGI3Bk8OdbSs1kOPEBxmVzqUHsr
         e3fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788521585; x=1789126385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=euVKfdJ7nhmJ+/QxZ/Ovr4SAaOtQvGgHZZQ0sz9pYzY=;
        b=NB5j5qRPEXrjiMgId95plcsVjGHsP47vVS/u2TydBvWR7Yz4jmvPSqLVnJP38YLE2r
         +MxdJdnsbvGOv8bM/6IUxzldh0mS63+JeTCMtCdlX/jKQbOKB3Ho91Ty1Rk2vNOvFPh+
         66q6urWx7VfBU/BQ0X1eodA7Rc86RcAdFmgAbQ4KL2075qY+3ev6/DoabTo6nsgpL/TV
         cGm6MEzYT3aa69YHpuPYR9iEVHnxBMDpDpTPDQQxiTImAbKZ632cmtoOilwDbPIqBw4h
         6LD4GrXTOdC+ySVPE4QjyXtuNQL/TfgmBSc5Zzamvz9ih3y+zPI5su1mCawDS/mR6KVE
         IIHg==
X-Gm-Message-State: AFuF++lHIzGmt9MtD8t/dZLvvTEFrY2UP+Tbo8/Bkvwm4QnzU2U0VgVl
	SLeym7Xnein60wqM1WdWuxuuDZ10r6g2d235UD/1xkPQrGuPccCXjBTMZLXKmjYK03Q=
X-Gm-Gg: AYBFou2K7f+r4R4TBjO2ED/gf3adSLBvObuGzW1EBls8N5uwUFCEX3XB7TUL2FgFjyS
	U2v+hiNkYzoJQBqwHVwmhAcVVcpHrmQaqeKe444KzBYKFyXggzd8kR8Yu4oTX8pNL2t/CFNS6qb
	0x09D56ScKBD4FlBq6MiJYzGHhmnrY0tyBBmNZaSbfobl7SKpmChh7H89943hFXRbRIaPAyeqaL
	YkI3aHG3mwYvExPb+BDgJtJUxcomwT6jeBkohQaHPfvR4K2hB/PguJck21ObiPyK09Zce5mJqtR
	PTaczA7gutuA4CcffV2amMAEFkLMpNfc9oHFtqc6fOmxVjHFcoMrvpSFPwsqg73Rp2n+lUXnfWU
	thJTCbTXH0CVaMnHOy7aQFdCo0UcI3FfPKKzEZharYpp2eHWuC96RNjgqQe0qIDa1kXpV0Z22jR
	z6UCJ2LJyUcWZvvctb9bgV4lomv9SFOiEBrWqSXBdenlx9HrbxSeLfnrNFNhSJKUsmCsOOTmdR0
	j3Zz3YU4kKtDsRb3d5bQxJQ3g==
X-Received: by 2002:a05:6820:1996:b0:6b4:96b:3e12 with SMTP id 006d021491bc7-6b6fd7d704bmr4206715eaf.23.1788521585217;
        Fri, 04 Sep 2026 04:33:05 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534d0asm6469759eec.8.2026.09.04.04.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:33:04 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 1/2] Documentation/core-api: fix typo "maintainance" in comment
Date: Fri,  4 Sep 2026 17:02:55 +0530
Message-ID: <20260904113257.13594-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904113257.13594-1-hemanth.selam@gmail.com>
References: <20260904113257.13594-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "maintainance" to "maintenance", reported by scripts/checkpatch.pl
using the misspelling list in scripts/spelling.txt.  Only touches comments,
no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 Documentation/core-api/housekeeping.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/core-api/housekeeping.rst b/Documentation/core-api/housekeeping.rst
index ccb0a88b9cb3..71ba5d86f249 100644
--- a/Documentation/core-api/housekeeping.rst
+++ b/Documentation/core-api/housekeeping.rst
@@ -9,7 +9,7 @@ extreme workloads can't stand, such as in some DPDK usecases.
 
 The kernel work moved away by CPU isolation is commonly described as
 "housekeeping" because it includes ground work that performs cleanups,
-statistics maintainance and actions relying on them, memory release,
+statistics maintenance and actions relying on them, memory release,
 various deferrals etc...
 
 Sometimes housekeeping is just some unbound work (unbound workqueues,
-- 
2.48.1


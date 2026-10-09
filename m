Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606C53BB130
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 11:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791547092; cv=none; b=ONhwt3iabjdZUR4DENmh2G8cPoy9TPBqJ2Ic2aXl3+SRqG1EElEUku6QlX+0fplyH/Xl0AUDYajsg+/PQWjFzQAwMkpgekXxNIN5nq2TjBZtXTS3BAJ3j5NmwxqdueGf6S/8xuHc7tWABK+oejAkdbt5/fqYzz7/S53k3K9guGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791547092; c=relaxed/simple;
	bh=EXUT5B8lCotVs1uA94vaqSywnx7z4x7q5mM5Bfr8gEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=opgFn78Q7jqyxaynE11pv5y26IQHiY2J2VUWo34IUM+rXWHUFPL1crk9QjS2ABxdiRNlFEOhLsMOQNUIdQcXgcbOZpzqxiKPfzmLmd+EbceYLOaD/LZ1pJJ/Lkggwqi99ygOm7Nvv3bP/SWj+q5GtYCXAtBejfpkoIC5/4hXlqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VYjBR56f; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VYjBR56f"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c2acc1e170cso660063866b.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 04:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791547085; x=1792151885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wpAtn+CYFHdc5XI+NcILVNijP2cHgH3lVlMnRBlNzfA=;
        b=VYjBR56fl8hqnS+8FOc12gXLJBaCTd3HWLGlNr0delgz1bhZ2vTa6K+UOG5hOzdMOZ
         +uJEO1cY6FeXL80kV4t+wE8j4RfE3ixjgBBYLQfX6Xqzl8pLcyM1cvgfOLN9+JAu1SSP
         +Ypn1lHIrRKvy3rsYv6aZsFXX4QskHYAGQCDUgZfW2oW3nWb+n2iCBqot0YzYLYCbeOx
         PCF+8XY9mH0MWcNmcqRiUBcz/kRu3SYDXv8XFUBww0gTZc00/RnX0GJJkpfMd7bw7lMS
         yN4qbmizjZdQiUl26WtSdmV4aFK0GjhJmrW2Nk37sPUhX6DD6W+v+GuTfkvQBcvZb3JN
         FQqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791547085; x=1792151885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wpAtn+CYFHdc5XI+NcILVNijP2cHgH3lVlMnRBlNzfA=;
        b=QLrUvZvN0fsY4fApMV4wgPIze/IgFT9jszHmKTKkBO6RU+ZGVuKVkp6L8Tjoj7xE1W
         kTQA0I+B+w6YjP1E0ACr+ZpS8mllzb/n08JL/nacrPbJgmWoXxM6ceNaUc7SDgjMO520
         V7osagpbc1MjngqsRgn3BxlexbRzlht0esr0fYN5X3ESzay2jEmaWaT16jDhwyg1+qdz
         qDXzigAeqCEXZ0VXwng/9hn5JKuC+8sa3MC4KHRh01WbwGE7Acnzn5hutInjEkhQK1Ld
         h1ostq9ZVn4ltlv+9ekwPGtmCbbAQ5l5t3CyC7ZIgqlp3mvMWP8BQlAfYoys+XcCVKVw
         W1hA==
X-Forwarded-Encrypted: i=1; AKwUvBy+Mf5ihYcqYNVS+ATv1CpqNjMcK+XI/5cbWrkCz45ab869RKTL1kVtorJKBx+g5ipMNGsT3ugAQjFDv8w=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+7UIqDGnCA8y1EwAUnTiAlawQGyOWXj0L30lEjd1zW/oWh4Yh
	+06CYBu+v6619mWbYLZyN37IvAKfNhD/Uxk41Hy4BpRBauBIjoeIZ0+0tdib6p+Y
X-Gm-Gg: AYBFou03rpn9lTo05t+9pliiQ8d1c6Q7hEkY6pQkww3wH/xQJeDie7zsnAAlolGb54l
	3/6sdo6bs5EMorNInF5ouqIZKwf638/S7bYP2ehPp+F7v5jw/JRKzbdmVsFWsR0spM2QhulKI7n
	oSnZDGBTvbbx4g0IiX7BFi369uZMsRuJTaoNBMr+QxNmGOAc50Shaff5I3uwU5yWHVa7bOm5rcr
	lfYquuXfmnkzxuklf4BaHmPsCTP4wtxjBJrYrbekfFKOYNrsI2+G63q9wWSdOTclqQ0lTCb3qDn
	7FQZhw+8s78BlHF7DUCqjV5gc2E5JSnxzbHqupl+QaOuF8zYsIBU6j9i/xde7WCm+5EXq3lJo7O
	CHoNqbPQLX3xya7Z9gG6EA+JBtc++8sG8M5nW20Q68LR7egHYz4tmQGns9+QohwdWf7hHm4vwWr
	GWAWhQhauM1OiigHOFi8FplHHDlU0Su75M5dp1g7s+OFWl3fKcMI7dMpRJVOfURSr6Kkh+ArDx4
	KQoi6ICSCI1tzhSEj5iLpNYtNrE4zFNcfg1iX33UA==
X-Received: by 2002:a17:906:f586:b0:c2e:4742:4c91 with SMTP id a640c23a62f3a-c31aa08e8a5mr159152766b.35.1791547085523;
        Fri, 09 Oct 2026 04:58:05 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31aa825e4bsm78525966b.9.2026.10.09.04.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 04:58:05 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com
Subject: [PATCH v5 2/5] alpha: describe the Tsunami system machine check frame
Date: Fri,  9 Oct 2026 13:54:38 +0200
Message-ID: <20261009115627.969047-3-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261009115627.969047-1-linmag7@gmail.com>
References: <20261009115627.969047-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define the five system-specific quadwords in the SRM logout frame,
as documented in the AlphaServer ES40 Service Guide, Table D-19.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/include/asm/core_tsunami.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/alpha/include/asm/core_tsunami.h b/arch/alpha/include/asm/core_tsunami.h
index 3391e95754f2..fe3fd4570fac 100644
--- a/arch/alpha/include/asm/core_tsunami.h
+++ b/arch/alpha/include/asm/core_tsunami.h
@@ -283,6 +283,11 @@ union TPchipPERRMASK {
  * Data structure for handling TSUNAMI machine checks:
  */
 struct el_TSUNAMI_sysdata_mcheck {
+	u64 sesf;
+	u64 dir;
+	u64 misc;
+	u64 p0_perror;
+	u64 p1_perror;
 };
 
 
-- 
2.43.0


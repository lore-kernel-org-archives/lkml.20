Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E275616A7
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791992796; cv=none; b=UWUhCMP789ygedqxbZVokqbLtR9/whtxagZTz7JE38yyqiDEbFafppfH0W/C7+AsUBd134Kakz7jq5cdAVBMRPq6YQ6ghIiPuXyZLJZuy/+wkP/4VUUI9/S+n62KIjm/Ug8m5OFGKwDl8SMG1Pkz319fjjFNfUJSnd+RxHyA7aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791992796; c=relaxed/simple;
	bh=IYTAljIE09eUQdv5gBp+pN3vSrMjNBjKLSQgelcAn4I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lmVWcpKm5A0IY2URJCLGr094MMIvWbWovh9FspwZ7sD6NYH+cjXQqq8KEMZYyoaR9j6wU+xLI/AbwoKlBgmj3gZ0RfMWJ/OAqxoxxcYuCnScX+rEKymxb2sUvWb1w8gy4ktJSgbmQyN2dgUSxHxdY/d3rjZ2Gy0yrfZ/44PFt3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CTBF60/9; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CTBF60/9"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cd61cef87f1so800697a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791992791; x=1792597591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MZIBM6OQ5GTAEXrN98yT6rtm+n99DbEWIcKJB9r7iPc=;
        b=CTBF60/9/N1GfDNEXzwBGYjI5IaaV0EmdhC/pOhR1aIgdkkDlzEHL48Iy3IUdv+AoS
         z0lrXeYzR7ekLolw1hm6VSWJLjb/6VlDvqYwwieCb0mxmePQTcdFzsMMo0YLCENOOL5o
         y00ctXyf1dPydQe1WX/CvHF8HVvgbYrBRrg31R+4wAa5GMmrYJCAGgT+WHO+OSS5EFnh
         5LwJT4WOp8ii456LMSvvKdRmhUOx5T5pvKnkD5OckHKjEym/VRKdRkiA6RATFdv6Cv1R
         A6fcXRRoT5Aeh1MbXQcWZ8V7cV6cywWEbSnDq7Z9DiLYcylMB5XF8FFVyo6Sm1/cfx39
         F+Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791992791; x=1792597591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MZIBM6OQ5GTAEXrN98yT6rtm+n99DbEWIcKJB9r7iPc=;
        b=U4yupAtE+3Rjy1hJzAxOIHs/66vZ9qoPDOAyYYfixIHLhflWB5/N8bndwB2JSTh1C1
         OLM8hQPsnRS2LxFLVUKjW+FH7vQ8+fbHpZDna3JNOlJKz75UESChWtKkN7X3CwMzMhtF
         BuNXtCG/JWR1fgwqwFHTnqIrN8ogp5/buuWbLU6GF5RCGpgZtRZ5g1G0hpI6BTtUdrVC
         cLvt+8LQd07nSshrBU/vakDWORi5cgnToSxkFpA3ScE2KyY9/lhmUBYcBf0t3+peV37R
         71yuZW1hkeGoAXEiDvx+UVutc09GTZ+NtSQcVQGvghMJS05NW+slSIhlX8maPrDJzBXY
         TCUw==
X-Forwarded-Encrypted: i=1; AKwUvByWesuF7lq+M3MSnhCA6SysKsAb/1pNcESHyR36XK7JMqO7z3JM/KEfUiNTwRTMx1iWpRIo90cFRUkSVrg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXO8TV62g50bD1JJvAjKQljolhYf2Vt7CMfYI58T+t4mMV8/4/
	OcrrnHFbryub4AXLVYD+teDbwFRuOYCUVJpyFRtervP84Y0way0noyfG
X-Gm-Gg: AYBFou28OzK4MVNoF/6jY/fbJMYz9KjtDEmgNLi69i9c/cd5MCJUiRuxw3bOSkleiWe
	Z1D5l3wSbZwmdBcsiE1944kjkzxS27HuTifUSI22sSLPk2gspSd16au6HJ3RFfcxKCdMG9VUP+x
	Fjc7nit93zcra7pBHWXGgX4sN3h8me6q1Yc7Ofe5bWChSb5Agk8sf0Fc+qLjLDfP8jNud7Lq6d5
	cfJ/9MocbG8QxvLH3BpKpv7I+cLUl28fIerrrtaD0aXihv3OcuS0BNGpbzRm7UTyfmvSf6lCKiu
	pU+dqUeltg96mYV41a8bVnV5qvqC4YlP9SylUe4Jfqwr5NnL9CqHWW/GPnmNU+6p2zFhU9hSTEI
	qfiRoZ7Ot6j9y6iN7EJXZHciMIdN4upAPZ0tMPFGEfhS9tzkdJVdMn3HS5MiiUZAxx0Zj7dO92+
	Pw9pLSA8JJ98/3xOZfjD6WC3yKGn1JyeE1nAerJGoCV5jN8L8eSxUMNLd8bCW6OJiS1Dvx3c3iR
	lHh
X-Received: by 2002:a05:6a21:6813:b0:3e1:bb35:476c with SMTP id adf61e73a8af0-3e1bb354babmr5956800637.72.1791992790646;
        Wed, 14 Oct 2026 08:46:30 -0700 (PDT)
Received: from localhost ([37.22.102.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d80511db9sm1300598b3a.56.2026.10.14.08.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 08:46:29 -0700 (PDT)
From: Vladislav Zaharov <vladazaharova2018@gmail.com>
To: dakr@kernel.org,
	jhubbard@nvidia.com
Cc: acourbot@nvidia.com,
	aliceryhl@google.com,
	ttabi@nvidia.com,
	gary@garyguo.net,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Vladislav Zaharov <vladazaharova2018@gmail.com>
Subject: [PATCH v6 3/3] Documentation: nova: remove completed GSP log buffer task
Date: Wed, 14 Oct 2026 22:45:54 +0700
Message-ID: <20261014154554.231015-4-vladazaharova2018@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261014154554.231015-1-vladazaharova2018@gmail.com>
References: <20261014154554.231015-1-vladazaharova2018@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Exposing the GSP-RM log buffers through debugfs is implemented, and with
the gsp_keep_logs module parameter they now also survive a failed probe,
which was the part of the task that was still missing.

Assisted-by: LLM
Signed-off-by: Vladislav Zaharov <vladazaharova2018@gmail.com>
---
 Documentation/gpu/nova/core/todo.rst | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/Documentation/gpu/nova/core/todo.rst b/Documentation/gpu/nova/core/todo.rst
index a01c362b1be0..28fc7329d56b 100644
--- a/Documentation/gpu/nova/core/todo.rst
+++ b/Documentation/gpu/nova/core/todo.rst
@@ -141,18 +141,6 @@ Implement support for instmem (bar2) used to store page tables.
 GPU System Processor (GSP)
 ==========================
 
-Export GSP log buffers
-----------------------
-
-Recent patches from Timur Tabi [1] added support to expose GSP-RM log buffers
-(even after failure to probe the driver) through debugfs.
-
-This is also an interesting feature for nova-core, especially in the early days.
-
-| Link: https://lore.kernel.org/nouveau/20241030202952.694055-2-ttabi@nvidia.com/ [1]
-| Reference: Debugfs abstractions
-| Complexity: Intermediate
-
 GSP firmware abstraction
 ------------------------
 
-- 
2.56.0


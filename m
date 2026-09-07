Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD6D1DB92C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 04:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788756600; cv=none; b=i5gYNjb5hSL8b+FO/TOJefLvph0uWEabaLkyOPRWTPWosbF2FYq+gtgIKdd+6uSxF5Sm51ufoa0EVPU1EW7Cc5zlTQZRL+tCxPqI9UvTQh2tJUNtMPT6P5bz8UyMKM34qBflXRzT29eBzzKTWgUxiW0jGQNeSYPGaPAISxzFvfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788756600; c=relaxed/simple;
	bh=a5vKky6NbLyr38oXxq7MIKbruEkJYLJZsO73SUtrQdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XOgfxMHIR4VMtmoWRE2cyK2R3SFl9iBO5hcYqKdO+x9QzT4WA8qYcE5TdOA33UtmKbaRn5w3w8eNb6PlaUd0+ZX9n8doXAfo5hkYCiNNgeCGxwBeTTr6yEdNq9qk3CbYrkgUCFsWS5Sg06yaVlLbieGNypOGVzyY8yL2NpVQq+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UJb6subl; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UJb6subl"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso2036288a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 21:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756599; x=1789361399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wGucqe92yoJCxfRYePeuZqTvKX2vXvu73cS4wSZKByY=;
        b=UJb6sublkLIlOeo2vKiwFbcvqDQr74v/vQOH/QnkAydv3Ezw/3f3MqVRUXMaZa98BB
         nOwycU6mb7JAhhnj7+XN3mT6Y/VYnlhhWrzaR4EdATxy7VOfekfp7pMDUp0pt31L7ovj
         TXQAxhrkzEalNWlboAgmJEENB0fekQnr5T2tClgYRr9MUfifxYisanY73X+ZG+Y+SE8e
         /RBZOEfq9gAAkJKonf1fLbp5zxhD4W8E8zSBic3KWW9cGYLw2NNCkhZvQT1pUS3svwSO
         d2Sb2Ogli8Pdw5sksMY7OslQ0XlbzQLq1TmZC5VIJ5oxQ5mL/Pp7ORZ0ptTVbYQhTo4K
         mpJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756599; x=1789361399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wGucqe92yoJCxfRYePeuZqTvKX2vXvu73cS4wSZKByY=;
        b=Z88k46jNtjfy2Fg/8U9IgKka6t9Hl7iGTNsEyU/E9LAv2fXCv6Vu+CrK/zcoBW5cT1
         BJma0q8SgqUUl8RJ4bWdACV2MooNI09MDQqvwicZhuVW+lcTo4hXVoVB1JwAuoyft4SZ
         c8RXgpzL543f3dieTjcIasX3PnkldFtQ4FRlqmEarUBRXki0UyHNvxTpfNjNvlxhKjLo
         4/K7b7RojhMTH+a9zk+Sf507jKhgjOHS9QMBWgx96ghmvKwBlh33gpXdTwz3L9iSRhdI
         xsLMRqixVM94kWBU+yOdf7Mf9HN+76Gr5ZZpMDYOX8DA5mQ70fLFR8xRKFnNtXK/QgUF
         juyg==
X-Forwarded-Encrypted: i=1; AKwUvByO9/hHaV25tH71ZlOeNpXlwAnji+s1FqazHs4znGPWN/3UGL3iPKA3NFYECGrJwgy0akOgCEBJJH+3GNo=@vger.kernel.org
X-Gm-Message-State: AFuF++kjpcxyXH6Oru9z+3SMIRhNJ/XuZXGkuseU0OLM7ACEWI3AoaOg
	04QpGPsapJTQF0K+LqEvY50Bu5bKhsbnkzo5mXVt+X0OoNzG3DERhHLNG4vcdmLd
X-Gm-Gg: AYBFou0en4XZesmB4eRzCK4f6jhfDrnrNPeoBGOdbWLstma/xFUHVzr/e0j+Sn80LGS
	XeWOq2PReWZHU8aNDUFc42qjpDnmtjA8HIVSiHGoUQx0mIgIyPe6na+qQ5ezoZgmoZUXUIetO33
	twASpmedBzvbp0wlh07UXW/D7J3+RvsNCLNg0Zd/KbirSVBse39raLhHG1h8uRIjGoYrJiD7Liv
	bDFQliNk6P99eW+iVTeTmEwMiaK/n1ukH3h2/Gd0tECs07qdQLBSNIxV09k1dH6si1XC0SuYdIT
	nLg9FyfJJ+bUV+Pal/5XmhWTNOfSC9ZGpX9aPIknqDYrBzEmjzGKB0xDpkN2XI5l5P1AwVOMJW0
	g18ugJmUHKxgkjGE7kqFhGlS8pkSWZKWs23bvNdDZ1ptlFXSFVyhfcVDEkFjXCosVbuhIm3JR3x
	3GSu020E0PxnozdzvH41SKq+rug5+cDINNiTKFLQQrmjLGzhwFwa2B0r/yB3fUu0yO7utVvdWZY
	QGjHuWaV2lIxg==
X-Received: by 2002:a05:6a21:3a4a:b0:3d3:ad3c:49a7 with SMTP id adf61e73a8af0-3da3a1ae36fmr36693461637.21.1788756598703;
        Sun, 06 Sep 2026 21:49:58 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a62be87sm21501484eec.6.2026.09.06.21.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:49:58 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: "K . Y . Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>
Cc: linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Kelley <mhklinux@outlook.com>
Subject: [PATCH v2 2/2] tools/hv: fix typo "retrive" in comment
Date: Mon,  7 Sep 2026 10:19:46 +0530
Message-ID: <20260907044946.10813-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907044946.10813-1-hemanth.selam@gmail.com>
References: <20260907044946.10813-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "retrive" to "retrieve", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches a comment, no
code changes.

Assisted-by: Cursor:claude-opus-5
Reviewed-by: Michael Kelley <mhklinux@outlook.com>
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 tools/hv/hv_get_dns_info.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/hv/hv_get_dns_info.sh b/tools/hv/hv_get_dns_info.sh
index 268521234d4b..288821565eee 100755
--- a/tools/hv/hv_get_dns_info.sh
+++ b/tools/hv/hv_get_dns_info.sh
@@ -1,6 +1,6 @@
 #!/bin/sh
 
-# This example script parses /etc/resolv.conf to retrive DNS information.
+# This example script parses /etc/resolv.conf to retrieve DNS information.
 # In the interest of keeping the KVP daemon code free of distro specific
 # information; the kvp daemon code invokes this external script to gather
 # DNS information.

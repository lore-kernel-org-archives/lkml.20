Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097F13905EF
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788187802; cv=none; b=HKmEr2CHcjhalSHIOFXIJQwtzoXJ4QGiKKv2vLDRKP7EXPjm1nNAIRQWWBC1HpnkljZeNR5KCEueZ4+Sfk5uBb/ywxDtSlqBOVTgipCTJ0eUpL9DQi+4fdjjLM3gzp79mgYAPmb8VmE5don6nJrt3BcEQzr7cFCIQBS8Zw+orQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788187802; c=relaxed/simple;
	bh=IdD2TqY8uHrWnoXOd1K5d1mpEPWvjub07q0vrKXwkk0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qX65cbKsyvqrMyoLZ+Ul9+1RTAN2IN4L7D+aUM6taI74JDucOQuBuu9pX0iiBBl/WiHfhmTeK//rUzbU7yBb2HE5ykJk81KQ6tpdnieO5/Bis8ZpQdLTnd3mhjbRojW/pzXfq3iKbBcYm2wH50v26DC+PlvvFZQq5Jq+Jdkqv48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=okwzJE1E; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="okwzJE1E"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d5335cf904so34375055ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788187800; x=1788792600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Vluxiaw3z/Uy/J4OeGofuLK0jk2uUpi82oTWsj6QOI=;
        b=okwzJE1EYapnnyCh6M2xLFHRa2Ygnv5y9zp7wv5up2BHWIh+pdBIyBKNop4n4+DsJN
         63dDTa7RzFWm/nBw+xy4gv3ZaXBHkBznFbvE56gQmB7Ek9MFxBUbaDs6C7Hu7xba/kBI
         QJhxx/0KmP/Xobdgt66WkdFxvRjcyUK5doT412TVrEGCdmgyf8YMl0ZgUuy1jMbIefKj
         X6X2Gmx/NZXJ+U7rymBZ8lIrvb7VfNX8Wd+r9wL1EIC8AXU/zSKPd4tII+fgP1aK8HjK
         6k97Gl5hiVyxeJO5aN5zW2Xvhxyu9cuB/imqYdxM/65ezYtJeLUSwwpnDT3Xv2qK3TEL
         S9+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788187800; x=1788792600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Vluxiaw3z/Uy/J4OeGofuLK0jk2uUpi82oTWsj6QOI=;
        b=iQz1k4HhdAtIccyOT+WBvEIbpyoHoTOlIrf5OTSO/tCU1I5MWeiHyiBswKfgB4VSzW
         NQX0u0+2ekjoSeK+USp8rR5c9PyClwVaYV1Wl+x8XuBBIvztZCMSnApsoW1HGqz7tajR
         1Wx7TVjbizQSEIz+S4SvI6uxCOKueue3ZdLzCuvHiI1PiOUo+g7p77K+87zXSDL261na
         +yjKoSNHk8kvPkWvWw4Yay6MOpCNXb3HBgu39K9rshunxTGXKH0Kf9XQ7OdwjIIWJiTa
         Zf35nITmyisz8ZqVm+MsA3XNjgjvJqxmwGwK5QQjmvUMiLo/WF+Ced6dyPJnKoOlegmQ
         DZww==
X-Gm-Message-State: AFuF++kcwGjFKI61Qg/ZzpPeoAe34iC/1aebrIaZHkp70PdmgNBaDVdB
	Zu8GblkadrGk2gtN2DEQevnfwQ4NzN8SS3ZMLCrNsKLhfz0SBkbx09/a
X-Gm-Gg: AYBFou3yuyuDW4Zb9yhioarH38oULCvIavWhNTZKGSEZbvmx2GqyAoIwLtqduugqbcr
	iHIrG3gkRrOc4a1vWlrLsWrueLo+cDFKCPofcqxmJ/HDaoC+EAhbzLbsqFDpto56lscVDC6RsK1
	HUO07ng3chSN+yfDfapvxiSVnNuQfTDGm5Ug+pZ9DeerFpGFJSoM4qLjB9JL+2ya+nmwM3g+nxL
	JAaI+RYmqm/ZObps3DNbCQt0TghpEFVjSgQ4b5bCeWKO9pPmjORn36cJDYUBuj2j55NhL3ooBAE
	V6pQesvm+KiptCuhtVMkYYL0LASq6lJ1L5Oxh7uJavJ7zv5I5NNgBWKOsOoBvNZ2yP9h+o4ejtj
	JgQSlJRGu7Yq1Eoxh0WLUJBhGLdBNZhgMmuXrn194/Ils9mxjIvgP8XTg+jcMdfJ8QBnQ/2X3GF
	DrOTyKrMRsXtGVVNjlcppZpqvnp6op8oANY23+KWBwx8g/V0pTWsGTtjAStxGr6tiYCZZj
X-Received: by 2002:a17:903:2f0f:b0:2d8:d4cc:be65 with SMTP id d9443c01a7336-2d94a905007mr15808015ad.18.1788187800117;
        Mon, 31 Aug 2026 07:50:00 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:6882:91b7:8e79:7958])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9e3cf8sm33137199eec.24.2026.08.31.07.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:49:59 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: Peter Oberparleiter <oberpar@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH] gcov: use strscpy() instead of strcpy() in init_node()
Date: Mon, 31 Aug 2026 20:19:53 +0530
Message-ID: <20260831144953.324441-1-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

node->name is a flexible array member sized to exactly strlen(name) +
1 bytes at allocation time in new_node(), so this copy can never
actually overflow. Still, prefer the bounded strscpy() over strcpy()
on general principle; pass the same strlen(name) + 1 bound the
allocation used, since sizeof() cannot be applied to a flexible array
member.

No functional change.

Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
---
 kernel/gcov/fs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/gcov/fs.c b/kernel/gcov/fs.c
index 1d19b1be207a..764918570de1 100644
--- a/kernel/gcov/fs.c
+++ b/kernel/gcov/fs.c
@@ -529,7 +529,7 @@ static void init_node(struct gcov_node *node, struct gcov_info *info,
 	}
 	node->parent = parent;
 	if (name)
-		strcpy(node->name, name);
+		strscpy(node->name, name, strlen(name) + 1);
 }
 
 /*

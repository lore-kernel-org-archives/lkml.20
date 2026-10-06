Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E0835BDC7
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 06:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791266494; cv=none; b=uEQcboiWfiNRmacuN+rCK6skzxCV3TW6Ax9mFNRtfXEhdEeseT55OU0s/TxtH53M9SRwp5rRRIwmwYJFh4viWiAlg1grgeGWwLbdvrdttk8CkwmGgdVJzQKoZGA4Y3uLkA0649rSsvLatc6AUloAYSb+L4KMkdV99V5ePIXmYhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791266494; c=relaxed/simple;
	bh=GKtI/xOnH75Eg5XZ+2AUchwcUeoCiHB+XMbB5a86qt0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eFcbtGOBPSdBkLVzAJwxwyGR7QCz+fyxAQGYGzLNjiLWT4k/u0xnZnB7Q7SI9cgqv6rh0iGzkWe+k18ufZ010E6IbdP7hqkhydfYbYJJjl7OLoWnpltRcgAr3A8+3TLIgytz2gUZXan5xmeGKn/PIqqghwr4VOtYEwn2g+3e64w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l7WEVvJR; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l7WEVvJR"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35127e848feso286209eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 23:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791266492; x=1791871292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PmluFCuzM1nnKffOiSUKtZF/8+bOXINL6cO5r91CeUU=;
        b=l7WEVvJRdWSWryFIJHU+5MIfsdfCao0DtOKYzd1IJJ0Cc2cxN++MwkIDmZ0licKaz6
         pHFRgV08Y8EuIuyO9zQhREEs4SC/a9xpCvLNOAkKJDAfoigFyRBG2ocbcYZVB+7fBgen
         6T2BbiH5kgPaKvrI4XTaK9v5FVGegaUvvK5a/mN6Rk/eechvbJ95IO/ia9+gCijOfIxA
         KqtsCkQYIBF18g3Zk0XwLvep2h6iqay91AjHmjOG5bAM7OJaw95+4QFaMAeiMuOgnJBZ
         pkbPTKJje9GSc9TWid76kl2330hBlNJ3dOsVaNyQyl0JJ/+NL+Rya7pWOCSkHDJf+e1z
         CSvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791266492; x=1791871292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PmluFCuzM1nnKffOiSUKtZF/8+bOXINL6cO5r91CeUU=;
        b=k0U05Nz1ccqcTlpZhk2jiXfSrAAdyW8poinAMfNs5rv0qlmYy1o/2NAVi695K03aP6
         l7+cCivwhwIOoMupjG+dKLPig77QLp3ljNakfwhwTgCzjw003yTp37Eed7wpemM/7RhM
         iSCLA3rH8X92KGPMWiGWddZvZ23R0dGbI4U3m4wUFOk14oJQQdYRmrD6rGpiRB9oDLG1
         N8fb6tvEX6y1dKlbZFqADQ8PwZH4bH2GbvpKjISa+gL3jHzTDVm11WMcMf5BBUSilFVG
         bEQmRj2Io7kO7d4/34q9VUzZW9TVwEiBWBDu8OwNmp0cn1+yXtvTJwHQaPJYcVdIAj2L
         +Crg==
X-Gm-Message-State: AFq9FYLbhXYw9kDMSMYopNJdGOJMCg4I+d8jDU8IpqS1B46FBlA/gCY8
	AVts6OvV4J2SAucIML7PowlebdbQL1643zw8xVi2K2NVUv0G3zmjtorr
X-Gm-Gg: AYBFou0XrLK9vU3OSS5yQn5i0cqDZcXBcUqGUg50Gkt9V/C5HJEZXTGpdFyej9o8ASV
	Z8PLbKOMmiWJboSrhdRYb0DhjPew02VVSAKHcgXe/rScb/09xijPxs80MNAT+hcaWjhM1os8gQx
	VpSRlMOh7TofCvISd6GO/e0cGxFwARGNueNvpsFJ6YQHCSLxCETps3j+bHV5DCj8EjBvfr77+t1
	KgTJWcf3DVDQRXcnQ9SilWMzSXwJEPHn+Dv6FVuGr33cj1AJfGY0YvOeSaod+VJb7rutEa52gwy
	C28CI4LRtPUgMsDc+9cnUC/6QiVXa7EEDX1PXcIVJxJvM2XFr46PUkkJG5o+UJzokMxCwAwt/yU
	orNT3/7YuU9wBd7rOz1QSoX0p9A6LdwUls6OWb+etsF6hKnZjlPfiEkC+JZjO9+ONWTU4rlmVMf
	qimy2ReotlVLXWBx3cSNBCpOuQD6oUECPvpiyTWi45Bf8aolXJ+q6ajqBHa2WA3Ja9WOzi34hfs
	s/1WXYnT9H/aCnaoWjIJ1E=
X-Received: by 2002:a05:7301:5416:b0:34e:9923:e372 with SMTP id 5a478bee46e88-3514e2d0d28mr325982eec.29.1791266490808;
        Mon, 05 Oct 2026 23:01:30 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35146a2c991sm4250443eec.14.2026.10.05.23.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:01:30 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2] char: lp: fix typo "compatibilty" in comment
Date: Tue,  6 Oct 2026 11:31:25 +0530
Message-ID: <20261006060126.42820-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a typo in a comment, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only a comment is touched,
there is no code change.

Assisted-by: LLM
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---

Notes (v2):
    v2:
     - Split out of "misc: fix typos in comments" v1, which carried this
       drivers/char/ change under a "misc:" prefix.  The hunk itself is
       unchanged.
    
    v1: https://lore.kernel.org/all/20260904113843.21367-1-hemanth.selam@gmail.com/

 drivers/char/lp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/lp.c b/drivers/char/lp.c
index 24417a00dfe9..6e99e7c7a9b7 100644
--- a/drivers/char/lp.c
+++ b/drivers/char/lp.c
@@ -30,7 +30,7 @@
  * CAREFUL will block a bit after in lp_check_status().
  *				Andrea Arcangeli, 15 Oct 1998
  * Obsoleted and removed all the lowlevel stuff implemented in the last
- * month to use the IEEE1284 functions (that handle the _new_ compatibilty
+ * month to use the IEEE1284 functions (that handle the _new_ compatibility
  * mode fine).
  */
 
-- 
2.47.3


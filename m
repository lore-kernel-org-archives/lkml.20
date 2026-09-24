Received: from mail-pz2-f34.google.com (mail-pz2-f34.google.com [74.125.228.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE56442901F
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790235569; cv=none; b=utfyMOC5hS0752awApB8UKGNQBFPP4d6v3rIuOSIwwvfAXjrjfC+EOkG74cMNU09Qb25hixAtT6bk0VqKRc6zwE6HgcXjzeyqECZVKwfaEK5oTFxCqq3rvq6OvKI164XeFR+KffTI5iONECI/97bmhuu8e4dla3965e9IsaMcJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790235569; c=relaxed/simple;
	bh=+VlMZOALNoTVxwvqqOHNg+HWbZydFH9BbG4DHncGqes=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GJQ6MMB1eqd3VR8rnHS2WTCpwIOW2dRv+zJrqOYqOmjGhibnyjdYP3LisLBLtlJ6CgXXclyyN1Nypa1keh/XFWLTaPUXeFDqrXfE4D6vkLBEtzQ94HulKJokU6ivTupH1LrPMECPqBeqCKXPAOXpIQvCPwwx7NoYwiLB+6pIceM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R51z4+HG; arc=none smtp.client-ip=74.125.228.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R51z4+HG"
Received: by mail-pz2-f34.google.com with SMTP id d2e1a72fcca58-8748f34b1f2so941071b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 00:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790235564; x=1790840364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n6HiNqskXz+7GrxS6wHzPZKAwsfj0AyVFsyoKCtHJ2g=;
        b=R51z4+HGI4YrJz66Hz+x2kyZfwba06+ypVMpHRr7/N73oDAvic/658S8bxQznNOD6i
         QXL2nzcbWdH2djR0Qf2A0qpcM4HeoafOzjDY6ys3PEUGZY9f3+v1qayrF2yBqVxNEial
         sOX2wfFbI+0zzqoe73tHHc3YGXUiL87ai1IUGXoO7fYBjM9huXlnX2hpBSuLfcTQk578
         oQYaooc1CLRgt/KaYB7U9Gi1GP94z6UhO7Fzg7u0RNmy2jnB/7KDF2AJDBnyYoaAN2zS
         Cmn8IuO5tZ/zs9U345Iyr437NMt6HhMqP5fdfXk5HmS7x8mgu0lCG8R8K7W0E6dCKU/g
         3Y7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790235564; x=1790840364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n6HiNqskXz+7GrxS6wHzPZKAwsfj0AyVFsyoKCtHJ2g=;
        b=WtErXvloD0yszu1IpYb9guKFOBgzN8s3GOTT/bGNl7W022dZt5/WCZ087tHsC7uk/7
         RsQdML7WUWgm6bktS2Q50wPjIexrRRAWHRc1JBEw6jLD4fi2fAJ9M/acuuMcm4Rd29AD
         MUVGzn1/9P26hgDpaNdqA+BulpSB//pPGZDL+WbNSTb6QT/N3bkDHJolbpcnjIbaSaoQ
         RqzHgQT34oDARA2A2il6SyeJJ1S3E5oiArMAhmmCCHwwytFaha86IdjPbpzP40AO1ADS
         8CO8GT8566cFb95AbSJMKiON6FI8VdGZMcSqPIPiIdNr/Fhv9buqJJYeIc+8YjNNijrP
         crEA==
X-Forwarded-Encrypted: i=1; AKwUvBzXU+JuSjoF8XW581gUTrvmeovOQneOgXKB4yXPspW/HtLljYY0ZAtdcZWaz5Jbtm979lZedPYqzb4+FpQ=@vger.kernel.org
X-Gm-Message-State: AFuF++no4e0eqhuxB/CPxX+a5Gr6MQAPLX+MRbsdULi4NMZUeM2LbWQf
	ZPddiEaonljLp9c+IhF3L4cHgZPKcWqgD2LsQFxShBypxa5/yr7cdP2S
X-Gm-Gg: AYBFou1f8Lp90kJej+S6gwMlWH6gJybB6tO3ybgUtvRnUQXSuwkCR8yh2kgL2BG5O2r
	GLT6gfuULrYxFm8OkEt41MbOLIBbrItnZybzKR8zdNFMsMmGnowEwbOrOM7khvuVahW9tXf06lP
	F8nrPtdj6qS5XBUEaK5vjrLksho9cefEWZiBsIVfctQIPYQXdHA+75CsTX4qwVLEehL1bff9RP2
	WZA+m9yIvLk7eCInqABSgqOFuUN5tRM5xzzfPRe7iozQtziC15k+DOCvbq60lpY0M237E9JSEnK
	1JrrgbO3v4Wf3CRQwgDqbEtynWgSnhxu2gQYDM5Tt8Q80uA7Mks/xen7iW2qSK3caQRq60r2vjF
	FI/zdqPL/LFFyYnSYMSqYzkmhIMJy4vTBbPOJGrUoO4CyycGs+8eu4FbIX8sR7vv58IYqx73lHf
	WlQc2/3IBd8ZZBx1MBUWYuBiMkiPWNJ9vn0myqU60nwJAZAfP+Tu5SWJAuIIdE+x4Wzn9ji82ix
	+mOE1JSyTGRu4r+XOJMi+2AbBONR3Txzx1kHV3VyXbN4vosAOn1CzthWylfJvFFHuVmfpsXECco
	vWBulkWvXYE=
X-Received: by 2002:a05:6a00:90a8:b0:86b:4138:4084 with SMTP id d2e1a72fcca58-87e98f8ccd4mr1408808b3a.15.1790235563675;
        Thu, 24 Sep 2026 00:39:23 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (67.51.127.34.bc.googleusercontent.com. [34.127.51.67])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1dad44c6sm2393739b3a.42.2026.09.24.00.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:39:23 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: al@alarsen.net
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	matthias.goergens@gmail.com,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH v3 4/6] qnx6: release sb_buf on mmi_fs error path in qnx6_fill_super()
Date: Thu, 24 Sep 2026 07:39:17 +0000
Message-ID: <20260924073920.2782917-5-benquike@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
In-Reply-To: <20260921042511.1473629-5-benquike@gmail.com>
References: <20260921042511.1473629-1-benquike@gmail.com> <20260921042511.1473629-5-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In qnx6_fill_super(), when standard qnx6 superblock detection fails, the
driver attempts to probe for an MMI variant via qnx6_mmi_fill_super(s,
silent). If qnx6_mmi_fill_super() fails, qnx6_fill_super() returns -EINVAL
directly without releasing sb_buf (which was allocated by sb_bread(sb, 1)
earlier), leaking the buffer head reference.

Call brelse(sb_buf) on the qnx6_mmi_fill_super() error path in
qnx6_fill_super().

Fixes: 5d026c724220 ("fs: initial qnx6fs addition")
Cc: stable@vger.kernel.org
Tested-by: Matthias Goergens <matthias.goergens@gmail.com>
Reviewed-by: Matthias Goergens <matthias.goergens@gmail.com>
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
Changes in v3:
- Add Tested-by and Reviewed-by tags from Matthias Goergens.
- Update Fixes: tag SHA to 5d026c724220 ("fs: initial qnx6fs addition").

Changes in v2:
- Split out as patch 4/6 as requested by maintainers.

 fs/qnx6/inode.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/qnx6/inode.c b/fs/qnx6/inode.c
index 70438cf5efdf..49e29a918a2d 100644
--- a/fs/qnx6/inode.c
+++ b/fs/qnx6/inode.c
@@ -340,8 +340,10 @@ static int qnx6_fill_super(struct super_block *s, void *data, int silent)
 		}
 	}
 	if (!sb_buf) {
-		if (qnx6_mmi_fill_super(s, silent))
+		if (qnx6_mmi_fill_super(s, silent)) {
+			brelse(sb_buf);
 			return -EINVAL;
+		}
 		return 0;
 	}
 
-- 
2.55.0.1082.g2b9226bbc0-goog

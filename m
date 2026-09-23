Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777184BF94C
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790164720; cv=none; b=itq+aA4AdTiJWcRIuDJyVd6HjdChfsxtKMv1Eg/5Zh+gAW/YWfPOg32hqKtTX13Esga6ggWw/dIjJ22WqmToJlkSoeNjjsRbFFzB3PYNqeyfvckkbEg3Ft0hmCpJasT02Iw/CiBZCcjikg3z1EXnfGVDhlX/JsKbwtIVYS7Sun4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790164720; c=relaxed/simple;
	bh=1H5M234+4Fg/Pq6qk0rP5Oq9G8Tl/o5fQwWqQNUz3Bg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jbBVfq+sC2fJ9g5jtR+OCxQEX6b8p1uEImNE6ygAXd3rf1pF386PaQLW9uUgElk74nWtMLvnM2UI2Q6Y+uCAXCMS10vC6JPVfWdHk+RKKrzR10cVdACwBkyumm4riVJQvM7A457sjTfcIY+AlhJiUw03w0YR6XYAIxZ5GiI6Oxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XJMgnwXO; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XJMgnwXO"
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-98515937bcdso501604241.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790164712; x=1790769512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nlVujRWWeuEM6btf5nuU1hM8tEcJ0tIS4bqjs/e+5Gk=;
        b=XJMgnwXOSR140+QFWwNSFHQCDt/uze1Vf3xV2LcI+wD+Td0lZWK+1rXZJAZdDhVEiN
         kNGMAv7OQRvCf0QObY/1mQ/3HICuG8PizrffmmETEjL0uELj5PeaITK0UWNkj2NNGuzJ
         yDUCqL17kP/J8g5STp+u3zEfNp5KPRSHp3ZzYR3xLx2xxntY76b0KC5O+PjEPrtdDDMp
         3jWPyHqxn9wKFyXphgEuJEwl8D7iFUgXix7DJBKlT3nZNmVfKiH0d6a8QtXQ/RiQ7BdP
         5L3Wd5XEuI4fg1zDEjd2ytcf6AKuuv7RaNYztRsQ3dxfz6xAKjv3Tt9x/uxEq8gvQCNU
         6Irw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790164712; x=1790769512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nlVujRWWeuEM6btf5nuU1hM8tEcJ0tIS4bqjs/e+5Gk=;
        b=elK3tWdYgSpJCZJEvkPNT4Nc4Spu8mBWXUjaWGpcmM5leQ/jlhQ1DyvWNrWvL/hE6n
         TlK+hTaiP0UdOLaWPkzXV9zlZyCoEMTFid0RWnWJwO3K/L6o4SftiX+Y3n8bmyCryz+Q
         ztIZQ1OTZnwE90prm+20O/16Ogrt0qUO2WOQxVthOLg/FihJL0uTFPDj/ENpr9wCheH3
         QxYw2zgN6j4FzTGqMC7ybzDB70QMgT82TQGzi9GcTC4mvh7cAhA6+5wjILSBrxr83E2P
         oN1F8NYWLC86LbzSxHXqJ89waiBPxLyS4ueKFBYMh4M6yk9pUS/YDJIOmTlEZiy61ADc
         NbSg==
X-Forwarded-Encrypted: i=1; AKwUvBwJhKAZihfH0e1rxX8V65M7kb48Y7xViLUKnzvxoLqDd+WxH8dLNgZHAPf4PGjRbQaRdSHq6Pucy2lCWPA=@vger.kernel.org
X-Gm-Message-State: AFuF++lDryUpz7bsLSrMYDU/OnSVl4vuhYisZ7spFRur4D158Jkc48KJ
	Ov6kkSFFxbNFqHuq3kJXFjMd4B4bglv6PfB4orifOgr85CPpLaNooWQZ
X-Gm-Gg: AYBFou3iVsAk8y8ur4qamLVLxoGO2i52BIQDdctxB8OFjhwcxlBoFJdqV7pv060igRS
	oxA60xOmMltZikDagyh58NllHjnB/B0fGlRROxMjsQIgKHD6aKPsdaCwR/O8pt+O0XKOUgFtcuJ
	uwa+9pVs3fvP/7R0RtsfwncH1w6C/kLJFRm2lVx1AyD5kfm4QRUUOl2uwnxP6rQkFF15fSJUKNo
	V3cKdElY9bTfatHIP9CJzZ1888IZlLZE1/COeMqRtIjANUUKQwZnDpfvNWKXUCh7LddBlWLY2wf
	BOIQWQ3+cDS4wEqlIHpZStdNcVfYpPQGfhGDgFpleSg2u38+ISYJxTBmF5x9mk/+Nylcj1RhCae
	cgLwlKjyv2W9xDzoPwqZ10sq9jG6NBkTHv891KWYv85xw4VKfl7Y/Dqa1ZPlBPO+kWBWfC4HV5I
	w87+pL2l0ZrbcqYOq2uVv9/Bwp8sxpPpzErNgso0fUSGTY0wPy5lxg+4FMvaot0jA=
X-Received: by 2002:a67:fa0d:0:b0:7a9:3b76:61ff with SMTP id ada2fe7eead31-7aa9df8a2dcmr4201536137.1.1790164712489;
        Wed, 23 Sep 2026 04:58:32 -0700 (PDT)
Received: from beelink.. ([187.13.30.172])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-985167e6fcfsm3257250241.0.2026.09.23.04.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:58:32 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: linux-xfs@vger.kernel.org,
	Carlos Maiolino <cem@kernel.org>
Cc: "Darrick J . Wong" <djwong@kernel.org>,
	linux-kernel@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Subject: [PATCH v2 RESEND 0/2] xfs: fix out-of-range remote xattr value length
Date: Wed, 23 Sep 2026 08:58:21 -0300
Message-ID: <20260923115823.3305596-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v1 tightened only the read-time leaf verifier.  Darrick pointed out that
the underlying problem is the signed value-length check in the consumer,
xfs_attr_copy_value(): a remote value length is an on-disk __be32 that is
stored into the signed args->rmtvaluelen, so a crafted length such as
0x80000000 becomes negative and slips past the "buffer too small"
-ERANGE guard, and is then used as a copy length.

v2 fixes both ends:

  1/2 rejects a negative or oversized value length in
      xfs_attr_copy_value() before it is used, so a bogus length cannot
      become a copy length even if it reaches the value copier.
  2/2 is the v1 verifier fix, rejecting the malformed remote entry at
      read time.

Both are bug fixes and are now cc'd to stable.

v2:
  - 1/2 is new: fix the signed value-length check in xfs_attr_copy_value
    (the consumer / root cause), per Darrick's review.
  - 2/2: cc stable; otherwise unchanged from the v1 verifier patch.

v1: https://lore.kernel.org/linux-xfs/20260707140118.3217585-1-qwe.aldo@gmail.com/

Aldo Ariel Panzardo (2):
  xfs: reject out-of-range attribute value lengths in
    xfs_attr_copy_value
  xfs: reject remote xattr entries with an out-of-range value length

 fs/xfs/libxfs/xfs_attr_leaf.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

-- 
2.53.0


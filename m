Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FDE3D5222
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 22:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791498547; cv=none; b=fdnPFR4L/lku0zEYVAQZABDTKkMpwAoX6SLHQq/eOfCP9/PzQ3I76LbVasiTuJ/K2wygzt+M/HbvQ3FzWQ6aDKucFFTgLZwyM+Dn2uQq1MTJITTwC/aISvUDbWy3Ldq1puQSaS0dSdcIBz9nz+aaWx0FmGWJHHL+NbjhKRaWj1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791498547; c=relaxed/simple;
	bh=08iAQ1NU8toDQBLWXlTBGn/yQou5e+EnUIVLcAaUiQQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dVsaxwkjYcNp9ytda2Sb32am27g1gZNmUKf9eVo6igiAoEnVMocGAgLydn81wNRiZwvq4yMBkLXpQ8KxxOx67tlUy7NOgUVc63MjETeIU7Tf3TJs1guZtKSv4T8mOkG5//5nNMafAP0bmQEKNH8n0Fi7wTojI5qXMQ8DEMPMrI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=everpuredata.com header.i=@everpuredata.com header.b=YVb8RkRA; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everpuredata.com header.i=@everpuredata.com header.b="YVb8RkRA"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-8266c388b67so3272589a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 15:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everpuredata.com; s=google; t=1791498544; x=1792103344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QxSGMpvroH+VbKAG80pzIKfnlDbTN+IfxcUyNKtQ1bg=;
        b=YVb8RkRAW3/74Q0/+7dZLMnpQZMyiwu0KCDZDLmrC+nrb0PQ1pL9xZVnjdtAd6+PfN
         uQgpbl/Ml+hEFZkbVEai2nniLiTpASDvOm/J1e8koMbTdMppaWWoSfhZbenDRMrBrIIB
         kk162OxWpl8cb7Mpqf32/qOtLDD5nuCn8bU4iMqMUykBTmYAe3u8/Q5DQ8MmKl7Ceyix
         G1S5lNmcmVLTSrcOXBbCrVPQaBpY1LX8O82TTRgdFNtQQKCv+aXmIRnFnJ/nG5ioUBeq
         mWx0ZA+JxPMS/Ku4oCFcaN4z7NAanvn1BoG+hMLuOui47P4VltwYoPyn6mquGWNPuL9h
         E+CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791498544; x=1792103344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QxSGMpvroH+VbKAG80pzIKfnlDbTN+IfxcUyNKtQ1bg=;
        b=eVnAOTHz/CqpPeHEcQylpap7bwpc8in8YbcN9oT7Diq3KEVoeknrsTN25Ka8gXiBbe
         g37Zj1WyenwA91j2hkXELeZfJKzQTF/8ZipNLpTcdwQwvgb5E6etlp+DRmdSRQa/U1/U
         39g4gTRSC12S6Insq3qSLkcYH0LcYgB8BDjBECdTwJ79vZXHTaOuzl8OxOZUUELqT6Sd
         ZkyXuFNxv+UfrpemABU5TGVaI8YISu+FgHOdZ+ku7KLiiEmrBVSxwgmocMjn9Pu9ztJM
         h/mZCGZmLuV+WBHIE5KI+m4Es3mK5rKv3y6fRr3ZOtfQ22GwH2QK2NUCQudNWe9ZkoSW
         e3bA==
X-Gm-Message-State: AFuF++n7tU69MJHcz0TnHmNYXuB4fQJPe9vAsdRgf1LDFLD9AyeZOyXd
	Ue9RvVRwDJDBf+jjDDD5rCRgKW1HAPTJxHPv9TyLAAq1A9ucZWT3iOaBlcBmB4cznKYuPO6oKLj
	xjfockmE=
X-Gm-Gg: AYBFou3kgNsQ0gxxxGhjpxtN0Mw1LGRV+ShVl5kBFbFwOwKJRqKIT8QlAtsMnf8AEnr
	oPaWloOqxN7ScN0Ur4jnUJ7zXhhTGd5k/DRetcPB7XZ7YQX1ZgyyNRXBndPltSAafrJn2Xkx7Eq
	MPoGiHp9iAgcgwJnj1x3T0pCJa3Wp4Jwo1tiIEiV0+cWyeIV7aOIgc/MxWG/Std+ShD1XX31KG0
	CxSwkNKAO/g3JDh43qgF+T4LiGSdgwnlU2kF/sQ2+lHV10v8JjVZuOWU2s7Yqf1l53OntEHGIJG
	ttlz9oRVtD0sgcqs8ZvFMs6I8JJYqQ23A//Bv+sujwMXfzIBx9HaXlea3a8bYYGOyOVjU+GH7xn
	tiVo0Tj0F4z0wstJgan42JMiICV4HXqaXvbS+dLdk1eBYojXEvGv3BT/JkaWj+iCzchliiOJorq
	UGOCyWxTb5i5wF6HwCbSdQPH77iK+xCQImNV10XM4D72rVjDTZ63sLIA/gvVsuRyN2HBvNEa/5J
	8vhAIi/8pTi5gWByGuCwGJnBg==
X-Received: by 2002:a05:6830:2b10:b0:822:27d6:c2ae with SMTP id 46e09a7af769-83023703e35mr463286a34.3.1791498543607;
        Thu, 08 Oct 2026 15:29:03 -0700 (PDT)
Received: from irdv-lubao.dev.purestorage.com ([208.88.158.129])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-83038f82468sm278874a34.11.2026.10.08.15.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 15:29:02 -0700 (PDT)
From: Lucheng Bao <lubao@everpuredata.com>
To: linux-nfs@vger.kernel.org,
	Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	tmenninger@everpuredata.com,
	jcurley@everpuredata.com,
	Lucheng Bao <lubao@everpuredata.com>
Subject: [PATCH 0/2] NFSv4/pNFS: don't trust inode size from MDS while LAYOUTCOMMIT is outstanding
Date: Thu,  8 Oct 2026 22:28:41 +0000
Message-Id: <20261008222843.63319-1-lubao@everpuredata.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a layout requires LAYOUTCOMMIT, the size reported by the MDS may stay
stale until the commit is processed. The client already keeps i_size
from shrinking while writes are outstanding. This series extends that
protection to an outstanding LAYOUTCOMMIT.

Patch 1 rejects smaller sizes while a LAYOUTCOMMIT is pending or in
flight.

Patch 2 defers a LAYOUTRETURN whose OLD_STATEID refresh fails because a
newer segment is busy. Today that return is treated as complete and the
pending LAYOUTCOMMIT is discarded.

Without this series, a stale OPEN or CLOSE reply can lower i_size, and
the next O_APPEND write then lands at the old offset.

Lucheng Bao (2):
  NFSv4/pNFS: prevent i_size regression while layoutcommit is outstanding
  NFSv4/pNFS: defer LAYOUTRETURN after an unsuccessful OLD_STATEID refresh

 fs/nfs/inode.c    | 8 ++++++--
 fs/nfs/nfs4proc.c | 3 ++-
 2 files changed, 8 insertions(+), 3 deletions(-)

-- 
2.34.1


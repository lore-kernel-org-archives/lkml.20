Received: from mail-pj2-f36.google.com (mail-pj2-f36.google.com [74.125.227.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31DF3AF66E
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 12:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789907073; cv=none; b=MnNF5lN2iCo5uvQimnpx1Rmabnqay6IYcHO05Kqn7EjQjk51/9nC8TBXGUXG4800Cxj08/N6lWDswHTGYBncQ6fCXwCcwMYH1NKeI9gTEFlWILfGvdckMugjJeRW2atOAiXNURRN3EoSMZLtFZ/JlgVbDFhF959pPf1vKYr6mgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789907073; c=relaxed/simple;
	bh=2z8zu+W3cq9IzkZqsMaIfcM1XyWPibcdAlGiXD77Nmg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Sn7fBwcdGXlMlqOgICFM7fyVG1t79rIzHv6EDeUtrn/soJf1JGVuh56KHbot6bDabkfqVBlmhoAr4z3aUeQRwb5oNWgtTpBcJJ+3iUrZv97DSwx3X+dY4arHJdS1DvMaxdkD4hsONn6oVbHqI/+XdyJmexCrAVxvpkqdiCSasiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iYito2eo; arc=none smtp.client-ip=74.125.227.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iYito2eo"
Received: by mail-pj2-f36.google.com with SMTP id d9443c01a7336-2d8fdc579daso24448595ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 05:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789907057; x=1790511857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xjgh5OlWwYGa3/r9MOFyxfKxsWIa/znQ2EXAbXuSxlg=;
        b=iYito2eoJh4zmQ36AGOiTbYCHVMbjLD/4R6D4W0gVUi2nBZUCW7acx0TPm5DHY7iQW
         3/efrPFzgqrPQDMe7fgmwtYQHxhP3LS82bt+1T27c0BO9woeNhNYkdrjvrIkf3pU3feX
         xs4oN3Gb+qjLaa8UlG8oross7qtlcAxaRx1AMt6/bFv41H8ZrPkIfnAT9BrwoOKJJ2YQ
         10IdXHPfptgPhlHUKYlPNoLvKEzZQXK8vSvitVQEWqgoh9GmsLZNfrXqRPMUQm1vVQsg
         PD7xRKmlK9PEyBAuH3K0uehV2VMgxYKENSPrEXurSZYiUGe+FP9KY7uOGRw4/WXKhOy3
         DM3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789907057; x=1790511857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xjgh5OlWwYGa3/r9MOFyxfKxsWIa/znQ2EXAbXuSxlg=;
        b=ctckEcrZr1OlbtK6btyQ/DYKI7/7Y1tnJVWOM+yZE2ULi+HC059qAJ23uFMMK1I5GO
         9KhAda2gKbf0uHDyZQdhIPtsXyeBeS0pfl4sFxMZdurhXQVOG3xr7kGTLKjGUIUKa4Sz
         8nw+5wb1jLI+sNShm8ITMmZEYiNytUjbJrA8C3FTR6YNoL8q35Lo3oT1tyIih23iaRhx
         0Brg+CCctcdjpdUSvkJ9X8K4bLylgRz6Vc1vPcUI0vYibZ58cAx67Sqi3HNp6d0EuGdn
         XUojpPRz4/PhCmPxZzqU/WG7wz6Pdhs/3XzuwF/SCAMonOewxFfWFY6uBEWtmIEHhPAj
         3EMw==
X-Forwarded-Encrypted: i=1; AKwUvByWtlHfRoyUm+hiLSbbQDxGXSufZQdcNUIeWx5jfzY/wh8zsDg4fTf7EvdG09PVBOhRaMzscnZlLziHm9E=@vger.kernel.org
X-Gm-Message-State: AFuF++lJG7+Xb2E2VfLMmI1/SEEw3daEf4mqtrY3OIeZVPVQ5iYPf4YS
	IAw+cYGOmPXqWr+nrGRGrqYiYb+8E/Pz5NFyddIIYaDL5JMDzziAtFU=
X-Gm-Gg: AYBFou3o0EJ2ecfijTAqxND1zfWyWOHBo50A4XRBbMXuPsUkRuYmXvFu3Rve0aZR47f
	+PJ9XGnS7xwACDo/cgD465C9q+/AD4AibE3qxXZ82QrCTYcMwfZ3wdoRTeLr7auQQR5F0Fml2eK
	emqct32gsQ1g4tpwAKkkGWa7VqJHy8beI9f+CwMzfDdbMfh02WIKCIr6lVzaXy+hLzA3hBbOpuv
	YAilDsWPsew36wdFVuTXCCwAfumaLdiWsNV54MN8YpcojxU5Dr2OKfQRukldVgHp37Kv7I6zpDi
	EZL0B1mPclIqoaNo2a/76YEva/K+y3y0C2b+8JyKODM8CbM7iZQ8L5cMhvMwM/myj5Kp6nc8t2t
	y1c8xkPty/dbXxy1j59Hn78Fio8Jj+QFLK12VJPqX4N9p4Sho5Z6pXjtrAowAx5NAdpI3K7YDVD
	xZkJbOhFJLTJeE//gC/qeG8T3HpZBO0b3uaNFM//rZ16yNdgXTp7df4fdepa2Yc1WefAtZ9FwOv
	O0sRIHXwtUWYxQqwJXXdIehHyo=
X-Received: by 2002:a17:90b:5784:b0:39d:f5b1:e365 with SMTP id 98e67ed59e1d1-39e54f35b9cmr12927548a91.25.1789907057067;
        Sun, 20 Sep 2026 05:24:17 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f00:8c85:e0d6:4b87:c472:c9ae])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6cae997csm8753943a91.11.2026.09.20.05.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 05:24:16 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: sj@kernel.org,
	akpm@linux-foundation.org
Cc: damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: [PATCH v3 0/2] mm/damon: fix the temporal goal tuner's size quota conversion
Date: Sun, 20 Sep 2026 21:24:09 +0900
Message-ID: <20260920122411.610213-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

damos_goal_tune_esz_bp_temporal() hands the size quota to
damos_set_effective_quota() through quota->esz_bp in basis points, and
the multiply that gets it there is unchecked.  On 32-bit it wraps above
429496 bytes, and to exactly zero for every multiple of 256 MiB.  A zero
effective quota makes damos_quota_is_full() true on the first test of
every charge window, so the scheme applies nothing for as long as the
goal is unachieved.

Patch 1 bounds the conversion.  Patch 2 pins the boundary in the core
kunit suite, where it would fail without patch 1 on any word size.

v2: https://lore.kernel.org/damon/20260920023111.2466265-1-donggeunyoo.kernel@gmail.com/

Changes in v3, all from SJ Park's review; the code is unchanged:
- patch 1: wrap the changelog at 72 columns, say what the impact is and
  is not, fold the 64-bit boundary into the trigger conditions rather
  than arguing it separately, and drop the passage on why widening
  esz_bp is not the fix
- patch 2: wrap the changelog at 72 columns; pick up the Reviewed-by
- drop the documentation patch, which SJ asked to drop

Rebased onto mm-new 87acb5b914c2; v2's base is no longer in that branch.

DAMON kunit on x86_64, on the new base: 36 tests, all passing with both
patches; 35 passing and damos_test_esz_goal_temporal failing with patch
2 alone.

Donggeun Yoo (2):
  mm/damon/core: prevent size quota overflow in the temporal goal tuner
  mm/damon/tests/core-kunit: test the temporal tuner's size quota
    conversion

 mm/damon/core.c             |  2 +-
 mm/damon/tests/core-kunit.h | 48 +++++++++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+), 1 deletion(-)

-- 
2.53.0


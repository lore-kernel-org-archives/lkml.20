Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C093949F113
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790002750; cv=none; b=OaOSrdRrs249PHbodlWMb0ZQ/EI217fCb/eETWtb8gPB8vw5rkS1B61QrO9EffO7U4NtEbcp9YLBEUMkdUqqRntG9/LhTdL8ZTtDe23Dau6lbFhslh+j8YkyHEGyoiWJS7CzGFJIcAx6GHuEQ9oxtbWTtBTQNSs0+yx707WK97k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790002750; c=relaxed/simple;
	bh=8M0SLTDrRIVLkoqoQEzUO3vyglUBCE6RNBc4XzgC9jo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ru7NIMHWOyqCSEUnqPkYXlV9uE7PFkX10FFnANoM15J6EsO7O/lUKUQcelyCRRWPHctaYzcD+WOvSO7FBYsz3bU2QqKasoKJtyLGAYeesu2nGwrNRUwyYJNu7tHyLypqERRq6fY5jc42+pKUozchfck6IctsPdvlsTohGdn5goA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zd4Faamo; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zd4Faamo"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-868a9c48f9eso3696806b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790002748; x=1790607548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6gXmW4UXVfkRmgjmxz6ooHCPLTvMZVSsUjwaz8wmJfM=;
        b=Zd4FaamoKn32Cvhejs2Rb2PPB315EMBa7zDnk4DMHZsHTm8+SQUzVEyZywYHuHVqOG
         t2dmzLkLu0/gO1ra4wQquQ7VzzdOijpsddfWz1Fm4PmAdiF3F2epFIsCtlcF0od3YpSR
         EjnGkoc3rFhb2oOfDDO2ihgOOYdYwrtLwITy3ASrrtjGsTk+09d5jhaJxEzaiVFql0DO
         eN8DDDliaVutT6N5rD/DeiBGadwOB+FclA3mP6TMSzceT9RoVSDg62TJzd83jb/FlK/U
         6/33SHp2nEC7dvbuWdB8Ce8V8j+jZWkqJErtN7GMjFbniqBLg7d5Ttf/7CkvZpCebg5K
         5/dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790002748; x=1790607548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6gXmW4UXVfkRmgjmxz6ooHCPLTvMZVSsUjwaz8wmJfM=;
        b=He5/ZwC5S8/qS+liUbpyMWW3RMsLPYfmGgIg69q+rE1LEowvqX9XmpGrK8ydKRAR0l
         e68Ve91F+uC2JZ/RnzZGc/7dKYFzeM+r2tpOAJmeo+BGu6y+ksASP2cgDXubuZXkNllu
         VsBVxZilGrdTpnAqB1LMqTIz19y9aow2KsnWzY7X+lLBpSy/LTmIZi1kV4XamdpRFfq2
         YT1rKz5zAFI4FPTVjeiQeMbl4OMVXNxsKi6w02g8t1O8a1ZuZx2gZMIlDI4VtadXOovE
         TLmwPLPiVAh7gYXfyfpKyWDXMvFxj+y3LoO0dDPsolufJjmuO3dfAxthh4+ZKkN+3dZG
         Ifzw==
X-Forwarded-Encrypted: i=1; AKwUvBwEOO42skzyG7+KXFZ46P/VTF6u0aS6Oi1IgcKziIshFVoB767dvhQxB7npdzi6Wtmigu90YUMupl0/1UM=@vger.kernel.org
X-Gm-Message-State: AFuF++lX8riglesYGr99O74oowO/sre/oZ3vmWTqlOm/bUJ77ePAi+mr
	ybxzYnYUHse6Sg1HRmRWtgF/ZDolSCSwponGO4A31p99xFCkxxM0C0iP
X-Gm-Gg: AYBFou1z0k5ug1jQJulYWrC/6XzuZgrPQk1sza1iZ8VWPjt4RmS1uUVn5kJezL3TL9G
	Z0DxW8blqNJWZEUgIc2CMm7FhukVMkOfGByB02C6ymn/mjBKxYjTIlkwvQmPS2lop74lTc0lxKq
	TF0Lhr6YReA4HuDh05Nf96K39UQaM2qDQoCIpKv7r91lNzh7Vff+N+mAL8tJFsevuSJRnwYtGDy
	BRVck8LXoy6QQVfmcvZi27DsrBelwt1YpKB/WJpND+goDE9xAAnUrFd1jvjKVsOIJ8LuWjvN184
	Tf1+KPeLKPaxcilMVCoEIggTGtzRyEQIuluimVsrGzWz6ybfVVnpeWhVfuthTs7xzhofko9P2dH
	2NyOfL+Ta2vKvsQpwnGCwzO6Ie8iVTkBjHPOAyPEW+zSB/+FbQU92mourCYFiV51K9MR+DoOlGL
	4ihQHdMstbzWok0+rhou/bEU77dduP5RpqvE/moF0+IiWB4yYypTQTnvGt27gHZ78yIrKCZJWta
	41MuDmRMGmQQL9q/M8BXWpnzg==
X-Received: by 2002:a05:6a00:174b:b0:879:757b:4cd6 with SMTP id d2e1a72fcca58-879757b6aafmr5596402b3a.3.1790002747974;
        Mon, 21 Sep 2026 07:59:07 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d4a:e90:70bd:a3d:dfa4:3859])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a8dfe20dsm3536613b3a.19.2026.09.21.07.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 07:59:07 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Daniel Wagner <dwagner@suse.de>
Cc: Hannes Reinecke <hare@suse.de>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvmet-fcloop: fail LS request synchronously when remote port is gone
Date: Mon, 21 Sep 2026 21:59:02 +0700
Message-ID: <20260921145902.17223-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2ad8b13c-b548-4574-9c61-5224833e1bad@flourine.local>
References: <2ad8b13c-b548-4574-9c61-5224833e1bad@flourine.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Daniel,

Thanks for the review, you are right: the async -ECONNREFUSED completion
is how an HBA would behave, so failing synchronously in fcloop changes
that.

I dropped the fcloop change. v2 keeps fcloop as is and flushes nvmet_wq a
second time in nvmet_fc_unregister_targetport(), so the LS completion
queued by nvmet_fc_delete_assoc_work() during the first flush has run
before nvmet_fc_free_pending_reqs() frees the remaining requests:

  [PATCH v2] nvmet-fc: flush nvmet_wq twice on targetport unregister
  Message-ID: <20260921145651.17131-1-ngocthang2710.1999@gmail.com>

Hannes' blktest request is covered by nvme/071, sent separately to
linux-block. It fails with a UAF on an unpatched kernel and passes with v2.

Thanks,
Thang

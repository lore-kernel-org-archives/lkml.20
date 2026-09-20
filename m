Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60ABE3AFD03
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 02:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789871859; cv=none; b=ASFANF8maXqO92hGE9jE2UEeXyvBNAZgfQQsrYVGc0m/m3aeYo8/edIz51Gr+QQ7XoM6qoEXZZ1QVey5n0OxFGYGw2YoslGfZ7D8yqxXiS5AK5SjTwnFkMHjsz9QexsCoisn08288dLLxIf6P8xvBeCgXsbtpG8CHoENp5mz6Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789871859; c=relaxed/simple;
	bh=G6MJJlrNk7Yn2tf9+AziitycZl/J9WfVYQtX5uMidQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fDD83jSGo+HEM2UAOt3FTHgG9FREpUmAYoGRrIR10pRc/HXls+/CQRNqsQnys/ckg88qzuxsfGptrDoarLEPRBpG/SzgVP2/T+iw3G+O4UmlNf9MMoEe5ROoWXNXyHBRWUVaKLum4OB080/8uMajcBvOPqAiZXK1+xhPdqDKbA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ii+T/T2M; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ii+T/T2M"
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc5256c2a4bso1261175a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 19:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789871858; x=1790476658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a661l6/McfJBsW6ih7SIBpxNulf6pfTW6jSdeP75Wo8=;
        b=Ii+T/T2MwKaO7skORU1boqRpOaVrEcp3e8oqndIwu2ERt0KDnpmW9h8xWO5cY8eFQP
         E/m72jwqtJhKeiMvLitw4U9ovFAP02nOVnG+82kobDsT924RLOsbrL8l0lL2Fl7NI0lb
         Dz6HS9Kviu4vd5YZA5sVs5R+EwpGkbLMDhEQRTuZx/vxzAvj1w6ZmPhaaM0sy40utcDG
         PjmUyfIW3FIdpFaMCxSaxa2af95cI3knjNttxq3RjvGsWgOnfhbU3YKNyoKoCxefJjiB
         mYQtWskSUw7L0xSLzxU5L2BGb7n7VQQ41BSMG9mNrOI4ALVgDqplldyEVI1BjI8tKR7l
         7Y0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789871858; x=1790476658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a661l6/McfJBsW6ih7SIBpxNulf6pfTW6jSdeP75Wo8=;
        b=L7Bxf7ljjp3mMomA7EmdgIl1g1VxnYYf4L2hBOOVEVEbbTST6EdzeadVi/P1dAUinF
         XctnpgRG5W4L33L0uVfGaNKcRzXX/XvIfCRYkd0c+IIYwslDpgvqTmmRKbs1YjTB2HWZ
         Z9xEbQWNkbQoEqifMsy3Meqq0INDmlGW7M8MmEocxT4m9LjMSwALQsh3qY2UtTbWGvaK
         /j5YVMmIDJmnZRMbkVt61DeyfQuNyoxCn6/GXbZ+AhEycV0hHhcVRg1zDh9kJ1NnDAR9
         WziZfuJd1ZoSoBZlySxJwFBb2UdWpbLpZaEN3jLWqWWfSGnG0luOFix4f7HxO8Mf+QKV
         U/QA==
X-Forwarded-Encrypted: i=1; AKwUvBx3rohDYLzOCLebr+Sfbq2HeyJBsBQ32LyVMBgESgYr8JvMo01fJ5va2YufSckggijmmPUd9GJ1TwfVeMM=@vger.kernel.org
X-Gm-Message-State: AFuF++lbCnFi3WfnnjuW2W+xaPP3OKPYSa6ARnLbhMtkiK0h5EuCdi/f
	E7ArnhaeuCtIfD5NUjsqz7uMSKDVUgVIADR781uE0f8kLgIdwEJKjmkRMTa1DEzoSQ==
X-Gm-Gg: AYBFou35m5FLi5OLfhltwVooSH1e0JnW/apDwvLoz8qrPfyfT553fLUSjv9g5M+Cy0V
	dwgEQm46uc50jn5Pgw52yHwl6RuTSfjYn3NBtAsslAudP07EImyQZsAj8Uhyjvjde8dTd24GjP1
	pHqiVyGYcxGfthUZFtSNWLwLPFiBU3E0N17dvmGNIpFRKHaBKAKbU+FMSRbaOl+yGYX1YDfPsbp
	9HuQKDkHlrHqY2biuIsZNu2schPn+MVjS2nIgU5RocRm2ADvdibnPcwiTOMjusBIVxxTRmOQyHE
	JM6u+pru61UEpBUHlTMhpRLHd0cXrbLTrDsbOAYKlxdaOMM1YYzfZ8Wzjq9Ap9+RwiFOZQ1pAyz
	9dTqnnTTBPiNF0zJRY4IUTtr3Euz/AYg94JLYOWd2FKFec+FRDXFoZLOkK7xpNMrsZqcQN1FuIs
	W2vrF3uC3hs97mmU0n3cPQXFPX4Z+V1q5k7Bv4qnJIstJNkRmQbZtb/taLRRzShZH8TM/fYQowj
	bptIuc0utR6+MEJc5JrFWhRJA==
X-Received: by 2002:a17:90b:5287:b0:38e:7168:281 with SMTP id 98e67ed59e1d1-39e54ce361emr12233813a91.10.1789871857656;
        Sat, 19 Sep 2026 19:37:37 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f00:8c85:36d8:54a:e0bc:3e5e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c37c8e7sm6799764a91.9.2026.09.19.19.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 19:37:35 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Donggeun Yoo <donggeunyoo.kernel@gmail.com>,
	akpm@linux-foundation.org,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v1 1/2] mm/damon/core: prevent size quota overflow in the temporal goal tuner
Date: Sun, 20 Sep 2026 11:37:28 +0900
Message-ID: <20260920023730.2468388-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260919165509.86678-1-sj@kernel.org>
References: <20260919071324.1583280-2-donggeunyoo.kernel@gmail.com> <20260919165509.86678-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi SJ,

Thank you for the review, and for pointing me at addr_unit -- I did not
know about it.

On Sat, 19 Sep 2026 09:55:08 -0700 SJ Park <sj@kernel.org> wrote:
> For 32-bit machines, we have addr_unit parameter.  I believe use of it could
> effectively solve this kind of issues.  Correct me if I'm wrong.

You are right that it helps, and quite a lot: with a larger unit the same
amount of memory is written to quotas/bytes as a smaller number, so the
boundary is much harder to reach in practice.  It does not move the
boundary itself, though, since the multiply is on the value written
whatever the unit means.  And as you say, only paddr implements addr_unit,
so vaddr and fvaddr get nothing from it.

The 64-bit case turned out to be a little more than theoretical too.
bytes_store() takes whatever kstrtoul() parses, so a quotas/bytes above
1844674407370955 wraps there with no scaling involved.

v2 says both in the changelog, and your suggestion about the user
documents became a third patch.  I also took your form of the guard; it is
a one-line diff and it reads better.

  https://lore.kernel.org/damon/20260920023111.2466265-1-donggeunyoo.kernel@gmail.com/

Thanks,
Donggeun

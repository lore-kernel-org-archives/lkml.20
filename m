Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794125318;
	b=Cgj+wRf/bOH/LGUjHSfmJOnjhYwZOVkyfok+8YWk6tzJGcYcC8b0733Dolv/dNcvihmm
	 cMNoLHsp9ukLgUetlKz6p4Z1ISjX7GUypWeNkRsM222P4cMfyXIu2dZw+ub1hy6duTA5Z
	 IjTfR9zKbcmeRMrepm9L4W0+33cBuA6nKsZAhgvL54ew3Z5YqLgQST32c4g+QGpryx3Wh
	 zoU6zopDNKFf5nadWCcU+yS5uDxLgee3JnXJlMW1vkHKFfIpPaMN1kbvDvybLTWimWAD1
	 pElYQImklAdspBxz8LkM6vkFQgtjuBWxp+9e9YAaiY6XpPZ5C3O5Lajvg0Jy91UgBBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794125318;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TsRttVjyd52nFqSKn2goHPGI41zRyopfMZ0qKg9Sa5g=;
	b=JTkwE+byv4su304Z0EK1ySChdLY28puW8fVc/cis12RJ+Bxgb0m3D3RSkDZk8qjUuflu
	 TuaOk4TV6OV/jonzKsm54bI6Vb9EbL8PqfnO9kDuVoLSxeyPzskcmNZWIdsKoYDhoixNR
	 JmtVP6ynog53A30qFaQCR/WYukS0O1ikhTfzxZnt3vN76z3tk/u4QD26gdjQe5lQkwOiT
	 aOm0LATtjMeQUZAwg+bLw9VCyzV2OxQP/9KP9f5RXLzOqai6Oc2w6bO+j2cDdzCwQ9ldM
	 qq3kO1W97blsxTOjudYkYW029hSgzOhq8VNxLWw1R9Vzkt+cdrvc9dXZEjG1WuAT5bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="r/m7Zo7P";
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2E1606A322
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 08:08:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A2E1606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r/m7Zo7P
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-37000e7234bso890323eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 00:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794125318; x=1794730118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TsRttVjyd52nFqSKn2goHPGI41zRyopfMZ0qKg9Sa5g=;
        b=r/m7Zo7PFarqKvoI+Fpdim0GYjyaCzcMe1baV5ykCMlaJ6T5LaoNb+8dvaJT6Yzkin
         gHMf/n3RrOD0/WroYYQgCvWZTaxBZJBD2Xnu+++W4i9MSQBVDi++W1MW8dc4KhNWyE4e
         xdsFkdy7HfL1s5NdGxVC1vUn25pqrc62mMSWzFndU4Yr0KE4t4qbdoDDZEsiyG/il9gi
         jwkYhPePT9pxrvJB47bqpscAuW6M/7N6vLlrDLge9gMgBjOFpi7P2ww4teKeuRxMMc34
         qzcTkSVhDx9s3hObPtescXpepLafzuM+v8lQupntdbcHnGJ0z7+xEjBlEwWro5QbDY3M
         4SvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794125318; x=1794730118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TsRttVjyd52nFqSKn2goHPGI41zRyopfMZ0qKg9Sa5g=;
        b=vP8CdiSwR9w3ddbsHL4qSGPUArT7FUV97xbh0O4MdNC5qgRZkhStBs2nVitbbbqnud
         bd/W67wvXdx3CBmvRaR0G0obNM6p7gG1LFe4Jvg8zNdPJfLDOrkqjOxvT6t+aEgqQceV
         +RUs02tcy9PZCUxAVc9GfQtSRMXpVbd5KPflDQPWMy6dx/Atnsc1DimQJxx2LXVAqods
         3GFWevodF5ohq7eq7FO+ZCW3UOVVplH7z/kQO1CwQ1KOB6+B7PPdwDeXlk1p1ZYAlJ6X
         IFXboSm9QhYgqjelffIerMtyuFxVghdyA2C9yGRZV4bTqeoRP02KvX5P7009Y/zB5/ZQ
         nmFA==
X-Forwarded-Encrypted: i=1; AL+hErFcAjeZb/uyPG7ONwhD8hPeHenG0MVJERJ/SZeXwpWnkShft+ALuXpGywRTfovh6cMJHQaAQFn1w0o1feE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Bjj6wBEKpzyRWZ0nqFMUCaquU2dwE7hx3Vmxl4jSpjdgINaeZ
	brbQcZLUXhNkXRzn/gtaLNFET1oGdlsDwo3l6TW1HyJCwSHaFr3BfqFV
X-Gm-Gg: AYBFou3bulNtCyud+3L5M/wCA2TyTjCFTTgvENXe//OQieeWWGh3B5P5i1MSnZ8Rs+T
	/IpkpBNJErszJ0aWRv1VRDno+bALGWzQkl0Ermqu8pgKeYxk9yjkGi1d8DhTd6XG+iBGk2GJXcG
	JWfyao40OyFbEHla4eWt3dY4utYMjwh0+Pppk2qX+Zviw6RrjHPvAoglC0GMfTE8TZL5dbfmb/G
	4GYVhpmh9ls7YGLcLu91UW+3LvN4DlA1/ONXaEcG3252oxawxVZ+ZJ8Ilf7trFog1mpsi4yyhz/
	2Fk2L3/Zo4NT5fkbo+8o5Tv9LDCOJeR57nT9Ac9Kue/BZYFr5iLSN0aMWy+vm8ii8zDjonwnDwL
	WsiOHt+/difI41Nyg1z27PtYF1GudsaR3gPbhrMGhqBSo2FVNiwo4JgNOb62pTMSBS7TPXEcJSS
	7//ziysdcb0CcF8fgB5W+cJi9Lg7zp7DZp0hpsSOTvrntqnEHPEIbkZiZZZe4gxaNloJU9z7L70
	J8b8xB90SKIrfpj52An27ni+oQ7qY67uPYX9LvX+HSB592WHcFpu2EmBsNRJthXpZO3Hs1jn5wR
	qPM7bUJxBT2URhIsxJKv40cwqULFkDmqpJgivdxDjPlsG7yIyDa1pX6C22aCxQkd6A==
X-Received: by 2002:a05:701b:220d:b0:1b2:6cba:7f48 with SMTP id a92af1059eb24-1b39ff068c2mr1346405c88.31.1794125317382;
        Sun, 08 Nov 2026 00:08:37 -0800 (PST)
Received: from anon-laptop ([103.187.196.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755e8a27sm3898586c88.7.2026.11.08.00.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 00:08:36 -0800 (PST)
From: Wahid Khan <wahidzk0091@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] ntfs: do not convert a named $DATA stream when making room in a record
Date: Sun,  8 Nov 2026 13:38:23 +0530
Message-ID: <20261108080823.473369-1-wahidzk0091@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <CAKYAXd-68oCuAU=x0TV6BMsNJZkmBcdVZTtOQXh3iEm6BptJSg@mail.gmail.com>
References: <CAKYAXd-68oCuAU=x0TV6BMsNJZkmBcdVZTtOQXh3iEm6BptJSg@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

You were right, v3 deadlocks. I reproduced your diagram: with a debug
delay before the folio lock in ntfs_attr_make_non_resident(), a reader
of the stream and the make-room loop hang the kernel (hung task, lockdep
shows the writer holding the unnamed inode's i_rwsem and mrec_lock and
waiting for folio 0, the reader holding the stream's folio 0 and waiting
for mrec_lock). The same direct conversion of the inode being written
is safe because the reader of that inode waits on its i_rwsem first.

An automated review of v3 also listed other problems with converting a
stream from this loop. I could reproduce most of them, with a forced
make-room pass and debug delays:

- a write to the stream that passed its residency check before the
  conversion carries on with a non-resident attribute (iomap_iter
  WARNINGs, "possible recursive locking", hang)
- an unlinked file with an open stream: "mft 0x1b, type 0x80 is
  corrupt. Run chkdsk." and the next write to the stream fails
- a stream that is being removed is converted under
  ntfs_stream_finish_remove() (unlink returned 1)
- two streams whose names differ only in case: WARN in
  ntfs_attr_make_non_resident(), the lookup ignores case

v4 keeps ntfs_attr_iget() for the named stream and adds what is needed:
FGP_NOWAIT for the folio in this loop (skip when busy), convert a
stream only if it is not in the inode cache and its file is not being
deleted or unlinked, and compare the stream name exactly. All of the
cases above fail on v3 and pass with v4. The WARN from the original
image is fixed.

I could not show data loss on unlink, only that the unsafe state is
reached. The debug delays are mine, so these windows are narrow without
them. If you think this is more than the loop should
carry, the one-line v2 (skip named streams) also fixes the WARN.

Thanks,
Wahid

Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7D33A8388
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 02:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788229212; cv=none; b=KRqnbbCom0vIr05tmLkrPyt10C0wdVZ58EOXjjv/4aQ6oJuvrhBKiGv/XPJW33vlm1Q0zI7h+MXUgk7AWaumjWa21NHCzjahktWf1KvioPAuiIEDV60kT7QqGkIFk7UVjzZlqw5U6srtK4YIMQumte37ob/uIXbs2zRJnb3zwLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788229212; c=relaxed/simple;
	bh=pReCZ/lZVigpmnECFh75mQTJm3paN7ZW20fAMM0zJUY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M9eBNyg87nqryJ/JRNeKYKM7Qg0aSrYpP5PJfviemOX3VGwUz7yG6TY1hIuVUJfqVTSFSjNmr2McFUY4e4vtyjOb5RC2tGdDKFsesFwOb7gNA5wEn21A0PLO7IXGtqrV109sVdYm3O9KAzdeTJtlsUf3MUSESqUsqdNvDmMioAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XER1stx3; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XER1stx3"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-853e2610bb4so406104b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 19:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788229211; x=1788834011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o7V9z4lGg2Zq3oLqNbA6E6uUJgmE6UGQOAlFEXJea6E=;
        b=XER1stx3fCafUBo4mM/QtGMdgP10T03+snzfO//BxdOrNcMCkLwgK1HB7v7mYlfb8s
         YYSJRDdPOgZHyxcqdpOK2f7GNSpRWiYfLN312JOs/ZHTqVdx3SGA2RdbJwwGUEeBtahM
         c8pQbzDaX74XPKu3Vih8ABkuKu9KstJE8Q9RBHKH0QaWIW8ryQXS0X/NbqBJ9kzob/CS
         xdefkutc2x7ZYK8tCQwX8q53lyaH+Ja7FfAPnaJ8ina17jCdhnm0X7PkY3KiT1fPgc3x
         h577ljJXJ6gtjVB4Bn9HLUUCN862XmXjiNBlV1NdtthH/+OUcAU0GDwDhfBfZWlup6Nu
         bjSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788229211; x=1788834011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o7V9z4lGg2Zq3oLqNbA6E6uUJgmE6UGQOAlFEXJea6E=;
        b=dvpUtdZoYeJEBUJEznDlU9ZLyYR283ydLjwEVxbJlvcXiiEovJtusxzuIgNmVeZwny
         hwT9V0v3HLmY+WcuZmiAmmL45GzRGuyQGMTVIW3e1txAGoYgw4IYRroxgHQbfXA+F1tj
         oqQeFmSycefnN3nhZSQnLXVKxlc+YnthM/d6GXsIgOPRRMKctjWdTLTix1vkCtOqtasX
         XLbg4AmirLACdp7eAylfTs47nmFSmyj5kjf0hOrIt8B3oBxYKVa6qaDEi/daQ/Y9BnBk
         JquEMtePNyXmF9l9D0RfJSXIdQeyOp569epOFfGUtT7y9mtmWFgfJwpxbvxbLIPVilvF
         geYw==
X-Forwarded-Encrypted: i=1; AHgh+RpN+KzqLnkzUpBw7nDnZcVqeSf2y9oC8NzmT1e2dBxrjglgHPhKYFZHZsmhCfiXbiWvrq47BQC7XgVRLqM=@vger.kernel.org
X-Gm-Message-State: AFuF++lmRtvsP2JW4O8AYcVHGjRheLTkwjcxzIRW+vAm0+HjrNRZjhAi
	m//xplM/i3Zpz1oHmfhdIAvqcQornVlUzMykdZb8p+jx3qkU5AII1ce25St5YA==
X-Gm-Gg: AR+sD10iaey4I0xGkAkQMYdAm6NglVcrLRKoyc16pqsfDBnaXhqEh37sOIOv7LMCRcF
	8UsakXqZqNq/3Sf3Zp9Gtab2i4jrNup/PrVnIU2uBc81uYXgg9eCpDKQR97xdzCp8dCWu6/D5NA
	D2sxvWIvDaAX20Ehr+gJbLri7nYj+AcAL/++801+sW1Iq5/rrSVF3lPSVBR2at8uM/dFU2vBY3u
	ZxnKc3Rje9+gLgpBfCXQAylA4Mp8b+hC/061doU/pNieknxabRM/pUjMsskJsMRNPRSAGJCwkTI
	1KcZQDGtCPbNDH1F1EN46BuNLGXl/1Ml4772GGTzOUUJW9VmhEIL8gvc7nJav/Yvdp6m7xL+f3P
	EMPHRXFJMi42n8DXDwAZ0AJ9vWH9nlSf16SuYBYcWKMZkwjoDHNqPnxYWdLtvDqrruOzJsIW2aT
	y6mMkVkJDU9Ap5+kqKQXctUFKe6JzAaGK7g4trmRTLTy/g6PLWk5y3UpYUFlkCXvM5x1EfYML1
X-Received: by 2002:a05:6a21:71ca:b0:3d3:aed2:6f20 with SMTP id adf61e73a8af0-3d8192ab0cfmr1860014637.20.1788229210603;
        Mon, 31 Aug 2026 19:20:10 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f32f698bsm5063022a12.6.2026.08.31.19.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 19:20:10 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: fangqiurong@kylinos.cn
Cc: tj@kernel.org,
	void@manifault.com,
	arighi@kernel.org,
	changwoo@kernel.org,
	sched-ext@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: Re: [PATCH v2] sched_ext: Skip per-CPU data allocation for built-in DSQs
Date: Tue,  1 Sep 2026 10:20:04 +0800
Message-ID: <20260901022004.1824584-1-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901013258.1822890-1-fangqiurong@kylinos.cn>
References: <20260901013258.1822890-1-fangqiurong@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The v2 note says the waste is described as quadratic, but the changelog=0D
still gives it per DSQ:=0D
=0D
> Every DSQ still allocates nr_cpu_ids * sizeof(struct scx_dsq_pcpu)=0D
> bytes of per-CPU memory for it.=0D
=0D
Four of the five built-in ids come one per CPU: SCX_DSQ_BYPASS in the=0D
for_each_possible_cpu() at ext.c:7173, SCX_DSQ_LOCAL and SCX_DSQ_REJECT in=
=0D
the one at 8679, SCX_DSQ_RESCUE per rq in scx_rescue_init().  Only=0D
SCX_DSQ_GLOBAL is per node.  So the total is nr_cpu_ids squared, and a=0D
reader of the changelog as it stands will work out a factor of nr_cpu_ids.=
=0D
Worth spelling out, since that is where the saving is.=0D
=0D
The code is right.  scx_init_dsq() memsets the whole dsq first=0D
(ext.c:5046) and sets lock, list, id and sched before the new early=0D
return, so nothing a built-in id needs is skipped, and exit_dsq()'s=0D
->pcpu_user test is the load-bearing kind: 7101, 5367 and 7334 all call it=
=0D
with built-in DSQs.  The only reader of the per-CPU data, ext.c:1130, was=0D
already behind the !(dsq->id & SCX_DSQ_FLAG_BUILTIN) test above it.=0D
=0D
Reviewed-by: Zhan Xusheng <zhanxusheng@xiaomi.com>=0D
=0D
Thanks,=0D
Zhan Xusheng=0D

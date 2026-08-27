Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F993F0A86
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787824619; cv=none; b=PnrIsUnmsJKcrce8n1s0caDx06jDh5tkVwaoXnWgzkrctjeRfG8GHgSQ1Fu4Lc/B+d3BBGUruhFPuvluNfADhAOoHBkDP1wEWX/Rxpv9S8HpsKl2LuHjSBbdWBH8gdqAZ/KoLKX/LlYCZ/NZE/seXAckCv+c0FEWuxpqMgJMtsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787824619; c=relaxed/simple;
	bh=ZsgSEkFEThAsuNHtCMgJ2lAhqARJk3KNgLFl25kjaN4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sI33/gJ1NARx0SMvxOwLpm24sWSslPlxpcwiIHUkUnJr5i3qT6SDJD6oxcMCcfVHgtAYNNb+SUx59gVzi6W/qMueH+u+Re2yPZXzNkVceQyxtwaUIK955M/0f2EvasDXGcSltX6hwJmySrKOMwlCUF0tyRm/w9cpkpeKFTsGRoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LdsuvsJ0; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LdsuvsJ0"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8556ec44e9aso284107b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 02:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787824603; x=1788429403; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZsgSEkFEThAsuNHtCMgJ2lAhqARJk3KNgLFl25kjaN4=;
        b=LdsuvsJ0tWhH5krOisGt+B73nqDbgp9TyPwMy7s7EEZFKkQrGpoyYPmxuyM3KU39G+
         Mho/Rjoa9KLsPyY511asHYVq/7f3VKsa2G77eXmC054dFoIrX3aw3yKajHkZ9q78w3td
         X87vd28XP4hj7FJurmNHqYxvy9EPLYAarALoupfMn8uCXxbrbHCIskNtke9acM5j41gj
         7nL6KLQvJ6Tq7uC6v0trFUDrMeqCSPbQ5aivTRVg+j4wU9FODCNQ+is9vrZWoAFVXScl
         N1dZztccy3VRDsK5fLR2KlLx9TfU+og6aFw6ncp486wauTRf9LxIkWLxEiH+plcjIRRP
         qRkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787824603; x=1788429403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZsgSEkFEThAsuNHtCMgJ2lAhqARJk3KNgLFl25kjaN4=;
        b=tCqKwMgub/wBXvreSLqhLoSQTZ3X++JT0NHbz+a3MrdPslD6T5qi7/hlj3XieSiDOe
         xIGM2/5jj6lV9DeSM95STNg2xKZ2WSDCPKrpmN26+QbEw9ru4vTo/CUvIXFyapoyouwM
         04/XEjKmSceXxaOnYSOzOV6Jc73Xi/blpC2w0JuCwpTOk/S9AiwKn2EwlxpnKD77v2Le
         BztQ2ddQ9DYQ57zrglvFkjXF5vDltZv4luP3G0K+N52+EBDvDn8Mcf700ewF8Aa6NLEy
         cBRIT5iuqxlD4CH2AiNdwKTd8BSFMWGDKCRekHN+tE7vbcHIMBCix9gL0NQrDg18L1vc
         D/ag==
X-Forwarded-Encrypted: i=1; AHgh+RoQ1/0GvckIty0QZr/+bED5XYlruOwxaDByoMN7tmtf9cHCvqVSL2FG+DrdDmHTDcn43rzjmSnmtkHPdQg=@vger.kernel.org
X-Gm-Message-State: AFuF++llE2LTTrWDq1y0YXvuG5EEH2AvO6dBpHhOK1pwoM5TTulZXA/M
	OdZQzqgvw6LvIy7pdn5myX8btrWIBo9ugxbIuF9boWmxYJKen3AgeYXT
X-Gm-Gg: AR+sD10tytY0KgHObl6k+6h4GcWnb8pBKFYsZQE1Q5BuZjoPpHeqgyClhMoWIN2ySy7
	5BCQH0IYjoZ1HJzk3sukWQu9DY01M6T/T91YzRmKYb8eXKzX08s3JPOTaeU9QFn5cIo5ghL2egd
	7LMsWakbAIQjaoib7Hm5AIUyvMHW7LvwItf2QbbqI1/IE1lAhilqkVTSFJFbFwDTcbxNR7QlYQh
	ACrtYVxKG37+LkKShZBmDcdiqD44wjzX4zy/ufWnyBYvAdmW/mVUitU5OrUqt+iYFjEFHVstnC2
	DSEKMjmYL3kL8GRCqwdGHjJ8nDsMKPJLkFIDFh+lQJ93o6Ypsz9XmCCLZPWDxPsnf69hibrtdkM
	7mjXimIytKlPB9YUO3aGLTBrLmtZbh4kTmVuWozYUK7yo7+nSV7vVQM2MaXl5rGEg9xw7eIbJsi
	WEL9w5UiR7M3GmuvC5fIdehmdrq8THX5I88YcJoJ6QPU9BjSVRZ/2i1RvnWLtxYsmXwtDk8lx/8
	On7ElUQ6Wgfu2w=
X-Received: by 2002:a05:6a00:1a13:b0:855:a211:6679 with SMTP id d2e1a72fcca58-855a21188f2mr2342124b3a.5.1787824603352;
        Thu, 27 Aug 2026 02:56:43 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8535a8b8bb2sm1819592b3a.16.2026.08.27.02.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 02:56:42 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: liwanwu@kylinos.cn
Cc: tj@kernel.org,
	void@manifault.com,
	arighi@nvidia.com,
	changwoo@igalia.com,
	linux-kernel@vger.kernel.org,
	sched-ext@lists.linux.dev,
	zhanxusheng@xiaomi.com
Subject: Re: [PATCH] sched_ext: Fix several comment issues
Date: Thu, 27 Aug 2026 17:56:35 +0800
Message-ID: <20260827095635.535908-1-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827091411.973621-1-liwanwu@kylinos.cn>
References: <20260827091411.973621-1-liwanwu@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

Grepping the tree for the old spellings turns up exactly the lines you
touch and nothing else, and the new names hold up against what the
comments around them claim: __setscheduler_class() does return a
sched_class (kernel/sched/core.c:7608), task_should_scx() is reached from
it at 7617 and from the sched_fork() path at 4862, and the @running
callback documented at internal.h:439 is the one set_next_task_scx()
triggers.

Reviewed-by: Zhan Xusheng <zhanxusheng@xiaomi.com>

One thing for the changelog rather than the diff: it lists three renames
while the patch fixes four sites, because __setschduler_prio and
__setscheduler_prio are two spellings of the same stale name.

Thanks,
Zhan Xusheng

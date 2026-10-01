Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD5F385D9C
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 04:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790829155; cv=none; b=k86AQdQm2c4LMVaZ1Gof6FCYZrgfC3cODtbtQsB/2eGuvxDc8I4pJhaB2A0rCPH6em1azTJP/kvzgGlrivHNY4XBym3wfyTDEIZC3yxKZaExABe7a/Ck8/R22bZ55hosH6aFGuCyP3j1CiWI14CeqNxxSQZeFCGpRhrNGesUETI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790829155; c=relaxed/simple;
	bh=2cdXcBFEwI3jjzLipmLP0911D2tzhGvFyo2oGd1W+H4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XBKJFAt4w9XEYtGhd2ltPuMzmuzEg5s8M6hhQc3O1LSGWFK5NlsYDMYGwG9gshIcKKmikq6fOKCOLTZ1g0hy93D8YRzhGMqONDeXJKRkT4XeHsjDI58DZQH1dQ3zOnGYVMRIrROT+4JHCeNFJ4CNtsNZPRbxXKOkPCq8kMy0DeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mnt8cTOU; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mnt8cTOU"
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2df4aa80a73so39695535ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 21:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790829153; x=1791433953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=elrhZUFLcXcRp6X3/p8YCNVRVzWhHBdMXnMivKI+qJc=;
        b=Mnt8cTOUziV9v8EX0nwjrZE96FK8fkoumiO71CPm2s8k+pX6tsTsC3AH5yAm4/IAfs
         Lhy0Z7HX5pdJsjKwNR0MWTycaH66fe3igF0bd3XouOalSYzLDC/wT3NWaDIFgZtd+hdl
         WAqUMCicFtba1DAn1tnMVAIDTWwUcRAynaf4EBOglQhqzuKvebvUwku+GdM+IvglSqW1
         F48c/P4pQtj++sou39CioJZYOVojUXL9g+YlzGmCciTZWkQ7UbeGDUYRJM+Z+qG2XHI0
         1MNXQn7vvcvJ1Tpt5bzlxSoaKxEjx/uolSJZJLuQSmUedBLZVxl1DPpr4HqW868zIqgu
         9FeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790829153; x=1791433953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=elrhZUFLcXcRp6X3/p8YCNVRVzWhHBdMXnMivKI+qJc=;
        b=pkCoCOIr2TVfFGxLCTJmylnXRbGlUx7ZQEtHPRSK/f6iW7t991s+mtH0A7Ihptd3Ej
         3dv3yINVqfw8IlSJ69egV+tSC42GK8xb5DEJrQrMkmXVgztbQj2So7Ta1XJKgH0gkwp0
         aNtvzjUZUX/o6G+nOBX+e6wM2Y7Fkilu1Jd5/JQ3cWRkGVUITG37kBZ0sFlvba38mFeI
         CtBx9oIEidEb4U9TaTCnCe6m0Fb7xD+/1YFyTtSQLjsTHBBqD/G4aXzu2Vp2BkWirf3J
         JuKk8k5mrWk+tty4u9MJSrxhyXFyUSrjgJNbxdDpQYKc9RuQbQKAIdLxmyInM4mJYeqk
         yZNw==
X-Forwarded-Encrypted: i=1; AKwUvBxxFV6/jiQaHi3AZhOe+iruH/E71UCyPvcEEgR+gqvnRWL4SOd+OcMcVWG7hzh2M9xiTMxKIyR59WqCMYU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKIwhrUynn8geM5XJd3G4SwIBJgrtU9GrL8d55xQRUEojjZFK2Y
	AdKMmR5AJH/FRo9U1v9PsquGje+LrhtFkrPE7dPmR2arH5XwduGdb0MbYRPYONv2Ggo=
X-Gm-Gg: AYBFou1sL4BK+z5eHON94JJy1NLfNHGMcaN/Q+HmuwpD9onx3sonUwgg/WPWKzanwU5
	nukDn6YjEJbNztDVVusdiY6uiz77FGZVNUgqtPdjqBFesUO7Z7723POWJhfLnOFAD5cahx3Se49
	r1xr2bib0uUofkrKPPiv26u4nloRDcieRiI16L4eVSVSMLC4v42eUHtxMfHRp8JEro9/Eb2V3rf
	AwEP7kYHcKTYUEAVXYu/+0BUw18jMhDLjchRu0Tzju5vVaGj+OIX4rWx7E66BTiqAO/CC8IDM/I
	KGiMaGNFMndM1ntghR6IsW1e9aFawk+rTK5rsWb5lJcfhKwgeWp509QLxQg3Dmtx/ot/dNshRos
	hSMGIT4tXzW/z5u1tV3qJKVK1ZTAH5vTOQxcMsaS2FEzkv6+nkg4OyF46B/DzmzK+h/Ao4WQkMc
	i0pFuK8fp82oOcuU8wvjy9TsQJZsynGHT1juIB1QV9sd5MK5otx7EftXdvhebrhmUJnTpibO64e
	cvw1X1D4qd9P5uYaEAFvSM0g02VoSFei+b1TdSWbYT7VRiWAM7dT720WVNgOXZNALBgbaVXPRU=
X-Received: by 2002:a17:903:32c3:b0:2df:90d4:1188 with SMTP id d9443c01a7336-2e2e4939452mr28042805ad.7.1790829153200;
        Wed, 30 Sep 2026 21:32:33 -0700 (PDT)
Received: from lima-arm64-dev.hitronhub.home (180-176-144-38.dynamic.kbronet.com.tw. [180.176.144.38])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e300a90dc9sm4921885ad.18.2026.09.30.21.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 21:32:32 -0700 (PDT)
From: Harry Hsu <x90613@gmail.com>
To: mbenes@suse.cz
Cc: jikos@kernel.org,
	joe.lawrence@redhat.com,
	jpoimboe@kernel.org,
	linux-kernel@vger.kernel.org,
	live-patching@vger.kernel.org,
	pmladek@suse.com,
	sashiko-reviews@lists.linux.dev,
	shuah@kernel.org,
	song@kernel.org,
	x90613@gmail.com
Subject: Re: [PATCH v4 1/5] livepatch: Fail object initialization on duplicate patched function
Date: Thu,  1 Oct 2026 12:32:28 +0800
Message-ID: <20261001043228.74946-1-x90613@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <alpine.LSU.2.21.2609181452160.21788@pobox.suse.cz>
References: <alpine.LSU.2.21.2609181452160.21788@pobox.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 18 Sep 2026, Miroslav Benes wrote:

> Could we also check prev_func/func->nop in the check in
> klp_init_object_loaded() and have a pass if true?

Thanks for the suggestion.

Yes, I've updated the check to skip the pair when both klp_funcs are
nops. Two nops added by klp_add_nops() for replaced aliases are
interchangeable, so an atomic replace patch that inherits nops for
__do_sys_fork and __x64_sys_fork from two previous patches now loads
fine. A non-nop func colliding with a nop (or another non-nop func)
is still rejected, since the nop would land on top of the real
replacement on ops->func_stack and silently disable it.

The incremental change on top of v4 1/5 is:

--- a/kernel/livepatch/core.c
+++ b/kernel/livepatch/core.c
@@ -894,6 +894,8 @@ static int klp_init_object_loaded(struct klp_patch *patch,
 			if (prev_func == func)
 				break;
 			if (prev_func->old_func == func->old_func) {
+				if (prev_func->nop && func->nop)
+					continue;
 				pr_err("'%s' and '%s' resolve to the same address, aliased symbols are not supported\n",
 				       prev_func->old_name, func->old_name);
 				return -EINVAL;

If this direction looks good, I'll resend the series. Petr, should I
just bundle everything into a v5, or do you have changes on your side
that I should wait for?

P.S. Sorry for the second mail. I forgot to quote the message I was
replying to in my first one.

Harry

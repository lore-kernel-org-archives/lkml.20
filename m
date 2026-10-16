Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1E6481A8C
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792155043; cv=none; b=jutmkRjxkvdq6Uf/PKkRE8IedMxG7Yu6LrVCYbysk1PjE+YYjLuwSvlsUDNP5h68qbAHsbo9YxrZxIKKirOXOsJbDMCddZnX26JI0IrOfC79uvCXYCMG/7pCPFyAN2laHd+neVkRosfuWzvHepHwAiX04UTWgexfYINt95XGUQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792155043; c=relaxed/simple;
	bh=jYaPrGF/xWgZWIb28wo3Id5jgjP9ot6JfkJvYOmQhXM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MCxag33yp/dlWf25Gi3wnYqIKBGyQz8CadZACzLEN/fm/D+gRwhJmwizgFPv08ntlO8/LE9xDmHb0qLeCFU/2ajAh8ih/UABS2QKMJn6jQcDGqpPzf+8gMurWbg8b2U67+b+aVzwcssSPyXh/B+3Zs8NzA9XuzixGh/Rxf3Gv9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tAO+shaA; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tAO+shaA"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-398b3c37877so3257587a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792155042; x=1792759842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jYaPrGF/xWgZWIb28wo3Id5jgjP9ot6JfkJvYOmQhXM=;
        b=tAO+shaApW2iG4Fj1U0XEL3KKmlUQBL2Yy1larwY8rMZtadbFnJPUtq0noyfDW8Tge
         qRHwkor0G3x4WxlaM/jFwLK/dM0pAbT5lCOumpAIDku6evEDGy9fS8RWz1L0hcPcyvJw
         Aurn302zxFq4iqKaGcZSk5WRw8jCDB+7gpEaPKtpNFMmcnxtm2BEo3ETNuyRj+Gnw8W0
         tI87+ew+ihVTwxBK8XWt4FoSKp9fVmPEOb4Gws4NfOIPvG4hELI6oaaaBHhpWltaloMS
         zhw+Avg42l9Gym7yWAtLbfX18vLB5wpmOxQhKGt8GtvvJcmfUfsChjpFqgrTVJL1rth0
         CRiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792155042; x=1792759842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jYaPrGF/xWgZWIb28wo3Id5jgjP9ot6JfkJvYOmQhXM=;
        b=Vz4+X/nsFbLu2rFRI926NA8IUg1IuAG2P/ODgllZciCp5xEytPUmj7OIL/wlkDiRgx
         +lSNTo+50Uy3S1xg1H8AvkQDVIuqf8oB/dMUeslkJyYP4MkRwnXJWh5ZyMPlmV0qwvG9
         10+nkGdhkUbt6czn3qTBuN9mgJ1BnWy0ekasBADP51h1q5Hd5oWM51EIk3Bfjz/Wu3Vc
         drTAnrCtOr9sssEt8h2SXb97PHopO4afp5tGsqhfm/BamS3MFec2WkVMefj9k2l1lYF0
         tY8ORIQxVhHhklYYhzSpBoz+UUuxglaGPVGLe/A6uRYF5Y7ypIbRzm/3UtitRcyCVcM/
         eiyg==
X-Forwarded-Encrypted: i=1; AKwUvBxHHX362g2PSaORao16nRq23ZK34hJLBTK+5KqRcm1fspM26C+rwzQsI+8VdXWuhVCE6RphzwJQ8cNTF/w=@vger.kernel.org
X-Gm-Message-State: AFq9FYJiyprmUpnmuIHMUGuYWQjHzTdPctngIMnBVV2sZzc66yLugn4M
	D+fkDi4yz++E6k4V8FWBLfjk5+rsX8NX/EKXSO1gQ53SRE0wc6R2bxqV
X-Gm-Gg: AYBFou2mQMiDl4sm49R/z256Ty5EV4GL6vz5BevXPk9t4c8Clc5OUUZZbJv6cvU5gug
	d6SZ+s5OmvxBqDVGIYnNQL1LONYGj8/gppY+lxbumUtaPiL+4wqtrJkqHDrbvcTbRuc8gH89j+R
	aZmck1P+A3BFHEGAQ1TohZX3JrTIxDPTRKi9EOdBpKdzdnNBdQeEAACtqYFs+fEwlJjlPNfKjwP
	H4FR1o6b3QqdGBPYTfzbKYJ67V/w0XCrO/PmHLr1vuMrSNY76a921/d+5cru5bxKSFQhjGIleWX
	rC0FlRqe/0y7WXoQg8zdMakZjfDpapdtjlkkVXNlGZezjG4hdC383IR50iXylq8nU/x++mkjof4
	k8SmziijqCE+hyVGcqPVs52ejDWup1/ROaAlXBDPyoPXaQIHAA9LzcW6lTJfQEPaeqzNlrWapjj
	Dtm63F4Or7Vlxx2HxjUGCjbmCVJmnGY+fgcAxUAjm5slgLNgthG3wtbb9Rr5N9yriQBIq2sY1Ru
	g/9RBjPlciGOQ==
X-Received: by 2002:a17:90b:5444:b0:39e:6a7e:ee18 with SMTP id 98e67ed59e1d1-3ab3ad26901mr16645330a91.36.1792155041547;
        Fri, 16 Oct 2026 05:50:41 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94792925sm8989152a91.13.2026.10.16.05.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 05:50:40 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: Arpit Saini <arpit.saini@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	mahadevan.p@oss.qualcomm.com,
	rajeevny@qti.qualcomm.com
Subject: Re: [PATCH] drm/msm/dsi: fix AHB clock staying enabled across suspend
Date: Fri, 16 Oct 2026 21:50:35 +0900
Message-ID: <20261016125036.1069-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261006-dsi-ahb-clk-suspend-fix-v1-1-67da848e1b0a@oss.qualcomm.com>
References: <20261006-dsi-ahb-clk-suspend-fix-v1-1-67da848e1b0a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

(Resending with the lists on Cc; my earlier reply only went to Arpit.)

On Tue, Oct 06, 2026 at 06:43:53PM +0530, Arpit Saini wrote:
> pm_clk_suspend()/resume() only call clk_disable()/clk_enable() for the
> AHB ("iface") clock, never clk_unprepare(), so prepare_count never
> reaches 0. The clock (and its source) stays reported as enabled
> through s2idle suspend even though the display stack is fully
> suspended:

I looked at this on a Lenovo Legion Tab Y700 Gen 5 (SM8850, bonded DSI,
v7.3-rc4), comparing the current code, this patch's approach, and
preparing the clock only in the PHY runtime callbacks.

In s2idle with the display on I see no difference: in all three cases
both PHYs are already runtime suspended at system suspend,
disp_cc_mdss_ahb_clk has enable_count 0, and CX collapse during a 100 s
s2idle is the same. Is the clock really enabled during suspend on your
board, or only prepared? Reading clk_summary runtime-resumes the clock
controllers, so it can show a different state.

The difference here is with the display off and the system awake: with
the clock prepared from probe (current code and this patch), dispcc
stays runtime active and MMCX stays on. Preparing it in the runtime
callbacks lets both go off. I have not measured the power difference.

That variant survived 30 DPMS off/on cycles with clk_summary read in a
loop. Did you hit the prepare_lock deadlock, or is it from code
reading?

Thanks,
Joonhoe Kim

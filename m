Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F8E22370A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 01:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788485430; cv=pass; b=KTvTEfhgXhWTFTf6TWGYeR90xQqSQMIE/MwDbur7Fcw+6qxgs7J9AJaLGC3vCINNdOXhODw/No75BlMVljDb44RjHjYl2umXReqes55qULfR8Kcsx0KPoUo9AZXaPbNuyastj2Uk0FFDWTOGcORRfEDEgngN6AZ2YMPmp3iuRiE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788485430; c=relaxed/simple;
	bh=SYDvkh8Gqu4VGwUGF72ItVZ97u41+W0b2kbxS8TvHkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IgHsSh4uLA9QU1yCmdEJT9TJchghDAegF+MA3aJRoUAHxU7jxVyezEDAyc9NyhIjwimjGzGlFUaHOq0gdQSx1SX+nPIZUDs4vu7aJIaDX6qT7GVZJyRQmuKYER/orH+HlxbURxRagJTGF8AIswFyZQ8GO/REo3BArIseKZnPaPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MtfhBwNw; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MtfhBwNw"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a6141a61c0so2751a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 18:30:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788485427; cv=none;
        d=google.com; s=arc-20260327;
        b=XWwdN2qeqY2YfLPTijJbFJaV4fYfAO5UtOK7Ru/hc3joFl2vlcXBsnF5+Aj5XRKVum
         VE4LN95UPsI8b6rtFmkYB5uv2WlngxL5UrcrOwW2BdZhv1XVQh7+2KVHZLVHW64X/9eO
         ukVizsDRdMfXt1H6ziOornmIOrDXaBFT1xrhsxa3O3Oa1HcSXNaCovwnbsSi2u6g7a1j
         P2mmpfL/U2zPUFuxf6fwH24uTuN808FFnLH8hiOznysvozjw07pLD8mzF66DVwoNIXqX
         saONsBfTFW5Cz7GLPu6J6fw+2O19XgZTAlRBalS3fnuYs0jQTDHlgkRAbVRmr/71R2S0
         F25Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SYDvkh8Gqu4VGwUGF72ItVZ97u41+W0b2kbxS8TvHkA=;
        fh=GbUBN0PXU1V7YehmjlPFgf85t2oKfiLvnAsYlZBcL1E=;
        b=mgFt1rNooBwA4P6gVhJQoSttfae65P2u7UoMYetgA71BYOkCJsxgBVkJtlU+dPwt/r
         4JiZl/QteabKwAuRVE8pmlnNpQfYjEhamnadABMwRsU20EPokJuGeO5kw93W5qjSnefk
         PZr8eZPdJyOmp7R0NkFLjXt8ZdnCTaFMFLVSJVf67PJhmo6qODpsmFPy7wp5UFlDT8Kd
         9QUHzJY3MbaeaOvWNTI4PCmuUvBfq+wrdqA1lHaqRIM5AuNR4RPEVaWUd2Dhz3aym5uA
         FxiWI67Xc8FFaTboO8HNFM87pmuQAX5RcI8j2RYoifav52PHDGa17+kN6Jy9J0NxbZSq
         ljew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788485427; x=1789090227; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SYDvkh8Gqu4VGwUGF72ItVZ97u41+W0b2kbxS8TvHkA=;
        b=MtfhBwNwaCmP8XDB4GsmJPDTGt9G4tUlQYhGcCZ1xj8Htm7Y2ex6sp+ShcjBHwfaIi
         16Mrrxej+thURnxSf6CeOXVqSeWXGJo4TAjsC1SKZLZVMFfipRIpk+mXWdy0Ro3530bS
         JoNHGrirrSwrGReEJIlcjOz20N3o7V+BNPoVDlv8SSq88DoAM7lytMYwJ4PQ7aC1z3I/
         AvKMJ1426IXCK+o3+PV0GZYB5E0+lxiYRicRzt5VgzNAXpwGsgWQQ1EdScUu94LD7vbp
         boUbC0tRfKtiN+Nj1qahH90k3t1pr9VcPNqKzOMKigGjjiqObbN0qQD7cVIa113N3AcC
         SYiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788485427; x=1789090227;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SYDvkh8Gqu4VGwUGF72ItVZ97u41+W0b2kbxS8TvHkA=;
        b=IRKbhA9jzk2xCYQqQBST/fwqy3GrO+1LG9A4MdtS3mDhY02/nNrJHbj6OdKPPtjgYT
         OXwJd4qxWwEnEsFRVN5ftawZTqkzk+nCb9Aqk0HrF3k+gddxwTGnjjYgw7YxajW+5Wnr
         zGH4v6XnivNTpmi7+GxjitacngE4kHIfRKwgPykT10jL7BROeoqeTzKwmJCVhwlcbexR
         Tc7NsTVUveCEvwAK8gpxjuwqUHvNda1rw1ovRH3cjLo3u2z3shmINA8QAiHMm+dyP5b6
         gWd7jMQqcMdXgxhrniHE0cfmbIT6vvsCrsl6pKSFUzb609Z/Z42NYbeliTwhPaqAfdM9
         MABQ==
X-Forwarded-Encrypted: i=1; AKwUvBwCFKInWhLyqMyviIoJUXTZmgesB0Pw0ycG4sBLSJZvzD3JxCeY4P4zwstahlAPvWAq/hQPjuduYrxIJ84=@vger.kernel.org
X-Gm-Message-State: AFuF++ldGWDKnZKiZhjzSPuou2fI9jT71jFbm7EXTlsV/7FGsJKa+bkl
	VM3OVD0QFqS7bz+NzW0ICTgNdrq5zigwjnYi08lNUu2vrebe6NjLsoxox3anj1GACCTbU2SYQbj
	rCwtgbV++ODPekh1+G4UB3knt33Lu8+0qJIULdLYP
X-Gm-Gg: AYBFou1I/tbkaXlBns3KgY5NOf0h9U3ESk83R2TbjtpgOwliNT1b+cnJNlLVzlmL+Ql
	O5mC9Os2s9sPfVW5bPjxqMx9u6HYn/SCxKn3zItRZcrNDVfttuZj3Ydp8lhlwL/yPWqGClYjbAy
	gJj2517y1uwTeOLSNUSymZRGRQ2wOyRyWW4NeaJhCBZNffzmr5kJaBM0AzokinYx4WYYLhSs4QK
	N6oUUoaIOZjfwYE0/JgoW827OlNv0vzYafSAHsKpfPCYfkaEC84qz5NtBTZ4Xsv/CV3kTZGlDvY
	Wf2Si4jHktfQZpFk/F20bZICndxfUo6sD0GhZgbCUYU=
X-Received: by 2002:a05:6402:1154:b0:6a6:76c7:65d0 with SMTP id
 4fb4d7f45d1cf-6a7e9dc0cedmr7971a12.5.1788485426203; Thu, 03 Sep 2026 18:30:26
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831130129.3979454-1-beanhuo@iokpp.de> <20260831130129.3979454-4-beanhuo@iokpp.de>
 <CAE14pddCf1VhLVC_H-Nv30C4BzK_UO4Eknd27g72d1nAjdBdpA@mail.gmail.com> <f1e59607ab2f5554993dacf21947024e41278058.camel@iokpp.de>
In-Reply-To: <f1e59607ab2f5554993dacf21947024e41278058.camel@iokpp.de>
From: Stanley Jhu <stanleyjhu@google.com>
Date: Fri, 4 Sep 2026 09:29:46 +0800
X-Gm-Features: AcwNN1WqpKQ9dvQE183nH8HsNdiEUkNRgZ_8L4LRNHHVTD2yt5OLSz9J4XIN8jY
Message-ID: <CAE14pdffhBju7fdez5Aewzz-rBCoRWDuCZJrOej9iJrFCR5+HA@mail.gmail.com>
Subject: Re: [PATCH 3/3] scsi: ufs: core: Report the current clock frequency
 to devfreq
To: Bean Huo <beanhuo@iokpp.de>, Stanley Jhu <stanleyjhu@google.com>, 
	MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, "Martin K . Petersen" <mkp@kernel.org>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@sandisk.com>, 
	Bart Van Assche <bvanassche@acm.org>, Jie Zhan <zhanjie9@hisilicon.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-pm@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bean Huo <beanhuo@micron.com>
Content-Type: text/plain; charset="UTF-8"

Thanks for digging into this, Bean.

> That holds up the queue for up to a second only to set the same OPP and the same
> gear again. This happens today, without my patch.

In Non-OPP mode (!use_pm_opp), devfreq_profile.initial_freq also needs to be
initialized to clki->max_freq. Otherwise, devfreq->previous_freq remains 0 and
devfreq_update_status() drops the initial time_in_state accounting.

Thanks,
Stanley Jhu

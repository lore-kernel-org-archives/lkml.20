Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5554D3E075F
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 08:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789892272; cv=pass; b=biNFbJKwYO7nc86hhN8pCCqm89vozAUjsmUoQ7yBJQeMdUo/13uaU6xtlbsUAiVK1stTyRLBl/6Z6UhU0rq3eh5eEsJwWvEJGV/WK4SwRfHAYbBFV49brk9NrONArb6DvM1uzPFBI+gDBX/+Mw3LPBnKr2X+sZ95cGdeHcnSZP0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789892272; c=relaxed/simple;
	bh=XiwS2mEFayHFkz2FqJIkfecFgIlxJfgwhQhMaxZ3j3o=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uwN3zFHd1vvK2JrkkRBlksFd+2Vq+ZAni9rNPyahRIVpm/m3UGbXPSihcVqmMO3LvKyAxK03gb9g9iM2S8WzWigh5YtSuvjHP0NqmU0GJRRn/Ic+q1oMFC1rBKkejaKplI7oKwmwdcOUelYk44e/pi3lsN8pu532K+JwQumW8UI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=khu.ac.kr; spf=pass smtp.mailfrom=khu.ac.kr; dkim=pass (1024-bit key) header.d=khu.ac.kr header.i=@khu.ac.kr header.b=jZFCdHq7; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=khu.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=khu.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=khu.ac.kr header.i=@khu.ac.kr header.b="jZFCdHq7"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8c9954ccbso577945e87.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 01:17:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789892263; cv=none;
        d=google.com; s=arc-20260327;
        b=ErssT2P4J5QS8kviznrwL3X493cAIX3kCy0c/kNVuDm6WkD3K2sISEe03XuBXwips3
         pRCarnEMfoy7X8b4rqUv+xHNCWldO3xs9Fg55Lm1VXQA7Mu0jwjejnXDFhl5pmcuB1y0
         UCIOVEUx28WB5yl8huXRXorS8uvYzCtg39oc7EuNuDQZMiOSsFZ2LCYGJzchnUblYY3k
         y8uTNaUGjaXmAMqZafIOFJxqTuBsDAUYAijCKYwbfQCSVFjMa+wkD0RL0i3rmHwN+IGz
         y6xOqrZw5noGiRU3ZlfsO5qjJNXWfQ/UypkUIfRXJ9fzDaEs5pjQPsHtFk1QIYyHj6gc
         3s7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=yjFWX7IwtHBRly0OiJSvV7I8EaYrkGy/qJuEGRHSu8s=;
        fh=axJ0T0NsEzmwjWxJATlbAYSxqRswWhCU2onPn8vXsvc=;
        b=hLCfq4khB5l/2kL20v+g71sxwI4K254m497jShzpMNEKR8Jqs87LpdCs4KuXvdTu8u
         opWuJAeWoEQqw7ofz98TQ4M2ijqHklGRzaSVrarcFWus0lEgqFC4bXd5O3pIOJM7339J
         wsGyBpgAXoazLHN3yow1bbjoe7td+tjNJjkQdZPRSyBIEhktMlVpfjh4zwkVnyT00VXu
         wAqRo2bhcoJnz6t/8PdWAFghOVOypGp8b0fekFaaJvO/3Y1enDw3vOpB3Cu8k7eGDRal
         AYlmyhb+dtF3QBNqQ90E4Bfc9idk6DFdjv745P1QZDcPZ6uJS51n5FmGcPVC9pMNeqXl
         982g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=khu.ac.kr; s=google; t=1789892263; x=1790497063; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yjFWX7IwtHBRly0OiJSvV7I8EaYrkGy/qJuEGRHSu8s=;
        b=jZFCdHq7i0f0G0TmKOAAvnGkZFyZqnc60YmWjSYXtT+2YYVue+7vA5UTfZ+5KhK0JJ
         L/XhK34N+gqiYqFj8DCEFKfGJaZC6otabhzXuSQBnwN4kMstAGvdc8LrhOUCIaIBaGSs
         iQ5759o2VCSUrK6I1mZxN1XKKuHz472qCtBxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789892263; x=1790497063;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yjFWX7IwtHBRly0OiJSvV7I8EaYrkGy/qJuEGRHSu8s=;
        b=QkBuA9c4lij/+VST+Et6alQXzw0tRq6BVK0v+v7NeWSfwoTsZC8aCBUWYA7RGVZL9G
         jcuqr4V+nvvct6oWu6GHHCpG0Gkaxev/s8+PsGjsbw1ZLjrJny+wTjP80VISoaAJ1QK7
         N3BwsDgo/Ic2A9wISPe4zFjGOHQKEfddepD7Nje3b/5m8c2Z4uZNkVvCoEEQzcrAiM+v
         jrj3YnvXP1fhlozJHGT4nYOT/uTECh1qqwqlqXd0pGKWGAML1COKey5EuyiTBIEIkZEM
         qimDXaUNhqnhd+ap7JzBucr/jjZ06XTRsNOkGqp/0PMBJycU0YWDiqhDnLrpbT9dwmvj
         p0kg==
X-Forwarded-Encrypted: i=1; AKwUvByQqQt8/7tPgOL3TvU/+6e/rjZJSMN1qxF8bkrE06k8frMrtPiqX/4yY9PoNAesMkZiwFjvPzlnPp6N3tw=@vger.kernel.org
X-Gm-Message-State: AFuF++lEMV8F7OObtNBNEkTPEH6A8M+MaXq+t37diY9NqLtXlRFrdkqR
	+xIbzeYTQxq2K9ysfzvLif4u9kWXFnqHC9luBAhhfqtt8BAE8RNZE7wjXCuYcjK6ggsqYYiDkh0
	zcgx6HGeJF5xpualbQbItOjrbJO0Ko6VkLi8nXHz5mA==
X-Gm-Gg: AYBFou0aW5YgDEay3UFgz8KrVQx3Bgh47Ix0SO/PK7f3ueocaHCfPXeQCAVsKMWykcu
	IfpF2mZO37RUdzWm5bpSihIeoxWpaSyDGAkL3Tzacnc8bhC2FWsU/XPB5ww7qCE6Avn9luiX9sf
	3/+Iu8Wlj7P3zoo+ElZxvkMGsdRONtKO9RbEZ/fj+S23pL4+ZNUN8y2hjHB4n/X7HCWhk5qI1X8
	Et+pyXNclkhHE6HC9U3RRliArXj+91DcDcDpbXiCW5KNySmqe3TdlVWfnNxUFsDdedIiF+DHrNw
	ppcj2JXARqJqs1VJRlUwTGOuE1S+FcGXp0PqQMTH7ROxO/QAZXE=
X-Received: by 2002:a05:6512:3d1d:b0:5ae:c8da:6254 with SMTP id
 2adb3069b0e04-5b8c18298d5mr2023364e87.22.1789892262999; Sun, 20 Sep 2026
 01:17:42 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sun, 20 Sep 2026 03:17:42 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sun, 20 Sep 2026 03:16:57 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Sun, 20 Sep 2026 03:16:50 -0500
From: Kim Wooseok <5mghybrid@khu.ac.kr>
In-Reply-To: <6afa402449db46468c3cf7af410c5acd@realtek.com>
References: <20260913-codex-rtw-rx-v2-v2-0-f09c964e0b96@khu.ac.kr>
 <ca51eb88df7b4e83993af73c2f1e26bb@realtek.com> <CAH1Bc_wo3PqWiqFcWZX9xB_+99=zHOdCD1VUg0R287Z2B4ESrw@mail.gmail.com>
 <6afa402449db46468c3cf7af410c5acd@realtek.com>
Date: Sun, 20 Sep 2026 03:17:42 -0500
X-Gm-Features: AcwNN1Ue9xcjZdd_qE_50FMCoXjAzbJwXOcRyi5oDvkBOgb3PRX2B4FRjMvBXMc
Message-ID: <CAH1Bc_wKzr5n1TxKXOtcddp6AcgcYfBjM95QaZyr9763v5cF5Q@mail.gmail.com>
Subject: Re: [PATCH rtw-next v2 0/4] wifi: rtl8xxxu: keep RX requests
 available across transient errors
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org, Jes Sorensen <Jes.Sorensen@gmail.com>, 
	Kalle Valo <kvalo@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Ping-Ke,

> Are these test items generated by LLM? and how did you make plan to test
> these?  (Just curious.)

Yes, an LLM helped put the test results together.

I based the plan on the failure points in the paths affected by the
changes: the start() error paths covered in my reply to patch 2/3,
completion errors, further submission failures during recovery, and
stop while RX work was pending or running.

The tests were designed to inject failures at those points and exercise
the actual driver paths on the RTL8192EU. For each path, the checks
followed what had already been allocated or submitted, whether it was
released or retained for retry, and whether RX recovered or stop left
any work or requests outstanding. Resource counts and work activity
were recorded to check those outcomes.

> I think you want to say "this patchset is fully tested", right?

Yes, that was what I intended to convey. I consider the series
thoroughly tested.

Thanks,
Kim Wooseok

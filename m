Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913913;
	b=P9/VWNWguLVcVk3rtddNqYQbr3cta6SGtbrE+1DcoUL7EQjIIQSzi6N+8S+rexKSvhEh
	 B55Tkx4bif7EYHVOhy+OsNhSkbBmK2mEF+Ks+KKGaOPMwEM6L5Nq++9qnC+bNMSzkW3lH
	 2F4zbDkxTP+XWfLWGH7Ad3EYmtQCvrp5yHXU0eKU4iQVJJkZ4h1Ad422DN5/Vh38uraPZ
	 1ClNAHDiB13Y7ljxIbrGbY+J9tfdbQaTlES2EA0aKYiSoFtbapWndOfCd9xjitehBTquI
	 nVbAfL09Hf8H0B64VCQ61TQEC9HG2SrpqZxy0SGLzrR07c07N/vwxFnnXFAhbjZLFvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913913;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Kn42LlYA1UZYSbOfHBABnjOJ0sk0wIks9BO0RA5nM0A=;
	b=Rly0dpQGHUCZUMZv/eNzTuQ8zVrLR8xd6JsVVa/fyTXjhgz2U0MLJyerKet6wKV8JetX
	 r3S65qeVWMdYmq+nkRQKIVp0w35B7ZHvttXxh0LpQ2CbShXpTfgLWYZ22MHIZmv5Ocgpy
	 wGE/ANTbsgUQRzfgUfaj5rxzOiEvIhompjSE+1vmlgJsr1fD6wvDxhRSqWkkAKgtYPSoV
	 lDfP2rjIBh8MCLQ7W8qme9Kg/C/qMEm4pi9hdy5FFyMm2jMP23yO6BKLoN3YneSdio3c1
	 7HsWYv1LozoNzdAol+5jLBfiaz0Fa+kNd6i6/yqMRXoGmnkecGCbtUtqCiZd+7cu1/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xoti1UPF;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA34606A339
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:11:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DA34606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xoti1UPF
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so53789655e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794913911; x=1795518711; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Kn42LlYA1UZYSbOfHBABnjOJ0sk0wIks9BO0RA5nM0A=;
        b=Xoti1UPFBkdCRg1wJtWTgJebl78EAyum6NLyeXMBjInnZaQf/BDLrKBM4H5EV2pAbF
         JwJa9I/jgNtrlVjyDfXH5ba/6o7AuiKyQ6j2vsMKPhcKxey8wg2AgZRFgIXcX2+I6ahJ
         SHmQBoXdxhciovY1Ye5hau4B4nfWWhCOUYdqWwcOKyv775YEbeaQMZu9o8mbR5ruwqO/
         6ytdBWC5TgHiIiHDmqq5edAwW89whsEt/RPFB75zzGVVfDAU4nghMIT7Hq0vdnedX+FT
         QvSs1iDc+mCxnxCZgWLgStG72s039JqZc6jQpztIauhYdyvksGa2irDhTqAOYCLGgRTy
         ls9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794913911; x=1795518711;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kn42LlYA1UZYSbOfHBABnjOJ0sk0wIks9BO0RA5nM0A=;
        b=BnI4g7ucMKkaBTd2d29wLpgEeDcHjqeWp8w1o5N/VooxVLy86ptmQ4olo4+N5Kxftz
         EMvUSdlvHYJeOUBVu+vp8A0fnkFhW+N6SB7fPYSmyg5t1EOC/Ih/F0zv7nPcJZvuCR1S
         D5IXqi1FMjoC2oUfEqafX3aPFXX/E6UbZ7Mogr7kYLfk4vPJ0vKRuJF1GOxgHDiSVq1J
         srq8C9lBzO8ATg/jJsJyhB5edxJyuFcAjq9faWv9B1/ZayxMWAWHWJMP4gxOopnwz6R4
         9O8YummwnOoRn5wlzr6P9xV2ihXGYQ8fYOuy5q91IygoXfCCtExkWqGdEw78vgVlebfa
         Bs7Q==
X-Forwarded-Encrypted: i=1; AL+hErEQkZ2uWQ301JAww27odaXR+o5aH1BLar6+hePhH53jlMlf1tclCObfrkjwM8IGVyAZTsM+lWp/WLes06w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2gSKAyEPzuGNmfYQEcRulgJUmLJF8VJujcdi996TuPgDtWbUB
	yORzcbtGmRHgZpm+pqfU6wvWSf2sQR7CBdQNdRDCbfT0qp/CyU3etvha
X-Gm-Gg: AYBFou0l13aJB4RL9snFqmdyMYEHpBZJIEoJLOJ1fiZNdM/1+iauX0UiF5NKdil/0ir
	Wt/i+pjMxkfwp+hsT792CYsX5ULtLjSBpxUj4H2NNR6Av8n7R65pK/EJAR2kXj3YjNaJ7iFnet0
	VyuDmwTffOq6XcCKn/WxwHfMX9QNwUKIiIwxwfsnuaWWBc+SgIdBje5C+e09IQVfb6kor75Wttg
	CF0PrZDKZQgrhQnaCUGfsxEhR6/bv4+1fxJhX+wseRm7VcLK7MKyJvEjBHsKWCge8tiEW6u48CF
	MM8IvRjMUmnobhrlHVVKnebow8oJTMxUYn6+yJ3EirLSn0nh600tNxFyISLeqk9HC4656lZ/ILg
	dN2X2aApyESdGw2dq3IJa83+HpGZYi1DA5/+x1KnyjnwKbwe/pdmZjcb6PPjMgTVU2q7cey1Wae
	88fm+iRKeSoW3DCqjNJBZ4H/pNIlzWJDFqZbf8g4r19ERgA/0GtHTh8tSvDtsTjtWAWOsfBZ3ed
	87XQIIOB21lmurZrkS5kf7zDxKovzmsKTZBfhFK71larlyLwaOJt6F3NeXOVAT1YNQeI/YK0RuY
	6A+sRGGg4LuKt+970jaqnQ7PXSorAB8jUkARVUCF8um7y5XQyxFGaA/q1B37Eh0BItGE3xtTceA
	HCUdlIb97LrBlp2IrXA==
X-Received: by 2002:a05:600c:4ecd:b0:4a2:1655:87db with SMTP id 5b1f17b1804b1-4bb5599d31bmr293588205e9.0.1794913911432;
        Tue, 17 Nov 2026 03:11:51 -0800 (PST)
Received: from lima-fedora (eduroam-269-3-018.epfl.ch. [192.33.199.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49d673ce75fsm20642423f8f.55.2026.11.17.03.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:11:50 -0800 (PST)
Date: Tue, 17 Nov 2026 12:11:48 +0100
From: Mihail Mihov <mihovmihailp@gmail.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Peter Zijlstra <peterz@infradead.org>, mingo@kernel.org, 
	longman@redhat.com, chenridong@huaweicloud.com, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, tj@kernel.org, 
	hannes@cmpxchg.org, mkoutny@suse.com, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org, jstultz@google.com, qyousef@layalina.io, 
	regressions@lists.linux.dev
Subject: Re: [REGRESSION] core scheduling latency with idle load
Message-ID: <avwzqWkw9dJMYlkw@lima-fedora>
References: <20260605105513.354837583@infradead.org>
 <20260605124052.227463677@infradead.org>
 <avt_mdiPQ5gwAisa@lima-fedora>
 <add0d6ee-c28d-4274-b8d1-58638abac47a@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <add0d6ee-c28d-4274-b8d1-58638abac47a@amd.com>

Hi Prateek,

On Tue, Nov 17, 2026 at 03:52:15PM +0530, K Prateek Nayak wrote:
> That said, perhaps se_fi_update() could itself be optimized now with
> flattened pick. Could you try below changes a try:

With this on top of v7.4-rc3 the reproducer gives:

  kernel              no cookie  cookie
  v7.4-rc3            53         3290
  v7.4-rc3 + patch    53         54

(p99 in us, same machine and config as in the report.)

Tested-by: Mihail Mihov <mihovmihailp@gmail.com>

Thanks,
Mihail

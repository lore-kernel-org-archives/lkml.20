Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793582122;
	b=Bl9YbbBv4Kg6+g2WuM48yh6hqKlPLRGdzJAeBBNcMOghLlNkKuqhSilkH6sf2iLvjD/8
	 1NBklrES8rhyiXXgYCc8JmxYzsiKArBUY9/MER5tga43n1gYDx0yrVBGrty8jmq6h+Gjr
	 i2bQgtk1jzYTs2SffzhhcFtHt2ZtMqpdUYJXLFCcaeN/+Std45BL5xVnAPnUzHB9Ea6Sy
	 vcGQkRq5e2YtnMa+0ex/Whr7FzrSn0RN+aZ4c0fOrqQdTl0GDfXRZ73oVDxwQs5w1LD6/
	 H3mvQmxR1U7Ej+XTBY7GTtte8lladoBPGBabD3RZ5CRH+n3JaP9sIcpPsKi9iSRtmxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793582122;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=c1ydNhXZkrpIcDabsUGByAbljSA1UVTJnknGaWqA0AQ=;
	b=fx2V7EPc87yOqc4QeZFoP5EYxkTmz6tK9v1ChmRm6oe+B0h9IN6ad9hRq6ruPr2qd7Qg
	 VZYPLGZlflUVXkAWA3kcyGMokETv63DF0O4oLPTybtQAwoUAQeaXgMPXF2vM0dhca4uw3
	 gaXduLOT6wZHImOcsjiAmKazZZ9AruRwC9q2sd1P3yjUtH++Hb+Wt9grOxRVd4dW29XSJ
	 d/w1XCkHsPkz0bcC68KYbxc98WP8GPWpyXVjfJqpZ6PmLEj74cmpbf3xY2jRmMrru3gEn
	 a+2xuqm2hBS4b+i2kTQie1tuCh+gyS+7eRmXI6Lgvc/8YiZH/Hqy5PsEr9N3Gy8nJdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iryWmJIG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07924606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 01:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iryWmJIG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE4A61F00A17
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 01:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793582121;
	bh=c1ydNhXZkrpIcDabsUGByAbljSA1UVTJnknGaWqA0AQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=iryWmJIGRW5NS4sFryfzJ4j4sdDUtwitKp/D3zJtiRlmVvaUVim+9Ll8MzJDSJKgQ
	 l1L0z+jki3FUEaJZrc51kek2uw7n8BKlJG4Hi7zmv7LzUE9YhkfrzEMAoLQvXEsGgj
	 2c/nl4rTr4bMzbAh5wprHaqDos0QEcZZJAcVoK86mXwqrua+5g8jQPTdCrL3oIi2uC
	 fkre5HfooVMlenoUWif6nF5bUbJ6pZzzR3IVlmCpksgnuOHhVUuhIxO92ql9CTrAbk
	 nl58p31kTAU9MGwpyhL9WEz+vMYeTktpVB13Rsh9M5H5ZSU1p3Kc+H4BzT0SWIZNsz
	 k1t10Cyc2qExg==
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-93cc1ab5f6cso305934785a.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 17:15:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzzYxNcCeTAJ9OmYIlnsuu/8n52OZPhgkFHsrLw7LbtddEYRqhH/inQS7hf7UJSU1gb2o6gCajuWpLQXo0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIFbr4BSECJ18VcH9IlZjBITVFhJInbBYtI8chrSi+pm//CIPeZ
	IMuVQgIK8AtcEwuG+6UIeZtxuMmo2nCHidYnqjuw8zutyk3n/UbYVgFTDV9F3P7N3iqnzlWDGe6
	QnZczQ1zggT/JCegHXkBRBq+i0oHLktY=
X-Received: by 2002:a05:620a:2709:b0:93f:571b:c72c with SMTP id
 af79cd13be357-944216b818bmr1410541785a.46.1793582120965; Sun, 01 Nov 2026
 17:15:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261012205447.2717801-1-max.kellermann@ionos.com> <20261012205447.2717801-6-max.kellermann@ionos.com>
In-Reply-To: <20261012205447.2717801-6-max.kellermann@ionos.com>
From: Barry Song <baohua@kernel.org>
Date: Mon, 2 Nov 2026 09:15:09 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4wbQtQ8zfokd44_QM39J_02xDVJoeTK20+jo03_NxAx8Q@mail.gmail.com>
X-Gm-Features: AclHuK9whBgQrct_OeJcyHaK0NXW_FaGiSG_xFHphpXJFrXesDxcsJ6xBdY9ow4
Message-ID: <CAGsJ_4wbQtQ8zfokd44_QM39J_02xDVJoeTK20+jo03_NxAx8Q@mail.gmail.com>
Subject: Re: [PATCH 5/5] mm/mglru: reschedule between memcg reclaim attempts
To: Max Kellermann <max.kellermann@ionos.com>
Cc: akpm@linux-foundation.org, kasong@tencent.com, qi.zheng@linux.dev, 
	shakeel.butt@linux.dev, axelrasmussen@google.com, yuanchu@google.com, 
	weixugc@google.com, baoquan.he@linux.dev, baolin.wang@linux.alibaba.com, 
	david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, hannes@cmpxchg.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 4:55=E2=80=AFAM Max Kellermann <max.kellermann@iono=
s.com> wrote:
>
> shrink_one() can return immediately for empty or protected memcgs, and
> try_to_shrink_lruvec() can break out before reaching its
> cond_resched().  A scan through many memcgs can repeatedly rotate
> entries without giving other runnable tasks a scheduling opportunity.
>
> Call cond_resched_tasks_rcu_qs() (as the existing shrink_lruvec() loop
> does) after shrink_one(), while the memcg reference still pins the
> cursor and before reacquiring the RCU read lock.  Also call it between
> bins and nulls-marker retries, covering scans that skip every entry.

I'd appreciate it if you could provide more details in the
changelog. Without this patch, are we seeing an RCU stall,
a soft lockup, or something else, right?

Also, as Andrew asked [1], does this patch alone fix the
problem?

I assume patches 3/5 are needed for the performance
improvement, but patch 5/5 is also needed as a quick fix
for the stalls.

[1] https://lore.kernel.org/linux-mm/20261101135047.61fc3f209b3235ed6fc9618=
3@linux-foundation.org/

>
> Signed-off-by: Max Kellermann <max.kellermann@ionos.com>

Best,
Barry

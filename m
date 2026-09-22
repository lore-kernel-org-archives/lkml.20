Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1217E44E67D
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 21:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790111251; cv=none; b=JXExKGN9uwTArTg4c6Jc9fud3k9HjdscLwRygaQ3j0ZDhMO+fZ97C2mmhbTF7I3Ef1I8XZE7M4sj1bm31WaLN+60bmrcSw0/4TMX/ZeLDUkAtACBKz8GIfS3GCGctV3Tfc7F1FQMQcK/xVWI0K9b+Xp6MEK9P1oOcifjc9Hi1W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790111251; c=relaxed/simple;
	bh=DxaYSD/hiTuzTqLosMpuz23BDGKouFHImrNPMT3n9hQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bYrHiPS1LoDku53h0w2NaDfwtS8KY2bHP+hrFrpD8GPMlMtVRtCcwFQlQsFdFw3CaJvGo/EjzSR3fK3exfr84elmtCtbznzN03O6Yjrijs1gRnDEKuoM0YuJA0CMoxqdWqswaXHpa3o2HG0nuo4CHKwHwaoQyDpzeSv9letbgWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jTofcVmI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jTofcVmI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D12CA1F008A2
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 21:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790111243;
	bh=tbyqPgrizLALVjg78yaFfJn0dQLz3gPA6d0TtceKcJg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jTofcVmISdXyCtYuw8zNFILbYNlT/3I/N33Wt0Df/YUBcucu6snDlL6RByPk0zwnp
	 ZpI005lJ82bt9YValXE9bNZ2d/TBjxRXMdAHNWODZuVhOdg2m2OjJTchO81FkodLIW
	 X7S5eEHyvykG/IoEJvD9TVltdQcCZseEoYPAYSKtqMJcV6uDbuRleDURazXE1n4kYl
	 tMrnA2zh+UxKZExguYZ3fJJaAFjY3tueAYKRnVEhXG3miiagZha2kpwbbuH+xX4RkY
	 ekxx2IvqklUpKeb5235MiWN8Qz5IT9hiPMWEhAWG3ZfPqmk3rzebzNAbek96vLh0r0
	 9tl0Gf/9qbr5w==
Received: by mail-qk2-f38.google.com with SMTP id af79cd13be357-939109fafddso25230885a.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:07:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzbHGT2ukqlb2Q3br/qpaCEjhxq6asQO5cQyeyOBuus3MNr51s8BaXFS1OU5GctvvQJYQKyb4cbE5lskNE=@vger.kernel.org
X-Gm-Message-State: AFuF++lzLlE+CFQuZ7c7L4OOoXH4ayOvytBTGkT873XKN34VL8tWbl8H
	MKJNUj2E0Df8V/dYZ8LEt8GausTEPK4sYRRFTS/rQlBXdnAyI6+xaF4uSKq8alwQF2ue0jwcCnu
	CIz28KXkWRcwNqm3rcWf9tEI+I1uLrec=
X-Received: by 2002:a05:620a:4890:b0:93b:d79e:18f5 with SMTP id
 af79cd13be357-93c2521b15cmr97007185a.56.1790111243168; Tue, 22 Sep 2026
 14:07:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aq1SrcniIRU-8f2W@gremlin> <20260922041522.1824249-1-zhangbo56@xiaomi.com>
In-Reply-To: <20260922041522.1824249-1-zhangbo56@xiaomi.com>
From: Barry Song <baohua@kernel.org>
Date: Wed, 23 Sep 2026 05:07:11 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zXQyN5VGpSmw+WG7bTV=1U3vJLBy09RExgno7N0_uGNg@mail.gmail.com>
X-Gm-Features: AcwNN1VMMORmWIts8ug-qgXzRG3bcKARIjn5Ah3mZqgxIFlxKviS2mK6Lz2-vvk
Message-ID: <CAGsJ_4zXQyN5VGpSmw+WG7bTV=1U3vJLBy09RExgno7N0_uGNg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] mm: compaction: mTHP-friendly memory compaction
To: Bo Zhang <zhangbo0325@gmail.com>
Cc: ljs@kernel.org, akpm@linux-foundation.org, vbabka@kernel.org, 
	david@kernel.org, surenb@google.com, mhocko@suse.com, 
	brendan.jackman@linux.dev, hannes@cmpxchg.org, ziy@nvidia.com, 
	liam@infradead.org, rppt@kernel.org, qi.zheng@linux.dev, 
	shakeel.butt@linux.dev, kasong@tencent.com, axelrasmussen@google.com, 
	yuanchu@google.com, weixugc@google.com, zhaonanzhe@xiaomi.com, 
	lipengfei28@xiaomi.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 12:15=E2=80=AFPM Bo Zhang <zhangbo0325@gmail.com> w=
rote:
>
> Hi Lorenzo,
>
> Thanks for the note. Let me clarify the background of this series, both
> regarding the AI-assistance question and regarding the scope of the chang=
e.
>
> This work started as part of our exploration of 16KB mTHP for the Android
> scenario. The overall direction of making compaction lighter-weight and
> mTHP-aware came from offline discussions with David, who suggested this
> lightweight-compaction angle for small mTHP orders. So the size and scope
> of the series is not me diving in unguided as a newcomer: it follows his
> directional guidance. Barry then provided reviews and change suggestions
> throughout the iterations.
>
> On the AI-assistance side:
>
> - All the code was written by me, by hand. I understand each change and
>   take full responsibility for the patches.
>
> - The cover letter and some commit messages were polished with an LLM
>   after I wrote the initial drafts (to smooth the English). The technical
>   content, the design (jointly with Barry), and the analysis are mine.

Maybe Lorenzo can adjust the bot a little so that it doesn't trigger
an AI warning just because the changelog or commit message looks
AI-polished? Perhaps the AI detector could focus more on the code
changes instead?

Please have a little mercy on us non-native English speakers. :-)

Thanks
Barry

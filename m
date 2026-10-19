Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792438356;
	b=2Ep12ZDXZ8T9BQdn//sQPvfZF725dxA6zzj9k964GR+Xv/LoUIKrRzSE7Wd8CWUZcONT
	 SShQNYyYQsvEjThJGC8X4h5gZWi27AzxOgBznwfq10oEwpw8EW1D872jh1l7gT5fI/ZAg
	 5R2MMysDx51u2mewWplJXNCxkrfshh8ZiyFdIUxS1k0WGbpN20xgF9TIDbD7uCuhzZvwy
	 sWP5/TTxkMul1Lm/dk1zXPfyhWjNh884ufthvw2fsTurEU2bwc4piu4FDg9L9DlqIYoYq
	 jMg4oPrt+nDJaG0Fb9XbRTCnucmEmovUoHIwkqdyKBjOv/UpainNmGhg2K4V06lCi1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792438356;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:From:To:Cc:Subject:In-Reply-To:
	 References:X-Mailer:Content-Transfer-Encoding:MIME-Version;
	bh=2p/b3dKU4yaXi2AGlwZNf0VKw+YL38Gm/OTwUzr2FI4=;
	b=4ceEv83RkCl/eeefzxAItXVOkoefx8pTB3ak8oYrPgJcf6FKSne9jv/MXHrMWhFy3Je/
	 Cp0B7syhA1d3tVBba5HyKlx5smLUj5mYvTA+BjKEUV/E3EdVQ7EJLoXy3uS8m6rVq03CV
	 aKwuBRbbgoBvTf12+dDv4Tc7s4kvnd4va79JDr2DGjfuKZgcTliKRBae19OimPPBVwt6Z
	 3ml1wcIAgwmz7Qj0LnNewY+qqqRvKOMifZbLxiWfFCV9sB7jqEj5FsZvYp5HIjb8DOW6P
	 dx0hnMnfeo024xen5m1qSzxaSphIUqkXZxGXrrF5UtTnfoMtGbR3jtdQiRtVmrrj6wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K6MjF+RW;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB4B606A320
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:32:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACB4B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K6MjF+RW
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ea138a3497so3307385ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792438355; x=1793043155; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2p/b3dKU4yaXi2AGlwZNf0VKw+YL38Gm/OTwUzr2FI4=;
        b=K6MjF+RWPcaa1IuhgGzw0sG86A6QKN4jmNjfG6QqrnNuzBifkGcISdfauMh33Ulkt+
         yYec/scqdE7vQS5kwQ/3O2v0LOQ4nlB5tKmjdNwLSZp0DqKlBgoVBzj4OOgOFdp9D08s
         teCGBpIPXDqeqa1Axp5qtShJNSex0kfX1FqoF92nJLV/sMMwq3uQjnitJ6LMEQPj7KP6
         gTWQtxdZ1emayUJWwuhtWCHPFwt4cb7R2KcdSFCPMTiW4kc2EsKKdZpCUmvjQ/5xuQUz
         awj3PIbXOBLjekBBbWSjr6jztl7DBDzqSyyV7lBeL2cV4H4rgxTRY7mkW7QrnZ5seWS6
         6WHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792438355; x=1793043155;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2p/b3dKU4yaXi2AGlwZNf0VKw+YL38Gm/OTwUzr2FI4=;
        b=MmtJeE/MD3pu4hCRvjp3jjD66EEZxeCsfk5gthg2U+tj0PH3mKSHhVt28UP3h6VhjB
         BOVtOhKJ6lxcPnuIvG6OW01xmft6UKhqFLzE1E2wDF6lerQW0JAysQ1ickclYD2Ib8qK
         RdhbK7X68I/ItyRmHrOKWJLGatphqPzdc2KBh3ZD5nF+nhhYJHbbGgDZ6ZfgBoPWHLE2
         qtL15U65Qup3Ki1/nnkAQjBk5o4p8qvPoz6IetBzktrgDbIXpOe6iDHfvexldQC9qLru
         b+EahhM69hx+y0UZvh7/q/SkS3LUqVhhwIw36mgYsbtOiwpYI6VAPhAa654K3C8WAcCB
         j3HQ==
X-Forwarded-Encrypted: i=1; AKwUvBzcM0pkhSnF5CScfMpQYJ+cVMKnGaI5K3d6EJ5Q+ud3tpQ06jfBrmP3le06B/eWiszY0pK4Cq0mY1BOvhU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLycRU4b9szHapC/x9bsC7HpBdEpxt3ZBzQIMbfGROPW4hq3YE
	D9hWP8sKkDQEqcG76GCse8bUOO5fvAYWOvWW+2JdJ5S/HZlg26v5Gc7Z
X-Gm-Gg: AYBFou0nomY0zhNXNjeWMFkibIAPG1aNSqxb555WAmXPIfdCcBwzO7tzmelI3nCzOT0
	8xg4LXwnZQyUUC0QYuUJ8ip/f7oeil/AOSvyi1MM2hr/iyLoKDf0Q+SwYMP4Dthl+0uJdpCyVRi
	k8CM1G1Bh55HdQQD//wFJQR903GQQoEfD/rSpcL/MESJeylfDohO2mhZUT2UVQ9goz7ZFN4ylV7
	aaYeYP8EnP8c3rL6Dsxek9AHkhILND346taqBgQI6sA/onJSABUO5QjL+hSMqaJyZBn9qujZzbX
	nLBHOPvHBRYY/PLA1Zq7iu8//p1h67mm6+JbX8y9+Zhc8TGOQfjI/ui8TXNp8FWj+neP31TRO+J
	gSyJSb/fY5e9+PgAgcQaPjnq6S2ZaC35Ml455mpzsatPl3+S+K2fdRmffZAuCqEQMeeUgWAOnR8
	CiW20oAnNg64IAT64jQ7TzYJiuPNB4rU0co4a0/nqD1Ct+WBmA/tnBGuKMKkMUagTlXEjFYiKtJ
	zpjEhOMqGQSft1+u94tgaOpqJ6hHsM5X/qX8JG9ZMu2zyFnAeKwIVaf3ao7LyA/AYAgOMCLv95F
	v5+ff9oc+zfP0WsyN3QosEK/J6vZgcqAMV+inzDs4X5Kb3tyWMpkIOfEwnhs6Ho4NGa5Z77zULV
	ksNOPCQk=
X-Received: by 2002:a17:902:ce83:b0:2e9:6352:6c61 with SMTP id d9443c01a7336-2e9a69f7224mr76901015ad.19.1792438354918;
        Mon, 19 Oct 2026 12:32:34 -0700 (PDT)
Received: from localhost ([153.61.198.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea151a2a06sm4758725ad.73.2026.10.19.12.32.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 12:32:34 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Oct 2026 19:32:33 +0000
Message-Id: <DM92D7YEU0AE.2XRZH7RV2US4@gmail.com>
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Andrea Righi" <arighi@nvidia.com>
Cc: "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar
 Kartikeya Dwivedi" <memxor@gmail.com>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "John Fastabend" <john.fastabend@gmail.com>,
 "Josh Don" <joshdon@google.com>, "Vineeth Pillai" <vineethrp@google.com>,
 "Balbir Singh" <balbirs@nvidia.com>, "Shameer Kolothum"
 <skolothumtho@nvidia.com>, "Himadri Chhaya-Shailesh"
 <himadrics@protonmail.com>, "NchangRoy" <royfru44@gmail.com>,
 <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next 0/5] bpf: Expose pinned arenas as sized bpffs
 files
In-Reply-To: <atXYdpDukXObjE69@gpd4>
References: <20261010224902.1232178-1-arighi@nvidia.com> <DM6HVNSP3USV.AJSWS289Z3I9@gmail.com> <atXYdpDukXObjE69@gpd4>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mon, Oct 19, 2026 at 01:44 AM Andrea Righi <arighi@nvidia.com> wrote:
> That's fine for a single long-running guest, but with VMs coming and
> going the host arena would only grow (this was also Josh's concern about
> the high watermark). Would it be ok with an explicit release of an
> imported range (clear the ptes, flush, set rt_own back, unpin the
> folios)? A BPF prog touching a released range would then hit the usual
> arena fault handling, like any unallocated page.

make sense to me.
In my prototype arena_free_pages() sees the imported range in rt_own.
Instead of returning early it can do the above and
give the range back to rt.

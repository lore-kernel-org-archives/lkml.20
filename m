Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793308928;
	b=IO29UYZAeHu7jG4snvjl+uFbxRsAiNi2gVCLfU2XReMMVPnEx6p/T1D8Vw1hMArd/Rdi
	 m1uoNlEy6Tkvf4X8W7jdDGpGb/c5FGRppfBCCL+bGPVhOBdRnLUyFPVsAklIpMQRCvqzU
	 uzcxKC9dmRGm/fO9T415OYJHLYZOJWJiU1q/Qb78I9Nxg27kTZUi7pDlQnoURpTQtqG/l
	 Ek0y4BrNVP1XY8joi1iamfSbyS0MQ3CDIL7wQu0HZp9TQMCFdCEMfE1TnllitTmj5QWd5
	 4lKwjBu/VdAOHYGyWrgFglbtMXc1FxeFVaC+xbMyA1UJHex3VgdCmAGZDNhcHZfpDiQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793308928;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LoPnVLFU2grju3RATLnVH/Dnn7cdm50tVx8bnt7Z2pc=;
	b=r9ZIDohq8TD0p3AtOiW/5oZwtW4c4Mg8qSbN/JPwqCzdt4pX++SW8WY4/Pt15SLC4lBh
	 IcR4p4DuKMwD6DKlabn9SbCx9tXgGj/jNc1OMfRY3rJ26wqwniJ7CTWNkYF5lfVZxH8SV
	 8CQXUXS3sNcEHBnVz6m91q6Pv24129urjqIL8Bgb+o7frrCxiyuOfyemaAAPR8iOfSOvh
	 2P4PXqrwHcflgYQNvnaRwu99uAacnRWDPHZaSAUaIU4PUaYpp2UfTlgwgPbcoQNVMQB+i
	 AL/eQIsn56ildhp0fJqrdHpLpoBvnratZKAQIJMUJgdTX5ZtwNt2CeVN1GYaepOeDCA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nuro.ai;
	spf=pass smtp.mailfrom=nuro.ai;
	dkim=pass header.d=nuro.ai header.i=@nuro.ai header.a=rsa-sha256 header.s=google header.b=Re6vMFfK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA05606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:22:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEA05606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nuro.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nuro.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nuro.ai header.i=@nuro.ai header.a=rsa-sha256 header.s=google header.b=Re6vMFfK
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36a18fc7a38so215923eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:22:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793308922; cv=none;
        d=google.com; s=arc-20260327;
        b=AFMcc6NY7Syb1aIyIwsTGCrjZaGs8rXILF49jhCFQRnAaxdSCs4l/f7TZ8KQNXLXx4
         8+kgZLgmp49wvSqXTSsThhXXW3wSCHcQzGEjNMsxfgu4hs1d7XO5PiXhYJXNPp0RQavb
         ysVcTY83DYN4k47slD9h18i3a/tiuU57LRHMpki8v6NXAtKmLkTN+eYUzQvGYTyXm6rh
         A8O1A9AKYQYaTp9lMhS+MN9iJi5ZXsFCGmWHe3Q/spHvmj16upcaPKVkBPGbffr/OiYI
         2orA2N/uOANDUbj29z17kTH7KwCIBO5nh52hgqu8LxZKZd8Gecje8hh9yEoOAhwHi28F
         fPmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LoPnVLFU2grju3RATLnVH/Dnn7cdm50tVx8bnt7Z2pc=;
        fh=uSi//J+qTk/JYCJwezKy60JuKpd84yE915NWEJ9zik8=;
        b=mYKhrDURKkswpuogpuBQeJqaun7sHObZmOfdqZJMju0y6QtXJaG0SKR6CZIXwqkadW
         oDRxoKNowulsLEZafu7gnPbtbhYjUbxqdFAVO8MCDdAr0q3JfWFyoehN2+ovFW6hRSmM
         SDFdRZiPeNF3gA8rMP5NWHC7+b5FhTqNRGUtenBMYvYluX3BObOCDUCvDVkfJPZErR6g
         Ab+WVKl3wQ7ioDCDoyQA+lcMFlMGj4nR6mULV9FAf8n5qFIbEipZeF5Tk7ePoAn7G18n
         5QarLGB6k50sMskqhG59mIa1LU7H20a+egxcxnjcF3vBLbMcKAt0wSFsCsmxtPV4E7/H
         SlJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nuro.ai; s=google; t=1793308922; x=1793913722; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LoPnVLFU2grju3RATLnVH/Dnn7cdm50tVx8bnt7Z2pc=;
        b=Re6vMFfK0sToGoINjVob2ahiCOouBs1MFolZogLftA8wIO4kshs+Vy0hn7J/oMf/+/
         TQvx8AmolIvg08Hx+XsiIwrr0zOKFFCiohx27qaot8re73AwfHaWdb/5pvp0gUoIWdaW
         ikiIjlhwEn5eoa6hW0oF8m84scPmznyjN0B+e9POn3vjj5YP2N+T+o6Yll0A6nidEdzM
         hS3KhrbxSIu+8ofoZxFERoP57pIDR5fLK/VmmbtnUbzdfNK2yHpw+uGiv78s6KvTJVse
         qeoSJkJyo7Rl70OUM4f/wZ3k0nrzOiH6nBNxvwRFw1U10f8qWu12BDP5sF2syXCf9jMn
         6vYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793308922; x=1793913722;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LoPnVLFU2grju3RATLnVH/Dnn7cdm50tVx8bnt7Z2pc=;
        b=Y8FNCbAlDsCdOrqbBKBo59gwK3NkkPgJ9Mw5tQzbEqrQj/ecLeolqKn6cBIMJuKoZ3
         WtRo7GQZay3awMjidH6B0qPpN+biFlI/MiOXUPppfvLdnXpM/vQ99b+N3dGB+iBbF4F2
         7EOIRbfcWi3/wnnlNafrmmKf9/DupoStpRoeDLzSVSRxm05UAixJo2BgFlsAT1N21QJF
         vBAxpp9TUElC7AtVIkUKe4BmqagY3xu5FObUWPKm9KvtqPxThFaUHlORnyAk7EIC6i0I
         xuYi1kY8jkJpVMm9aOlhCwhT+QY+El5iFNC6BjR/jzKYQH6z3DRRjprDiHjR8di4aslp
         uYdQ==
X-Forwarded-Encrypted: i=1; AKwUvBxrt3vf4Ah3qbxCr3dymtFnW3WliOn5AuCeNhekEP7utkRrTJUs3Yxxu1aQhjzsRMRQXR1Tr40OwlYeRU0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2PN+K5F7ZAZYGq0gyDIyLnhyRJUrHP7dpJ5TzRNxNZ/Cwuslf
	Fy9f7FoO5NutLpLilmN2+cCYTk/AhzQYTiPVyEjMTLufW6APm9p7LfIk0I6plv6ai1gihmEPvQJ
	/0fd0jMcu4HYfO6r809wgicI3W6GGs8ihZiZvP7x99w==
X-Gm-Gg: AYBFou09S3YEzv2NBlC8fd69zjxeCh7iqxMt/kMPny0PGxrr2nt2Hfyh4cEPmGavn5w
	k+b6/bhqJBqUoFRusYaQ1ZpmYbqbpowQ0p0fS7NC3TADOkEuT3CaRoRCfcNZVIU6WV4en1YfGXA
	Nor5L3V8ORLfvURJph0NmzgcXeihW0a36Tc5YspkJeXAPWALJsFPRFBLPg43M1S8+HpahdZljwv
	Cderjndtvuwf9p58I2vH1rnWwdxudPDvJEazUywMZe3l8v4XFRa72ZggZKrv2AFSjjMo9BBt94z
	wQvSqw0bJBlbmafv/GlXp3Mc/jkIem6wk2+K+mG8Y3R083ARuSJesiuS3Jk8oSI16eu/ZSOBNf5
	9erZVZ3tl4hG8Qi2ZyT0thfbudV2WnHPq8Yul
X-Received: by 2002:a05:693c:65d1:b0:366:bcf9:1807 with SMTP id
 5a478bee46e88-36a424410f9mr764924eec.36.1793308921974; Thu, 29 Oct 2026
 14:22:01 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029211101.2089535-1-jkain@nuro.ai> <179330839362.3327.16138152744448390378@kernel.org>
In-Reply-To: <179330839362.3327.16138152744448390378@kernel.org>
From: Joseph Kain <jkain@nuro.ai>
Date: Thu, 29 Oct 2026 14:21:49 -0700
X-Gm-Features: AclHuK9aYM6-5o4K0Rc9q8lcWnkux26Xrz1XQhSv4oBKVRCqRI0MctPRzTanSlY
Message-ID: <CA+Y90PhTQ8E9eXrXCNX79sGOu+wczDWA8T1xAmkG7bRMQahjqw@mail.gmail.com>
Subject: Re: [PATCH net v7] net: stop defer_count outliving the deferred-free list
To: netdev-bot+sinfo@kernel.org
Cc: Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, 
	Simon Horman <horms@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, Jason Xing <kerneljasonxing@gmail.com>, 
	Willem de Bruijn <willemb@google.com>, Mina Almasry <almasrymina@google.com>, 
	Martin Karsten <mkarsten@uwaterloo.ca>, Jiayuan Chen <jiayuan.chen@linux.dev>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 2:13=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrote=
:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
>
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.


Thanks, both are fair, and I should have carried this over from v6.

Found by manual code inspection, LLM-assisted, while backporting
844c9db7f7f5 ("net: use llist for sd->defer_list") to a 6.1 vendor
kernel.

Not triggered in production. The absorbing state is reachable with no
race at all, and was reproduced deterministically in a VM: set
net.core.skb_defer_max=3D1, drive cross-CPU receive traffic until
defer_count climbs past the old limit, then restore it.

There is no crash or splat =E2=80=94 the failure is silent. On an unpatched
7.3-rc6 kernel defer_count reached 2036497 at the lowered limit and
3995713 after restoring 128, still climbing, and zero skbs were queued
over the following 794847 skb_attempt_defer_free() calls: deferred
freeing was off for that (cpu, node) and cross-CPU frees fell back to
the page allocator. With this patch the counter peaks at 1, returns to
0, and 4282 purges were requested over 797687 calls.

If another revision is needed for other reasons I will fold this into
the commit message.

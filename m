Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793837357;
	b=xZ52HzlnHHwC3VIhWnRIs1U/oG2gkuNheR9K1s4mwFyx+UhE903nV0ujF6VsIy5ieVQz
	 To6wXzIUan9Y8FIBwiZUAPD/Uk9oQMzCQCtvPqEr+IjQ1Xl8mrxRsFnRs9e/GCsyJ774J
	 +8dtJFZUnwHATLVGEOZdKtLhvFV1GJjHEZv7RXNyJcWfVlXyNRisKU5g3Eu3EpICl/HAw
	 hnUa+e3n4ABkCokPDH/boYEhoYfIbbumRyLYHAAW3C7jMBqrBCkyS0zRNvHPwiyR0nSoo
	 0q8XqHL5ojDtYNzeWVZN+/aaJ6vW81uLwEnIU6SNxeGN59tXvlVCYYWX6qhwnARtvQg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793837357;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HB+BFMHFfjLmudpcNjOWqHhQxCGm0P7UzEzu0uzUFsw=;
	b=sZIloaAgJJ5wwU5BdSLqkyi1MTv0Vu1R5T8cCImccLgErOQW23yOIvAMKB+GphAOxyMu
	 Kca3YwONfG6m6cdk9mCtm9ENAv2Xl4+cnyUCpHYCNpkME/90IPEtpeTQRJbvQTnyc6bXT
	 ZYY/owlxTXenBNBvWFnA03N2U9XJUSudElgext5gA2xqNA/Nqo4/NXn6loMcTmHl/RSe9
	 I3Ml92XyktHXGgYll78aDmJooHta6AfMINld2Boyc3JAd86aRWRy+i9bMVvxGnsB5tw+W
	 kfJvaj1J2ju5I9BUU9H61w526wSYaU0v6LWVF0boa5K5kn0YkEGyYKzMiv1TCkM0a/w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QXaIFH6n;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0017C606A32F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 00:09:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0017C606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QXaIFH6n
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e9f6a16afcso13305ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 16:09:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793837355; cv=none;
        d=google.com; s=arc-20260327;
        b=CkNKTez0FSJ+FKRFVrvSfUkx/1IYXA+g8YnFlFWwgbHV2Z6WLG+CypEBNZGKOjmsWP
         EMlC3/FBoDlqqW9Ji3aNa4nqJXOQWtRpKDBs1TLuf1cMMx3tvYQEmS0wSPnG8tmnohvH
         9oehMxcopkcmdLzAxHmRQ672TaIS0B8fzC6qDFb96/Q6JC0izvXQTslHRo/XBJphURMF
         irOl2yVs1R4tHIIXfUO7YNPqLsOV1E0BU6RAfBlabe30f9gQYLMd9W/f/wdjDbYSkont
         LnMHP7sMM/u05v+83EColYTddVDX6d4rogBmmndlPGLWpN9qC8RziIYxNophbWq2JFtt
         migA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HB+BFMHFfjLmudpcNjOWqHhQxCGm0P7UzEzu0uzUFsw=;
        fh=QimeAckEcNHnoIkheHzc9LJUFP5C53wmJKNWVE9kk54=;
        b=aI6VjzN6KkiWwYiHnQYATL46dNY2QxMKyK6lngvAGkkAyNRGwMM+b5SWBHlfAlN+Vl
         XpgGJ/JqewXtsCoytVok2wQQy/+yhy77fgq1+T6e7rl5JytrAIxuI1eZxFQRyM0Bmss1
         hGQKikbHDA3zbsE84WhNz5w3ZCyW/X7xL4N5jsZA8t88vnDIiV/yk9BUd2j5qz+CeX0j
         KsofAP9GdNirdQBThTp+KvKkdpq0dU2Wn/qrEZfagf3p4srr3BQK5aIdU0nII8u0Qed+
         bZZLUgxH5LUZSg4YrACxGWBTxaHYChVm5ZNOVGaXp3ZHcg/sUTbnQAAdndRk9GHbF2V6
         NrTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793837355; x=1794442155; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HB+BFMHFfjLmudpcNjOWqHhQxCGm0P7UzEzu0uzUFsw=;
        b=QXaIFH6nvmIEpsYVHjgTv9wsJb6tDyNMc4WjxLp++EaO8Y4wKyte5afOw7KHG+4lIv
         l4znz9VzF81N7EuyqY+s4/BgMvgHQSZmi1yC34kb1lS4W5yZGnXVX1wmRO0XBLSYx2gy
         /acNcmtqotpkuHAf6vYOSQxro3wRjNZgKijJ5GAygdiELdsFI6DTL20MdwtaVDmdxAmP
         mu/uXk2dGQSy7280xtnyFGNAMlmy5Td+epcvzlusPsFo916i03FGi/u7nmHRzR804sa0
         YwoUSS2qnNUoZxeMpJIEcMk4r4/2pBYQNuiO02rAH6qluGOfa0eZ5OMItTP7TDMo07kb
         YkAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793837355; x=1794442155;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HB+BFMHFfjLmudpcNjOWqHhQxCGm0P7UzEzu0uzUFsw=;
        b=DmcfARTx8Va2nDqTgc3p09arWnOba4ZxNdEvP9mJOsrePK9vqir6CpCd4hIpdqfYaS
         gM2Q8MY8nx2jQyowraDIf7c2bBgyRQ2XgZq8J5Lq5nXEIn3eVsCapKCdqvkyH8cJ/SkK
         6Fs82dupsnOZyqXd81z1S+iImBKiStmRrM6nTscRfOFj7NqG+JM1ZciHUZWu9hUBXa00
         deAOGe4PU5l9FxciNWVaoRTu2CehmlcGHPk38Ynw5lVIVpG/gS68JFmTTZOKwOVTe7/e
         Bm5vUAOdsl05wMiCP58B4DM7TcYcAg2euHP5CRzuQc3rk1V2wgL88x4JQHdGR3kOKwc5
         JgcQ==
X-Forwarded-Encrypted: i=1; AKwUvBzDIb+b6OyFz++/D7ggpbHCF8LhWzAgd6Xa6PncrfUPjmypCzEJ9AG0hmmFRfpe+eoMCU4v/fHH001OKfs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yVjZLBRyKFhipdhko3lMeC+K5d/kWfKcWA15D7WY3fzVS6qoR
	kpNidRlq1hYx2JtBG6K1jAHhLSa61jwX3BIiRhtGvr30JdDUXDKcarBPINuwxb/DxGbGP1++OQl
	vw69vAi7fke0bw1lT9edkqZg5MVHAZ9NS17Hf/alSJ5q3oIQgDd/G/dP7
X-Gm-Gg: AYBFou09wrOlabzzlw1PGY9zc79WqWT/jjsbJLC1mNhPGZgvZ8QPaOdxeFN9vp9EVN0
	cbuqPnb6S/4fVM4NIiI3e8ehWpuIOmdeZz5G4p7K2TCWTPUoOxAq+2JFGe5/g/G3ZZ4ftJdracB
	cnEjxkC4tzlSCxOs7BTop3Wf0q4IChAc+3EX4a8CUOrKOLq+A6oL1Kmn0eQhVPM5A+KJG/gdtBV
	cmTnQYOjVEykiU0HiPlY/yRzXjbjKmmPUQDaobp1kCr9o9I4Bd5YbWnC63PjPbLFxRh7nQSCLfN
	SxdtJSEV9vzoNQ4skB5veR9kRM+mHVttljNt7jVEkgOz19qti9ms9edMy6YdGEt4o6bpAepPfeq
	KEQdbCS5fddvQKP7/vPfrFw+bjYbwMXiArQ7AbtrzySfMLM26ky7ZFMSKGLjy72sMswOP3axuVK
	WRqi8Tgmo3RYZ7upn0PypNPw==
X-Received: by 2002:a17:902:da4d:b0:2df:96ca:d7c7 with SMTP id
 d9443c01a7336-2ed27dd6f44mr1503915ad.10.1793837354522; Wed, 04 Nov 2026
 16:09:14 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-bugfixes-v2-0-021c84d852e0@kernel.org> <20261104-work-procfs-bugfixes-v2-44-021c84d852e0@kernel.org>
In-Reply-To: <20261104-work-procfs-bugfixes-v2-44-021c84d852e0@kernel.org>
From: Jann Horn <jannh@google.com>
Date: Thu, 5 Nov 2026 01:08:36 +0100
X-Gm-Features: AclHuK9OZgoxGPef6pQV_HsS-hU8I1LV2S0BG0Ux9234a4e7Z7um8wA7D7hSN74
Message-ID: <CAG48ez3=6q6hqMcN-=q6qNrghHjbpXr+i-Su_s0siw25reBkWA@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 44/51] proc: sysctl: resume readdir after the
 last name it returned
To: Christian Brauner <brauner@kernel.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Kees Cook <kees@kernel.org>, 
	Joel Granados <joel.granados@kernel.org>, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 8:27=E2=80=AFPM Christian Brauner <brauner@kernel.or=
g> wrote:
> proc_sys_readdir() counts the entries of a directory and resumes a
> listing at the number getdents64() stopped at. The entries are sorted
> by name, so one that is registered or unregistered in between shifts
> everything behind it by one. Listing /proc/sys/net/ipv4/conf with a
> buffer that holds ".", ".." and "all" and registering a device whose
> name sorts before "all" makes the next call return "all" a second time.
> Unregistering one that sorted before the position makes it skip an
> entry instead. So a listing that takes more than one call shows a name
> twice, or not at all. Even the 64k buffer of ls needs a second call to
> find the end of the directory, so a device that comes up right then
> repeats the last entry.
>
> So remember the name of the last entry a call emitted in the file and
> resume at the first usable entry after it, like kernfs resumes after
> the node it stopped at. The entry itself can't be pinned across calls,
> unregistering waits for that. If the position was moved by a seek in
> between the listing counts from the start like before, seeking to an
> arbitrary position has never been better than that.
>
> That also takes one walk down the tree to resume instead of a walk over
> every entry in front of the position with a round trip through
> sysctl_lock for each of them.
>
> Fixes: 77b14db502cb ("[PATCH] sysctl: reimplement the sysctl proc support=
")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
[...]
> @@ -756,8 +834,11 @@ static int scan(struct ctl_table_header *head, const=
 struct ctl_table *table,
>         else
>                 res =3D proc_sys_fill_cache(file, ctx, head, table);
>
> -       if (res)
> +       if (res) {
>                 ctx->pos =3D *pos;
> +               sysctl_cursor_set(file, table->procname, strlen(table->pr=
ocname),
> +                                 ctx->pos);

sysctl_cursor_set() is called here, when the output buffer is too
small; but not if the proc_sys_readdir() loop ends because the end of
the table was reached and "h" is NULL?

Doesn't that mean that another getdents() after reaching end of the
file would observe the last entries again?

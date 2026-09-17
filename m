Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB8E36EA8D
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 03:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789614696; cv=none; b=QDRemFORiKVK+JxvTluz757mWZ7re8Fds24U84wWNp10mQ6QatVfnMCoi2Db+d/zjyfq4hAR5f4P7hKsJGjMYw/QcojAZrd8SDiqNuck58HlJv8Rnbh9gQEE+QSQk+YDh7hF2cxgI21RcCYtegY2YMutQTZj/IeO02ntAE5nfE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789614696; c=relaxed/simple;
	bh=oubV8kUjlWyQt+qzu0AyX7yPbC0jwTfEO/ZdVE1xXAk=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=r5AKnuXP20F/0NXn67EGYZJOwrvHfhCHmjrHKwKcyZCIf/C93MmhhFuzgut4k7Zr4gURl7au66bYVS/b0vi/md79Q98OzjEN+Fw3a1wEap32haGc8OCzGJOyhJiakZcN+YXU9Gk9q1ybmc912ivVY3z7UeO+eHE/YRaS0N38HlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z0+lEvLw; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z0+lEvLw"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1ceb47d55so45939a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 20:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789614692; x=1790219492; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oubV8kUjlWyQt+qzu0AyX7yPbC0jwTfEO/ZdVE1xXAk=;
        b=Z0+lEvLw+qzY2WQX2hpX6lDbwmUZM9qoyNK06wPD/JISQz49k5AmK9ZZWzayjbIvoC
         627dzkxkhAW8pPw9NxNbcqdiRlhUbC/UMdCPGFhTf6lYaJrJl3cR576Vg+8SnPJ6RWfO
         24/mO0NktV3DuauwZUNof2ojWjxqGBensmKoHY4keiHd6rliT0dGE98G/ynggJxpuj2q
         P9kGCIY1kL8eWeOroF75cNEYdLELkg6Wz0544UKOkIPyJkHQAfIYaFktSG32f12CMiI2
         INAyuVbdxUKTkfuHadTVrWhrn+CjXnNmHBR59lLy3eEAOHXhNzOuqyY2It2cvTaGUPi1
         RLsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789614692; x=1790219492;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oubV8kUjlWyQt+qzu0AyX7yPbC0jwTfEO/ZdVE1xXAk=;
        b=j86CUDwexNfOc6cUbBE8wa2HvUI4SrvkMZQ59chtpn7gCh9Oj/9mXIxVBHvFCG5bh/
         TQcvfeTK2fsEaH9D5Wr9BlqumWQ5B0PBkXEZ2zGIplzIRZSXmKTo6YFRddh6wcZ0LWXM
         ZjXgA4iEQ/7B+dcpT654tz7tgfgNFUF+5ciGV9+l3HJSRdZoNMKHq2m7oE32pGFgjbBi
         KIX3qrK6R5hy21cAT/XZFNZ7gJnw5UM9hw61Bon845GFNbAz4KfdRcB0sGQBUROj002x
         C3FoAhb2BuHAPxLH7FemcArv+yWMam20YELVVX0trO13WREzJin2MbWeeJIWo94u6bDG
         He7g==
X-Forwarded-Encrypted: i=1; AKwUvBxStDo0Kowr1AxBvYks+k4NtdjbQEkY8HXJwehGUSF31QECQUB4cNtx/p683xwqWiSBAeU+PsIZRIF7nQU=@vger.kernel.org
X-Gm-Message-State: AFuF++lhdsiZRsybGYGwl/bpW44OQZ0GmzWeTB2k5dfwcTp5i5zU4Dj3
	6TKSHDkpfeVfW+LG8aFn6eUGYQT5mxlYBC6HGMkbt/yw+DsIwBZHeX6R
X-Gm-Gg: AYBFou1nrqP7Qq8ZOhDF+vCipJdm1inIWCYRKyEepZF0l6sC+WHwt+xKBl0vNpOi0Ct
	JfBZ+g8T4D4iaBDK9DTlyw+A2ZVPsmY9ToD2BM/CstdYyIZrTBWHXLx33R2FeA1EtvUmrMywlV6
	yAwKwxC+T1AIxd1htUYEnBB+Us4JQByI5/iXWQwGjhdI2yTLyyX4HPEtfpAqQNm1w1aap51+Vy6
	/Xw+yRoCpgWO5YyFZw58mZNXY06u2OcujNWj3uJxgcBczk1XvwyqQiayRQvL5hyAEbFO8sd1VNg
	2MBXJzx0d3vh6V73NFLlUobrG6BExQHbZ0lK1DedFg3pYaHwdV8mTOBB9jSfZgD3w2CWacCpLvp
	pFP/W4gdN9sYKn7VyF/nvKsUiTaGzgMxZQcGQ/DyBoTROEjEP4Fd9ks/E6L+M4uMDzYPJdNAr3B
	N6lI5BRQXfjcwIWFQ67rhJuppphN2Gr2IoxxRd3t/8i8fLQQYNPyLSd3nzP0coTzf6xVYV7p3JS
	HaQRzZgbJLwhJ6eE8ftH4BM7UBsSrUd4/GFMakuB18L4QfZ++5nHxALUVVt6SR+85gGQuXSZP7E
	ExDrxWHhaYZCNjU=
X-Received: by 2002:a17:90b:4a8c:b0:39e:3d38:7ef1 with SMTP id 98e67ed59e1d1-39e3d388175mr866240a91.10.1789614692232;
        Wed, 16 Sep 2026 20:11:32 -0700 (PDT)
Received: from localhost ([153.61.198.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3abada87sm1354793a91.14.2026.09.16.20.11.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 20:11:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Sep 2026 03:11:30 +0000
Message-Id: <DLH9GNAO4JH7.Q7DM1I60M8TP@gmail.com>
To: "Nicholas Dudar" <main.kalliope@gmail.com>, <ast@kernel.org>,
 <daniel@iogearbox.net>, <andrii@kernel.org>, <eddyz87@gmail.com>,
 <memxor@gmail.com>, <akpm@linux-foundation.org>
Cc: <martin.lau@linux.dev>, <song@kernel.org>, <yonghong.song@linux.dev>,
 <jolsa@kernel.org>, <emil@etsalapatis.com>, <ihor.solodrai@linux.dev>,
 <davem@davemloft.net>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <deller@gmx.de>
Subject: Re: [PATCH bpf] bpf: Fix page double free in test_bpf skb setup
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
X-Mailer: aerc 0.17.0
References: <20260917023834.2760055-1-main.kalliope@gmail.com>
In-Reply-To: <20260917023834.2760055-1-main.kalliope@gmail.com>

On Thu Sep 17, 2026 at 2:38 AM UTC, Nicholas Dudar wrote:
> build_test_skb() transfers page ownership to an skb with
> skb_add_rx_frag(). If either allocation in the second loop iteration fail=
s,
> kfree_skb() releases page[0], but the error path then falls through and
> frees page[0] again.
>
> Return after freeing skb[0], since page[0] is already owned by the skb at
> that point; the raw page cleanup is only correct for the first iteration.
>
> Fixes: 76db8087c4c9 ("net: bpf: add a test for skb_segment in test_bpf mo=
dule")
> Assisted-by: Codex:gpt-6-astra
> Signed-off-by: Nicholas Dudar <main.kalliope@gmail.com>
> ---
> Please queue this fix for stable. The double-free has been present since
> v4.17 and is reachable when the test_bpf skb test encounters an allocatio=
n
> failure.

No.
I don't think you have a way to reproduce it.
We don't scream "bug... apply to stable" just because AI found a tiny
race.

pw-bot: cr


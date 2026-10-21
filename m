Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792624985;
	b=i78drXhmjKhs4h6Jt15R/CrLhGyxx3nbiw9GcvMr/eBMsVLyE+vOaSoIfdhbkvSl1zI5
	 dL/fcsYXv0MmRxYWvPcLXZHldreZ23RRqNaa/kSxiWgKpsUiOr16Qy9i2R3EvVK1339JV
	 jRMoMnAyvZaDFq3+8PlnPIw/BSOcNCnriUYfGzRNSvYZ3zsg3d07Bo65geCoCISM2tb3q
	 Yd546npm0ucP41aIOktv9gdn3eYKKXehVKbcVUt7UfH5JOl5Ra+BYZrs8f4JEImMzC4oA
	 UU7MVziuyXdrxkW3emyTntXboPNqr8KJ2S7gdOtRC19zhOJTG79dTAMIEraewdkgo/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792624985;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=UWTtYfkUlWyv+2UbtfIcf2fvliDHTQ0Yu20KCZoeOOA=;
	b=LPXS2LxeTrffHRsyTCArrBjH1nKl8MKGwotoSjeywbfGkn0qBgkEEoUcTIxuyRI0kDQJ
	 DTiFHnk7dNS6Zj33xIb0x+nBfma15pJHiehG2TK39zdzE5uwdpqEajjRZN16ayP0kVkAp
	 SE7DDyffrXZMdcAelviQKAO3q7ym8qRzs2wqetQhqlpVDMJ5U2bPKTNFQN0gsiH7sACai
	 +kR+8T4LkKvdMNdhre8AnQmi6B4vxQzY6urexrdXTMWbpXCnNCptFNqMN/wsfHg227NnU
	 X7oVn87F5lxpafybcen/FfxXlRSq2nGiG6fBIDGuMsCq+TCZb7g+2aKf7uJyNUKJDyw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bswUs7Ka;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.180
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B08606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 23:23:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63B08606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bswUs7Ka
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-4d7034a99a9so776105b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 16:23:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792624984; cv=none;
        d=google.com; s=arc-20260327;
        b=LtG9KWKutU0O1Fo6NxJoAyT0aHI8XFEZRoC8Z79q5TNgVYr7jRsNouzaFbmT0GA6n2
         kh+o5deAAeq6++Y1x6HXSB96Q8dFNHUtO/xZKKl080Se1MKFW0c/zi846IrepO4wQL1n
         WojGGHfC3dv6TcrZ5yaivtZxce1Eraxou3YJf4no+u+YDNvqAs2DDYWt62pUk1FRXDLj
         wzaC+SLcghOrJgaPxUO/5IANbm42Z1jRQHtX7z2c6t0jTqHTDd1KccL13pS7P4rd2MH2
         JgGV76+apkGnYNDdV+bUzosSFK5xDm+izc65n6SLHsi6Qzy1TIrX6DbxPCFtYyw31+Zm
         ZIEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UWTtYfkUlWyv+2UbtfIcf2fvliDHTQ0Yu20KCZoeOOA=;
        fh=WUqiyuqDtnTHWHUR57ZE8eXbUethWhhCU/goLHSlZK8=;
        b=fy66ZlNPdFP8wh4K/aQFO5arxIBeCjDMbOD4BpXxnzXReNjTTeVmRRvYBiv+4vLixJ
         bEWTPYmedDPlaXzqxPRc1OyoWV3PxwDZkyK8Eb+jWzKj2nTlDVYsK/hRMDRUdNzF47RO
         RxQLjAi/HexfVNxrMq0vGkmbNP7P9oYrJ4MX7jYZfRI+1CsLEvWGt4woBfwYlSMjd3HV
         /PYrELliLWKTx543BaficUPUdnlu4vgzS6rWUsZ+EYlzXjVYfwX75SkRoETS0DUOZiuK
         MUrK4HAkhbRYsfaNGYATwqPglmSEj6t2XQ8znbm3mVdfBg+A33nEPIsktrgOnoN8A7aa
         JUXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792624984; x=1793229784; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UWTtYfkUlWyv+2UbtfIcf2fvliDHTQ0Yu20KCZoeOOA=;
        b=bswUs7KaQtVDzZeWu+MWiyJboN7ZZsa0rJoQF+iOWuESEO3rl3FcBVgfPYnaN5YGfF
         EjV/Wtawl0coq/Pg0/i3QcsLxYidjtA1LO/2PqcSVzx53rhAN2x/zpMefR+C6/XCMG4G
         N4DQB9V1zjgirP6GQA4xpSSF7D323JQnLliMu4oWg538jz8kCe4Q0j97wkFF0VGG3IZE
         3lJIg4tcXBe1AepcbuLJY+nmSgyZS2Nue5zWy1LFWsKTNrMjhI/4aumhI9ks1qH7swUy
         ZgbY23Nf4w5fpAPVIe1SutVFZyWYhVHgCFu95eR1kXAvAukvnC/ekv1jGMGoZSsbkbbp
         JNUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792624984; x=1793229784;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UWTtYfkUlWyv+2UbtfIcf2fvliDHTQ0Yu20KCZoeOOA=;
        b=JaTDlddTpCFb6b7PA5qpQZAl/UX3W2Fzb+g1MUlFFzUQiD6FCm7Cv5jXB4zO8FQ4Xn
         akJZ367JK6/ol7gjpwWox6xsV+dcbrgQiyBTon6s3VYBq/XkE354gEIWLkkzvAnwIZ10
         RJAR4R5DFqkQnswTxb4y5/Nwpuxkuf25a07xvQpuMehwgLEb7ZtXlxaVmAaUXFPxBd5z
         DYMi3kKLn13POagbL0BZEQBOY3VO9I7MbL1pqM8UwLdJjjIjg+a8iYBEpkF7Tuz7CvlB
         G+09H9kupWxCp3wsqoKGAjnncM56S4Z4itV0ga6aA9x4MAyaoBWwiFTVI8D2sZBlPG+q
         wWpw==
X-Forwarded-Encrypted: i=1; AKwUvBz4tJxCWeA/3NEZnzpqvYutYiS6TLQsBR4oGHaTjZDSFQ8pdkm0Tbi3tA0622ubAhxxSysyx9CzD/PnkLw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOYebFhVLzhDnd2XIFEjfMrMy7ggXaVE/o7q4tgprsUn6qkh6B
	agVSMgmnloaY3+FJ/F2xYtLixg2jhRgZxbJgS3DgnMYpaAZeajtIj3mJhkakc88jPXFR5FD9Rd8
	mmQO9579sJuRmOhXneJ80aJNkXskyb/E=
X-Gm-Gg: AYBFou0hXKuKrNk2ObpZRVGwhj/Id0uU8b4UGaC0zF7fs+0W8Hva+w7fAe2Yl8Bls6Y
	7w0R5IE/n5G7KEB6/qcXULFSaDGEaUk7E7XJA0AvaLaFyxlMVTzukBqNbyss8cACBF4M9gMV0nD
	H+kQ4Ul3CgTrix0u86hRFHB3PFlYgxckgQogxgiubwUfV2UtPynS8tVfeE89eULeeKsXbZojjYK
	SZhi0FlCkC7p0/dVJal4Zd7cb6c0qNqSqZe11VfhHO9U9wbFC02SQNcXclPuY4Nj0vqDhJqGm+V
	dxtlnTr8BGsVGehUSZUxCf2apXg0TH3ilnnuQi0L3EIdwypDfy2FPByCcTZHLp+hvNpo7xpNPDl
	Scia4cwj8r8vEwp4Q7zBYThEH5ul3Baq6su6i+MZAF4T2XTms06M=
X-Received: by 2002:a05:6808:1686:b0:4f3:e98f:fa27 with SMTP id
 5614622812f47-55359701a33mr2377377b6e.16.1792624984257; Wed, 21 Oct 2026
 16:23:04 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261017041419.311921-1-daniel@0x0f.com> <CAJpaz4abKAkDznoi3gczYHNQMF-j5cSajtG07Jws8LkFY9DZFg@mail.gmail.com>
 <CAFr9PXmntwx06iMc200d9HPoOeCE7XURpS9jiWhB3ud_+QQggA@mail.gmail.com>
In-Reply-To: <CAFr9PXmntwx06iMc200d9HPoOeCE7XURpS9jiWhB3ud_+QQggA@mail.gmail.com>
From: Colton Pawielski <colton.pawielski@gmail.com>
Date: Wed, 21 Oct 2026 18:22:52 -0500
X-Gm-Features: AclHuK-WfMKMCFvlwQ93fHdyuPOEefr5IORMgFLa-KSGZEsFjPpcPlLkY8bAXbc
Message-ID: <CAJpaz4ZJ-zgcudHS705HSdcM-wiB5hmX=gg00wqzS18NF6fm1g@mail.gmail.com>
Subject: Re: [PATCH 0/2] sh: Fix IDE on landisk
To: Daniel Palmer <daniel@0x0f.com>
Cc: ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	dlemoal@kernel.org, cassel@kernel.org, linux-sh@vger.kernel.org, 
	linux-ide@vger.kernel.org, geert@linux-m68k.org, linux-kernel@vger.kernel.org, 
	fuchsfl@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Daniel,

On Wed, 21 Oct 2026 at 05:55, Daniel Palmer <daniel@0x0f.com> wrote:
> There seems to be two issues: One it interrupts for every packet when
> the 8139cp can hold off and not storm the processor, and there is some
> issue with the chip refusing to send small skbs so the network layer
> starts locking up/timing out. I was planning to send fixes this
> weekend but if your fix is one of those, send your version, cc me and
> I'll test it out.

My fix turned out to be neither of those, so please go ahead and send
yours. It's a race in cp_rx_poll(): napi_complete_done() runs before
cp->lock is taken, so an interrupt in between can leave Rx unmasked
while NAPI is still scheduled, and the level-triggered IRQ then storms
until the board hard-hangs. I've sent it to netdev with you on cc:

https://lore.kernel.org/all/20261021-b4-8139cp-napi-v1-1-c9b683d9564b@gmail.com/

It should be independent of your two fixes. Please cc me when you
send yours and I'll test them on my boards.

Thanks,
Colton

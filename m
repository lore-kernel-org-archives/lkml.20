Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794592972;
	b=4okQHTqZkvhu11dkqMpUyDc5k17eYSHCqcpItwE1lZyWzm8WTncSlo68kXMrjbd1hjDd
	 0y06NncCdgGf8K1KdDe8xzSsIsNNGVMp0WH9w4k8spAI+38XkxJFy8SjVA7hwBF7ez/rx
	 RO3NwUGz/1KakueravZTDiYdyFGVPPv1DXSOqtRnjh9VG9QIBCLqNTfKC7GfSpXjd1RZC
	 e2jklx4LK07XiTRRo5FbRK69wU4DkS8o6X1uZ0RbeHMhDsCrDhBNUMaySzPD1miptC5UX
	 31fiAaZpZN/U0vLoErN+AgknMCWoxh0+MDjHtCxsSyaCLpWyxJoyxgPnnGacEbyS7+g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794592972;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=gQ+bi0PEcth1C8j6KYtMHOcnQffx/MZtkZ+1kTRjkfs=;
	b=XyejObx8C87McI1fCX4Mgj2zhas3BU9QpjppJO++iRf1zxYSh2W5T4RguQQhTFdbUhHY
	 v3V4pbq/wSN+HPjvoKeET3eXkT0rAeLbroiNtIKhQsD30RzeNIRhd2QivC3w0+XcSkQLq
	 UXqkJQYR11je29d8E2jH6Tr9I8prGiGC2sPDyxaAobnSXTKibzRM5MM9UQ4Zb7BnPYOdX
	 a8lNb06n++dTdDsCmD/aq7DJVz5osZQ3G4SaAjtM/TduIhttimwIUAI84n9o9JsaJDpUs
	 bBxUoDn60rVhyHjD44iTViLAwlXyVcUEq5tDhY7vnyOcyiIFKMMszlBc0f6MQkSTHPg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=S344JDIE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C560C606A327
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:02:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C560C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=S344JDIE
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-53c4b82919fso29815481cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:02:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794592971; cv=none;
        d=google.com; s=arc-20260327;
        b=Zr4lPSuRhd+IEzPqq9SOIsXcL4bUJwRNe2nD+WgHeX6iVDN9gu6wHLHUn4Ykpv5C6t
         ECy7j9lVueaGuB8v4qtJIFK8SH0Lta+wr968WUZNbjf1EoKcQmcjP/Pez4JcejXEqcNG
         BW6jMOMTJ6uEV0vMiHIjOwSXZSbCOauiBTho3OOh+7XbJjPKWHc7W/r+0nUUNd4mSQh+
         /+lse6vie+aJYeDfNwmnoYI+vi6rr+wXx+RU3ZQo7GE4zscHc2TusmPYeGJkj535zEdz
         u5WJWrkH3S22kRIXAin7EHCEGnVvv8lOp0M8BefzPbSWHKj3QgVSxu8GPpWYzo57Zktd
         mKWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gQ+bi0PEcth1C8j6KYtMHOcnQffx/MZtkZ+1kTRjkfs=;
        fh=wg9TBaXFYaGjRz/6upNggEOlf1eSHOouB6P92oj9Pwg=;
        b=i+iv/qqna1jCmABnlIWpbwZwvKrKoSvu8vFnRpKVKp4SzYMAusQkM/3qzgtpRcPt9q
         T52QNJo49Xtk4HkbIW5f7nk5mw02yI+dGgV09Di44gVqm4GS0D6DUPUDVwdwmQSnLpoA
         d9j5O/lqG0hbslTStrrhfcEUoc/3sKVxgClygd9e+eA1yjnU1pymRJL2JYiBnwqeoMvP
         G0chl8ns6NXi0lES5p2FM3v7wUO7GzzzLiIFKXRmNtv9CvoG6B8CNZfnHZXhbvqDf1uy
         7LgEa0Y628rArW571DUW5Mj05/gxPb2KxexpDH9D5/xC6goo/luLOChS3luiglkx5NNl
         zSNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1794592971; x=1795197771; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gQ+bi0PEcth1C8j6KYtMHOcnQffx/MZtkZ+1kTRjkfs=;
        b=S344JDIERFkZBrocvQYl8p3sGPv8GMT6X0lnIc4IT0W57GQc+yiYiJTIgBx8wKWnlP
         14ALSpCt+/n0I6fUVMls2zrrjbyB83heWU5y/iATlnjCSIB7PkKmLhSIrIq9QfKe2C18
         jWimiXAEXCzkSfH1UzhiG7vsJFyoCMmjG36+FTaKpZZ5SNX+mk9d2yFgIyshI0jb8han
         qZBYgYdJu532z5MC5Qu1jp6xg/Y+yMhFg4tIo0rr+S9zYVhpdsc4pBMepU6W7258QK41
         DG0gMiRd1OZre2ZQAoTndVigrDbCPveIPrvRsS3sMeKCDdc5roIJtFPuFrxUViG9QdTt
         HSgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794592971; x=1795197771;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gQ+bi0PEcth1C8j6KYtMHOcnQffx/MZtkZ+1kTRjkfs=;
        b=IK08x3Ako9+pVNVBFtnkzic6YlB3Bemd29f5Uzl6B7KoKJFa8typMP0rTX0sl8ogZO
         Eym5uzsYO+/Oz+HXJF4Ka0j9h100kDW/1O4jSyPb8alSQ5QMthghimzwKTJtCXSdh017
         nXYOG0FfRqFL59QC+FeGrgMk9HHfyLelzQHg88i2IZQg0vFC68N0PWUSr4crSKwqFwTR
         ZmJMOz2cgq7jdPfPjM+ntJjoZsX7FyljVBEXHcJQAduSWIlyhvyjF21ug/QAE68YNgk4
         uFkGnQrGoUq3oaLErWTOlGCOESLpewK9cMoIgJf5MroyRZHlxczxzsKDf+McuiaVJwWZ
         1zjA==
X-Forwarded-Encrypted: i=1; AL+hErGXCTjvYI5fPNkrAxBKps+N8fnQOvu9LVVan5DH18zkgdhTdLLqBNnRSYcC25enGQOtbvBiv1mq8pdUGJ4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8RV0gLFpJyQduuKhQH14ltUbjliA9ZwGQ+I9GhEO7LAVDnXL4S
	odhj+lxdmnIPbCwNsSEvqFIxZPwlqMP6JVhnNc+0Y7kYfdfRbWx6AlB+EPc0f+QjCTZPw981uO8
	1XPTFaMJ7OouJpl8zG05WV7n0yIdJxiZOQZtFoiVvyw==
X-Gm-Gg: AYBFou2xSGppkgI6VmYXmmDGDN5suj1QvnutNYuMJPlcxi3Fcm81kqmVgAd1gonH95v
	q92q2MLWVf8uHWjGiNb/GUPAOW4JrqJuLQ+2GuCp0t0WuMhlFzxQDQlEsRtsaUhqncgct7nYUI7
	zfShG406DOZ8lJXTLLfpSZWNSdYjctNBnQzSrcQTspxPgfUmywJxiZb9FOeTOL2c91nwiww2jDs
	IqdqxDsmWQa/AxzSLgz2dNQ2QBnIzYzknjzWfjyJr8nNUpMHYSFryDnyX6ZkAnGSa/Y/2lfaKuP
	piogHh5K89tgkOeLnoQtQRou5utDUPy5knggQX9WW12whoGhurbZtvE4qZjwuJtB19KNHMb0Zzr
	T1rMYHGMDftWFge4NTyyKmpnh3eNbJ/fhezqwXQ==
X-Received: by 2002:a05:622a:a883:b0:536:6c4e:13ff with SMTP id
 d75a77b69052e-55aca35e080mr51491481cf.56.1794592970332; Fri, 13 Nov 2026
 10:02:50 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260922200718.3941465-1-sgogte@purestorage.com>
 <20260922200718.3941465-4-sgogte@purestorage.com> <705f4452-3d07-4d91-9dcd-ea53b2cd75a5@gmail.com>
 <CAMof9cU5s0ck20fcSAYSvK-xpcP5_Hv2BmN20Bh3btpLum7THg@mail.gmail.com> <20efc96b-c57d-4bbf-8d3d-602b8c9e5828@suse.de>
In-Reply-To: <20efc96b-c57d-4bbf-8d3d-602b8c9e5828@suse.de>
From: "Surabhi Gogte (she/her)" <sgogte@purestorage.com>
Date: Fri, 13 Nov 2026 10:02:14 -0800
X-Gm-Features: AclHuK-jixVC_zcNYsWh2RHUZVwc70pygNrgi5VX-_W7wvY40TMb8OgTwKzr8N4
Message-ID: <CAMof9cUGg437j6qZ_T+AQYxYRSvh9WBtx6582sMPjk2p-e68ZQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] nvme-tcp: parallelize I/O queue allocation and startup
To: Hannes Reinecke <hare@suse.de>
Cc: Martin Belanger <martin.nvme.dev@gmail.com>, Keith Busch <kbusch@kernel.org>, 
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
	mkhalfella@purestorage.com, randyj@purestorage.com, adailey@purestorage.com, 
	Hannes Reinecke <hare@kernel.org>, wagi@kernel.org, shinichiro.kawasaki@wdc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 1, 2026 at 11:15=E2=80=AFPM Hannes Reinecke <hare@suse.de> wrot=
e:
>
> On 10/30/26 10:25 PM, Surabhi Gogte (she/her) wrote:
> > On Mon, Oct 26, 2026 at 3:57=E2=80=AFAM Martin Belanger
> > <martin.nvme.dev@gmail.com> wrote:
> >>
> >> On 9/22/26 16:07, Surabhi Gogte wrote:
> >>   > Similar to commit 2a8513091d2f ("nvme-rdma: parallelize I/O queue
> >>   > allocation and startup"), refactor nvme tcp I/O queue setup to use=
 async
> >>   > API, combining allocation and startup into a single parallel opera=
tion
> >>   > per queue. This reduces connection and reconnection setup time whe=
n
> >>   > there are delays in establishing connections, which is especially
> >>   > important for high-core-count hosts.
> >> [...]
> >>
> >> Hi Surabhi,
> >>
> >> This patch breaks NVMe/TCP connects with TLS. This is a different bug
> >> from the pf_cache_lock one that Shin'ichiro reported.
> >>
> >> Test: one VM with 4 CPUs, nvmet-tcp on 127.0.0.1 with tsas tls1.3, a
> >> connect with --tls and 4 I/O queues, and tlshd at upstream commit
> >> a0bd51d.
> >>
> >> - Linus master 6b4b543fa187: 14 of 20 connects fail.
> >> - Same tree with this patch reverted: 20 of 20 connects pass.
> >> - Same tree with Daniel's pf_cache_lock fix [1]: 22 of 40 and 17 of 40
> >>     connects fail.
> >>
> >> On each failed connect, one I/O queue logs:
> >>
> >>     nvme nvme0: queue 4: TLS handshake complete, error -110
> >>
> >> The tlshd that runs for the target logs:
> >>
> >>     failed to search 'psk' key 'NVMe0R01 <hostnqn> <subnqn>'
> >>     gnutls: Error in password/key file. (-31)
> >>
> >> and closes the connection. The tlshd that runs for the host then gets
> >> GNUTLS_E_PREMATURE_TERMINATION, which it reports to the kernel as
> >> ETIMEDOUT. The other queues use the same PSK, and their handshakes
> >> succeed. blktests nvme/062 and nvme/063 fail the same way.
> >>
> >> I can share the reproducer script.
> >
> > Hey Martin, can you try the tests once with tlshd using commit 3a6658e
> > ("tlshd: Link the NFS keyrings per handshake instead of at startup")
> > or ktls-utils 1.5. blktests nvme/062 and nvme/063 passed with this
> > commit. I believe that change fixed the keyring race in tlshd
> > independently. If the issue persists, let me know the reproducer
> > script so I can also take a look. I saw the same errors while running
> > blktests with an older tlshd version from ktls-utils 1.3.1 and
> > updating tlshd worked.
> >
> Ouch. That will be tricky for distros. If there is a specific commit
> which requires an update to ktlshd we need to have a way to identify
> that; otherwise we'll see lots of regressions where customers have
> updated only one side.
> Please modify the patch to work with older versions of ktlshd.
>

I'm not sure how to do this well and would like your advice.

The race is in the target's tlshd (keyring link/unlink per handshake,
fixed by ktls-utils commit 3a6658e in 1.5.0), not in the kernel.

Two things that I faced, getthing in the way on trying make the host
backwards compatible:
1. Nothing tells the host which tlshd the target runs.
2. Serializing only the handshake doesn't work: nvmet-tcp blocks in
   its accept work peeking the first bytes of each connection, so a
   socket that waits for a lock before its ClientHello stalls the
   accepts behind it. Serializing the whole queue setup works but
   gives up the parallelism for TLS entirely.

Can you suggest how to structure this to avoid the race while keeping the
parallel setup? Should we fallback to serial io queue setup in case of tls
timeout errors?

Thanks,
Surabhi

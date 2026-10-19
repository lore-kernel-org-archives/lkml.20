Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792438836;
	b=IDKXR8dOo1TSPa7BJOLf1bU6nLwyw2YIsGEeX4GnT+N7MKC9WMPJ8IFScH3VLvTdsGPN
	 NsdJmQEaHluUVcCeNGolIxe8CpqgU+PbrSpkPRQp1tyMsGRzL3PSSUb1M+ZK1Cj2PY8VF
	 GeTvu1p4cgW58NYai54i4B5lZYwFZCmppr98rxTctpMjRUlsPO3TD4WhKcKTXi8XoPFxf
	 3hK0GkHU3dNoCGt/Wn5ifG8nLzPQsau1Ml78fon/6eEFIotcHTXamFOXfzPa4pAKk5oCo
	 /tI/ywHsSLTw0cXY5ra+lYOqglB2sjiT3k6m65UjNOl9YeoNSisKY0u8jg2HXWXYFqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792438836;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:
	 References:X-Mailer:Content-Transfer-Encoding:MIME-Version;
	bh=jCMFezbT/OjEFJBH7XUEU5R0jVHmGVvv13z7WJO3X3E=;
	b=S7rAm8UvjW513HcxO1ePSeTut8FU31IFAbumSkh5y9IyCQ6jFvsIJE84uCy4JhfNXeSW
	 6Q/Em/kzzZSR6LzPHAnZzwB6IZn7p2R1A3KiURwSxpDLyz9HrpXjvbULjCXd5IF5asOZ7
	 N7io8PcIq8Grvk261lHwzbVKCP2AsmIvQhSY6moT9Xof3a2Tjhtz7o/pVcnPUhBvyICJ4
	 p1j1UZ9iOhZ5r75xgCfXEsG2rNK77v9EqKJ/5BO+4W7Y8E7FxfvCLQr0PrwLmQTobXauc
	 dhKV9gqr/XkVUefnpb2TzJIbtJqHE58AzGjidARy8BTLoAFcfSPbLWxF5NSGW7MvCHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AwKLsCH0;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB0C606A329
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:40:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CB0C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AwKLsCH0
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e987a2ba0cso20429495ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792438835; x=1793043635; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jCMFezbT/OjEFJBH7XUEU5R0jVHmGVvv13z7WJO3X3E=;
        b=AwKLsCH0eCBDjV+uPmQSwL4hPhllyt3bz/fVOAvm5/kXUvXjTfvH5ZqqwpMjcpWh7X
         JNTxMbWNTnOOwfXbMPriw8L2OXABTAKygX/SZvHJZ1HUu28hcBLfI3idDkgcBZthXgRY
         0eR+LXFb7SEPUh1Yf59T1npD6SMgsMin2amGbSD84ao89WhG+Ue/0EqTaQfQaqACnz/+
         W8o82Ko0xYys8Vw7SK4rYh768XCtXLQJMz6T5e+Ji3fgRQjW6XAAltPMFl7/V0vapMPw
         M/XEL58w+kM5QEI3wTtJJHMYu1JG/ZgGFaiHo2zb1UPw3+bQKTRzCt16qNpTGAPufCbR
         OLpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792438835; x=1793043635;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jCMFezbT/OjEFJBH7XUEU5R0jVHmGVvv13z7WJO3X3E=;
        b=urBkZmVCj8vHoMi5HolkpMIPAuW+tTAZh0kSxQu1sj5hpW+5Ecxvo8RXPkbon7zTEJ
         fBUcuq1zdwCaJUtJoOfvBmDpG85GwmUy9NXdAddtY5wAXuut7wxl/LdILHM1ggWWgFpv
         bYJgvrcD5isGZKpjr5rE2R65sIqxm//X+vFSKE4W4oVVqMEIV1Ro5ffHhXdiDSRBpt6+
         LDq7IOX4E5P3exqIr1COfNAerG5sDJRp7XBvcWE1f96A0WPnVzwvI1IQTTNcpe9VV4fK
         zSa3IVjELG54icBk0byIZVT50bbXYeqLX1fvzKsyMDm3RdzrmXYiD9qonXa7C9qaODRX
         J+HQ==
X-Forwarded-Encrypted: i=1; AKwUvByDQl8wec6PneSZbi30g+Ke2uvaBISNgY/IL1j7FcviLd/3Bx/LzeNB5msq0AIQItIt2UepCdauyG+CO7M=@vger.kernel.org
X-Gm-Message-State: AFq9FYIeJ+RUuhbujc9h9dpaw96B4q2iAsCeIvhxTdMqZD6TQs8qjNbH
	snyw//r5I7C0adBo0uAeuRYYUD7gYqEGKqVIflhNLK/RPQTUl7ug+/BQ
X-Gm-Gg: AYBFou27PZNb0tfqcZorrHEAhabDxxzEbLtD2aClpHmBq2FGh4U5ZzLAc6hZecbNfk5
	fh57yhuyMN9eqAWW4lNQAl6BC5hKYzRy8lDa8CfbtECgqNzM5HTBPDwrojvhS3DxgSG36hTJB2k
	p2S3xPO6AUX88nzJRbcwfdheQZ96WotHiCqFeAd4elPYDfqHIeU2H5oV6kBVh3vbz3VDvLilQLW
	ig6Fvy1Mhm+Hf6bYNjPvv5LNIvY/LUufgcS+NKOqogZdsijfUe13tx0t9kg9RSylKrSFK7oBP4r
	HeMS5X45mje6h61UXw+dUzK2XNkM1jkPs+3ML4HIz7H7HYqDK147hlWU97XKyCvYJPFXzeRh8Sc
	wYLwBEjF/xYWiRKMhbsTTVx8BnOMOT8ZFqOQJGO+BF9wlTReha0tqxbTVPJnMmZTfBaBdy91PZZ
	Q1L4QSSMaXCDvGAngeuqo55A4SIgJ2kcVZqlMUrtXlPPo9BOWYUhTnspzRv9wgin5YPTIezTmPt
	ITIFp6As9AEv6oxhsazjAzxF8bDbU6gy8SUPa/woO6/0/WOPEwqTBQYvI6rej/66qHBHs5xWv0j
	tpyOZIHHwIAwLQ==
X-Received: by 2002:a17:90b:4a03:b0:3ac:6e91:3f14 with SMTP id 98e67ed59e1d1-3acef134d44mr8271080a91.22.1792438835344;
        Mon, 19 Oct 2026 12:40:35 -0700 (PDT)
Received: from localhost ([153.61.198.253])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc9942956sm7478188a91.1.2026.10.19.12.40.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 12:40:34 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Oct 2026 19:40:33 +0000
Message-Id: <DM92JCFA4X4U.30MTDH0KCPTJ@gmail.com>
To: "Michal Luczaj" <mhal@rbox.co>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu"
 <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa"
 <jolsa@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>, "Ihor
 Solodrai" <ihor.solodrai@linux.dev>, "Shuah Khan" <shuah@kernel.org>, "John
 Fastabend" <john.fastabend@gmail.com>, "Lorenz Bauer" <lmb@cloudflare.com>
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Sashiko" <sashiko-bot@kernel.org>, "Jakub
 Sitnicki" <jakub@cloudflare.com>
Subject: Re: [PATCH bpf-next 2/3] bpf, sockmap: Restrict iter-context
 sockmap updates to iter/sockmap
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
In-Reply-To: <a9ba4549-4bae-4516-85ef-ee38f13551cd@rbox.co>
References: <20261016-sockmap-update-limit-iter-v1-0-23fa946db59e@rbox.co> <20261016-sockmap-update-limit-iter-v1-2-23fa946db59e@rbox.co> <DM6O08VBRY20.1PFUYACCZ38JL@gmail.com> <a9ba4549-4bae-4516-85ef-ee38f13551cd@rbox.co>
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

On Mon, Oct 19, 2026 at 08:20 AM Michal Luczaj <mhal@rbox.co> wrote:
> On 10/17/26 01:52, Alexei Starovoitov wrote:
>> unix_state_lock() in bpf_iter_unix_seq_show() was added only for
>> unix_stream_bpf_update_proto() called from the iter prog.
>> iter/unix cannot get there anymore.
>> can we drop it ? can be a follow up...
>
> So we don't care about having a stable socket state while iterating? Which
> is the case for iter/sockmap, but is unlike iter/{tcp,udp}.

Not sure. Is there a value?

> I'm not sure I see the (stream sock) issue above. psock->sk_pair holds the
> peer, so peer pointer remains valid during proto update. iter/sockmap is
> safe, because sk is held by RCU. And for iter/unix we currently take
> unix_state_lock().

got it. you're right.

>> Should we restrict it to ctx->sk somehow?
>
> I recall a discussion about having BPF helpers accept only trusted
> pointers:
> https://lore.kernel.org/bpf/CAADnVQK_93g_KkNFYXSr8ZvA1fYh4hoFRJCJFPS-zs4ox0HhAA@mail.gmail.com/
> Restricting only iter/unix seems better?

we just discussed at bpf sync meeting that it's time to
finally remove plain PTR_TO_BTF_ID.
Otherwise we keep hitting this bug everywhere.

in the meantime can we do it for this one arg ?
Mark ctx->sk as PTR_TRUSTED in sock_map_iter_reg
like iter/tcp and iter/udp do ?

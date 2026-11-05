Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793921006;
	b=lBVxP9YIBUMHc49zVwZPjRI/hHpWCl1lfTee+wxNKQJXVFH/JaGX7te7SptaSnXDKPTh
	 UQNRSmjW3nuY29qVY9/D1cyFTGsnIjzi/BrPgGaGqcQpTNTUzR/LqAgQNHq+Qf8IcSATY
	 ZvnnADSgY1AJrYEfXPBoK+80BPoGiSUjAHE87BdLafb4wRKCHloIWr7NnXFfDUW+yl1nF
	 P28VeEzQTOD4oQaQUKFGyF08Wd7dJjD4ZCYlN8vePvBkj+LTldLANmugGpr0bgnn6aazm
	 2G+0qqA60z72sIJvA9SKPhFirZu1QuqzVhsZSOUFx5fAoTHnpK3yO1WGDvLPv7DUGPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793921006;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7a48SL2J6QQ6m+cZHRMVykFklMv/YM8YuhePjmhR4UA=;
	b=Dwm06g6v8Mbw2WrMd7NQ7hlsR+XWJR+uZdUIb7LKJDEVFnTF5u3DnrQsYxHrHmHrbAfn
	 +G1yirN7o9IWVpckeX5FEC8XwMRaoMQYGfYqRSG0ctjMyK1UPNd7+7VqRR7FqNTzVftXY
	 +eLz70H2GmVrbWngT02pf/l1JnaSQ/7u39h4XbkznUEJh1TeRCWQmOH46ZxBbFWI4OvF3
	 x77r7GqQGkMke+ThHvWSchngWsfvpcDkgjn1INcW0GCBCmLrfJjEaHw9KF2EFT3cDW8nC
	 M86WOwUTcwF/eUGRzJ2HWj7m4LlPTSvmerwo4gPLCq7t+f45uWjaOI5rzfn3ocTjFuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=d31fr3Kr;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B364B606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 23:23:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B364B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=d31fr3Kr
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4c9abc1824so7167066b.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 15:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793921004; x=1794525804; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7a48SL2J6QQ6m+cZHRMVykFklMv/YM8YuhePjmhR4UA=;
        b=d31fr3Kr5hDPBZJNWhNRAPiLHMaeY365aKphN719Wa0YimBeyCjkj5McXpcYvfbGTF
         4AHs1CrXc9Ao/6/qQyzIKOf3HLULlbWntHcPc++fyvszH7SMkRS+ll6vRywQrq58/kBc
         PFSQzyve9Fbt9pV/+/Tx78ka3jfumU8tyCsxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793921004; x=1794525804;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7a48SL2J6QQ6m+cZHRMVykFklMv/YM8YuhePjmhR4UA=;
        b=fnvuaj9z+9O7M4pA94ECzN/4XfHq5CQUVRCp3xVdCTYME2dr1rdT02rlel/Iwjp4v4
         Z+w2sq+Qf9LLANyTGHY9x+WQEstrMGwB1/U7TheZQlWrxF8SqjvIpK0i2TCHIqqgJmn5
         y7yWRGyBAJd3y7995H5r2RmhiE9na+DkgiI66thzJCr6t3tn4K6G7rcAC68Zi9frspBM
         p2WC+2OgA57X4jElecpetW6mosqgT2FoR4MGEIZ5yM5eQXytcs8ZDkyBao0jD0N1jqLV
         2iTb/fm2gVFa4u6g8IXEDwYEh06Mkb9ZV6yu6CGroOrmvHlZW5r4Eio3kO1G5zAITlXN
         ZY8g==
X-Forwarded-Encrypted: i=1; AKwUvByBlMzeMGlySc3fd8fI0oP+iXv9cx9P4b9cUH9r45BVjEwi34BN+6RqCJ37lW06hnxB8QaFv8JmzIhGMjw=@vger.kernel.org
X-Gm-Message-State: APuU4Z89uQ8ed//znngOGjl1LNQSPVgR5wqHRo75yRAIp0DMQcSHbpN/
	RKj3GBJZJzAxjDZWxrwA8kED/hPGWV83+HeUafyGOG4tRcBOR0K2krAoNqkUDimcnwttbGSB2yt
	+1WfxOVGx
X-Gm-Gg: AYBFou3EA19UALDwDl45v+CF6K3M9OMz5c+InSSN5KaRP7DvTR83+SWd2eVQp39pwAk
	sNDSLv7gDwyUqtiyZVFRIj8lqbNi/vpY0ziDxhSx/QAcXs8flFZM3mAODU+dyAzyvpLylSqC+YO
	WvvqICHlSNU9/MrZwJ5vyjayVh7Dx+pvOOfEN58iknhm+90onfvph/DDKXHZnrrzvc3DRBfTDft
	SKEB1YLYsvaNyv3RmHMcZSTiofIwf8J0Hq9e8JFtZDz0fuc2u/Zq9t+HkMA//AEjU1Yy8ZJGxLI
	0maoVtpfMOhGJkIwJh/jAMBK/SV7sbtVQjqU14pR8E3w61w+pt/+5BU7WgsaXxFAJnwa4Oi/kHO
	ijhmJmRchOBHmckq+CDao4RbJu9x849HBN/A8UWx4lx8w8LP8lZzqgUhQae/uYgLogrIiL7OHzA
	hN3iYjtgH+wbfvbx2oZGdNAaKm7eiFgGXVTkkw5cGLxUvNxZXnTvlcHfCHZBjxbaiEkgnnkXoWI
	KHFYvIqDg/mXVPSe4OJ/Ko6557M3taKtfFXC/nr4gtr20gVQ9tw1PV1Z+EIP9VUb4gLCnWTZshp
	SnY6UV6n6Q6Yb+d53A7+7FXTzcvZ6Yfkpjy43YJmqh9fg2aRF5UV0/BJI7FGTLeRBDgmpKPoI39
	BAg6odZwsdoLl
X-Received: by 2002:a17:907:1b0a:b0:c34:e9fe:82ed with SMTP id a640c23a62f3a-c4d3530f014mr69883166b.28.1793921003997;
        Thu, 05 Nov 2026 15:23:23 -0800 (PST)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d3569f15bsm25371766b.49.2026.11.05.15.23.23
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 15:23:23 -0800 (PST)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c450ab1483cso5992866b.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 15:23:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwUmS0/fUctuj/sv2wIWzPudBjEDb9wUyT5DjvsNXTiSqrsf0145khbg1rUZxTfEeM95ABYqdK6A3Of6/E=@vger.kernel.org
X-Received: by 2002:a05:600c:4e14:b0:4a9:18f4:925e with SMTP id
 5b1f17b1804b1-4b6df8c9443mr8848245e9.18.1793920627925; Thu, 05 Nov 2026
 15:17:07 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104174554.1.I8556199ea4f1335169ce16e97309aa63ae2e2310@changeid>
 <20261105052401.GA862715@ax162> <CAD=FV=Vx4gHvF0TegRBwZetTNjP5AsjbBK9+sjNA43OpL1Wjiw@mail.gmail.com>
 <CAF1bQ=S52KWHopqxksctbBirFEr5Mz1dKKMAoWh-dqLHii3Nig@mail.gmail.com> <CAD=FV=XE+KuTDCa3cLOsHPfQ9ngFOXrokFbxr=jDm_UFwKdQDQ@mail.gmail.com>
In-Reply-To: <CAD=FV=XE+KuTDCa3cLOsHPfQ9ngFOXrokFbxr=jDm_UFwKdQDQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 5 Nov 2026 15:16:56 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Wow=+pDDu=RHkr5nekOjDNe5wGr+WsV_WFgh4YYnm5Hg@mail.gmail.com>
X-Gm-Features: AclHuK979bKOyfBMwiTt2PX8WJCz_unHupEnRKfbNiYMNWMSzKi0DQ3cEAIAtrs
Message-ID: <CAD=FV=Wow=+pDDu=RHkr5nekOjDNe5wGr+WsV_WFgh4YYnm5Hg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Enable -salvage-stale-profile
To: Rong Xu <xur@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Han Shen <shenhan@google.com>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Han Wang <nesthanwang@google.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Bill Wendling <morbo@google.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Nov 5, 2026 at 1:30=E2=80=AFPM Doug Anderson <dianders@chromium.org=
> wrote:
>
> > While I haven't looked into this specific bug yet and am unsure if it
> > is unique to FS-AFDO, I recommend using -fno-sample-profile-use-profi
> > to disable Profi for now.
>
> Interesting. I can suggest that to the team digging into it and see if
> it solves the problem. My AI agent says it will though. It claims that
> the default flipped recently and "-fno-sample-profile-use-profi" will
> restore the old (tested) behavior.
>
> Should I send a patch adding that flag?

I went ahead and posted the patch:

https://lore.kernel.org/r/20261105151159.1.I0b27923381ef34cc99cdf8b65fea2e1=
bafce6370@changeid

Obviously that patch and this patch conflict because they touch the
same lines of code. If folks think we should still move forward with
both patches, I'm happy to rebase.


> > Regarding the "--mllvm=3D-salvage-stale-profile" flag, I also have
> > reservations about adding it for the following reasons:
> > 1.  It is heuristic-based and not enabled by default. I am unsure how
> > thoroughly it has been tested, so we should assess it further before
> > enabling it.
>
> FWIW, we did find that Android seems to enable this globally across
> its userspace, which suggests it has been fairly well tested. You can
> see the change here, which landed about 1.5 years ago.
>
> https://android-review.git.corp.google.com/c/platform/build/soong/+/35242=
91
>
> A few notes:
>
> * That change _also_ adds
> "--salvage-stale-profile-max-callsites=3D2000". Internally, there has
> been debate about whether adding that would be a good idea, too.

The conclusion of the internal debate is that, yes, we should add
`--salvage-stale-profile-max-callsites=3D2000` too. So if we decide to
move forward with this patch, I'll send a v2 that adds that flag as
well. For now I'll hold off until there is consensus. :-)

-Doug

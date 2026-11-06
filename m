Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793988802;
	b=qYR1RBfSHVzPszXzPF74nef9SkPl9Tbmpgg75hQVggiVU9kn/389f3oGWJsKdHwPrNy8
	 fgWQJZ1RchcWMCNBfQ+JygvunLW9BICHo52lFw6uOtImJspv4p4m7Uk29NiqxamrQYMi+
	 EH7SQ57vjiz9XOFZckXWdCNPHwM8k6Ly6/HBlgJNP7+lombb+1A374+1OBK5MBS+iSs1Q
	 Q54IGw7/ZZMec5V1Vsx4d7/e4akgnHg5dRRHmOwv5S2i+IdKXpTuv/nwdhp8XPcolSzyl
	 y1GVM8NJFbvZJdqw7YWHJIXZbaF4P47Ey3smVkxo3eO6popo1tRpIV+NGdEFX7m0OVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793988802;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=IN6twHDIaLh5ilgymQBvZ60S6ffcPsE8wQzp8ZyOj44=;
	b=uoYi4QkaYM/t/ZMff94KtEFDepZ5qMDqGS5kX6fBsPNCzv2GcQCK03EZfj6b9ltp34z0
	 wXTsXp1rV4Sh/cXNGczG0VQ/ebrpOUWF/SQ/isAJxlDyQsvxFZhEeGNbL2MyvLCa+VLU9
	 f3KmnXzxzcxyrzgmKRaW9Yr+SSYSCPQcS3pQtb3phI6Iin75TAQFPMyELHRLBgCsIEMuK
	 mHHgNu6bbyG8Rf/fB+/IyU3bI/iIP1efEgz8KBQgk5AEgBGF6TF6tZXiofinOr5Mk98lv
	 tyZ9aOEm8VmuytwtuBOxKcDNae0C61oUR2bwSmM/z3A8Rc4OX4+oZi40gk07PrTb1wA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HK0MPhUQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E241606A330
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:13:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E241606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HK0MPhUQ
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b56c90b38eso4063a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:13:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793988800; cv=none;
        d=google.com; s=arc-20260327;
        b=caGyuluidfL+/brgXFThSCtEYCzVTQvp/GtaRQEhHsGaNbvD4DYpPiCMHKQ8L4yJHF
         gS/xvVXG7h4n4sINuF5A6llqCDUTPXor/RtUT8tK5nw5Zrm4XEuPi9gxwjc73NYEGfcf
         0q64+rlH0CjMl+YpI2HUMGrXbbuaUW5B+U0l0y5zEeaTKdYq4rkAVV5DqVfc0bsmsgj0
         XFAROr5YE9vYTsD/iy+GyDhh5T6JALKyGgdQB3KL+uLV37hOStBxcQCva+OZmi88UKXp
         W4KTDvekhdFHTESROsRq7x+rUS0RNFF0t24N1LfHVmCglJF5IYxTYzATZYXusqosmPYM
         tpCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IN6twHDIaLh5ilgymQBvZ60S6ffcPsE8wQzp8ZyOj44=;
        fh=h4SQe1Rdgu6b4VYXUKXcwefwsN92NB6AsBj3cMBdikk=;
        b=CpGrQkwPBPrYWZG5R+yZAnW2PT8AKaff4+c0KvpmYFv0eRJSF4B/OTrUEVLU/cWDEG
         McvLedimSQ0dTMF4Tw0L+OpxW/NF0EUQcZ4DC68ok9aol7/YsbIwaQqvpSWlSn0NYPPM
         bm7HYgdIgFsQg0Cad5Cs1BVDsc2N/nP7HyfvZvJ0zQ417MU11mr7J9ZMN0DFZdlXLWOi
         beS1I5G6idunY5vt6mzAis4j7nJLPcvw4XTbrGOHBVajgkKmsjIo+0/C2YpOvnMUTkmF
         9ygB7u6qcCXQdTmE7aOe7fqZEWthbd2/lYinefTcmrCa9k90ds3Rvk44vE1ULpTOly91
         NagQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793988800; x=1794593600; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IN6twHDIaLh5ilgymQBvZ60S6ffcPsE8wQzp8ZyOj44=;
        b=HK0MPhUQzHBTjawDG9wj/rGTowNv2I3dyGJsb+J1METmvGduXf48+rJVnSO9OKq+s6
         Ggq7xoI+tRy4YkdyzDTLDFnVhO8BHrYRtqanv96INfwmwgky3tHXlj73v2/UrtdzS4oi
         fvmX769ugnuZrNKQC1yWl/1FVlPcqZT5A/QrCWkMOt8hPMa8nVqqXxC0RV+eqwUKGH29
         I2DpcxlxgA+q8SwxGHbQ/lkyWHs3uJexUH3dVFQHeRyME09v3Y3L4UmNITZdnpz/moew
         1e3BZH9cM92NF71j8BFrR26hxxaSUGSuWfg4M7kA66b5sm/S/+sEWZC2zeDDnkgZyxNP
         LXkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793988800; x=1794593600;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IN6twHDIaLh5ilgymQBvZ60S6ffcPsE8wQzp8ZyOj44=;
        b=09ywUcC+LE4xEazBQrftCHye1AyeRiirNTZUTOIJdNCshrDPmGKumY2N1PCaSkFD+5
         D0bDHAiZ/oiTwML2A8GOrbSVTIlnrYocWVWrIsTRJcUNDBJY9gBGFkQO1FHN+kBc8xHW
         efVQc6ejpHA50DWNWxMfed3ax5WrFGi3cNo6Gc/IMUhl7II0gkOA6VGxOqGudOYLeAD8
         cToAiNwtkJxV7z/yVDVNIGyAsRHTw6XV5MyQi+Pok3F1iv2yY8cyUvzGmKp1efG3PZoJ
         oW060Dp/fRpeLxYo+ZPIQeI/vV5IeGEWyTV++IfpsY1JDw/T7NRCqgvlXefItjC4ticM
         rlnw==
X-Forwarded-Encrypted: i=1; AL+hErEFz8furM2DhE+zs+kmscOhdWU7S2ZiRRHsqvleMlPqZv1zNChAgJ/kUaDQDq1NPwIjzsIZtnssIeVTrSY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qiUfpGXadIxNk54tocTaTyO1xR02kRhDnuJzGD9fVeceEOfHs
	uvmxQPppwsrHXMepThYYGd3HBMjvamQv9u8R5LCDNnnvu0cLfrStEtxjxuXkQTbIZTIk342RXEI
	m1iSOU3/ryBfo3JD4RtDylXldtVIPaxdhuFwGalhM
X-Gm-Gg: AYBFou3fD9b/6ooducMqVBgXQv3ltfps1YU+QXUC2dgXg6eNkGsk7TvkU4R+vCslZSI
	9Msfq+/r2pgYft1ktZlUx3Q1aFaCZqwEFeE3BQVn2oBYHJ5yu/t3sGv+3NZq9brzuTPuknsN+uS
	UowrYODDtBy+UF+9OOAa38KwMU51wDE2sXld66U5uwNTZa3Yx40z1KRIxWUe5vhTgcMXjpnHnrt
	tj/e25hXwqNvLRLpgBMP8twCXNBi3Bq8dTBOWn7myKUjlHwXPe69mbhHKEY0y/BqAp9ouo2wqyo
	j69bt5VtSCdCDjvHjCnDCEj7/31ZNnM42CDpZmhX0sJqh4V4fMnTxfrTzSQTZYXUwd9y7aDohks
	v9b7329sbspS//9ZpfLm4nQPje4MVXZV4NkZIuAY7VjlkMD6GhXGzyBl6C5F5D7JHr7fEzvKbI5
	lNBa9MKM/af812
X-Received: by 2002:a05:6402:4025:b0:6b5:70a4:c77c with SMTP id
 4fb4d7f45d1cf-6b6f8405023mr6118a12.11.1793988799653; Fri, 06 Nov 2026
 10:13:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105151159.1.I0b27923381ef34cc99cdf8b65fea2e1bafce6370@changeid>
 <CAF1bQ=QkGntJu8G67ssH2dS3Sn200_JuYitjtAfNPBu_hn0fZA@mail.gmail.com>
 <CAF1bQ=QiP4fb-+Kn8wzEH7wqjAjZaagxUd3sYpv2SkwDcnFPWQ@mail.gmail.com> <CAD=FV=WGKOnDoY1W7CuZw=s3e8f3jrXzkJ5_Qp_Y4WfT0XwXDg@mail.gmail.com>
In-Reply-To: <CAD=FV=WGKOnDoY1W7CuZw=s3e8f3jrXzkJ5_Qp_Y4WfT0XwXDg@mail.gmail.com>
From: Rong Xu <xur@google.com>
Date: Fri, 6 Nov 2026 10:13:07 -0800
X-Gm-Features: AclHuK8M7aEN7HUd8VzCV7EfdL7Os2jiojoMycd1W00kFFu83GOEk2kpHYqCCkk
Message-ID: <CAF1bQ=TWZ=u1h92Nt9NgGcaDNTo=BOHmUp1DCWEeUMfwBb3WhQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Disable Profi (-fno-sample-profile-use-profi)
To: Doug Anderson <dianders@chromium.org>
Cc: llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Han Shen <shenhan@google.com>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Han Wang <nesthanwang@google.com>, 
	Snehasish Kumar <snehasishk@google.com>, Nilanjana Basu <nilanjana.basu87@gmail.com>, 
	Yabin Cui <yabinc@google.com>, stable@vger.kernel.org, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

As far as I know, Profi is enabled in the Clang front-end initially. I
remember reviewing a patch that enabled Profi for the Rust front-end,
though it's possible that has already been merged.

It seems strange that these flags diverge between C and Rust. Could we
add a comment to indicate that Profi is currently not enabled in Rust?

Rong

On Fri, Nov 6, 2026 at 10:06=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Fri, Nov 6, 2026 at 9:43=E2=80=AFAM Rong Xu <xur@google.com> wrote:
> >
> > Just one thing: I think we should also have this flag for Rust so Rust
> > and c are consistent.
>
> Please see the commit message, which says:
>
> > RUSTFLAGS_AUTOFDO_CLANG and KBUILD_LDFLAGS do not need changes because
> > SampleProfileUseProfi remains false by default in the LLVM backend and
> > is only enabled by the Clang driver.
>
> Is that incorrect?
>
> -Doug

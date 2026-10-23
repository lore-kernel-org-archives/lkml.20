Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792768008;
	b=2krje5LOOWhN7XZutGDdxrpJaew3SNXRFp68Sn4QhOP+afd4+1jHfgKrNhHO/8M6nlta
	 mvHLIxx9AlfSAXS0aJ3iAggQvqcJpG1lzTMkVBODW8XVyJvQVhJc6CP25yZIJ3aOB3HVi
	 kRBr0GOrAMyiASyUwT67TsCZXN6GTFMoyPbVVQmOz+kl+4gw5VAZJvXxfe+V+6hfJgM0B
	 NOAX8ATEXg0LgL+pPpkWr1do87igxdBftXSEeCXJmEGKGbtA7+pAnKRaWjOI1uYJT2nxb
	 8+PwRcM6BpTNK+kFEbiQ/0af52LKGkF5PoxM/anwvEIGHC3Ha7JQIl4kEt7vy9Yizfg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768008;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zNW6XYlrtwS8sApdzcwbBz0IcIsSvhwmpXIKiapenBM=;
	b=2qSAjrECvI0bWP9kJqh9rYFvWOjM4j/bEJHguvL4v6Hps00xqnZeFPW0lHaA3oWR82un
	 xzTOV++ykuGaYoVRZwyiTGHrcdYL3rguv14QrupxS3vEfWty6G6KufV1n1kAXZaZpgeG0
	 WSCNCjS57Bb1OzMhQrypGBrvwfjhXulhv3byyBI/OBtmkgeB/hD5Gy9Y7FZWDFfTRvNxg
	 N54kSY/JYSXNkQLiNs6tKVM2VyoVk8Dy/50wJyAda3Lmnwca+oa7oJTSyS+5xH4H8t9TX
	 l5wyjqavnrE7/SR13SD9j9+hOHZ4PxXNVV5P1SCvtxDKji38i7A1QCN/XW8aNgNZRLA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=KVJ9FXKu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA9A606A320
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:06:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BA9A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=KVJ9FXKu
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b1b12de661so12628a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:06:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792768006; cv=none;
        d=google.com; s=arc-20260327;
        b=SRL67RBlbUbN/fMzVAtbA16vtaU7iKjRYt0YDQAnp7dSHseWXfqOWuHdrrE6n8blH/
         ZUBYI7/NakmS/CFN1S255VZDvwE6an3fNoaPW1YZnBJz2RX98TrDRd/k9Ui1ciVlBn0T
         sPJRDQIEC07Y88GIUTYv31wTGY1/2AE0AOn8g5zX8Wi/WpSO04NI7VcwF+mBoHlCt/c8
         unTC494e7yAZX756ft5rvqHfcfo4z0CfyPcqu5x7q2ivVjyZeLhGl3scortaJZsjdYNh
         4f94zKpde9lZuqAqosTdQ1F8G/FQAXUnZ2jEXCmH1T3TBvnGYJ8urParKbyhxl/ezY/y
         ajBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zNW6XYlrtwS8sApdzcwbBz0IcIsSvhwmpXIKiapenBM=;
        fh=Sp2JIPbo22DsRm9tzrTz12UmzS3FTAoyTHrTT8KzMLU=;
        b=B26q3UZ7AYw4uq8MGRGIlsvyBz7pvcTIDIogSGU9swdjJpF7ey7uFfvJSSLmN9UtG6
         pFGhOoZQmeDqimEfEC/euiro3QjfvUs+iP2vJCbBnM73pd1spEqqN9IkBWatpoH5L283
         bQI2vJt9w/eDIvdfAaEQjMeOSYXbNm3VBy0Kpj601DInvKg15FFm0TiOsnbb6FQsjTm/
         bblOmytygzt0h5cd6W0PBntjWTPfAyMoAlSXb2jfJc27sJc4l3I+rL9lq34KI2cOaNkd
         07LRB0UeaydMXZSlA7P2RjrGmT4uXyn4yb1OGUdwhokUshVFUDWlVXxi88T5V/JjefqI
         jAkw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792768006; x=1793372806; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zNW6XYlrtwS8sApdzcwbBz0IcIsSvhwmpXIKiapenBM=;
        b=KVJ9FXKuxZw9511/Juyf4W9Ir2Z0uLB4exJreByU2W1txP0+Hq/3sBLO0/iYx2G7nK
         lyl6usjXdqPwD0cI1SmvOg4V1aylyH8Gh+SH8JlzdA/9/ZJZfnE06F3M1g+JlmTR6n4j
         ifn03DAI+dswyUbGsOHxei7RWVQsTJeoTJWvtHj0B57Nm6BkutYTrA5rS/hpTHxlOTVR
         BwRzz0ZKJjB4KnZ2a3ieSu2N60QZsTsTwgRfGKnOAHVttL08H/YlMmOgwo9r1nBjAcan
         XUM8S2YsyHtSYuB8sZ/a2+/N5QlVaB0Hi+kBiJqOIHYjVzMyIfU/ckwtLYk9Nz15a0V1
         l17w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792768006; x=1793372806;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zNW6XYlrtwS8sApdzcwbBz0IcIsSvhwmpXIKiapenBM=;
        b=HXMvgd0APKpvgx5d8hlkxTPrX1JO+MAYyCgt3swgDMse9FxbFXsqmB+LyPHnz189kk
         oVSmPpUfkhtzfq6qL3wU0h6AFeyqU3e3QqgIHxpnoZ0BLiIANd2hJ/8vOFnuCw0i0lxJ
         dXh9M7gyrZ18ffHOFGqidVCjE35iWMvGUoJKX2cB2M9JtfLx7LLkYbAnOfS99TuENGdt
         9aMmGMhtaLD/qS6zeyrGRqoPlsjC51br+xvRuRXqlSTF68d00KWOrlTIYO+peTx+jYmU
         D9lW/zDFHfEttLxUTkB+mJAdDAYR8kXCPy4Xmf23J/Wq/0rP7KJ7eyG17Nu7l4HBHD5b
         zgBg==
X-Forwarded-Encrypted: i=1; AKwUvBwiHsoISdVJwuvN7RKMPKdhpJaT7da0NvZJ6jWIj7TrBwk66KEtX5XeLGew4UQs4iQfsxVIQ1wDYJLEU4M=@vger.kernel.org
X-Gm-Message-State: AFq9FYLhPqjfjU2Wut8FlU16V/AMWMKtOl8g8zyQpUGSsxhzrMsTgLTM
	XHL2DE6NOt4Yg40Wl4havHsp+2u7hxBcmNmf85UQls/5VgVCqn4/XTQx/NKb3eRQvS1GC8Vgy9k
	z+DPIlypMWYxtC/Wf90OxRstzLqynAjtAqped+Npa
X-Gm-Gg: AYBFou2Xd0YfvOA0esnPjqGqp49/oMgE+AcMpn7PgB76rFmXFK/884FSFujMpAj5IV2
	XqYxI617YcH48mG/+ndZIQWemTG8njPJwDnQHRiOnpORnXmr7V0aF42ctiEwmf4YSxNQGzL8s7q
	1WlMi5ZZb1TOp/i/fFU80vf7ytP1s2LJb3sVaAygLLIlgh5kv4fw0iR+/XSCvzTMHZmYs0rVvwF
	L3373hqVF2yDdOaCMdd7DAslIoRqBhu2rsHjCk4gi6491tJDJH6lOTt4rRtLgg5eEYKfCibSKWO
	x/GD083eaHsd6k1lx+rLfHH7/H1Jvhx4EbrTNPanKXyTisNJhsapp5kPkSQw25R1Bn9BG6p37vr
	w0T+HeLDlevv5EoO2fdcAGLKCcg4BDf6CU8uWGReznUS4wEbJdzStRp/B+cTntXNG0vdVJtE+MO
	8J1exh9gBmZ0mk1iN9t0O/Mx0=
X-Received: by 2002:a05:6402:44d8:b0:6aa:babf:adeb with SMTP id
 4fb4d7f45d1cf-6b432d316bdmr68184a12.4.1792768005447; Fri, 23 Oct 2026
 08:06:45 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <tencent_31D2FFCCE76C50A695A1270151F825E90906@qq.com> <af2ec5b0-7c62-4c6e-a28d-33ed401020af@linux.dev>
In-Reply-To: <af2ec5b0-7c62-4c6e-a28d-33ed401020af@linux.dev>
From: Neal Cardwell <ncardwell@google.com>
Date: Fri, 23 Oct 2026 11:06:22 -0400
X-Gm-Features: AclHuK-H_9kcDdlRg4oJIo1R46Cqrg9YXsq9lGWJiBUgtLV5WO5v6PEgZsMeA1Y
Message-ID: <CADVnQynhY17Romr6VvzAyq-9h1zQ8gd-+pfC+1qFtz8xRaqCYg@mail.gmail.com>
Subject: Re: [PATCH net v2] tcp: limit tcp_tso_rtt_log to a valid shift count
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: Yingjie Wang <1075151112@qq.com>, netdev@vger.kernel.org, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	kuniyu@google.com, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 10:50=E2=80=AFAM Jiayuan Chen <jiayuan.chen@linux.d=
ev> wrote:
>
>
> On 10/23/26 10:40 PM, Yingjie Wang wrote:
> > tcp_tso_autosize() right-shifts the u32 returned by tcp_min_rtt() by
> > sysctl_tcp_tso_rtt_log. The sysctl uses proc_dou8vec_minmax() without
> > an upper bound, so it accepts values through 255. Values above 31 make
> > the shift undefined.
> >
> > A process with CAP_NET_ADMIN in the target network namespace can set th=
e
> > per-netns sysctl. With CONFIG_UBSAN_SHIFT=3Dy, setting it to 32 and sen=
ding
> > TCP data over loopback triggers:
> >
> >    UBSAN: shift-out-of-bounds in net/ipv4/tcp_output.c:2264:30
> >    shift exponent 32 is too large for 32-bit type 'unsigned int'
> >    Call Trace:
> >     __ubsan_handle_shift_out_of_bounds
> >     tcp_tso_segs
> >     tcp_write_xmit
> >     __tcp_push_pending_frames
> >     tcp_push
> >     tcp_sendmsg_locked
> >
> > Limit the sysctl to 31, the largest valid shift count for a u32, and
> > document the accepted range. Writes of larger values now fail with
> > -EINVAL.
> >
> > On a UBSAN/KASAN build of the net tree, values 0 and 31 remained
> > accepted, values 32 and 255 returned -EINVAL, and TCP traffic with the
> > valid boundary values produced no sanitizer diagnostics.
> >
> > Fixes: 65466904b015 ("tcp: adjust TSO packet sizes based on min_rtt")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Yingjie Wang <1075151112@qq.com>
>
>
> Reviewed-by: Jiayuan Chen <jiayuan.chen@linux.dev>

Reviewed-by: Neal Cardwell <ncardwell@google.com>

Thanks!
neal

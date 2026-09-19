Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8885245D932
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 10:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789812611; cv=pass; b=qM6cXbmQzOJj6b5DFHeKkhsZRNdHwIurR7qBrvDW3hKzQBtI+VBDvRqW6lWAadREp9ShjRCzXPFyk+IEkA5gCAxfggtHa3shHiG7q1ibDu0UFvUOFCcOI0HHpvCMIAw7eFCnVn8tXOJt3jJy96A33ZlQCfF59PLOnkWdS4SC1Is=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789812611; c=relaxed/simple;
	bh=qEicP/EnbFKWWC+ZMFHq8A8CUaY/UPf7WAOaWR3gYSs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mb/kgkjrrpVseaCFvC7wdQohx3M7jpj7NCsAdTceIuWCXPBbZd1G5rZ8ADUODbli+Xxry8fLFoVUEXpJKHbZtZJqp/qvrguRz5lwiwyQ8jpCxy6UHWSm7aKSybncmYFsaBVnV1Q0beEG3IAqYrAv5qwzY3usSREQf1UoSscPv6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com; spf=none smtp.mailfrom=mojatatu.com; dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b=sPG3wXCF; arc=pass smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b="sPG3wXCF"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-868cfc5c244so892352b3a.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 03:10:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789812608; cv=none;
        d=google.com; s=arc-20260327;
        b=OYl9IusA+pYD7Hz4Q8W1yLj5UsKLkryqgdEapvWYszmbdrhK/qmYn0sfUW0QRXoGua
         xaQ1NqBojdMXnoQ8q/PI5o/itesbtdkJDKKpJtCyDmyTyHjy1+nI84onPwiQSXIUnYhv
         yZ9PfGtWro8leP6g9Rg3iQME/gjt6LcVjaPwduy16doxh7GNPHDGdPcXHoSXYMHEFWpp
         KccucIOahhk/Vglz+RjPtKSC0gLBBeo45e7Ljx6kNS9O2mbUuI50LiAx4hHVql95vNCE
         dVT4qpvNvuC9wii0C7XHY5O0DrfFKz+yJv61g6eEWqzz0V5ImXs5hYnPcPT4BuXVbkbl
         s0WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RYML6Quodf3/gZskF5KoxX7uYmVV34bFJSRCvUETSK8=;
        fh=O1uaLS/P57cGFdszr2IiUQ+sKLryGpQUW3KnMIfKQo8=;
        b=IRAoxNvvKj1xYQ789GoIrhDlYfr1uz+d/wY++VJ9twx6ccSQCxWfHiKBknu2vcYAkb
         td/FLBqyOdI7jggQeem73ilvfKLD0dGKNaE76852O4AtoQ+UVhAJbN8+VvGYKZn4vCu3
         ob+A59N2CL3ri9orua7IuBfBBFxggqOtcjeinKE3BzFLevm87R+mI7/f0/3DSCJVDjuj
         5YgstBaak8HVhjtzT5pV32RzVqNkpfTKTkE1pgQxp7y7xLdM+kQvrUY9SnQvmdr4mkDp
         QV2R6bAqlE6WgucAwlxh7tYa7+uwHadCqoGhS57nxFy0aVBGT8zhQKCVg8pe4aKleJs0
         B/hg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1789812608; x=1790417408; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RYML6Quodf3/gZskF5KoxX7uYmVV34bFJSRCvUETSK8=;
        b=sPG3wXCF/v9scsAvB66dbOuFkbhd0V/Q7BsmBwuEwlUEQUVwS4Q6ggTf6tdIw4J0Yt
         ySEaNXznCnUO/xYvQB3WFVY6g2QhmcbB9GfFW/ehJhEUD9jsuj4v60DE7puvKJryBE0W
         Beysy2TxHm/nFKs+MJThRSoEmB6w+6OyJTZ+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789812608; x=1790417408;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RYML6Quodf3/gZskF5KoxX7uYmVV34bFJSRCvUETSK8=;
        b=eHMS32qoSty7n8m9IxwJuLtuWzkNXudMueE09BETHHoESX9yg6zJhIbVDCkWRBu7Ly
         GW0BfVsZe5Faw9s4i9SaS0B4Mb/SKBe7XD1rX7eyJsaa6taD3hD4MzBnz8VpBpDVwW3c
         ImcJ0C3+i4W2jIHslvzQ5YKWn7hcu1CFDgpSBWygw7aTP6bBlbvQ24dNRxITmc0j594X
         XZpHFvwr2tNzhDctsTleUowuF6XJHm2hL/wIEur/+vzMH25cokm6JZdo6otXMrJlMW6v
         GU+s4R8AwdBHU1fo19iw/PppClBDnMxQpgnD75Agu4M6akfN/wpHZ0yy3b7WdHqa6rEt
         WVYA==
X-Forwarded-Encrypted: i=1; AKwUvBzR0V3oxLUlELQk32ws1htFpQVt5zbhMljFMO7ypKNQOj1EOyWSwLKSICpg8u7zF5TiGpCZkD3gA0QSu64=@vger.kernel.org
X-Gm-Message-State: AFuF++lNy4d8o8lF/BJ6qoe8oFMarO7RlBXxSgviSFPxP2TjFZd9GOfl
	8nIah9Fx6BJq9nkpdaq58fQkPvkc0jSlCaNcfpVvjS5Ij1/MeuyhW/4j29B5rmkr+1h908Rrjs6
	pReUvOqnXg3cdOBt+ugjSdmlIm4Ga8ivGeBMnqsyI
X-Gm-Gg: AYBFou03373werfYIFFYORY1lw5rMryXDEtRaYCeyWM3iUp5HYRD3fmgL2eGCLqG5Mo
	3eNPfHrHUfBgrdrXMPPELXx5GyV1twz5I2qjVGdZ2wlrzaHu7y4GpU7AkjuU59vNcDlTGHBzWaH
	1Kote9PKlKEizivyRrIiIpEoSFDMNODzqwvIQCiuKaN3+3Ez89inXcrl6C448ghspuKYUKKmnI4
	NXJJjKnqv14vSqz/7nrmTZaposzw3Jukx06cDs3Ee7Jwu6ctQHC885za8bnUI9uF/36BWkcbPmv
	DTaDpnzZWL3Sxbjn+UwDomFMMdFZ0VQQh5oRz1uvrGjFNMQcBYcM1AjqSwMh6/++iW8UBlF9Gvj
	pUMH3uSpf/la/JZxoLcqaJlAeeVQ+JjVr7ge0pg==
X-Received: by 2002:a05:6a00:4b01:b0:86e:ff2c:49dc with SMTP id
 d2e1a72fcca58-874dd9f6878mr7820183b3a.24.1789812607807; Sat, 19 Sep 2026
 03:10:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918133953.12494-1-bernard.ladenthin@gmail.com>
In-Reply-To: <20260918133953.12494-1-bernard.ladenthin@gmail.com>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Sat, 19 Sep 2026 06:09:56 -0400
X-Gm-Features: AcwNN1VS-xsnAR5LyJvNlgJZwaJgnYO98rSW_4EN9wWu2tP9xWHjz-tTeYnaBag
Message-ID: <CAM0EoMkgkfBJjVs-uEayfLvgnmop1rLgFFxkjGL4m=iexHRBxQ@mail.gmail.com>
Subject: Re: [PATCH] net/sched: fix potential stack infoleak in em_text_dump()
To: Bernard Ladenthin <bernard.ladenthin@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, jiri@resnulli.us, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	horms@kernel.org, alexander.potapenko@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 9:40=E2=80=AFAM Bernard Ladenthin
<bernard.ladenthin@gmail.com> wrote:
>
> em_text_dump() allocates struct tcf_em_text on the stack without zeroing
> it.  strscpy() writes the algorithm name and a NUL terminator into
> conf.algo[], leaving the remaining bytes uninitialised.  nla_put_nohdr()
> then copies the full struct to the netlink response.
>
> KMSAN on Linux 7.2-rc6 reports two kernel-infoleak splats from this path,
> one triggered via "tc filter show" and one via a raw RTM_GETTFILTER dump:
>
>   BUG: KMSAN: kernel-infoleak in _copy_to_iter+0x1c9/0x2620
>     nla_put_nohdr+0x83/0x130
>     em_text_dump+0x291/0x550
>   Local variable conf created at: em_text_dump+0x5d/0x550
>   Bytes 168-179 of 199 are uninitialized
>
> I am not certain whether this constitutes a real security problem in
> practice: the test was conducted in a controlled KMSAN environment and
> the leaked stack bytes may or may not carry sensitive data on actual
> production kernels.  I am reporting it because KMSAN flagged it as a
> kernel-infoleak and the fix is straightforward.  I can provide a
> userspace reproducer on request.
>
> The original code used strncpy() which zero-pads to the destination size.
> Commit b04202d6065c ("net/sched: replace strncpy with strscpy") replaced
> it with strscpy(), which does not pad, creating this condition.
> Zero-initialising the struct closes it.
>

Two things:
1) Don't Cc security@ in the future on trivial things like this.
2) You MUST provide a reproducer - even for something as trivial as
this. Since you posted the splat, you must have a reproducer.
Share it. This one looks hard to re-create with tdc, so please provide the =
poc.
We only pay attention (prioritize) patches that post repros which our
automated system can use to reproduce.


cheers,
jamal
> Fixes: b04202d6065c ("net/sched: replace strncpy with strscpy")
> Link: https://lore.kernel.org/netdev/20250327143733.187438-1-richard12031=
0@gmail.com/
> Assisted-by: Claude:claude-sonnet-4-6 [KMSAN]
> Signed-off-by: Bernard Ladenthin <bernard.ladenthin@gmail.com>
> ---
>  net/sched/em_text.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/net/sched/em_text.c b/net/sched/em_text.c
> index 343f1aebeec2..4132f8c3c5fc 100644
> --- a/net/sched/em_text.c
> +++ b/net/sched/em_text.c
> @@ -113,7 +113,7 @@ static void em_text_destroy(struct tcf_ematch *m)
>  static int em_text_dump(struct sk_buff *skb, struct tcf_ematch *m)
>  {
>         struct text_match *tm =3D EM_TEXT_PRIV(m);
> -       struct tcf_em_text conf;
> +       struct tcf_em_text conf =3D {};
>
>         strscpy(conf.algo, tm->config->ops->name);
>         conf.from_offset =3D tm->from_offset;
> --
> 2.49.0.windows.1
>

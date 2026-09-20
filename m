Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030A5432BF4
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 12:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789905916; cv=pass; b=O4id6emxqtVW0fuRzk6CFLTxESOMe4zy1p+aD3TeLBai2t+Pzlat/TD4pjjNFe2U4mf8JogoH/FaM36n1aAzOApuLNxk4Z3Z/lDq5clKa4zun4XopFS+eRII9RzvbuwSO2ywhoJIIwUHl/U0Bn1v2imX+Tzp04MygLv3mOL30XM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789905916; c=relaxed/simple;
	bh=Pds+LOkGVAgSxpMXhUeFRjdCbiuBhmIYUWCDN1J8IqU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GKwP7o7FnxLwZ0zpxnh9rqLYMFRcAp214xIIg6RzaQGWtPcfJvASWkH3x22kQlawMZQIvRXdku8Am2xpq4DmPpnDjsTNrFvnz4XlzmozwUS8Unx7LMujQgGcAO3zWlMjK35WIykcfPQZCy13eabszUepgk5nx1vVPZ2S6KdWwzE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com; spf=none smtp.mailfrom=mojatatu.com; dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b=gMdZUn39; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b="gMdZUn39"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469a3490bso2307718b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 05:05:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789905913; cv=none;
        d=google.com; s=arc-20260327;
        b=rlZfuuhcgarKrkYgrqNP0JIaBX5ouOf97Kh80Hi1f3XqFEOxVzCLTJtRTwV/+s0MKv
         m7wD8SKwoIHhXL3vtpupy6A/nKQtPk/IUnhfeJaNBRhxCjImNvMllRGJcKHN5E2VtBE1
         AceHqrREpIAvjWtX7mJCIck9SRhpGcQc7aKid93qFNaOZ++0A6twqgUuKplId3c1Hm3Q
         a76pnZWrPeK7zZpwDCBmnpZ66H3XAoLnIVV/Emd4duPM530U2DnenXT7eZ1O52NQueD1
         TECGnPyaM7UNbVewN9Txwv8+ZiscBKONDKJwAWgTrCIQbEn7sZvjZAddcyXH6KuRBrp5
         w2Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nHm5mMazXjZC7GmzRs1/UHPmMvWJrDDsLFEQJ6iHd/o=;
        fh=s3vIsISrOZHNDo7CIhUik0FaXbqt1Aq8H9KiuLx4upY=;
        b=n35Y4WnLWLCuFOTtgUvH8BqFek5Wsn1Tq0i/7n5jlCIu1AT7ar4ortZAY1ixSOP7Q7
         Q4/TkbrxXNkc1F0uCz8ukBXRmRzVToqWrU9mvs3qCaQ2bL9wLhC7s/vZjqllylaTa+04
         EgUUQlrKG83u2Vi9zUiqe6I4qXw8DQiVdXzCmuK6zcYV+EvAcpTecuBn1Wrfl7dfG0uN
         /hQ5JEJS2u9NMbnJb2WDuHLysXED//CnvgklZkAWJ2sbWedK2/ygqJHddEGIB9bYGgBD
         bvFQIUPlHSXM1FbO+2CG09U+qEWLkFMN0UilWSRM/Peq8sk9I3siSU81Sl9w8ZqHeFBZ
         k66g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1789905913; x=1790510713; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nHm5mMazXjZC7GmzRs1/UHPmMvWJrDDsLFEQJ6iHd/o=;
        b=gMdZUn39ik4a0ObJpLWq4Ld550bwgv5KSiTRnuUJ2PK1IWBjGSbS8OFGG4hl+f8zzO
         l9f6PQ9G7N6LVEeVgii5eR1mSVxjDqQo1QACEZ04iBis+yomoUubOjx4tX3d3bTF/1uX
         KrQlhIfZ8vwpuD5i/tqyjuabxl+uwCq1Zgu7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789905913; x=1790510713;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nHm5mMazXjZC7GmzRs1/UHPmMvWJrDDsLFEQJ6iHd/o=;
        b=kS8QCCUiG8qD00I54nOvmBWAVxnpwBQh48qJzcPH5WDZsEqUhkCbNPzZQfgbeAicUh
         2tUFewRclvlQnFASTxVMa3P7ZIeN+KsbiLNw+5iAL4JbZaErw8SUeuSIQj2fNeXeOSue
         oSAuMcg7QBARfZknukOpEcpdMovbIzhhQDCdlXRFRW0eqMIkKdfxbICQFleu7oxUCGh/
         SGzw7FBSHNpv/dPV2aJddHP3alP8Ha7hqRonyGVhx+03lol5lm1DAU02ckna55GEhAmm
         mv6q51XwGEJGRQo5OmR1EpqBaKbtp2gQ/XV+HN4I8SP4Iv3XcVS9k5SCFfAB2UYt/wBw
         TU1g==
X-Forwarded-Encrypted: i=1; AKwUvBwK+GxEwWjHDj8V8ST+8M9kH1okjTrKN4l87y/awJMYpuD3ARL3lP/9bObao495iNhmpt/f93mvravauXo=@vger.kernel.org
X-Gm-Message-State: AFuF++ltS9Dcv5W+D3LV4fx42RIrJmcH6yaKETSzOtfvsl/SZxSNiiAk
	F0Gyd4wkNQrXY40ZeZidGQf8XUwd1jcLyLPneMUKgguM2RxPKlvwJDFeC51+eFkU6tEvwHfEAxo
	BH/FGVC6jzw/CXAbo0Q7nhopD1vUPKO30Z/PyNibO
X-Gm-Gg: AYBFou3nJLmgO74n5HxE9T11BSezWVFxd+NVkBnmk3N4qWeaOFBK4l3IURC7bB6dgh4
	fOAs+HiaU8rn2FI+KPdOwQZIpJlmDIPyvHxSwWCl4bI+r+x2bBUGUIoUyNsJJVfyOTFXvuXQd9I
	jdlALMg0dLDtMzNn+BqkxQs7Pe/DlkWhp8LDLwy8fiNsvL2ForTNZ0b0LmKNJik0cuMkHKhFruK
	I8vcrb6fWR2x5d23F0p5Reb2WrYh3H81fn0WTjagR+yudOSwtCaxqZ0CVaNLNPAZ/5oe5WOW1Ch
	SmNTkqRfwZrFFSPoSEWYinFykJTEKsHFDyLlDoXyCJPiK5u05ew2V39xrGkqZrilDNs6qSSK6PU
	AJ4ghZFjjpBAks+WqGUhQM8v4K7J3J4mRimEETQ==
X-Received: by 2002:a05:6a00:94ed:b0:871:eea6:95f4 with SMTP id
 d2e1a72fcca58-874dd9f1531mr12709221b3a.19.1789905912782; Sun, 20 Sep 2026
 05:05:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918133953.12494-1-bernard.ladenthin@gmail.com>
In-Reply-To: <20260918133953.12494-1-bernard.ladenthin@gmail.com>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Sun, 20 Sep 2026 08:05:01 -0400
X-Gm-Features: AcwNN1VWHjL5gXLaf4uBnqjc-2_JaoP2on92zf6me_43_PIz9GVDuLCSnLdPu08
Message-ID: <CAM0EoMkcYCAD9s3YCeOcDjTaacfqDXKWST+f+oP9_D2jAkW7FQ@mail.gmail.com>
Subject: Re: [PATCH] net/sched: fix potential stack infoleak in em_text_dump()
To: Bernard Ladenthin <bernard.ladenthin@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, security@kernel.org, 
	jiri@resnulli.us, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, alexander.potapenko@gmail.com
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
> Fixes: b04202d6065c ("net/sched: replace strncpy with strscpy")
> Link: https://lore.kernel.org/netdev/20250327143733.187438-1-richard12031=
0@gmail.com/
> Assisted-by: Claude:claude-sonnet-4-6 [KMSAN]
> Signed-off-by: Bernard Ladenthin <bernard.ladenthin@gmail.com>

Thanks for providing the PoC offline.

Tested-by: Hybris <hybris@mojatatu.ai>
I reviewed, but I think ACK also means "I reviewed". So:
Acked-by: Jamal Hadi Salim <jhs@mojatatu.com>

cheers,
jamal

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

Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2DF35B12B
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790133887; cv=pass; b=DEnvXttMfl6abyXFwf0qHlgtxh6jls7Wt6XIhMbN9J2kiH5hy9iU14p909emilcI/11slJuyr+eVnOAAK/O4P4jcst+Te0vteg2gytQCZEpkMRDg4lXoOo8iJ6O7XjPl6ItMRiuD8Ybi9hNsvJVe0wAeizYPfuqLaNJF6Zn81LI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790133887; c=relaxed/simple;
	bh=DSWeIecAf7yMhlXesBdwg+3lyF8bl49YDtQr18mW7LM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uTl4EN/2WH2Si3a5s5QazUZ95t8CgZHoddB6Mzu93bNnOqLi6CjsDsc6tsolxm+y21yt8m3CDKXs6ersm/M0EY8wL5Qx8o1CSskPtk1ag2Bgjtu8RrIJNpitT4drygaw3oJdWC0xTl5kaRSKf6McxEg0q2O0ABaDpIJIamqyXBs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y1pCjiYb; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y1pCjiYb"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4ab20a33so569952d50.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:24:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790133885; cv=none;
        d=google.com; s=arc-20260327;
        b=ge/LDQ6/CIbKcWatGxOt1Sl+52v6pxPXhIIhU401rIQymRBKaz1AGGnQW0rE4aHWeW
         FdZfA1lB30jZuxwbMTjQSGGHqQE/GjjW52mB5d2aGd3KVAjiQreItkTNJlnuPA6HQRug
         fonMu0zMpWpkgu4HgRK29jRdKo90XmYndnyD/7C5rFuUsP2cbrY2BFF/fb0YCCHmUB6a
         5Taum48+5fAPnVvjVWpdDsUgIpw69YBMl36vfrEpqW5OZgV/Ph8D61uBOGqsjoQiBC9x
         vDwfuK/VBBC8bfqJS03XthvkrWe2rbSrwzg28GrJYPWJxkZ2tV6rHbL6NPEAo1+sHu9b
         r+uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JvJYAxC3BFkryMHCPPUutRIKj2Els96Oe0pXTAumBDM=;
        fh=pLfUHR999whM7BbU+xRGD755t8fK+57Z7AuTw76lFdk=;
        b=qep5GbRL32L7D9silYH6J4edQ+X/axYET2HV531VKWvPL10Da+vOuBVQL5E9vd3yzn
         Wdav9Wb5lVGaonMgwSDfeqxpzfogFfq+4hPKQjvtO7ODa9A2xy+JUiXIyZANLKoPbJZO
         +z9xr/EtLkoEXPrwgWhxxX/5pMQH/hp2nXu4+Z66XgFpcQefg/ie6TtscbzRLWGHZ/4N
         lNNv36gvY1AmxhYHU4YNaiXroMqPUSb9j02NwF6WvVzHyJf/roiyqnLQ8mQYWD9uVE4e
         J5+xg769/32dnZXmqc8obh3kOHlOzgwcX0rgdhFIT9hvT4Em1mt9hNubIal0ZWsb3+zZ
         6HdA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790133885; x=1790738685; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JvJYAxC3BFkryMHCPPUutRIKj2Els96Oe0pXTAumBDM=;
        b=Y1pCjiYb9pLt1lA/IWGNYqvQWIAGoRuvu68pVduzurD6Uw27P9N8WQfKDxGZaAztmA
         PbrOCocQ6NDFZbM/vdeuQFtzQyP6hWudcqMt7V9V4qn1y7RoIH7vlBpAO1/hsh6jyaua
         wIlPmajTEy8zA4rX2qRj2VqGuqLbUWF8HS/kWOqNhsdwwdR3B8chUI2gAV6pUy6wXZZ/
         IN02Z48sYAvQC1eWeYM3m1lN3L1NdKMZP0znwa/Glh1oJLGO8HLKC5pzHlDgJTSfzg+8
         74JQq/ZBJ3VWRPoyz5Snb8wUlkwau0F/qdNSwM+gsUIFRHQQd8Ncmvik4WMqNdr1glnQ
         VTUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790133885; x=1790738685;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JvJYAxC3BFkryMHCPPUutRIKj2Els96Oe0pXTAumBDM=;
        b=BxB+jAYjg/uX8xd3q4p74m1B0MKYu0I4Y4L5Z51j5VDyCUYYsa6ofjFCuITYehZu/u
         TNqO6kuBsrx6A7Ty5cINAGxb6wARAwWMiJP/kOIHbu/DfuajFr/t4GqoxN6k8UXK70VJ
         jHzYkR5uJ+0me5qp3yx2quMfNgdrWiOIBttGxOmK1CV9gYFzuL7zNrGSbwg6BVykXI+s
         sH0OyeF+SFO4XlJ0r0movanSi3oSG1gA5Rv335wCIO2bRT4giYvP8Ac+62EZRbNHAtQ1
         PBgbEsLcubPjJ8x3zO3mL32uxWWqf4w+3Ne83D7DrsR+MelxSmpRbFtxjb+swGIaqrcW
         6nAw==
X-Forwarded-Encrypted: i=1; AKwUvBzbSw0JN9JWAU4+1MUXLh75FgIf/AYvrEFrvcIRNJhQI5vZs5VC9R1v6pfr8y1V+bj6pSXEUZeXcpb6sQQ=@vger.kernel.org
X-Gm-Message-State: AFuF++l3KqGuDE1cySh0aNa9uAhsMoPEft2mZvIK3JxvtLrSXNDZjSU4
	i/5jmH1rDXVfWehd00NJQ5r7gUXE5N0ijMkorUoyU3URSVd/Be9dVFAYx+eIxirGMoqUtij5FzC
	jk0OKZrXj4vhsq2dwMNGsoY3hv0Q3MJY=
X-Gm-Gg: AYBFou1wDAxFm77+dgjK0bTZKZjVuzD7qUQ+/ux/oH/NlRHqnQ1uxVx+8SvRGORIhzd
	WXiApr4f15NJggyqAkBGkGWozaxtJjAv6AkwcBx95/xunpxLdcOEl9AmQgHAum9YLuUKnaESpy0
	/vW17RyW0UdcL3taCzG4JcGvC13y8N7UbvSjUYovjR+Uf9HZna1CVh78X0VS2FI5Eel+DJm4rR2
	flGP7PoIfI1Bgf8twlw632r0gN418encocJn7I8wnkrnrFeK+8jz4wYQpCxSyRZOgiV6xZNYTyv
	QwFhvBurr/XWr7bb+XSEIJpfA8v6198d1RfePBqDggM/3Q+kFHypZ+C0JQQY2O/NO/+lBAvVrn9
	xcotk6fH3Sapqsypc9Fibk39ALoZy5TWMhVW2qODEVkI=
X-Received: by 2002:a53:a545:0:b0:668:9230:e266 with SMTP id
 956f58d0204a3-672d578373amr531468d50.46.1790133885534; Tue, 22 Sep 2026
 20:24:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910041047.24437-1-kartikey406@gmail.com>
In-Reply-To: <20260910041047.24437-1-kartikey406@gmail.com>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Wed, 23 Sep 2026 08:54:33 +0530
X-Gm-Features: AcwNN1U6czatgEZRd1Tuqm5XEJFOVJG01prTEVjnQfkDzzObqmXUjCvs5QK8mCY
Message-ID: <CADhLXY5MJOvgvW1SSbb8NPDCjicC-83LNHLANLo8mLDQq=OVDQ@mail.gmail.com>
Subject: Re: [PATCH] mac80211: fix using smp_processor_id() in preemptible
 code in ieee80211_tx_control_port()
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+d979bd35c8a76fd1b6f5@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 9:40=E2=80=AFAM Deepanshu Kartikey
<kartikey406@gmail.com> wrote:
>
> ieee80211_tx_control_port() can be called from nl80211_tx_control_port()
> in normal process context via netlink sendmsg(), where BH/preemption
> is not disabled. dev_sw_netstats_tx_add() uses this_cpu_ptr() internally,
> which requires preemption to be disabled, triggering a
> "BUG: using smp_processor_id() in preemptible code" warning.
>
> Fix this by moving the local_bh_disable()/local_bh_enable() section to
> also cover dev_sw_netstats_tx_add() and ieee80211_tpt_led_trig_tx().
>
> Fixes: d5a014204a3b ("wifi: mac80211: tx: simplify control port frame tra=
nsmission")
> Reported-by: syzbot+d979bd35c8a76fd1b6f5@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3Dd979bd35c8a76fd1b6f5
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> ---
>  net/mac80211/tx.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
> index 74ab27534076..7b1a3c63e5dc 100644
> --- a/net/mac80211/tx.c
> +++ b/net/mac80211/tx.c
> @@ -6687,10 +6687,9 @@ int ieee80211_tx_control_port(struct wiphy *wiphy,=
 struct net_device *dev,
>                 return -EINVAL;
>         }
>
> +       local_bh_disable();
>         dev_sw_netstats_tx_add(dev, 1, skb->len);
>         ieee80211_tpt_led_trig_tx(local, skb->len);
> -
> -       local_bh_disable();
>         ieee80211_xmit(sdata, sta, skb);
>         local_bh_enable();
>         rcu_read_unlock();
> --
> 2.34.1
>

Gentle Reminder. Please let me know the status of this patch.

Thanks

Deepanshu

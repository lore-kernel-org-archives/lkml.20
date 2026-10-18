Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8453264FD
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 10:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792320892; cv=pass; b=qQwj1EiGfOWQHDAM4mczVXdHm0vxupSG/BZiVqTTQ8OdiOWVIWE++7ewagkrdxPnlrIhIwLad5WhiBQPjY3i1IoBXiCZS1jNwO/MSdP5s8VH9tuX0E+bljVLWuokEGiZzrWTMF/B+IP1K6y62E5j5DtOpvduoXMQdCMZgfmQZm4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792320892; c=relaxed/simple;
	bh=m0vNKj37Dx1kSLJxWQpTeonH55Ff+hPdWeIOVcPDffk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EcOtrulxA3qcUuW4qOczee0mprNy6zcMR7cPXXs/eBtKSY4yFSWigGzMoyXLtdLRgCY9XhyY4garBUyrbEVm2/52l5rT9hnVSa87YeljLZHh8HECqof0Kj/GeuG/HgDUIgTRmX/yrZuiqbYIEJpg958gD1Aosoeat59Ebb+jpJI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N1ngH2nY; arc=pass smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N1ngH2nY"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8a83d2706fdso7867827b3.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 03:54:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792320890; cv=none;
        d=google.com; s=arc-20260327;
        b=EgbgeYvRklKxg/r6VRXyx1NU7i9udzgQaWDx4cMZ6jU/oye+brfZuQ8Sq7sfI6QjqP
         Mqk2oSSPHbvFqqHxclSF/DUFLz6/MnjYHWrst7iYO+H6Rtp1X6OLiCc0xZeUzVv/kn3C
         1TSfysvBzDN7zCtxLG/+bfFuQ95QCTGK3pJnM4TYmZoZ0DsmI7tg7mADJxlu1kimoQEu
         LV8X8VypcKBYdQKhh1Nb0ZtbtXofq3co+YlGJ8Gm2X4eM4pdZWsObVvRRFEWM++7obWv
         5I1nlSzSSTHk/ZA4BEHAyzJvnoa7oc1iNJ7Kp41oeENcvu+Ih0K9ZFHey2eoG5Z5Lqdu
         L/1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XauT15gH6AMZryvE1s+Yc9Wz8N1vaO3g3sQyuxDOI+E=;
        fh=EFcbL4vzw91IUvU9yNBEysXFqRBrdVt9PfSFBRrqgjk=;
        b=QcXmV3DOp+ba+ACTl6LFuX/SYRKJe7gOz7Lz0vWx32g1iYKJNw0qZsR2EzyS0cjS56
         7k0Wf+8iRi6tFRPoMVC+4idKaCreWjFXf8nhMA6GsJa3hav5qTzH5vNNGc7qdCM64wzU
         9h55d8maB81dRn3rqXkMDnnyMhK9WpGDWikskeCdodUx1n1M+8A/vSzpUf7t2zfSdpfv
         hVl7ChdVJcz9iiG41dJ78XUtgchXCvTnavEnjqVj6JaEP8xWa/RgH19GzJUvHsihn+9L
         bZIkz++EXcgw7ruVlD/1KNg8S+Akf8pI+nK3r7jjsccOSmLSX1nACLx4LM+cPtsV63rs
         LClQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792320890; x=1792925690; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XauT15gH6AMZryvE1s+Yc9Wz8N1vaO3g3sQyuxDOI+E=;
        b=N1ngH2nY8+6qxGw3dkqvXUc2d44irw/49pZa3Ml/bIzPJzsMpRPJiPsfpHa1TGjy9s
         fu0h5PuyiL6GMouChKGG9PKy/KAUQE2JEHqNKEYoxAiV8gfb9v4I6eftI2UPSuSpUv/P
         x9hrjCpNT5J2jEdeAnH83EXhTjla4v85gnwlQSC0Unv6xdMECZ1YF1OYT7UWQiS2pUjx
         hkSTw/YFsNFuxAogVQi2XCUjy3+V/Bv+DUw8EH4n91jngam23JSNKhNdShM8lN7rCAc0
         XWerw0qE/q757fqwO4Bed27BtuNsxVX44zfkKv37rs6q4y38vUPLCD3dFoLk7gvKa25F
         7XtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792320890; x=1792925690;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XauT15gH6AMZryvE1s+Yc9Wz8N1vaO3g3sQyuxDOI+E=;
        b=tntzK03ChYX9Rua6qD8k50BW3FwW2WZdxFM/IjV2HzWhA0lbN6LvgKGwInhyWSxPRd
         OBoKf5ITkFCpHfTfjc9QynoHBkXmtPbKa/Ra/EnrfwZ+Ug+ogGwnrGqTp2BeGKbkwL5e
         xhFfzNFWWd4Hgz2mJ7ikGsryo7XzLsGNZTwIGDGWj9lMgfE5yLhXR/fiZI1vxpIEoAyG
         mNUmCYw00DvTkoa2JLK2hVVRzEhJyVOw2QYN3Zlu0+QWKZDuqzPIlwyIVVW64nCKVQMY
         Kxkl7TCrnbgOLDQg8hfjqGxU9NA/fK8samYPN4bNa1m4AzqD32e8r7IjPX2EhaLafAha
         6ALA==
X-Forwarded-Encrypted: i=1; AKwUvBwtnse+xl1JoOdA4BzsiLgUckUqCynP1NWsIAIoIIYR+AVxzCt7eJ5ZhtzCtF+7eW6wCmFMSlvxLO6pLLE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJE58TxTrC5TXdZLktD+Ye0p7lXEW87qS93ddDnRFwR2D2qMEz7
	3JTFppuFrxGUI8MCJ9HcBqzo3MO/ZqBlzQWg+22OeBrSoCDpajClt5CJFHlBgvXflwdzeP/mnrM
	cSwrDLLp1EfaOHPHV+DFFmKDELQNxleU=
X-Gm-Gg: AYBFou2THS6lot9BYxLVrmTotV6H7xApL08TkkFlwMV1K8JlG+b4oH3sJc8myXzXWit
	/fH29S2iRM39Qig9zby8jmwM6ptu13nW36bKheODJDyUSZ0TNf3L/L+XB3B+6pRRzxiYBB0BVuE
	0U7dy3AVmpgij9edtCzECqLbiOnQnGVpXx6uHakf3n5IN4abdpMWaAv2GkJowlcjp1cQb362ht+
	4EDh5OnqvzGZZeseBqLIgGGWZ8YHVe4T5OhbEonLcZ5QZ4us6QHyhdzrJvn/80MKlbU5XIxRuDr
	HicGSEmerB605nRWo6nU8zs9bO2Hh1qcvyF6V8R5EjJEiYXq5M1nK4vkJxnQOzthVGVD/wo/tE+
	BBkxDAw6Q6nPWFI5dGPTikTjqFERS3Vc1H0EWjwXZNmKc
X-Received: by 2002:a05:690c:a0ce:b0:854:819:64c9 with SMTP id
 00721157ae682-8b0f2164ca1mr10225167b3.30.1792320890455; Sun, 18 Oct 2026
 03:54:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910041047.24437-1-kartikey406@gmail.com>
In-Reply-To: <20260910041047.24437-1-kartikey406@gmail.com>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Sun, 18 Oct 2026 16:24:38 +0530
X-Gm-Features: AclHuK-6yjg7RbNkD8czAob004XPvB8KF6MNiLIEn6GLCPpozQPhRH7qKM94mu0
Message-ID: <CADhLXY7-EMwbczPhKjUFPN0Q0ie5NSNw8FERrx5sC5o6aG7KLg@mail.gmail.com>
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

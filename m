Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED0348A8BE
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 13:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788355282; cv=pass; b=lcpY0lnGu5c0VxanBteiABOe344uHHjjH9pRzdTWvGFiWSpcsAafjy678kfxHK/Quy/DpyqyCMvMPv7ec3GAOiS/akr1Lyb8uAKsbzykHlyTj6wWYGWEMAl04DlI8TbDQLqF0/B62RRS7Vf6sMVOIW0GyNqEtmIXYr3ordZ3+/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788355282; c=relaxed/simple;
	bh=CX4jXXsYiq4+K/WAEmy2HAUQc54C6pP3SiHUP0fLUOs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HVp38Y91Vti5RCFlUVx9KcXzTHebDUEeGcr5XLS01yMPoDPjtKyfJRgXlZT9mZ0Xeavr/mmmuL8NZixduAZGQFiY+NmAfdZDNBLQJ/3WCUQcA8qGIf8OZZ0MEZ8cpjkbSMztCZ18wd4I73cOMiqBLiBLuzOj20pktqDJP3LbS4Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a/nq6rrU; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=nsZHfNwL; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a/nq6rrU";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="nsZHfNwL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788355279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WETgVeFgKR8QqwYjitWNqHJK5UZu3CUf41ydcXPg9og=;
	b=a/nq6rrUf7rWc3z+5pxMx2jkk8h8BV/oZ/YyS5kBMN8A8i4s2qmKCKbkT94cmDdL4fecUK
	aMckOII+EX3Wp3qZVSO8O86HdWtN3TdP6pJW94xRW2EdtU1qZOTl9NPWgNqgxwa0tAr34K
	ihX5aYrP3f5AQFPne64bBiYOZWU3uG0=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-A_T-etP1MX-XOq2X3uukJA-1; Wed, 02 Sep 2026 09:21:18 -0400
X-MC-Unique: A_T-etP1MX-XOq2X3uukJA-1
X-Mimecast-MFC-AGG-ID: A_T-etP1MX-XOq2X3uukJA_1788355277
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-3a3498d133eso3689581fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 06:21:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788355277; cv=none;
        d=google.com; s=arc-20260327;
        b=rnc6sBU2DtO1JsI9uLr6VXYqEmxF6ZdLzzy5QO/PrXwIpzcs6Eoq2ES5dZCQYIZ1Vb
         zfI9RpcoXRU6SaygC9YgXG1tRRHpOMNG8YfYrkGWr/ixnkhykUGaLjLF052kyaRVqPJ7
         qJew/OL6l2Tt24Jv3NPGJi1Av/m+8jjnA+olb8b/iP65rrHceIuHavgJc7+c9G8i8lsb
         iKx5SLeszQ2IiOiZ0arBZ026DkxiRoF5XhABKHhEQsBImxntLOgO9hL3ymi69GicY73H
         4OnFMqIPnk8QSU4CM6ibo7vL+k84q222noZHjUdX5LfPSGUA8dS9fWIvztv+NNah0Tvz
         Ec9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WETgVeFgKR8QqwYjitWNqHJK5UZu3CUf41ydcXPg9og=;
        fh=wfNrMOn28YRSIFEOlOrGTUEJ28O1KgtHM3S5SOyvLSM=;
        b=YxdGAy56J/tNxTUdGq8LXC+EGDZrv7QG4Ff3yDNGv+ZS1dogI1GJwPLU/yylZMmTm7
         eTLMVUNq01SM9E13EUzu7rjBBw2uXqZFjf6kcaGPJlGDRTuNETZWytkBkcFo39KqoeHZ
         vEHTXi4ujFrwKLHKIE3gILRGIZA7IoQJPFxN7cwx3Ravsnx6J1EqDVTGHrPDuhTyey0H
         AisWk4IiWMma5DohkB0L827z+th2Q+Pia3sNFpjt7PUJsx7Qcxbw9EZc6XpipJyhvkQt
         1Dg/Wd6ZNY5aAdw05dw0oCvamTclgq6ikOkpNdIpOgYeYke/SJXj0H64VIu7jVZAC2mi
         4JHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788355277; x=1788960077; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WETgVeFgKR8QqwYjitWNqHJK5UZu3CUf41ydcXPg9og=;
        b=nsZHfNwLW5Dm6aFE9ZDxgyXrf4NyLCV2zTy9ekQVepnCIp/hAbUvPrYgPSS5D8CJzC
         LiDzzqiiZNP4rMKHU7UmxZJB6k2/AL7AxdYDBd1vIlYJUddLAm6mDXzWRy/tWueraNa2
         jfLJXoRgsiuoy5rZ43aBWpnv572W/yoB7v8p8qu/OXPLrc4attfo/KDxwVAORqpo0hl7
         rtQqkoLzmI/Qv8gpAtPFulMmoQceYTSnFl7RB0IndJymlFgTH3iR7YumXq2s+GWpcKr+
         qH34R3ps//b1S3P6oQLb2btOSNgoXkIzeJxTs5Yuw/p/G36+wYJoHX2cWKhtDzlEocDM
         m/5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788355277; x=1788960077;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WETgVeFgKR8QqwYjitWNqHJK5UZu3CUf41ydcXPg9og=;
        b=mdDagKh2ulprOOFnWDQ6I1kPKg6pjzDPpEUlAcy8+ewjpmOBnPcje4Y453eZDAo+Bc
         UM4nmYhQ3l8pxOVju95rD2qlZRTqIye9ee2bGGcNpjUn2JpMnwCX332Ne7MrUuwqW9rI
         Tmvhs00ZQ0dWfWTLE8o9ECSBGd+THf7F5aN5h+EvS7iOLNmcMely3LCm6sZrg6H+FosV
         M9FyB0YklD872+ohMXoi2gNh7jse9V6zS7Myc/6Tw3RLn6S1xlU2VTt349G29Zd+JQ6C
         6O/Ri+sb85gH++JVUBkyRY/7IigfTy7jMJZ+S0kJtzMXZZD4KTiFQbmwliUxuoKNfyqL
         +nag==
X-Forwarded-Encrypted: i=1; AKwUvBzwzEaNtXYvxAkIgL61crYxHgWGHydCh3EDy9Wu3OzFnX/SyUM6o1m0qG5n3DoIbGsQ8UvOJJyUGRsZPTw=@vger.kernel.org
X-Gm-Message-State: AFuF++lAZoTwpdtaZaQ85I89TWWoPao5K0YKz7njPJfQ7P3SnG90bkJ3
	A04K8QQZlJVOR4FpcqlvbFwvSSghg+XssKbw+VbT7juHnX/3PGCwpDMXLAXq+Kum59ZmcOH1F1y
	xVht2WjPEAjZaIy+bnvyASf70Kaoa9YkiFZUGJroCRrjQ/gFOk7/qpE63WM7IQGdQIYcnhQRnf+
	BrDpK9Ne9j4eYzxow0bdYyQQ5tfr0VoCcjCgyNDnfO
X-Gm-Gg: AYBFou3tgEBCle5vLptCcUioop71HICyQQhWlqP86YrXaoa03bSXjhkzjafJ0C6j8kf
	ladyItQx6qB1TwTLdDu3bh4fp+ANp7o7z+sxxtaTAGMi5hoTXmxe4ncsQz2A4pdXJMpgS6fP8m3
	tG28mxzBQW01slJ2M+4izCByIg1JhvzP6S7pt5C3RUQU3B+Hzpc7s9rLvG
X-Received: by 2002:a05:651c:41ca:b0:3a3:63a:baf8 with SMTP id 38308e7fff4ca-3a34fe23718mr11727291fa.3.1788355276765;
        Wed, 02 Sep 2026 06:21:16 -0700 (PDT)
X-Received: by 2002:a05:651c:41ca:b0:3a3:63a:baf8 with SMTP id
 38308e7fff4ca-3a34fe23718mr11727111fa.3.1788355276321; Wed, 02 Sep 2026
 06:21:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901091836.16906-1-qiang.zhang@linux.dev>
In-Reply-To: <20260901091836.16906-1-qiang.zhang@linux.dev>
From: Alexander Aring <aahringo@redhat.com>
Date: Wed, 2 Sep 2026 09:21:04 -0400
X-Gm-Features: AcwNN1XQfrKRMkjAT-v4HHjnaOQ8UWFl-GmdYVXEnby5LRXI1Kj-CpyfJLPtdoA
Message-ID: <CAK-6q+jFXsZpWHrm0CSa8Tr+P3qHDmWVQA+9stXViyUf48CuvA@mail.gmail.com>
Subject: Re: [PATCH] dlm: wait for outstanding SRCU callbacks to complete in
 exit paths
To: Zqiang <qiang.zhang@linux.dev>
Cc: teigland@redhat.com, gfs2@lists.linux.dev, linux-kernel@vger.kernel.org, 
	rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Sep 1, 2026 at 5:19=E2=80=AFAM Zqiang <qiang.zhang@linux.dev> wrote=
:
>
> The dlm_lowcomms_exit() and dlm_midcomms_exit() iterate over the
> srcu protected connection and node hash tables and hand each
> element to call_srcu() for deferred freeing (connection_release()
> and midcomms_node_release()). call_srcu() is asynchronous: the
> callbacks are invoked only after an SRCU grace period, which may
> happen after the exit function has already returned.
>
> These exit functions are reached from exit_dlm() on module unload.
> Once they return, module teardown continues and the module text
> may be unloaded while call_srcu() callbacks are still pending. When
> such a callback finally runs, it executes freed module code and
> touches the static SRCU domains that are being torn down, resulting
> in a use-after-free.
>

I thought again about this and in my opinion this is not possible as
it is already being handled by DEFINE_STATIC_SRCU() with a cleanup
handling when the module is unloaded.
I know that srcu subsystem does a lot of magic with modules init/exit
functionality to call init_srcu_struct() and cleanup_srcu_struct().
See

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/ker=
nel/module/main.c?h=3Dv7.3-rc1#n2711

so this patch should be reverted. If they don't use a barrier there,
the fix should be in the SRCU subsystem, but I believe the current
SRCU implementation already handles this.

- Alex

> Add an srcu_barrier() after the call_srcu() loop in each exit function
> to wait for all outstanding callbacks of the respective SRCU domain to
> complete before returning. In dlm_midcomms_exit() the barrier is issued
> before dlm_lowcomms_exit() so that node callbacks are drained prior to
> tearing down the lower layer.
>
> Signed-off-by: Zqiang <qiang.zhang@linux.dev>
> ---
>  fs/dlm/lowcomms.c | 1 +
>  fs/dlm/midcomms.c | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
> index 2aff1c7c17de..ea8353c4638d 100644
> --- a/fs/dlm/lowcomms.c
> +++ b/fs/dlm/lowcomms.c
> @@ -1984,4 +1984,5 @@ void dlm_lowcomms_exit(void)
>                 }
>         }
>         srcu_read_unlock(&connections_srcu, idx);
> +       srcu_barrier(&connections_srcu);
>  }
> diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
> index 8964164600d2..045431524494 100644
> --- a/fs/dlm/midcomms.c
> +++ b/fs/dlm/midcomms.c
> @@ -1178,6 +1178,7 @@ void dlm_midcomms_exit(void)
>                 }
>         }
>         srcu_read_unlock(&nodes_srcu, idx);
> +       srcu_barrier(&nodes_srcu);
>
>         dlm_lowcomms_exit();
>  }
> --
> 2.17.1
>


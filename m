Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5159C57EDA5
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 22:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790201396; cv=none; b=RXwqIZmHghaD3/6wBMNlZU2w2KiMwNhewL6GQz62RPQdicXq71C8OOVHk2Cm8eorYJC/W+mXa7r9y2ZvizzzmrLwZqS8IlfnspyG+mve3CsfV6tJyF1jmGOrG07dMUZxOt6KW0yI74+op9TLSvPro5aX47W2N1sAOL+C4lV2T8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790201396; c=relaxed/simple;
	bh=EtOIa+oAShthuIiT1TwrJdQuJPXnDiaoPiPmXnJJfG4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=acNvKLL4uwpvZ5VG6uds8fE4B6leVCk8bEzc87ka4hFph0lZtxUy1gZKhpbg3Szdt/yVx+wnFJc+qZpd2BHbGzg1o/Oe6Gh4uF0jCU4l47C8Drankb+YChBeXeP7BECyTgMRCzNdlLjMWz0T01wKC1BrZflQ1DpnWimfw0Omprs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JabHTBNb; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JabHTBNb"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccead2aecso6537775e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790201393; x=1790806193; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l5dTpfk72zH6uImNLJc12NQcXIxnabFbxH2ktwvSTbg=;
        b=JabHTBNb7ls2uP8xSKvzKXLBupNHM/NFoQnf3Z4Vgscxq88QF8Z8D0p+YbF2B1wwV7
         lCwYSxeuVkvo+PeBdnTSVLKpJKviVNTxtSx+1T78rVQ0BFLmV2LjVeGh1qX8CrOL1epp
         h2rVggzDp/Wl4xPa+nT2S7yHnRu7OT1GebGn7qJR+I0/Zwu7TlE46AOyeleem/qhP5nK
         IUoe7wfrk2Ld1GfUGpeT+r6hIbhEB9TlYbP23ncRr6Ep+/8mXquQv1YopI1kztvbJC7f
         HLTz0LVwkNTMfOPCuROJ2o0vCImMUFEcaOMWNWftvfagKZbNs1frgsZ32UhkYSjfQxyH
         FxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790201393; x=1790806193;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l5dTpfk72zH6uImNLJc12NQcXIxnabFbxH2ktwvSTbg=;
        b=QOHiPo0Sa1Sygs0Y5BqxojJ8jkTiknKUFVieUzY7zIHtUwv9CxcDqg6gAjvwUtDiuW
         GT2RwvFoKNAXnAPFhMZVbSGaDStkQxYmRdtLh+5P1XWjUsyCSTM1Zpc+GRCxrHWD+Ato
         t/eog2CVNKViEEBDrOqUnSOgc1izSMB99w3bUPUPLPKTU7TvpSJRTLAbZ1orfIP8mPWC
         CsTUYYzZmNkXlTRFmvA8IVhfcAllijkkbpzeRW4bOTXmJBworM9nzdrmo7r9L3e8RGj7
         f9LLrQRsM1CFG4xgBwfxMHYm3wzT5chway2HiarfpRAwf16RYcQQw8vxUDbH0jU2qz3x
         ARuQ==
X-Gm-Message-State: AFuF++lFsh359vswGULP2rS7A3hTGRTHpDe/QBCErV1ZRyKIGjzi6+r/
	7g7HaQSnYiTDhq2XxSYlH5gezU7XnRyPeZ+5e4SSZZP78L4VpHxdjsB6
X-Gm-Gg: AYBFou2CtgGWc61HzjszAnn5MLi3jdijqdgRTGNLOjNiwtyW0VVuh2LtA+HgNbGG7xd
	lgmo7mWgYnLp/Pd7U85842XSsX81iBtR5iDq1kxlUVmn1w0G/uZNy1cPFwvoc5OWZVejOh3dm0k
	+D5JvR26kUNWYWmXP/Bl41TxgKptEnH5IL3o41ryQZqCf/+OugAlLnyz86zGgvRTxl5upblSjs2
	ceQ//AzUkbdKyPR2UlESByDRx6mPq25INXwokHCasMPTX3biXPpLMUH0/AYOTwjeMFeEcLrvxl+
	I6CPQPOiqMr4nEj+ePzlPu+TpLqPbobU2l0u7bOeLT3iYrs2umvcGm1Ssj/TqC4f0j9/8y6wPeD
	ag/acbAwC4POSiQ9NaGtbGV8tyDPfm00mdoTTJToxER4ldrPlgBrXqxS+bdb0t3ZbN8rhgZAHTk
	wpXnwQGZkCt4vqTKELf0VvlI4Vs6mNKmwN09I51QUhP9IsLqUeRZju48L5Rvq+w8ReAdLfzF7OR
	3QazGsS0ic4pkZ1m8fQFtIlp9w79vS2PyY=
X-Received: by 2002:a05:600c:3514:b0:49c:fc6c:be09 with SMTP id 5b1f17b1804b1-49fe67078afmr8562615e9.32.1790201392960;
        Wed, 23 Sep 2026 15:09:52 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5cd42f2sm17189365e9.15.2026.09.23.15.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 15:09:52 -0700 (PDT)
Date: Wed, 23 Sep 2026 23:09:51 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Brian Cain <brian.cain@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, pierrick.bouvier@oss.qualcomm.com,
 paulmck@kernel.org, sid.manning@oss.qualcomm.com, peterz@infradead.org,
 linux-hexagon@vger.kernel.org, Ingo Molnar <mingo@kernel.org>, Frederic
 Weisbecker <frederic@kernel.org>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <philmd@oss.qualcomm.com>
Subject: Re: [PATCH v2] smp: align struct __call_single_node to 8 bytes
Message-ID: <20260923230951.29231158@pumpkin>
In-Reply-To: <20260923154307.3625611-1-brian.cain@oss.qualcomm.com>
References: <20260923154307.3625611-1-brian.cain@oss.qualcomm.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 23 Sep 2026 08:43:07 -0700
Brian Cain <brian.cain@oss.qualcomm.com> wrote:

> Consumers walking call_single_queue cast each node to call_single_data_t
> and, given that type's declared over-alignment, the compiler may load
> llist.next and u_flags as one naturally aligned double word.  Fields using
> this type, such as task_struct::wake_entry only guarantee pointer alignme=
nt,
> which faults on strict-alignment 32-bit architectures like hexagon.

I think the same could happen on arm64.
The compiler is being told the alignment is 4*sizeof(long)), but I doubt it
can ever matter that it is more than 2*sizeof(long).

The other option is to only ever use call_single_data_t to get an aligned
version of the structure and use the struct everywhere else.
The compiler won't be able to use the 'load two register' instruction, but
I doubt that will be measurable.

David

>=20
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Ingo Molnar <mingo@kernel.org>
> Cc: Paul E. McKenney <paulmck@kernel.org>
> Cc: Frederic Weisbecker <frederic@kernel.org>
> Cc: linux-hexagon@vger.kernel.org
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>
> Signed-off-by: Brian Cain <brian.cain@oss.qualcomm.com>
> ---
>  include/linux/smp_types.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/include/linux/smp_types.h b/include/linux/smp_types.h
> index 2e8461af8df6..5773e1fb2660 100644
> --- a/include/linux/smp_types.h
> +++ b/include/linux/smp_types.h
> @@ -64,6 +64,6 @@ struct __call_single_node {
>  #ifdef CONFIG_64BIT
>  	u16 src, dst;
>  #endif
> -};
> +} __aligned(8);
> =20
>  #endif /* __LINUX_SMP_TYPES_H */


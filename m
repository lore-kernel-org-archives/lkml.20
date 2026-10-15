Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74B74C6D
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792030919; cv=pass; b=EQygP5rtswSlWrzyOTsjmnngWuBb80v5qbYzHiDN3nJAXbOJUalN0tjnB1oUxpYJYyIX7fqa0BDTdQLdzTUqgZzn7bcJ5pKfqX7FWpT39Z2oxenPzbjK2mZ3trA55lrEVD259cfATUa9w7qLGcE7w0TzDXjROb64ZeEfuR4HCIY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792030919; c=relaxed/simple;
	bh=qSdlRYB2TMcSNTloyYzjoolB7q5XaBTJAM1Srcl+1E0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fjueEub/2X19x+nU3u8lx3u45kV9wkKLzc5a4sqNzmi3W1jL8IxOA0TnqNrbovozmq/pK7lJvBfbwutWVBXfZU3FeI3f1k2+X0EgTwbUQ9xIHnmPDOOrKXnxvvGBSCsSeQSJW5UMnQVfAVEXknlrs4OmFzgk1yNs6eNS4sgD1XQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gVzB85ZV; arc=pass smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gVzB85ZV"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8726acc5eadso39455857b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:21:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792030917; cv=none;
        d=google.com; s=arc-20260327;
        b=h1hM467+pd28MtYmUG1aOF5kb0v43jbBkAC6y0UtTUVctHYG2iD9KAzI063IE0oZ3n
         tcbm5XA8sY+RjHEzpMCDl0wo4OxcNVrE44x0wUuHw+hbtoAWa9y6AuqqGDfFhZrdIf5e
         KqXyKBLeHZvdXYCvW/ZtlFBr/yS7HnMaDBmGO+skwXXP8RU7GXaYSegOlRxQTx/haBtb
         2NPBESeidF9o6q8VZpyZbS5mBkt7VpUxhi24/7P/EK6XW/S/nogzVtCHHFVrJ2hGhp7v
         BwaCaVguyy/BFSKV2jAPV84DaZY7gzdsbZb6MtvdiKjuBT3rLxWNrq6HJw+2vF9gVaSs
         OW0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2wLqmXSLedm8Oeu0GWuAPrw8pJzuZEEe27FUMLIhsGY=;
        fh=U09RGRtiDp7PjqkthrRGW59jmf69XX2okBWorhia9a4=;
        b=YDz3riu3ikyHB3twy4RpN30wXVnnJXUaliK0FhKzg6fOLeef55AYh5B7qlw/UbsnCw
         Gz533WD3ip8iQ4rrVqQRir+sfBx1Y0nq9Xci5bXaCJwrixpxEUjPOoYlf5OI3VCTCs/X
         s97fHkKJTLLV9UobcAZFrJJ68Jx4jERhiq7Bo9cjMxPxa9e9SzVks4QJqjIax+d7V+JP
         OZb1J6tCqHhY2zRq+uV2QxggfPrzRLVbBlek0hO1YIty9LBglYSps8NuJaVdZyyZzUxH
         aE3bS03mj96BLbUCa8wSGsflWGEkoBVc37uRLNlcVStBT24nL2BrC3uLNcBFgA/IMTBg
         I/hg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792030917; x=1792635717; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2wLqmXSLedm8Oeu0GWuAPrw8pJzuZEEe27FUMLIhsGY=;
        b=gVzB85ZVxinQ8n61b0pnJZKLnPcki+ipVAaDQxpSay9K+ZiHEkYmqOHIZ3M6ntmPCo
         IC2R4jEOoUfZGXc3sQKJzd17YHLavEvbEQEWEm3SrDUsTytN1W+6kBaKvRVljnphx5/n
         3QDuCQlVoTAz3k7e2WTl6yZjmyyOszSwUYfwlJyt2lWawbZhHcZGZfQ5uzOteb+RJHPv
         KCyDLHMfd+oqfTV7n6Wqg46YxpBO0muoy5RRuNvbuPH3MEEGwPrVpKTgQsJk+2SdYwk3
         aObSHruuJA1prnaxjOXfYo4ENnbD3UsOYwfqx987LquYhokp+MzvljjqWaoAqjSPtD+3
         +CCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792030917; x=1792635717;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2wLqmXSLedm8Oeu0GWuAPrw8pJzuZEEe27FUMLIhsGY=;
        b=d4SMTywI+5ORKks5c4WOzLz6qtwyDj2JINMOPMn/ZgxjhvulVAFzGQDsnD2rbQ5YIX
         1GtFYKdIQh2NlAQy735cmNr2kWGe1JmNZoJIwJuCVbDe0CpHp32r10HLeLHkMTGKSFCZ
         b6cjyWME/A0r2xfbIuqfIaDghuSvM0ip4zp2cx6pFF6z1KPNnsDhuyGcRbIvD6CeT40k
         kf3jytEcOsnB8BY50HGUrN/ZvROhvj2b1NPbNvHFzLRO9LG621ajNQPPLZrfJd18hYzL
         ilcexrajApRHUzrQdxgz/Vm/2CabM0ywvfQoPFIHoGj5447jIVZOMkO0iEtkJMgAQFsv
         /dAg==
X-Forwarded-Encrypted: i=1; AKwUvBwvtujLrsFpxiOaK5CaNAQCW8io3A0xcQAsuDW3+6fZj010kNKbq4yK8oLf5vETJbVjYTfmYzb5PLACMhM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQ3zMfVQ41cTd9r+tw3N9MlWIzx3W6F2i/uXKgwffti2Fm9uq0
	TxHBHhOXIpELegWtgqQAJ9Q4wITVLD7eQHYc/vqCmkDV0VUTXXn4drAMV6Cu4wHymOnHB2IRmGj
	rpMla9q+D1EMx3n4sg6LGGqFJmLqctpc=
X-Gm-Gg: AYBFou2PHdsU9pHsFC4dcGh+vMzASa1flOxHvufSQ1GtIUa45UDCbpOvfQZ1x03zQJY
	rAZ8tk1/x52KAh7pyc/v1MI2msHecIjKGC6w09VJmejDNHicAU01LCD73KrW3alNKo1MlU6t3WK
	EfTL/XjuhFRAYsRGIs5M/8yDHpZPhp+yywMugGSsnsc9Dd7cBL7cMmKEfchd8H/2eNxYHQ03hW9
	MmxBtBSzjgxbQHSJxy+lXwmPbvytwCpMcMF4VIyELUSz6YMw+giQqcJFpJI0wCWH/yH0Qmosx7w
	tHA5MYRYFRU3WdMvmqhjcKSi5iZy7u7GEZ+1rzXhQ4fosqlaE8d0o62mIg==
X-Received: by 2002:a05:690c:c1e:b0:8ac:46ff:d376 with SMTP id
 00721157ae682-8b07edeaf0cmr65106327b3.28.1792030916867; Wed, 14 Oct 2026
 19:21:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pm-ocfs2-objects-candidate-0055-v4-c1574edc9949e3a22edf@gmail.com>
 <5f71eb6a-f773-4c66-a1a9-c0ab9d385f39@linux.alibaba.com>
In-Reply-To: <5f71eb6a-f773-4c66-a1a9-c0ab9d385f39@linux.alibaba.com>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Thu, 15 Oct 2026 10:21:46 +0800
X-Gm-Features: AclHuK9l6NrqoT1uvaDLmDHqBj1VRiL6l9Sh-FVjwKZaGZu6IWt0fcjmAjjBDpI
Message-ID: <CAFRLqsXoshOAsTfYogY_PiGOnd70=s08AwXz9UXp7mT8UgxqDg@mail.gmail.com>
Subject: Re: [PATCH] ocfs2: dlmfs: Hold l_lock through the unlock wakeup
To: Joseph Qi <joseph.qi@linux.alibaba.com>
Cc: mark@fasheh.com, jlbec@evilplan.org, heming.zhao@suse.com, 
	ocfs2-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Joseph Qi <joseph.qi@linux.alibaba.com> =E4=BA=8E2026=E5=B9=B410=E6=9C=8815=
=E6=97=A5=E5=91=A8=E5=9B=9B 09:09=E5=86=99=E9=81=93=EF=BC=9A
>
>
> cbe0e331fdbd only swaps ocfs2_cluster_connect() ->
> ocfs2_cluster_connect_agnostic() inside user_dlm_register(), but never
> touchs user_unlock_ast(). It seems it has existed since user_unlock_ast()
> was introduced in 8df08c89c668.
>
> The code change looks good. So after the above comments addressed, feel
> free to add:
>
> Reviewed-by: Joseph Qi <joseph.qi@linux.alibaba.com>
>
> > Cc: <stable@vger.kernel.org>
> > Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
> > Assisted-by: LLM
> >
> > ---
> > diff --git a/fs/ocfs2/dlmfs/userdlm.c b/fs/ocfs2/dlmfs/userdlm.c
> > index 617c92e7b925..60653db7b411 100644
> > --- a/fs/ocfs2/dlmfs/userdlm.c
> > +++ b/fs/ocfs2/dlmfs/userdlm.c
> > @@ -253,9 +253,9 @@ static void user_unlock_ast(struct ocfs2_dlm_lksb *=
lksb, int status)
> >
> >       lockres->l_flags &=3D ~USER_LOCK_BUSY;
> >  out_noclear:
> > -     spin_unlock(&lockres->l_lock);
> > -
> > +     /* Complete the wakeup before a BUSY waiter can free lockres. */
> >       wake_up(&lockres->l_event);
> > +     spin_unlock(&lockres->l_lock);
> >  }
> >
> >  /*
>

Hi Joseph,

Thank you for the review. I will fix that.

Best regards,
Cen Zhang

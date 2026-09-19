Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95091331EB4
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 18:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789842777; cv=pass; b=bihZQbOKpMPsQ933JMOvCizVjXvqqhvVAOIzndGq2gVB/wATy2R0OPsSiB7pteupxCpaPav7h/qCnZGpDXZ4iQKWwF1p+A/TkkIPkSZQUQ9Ceo3Z7vKWHulnakfacWM3uLoXIjTa5P6t0kkncGtLkudhP6vUJbKA42lSS7QC9fo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789842777; c=relaxed/simple;
	bh=v97cycUBS4MKTJ2yqY/Dn1GyeLdtatYT3OAwk/a3bTw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o0cKeZrWVjRwjckNPZ12RrNuNAHocyPZFuE71KZ6BMF4gTjqbqBM6JHj6h7bVoNqTETVf5Abb1jsJVpufFdusY/VzO2peD69tb8oLShN5Krx+qj4J2ku6QXOPdn93PvZFOuBeDbGcW2xql2OEAFQvGoiV33wIN8NpeIY3cKSep4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jG6/NxRU; arc=pass smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jG6/NxRU"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-483c65c2fa7so1191952fac.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 11:32:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789842775; cv=none;
        d=google.com; s=arc-20260327;
        b=YhadV3aZ6DUXgu6XMke+8h/k1K78FRPuPN5inp3kewposZhqbIyqsvqV93PNg8yuM9
         eE6cMty+agsK3nnYFeEelXkwRa4iT49FzYdla1gD2Ub/jzeC1YcFwsC9W1+SMLVbCFdY
         QjYjCliyo99cBJdOqzEWmBhSvf3l9x4orEr7NPrOp3KWJ/tbaT29j4Kk50oNw+iMf+ry
         MVJDpRr/KfAJma89erL0kKkiWqBIv9VPIsCQZ8ZgCXLHhlGN1oAvJE/NIWRTqiMH61jk
         Xf5kQZIEOw+YfxUr+ROpXoajfD50p2wcAiT34Acd7LTsK4siOFTINVM8EJGdh6cDsaXF
         +sgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Lx22JAqx3HdqfLp4etPkKWCHezogZYIQRxdcXNcbJpY=;
        fh=DjF7xIk9ce73rqtDtFRDd3w6P5cHMybd/CgtyBJBdQ0=;
        b=UfmtSPl6+kAteypmKjukp9EBXL+1wIeoysNo13f232TaW3A+olMgp6ref4FT1Xwu8g
         6oDbDkzgzLluxrbEIL+ihTSQxwAnNQwEqM0XiaplD5671uES86kOIUMpcrawPjWPasN4
         k0JI31oH18WMvqKOjwIFKDS8MyHRqDGubEJG0ByyrVoWW8J3yOsnlMT5BNcjjq7BArR6
         /ayjyYn5OYiSz+IY5lqLXZOUXNpDSaiH7cA63kMelxQ1bISifmsWQhiM1Op4uz1HD6aG
         Isc1JsnQ/W+APCUTaAHLiXUwzEkLgJaqQnx7aC0wsvfMnK3cF4dbUf68dIXYLy7ZLHuT
         z86A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789842775; x=1790447575; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lx22JAqx3HdqfLp4etPkKWCHezogZYIQRxdcXNcbJpY=;
        b=jG6/NxRUEH+HfJEzqlzXohwN6ckR/v2m/rSc9kz/dO5GsFaqphzAtFkIfEXFC5grbI
         7JXaiMlLEP8xqbV7uMAnQlN8ahH8OZ1TQCs/5JL7hQkca7wW4ga2y9W1yzuA59JLwGas
         ZIC7uRQg+9dt0wZUzDJ3dEBfiSjVYb9+wWSxHFkxnFWdI19II8iyorjDrDtcWfhyrEus
         cpAtGKsaLwSLu6NrVJrF9POINbYSWO5I8VHeRZ2pQW86pdR3qXTrZ1C3rTjRxOuXZ+Ua
         7Q3Lu2XEINXb/YbwTsjFGqAbDUsyRNb/XDj1ux33Q7fyL9RFRf4ws+604yCR8xqSlmYO
         Lttw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789842775; x=1790447575;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lx22JAqx3HdqfLp4etPkKWCHezogZYIQRxdcXNcbJpY=;
        b=LbRgP8d1rdNCK7rIxqgZTiPiWmK6hDXdw0bJI71seZX/ty1LcbURNKh/l7O/nOrnbx
         l98uQ6opxglABzz0AV5gP+ZaeVebr1AzQQF/OYgOIRyPCRnjBvEaTDhXO17QKRtfTgKj
         IVaGkEOiGB8U2V9L6eS9H2qanfRa1SnuUs9WbApPaSJSsJun9kJA1GkmlBPhFpvQFH7B
         vItxEPUVulj4SnOrWi4GDYYEWEOx6f4uWgiWSDeMgSOXxIpFH29erx8cAX0L7vvR2R4Z
         IFOwWW+W+IDglym+R+rHoZSyz2rUF8dv6ELWRjJciQIWLh1BiyU4figSUyrW9/KIHHpp
         DbOA==
X-Forwarded-Encrypted: i=1; AKwUvBz+9kCm4CPtL1Z4KiGuarZ0o5BTlKGXuifmXzjsbXsCvXNpJtCNMO6uZjhuyG9W6IbzePTwb+mKfN6dero=@vger.kernel.org
X-Gm-Message-State: AFuF++ntIl6A9D9AMOi2i5SMcyClyUtG5P5mVSXisLuQbNWmGhn88F9U
	u+KUHQXLD8TK9VU5b52+MqZfW9nLfS5ZbKNm1XZUwnT8Ss4vGW15zNtCBzMh+MQgSdp7aiECJJt
	Lb01dQdzBplfcwrI5EHkiqliOU4aC/Fo=
X-Gm-Gg: AYBFou1GcpnKMscPpQSh3dZvyFbZ8z58FEYbpZWKz/ZszqQp7knpQRv2L2cOz4LHugx
	TGmAkAmAHx1SsWqG7JKc8TXD9Bvt/NemxSFWncCWS6RWaa67TBgg285rOGfUG0ywBAFkkNjvnqN
	UowFQ+Y1VF4VDqa5TqOJqeZW7P5sboD5Sr3DuSM7EnvIwAy5qoDgusXwgS/9aEZ+iL8F4Yot4iZ
	lbxp2KMr+4UfxjWfJZUAjlHThv2SO0UljQuufoZDIQTN02pCwLp8PLw4Cck4spXYMbQ2QlpPIxf
	63rqpms7cslxRiK3sL/tB4LjVT9/WwxNgUowrnNumQ0VOS53PaeR2K4=
X-Received: by 2002:a05:6870:8a0f:b0:45e:d660:b87 with SMTP id
 586e51a60fabf-486e5134a5amr5951125fac.9.1789842775310; Sat, 19 Sep 2026
 11:32:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714222338.2965707-1-dianders@chromium.org>
 <20260714152138.7.I5cef580a62c86ba6c3465ad336fa509afbdf1476@changeid>
 <CABb+yY3_xBvQVFHEs=v39u7+TLjJRaVv3sg5pGgd0YxCruZ8Tw@mail.gmail.com>
 <CAD=FV=X-fAJp=EG_yTAg+QQgNYRCt25947oHGHZuq-FEyirK0g@mail.gmail.com>
 <CABb+yY2CH5A1ixfX9czgtEwsP95FN-2JVzN_wmRDRNsSuZY5PQ@mail.gmail.com> <CAD=FV=XiguzS7nH1sE=BkXt+7G6-hhqyz5u3sjc4zAA9H7KqJg@mail.gmail.com>
In-Reply-To: <CAD=FV=XiguzS7nH1sE=BkXt+7G6-hhqyz5u3sjc4zAA9H7KqJg@mail.gmail.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sat, 19 Sep 2026 13:32:44 -0500
X-Gm-Features: AcwNN1UwvAj9Edbq3yWCycTjTBcB7wt1MSsw00_ytosOZYg4EL85_GmD974H8ho
Message-ID: <CABb+yY2_AvcnaTDmpL8gP4H2_Pp3HddrtNr5gvL4GCW2DPPvOw@mail.gmail.com>
Subject: Re: [PATCH 7/7] mailbox: goog-mba: Introduce the goog-mba mailbox driver
To: Doug Anderson <dianders@chromium.org>
Cc: Joonwon Kang <joonwonkang@google.com>, Subhash Jadavani <sjadavani@google.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Lucas Wei <lucaswei@google.com>, 
	Brian Norris <briannorris@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 11:57=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> > I am suggesting to consider TX-Is-Done when send_data() returns, i.e
> > tx submitted is seen as transferred. You anyway  don't catch
> > transmission errors. That way you fill all slots without blocking on
> > the first message and achieve this same throughput.
> > Without knowing the clients I am not sure if that can't be done.
>
> We need to know the txdone and thus we can't do what you're proposing.
> In general, queuing mailboxes are used in cases where the remote side
> enables a resource like a clock or power domain. Different tasks in
> the system may independently turn on/off these resources, so allowing
> them to work "in parallel" makes sense
>
It will still work in parallel - you still keep writing to the h/w
fifo without waiting for previous ones to finish as long as there is
space. Just like you get here.

. ...but each task needs to know
> for sure when its resource is finished turning on. If we just imagine
> 3 clocks we want to turn on.
>
> clk_enable(clk_a)
> clk_enable(clk_b)
> clk_enable(clk_c)
>
> Those 3 calls can be made in 3 different contexts from 3 different
> drivers. We want all 3 enables happening in parallel with each other
> (not one after another), but each call needs to know when its function
> is done.
>
I don't see why not?  The three requests will be queued into h/w fifo
in the order they arrive without any block - just as you do now.

Btw, if you mean they need to be enabled in parallel literally, they
should not be called from three different drivers. Instead they should
be modelled as one "composite" clock.

> Does that make sense?
>
The usage makes sense but I still don't see why existing api can't work.

Regards,
Jassi

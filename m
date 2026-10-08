Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB60F3AFCE5
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 22:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791498255; cv=pass; b=oOnT6mMJZGTNCmJA7/Bq11r0g/jvp5jO2s4xQHmtNl3+TKHQQY/xKTG3/FOmqSXCXRwd2TgEMH4inldAd5v1mO96oJBkhaAYzmqxHOlqlVHnfEr0cWJvmO6Z4bdJ7+JSIqCs3pZtuLlHOMLhxA7MSS7+EGrj91TuVsZ0d9fZPCM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791498255; c=relaxed/simple;
	bh=d1lcpdRucLT+zX+9QkRSMu0LTTvzjFEs561pRythN+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=taWvtivStT7ckhknjmt3BPcxLSCYZ/dHij5hTJH9nEhRU61F7UMtkACWGWWwMNYl5kYrP9k30Zc+E4PckWnng7m15TtNe8ByBOOph0dzuKLkNBqIJwm6iUZ/h6s0clB6WyrcgFYpxfS1qLepivP+2rP1uSOwt0dEfooxuntXbg8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nuro.ai; spf=pass smtp.mailfrom=nuro.ai; dkim=pass (2048-bit key) header.d=nuro.ai header.i=@nuro.ai header.b=hJ9Tau22; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nuro.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nuro.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nuro.ai header.i=@nuro.ai header.b="hJ9Tau22"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-33c2520ad38so8430873eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 15:24:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791498253; cv=none;
        d=google.com; s=arc-20260327;
        b=S234MJV7UcVsglkQqUV9Kv0iveFV9Bcyecwu5PTXDXnp6SPKWCcZuMnp0WycvXaB6Q
         L/+7dZOupMVYm5n8YoqzsKbwdP+2CQgL7F3KQ9wg6OD9op312Iy6Lmo0yiQc4Ocgxzok
         vB07dwlVwpFTvWGL7XgfEmYzGe8H3DYKTVRsRlrDCXWEZzexD/Fa/iO4EdOC9QboqtA2
         8akBkeWAU/hH8paJB2TYSmrQ9V5uvBHID7u3654S+PWCEfZoL8IJRiXL3VdWOz3xDPT5
         pfBIS4R/ZiC/bsOaJf/dE7D8AtA2DSbuyIF/3mInk4+/bEKgdeqN/12ji+XIM1PNdfIH
         H86A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VgKbj22kPsYva3E1zTdDL7ib6ft6rMcvOdO9YhTwC60=;
        fh=dg4SGwuUVrsuzJctCByR3Dm883WhjFjNUrXJiX9wlYo=;
        b=L2XZlum5pv4dGt8Ox9rH8LAFxaN9qY8v/EcVRPYnQmkI4GuPRsSM0jFSytV7HuAGvj
         Coox4NMKt4TpWqQ1Q94yNABLRgCU1gagE+yjCbsILBr1oV7ypTKuUCrvWGfxT2qysCNP
         IMT9e4xCgAuKf/+ugMoIvgxZEq704oEziWYYEFxJ//y0p2GYshujZarcq9/nwItPznr7
         x1djscE1RURpkEQMnGQYq0E1ssqj35VYmB7h1uJqZxXu6Boo7aIvDQE2hDfqNsuVs7+z
         iGr2FTd2hta2wvHKgOqnn6xPstam5CAvlNC2X/8QG0C1AVfGmM5chaBhdj6d8EL9iyPF
         +cag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nuro.ai; s=google; t=1791498253; x=1792103053; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VgKbj22kPsYva3E1zTdDL7ib6ft6rMcvOdO9YhTwC60=;
        b=hJ9Tau22LIGbTDDwaGvy8yMQmviGWaiZO+NzIlIrsVtEYD9fH5vxo3NwWIUUvdnFH0
         99LN8recAn48UVJiNVBd+swympPOeO0ayyR1bSuh96ZRnoMs2oQzsjfOiNDMwke6P1Lh
         v4xsb0fMSNGTqQ7W/eoidsfECL2rmp5ynELEWYEceZFMWO7DA8RmBsLdVJy78FLbEsQE
         4TLxmOeRxbHrU6xApFLPFXGM3+91WRV5K5lU2LIvyE/h//MGcvL6dhQO1FlAHbsI8zda
         0RTORDbAmdXkdXyQJ/xnTultscoDF2IB0pFPSVHIfK3BUoIc0v2aSnJPw9hf5JuBQolC
         Q7Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791498253; x=1792103053;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VgKbj22kPsYva3E1zTdDL7ib6ft6rMcvOdO9YhTwC60=;
        b=h/YruNhmf4Gk8GpmfyN2kxN0dww2/rk2DKnsl5TVHuILrN2HHxAjnpXWO/whWEvFzM
         U5cPaBRwbz8Z5CEqCYqNanYkXDoVdb84LYJWweUPV8Imcvj7EJtGr2W72aKWVrEdeGas
         vPQRUbdhavrkWf+TUn3mehHQUU2E2pwARiptU6z6fiy7HIuW5l9jRBwjH2PORvImRPa/
         zPbRdNZ0k6sme2h1YJflXT9x+CIuzg/ib6OACBKquUeZBynYQLeF7j6Fza6xyWLHEeL5
         AHtVxBsKTHLX0hhI6Ktxir0gBngQbRTgOQegLdGeC/wvUM55HG3+8XhLRhkboOx5Yc9M
         1fMA==
X-Forwarded-Encrypted: i=1; AKwUvBytgRpWYZH8+QOBsukKzoC1blpUd7IWIVosqbaRXoMWLRUwdCfQ9Qiz2ynt/339Ne80YFkVi2fjGALCulg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLq8+nr5MZEOFzjoovA6G7zte4Y8nCtrg8eKNyeKcRti/vyhuK2
	XSwy3D82MT784dt+4ya9OijWC3sRCBwGEYcgbdiv23qv5bvOFs9AD4lobYSU7cL1EF6dNWGIQ4d
	4HK6CQ2dqksoMv4HLlXRTBSlBRhJDIyTkifX3h5mVaA==
X-Gm-Gg: AYBFou19P9rOgvm8EYjbh+l9UNV65AfG2+t0/ugUwNOmJHXFWCPUf772ITdYyUgDtbP
	eiJOF6yse0Xy1CgtMmVblauqOYUah5G1KO0JNfp6IWRpsDddPlBXtLozFxGeb2KfKp7H3mUoV+U
	aObBUv8Skjd3n6zNR9u7Aidy6JpQaLtmf8YDJ5oPGCIU5PVQoT1i57v9d4nXIo+5EP2Li6ZjQxF
	0x18WCTh5NBEW30IPqVMBeGcHAQJFsTad+WrrACSrX/OgUo7wLXxhLJSPTXUFwxKVnqLIEe96Gv
	RguxJ0p3lhfva9jHwefkXpa+qj8puBx7Sn4yjitI7zGdKigaauy9aqo=
X-Received: by 2002:a05:7300:cc98:b0:351:5112:ec4b with SMTP id
 5a478bee46e88-3537dedab3bmr317634eec.2.1791498252636; Thu, 08 Oct 2026
 15:24:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008220256.1844072-1-jkain@nuro.ai> <179149781385.2527009.3611488194198236417@kernel.org>
 <CA+Y90PgfrfJa2057FwbW5=9LRBOqh0EwgWW9kPqynWoFhp7-Fg@mail.gmail.com>
In-Reply-To: <CA+Y90PgfrfJa2057FwbW5=9LRBOqh0EwgWW9kPqynWoFhp7-Fg@mail.gmail.com>
From: Joseph Kain <jkain@nuro.ai>
Date: Thu, 8 Oct 2026 15:24:01 -0700
X-Gm-Features: AclHuK-cuP2aiKd6yjMguJrW4Z2QQ8a2uy7mHgXLL-CViqgagADPN7FV_yLG17s
Message-ID: <CA+Y90Piue3DGh5tMSSaCs32q9u8b0bHLruiuz0MpSpbkWTw-3g@mail.gmail.com>
Subject: Re: [PATCH net v2] net: do not let defer_count outlive an empty defer_list
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, edumazet@kernel.org, davem@davemloft.net, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, bigeasy@linutronix.de, 
	clrkwllms@kernel.org, rostedt@goodmis.org, linux-rt-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 3:23=E2=80=AFPM Joseph Kain <jkain@nuro.ai> wrote:
>
> On Thu, Oct 8, 2026 at 3:16=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrot=
e:
> >
> > Hi!
> >
> > This is an automated message. This series looks like a fix, but its
> > commit messages seem to be missing some information:
> >
> >  - How the issue was discovered, e.g. hit in production, hit during
> >    development, syzbot report, manual code inspection, LLM or static
> >    analysis tool scan.
>
>   Manual code inspection, LLM-assisted, during a backport -- not hit in
>   production.  I hit the heavy contention on sd->defer_lock in
> production and had Claude Opus


assess backporting.  In the process it found this issue.

>
>
> >
> > Please do not repost the series just to address the above. Instead,
> > reply to this email with the missing information, so that reviewers
> > can take it into account. If the series needs another revision for
> > other reasons, please include the information in the commit messages
> > then.
> >
> > The evaluation is done by an LLM so it may be wrong, if you think
> > that is the case please reply and explain.



--=20
Thanks,
Joseph Kain

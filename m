Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792672261;
	b=ymBJl4tLsAarP2ug3pltSi6rneUUJGffESNuv2PoDK9qjw6fTGz3I3KO7CBzCqiT1Kkj
	 60cJsqwwcFTVkq7qy75GNYmpxFrJr0DTHw/GsdppkiZX2hBGBrEb6hpeLlMeavFEZQuip
	 WhwE402hNr0m+vpcggB6FcxHGsWKpTh2CUj+1+6pnIy5MziZgkPPHxovIRUlMqqAMwSK8
	 etoshCY2VoSaK9ZnDHYm/RWGfQLOhCkElJDsZiiT0otyOQXGdRysGegfu0WM8/Bzy+288
	 J+H2K28iYAMw4NO3jLC/x0qrvex4SXBvxa15qGyzAPaKRBGSZFjRA77bkL/dSNWi4+A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792672261;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=lGYMsLv8l3p3TRmB4tMktTBQwkVWbogMS0TSWwwLKpM=;
	b=KhaBIoa/qK03JiWbu2Bv5OPI1QP5lO9aDHc0JmRViFefAIlHy13YUzyGpb2ZCt1+P9c/
	 Wa9/fpyfYtLATW6ZUQue4X1Gcu073kZmU8R5w5zT3UbEccwvL5eGofhQbBe3EAzxGkU3V
	 Wo85bkAnlktJuqMMM+DbRHpq/6RzQmMRXDlvRm4JmCVX4+FXWOOHE0D6JBrBcpDFlyJDN
	 nqGZHGrdXKwZxtxzia6fg4K9p4a0DJ5lKGg6rnq0EqpHMMbRkkJkG49QopIsl0nw1vBm2
	 +oHQ1Xy/dIMeKAew/3wDDWrmG6pUPE25mJWydNkgvOviCticJKMVU7tabS7ItGtZjZg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=szeredi.hu;
	spf=pass smtp.mailfrom=szeredi.hu;
	dkim=pass header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=Zy+M28iw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CEE5606A320
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:30:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CEE5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=Zy+M28iw
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5361e313e63so18604421cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 05:30:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792672259; cv=none;
        d=google.com; s=arc-20260327;
        b=Q1p4yafSLbP+W2S7+MuiuOepZnptTjOpoKzeYGIQGniq2JtavoQH2nxgP/v8y8tUZM
         0Jyc9JJvaw1GaYaJSfF3KmxSrBak+dwI2+34wjcUWuDfLN1en8x/46QtSNfSvO8mD6GU
         ngOqsxHj2+RlVsvSpW7NSIa/9wp7QM0gf+wB/1FNYP3kDu4jyfwxXxTiM+ZXtqevp1SX
         qyd35hH/d4UOUNLGFwD1hQlMW4ZmSB7dvAkIPyo2cyZCngmsQ5AkK1Dx278oA843DdtU
         6xPaNfLZD54zFo99kKE5J5HFd60kr8akgllFdqLWNgzPJyGclLjfZvdk+nEH9zqrmShW
         rS4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lGYMsLv8l3p3TRmB4tMktTBQwkVWbogMS0TSWwwLKpM=;
        fh=WsO82xYnz2V2SGAk2EhV/1p9HoKh3MIS30uJnRisjCw=;
        b=INRcLDKgt93m9SxrqhwukZHJSrMJ/9Y78Qd3gphT+nJZoexP9MkebZpAtIBlbr156v
         ERgXLV6qyla6UG2nxD7Bl+x6kOnGrTvcNAsBKOpILHM5wnvhUtZRIXl+Sg/BOmfXbN3f
         ApQRGmSLeCwUv78tJPSuupoRQTIY16sg1js76IABSiRCo3C38KnV/rg4w9AYV2BOoFuX
         Iwrwcs22i4ooBnkP9WpDEkHOxesUBzGQ/ql3yfCSa3SIwk5jHuzKhCOy8/vvmRy7iRBE
         G1hYjdn9EN4cQj2ogM13WFW7puxHXCUSzLW19EM0uJokPGV9qY1/dKK4f9wercUjTmAm
         ZDxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1792672259; x=1793277059; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lGYMsLv8l3p3TRmB4tMktTBQwkVWbogMS0TSWwwLKpM=;
        b=Zy+M28iwJK07ER0cPasCm2TNbM+SqRw8NNjHRfPDKYbCthGDITArOYiFFI7ixQNJlA
         AiZ/laxHOe8IDLDbGAFraAcyTJUpBAVhYU3cXjiyaNKDih4qZddFP5eyx/sdta4yZTMm
         yh4QU9IlHi6W7zAvi5kyqis85p1XgATOqgwqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792672259; x=1793277059;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lGYMsLv8l3p3TRmB4tMktTBQwkVWbogMS0TSWwwLKpM=;
        b=OA5B7+MfR6KPPHnYfzMFC7vbhR3GAIEbkMljgHkBJTJTdC/7kP+gffKs7xhRyXWIVp
         eZtz3Ho0dflw6zjBhjL4jqLevJ4tk3GygrECZXEI3VeNbMD40dWSETDBn8mCJtXi3xqk
         +ZKIt220nWIriMBa61LmryQMsDzK35Ol6y2+wRuFaPu7NOHiNHQrwgKCoqqeXINj0L91
         oXjErKFX+MnHidloUfl4r7R9Bf3f3lUsotIB5xm7crcIqtPis59hUeotcRhE806AV7tt
         JaYipa87M7aFhTEnN5OLT4FtpfLTGdI8G0QgiscQZjt5GHpmuCbNZhrRoJ6H8KFS9Seq
         vvKw==
X-Forwarded-Encrypted: i=1; AKwUvBwZNbHw1hiBBIMuNplSBYDs0MoAkmQ5apgf2C8N6BpQTH/jnnt0CrGAn2E1TpcHheyyEVLpQ6YeGaf8DXc=@vger.kernel.org
X-Gm-Message-State: AFq9FYITRwJ5+4rh+yZOv0gs21vCE5qQEQ1M4aadLVt80zQvI6AlliMA
	IXRL4THNqiwAxiSJOsHSAqsg9+BODucfg5iWW7dykE4tzoIWqpVbKabgAnbrkraeY0vdqKSR1k9
	1084Ce0qDb1+uZ/G9A6rcVqB1p4UQdvD7o1AijY0vzQ==
X-Gm-Gg: AYBFou1Sgh495utpO2zpeLuviN+MKhaZ89xrjbHtXsnmCu8wGqgrsMmBR8Mo8N4/UTA
	I3qjSK4XQp+wI2epEtVjkufeecUDBGOYFMloJzZXBwhrAhwAvOLyL4eAMpec8npE5Ddnl7zCdiI
	rweWZ3Sm/DBl8yXEvNcOYIflU5mA6IH/gA/WPbRe1Edi5daDQSLAUZHs4kTyIalqGER9StOe8ge
	dDYFEe4nsEJCLEcZ9RXt8kT7k6ZIcBsvA9VrWj02ebbzdcPwj3yZZE/ZiYuEjX/FVv6MCR0IYAu
	ZxE2qKTS1lA5ZEZzHSgUpbKeu88HTKthYigVtmLp8Bw7AV4owCp1n0avfZpsCajqiE+/pspbzbl
	x4x/SrlltZ2HJpcCZng1F1ENPlbPJjMh+xZ4wVQbaPkW2DX5WMZT4USS+9FSgJj290tAe1kc=
X-Received: by 2002:ac8:6f0e:0:b0:536:d47:257 with SMTP id d75a77b69052e-5369b82b7bcmr72708191cf.51.1792672258882;
 Thu, 22 Oct 2026 05:30:58 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019000810.1837917-1-neilb@ownmail.net> <f1c42d0bd125c6b1c39f1ebaee41340b5f6f03f6.camel@themaw.net>
 <179237697885.1724252.11956785709205194840@noble.neil.brown.name>
 <d0bc6eaac2fc84cb43b569f49ee503057784b45c.camel@themaw.net> <179254088039.1724252.11440960537426762855@noble.neil.brown.name>
In-Reply-To: <179254088039.1724252.11440960537426762855@noble.neil.brown.name>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 22 Oct 2026 14:30:47 +0200
X-Gm-Features: AclHuK9MUQBIzy_P8SrOi74oPIimO0SpPERBXe2T3G_bWnQb__EV_qN3updqCD4
Message-ID: <CAJfpegtDffRgzd3GGBfk=fTae6R32pYyStXvucgQwVdr3MTT6A@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] Fix easy bits of the negative dentry problem
To: NeilBrown <neil@brown.name>
Cc: Ian Kent <raven@themaw.net>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Amir Goldstein <amir73il@gmail.com>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jake Edge <jake@lwn.net>
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Oct 2026 at 02:01, NeilBrown <neilb@ownmail.net> wrote:
>
> On Tue, 20 Oct 2026, Ian Kent wrote:

> > The source of my concern was originally the traversal of the entire
> > list of child directory dentries in the notification code to set a
> > flag that depended on a parent dentry setting.
>
> And why this is a problem?

It's a latency issue  at umount and when the dentry list does need
shrinking.  Keeping perfectly useless dentries around does have a cost
in that respect.

> I think I can fix that, but I would like a report of "task X takes 5
> seconds which is a problem because ...."

I think we had that discussion at LSF, and as far as I remember it is
not theoretical, but I don't know where to dig that info out.

Maybe someone on the Cc list (Amir, Christian, Jan) can remember?

Thanks,
Miklos

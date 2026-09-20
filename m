Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE37175A95
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 04:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789877585; cv=pass; b=P9rjLEfX/m/S122JYrpwZeu1N5H1rwny7p80iLGFICYEtxUs0NlMqZC/lpL3C+Pmd0vaHnrofxqstJ4T/Zgfpoiu6eEYqgOfWjs2vsDs7S2Dfsc/Qk5irsjK7Vl18eP3HC+Mh0N8xa3lQGZKOTwMZCPCwm7FbeZMLapSmFtrAoQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789877585; c=relaxed/simple;
	bh=YnbfoGjlPz/vXewRAon37V0GQH2iNlW079+n72DtnPw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r+yUxESoiPTikxMGvukdQg31/5WR58iPyGbAj1wW7Ywf8jEq/+9+9ZTten/ttEo7+O4AWLx8JzzwCVZBB6pMqnaoeSdy9hohviVcYEkEaCCoNMw9ijzTViwOsLrLY63VjLV/0OsEvnKRT3EzH4ZOnHHkUPyPuhSDAv6jv15ippw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UYtZjSgO; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UYtZjSgO"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398a147688bso2059229a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 21:13:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789877583; cv=none;
        d=google.com; s=arc-20260327;
        b=AKk/g+T186Wi0wEX/ZfGozChVwNolIma4qNSq690qHS6JhByZvfl6g0AZ0kKG/SJA5
         ia8C039aq/6ZLIMoQ96NieWcXVIrTkkVz6OiVbOVzt99ij7Cq63Cx4yuWfQSor6BVedh
         Yxq01hjqnSJpUEIvR9OFz4g7otdDDnRqJ8byS3vn71P2LBg2t1ht2TOmEp077XLq7TGg
         oZniimoKyx/2cof4x38M1zxswlwLnI7es6Gmo8Kc5c5WMBnxH63pQkRT47Dj3R0rvFmG
         6PCqrvzAsp4RPM7UGKjL4ntm6L7Wpw78riWAwOJJidGQxjtEzD2/DcXZwMJRDO6qYhqA
         kOaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lMBYWtgVXyvrDIrr8C1PhgNJhaQAaWgNpoxuhRqTf4E=;
        fh=TWI8nZorLP2cjEPdM8PcNevlKT2p5fzqKGNuymGUwbY=;
        b=jko1v/zIt/EIFMf+ipLvVWLTx76yyGCz1FLWCRwgcsBDk1IFZG46XLxnHdHwMvR45W
         HIPzR5XbrmrV/LM+B0MVuhLoNLR02LhbrK5jhM8p9ETScFkM/+NxYR1cnVFXceaf9bB3
         62Aw+hpfArWFGh9XVmsbJMEB82mxqU8+CORcqniBeKo8fTLwwd8fh/dIuhAy1wb+sv49
         2T/MSsTQhRaGAfqsx/j3u961wda+ma/WLbJj3LLQdQF4FKp3/j0alOy2d2KVlgbiBF0O
         ErriL4hgm620Db01wA3KEMuIbn1ZYgqpsK+Az3YfMmxf7nXzYnEarRWEAnJiabRyJzC9
         txjQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789877583; x=1790482383; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lMBYWtgVXyvrDIrr8C1PhgNJhaQAaWgNpoxuhRqTf4E=;
        b=UYtZjSgOb7tWjVBeUmKh94Ecz4mxJxMYlkMSojAc0SbuMaD9X/JbFHzze50OUNnDnT
         VsP536xgyq9Y179EtZVUsXc6oFXJNYzmn9unqKsal/81JM1xltkCMkwW+PvWF5HmA/UF
         fU3armDbeUKc6IKSxfH03JdciBAbVgY+J94E5Wx2fEhyn4E6LMlDigmnVVCuu4bvnHzl
         BeQBWdKIsPksQVKFByO8Q9uFyFTM8KfgQSmugBVJPsMyanfLCqeeCXqMHz2+pDAt83ar
         mDkn896cOq6ZbgShX2QkxH3q2Cr0bJiL08o7edTopFyXzEIc/5vOn9BKslRUm2YtaKnD
         m+uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789877583; x=1790482383;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lMBYWtgVXyvrDIrr8C1PhgNJhaQAaWgNpoxuhRqTf4E=;
        b=jUpS0GqnUFa5uIyGF/4Agz2tGFQ7c/RikiY8SObQuDFLJuoaM6lnBCBXdlfnpxsdRM
         C6tWD/vGghxaobf7NLWEYp93BPlSCIPSP1DnvJpa6plOfiW07k0SHFlG9mPmkKGHeuPg
         BcbVwAIlHWIjof0nnNNqlnA+QyMs+WDg6F0kbXORk13xgXQhXeakwi60JFBoBeFbySYD
         Qo+5jffReqZu6D1Nr0zFcYsJslH62+030l3x9Fnc6BkNaHBOLOgA+kZrJ0gy8puJbMwD
         yzJeGLUQFXgNFbhxKH2OuyGHCMoCZCq+GH/wkq5udj+9kSXmsZf0XJOFnMDilBhtwBj9
         Po0Q==
X-Forwarded-Encrypted: i=1; AKwUvBz+x0IAFH+y4zIbKVGdJ0x19vjjPJCFK3hRapxGbah4Fjykrdmh433vrJ1E0RQCBDxoWvUZJ/7xdT1oIGo=@vger.kernel.org
X-Gm-Message-State: AFuF++nHrX7IjMtabwmbOG3krp6+43b8IziGYmABopEqIhqHH2mQpYCN
	U0LgEofD32ehHRNGQxgV76PYr66184DwtG8Q/PZrDW5tDbl9ak4TR2ZhBh6hi3XJINa5ATFvNcp
	jo471/DD0wmBu79JHJnOIdTi6Vx0PYQo=
X-Gm-Gg: AYBFou1K+2jHykdkeIDXGjXkYzLmZIhSqoKGwf58+VjIU9eSrMljV59bBDEP4y65qZ8
	IJ2gPKvMT8/r+w6jEhUiejtLTxGUkUamKAYI+W8xux9BR3FennI5SrN8t1x002uSx6jSMgrFGeT
	naY4gsducjFPtrllJm96ttbwXSgsXkm+0Zf+EoQHmKj5bA5JP6di35imrt5fcCO47SuegGURjph
	WXtqmu2sJqEw5g6nnN75d1E7p4uhOmj6fGFGsOMRQ3Zti4GwnQOYC2ITrT8a7Z4u2msoTvR4tg+
	84un5H1EmAtjZssArd/xBZ3MhA9/p/fQGwQ5jGA0SF8ZFrUYAPpW7f0CzfH59xDSAEglD6nU/s6
	m2F2bFZlTML68HLCgPL9CRIxygA9zhgY2ETm1gMEh
X-Received: by 2002:a17:90b:53c4:b0:39e:d2a:e2dc with SMTP id
 98e67ed59e1d1-39e54d1ea4dmr12330513a91.12.1789877583183; Sat, 19 Sep 2026
 21:13:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1789753020.git.kimjinseob88@gmail.com> <e9d1f8f8d69b76797d617965f263df97b2b586e0.1789753020.git.kimjinseob88@gmail.com>
 <20260920023057.71ef0eb5@jic23-hlaptop>
In-Reply-To: <20260920023057.71ef0eb5@jic23-hlaptop>
From: Kim Jinseob <kimjinseob88@gmail.com>
Date: Sun, 20 Sep 2026 13:12:54 +0900
X-Gm-Features: AcwNN1XJYd9uoJcaQ1q60GQ-gnIw90dguuHYkkkGbV7JngEnuOZEzR8A-Daiweo
Message-ID: <CALMSew+LJjky+3uSSL3kByzpT-tkNmJTDurykNmH-nj9+zxCJw@mail.gmail.com>
Subject: Re: [PATCH v10 4/8] iio: osf: add validated stream parser
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andriy.shevchenko@intel.com, linux-kernel@vger.kernel.org, 
	rdunlap@infradead.org, joshua.crofts1@gmail.com, u.kleine-koenig@baylibre.com, 
	julianbraha@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> You could reorder these two functions and call stream_reset from
> stream_init. Would make it clear what getting to a 'clean' state
> means.

Agreed. I'll move osf_stream_reset() before osf_stream_init() and use
it from the init path in the next revision.

Thanks,

Jinseob

2026=EB=85=84 9=EC=9B=94 20=EC=9D=BC (=EC=9D=BC) =EC=98=A4=EC=A0=84 10:31, =
Jonathan Cameron <jic23@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Sat, 19 Sep 2026 03:24:42 +0900
> Jinseob Kim <kimjinseob88@gmail.com> wrote:
>
> > Add a UART byte-stream parser for Open Sensor Fusion frames.
> >
> > The parser searches for the OSF0 wire magic, keeps partial frames
> > buffered, checks header length and payload bounds, and passes complete
> > candidate frames to a registered frame callback.
> >
> > Candidates rejected before validation drop only the current head
> > byte before resynchronizing, so a corrupted unvalidated payload length
> > cannot make the parser skip later valid frames. CRC-valid validated
> > frames are consumed in full and classified as handled, ignored, or
> > rejected.
> >
> > Use a direct callback member with an opaque context and keep explicit
> > statistics for validated outcomes and framing failures.
> >
> > Assisted-by: LLM
> > Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
> Just one trivial thing.
>
> Thanks,
>
> Jonathan
>
>
> > diff --git a/drivers/iio/opensensorfusion/osf_stream.c b/drivers/iio/op=
ensensorfusion/osf_stream.c
> > new file mode 100644
> > index 000000000000..e262415e69b7
> > --- /dev/null
> > +++ b/drivers/iio/opensensorfusion/osf_stream.c
>
>
> > +void osf_stream_init(struct osf_stream *stream,
> > +                  int (*receive_frame)(void *context, const u8 *buf,
> > +                                       size_t len),
> > +                  void *frame_context)
> > +{
> > +     if (!stream)
> > +             return;
> > +
> > +     stream->receive_frame =3D receive_frame;
> > +     stream->frame_context =3D frame_context;
> > +     stream->len =3D 0;
> > +     memset(&stream->stats, 0, sizeof(stream->stats));
> > +}
> > +
> > +void osf_stream_reset(struct osf_stream *stream)
> > +{
> > +     if (!stream)
> > +             return;
> > +
> > +     stream->len =3D 0;
> > +     memset(&stream->stats, 0, sizeof(stream->stats));
> > +}
>
> You could reorder these two functions and call stream_reset from
> stream_init.  Would make it clear what getting to a 'clean' state
> means.
>
>
>

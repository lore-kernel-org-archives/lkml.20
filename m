Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A49447ECD8
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 23:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790033024; cv=pass; b=bbuXyFAIk7w/oX2MEA9QjokoyGEuKRQ/DcRSm90d58811HqR7BYBbMaN8pG1FO+ce4yYrJL0+4TUIzFfDUtt66yyvMwbzPC6b7/M/zYUD+GpIDAC1VMe9KzDqvb0UXPjGVAv+t531HvPYtNUYl7bmQ4K39gyMmZgdW3HxHMHtYM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790033024; c=relaxed/simple;
	bh=r5QiXqCchrMFvJCvPkpRAqULLs7ZFYORWPkOWSHrFEw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L9rRsX5F+2KgFFekPBV0s1E+9DfBscVK+TFzTRJsouTfQGocMQUdjDa1MX9Q+2OK8PjrMW7fbBAq/mCtu3IioV1jNxbwP3MbL9jLbmfraRdLSABFQ4dl/KLyhPH7nC8AWE5m6yH4N4oknzMkncLqIJ7vRoamCnjwvQX+d3wkOBQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LJsaF3z9; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LJsaF3z9"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f6c7a4aso423018566b.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:23:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790033020; cv=none;
        d=google.com; s=arc-20260327;
        b=io6+oQLH2M+4fl2h42cNqIMrrREA44FLVyE2hJz8GDpI4fen2efpjfvi+y2qeOQ0OB
         VuPoMZncsmZbR40TxuqcdKyM8WsArWLgKotBcO6kaI++Mi9WZo6aV5N3SB1boYkjViCD
         Xm8zwF2u5EmWFA8oQe3Si5oWNPthm/So+S+oW4Sb4kaCvS0zgzg+16PF0s3G6334nbMz
         7ZWbb5Hp/4Ca0Ft3V6MYVLgZo7NEwFmapbtjx3MC7cVlEMnY/k+33HllvEgTkzkFV0EP
         YxShQWW6tYmur3Pvzwv8RNSCXlIGVT5wPxw07NkdiT8ErRMkkGjqAVDAHygfmwfbi41Y
         Dt+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XzhMZejNm2OuVwr+sOWIYUKaW7eYVVaE8fuZkrcloXQ=;
        fh=mhNfClsTc3orMFK+JSS3lfQ4Lv5J6czlHCeIGf/h8qk=;
        b=StEMK+DB0Gap7EyrRmXMAHuFnMnNH+BtKnMmQHd9hLNSJ7ebtIAmVofA88+ImQHeQn
         NAQhFSk1tBFJRaJ0VKHKA8ekmo855Yc7T9oTt16Nwg5bsUqXoJQ17SHHa86tCgfCw1fk
         8vZejzwlDMRbnptnbTgwjw5Jrh4rk4nCPLXgrkJjRAm57KXchtmi6yo7nwPsEKw3cU6w
         E9a6gsyFBiFGzrCIhwy38MZzeFleXl3pRUAhjX1Ay0AjXj2HaRQN5G4wr2sLvYkTFS8I
         bdKMFVqWpCJ9o7ydGcsyorjcGRYEmy6hqJ4yROTh1bFxYEg6I5KuRkCryql6BrpbmKTq
         bqQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790033020; x=1790637820; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XzhMZejNm2OuVwr+sOWIYUKaW7eYVVaE8fuZkrcloXQ=;
        b=LJsaF3z9qmDPc76EGdkwArfBoOqODb+tC58zWWyORms8jSvx0aWty8rZQm9UtlQxef
         h51/3f3i/2c+tj147fYezJ2Jqc+lSS6UJyPNar6jwD3YrrGyALyTy219rnT5wNWnFkaq
         zS3GoHs4fo+It3hu4L8wW+RqUtx0IGsGstuFxV0uqyoGHMCXwj9KaaJOjo6gV8rq7wpY
         psSRoY4MyN4/gFVxhxg/ZDo5977pbAwIZKdYvSU39QIXLagRcWhH1PLl8Vf7K6FpgJ2N
         BgIe71+2/emYk+/QJqIOQ9h/wxQD4a/WFeR43yIYXJGMgdw2em9eY+Z0XhlSTUWUya0o
         HR9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790033020; x=1790637820;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XzhMZejNm2OuVwr+sOWIYUKaW7eYVVaE8fuZkrcloXQ=;
        b=AFl/eAuqqufNPyU7jPvRwfC+5Ph6j+3pltSSw/+VOgzzqYiYKczG700v2us5lZ6JY7
         hnekWPyHzFP0R2Bsa2Coc06z3ndXbWq7M+2yrL2yLmnDUzpjLLt9DluTymXs6E509ZcE
         +Wnp+wFNLQ0VjNDohMt4GzSNOj0t9JBZGVLR9Zp8GLRbJDAW7iy1NCdFPiDzN3KisxV6
         U5kSDY/PpkqTXh8exr/RsZOegZjTkDRRrAqSO5JnowKCuvJnX+IbYzmXApUmqnP9D4ay
         yYK657+/M4J/dIrXNxoH9sLwg4oxroMUY+Zk4/bWmoVf6Yr1DmAkpTAcfHGPOXuyi7dC
         uiXg==
X-Forwarded-Encrypted: i=1; AKwUvBxGdTbjtipBvXb055ICTE7vgZegM4K8ezHeZGNF72vzCjR6gNGgNnTC6jOJ3AD+aXtO4+D01jEVmZqz/s0=@vger.kernel.org
X-Gm-Message-State: AFuF++kToISXv3ZLECyCZue8+kWio3W3tx65KbF7N9JTEhiXc4wBCwyF
	JMmZhueF2EePTHf8D0W8sKwE+y2VYRsLlEuL06JsUSOGIOi9HeX7gpHqm81P6EnfeTRuo3/Vnk/
	UQuS/JwYg0x2lisSLL4WmwbmDXX3u0bgN0CmNnjoG
X-Gm-Gg: AYBFou1J8zC1EC+meBCP7LvgNpXcujXe8rFPv0opkJnSU0pFmnZmHiQJVp2uu4FxrvA
	7xrPkFglAK5G5DAA73Xdk5Rnyi0+R9SFF8F3dboW8+ChecQvfOLAf100X61YVsBYHGGINLckErh
	3dtyKMRuNhNtNiG9XWzXX2zWWW1NMPHfqIHuw4iW9c+6tkcI/R/vI6+Mjj/aDFisDViP1/T4dOR
	6b2OKpyvKk8k8NVd9zmz+W4arkvpFhq33gacVk2FGx8Irxm8o3Ic6GapwyGC+LZFu0PryFxo00N
	zMGreN16JcHVpi6k2f/pldGxEekaZSeLPSxiqWiUF200LLr9JhJDSpYdw03M7NxYmY2CXwoIVux
	ilensUTFaj34VtMoX1Vm5iPOiBiEQqF/FJ3v+yVYzWqvjpZGfC91ITc1KFnb5PQ5/co9n2V88yp
	8+hpB06LrIwaHLrKKAsTRVebY=
X-Received: by 2002:a17:907:3ccc:b0:c26:1649:47b2 with SMTP id
 a640c23a62f3a-c2a15b8fc3fmr982971466b.40.1790033019478; Mon, 21 Sep 2026
 16:23:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918094322.152817-1-pbonzini@redhat.com> <arG1Nh2yuMQyAdhV@google.com>
 <CABgObfatLAp3AsPktQVtVq0MgeJV1Bw+54i5LKye5KzjVPqbyQ@mail.gmail.com>
 <arG3L3TL5_xCBtc9@google.com> <CABgObfZTbj7cSUdGEcA2xgGkSgFqZ2NnNrHJ7+uYAHP3_9idqg@mail.gmail.com>
 <arG5raFJQO0hA-Uz@google.com>
In-Reply-To: <arG5raFJQO0hA-Uz@google.com>
From: James Houghton <jthoughton@google.com>
Date: Mon, 21 Sep 2026 16:23:01 -0700
X-Gm-Features: AcwNN1WrtY-_nAjdTWchzxwWf21dZZ0mCHbeT76HDCZYCUnYfKxEQhEABcRdrp8
Message-ID: <CADrL8HWS3SLqGfj0CrHhODscUq3fPdKd6Mg1M_53BFdFh4eLvw@mail.gmail.com>
Subject: Re: [PATCH] KVM: x86/hyperv: do not overwrite hc->ingpa for slow
 SIGNAL_EVENT hypercall
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 4:11=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> +James for real this time.
>
> On Tue, Sep 22, 2026, Paolo Bonzini wrote:
> > On Tue, Sep 22, 2026 at 1:01=E2=80=AFAM Sean Christopherson <seanjc@goo=
gle.com> wrote:
> > >
> > > +James
> > >
> > > On Tue, Sep 22, 2026, Paolo Bonzini wrote:
> > > > (BTW, I would like to talk about memory attributes and kvm-userfaul=
t
> > > > next Wednesday... and whether those are two different things at all=
).
> > >
> > > By "next" Wednesday, do you mean the 23rd or the 30th?  I want to mak=
e sure James
> > > is pulled into the discussion as he know a lot more than I do with re=
spect to
> > > Google's use cases for KVM Userfault.
> >
> > Either is fine, of course 23rd is better if there are no other topics p=
lanned.
>
> James, how are you feeling about an early morning PUCK in the near future=
?

No problems here; the 23rd is fine. The only day I can't do in the
near-ish future is Oct 14. Thanks!

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FE35172E7;
	Wed, 30 Sep 2026 17:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790787735; cv=none; b=hjLyph9hCqPquHOv0VGZ02S4A0QnhdYfiFYG9+26G9bFr+ntM07ih9I1MwPdLSMwgtHzmTuLfNO2OPPlaLB+SASZ1erFFIGuANpjbFDx+m7AhfQHQ+QAvKQjEXdeIQtz33urPDqYNFJ7ZaE+8pot2qc6JP6weaxjuEuq18W3PP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790787735; c=relaxed/simple;
	bh=lSvNaYtkCFZzoTci30X9lWGW8IoJXi7d4OhkNwVojSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hnTUV8QJ/nqu2o1W6ipdCM4sj6usT2pVVxWDxMFi0oF8XvZTeKKMwVT1MUIMFOjGfCkMvC6WK1YAGu05+A2Ca/2hc/DO2mF42kc/eiJ7hJ0VBAYrBdgyUsbzJHGj1pHPHfqgg8e+N6DPHTDGBBZBLunrlTRFLYHbdNlgAaKTMoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EexhOiGd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EexhOiGd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DCD61F00899;
	Wed, 30 Sep 2026 17:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790787733;
	bh=kExIdmmHUDkx7q8lF/7jaDyfGg/4Py0IVS631gipGEE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EexhOiGd1zY0qJR7a8EtS79ow7rKI/xnnaIc5uPgKXCYBwZnnbHkmjTr1oae9vWG5
	 hJCf6ZPtKgUJPYCaygBs4Og4wH38IumAu/UmBtRlU4R0rY8jF3TlKSfsAs69B0Up/5
	 auw/HyRT8v/M5CH2+dtQd/OE/2GfBaLqJnonVLM89AbJFhDLvIIBusFGz0pdoOKT6+
	 zGKVnV23M99oGDf+1PTW/szt647CIc8mc2dN8WKnslM+3DkRdnlwwt9tBjioINglgd
	 IN2yMYOK4EIVdlQ/XTy5ne4k16r73D4XnLE5oOzcwiX5Eibkmy7KB3n9SCZ1Wt7GM+
	 IX/2cybTnnRBQ==
Date: Wed, 30 Sep 2026 10:02:12 -0700
From: Drew Fustini <fustini@kernel.org>
To: Han Gao <rabenda.cn@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Han Gao <gaohan@iscas.ac.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: riscv: thead: add Milk-V Meles
Message-ID: <ar1AlKUs9gwTDWWR@thelio>
References: <20260929-rv-meles-v1-0-effdd14a76e8@iscas.ac.cn>
 <20260929-rv-meles-v1-1-effdd14a76e8@iscas.ac.cn>
 <20260930-bulky-miraculous-rattlesnake-b58357@quoll>
 <CAAT7Ki90CLoWwauNDShNFt4LS+3+nC-6tV1UqwAJP=KD0E56pQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAT7Ki90CLoWwauNDShNFt4LS+3+nC-6tV1UqwAJP=KD0E56pQ@mail.gmail.com>

On Wed, Sep 30, 2026 at 10:37:28PM +0800, Han Gao wrote:
> On Wed, Sep 30, 2026 at 7:51 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > On Tue, Sep 29, 2026 at 06:22:45PM +0800, Han Gao wrote:
> > > Document the Milk-V Meles board compatible with the TH1520 fallback.
> > >
> > > Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> > > ---
> > >  Documentation/devicetree/bindings/riscv/thead.yaml | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/riscv/thead.yaml b/Documentation/devicetree/bindings/riscv/thead.yaml
> > > index 301912dcd290e60f816d380152591106de9415b4..5361021b8dcc9897803a5915665c6bb83309fe53 100644
> > > --- a/Documentation/devicetree/bindings/riscv/thead.yaml
> > > +++ b/Documentation/devicetree/bindings/riscv/thead.yaml
> > > @@ -21,6 +21,10 @@ properties:
> > >          items:
> > >            - const: beagle,beaglev-ahead
> > >            - const: thead,th1520
> > > +      - description: Milk-V Meles single board computer
> > > +        items:
> > > +          - const: milkv,meles
> >
> > Why isn't this enum with the previous entry?
> 
> Merging will result in the loss of SBC manufacturer information.
> Milk-V is an independent manufacturer.
> 
> Thanks,
> Han

I think the feedback is that BeagleV Ahead and Milk-V Meles have the
same pattern and it could be changed to:

      - description: TH1520 single board computers
        items:
          - enum:
              - beagle,beaglev-ahead
              - milkv,meles
          - const: thead,th1520

Is that right, Krzysztof?

Thanks,
Drew

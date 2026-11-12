Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794511349;
	b=t/Oeq9jKcstK8VKGWBJU5z2mnBxSnbEyZk8JGd+rd1RXzS9yIyys1CKPJjHEvYliyCGv
	 7cXrrv8R1btea/EnQus87FGNcEQZFhTCgJLPdVZAATF5h0k1LR4w3Kk4CpY/bP05Ee0Nb
	 mUZMMeE5XWh36nPHj8E0pMDJFxb6NvJdtGNrCsJSWMb+EokdVBOivtmMa1trU0L/dD+vd
	 K3eyfMMcy+9vPiBLveHu7X0X9JD49oEQgw2JCvdybOEH5+htvTLOLcphAx8A6PiB0FnL+
	 7oXaM3H+hO+HC0kzYpyrHtoRxwDGRE4r1ntTy7SXIowNT9x/cvEMWWxKUMELC1+O9Gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794511349;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=eKEe30sKgUjFzvZ2CgdBS8YcRmwTAfqhuKIIKVboUOA=;
	b=FSItqPHTakttqNY/31HBja94YLF559NLUP58zRKhExUZsRzx6jnAHzxJvbsTbFYsaiFi
	 zoYNiskLeswII2wFZFIMfut1rAc+pgXgkrwn/XcjknMCfumtEEgwrJXBzdBXxV7N1fKzb
	 uk7U2iBAp4qQFwrHr+qxw8bagFl60eheWLgcHcHxiIjs03Z6bIHLLXZjlC8Uwb/MhJETO
	 CYFa3Zi6HJpYBKPPYPa8O/BwiU1UfpoohR3kGbyg+9MQTciNBfrizQ15XuB2YOvJlNvrX
	 PkRqvFpBJHvJYx6ti+sgw4k24q0tD/ve2pXXRmwHhV14rYZah/rUdLdT0u7780gpKag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bdf7MvZa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B9C606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bdf7MvZa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EAE21F000C9
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794511349;
	bh=eKEe30sKgUjFzvZ2CgdBS8YcRmwTAfqhuKIIKVboUOA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bdf7MvZaAhnATHsUyEBrdPOmkBPZwsuzAUmn7cqKmMa4cRO9i0WcPi1CgouyW1JVl
	 UcnecQOSp3UE2a3KiB/v1p0EyZMZaTyEG6XI0uFsbUyi+LZnPwwi3bpLXBOZDyaN3U
	 hcVywCRG6T/yI6KBy/xMW5EnGJr3JDvhx25GrjTlgB3ZEsR+q9ZwTztrsr+QPIoYSi
	 +shqKDoRb2W2XGOwA+f1wxe3xgyBS2egq/QaNKfyAIQmwexp8BmMLr+AGUaZaJOlN1
	 jiGPmfwCnHMojtIfZstOIGmRK9FYOJJ06wuylmzloGifz9w/dUDnksiyHDXbYrewqq
	 LFgJlqjg+ZwMA==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b577addee9so276475a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:22:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGfeTG4TrJk7rULMHWjQ2r/bdZFt4/spZt/L5B2JhO4b0h3dpv3ro74zLLgnQQfV8hFV2IJZ8yvz6QwyD8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0uqB0sBCa/bwBqiQgi5NID+reV2iKLAEzspHyXhbhO2xxQ+MI
	4Hh9JyMSpB+63tJsDeBowbXrWBNDdnWjQSL81l1yaQsz6hcoi8fEy55lDxs6R5iBU5tWa7KIt47
	06nAJiZquZBdXZ40Xe3ufNohf4wSn+g==
X-Received: by 2002:a05:6402:4243:10b0:6b1:bb19:deb3 with SMTP id
 4fb4d7f45d1cf-6b7c0c500d7mr438413a12.25.1794511348048; Thu, 12 Nov 2026
 11:22:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021022446.3619435-1-robh@kernel.org> <avWbmsjkYo2LMJKs@parshuram>
 <20261112125346.GA3821108-robh@kernel.org> <avX9Qrcapcnutdgh@baldur>
In-Reply-To: <avX9Qrcapcnutdgh@baldur>
From: Rob Herring <robh@kernel.org>
Date: Thu, 12 Nov 2026 13:22:16 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLGqYAd-BedjNCCmxByJQ_z2Cij9J_z-ifiX9iJs_gqSg@mail.gmail.com>
X-Gm-Features: AclHuK8_kIf7XzeWGReWc3eG8QnzvITOafe7fZqs02NgfRS8BOSjQMTL0cAbEpA
Message-ID: <CAL_JsqLGqYAd-BedjNCCmxByJQ_z2Cij9J_z-ifiX9iJs_gqSg@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: phy: qcom: Relax required supplies
To: Bjorn Andersson <andersson@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 12:30=E2=80=AFPM Bjorn Andersson <andersson@kernel.=
org> wrote:
>
> On Thu, Nov 12, 2026 at 06:53:46AM -0600, Rob Herring wrote:
> > +Konrad
> >
> > On Thu, Nov 12, 2026 at 04:27:30PM +0530, Vinod Koul wrote:
> > > On 20-10-26, 21:24, Rob Herring (Arm) wrote:
> > > > For the QUSB2 PHY binding, keep the three regulator supplies requir=
ed
> > > > except for legacy IPQ6018 nodes that do not describe the board rail=
s.
> > > >
> > > > This relaxes the requirements for the IPQ5210 as well as if it is
> > > > compatible with IPQ6018, then it shouldn't have more required
> > > > properties either.
> > >
> > > Hey Rob,
> > >
> > > This fails for phy/next I see vdd-supply has been moved around..
> >
> > The change in question[1] should not be applied until the .dts changes
> > in the series are applied. It introduces a bunch of warnings.
>
> I don't understand. The change you present here relates to ipq5210 and
> ipq6018.
>
> That change doesn't touch these two IPQs, so what are you suggesting?
> Are we talking about the same warnings?

This is what I get with phy-next because it has the binding change
from [1], but not the .dts changes in the series:

arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: phy@7411000
(qcom,msm8996-qusb2-phy): "power-domains" is a required property
        from schema $id:
http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml
arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: phy@7411000
(qcom,msm8996-qusb2-phy): "required-opps" is a required property
        from schema $id:
http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml

(and then duplicated for every 8996 board).

> > Can the QCom folks stop doing that! Coordinate applying the series or
> > take the binding and dts changes in 1 tree.
>
> I assume you're referring to "QCom folks" in the sense "any maintainer
> touching a binding change related to a qcom platform"?

No, primarily you and the submitter I guess. Submitters should be
aware of dependencies in their series and suggest how things are
merged. Otherwise, it falls on you to care that warnings are getting
introduced.

I would not care so much when there are transient warnings in next,
but I don't want to be the one chasing them down. But AFAICT, it's
always me. No one beats me to it and I'm not all that fast in
noticing. I just compare all the warnings by platform for Linus vs.
next with "gl-diff-dtb-warning -p arm64" from this repo[2], and look
for things moving in the right direction. Of course this is all after
applying which isn't ideal.

> Do you have some CI/guidance/tooling for Vinod (and other subsystem
> maintainers) to perform system-wide DT-validation when considering
> merging a binding change?

This one is an ABI break because it adds new required properties. I do
have some tooling that looks for ABI changes, but haven't committed it
because I haven't figured out the best way to deploy it. I think for
anything that is an ABI change, the binding and dts files need to go
in together.

I think it is time to reconsider the default of bindings go in with
the driver. That works okay for new bindings as long as the platform
maintainer doesn't take .dts changes before bindings land (also an
issue). However, for cases like this, we need the opposite order. We
need to figure something out because this is only going to be more of
an issue as we get to warning free (and we are close).

> I unfortunately only spotted the one-way dependency when glancing at the
> seris and thereby ignored the dts patches waiting for the binding to be
> merged.
>
> > Given the patch series is 2+ months old, I'd be surprised if the rest
> > gets applied.
>
> I've applied the two dts changes today, and they do resolve a number of
> warnings - presumably the ones that you're talking about, but I don't
> think the ones that this patch aim to fix?

Other than the warnings it introduces, the [1] series fixes this one warnin=
g;

      3 phy@7411000 (qcom,msm8996-qusb2-phy): "vdd-supply" is a
required property


> > This patch OTOH fixes warnings.
> >
>
> What warnings? Can you please provide actionable context when you're
> pointing out these issues.
>
> Is it the three "'x-supply' is a required property" warnings from
> ipq6018-cp01-c1.dtb? It seems unlikely that there's one chip that
> doesn't depend on those supplies.

Of your 20 unique warnings, it's these 10:

      1 qusb@59000 (qcom,ipq6018-qusb2-phy): "vdd-supply" is a required pro=
perty
      1 qusb@59000 (qcom,ipq6018-qusb2-phy): "vdda-pll-supply" is a
required property
      1 qusb@59000 (qcom,ipq6018-qusb2-phy): "vdda-phy-dpdm-supply" is
a required property
      1 phy@79000 (qcom,ipq8074-qusb2-phy): "vdd-supply" is a required prop=
erty
      1 phy@79000 (qcom,ipq8074-qusb2-phy): "vdda-pll-supply" is a
required property
      1 phy@79000 (qcom,ipq8074-qusb2-phy): "vdda-phy-dpdm-supply" is
a required property
      1 phy@59000 (qcom,ipq8074-qusb2-phy): "vdd-supply" is a required prop=
erty
      1 phy@59000 (qcom,ipq8074-qusb2-phy): "vdda-pll-supply" is a
required property
      1 phy@59000 (qcom,ipq8074-qusb2-phy): "vdda-phy-dpdm-supply" is
a required property

Rob

> > [1] https://lore.kernel.org/all/qusb2phy-v2-1-4c3f980a4560@oss.qualcomm=
.com

[2] https://gitlab.com/robherring/ci-jobs

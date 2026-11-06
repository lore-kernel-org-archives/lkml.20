Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793976514;
	b=4rjoasXHsn37B4nk4vN7egsF1mxkvZrBW+/i9U/5Ml2mrUBPzkrcniuBO7asJGUCwpt5
	 w3T+Dw2qiSqqGeThBBKD5clcJ35mmz+iaYkk3hQmA2n9e3fv3HdfLzv2JO2Gt3yaGUQxt
	 lJTrnat/ylcDq/fxfsQ5ueIsNP5GR5EvfKbZWYUWq6vNN80JlRj5mk3xPQBV0uFeN2sMy
	 VbKgMnfRrU5Akjk46jdzpw7RYqTxZf/mRTMPKjVbdmEnb32UiOpbIlX6JEBPrYndYRrct
	 gyTx6rYwyrPH9emE6FEPsPrs3ofASpeRqu1V9l/Nhz8NX7bC2Q9jL6ysrNheShfbgGg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793976514;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=EVsynTIkUKlA3sM+VFVmSipU+rZiRJg3NzlUB6F6w3c=;
	b=FDGX8gstt/Mm5CcD4t/0oY6/9fDt8+kCyhWAhcFtIvjQIfK9+TQFKzcd9g44BAN6q+E3
	 05CngLFwMUNrq6v1UhkfhNB1HPDF7CIbShSLIGR6zb1UAuMculP/BM2wY+Mfg84rEZNLs
	 yC675JhQIr5BbiTbbqOlBPMMRZL3HVIfEfAC9ShCFWxUwMOrCAieWhPm9ox64rPV9ROW9
	 du13H7sXsXy6s1DZ5hH4L9uKDYP9qKULn+QpmODYBmyA1ahD/HYjBGskf0Dv6wmBqszHU
	 6DJUo7MUpQt47NIhfUYZkPrEe6ZfHjqYrxErMhmbIaEmcXStjOq9ULVEyrjUUeshisg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I6fFiPpe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D044606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:48:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D044606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I6fFiPpe
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36e795af1d4so623521eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 06:48:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793976513; cv=none;
        d=google.com; s=arc-20260327;
        b=M/FVk+q9xZPHuBVCMIWjs2GgYxlyMo29NfF11Ms1DaX/XpvlbbaVyeFS3QBnpBqZKO
         vzqKDQK0yQWLMuIEc48qdsE6GQTWREkU1VDwtrMI4jrmZ2ozduFoKF6K8ql8bb6PD80o
         1LSWMq/blrKk2+kI0t04r2fZ9kOkrKhPI7qGG5duYmJ0jm/KZR/RFTDtJo4VKi/VS7qq
         NVRtS5jlcKmG6bJfvOvogSq65kybt/TUPUuRqm0QOe1lWoJhby6ojOZRTnEL8gN5tdKn
         iE/eNT1OfcPX+8njJDyu9vGJcGbrTUoiq/+A7+1oT9bBMlyVqyh5kqo2qLHvsi9F9nkP
         eRaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EVsynTIkUKlA3sM+VFVmSipU+rZiRJg3NzlUB6F6w3c=;
        fh=CwWDqwR3AoPbai6Xr/3mqD+f6Klv6C9pPwXSt+9TQoM=;
        b=di0BRbDVi/HXGXaU+T5KF3K2xsbhQldjzJ2vwqWgiTgLEziHuqiWzCTRpTXZD5nkhs
         ABZoyK2kn8XL024TzAqdbSRN5TloatxIdO2T7QzrJZrIWpr9VcSzm7gOV9CetdRqUrB5
         KFrqE8Rsi9gpPu9qwHDRmFiHF0zX6tOKy/NRM2+wLRyvBqF/IyoIgp5cJYWqAMSjYCtY
         juZGZMx46w6NvcVhdWdX58XEXaR/Le+u8eTTlQWxEV010IDCpaAKdZOF2Q+ZcOFlPCEz
         p7s5/krMyqhsGq2P3Y27skW8+fAXLA+sTejg5a9znYTYJWENiAbgYmOeDaCrMuhy925n
         ZsEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793976513; x=1794581313; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EVsynTIkUKlA3sM+VFVmSipU+rZiRJg3NzlUB6F6w3c=;
        b=I6fFiPpet3LDIrtYZwCrjVU0804rG3FM7aU8xyPN2TiTV0A3w515GX/EMw7fDua5wy
         vLyJHiJxKbWFGRe6hhn5erMUxwHE4+rVEsR4cZE2Zj1YGrxM321N0JGFNAkJFxtZAWJn
         doo3BfZwVlv2lZlIB6rvt6MU+Iq9aMF+4GxvXEYs4f7lfLjm024VmqCjFN1NXESBvxlK
         PKkVkHVoX64uvhNwCa2hKyX74J0AoB95uY7PszXhiR6STicH3ZS0rS5vR8rwqeDH6Ca9
         qve7fdmCe0MUJ20BYi3xlkjOKZkSxV7NuhL5nba2Zs559O0wnWtjdvGNFZWSu7sndenB
         eLLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793976513; x=1794581313;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EVsynTIkUKlA3sM+VFVmSipU+rZiRJg3NzlUB6F6w3c=;
        b=RYnBAedjD3hQysuyNmrXP2zO6tja7K6ROzPW5G7zqQHZy0oPxs+hfndupqvv9aGskN
         7gx/xuhD5JB0cjslwK4nP/kN5SU/GvOE12WuDUoe8O+qs/Y/FzQsMS06vZMbaR8cs5u7
         HERPvkk954Dl/TOaiTU6Y4IE5FpFa8KJmkj2MhuEWsEJDwkJiOsjHhjba3kZndV0ngLm
         td2U1mOJUEcJi5PI5b+rrFjPySOMA9+46Z/EImQ+YuOpx4E+Ft9Kw43EFulDEwVlF11r
         aycdUuHwAC6mFysvK7pCDhpCysY6oCBh/LxzJuYvRs+B1LsFw4AjjdC3IrQQa97nzxf7
         9E1w==
X-Forwarded-Encrypted: i=1; AL+hErElRzW6/13/x40JFqz0yWovLMz2WbxBZhN08FZxiYzgAOf9CI+fJRlw2UM4D895cxsTsxaKDt1rmu/VqNA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qEsLYJ9B5Tl1+n6rncOp84WdsSy2nTIbmo2gYzSHJrwvM1BVR
	x8/CKaEBJKL9WG76mObGZr49wciKYAOTZ4HicZA2daoDeHZFjjxo+nbUzLokdNBZBHl92V+Y+8V
	pVABT5Jbis65pKL4YLNZkzC97ttSt65c=
X-Gm-Gg: AYBFou2JMGHi/A4Qi8IGqeGHzyG1LftCHuLgxxZtbe7Njivv63QwwDx08IYq9ujGgKK
	en8HbXytlJfM0xANNKGTWDZIdIgXQp6PiLxgjksbCdah4XTxLI4fuOcSwYe8Oimd3X10C8L7QZr
	onY2I9lwEfPzwALdmPkvzHGU0LjVaDVeTcFQIKl8z4IDm2B2/42c7r+NEYNq5fc0pfq6skbkiBQ
	m7dhByrP7w26Knk834ADrIIwcgkJ1y3FJKtjdRHuXGXDsezmmsZcMeUCuMPtZHJHLc3s+s9D7Ep
	bBKqb+Yv6UP9c3pwBB2yr7wVgsUX0P3Rc7HnIJlX56ylNxQ9z2VbqLGWnoGdJaBO9koW8nyIbx1
	lonp0waeRevsxNRD0avSZyUmK8wd0YPeBeMwpJZ54WCWYpmIUJNONl3WWof6wFK+ghML23WV2j0
	bhF6EPH7v8xtMPxhaK0Br9OBdtcQzAcA==
X-Received: by 2002:a05:693c:3881:b0:36e:ca05:8c3c with SMTP id
 5a478bee46e88-36eca058eeamr5256866eec.2.1793976512062; Fri, 06 Nov 2026
 06:48:32 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105140510.165165-1-clamor95@gmail.com> <20261105140510.165165-10-clamor95@gmail.com>
 <au3etybQlb5CtjBL@orome> <CAPVz0n3o5pc62eF6gv+PYmJh1KN1a5s=qmjxpNGJfxbCC4tqzQ@mail.gmail.com>
 <au3mloMMzQFPUept@orome>
In-Reply-To: <au3mloMMzQFPUept@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 6 Nov 2026 16:48:17 +0200
X-Gm-Features: AclHuK8DwPrQnJ-dtjZgKOk6mQHPlCNwM8DshspgESp7qhKKTAtefGWbono97xk
Message-ID: <CAPVz0n1j0M1Zjj90pEGCYiNqUQv00N89oPcAxZbA7upuxhoF9w@mail.gmail.com>
Subject: Re: [PATCH v6 09/10] dt-bindings: display: tegra: Document 8-bit CPU
 parallel interface
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 6 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 16:40=
 Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Fri, Nov 06, 2026 at 04:11:12PM +0200, Svyatoslav Ryhel wrote:
> > =D0=BF=D1=82, 6 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 1=
6:08 Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Thu, Nov 05, 2026 at 04:05:09PM +0200, Svyatoslav Ryhel wrote:
> > > > Document 8-bit CPU parallel MIPI DBI Type B interface provided by
> > > > Tegra20/30 SoCs display controller.
> > > >
> > > > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  .../display/tegra/nvidia,tegra20-dbi.yaml     | 113 ++++++++++++++=
++++
> > > >  .../display/tegra/nvidia,tegra20-dc.yaml      |  22 ++++
> > > >  2 files changed, 135 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/display/tegra=
/nvidia,tegra20-dbi.yaml
> > > >
> > > [...]
> > > > diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia=
,tegra20-dc.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,t=
egra20-dc.yaml
> > > > index 69be95afd5627..ffeb124905dbf 100644
> > > > --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra2=
0-dc.yaml
> > > > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra2=
0-dc.yaml
> > > > @@ -79,6 +79,16 @@ properties:
> > > >    rgb:
> > > >      type: object
> > > >
> > > > +  "#address-cells":
> > > > +    const: 1
> > > > +
> > > > +  "#size-cells":
> > > > +    const: 0
> > > > +
> > > > +patternProperties:
> > > > +  "^dbi@[0-1]$":
> > > > +    $ref: /schemas/display/tegra/nvidia,tegra20-dbi.yaml#
> > >
> > > I think it might be better to group these under a separate dbi node a=
t
> > > the top-level, making it a sibling to the "rgb" node. If you add
> > > #address-cells and #size-cells here, I think that means technically t=
he
> > > "rgb" is now in the same address space as those new dbi nodes and wou=
ld
> > > need its own "reg" property and such.
> > >
> >
> > Only 1 DBI node per DC is available. Adding address/size cells means
> > nothing for rgb.
>
> If only one node is available, then "reg" isn't the right property.
> "reg" indicates we're somehow addressing the child, which applies to all
> children, so I don't think that would work here. A separate property
> would make more sense in that case.
>

Check v5 and talk to Mikko

> Thierry

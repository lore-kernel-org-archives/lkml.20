Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793570685;
	b=SQyNOjT2mdpyzbxPtpEdlNQVDS/osoIh+XNKp2/NQ1MEJ4l4lTD1FOSyqv7koWjTgVop
	 KQ+nMphE1mjr92+U/08VUHPMNbs9AS+4jRE4QBoaFPLSjKtx89qDYc2SqbhQjKOash2kA
	 d0/JhW9oL8d2ajFFqVXHlKUsG8kWTex9tQMZtGqz9yLvTb6JqWR0GUe6CPslp+QOVirLk
	 rbOos3V+6JcQR3tsBxFZbPxOYxDnUsTmLN+jwgEDKyLh7Lh3tg54UX1XJ4xEHyfd1HExF
	 M19kku8DPEtf95ddnObFKEQ4gZuJhdJvWzVaOsX2EgTAGUyoynpOUAWsQc/d66lo8Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793570685;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=p/9fa9bV3ZcCfTLaoelFVuKfAoX2NF9q4J5ymFDkaHE=;
	b=r61v3DWEq2rpxQUzGDiRFDnYRSzrm1r8n0cxxFNGUe5BP3EQxk+H9qjWwEyWw+Kt2ZEJ
	 1htYbPJK54ekmmFxfdiVgf1UzaSAmj3XZljlpf+4S+GIyhXYt6+7m3suO51Tjic+AQSSq
	 dEsqnSAFKx2dYioH778h1hrJoJ33AEhZ9qzy+ellM06egG6qekw86eqDIGpXrPwO6nciX
	 8gV1npcDEXfa1Vupl2pQzwtLV/F8iV+5bdO8TdecXowF9RO9rmVM9Zu+x9dwQy1uyENZz
	 B6D26BjHPYuRGnzHe9ZNymFFXDNZducDG3FMbh6F88pV1qiFBH3DxbrbRpvaP+Dbvsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QpcXpZEO;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4463606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 22:04:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4463606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QpcXpZEO
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c434376dbebso490661366b.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 14:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793570683; x=1794175483; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p/9fa9bV3ZcCfTLaoelFVuKfAoX2NF9q4J5ymFDkaHE=;
        b=QpcXpZEO6efkiiQpo/4ffnHXfgr3mYTYUaYihbw3pmtcbzH08TZqChB4y97jbKLoQg
         QUKuqblPWtTp2KXhcak66EvVffVoIKsXpbRKb0GSsH3SYFHCI8a/Qfjx2622W67Zk8hN
         3F+h3GmdpaVfX6Zf0MceJVtuLrv7yTKquMA0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793570683; x=1794175483;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p/9fa9bV3ZcCfTLaoelFVuKfAoX2NF9q4J5ymFDkaHE=;
        b=HfQJiCFt/dGWZEg5rj8IqLpEGAY35sgV2v65+qXl101wnw5pGoi3RuYUpLS0161AYm
         RahfgsNMzRME3APIO2zLm1HC6bHY/va+k7mDVH/2lPPee5zYf6PnOB6bo7SzrgRN/ZKK
         9qE2yBSlGznpD05V/ac51GBykKzlETz07/LgcG9X2nJ+qNulJyVzRD1WsTER82z8MHlg
         FpXrxgE/8rHyrpXGTHoFmFS7eC/PMfq9Y49nz/7qhT1LCe6H8+qH7T15ISm/VohL9JTm
         12vl3LHBGjX4f7PIVS3neGARr2Mqsv0CXyQlyh3/BD3B3R/dQRNZTV25DvWD/QFb96bM
         06VA==
X-Forwarded-Encrypted: i=1; AKwUvBwgscTk1nHwwfiazMrxCMTzLP+0fgQMrtdNNfD+6d3J4eJCf/RBKgr9vbQ8JEHUlwo5bH5jk0aqPUVUh7M=@vger.kernel.org
X-Gm-Message-State: AFq9FYIoIc7LWwzjWudgCD28dRPFuYRJl4o5Mi8GwdzXfDl/D/KxCKY1
	y3UUOnnJG1mKR1cjUM/16BnKjuX4FNI/QyE52aiuHIJUJqu2ua8VmUUqXfVDdfEMANGxtQOS78a
	pHcwbYNHc
X-Gm-Gg: AYBFou15qxXQBXy8aTuPhqVOnmbqIGfggeUoWolHTFjyoHkWsycRhqUhfe2NSAtZUt+
	50vcJgg0eXAqae6U81QHng8vtGL0OmZwr0z9XbSEpnSbfwq1iZL62002OCE+L9Bg9bipuRFL1cl
	OmJq2/nZWZHQiB4ftHMXL6KNDfVmbPhXiegpX0SkmKy/vtcUhs0iux03EAeyqhMiRRRQ5VF1OFg
	53Vk5q6qJIXP1no856QaHSVKjHWInIK4RFyA04F1yBEhDMh5LJkOJ7O2/Anf6i0mc3UkSvLY/o7
	b+KVAIJCRZbbwHL3yyR5eaD9K3PYeSpk9q+ss2VQ4vqMWqGyDompcNJL/so/jNcPW1JtsKeL+Oz
	11IuxjHTCWzHWHE3Aul2nDtRVflTCBt7WexkvRsiEMul6N4Almdd/Ftte16p2kTdF9kxSFeNe3c
	NUI+VYt6Jb3/UQ4wmOKmTkPf31a5eTvSuXyFA7prASc1sPMLFo/90+9zZQtkA6tv8AkGYSE9YI1
	h1D6sAkeeo1cSYybqb+U9tVGbUxkPeIrVPCmMUSyWbt/g6HQC2UsP0/iLHfEt09jxJtKGQfcQ0N
	NoOyMnbXxwpu62kYkvUxqZGGF6skvXuNl46zy1S360SCkUXyg5JfiBOjm5wuNRNuTr0=
X-Received: by 2002:a17:907:86a8:b0:c42:6632:a369 with SMTP id a640c23a62f3a-c4ca7ad82cfmr637748766b.21.1793570683082;
        Sun, 01 Nov 2026 14:04:43 -0800 (PST)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabcfd260sm312554766b.22.2026.11.01.14.04.42
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 14:04:42 -0800 (PST)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48dfaa3fa12so1960972f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 14:04:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBw0YpeAX+683uDS3J7uFr2ifcSHnxeOLwHsKu1ENZr9rPkpSQboWh/hnn/tb8ZEJqUgx46OcWQo0scOWeM=@vger.kernel.org
X-Received: by 2002:a05:6000:4910:b0:48c:69b3:6114 with SMTP id
 ffacd0b85a97d-48e6494c24fmr30421734f8f.3.1793570681174; Sun, 01 Nov 2026
 14:04:41 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028215600.1713475-1-dianders@chromium.org>
 <20261028215600.1713475-3-dianders@chromium.org> <CAFLszThVtOwXJ4GKv5fFPGWGy7EL63JrEU=yhByUccW6Vkq+=A@mail.gmail.com>
In-Reply-To: <CAFLszThVtOwXJ4GKv5fFPGWGy7EL63JrEU=yhByUccW6Vkq+=A@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sun, 1 Nov 2026 14:04:28 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UZahH27Rb+JrGpuPxxmnOAt3-DvZ1u32TzN9jJftOoeA@mail.gmail.com>
X-Gm-Features: AclHuK-0PMyh2gGf_SdepdjlMGJUnYCAlvxR2gqZjB6i5LECjAnzzbSqRkU6NPI
Message-ID: <CAD=FV=UZahH27Rb+JrGpuPxxmnOAt3-DvZ1u32TzN9jJftOoeA@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] pylibfdt: Add subnode/property iterators and get_mem_rsv_list()
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Brian Norris <briannorris@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Devicetree@vger.kernel.org, David Gibson <david@gibson.dropbear.id.au>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-kernel@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Simon,

On Fri, Oct 30, 2026 at 5:22=E2=80=AFAM Simon Glass <sjg@chromium.org> wrot=
e:
>
> > diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> > @@ -204,6 +204,23 @@ class FdtRo(object):
> > +    def subnodes(self, nodeoffset):
> > +        """Iterate over the subnodes of a node
> > +
> > +        Args:
> > +            nodeoffset: Offset of parent node to check
> > +
> > +        Yields:
> > +            Node offset of each direct subnode in order
> > +
> > +        Raises:
> > +            FdtException on error (e.g. invalid nodeoffset)
> > +        """
> > +        soff =3D self.first_subnode(nodeoffset, quiet=3DQUIET_NOTFOUND=
)
> > +        while soff >=3D 0:
> > +            yield soff
> > +            soff =3D self.next_subnode(soff, quiet=3DQUIET_NOTFOUND)
>
> Since Fdt inherits this generator, a caller can easily write 'for off
> in fdt.subnodes(0): fdt.del_node(off)' and get garbage, because the
> offsets move under it. Since David has applied this, please can you
> send a follow-up noting in the docstring (here and in properties())
> that the tree must not be modified while iterating, as with
> fdt_for_each_subnode() in C?

Done. Added a patch in v3 ("pylibfdt: Clarify iterator docstrings and test
negative offsets") noting in both `subnodes()` and `properties()` that the
tree must not be modified while iterating.


> > diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
> > @@ -243,6 +243,21 @@ class PyLibfdtBasicTests(unittest.TestCase):
> > +        self.assertEqual(
> > +            [self.fdt.get_name(n) for n in self.fdt.subnodes(0)],
> > +            ['subnode@1', 'subnode@2'],
> > +        )
> > +        leaf =3D self.fdt.path_offset('/subnode@1/ss1')
> > +        self.assertEqual(list(self.fdt.subnodes(leaf)), [])
>
> The docstrings say both iterators raise FdtException for a bad offset,
> but nothing tests that. A test that list(self.fdt.subnodes(-1)) and
> list(self.fdt.properties(-1)) raise, perhaps alongside
> testFirstNextSubnodeOffsetExceptions, would be good, perhaps in the
> same follow-up. Since these are generators, the exception only appears
> on the first next(), not when the method is called.

Added the test for `list(self.fdt.properties(-1))` raising `FdtException`
(`-libfdt.BADOFFSET`) in `testPropertyOffsetExceptions`.

For `subnodes()`, it turns out `fdt_first_subnode()` and `fdt_next_subnode(=
)`
in `libfdt/fdt.c` map all negative returns from `fdt_next_node()` to
`-FDT_ERR_NOTFOUND` (`if (offset < 0 || depth !=3D 1) return -FDT_ERR_NOTFO=
UND;`,
and `fdt_next_node()` treats `offset < 0` as starting before the root node)=
,
so `subnodes()` never raises `FdtException` on a bad offset. I removed the
inaccurate `Raises:` section from `subnodes()`'s docstring in the same
follow-up patch.


-Doug

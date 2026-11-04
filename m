Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793806208;
	b=eGaPPBUgRWGgdjG1Kf2/qcRn9RKRyJ2B5OZRdz+1G0V4iLYSKMOZ83kVcGkelva9zUvu
	 76N2gGhgAwdaelWV0RuUBzcaIMUS6E1qa/mIVay3sxQratzXEbwIkoN+0Sqpw0Ej8gNPO
	 cWTyHo7PpLhcxg40btk+lzdELW+eHLqyW3kz+IHLk2NHz3knItVtjibN+fH6fX+e7kT5K
	 ai/RWHBaZwTwO+cMt0yzNX6p9paLNtFCr0nJNTQ5nwi5Kuk1k8+MQ1CSBkC4Sg63ctGnW
	 N4oPmdsJ0qNKOi4RdJjijOLrtW1ro48aaM7AK+1EHpiPAUysQy2eDzw5Zw+JCrAg3pQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793806208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=XuOzy7DSGMVrwWDh7V3xhScck9rJv3ZkjmRrzI8ggv0=;
	b=CLF6SdEsRG7SqrHnr0e17ugF+ny6qO8DXx7f90tRaoy0iI/boYzHFSNusbBjSoDFmNQj
	 +kZWNqs80RV6ewykz89NoZXWxeKhNzPO8u4M5WozvXhH3NUALK3sVLxbM7QDgpAfGGgms
	 Rd9u1z+dCFgaqbt826yW6W+RMi3Eu+z4E1A/v7J31qIkD2LM517fZ2agOUxtTW47AiYR9
	 8VkIegSSTWUTHJWGvpYcoaeo6620pXqHtg6sTkDD+UiU/Yom6oGaobbr7WqvP/bNgjK9B
	 910L07J2V9se5rvZvozy3dhNOdSUxgizqLbz9HsJRJ1zgxiS52gIG4oNAAg7ANVvp4Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=B4NHfTIu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C114606A329
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:30:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C114606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=B4NHfTIu
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e987a2ba0cso4796765ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:30:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793806207; cv=none;
        d=google.com; s=arc-20260327;
        b=epDxUNBLu9dwh4ak66SC1P9zgff7J+YZ2X6EgJYCwiM9RGBDG9c+V3g/7Qkhxaku9A
         lA4l/N6elGZlVIq++zVeLbRiKqmu3bWl2/2OoDC734flXTNJAorsN38MtQurz2Cdes0i
         HHBuAu+42qUJrB+dlFiOV83S9sy2wopDABycchpLick2/LY4FiFsm+FowdQe2szcWfjj
         IMQ9TP0fV61MQQTMmEPzT52zu1fw2ZnTACIrYizR+HbhLAU4gdPCC0Wl0BK/iMK8nyOF
         xOmPsMsC0nG2WfLZ8su9qA8NTJzDCehzWkxQxzXij1kC2b0vY8UhrrNShyvX5VjYznAw
         TvgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XuOzy7DSGMVrwWDh7V3xhScck9rJv3ZkjmRrzI8ggv0=;
        fh=5dbJPTZ428p1LOVRAcVvMmI3Zqbm+ih/JAyWp0BkxEE=;
        b=rCkWy7Dd/mP/I9+X6uclaEtRzPkMFKBzz3bVXitNFLs5ng0IsfDzxskxeOje7dQD+k
         BTBrAWux071H60gQ3haQ1k71Bk9GnJB3DMb4Ula2uAxQAl4Wcddm89Ng1rx1DBSnFQJA
         vrW/G5J7VfTxlFnq+XaCXhGmiHGR884css3V9TYI74KeOgk7bf5Bw5lqJSpkjELAw5k5
         7cJkz98pLgTm69MSBg4zQ6VPnkHNFzpCm8uQyTWA9CXDrAamiRC6T0eapYzWNhN0al4C
         GHEwmFLpsMgGLPGIYzN2LTFgftGGR8kY70tEzUfP9gMyPHgamgUqnJE/hI1aciUGlINR
         Y8Xw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793806207; x=1794411007; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XuOzy7DSGMVrwWDh7V3xhScck9rJv3ZkjmRrzI8ggv0=;
        b=B4NHfTIu7W5Ik7sQdP4RN5hm0J86+FR85I04AzBg7ypd2fJn9pxo/7ZX93dGZsY9kl
         Rp3qinlS41/vaPrpdVn+ECCfZv8Gek+jndUktyAnem1TxUETpQpUkPg9xgD0lJHCLy53
         5tUQne+vcfegt7vRg915Sm7j7KAIkmt+IZb+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793806207; x=1794411007;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XuOzy7DSGMVrwWDh7V3xhScck9rJv3ZkjmRrzI8ggv0=;
        b=mafX8++BOKDEzRCk6f8iTyZSTkbroxA9Mc31AqFLCd//N9e65EnUaJoEzJ1rCrVIFw
         cKlWPRLb0TMUXuViUL/aotGQAYCwPME56vRh/O/BrglhZyuTcNhjjN9y0H36lV2lVGLV
         QFnv/EfVqXDwAdXtY0qMRgF3KsxjnoZzBVlwxd/FkiumkBia/+T9x3XkpMcfrFgfOs9c
         0XuK4R/mzv4ekrMBwj8zl5QldWXCHgPdUzxd6KcAXtx+ttAgJHurdQPt7FoPzEUyW0mj
         dJ+vSBAtFEAfjhn6tKFOthndMjpqgReq5urp3ni5EWxwVRw521E1LPm+ddpLYHBR/DBo
         gBAg==
X-Forwarded-Encrypted: i=1; AKwUvBzwld6xUJfVaBlyy1g2vbGau2pqoyouDbx8XYlWDQSyyAsVodn7p4d4HfiYN6KQUYCb32UAy5b7ptOxG/o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+B7nar1QsB4Kdr99QsiTPFoy7wzLCEbbIhS9+H77/y1Hfte18U
	Xyvf+z/aARpuDUaK1SfmnMZoBE7pCGBdAYTpZ9rf9/9FvqflyDD4u/8RaGu3iJW4md2UqAxtIgI
	oQeOIBDvLsfh7wVXn+ylvkbCw27INA3AEOzoIjQ7q
X-Gm-Gg: AYBFou3tY7YT2GY9ByV3ZLtl9QToQXdkrLoaEvZKTfSYn4+RXHNjQ1g7fH8I+FFK9fH
	MGjITuOjYoK7xMgeN98+GN28qdthGGKGA0DEVzAivWNX0Uu2g3M81F9S3JPV1UWCAeI0T7jcELb
	ebzvq39wGblVnb6O7Ao5dRAvLTQA8WB9dV2HDYqSzfxAUEZeMiHwBSSm5dmKHnoeVcgEjtWmCxC
	ShfGIOlN9HEe8lXPvls+eQtdrSQz2kUNtE2b3g6aLDcmwB8l4oweDkU1Z82e8fNeMech8585+zg
	/8rIxdtNGa2p0Jm7HPyyf4h1aVY2LQ9ANlDx74tzJjZawOtMmgeyAZynlImY9/OX5pygcxBAnW+
	IGO4VVcTe2r8I2VSgj1+VWXaIzEN0prCVUKsLJ0uCjHMeBpNJLnEjrWnNbfIAamnUGJNQda79Js
	8hs91jypndHcTbotMf
X-Received: by 2002:a17:903:38cf:b0:2ed:1c15:ffc0 with SMTP id
 d9443c01a7336-2ed1c160464mr6880415ad.30.1793806206581; Wed, 04 Nov 2026
 07:30:06 -0800 (PST)
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
 <aufr7SA1BO7zDQws@gractus.seuss>
In-Reply-To: <aufr7SA1BO7zDQws@gractus.seuss>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 4 Nov 2026 08:29:51 -0700
X-Gm-Features: AclHuK-zfu9STJuyYWXUh5dKQ38KfyI8wl9OSEqKb4q455Uo0fKzhQBe9ijm_bI
Message-ID: <CAFLszTgpzC_z21mBpOGwFvEvy0LLxCJmUTFnst5g+1pM7BpEjw@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] pylibfdt: Add subnode/property iterators and get_mem_rsv_list()
To: David Gibson <david@gibson.dropbear.id.au>
Cc: dianders@chromium.org, Devicetree-compiler@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Brian Norris <briannorris@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Devicetree@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	linux-kernel@vger.kernel.org, Julius Werner <jwerner@chromium.org>, 
	Saravana Kannan <saravanak@kernel.org>, Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Sun, 1 Nov 2026 at 18:49, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> On Fri, Oct 30, 2026 at 07:50:17AM -0500, Simon Glass wrote:
> > Hi Doug,
> >
> > On 2026-10-28T21:46:49, Douglas Anderson <dianders@chromium.org> wrote:
> > > pylibfdt: Add subnode/property iterators and get_mem_rsv_list()
> > >
> > > Add Pythonic iterator helpers on `FdtRo` to simplify walking nodes,
> > > properties, and memory reservation entries without manual offset loops
> > > or `-FDT_ERR_NOTFOUND` sentinel handling:
> > >
> > > - `subnodes(nodeoffset)`: yields the offset of each direct child subnode
> > >   of `nodeoffset`.
> > > - `properties(nodeoffset)`: yields a `Property` object for each property
> > >   of `nodeoffset`.
> > > - `get_mem_rsv_list()`: returns a list of `(address, size)` tuples for
> > >   all entries in the memory reservation block.
> > >
> > > Assisted-by: Gemini:gemini-pro-prerelease
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > >
> > >  pylibfdt/libfdt.i       | 45 +++++++++++++++++++++++++++++++++++++++++++++
> > >  tests/pylibfdt_tests.py | 18 ++++++++++++++++++
> > >  2 files changed, 63 insertions(+)
> >
> > > diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> > > @@ -201,6 +201,23 @@ class FdtRo(object):
> > > +        soff = self.first_subnode(nodeoffset, quiet=QUIET_NOTFOUND)
> > > +        while soff >= 0:
> > > +            yield soff
> > > +            soff = self.next_subnode(soff, quiet=QUIET_NOTFOUND)
> >
> > Since Fdt inherits this generator, a caller can easily write 'for off
> > in fdt.subnodes(0): fdt.del_node(off)' and get garbage, because the
> > offsets move under it.
>
> Right.  I noticed that, but merged anyway, since you can basically do
> the same thing with the existing interfaces.  By abstracting it
> further, this interface does arguably make the problem worse.  This is
> kind of a perennial problem with the Python bindings.  The libfdt
> interface is shaped by what is and isn't possible with the flattened
> format - the reason we insistently name "offsets" everywhere, rather
> than just "nodes" or "properties" is an attempt to inculcate the right
> mental model.  By abstracting things more, the Python bindings make it
> easier to miss that.

Yes that makes sense, and noted.

>
> [Aside: one of the many projects I'll probably never find time for is
>  to write a Rust-native libfdt, where the ownership model could be
>  harnessed to enforce many of the required invariants]

Yes we talked about that briefly last year I think. I haven't
seriously looked at it though, apart from some experiments with
ownership of an offset. I have dug into Rust quite a bit but I'm sure
there are other people who would do a better job of this.

>
> > Since David has applied this, please can you
> > send a follow-up noting in the docstring (here and in properties())
> > that the tree must not be modified while iterating, as with
> > fdt_for_each_subnode() in C?
>
> Right, adding a comment is probably a good idea.
>
> > > diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
> > > @@ -243,6 +243,22 @@ class PyLibfdtBasicTests(unittest.TestCase):
> > > +        leaf = self.fdt.path_offset('/subnode@1/ss1')
> > > +        self.assertEqual(list(self.fdt.subnodes(leaf)), [])
> >
> > The docstrings say both iterators raise FdtException for a bad offset,
> > but nothing tests that. A test that list(self.fdt.subnodes(-1)) and
> > list(self.fdt.properties(-1)) raise, perhaps alongside
> > testFirstNextSubnodeOffsetExceptions, would be good, perhaps in the
> > same follow-up. Since these are generators, the exception only appears
> > on the first next(), not when the method is called.
> >
> > Reviewed-by: Simon Glass <sjg@chromium.org>
> >

Regards,
Simon

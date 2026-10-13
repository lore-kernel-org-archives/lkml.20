Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6200542ED8
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 19:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791920952; cv=none; b=mXBXh4SINlENaV01IZkhgAsOamy7dBcXvH0O+WV1EE5qhT96kjY9n1uJ4neQ5fM0b4NNGDFUCLCfolyK+dNsW5GtAqEy6vsjTpVgPN9YMDYuPr+7fk4FAmR1FA4OEjVJRzebyMVKJuJFiEKzAOFh57DaeCOuARESG5uQmKVh0/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791920952; c=relaxed/simple;
	bh=tiT2F/ECbxiEabWBAP09wZ9MI4I+09GcYjUweKp+W5s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kkkPO1yCFlQ5oCgyvAIl1793coBOyQDItnesuJ2exqNuBrYuGoId9KrB3gmyia8A01N59qSUYTY/PLtqVb4ItSo9/eOsA3UV69hCu+axtsCEX0yIBxHir5ndniSMv398sY2Zs/GHfMJUVd1oGu4yKO3G1x+mDXu4VEXrnV1ooPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard.org header.i=@beagleboard.org header.b=knc6/tKj; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard.org header.i=@beagleboard.org header.b="knc6/tKj"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-15756f82e8aso163935c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard.org; s=google; t=1791920950; x=1792525750; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :message-id:date:references:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ReAJUuSEnDcRQKK/UhSnvjLFcmpy/PcXbUdjFmS7Wvc=;
        b=knc6/tKjiJMLpuScV6DSTh/RtWFL51d48dGSkGpABiVVjpY1LH2GdWY1an3wuGpiiq
         PEkKeJnXqiN+M36vnktCX3Jhvzp57Br0ypGLKOUtBmNtKKLJFSVWKa+6kPYgmKqZwBfY
         0lrr7T56F3hDdm+k4X0krC2meP3j7lPrM0FvcIIj1f5h9cqPZyyQsBwyolAmU6cUroTb
         yPUuraJhpNX1a2e2G3I7GeZLgEyi5dXlnsNd66qvUfovyZCYkUc74xxOd1q1XA1N8INo
         wJJ1MepuJxIAQTw6pkSZf1ke32McoYokvuzki1nY0o0WfR/bOEMWUyfdcsCKPhRcodfv
         EjRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791920950; x=1792525750;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :message-id:date:references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ReAJUuSEnDcRQKK/UhSnvjLFcmpy/PcXbUdjFmS7Wvc=;
        b=nqNJeV/sJMcWD2A0T1MDz3OarcosKTbLIhxz+NkVgy/oaAG94GQYAqPlKhErsaEN6x
         N3p028EXW59eEQPpGw/YTxg7f7liWQVxgYJQExrHgLAOx5NTcCkb1+cE2DR3EMM36v89
         WN8GO1LWRPBszlXBaf6JFczKHbxuwYk/oDFhfwnybJE5jX/rbb4HR93ji65RnrAXv2YO
         927BMgxg3BE8lBrF3g4LJr3fLFVhKrhYKpX08Lox9H70o/t+TjKGgsnmxwChUceyNFR8
         zXNAFAtTjtDPuvw2579yPm1knVsLA5+RcFtRDMWlC6bcXbGb4l1OyS7N7PTr0km+cAn3
         Wn1A==
X-Forwarded-Encrypted: i=1; AKwUvByyWEHyc9dCVuQ0XMki1Ny5v1b43z3vdLhYtSekOgzuIx0OO5KgewstLyiN5FBSj1fkVYliKZoNLsl1Ii4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKxAJicXv6DPCKXf1Fsb/32ejO/1j3GiUeHh+jrdHec+Fe1ja56
	048OVeyV0u9++lZXQrvWWKjOFw5UaU7WuC1/5Md/N4y9VPsC/O1sYhxD1qZij3YkjQ==
X-Gm-Gg: AYBFou1/Cvhju+ogCE8mIQJarLXc1g0hFuAybVIhD13cigiB+csUO5pzqOf3dcYSlnK
	SDFU/0M3E6xOtZhSJU658hJBUCE6E21FVHszuCDTJ9koF+vQLsRwDEvTIW3ddSBCj2R4C30PfEB
	l5F7lcu7D1LgMYRuNFDYfMQkdCaCAgD4JcVXyaiixtcCg498cR0UAN91E1onwrxhkwvHP9oH6Hr
	ueoUYv3kcDX+SbhthSXIk9pxMTJ+X4gKIhFC+7Lgb2YWgAuCWIfR6WzHER4b9+hCtqhqLqXlBqi
	dtrPMHpAxLV99cprNbI957PL53FQx/CKlNb49SqCsoh/EWkzrq52bihxJ1BygYqAEiei6aayQmo
	AAj0qT4vs/e3s7MZ5b/dD6nfBWqDZWfKk2XanlJxLWts1XtSYeKWrhrSmHCoJa1yfRbpbKN2PBK
	v5Cpa9AvaiFruVTPvvxGp/hAipxRH6QXoCc/Hcx2TJh0XeDs0UR8xe+PU0CqFEdGF/5F4jADZP
X-Received: by 2002:a05:7022:170c:b0:145:5c7:7185 with SMTP id a92af1059eb24-16a10f299a3mr17694738c88.5.1791920949453;
        Tue, 13 Oct 2026 12:49:09 -0700 (PDT)
Received: from fedorapc ([2405:201:4019:32fc:3c55:6b24:5147:322b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a42407e7sm40620145c88.15.2026.10.13.12.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 12:49:09 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Ayush Singh <ayush@beagleboard.org>,  David Gibson
 <david@gibson.dropbear.id.au>,  Rob Herring <robh@kernel.org>,  Krzysztof
 Kozlowski <krzk@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>,  David Lechner
 <dlechner@baylibre.com>,  Geert Uytterhoeven <geert@linux-m68k.org>,
  devicetree-compiler@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  devicetree-spec@vger.kernel.org,  Hui Pu
 <hui.pu@gehealthcare.com>,  Ian Ray <ian.ray@gehealthcare.com>,  Luca
 Ceresoli <luca.ceresoli@bootlin.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 15/15] Introduce v18 dtb version
In-Reply-To: <20261013192342.149768ed@bootlin.com> (Herve Codina's message of
	"Tue, 13 Oct 2026 19:23:42 +0200")
References: <20260826083146.304291-1-herve.codina@bootlin.com>
	<20260826083146.304291-16-herve.codina@bootlin.com>
	<arDMhoNNXcPi81sR@gractus.seuss> <20260925152157.511dc65c@bootlin.com>
	<as3ZWBr3wRonkxXF@gractus.seuss> <87pkxd4jly.fsf@beagleboard.org>
	<20261013192342.149768ed@bootlin.com>
Date: Wed, 14 Oct 2026 01:19:02 +0530
Message-ID: <87ld814c0h.fsf@beagleboard.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Herve Codina <herve.codina@bootlin.com> writes:

> Hi Ajush,
>
> On Tue, 13 Oct 2026 22:34:57 +0530
> Ayush Singh <ayush@beagleboard.org> wrote:
>
>> David Gibson <david@gibson.dropbear.id.au> writes:
>>=20
>> > On Fri, Sep 25, 2026 at 03:21:57PM +0200, Herve Codina wrote:=20=20
>> >> Hi David,
>> >>=20
>> >> On Mon, 21 Sep 2026 16:20:02 +1000
>> >> David Gibson <david@gibson.dropbear.id.au> wrote:
>> >>=20=20=20
>> >> > On Wed, Aug 26, 2026 at 10:31:46AM +0200, Herve Codina wrote:=20=20
>> >> > > This v18 version will add support for
>> >> > >   - Structured tags.
>> >> > >     Those tags value definition will allow "old" libfdt, dtc and =
other
>> >> > >     tools to skip unknown tags if encountered in future dtb versi=
on.
>> >> > >=20
>> >> > >     libfdt, dtc and other tools implementing version v18 will be =
able to
>> >> > >     skip unknown tags available in dtbd generated with later vers=
ion of
>> >> > >     dtc.
>> >> > >=20
>> >> > >   - dt_flags header field.
>> >> > >     For now this flag field is set to 0. It is a placeholder for =
future
>> >> > >     dtb version and could be used to store some dtb related infor=
mation
>> >> > >     such as the kind of dtb. For instance, the future addons form=
at will
>> >> > >     use this field to clearly identify that the dtb is an addon d=
tb.
>> >> > >=20
>> >> > >   - last_comp_version_w header field.
>> >> > >     This field is similar to last_comp_version but for writing.
>> >> > >     It contains the lowest version of the devicetree data structu=
re with
>> >> > >     which the version used can safely perform modifications (taki=
ng into
>> >> > >     account following rules related to unknown tags).
>> >> > >     If this lowest version is greater than the last known support=
ed
>> >> > >     version, modification are simply forbidden and lead to a
>> >> > >     FDT_ERR_BADVERSION error.
>> >> > >=20
>> >> > > For modification, when an unknown tag that can be skipped is invo=
lved
>> >> > > and last_comp_version_w allows modifications, the following rules
>> >> > > apply:=20=20=20=20
>> >> >=20
>> >> > "last_comp_version_w allows modifications" is a bit hard to
>> >> > understand.  What exactly is the version number against which we're
>> >> > comparing that value?=20=20
>> >>=20
>> >> We had one last_comp_version.
>> >>=20
>> >> Now we have two last_comp_version, one for reading and one for writin=
g.
>> >> We compare again the dtb version supported by our libfdt version.
>> >>=20
>> >> This comes from the discussion [1]
>> >>=20
>> >> [1] https://lore.kernel.org/all/CAL_JsqLRrbZje_gGZPBDni6StFa+6rdiECtk=
49on8VfkP7CDvw@mail.gmail.com/=20=20
>> >
>> > Ok, I now see that the logic is you simply fail to proceed with writes
>> > if the library's latest understood version is < last_comp_version_w.
>> >
>> > As I said elsewhere, this approach doesn't particularly make sense to
>> > me.  If lib_version >=3D last_comp_version you *can* write, even if it
>> > means stripping everything that's not understood at lib_version.
>> >
>> > So the real question here is how do we know, for any given structured
>> > tag, what write operations require the version to be downgraded (which
>> > might in turn require this and/or other structured tags to be stripped
>> > entirely).
>> >
>> > This is related to (though not the same as) the question of whether
>> > introducing a new structured tags requires a bump to the dtb version
>> > (though not to last_comp_version, of course).
>> >
>> > Here's the simplest model I can think of.  It's what I'd suggest,
>> > unless one of it's limitations is a showstopper for what you have in m=
ind:
>> >
>> >  - version and last_comp_version retain their meanings.  No new header
>> >    version.
>> >  - New structured tags *do* require a new version.  If a dtb wants to
>> >    include a specific tag, it must label itself with a version that
>> >    defines that tag.  To enforce that:
>> >     - For read operations, if we encounter a (known) tag that
>> >       doesn't belong in the header version, we throw an error (either
>> >       BADSTRUCTURE, or a new error for the purpose).
>> >        - If version <=3D FDT_LAST_SUPPORTED_VERSION and we encounter an
>> >          unknown tag that also trips the error (since if it was
>> > 	 defined in this version, we should know about it).
>> >     - For write operations (including in-place), we always error if
>> >       version > FDT_LAST_SUPPORTED_VERSION (done in fdt_rw_probe_()).
>> >     - fdt_open_into() _is_ permitted if version > FDT_LAST_SUPPORTED_V=
ERSION.
>> >       It will strip all unknown structured tags from the entire tree
>> >       and downgrade the version to FDT_LAST_SUPPORTED_VERSION.
>> >
>> > This does mean that every new tag does require a new version, which
>> > may make experimenting with new tags more awkward.  More
>> > significantly, it also means that any change requires a version
>> > downgrade, even if it's just updating a handful of properties.
>> >
>> > On the plus side, it's fairly simple, retains as much as possible
>> > current version semantics.  Most especially there's no tricky
>> > questions about what sorts of writes might invalidate an unknown tag
>> > (they'll all be stripped by the time we permit a write operation).
>> >
>> > If those limitations really are a showstopper, I do have a few other
>> > models that might work, though.=20=20
>>=20
>> The limitations do not sound too bad. And it feels easier to implement t=
han
>> keeping track of read and write versions separately for each new tag.
>
> But it doesn't handle the use case I mentioned in a previous reply :(
>
> bootloader knows about version 2.0
> kernel knowns about version 3.0
>
> dtb 3.0 we want the bootloader to skip tags it doesn't know about but thi=
s same
> bootloader has to handle 'unknown' tags on some modification. We want to =
have=20
> possibilities to let this bootloader perform those modifications (under p=
recise
> known rules) and pass this dtb to the kernel.
>
> Best regards,
> Herv=C3=A9

Apologies, I guess your email with the bootloader case came while I was
composing, hence missed it.

Anyway, that is an interesting case, and well, it does happen rather
frequently in embedded devices. I just did not consider it in the earlier
reply. If I remember correctly, U-boot does some dt fixups after detecting
things like GPU in case of TI AM62 (used in BeaglePlay and PocketBeagle 2).

Best Regards,
Ayush Singh

--=20
BeagleBoard.org Foundation
https://www.beagleboard.org

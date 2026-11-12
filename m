Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794509294;
	b=WypaQDspGeLb9f4xd6TTYOqV9FdgwWnGsPBqA4iv/NpTMaBOk8RuhRH9pv8cA4N/QyvE
	 zphi4bA59DG0mmxt+Vml92YSTu9c4TE2/QGE+JERPsEvV9ejjCo9SeJijoWW2vWDHk6c4
	 0p9mMlZmM2wyrBgTW/ETGECmIdkYUuUVA+Oa15sHcC6KF6h3y61YxJCAh5xu+4RXg6SxR
	 Ust6y09V1j74xwcBrBJMqqYfbG06L5ZwKCaE6Ubh6EqQf5rAaX1LmdmBTsK1zyeuQxMxX
	 cVK3hkMjeh/JjnaKoXIk+InwAJvWO9TYdOhanF923vCJEab5PCW5vTM+0zyusyxN7iw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794509294;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2ZNo/BoPv1da9h6ldNRtbZX7H0ERFUHxFb1OvAOtsY0=;
	b=MmGQitSUYdNEQskdYSVwMxJZ2eIsoaDJ5/4GsqVV6A3Lx7SQZ7T/5uQ+XO+4Bti9NtYL
	 Yzv3ojrxY+ovj7EijkddMH+nHG6x3Vi8id0IhYDAWUwWYOytYF+gq5jEXrFaGCJq1Ll/K
	 SqIofcTjjvusqNID90ogCLFqUr1CpBBga/Vz0w/7Zml+HRbtkZP7LY2cX+uerY6dxZZhT
	 EkyLKezWOh1jto9GK6uCk5W0nnFjwOENRawf+7Ft02yisA/ZAV8NDktmKy2VdYUurALq5
	 mFmbJeBBopoWHY8Q1oslUDoYE8y0ZA3AgRGy85OCayLi2Yja+j3nfi54PlRhR/y3NZg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0xoVYenJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1950D606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:48:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1950D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0xoVYenJ
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5366ae57896so216551cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:48:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794509293; cv=none;
        d=google.com; s=arc-20260327;
        b=Pzb/nfHnFDas91khVXS/9mP8hxA1wvelo/tb21ATn4sDbPJcgIEddsK2E53TE/RCfT
         m/l1gQ2mRDiby1ZShwCb720pMMN+urqes5rw4II6CLLw+rjzFiyrptGE4RSfS/pIAqM2
         zbaO/JamC3pmxqF42zt/jWCr6wCuuPWA1zkQOcbobPPVrBtWjkDZHYmVd+HIIITrlzWR
         rGVW6HPUo9RyThygMYL8O8fSF9q1OA/sgQmm6Wjrpps/YOkgNRr1lJgfInSVW/JTnsf2
         A7KenkDirU7H3v9QKqxjSpv9P5p03fRLEcxsN7ZCsg+C+uSU8b3rV7xdLhSfMsVJQKxC
         tHAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2ZNo/BoPv1da9h6ldNRtbZX7H0ERFUHxFb1OvAOtsY0=;
        fh=OOQl1NFRJs/PlzNTfh1i+nPY4yIymtT8a8PdsahZqHg=;
        b=bjQ1vZo5oCUEWEHHvyO7N7aTWszYmS+u+bpdzJzI6ou4ygfVNbqTHwMheQJBdwky/v
         aGaUWQf75Hlk+IFiuxzsZ3nAxmrxWTs8x66gnWhhrVRPmwQVn3F8oywGa3Rb4/gPjQf6
         k8R6Sokt8OpGgdis07X6NqkYY7hAhHhaF8+NT0Fa1tu1FL/ov2xUkzIgYTaELEMpjVsU
         TePGww/HU7VNFvK2b5RnV9jT3LKmr2PT9MPIvgea1yyL13768cLZp4E7JP9X4ZovCPcq
         upXon1erv+gDfU7izCQNjEI8jpiE8lNx7P5AqgQ80t4+gvq+rmpyhSUVvnSawjdiXfPV
         vl5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794509293; x=1795114093; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2ZNo/BoPv1da9h6ldNRtbZX7H0ERFUHxFb1OvAOtsY0=;
        b=0xoVYenJNOHYVK2tk3GQfolNIKeukJZ32f/YHV41rGHEFcfGWKY8DZAT5ilu1wxECC
         pRtnOL5FnjC8U4DbCjzMoj/gGseWk41079Yc8xscAIe6N8uXfVn6pMqstuXadzT18sdN
         Ei1OEWF7hhOXRwOyxBNzHG6y1ldj0MbN7OApgdP2vIOQWTHd9fk3W10sifNDgr3ordE4
         s8ZMzTyHKM1/LSLY8UmNNPt+XjoYFIbkELNNsLNkLdD6dz6HmdV+JY0tEe1YRKBCeCCh
         Sa5thdQu4rhEJCkhziV/TfDJ9BSfG7fAcXteNGgJLKP5ovJVqoFaoWuZxe22+FBRPT2P
         Y6kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794509293; x=1795114093;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2ZNo/BoPv1da9h6ldNRtbZX7H0ERFUHxFb1OvAOtsY0=;
        b=BN0txn5VXd7XmJ+TW+RuW+8zAJ0+tARjlj6uaqkF8ReWKmi9PadN949fiVjTCc0U2y
         x04ygQ0HLD48innnOt3AOd/OrI3mbdH6iw4SN1LiYUjsPfwDOQoP0X3cwkLZLLk1fMpo
         b4a5EmR5BLze7v1J3x9ILanszyZ8ukKKBQn3xcn2hPOvOAdKjminEvRFfVWBzXok+Nqr
         cfW+p6r5fYCRclvJ7UdYjgll2Xyve4Xu2U80sYWWO4qouHJpLltQGP7fI6/1dree/9rA
         iSnRm6KpToWtiNJ1nN2+DToWhS7N2mFW2kCB4G2IbytbaKezQivJZmEo+u9Ew4+QdT5k
         ePDQ==
X-Forwarded-Encrypted: i=1; AL+hErFr4PTFGI6XQCLtXqFnf2daQNPbddziUqRULtrl8g07Ztv3NpZGbmMTMI4Is+o3I/DyU30FpBGpUcrkp+c=@vger.kernel.org
X-Gm-Message-State: APuU4Z88ll6wYvOZAkqq+Kf/6JfN5PhdC3AOEuOp0Nv4Djcb6c94kLXv
	Kkl26o5WbRk7DaB0xYafy7LM5t9+nDLi58oc3+NQbr1wwQDy/EzUf1L5ADXKMqcymjM1VAhUmeh
	ZrLIyuJ8GNxfThEuWZRSVB1oP4hsHIPw=
X-Gm-Gg: AYBFou3ZnhAET1YjQUdARRet3fdKrzoNMIc+vi2cw1dEmmXPLS4vAxReVG0HddOdcKL
	MzVCxYFuhi4G/77xSSMQBwfjUDSkVINTma6PIXsNFt1x1WvDT2i5gJZ1UUy9FdwUhw3h08Ijwmz
	Cm9+AHqha7EKASZNKVfGpUueyeo3ESmfHQYsqxStg0z5T7Jqc6ZYtcFJvb3MXYsfhHoDUvhxACx
	2n48yZlekRYFsvknHd6F5WOoXuUG3B25c5zln99DWwVo1fUpKey3NUsq/ssxCscEHdDnwsP7ekt
	vUOVMs753ju90fGjHRN6B0hGmyls9EqL0Zm2bVdK5NDSsb/Qiv1I9rM5Yb5dV3O66mjllIF1cNH
	A/mTBgCSnNweiwXiItkhpdpvm956SFNMPr7MJuOTCDz+OzwO7g5cU+vbSRw==
X-Received: by 2002:ac8:59c9:0:b0:536:5e62:4647 with SMTP id
 d75a77b69052e-55ac755ea49mr5719511cf.16.1794509292920; Thu, 12 Nov 2026
 10:48:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111212921.290857-1-artem122novak@gmail.com> <20261112-reprise-jukebox-41fb305e9044@spud>
In-Reply-To: <20261112-reprise-jukebox-41fb305e9044@spud>
From: Artem Novak <artem122novak@gmail.com>
Date: Thu, 12 Nov 2026 12:48:00 -0600
X-Gm-Features: AclHuK83CGLq-frSEcoEahwnbtEAvhllMZwb7XrHT3XQ7fzapMydAcTCyK9acmI
Message-ID: <CAPufuhZPs66hiMzHZPMLBiOAOjJxaePo=9OEvcxmxyQdKFxBVA@mail.gmail.com>
Subject: Re: [RFC PATCH] dt-bindings: vendor-prefixes: Add Casio
To: Conor Dooley <conor@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Conor,

I wasn't entirely sure whether this should be submitted as a
standalone patch or together with the board binding,
so I marked it as an RFC.

I included the vendor prefix in my October 22 submission for the
fx-9750GIII binding.
I guess, regular patch would be nice, in this case.

Submission from before:
https://lore.kernel.org/all/20261022063902.471383-1-artem122novak@gmail.com=
/

Best regards,
Artem


On Thu, Nov 12, 2026 at 12:13=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Wed, Nov 11, 2026 at 03:29:21PM -0600, Artem Novak wrote:
> > Add Casio Computer Co., Ltd. to the Devicetree vendor prefix
> > registry.
> >
> > This prefix will be used by upcoming Devicetree bindings for
> > Casio calculator hardware.
>
> Why is this an RFC?
>
> >
> > Signed-off-by: Artem Novak <artem122novak@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/D=
ocumentation/devicetree/bindings/vendor-prefixes.yaml
> > index 5471a06f93f1..f05475072eec 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > @@ -303,6 +303,8 @@ patternProperties:
> >      description: Capella Microsystems, Inc
> >    "^cascoda,.*":
> >      description: Cascoda, Ltd.
> > +  "^casio,.*":
> > +    description: Casio Computer Co., Ltd.
> >    "^catalyst,.*":
> >      description: Catalyst Semiconductor, Inc.
> >    "^cavium,.*":
> > --
> > 2.56.0
> >

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792688960;
	b=azbUR19JmYsueQvGHB+mVKkgFmdC30bW0M2A0tDF+scLOcRHXosSYEch+9SIM9SU+dy9
	 +m56yh0lv7oY/sJjowDpDrxQKYLuaDpktivGO8cd2hXXlq1J9DUtk2VNTDcGCFrUMPEQp
	 wcDSi4cgNaBQO6lQ+wIPKTKyhIrMwGUY7QVSFXb2/K5wx5tS7kpkluOntQCt8FzCtUCvt
	 Fpso5dL/gT+kmTfk+Kn3T3H+dPTN0NBJo8yOLX0pUDpmKj3Zx/bT99tJBLXjhz2LfZ/kT
	 zzKrXng7wTDAXkn26ExjCMdfmmvupmGPow+dCbkks/7BLhwb6c6kaCaUVXR5LvHzAiA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792688960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=82k83wFmz3nVH+5krCkB7NOaf/KiiZwPu1SQ8KFsgks=;
	b=YA0nfGJsoLv0vKHYYOTFSkFI7as5h3abmJpVmtJ/52I9/W7Vbaje5QIRZ4HydMK8Uc2q
	 7R4tO4JwOAZ97j7Ya6Uw4s0vM31a9f1YChO2kVYk5kDbzz3BYqw7fkpv+uxpP00xyR71z
	 Ev0grRYcl1p/uFC086BboMK9b7eCC0ZTpcX+nyXH69kUZ13LdA74X1oxy89OYt6r8VtCK
	 OOdHxqLZEDfoShXacQ8mP3m/dbziY7cxOBTV1jE0nQHM8zUx3yGVjm27IXDDqC5ZLgr1D
	 Sh1iuhgIh81IX8G4EAp80lJOfV3NmPVQdYaJ98m5PSLerl+vEbFpIdZacE14Q+niv7w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RhfHyM8+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.44
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF20606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:09:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DF20606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RhfHyM8+
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-917a04338c1so1092026d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:09:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792688959; cv=none;
        d=google.com; s=arc-20260327;
        b=CvEqwdaVSaMN9g4f5TdxzUAqqV0H41OpbHTIc5w0YI5TO7str/eJutUJkBpIYgmOuC
         rKu6AUq/USfinFBoLNkDM1p46nqR4OWbiUU9nkBmU7Z1YfzpgShrveJPiLw0LB7GdL2u
         8ExL68qJZArMitWjvinT7LUtr0OwkLKB2gwDSrmnc8+S7SX1MXorwpLg5/0+OY2djoTO
         J7M3Kqd9+TYIAB/AfvTW4ZiI09zDg21u6fMvpnCmPuln8nW0yFofS7QSIkqDPVnxY2kI
         pfE6Gu13tvmq1ogmk42E/KsPd2qvUyVArRWYCfiRLQSZ5bR+O7uTMWJApv2GvUdpc/pY
         RicA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=82k83wFmz3nVH+5krCkB7NOaf/KiiZwPu1SQ8KFsgks=;
        fh=jH4gabrmwixBzvJxLAPyY9iMqvpMCQuL3UlMBo3scb0=;
        b=A0lFrHZ+nZT3l2N5Rm6Y3pfhXHYlrghw4cUkgwhz9QnFIYGH6MlWIdE/JDs16rvK8G
         qL0WIfKIgqJMrK0IaqInChFkskvaykxKJjra3PtCEp5fUykBi1uPg77xt9UsI/EG08pC
         W1U4hgnaftfuYyLh8W6qElA1h2eFqnTbMZs2oYEoTsD3TDuBGqZULoRlR/Gpid7mGtum
         NQoPVZJ6rMyl9Ieq7LKbSmSV8GFtbgy9mQMoFP833s0YmA65eADX/bwpMsZ60XVVKg4E
         rua6UO22GBWgQGnQVaANdmTOZ6HGBz72z4McD0K64jB6k02lIwkVpXGhirEPuLcHLlVf
         JfkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792688959; x=1793293759; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=82k83wFmz3nVH+5krCkB7NOaf/KiiZwPu1SQ8KFsgks=;
        b=RhfHyM8+YTOLhxAHUIkmfxcsFa1XPxmpMO9yLA1LhxyURUokw5gs8D+ug/0FyeyAQc
         MyqOz6cMqhjuVj1gwgI0gbq9eogfxKwZj/+mH755WwL38zLbBnpuwp9kyNR+uPC3Hsm6
         pBrn5oIMrsw+JTjRQJAOJq63fAQvU3tR6WNfyPWW0G5Q2ZJx9CR46kfCwdh2YJ6ru6Z2
         mHVWYprG4efwN5Lr/0Diolv5ub+nBdOGcZ6RYDpJpgbpdtYtjtd8nz9wPhNI5M7BSnWI
         xWFTK4kRBqvw2RmCfhvPLIivhbbBeGUW47ZvIwkCzb5lMYsosKVhNyKGJ7AZt6sbD8bx
         ZeVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792688959; x=1793293759;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=82k83wFmz3nVH+5krCkB7NOaf/KiiZwPu1SQ8KFsgks=;
        b=yfLTXtYCrp6L42mjkS4kRheK0WNFAk0XgktuTKeRB+OjTG+Xpyj97/vZgn6a0l8fQ+
         vR9ZV3L8pRnIa8utDfm6Nq3D8O7/67I9bwlVG6gi86ruUplVMkNnuPvpMjkiJsbzNIYw
         orYbLwotmmuoBOlsFtPvRmK3SydYatNZO+w+43gPWPwtQ6AMCP30yfrlMYieENe6nnHI
         K6vncxYo84/IZdw7AdzKu60jpBCezHGoeanQ51KHTVWV3HsUQ+NTYMMphpVMRulKIKEc
         2m5ww2e6q9AjoWS8WAD/WFurV1REfzL8TbdLTEt986XpKgzjVlWhY08qvk0B7ZKQ+l/m
         kSaQ==
X-Forwarded-Encrypted: i=1; AKwUvBy09IiDdc8Qwfyf4AMWN9bYUDvXe13PnE2atOxO6V8W+KXqmKqsEnlwDj3SeDHgDdFPBYiOHYymyuBo8oU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKAlUIm6X29sLYxKB6kt7JMkSn0K0oPvOLk8f5+U5tEqX+Mt+y
	AukyYRpoWsSmvstmqwuVIJMTHDT1I1Api+xzUerHbYR1OG99Ug9c94VryBXvWbJKsy+QyDJwz4+
	p4WtdztjNnSHH2QB9sLgdi6yotUYhsO9zDTm/RH587A==
X-Gm-Gg: AYBFou2yq0mu+WETWx2hpcBybbBVORk50n3J/+463BJqJ9EWV+6OUiSz3OVsKhPcjmn
	Kq5GWIGw0bEoqHD4/HYUW2Dwlc01xXb3pvqa7+urowmbEBVd3n6eUIWWAwcnWl21Lj7Leh/VhEC
	w2zFWhCSZh3KYZ2y71RbPfgz9jHTqvtzyS7oXpBpaTHUZ9IcbHmFxJr3++z9/y3GMM4LfG0/GF4
	L5ah5n9cCNBoTCv4r3rUwDV683dSq3jU4g41MrceI0B+7JkfZ6vM9tpgXrqre8+j4X/MmWD6vCa
	4xueWlzZM7H+moY+1HRZ5I6GzNXEbP/wTRjJlbIUPyuEmwUQh9zNWri69Sbh+ANmfIzvRS9MNBn
	JTezcmj+NI0YhCTIixVttsXyF7BBExhHD3F+NFnbDD3N/d92leQWLuBjHk3Le0kMjEaz9R3Gp5H
	R4JeO3+GiNLgnFMjSAuUJTqT7vdjjq5rpOyO8RzHawIUK560or
X-Received: by 2002:a05:6214:2dc7:b0:917:af36:df30 with SMTP id
 6a1803df08f44-91c12eb349amr97591916d6.16.1792688959166; Thu, 22 Oct 2026
 10:09:19 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015125644.12908-1-danielmaraboo@gmail.com>
 <20261015125644.12908-2-danielmaraboo@gmail.com> <qthsqsh7gvelar6fpquej4x2qqho6ltttuwdv3bytxvkpis2r3@hbnhxep5sxx2>
In-Reply-To: <qthsqsh7gvelar6fpquej4x2qqho6ltttuwdv3bytxvkpis2r3@hbnhxep5sxx2>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Thu, 22 Oct 2026 14:09:07 -0300
X-Gm-Features: AclHuK9cJWaAE8pMdznN5BGuXp9mwrvxRv_5jhrOTt82HaemknY-CJQPqq6o-Kw
Message-ID: <CAMAsx6cAaXUh+AkdMjZZhf6bFTdK31gqEEpHAA2F1wKkjeC7WA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] docs: doc-guide: add a guide for translators
To: federico.vaga@vaga.pv.it
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	alexs@kernel.org, si.yanteng@linux.dev, dzm91@hust.edu.cn, 
	chenyou910331@gmail.com, wy@wyuan.org, akiyks@gmail.com, 
	carlos.bilbao@kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 02:03 +0200, Federico Vaga wrote:
> The following chapters are somehow repeating what already written in
> other documents (doc-guide, process). Everyone should follow the
> process and the documentation guide, there should not be the need to
> repeat "how to write documentation" and "how to send patches".

Hi Federico,

Fair point, thanks. In v3 I will drop the generic parts of those
sections and link to Documentation/doc-guide/sphinx.rst and
Documentation/process/submitting-patches.rst instead.

I would like to keep only the points that are specific to
translations and that keep coming up in review, as short notes:

- a partial build with SPHINXDIRS=3Dtranslations/<lang> hides label and
citation collisions with the English documents, so a full htmldocs
build is needed;
- tools/docs/checktransupdate.py, to check whether a translation is
out of date;
- the translation maintainers and lists to add as recipients, in
addition to the documentation maintainer.

Does that sound reasonable?

Thanks,
Daniel


Em s=C3=A1b., 17 de out. de 2026 =C3=A0s 21:03, Federico Vaga
<federico.vaga@vaga.pv.it> escreveu:
>
> Hi Daniel,
>
> thank you for this effort, allow me one comment. The following chapters a=
re
> somehow repeating what already written in other documents (doc-guide, pro=
cess).
> Everyone should follow the process and the documentation guide, there sho=
uld not be
> the need to repeat "how to write documentation" and "how to send patches"=
.
>
> >+Building and checking your work
> >+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> >+Build the documentation
> >+-----------------------
> >+Look at the result
> >+------------------
> >+Run checkpatch
> >+--------------
> >+Sending the patch
> >+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >+Recipients
> >+----------
> >+Sending
> >+-------
> >+New versions
> >+------------
>
> --
> Federico Vaga
>

Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03384CB8A4
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 13:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790602760; cv=pass; b=ns9xeHUvRjgGOAmd3iSdOyXwSR0c3/3oCEJyBK7W/MWsw9BrpcWadgy6FQ3JIjesPqSOMttklEA3DwvWg7kRiNsaVAqtViGc+q/nYfT+m2Ep+ia6sGON6NzwBZ/psoUbZ9RMToEs7jNDYGz++f921BYGbpbhL6QDHQRZcdXu+0g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790602760; c=relaxed/simple;
	bh=kkoVXtyBSbX/hlAjoM5EXYeotLKKyXHsImySYu3kOBI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H2s6MFBScElaoLC1YamCK0Anq86iUw4zPLWHDvl3pDGIFYuLv9Xl0zi1d41h9K95yXZO7l6SfHOU1VB9xxpXTiesJ4Xh0WM2aanHNxAQlchPlNdqPHwqHx5W2FGyn4Wqemclo1tBE7GVSxB4tx7ll1iH4u+DTx2MU/fWmmFMu48=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b4a7I3Nw; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b4a7I3Nw"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c29703cb470so468698466b.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:39:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790602757; cv=none;
        d=google.com; s=arc-20260327;
        b=iXK75/ZXuZk/XnhuwWcHObAYBXdC1aIfG1RZTA5LmH/5ov7BG0cmbf6ulDQBom9B7f
         1IvmlqvIXEsc9OKM35IayJFCmghtLNfO0XQ21uz0lV2IjCmF4uxTMwz4zo/iFIX1E/pQ
         SuMyf7OWK0HaRma3go3NVLhR4DYQ1U1WWy8fvgRWbSQTxcijwhMWrN/KKuMMtcH2JGt/
         gDPJqWKgcEhbzYH5digxC6F1YW7tGV5Q/DeF+xLEz7JXOde99gWBfrHCF2jZJvkgJzif
         +fEExbE39CZEAjVgMB+BMzF+NAqBlH39Fk1pvgmaHbDx5cYOVqSN4wuB4AS5eHD722hL
         ibmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kkoVXtyBSbX/hlAjoM5EXYeotLKKyXHsImySYu3kOBI=;
        fh=fT6rrR/bDGjsvYcji/TJQ8FeHXe+ISlZaibXyfIRor0=;
        b=geZxlC4POvXlNuWnIoTUJ6QCfhwRG60gb3NGEM9wIZ7tLBFcFt+yR0bU+K6YEyG2ks
         hlEouEB/WeqqIuffBQls3l0JGHucwJeIsRrHcnGPIpKIm4VXKERDps/j0t6DTVQuu0kj
         VQ84oXaTlRP/VERCD8k19fb0Zkz/bDD+GtKO/3Tuo/mekDshgxRf1kRyAcKZ7VYIItZj
         6Fe3NOnlrp9V1OMCri7DyIDxUC9ewY3vhit0cPv+Ody4etx4nWbPencVeR9tTfRXdoEk
         Rj8fs3fFlte1Sz/WgWuvHeor2SIhhE7QeyTr/z4QjiyxjnCza3JVyDGZ4v0VKP1N8Qe7
         HYlg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790602757; x=1791207557; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kkoVXtyBSbX/hlAjoM5EXYeotLKKyXHsImySYu3kOBI=;
        b=b4a7I3NwDQFNBCVAgiuFBdB8iqEB/ceqqZU7HZgl4Ui9HCN7vyf464/O2tDbS1tM+V
         wYTPLVfmT69ave9jcWzKXMqpJCcXiClzHvs2WHwDLkpBdu0xR6MqqHKARH9tVhZfZREK
         XwpzfqVX/CWpe3ukPYxpJtin15QCDBenvUcLtCiN//iWL5uea4Zh8FpA6czm8cRi8vDF
         LJSjlJYnjHxBDWz/FEW+qngUVNIifdervUPxzjb25wqwYyyOZVu0dghWXCFOKkjIS5BT
         5Q7ffuxv31zLnvI6ldNWcSBBEDCOEmlZpRvPrradtlBDsHtsrjyd+C3oc2K6S4/ZEqpc
         XabQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790602757; x=1791207557;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kkoVXtyBSbX/hlAjoM5EXYeotLKKyXHsImySYu3kOBI=;
        b=MnFeHY6oA7j7VistnZ0VPQN4aXClkSEGWgkVHoJDB8PlmLiPv52h+v+a/AsY8G9zWN
         VwzdZE574A34E/4dU9W7DtBQhMBKMDBdcDQR9mbttZgGC0Dgz/nkYOT0vI4dtPAVyrqD
         l2Hvw9f4Vh/Y3obO1EuE3O7m7A4fvYJ2o3vMajpe23dJ1M2/haM7tfHrz+qAzmL7uIwo
         bcqBxtmb2jq4CqFp0OZFnyQMNQ2E0TMhYuN12f8oA61YI9S0kpLz+G5FvYP33Dij/WER
         V90yPyw51NHu9z3WhkWNROhbrgaem69tON1DWxTySzkup/IsFOkqajOjxwThthUec5Hh
         HzxQ==
X-Forwarded-Encrypted: i=1; AKwUvByJvoNn9id5KUlxtbi6tAss0iXOuTmX72+cS+QyxMoOC5XpJLeL4uuTkI4wR1U3DLFFpOQKKDpytAMy30E=@vger.kernel.org
X-Gm-Message-State: AFuF++nl41XEqBtORqiSMbk7LM4hdOd+pZ+uZJyxYMtzdUgxegJpTDlx
	/C3I1qVBZ4f3P7U1QcUw2MVdwL7mKkQZF99U3eHeOK3gOIKIBD18Wrdq2aEvX1D2N49taiyEQ3O
	MzmypkQi9xBlAsa/d9AWuR0js7Gc6SWw=
X-Gm-Gg: AYBFou32LMpHwApRGPnQCvDWlSusAOgypLOgwbN33zik8ItmT7hSFxWr1sHaqt1q3Ii
	azeBYZOufqMRXtVkxS1NNa4pad9J67uVf9sUuCWqtOZ+6OFQHcu74gS9Yj5dMWFfiNA8J0pF+P3
	oXcxjKhyMqg/JQnF2rRiUKMUF+Y20leAZY8WREebdMvu6QJC/3yhUTosTVOBBQInglQlSe4d4Oj
	NVOYImIQsdbsJ6kSj9kAoj7X/jlTXtqxZ7m6AFnGpPdrEqlqrv5yY0rpmYY5m7xDTQ/KCyKr7hf
	bi0fvBeCBN65IE9meqQ9dfpdnz//zn9Z5gFzm3BI/utyj+g89rNM2RY3jkwj9kvOjzUtbmphB4S
	pOQMKm+6BeSGMCnQr4bT668ySfT8qfPhZZTtG6ZM54SqVgdDc/761jjl9bYLYG5zJ66B4Ghz+Hb
	RZwMfAHqtH4kq0MyTi6XZwSJ6KeWU2nPuRPTKgCBBR
X-Received: by 2002:a17:907:7b8d:b0:c2d:c800:d797 with SMTP id
 a640c23a62f3a-c2dc800ea64mr422085366b.6.1790602756657; Mon, 28 Sep 2026
 06:39:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926205708.384308-1-meatuni001@gmail.com> <CAHp75Vdj8qVY-hCoCxxd1Pg2JaaDjc+QgAK-G=w+Cb=FTYYJEQ@mail.gmail.com>
 <a2687bd9-8cf7-1d08-41fc-9d6e69b5ca17@linux.intel.com>
In-Reply-To: <a2687bd9-8cf7-1d08-41fc-9d6e69b5ca17@linux.intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 28 Sep 2026 16:38:40 +0300
X-Gm-Features: AclHuK_yar-ZYML8PKehmtqFyK3Su6decS3wuti4NDLvEmj_PsHR7tuGCThvPLs
Message-ID: <CAHp75VffMOx6q1JKHFz6-_rByiC=1xTqn8Aw47i1KvWPBLCPkw@mail.gmail.com>
Subject: Re: [PATCH 1/2] lib/string_helpers: add ESCAPE_BACKSLASH flag to string_escape_mem()
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Muhammad Bilal <meatuni001@gmail.com>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, linux-hardening@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 3:59=E2=80=AFPM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
> On Mon, 28 Sep 2026, Andy Shevchenko wrote:
> > On Sat, Sep 26, 2026 at 11:57=E2=80=AFPM Muhammad Bilal <meatuni001@gma=
il.com> wrote:

...

> > > Add ESCAPE_BACKSLASH, which escapes only '\\'. It can be combined wit=
h
> > > ESCAPE_SPACE, or used on its own, without pulling in ESCAPE_SPECIAL's
> > > quote and control-character handling.
> >
> > But why? I believe it can be done in the current implementation using
> > the last argument @only (id est use the list of the characters you
> > want to escape).
>
> Ah, that's my fault for suggesting this and not noticing there was way to
> negatively filter them.

No problem, not a big issue :-)

I think here is the list of those 4 characters that we want to escape
should be passed along with ESCAPE_SPACE | ESCAPE_SPECIAL. This will
get exact code behaviour as of today. In current patch 2/2 AFAICS the
additional SPACE-class characters might have also been escaped which
was not in the original implementation (not sure if it's desired
change or not).

--=20
With Best Regards,
Andy Shevchenko

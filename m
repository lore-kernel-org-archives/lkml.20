Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A786F551995
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791924564; cv=pass; b=q9u9mhQQqlrXCFqNa8xK5rqs6+QpCt4qqKvXPfHyUhf5QiY7PtMHKzU9+6VHAttpGiydz6pLfWF/h+lrVa2yMEHbHZ4WtFEy+sXjMs2L8CY5eJJEq961ix1SSfC7biz/tIfLT4KnWzRerQ+IoD4l7ZgG7G85vAP+3CPgOjphiJk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791924564; c=relaxed/simple;
	bh=VCb03VA6LjpMHOfUp8pvf/EGXGe3r0X2vnJKPUWICB0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eVOPgPlKofGes9MCFnfsAl9PcfLRZ1M9BVocBcZkY5B5iCukkCVh3dFmRZIojEgFFZnVCKzsHuIRMemq9TvkjFSJwDOk7lJf2hALuofxQo2pAeYIbNklFKIhGnYLmilPNi9d+33E5MZXDCRWoY/r1/Qq5AeuMfPFSKWzoY9BLgI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hq0WLQJE; arc=pass smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hq0WLQJE"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-6774639a8a4so2636420d50.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:49:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791924562; cv=none;
        d=google.com; s=arc-20260327;
        b=UI/ANn18APGTlI8Gdf1J37k4XWE19Xr8iIgC85EFCQYHvKoivMVIbpkOJE66qlokrh
         RtNxwIfJRbp4aHT00jhX5wJAWOEEyFwdqnrv6UeztIoPxVBvoIy5hBp0temIyjjU3uDh
         944jaxxhw1/zj+jdW3vcLQArTufIr0KSbtY8M2fDYm8BQiIrkW81fTZ5qUA+BSxiP8Sk
         mn7FtNCDyIuoEvMB56HVHr/usEe2Xm/fzOAKeJBHSyKrktkHowiO5f5p3frVgIxUd9j2
         el2cWw5iaA7wLVr++jSy8/5JvOBZ8cApB2cit84bVG4aTXlqExR/T+9U8P7y3d179dp9
         pyVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VCb03VA6LjpMHOfUp8pvf/EGXGe3r0X2vnJKPUWICB0=;
        fh=dgAqIfdHK3vvO3NC6PCe88k3ay0rgvz/xMrm676msLE=;
        b=mLBmAC2EQzuDLUcPQ5/+u3M2377FHJ6MzXtOzh4ffDKO1oQ/MDlTcaaD9LxvkJU0hp
         ZaUO+LIeFwXwWZ3PxwJNKA+/qary10bxLzFb1EhBG40ZJWhx3Y8Q3xeVUZ7NrOP0vmqc
         Y+MPraa4DMIADbGKOcZDpeHDxNTQHAzdNsOPA4y8acSVnzZQFFnOfUq1XN/MF/dIej/4
         zrGbo9L76eB/0+UyEsU1e5tdQRqpDSbs5aS3Y16kaYs+sCaRVwvBd/wk8wqFrxiVvspt
         YnORzi4osSRKb73/Ubv9xegIj+kmlBfsGggDcgxGz2XEdAoq7ySvpLjJAvul9AwAL/Lw
         h5aQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791924562; x=1792529362; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VCb03VA6LjpMHOfUp8pvf/EGXGe3r0X2vnJKPUWICB0=;
        b=hq0WLQJEF6QP73pmJ6c8FJeMVwrlj6kQptWIXaj1nw7k4uKBOCtdqhFa4ZEx1U9iI5
         2noQBoKQenrv5zmZJK06HyjM7oJBoTx6T6GOFZDkIBKYzCTH4eq2ThweRjcfkv9OdK9g
         gmGNRBbxuOwIzL99EqhlmFKi50HlDL2A7kFw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791924562; x=1792529362;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VCb03VA6LjpMHOfUp8pvf/EGXGe3r0X2vnJKPUWICB0=;
        b=iTJEIpXVaNJPHahOPTNoF2K9JUKBdqPySO/nmwBT4FSAstsWA/u+AQpq944PiXpM9H
         xD6v3dUALYKMEq24p7QGOKVvyDjEJqjiOfFSaNGJGE5YtlcZooqy76GbWCVCvxj0yCke
         BbaAT3fAtxkS7q30h1KoCQjLSeLUt66O1pqFyFeYkW84KrenfqwJuX/KOPAthtq57H2r
         Da2imeGkP+OMt2UhWw7a/kfvgMLeHZIqAj9DFhfu2OaJQ6jp2PacBM7zpg0yQtVj278J
         FedPoGeB4OuZ14MCNirp1/aNFYCZjpz/oIx6SxMT9d3vZqTjwCLRxDUs8Pbxipu8vVY2
         nmiQ==
X-Forwarded-Encrypted: i=1; AKwUvBxG81Hk3cYN/gK42GxaAAdg5BSPk/wN7IOkMXwyEBMOr1mFctkRZ8tzaFH1wgCqnXKz9F2La/Y6PnGzJU4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKX+sdQXJVQfqKU4f2ktYrKbCF9l3AS3ma/glIipPLn1gXjnkVD
	CSLYTCArNlDOvTq5ilbFdNuE0UuGZYla/kFr5YPWikvDMlJV1rZxFp5BLNcSYP3aGIuvg7nliws
	t4nVDlG2li0C8bKtYHuo8PWwC30EUX1o0Si7aYzRc
X-Gm-Gg: AYBFou3GD0TpnKE5D18QtLfC18Onzgbh1A6ReCJyGkElPh1EDrd4NQBSasl8avvWzPY
	dReB0klYBhebsu7HLJofXY/U7NvkINrDtC0eTKG5ULtSxNlEBKq9bUGRL4Wyz9vnliBGoYHISwq
	RWQMRKsNy5UTLD28YeGtNUEF1EUUwXY58HOaQYb5LNXaaNW/KpDEiqnhgNot6tmfqTDCpQTBHgT
	XAxeCDMfv1szSAmukc9enbXbZDCM6R02lR0bnGvnRXwFmF8U+lojrOCiDLIU7WK9O6kNRMGtkwe
	PMhTm9A8z7XhhCps3VXV88rANIomiAEw4l0Vv2sWp4wSDlJBvwWS86aAtjjvGzdudjCTPyLQ/eB
	PJuK5z4G68g==
X-Received: by 2002:a05:690c:3346:b0:89a:63da:fab2 with SMTP id
 00721157ae682-8b07ee2c80emr43041947b3.109.1791924561531; Tue, 13 Oct 2026
 13:49:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009-send-upstream-v5-0-384af01da3ee@chromium.org>
 <20261009-send-upstream-v5-1-384af01da3ee@chromium.org> <be3f853e-8b37-4b41-a998-94de1cb552f3@kernel.org>
In-Reply-To: <be3f853e-8b37-4b41-a998-94de1cb552f3@kernel.org>
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Tue, 13 Oct 2026 13:49:10 -0700
X-Gm-Features: AclHuK9ox7K2COGXrl-FRR9cM2pKj2PME_s-ad7oALLfV1KkNB6t3-cZk6Vgeos
Message-ID: <CAEe3GZE-3rCTw-2L-dzXqim5qHxLs1BKjpbmo9aT85ZBLWm5_A@mail.gmail.com>
Subject: Re: [PATCH v5 01/11] Documentation: Correction in HID output_report
 callback description.
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Mark Brown <broonie@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, hbarnor@chromium.org, tfiga@chromium.org, 
	fqwqf@fqwqf.xyz, daleyo@gmail.com, Jarrett Schultz <jaschultz@microsoft.com>, 
	Dmitry Antipov <dmanti@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 11:04=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 10/10/2026 00:25, Jingyuan Liang wrote:
> > From: Jarrett Schultz <jaschultz@microsoft.com>
> >
> > Originally output_report callback was described as must-be asynchronous=
,
> > but that is not the case in some implementations, namely i2c-hid.
> > Correct the documentation to say that it may be asynchronous.
> >
> > Signed-off-by: Dmitry Antipov <dmanti@microsoft.com>
> > Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > Tested-by: Dale Whinham <daleyo@gmail.com>
>
> No, you cannot test documentation. Do not add fake tags when they simply
> do not apply.
>
>
>
> Best regards,
> Krzysztof

Thank you. I will drop the tested-by tag in v6.

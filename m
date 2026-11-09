Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794192871;
	b=WPhLsdywYypuyttk29u6+G0kfubS+E5bhYg5EU3t8vMxfg6ReVyeodbzgo5QLpde0v91
	 SxAB3AMrhCRdBQkbSI1ka1+PsQx+8X8OlQRYfUikXu9TKXYAlY/AIl7ikWDR7MHl2Aoog
	 3LwwRYCcK/nzI4E48HxmQqTKA2SlhVa0hfsbthNO5dol/2b8AbRIlZWZM6z7KYm3bNdMn
	 +guEgomETR9HJPhAxtwIkDM5aZ24G2BSWgXYMO5gdxZCJ7xyTvjfo2MZgHwDEdnCrOER5
	 b84OgaagrYQnHSEFwA9jUBsTId7s+8Z1b2cGkgrhqnnCqMqWGuRPKU3EuAmrjEEzfvw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794192871;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Qz3NR7MGSXJNdrY+IV5qaIakyyfe+n06O6AowRbO9CQ=;
	b=C3u83SA0nlhc2uqly8hJk+/RUlhVXsVI8GYHyFEd4ayRgJlLEDXCIRMa9OLo4Ny3+hJt
	 W2C/EzxXQ1mCMfyX5eyyoD73nnLoPaoYx7N/vx0U6x4VKNC3N0JRXP8EvnvitrSk3kEZs
	 h5wL9N8+gVWdrzlBZPKfkOUy15x0wLL/dEEAE6sHc2Q6vlO7FK+Hpfm79GKTCMYsgK9+a
	 54UUXheudAbOFxNZK/dhtAiGjuPgTyTkqW+zLx6n8FVawqiKkTL/0ruNBxEdgFPzCr8px
	 K06bDFmXTbw4tURgxWk5lHm7CEg/FtkPt1Wo5QRx/bCDQYni0pHKXzwxeuKUQptPGmw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=spacemachines.com;
	spf=pass smtp.mailfrom=spacemachines.com;
	dkim=pass header.d=spacemachines-com.20260707.gappssmtp.com header.i=@spacemachines-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=A+XTWgLg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFAD606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 02:54:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAFAD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=spacemachines.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=spacemachines.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=spacemachines-com.20260707.gappssmtp.com header.i=@spacemachines-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=A+XTWgLg
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3720addb068so607476eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 18:54:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794192869; cv=none;
        d=google.com; s=arc-20260327;
        b=T+L/bxDbWjXymyxIRR7pYUNfj6hzhVHbpEB9hvEd8H4w8IWECGhgGPiDiplk2+49Zu
         /pqlL2WNdHqlpR9mRxcFMUTiEgKWEh+CFC32HwltBiWuhN+xMooLPc9UUdgXs/lfnvOX
         FjjHOdqd08aKLGfjvFmZ2KUadblhsLqgD/qGtMvAOG6R5hjL4KYMN0c13fJRw+5gXmOH
         0oA8Lv0r5tSE0jw91PTtipJ540U+5PsC4USpe8wt63ouIbWgbSUnIT2ETGlERCjBYOlI
         FaiiMJ3El2Zne8I4uPjfiUNhSABsBsN35OidqrcMbxv6Bf9u9WCZd/Cws1OhAreccg9T
         re4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qz3NR7MGSXJNdrY+IV5qaIakyyfe+n06O6AowRbO9CQ=;
        fh=SxDlQdQjsKCtyvE3L5dRLjNNcv1TxJyCzQ7PA0Gmds4=;
        b=skWfYRhJNXOG1HQYqMX7msbdPGskezZpTk9oTgmMYNaJT2iosCq2yc+Bby9/LkqYs7
         K6jH9bF4pfHTjIBVqqBrjRDL84YzaUttQRMvg75slkg/PsxqU0caLpdCbvUgxBwDM8VO
         Uh3Xdv1CMRKupWpwVjek5qeFPcBVuVyPnedEyxkS+RUBUymEJ6sBrb417tlpjWJDha34
         OqUECReymmCaMKgNrpZfZYQ/QIR/h8HKz63aBjCZv67SERQGNN+SL6U/EMSlhz7e/FEw
         lGrpjuMWojlsFa6LMUbk8hRODMtM+GvmEZ61Q85SrYBTpXGhQVNj3py7L6+pFv8cenzA
         jyQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=spacemachines-com.20260707.gappssmtp.com; s=20260707; t=1794192869; x=1794797669; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qz3NR7MGSXJNdrY+IV5qaIakyyfe+n06O6AowRbO9CQ=;
        b=A+XTWgLgnrqW+PCT7TIAIIkFzWhX5Buzzt2ApyCVF0MOnlG8Gi+M4EE5q0NaLoq1Ev
         xPip4ML5lUHUiyZ5x2ApGnQrswnqqbtWfN2F+BglB0yjDc9W9JAFdOKJ/zYrzqQ6ttTg
         X8qJUTdRDoFWV/PWbsOfYGw5P8h78PMyfkEHIr9suaJUzbKVw6eNzHnjgP3qtWwAxR2w
         45q+B2oG8EoKqIsvtsVYgUDP1lNJve7W4l4p+hUagMNxjJbaE6XNu6ujr1KEzzK/fyr5
         UG2R31p4ny/82LbEIp9YTBUJgH/cqrS5+HMPMK8IEhvuspgz01J7cId5LwMTWfx3w+1Z
         OHqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794192869; x=1794797669;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qz3NR7MGSXJNdrY+IV5qaIakyyfe+n06O6AowRbO9CQ=;
        b=dZhX3g7awpC9MW12VXygBlQW2OlkPiWIbT6AX7o5o/fzMTzBTC5s3SE5wguKoRsrfF
         ApREATYhD+H7CLDa6iffelTExiDzD21kHMVs8DoFjG4myYZAutQbUsNjD22kmNHwatje
         rgwr5fmuWILXMT8VrVKq96AtUar2hwd/w6YHSkI/xpH5iSljWzx3lvNDTRSm7AQUo/pQ
         ArEU5yJjG4VGmkLTzn3kS4mICtL6TqxJhsJkAQ0Gnm1AjeVd59upxdFtzu4uGuG2e8SO
         9oLr/lmvNg52VtjPFB2UFds1Ni+D9Dt7dX/AYbeBZNuRDmEJpE6mFqg7ZkphFGE3K1p2
         tIlg==
X-Forwarded-Encrypted: i=1; AL+hErE15qYn2UQDZAE0LV5E0MfCONGzxzcoKc2ypyF825yeFO2wy7kztQxuVX6oIChswaVQgmDMpdWQUGRfcao=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Do2gtk3dxXl+90O7Sfn3WG5nGF4RCfB53Jdhl4HZPn7fVPoEC
	/8t4Jzs47yK7XHYF3io6ILDVkZRR9N403YNK5lH28bCJF+ll7yX0jvDohpRTpDSGb2tlHN8TuTB
	g04tBtxjzDba4rP8A/8bAzJm7gg83KSfWfligWpCveg==
X-Gm-Gg: AYBFou3wTL+33WucbJvxtFZCfHNezmWXwAvBNiYLMytqRaTZzZSXoCvr/uds4L7rLb8
	ZKWjs8EIrkBhkKvY5mpW2R8LUThuQ0qd1nKMmDGfLetqCBjKLlZYYwcBQdeRo/1mkTjPg+h6kXY
	27naCwBb/coVrA8To0vLMRWN6ZqkOutBgXrFQl6ql1DSqvuQ7bg/JuGPB3Ff+u99EH0yTa3ZsIp
	LwzLovmZUEutmRbgyx5KuVG6zT9QnTOFsdQ/I7SmseGYfYop4c4ImDnhSxgiNYGhK5IUd3cpAff
	oAMNuo4+Oc2JsVnrKkeOv1hTlUqUrU4vElVjSqSm+6/uWksHWNdj48AnK9iAVywy1hxUAkbb5M4
	W6ndldNwVA+3+7geYgiAC0+hnSYBtKfK08GB4XA==
X-Received: by 2002:a05:7301:4601:b0:369:f9da:a70f with SMTP id
 5a478bee46e88-372579ada0cmr5004293eec.17.1794192868908; Sun, 08 Nov 2026
 18:54:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-core16550-rs485-v1-0-6d15ebe1e5b9@spacemachines.com>
 <20261103-core16550-rs485-v1-1-6d15ebe1e5b9@spacemachines.com> <20261104-zen-aloha-35da49a7e72c@spud>
In-Reply-To: <20261104-zen-aloha-35da49a7e72c@spud>
From: Kohei Otsuka <kohei@spacemachines.com>
Date: Mon, 9 Nov 2026 13:54:17 +1100
X-Gm-Features: AclHuK-Q4F2OkjltIrYE04Gknko9UUPJ0_lJdkzGPXUFMua3_w-rpVx6FPuUaIQ
Message-ID: <CADMKYUAc3QPCdpH8JL9VHk4d0iETsUL2ao2i4OhoHYoZGoAnnQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: serial: 8250: add Microchip Core16550
To: Conor Dooley <conor@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, conor.dooley@microchip.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 3:20=E2=80=AFAM Conor Dooley <conor@kernel.org> wrot=
e:
>
> On Tue, Nov 03, 2026 at 11:11:31AM +1100, Kohei Otsuka wrote:
> > Core16550 is a 16550-compatible UART soft IP core for Microchip FPGAs,
> > including the fabric of PolarFire SoC. Its registers follow the 16550A,
> > so ns16550a stays the fallback, but
>
> > it raises no interrupt on TEMT,
> > which the driver has to know about to support RS-485 on it.
>
> Doesn't this exclude using the fallback to ns16550a, since it requires
> specific interrupt handling?
>
Everything a plain ns16550a driver does works on
Core16550 including transmit, receive, FIFOs, modem control and the baud ra=
te
divisor. The only thing that needs the specific compatible string is
software RS-485
(em485), which waits for a TEMT interrupt the core doesn=E2=80=99t raise.
Without the patch, RS-485 direction control is missing, but the UART
otherwise works. If you=E2=80=99d rather
not have the fallback, I can match the compatible in 8250_of directly.


> >
> > Add microchip,core16550 with ns16550a as the fallback.
> >
> > Link: https://github.com/linux4microchip/meta-mchp/issues/5
> > Signed-off-by: Kohei Otsuka <kohei@spacemachines.com>
> > ---
> >  Documentation/devicetree/bindings/serial/8250.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Docum=
entation/devicetree/bindings/serial/8250.yaml
> > index 50d5c977afa3..33a5929bdaa6 100644
> > --- a/Documentation/devicetree/bindings/serial/8250.yaml
> > +++ b/Documentation/devicetree/bindings/serial/8250.yaml
> > @@ -137,6 +137,7 @@ properties:
> >                - ti,da830-uart
> >                - loongson,ls2k0500-uart
> >                - loongson,ls2k1500-uart
> > +              - microchip,core16550
>
> This needs a -rtl-vX suffix on the end, as is used for other fabric
> cores - see microchip,corei2c.yaml for an example.
>

v2 will use microchip,core16550-rtl-v3, thanks.

> pw-bot: changes-requested
>
> Thanks,
> Conor.
>
> >            - const: ns16550a
> >        - items:
> >            - enum:
> >
> > --
> > 2.53.0
> >



--=20


Kohei Otsuka
Satellite Flight Software Team Lead

  koheio@spacemachines.com   spacemachines.com

 UTS Tech Lab, 36-38 Lord Street, Botany NSW 2019

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794210055;
	b=JclsdFdr8Znd+RuNN1WSH/UVRvA8bx+jXU9odhdbRyBLoUTiBhGq+kBc9+ne/4fAhMJ3
	 orlJ4PThhXDxFEV++EoeiLi8NttqFMQsZ60qrNji3lTD81POlI+lqsH2kPIpNLfBFZyMP
	 ttR1hf+mHMvQgkIKdgKLuI8hXKqATBh7TOuxWpXPdOI3+5bfydXd6WN1Hv9Yfrsz4cZnU
	 Ng211N7FTTMP5PrQVNuTlim5+5tK+/jwhnzN9TBV8ofKTezifhfFsQ++7ozfh8TWHCQ48
	 q4ToZXgjl7G4gRkZINNIt4d7RgfiZ4VYeulUR8UsW6LmDTw42j9LeO2n7IQNwy50ECQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794210055;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/QLOpX391Fwz82NJDNrzMApohUKRN/kTwsnVQ3ukXWY=;
	b=Ea2d/5NADykCgaG/LJ5qBQiFqF/o+3rCYAgwpvN/qRu8fAxR6LG9HR7/RDn1vrTUD3gf
	 tSQDO5UB5n78pHF0qKrmW7wxgcOqwqxkAdrqMB67t/Da4A40OaXO2qNFwUkSOp3o42HW9
	 uvafv7du0y32ySa/OkNtqEuzw3Mhi8rgDO0hMu8n82TDdwC38nrL1IPXSDQJ6XuLmjbEy
	 CS7VzgpNT0CLU6cRJucV2jivk3y8IaBX1bEQaKDz9i48L2Xyq+FDfgpE/jsepTO4Z8zae
	 ucSZSvR/8AcjRkp55fszquoluBAZUtAZQ2bw+hPuSBq7K21KlgYaTBrNOB43WegRdkg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kuqXFq0t;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6B2606A323
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 07:40:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E6B2606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kuqXFq0t
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cdab9e9761cso246767a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 23:40:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794210054; cv=none;
        d=google.com; s=arc-20260327;
        b=UNe+8wfHZci/NLEcND0whvG72eV/m405SFGrxaK/i/W4zjbtmjYgUfx9iuLdnEuE2T
         onGEfpoPhwLX/VNT54xpEQNIQuQRVpgti8OExYOQEpzng7KxpVDiDAkpk8G7OA7r1m6G
         2kQCmkXEOrzBRQEAz8liERxNxh/NbnHwNN2YeHpN8f2aVR8sYxtyAdaSf2vLWsbnn77n
         A+iUZA+d7bQSGVjBJVKX66nJgEXBxUbVMVTrS1N9nRXMJOWrnHrhll2pDkTA85PF+o3+
         V+zUX58iTVUkM8Zm5FnbaFwDbHNmdLiH1yRKaR2hpmr5XfmknsqagDIfLhzcroav2K52
         mVsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/QLOpX391Fwz82NJDNrzMApohUKRN/kTwsnVQ3ukXWY=;
        fh=HtThNSbMy+oTKsKEdmcl5nGH4rgOcavWUbHy3LxAqSE=;
        b=B31tF3u/V0qD+yoqXnR7RutfI0xhVp8C929j5dnUA5EDcWRSt8PNHiByPuhDt3wEcD
         8cVJ4pcHSqT1UFiT3o8ltOLhSjHDarAEd4wvBlwpBeHdl/Wjq/gV3SnbbNhJBFlaJwTF
         zoL4aWgSLBoSfm3YlHmgkyp+X2cqf+XZBtxIf6lNyBNyWLjmkUP7Qw6eFAc4KfIYC672
         shbcLjvbk9Ada7DfBR+fztI/Vi8vVrskxdZmFl9QT/Pc0heaAHcrgnpWrlJtLYon5WVf
         +Y6NEfdrDdVmgMFLJRIl1oc4JSjKb9giTJ294YrLBRfb+7OG9APbqlu4uk+95ux1/Ird
         l5tg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794210054; x=1794814854; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/QLOpX391Fwz82NJDNrzMApohUKRN/kTwsnVQ3ukXWY=;
        b=kuqXFq0tTl5JQVuMi2oPKq/Rlo+gmj7lWPiwPYQ7RU+83hnncGZImbuWX+2j1noK1S
         YO7mm7+mxOQaPTMSvTaoDByvjD9/o4rBarbJnMoN3TAOC7z1J1aaVRPCEOZmbwO+PBN5
         yjQeWe7Qit4Umtbzq26wiM+XyaFrFUTNmZmai6VRQcgpKZ7tIoFJnyRAocmjeQCpeZS4
         icS5bPqGV0YNeT6sum++goPqNsDKZjjrWXF9cpnwp2bEMMVcQYdihaPW1mytY+ZdVpCh
         iTJIEgGClbzYZ+uhpfOz4rFLETxumDOZh5oeBDUFCSDEHcA5NQMYV1Idy/F4iYX/fLY6
         KtWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794210054; x=1794814854;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/QLOpX391Fwz82NJDNrzMApohUKRN/kTwsnVQ3ukXWY=;
        b=lNQ+UcvxrIHxVY4QX1R1UvN12+4puiA8+WjzPo+McOfZxxhPS81uVwdelEeLGIUNSe
         Y07xBl838AX2gDjj+pWR9FVEtckAV3O7DfGBlWRlVSVTk6tsLV2qX3sKjH0uV6QQEoGL
         DlIq8ANkdf10yPAWawjlyz6EVLZvFYMR6N2TS4G6PaizIT/+77O4L7dHdiKPP/9vBnOg
         0HXpXp2NZ3aADySuDfK8Eb2QzaXuug2kSiQXZ1mTiJdwbUzUzl8fkdLnj+4usG5bO0mw
         E63gUxndsrIX7pskcavWlM3dqAlcU89tF44kXRkydx+W1tBQQRIS9UAOyM0LNaTnLgMr
         B2xA==
X-Forwarded-Encrypted: i=1; AL+hErFk207MxEWaRmZrlSW+KOWWp//RPJJl9duoZXMYF/fKskrE2wsnMcK1CE8MrKrv8sSXMInDHrJle0r5LdE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/CWap7DnWLXcJR3ihI6QW/6Jt32Gjgn0I9Ylsy3jyT2LBbmCA0
	zwIS0AUwh6v4QlmVAXSmIKHmY2G6VNtxxt0VCVJDQZSXDrx/0fSVk1ky3UUzCQEEUTZvJjmiztx
	tPc+vGwZFqM+HjvVUHmVLzjAWCWb1bzI=
X-Gm-Gg: AYBFou0M356krY+ooG/6ZtjrmUej/klHIpEgz2AVBg3cF7ClgslwadRpguypzJao0YX
	6wtgebEd2033gXXJw2WMm2hABDWXstFvGB0hiCgYG9u3jIQowc9vennhJgz9kNGWLlvtT24Kii3
	g8uETvl9jfz9Nfn9j7RfBvy3KVwcIYobQ02Lw65gpNJxBn0NBzVxNX4GllXtwopQKta391gvS6r
	Tg201JCg3lwDka2lRoGST+SqAdENI2duAzo9djGYjfNN+wuGTVmut12qOBIeMdQcbfDRBgPdYP2
	LdZUgLF+6BtSNP+hPz8VyMnvQu5L+y/Ezhz7bYnuGi3f5thvtkb+G7qmhRF1PWN3pDH39lq0YQ0
	I8clsOszbcuW4O7yaMFyj1FgOk6wsqODo+U0I
X-Received: by 2002:a17:90b:2692:b0:3ab:2737:3393 with SMTP id
 98e67ed59e1d1-3b12d4e59famr3159700a91.40.1794210054212; Sun, 08 Nov 2026
 23:40:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105024106.338791-1-shengjiu.wang@oss.nxp.com>
 <20261105024106.338791-2-shengjiu.wang@oss.nxp.com> <20261106-savvy-invaluable-gaur-7af1b6@quoll>
 <CAA+D8AMxrUb-Pj74wrRn=vEyRUFKWWsR4Eq1LZ2ErsX=rRq=rA@mail.gmail.com> <80990ab6-5072-43a2-b829-177c956080c6@kernel.org>
In-Reply-To: <80990ab6-5072-43a2-b829-177c956080c6@kernel.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 9 Nov 2026 15:40:22 +0800
X-Gm-Features: AclHuK_S-BK2XU0WY_pNWrUm4vSuurn5YOkC4y9TAw4Ztjpw5amiTRF4mk36wDg
Message-ID: <CAA+D8AMt-_=XqABMoeUssasrmChJem7m=Oj+sLA6qnNORTZ+dA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: dsp: fsl,dsp: document debug reset control
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: shengjiu.wang@oss.nxp.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shengjiu.wang@nxp.com, daniel.baluta@nxp.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	andersson@kernel.org, mathieu.poirier@linaro.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	p.zabel@pengutronix.de, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 3:29=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 09/11/2026 03:22, Shengjiu Wang wrote:
> > On Fri, Nov 6, 2026 at 8:57=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel=
.org> wrote:
> >>
> >> On Thu, Nov 05, 2026 at 10:41:03AM +0800, shengjiu.wang@oss.nxp.com wr=
ote:
> >>> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> >>>
> >>> The HiFi4 DSP provides a separate reset control for its debug logic.
> >>> Keep this reset deasserted so that an external debug agent can access
> >>> the DSP and perform debug operations.
> >>>
> >>> Also require the reset properties for the i.MX8ULP HiFi4 DSP.
> >>
> >> That's ABI break without explanation.
> >>
> >
> > The i.MX8ULP HiFi4 DSP has not been enabled upstream before. This serie=
s
> > adds the DSP node for the first time, so there should be no existing up=
stream
> > DT relying on this compatible without the reset properties.
>
> That does not change the fact that you break ABI, does it?
>

Yes, it changes the binding ABI. However, these reset controls are
required for the
 i.MX8ULP HiFi4 DSP to work correctly, so the existing binding is
incomplete without
 them. I will add this explanation to the commit message.

Best regards
Shengjiu Wang

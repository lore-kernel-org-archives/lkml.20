Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22066391E76
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 07:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789889030; cv=none; b=SxssV+9AnJu9zNqIxNUigtHxMGooXkp8qGXnlVaTskYNqI2lSlA/XZPp87PlqTSyyos82WAhcOYuKKAMbmUAxWsUwpv8QKLRlvMMHkMyLwcKVQR7ugdgybaT8kqlhHUrQ7nbov2UdoxAl7fH9Uyivxa+ggiP/1FXvIovCQ8QUbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789889030; c=relaxed/simple;
	bh=AeWelz4k6J1dGXylFFs/k7Dk9LRIhfrxmpYuVJoufpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ycbl8Jp09zifOuuIo9ds/yZML9VTIMS6w321oo3je9jkDpU+5KJARdnsGIIIUOxxbITKKE+Ao06w1c2SCtkgdaPOSWUX+5sAIK+TiVcUX/3Mm0BaYgWRiGknSD0oiVnITghP8XIUZOOLu96jIT6S2pMNdCEe6M4fZqPgZN05Hio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=XIMEAXaX; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="XIMEAXaX"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a985fba28bso2337580a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 00:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789889027; x=1790493827; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vdzTW+oAwMVEMniCDRRZb+1jeXG9GB5BYAHNipWBAgo=;
        b=XIMEAXaX6LGPDLGp/+ydMMOD1DSOvs8MZbkwJfzdcDXNhdUhJ8j9zUht0RqF9Ohd9q
         Zei/riCWNqepIeo/UgGPBRELiy4AxizPcsybjDyjXjTbV23uSAg/rxQB/JNA98cXUB2P
         N6ymT+y7xEVZzhNzfr5IzUj1p67O3W1fh0n1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789889027; x=1790493827;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vdzTW+oAwMVEMniCDRRZb+1jeXG9GB5BYAHNipWBAgo=;
        b=dSUqVs+kNKsevzM4r/r0ryVfueWLGXW6/R1pg8hgPn8okrpDDX/WRA+GKs10cjWUkb
         HGdWfInrhV8W2QI+jz82gWg32LDQuENwiX5zhXK1xbnf50/WN0LmIX3wVCJMdKkD3JQz
         Jyk63EmA5VK6z1OfOvvPjqKEfL16DLrECVeLp2t05AXD5Qs1HuQR1FyN5QW1e9lzUsmg
         96X/XgwrAyChlzsty03JoNqrjRf4qhOnD3h+dyBg/gSv+QMQsuZmT+bAWxQ/TpLc0K6m
         ybSo+pwnhrsgiD8PEbVkWSwjym+emku8pECM8gD3ZlMpsCdP/RVs3srn0ZXpirBC9v8C
         Gnsg==
X-Gm-Message-State: AFuF++mg6M//YjSd/wsG9l6/6sJQvruuGP2XScLzXTlxPvTADeqT1+pb
	0g5J/zWrhuaWsguLTr/PnfCQycrjrcwgHtCupWlirx2Cl5XzHvWuC16Cfh6KrW67f1OV//IFNpp
	mst63ZLk=
X-Gm-Gg: AYBFou033IZyX5zynz4EballHBDMQPaEQfcy2/9wyz0E7V/yP09srEnqpexXQcSCNIE
	C9QAhQ3cnhhzQgYP5BRnyXNiE6crSC0O8pgVe/6nLavCEiCwOiW/h5rZSCry1vCLj2O86wAvUBE
	cprbVDLe914sE1Wa6QBal3m1SeiiitpyhL640rg8/YLyHVeo2Wz39bz//d8Yvyij2rUYSBrRqVD
	W1HS2L1VShcHxo0IlTnGDWIqbr82y0xWVjcjCcvczR/ZVk4SWkWIM3akqhrAux152fy7kp3ZgIC
	Geciec2Hw8/vphB4INsPj52a/lOkHP80X19Mb3dyVE0hS7GGrrjEzyT9GgjoTbrEJ+PHCvFBQvc
	1nNzdjPr50zgHkgfjtndqQl+g60SEfp1cAi1aQ1bFVA1vTsdPQXRpP4p+uDkpa+vDHpkD9/kAve
	Ku+2qtr3vtTdPklhOPljbeoGPGikfoC75eWkIKtAnA+oynle4WlXNWfvcOA8Doa/U2X4MFXvS20
	V1UBL1bBaX7MQnE
X-Received: by 2002:a05:6402:a0d5:b0:6a7:ee54:f897 with SMTP id 4fb4d7f45d1cf-6aa5319e9a4mr5445508a12.27.1789889026803;
        Sun, 20 Sep 2026 00:23:46 -0700 (PDT)
Received: from cabron.k.g ([5.203.112.129])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa67e3051esm2287839a12.29.2026.09.20.00.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 00:23:45 -0700 (PDT)
Date: Sun, 20 Sep 2026 10:23:43 +0300
From: Petko Manolov <petko.manolov@konsulko.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	dinguyen@kernel.org, arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com
Subject: Re: [PATCH v6 2/3] dt-bindings: arm: altera: add Draeger M48 Module
Message-ID: <20260920072343.GB7878@cabron.k.g>
References: <20260917163157.1380860-1-petko.manolov@konsulko.com>
 <20260917163157.1380860-3-petko.manolov@konsulko.com>
 <20260918-robust-spotted-orangutan-4b669c@quoll>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918-robust-spotted-orangutan-4b669c@quoll>

On 26-09-18 13:55:58, Krzysztof Kozlowski wrote:
> On Thu, Sep 17, 2026 at 07:31:55PM +0300, Petko Manolov wrote:
> > Add DT compatible string for Draeger's M48 CPU Module that is also based on
> > Altera SoCFPGA.
> 
> CPU modules almost never can be alone, thus this is incomplete. You need the
> final board compatible. SoM could be a fallback. See NXP bindings how it is
> doing for example.

Module is perhaps not the best of choice for this board, but to avoid duplicity
please read my next reply.


		Petko

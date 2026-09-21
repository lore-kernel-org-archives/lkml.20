Received: from mail-ed2-f18.google.com (mail-ed2-f18.google.com [74.125.228.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A5D3101D8
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 03:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789961485; cv=pass; b=ML+L4x5jHnXuLzNeno7HB+fWPIA2BbHLEtChTj2cEcrmZCaBYTAXiP7xvoOY1C87D6zM0xnA3CWI66vhYAmm3pPDE9LHLX8naGyvg6/p+4nrvhqyhHvfKwwlHkLC8EWODfdSHHriTbEVL8s/M6qRCRbuGDoXLXhv9bt/RYbqgac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789961485; c=relaxed/simple;
	bh=1JgJndpiQjTJjF4DQFibfiYrBkEpUhcO1uo3E1MTk/w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bquGRLZNOUBLYcH3Sddk9O1yMcUo+q3tN56Hld4bFP+Bz6jxbyC65R61QF6/xxU3i56kzI56lxYilv/TTnwzr4avVRbzL4E2rDA8/1Fr/gf2rv6SN1yIUh5+ThKBTFshCNQcTzZBqBo0lRLd2I9GFUsaW3SYtiswjxlKUAGWziA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=liXP9qyf; arc=pass smtp.client-ip=74.125.228.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="liXP9qyf"
Received: by mail-ed2-f18.google.com with SMTP id 4fb4d7f45d1cf-6a9adea43b6so3166163a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 20:31:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789961482; cv=none;
        d=google.com; s=arc-20260327;
        b=FMCZS+EQ9ZFDZGqlTZRtIZN6DOJ7Aw2lo8KcUnnpP5yRrSbtU0RQAe1MqgLN1wW+ey
         wNproyTlrVYx0HAFSU5Zh1+ps62v0dXokHGvCiTeRvNvglwoIOMHzFvbwA+j1TErObDb
         pzNT98+m1a29WMn/xfxdQD7C7Ea7h6A6um+cRdEbsd8zF09OlQAurKuq/7l0lAxIXvyE
         DPCRafs0X8RPf4xzhG2IfOtk8Anr2vJzhTLOgM1vHHe/1HbolGZ+Ieh5J+YCRO15x0g4
         RGPrIP9o3zWmAZQS7a1tlcwJ0ofjGmc6oqC7Q7+76eXhbUa9aLmQjZy09qpbSHjbdnz7
         +9cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1JgJndpiQjTJjF4DQFibfiYrBkEpUhcO1uo3E1MTk/w=;
        fh=iqhkLmfpZF79Rixj5hoJekfm/L6LrluQjtHSZPx13vE=;
        b=N02MdLsxF5Z53Wa50gJCddG2OzISNOPbrF8KQKHZrnfLIFhJaLLb0jcuqK5A4OPmzF
         rcMGYe82E/0ua7+1MT0cw5WW7ZlXpfW8MYTFM7KbJcw9RDOWWo5G0uTdS6TGEgvjMuYT
         mnHJdIlBsdnHlGyhCWNRTaJjr3jBIk9qSBnlzb65/oFactpruRBDJW35YHGojrxw/a/h
         vdCsA3P+pqOOxn6IpgOEP8A04AmBI1AmFwwurrGrr6IC5PfH6+jkzic9rCqUoG5Eif0G
         alsBmqU/qegUXtr3n/HBj5GD16Y+JS1CuN2Xh73q2qydWvG7ja1IBG0vU9hICqh/uGFu
         cjwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789961482; x=1790566282; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1JgJndpiQjTJjF4DQFibfiYrBkEpUhcO1uo3E1MTk/w=;
        b=liXP9qyfSnnSa3IRVhVi7pFCMNtVFLBrgnKj6XVTbqcAlJihMkFxmbSrobSMQ1vDqf
         35b2ZzjbfGmdXyi3aulCp6ou7+lnG9JtQfGgNKn29Laj9U+kV+ghhyzM2Rad2+SsXGc2
         1gUmvPXb7Up5Mdo+lCNjdx5KuCEh4cYIPXlA9DSnzFO9LwbcJnR7ZWOCVnmoDxOKTxh9
         NyjVV0dHSMkZ0btnShfjyO7bDetBtLSp5vvYnJoU3VkBaacg7ecibNjpmqQJCcowb4f3
         Ibn/XFbWwr7u6w02ZKcHm603UWwbjCFwtrRpMvOZjNM3DAQ0viJQUrhr+esbh2B+QuwB
         w7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789961482; x=1790566282;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1JgJndpiQjTJjF4DQFibfiYrBkEpUhcO1uo3E1MTk/w=;
        b=ajZcdbHAe9Tq+qfxwVhGhUt8G7Niyu+xXDibAX0OIdsuqlYKyFXmaQ2kq9+WxPTRAs
         0YLkCp8j6L12hrerzvcgp4lOXWLVfXQ3PmEK7mE+DvYO9U1ih1ICnb0NNRXW0sAR3gDY
         V2P1HrkloTP9WxS0oDZ5XdHMSxdyXjYYJJ1kI+ocyxhPrH3BeHa8HkCpKaTaiaWRwkn3
         x5T/ke257ZHgPNnjSqXHm34bhw1XD4C5HJRf0tB/dsW5E/MCzGSg+24ZuRGaRWiT2gH/
         CJjFcNyQBfodhVLslE2pPK/eU95heYT6yyeBxnRIff8FkUvP+O6puZDcyiWO660DfjSU
         JD9A==
X-Forwarded-Encrypted: i=1; AKwUvBxlSDPMiNaHO8Ibjv48r2bbtHFxDT4I9mzVOoihnlQnx+Qk36yXkAryb05jEFnkd/Ql1oUaxCXHUrWJjYU=@vger.kernel.org
X-Gm-Message-State: AFuF++nzRGNvNPib3hfupHLKwOT/I48TnwOlifX8h8PHgxR0Y7mL4/hD
	IuZIXcRV0ht0+lC4WkP5InyPNSQPWHJacw8c7jHuRSRs7U+iXSTeJuE6G3Edz8C0ZUB7FzZZ8dF
	edWreT2gZEHsbfZYaQoqzXfGOCO9hqJK/5Si3xBDHgQ==
X-Gm-Gg: AYBFou2Q6lhxHudl2eUsE26dTqWLFTDgULUPrSVLU8/aGyHs7RifSYxhJCh9Hhhbe66
	jlp7UQQ/U7Tn/3snBxRBsvh8OIgdnY/2HNzsYr2OXf12hpUz4iQ7RQO6Ju/rFodAsO9h6Pkes4u
	DVH24lk1fq66OnzS3iYVJ87NXj0MmnbB1gDEMVAYaPirKd/R9FVYUflAgR3IYkJLeUOS904LCJ9
	EwX4xWStNoDweq/bfVGF0zZcSh0EZUuZqgoqHMAxvS3fTQlnUSS4978pSchUkCCZ+uDzZgEp/DO
	JCI+BSuFix0HyK0wAZ6KL1H2aOAx/R7udOYap6ATJy3Q0LbY52ptCIaaMc+SlQOoFCJVlVlg+q0
	kHKpYoWcW4fqfTQ==
X-Received: by 2002:a05:6402:4394:b0:6a9:ab7f:c8f with SMTP id
 4fb4d7f45d1cf-6aa54611e57mr5885453a12.17.1789961481999; Sun, 20 Sep 2026
 20:31:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
 <aq1sooGCYUiWbhMH@p14s> <aq453yukMHiNb1jp@bywater>
In-Reply-To: <aq453yukMHiNb1jp@bywater>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Sun, 20 Sep 2026 21:31:11 -0600
X-Gm-Features: AcwNN1W3qE53RFtHuPGOztjJSdwljZIvy9Wk3z8AN3NJ17iDKQARaTMy5b-3hH0
Message-ID: <CANLsYkySF+eF-FURnnT6UJv7P5Sg2HdfMSBZnZy_BLyCMvuofw@mail.gmail.com>
Subject: Re: [PATCH RFC 00/12] remoteproc: add support for any virtio device
To: Francesco Valla <francesco@valla.it>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, virtualization@lists.linux.dev, 
	imx@lists.linux.dev, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 19 Sept 2026 at 01:33, Francesco Valla <francesco@valla.it> wrote:
>
> Hi Mathieu,
>
> On Fri, Sep 18, 2026 at 10:53:54AM -0600, Mathieu Poirier wrote:
> > Hi Francesco,
> >
> > I have started reviewing this set but given the size and implications, it will
> > take me a few days to get through.
>
> I'm going through the review done by sashiko - would you prefer me
> sending a v2 with the trivial errors already ironed out before doing
> a complete review?
>

We can wait if the errors are trivial.

> >
> > Thanks,
> > Mathieu
> >
>
> Thank you!
>
> Regards,
> Francesco
>

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793957620;
	b=3Ed7OEiAEKjV3G8DepHSwwJw3V69UzyikF6AGMAOQe4RgubN9KwBhdjxdfL30zvxAhZ0
	 itqoE0qI+HBO/BUZfqe2i+XCRwU3O/Sciz8XjllLEU6BayQjAX2KO4oKbS5Zpj+hON+TN
	 +uO4N2VA3PYwhm8isuV7KDF67SowFust03TE4oPDtjWdXfp2e0R4vvFw94XkM9x21aRtu
	 4b5zJlOl8gHRPDw096mOPz4hfBW2/FP5SdUkkKWBmytR8X3QUDVOsj33dWxlaNgXgXjrK
	 BHk5N0qtfLV5811eMhD8H5MgtvOi9sbRy5Sa0DjG1zVk3UK4KXIA+jXQp7SfVIboS+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793957620;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ybV5PJ0tMQr6qthaURptS6hX+OOSLkoiXlq2+ClE4YI=;
	b=TftGDoImKvXhyeWtOSI8+gJ4A7RuHm6DB4RvfXV2Lm+AtOEAAkfHgx4GcjV0aT99HMpt
	 SUuNpigmKOTEq98DWaqgUn1lgVZAXcZu6WjzaJQ6Qj+X02jaVc8mNBy5L77KPN5ITP+Fx
	 hyS5RD9YqkAzIllZvnJqsh4u8PQBLOAzrYEZIGXRleX41PqM4GkAsQZvY1ayqh7aRfQWZ
	 /5FrMltglY3kC/K84d4R3gj99zrxpEV47Nh4x5mmnn1tELaKY9OlYFpTFEPLNcReWauyP
	 jPoX4GOyrjoN7epH54rjMMoHddtuD46zrSFyVsJie8kTSLjZrtCii9QT4nWuyuUr9NA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EYvze69F;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374CE60A2606
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:33:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 374CE60A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EYvze69F
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cd8ca57ef64so647460a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 01:33:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793957619; cv=none;
        d=google.com; s=arc-20260327;
        b=DE4juCO5t3DibIL2QE7nJ7X4OAsuytnF91dUep/46WksohTiyCrd04/1TludTlx/sm
         3g19oaZNsud2Qh1qb68htpD8hL7WOAdBTIi2H3x0dbxZStE52YHtEl7HsjZc1Sx2DfdL
         tpHdqlGZN0NFCRuazyAJxMTTST6loSdt30QrBKJixynNsTXvsjlNoKP7TCii/x7M6vLs
         hOSbnmp/bdHVYWRjy0w9cA9yQdR44vAqM+KRCZ0eImNirzUDa1tlXnX0wQ12OCtBJSDd
         91q0ek7gRgrs0tD8q72gq0YQU7MWAldkeV+pZIeI4md/6zHoSdF/K9Kx3pA4Z01lDV+V
         Og/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ybV5PJ0tMQr6qthaURptS6hX+OOSLkoiXlq2+ClE4YI=;
        fh=Pni3FZPs/1v+gPq64uQdGx1mG5OLKho/cMDzG9xhj0I=;
        b=jKG/RqZ4p4Dv7yiqhS4FRgolOm5HBWs/H1MmyvC5RGUzjsOQS0EKHqFH+iIiiwgAmB
         G8AIhbd4tmIEaqC6yUjSz/Xvcd+tptN5f9Yp4brFYEIABie8+EmPI8ZvCP195rQamMGn
         /qCe8McmW3IX+A1Y5WvjinSaGwlns2YGL8biRQ9WvRwJAgziAVLdRFtYpCF/AqsBlHuj
         EJYZqpkUf1TK+KhnZtUQE+jSHClVEpkj9VSMHCJWTeMApaTcCjpVzOuYF9O/jFo1XG51
         PDh8LUIuMbsDki6HqVZ+ORMh7RrwbzJxOideo1ChQ5OH6Y1xH+HewUXr16Z8i/2Yvwta
         vuWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793957619; x=1794562419; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ybV5PJ0tMQr6qthaURptS6hX+OOSLkoiXlq2+ClE4YI=;
        b=EYvze69FESKKR8bFw8xlkkRQtGjOUj20PwXtrnKFs44Oz71aPiKPyCxVpcTPVAUSLQ
         SYiwPS1quCOqEX+HHkjtMibW6qFe1/1yDwFEwdoN+OJYasqMKbrc8znXpJzA1u1VXD4E
         cvuEvJbAN69avgmyRcYvVqub84KEKozH5+oPhMuO4+Ibzx3O2hl/7kdZRjIa+w/ifa3L
         Q39/7nMi5Cy91JyrIWuyZNZbs32rpghyr29JmFDku786w56z0Z4U5Iq6AbOI/pPrSWfi
         L5s20dEnOPMic+CacS7bgKuBoT5qSQcUA7HgKOoGF68CX0P3mp3pXuZP3PvQXDZYzcpQ
         ReQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793957619; x=1794562419;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ybV5PJ0tMQr6qthaURptS6hX+OOSLkoiXlq2+ClE4YI=;
        b=H5F0Ytx/R77uXOKlwnOsJzmrfntO2FBGb04n4+k7gMMcJ40mLXktv+vQB/H90sebHX
         P1ibQ0YwF65S9rdNRoi6rEVn9s38qffsTHcbXYDiB0lPDevMICNRRn0tvmuUPO8mImKm
         qtPsHmjyr9ekwzGpduwDEWB5yUa7Qjdz8hGjeeLxd635BScRE4J/xlsE1MJ15MHtD07z
         yzefC/mMCQI7Apn8z+DGecQo616Z2MjXcyHTkEUuOsyt4VDUQHuJQ6wUFJ38mX1dR6t0
         Zc7K8vU+IlFPL/HNvSxFctHh1sBsFGbgGkJHHkZNDlFs2gWST5Vu+LUACmrfiA/gMmE/
         WoqQ==
X-Forwarded-Encrypted: i=1; AL+hErGhdX0ja7oprDFhEm1hGZE50PE2sFabgXwoxe1kq0ycgE0CcmJzH9WoNaCCotTv4dd9p8x501pKYiz7ivY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8iQa57XmQy43z7g/ghpKDGPQeSjxkx5GlFf4qjZn+uYj68jB0F
	T2y1Zej7syMtHYfzl1Dm/rq3OYLrf4rkZkJUr4h2rmiIjUblwNACKke+l81xAxqD7FEjuWkqDSP
	2k/nGsUU4RZvYvlPcpHJgfd8Ycv/mOZkHDggwATE=
X-Gm-Gg: AYBFou0c49IS6azpyIh1zN27ZveTyGxugMBr9LAkxrArp5G2+PucijUTNO3sKhdb2FO
	Mms9k3Cd61fOgaKmqP8BuPVZFvyxPWki9+aRZC70Jxbc0jw07j0VL0orIOYbUAw+gjYCHF+kjRQ
	wEmpZYgeLcLxDscxi7ztZw7BfCXyESIz29eOdsUCwMau2NeofGE9MtA2mrob/LULY4gEmUuuFf/
	3bQQMk7mTuYp/NiR/GI522da3WTXBBLK2V/HY+NNFx+jV+JQkWSmzhX1PAFT+I+nEft96uXiIc9
	eSkpGymyIuMXbDoXT3vyG0xNtreXPmDFeQdz/sEofocp5LWLjaSXwkQcFbViZrKAxnt1si1mKuP
	omrYwUxHtOYlUJXoXNHEHtmK5w54HefH0Al6v
X-Received: by 2002:a17:90b:3f4f:b0:3b0:a757:e370 with SMTP id
 98e67ed59e1d1-3b0db70fc26mr1220761a91.42.1793957619397; Fri, 06 Nov 2026
 01:33:39 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105104237.38542-1-phucduc.bui@gmail.com>
In-Reply-To: <20261105104237.38542-1-phucduc.bui@gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 6 Nov 2026 17:33:09 +0800
X-Gm-Features: AclHuK9vpWE_SlFYNUyNg7Vdx2dzB0HS2FNB_3vVBzGexP4Y_R3XoG7q6HqdtEU
Message-ID: <CAA+D8APoQt1uSk9R+O6Xg0zUKc4TaGbB7DJX1QvyZ6wzjDwHYw@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] ASoC: fsl_sai: Address several issues in the driver
To: phucduc.bui@gmail.com
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 6:43=E2=80=AFPM <phucduc.bui@gmail.com> wrote:
>
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> Hi all,
>
> I've continued reviewing the FSL SAI driver and referred to the
> i.MX RT1180 Reference Manual when looking into its register
> configurations and behavior:
>
> https://www.nxp.com/docs/en/reference-manual/IMXRT1180RM.pdf
>
> Link v1:
> https://lore.kernel.org/all/20261030091404.18757-1-phucduc.bui@gmail.com/
> Change in v2:
>  - Add five patches covering disable handling, documentation,
>    ISR error handling, BCLK ratio validation,
>    and preventing incorrect CHMOD writes to the other direction's xCR4.
>
> Compile-tested only.
>

The series looks good to me.

Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Shengjiu Wang

> Best regards,
> Phuc
>
> bui duc phuc (10):
>   ASoC: fsl_sai: Fix PM QoS cleanup on resume failure
>   ASoC: fsl_sai: Use optional clock getter for MCLKs
>   ASoC: fsl_sai: Remove redundant error messages
>   ASoC: fsl_sai: Propagate device tree property read errors
>   ASoC: fsl_sai: Drop redundant dataline mask AND
>   ASoC: fsl_sai: Warn if TE/RE does not clear on disable
>   ASoC: fsl_sai: Clarify fsl_sai_dir_is_synced() documentation
>   ASoC: fsl_sai: Check regmap_read() return value in ISR
>   ASoC: fsl_sai: Reject bclk ratio smaller than slot width
>   ASoC: fsl_sai: Don't write CHMOD to the other direction's xCR4
>
>  sound/soc/fsl/fsl_sai.c | 89 +++++++++++++++++++++++------------------
>  1 file changed, 49 insertions(+), 40 deletions(-)
>
> --
> 2.43.0
>

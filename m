Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793010176;
	b=cQNJDo+bOXI6yFGzPSSfwLngdpxKZm7EvPmReGfPAsvcdJ0jvXuuJ+TU5DXvnkPaiwtj
	 nH6Q3tHXOoQLQuXkW0cy215OZIZkk5Ky8ow862fnjP4dfDnlrXOxDr4GlB8TJsTf+bvCr
	 PpzUaZo/+TNew9WEJXpz5F8gqPtuDn2uyitqDzK6d/jKUTbJh2scip8uofXfLLjeywxlD
	 BojUSUquZj6fv2LlevWZi410VKEY/xbVUrCTgwIKkoJoggro3HvbZ+BQ/vD7xS6iIsoZB
	 I8xccasQcWwBIwRYIOJq5RBi4S0ddVO+oxQWktXrfspdQynlU181JbJfq/elIjS6FPw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793010176;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4JFuCCDMVlFwxbA66iE/GNag0HLFCOElpF7r10IAp8Q=;
	b=5R496//x1CmHzAHk6yiIc4x3EYFZbegoNlNbTA403m/rkoBEN0v3TRmqB/Sxd3h325KT
	 Z28VqDZBaE0IKNCYfw4LgjK6DGSq41YHwojYb7paT6HtQQagdbgqajtHiKTHge+/9Swxw
	 il7H5SKS3wYyH4EkJSj99Pt+FWJCWcVl/E7Uj+wu0ejf13+UlmwnBX+bn9xR38UpPLmCD
	 w6SrVK1rsqNNXfMYUTnLlxMXQ5kMrPDKF00HoJX7Mz6gFPw6IognW6eIukKtWqSIOLd8H
	 kOo3wPb513W+8R3+QDbTrXffGtXzV/W1hGHkqVc/6kMMbmY4d13MT528GMwwkiCboYA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DvfbcZ7G;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D5E606A327
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:22:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33D5E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DvfbcZ7G
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-8451a619da7so1615590a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:22:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793010175; cv=none;
        d=google.com; s=arc-20260327;
        b=DTm5wIIazBRQB1z4V9QO7J5nchLnBiBMeINFQxfI7l4Wl8ckzp4GAAZ7zf00vOrr0z
         jSEiV6Gepw14ra9SOWpCp0gXMqn36p04xHnCoSXPS1n33hPV42iTe4Lye9lYBeb54Zpx
         t4jgIoL9tpbG/Vbke6wHK5YI43uGSztzfgFH1BI8GP+vyZ22moq+59V0ioANTsCxTRpc
         +/RYplhIeffedxnsvfe95Z4KRx0yj0/+sC2tr2JiETfkZpmc+kmc+cRva/Gz5XYf0pgQ
         4j6G5KT5hw0tmfjH42a43pDCn/o7uOfl86vPhY8L+Ru9p5F9DfOCoFWH/WURpGKzVhxL
         8njQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4JFuCCDMVlFwxbA66iE/GNag0HLFCOElpF7r10IAp8Q=;
        fh=QlFAQnlqv9/J4KWsvRIdChCtexCniSA1znH4XywTzA4=;
        b=HFj3AdthWdPrwI+ctGeUS/VXjfCQkgMC5HcLEASxybY2utVmVgzRdzP1XLOKu6b/WR
         0iNROiEbDfq9KZ/AHaMlXemydPwTJmA3nVC0a+CiN2jGObeGjlE5RlAs/piZUCG1+pIy
         ZENwrVT/AjOJOM3afHea28tlqtdl5OousDVx5NCahP+eRfkNkMaXVJrjHQy/v/LIeUqE
         C6cBskdVjW3gqSVwS0dHY6BsU/vuFmjWDcCRNe2CaIzZTafdME9bNi3uZkAsliHoJTBN
         se5XbfO+qcHE5NcGkiQKeQMqRlVAvlPAt2r+F0iZY6XyB8z1nyTzmUtf9e6J0v+AqtlL
         7Xnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793010175; x=1793614975; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4JFuCCDMVlFwxbA66iE/GNag0HLFCOElpF7r10IAp8Q=;
        b=DvfbcZ7GoJswKjfDzCLmyPuNPlvoFsBClDaWBrErUCcTfvAsYuxE7U6Ros7TVip1Hm
         /9eYEe1aR6YakS7iUIdPwhdw45N756eSKF9M/Rc9AozmIt2L5HfMoUx/rtEVSsdepFFl
         DXDbzktWToPxurv4eOkVHQFRISgv5yUf0b4qzwtTPBCB53Z7kDq4aQmtKGaNdWuVzwN7
         iw/wQQAJ76xV3KgUA7gIIxyLazHw1TpjsjvcFPGu9DstNhGzHjm+5JimxW9NR42C+1g3
         tIcQUJCejidL+1ulGLOtkhXAAlH0emQfjivJRGr/UdCz5VT4iwXqCLJAHOsMUV0eGa+i
         /ORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793010175; x=1793614975;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4JFuCCDMVlFwxbA66iE/GNag0HLFCOElpF7r10IAp8Q=;
        b=c27VVBEwcpOjzkhfRExbCo5k0tqvrXaSOvpKVpbnzZdoPa0LxLzGzuvfGnO5Lj1rYl
         PoPFCx0UTCqv8MzN0Vv6Ra+0YZB/jZ1Qay1i8IG96q7DfgKZ1ryoo1JMRG/qSF5ps5+5
         /5FeSLgtGeoOgCZFFio00ctDbFZhAhOE8sgqdZkXj8PdmvZ0uXChI4cX/E+jZ8+H3itq
         u0fUrV8/O7LHkqOBq3PouMLUsr7VN1ENI8ZZLkRurxnZ8aZPbouCNFnzohV3krcBz3K7
         8GWLPIjVKkOOQZxhv6wmZnEUt/qrFIVJXclFdJpgOEkgScep+b0q5R4Gh268HahHuIS1
         g/HA==
X-Forwarded-Encrypted: i=1; AKwUvBygnOq5hUopJE1ZKbHrIsFimkXxLMp/WDcLcgor1Be6gcJTLz7FYgbY/Jy7lfJN3aUeLbpAC/mXr6rhUVE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCZ9oucRCIelJ7/lYZy8gy9fsvND6pl4J15Z/TF/5VOCjOGiq/
	SGa5SAwSG3cWUd+9ko+aqx6VH7lDt31bGP4uEnp1AI+sQblx0KHYcPpZMOxNIoYGG+j63xeTZks
	w+woatdmDe6NBKlB1vxccNgVMs+3pIQU=
X-Gm-Gg: AYBFou3QXJQYmTKI9X3MqpWFLSLjEUR/Afd5WskGtHtTSVrnpTnVlJcaTAnQMXwmz3C
	F27+1VbzlyCom90I/+fvsEo+O+CWq9ltUjb4cUeGRoLEYm8DmxiSHA/0HxLJC5zDf33zNmeKocf
	KZs8dW/y9UL7iC3vnqa45HEGKKdwdsaycHx2jI07N9caLxzALODEGTacu8yp3WfgVStqGVcsDrp
	CCHGSJpy3piYpgj1q3qS8g378AMt5lpvqWc9o3UoRAC927j8A5xM85rZ9fu/A4/oo00cNHaSPCl
	z+Nu0f6Pc3knZcMsu0L8orX3HlhOi/onA7VN98Bt0THUktLyLUECUte1daWyTCxvOdZWfYs6Ulk
	VIIPtykZ+0tP8q4Sl9eaWzzK5pe0l3mPOU8WenyfKPXhE89gT0nR/MebmwbHq7niSmxyV18w=
X-Received: by 2002:a05:6830:43a2:b0:806:ab05:c1dd with SMTP id
 46e09a7af769-850fbd152cdmr5102659a34.4.1793010175125; Mon, 26 Oct 2026
 03:22:55 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026092423.66168-1-himanshu.bakshi478@gmail.com> <at8lztOr7xpvHEdo@stanley.mountain>
In-Reply-To: <at8lztOr7xpvHEdo@stanley.mountain>
From: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
Date: Mon, 26 Oct 2026 15:52:43 +0530
X-Gm-Features: AclHuK-LrngTyM9fVjS8n0vJ2sFwVm_Ut-1pAzzYtokYdGgpWPQQI0AOYQG4gS4
Message-ID: <CAGLmz9KAs7oKnmLv8NK6Z8yBQyrdV41oiouoRrNBY-j-p_H2+g@mail.gmail.com>
Subject: Re: [PATCH v2] staging: fbtft: Remove unused fbtft_init_dbg()
To: Dan Carpenter <error27@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, dennylin0707@gmail.com, 
	cenzhang@linux.microsoft.com, dri-devel@lists.freedesktop.org, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan,

Thanks for letting me know. I have already
sent the v3 patch, so I apologize for not waiting for
a day. I will keep it in mind.

Thanks and Regards,
Himanshu Bakshi

On Mon, Oct 26, 2026 at 3:35=E2=80=AFPM Dan Carpenter <error27@gmail.com> w=
rote:
>
> On Mon, Oct 26, 2026 at 02:54:23PM +0530, himanshu bakshi wrote:
> > From: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
> >
> > The fbtft_init_dbg() macro is not being used, so delete it.
> >
> > Reviewed-by: Dan Carpenter error27@gmail.com
>
> This is formatted incorrectly.
>
> >
>
> Don't add a blank line in the middle of the Tag block.
> Tags are supposed to be in chronological order.  So Acks come
> after the S-o-by tag.
>
> > Signed-off-by: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
> > ---
>
> No v2 text.
>
> Please, wait a day between resends, even for small things.
>
> https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/
>
> regards,
> dan carpenter
>

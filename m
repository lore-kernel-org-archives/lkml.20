Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A98B46EC88
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 04:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792384205; cv=pass; b=jEInh/RwSSmDq1BMJCr5r8UXjU/6hqwgCprDNuhPZMIiQXwqcHzgDisKZNyxrm7Ir1hNn2sDfHLsIwKibicVIrqGJToApxIWLsivEfxo7x7F9NqjwcsOXtAbGlKBAEHKKTIYRadKhMI2+wLxLIEXOKxsO2b/PKmHZbslnxfrvNs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792384205; c=relaxed/simple;
	bh=asE30SXVAoP90qhP9dNI0QR+nkwcC4PqmT3gY2NE+Dk=;
	h=In-Reply-To:References:MIME-Version:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FZ5RlSQIN8BVmyLnq7WGaWKyV/RAdq88wlGx0e9RujXgvWfEjoksTu0YpIMLdUDw9nIf58S1rXXgV8p/yJRJycnAZhS3GULFkArSJTaEuGdhuMQw7WUq0puEevFzK14jZzoAXUidacolpYQm1D05VOcOTng1KuACsiotc7QtvkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rX/rQ0HE; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rX/rQ0HE"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5337c7b9937so323141cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 21:29:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792384197; cv=none;
        d=google.com; s=arc-20260327;
        b=C1ReoFnl/mh1aivs0J7A92QpMBqB8l6FYL1IUuu3P/KGPHBtZsfkKkJITQ8UhMk70f
         Ua39zkfiCRZYnxuRnh0QqliLMVvQbB0rilEhg99MYl8z+lJnAW0iGYgJzb8veh8U6oHG
         yeHAw81ZQwtKqWVLXufLFeY+8Gcm7+a6wUFRwny2ivKVsWXTxM4QzUMONJl/2aQSxCSQ
         inVbM7O2UABoKUtC3TMtv0vOsiE3CZK1egm0SKKF2BXcgUEL7GADgJRKog9zoY8EJAjL
         LcxiBadH+dc3X0irz3mhOuZxOdy2zddwES7pp8DBtSd6JxMoI8FDwXS3i6JK6JD0FGGC
         YlAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:references
         :in-reply-to:dkim-signature;
        bh=asE30SXVAoP90qhP9dNI0QR+nkwcC4PqmT3gY2NE+Dk=;
        fh=StlcykMLh3BxiSaqsGNEWYWS5aZwD0eXqnz2z2vpSwg=;
        b=hBpgjSC2hM1tJJmD/SzGoW3Hh+OMocUPTogL2suBciAoQoPzaeOZeH/VTJCTRKl65M
         QjzibGUcg+ymLLAF9luMLKDfedY/JmO5AKQ6iuiH4guvv8bc1A3npv9/98GlhU98NC5c
         wR9yDsza3qs7Oudl5csHQ07qlCSxR5cjsUgZICKMnmIEbBtdUWmfa/2tgLf9OSHjgBu3
         Spc+lT7lGDaf4G7+y8qYyQ0MtU+JEpU7YUyNXvkOX8e+WDefqgR2BPIA5Yr8Cgy8nlAz
         5SoG6ROEkH+S4m9xqwd4J/KHJ4+O+Bhb3Rv60VyBaPOP39WSiLsljOqyar6iLV03Ckw8
         7v8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792384197; x=1792988997; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=asE30SXVAoP90qhP9dNI0QR+nkwcC4PqmT3gY2NE+Dk=;
        b=rX/rQ0HEKLJX8qBzFVQDFAiMyp/Zpn4YvJngjq2qxJL0TQl1+f3Qhr9zfPMQgC7yka
         OyyUFmVHDrAAdGlrqIea2RR6Fg/fS8knB9pX9awXJuKRaSrpaTUY35+AlGcHn0tHuOv0
         4KgKF2hf6E+rhzy7uiM9QM8n1i2Yxot4Kb+/doUezMR6iODptFXeBoTnshovBnhKT91P
         aHOHMoMzWT2vEB7ZMMvfI83/thn6XBI8CD4invQSbHSr8+kNS1l8ONs9zDMwvzchxWmg
         fvZtRNDyw82opiqdL2/0+N9k0ibVU8s3M0DIQm6bXACy/o5EFaW9Z3NLClCIFLmvBGI0
         48oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792384197; x=1792988997;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=asE30SXVAoP90qhP9dNI0QR+nkwcC4PqmT3gY2NE+Dk=;
        b=0FNFkTGtdvx4lhoivMrw9yiAklPXN0q2Ceme6oJ7tislr/WnFEC5MnrHcX9efBXjT+
         ZAzPTNiDzNPiA7SAYkKqnLRaxL4f+R4cXXZedQk3YHKbyjLzriev2qdVC5ttuECIwktk
         ew7zry1bUDcQ1ItTyqBoIWGhK9ZcuMbXMt/nxMsIeZfQYFn1EEgH+MFCkTlgkDTJjhz5
         Wft53aLsOoSXqIrvfUb5JsareQoo7/p96Kzw1Fh5nGHY08r4UznNKPXfvcTUgfc14lkr
         cj/8EePBn0fHZ/PoOyDMXVs33BLYj70biGkqH4ygaDqfOcN4SfOZalvBk3s6nc9FxP5S
         /zkA==
X-Forwarded-Encrypted: i=1; AKwUvBzLlU8hG3QOszKbMgksFmIt7fgG69lyFqNjpd0NTsnm5YE2HoKQuKlTNb5MjDBB6fEaP+0mB2dYaWv5y38=@vger.kernel.org
X-Gm-Message-State: AFq9FYLAMupoHwnTCJO8izEbI+Y/kUB5m4CHOFc/npusWswWa1kBN5TE
	TsjKoF8hVjsXbIYCDd28Q3nXgzAWhyOo3veg1dworSCooEVyOXa8jJC1W5B1Dzs8AeNP25VN17R
	6jfqclz8ijFVE8y8FZTHxt67aeRyN2NPT9+rge8nz
X-Gm-Gg: AYBFou2bB+uxBw4FEXgLNXKJc4mLvJRG65UZtHud6uIpNZD3F+2IqLUtXzJLGKa7zpL
	l7jv4iCJrz+Zd6x55SOLuHwQs3S77A6dI+W2WxJjs+brg6HMnR8PXf0aIj8x+VoyQxDxTvPb3WX
	nMqcUdY8yAIUHcQzrox9QFqhkv+Drb9eLWW7xAXHpsShpWk4JW+3hDr6Eb+xJO9lgkkw2L1Q6DN
	iRt43w4J5lBN9lhzTThZ9jNfw1gm6p84Lzfc7sANk4yYeLyXJGNtFusMZhkpJAPqkN85T+WM7on
	xQojDV5YGK4PrMpOhVfb9oSRHf4eHgIu5C9eiFTvS/Y7V1DQww8OPeOWq14+gsKh3o10+F5x1mJ
	OHKaTPdc=
X-Received: by 2002:a05:622a:90a:b0:52f:8389:29e0 with SMTP id
 d75a77b69052e-53649acf23cmr28899601cf.0.1792384196502; Sun, 18 Oct 2026
 21:29:56 -0700 (PDT)
Received: from 913411032810 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 18 Oct 2026 23:29:55 -0500
Received: from 913411032810 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 18 Oct 2026 21:29:41 -0700
In-Reply-To: <2e042211ca0ebc974ad5ec4c0de9f3f93b3c75c0.camel@iokpp.de>
References: <20261017084403.875420-1-stanleyjhu@google.com> <2e042211ca0ebc974ad5ec4c0de9f3f93b3c75c0.camel@iokpp.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Stanley Jhu <stanleyjhu@google.com>
Date: Sun, 18 Oct 2026 23:29:55 -0500
X-Gm-Features: AclHuK-HgN0FmhIdLMEsn6Gjhf6fsxEJCtdj6atYDCuubd88JF0LL5qqpkihSd8
Message-ID: <CAE14pdc3QJyxY+YizyUfi2+NTB4oxYyqu_zTyT__-LfMxJLMmQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] scsi: ufs: core: Factor hba->outstanding_reqs
 helper and fix double completion
To: Bean Huo <beanhuo@iokpp.de>, "Martin K . Petersen" <mkp@kernel.org>, linux-scsi@vger.kernel.org
Cc: "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Bart Van Assche <bvanassche@acm.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Bean Huo <beanhuo@micron.com>, Peter Wang <peter.wang@mediatek.com>, 
	Can Guo <can.guo@oss.qualcomm.com>, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 2026-10-18 at 21:52 +0200, Bean Huo wrote:
> One more place has the same problem. In ufshcd_abort(), the "cmd was completed,
> but without a notifying intr" path completes the request but leaves its bit set
> in hba->outstanding_reqs:

Good catch, thanks. I can confirm it. I will add a separate patch to fix
it in v3.

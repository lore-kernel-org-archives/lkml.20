Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0544936194D
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789972383; cv=pass; b=o5dDjJwa+nt5yBLdFLNJ8hGbP8PpHzydjHs9qF2dv4AXTGBLNBA7wI4zg/eS/i/BLy1Mix97PVb2c/rus7ycSqQQ05XK2Lie/ZdHRypnf6xd3iv+IsZSrSEZumD66V4O4BIo0/gPtxB3qrBeBMUCIhMZNRVr+3CfdOSSUXudQlo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789972383; c=relaxed/simple;
	bh=ezw3oz3pOs7dtmVE5AzB+SlQNlOgHO47M5+Fpf49XE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d3Q/KAjeYXbmdlciQz81IJXWt6IVM/NKN4WOOF6u14WxYrI6lYd5BvZCT1brty74YoVTZklYVDk2tHwXbsr2rOD00ifBF76TZBibO/wSRC8FF6ggbMib3ZrIA5bP6fGJUNKvaenfWvo09yTY4d4nkYm9nZfTW2jFdimBP+nP760=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=Bc81KleK; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="Bc81KleK"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d43da99easo21008547b3.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 23:33:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789972381; cv=none;
        d=google.com; s=arc-20260327;
        b=j9CBtXhSdH2r95F7oeR2goR9X/LLNYT5cYAmyjbPtd9Detkpg/ZoL66Ce/LAsHJBU/
         C6BalJbLacVcVio3DwlQuDbr6juDeUXu13tq1efWuAe5aSfLt5juuN2yh+aH0Qo4XCmX
         L5P6yRIKWrbvy/48p2faaAC0k6/E7Jk2X1Jn5LBPsd/UDLBY2eabsCmxZ+Q1ldDzAb3X
         lgpkv5SioMoUi9OMMXYdQ7bNFaM3fAF0Ke/Wt7bu0LD/JhSzhdqh6IU22ASAuAsh2pXd
         W2IbZvxIfeFT+5LiNxY0lo4/5vsauKAkvwEJagqLoYbuqJX9Ju8eDmGatr4aPMq8MFxw
         FHbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ezw3oz3pOs7dtmVE5AzB+SlQNlOgHO47M5+Fpf49XE4=;
        fh=0K76cW2XocAPGtHmUUz0B3vkNWbWjPjrtjidMrKYZEQ=;
        b=hdFzg+4g299pjw8XyXluXwosm6KDegvsTVE1YBlHRVCv1gJT6gmrlDBMn1d+1aONIk
         AjRIX8rCu7ELVqG+otMSdubC21ti/DXyfyANzTc4qNlz29nZyo/T78kyjmk9FRHqhp06
         ZJ2qozGNyc8ndn3shve4esWAA7nd8Sg4J4FHFgsGO+XnkzsEtCtVxrjxfXLU7waJTrUj
         e0/JvksQdXycq7ESJi3lKNMcPnKdOlASvNun1M2F4GGFaUh9NwbhFup4XmidR3VfSaRr
         b8kGnWlkPlCD8SDUk/Bz/Rdk+iuwvQv8FpWbAh6e++EawYfeOdKrrzNzg1EIAOUbqpsT
         S/8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1789972381; x=1790577181; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ezw3oz3pOs7dtmVE5AzB+SlQNlOgHO47M5+Fpf49XE4=;
        b=Bc81KleK/ue3vQg0VqebfLCghMrb7/bz+wj9GCkczTBE4JV/czsyy0cjvHCAnNotl1
         EK7bZ9bMxEtvW2WEC5zy4Wi7Zy14HjqPY8b2ukwS5Mgd39Q46j/DYiRJpoKvQIZKZaKI
         W5mnBeJ/dzVWhZtMP1laRHUYgSjnzqVQq9TvJWQ15v061+MJCLDdJegKeZ2FTxiUi4zr
         a5i4vTUbg9sAg265lZFpXxDa15rMkeVHtYEDRoGyI92Ri2m65eWlrdx9Cu1XTF2vNemL
         Q54VD/KnzsAAC8SB/1uVKGQevOprfUqWfPHX7uIQBcxOI3AmdmXZGdLX2DxMLMLsAggw
         mPLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789972381; x=1790577181;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ezw3oz3pOs7dtmVE5AzB+SlQNlOgHO47M5+Fpf49XE4=;
        b=ld0+y2sFtnIOO/COyMMbFENdYrx41VaR+N8IV95kW5JBsXkJdgllGvUZWt23bJ0AoF
         Eo7TNYL+jlocmJdLX02NEh4zVppzOdg/X/fRPwPRWGCKDwOtpW8Yzh6XOu5L79T4IgO6
         1qY7jfyVC2hhm91bh7G6y76p538s86nQESBG4A2RhbEJn01tgtFw1yqrqpTiXH8IJHu4
         GS3f8PAHf6HAkUWOnTDh1jARjZfVKJb4oE+SUvtsckuTnT7bTUA4c00ZSH2e6E4nWiKi
         km8NXhGdddjH/Z4f5OU9WqBDUlNEnu+aDhv/ptNMQ7e0WUf8PqXjF/W8lqW1OeBjaQrX
         jo4Q==
X-Forwarded-Encrypted: i=1; AKwUvBxc5xMYBk80uPnLX9zHudVfNRhXINBHUzDYwPScBUIH2Y8rpdlZtlrIAk3yTvY2rrXLQxrM1zAGZjoCmQw=@vger.kernel.org
X-Gm-Message-State: AFuF++kPWh2ss48ZiVyUCTyu1q/kD/F1CcA9OfINE7HbnnQhUEbg4loN
	7xvRBAMv/IPA8KseSs4CplDQEsig/tJATjSUFc8u8eznyklF4xRD2h9tft4LNJj3i6MJo+NZejz
	hYMU+nt9ySwy/a1k9ty9iSCvZK4I3fRHRAm7Ai9bp
X-Gm-Gg: AYBFou3qQMv8sDbG3NI8ABGBwDMyKe9RJsaTOk+YnejdkWnya4rnJebnWrOP2pHhTsZ
	QY7KW5nDdjWR3omHVd1y2KmJxeEtL9IXkKLZqE9n0jI4xeY6VMbWBqiEkiffvxj6Bkqf+2WckJ9
	Mmau6In90Uwx9Ptt1qHXCO7UbRSVdh90ORsL3ap01/BivVee+n4sAbtlyLnmLp4sNzxlFz5KzeH
	YjxuL5QLHkE4spyKcZldGlH0kWs99mETMJW4dZgI0SO2hDpZ7MfXCUz+D3FIqCfnbGnaGEy7m7R
	yNLnkiMzadLNN8akjL87E2FeQdi9c+nNbmT5/+Vj2WOZVxCt1QytU6xmRvbVglGm537IxBEd3YI
	Xqah+ch2xNWm7xR9EeLEljoGc3zAD+4+GuJwLpIRz4vRMO+29jNnBX2l/bIpzjANRbKwjVpR2xQ
	mYseU4VhTIkLRJ5njRIWuoOLrGUAUmq079aey02K9lv0W7Z8Btlo1WsNuwaqcX/ezqh0T32SVSC
	n4Jst+IjKedda44eNgKJou3ksMVkccR8enWrDZsZgkTmfJ8UgFGfROWMoacBI7ywCvonnuygCpm
	k7it3NE0g3Mh7A==
X-Received: by 2002:a05:690c:6e84:b0:873:5bd1:98cb with SMTP id
 00721157ae682-89738590444mr27664057b3.61.1789972380819; Sun, 20 Sep 2026
 23:33:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260726221908.104873-1-julius@bairaktaris.de>
 <20260726221908.104873-3-julius@bairaktaris.de> <CGME20260911075315eucas1p1b4ffb1f57ef187e0a055072ccc0983e3@eucas1p1.samsung.com>
 <a068a857-a549-4cc2-ae0f-3ef119d3a859@samsung.com> <dd342f3d-36d3-4a85-95ca-6cacb7b834ad@oss.qualcomm.com>
 <10491411-b500-4e89-bf85-5142ced60aaf@samsung.com> <CAC1t37Ltrh+BBaEPi8grXnMrDt3qGDH8BA56av-h7=yPCCk0Nw@mail.gmail.com>
 <358d7dd0-20b0-44ee-8b1e-a0cc6cb40abe@oss.qualcomm.com>
In-Reply-To: <358d7dd0-20b0-44ee-8b1e-a0cc6cb40abe@oss.qualcomm.com>
From: Julius Bairaktaris <julius@bairaktaris.de>
Date: Mon, 21 Sep 2026 06:32:24 +0000
X-Gm-Features: AcwNN1VYrMKW7MY0qI4o0V65psGhOM1MxhN8fHN4VCpGkg_iFv4IKVsZlw5pgJE
Message-ID: <CAC1t37LqZCpnjfjpZUGDHOiMMEfGtZoSCPio737VFKs2vaOSEg@mail.gmail.com>
Subject: Re: [PATCH ath-next v2 2/2] wifi: ath11k: disable interrupts during
 firmware crash recovery
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, jjohnson@kernel.org, 
	ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, vasanthakumar.thiagarajan@oss.qualcomm.com, 
	rameshkumar.sundaram@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"

Yes, sure

Am Mo., 21. Sept. 2026 um 03:17 Uhr schrieb Baochen Qiang
<baochen.qiang@oss.qualcomm.com>:
>
>
>
> On 9/21/2026 12:42 AM, Julius Bairaktaris wrote:
> > Hi @Baochen,
> >
> > tested 5 times and it solves the problem. Thanks!
>
> Thanks. Can I have below tag when I submit the fix ?
>
> Tested-by: Julius Bairaktaris <julius@bairaktaris.de>

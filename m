Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792464431;
	b=1Lkt6LVZBD0AVvDDgADEs8+RyarH/jeGmZaLMEBEodUy8jvEQ955PJL0ZZZMa7c/pJ5e
	 q2DPHvoEeemgX0yZVqA1B7w9psGIhsfmz3uhMYJuUZ0TsJzfiZIz6AeV9YWG2fG05Gl61
	 ubmPBqXAciHz8+FEi8NEcCcAwPRPv0OumVP302McHki3u8LWUJy7PnuPNbsB9brMef2hr
	 PTvjnIpv8HGuyd3RzCVyyL3aJT+AY9EsrpbKUiXCod0u9pDUep2lQ7out6oG9ikxWXJpX
	 kgvRdnmGHGpWbI6QYeIqCPmdUojy0b6AfjANCQT+be4kCn7xQsXtcs7vmz8I/5QWM6w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792464431;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=250okx3Y9wdrZTBZhOyD68J79utZy7MePvsB8fpNCy8=;
	b=Z07DyzE3ixpKOaUHTWVqk51bOneCgP+qY4sLPLkUzrIOsC4VoUNE+DZ4EcCrG9cfijoD
	 /oWTUp5RcPWV5Ktubig4v/nYs4yYfaY8XzCid7rbc8nkOBSExWUczyyV4MmTiIwzvWoHx
	 X7eHS99GjLqbI2YmaPLAN9f1CpXTV/vyLd7dh73sa+hbkzFK0cicsDcGBma7y/KKotXW/
	 xSKHoDlFtwLLKVwkVb3nouDOWpiZDD1ZakYFw6cFWqYRkOK7xVRIJCDwcpKDM0wi2asET
	 EKiiv2EUzbdkC0QZLwo4sScpV3hp1b6FVVLqfhYv2JErwR4deKOLRxE8ArldY6myxlw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MYGyRYYV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.181
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E892B606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 02:47:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E892B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MYGyRYYV
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-93f3c895a0eso143845085a.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:47:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792464425; cv=none;
        d=google.com; s=arc-20260327;
        b=ibb8dj5qhZwXI0BjugVusV9J5AX9A4ab+W1ECpWTIkkMm6VAiUdaxXfZ3Bz5jngnVN
         lB6hMhyB0/sfrcTnURKqUqWKTmyCQ28VHowo9041qUzCFMq17UHEPMXdmMLv+ivyiBFJ
         kD7o4acvJm9I+y75s1HQYUc4udUT9aH+dYVHEenBw6hGltQXrwzBNZnK9tIMnLTL1y0U
         j00pINNxxEWQf/Tjcw19zb9u8sNdLP5qzIjdvUjjWPyMKhRsOb2VzNjlgoW+rfIfpoCq
         CUsnKwi00WPxol2YuiwUou4nnNP4VPaPpf9v+k362X/+nN/NxzrhwTYXisVX5TD2YLw2
         L8pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=250okx3Y9wdrZTBZhOyD68J79utZy7MePvsB8fpNCy8=;
        fh=3ZBcGiCRcFk096Dm9aDILzdwh4CX/hVinkxDOkYINyE=;
        b=gbrHV0QbXIuwsqW23v0GDLs0vWhWu8aGCGvPxqqR7i0+vp61a7M3WFfxR1o/h0EU/h
         Fc9pIWeoooswCV5PrGy4DXns0BUu8g0gKgT4lF+BxXTB9wGk25Db4C91kCWyrX2Vfaih
         m3YranXSYfBUpgJEN16BB7ePE8CvnITCuIyI9OjfGfiPOixYxT1E/AQNM0dhN7/iTgS/
         3UfUhSXD65JmqbJmRLaIYrVuJjrANIr/lT0YeYAq9lrAfBHbTerXaS1LvAvLo+F8nRck
         P8LY1waBiXZXCluEmOTbkacug40IE8LAZPnFvp3hyzS0bYGyZSU9316Cw2Fm1IIKdVEc
         J9JQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792464425; x=1793069225; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=250okx3Y9wdrZTBZhOyD68J79utZy7MePvsB8fpNCy8=;
        b=MYGyRYYVkmb1FkoYXA8qPP6aQdJMY5pWOIcHwI9fOVtXfkgQdMXXur8QkK/hmKez1l
         OQsmopyOlZjMYaH8j5y6ahzkowFypHhMRH5Rvqc5SeOC1l/ddDNupOwZZ/Loat29n/d/
         XuhCgB5AICPGTrolvam1yzaDqFwZr2bQC/zrnaJdD7hTt4AkcWJox+gJwH4Vb4oGTvtB
         ava4azRJaCfDfbmBSTt305eMzfnUSQov9yFuByYf3sW0C243NVonM4Vau8eSU6ah/+Rp
         mWdr8nGGRhNeijYHu10DV2SlTkcoSYuTXasJoLnli8psufEide+a39uxb1BIAzK1yX98
         PFkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792464425; x=1793069225;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=250okx3Y9wdrZTBZhOyD68J79utZy7MePvsB8fpNCy8=;
        b=u+X1mO+7OvA0pL7ARMNez5Lq9L3RNoMqoGwe1ZvIenUYaUxVIVJ7y7NvuIRpU7ktw/
         V1KHQq/0cKxbCn2ZoVaZNUjjXG8ooEU3Difoy/A6nvQC86HjAGbZiZsm4B/rZ1heucNr
         Kp2JZkRyI7BvhDrjQozT1vFvj0yqIZR2GKCo1lfCD+p+tmejT3rk+7F2pm3WrTzZ4JyZ
         OEfmHgLbmtgKn3IogRo1dCwOiuUrX3xrIbm+SdkMcxkpWT3GeEViY2AMPNRCGEzV/6s2
         uF+mOAYAotUvJNBWfsstC/ihpvS9ZngwRBxAqRza/l3LSx4XdfpGu2QwcxkG6UkwOaCO
         gY3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwpbUGnJLLzup/pKrhaWeJNFpZbs7idj2FrXvtpcbn1tAbD3v18xQtTy7M4mURIEkaywYQMehIpa9o1E2I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJa+/CWuiFf4vTpFRgvODM6tmSTPJE1Ocs/omtUl+zpDdeFBWeR
	JLVQgRVlPhUrEQdrcxaKDwApNIGv4fa8BAu+MGzuYFgiGMp3ifBiujk8jtclza7DivsAbyea3/3
	AWCAd09XO8STPnUXcIzFQAtTq71oJ0cc=
X-Gm-Gg: AYBFou0epOFDy5cgvVo1UHQ4y30UBH28eT8a2ujBtuH5Xy4s6J4vs+6uPMAmcGiFK/M
	1wiBDP/tgTCJPkm9oPrG4EAu98GL9TkqqKK77AkIJadw63PneAP8mwhuzgfRcAg8PQ5PfBNjgcz
	N2voeLrmehlr0PBmQ4wXwPTQoD53ecDcBaUiGO8MP0rwUPJwA4cOnIzPAX8XRMb/ut70NUbsTyJ
	pDl17VwcF3/BMnFl8e8flIbhOFjaBZml6metW0JVBsyRnu+I3ox0LCUVpGG5VkrLwPOEKrxMId8
	68RSIQGxwtDsh1+zchWc0T6BJgOyacZRmOloYR/aRf1g/w4EKwC1+Ps0eUHHvYQ1EkEJhl1Q0xW
	G9PC5IGWL9moFcJ7UCMCTBiTEzGBgsISgMG1PTn7nMl7zif8nitHlKWha6D4KQMygqhArzb19Ne
	UHaGuDApgrio+KM2TfK4ijWEcKQY/Qabo12Ex4dP9t76mkvzl+M0U9DTWUmK/W9UajVpWfteEZb
	rhAXxSkD2GLCSalfaMPjLFCKeBj4A==
X-Received: by 2002:a05:620a:1997:b0:93e:84e5:3c66 with SMTP id
 af79cd13be357-93f29d4e1acmr1674015785a.40.1792464424847; Mon, 19 Oct 2026
 19:47:04 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261012132622.48550-1-jain.sm@gmail.com> <179181183946.2527009.5855837780305581870@kernel.org>
 <CA+FWx=mA0dsOSopCNBiA_8BrYSDYD7=jxMO7uLpxT1OOU-BkWw@mail.gmail.com> <20261019191351.0719a13c@kernel.org>
In-Reply-To: <20261019191351.0719a13c@kernel.org>
From: shashank Jain <jain.sm@gmail.com>
Date: Tue, 20 Oct 2026 08:16:53 +0530
X-Gm-Features: AclHuK8DFXv_IzNcH66_Ba8wT464s-pDQOse4HLjbfnx3beeu2bxZQ7GEzd8p4Y
Message-ID: <CA+FWx=k7aMfwA7e3SwCjzyTuWaXXk+9KQ1GSdd2oz2UpjkcQsQ@mail.gmail.com>
Subject: Re: [PATCH net-next v3 0/2] tcp: keep the route window metric when
 SO_RCVBUF is set before connect
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev-bot+sinfo@kernel.org, Eric Dumazet <edumazet@kernel.org>, 
	Neal Cardwell <ncardwell@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, Kuniyuki Iwashima <kuniyu@google.com>, Simon Horman <horms@kernel.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I will check those.. Have been busy with some high prio tasks at work.
Will get back soon.
Thanks
Shashank

On Tue, Oct 20, 2026 at 7:43=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Mon, 12 Oct 2026 19:04:27 +0530 shashank Jain wrote:
> > > Please do not repost the series just to address the above. Instead,
> > > reply to this email with the missing information, so that reviewers
> > > can take it into account. If the series needs another revision for
> > > other reasons, please include the information in the commit messages
> > > then.
>
> Could you please confirm that you read and understood this paragraph.
>
> Looks like AI reviewer has some comments that need addressing.
> --
> pw-bot: cr

Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6472B4D9545
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790351980; cv=pass; b=fIZ1dmcducyqsygHAWqwhX33J0v4Uz5R0IwOe+h+TAwLab8qaRIwyW33m994iOm7iVgxz1zFMoYYV1DsBIr4t9oSwaakcnJZnbIoPzqAw8lL+mTxFuMcPYtSkwM0mCvM10WaaAdBTi0tIAFG3TBrsNo9CSKyvRAy1a10Msj8jZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790351980; c=relaxed/simple;
	bh=B8qXiETtR85WVcra197BwDvJNPoWm77eDu9rHOSvLKU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ubMQYRQnTzk8jrQ8/fHz/wYKDugnh8IEhFAj5jGNd/A1VqGD/VRCRkWbDOAUWWMTQcJ5Ne3ZzAPWUNpyEfRNMDx1H4i2HOW4vU3pi1rkk/9nURghfqtuSif7bFo8j4AaLQbnw+QoirY34KVlHklna3SjvJy8RUH29C04a9hqKeA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LTV7BpY9; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LTV7BpY9"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b8e820df9dso862692e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:59:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790351976; cv=none;
        d=google.com; s=arc-20260327;
        b=XeSsW5ihaJ42uO7vb5e0fMD11reewc16Xvh/dENVNYnv6WGNfUB0bBtP/asFYQm0bQ
         5nDzsDW1C/2TEqiuZqiZYV33Q+KAxMJnpb88bGlYURucyEl+/KXrfm6yHZQNiLnjjm/R
         ep4RwMgwQNOP/LarC0bTmmagWnZo0QSuYAbyIiInk3W4+OhMC48k18G3PRmAoUhZs/O/
         M2Tv4kuu1kU7ITTsGAIfZ5hP0glAzFyn/3u5GL0le+MUcBXcR7nphETGIGPJ9/Omdrn8
         iY37kmsjVdtkIVfjBVpGm6S/z2FLO7uGgp75/MaOX19A+2k1WNtUc9D/wjvZqlBPxjvb
         SnxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=itw8fQgIicRGc9nxPOOoIpwP28yPsa9toRCa2T1HmuQ=;
        fh=d8jYf0BCJRaBYZYtXflnw/v4whKtUC3NJLSl+vgVqUQ=;
        b=ZBpuCPDeSX66hJX3ev2NcZ5y98/qHyIZZq26LsAWc3blA+dhlwKLcB+ksP63fPdXyN
         0306Ty0BflKKmVA1WO0bSwesNi9P/u1wwD/8TbaNUEhEyMMIu8utSu1iAercWgIZ+RDo
         Iiv1JYPuvLfzkiDSp9BCiuB6GD8DN/iWg7eIJTCybKiuYw9ZmIiJk05KiviUdBST6VXZ
         o1W/9Y6aAdOyL8bntuBC/r3moPfr7ZinKmxVLyP62pC2rlgLYG45x/9PZ87Z020U1lG/
         MN7lYn4nfwUV8dFwSCw/JZzWpoItG9uPkJorKvgAhIDqV/ciyiFIRXOqTFRL2mUWPwm+
         Gdbw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790351976; x=1790956776; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=itw8fQgIicRGc9nxPOOoIpwP28yPsa9toRCa2T1HmuQ=;
        b=LTV7BpY9ONvaoJqYVmYD7Ld+4/7TYSzUmRS+YZTOgw8a+OhOFZIPScvyI1GhZxn0EO
         5Dd2IPdoSmQ8DNmmdqhA7OTTJAnP9nQ0A/OxfHWN4orXknK/BSVvViEwAnKN7k9KAtGe
         mUupKxshfPAPFhF4PmTjEBjqb7vPnjeq4A9IB/Aacgd1SwpwCSdeshpEyTlWSorfs67E
         xaR5Pe4IM7zzwZkS8S8Fl7HrLOLn5MZBcmGUHWRjJOo4Jppg5mMiyPBBmMEHVxyteSwO
         kMv0JDwvPA1qVOCQCyH8gj3dWYUExqkEh1M3svb2cWRHSexOmLuDSv2JMqjm/4zutBop
         AeEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790351976; x=1790956776;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=itw8fQgIicRGc9nxPOOoIpwP28yPsa9toRCa2T1HmuQ=;
        b=XiMKLTeODVMm0/a7M8FAVtK+vNEI8T2pc47y734lG5OK2Qoxf99sWZpQjb8MYlzSVZ
         fooO94fLVTRE9XezvZfvoWxxzlGHKD2aHE0rH04dcygUAXerbq5brHqWcMvFmkaelZJG
         eaOfgAVpsPLaJUKMGKV85RfL8PVcfuMAA6BONextqELgE3LnK6pdYTzREVy9M0fon157
         WgfuFTbjqM/MD7DN7FngpdAF/gPj9MspCEX07KIM5mIJq8RL7gOUlUZyHo1iwrY84q5R
         5hM1sV0ecbyRdZsfZECmzY87QSzl+zJ+L8u+TMq7aqxWilyGj0kUbpeka1LY/DdNLhVl
         lWmg==
X-Forwarded-Encrypted: i=1; AKwUvBx2SH+wjo9vSdivQcnWqmk/Cmp2EXfXCo272cd/Tjt+O4l83a7e0JBnU6sSK8ButN98OZsdP7TuwHOrj3Y=@vger.kernel.org
X-Gm-Message-State: AFuF++mtRpfhPMtaC2ah+Hd46sVZAl7ZRyuPvtd6ZmYj+uygGmYxQLFG
	AlXpMjC8fmHaH9hRM7lql3h5cTVmc12+SpivJRVc5kigNwDbjnbgyIXyeC1V+e5IIHgACzwGAsQ
	2QJ2j0zpfrGc4AvRaZXX5I0DW5cerEsI=
X-Gm-Gg: AYBFou3UYOpkMdAbJFElssT51VFnNITdRtMGvfWN6R/EWbaP/n7Rx7ikbdvoqGY5fNI
	rx3B9WXUYW/0ziDdrjHKYI/jYDSF9fW4YSAN/Duh54OflffebyriZI05mUD14nBt2w5yWBDJFv7
	219jIlwfoN6E01zOYio7UZlyU3B/4QxWt6dd8whm3s3IvUQmyEhO2dnfqjEttw6SAouqsPnAhuP
	iyXh3T/tkJPRKRm89q2YFdUM/45XJGbJs8mTZrJB8WOWWSKhtYmVeAhECNXuXwev7C6iq2DvrwI
	5o55P9C8+PK+8u2cyv6oYfLqVxHw5FUfLKslXZhqfEQprhUolxP7JL/byrNk9Z8Z/K9AM1Ajp3I
	/XjXsDJQtZrkV+lpxxMQ6gneN1S70wnn/VrdCKvr6/D0=
X-Received: by 2002:a05:6512:3c8e:b0:5b8:993e:6dcb with SMTP id
 2adb3069b0e04-5b8df092be5mr2238351e87.20.1790351976183; Fri, 25 Sep 2026
 08:59:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-aw88166-cleanup-v1-0-11f74cb5fe28@gmail.com>
 <20260925-aw88166-cleanup-v1-4-11f74cb5fe28@gmail.com> <3863fc1b-dd0b-4841-99bd-f2b34b2a97f0@sirena.org.uk>
In-Reply-To: <3863fc1b-dd0b-4841-99bd-f2b34b2a97f0@sirena.org.uk>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Fri, 25 Sep 2026 10:59:24 -0500
X-Gm-Features: AclHuK-7gR3Qf5WaP5Op8i4YKKqgNim4U9DhMEJiZAJfouW5l_AEjU9Gv5kf_EA
Message-ID: <CALHNRZ97Uije_nbzZp7kba88di=dXrRr6_1S62SXMyUBgP0gcQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] ASoC: codecs: aw88166: remove fade in/out on start/stop
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Weidong Wang <wangweidong.a@awinic.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Val Packett <val@packett.cool>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 9:11=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Fri, Sep 25, 2026 at 02:47:32AM -0500, Aaron Kling via B4 Relay wrote:
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > This "feature" was copied from downstream, but it does not belong in
> > the kernel at all. Remove it to simplify the driver.
>
> Are you sure?  Some devices have really bad pop/click performance and
> need ramps to mask the effects, we've got other drivers with soft ramps
> in them.

Ditto replies on the other changes. This was accepted for aw88261, is
there anything specific to this driver that doesn't apply there? I
have not experienced any such noise on the AYN and Retroid Pocket
devices that use this amp since making these changes.

Aaron

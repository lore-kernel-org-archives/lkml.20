Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DF1488239
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792396331; cv=pass; b=BggrtxXD2OhT2obSiA+KP/cP523OaHWwm/S3JcgW3fRFXHo2KrmLZh9L06WqjCd7rriRnHPpntF0qPo8qYnYkxauHFrQH4qdW5Jdqjk1P8PcNB6N4LDZnrDbeYp54dybBOmNUMmUFw2IWumapWDxkb3M2zGCTEcwQ+XHJRe7sZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792396331; c=relaxed/simple;
	bh=kNfL/Hla6UKgQQwI6Gv8t1MIM+Kmznse6S3d1b1fzrc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HeMAn25DJb8k0kmprV9EXWR1v2tSusu5bGtLwNL8MGnlX0JH1QtBGZhx0B6StML4sKGg+rx+PhRymioYXCPmGnADPL6dCiromATyiw11JxltAWDNWS2ZUzTiO8/c8mbTp+x8Sfifh1mN5olnKEoDYS9QAMtrK6l4tLlfBjY5ttE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=slNSKdhz; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="slNSKdhz"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-677d35fd1d2so1752714d50.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 00:52:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792396329; cv=none;
        d=google.com; s=arc-20260327;
        b=bFZupYPhbX9y2H0riDh33/Ja3SPlSndRSVulmpbNNotdR8wR67ADh/kd36SUltp+Sp
         JghC4r5XcKPpCmMCXm4lkdHWeLCrPMlO/tw976eWaVvoPTm85y7gyupZ9cKlrenHmoNo
         Qvdnxf4ZAPOFH/HTu7X67b15WGbMVKhe9IdNBkYSi8C/BxR3FWT1aSSTZFSOgAlUW0pG
         9dgsnBJlPzeRwM2qe2ui9Kre28wPDzayOKRwpp6OZgJZOc/+1x3g8Ur1m2CF7z7NrFCL
         z+WjyLs6d3Q6FGDS8s0PurxduJOzZDa8tx9HuLPc39GKSmpitBSKpIOKmYZ9yy0FQllS
         /xiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6Hu/C8DuVAfrXVfEdGESTNZFy9FgHIiZtc7UqY19xf0=;
        fh=YEmBbx/a8zzm3QA2J5yoOw2T+DR1uVxC+JdPqJaWAjA=;
        b=E6jaqOPJgwZxGI2VgPr4xfQJlObsKMQuAjuCkVH6SPRFXyN8ETBmcrOchXyaqLeS+i
         fQdid/boK9UNsw0sBaHdvM1C+YRH9rTD7dfRhqIFqDkHf/Ky6aN01YxEA7gRMABVMK30
         JVEFWcrH4HvH5l9UX1yDPRM0iRotWwuEwuM7M3eHCaCzaCLbXbQPNB03kYjnA2Vz/ET9
         o/B9Wr/DCspSxUSBKN0Du9NkolcNNW0F0s31kzjmN6Z8QzosgRVYf76lFRxiNTp3DZfb
         NT4gM7pvRJcuS611CYRea4O7ON55UU3odViEpUBB2s9ppgGT0er2tFO8Ij6XZYQi1YLZ
         Oyqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792396329; x=1793001129; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6Hu/C8DuVAfrXVfEdGESTNZFy9FgHIiZtc7UqY19xf0=;
        b=slNSKdhzQDufNI/CyemCuLFkbABnOforDaBTNQIcdaxAv+mxfH28l5VPAToHuJOMMk
         RpQ+aWioG4md3ZFfkeWgnCBx0TlHwrM/kVh1CfaTqXWDlDpQTHPdra4NflzVqS9YtnEw
         eM/N3W4Ci3CrGgQj9RltcSNe6UI5Zct7+a57xSNQdmE0vxqtjuSVWec2qncPFa1UCWXH
         K8Xr+DnZQyqpRpr0WBdboItoqpJLaiJbifWCB0iTPTtgyuqAKxXX6QjcZdpKA2tLlhPL
         B6KPw5idkZqLk/XooROxf1J4fuvvVsqFEk/aT3axrz70RosIljgrqdFQmbLHI3TE/KGg
         EOXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792396329; x=1793001129;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Hu/C8DuVAfrXVfEdGESTNZFy9FgHIiZtc7UqY19xf0=;
        b=WLLgpFm+fXBKphbWrgap2vuk4Au9O58jzkbMlBc8i/+BGuNNtMhIgS3CtaHEVUPZQn
         SI2bZYnRto+TtnfvQDQ+t/1SKWcxh68eZ22yONSiGL6jbBsqSbXEMTKMvlY2dsB47vQV
         2wEyjwM+PcbynZ0YroFtqv5mzCXJVlzuSPrChqIyeSfgVA3TM8KolSTxCNfWrFV2j/sY
         znPlyvTXV10int37DWB075ZSgfsEfBDTwXjckgmz4tn19kIrly+35+vAjkVJ2XGsemp6
         Z/Na0O5DArwUODaGdBmkrvZyqV6udLeSuu2fyfaGbNDnEiiGyuGlV25PD/lWxFYZ7PB2
         zCvA==
X-Forwarded-Encrypted: i=1; AKwUvByOJrv6zNWUaKUeyl8+1NHx/E1LJmsGvRi3tdJ/J93IUJBlcM9pyRwAlhpgFW15afiLl+Z/v6UKpkp0nSY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLI32oql8H4MxTTUmF0avL2HjEdHrK+f2n7bFozP1yiRexyGLDR
	i/dQDhZ7KD9y+VWMnIZUEQJHffA5JLFhK5cFc3zFZ/P9TzBuzIdMfFWEeY3+jUrePoRazJY6vGq
	XC8YEl+m18t8khii5vjxt8AnKguM9D8D0j8CrYzyziUG+
X-Gm-Gg: AYBFou152yQzUnrKoaBSLpcLKbUgIQXwlN7iMNranOkLu9dX1S4vtaGcJxTZR6NxRju
	3QFOFPYcJbBT4v81bTvQu2nQRCdbLBOvzBaaVxLFCU+shxSBzpe8W5I1YtOYXhztq5j4JtkhegU
	oBMb2JGXysmiZR4xPOHWAB59aHocVLA2irEhPbdu6m/GwKXvkMKIhBl/mxO1rVoGT0/dd8KgjFD
	DorC+lHcpYoDFKzWNJK+7MytBAVBM5OlyXfiXUEGstlfyA219tIVxba2SJp7SRSVxL/3RiNIzGa
	adRCWwzzkgd01fAoQHvLCFOai/BNKRcteW9Wz3n96r3SG/TfSjHNL6hAlsRDyWwsqJGWuf+jjUD
	MrsQDA6rYR/2SIUPak/UKrhcmA7gXsuq8O3CiT+bpLOyeL/0zOn8E6sjx7788unE54Yx6JOAcDe
	WHO4iInw==
X-Received: by 2002:a05:690e:12c4:b0:677:cccf:445f with SMTP id
 956f58d0204a3-679ca7ca9e3mr2034762d50.46.1792396328411; Mon, 19 Oct 2026
 00:52:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016162912.64581-1-lukapanio@gmail.com> <20261016162912.64581-2-lukapanio@gmail.com>
 <20261019-yak-of-subtle-protection-8ed0da@quoll>
In-Reply-To: <20261019-yak-of-subtle-protection-8ed0da@quoll>
From: Luka Panio <lukapanio@gmail.com>
Date: Mon, 19 Oct 2026 09:51:57 +0200
X-Gm-Features: AclHuK_A1TQjZsCV3MVlGkJ8tdfOzXTmuHWmMEHG7bKSsC6HnztuOLMJSgs52SY
Message-ID: <CACi=Ov5C9xuFvaYTcPapc=DzCFqrKng-V53voFHGWptvvs8c1A@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: leds: backlight: Add Awinic AW99703 backlight
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com, pavel@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, deller@gmx.de, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Mon, Oct 19, 2026 at 9:02=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Fri, Oct 16, 2026 at 06:29:11PM +0200, Luka Panio wrote:
> > +  awinic,iled-max-microamp:
> > +    description:
> > +      Full-scale current of each LED string, reached at the maximum
> > +      brightness code (and 100% PWM duty cycle if PWM dimming is used)=
.
> > +    minimum: 4800
> > +    maximum: 29600
> > +    multipleOf: 800
> > +    default: 20000
> > +
> > +  awinic,ramp-on-time-us:
> > +    description: Current sink ramp-up time when leaving standby.
> > +    enum: [512, 1000, 2000, 4000, 8000, 16000, 32000, 64000, 128000,
> > +           256000, 512000, 1024000, 2048000, 4096000, 8192000, 1638400=
0]
> > +    default: 8000
> > +
> > +  awinic,ramp-off-time-us:
> > +    description: Current sink ramp-down time when entering standby.
> > +    enum: [512, 1000, 2000, 4000, 8000, 16000, 32000, 64000, 128000,
> > +           256000, 512000, 1024000, 2048000, 4096000, 8192000, 1638400=
0]
> > +    default: 8000
> > +
> > +  awinic,pwm-trans-time-ms:
> > +    description:
> > +      Transition time between brightness levels set by the PWM input,
> > +      for a change over the full duty cycle range.
> > +    enum: [2, 4, 8, 16, 32, 64, 128, 256]
> > +    default: 2
>
> Feels like you are re-implementing triggers. Several properties actually
> feel duplicating standard LED ones.
>
Thanks for the review. Agreed, the ramp/transition timings and the
mapping mode are not really hardware descriptions. In v2
I'll drop them and leave the chip defaults, and switch to the standard
led-sources and led-max-microamp properties instead of
awinic,led-strings and awinic,iled-max-microamp.

> > +
> > +  awinic,i2c-trans-time-ms:
> > +    description:
> > +      Fixed transition time between brightness levels set over I2C,
> > +      independent of the size of the change. When absent the brightnes=
s
> > +      ramps with a fixed slope of 1 us per brightness code instead.
> > +    enum: [128, 192, 256, 320, 384, 448, 512, 576, 640, 768, 1024, 128=
0,
> > +           1536, 2560, 4096]
>
> Best regards,
> Krzysztof
>
Thanks,
Luka

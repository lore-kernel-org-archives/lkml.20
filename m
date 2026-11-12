Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794467715;
	b=ritoIend/cgM/hBi5wo47L4FR1tTTR6+rqqNBOOKX+G4qmCQdh7j2EYEcuwHSfHHB6Vx
	 KTjZEM3GXmIgArjU5t9ULKG9lB3HVRXpFq7PWBvNGxH6wZkrR96dauGyF0xgqyPVBhn54
	 mII6UNVXsQYQx1B4HGsGzUHG1HAwgcTDQBhYGCDQuoSvHerUBY6Shuinp5NQS6tInsdnW
	 fWoFvm+WN+0kENqSL4w55f74/z3hyK179rgUoAS1w32Rlp31df7HQxtTq/J0Ejs9kjj1a
	 gPXW+AeKi8QDLSiGrud7j/a32Q1QZVg7jzvvcxNQ6BRtG2ZUsMMqhj2zooP1ZOWaNew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794467715;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Iuy4EgTSII5aComkMofSr4ShqjFett6xQzaRyJYPEsQ=;
	b=JSie8evxkeBQb1C+fDEN1WLpgszjq3cQsFwjDej/zhmqueeZT3j0dAL/Cc26YVDFocpo
	 7mAPunKVbc5gCbOM6L6T2Ml3VBxKiznbvokeFhWgCKrlOJSLLTK56hFIjrvhbxa+U1d9W
	 RGkPo4yaF9dNIev3SJZrLNx47YDZ0Mp4CyqRk7JPB5gggCAUo98yNTMM0wt4JvgtSGW96
	 Fclxe9AKqMwudIV+c2phP0JWzjlsmZZyd/EozpEN4TkzYXJiYaOmuCJovZfNxXDx4jMKu
	 XoWcRr2IAY4l2M8vlvLwVcvwM4CPsCtitWXk7VtmAVLjHW5yeL6loJsYalaxZwFqomw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fkb8MuLU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.173
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D662606A895
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:15:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D662606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fkb8MuLU
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3accd1ff4c3so31232601fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:15:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794467713; cv=none;
        d=google.com; s=arc-20260327;
        b=TW/pgLPcouPcWDOf2YV06hFFHWK8jF1lQw+8qiYCqo+x0oyiiCOfe9v6OJxPhZGSrV
         39H02RhXvS1X2Nx+ClwCjX1q8s5m7ota96rwO4aOGzv8w6xyqhCnxseURLCNsg/EPyZM
         R0bhG+SufzJCx8xKTpoX8oKiQ2H8Gu9PvGqKF8LVy4S5ZEbfT/mFE+hEMHN1Qg1+6h0T
         Wx4v2TrtdB0CNNKbbO9gLEScRBzp/0K+3sDGrC0mPJKH29P+p48WySpsKJZ1s1y+Ree7
         v43w5mqUufCUPzHsracVhpMHGCS6Mi9xCRj7ZKn338eP8dlRvS1rnvGo+w22ea4byif3
         NM0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Iuy4EgTSII5aComkMofSr4ShqjFett6xQzaRyJYPEsQ=;
        fh=K54w1HjMrCBDYaW1LWmZYZdSk5KG5KMlTNcVNMNR4WA=;
        b=aElPURiSvse2VSyRoMj1WlHTPq5x2iiZ3oF9FXDiBYFnbP8K3G/c1u/S76h8WAz4M8
         yC22HQIKGkqNu0AgskUmPCP+Mobiv5N0k4iuBaRC+47SIefmqayT7MbMqgmQaSaTFBQF
         LLm1vcnafVDkCY3LjV0vpB14/+wGMwsVDR1VqTHFEnfNnx2CVQY/DGGdt3D+8uatypgP
         hD0GUdA4V7EKhs99GGpN5Ii22574yy/Xs5YBG+7x2evV2QBbgsu4/nEbgpuoMhvKiGgj
         CKJC2H/2iISnCIrqJkqdJZ934lkGYRWOqmHh9bbQsYuXkk3VvFkFpov/APsFA3othU5j
         YRPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794467713; x=1795072513; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Iuy4EgTSII5aComkMofSr4ShqjFett6xQzaRyJYPEsQ=;
        b=Fkb8MuLUesPuHb4fabJGmk9RtIyCSyNsSX4i126TQvAjaB8WJSyVzT1XrvWJSfikoO
         fisLKPt1PAmxZGz8vo9rwUMk41lrVb95VvTbCH3Kwg84DJMSrpWGRcZj1uFlxDOIP56T
         mHf1MgKWkRvoInA5McEjsTpxMhcOLhlnAp1Jj+SPqKdNUW9zd+DPMUxt/aXd/IhrbD0a
         Xw8jFzCp3SzJGPpyoPoywrhfDi8lG/UERx32nxWZaAj4TlrHHuibTQXBGKEi9KaGCtB3
         NovV4akBCrN7Qo0PNMd7tkHEpjlDGZwwxkoYZY8H5cZDBEcbra7CL9wPSWBg3TQFVras
         3vzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794467713; x=1795072513;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iuy4EgTSII5aComkMofSr4ShqjFett6xQzaRyJYPEsQ=;
        b=A8IHHYlsUAKKBRrq22dxTnUru5kurOhedam3Ux2Cd8ahgrzEyge8ivfgyiZRb3KinC
         U+qDiwRtSVnXKI6sMqM17sB2IMWH9/SwcHlG4fjeXVx35CuSfVaonCNmcWAnJz8nue5i
         C61wMnhYdSZZh2pLLcCq274cbJAz7U9RO0cFqpfrWy+JIbAWLzTXk5F/92xHv7vlfO+4
         h3pn4Jsr25GQ9rxZ4SWnptUOcq29eYkl5fkhzCacBUQS5xhrNgDyZU7jlqC6Qmohn/Et
         60FMTQNop/sO/YvNoBruT9AaWKmarCUSYQC6UkJcdxyG2W+XmjxLDhq85HNx8w8qyl7+
         A8dQ==
X-Forwarded-Encrypted: i=1; AL+hErEBC0kAJyEpK8/qy7f2QIiX52zdG8mA90PSfCsFn1Rtt/7lWhhfQ2EMyauNH+g9n7mvWhNY941OB9Dtu9o=@vger.kernel.org
X-Gm-Message-State: APuU4Z82I5WsLp9ENnNiENer3yNPAtdtlhJwYNZAsQORBrp2vzDr7xdU
	+Kj6DG7Q8ViVQFyf/nLv/Zc+KqW4CEW6zLrx+BCHKhO4BfkgK5XaEtSea8B+rlxx5I85VmNRvRc
	U8Uuv/OU5rRd/k3xKgow9Ks3uv1gNvrY=
X-Gm-Gg: AYBFou0HjwefNi7Ur76v9ynbTew03YIGtNyDy2TaJ9QEnM9Id/uuMVAMGtnQ5VL304F
	A/Yn+Ew3XXXGOc8vcQunEx1+fqaOrtWAOZAIY8UI8Fa1xV415Nqhbjm+dTBODoW5+WRwxng9ypn
	yB2Dd/lcpr7Ejs9Eg74UiGyKAI1LJlJ9rTO9UPqX3oSbNNxvABqw5x9ZNzD/+9ZsHN6Pe9Gku4P
	KFhSjHBfXdDkgUASUqgh7Y9CW7EQiyubQkHVP6ZvkjwLUWAFZNi5sASV+EJOQP41bKBx8fByJ0l
	nncx6Tq3qkjatSZGzkbLJNINn6Y20eqjzw2cpAnwNHDmZs8pl6lRNTYa/Drj/ML78WBT0zbyI5n
	WSCyYEwtowz0aylmQ45TD6AWhyHefwW2d9mu8v/s7GBho30wreG5keHPVyWbD3PyzwtJjl1d5ii
	z0oh5F/wIhXBc9Npems0I0Sebuyg==
X-Received: by 2002:a05:651c:b1f:b0:3ae:68:d077 with SMTP id
 38308e7fff4ca-3ae126b6755mr12031051fa.18.1794467712384; Wed, 11 Nov 2026
 23:15:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102130836.11863-1-yaoyuan0329os@gmail.com>
 <20261102130836.11863-2-yaoyuan0329os@gmail.com> <avKBsi-E7IeUgsSY@google.com>
 <TY0PR0101MB4786C8CF42ED66617BD9DA1EDC722@TY0PR0101MB4786.apcprd01.prod.exchangelabs.com>
 <avMcB0q7wF9oP5X8@sapienza> <PUZPR01MB477458CD012208A31DE60068DC712@PUZPR01MB4774.apcprd01.prod.exchangelabs.com>
 <avRttU9N0EZeq8nY@sapienza> <TY0PR0101MB47865DFC765932B9E6C3E1C0DC702@TY0PR0101MB4786.apcprd01.prod.exchangelabs.com>
 <avVPRySmoH_KKHa6@google.com>
In-Reply-To: <avVPRySmoH_KKHa6@google.com>
From: Vishnu Sankar <vishnuocv@gmail.com>
Date: Thu, 12 Nov 2026 16:14:35 +0900
X-Gm-Features: AclHuK_UqmV6H4513JLvxoPp79yhUJsDsz0Bv0l1E2WZSMvlO_OF-RYzRFgtWpE
Message-ID: <CABxCQKt9o--KrucZ-jcG+tb4AGtrBnPY_mypqX64ojWRpoO_yw@mail.gmail.com>
Subject: Re: [PATCH 1/1] Input: trackpoint - Add new ELAN trackpoint device
 variant id 7
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: =?UTF-8?B?SmluZ2xlIFd1IOWQs+mHkeWciw==?= <jingle.wu@emc.com.tw>, 
	Yao Yuan <yaoyuan0329os@gmail.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	=?UTF-8?B?UGhvZW5peCBIdWFuZyDpu4PkuJbptaw=?= <phoenix@emc.com.tw>, 
	=?UTF-8?B?U3RhbmxleSBDaGVuIOmZs+W7uue2rQ==?= <stanley.chen@emc.com.tw>, 
	Vishnu Sankar <vsankar@lenovo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dimitry, Jingle, Yuan,

On Thu, Nov 12, 2026 at 2:33=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Jingle,
>
> On Thu, Nov 12, 2026 at 05:26:46AM +0000, Jingle Wu =E5=90=B3=E9=87=91=E5=
=9C=8B wrote:
> > Hi Yao:
> >
> > Upon inquiry, it was confirmed that a black TrackPoint stick (0x07)
> > underneath the red TrackPoint cap corresponds to a vendor that is
> > compatible with the Windows ELAN driver.
>
> Are you at liberty to share the vendor name? Or should we mark it as
> "Elan" or "Elan-compatible"?

Sorry to jump in; this is Vishnu from Lenovo.
I have now confirmed with the component owner and supplier that the
TrackPoint reporting variant ID `0x07` and firmware revision `0xA1`
are made by JYT/NDT, not ELAN. The physical check also identified the
corresponding button/stick as white. It uses the same ELAN driver for
Windows but has different FW.

Therefore, the patch should recognize `0x07` as the JYT/NDT variant
rather than naming it as an ELAN variant.

Can name it something like  [TP_VARIANT_JYT_NDT]          =3D "JYT_NDT"
or something like that.
>
> Thanks.
>
> --
> Dmitry

--=20

Regards,

      Vishnu Sankar

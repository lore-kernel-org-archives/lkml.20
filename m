Received: from mail-pj2-f14.google.com (mail-pj2-f14.google.com [74.125.227.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571A7440A2F
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790578690; cv=none; b=ovZ8oYEMKQQiIlz2RxCbkWW5J/nIFuxjsfM5q2aqzeeYtpG0FOMwkLRTdoNL7XdN2bD8UU1ssqjIHqwz1HN2LQVAzjBTXJcF8j1EWUX4QlgJLZ8j9nMgWcEKtKjhSj2We71xJKWHJTgxXF489MBW53GPe+PAshBrQ6835vJ2jHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790578690; c=relaxed/simple;
	bh=YuK61F7k/rSoU0uw5Dg5cXbqHjHe/G9clpwYicDbyeg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kUJVJUgh3WZnp/FvKJpOsH9DJ2PBxg7momjNIms6guonAJZpZePfRE27jI+o0oznwns8/9OWGVClrttdKaAE/AX0EEEOCiG/a3D9nYZhUxESp2woGACoRFIHXEXgDhPVs+8BwR8VIPzL2MAT8/9eJ3GhXALjopE4puuK2EXjgwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VxHbMgeP; arc=none smtp.client-ip=74.125.227.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VxHbMgeP"
Received: by mail-pj2-f14.google.com with SMTP id d9443c01a7336-2dd58e1e2c7so11590415ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 23:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790578680; x=1791183480; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ksa2sNXJPSNoTaKAca6K+XVzGYsQFC4DIMIyH08mj4w=;
        b=VxHbMgePQLUQ+9s4C6VCem1KkhWXDsPqd7hMFzg3BcEoYeuoSRPjf8bmE6d4IcKB//
         RovvZCmySNDQ+/ozAhgQQ76uB5GDs3SQEP0GJ92USzibPZ/Oja6SjAZ7W/gUF47lLB+u
         2EF68qg/v8YPa+K8XYi3s5ruC0VgyMN79A/xo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790578680; x=1791183480;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ksa2sNXJPSNoTaKAca6K+XVzGYsQFC4DIMIyH08mj4w=;
        b=Ov182AltoeKO6dSSdIqKZTELzDsS0W4SqfzblVrKZtIft6uV7cL71WCONk85yTRujx
         eU9miMuW6SjJMjVeEMj2YeM1GIxX0IR6KOjzX5Wks7Rh0x07RmBkWJmiizMcwg7hPoXM
         uG7ofsDsdyVzezFjuxrO0QhHcFHLldheQ6/gNk6pCxj9YikcHRTGc9Ogx0Cv6nUQJ2WG
         HsX3++5DAVPJO5O5aFt7XFf8YDuUJRY/FSlte4W8f4SqYLo0iz0wkBcbtS53UUQnbEcd
         hXTIFo477aTnvZ0BtvHiPYYv//WXIE4iy37YgVTafjEryD4BARsFjdz7zFXSGkeZiRRn
         rR/g==
X-Forwarded-Encrypted: i=1; AKwUvByO1y1JFXcFlIgT992OZSYy9IbRMjz/vbOJDObzUMEbxAU7oZnd2w165GT/RZnR3X1RpLpXrGdKtvBA558=@vger.kernel.org
X-Gm-Message-State: AFq9FYIpFRvk2n0+rLxP6UuDEIJ1fjm3ptesnhsXog4771kf49J3DNR0
	A6ZZ52bN7yq4SJ2aGVbKvY8ZwCeakTgSHNhgVJZGXyoUo0MihWIq+D4V6Utv0cTWXeXJAIVjJvU
	eU2U=
X-Gm-Gg: AYBFou2Uc0j4m4toPQ4x1uym78tjpgEsNOnHD2k0A7a+cJtGBH2mmOHuut2+bojcT4L
	3AmdQkRgQkbmXU/9wwrr/WykgprZ9FXSb01D+YNnDLm2mHCo5McjhwWtY8wF8foWQfOFi7ipMtR
	2MHFTt8lp7vzrYijJDXGLobMpEctj76XyFeGe53g7HTIwZcu1kZTAn3tBRT/0cEk5PL0CNUVUop
	x7WqoRRMJXcDQPndK0SVUme9XQGt0zjHOEcTBl+CGCY51/U8pr3ZFa1PrO2ILInwF5/+gUI7uy/
	B+/7zIZefzc4LO1Mie24da35yVo2wtNkdYp2G+8+jqaS3816CJ2T3osfayl9hC7cIjs8oyfO4At
	klBBWEpaI4vmVglOzehdC103UVVCI5uKC8mOyNzXH67etp0QmD3ZZqEd4LzcLZ3WzgdnpQ6IgmH
	h5J2kfPIu64NX3rE6kV2poTnMSFPSLh/+hgFFxFaGVxj5aRwmc8j6ljj5JGsyoezcLcMnk2OfaQ
	VRXftUieUuTkgIeKSogK8bquIU7WBGmTP4fTw==
X-Received: by 2002:a17:903:3c6b:b0:2dd:ad74:6d16 with SMTP id d9443c01a7336-2df7dc1e71fmr94835895ad.28.1790578680475;
        Sun, 27 Sep 2026 23:58:00 -0700 (PDT)
Received: from mail-dl2-f12.google.com (mail-dl2-f12.google.com. [74.125.229.140])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df90fbc593sm36983575ad.6.2026.09.27.23.57.58
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 23:57:59 -0700 (PDT)
Received: by mail-dl2-f12.google.com with SMTP id a92af1059eb24-142dd04edb5so4513303c88.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 23:57:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwRepPtER5f0woaS0/2E3QpE5Lv26ZfLDl0WAEr4CL2wRLAOmmsMuYYZGai6C/srAEruLoQQCvxMH1kNV4=@vger.kernel.org
X-Received: by 2002:a05:701b:2618:b0:146:852d:60b7 with SMTP id
 a92af1059eb24-146ce1a9fa4mr7123265c88.8.1790578677319; Sun, 27 Sep 2026
 23:57:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902002553.34839-1-jordan.mymail@gmail.com>
 <20260902002553.34839-4-jordan.mymail@gmail.com> <CANiDSCvBkMDS9eSRRVoMqQT41c2uq+MQtUFHPm0gGuv13FWevQ@mail.gmail.com>
 <20260927220625.629672-1-jordan.mymail@gmail.com>
In-Reply-To: <20260927220625.629672-1-jordan.mymail@gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 28 Sep 2026 08:57:43 +0200
X-Gmail-Original-Message-ID: <CANiDSCsBbns32PGir2JCZ8Ofv9CpXgjV50k-vszmFY-jT-2WNg@mail.gmail.com>
X-Gm-Features: AclHuK_lmC3xPTa7GiwCuz3Qiv72zKIW67dqijrDrJVyGb8R2iwkNOlb0-TaFyc
Message-ID: <CANiDSCsBbns32PGir2JCZ8Ofv9CpXgjV50k-vszmFY-jT-2WNg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] media: uvcvideo: fix up missing AUTO_UPDATE on the
 OBSBOT Tiny 2
To: Michael Jordan <jordan.mymail@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Michael

On Mon, 28 Sept 2026 at 00:06, Michael Jordan <jordan.mymail@gmail.com> wrote:
>
> Hi Ricardo,
>
> On Wed, 2 Sep 2026 08:34:34 +0200, Ricardo Ribalda <ribalda@chromium.org> wrote:
> > Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
>
> Thanks for the reviews on v2.
>
> I have a question about how to handle a second device. I now have an
> OBSBOT Tail 2 (3564:fefc) and it has the same defect as the Tiny 2.
>
> Its GET_INFO bytes match the Tiny 2 control for control:
>
>   CT_PANTILT_ABSOLUTE   0x03
>   CT_PANTILT_RELATIVE   0x03
>   CT_ZOOM_ABSOLUTE      0x03
>   CT_ZOOM_RELATIVE      0x0f
>   CT_ROLL_ABSOLUTE      0x01
>
> Without a fixup entry, pan_absolute reads back the commanded target the
> moment it is written. With entries for 3564:fefc on top of v2, all three
> controls report the live value on GET_CUR, both during a commanded move
> and when the camera changes them on its own:
>
> - pan/tilt position and pan/tilt speed follow the gimbal under the
>   camera's subject tracking, with the host issuing no requests;
> - zoom follows a zoom change made at the camera.
>
> I checked the other AUTO_UPDATE controls the same way as for the Tiny 2.
> White balance and focus only echo the last SET_CUR. Exposure time reports
> live values until the host writes a manual exposure once, and from then
> on echoes that value, across a power cycle. I would leave all of those
> alone, as on the Tiny 2.
>
> So the change is three more table entries, identical to the Tiny 2 ones
> apart from the product ID. v2 still applies cleanly to media/next as of
> 2dcdfb625c3b, so nothing else forces a respin.
>
> Which would you prefer?
>
>  a) a v3 with the Tail 2 entries folded into 3/3;
>  b) a v3 with the Tail 2 entries as a new 4/4, leaving 1-3 as reviewed;
>  c) leave v2 as it is, and send the Tail 2 entries as a follow-up patch
>     once v2 is applied.

I prefer b) because c) cannot be tested by media-ci.

>
> I lean towards (c), so that a reviewed series is not disturbed, but I am
> happy to do whichever is easiest for you and Laurent. In any of the three
> I will include the Tail 2 lsusb -v output.

BTW, I am curious, did you hear anything back from OBSBOT?
Could you also report this to them?

Thanks!

>
> Thanks,
> Michael



-- 
Ricardo Ribalda

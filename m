Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793111079;
	b=lFd81Mksjl61WckDCwT4mvx6RRHNqUajUP3Y34pW4IiCLSlMYjQUCOQtzKlpmzsJ84q5
	 Pk56HtZ5j39vc3nRKOfPak1SXM80nImo7KFELAOi8y9DbW9WWK1sfjFM4Hfdz2jprVWuW
	 uFe4Bn0G2rwmGQ+apzwllyCtCpaQk4T2NOZR6P4yoQKVt+qaajcCrSnusgk4GTdqiKNbJ
	 mTyreXIlTRcnzFSLdYgh0eppYmImuT3wPbf955f9AwH4A6U/wKN0x5KeqWrgYGMjoYRD7
	 qm9yapqHpFkEXh9WQKeBD7TY7AXCrvW3ih2nDWS732dOoaVkT2fflsdZ9JHQfayfm5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793111079;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=IkPxJXmtiqMser+kPyM3Frb14w4G6irRRFb+HTaDxFc=;
	b=2WNrdWxoc4jetNJS3xR4SKBYS5cFf2iCiURszlsjltoFSUMx76MULl0fFJTYbMjxnIg0
	 aqVX9cuiQDCzkmty9beww4Iz4brQ2YMivfubEolhOMfO/jL25cnnDEfkNvrOmzBBmi7i1
	 b3s+oA2Br0w4+MqXpYVWWgeL06yGY8Rx6LMfvFpctFY/mS4sc+BasgoGanKiBjNOFdvko
	 K3/o4pdDX/pxBehNSZGbVUDg5GxhOrnYqhbGIAHh2ed0fn2TAcnu9JjzehmT77q3QC1RF
	 s/8VDQb5lAI5B08m+swSNECh6D2IMPY0YT4EeGt7q7ahr4dr0TLejnPi3Fy6JFPjTBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F1DbnHuS;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB22606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:24:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DB22606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F1DbnHuS
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so30094455e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793111078; x=1793715878; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IkPxJXmtiqMser+kPyM3Frb14w4G6irRRFb+HTaDxFc=;
        b=F1DbnHuSrCNo1Wf9WZzJ/XM6oVhLF8n7GttPUMUJ7Om8/L9vVb6/gx+7OHmExUZX2U
         OgsIFMJ3I1oHgkW5/eRNmHGxfaPFDarJfkC9+eoYEMYnKj/KHlX06hYd7Jd1Z21lSLtW
         2Tr3BzckbkcVBYMSkHMA29BVz9a0vNcI0pO4DyB+Ng0zbyPa5qPaUBWGA/ZXTh0FiXE6
         C0ZdewMp4jsbkIwvBHhUOcdlqHbt8m+tZg13wiiyZM/gQL19IaTcFHOLPxvixWFBcgRa
         49PdnckWQ2g0vrlmalo8t1EnusTNLLN48Awkjt06KhkuVMWup+qp1dXAiQs9co39cpRW
         9yGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793111078; x=1793715878;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IkPxJXmtiqMser+kPyM3Frb14w4G6irRRFb+HTaDxFc=;
        b=11kvR7vRDCznU7cUWLPTtl+YvN14CTWCqcDy7qi+ivfiXModjGjLGaFpGvVteQjoq0
         QF8DEidKCfC16S0/KphEoHLBo7c+47gTrStugKqgKxwJPK4g/eGhBW7OeddHpayp4tfL
         ZwE3YgvSgNT6PyGG2qxSQwao0IhEwfAkrcHFYgYc5hDGUPYwY8QRr0H3XF5uGbX3P0Cx
         9vMS4VGy3LK2XsNM9TUFFsSyqy3smworyhNUs56E1ml4qnqH5RvEWk/Mw/Z34iGWaA4h
         FnTkEsLY3l5zoFmoHtVHqyxR6a8n8fk0X4M6ivF8KcVjV0qPlKI68wFP3FlJmKN0vaFF
         oYgw==
X-Forwarded-Encrypted: i=1; AKwUvBxU9AYYEK0vwAK7OS5sNUhV0HanjKxl643SgF+aPTVhK67FbT+EDC1xtbIL8qjxke0Z05qYvi85n0S4EAo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBCU70MNP9CAxKwt7LmsXucP68C5AE3MBNV16pXlDYcCJp1Vk+
	h0iJXruzml+BKX55NfeGKv3k2MonXpRgW38UdB56WSx22//a/Mv/84op
X-Gm-Gg: AYBFou1TERYhbWJo33xn4QPj84wpqDCnFeFZOogqusSAWoYnE2hsiHMn1tZCCNxegRB
	SFK2ascMGF1YBwC74KrEc8dfHGinCOBIr3L1cSrlyKANah5kUwKf25xfrPejxfOOKhveoY7r9Jl
	epZz37Xn4N/ehRyYe/+H3/KkEhO39PQQ7iT1wnRxxH2qAPfmcmzwdUp8GWr5S1xEyXFLbcFKrTo
	tg9wrwzsQGAJRMY0jsyDm/PmeukmUxgAuVM2X1MEn2XC0Bhjrw8gOnkdm1Oz+wQ/McEAtHNh93N
	RuB+Im28osBb/vIxv6p2QhO6bc+xE4w/DVcN/qT5VlvA0mAZuZq3NCsJC0OiJCi1Um31w9AZwX8
	Sf8eHdjxMNIdu0j7s4v4Vgc+iyNbhck8UWqS/8EAyOJAf2qqdp/Efp9Ikgw5vOhtPNkZlavjMB3
	UoHvlc2PnV8pVABpRNePx9CNL2rJlaSnxCdJI6iYESw2Je9HE32gMBj/3rgqvpyF4rwOnJJYxWd
	5AVwJ00WbjVJWBfLUx/xZB7rMsPmRcEb480RZUZ7cQQGhAnphBAjpSeeWM63RG9E5IP8jKVRbBu
	4Xfp7d4XTtU6+26yVxOSvFyWUzjhKu3qvDyQHKo=
X-Received: by 2002:a05:600c:37cc:b0:4a1:a6e0:4ce4 with SMTP id 5b1f17b1804b1-4a35acb990emr193736245e9.33.1793111077331;
        Tue, 27 Oct 2026 07:24:37 -0700 (PDT)
Received: from [192.168.1.253] (4E5C72DA.dsl.pool.telekom.hu. [78.92.114.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a55e9aasm279010885e9.5.2026.10.27.07.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 07:24:36 -0700 (PDT)
Message-ID: <d451b9a185817c576ebb7943a604fd1952470412.camel@gmail.com>
Subject: Re: [PATCH v2 1/2] drm/radeon: process the VCE interrupt on SI and
 Trinity
From: Timur =?ISO-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Matheus
 Tagliari <mptagliari@gmail.com>, Alex Deucher <alexander.deucher@amd.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Date: Tue, 27 Oct 2026 15:24:35 +0100
In-Reply-To: <6e0b5af2-692a-4b2f-ae20-9c164e7e42ed@amd.com>
References: <20261022114754.865669-1-mptagliari@gmail.com>
	 <20261022114754.865669-2-mptagliari@gmail.com>
	 <88c61950-125e-4109-955e-ce09ebaab7af@amd.com>
	 <0c7e45a13fb78064390818bb501e754b62f16f6e.camel@gmail.com>
	 <20261027001506.27266-1-mptagliari@gmail.com>
	 <6e0b5af2-692a-4b2f-ae20-9c164e7e42ed@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, 2026-10-27 at 11:21 +0100, Christian K=C3=B6nig wrote:
> On 10/27/26 01:15, Matheus Tagliari wrote:
> > Hi Timur, Christian,
> >=20
> > Thanks for the input, Timur.
> >=20
> > To be clear, I'm not opposed to a backport. Fixing VCE1 for people
> > stuck
> > on the radeon driver with an LTS kernel is exactly the case that
> > made me
> > look into this in the first place. But my goal is only to help, and
> > as I
> > said before, I do not want to push a change you don't want.
> >=20
> > Christian, if you'd rather keep this out of stable, I'll drop the
> > "Cc: stable" tag in v3 and leave the decision to you. If there is a
> > specific concern behind it (risk of regressions on other SI/Trinity
> > parts, say), I'd be glad to hear it. I can also try to address it,
> > for
> > example with more testing, so that a backport can be reconsidered
> > later.
>=20
> I was part of the Trinity bringup back (I still have the engineering
> sample here :) and I filled a full swear jar bringing VCE up on that
> HW.
>=20
> Interrupts were definitely not working correctly back then.
>=20
> I have no idea when they were fixed but I want to avoid that people
> start streaming that this change made their system not boot any more
> and we are forced to revert a patch on stable kernels everywhere.

@Christian
Are you saying that you are worried about the backport because it may
regress Trinity?

@Matheus
Would it be possible to only use the interrupt on SI and not on Trinity
so as to alleviate Christian's worry?

Thanks,
Timur

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793276971;
	b=LA8Bd6hZTSNM0Plo2xNLsXwsdT029tOIZGPLnbDLtyMRadB01CVZ4kgbMEUyTiC2EYow
	 euhs3DcZCJjgmP9z2pnHP/BV9065GKxi0yo9ZeAuHb8MAqfIV0IBH4GzxEprdnd7YdF/U
	 BScKosk+lRjD99l86oe5PzPdFYQFTYdDT7ZMwd0KJqyP/hCjRkJJQxBVRUijmc7GW31wT
	 Eq2Opyu/eUrj30/GxMJenTizD6CtIuD7repiQJd4dOceQ/yD0BTmY21v+nNvhIum39coi
	 r3BuXXSEoondiZASLhSqw8U3k3W0GQLeaNqtZn5kRs+u/eYWQqYD3B8euu6p4lTk7Dg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793276971;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jBu1ZDaDeLw3kziDtQciA5KTpnDM9PUFIxQ55P49GCY=;
	b=aY+pHQAg/HTdCPtu2KgTHnUkzumHl4kNWtXIHtlgaKm7VeCGWEyZuGzJ1DBQgDl8r2ES
	 v/5rB/VhFBX3lwH2Fcwclc/JHiAO97pzobeuFzsd49SATvo9o58e+5lWvmX+yWbTUs+M0
	 BKFBKFmfO4I8e1D308D5PBNWR4CCZtYmLlUVszVdVApyQgMD8eM4jHmJ0YFfEbg31bsRB
	 rFQV53j0hVaCYVsEHK0vEhKgRlTut6kR1kebKiCzA9CX/QYW0/EdoGT30pTXhuk2AauJV
	 gmIRUJ/YpI38KLRxHiTzKquRC11FdiB4lbbJQW3dI6wdbrKnuTIPlvI7RNcR3kLHIvQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=da6spDfN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8703606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 12:29:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8703606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=da6spDfN
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ac451e128cso1485659a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 05:29:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793276970; cv=none;
        d=google.com; s=arc-20260327;
        b=hK0EDGiYgdt/Dcx/TeWco9qkmGT9V9aofGFs6vRgRhw+OxXnhvb35G79geN+OW9WBb
         K+Db1fFSIa3dH/f4kxmsb6S5UJXN6+Qp4mOP90wW4+mPBWPj31IFA0z6RGjL8HUWZpYs
         sicxjTy5jFdMALQcxz0LR5dwHG+nxaZSDqpBpO8E+N4KUZ7n8UGGWvEv/XFZ5b3G8mAu
         bt9Vf4jaMUR77NquL42EpOz/OZwlzZ13n0ZhvwCY++d/rK6riOa/GAMvY+gsGQWMaabL
         tY1T7+NsE3N/0fwHhSrE6wYdv+NU41CZ+IDWbIn6hnkggfWETR2r6qjeqhqF72EXmkNh
         b4Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jBu1ZDaDeLw3kziDtQciA5KTpnDM9PUFIxQ55P49GCY=;
        fh=cOW1YTV4xRRIKFx7SCG4759s5h5ZN/7w6bbwtdcFTTE=;
        b=J6yzAVKaNH/mkXclyMJJ12YmaiuQNPH4muJWJBAdSY8m1bAon/rtukGWP1z+EoQEgX
         fPxZXreMdv+G+Q4XAmoZl/KLOkkS1is+lBJDrAOlMrWXzE/sFFag01xjCD9Wo0ixzwt8
         d/ONI3zaPJ43DftXK8kK9/jk6wW4qRphTycwqdSp+jIAn6jjB1JUO/bbccg2cehT2k/y
         1vFMS+Ek8P8q904MSFPHNiskj0TKtiuRvnd7V7b9uyIs5Pvr1sYRiCovs2Q6M4xE/B+T
         52jJqm7ZUDRUZIICoMIqeRzvWGqw+3ERzUOqIxNfe52gnB0LJXJZcC6vrQw7gD83tMA7
         hOuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793276970; x=1793881770; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jBu1ZDaDeLw3kziDtQciA5KTpnDM9PUFIxQ55P49GCY=;
        b=da6spDfNlBiQ2jcub9TLYyo1exnbNAOB3XyBQoJ2li8xXisew7kjQTpXTpwG2oP3rN
         gdCV+Q5xbJpAGO0LFF4Y9ZWZKpTmzLvGXnqg2sJ+vmzgc528Q68XnjBYIEXf1feuQwUB
         J+qX61xJGS113JsylKQhP9kU8QvMiU7ksuqAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793276970; x=1793881770;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jBu1ZDaDeLw3kziDtQciA5KTpnDM9PUFIxQ55P49GCY=;
        b=yaIv7EviLecC1Ct9jE53HiOtnGSAoT4sG0pbiC79a+5Xvwu93Cdq9zdDh1IlO/nVsA
         njgajXB3kSCwtiB+DImFkrZg/pOKI0hC9lUl/9beEwz3zDJZKBzfjK/s1N0tAbOUwDBt
         2zZ5hiRGD0uiAiJchtCPuwmLevMqu/5CtDAg6oI8zpUk/vBjzTfCkkDqY3pmlPvbbrPz
         ZSuzhXApCKDdLmSO8FeN8MuxiyZe/cmqlHfqlDzJEMFQ0fNmbES0UJVTFc2FzVKxfNPO
         txfN6sPJqBGOyi7LmraAxrBtbjr3gYcQX6eUp4/4ZqsLFwCGchXMH6CL07zYI/a9WeX2
         Yldg==
X-Forwarded-Encrypted: i=1; AKwUvBx0cBQ7C/yQvsNyBqfVCCKHLCBx59XJ2METQGig4ZOWILRS8caGX9yb5DfAxEqs+7cjyCKhzQlYoJR3Jv0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLM6GA4lwgieONIkwy1koGDDh4OsO/pwLsRxLsGX4eZ+EHabX49
	k1zxNQHv/xX73GOTa8+3SkHS/d49xzfVYPjPJbE2Ujegq9dC4jqGiUWjMtKIYF3diAsOxZu62zn
	xjCQw5n5Cfii/ZKq5PGXiD0rzz99+yWSnsXEgrf8T
X-Gm-Gg: AYBFou3BnYnJRpjAV+zEt9cXJZN+diESLPw+iluTugScKNxX40mkCQj75nJ+8nHarDS
	0tPlexm9qOf7fGD7H135uu0+gz69xZw21mei+5nYffAx79VKaAc0nYP0emWLNILWJ8nn0Z7cFAN
	gtUsebhhOBM76bQ7e8TghDgrJuNPTjMMu60WZXGH45SmeMeG5RL3S75CrdN3etJ8RfPM+Nt+W14
	ZjtyZ2J0DScPIqXkwn05xOfcvjXvSoteB9PxRoQNVzZOK/HnWconVc8m5EDA6B8pJnPAppRMMgW
	fZJBjCdPsx6HwgFpn3eypwjwz0hqK69nQTjNzPmwqoO5LEuDMln1utEzpCtx6YbiHiv/trhPYOG
	NuN1e1HfnhUnXPudDaDBIrabMw912APgd99fL51T5OsPbTwYd3hqw9NzZtdXQZBcX22iD5NYuEm
	eHzubarkV+y3NZ
X-Received: by 2002:a17:90b:17c2:b0:3ad:1da4:2ddf with SMTP id
 98e67ed59e1d1-3ae581bbdcbmr4025636a91.51.1793276970075; Thu, 29 Oct 2026
 05:29:30 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028090932.27053-1-akuchynski@chromium.org>
 <20261028090932.27053-2-akuchynski@chromium.org> <auLJPLArIkwFHtRj@google.com>
In-Reply-To: <auLJPLArIkwFHtRj@google.com>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Thu, 29 Oct 2026 13:29:19 +0100
X-Gm-Features: AclHuK_RSupfL4YZ78wkRsLm46Vbx_c27Y8V7hlLCoBtIthQ5W1xvuqo9H7JdTg
Message-ID: <CAMMMRMdjzbUL0CqkWdxaerm=Bmf6oCPJU3TMtgXCgDqTTMGT4g@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] platform/chrome: cros_ec_typec: Enforce
 priority-based mode selection
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Jameson Thies <jthies@google.com>, Benson Leung <bleung@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 5:19=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> On Wed, Oct 28, 2026 at 09:09:31AM +0000, Andrei Kuchynski wrote:
> > The driver sets mode_selection bit for each Alternate mode, thereby
> > preventing individual altmode drivers from activating their respective
> > modes.
> > Once the registration of all Alternate Modes is complete, the driver
> > verifies if USB4 mode is supported by both the port and the partner and
> > activates USB4 mode. In cases where USB4 is not supported, the driver
> > invokes typec_mode_selection_start to initiate the mode selection proce=
ss
> > based on mode priorities.
> > The driver communicates the current Type-C mode to the mode selection
> > process via typec_altmode_state_update.
>
> Hi Andrei,
>
> I'm less familiar with the details of cros_ec_typec and its friend driver=
s.
> Could you double-check the Sashiko review [1] to see if any of the findin=
gs
> need to be addressed as they look real?
>
> [1] https://sashiko.dev/#/patchset/20261028090932.27053-1-akuchynski%40ch=
romium.org

Hi Tzung-Bi,

Let's analyze this.
1. "If the EC does not enter TBT mode=E2=80=A6 Does this leave the port mux
configured in TBT mode and skip calling cros_typec_altmode_exit() to send
TYPEC_CONTROL_COMMAND_EXIT_MODES to the EC?"

It seems it does. Unclear if this causes actual issues, though this is
unrelated to mode_selection. The identical behavior occurs when altmode
activation gets triggered through sysfs by a user.

2. =E2=80=9CWithout calling typec_partner_set_usb_mode(), port->partner->us=
b_mode
is never updated to USB_MODE_USB4=E2=80=9D

This is a good one. I will update it in v4.

3. =E2=80=9CIf cros_typec_remove_partner() has already set port->partner =
=3D NULL,
this dereferences a NULL pointer=E2=80=9D

Also a valid point.
However, this is unrelated to mode_selection. The race condition between
cros_typec_altmode_work() and cros_typec_remove_partner() is addressed
here:
https://lore.kernel.org/all/20261018023438.3902617-1-mhun512@gmail.com/
Execution of cros_typec_altmode_work needs to be halted prior to partner
teardown.

In any case, I will test this against these considerations.

Thanks,
Andrei

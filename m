Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088634DF4B5
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791889058; cv=none; b=ch+Ks9U3CE3bpnNlfBrXP0hUlyB1vnYLWLDkYTYvqk+QeXUr5fEiXcnh/e+VwKRAN8CK8RkwKMp9dKN1OvTA4J39Qks7WwZPVcygYN58Cym3ZU3lXn+HbYNXOmTpMCnq7CIU9m/ElXf6lHkklwdcSsyS12PhiW8/IDT0KjDM0TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791889058; c=relaxed/simple;
	bh=ThjR3xSLr1LfJ1yv9IW8sarLjeBx455WsrLUpY1kFdo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YB/rQl+8jv+QC8NtmQZq/7vLycq0/M0tQFFIfQJWXmY5mjsfz3H+3s+yqqYfO1Ehlsc3+14lfpc8lggbE+xDCt++OAuTK62JMy5BjxkM8cicWFTi3YzFOwOlJImAOV5nNMcuz+zgZvKMWVKWMoQtuy72XwY84aiWx4cKxG0r8Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T2xqHWfu; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T2xqHWfu"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd5e41413e5so2538118a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791889052; x=1792493852; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oL0fPjkAX4HPlEqBsFE1HVIbCTPmSMd2WZM1ac0YKBE=;
        b=T2xqHWfuDeYLZbi0TMTgWsJiCE3bIli3iSAwTLdTDk9PbyjBCGoHHVh+lRS9L5x5Bc
         Gxqk3b0FWREF7gHmmSaJHOQadZqKRAiU6GqijGCckPLY5NSzuEEerXyQt2VG6A6DLABS
         tJNXYaxF6dKXtHcoJxbTLuOGsgErRoiZvEKmADWVXOfGXBp143d1PWBa7Aspz0aZDYIP
         6qemFzHWC1fh+8ufOCOctFbOXkaOBj+sLEHryRzlrjheR6VCwy1B15P6SHPehCmL/OMP
         3BRKEcHeJRT6UWlShhBcnZlX5Cb/g7/jQYwzDVOpq4VS1r+h8cP1Cujj8mEk9Pv1f6JC
         K6qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791889052; x=1792493852;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oL0fPjkAX4HPlEqBsFE1HVIbCTPmSMd2WZM1ac0YKBE=;
        b=qIedjWrSQSkHukOjuen/maiEGCM+y+IN1q+LkJflX/Hobq5cJ74JyV4pYfRS2Pic/Q
         1woeTiwjRsJVrV3SiBD/djckhRcyPrvHe0MVI37zbeEsNPeS+ZY599nqWJmNwxX5Sehg
         zxXaTvp1d8dvxDwaZHn9KzumIRmr/Kld1qhT9U78jRSH2UkqmKjhzV6r1e92pc6q3GJ5
         NPYMch1eUpHCD4P5ohxw8cI0YBmyqLrs1+a5cNBB/DqU8nkSwYBEP5zougcyaLDZ7oO5
         b+BpFuDUocW2oKSPZkjzHZMsUguWx6c3xz2lY5tlnkAK/TOj87mGa7HHANdTeA1CigZc
         Nmlw==
X-Forwarded-Encrypted: i=1; AKwUvBw4H724FN85k1pb4dfWW5kyn5T9PJMvAA7neKiITwORXkKoHksYtNlWx7CgvFcmtjqb/mH1giQacgta3Y0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXKoNz9DHbIwZyLmIa6q9EB9BiLRdJ/0LhXzHJDJA3mn97k9/T
	tsqc5PAHkBsJf7HK0AwqeYUBZzkSLjWVVTiMdmXJjm9DYaw3eiMRRzutpicQW7QOs3hGfmD/X0k
	F40Y4yF4c429PWA==
X-Received: from pgaa24-n2.prod.google.com ([2002:a05:6a02:6498:20b0:cd6:1eae:26b3])
 (user=sgsatyam job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:710b:b0:3e1:38ac:43cb with SMTP id adf61e73a8af0-3e16bf1b721mr9784261637.70.1791889050688;
 Tue, 13 Oct 2026 03:57:30 -0700 (PDT)
Date: Tue, 13 Oct 2026 10:56:50 +0000
In-Reply-To: <amiBVdd1KvxbW5Ul@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260723163838.1698125-1-sgsatyam@google.com> <amiBVdd1KvxbW5Ul@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261013105713.1369546-1-sgsatyam@google.com>
Subject: Re: [PATCH v3] platform/chrome: cros_ec_sensorhub: Modify clock drift estimation
From: Satyam Gupta <sgsatyam@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Scott Collyer <scollyer@google.com>, Benson Leung <bleung@chromium.org>, 
	Gwendal Grignou <gwendal@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Satyam Gupta <sgsatyam@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tzung-Bi,

Thanks for the review!

On Tue, Jul 28, 2026 at 10:15:52AM +0000, Tzung-Bi Shih wrote:
> > This CL makes 5 specific changes to the clock drift estimation algorith=
m
>=20
> Since these are 5 distinct logical changes, shouldn't they be separated i=
nto
> a 5-patch series?

Although the v3 commit description listed the adjustments as 5 bullet point=
s,
they are tightly coupled parts of a single fix to support sensor batching i=
n
the timestamp filter without breaking intermediate states:

- Extending TS_HISTORY_BORED_US from 0.5s to 2.0s so the filter survives 1-=
2s
  batch flush intervals requires the 10x dx ODR/mode-change reset and slope
  clamping; otherwise, transitions between active streaming and batching (w=
hich
  previously exceeded the 0.5s timeout) mix into the same filter history.
- The 10x dx check (which reads state->x_history[1] when history_len > 1)
  depends directly on the loop start index fix: previously, with
  `i =3D state->history_len - 1`, the loop did not run when `history_len =
=3D=3D 1`,
  leaving `x_history[1]` unpopulated when `history_len` became 2.
- Dropping strictly past timestamps instead of clamping them to `last_ts`
  prevents post-reset backward ticks from being mistaken for same-timestamp
  batches by `cros_ec_sensor_ring_spread_add()`.

I have reworded the commit message in v4 to explain how these pieces work
together as a single cohesive change rather than a numbered list of unrelat=
ed
items.

> > and timestamp filtering to resolve monotonic backward skews and OOO err=
ors
>                                                                   ^^^
> Please spell out the acronym (i.e., Out Of Order) for clarity.
>=20
> > during batching:
> >=20
> > 1. Clamp the calculated drift slope (m) to a realistic maximum bound
> >    (+/- 200 PPM). Huge jitter spikes previously produced astronomical
>=20
> Same here: P..? Per Million?
>=20
> > Signed-off-by: SATYAM GUPTA <sgsatyam@google.com>
>=20
> Please fix the capitalization of your name to match the author line.

Will spell out Out Of Order (OOO) and Parts Per Million (PPM), and fix the
Signed-off-by capitalization in v4.

> > +#define TS_HISTORY_BORED_US 2000000 // 2 seconds
>=20
> The inline comment is redundant.
>=20
> > +	start =3D (state->history_len =3D=3D CROS_EC_SENSORHUB_TS_HISTORY_SIZ=
E) ?
> > +		state->history_len - 1 : state->history_len;
>=20
> How about:
>     min_t(int, state->history_len, CROS_EC_SENSORHUB_TS_HISTORY_SIZE - 1)=
;
>=20
> > -static void
> > +static bool
> >  cros_ec_sensor_ring_check_for_past_timestamp(struct cros_ec_sensorhub
> >  					     *sensorhub,
> >  					     struct cros_ec_sensors_ring_sample
>=20
> It'd be better to rename the function to make its intent clear.  E.g.:
>=20
>     cros_ec_sensor_ring_is_past_timestamp()
>=20
> And have it return true if it's a past timestamp, adjusting the caller
> logic accordingly.

Ack on all three. Updated in v4.

> On a related note, is [1] still relevant?  Should we disregard it?
>=20
> [1] https://lore.kernel.org/all/20260720110405.2127011-1-sgsatyam@google.=
com

Yes, [1] ("platform/chrome: cros_ec_sensorhub: Fix AP/EC TS wrap") is still
relevant =E2=80=94 it addresses 32-bit EC timestamp rollover across deep AP=
 suspend.

Best regards,
Satyam Gupta

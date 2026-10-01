Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC00528431
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 15:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790869216; cv=pass; b=cjndjbFsyDyV0S1xBZOIFblNEYGFOSXii9uHJCRDdNdQJRJD0oA50jskzacTwW8DBJczUrTR9EXPHaVB3gEBYhujUWYQgz+cstW/LccbwmcoOih5J/DdsNdWEkaSWIpoVeQ+QvfgEWmqBIs5EFTTfwrgTVxQu4PytQXC8LfLnQA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790869216; c=relaxed/simple;
	bh=Rt5kCYTovKo79P8T5a1y2BU7GEOnV/NaT7+bvWuL78c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AGKlYdyP9H6/DFI8bruEJvNhXJA5PqiKEoM4b2SfcMtbSXGefvl4NTxZHmq4ZVw4krqrrZxZF/mYYOvUddmrKwwYJfWqsEJkbglocXU1Iid8stIUSP7+FlfuNupHroHlFB1MbXwNjswsVODPZc42P5Ah9Vg5sC2SELcAW0zEgeI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UEqRGMCS; arc=pass smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UEqRGMCS"
Received: by mail-pj2-f40.google.com with SMTP id d9443c01a7336-2e494adf48dso1078345ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 08:40:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790869214; cv=none;
        d=google.com; s=arc-20260327;
        b=fUWkpJoyFZ9eOSX9neXu3b2J/F+8IawC+5wz6tlaIrlaoWAi2w3ApN3o5Me1jMJP8D
         hn3dIOiRltHJ9rxb+3JBm1BAN1rXdTxTt58NfLBBgeptmBgoWXeTr9frEGkf03413ahm
         GVVI/NZuywNew40xAYiAcDZDJlfNEYcZtBTnpRdMhc+L7LOsgDjagVcA62yh6UvvBzKm
         Fd2AfJkhKfcN/fexZkVxVdR5505dszpG0hUVLK19i62Hhyj3Q5OCqWqAW1hFODnyDbz2
         DcuXdWWiD5RA44ydL+izM/ScB/OeLpDjM/f9D4T1T1N5hhgMrabhjcVa5mc6wO80UNuw
         atAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sH7suoulEGbXb6HUyxR66b9Kl139W81dotKBuuxFi4g=;
        fh=vEF0EyC7T8cYy1rAiKc3642X245prQjtwT5HGawrHV0=;
        b=If4/DZiMEf/Zsa761VTpUlDZ9fKRjRRatoRA05hLRqr3ND0AlN1CnOArHUtEEILfrh
         deKeAMXmBu5wNWTUC46Jcgtn0U83mZnqqw9hruzxfCMsGSjBeHSqQGs6/jbH6NrRcGhY
         dhbnkLdiyAvmUAoBmygVanDsId48OQepyuZI6GSIz10IcHU3HTD9ZX9lUYS8duqlXKSq
         6TNomJNUKE3G0Q36kvefptP4T3tdxt9Mf3LBIkPSvhoy4ZQycysH3FSFPOKQgSTI5DrA
         tvEbZHzzdFC31S48bN/l7DU82Hka2uTlp3t1n35hwW/STjoRjtrF5gUFy2Ye7VfeWmXx
         ecZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790869214; x=1791474014; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sH7suoulEGbXb6HUyxR66b9Kl139W81dotKBuuxFi4g=;
        b=UEqRGMCS5AsPC7sL+2qEmCipuV+jRPfhMrdS5BLxrRjr/GNLH5IUNO+kj9BblAf3iJ
         PBeK8KCcuLYo+25shkMuH6zBn2GSOLHOkUem/Wz+zQXGnbu0fCiouhmv0TnJ1ggD92Wn
         qThrBpoLn/CwPetyKpz/O4TOFHR0bstECNbGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790869214; x=1791474014;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sH7suoulEGbXb6HUyxR66b9Kl139W81dotKBuuxFi4g=;
        b=pzuTLE/sUAmEzvsP6IXqbOyeI01VEPl5BBxjpdXzPuzL3aXU2n8u5AaC47to1f9j9D
         rRNmijrZDjr8UBBE+QWUC+k5nv+Z/qKXeNQsSwozdyqWnw3hAenfb42fT4JD8kWASfBX
         ZOIsapJ2+qc5Q/LhMNh9LsTsgdz6FFon7P4XKla7rllX5q+sXhmg6IfAD5w2qpDCI7Z7
         oxudp0Ck7AjTeXOMom7BSsAdfAxBi0eRAtoMDmJUK8/U7DMfAPoybPUEZJjthp+OK4mw
         gPqM+MQQzPNl8dh2M4/J4GbuW65Bd3cT2o7OxOCEiHuNv041NsZfzfdJvf7Unq82Wlk8
         5HJg==
X-Forwarded-Encrypted: i=1; AKwUvBzOWfAYGGHVS93m77jKwru4PahgLNasbpyStWXU4VyYKx1/wa4tcNKG+7eP/Y0LpxP9z+prA3ctfyvWkzw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIIDeJP01R78a6gX8Jj5tT2zMQl4WaD4dq6y54ZjEHfPIVZAFBm
	Yqqb7qehLGKwilXBa2XE7wi+ja+6nwCZghb1vxgKZr6k0/qT2V07OfWA48X75eUacwDQM2VKVGd
	56ZfnOSl7BDVoBBntSXgZEp13s5/4cCjkMwUdXTH7
X-Gm-Gg: AYBFou1eRilJ5/bY1Z0th2Cd1UrPXCPz9FP4nYGOSanmZZT91Ouq8tD5V9zlml3v5hZ
	0l/rZPMMLP6RyIGPO98XjZGkyI0gIxPVI1HSGC/g70JqVBoUgdgJ+kGSpID2HuLsaMstogPFCM/
	NbHEAKkqlCeHF5K1lpXmtgt5RPV+G0lQzdJ48qj1ExmX722JI/FK9Vj/ghq575l2rRQse0fMUQN
	grK1JId0A1ImTxLX6oRO2VRXkAlbrVv/fYsc0EurnXaSBTkJJEjEOBbMSa2ONSUOh6EmX+sQ+Zm
	UDj17WdLZLK8QH7m/f4TMzNPhHmwgBzntBONIqwgvELTI9KcANbxis0FlZNupBODsRQlmNf6fBw
	Q/QkrF8E=
X-Received: by 2002:a17:903:19cd:b0:2e2:b00f:564f with SMTP id
 d9443c01a7336-2e2e4a20259mr42758525ad.18.1790869213794; Thu, 01 Oct 2026
 08:40:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917204209.97699-1-mhun512@gmail.com> <arpa-Ps8l8LOwbbx@tzungbi-laptop>
In-Reply-To: <arpa-Ps8l8LOwbbx@tzungbi-laptop>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Thu, 1 Oct 2026 15:40:02 +0000
X-Gm-Features: AclHuK-ph787-_ubenGMoiVVddecDSrjn5jG0cc2n9OWoEqyfW5NTQ54A1U_4YQ
Message-ID: <CAMMMRMe7g7yj1iOTOc+TCWe=+1cjFA1rG7H=VfjnrY3p7XCKFg@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_typec: Stop altmode work before
 unregistering ports
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Myeonghun Pak <mhun512@gmail.com>, Benson Leung <bleung@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Jameson Thies <jthies@google.com>, 
	Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 12:18=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.org>=
 wrote:
>
> On Thu, Sep 17, 2026 at 04:42:09PM -0400, Myeonghun Pak wrote:
> > partner altmodes. Disabling also prevents a partner callback from
> > requeueing the work while its driver is being removed. Use the common
>
> Would the work be scheduled even if the driver is about to remove()?
>
> > diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform=
/chrome/cros_ec_typec.c
> > index 50a68819ceb7bbfbd888ca919d678d4c75237c26..e91bbc219c077067294935d=
d5602c1aec636cfa6 100644
> > --- a/drivers/platform/chrome/cros_ec_typec.c
> > +++ b/drivers/platform/chrome/cros_ec_typec.c
> > @@ -378,6 +378,7 @@ static void cros_unregister_ports(struct cros_typec=
_data *typec)
> >               if (!typec->ports[i])
> >                       continue;
> >
> > +             cros_typec_altmodes_stop(typec->ports[i]);
>
> Shouldn't this be called in cros_typec_unregister_port_altmodes()?

This should be called in the very beginning of cros_typec_remove_partner(),
or even in cros_typec_unregister_altmodes(). The idea is to stop the queue
when the partner no longer exists.
Partner disconnection rather than port teardown ought to trigger this.

Thanks,
Andrei

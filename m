Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC313ABD96
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791791164; cv=pass; b=NcGyHSaTNk2YZoED47KqtU5fqtrLNk5fI/a5M4cJNrvTUjI8fo1+9pN13zP0CxqwGRLPfnH4YVv1ojT6RLl9jMHQIjg683l9/3HyIdyYzTpDS5PM3jDXK6gjpFTGl1tVm6yP6MujINnXBW/gkskfUHQ47riplaTiKNIQcn8U7q4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791791164; c=relaxed/simple;
	bh=ZuWBrEbl5jdqQkIyUX9QwQqUSYsQNYYyuicWJViKAsE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iEuUyAeERKM72wIGEHjqegN/36/FIotE0QY7IepVz/bct2/zFLIk1iMCYdoo/fKwtdQSVj39uP4/ailOyRIghHBVa4AkCrHnNzCnYBnc983CsFzhYReOEtwluoRfZbiDCUD2kRgpA6vQpUky5t6CBRuTyzhefmaskfyIcse4rjA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fF26TUf2; arc=pass smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fF26TUf2"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8935f42e8f0so477953b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 00:46:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791791162; cv=none;
        d=google.com; s=arc-20260327;
        b=oLmWdi1IQwQbh+ZT/S8yLCgFZjQjMHUVDXvepi1Q/Kigjf4jRFrZo1mAVdG0DRvifP
         btk8T4Wt3mWqTOj620TVltMAnxhuFc1yAUNayWSQEqDFiATQF4X+eWvp/sAk74Cv3avs
         6jMSOkKf/tae3nyRQJYSAhQffmtUK1CfL87SjVbOjNMCq0x6g7KcGCv2YyY0wY02ji8A
         wPREOgGYkfE8U12pnWvWnz4QmVW06nEzP835oYW6G36C5V+T/zfsfCwu05sjZvyWlxV1
         R/xuuvdmcnEHnbTT1UkZbyqLxNZYvcYi9lZGtDpXTZ36m1vbScFhntRz8vP5FR1W0Ix5
         ttrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZuWBrEbl5jdqQkIyUX9QwQqUSYsQNYYyuicWJViKAsE=;
        fh=uim8GQ4EGPEysHdxuXERM8hhsHWsd8dOrlxEmp1ucnw=;
        b=PExVNNJSVoOq+iYEWFEoCDjPnr9Uis6IUJ9CZ9l4zSiF6q6UpKlNEZeJOH6pTJqb58
         WJpja2pgaiZq+B5uO5jNx7QwQXCvYW1AVA6s++InaExSBqJD/GA2uigsBaxccFBCBjpT
         Tieb+hxXYNCM2VfCHT+kHGVdbaEymEadmxY28o+55SflWo/F7Uf8tMHfdgnxlO8OXGsX
         fQflbQmnLIU8qy/VCfFpVIhkmWqkn2TLVwb/FROgC8ehF2e/vyBKI2O1mx9Zt0qqIqM1
         MfNXp+Rwo9PRkhDYAA1azZ6Z2Myicgh5MENSE++eh3lyjuUpIuFbLpPN5Fztzcg+CfJ8
         acbA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791791162; x=1792395962; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZuWBrEbl5jdqQkIyUX9QwQqUSYsQNYYyuicWJViKAsE=;
        b=fF26TUf2koF29nK5bydBNUF9POvGn62O+OyV/4pu9jcPMCC10dm9SgueTDMByD39A0
         xVBRQhp3kLHrvMcjNMRxqE4K3jBF2oEdwYuLPEQGWZsgxNOeR2j2tQPkTvCsNgbI8Wcy
         nHSCPkA+Dwd5dMmCyhdvQmH8j1ec2THMKV0nggr4oEBuEYJlNcCJpW9MUjfG8zssGoBA
         km9MIWDMLXkcut6+nVyQ4UIPNhJGhsrjB5IsCKfh8L+9XKj6GrsZ9AsEDMSF4oIJ9221
         /ecitbrr7s4yIWSbR/kU+LOb2a6Fh4SvQwfTQ5l52wB+zccLkMVgaYrViw2emEr6VKkk
         N77A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791791162; x=1792395962;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZuWBrEbl5jdqQkIyUX9QwQqUSYsQNYYyuicWJViKAsE=;
        b=dq8yGt08IYPdWSe83kSmIfmFI6NIss1+AWwugMBwdJQz7RQB6YTSnJFS+DGhEJzEL+
         X9Eap/tyq1wrNr7Iwctjsuox0mEi76BUBSSTuqwJ4c40oF+UdrkHjFPrmiQeXdHLf0Oe
         tRSG7W5QwCwvp5Igf5dCutB2/Pk7G3Td0V3vM7ir1aSIfX2OENC2Tz2zFkSI31ulkkFv
         x9H9qEg4Egd2tdvY4RD61gnPlPj+fa0eJFvfHw4Bh3N0dVSVjHY+kcWqNM3tasTvPjdX
         gUX+V1AvfEGFTg9fruGqknpBttE2e75+vOVKz26eaUpdUofcnDshhBfLlS3W2Klf1ybC
         z89Q==
X-Forwarded-Encrypted: i=1; AKwUvByxdO+KuqsbRd7uSvtlMpTq+IcayfS9rcQrtobodBydiOOaaaB3I2jwiaZHryOFiIjvnhmoeepxbaFU1hk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLy0c+DcbdKqvx/Gybkvvh563SesAV1PmBE5c4/7AJy9Jjh8HdV
	Aon5pL5clHq0Tb+1j5A0UEO+ZAdHviTjyae5l5NJS+wl8/eQvW+FyG1IoGh2biJ3ihKlzi1VvFv
	k4ZTTMHNNUmYFmO4s8ULhzSJQwMcoqV0=
X-Gm-Gg: AYBFou1m2iDwNCJem9afQR5XVGHYrNoSyNkt45JWGa/RLGS9w1UBIrXlDkElpCfRnxO
	EU8BxjR85gaiolPF8OhQGQ6/w8UmnthOBuEbvfdSpaLDkNmwqUuFzH7x6EuzqWJgNDpWqjfl+y/
	kT9/Tx0tyvfGKVLgLTVP1yQuz/+8CbDQIMrjvy6meYIhtAGtu5keyGRtwS1C3bsneTS14jZiSO5
	7z89QBCnDqya/mBLW+tCUjMDBFkzRwrWETJXHnCfk4cdIDliPWtskbtKl1Ie9kuOoHLp7puze3E
	VOgefcY4SwqVvqOqxbExWyZaB2MIunf8q5f+5K740nqToQWZpuSSX1wTb5tw2ZwUovd5M9hbwez
	iKup0ejz49D4QslwsV0vU7ATPFpEfr/mRHHlGiW4VbuU+Wb6m6Cr8voUOxM86aZX0aw0=
X-Received: by 2002:a05:6300:83:b0:3e1:482c:77ca with SMTP id
 adf61e73a8af0-3e16bb73c5emr7893611637.5.1791791162214; Mon, 12 Oct 2026
 00:46:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011221350.1690703-1-aliamemis@disroot.org>
 <CAABR9nHp0jL2fQ4w6rkd8Avfj9eD2=05TnxOYeOqGDWDqD=9jQ@mail.gmail.com> <877bjniedr.wl-tiwai@suse.de>
In-Reply-To: <877bjniedr.wl-tiwai@suse.de>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 12 Oct 2026 14:45:50 +0700
X-Gm-Features: AclHuK-Q86C9Y0OI9UGDfKzaTjtWGzcrWp2NkSpn4NgBhSFI1e7NrtpiZ0nLAMs
Message-ID: <CAABR9nFoYG2kGcnKvcp7VNG8FDjCKScROLqYjsDv10tAqGttFw@mail.gmail.com>
Subject: Re: [PATCH] ALSA: core: Use the allocated major number with major=0
To: Takashi Iwai <tiwai@suse.de>
Cc: =?UTF-8?Q?Ali_Ahmet_Memi=C5=9F?= <aliamemis@disroot.org>, 
	Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Takashi-san,

> > Note that major=0 has never worked, even before bd8f21876189: the old
> > code treated the positive return value of register_chrdev() as an
> > error and failed with -EIO. bd8f21876189 only changed the symptom.
> >
> > So this patch adds support for a dynamic major rather than fixing a
> > regression. Takashi-san, is a dynamic major something ALSA wants to
> > support?
>
> No, it's supposed to be only the fixed one.
>
> If there is a real demand, we can extend the implementation, but I
> don't know of such a request.
>

Thank you for the clarification.

Best regards,
Phuc

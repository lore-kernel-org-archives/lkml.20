Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171C83F58E9
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 08:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788338824; cv=pass; b=kM/DfpVzu8Xh8smEj0oGCS4wV3ixHf0ueOVnP1gjlwNxtLqgWVAUpbl+CErcRFqlQMaxgDZkAUxCZmp3eN5uf2ZzMKabnBchoN2eIwpvBkMHzb5qFQh4fT8XAhe8N+qc1cmX1w8nseHBvYa+56Vf1daThhv/KuYtWlib0KXnxQ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788338824; c=relaxed/simple;
	bh=shO5HETr5DbfaWXJI1Q4VSUgAkN/OetfPGY1PI6GuMQ=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X5Eehwhm6TR4AojLlvaQ/k8d38Q+AsgE7kFB6ITZlbiMw2oKKYgIoBVUPzvflzn4EF0jY8xzX/AWFxQnBct5/T1jix6CfcAZU5C9xOPJgqpJSDZfB1T/oVnn7279Pjo8/zyXBaBJ4ozxNyvpFP57VeUE2LNYqyYnK2nv3BCSib0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ohKzGM/J; arc=pass smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ohKzGM/J"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4ab89cff9c7so279176b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 01:47:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788338822; cv=none;
        d=google.com; s=arc-20260327;
        b=m4ERshmTc00yDAPWFoW2c8ZCt+DTn1eMG8szoCPlf0i57oNUZXbXtjXMhGGgB/uhIt
         xaTJ/tnom2PfEnRiybpaRq506rS/4LTa6SjTqxVMGxIX9dE/3aUPc/9bfIRe0ZLG3pN9
         Je4GZSjDMjpwVqHoaPBsO2sLEbjVpmCZG7CUfxu4o5VDKu4mzMKlQq9SkkNrOM+5V3CH
         bO3r7DB/V1fIJkDMGJ8PHCrbRw58O0snY2He2utDDtSVm07Zb4/3HIG5wojcxALcqQZZ
         2vBkosf/CywiJkKDMNyspiRkwcT120ANhtpZ1ekZk8+VprXOM1oP6d4URN9tJXgUVFH/
         ioIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=cuO0Jr/gtOURsAL8f5kx9fAuPpQ07Nu44mKm8vGuGkQ=;
        fh=tErQvF/0LQlTemQJYH8T+lCnkJz0fhvAIIsKw0LBCPA=;
        b=kt54WTE5HMBWBgWCbbLZ6B/6hKr387XFDLQVaY5vCldQBrXklYRJXiVlUO/YqGrfkQ
         pvZzw/kG6DroqkpL/j8OtdladP001Hb4qsPCs2P06dQQ3YqAmbI38m5XVz+hRk/J2Dlo
         O8uR9OMJ2KEbemyrjI4iPyBnzT/KgbpdjDyoawhzyDeZrQWUvF7GXfd02ML3qF74EKk6
         99HrEtkZ6z5gWxaHJ7xVYuXAXRP2dJYqXAmma0XWv+k4/ZL0jwbQ9eBXv34Jhw7ud+eU
         5Ngo0PmfkjaEmorjtsHvbQ9Di5zsmijKTFslhk63bGhXPNvik8IaAGq3zdBmyn1OuBYD
         O2FQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788338822; x=1788943622; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cuO0Jr/gtOURsAL8f5kx9fAuPpQ07Nu44mKm8vGuGkQ=;
        b=ohKzGM/JNLc2nRmC4KJjEyPk0O4fyqSL9l7dUL0cn3Kv7xIidA06KC5irbrrW6m7JR
         E08QXvkkX8QeOs6arIbCPkgASwrTn0dxErnwZ/Q3PffJbfkZjS4JGM3mGk/b20Lj9K8s
         KDRTAxB+N1eVq2yR4qHQ6UNxv2VNujGfKcQhVChzUqe1zRBonx5zpzLS2OEj2J8DSXGv
         plHgUujcl6OeHu6K0Dx4+VoXIxrKdX4wAcCmzHR98uJ3eTEWBfjeyC7EsHkNCBWNuCyo
         X6qGf0JKSDk7EomgG1yJ5Gnj6q9NWWR46UIi/1vGA5sDE3khmrv/WY4VRDGHwRS+1WMT
         9r8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788338822; x=1788943622;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cuO0Jr/gtOURsAL8f5kx9fAuPpQ07Nu44mKm8vGuGkQ=;
        b=Gt/E67LnDe/8I2WLtKn0pouQworLKPuN8O8yPqqHV3yUkR4HSz1dLekSYLMeVMNmpk
         7J1mUPiY+u3GTEBQzYKWORVdWybUQtd8i4M/GWd0ay3WHK7BpOBBCjuPN5pp5XPnlIY0
         JjLUtgJEyEwaJx0G4UxJdN8lHyM8IyiQ5Ck+/IEN7EvtF8ECM30AB4DODI/Y7pQULOnO
         vsl3uSEgAeh7Eezv6xJ0fpR6dexd5ZmXz6Jx+Y5PIXV7Lxlg5h1/PUS6lWmeoNF+F4ae
         ZZjy+wgFKG153wvL6/NIwLKYr6OD4jFWVLcq23CcmRtXWv6E24foNykyPCZQukLnl9Tq
         HzMw==
X-Forwarded-Encrypted: i=1; AHgh+Rq2OuXoMpD2Xb41nAzLSvV1dWH/2kJg6St5fzNuod25rmoVN5J3zdOXX5bMtMFyc0I0LEujDc4U9p+GAgE=@vger.kernel.org
X-Gm-Message-State: AFuF++lHgrRv60pw4BE3YScoxxFmECVi1dqJlFHFBc1bDYvFXPazc0nO
	e5n/LwelIRAj8keCE60UYegL1w9i3WrczjSQS9oVG/ddfTgZJMBOMY5qr9UZYBJnwlBhiqXVo5p
	ra8dsIfbZq0c8uEp46X+7vJhj9Bsn1T8=
X-Gm-Gg: AR+sD10prCHXnDzchV0ZDHhqI695PYhvvwN44uhOeLZPzgJ8rmAxZr+x+vcKrO5UCsv
	GUOsc/aU/449AFwprimL1/cy+GH8WisROfey0dG1U5zg+Z7N83Q+NpzjTLGLeHhI52RR+4tfCTz
	Vwrazh7M6JskYZ84qBasB5gp+O9hn2eKzcxA+f1Iiu9jG0oKMUfqda5xZhYLHcO4TTAk2O1EpW0
	+wchbuVS5sreClGc96RGlVcj+4Ce/rRTa/TxRwWPxdHy/THzcA8DwOnOKBhtB8s/epepjgljkM5
	MyTKl9cg2tgJn2k5m2kysTVygkL4gTNp5oLeogv7KBNJ45GrJ6KfMzQC1lgKBryP/Si2sxQKEm2
	POOnN+OmZITfkAKISpK5Mk98=
X-Received: by 2002:a05:6808:319b:b0:496:fd2:94e8 with SMTP id
 5614622812f47-4b6be3fff99mr2617954b6e.12.1788338821816; Wed, 02 Sep 2026
 01:47:01 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 2 Sep 2026 03:46:59 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 2 Sep 2026 03:46:59 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <83d7a9ee-e164-4f02-b83c-31be3fe43fdc@intel.com>
References: <cover.1788286335.git.mauriziocasciano7@gmail.com> <83d7a9ee-e164-4f02-b83c-31be3fe43fdc@intel.com>
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
Date: Wed, 2 Sep 2026 03:46:59 -0500
X-Gm-Features: AcwNN1WJRSqNP6P32x2PdKxr7ToQynIucjZmCF2cFtsls0iFeuILKt6LVe8i0Fk
Message-ID: <CAO7O_xi3Zrxc7exqP__Ua61dZUF=OpNvi6WLxc9A1sPG_z66kw@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] ASoC: Intel: Add Yoga Book RT5677 support
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: liam.r.girdwood@linux.intel.com, peter.ujfalusi@linux.intel.com, 
	yung-chuan.liao@linux.intel.com, kai.vehmanen@linux.intel.com, 
	pierre-louis.bossart@linux.dev, perex@perex.cz, tiwai@suse.com, 
	jekhor@gmail.com, linux-kernel@vger.kernel.org, broonie@kernel.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Cezary,

You are right.  The statement in the cover letter is inaccurate: I
conflated "not revalidated by me against this revision" with "not
validated on this hardware", overlooking Yauhen's v2 report.

My testing covers the SOF path on a YB1-X91L, including PCM0
playback/capture and PCM1 deep-buffer playback.  Yauhen reported testing
the legacy SST path.  Those are separate test results, but together they
provide a basis for advertising both mutually exclusive firmware paths.

Narrowing v6 to SOF only was therefore an overcorrection, and the wording
made it appear as though the support decision was based on guesswork.  I
will restore the dual SST/SOF selection in the next revision and document
the validation of each path separately.  Yauhen, please correct me if I
have misstated the scope of the SST testing.

Sorry for the unnecessary churn.

With Best Regards,
Maurizio Casciano

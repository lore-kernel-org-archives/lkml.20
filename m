Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33AB364EB2
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 18:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787940192; cv=pass; b=hNYearsfVvqMfHIHzhnO1+nnZg1UM1Zey7bp/sjlKa9PFkPynHsW7QFCt/TBqQ0LwC0taOsGOVzR88Qk9i5JJskzl9/c0iSmJoYtEA0/m0RvaSVQrWsf3uSWVRrnoPoMW7sUjk2mxhNZCD9unBLtx/7olNL/F/Emx3+xIxdT+LE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787940192; c=relaxed/simple;
	bh=HZJ4KFJCNvxcVaZ6KpG+u23kPFlQxY9eS45knuNoyw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bl4T+qnk3nuZayDo1yitO+DHhQW9q384OKr43GmU9jEzp1BeEYP6KMfytsdHcawLD9l0wfLa4bPsZwHMuyzqbn13lBuN8aZG+ApbrfNqYIU3PHSCINM21JO1DiMADulKk/lxxzlNbCxeienYLEfSQKNNYAF/9Bh+PzDNZQH6sv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=FJ3Z50cA; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="FJ3Z50cA"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c15e2dab83eso217168566b.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:03:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787940189; cv=none;
        d=google.com; s=arc-20260327;
        b=ULW6BSwcssb8xPc+XlXtT3s0lGS/d2iQmmhkI3yhIbNtKFiyieeZnbScNAElXt3PwB
         70PcUnWGZBZtl5PU9dJQXNs1FE6iysrqlXsTTrhzUcyHebjND1bGWg82GY0xkEYaMznv
         tAjKkQI+k1XOHnA7cFFFGUG1uYo4Xb/yFqEakfHjHtLjGJx4/0CLO/ZN2WaGgsHnhQ+d
         mSE8f+oiuKbivU4xrQYxTLtlJQZ+Bhbsw2gSejRtpyO3/Ew+OIHqwwxaoawzguA0UFa8
         0FiTRa5tQL48E1iR10xBdHD57sKB2Byvf/a/pPGRWvd0+NMLsKiTSvUTEVRd/HbPwOLf
         F8PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HZJ4KFJCNvxcVaZ6KpG+u23kPFlQxY9eS45knuNoyw4=;
        fh=atnKP0efma5p1MLiqam9HqcxYTODQbtANZsFuqM4AVw=;
        b=Dd2/Xq2G5GTe9iW73gA3P/JzxDxxMP9rKZYKyQ4JAXHH+bNLC4oK/nxXHeTucXJrby
         F13vzy0k87vpTR3Wydvci1w0Qd7Hoyeb5oKiS8mrp0R5WvkmYw6iT/zY/ZdEi97f6ryc
         5uSQlwRPjsFNnzF/qIzcycHCWB24wBZixbZV4C6JjJF6fUScaT56w15/vKerpnIBSxmo
         HqT6E4Ew00AHoE6lDPMKn49hawVr5rA8yXP8TSiiPFTfPYVC4LR9o7O8yuYzC+8GI2Di
         ly18TQ1h0KKy9gmhBCvHqh6046mWc/6zslHmX2TM9k8qYIHOTvvJqPIu8XDS4S2c888Y
         R22g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1787940189; x=1788544989; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HZJ4KFJCNvxcVaZ6KpG+u23kPFlQxY9eS45knuNoyw4=;
        b=FJ3Z50cAaBt6tCDf3+DO13V+ldDcBhHTo/yhJJ5+JzFHbzBMBKJ4rnn9JHQtChaziV
         gXyFyxDr/LM4VdDdv7N8OfNbVP/iTklV7JoyyJJbjcomHEGwxaE8OAXzowIL6c8JO3iD
         JikBZzd2gJzC/5mcQVD/OJ4pfrAHGf+izfChUdXxim22EI91+PHain+7uP1iQiMGh+fI
         DIpXfw/33YXMRNeQsQPT/SeU7T7Yw1jrO6pHFslxPyp0ztPPRIqZCer2nfpEcE5zno+f
         53RW14Av+BZEIaQmUX65PBDI0DaN8rEtWtzU5J7pZfq6x0Lr6ZAb4jzx2I/Io6qfJl7U
         u7vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787940189; x=1788544989;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HZJ4KFJCNvxcVaZ6KpG+u23kPFlQxY9eS45knuNoyw4=;
        b=iUQQboHqcI2C8eUhaetDFEy1RsXI2P6T5wRxPxCM9NURLC+oUex1OJ7EAJh7I+LiO7
         wJB8sdRnx+fXvPqII11yURLNVwGh4hjx9cNMNL6ZiFtLXxzY2h+T0Ypi0jwgqSTtptXv
         mtRbf5FdV+HZmKd0C7UGjjEG9Gf4zfDnJhGn4BKShroFcQSLlnx2PPk6OoNzAMrc9nm4
         +8lNtUxyb6iUTy8KJRb5GEP6oZIqn8h+93rZYLlGqaxtpuC/jOB2MkdnyOTaeZ+OujaC
         jsHsOgmHL+iIxoF0MTsAe6dhBCWdg2+FQi/BFf9WHseozf8A8EBbYfen1jrO2xe79gaW
         it4Q==
X-Forwarded-Encrypted: i=1; AHgh+Royo6GsLgobq02uwn9BA8SHi2QQsKAtA07eLll+hdCRVt36tzbghyKzwb9RjjMzEbZbXTzK65s1LmoFdAc=@vger.kernel.org
X-Gm-Message-State: AFuF++mXTB/5T1LDRuDKKE9c+bxJtF9xOLV+TENCVWkPSMUeXlm2c64Z
	Z7oWM7MimWgikOrCcqdrUGOSk2DYx+LbDI/pZFU0CHt2CZXfKSGXT8ndm8JbK5Ew6lRTsY2B8vK
	VlIlp8HV6MFZeBGZsT4IumfP5Te/wvHzaWQeO/QVoCg==
X-Gm-Gg: AR+sD13M5Unw1TFv1uvIdXZ3m7HZ3Og85mqzkT+9eyf5tpuNYCi2rgYTnPEzUIVTG8o
	+shkD1R2ZWfnf6XnDkPDBJ6wGggIMIe1nRXljgMF3aCp5afZdmtN2BSGDKwX7yKChcNYuzniO24
	Bc27qQj+1fwsIN2QF9lnuiQt+e61RYbqdCbsK+soZdkx9ZkOaYC4KiNZ856srsTK4Dbowl1vC1E
	vYJ+SeRmFCPtLohQcYcJM4zLQtEY7l4zZ3Ro/Q+Dfzn6WAPG1zfUaTIOchQCyjqizDWVrIV08r3
	dhmGamadkc+b51IdIlP9hll6RrIN7m+Rai2JoX1B0/jfUiV/jCEthqzxdX6AoN83KErDoV23lg=
	=
X-Received: by 2002:a17:907:c02:b0:c25:4612:2efd with SMTP id
 a640c23a62f3a-c2557167f51mr626602566b.9.1787940188888; Fri, 28 Aug 2026
 11:03:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820071217.1663709-1-kris.pan@intel.com>
In-Reply-To: <20260820071217.1663709-1-kris.pan@intel.com>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Fri, 28 Aug 2026 20:02:57 +0200
X-Gm-Features: AcwNN1WKHETtPJqJWAnPMkKRkyCmiZkYmnuuXh7YojNdn47hgYmFiIiJD9-rH0w
Message-ID: <CAKPOu+-HdT7S-aGtVVBvV55FQPMSPn18=n3Oe7XaxwUBjMzciA@mail.gmail.com>
Subject: Re: [PATCH] drivers/char/mem: splice the zero page for /dev/zero and /dev/full
To: Kris Pan <kris.pan@intel.com>
Cc: arnd@arndb.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 20, 2026 at 9:15=E2=80=AFAM Kris Pan <kris.pan@intel.com> wrote=
:
>
> Commit 1b057bd800c3 ("drivers/char/mem: implement splice() for /dev/zero,
> /dev/full") added splice support to /dev/zero and /dev/full using
> copy_splice_read(). The author noted that this could be optimized by
> pushing references to the global zero page instead of allocating and
> zeroing fresh pages for every pipe buffer, deferring it as "an
> optimization for another day".

Hi Kris, thanks for picking up that idea. I'm not an expert on this
part of the kernel, but with my limited knowledge, it looks correct,
therefore:

Reviewed-by: Max Kellermann <max.kellermann@ionos.com>

Just one small thing: you copied code from mm/shmem.c; it's only some
minimal boilerplate, but for my taste, there should only be one copy
of that. But maybe even splice_zeropage_into_pipe() and
splice_read_zero() could be combined into one, as there is some
overlap.

--=20
Max Kellermann
Principal Architect
Hosting Technology

cm4all | Im Mediapark 6a | 50670 K=C3=B6ln | Germany
General information about the company can be found here:
https://www.cm4all.com/impressum
A member of the IONOS Group

Received: from mail-qk2-f4.google.com (mail-qk2-f4.google.com [74.125.230.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D98199E89
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.196
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789711866; cv=pass; b=TZYt0vKpb7P4lJ5wbdTLP7cILhffjHhUeu2KFUzbW0/VjH6xCW6pmGkpcFnsioL3hYID8UuzRAhOumX5bikke6MiWT8qoANdEs0/t8dqfKo/LX+PDeVxD9merRPLlMBoqX/gcZ8fTBOMiIp1PXU76Dawpxwjg88AV6sD1xVzsYo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789711866; c=relaxed/simple;
	bh=Y5DOaQQkwS/baVgEmjn+dCkjh985yclPojtHovAoV08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BUMWz2FM4OMK5+1cz6SAbiM62/Ka08UBhEyKzLM4IC+4wCjEl8xD8WsL0lPWhtu7FHjL70UohgLKC+jsH9WMeBFPt24kTkfbisEZzN0U8BmJEvU8TX6Ea5Kz0kEB5camqIGTIkmSRipT+zvYAv7MCQhoKr5iMkq+8iu4KTT1xFQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TQxKGMO0; arc=pass smtp.client-ip=74.125.230.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TQxKGMO0"
Received: by mail-qk2-f4.google.com with SMTP id d75a77b69052e-530e4e8c32fso3296281cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 23:11:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789711864; cv=none;
        d=google.com; s=arc-20260327;
        b=c5Yny4tqiYrKaR4717AAbzXJOYkQrkSYkngZp7uD4AKDhg5A9//FBO/lBw5R0RL3kX
         cskgKE6LOVEvS1V+NcO30MiMQj8Ty4B4TjBX5s8Dgg0m5nuyj56j/fhCcd0S+Nharusi
         x8hLLInwRBwKlNkhlNjtE4Y0zJM6C54Y9Z4SqmC9IPhFK/x3itSG4Sq6FCqZshlo+YQ8
         D1PmBH6o2s3svylbgo1SOr162MVC488vnKYI+2sLyQZkcqjPu79nqTfDiuvEJle+A19N
         ePV0s9nAJn7Y6HVdZKREntvXWiyYvon7jV5yTJVBw8xjlByenvfNZohXIGBy1/7+8Ntn
         6aqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y5DOaQQkwS/baVgEmjn+dCkjh985yclPojtHovAoV08=;
        fh=BSzdbi/KuePXzZqAb6kxeLcuw+qFUhCwN9MIpNfJKpg=;
        b=MPBWLqX1C7PSqKfw8PXX5jHO2YL2LVmQJDCOAko8ZVe//zTOZ59lGFA38vt5Cr5QZ1
         9n4ZzcANNuBEfetR/EsD2ZleYoWJk2jk4IA0xaum7B3LgsZa5FsMAj1fojcEt51OWXdd
         FwIFsfr9XpmTUMgC6/3gPHwtbubcHQa1ZBpllpa3pKqN1U1iBQlXCn23Il16oEJZWBVv
         WTB/JXtKB7AqSf0JFqDHLwglpsF0wlHOlvhPcYbW5fT7nnjkoM8sW9twFbGfEaG8LOH3
         +pZo5XZQXhG3dby6KvYS+aCOUhLUf0a2pk0Y2uGZLws02yvmHu9g7BL1FjxDZPGxIij7
         lKEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789711864; x=1790316664; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y5DOaQQkwS/baVgEmjn+dCkjh985yclPojtHovAoV08=;
        b=TQxKGMO0atuvOQFK5gcKYkCMQkLOtE36lUjQXd5z4VrrRPB/EhTDuQShcGlQiX07Az
         9G7V/358ooBx0MNXIBl07b89VdrYDy9M6+8qcJ9Y0KnfloZohkT4/IhvhHi+u0iBc363
         TQ1/E/UZ9IBnN3GjA+FnHCqzOCfzFdh4Gh4pysM1THJQ4hwTC1ocNNsb4uEoXbvOINsr
         twQD7d9Gd0fKt/K12GS5FiZFqcGyTvCrFIfSSNmTHqgdOY3JUsXDeCmp3FfoMpTJeWWc
         Dlta6kIkBO9dReQB7f4dNJ1jfpwatvqP4TidkJ12tzOcez1YhZds88bWhhhxXRBNPfot
         0moQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789711864; x=1790316664;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y5DOaQQkwS/baVgEmjn+dCkjh985yclPojtHovAoV08=;
        b=CYT2VyvTV/oOnMxrryssJzXfhTfMLz7ddh6mT2ucapHhm+h2Ceoz7dSbEO8a0QGLmk
         bTZa6fsuBgzaWtpgkEBCppyw3aONagjNjZcKXcHOfD0nRJX78G0Oquklikgzlc62MXPn
         i8vxM3ZeC/n8p/vG5xuvhpBl1gjS6WsOAyzFwB2fM9jNRuASiTXpD2yxHJYE89vJlO12
         C9Kw5mbJltDUfOXqZukaWLHaAAtjPZIlmrnX+2e4D7VJTuA6oBeRc4+Aai+oIkSjylAv
         8zBYFp73GMCUY3UaiAtJnqj0lu5mFD54JHxMbMTq5qPA6SQnH/hO71PuMbXGRlqInL/7
         NtUQ==
X-Gm-Message-State: AFuF++l3Nij79zWwGGO3d4PSyQkRUvINHg/mCkh154YR2fEsOAwVnn8t
	zY9OfuQOA1rv73Oku1k5kqktsHYP49jJZcW5KNLM7LSuf66athSpWNhZE1PzilQJkcV4xu2TCGn
	w/x1M4fH2hmyBADEHcEMERc1qzKD5zRT9FKaRIRFHwQ==
X-Gm-Gg: AYBFou1WieINmAaG/txLkrX85bK24EdO9PUX7dk4V4fO0mGQ2tr+MZIdOYksaQbJDxq
	8TxtrfODvatvHu7IsrqYEIRa+eQjkYd6aBJ3eqBtqiiE/bPa7VNnbeIHjwru9SCljjZQmgWpwD4
	oZ6eo/KaXghUlOjz5s2X0pxHrntVcWiBek1sg1nrFBKbT1NQ05uo019hmGRFbmO7HpMvu1b4DHv
	8w7rNIwhYPFSIw0U2VjxicQMDBtp99EYR2/M8ZhgAmirB1oC9R2C3dD0862sVi+y6tym53UskH0
	e9uzU1oltJV/QdWJvpAFUkR8eIoj+nd9RZ/0IZhRHhIniRBCFlFHs79jU/3CsSCR0BMmDFdKx+K
	STyfzWc1KMaYQvmCn4vX6QUnHjb8II2I3eB4o3eVq
X-Received: by 2002:a05:622a:34a:b0:530:b2e2:d7db with SMTP id
 d75a77b69052e-5329e534487mr25073371cf.54.1789711864186; Thu, 17 Sep 2026
 23:11:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505020642.53219-1-enelsonmoore@gmail.com>
In-Reply-To: <20260505020642.53219-1-enelsonmoore@gmail.com>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Thu, 17 Sep 2026 23:10:53 -0700
X-Gm-Features: AcwNN1V5ck8vVAhYEOZUKijhy3ElL1AQgeoGqSr-9zRScTzqo5cS42E0-IuPXZE
Message-ID: <CADkSEUjG53YjpW0Wf2UG5O8c4GrqTBz2728Zmp77fj8VMZitAA@mail.gmail.com>
Subject: Re: [PATCH] pcmcia: remove unused vg468.h header
To: linux-kernel@vger.kernel.org
Cc: Dominik Brodowski <linux@dominikbrodowski.net>, Dave Hansen <dave.hansen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 4, 2026 at 7:07=E2=80=AFPM Ethan Nelson-Moore
<enelsonmoore@gmail.com> wrote:
> The vg468.h header was only used by drivers/pcmcia/i82365.c, which was
> removed in commit b3c26ea81ccc ("pcmcia: remove obsolete host
> controller drivers"). Drop this unused header.

Hello

Could someone please pick up this patch?

Ethan

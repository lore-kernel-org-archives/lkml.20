Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BFD3A6F0F
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 07:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789284513; cv=pass; b=u/4AUgOZX6vKHriVLgMYrx1DZG+C0NJnj2oyzeArLDpAinl2nE1gynLUEnwyFvN40anwN4LDK1MzhoG0l3o3cwcZe+Kwc4I/bM4WBQk1R/yqi4QD0dyMOr8LgomcYV9vtV7Gc8smV6RJSdGGO3AyatKCaRsP5/HxMDqDVnZA6Ew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789284513; c=relaxed/simple;
	bh=p2soD2Rf2OOF+LUQb8CpDj5kTsG2MF+pujWfnBktrnk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NjTQODH7V68uFP3cy3NV2yq2XeukX01E787+H9P6DhK7UNaT25wlLhvl6aVIVaxtB2dc3tt31F8GziDNoZVbKcQl0Kr0g4HjZlkVrR0GOt2nzyHvdM7u4/R4qdeyI/JOsAzuWPriyiCJSAZwpYd/e4Zw64dEGNZ4j5PkETKf76o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ViQrhRB0; arc=pass smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ViQrhRB0"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so2157129a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 00:28:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789284512; cv=none;
        d=google.com; s=arc-20260327;
        b=SLr/8VgkDukZ7HxPFY+Asj4CWOy7ie+QgkfeGXbuWKFlCPB+LlH1FWoP92tyFB3VRn
         2PvGLGcIqL+noRxvcVjdnLkhcWHeDzqQ/Lv1rj9wnsf14mZJ/oCqy2OdKq5IIgV7VMTx
         MSGiz1JBt8kUXwFN5Y173gmovcbpO/oGR4hrLHaURLGNs/RBwnNqPHhsBzd2fwvtp3zk
         27x9aKePWWnxBCQ6P9vJfSn6NzY5A96lrPX/uiMQcf8qbcb8SlVBzrTcp5myRvOJruy1
         ddaQ21eWMna+YaF8xGlkc83siBMd1B08yxB2kbx3dp8WzMUvpyFh+dECA4iapBLEzXx3
         UmWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t9KdgDPH4/QtIY2XZ0YGTbjGCPHiA7KxT6UVJQtqV98=;
        fh=f/ILAW2lZOofUmEeVEIImEkS6CyBgwpa/mvZP8nmxzc=;
        b=tCG9TGHpgv55CWdLN+NMP9H37V9OVhlBUtoQGjt3s3m6XUDqae5AY0eyfikvgoHlaG
         iGajF74P7s17asHadsRskow1mZXGW3hWpALH2nbo6I92jYq2t0JHLDsl2DnM7V8n0dSH
         vmoXEQOCyUY2OBrKLmIs4pkJJFGZm6g9V0fJDvGnlmhbukM0YU2w4LDn243x7v7RbCqa
         RnbjvSq29mRf771fAW6BK4lcrEiyHtqYw78MYOcdEi3yew2eCCQY9q7fZmCFNH4uDgO8
         jlNL7etKPWSfAbO9r3oUGXQ4LUg6vS43diTnKtX34fqR/SilcKiyZHlJIM1no7PRhxb/
         0wQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789284512; x=1789889312; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t9KdgDPH4/QtIY2XZ0YGTbjGCPHiA7KxT6UVJQtqV98=;
        b=ViQrhRB02slxwxYgNDAivKcv2CGHVX5NwhyNfHNuK4rIMbqZEcylply6gVS5WXYPkW
         JCPbxKryRJ/IrIvlsyLxjx/oMPvEqfdUluAk/nZLX93uVI8Ck7fbte21VrNlIiMCSc7W
         7DJvqjg1H2/TA0O5aVwPnJGSQorvde/mMqwaDI5TmyLWCB5yBnsKXMegom3T1dpS8QsB
         n3tz8pC/Omy4h3lUTbH+syAOIZcjbN8FRikv5N1BmfcKTwTwLmYG+s3g9wYY0X9gHBv/
         +Dd5GZssyieK0QmlIvlTSb7LX+B0UktdIfNNtOT1TFRI3E5dHHPlAzlgtR3xxKQ1fwRz
         +S8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789284512; x=1789889312;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t9KdgDPH4/QtIY2XZ0YGTbjGCPHiA7KxT6UVJQtqV98=;
        b=BCFWabYWoQe2qcpu2AuUOq5YjmOGxc6BY6eowD7Vsvc9grDvqqFcngXY0ovXw6e0XD
         /1MW9nP4DbXe5JSuzGZjqa/y2UXZ/gC5hj/jvEwXE1iDnfWxLJI05LGEAOT8ZbPEuUEO
         nB2NQtZql3H282dA6WGCDSyORMULvFir2IiQNr484vXjmBclI6wFZmJWw5KmwLsZQDA3
         JPEE537JsUY2HcomzyugPSjehB7uoYEEn1SicavgNqeQ/aMLSlsE2rOL6Xuh0sM+M8Tu
         D85ku+XQl2p2yDM9qP7wMTZVeasEpLvWkvzY3IXkpUkwo5a1uRqYfwQvuzk66kwid6aC
         Wbdg==
X-Forwarded-Encrypted: i=1; AKwUvBzTuEfJqa3xAh1jiJDL27xSz8uGQ+XvTljCv+aPS1ZdMTBXpzZujkk0ibkJRIy++6xRcfaQgKgJ7x8j9/I=@vger.kernel.org
X-Gm-Message-State: AFuF++nFdffudgnYiZo3C3tSDJkFA3eHCEfnTzn2kvQvTkBHU8ZOZtGh
	QOPlveECx02DWbJPLBT8Ch64kkI8uNShD5JAaMdHcX6gCYKI0zU9cAXtboZ9VbKbwjUiUB943l6
	1j6Xy9UZebvzhRMmyn56VsJlaG3Vzyy0=
X-Gm-Gg: AYBFou2Zzst/wf1eR+s7QYNDsot7Xr8nS3fSwB8IiV3d8MhhyB3mgx5Wa1XBf0GJeFb
	2m+RebtIk20pBR5YGWBZc/thlZiLpTM3lkNqjT2GEJwhnWXrB8z5Efpl71Bpr8eVYbrTwGpbDg6
	RSi+OwjKQDLLeCZYFJ6DJmdpg8NDExiru/vODeMmLVFegOUw7JZsA4xffjwvQId1NbvJFL3aX/B
	+LIxOwzy8z77JTqoKybSqtjLiM5ZnUK9yUAfDOxJOB+YkVUc8T7m98GoM22vCx6pdiw/IYZ0Uhp
	3duL3DLUysfERcaMSaa+ufIznWYHyRAhzJMSx/FUXriSMXXSHW2710qvYxpqAcvY8ywjG32XUX+
	zbkvbOJ99Fzjr8/aS3VGL7MXt0lpRzOlxkxknvePC
X-Received: by 2002:a17:90b:3885:b0:398:c794:ca26 with SMTP id
 98e67ed59e1d1-39d9c3944aamr19707975a91.25.1789284511690; Sun, 13 Sep 2026
 00:28:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820050608.5440-1-kimjinseob88@gmail.com> <20260821033334.400af4d3@jic23-huawei>
In-Reply-To: <20260821033334.400af4d3@jic23-huawei>
From: Kim Jinseob <kimjinseob88@gmail.com>
Date: Sun, 13 Sep 2026 16:28:19 +0900
X-Gm-Features: AcwNN1XcNBJwG8gWKMDEIRzhlwe-EM9NIJU5D9mnXUFN01Obu2gnIbb9GqvbVzc
Message-ID: <CALMSewLdDGApqiJZGdTjKdj7RqLKahf66kjrJ5nRHCpj5p+V5A@mail.gmail.com>
Subject: Re: [PATCH v8 0/5] iio: add Open Sensor Fusion IIO driver
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, linux-kernel@vger.kernel.org, rdunlap@infradead.org, 
	joshua.crofts1@gmail.com, u.kleine-koenig@baylibre.com, julianbraha@gmail.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, grondon@gmail.com, 
	devicetree@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jonathan

> What this cover letter is missing is any info on maturity of the
> specification.  Is this at a stage where merging it to Linux
> makes sense, or are there still elements on the spec side that need
> to be resolved?

my intention is to preserve compatibility across firmware updates by
keeping existing message layouts, lengths and field meanings, including
units, unchanged. Incompatible changes would require a new protocol
major and corresponding driver support.

The remaining specification work is to reconcile the draft differences
on reserved fields, extensions and magnetometer units. I will document
the agreed rules and compatibility policy in a versioned specification
referenced by v10.

Thanks,

Jinseob

2026=EB=85=84 8=EC=9B=94 21=EC=9D=BC (=EA=B8=88) =EC=98=A4=EC=A0=84 11:33, =
Jonathan Cameron <jic23@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Thu, 20 Aug 2026 14:06:03 +0900
> Jinseob Kim <kimjinseob88@gmail.com> wrote:
>
> > Open Sensor Fusion (OSF) is a physical sensor board that reports
> > measurements over UART.  Add a serdev driver using the generic
> > "opensensorfusion,osf" compatible.
> >
> > The compatible is intentionally independent of a board model or firmwar=
e
> > revision.  A fixed wire header carries the protocol version, while a
> > capability report discovers the available sensors and channels at runti=
me.
> > Supported capabilities are exposed as four IIO devices: accelerometer,
> > gyroscope, magnetometer, and temperature.
> >
>
> Sashiko has one reasonable sounding comment
> https://sashiko.dev/#/patchset/20260820050608.5440-1-kimjinseob88%40gmail=
.com
>
> What this cover letter is missing is any info on maturity of the
> specification.  Is this at a stage where merging it to Linux
> makes sense, or are there still elements on the spec side that need
> to be resolved?
>
> I'll take a fresh look anyway given it has been a while since
> the last version, but others may make their decisions based on that
> statement of how mature things are.
>
> Jonathan

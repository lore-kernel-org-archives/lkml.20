Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F423F1AB7
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 18:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788285821; cv=pass; b=WH614KNYZbN1pbf6sPOHZAE4E9EWBSh6jDUUXAg1fRPqP+f+DpnPAf3L8xv9uXzDcJ5VISu1Ll/Xbv1ss3TLNOlu2gEzyLJvXZpEkS18ETMVHePsWR91+K2HliFA0ZhzdGMA+VMDz7ACxCm/ZDMb1hQj5/Qo89W50N9sbFfob4M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788285821; c=relaxed/simple;
	bh=zp3t4ns9rDeXNWCehIDZ8V5jUGovTfPKtzx1minoERw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uoEmPo6+pr3gsrRW2/gl6gbPCVr6jA7Z6Qcpzu79wAUAl42T6rxoD58xyf4UhUF3zAQ7eFDObkFmjUcQe+cCFIZn7BDxjXSu6Po6XgH6PZo3bT4liL0QxUWJZuVbTruxKKwloIxGzAn5C2YJcRVCQlZubEDOdl8g+lRKqtMPExY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VlK/FUgS; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VlK/FUgS"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b4af4be667so59513e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 11:03:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788285818; cv=none;
        d=google.com; s=arc-20260327;
        b=cp8NmkUdmRFqW9BJrDnKVWlSwUDEnhyMkyVXZ2gR6xw2B2BK1yZigah5rCSqWkQ+L0
         H4EyTe8GKA/RXKLBKTJgnTqAmCzTKTt2okKPS7jzBIrRjmJRM3haY+HSev8duDL+2kOy
         66NlKKgxLQOCx9REUIdg70/CPrMr3CyNUQiNisIS2eItHPafR7JusrVQd9Ir/fmkT2qN
         U78jSOGjhRTYx2wFnAsismuIttN6rZvAulC+fA3tMbEBknzU6wmcn8RQxCKtAPsZ814K
         eKXcL0RIiho27mYg1WQLHLCnD2/i3wMQ35WoEmkSG2MCp/oaTol2LIId+J7iiW565ABR
         r2+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zp3t4ns9rDeXNWCehIDZ8V5jUGovTfPKtzx1minoERw=;
        fh=p8emnwCYeQgkrOFbLflE8GDKxcGcHrfgIxU2U4eioc8=;
        b=dFx0bpzxW9Fd1H9lkxBUMftgxHyDni5HYpOVP5nXzAkxkVBTVfuaig1V1A0GCPxJLq
         AfVQoq7pYXL9Y+IlEptW4U89yOtVcHS5Tr2rKqxgPcuJCJNFbylvRcvtk9DgzURFXTZr
         jAIZeCseoHyoownC33q4qwAyvVXMkyVCmUdV3/16zhKEznj2bHa+J2n7d5mIfeRfwjDs
         tWa0gFsygtcQYZuKQ0T0nyCdFKodGf4wERAvsIgQmmlhahPKnonuPQnWF/s95bLAFIvO
         MCNVqyYShIgJKWN5znfgy+iMbwrKP+fpH1l2S4bu97KuclxyxyEAtAP6vvhqti1o2KMc
         yPyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788285818; x=1788890618; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zp3t4ns9rDeXNWCehIDZ8V5jUGovTfPKtzx1minoERw=;
        b=VlK/FUgSeqFu/UskjqqzZsnmjcRDH5IllV052EVMqL3/4GI3ZBjth9Lu3f7z3xEVud
         YkdI17TDUYtOk7NK9aSavqt58+NKH8BUR4VFwrmINPmxAzruVDt/LK+/emJlR9qmdcXQ
         B0phLMxLoPsX/Gy4itu2cEDJQGcgTAAZ5GHra/z42DiJCG9UrfPx71xEvj4GoDKwbO5c
         LR5N6vr403JP2sJsPRPhwoG+GicuwwoU8z/G4Czyrakc+a2ZPD/pcPlqyLKB9Kc/te2U
         PrTv8EUjsaHeZM3vhJQjw2PwViWil+VowKiq+PJBLjbb4pT3KPZJnX83NPNE9FjQb4b7
         HyJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788285818; x=1788890618;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zp3t4ns9rDeXNWCehIDZ8V5jUGovTfPKtzx1minoERw=;
        b=mi7Vunu8p6IXQZlWCdCSMZs6UxByLOu3V6ioeoWsioA67J33BZjj05kmytGtO3oFQh
         Bnb+jrqa+q6ivmFohRap77HhzJFlkslt484Ruz5XcU3ADmAasPmiLXv8UM8+JBea0wWb
         pPeuOylSylYRarzdoN/qLRh/0z8xZgHEwv1qKdidldKxb71FxVIt8uxdqefMGLMOnXAG
         BNf+67gGmY+SRFsnL0d2nif70s8blunewZQE8IPvULWIriqFEmCerTJzZP9QNeu3PJZT
         mqzNSPUOr6PcUFNON7Rw5qYoeFgaV9tAMkKg3xLPakLSE/YBdY1oNyAsXEoXGE7kQr9k
         422Q==
X-Forwarded-Encrypted: i=1; AKwUvBy+SCiCciOB+BmafojHGrb753gTZ/uK7SfvA2Zt72rBVuNvb/7jf31o48G1NcgA6HiBPZwap5pP/EO3TRs=@vger.kernel.org
X-Gm-Message-State: AFuF++mzkcQ1UloIbCQYfjzUU1f60RBQU8L7qt1aPz1Fol8FdUXq+Jaa
	dbI/q8nIU248qXcY0tP8JIlOlAcEDnGqpvI3Q6BtOcRBsGd5KBLx48VKUtUcrZyRCNRk/Vh6LNm
	bKOpRbmiI1e3pLG8mo6fgsPqWk9WW7wg=
X-Gm-Gg: AYBFou3z652VoV5FvgeHwrqm8AJQ/zl/VpgwVnl8WpwI0r8A4ogVzj4a3GeKEk8h5A4
	Z8A5Gm0Kxc5pBXhTDpMiccvk/Mb12m8ZzBT00ExiDujpqS6BF2k/S17kyhgL/XjIcd1QgIO6AeG
	BsS6yeV7bxo3KbxUAxa1xVEAU8OSkdV0//KmeU3UvM1o5UuoLYnUoilhM8+/seBBBQy+HO8l1xp
	MRX/fZtUD6WSvruPVBJSGMGpAx5SahyZ+YQZd4vCHevLaqfUd/ug+3UxCeci7kRWFih729g89Mh
	SIjsSUfJh83esHo1w+/ETf8myfa9KJftnGEaaYkz+eVm86nDs7QsENHSRnuTiHjYIIFcbLgOSX0
	ld//qp5JVPjMpCZwpvM9EPeUxCkrpEw==
X-Received: by 2002:a05:6512:244f:b0:5b4:9d34:eb7a with SMTP id
 2adb3069b0e04-5b5e68ec8ddmr10066116e87.12.1788285817744; Tue, 01 Sep 2026
 11:03:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821-tegra-coherent-wc-v2-1-2b1ddb67bf18@gmail.com> <8cb96c08-2d1e-459e-b356-c6fd97ef869e@kernel.org>
In-Reply-To: <8cb96c08-2d1e-459e-b356-c6fd97ef869e@kernel.org>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Tue, 1 Sep 2026 13:03:24 -0500
X-Gm-Features: AcwNN1UfFd2C7LhFi9P5RtZmsw7QIyATqmXfPGvR_SqmFvKwrPXswsVPF47uIXE
Message-ID: <CALHNRZ-JmYx-PhruhDZ3L8aPVu51cJrqP_FeNtGTyMHCH_esgg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/nouveau: Use write-combined maps for coherent
To: Danilo Krummrich <dakr@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Faith Ekstrand <faith.ekstrand@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 9:07=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On 8/22/26 6:42 AM, Aaron Kling via B4 Relay wrote:
> > From: Faith Ekstrand <faith.ekstrand@collabora.com>
> >
> > On Tegra devices, uncached maps traslate to device memory, causing
> > unaligned accesses by userspace resulting in a SIGBUS. Instead, use
> > write-combined maps to ensure proper access.
> >
> > This would also affect discrete cards on any Arm device. It was
> > determined that discrete cards regardless of cpu arch should use
> > write-combined maps for coherent anyways. Thus this change is made for
> > all gpu types.
> >
> > Signed-off-by: Faith Ekstrand <faith.ekstrand@collabora.com>
> > Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> Can you please provide a Fixes: tag? Also, please remember to Cc: stable =
if necessary.

Looks like the tag is:

Fixes: 1b4ea4c5980f ("drm/ttm: set the tt caching state at creation time")

Should I send another revision just to add this, or can the subsystem
maintainer add it when picking the change up? For stable, I would like
to see this picked to 6.18 at least, since I primarily work with LTS
forks.

Aaron

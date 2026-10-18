Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34163F88A2
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 17:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792342822; cv=pass; b=Zw7RQ36vYm377yRbVfQ/r9DwXGJ8Xb8DiPS7KZtwZtbeiJd8U3nZYZzRggp8/E+wSO1Yn0UidQcC+F8MAf7on4Fyy401LMBk0iUjdxhuWYFVDE6H/vbn7SvdrVjGvrENt48CRMIkgtDivDn6iFPl+xD7yWP3PSyhG1EHXEUx1Dc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792342822; c=relaxed/simple;
	bh=g/JGIrVbzY2CScB/KpNY8unmxw00ClvPmppC33lSWpg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ivzLy/llhxl3NDP34NmJdV+swd7fwn2pU8eEx9otsS3DxUMoFW1w/uAfYZdvsuH84Aoe9oFkEAc5FyqFyjCtjdbkBFJhV58qoQpsYZs+O6ZjgmfxJNqnGeZFFTywrHCXB0YX3/DSkSI8lFIf6WrWq8sAeXnNEvdkL6Y0UoES1nk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KCTMdb5l; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KCTMdb5l"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c40e9aff12fso25612366b.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 10:00:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792342819; cv=none;
        d=google.com; s=arc-20260327;
        b=kMmVHCD4PZjibt8VmIxEQMBflsth3y+tdvNQ6zd7QCA5V16H4xjnR4G/Z++FVTFl1z
         NEu3aSSIQyXivORqVgrp5PskOPVKwe0fstGNSOF7c9by1jIQeyCQA7DD5zzS1GnkjYPu
         jZ5IFPmZyB3sc0D4ubxBRihLmd9kJkWvmaMkAYUDZQbeptoZSOPK9hu6EivTouhRePfA
         t8zi4euXH6UHOaDzhVw1KFnLI79xalyESL9TI2nUO8baHTzNvZ1znDBQVsUI6/9ntRYU
         Cm8fN15xnZp9u910CJFvtTPRfveTtJoTduJuPEDJzeu/y3xqvJFxo0FYzzJ5RdvzbEK6
         ZgGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2/1Y5ghSBlEp/00kqDwKjo69e3DTVuqhYG4tCNcmd4Y=;
        fh=sPk+jozis4FZN2WUtgZvBLXonrRmzZDwFaINGYW8Ddk=;
        b=oSyWtPZqmFCGyaID1xczMQIM6wzCXS27DvXMuO3jTRWBrjcyKNJ6TFaCBQcVrh21IQ
         oADc+AwSRYpopHt2KBTj6PXYbzjhJ9UKgFCvE2bGUwnuCtmP4ryT643NGvEDr3B9Aen0
         IvRQKRzmJmN06SSUq1uiIe4EEDueUcPZPGmVqVk9IBwjvps5dBkNIJP8+XQ7NYpArpjz
         94vJaO4NqIL5Tlbk0Q3SSmDuRE1Ooy3yp8SpDJ6VTGuAWFvrQXdeJ0d/XfGz7bhJ+H6j
         HRpny/ntWPmYYgT1m+mhxfMuZ9PMushoLb+06oJ6bd3Sw1g/Eyb/rMPhDGF6bdjOXqEj
         VlZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792342819; x=1792947619; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2/1Y5ghSBlEp/00kqDwKjo69e3DTVuqhYG4tCNcmd4Y=;
        b=KCTMdb5lYY31W4EOnOXwBsqyCMrEvyLBtiNkKOpkpsQLanu/ZwR76T1NzwKdK8tTgo
         EO4wGYPp3hg8ZrFdrQBHgO70Bh94fpzjjb73efQgSsivx4RLdEolg9qgB76dwlIT0j97
         PbH4APf+FHUo0L8T9usCSgySHxInol+3XBs1cqnIY9XMlBGVsMHLofIi4FMLV34khbtP
         jz2H05dt/Ys9q4Pgkib56GjeieD+rdBZ58NPj0Vy2D8shFt3eMZ84gyaHMLv7WTcV7n6
         JRjY5BPW9XxitBGOkf6JGjBat3l4rcT7sMUapypW5eiPHo7RAgdnMbdqoWKWZw6VgEA0
         CCIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792342819; x=1792947619;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2/1Y5ghSBlEp/00kqDwKjo69e3DTVuqhYG4tCNcmd4Y=;
        b=Jq0mfiqL2HmblJ6b7E4HEoZF7vHTMCIYQb37z24VonTYZb5QMSSTvYKV+LX6/md9gp
         F+DOex9N/1C+IsALbMcHm7teGTkkRWWNozu4Y9l2pgB2WgxnOwBy58uRDrh2+hnWLruK
         EFakh3L7VH2daT78POiFgl+m5z1Bs9bujxiOLNiRaHqFfYx74QwBwVZzuL3PBZlW7his
         qJj6R3sP7AekK1bsQ/L8oxcOuKG93bcEPTx2PQlzAuR0HtCvzXGsYL+m0uIq5Ke+jxzS
         PEs3bN8nWtg2LTJoFpvwT1PHJH/TLDLOIefMLR5qerG0svpQRQytiCCSQ8uijEabUIy3
         Zm1A==
X-Forwarded-Encrypted: i=1; AKwUvBzd0t8ODTlEGZkvit9dhNJvwyzWOPcVZjSfFZAAB4goOkO8Y4qkwMIyAY3A8XUj9lVCoNAMtWWXs+gFib8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKsuH6UCvmKaGKBi3P6vG6ASGZ0jlS0boe0kMyiw5kPSRWjYOmU
	GzLhPi/nG7hkkPqzI5E322HEZ8+q9bR8Brrt3IeN8Zmxr6S75AjXvOqFyAQnrCFAHX5S/QjZHnO
	gPOVeRxSY0Z2sWvIM9h0Jy0Nl6N6oG5E=
X-Gm-Gg: AYBFou0HCBOqa00sMbk73c9SAJLemMXhkdlqGaY2j3FMXloRsjAXTW25UfCwmyoq+7J
	YE9hz1UP0De86Y1+HaOU4jWMQU2gLAFf4BG17yf0D0fEtaX/HMpdA8Oxssl/MQgQ38um1yPSZsJ
	kdRwpWhFwveWTYGAJLE1Rs9q5j+wKd9sBtSbcAIp5DopmTlB9+VKbYuvEjQSUAhR4hFkMzZKsEG
	Y7V5eFEsGsbGvN4I2qlkVNVlsE6P9maYaRFKRwGWDt1hz1TJISIEG3DXXSuPpeDVi7SX5A8LxXK
	8ggp2FqDTxEMKN4JIz88x7DbHr1g1wEVWTZTluJ4mmlwgcXscvmPKWq2YBltENoeRW/MMNey1px
	r2UzIuvkjxLGzeN7sHTMv0GJu8/9pv563dQ==
X-Received: by 2002:a17:906:f597:b0:c41:55b4:d88b with SMTP id
 a640c23a62f3a-c41a00f1a94mr354678866b.43.1792342818130; Sun, 18 Oct 2026
 10:00:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016103640.4989-2-blum@kernel.org>
In-Reply-To: <20261016103640.4989-2-blum@kernel.org>
From: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
Date: Sun, 18 Oct 2026 22:30:08 +0530
X-Gm-Features: AclHuK-nQ7ZtqX-oks4iRGuLf-PLYl2NcnCVNUFe0eh8h6uUfoXPMhFqyj8drsU
Message-ID: <CANc+2y7ruqmfO+D_nfdc9rnBE0uSSnZR9UJY2Dvc5Nez9U-61Q@mail.gmail.com>
Subject: Re: [PATCH] hwrng: virtio - prevent use-after-free after a failed restore
To: Thorsten Blum <blum@kernel.org>
Cc: Laurent Vivier <lvivier@redhat.com>, Olivia Mackall <olivia@selenic.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Rusty Russell <rusty@rustcorp.com.au>, 
	Amos Kong <akong@redhat.com>, virtualization@lists.linux.dev, 
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thorsten,

On Fri, 16 Oct 2026 at 16:16, Thorsten Blum <blum@kernel.org> wrote:
>
> remove_common() frees the driver data during freeze, but does not clear
> vdev->priv, which points to freed memory. If probe_common() then fails
> during restore, a later remove or freeze can dereference the dangling
> pointer.
>
> Clear vdev->priv on the probe_common() error cleanup path and before
> freeing the driver data in remove_common(). Also reset the device and
> return early from remove_common() if vdev->priv is already NULL for a
> safe teardown after a failed restore.
>
> Fixes: 08e53fbdb85c ("virtio-rng: support multiple virtio-rng devices")
> Cc: stable@vger.kernel.org
> Signed-off-by: Thorsten Blum <blum@kernel.org>
> ---
>  drivers/char/hw_random/virtio-rng.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/char/hw_random/virtio-rng.c b/drivers/char/hw_random/virtio-rng.c
> index 5e83ffa105e4..a9ff520975a7 100644
> --- a/drivers/char/hw_random/virtio-rng.c
> +++ b/drivers/char/hw_random/virtio-rng.c
> @@ -190,6 +190,7 @@ static int probe_common(struct virtio_device *vdev)
>  err_find:
>         ida_free(&rng_index_ida, index);
>  err_ida:
> +       vdev->priv = NULL;
>         kfree(vi);
>         return err;
>  }
> @@ -198,6 +199,11 @@ static void remove_common(struct virtio_device *vdev)
>  {
>         struct virtrng_info *vi = vdev->priv;
>
> +       if (!vi) {
> +               virtio_reset_device(vdev);
> +               return;
> +       }
> +

The virtio_reset_device() is always called before setting vdev->priv
to NULL. So the virtio device is already quiesced, no need to do early
return. Isn't it?

>         vi->hwrng_removed = true;
>         vi->data_avail = 0;
>         vi->data_idx = 0;
> @@ -207,6 +213,7 @@ static void remove_common(struct virtio_device *vdev)
>         virtio_reset_device(vdev);
>         vdev->config->del_vqs(vdev);
>         ida_free(&rng_index_ida, vi->index);
> +       vdev->priv = NULL;
>         kfree(vi);
>  }
>
>

The rest of the hunks are fine.

Thanks,
PrasannaKumar

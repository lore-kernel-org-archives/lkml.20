Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253913D88F5
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 08:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792226651; cv=pass; b=eaoC984hJqPo9LIZLUoE6A+x1hFS8bws/1ZPuyjKMU7N8vXkDtwyDgWHMHeU2fgD8Kwq2ejr4JIWMlCc8/bod8UgL4zYMM6JQ413SkYCs83LOZkqS16ubv7pJkWSz3Z5vdHLfA6XVRTEwNWpyoNbC0Z6zAk+mzZc6IFzpxqMkRo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792226651; c=relaxed/simple;
	bh=3qE/oq1xoEyQQ6WVnT2XThEzNvP+8AwZccRWWRu0iAI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F3J0edSO6f8P+RSCygbeLW7bvMkuv+LjANhvd7V6c7f1mVa0rjTVAF5BOrBpssK8loGerTHZPPo8Kv8usmztp37bZmfF0upXyzzMpJAmrdNX8/M1oILdXtCtlREbP1aB4W2+IXVWEirgfQh3SKHJDEKV9zlNkB5t+auWa+XzEnU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z6QmO0fb; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z6QmO0fb"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-67921b515a7so847200d50.2
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 01:44:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792226649; cv=none;
        d=google.com; s=arc-20260327;
        b=lyaJ1Fxy2bamSrXNymOM7baJrODQftP5uD/hvqAnL3p3XgmHjiJ753HLgXNrhONqft
         2h0OFgJEUeYitt0zvSi+zxWpcFzv70kQC3dmaX+PpPa4FTPegIJIDsWYf9/pyCwbPZIa
         4xjMAFWZwObVYJCGrm9fA3h8udfn3l6tX3TT/KuFBS2PxqktRLl/Wi6tVb1DbzoAOt0l
         Xsm0yQs1RrSuDZOFAh98my0X6cfhedDMIWsUUt2g3nEZRV/sy0QtwvwacjvM0tLOnzIM
         ohqauB39SITpPqsxrTxo7cnQYpv9XPB1jTdmfng1IPvG+1yUncCLX51HZBz56KIhhtNs
         M1QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gQhTz4w4O2mYugE4mymR6HmqC3XuLvp1B07C+1RGZkc=;
        fh=7Smab2xbRhwVtSzSXgyAgOsVK8YU35IB4bRH2NF3XsE=;
        b=ALBzAGgCcQhsiezpuwwFUWc/3wojPI7d6OXM+UqMLsUT9zeu07Pc2FaL/R2wxhwUcR
         4y67Uv7gy090DkEa61l1nDaTy2MFXjQA9vJbUe6oE09hfVpxp1XlSs74Wu+zfoNN2Mad
         7PUfHw7mGRERxmaS+P7ZXD7CJRnjdr6qm1RXQn9UZgbpxATVY87u5mE+9IQ4N0C2zs4A
         4WK5LXVAMWSsEBY3wxOmOZ/aocy5Va1MbF3+TWUqOc/ei7wqGuc6maodk2iTrsDRubjr
         PrTycMAQqcsldrR2YfsAHl4Fwov0VrdXwGog4EoGILY5NiGDsIdpoEiizMy/ZPPAJis5
         AVtQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792226649; x=1792831449; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gQhTz4w4O2mYugE4mymR6HmqC3XuLvp1B07C+1RGZkc=;
        b=Z6QmO0fbLnBmXcZ1gABtnwsRyQDqKCd2bZeftQeweT0noiFjjdWZUF7MTWzue6NDm9
         54j9wI+igagbbcWbDIlBjJyrfneTYB8L3pNosmz3iLx7bcoRZTwQyFuvD4F757N4I6yF
         ydGl397uB67XFllSpJPFfkq6ZSFlEh52OWkKOMqDtfy04ywxlLQmtcqPQnAyVvyM2/LV
         KeEJ7/jsyGbCVDULXB+d3lutvFqmYKm7VVNzBhl30oVReVHtikcdCy7vVUSbgfyBhnBA
         tLq+BJP12XOG4U6JisCOmFYU7tEMQAhz4eeHtrS7BHEoQ6pK5Ya62DNyBHWVR2TDBSDE
         9wog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792226649; x=1792831449;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gQhTz4w4O2mYugE4mymR6HmqC3XuLvp1B07C+1RGZkc=;
        b=mpdil2q1ZaphUQM9sSlXavvndZ2/L6dQyrEkFqaTOwGTbHAvsTQrNzxeYTmgU9KfYe
         /8Y/oJ2a7vj29E101P74xxcXQzKkxPk6a7BuohTUIUyxabF///3fkZTcvrPhBn7QQeZu
         QAaEE6AK8dEhTplkInDD+fMKYthwbVWZdrbMtMOnaMwJPJi908iSkk8BFtBRVqTeKAHy
         YoaAbxV6NkiMcaBUM+L5oBoWt+VtH4QwPRfyBOryWv5qu3r+cbjR6o6q/bKa+E6hhITd
         NPgrI3jO5hF6FlyNRfZ+6X2MUIcilpSx4DEyppv//6PmbpXuKSbGkflyVl+ERrYIuiR3
         3QMg==
X-Forwarded-Encrypted: i=1; AKwUvBwEdjBAf5u0INE/33En0lVdbi7J0EFLjskE9wDCUdvoVNYMur6FCDwlQnBBbrQmeROcStoSarEcgmLbajY=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3w/GuH5kGh5idcouyx6sEKMQBIdc2zUPnzteT6J93+QWrnyPa
	D9Ap94oYQOShMsZVEIqvN75ofUVbaYzr/pwRfr2aoceeAKbfTDxyhJiSLxPcSTgI1rPNWLBC+ra
	n/oca98y21UevuI4W/LBlGEDzGQphTQNGQ7ySrYGySrQ7Gi8=
X-Gm-Gg: AYBFou1yqpWeiMC3cTBiqKmFq9wp9+Uma6juHOI0Kf9FVI0NbbylvrlS6sXBsVSd84I
	BG5B1lvJ3Yea//P6hg7ucxJNGo6NaUKoXAybjNScX81B0MBFLP4of6bsVc81Ion3bYnZ75ywPZe
	qpQfqjRLwym0QyRrUpRaJnOUgKFLJh8NGPQoxhYKUFKdqfp3fQGOVqdLETJWpd/NQ8tkLVhDZm6
	YsE4oObeLz1u2Ii3jdFSr5KF4GDyI02ew7YaAAfc8AuWUwhvMmmmoK4FBSXhcHigLnfNB+JNsXR
	K0k07beS4mY0CCHHXqIN34HnwANWI5aM/3F3SOd8GUAAMHFKq2Nha4FvKGDxeJDUbo1hzbgmnrk
	xWC2G+jL46sQ=
X-Received: by 2002:a05:690e:b4f:b0:674:7fa:6a3b with SMTP id
 956f58d0204a3-679ca4b2dabmr566540d50.5.1792226649005; Sat, 17 Oct 2026
 01:44:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pm-pmb-a4703edca61d34aa679b-v6-680f350d78e44f9de7a7@gmail.com> <87o6cs20yr.wl-tiwai@suse.de>
In-Reply-To: <87o6cs20yr.wl-tiwai@suse.de>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Sat, 17 Oct 2026 16:43:57 +0800
X-Gm-Features: AclHuK9BynSqNLJeMNiD8leRvLVxNPBI2Tpv-07VMXfy1yJYuIsrXo7SIsx6iD4
Message-ID: <CAFRLqsWtGv=2Q48R1ZNeQ7WAekuo9o05u0iK7QmEZJieFygZBQ@mail.gmail.com>
Subject: Re: [PATCH] ALSA: pcm: oss: Serialize final setup list cleanup
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Takashi,

>
> How can this happen?  The PCM proc file belongs to the card, and
> snd_oss_proc_done() is called from snd_pcm_free() at the card removal,
> where all opened descriptors must have been released before reaching
> this point and no new open is allowed any longer.
>
>
> thanks,
>
> Takashi

The whole-card removal waits for the open files but the reported
case used codec-only sysfs unbind while the card remained registered:

  /sys/bus/hdaudio/drivers/snd_hda_codec_generic/unbind

The OSS open reaches snd_pcm_oss_look_for_setup() before acquiring
pcm->open_mutex and before azx_pcm_open() takes the codec PCM reference.
The card reference therefore does not make this early lookup visible
to the codec's snd_refcount_sync().

The original report came from a controlled QEMU run with scheduling
instrumentation. The teardown used the normal sysfs unbind path, and
the recorded free stack included:

  snd_pcm_oss_proc_free_setup_list()
  snd_pcm_oss_unregister_minor()
  snd_pcm_free()
  __snd_device_free()
  snd_device_free()
  snd_hda_codec_cleanup_for_unbind()
  hda_codec_driver_remove()
  ...
  unbind_store()

On rechecking the lifetime handling, I found that the added setup_mutex
only protects the setup-list lookup. It does not keep the PCM and codec
resources alive for the remainder of snd_pcm_oss_open(), so it is may not
a complete fix for the codec-unbind race.

Best regards,
Cen Zhang

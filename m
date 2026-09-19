Received: from mail-qv2-f38.google.com (mail-qv2-f38.google.com [74.125.230.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3B72C87F
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 00:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.166
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789776559; cv=pass; b=G/53nLgi1r9xJt1IN05NBu5bAVznTmbclFse2XRcfSu3TE8Q07P2FYw2UleKh2kVAgZMNrbGx8XWHa44N9/2a6/67iEhyasaGiKi+uqCdLzD1xf/b6y7nElPvSvfrMjizhNaej/dFdZ3bAMTAyFy+xcaTZe8joLHv7GAuSPBH2I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789776559; c=relaxed/simple;
	bh=PU+L/CdtC8xOCmRNhBf0E5me78uniQkeih3uFXRDgt4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aO7akbtVb5nWXQZlTNiuLBi1fp8JlCaGKxALZnFUThqGpdQWVjMC08YVJ6SecsXDiSRuHQcN/qKZJQK2qdkfLRCPhI6yKW9ZiZcKAtuA34+JmAbG2f1PGUh2HeRvIv4sCpACQSIxWk9IQxu6wVoeZyBj31UPwhdjtBZrqn+UQpM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=D6ZZ6QdG; arc=pass smtp.client-ip=74.125.230.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="D6ZZ6QdG"
Received: by mail-qv2-f38.google.com with SMTP id 6a1803df08f44-9107051ba26so9189166d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 17:09:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789776556; cv=none;
        d=google.com; s=arc-20260327;
        b=fDt6Q08fOBiPLYPTV4DrDku/QwWJeUgI7f259aISGU1IIAyKISCatlHrbjuZNOtQxL
         whHz0LWwoXO0M179U80BET+xTUcjuOW2IooaZNONj8Eb0vKPOIqlpy7xAunTwB9H+GWS
         VUyKsrVFKAVJYgX5sJaC/wbOX4HnINJJWfSiPA6rtMpzsAkI/ms7tseKOJ4w2m1xraqF
         pC1zgVuQNnR/dnRohLTOcuTonz+K9wmhctL5T6SuXzwgcKIXPVWGXZKZr5cHOkOFINnx
         19XsIrYNlbcNs5d08brvBHNrQVFlb0qjPNMPw4MP6PhHVeOtSNfowl04Qy3ujiyVrsQB
         7gKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gVNibac69RIusTZEUWTx905GNnSCni+ehiSaDallFpI=;
        fh=FtB4PYZu57suAhozNfGhqUHczgv42NafWqdzbcCAe30=;
        b=WwhdZH/6wMsR+B018hALzlhJYHLfohm3th2b8IIl6Naaq1Ss0mkGTEBJMx7EOAle42
         oubNsRepHKziNY3MXbU5L6D9fyN+9ByLATm3UtHtrkuliknOU8ZCCktPtZ3eyDKCPVqP
         Icl0ST8n50PhwTWcLFiP3Ggs8p3+56ok4SmzQ+07xC3tzALHBPefZ2uRiyI2ZHojzRB2
         eYgLpCvrHdUU2l3A/ij8TqHj+3ZZC6e0+FYWPRkVn8ivsLEObS2p6JISSMbowscWfDiE
         +nPnPMJKcw6Ae0m6SvOV8qkPJlPdFl3ZGP/3fiSkQfEnWnzMeTCTri96nhcWR5BF0sXm
         sZ9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1789776556; x=1790381356; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gVNibac69RIusTZEUWTx905GNnSCni+ehiSaDallFpI=;
        b=D6ZZ6QdG2JAgYwEEX/SLW1Iv3TC3qoqNr0ZpUCcUdQT1CbZxHzsHEidgy63BvwJri6
         AkbSD5K3Cg88r40G4X70eRGGJrm/ThIk17HI6jyCfpjuKtMxma2UU93xGZjlBYruIsEG
         VN/ZYCvU/kD7oep01vdqnvAzsDGnZNDgLJ50fDVIoZ/4R/nWqYYspF7gyAuleCGx9oTA
         dCldyLfR5wODDvO49AU8FLEJe9M0m5/UDkFSiTcn5K3xebt8orerp6Scxj3VKt6BOU9p
         /vxZQ4UprImXC57ejg+wdkGSKWSgm3ylrSIGRo8QNK4/UH9XZdhjvll7tykwbBDyX0sY
         g5ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789776556; x=1790381356;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gVNibac69RIusTZEUWTx905GNnSCni+ehiSaDallFpI=;
        b=MYlQpc/5hK3uh8Ue2HLEo2R4014Q96UsvHPtcgJFlZZeZsWqEZulz7mxLDs75muDj9
         mzyQl3ovIy/hHgtuWaL7vcxAh7y2fkXKw8awFKXuA+s2LkI3kf+EyaE8/cuP82y1uBMR
         JsnTpI2sL32zaZ60TqTC5rx87fgjOAR52RhXNQO8t3XSGk8/iz+qf7e1WhSTg+hqyz/d
         BR3kpc8I9K7QkyfJ8sBgwQy7XPVYx2FYVKqiabMSX+0RQrTea9ci17wZyH6Kv8SEXZjB
         0Sw7ET8hkyW4460ZvpoM2+Q5cx8fT1amPbU4vrdNGe/oX0cxTRT7fARUiKsRWBQAo+Ar
         R3Ag==
X-Forwarded-Encrypted: i=1; AKwUvBxa8NjbYVpYjQED5Fqcf7r+YmdyhTF2TG/b6qJtIST110Rc4AYR6/GXFRa/UsKR07EBYuYKAykoKXHLn+A=@vger.kernel.org
X-Gm-Message-State: AFuF++midPh32m7neyG4yg0TQ/oZ9liP5UfgJvw9HQWkVw7yh/F2R4PB
	EyPNSGizXHs+3XAr/rH/QtlCGRHy089WidBxoVgMQRgAfz+yJ2aHuFgeFTW0IgZy1pElC7Ffr3l
	4gDNV0erPonDezxHvmEUYw6sDDbGzE0yGZjZULDAcDovZfIbnU/L7zpCd
X-Gm-Gg: AYBFou1AtrDYBp4RlUEwPWI+X37gIt6sSwl01BRj10YsTWA5X9Xv7JaxcclL8DccdFE
	f1KSfDUDzwCwjRwULB9xo8kM09X++UopP83RAFOXw2W0hbpXhwJDziV2wgkzAGXwdw4SE4uD2zO
	uMe0faUDhmH/2UMgYix2FtzeGgfQzr6G+aC4oLT61uEvpGJyWFL0SKRoaFBPSNsuGpsUVMgB8/g
	fhBenPqovQNOM+lGIEO7onEZ6YJITswpVJ/uSKkTpbrNpy0feG2CTCABvy5w10DDJkxAzoaRqUk
	eNZxx4QmbSm/ATmtpy7g5E5CVNd9PV8egbpZyHH7uNHsVgYcI4xspbrYetSOyZQp0K9fNUoWZHP
	K8RFjRGbe/MQ44xds/RbvqA==
X-Received: by 2002:a05:6214:3982:b0:912:59f5:7178 with SMTP id
 6a1803df08f44-91259f572b9mr51296146d6.31.1789776555939; Fri, 18 Sep 2026
 17:09:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918212231.1193758-1-xmei5@asu.edu>
In-Reply-To: <20260918212231.1193758-1-xmei5@asu.edu>
From: Xiang Mei <xmei5@asu.edu>
Date: Fri, 18 Sep 2026 17:09:02 -0700
X-Gm-Features: AcwNN1VEk0TFmo665Y4k-d2dWdC5cPVRtdRowVAey1-mRjtQf5TJXnzVkPticXg
Message-ID: <CAPpSM+TuDm2GRg=JTn_Qb6GzWQfik1j2iVt6AO9Ooa3HyvsD2w@mail.gmail.com>
Subject: Re: [PATCH] ALSA: line6: Clamp the playback URB size to the OUT
 endpoint packet size
To: perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org
Cc: dev@andree.sk, co+f595d33a1b0a565b@bugs.sh, stable@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 2:22=E2=80=AFPM Xiang Mei <xmei5@asu.edu> wrote:
>
> The playback buffer is sized from the OUT endpoint's max_packet_size_out,
> but submit_audio_out_urb() takes the length to write into it from
> prev_fsize, which audio_in_callback() derived from the IN endpoint.  Both
> come from the device's own descriptors and nothing relates them, so a
> device declaring a large iso IN and a small iso OUT wMaxPacketSize
> overflows the buffer.  usb_submit_urb() rejects the oversized URB, but
> only after the write has run.
>
> Attaching the device is the whole trigger: toneport_startup() acquires th=
e
> monitor stream and starts both URB streams on its own, so the overflow
> happens in the URB completion handler with no local process involved.
>
> Clamp the length to max_packet_size_out.  A device whose OUT endpoint
> matches the audio format it announces never reaches the limit.
>
> BUG: KASAN: slab-out-of-bounds in submit_audio_out_urb (sound/usb/line6/p=
layback.c:242)
> Write of size 1024 at addr ffff88801b94bc00 by task vhci_rx/183
>
> Call Trace:
>  kasan_report (mm/kasan/report.c:595)
>  kasan_check_range (mm/kasan/generic.c:186 mm/kasan/generic.c:200)
>  __asan_memset (mm/kasan/shadow.c:84)
>  submit_audio_out_urb (sound/usb/line6/playback.c:242)
>  audio_out_callback (sound/usb/line6/playback.c:354)
>  __usb_hcd_giveback_urb (drivers/usb/core/hcd.c:1657)
>  usb_hcd_giveback_urb (drivers/usb/core/hcd.c:1741)
>  vhci_rx_loop (drivers/usb/usbip/vhci_rx.c:107)
>  kthread (kernel/kthread.c:436)
>  ret_from_fork (arch/x86/kernel/process.c:158)
>  ret_from_fork_asm (arch/x86/entry/entry_64.S:245)
>
> The buggy address belongs to the object at ffff88801b94bc00
>  which belongs to the cache kmalloc-512 of size 512
>
> Cc: stable@vger.kernel.org
> Fixes: 7a0f55aeeb8f ("ALSA: line6: Support assymetrical in/out configurat=
ions")
> Reported-by: <co+f595d33a1b0a565b@bugs.sh>
> Assisted-by: LLM
> Signed-off-by: Xiang Mei <xmei5@asu.edu>
> ---
>  sound/usb/line6/playback.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/sound/usb/line6/playback.c b/sound/usb/line6/playback.c
> index 7ebaf125f969..cfb20585c5ea 100644
> --- a/sound/usb/line6/playback.c
> +++ b/sound/usb/line6/playback.c
> @@ -181,6 +181,7 @@ static int submit_audio_out_urb(struct snd_line6_pcm =
*line6pcm)
>                 }
>
>                 fsize *=3D bytes_per_frame;
> +               fsize =3D min(fsize, line6pcm->max_packet_size_out);
>
>                 fout->offset =3D urb_size;
>                 fout->length =3D fsize;
> --
> 2.43.0
>

Please disregard this patch. It duplicates my other submission
addressing the same out-of-bounds write in submit_audio_out_urb().

Sorry for the duplicate submission and noise.

Thanks,
Xiang

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793226509;
	b=U7gJ/qZ5fcCifnMLGl34bezwezn8Mk/ATSqWD0/Z735mJDVY1D20R649G1X57ohOvuaN
	 dEsk4D63PBN/BOldfH9JGqSbSheRooKPPKjhBvK0Z+H7loXsJLgKcKQXyHbaTgzyBYqlA
	 42nqMvACem+QScugVA7j1s7kK+YAhaf9Bq34RHGHkgC/Yo4ubKIR3xtOR9rgoEFi4JJk3
	 rmiWpfP+zJq9RZMukIKJUOjHHVIP3ho9Uons0u0FysslFkUh/Afcbn1atJYru4Or9F7gN
	 GTCsz1g60SIX052QA1HXxIVGgXZR/QFUa7toZxXFtK0M35GR2tUYHcLGJbQCYrtd16w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793226509;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:
	 Content-Language:Thread-Index;
	bh=sgJ5PTNqFid6MZM1r8iQFNCnYOqNxfsXQPmIc2nl23Q=;
	b=sxMsmK0P8oLZejw7MD4KSTxJJd4iHJ3uHD6Rn1An0BoLLjU+iLFSS6+a7/KRlkUREPaw
	 nco6kj0pjSFUVF9xkIr3ZNlW0Jh4jCOwuOrlvXAbKuPiUcTw+U8LkhL7IIq8nciTiXvEg
	 hsOUYdf+Z4Memzq4ymrYwbEmh+Rz7/WLhCtjETKkW2eb7kbPicCFvLg544i6XS6QeoGPe
	 Pg4HvafkLAwRPwbsNUl4iohiOucTvdrnB4/as5dzc+UlsblhS9YgF1ZomrodmLji5WXf8
	 21k8AYhz2ivfE99W/y6e80wJCgQrRqP1PYySLLamVlQU3KyqRw2QnTI8r1vZ1Ycv53w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=telus.net;
	spf=pass smtp.mailfrom=telus.net;
	dkim=pass header.d=telus.net header.i=@telus.net header.a=rsa-sha256 header.s=google header.b=BgmqJJqo;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F792606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 22:28:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F792606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=telus.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=telus.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=telus.net header.i=@telus.net header.a=rsa-sha256 header.s=google header.b=BgmqJJqo
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ab98332238so916503a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=telus.net; s=google; t=1793226507; x=1793831307; darn=vger.kernel.org;
        h=thread-index:content-language:content-transfer-encoding
         :content-type:mime-version:message-id:date:subject:in-reply-to
         :references:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sgJ5PTNqFid6MZM1r8iQFNCnYOqNxfsXQPmIc2nl23Q=;
        b=BgmqJJqokN2u4Hh7rRBEBA0RP+A37QVcXFGZiQfu+Xq5hRgUcQulSTGZbF7qJDiIeb
         JhhqroUwN3A3o4A79c8lCi8996f2G8N/odtrpUl2ODuOP09ue9QGQytM4gYyKdyOu7pS
         sdhizgGMh9z/1TfV7VrxilZvK5FW5QajWeL0a8iLryn5X/epvab5m4FQtGVcjPVWxW5N
         sL+nrJSfJauKMyjm+FjCq8LWtRS1FD+N0wvBjRM7pXdFxDIfoGs/ltY/8Nlazz1M/QzW
         3tfuVb6dOyuOQH21ivLgn51X/VGk9ZodAjFdof5prKP9z0NyL+JdvWYknjantI8i0wP9
         wQEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793226507; x=1793831307;
        h=thread-index:content-language:content-transfer-encoding
         :content-type:mime-version:message-id:date:subject:in-reply-to
         :references:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sgJ5PTNqFid6MZM1r8iQFNCnYOqNxfsXQPmIc2nl23Q=;
        b=AmH+CTZZpT+wLaQ6Z/CcJxAN5mxbr0tUTDmFKr5NcLJjvkKAec1iOOHPY3RpIbhMpi
         /9t/SASI20JT59CUXS8YbxEo5DWnvC3PheMqjioeq83Z+ToJQPP09HbO4maEVitIpm0j
         GlAevUB/75hqqGAjyQIeb4wRbj343IlsLwpIPYi7uyDpzeSHmbcdufcT8v09s18dwHoH
         Hv9DyE0Yb1fq20kyeSUAdEoaWy3xSho11jQdY77rFaGmokqYDobtU7K7VcczrRFk9eeZ
         aFityrK1515qB0/QDHfRTDCSnqYJyDA+viPenR0tPegUEEn4dJVWe3WrE/CCJD6dnnT5
         RExQ==
X-Forwarded-Encrypted: i=1; AKwUvBwBR2kcx9fAq1Mu293KdhfabO8lpZfeQLMXn/PrGVOjWwAv+2HpqmRNOwCMI34L8qsTelAsFvfoRiHRSWc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHg4kGXy/icooLGYlfytf8yN9INoszYdkWOnZKbxCAHClhUTn6
	VWnTd0fo5g09WV5LElJrnw9b1pxDFvoOykh6VAl69bfX0mJp2VhQMx7PXPOWWmpG4xY=
X-Gm-Gg: AYBFou0+lf4bQdPDUw7BCmapvGeOuFZroae0OklDxwm0Sk5znleauiSf4AhFSgWrA9f
	QQzPfGah9oE5cjd5NSR5wYxjUYMr5wXMeOvT4CbQQ15d7F4o8W/iA1Tw4l1meDNdbWYdl+C/A7M
	eJvx1waCDCNUf9GONca9NpK11lMkfs+uXRPrLQtJblvC2d5iDdngqSgmayGX6JEvSmrtY3aY1WF
	CSJM3K577DlK4RX7uxddYY0taQU41KkG5gDaphEqNJjBLXQAPlFWZ8zAfTlcZpyngbOg7Rc5tKH
	0+1US934arHT65BxxoPxA3YULbQtTi4MeAWUrsB+rAZo4W77Ie7Fc9oZtiXsjpHtFfBKw/hW0S/
	25i9EZNGy2kl96DSlQ0z0MnhF9DKc9Os29XrIkPFnE/X/K7Yh9jidLqq9NHrJI/YdrZWDz/3/fZ
	JthqQEm3bPBgWHo9k0UU/s0V/459c1jOL77fKbqb2ck8D+QGYUTSV3f6X97XMwwzmQK++Yk6e8h
	oWo73xFmZvoxUXRCfm1fJ7Wx5LAMb+7Oan/kIp7mCiCdPhs4qGWCe4LCRp/sF5pjJMihegzeiPp
	NautpBkc4XQsC4ugI/BkuAnzN2Lz7O9tR32D
X-Received: by 2002:a17:90b:4cc6:b0:3aa:f4af:1e16 with SMTP id 98e67ed59e1d1-3ae57e08be7mr2233816a91.7.1793226507332;
        Wed, 28 Oct 2026 15:28:27 -0700 (PDT)
Received: from DougS18 ([66.183.142.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae55a6859bsm2548569a91.0.2026.10.28.15.28.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Oct 2026 15:28:26 -0700 (PDT)
From: "Doug Smythies" <dsmythies@telus.net>
To: "'Rafael J. Wysocki \(Intel\)'" <rafael@kernel.org>,
	"'Zak'" <zakbrightonknight@gmail.com>
Cc: <linux-pm@vger.kernel.org>,
	"'Srinivas Pandruvada'" <srinivas.pandruvada@linux.intel.com>,
	"'Viresh Kumar'" <viresh.kumar@linaro.org>,
	<linux-kernel@vger.kernel.org>,
	"Doug Smythies" <dsmythies@telus.net>
References: <20261027143725.3763827-1-zakbrightonknight@gmail.com> <001101dd6631$6167dbd0$24379370$@telus.net> <CAJZ5v0gVkYuZAh7H8KFakN+vHkJTjzvmZsLrUVP0MXkaKLVoCA@mail.gmail.com> <004401dd665c$97eda060$c7c8e120$@telus.net> <CAJZ5v0gvruWF7VhVuLrn4AgV9_n6Ayektrh+jB=eLY79ufw4UA@mail.gmail.com>
In-Reply-To: <CAJZ5v0gvruWF7VhVuLrn4AgV9_n6Ayektrh+jB=eLY79ufw4UA@mail.gmail.com>
Subject: RE: [PATCH] cpufreq: intel_pstate: Restore P-state request on resume without HWP
Date: Wed, 28 Oct 2026 15:28:28 -0700
Message-ID: <006601dd672b$a7d67f90$f7837eb0$@telus.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-ca
Thread-Index: AQG+ka4iSAouj32QbdBtcmCOlo9WegIHF20PAY25hX0B4KDsxgCzt23+tx/ofyA=

On 2026.10.28 08:54 Rafael wrote:
> On Tue, Oct 27, 2026 at 10:46=E2=80=AFPM Doug Smythies =
<dsmythies@telus.net> wrote:
>> On 2026.10.27 Rafael wrote:
>>> On Tue, Oct 27, 2026 at 5:36=E2=80=AFPM Doug Smythies =
<dsmythies@telus.net> wrote:>
>>>> On 2026.10.27 07:37 Zak Brighton Knight wrote:
>>
>> ...
>>
>>>> I confirm your findings and tested your proposed patch. It all =
worked fine.
>>>> I had not seen Rafaels's reply about a possible race condition =
until now.
>>>>
>>>> Test computer: i5-10600K, 6 cores, 12 CPUs, HWP disabled.
>>>
>>> Passive or active mode?
>>
>> Apologies for the incomplete report.
>
> No worries.
>
>> Passive mode has the issue. Active mode was fine without the need for =
the patch.
>
> Thanks for the update.
>
> Please check the patch I've just posted if poss.

Because I had already done so before this email, I tested Zak's V2 =
patch, and it worked fine.

I tested your (Rafael's) patch and it worked fine.

Tested-by: Doug Smythies <dsmythies@telus.net>

I have not reviewed the code and will not have time to for a few days.

... Doug



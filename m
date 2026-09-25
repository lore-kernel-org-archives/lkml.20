Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531862F3C37
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 18:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790361201; cv=none; b=limN4ANQm2e8Zaf7eTsrLSBhFmHc+L29kp+n8QHIPhUMy4w41L+YJ0ck2OsZq+qV5piRZ79RgsEoXNXHyiq24kbhNjG9dXyuq51+c6CbN6qX8jwkHpKhIn2PhBaOt1r0SyB8zbyd72OLLAiwcD7Ok3OM8r1sRbbLxDHcXcMVN4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790361201; c=relaxed/simple;
	bh=bU2bPuwgAFs6la5XGn3lwxeedU3uXxgC4uxFBsappug=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=WDkBocNrzMr42COgMo2UkcUB216G7pJi7Gw66dX1kYTo2fEkhCb/IJIgTNl8iYTb+OfRpLH78S8+ylwYpBIbakbCDvJyFqPL0PfNAf22czcblgZNNGMNkoKOlXrY4zzpc5SpL2g7tCp0id6R6JqfW8SU4zz1xusFWfOekfvdITk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l9eelQru; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l9eelQru"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c3ee4cfso597886f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 11:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790361198; x=1790965998; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vEdmMsRWd0vgMIbH/gecSIb5KZKuyMwRPU5J4KEOsq0=;
        b=l9eelQru3PyfYwXSeAJA+UEUhUp9G9piWmaKE1/qPaMtzWhW72ycWl+YH5unZg3nkp
         gZKbOoCIWXhJ3GaQhexKt/XhW/PjXXZK8MBzQDvsG56SB57Du1lYKJu2shmm7Haymq21
         opEGuxzu0xLScCOdYP5ZfONIL7KAg3GWckFTtefiiPKBxKeBCFmztcKXoeHF3rS88Uiq
         yQRRdcMvXPC6Ff9JY8dsZWykbIBB+zPQrkZopz1CfhMQvoRxCFYm/nMj9M4W8pCpz99z
         mZp7HdM+IctSx5YoUfA858Qww9I81LnSruT5e8R2SlgDeAv2qI/AAAWb85o5yPvekejq
         HfMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790361198; x=1790965998;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vEdmMsRWd0vgMIbH/gecSIb5KZKuyMwRPU5J4KEOsq0=;
        b=wMfOwHANh4fmLGtQ16mjrudUKtIaN11XRbVB5oQTpYZvpUnNdeILv9dizW68vAjBY4
         5uLs6cCzqPF3NxfMRnQ411sb5aOla9bhyFfZ/4EgLia6UwCXVjiabnP4gEzWk1SnxuqH
         bzNSZx4J+CdaSk0/AWgdXPbIUQ9dUAP2YVqjq4A8IhcrBAq6lGclX9vTi32rXnFBUCeA
         iLrpONMbUvurwKJlpegjmvtLwN9KJA7UNnQhdLcY7xsKaYo3TF0Mg8VXpPc75LIf39rV
         szPcwVjpRNHHzUb6AGIGTzeW77CTd3sEODUkfyUOWY5VED3pQ/c+T9UUWfojHM0nDq6J
         TN5Q==
X-Forwarded-Encrypted: i=1; AKwUvBwcmtEAf5XJgT3Vn9hZl+UPuTfyeWX+tGg1+QOuCdeINrePeMRGvTZu1TShNB0yBbT1SLZAo+F2M3sl97c=@vger.kernel.org
X-Gm-Message-State: AFuF++kv8cgu67AFE7EMsYMNT9T4F6DNnL6tJh9LBVlW6DnuqiDXgxiB
	PlXXgu8Y/9Kc5BR7m1ywcTHpKRaw6q+XijkIMRcfmcA7O7IfZE+IgyMSJINt0Ocrx464mQ==
X-Gm-Gg: AYBFou0JR+tuJs2Kca5a/3JV4tXSlYOsy1piD7+WTwQA1OxADir9ee2eW7zeAsVBPV6
	iurEr/+aGFj1HyO97AUJQRlkRkhfyknEvRVWbPFi5VVejcMRhEvnj2n+pMe8B2xfSTObyOR7H1K
	ZqQHGs3ms8itThJH3D/kbii8u/GVwYnBLRUxQNY6KwC/O4ve1MQbHjTzVHnvaDizP0loUCS+wxQ
	p86MO/UsrerX0hqGgvDXUh4/YYto4rinJBeVx+1JRsnG0KaOjGh9KhHVdDL/9v1iZprWDmvQrn8
	IJ54SJ2/WGYync2LGgdeJSEyaOZIEWjk2xP1+pqSrU71na9iu0VkbserhvyingO+B6hFLPMhE01
	KBVlsUfEe3oVt1UQCXNayhyoldtxJ6qk8WXJAo11NcBOQqucF3mmhmyo19UHujAfv1tv5gtjO9C
	TsWMMnGAvjszlMf7xW+ln+oxuxHtzwnOdTsIwfurvRmXtAvbA7tTEbEUOGBUjb5dEO0l4vMC7Th
	56f
X-Received: by 2002:a05:6000:2999:10b0:488:79e5:cb2b with SMTP id ffacd0b85a97d-48879e5ce9emr5151216f8f.43.1790361198325;
        Fri, 25 Sep 2026 11:33:18 -0700 (PDT)
Received: from [192.168.0.46] ([63.135.75.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a4e9sm7540102f8f.11.2026.09.25.11.33.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 11:33:18 -0700 (PDT)
Message-ID: <191af638-f19f-423c-8306-d96ea2b3dcad@gmail.com>
Date: Fri, 25 Sep 2026 19:33:17 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Faaris Ansari <faaris.ansari@gmail.com>
Subject: Re: [PATCH 0/4] ALSA: usb-audio: Demote the severity of sticky
 GET_CUR
To: tiwai@suse.de
Cc: adventureFAN@gmx.de, corbet@lwn.net, i@rong.moe,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, perex@perex.cz, rdunlap@infradead.org,
 skhan@linuxfoundation.org, tiwai@suse.com
References: <87h5klw6kp.wl-tiwai@suse.de>
Content-Language: en-US
In-Reply-To: <87h5klw6kp.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi there,

I am continuing to have a bug across the latest 7.2 kernels, as well as 
6.18 and 6.12 LTS branches concerning hardware volume control on my 
Audient EVO4, that I think is related to this issue - would appreciate 
some guidance if not.

Specifically, when changing volume via the knob on the front of the 
device, everything works perfectly, but when modifying volume through 
pwvucontrol or wpctl the volume drastically lowers. As far as I can 
understand, pipewire is resorting to a software mixer for the device for 
some reason, whilst also actively modifying the hardware volume at the 
same time - is this what should occur with "sticky mixers"?

prior to kernels 7.2 (tested 7.1.13) the volume control works perfectly 
via wpctl.

I attempted to add a quirk flag to snd_usb_audio to work around the 
issue without success:

```

sudo modprobe snd_usb_audio quirk_flags=2708:0006:mixer_get_cur_broken

```


I also tried applying these patches to add extra mixer controls to my 
EVO4: https://lore.kernel.org/lkml/20260919151840.24371-1-arc@gmx.li/

This worked fine after I modified the UCM conf for the device to follow 
the new (correct) naming scheme for the master volume, but the volume 
problem was still occuring.


is this problem I'm having related to these sticky mixers?


I originally reported this to wireplumber thinking it was an issue 
there, more information is provided at the link below:

https://gitlab.freedesktop.org/pipewire/wireplumber/-/work_items/1022


As I've never reported anything upstream to the kernel before, I'd 
appreciate extra guidance where necessary. Would love to get this solved 
as its making all volume control on my system unusable, and the change 
which has caused it has also been pushed to LTS kernels, leaving me with 
no working kernel besides reverting to the now EOL 7.1 series.


Faaris


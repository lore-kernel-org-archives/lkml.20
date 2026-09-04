Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1463B14D2
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788536736; cv=none; b=I97HbOsUKQSkpgFm/bsN7TABAjPzGTSC2GuU9I6H1kMjlBRTv9gI8efSaQUW4m4b+hHM0H4/hQ2vHjvAa9B+vpFBW7C8yptfjUbkXIhGAscEnZIxrSTXR068Fsyqz7ZKrlJOqGseZut8mOqNXzyckwdu0VsjwN3adW/w/RpD18I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788536736; c=relaxed/simple;
	bh=0i2ur6bxtGesXmSKwhHP+Be/MOfypFS0q4OAYvJgvzc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=ttEc7Tn5SO7HWzrd1ozkK1fdIfDFx2pzjOO0yxtvzajgGUerdoDvk1l6MfvIC0q94bEdM7WqadVeAofoJF44Uu/cZRSyS40BwkUpwX4CLQQel3faMVZX4PQ2p/VVQzIgb+6ifXvYtruYEWSYcycBoBoJpjvG0NBpEImEusRqY2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mdiRSc6r; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mdiRSc6r"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6b0496f4bbcso828377eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788536733; x=1789141533; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BdtITZOav3pjxc4SwRDxA49yanevszl3jiRD/k4W2wY=;
        b=mdiRSc6r5WoW+yNAAv7KediiqRmlIppeS3eaO94ejHpsjvSAW2yR0Zc1wR79aVRtut
         VKgTA8RAM5mDy1KoCU92lEH7lz64uT3Ad5/BeCTbKAyTLRFhoo6qLFep8YsUk7hxAnLt
         SGp7UDRIdptJoEj1NkKVBnkqHss2bFkm07n7+72xeXcOnkpFMjKqLKmpM/nzAlY6tWWB
         cHq2nr9Iwlx2jEZOJ7iJ77GxHL8HQZwVKXbIK9qp3VcrFutLNDtXcG01Zm81CKqAeelq
         vVfrCeMKlpmD1plMZecK6c35rQVh3TzzOP4N7bk3eIATJMz5qkzny9VEMxXvYQ/aGK6i
         2zjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788536733; x=1789141533;
        h=in-reply-to:references:to:from:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BdtITZOav3pjxc4SwRDxA49yanevszl3jiRD/k4W2wY=;
        b=OJzoh0LWqZh1WB8AxzRydZmHCKkMpjG5LxD6TlxQLWyk0JVg1/Ad4Dsp/6n8hwAOUL
         c2RJQARtN2ejz7/c41sHiHFyfOvPiZA9qUcIht4Hl7d4/Jr2A5V1b2vd+8nOgl2xsjAx
         C34zSZKkWzL0NLzN8QWt7neeLC5TF4uYoW7+8XGU6FI//PaBfk2yw3LcsyvVtlbfKmJt
         6jrF9HhYReZQX4WNj4hvkZzhMu7AKjOw9Tnc+ECQr6Lv/RAnfF2gPOz6SlK+oIfNKtLz
         JDo+6ekOv5sSsYpcVdlC/8JVDhv30e1HXbsv7nJ/f/ZoDhgGWbBcsvPd21FnQLeVDY/c
         QLig==
X-Forwarded-Encrypted: i=1; AKwUvBw0Axc2WZXQcQNJFT4heHTpqJ9Pc/S0mlCZtUaRPMZu77q/57X7ZELzf9j4qnZ1fMAlWudX28G+R+gX7bM=@vger.kernel.org
X-Gm-Message-State: AFuF++lYRqoDRbDTbIBKoXuejrh3tkd2eRgJqeZmVuo5ylgITK2C3NYI
	l4tHBeL7U3G3xy6iB1btnNhtXG9eI3cDq7FHTd6h9Y+zLv/74fQmDJVP
X-Gm-Gg: AYBFou3KFrhBikZnS1B/LIS07CyIU86CPvZ7DucxEjdeq1AIRIzd/vtAdadJoSpeN39
	OFPm5wr0KZttCDc4VhXDP+kdcBG38TIMVJ9K0+QVRg7VzqR5Q2pWx992+diM1Lr2e2RCoRH8Jqn
	ydmji15k1eIJK/PGI24k4H2fExnNvXQwORoSkB8AWQ/XZReoERwV5wMfoz+97iRUE7wxwmeBnA8
	jj8xpeSG2UxuWthiOOcpXEMRSMo51IUbjTbgiQT9tWUQlV2fA3fTVZQ++BEvJhUIuzv4PZl+NSW
	Amve0/qbwM+l+kC7+G9rSr1a4na/Jc9sucPfKkQt3TXpsxIHqaz7nGRGec2lIQH0ALmsY8KmqFW
	OChZsYRiawI91uoB52d5FOc8Gl1II3IoUnWUQhAP5Av0ujCmfLUj1mp4WI7+j3MUJiCC2jwi7QG
	RUwPMXSTEdINqyD8MnKKrUhgXD6hgZwnv3fe2i/tSq3xdV3j3hu31FlEBTtI6tzBMqRtNnXQ+b6
	8CdUnDPzNHDP5a1kxmGeQ8=
X-Received: by 2002:a05:6820:179b:b0:6ae:774d:45ab with SMTP id 006d021491bc7-6b6fd8cdab9mr5371183eaf.27.1788536733038;
        Fri, 04 Sep 2026 08:45:33 -0700 (PDT)
Received: from localhost (ip68-107-67-45.sd.sd.cox.net. [68.107.67.45])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243bfbe3sm7513320c88.11.2026.09.04.08.45.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 08:45:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 04 Sep 2026 08:45:30 -0700
Message-Id: <DL6NCV1KQ9F9.6K6XZQCS4AF3@gmail.com>
Subject: Re: [PATCH v1 0/2] efi/tpm: Preserve event log without changing x86
 E820
Cc: "Ilias Apalodimas" <ilias.apalodimas@linaro.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>, "Pavel Machek" <pavel@ucw.cz>,
 <linux-efi@vger.kernel.org>, <linux-pm@vger.kernel.org>, <x86@kernel.org>,
 <linux-kernel@vger.kernel.org>
From: "Jasmeet (Jazz) Bhatia" <jasmeet.bhatia.us@gmail.com>
To: "Ard Biesheuvel" <ardb@kernel.org>, "Jasmeet (Jazz) Bhatia"
 <jasmeet.bhatia.us@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <cover.1788259938.git.jasmeet.bhatia.us@gmail.com>
 <a9e23066-aa75-44be-ac3b-9a15f4cf6047@app.fastmail.com>
In-Reply-To: <a9e23066-aa75-44be-ac3b-9a15f4cf6047@app.fastmail.com>

On Thu Sep 3, 2026 at 7:18 AM PDT, Ard Biesheuvel wrote:
> Hi Jazz,
>
> On Tue, 1 Sep 2026, at 13:34, Jasmeet (Jazz) Bhatia wrote:
>> The EFI stub currently allocates the TPM event log as
>> EFI_ACPI_RECLAIM_MEMORY. On x86, this becomes an ACPI data entry
>> in the E820 map.
>>
>> On a Framework Laptop 16 (AMD Ryzen AI 300 Series), the EFI allocator
>> can place this allocation at different physical addresses across boots.
>> Since x86 hibernation validates architecture-specific data from
>> the firmware E820 map, this causes an otherwise valid hibernation image
>> to be rejected on resume with the following error:
>>
>>   Hibernate inconsistent memory map detected!
>>   PM: hibernation: Image mismatch: architecture specific data
>>
>> Allocating the event log as EFI_LOADER_DATA avoids changing the E820
>> map, but doing that alone would regress the kexec corruption issue fixed
>> by commit 77d48d39e991 ("efistub/tpm: Use ACPI reclaim memory for event
>> log to avoid corruption").
>>
>
> As I replied in the other thread, I am not convinced preserving the TPM
> event log across a kexec makes sense to begin with. This is the firmware'=
s
> view of the state of the TPM PCRs when it handed over the system to the
> first OS.
>
> If the first OS boots, loads a kexec kernel and then boots it without
> measuring any of that into the TPM, the TPM event log will match the
> TPM state, but this is meaningless because of the missing measurements,
> and the attestation chain is broken.
>
> If the first OS does perform TPM measurements, it would need to record
> them into a log and pass that on to the kexec'ed in some implementation
> specific way - it cannot use the existing TPM event log for that.
>
> TL;DR perhaps we should just discard the TPM event log reference from
> the EFI config tables after consuming it. Or add a special case to the
> kexec code to disregard it.
Ok, honestly that makes a lot of sense I see what you are saying and I
tend to agree. I'm treating the copied event log at something that
survives kexec in this patch because of the corruption fix so I'll look
at dropping that LINUX_EFI_TPM_EVENT_LOG_GUID reference and rewrite this
patch. Hopefully, that will avoid that x86 E820 instability as well.

Appreciate the guidance!

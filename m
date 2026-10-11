Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2C334EF0C
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 17:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791739778; cv=pass; b=uGIPl5nbwl2O/JgLBMttJMvvUgrwimhI4/jwbdP3AVbV0r/RMFl/eHNkG59QfT2sM/nvWII804KbfCzWzUcvV/Q8TM2Hl/lRoL3LnfGq22hC6MqTILXDbXEbZ69OO70tIFXbwKCvY25pgZWQ4oSE7LrPG6ROKlSnq/bSmoGEhqg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791739778; c=relaxed/simple;
	bh=tkjOrtWzfvAkN6ASJLjJRMDquvEPYg5g2p0E9cG6xAQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fR9EoXxOezUfbGy/K8gbWcd8ElfNlMsYHCtZ9vv0DqTIGeksyAggSu1IZEFdsohMNh34YFzN9CzD8nyL3GFvumnKQPZl2HUo8xmKb5tvbMuWkQ9xNiem5r4h30+G4SM5aChE0nvFiSnSG43ZlQSmTetsrXF+W6vZqusOJoXxifs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=M/5ZYxMj; arc=pass smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="M/5ZYxMj"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3a1585728b5so11931251fa.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 10:29:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791739774; cv=none;
        d=google.com; s=arc-20260327;
        b=Yk97orfzDjlbucsqWkveX/Z3hBCnMYiS8xfkpF6vE0U+mMu699FpF4MZqu2M70FhD/
         bZhftjPafdeTFowAnVEktDL40v0+DEJP6BZn51Z5xFVWcgf6OghIPGZVoOIFi7RG6KmX
         1nQCL9vBKz+KJas0MNidj/h878utgdZl9JlydTvdmsCmkmwlEeqRwHyK2WwzTQOKVSpT
         Se6NVcs8pQAbvqfjekaU5AETJ4wQnjx/ldi/apLCInlyxaDu9YQiDnGodLtIDEEjQ4u0
         d/00OJulhaMbV4ltn2vnQuB9zMFAZEwpq9lik+NF4ne+iq85sREqjji86CUYc0BPleN2
         JsJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lCu02LFOYMeDJJjF4fmtFwaOG6AS3l/NEzfbXyNBgZg=;
        fh=58ex/gLALHnjyeaOYvYh5Xsiazdr/sc81zIqjdSO1+8=;
        b=VuvrMGo4zS6Pld4RXHwsWiv1E+F2aDCuUyHt2AWVZHamwmqikrMQlzyawypxkUhikZ
         kdGryXASNRVDTi+wApFuj3aKwUExrjBZ8x6fnHqSIsssiPGj76XdEcqa/K7pr59S+Yfs
         K4IXJDEeIy4ZIqvlalU+i1FrZ0eIHt3b4TTbkH69ZnTUpuB2VhjL14parUbEZZwlMnjY
         YWTu/5k1dgFEK7RQcLjRPL4c4AJEGJ9t47/1t7uUteJ7FmZqsd46iixxMJSeFkCl2rcs
         8OoccAwfBYbXOFSeOjvrEZYv+ecG1sT1lKU7ZGnKEoNhEPsdcyWynRNu8ec6zDsljnGw
         pySQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791739774; x=1792344574; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lCu02LFOYMeDJJjF4fmtFwaOG6AS3l/NEzfbXyNBgZg=;
        b=M/5ZYxMj9PnXSaZWoiTkJl8Ity+azlcvU5zteYizyysVNPtEXeSGtIanr8qCd7Hm7T
         22OdcazQrc9iU/huEHvazgwTuyg2jSaCt73iAkMsTJWxyIS7YyVv+a8mfwQgT5GMt92V
         vClA8NurSz9xMTWB1YV7EvwSlfRNAhpsYw0DE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791739774; x=1792344574;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lCu02LFOYMeDJJjF4fmtFwaOG6AS3l/NEzfbXyNBgZg=;
        b=M9bcqZHDd8mrhvl4Rg+9uEc/DFsoCfXoaMd2dsMtUgSUo/nGZRlr555bNae3TA32A/
         b12z9awd+v9yiSL6zZiUV7TDZ7Y1Oxift3hoHsSRz+Qpyg/pWnnNzohiuc2JAXiZgByA
         xPV+97YcT7kLvrI2zzVSmrnS9Q7D4ffh+pss45YdDv7VkdgeXek/WahkbrVe7X0XGrC0
         UHeGYXII8KEIUo+wOMF6empN3f/T3ln+e1wMOxlxSyrqnbnX9jUB9UWv4LVzhS8uUyKh
         w+HyW8eMIP4sgXk53s5btATCBYNLci0tgepDV2tFuHrPJs4SPxp88WFfOllrSrmOB1qe
         UBMg==
X-Forwarded-Encrypted: i=1; AKwUvBxQXQccIGl4bs3MHzCzhzqh1M7AjaddjxdTD8qCAO8wWtRx7Dr4Dvp3LFLuMf6dkT8/G2sLnC+GWkqdlGY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJl/v74p2YA1WDbto46yENh023Av78kFisLAgdhLMyHfcLw65zb
	9h11oHGpKX45J+EcAbHV8yftsgLdkTsN3mGMMr0ymY5vScClq6AxD4jGH7Ison0YmUWnbQehrE3
	gQHScjG3b5GJ9ruWyo6S4MnqVQ82fwCqE+RZ/edGW
X-Gm-Gg: AYBFou3gdm4NNIG0h2ere1PMqXnWwRcNg3uOAu1KLTH+3CHEWihZeur1SGf6T2DE2mM
	k4Qh6SiFbHuabzg/G9xZXtmmc7ulFCKjokUm6izsMvjMLyPUwXiXN3EbbapR0L3tGlSIhVAau99
	ZRmQe6w/B9QQJ4Lx8PK4/s8JleK2BoMU+aU0fVZ6XmphYOFu9oGUw6QjcAzUR7tONtNqo3IBoCz
	hFEcJ1bw2/Mmpu4dr73cvZL6WX5W/Fc62V7WcSwOkB9eM2bmSeu/NwFpWP370IRvQcSlGNSL284
	FSuGLY2WkVo8FfBHKz1kVlYktd5aoiXY0W9oPl7evRIHI0/aw3SHlrhTVhyf52PKshA2/qQmHne
	ux8HKu8TH6A==
X-Received: by 2002:a05:651c:a38c:20b0:3a9:8546:ee13 with SMTP id
 38308e7fff4ca-3a9c5749725mr12016031fa.19.1791739774534; Sun, 11 Oct 2026
 10:29:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006-upstream-vivaldi-fix-v1-1-bbc9a7f14ea6@chromium.org> <asfk_jRVjY8pXzjt@google.com>
In-Reply-To: <asfk_jRVjY8pXzjt@google.com>
From: Shashikirana H K <shashikiranah@chromium.org>
Date: Sun, 11 Oct 2026 17:29:22 +0000
X-Gm-Features: AclHuK9ZAHiF05P5Ep5pwVbDh3L0xmk8bEDd4KYnMtCBumJ8hsz-7P7vYfRjDBU
Message-ID: <CAH=natbNnhVMO0vXmhTi5wipEsfMr9wy7u_PRCXDYFaWJXqoCA@mail.gmail.com>
Subject: Re: [PATCH] HID: vivaldi: Validate Report ID and length in feature mapping
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Stephen Boyd <swboyd@chromium.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Tzung-Bi Shih <tzungbi@chromium.org>, 
	"Sean O'Brien" <seobrien@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi Dmitry,

Thank you for reviewing the patch!

> Devices typically do not return short reports. Could you please tell me
> what prompted this change?

This came up while testing with synthetic/uhid devices that return
malformed GET_REPORT responses (either fewer bytes than report_len or a
different Report ID in report_data[0] than requested). When that happens,
vivaldi_feature_mapping() still passes the buffer to hid_report_raw_event(),
which then looks up a different report via data[0] or processes unreceived
bytes from the buffer.

Since legitimate Vivaldi keyboards always return the full feature report,
rejecting short reads outright with `if (ret != report_len)` (similar to
hammer_get_folded_state() in hid-google-hammer.c) would be even cleaner
than passing `ret` to hid_report_raw_event().

> I do not think checking whether report is numbered is needed. While
> transports handle numbered and non-numbered reports differently here I
> believe we always have report number (0 for unnumbered) in first byte.
> Also, shouldn't this check be in hid core if it is needed?

Agreed on both points:
1. Dropping `report->id &&` and simply checking `report_data[0] != report->id`
   (like mt_get_feature() in hid-multitouch.c) works for both numbered and
   unnumbered reports since transports place 0 in byte 0 for unnumbered
   reports.
2. Checking `buf[0] != reportnum` on HID_REQ_GET_REPORT directly in hid-core
   (e.g. in __hid_hw_raw_request()) would protect all HID drivers at once.

Jiri, Benjamin, Dmitry -- would you prefer a v2 that checks
`ret != report_len` and `report_data[0] != report->id` in
vivaldi_feature_mapping(), or moving the `buf[0] != reportnum` check for
HID_REQ_GET_REPORT into hid-core?

Thanks,
Shashikirana

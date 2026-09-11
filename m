Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACF53BE636
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789128882; cv=none; b=dCdlL73INmTFKQowGplGVkxQ4IxapPZ2aWOwDWI+NlZiD8ZdD+KrP5FpaNPTSoznBB7MQucoEBZmNaH2Sw38C2R4zQc9PZy1sM8Rq0e7LkdwON/gFCPV2tArCCiVH7hZckX0zn2bIL96Z35qniMEZZzdDnB+BHVR1zaef+1j7gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789128882; c=relaxed/simple;
	bh=A0UudHQ9g83Wm57rKo2f+BNjYF2MbrMRmJA6qp13Uuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GAsNvN1PzOocF9kStmhHUxSphz5y9ESSnH7M5GwRfrqFh6yll0yReG7na7jKogsufNUud3cm8sgY8V1RDLn9WnSoCOSJB8yhpfgPU6f0TtZhPT1n0rUiVkpCtGMrvChrLpwLaqdhZNPrUz9f2084Vud7pLkUqRH3AEnHw1kz1a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kWW2Uu1u; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kWW2Uu1u"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485933b2522so638474f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 05:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789128877; x=1789733677; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JFEgQptOfK2+BAsw9MPq5NVIYztFKbDcTNgt/rynjfE=;
        b=kWW2Uu1uW+clxJIM+/kvLbNG11zy1Tl4XwwXTuR1BFk3FL2blU6ZIJQ3XoRETM1E2z
         Xri9rL1AZ7hmOJT2dQS1cnkAS9cqdbEQntHwePVLLjdaNFqHwj5oMUJOAhIG79qxLss/
         7smNpuTQxykEPspa1aZiIwGnRWbBVKknFyusOIc/HUWk/b66iIIJosWjRJVhtpJ8AfPV
         4tCADMPVgh5KMD2I7OJb8GUmpMWNG0PFBeKVS0QFSzf/y+4L2wBkjm+eNZLSqJLmndAm
         qWstuNEA3Z3PfIA19XsZq3JXTN5pjlXVlxkrFje9ma1lDVrfZtD90oPLiG4pUUyQsM4s
         0vXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789128877; x=1789733677;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JFEgQptOfK2+BAsw9MPq5NVIYztFKbDcTNgt/rynjfE=;
        b=QfD/m+st+mm3BW1OJzR/FUXaglzHPxMbMNhGYczEOIBXqvHOomsEc2mjMQQA3h8jdR
         rj3x2GW1QsFW7khn+A1MwNK8umklotoLsoL3v3abPLeqinvElfhMG60Dclw2xkmFRr3u
         22u4HIPMtddXZ5yb1Mj8l2Uqd2pau3RByBuEeZnOXGNN0uhIUBGIUrniUvm0NvmDzCjX
         PphlztF3HivyPKOF7CSXfQk5x9O/1i0WExW5Pp7PinzGvWqWIT+8haP7Gdle7H79TMWX
         AuSfbTKWI09XmddHzoy895AaW84QQ08TEcZl7l2XlHJHJa29qTf3xAsrzTr3CG7BIB+c
         JYDQ==
X-Forwarded-Encrypted: i=1; AKwUvByJG0wwqyXjRzW8HI4H3t+coE9D3if7tT457MJrwOSbukCtk3Lh5f1ancGsm/QbXfVGipmuTmpGSSZeHs8=@vger.kernel.org
X-Gm-Message-State: AFuF++lDqQGQvyg1GPRiWjCxoWfK5128Vz/AnEoY2pzSAdUpKW6f7O4q
	3mLzgwGtpeVjKzUt0p5lWEcKGxiD+s26TMj9xN0L1Oi6CS64hiOShx3Y
X-Gm-Gg: AYBFou0vPvsHL6NgwWjoClPrAr+NxSXZk3Cl+pFGOSjjEpo53fA2CLy7SPeZ/eBsCVH
	f1X3CE+5W7DlGse27YpQsf2gthAoq4pb0XBcRio6pJWqAuM4ZLqxCnoLVGTZOOq4Twh9SYjI6Od
	GBsn1x0/2AazHdTdOvc4xTbKcDVyOwuyA2lCxFYbu+pL/yFa+rZXAcVDdVyaJyQeYGD5ERhE7Wl
	hG3l1qXyNS6KS1R71svK/4iKOewaXXoqu5I8s+TXyvGSkYnxe7BDkldT5+iYdBuLZlj33Fs9H/v
	vJ2VJwx/bM8DvZqcfJBZWRwH/1LadQPhR99/ce/CTN5Qr/eJ/UxT4ZnJTquKU2HPp1fLZAXy3jD
	S8sU+2g990EFyjYBB0mE5AI0B0YMjzhbHbizdmaV9IZr0Yhk3aXjMAIflCBrC5hKdMDPJXxejPP
	4+rFk/hT1pDGAqyBzFpD7SkOZLwugTLbbvY+H7ljKnfyAEpkwgzh30IE0H3xdpi7MTzp+ZVYtgc
	pQTig==
X-Received: by 2002:adf:f9d2:0:b0:486:e6a2:2d7c with SMTP id ffacd0b85a97d-486eb31b1ccmr6917106f8f.15.1789128876620;
        Fri, 11 Sep 2026 05:14:36 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb35f3d9sm4982620f8f.35.2026.09.11.05.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 05:14:35 -0700 (PDT)
Date: Fri, 11 Sep 2026 15:14:32 +0300
From: Dan Carpenter <error27@gmail.com>
To: Farhad Alemi <farhad.alemi@berkeley.edu>, Alex Elder <elder@kernel.org>
Cc: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
	falemi@asu.edu, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: hid: fix off-by-one in SET_REPORT
 allocation
Message-ID: <aqPwqFu0eFY4CSZ0@stanley.mountain>
References: <CA+0ovCirfyOhrXdxmM3ri9-cShD0mzPptO1qtsaboS1xscaM0Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+0ovCirfyOhrXdxmM3ri9-cShD0mzPptO1qtsaboS1xscaM0Q@mail.gmail.com>

Alex, Greg isn't accepting AI patches for emulated devices.  Is this
something you could approve?

On Thu, Sep 10, 2026 at 09:32:47PM +0000, Farhad Alemi wrote:
> gb_hid_set_report() sizes its request payload as sizeof(*request) + len -
> 1, but report[] in struct gb_hid_set_report_request is a flexible array
> member that sizeof() already excludes.

I can't really understand this sentence.  What is excluded?

> The buffer is therefore one byte too
> small, so memcpy(request->report, buf, len) writes one byte past its end,
> which KASAN reports as a slab-out-of-bounds write. Drop the stray - 1 so
> the allocation covers the whole report.

I think a better commit message is.

  This "sizeof(*request) + len - 1" calculation is wrong.  It's unclear
  where the "- 1" comes from.  Perhaps the request->report[] started as
  a one element array before the driver was published?  That is something
  that people used to do. Regardless, when we do the memcpy(),

  memcpy(request->report, buf, len);

  Then it will write one byte past the end of the buffer.

> 
> Closes: https://lore.kernel.org/all/CA+0ovCgLrz4WhPKP5LGW5HZa8VOodgeo6pWuyQGgHE7UY57Oog@mail.gmail.com/
> Signed-off-by: Farhad Alemi <farhad.alemi@berkeley.edu>

This needs a Fixes tag.

Fixes: 96eab779e198 ("greybus: hid: add HID class driver")

> ---
> The device was emulated.
> 
> --- a/drivers/staging/greybus/hid.c
> +++ b/drivers/staging/greybus/hid.c
> @@ -97,7 +97,8 @@ static int gb_hid_set_report(struct gb_hid *ghid, u8
> report_type, u8 report_id,

The patch is corrupt and doesn't apply.  Read the first couple paragraphs
of Documentation/process/email-clients.rst

>  {
>  	struct gb_hid_set_report_request *request;
>  	struct gb_operation *operation;
> -	int ret, size = sizeof(*request) + len - 1;
> +	/* report[] is a flexible array, so sizeof() already excludes it. */

AI always adds these pointless comments.  Only interesting lines of
code need comments.  Imagine if every line of the kernel had comments.
It would eventually turn into something like the Terms and Conditions
where it would take more than a human lifetime to read all the things
we agree to.  We need to create an AGENTS.md which tells AI this stuff.

regards,
dan carpenter

> +	int ret, size = sizeof(*request) + len;
> 
>  	ret = gb_pm_runtime_get_sync(ghid->bundle);
>  	if (ret)

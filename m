Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792812026;
	b=y7OkvVKPXkuP5PuhyqmfTaUGnUGpFeti5M2wNIbSwc+Y1QcJG6n4hUGcsd8FvB/XrdvA
	 NTK3djKCrSTTypxG3rncrQHVc0OtL+o1ZP8r+oHcQ6UrvMNgo+SD0iDdbrOY8PpuKeycs
	 gFUVEV+FY9sT92k2uc7ZT0WTqP3Ub6e9RRIfVyzLVHB2xihlOtyrv3ip+zGKEgvxfRbpF
	 J3Oxz3CsN5XTOIHaRNe/CeQ77ki2kAUFrSgZVmYXOMfmRblDiYMUpUWS8lOdLLzrS2zqU
	 ovHHdKFosHR1gEnBWh8JvQvkA8EZeulByi8msqzp/O2kFxS+4gTOFkVOg0oL5M2uJqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792812026;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=O+mF+cB3tiiukJFn6Uqz292YP2mX1XVgMOTaGiMv8wQ=;
	b=zKI3RDcPTVEqPtl7uXRljbnp1uDh5jUyDeaTo07JAyP/mUUbdsSXMeUE91NgOMWxEL3h
	 PVdGERRsu3v+yjOWUkZRJcwmocZtNAigH4vMPRIe/hwrGS2IrILV0M4Vf84PvOTBhaSaM
	 hHdrjIaab89iMxJgi0LNwWw6OnUz5iC25rVLq4DDNgS+VmD8I0fLQw1/q6Mqf58yg6SVs
	 YEYkl2plApQPFrQWpXG5SyACYeUN0t4Q4n5Vt323qLCbSKn5dnVNpUdkvi+Q5BukI87pD
	 Lj+sMXA9M8pKLB1GQzkd/bGpE6yfkT6spnHchxirM4/ayqPV66h+OH2H6NaOsSx+xTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="mUJ5z/fM";
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 4E0D6606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 03:20:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E0D6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mUJ5z/fM
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-353804b591eso2507859eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 20:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792812025; x=1793416825; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O+mF+cB3tiiukJFn6Uqz292YP2mX1XVgMOTaGiMv8wQ=;
        b=mUJ5z/fMyGvCGEKRx0JYzUHWb9iula1KXvW69VCyCwVEfzElqrIfycrVJ6EM9q1jq3
         t/epYquxkBGGRxoiw26TqJPrEPxRrdp32ASo9t/eACy4YBCGHZ/2MPi+FKKOWKBtUKW1
         fbqsZIDRjuOLBkDoaG3OlFDsY61MPM3H/qeAjpmyK4AB6uj+HSP+3chKwCm4QKy+CbK7
         NabBO7/qaDyBGrRNHHes8vXUAmtt/nAnMLV32saISXLSQxLzxD9D1jHUWjU35NR/V1nR
         k0hzW8qvoZuL62Xk3J85/g0rsWIk5UeW1qu5mN52uh58Alo0F2hoQlxzRi10YyAO0rYQ
         TR1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792812025; x=1793416825;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=O+mF+cB3tiiukJFn6Uqz292YP2mX1XVgMOTaGiMv8wQ=;
        b=mcWiju+5S5LAr4D92GeL62knreBb1sP7nTdBHg6WLNy195Cg4cKHClgPvmzMmfD9y2
         qA4gBLS4dSbh2iEnqb3+XOD6SfY4vZXH9uhxm4Iry01ueR69mgJmzrS+eQTsg0y/tGAl
         Mj5uOf+JGPq3v9poN4uk17IMpjkk8BYYwn8F7UZVQZ5R7nEHLtAzhUX1RBPyLhqoZ+QG
         mKyNXB0FlNkpQ7u49BPxdIPdGefWicdU0T0GTWVz2E45eNbkt1dtRrvH1KuNGYptWMN3
         TH4dwq83/+sKHLsVo+yAEqa2jCg97hrkQjC0WhH8b16AXTi+bn8yzdO4z4jd4smUGqif
         C/uQ==
X-Forwarded-Encrypted: i=1; AKwUvBwDIOOBrIHoiHBvhUl1FgWlCFseQa07HZpMtOsVHRcq/6uRXpG57DsrJyiWeG3WXE3lzGWhCOY4AFoZ3Rs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOQ6P+F/fVZsRJRMlyBGyCO7FtkxHnouhHBmOJh2yA4Y+Cs2n5
	TvNXOxnw+Is0HtUfKtxk6OOssUPb5e375t9mNQjap25KuZMMSufaJ79R
X-Gm-Gg: AYBFou3abCnHmAbLWy4Ld3Yc0fW6B+ytYp6hTEsYH0S8Sx/N/WQGCAhy4UDNn3Z4viu
	8bWXL+nDcU4zMQGkXqtn3CSRp7rzRk42OP+Y3bTkthzbPkeO9IYNTuXdt1Zgk+/kIRY4eXS7lR6
	KgnORylG2uXFHQ5O+Q73Zo5MbVGpJ8G4aPJeoUvxITFN8/LmfwaZx/1vdhywHiTxXh978p6NoyT
	PhQgcVRlasB7nKEBbaXncZyhYdbrD8BpA5TMDzZtngerm3AkteHpd90OlfL37cks3LMpG6cshe6
	bkLwpcvv+uvwjhwfFV39JzehodQH2AJM0kR3gj/I8UMht2bdI2LacqtvQ3mjQhAeL28Hyu9WN/d
	rhJkEfpKK2kDb38NOVr/A7zjCs4eKf19mok8tAl7+eqe524F8wHHN+Jy68d/I9fnkJU0ykYY0Ki
	ZY5PB7np+zmWUfW6EKli78eYlsBF44OMp5D90W60lSW59FVzqy8HhB8537qVP9VwbK3EER45DMC
	or/63wD6AQlyygiuQqQzvQH4Ue47knovC02Isinel9zus6G0cYNu5OxPh50vOV5AaJ52v5Kngdh
	8kuOd0gV4GiSNdWarKyvy7XtYe5lBkZst/V4lIjJ
X-Received: by 2002:a05:693c:839b:20b0:365:cdcc:9f57 with SMTP id 5a478bee46e88-369e83547aemr1749426eec.4.1792812025253;
        Fri, 23 Oct 2026 20:20:25 -0700 (PDT)
Received: from localhost ([2a00:79e0:2ebe:8:493:cd31:1e31:5982])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8d578casm2833958eec.6.2026.10.23.20.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 20:20:24 -0700 (PDT)
Date: Fri, 23 Oct 2026 20:20:23 -0700
Message-ID: <7b21717e80a7b779ab94d964ca40ee68@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Rong Zhang <i@rong.moe>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Ike Panhc <ikepanhc@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>,
	Maxim Mikityanskiy <maxtram95@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] platform/x86: ideapad-laptop: do not poke keyboard controller
In-Reply-To: <8cdbdcb893e2353e0ea2fe919e0c8a6a53f8b683.camel@rong.moe>
References: <4b2f60a7ceac543bd8b889b9c0772b2c@gmail.com> <8cdbdcb893e2353e0ea2fe919e0c8a6a53f8b683.camel@rong.moe>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Rong,

On Sat, Oct 24, 2026 at 10:15:56AM +0800, Rong Zhang wrote:
> >  static bool ctrl_ps2_aux_port;
> >  module_param(ctrl_ps2_aux_port, bool, 0444);
> >  MODULE_PARM_DESC(ctrl_ps2_aux_port,
> > -		 "Enable driver based PS/2 aux port en-/dis-abling on touchpad on/off toggle. If you need this please report this to: platform-driver-x86@vger.kernel.org");
> > +		 "Enable driver based suppression of touchpad events on touchpad on/off toggle. If you need this please report this to: platform-driver-x86@vger.kernel.org");
>
> By re-purposing ctrl_ps2_aux_port, you are breaking its existing users
> *silently*.

I'm not?

>
> Please don't do so, but rename module parameter to reflect the new
> behavior. In this manner, the existing users should at least see some
> clues in kmsg.

The purpose of ctrl_ps2_aux_port (introduced in commit c69e7d843d2c
("platform/x86: ideapad-laptop: Only toggle ps2 aux port on/off on
select models")) is to let the driver disable and re-enable the PS/2
touchpad on models where pressing the touchpad toggle hotkey only
toggles the LED in the EC without muting the touchpad itself.

This patch still targets the exact same i8042 PS/2 touchpad devices and
achieves the exact same user-visible behavior (muting and unmuting the
touchpad when the hotkey is pressed), just by filtering events in the
input layer instead of poking the 8042 controller behind the i8042 and
psmouse drivers' backs.

Anyone currently passing ideapad_laptop.ctrl_ps2_aux_port=1 on their
kernel command line or in modprobe configuration will continue to have a
working touchpad toggle. Renaming the module parameter, on the other
hand, is what would actually break those existing users by causing the
module to reject the parameter and stop muting their touchpad.

Thanks.

-- 
Dmitry

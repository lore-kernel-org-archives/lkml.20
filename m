Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793884728;
	b=rpFbSMN71YTI1HSFwaN6nVWhQJpZqsLx/X2nRWXWi7ULepgEFGZGqk+Tk4lJZwzaoPl1
	 GNtRPkG1rFhrE4mkY3ldotpl37ySsxGYyCxRSFNuwyAjC8r1Zdd8x/20q63dSwFRsBtNr
	 mDpnNP6f560yh+Zirx7wuhUO7L/z7M+hJSaA2tMybagxTYFhLkGjypCkRC23qZdtttTzC
	 XYEwPdKoNyLvjLy3FcCI9GYn2qI4eEjTbv4bJG5Rx7J7jYeGwshR7DaS/kOxfJ5bEEIZr
	 MKbJhO/v/2zp2DlIELiXJRFivv8G84FQ3+ydg3Hs8xtD/ZhivGd/JF6o9v9FjXRQB6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793884728;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=WioThaDIkfDjWG1mFEw1+dKntzJ3B48ROFrYaw5ERg0=;
	b=OxP8ZKdFNI2syxGM4krTQ2ZQ1z5ii11xk4xk2BzDK4B2si+w5mvWjeAzvfM7Ohq5I5R1
	 5BibR7CCsHs5oV0AMkLz9xQJZ2HvYCOkJgtWtluz0g7kci3+92PzNixs+dTJhQTBxNQgq
	 tkcaWgkDuRaF5AkklKcRpP7EAVr1lqwqG60T5HhEPvSAN91z9I1d30036oAQZwsEXBI3x
	 II0BA+I63gPvo1zPPBFxWoe6h7XBai5FrL6fDo6b+U3PRlniD+xc2F5ktoz/jsp+Hfn57
	 yt2qoejsKBEQ8EkQ+Z3lTRXiQQ+E+nwQnwmLblQTC57c2sFn360Tv98slLAib2EcTdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gVCCN+Gr;
	arc=none smtp.remote-ip=74.125.229.137
Received: from mail-dl2-f9.google.com (mail-dl2-f9.google.com [74.125.229.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACCD606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 13:18:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EACCD606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gVCCN+Gr
Received: by mail-dl2-f9.google.com with SMTP id a92af1059eb24-1397ad3d891so515132c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 05:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793884727; x=1794489527; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WioThaDIkfDjWG1mFEw1+dKntzJ3B48ROFrYaw5ERg0=;
        b=gVCCN+Gr73v3MUVBJLbnhV1b+0LV98ng6EW/VUJDQGsV4q2ORJtsbS+lfrWX95WGId
         6FIiVlAf2bH/rqCwLCWWLVbgF7ZI1AbO1jKf++NOYwhzKHjRqkWj+UHZ3hheMXP0/evm
         kCI5gAMcbW4ytsWSdskwf1NpkDbOyZmGIobSWo5figyGBI4kH4ta0Su4JLeZ+8Pnf1iF
         XuAqVu0qxEMqO0SmRGY/JKGLTAZQWf+T/mOOnZcKUIbrmLaKqFffpbf605X6iPMy14BK
         PM9sfX4LLWDSok2QY+NkVQtcS3206z/r7Fjc8KH/TVXWNdjcCyJLbzdSj80dRlibhkiN
         yx0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793884727; x=1794489527;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WioThaDIkfDjWG1mFEw1+dKntzJ3B48ROFrYaw5ERg0=;
        b=F6KGIHFidhJpa/2QDy04fdpJgtVKVlJuqJ5EwnFZZQt5BIiOIR/4qhIInPTDC002Ke
         L6ky0Af1j1NziHrlGA/lFPJxywbe/OkV9mvj0mnMQlw0f5wNOHpljhzZvep0R27Ldayp
         Sx60/D9TgXrTe1YfF19d2o+lL1Sj5F2zta4hmkI/V1nti9HGlhUXiElOKbh/fPjujrtz
         XKBuDG+aVfSPc8g0c2+8pua3DibS3LruuATxna5+DLyvsjqgL6nraSR+gpeP0QA5ZDVJ
         Hk85Ujcgnbhe5j2Pg0fU0p0Qg4qWii1E2FyR1UwItrOTuapGOEL8wYzfJrUNd4mFjJIN
         hwpQ==
X-Forwarded-Encrypted: i=1; AKwUvBx3+OwcSYPYa7SlbesTNXxMNxtdFpPsBAZzJ3wJEMiePazlIR+s16ZxNZUbnDzQyvilaUI6NXGFa50OAro=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CTlHWVwmB4/envwMg1VeGCTSA5VM/1gMcl73obRwYpEyZf1O1
	cJ9r+118Ob/+TU/pAF6CKGDblAspXC1UDiObhS4kNFe9bEZXKFehFL1N
X-Gm-Gg: AYBFou2JRJMY15x0eGv136sKFMcoCLK1hOykUMMQLRNN87r88jwryG+F7+jK+ccysDM
	wj9fC973eNDR0mKGEdc4QJrtLxDZdFluM7YOH5A8FM3ResDQxMdP6XPEA//6RpI0vofEI7aoSO4
	5xeSSsNNkA9avNL4oz6XljxLYF1r9j/ybAm5rfUBpWF7t+nVxfho8tYlF1Nn+4F9UH/pd3XsG0X
	P/eU4lZfqIRGgL/jB/fX8GJfQ7o0rPLvD4bzt+spdChxhA+iaF0gH38mP6V1jqdeK3uOOIoUCM9
	nLwXkRsPRCv2UHHH69yP1hTcLt+rzrzXPZTXYkr+yqLwaUcip47tcBLygtd3V6HqIHyNCydXev5
	WJ8r/VJnfmyKNrCz1OpdW4geFwolMt3j++r1TlR91FPh/G4z41rjm+jjhsmEHSgePqLC5gwQxTm
	l0Swz+bZDCzMQJT1hmoOOLJT1rTlEwq9fYJ5V48UkJdid0sNOlfsN4z6awaAo99zjZ6JgMQImfD
	Psfm9V1JnCJ3jLWL/t0TPLVllF2fOhS6i+Yqx78NBJRGZ8tiYBxgh4qf4OxyXG/X8lp7J7jPxTq
	c9rHsneTxhM6DfLJrwgsJnDAhJzAXe0zIlGB5wNrDokAmKEX
X-Received: by 2002:a05:7300:e9d3:20b0:369:fe81:a575 with SMTP id 5a478bee46e88-36a4243ab94mr33257991eec.35.1793884726829;
        Thu, 05 Nov 2026 05:18:46 -0800 (PST)
Received: from ThinkPad ([192.220.23.71])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d3754sm22685561eec.14.2026.11.05.05.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:18:46 -0800 (PST)
Date: Thu, 5 Nov 2026 21:18:14 +0800
From: Qiling Zhu <kmatzkaczor244@gmail.com>
To: Rong Zhang <i@rong.moe>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"Derek J. Clark" <derekjohn.clark@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
	Griffin Kroah-Hartman <griffin@kroah.com>, ibm-acpi-devel@lists.sourceforge.net, Lee Jones <lee@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Pavel Machek <pavel@kernel.org>, 
	platform-driver-x86@vger.kernel.org, vishnuocv@gmail.com, vsankar@lenovo.com
Subject: Re: [RFC PATCH v2 0/2] Add support for auto keyboard backlight
Message-ID: <aux8zfwaupCb3wey@ThinkPad>
References: <20261101100123.28749-1-kmatzkaczor244@gmail.com>
 <20261102151211.40701-1-kmatzkaczor244@gmail.com>
 <c1bfa5151bbe73977725305613842f94616a8dbb.camel@rong.moe>
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
Content-Disposition: inline
In-Reply-To: <c1bfa5151bbe73977725305613842f94616a8dbb.camel@rong.moe>

On Tue, Nov 03, 2026 at 02:13:55AM +0800, Rong Zhang wrote:
> Hi Qiling,
> 
> On Mon, 2026-11-02 at 23:10 +0800, Qiling Zhu wrote:
> > Hi Mark, Rong, Ilpo,
> > 
> > Thanks for the review comments on v1. This v2 addresses them and is
> > now split into a pure refactor (1/2) and the feature addition (2/2),
> > as requested.
> 
> You don't need to refresh the series in a hurry, unless you've got enough
> reviews or may miss the cycle. Asking an LLM agent to refresh the series
> is easy, but a human being needs time to review your series.
> 
> Please leave some time for others to respond.

Thanks, Rong, for the detailed review. I'll rework the series
following your suggestions and take some time to understand and
test the changes carefully.

Thanks also for pointing out that I was updating the series
too quickly. I apologize for not leaving enough time for others
to review, and I appreciate your patience in explaining this.
I'll be more mindful of the review process going forward.

And thanks to Vishnu for clarifying the Auto-mode capability
detection. I'll use MLCG bit 20 to determine whether the
Auto trigger should be registered in the next revision.

I'm very open to further suggestions or alternative approaches.
If someone has a better implementation or existing patches that
would be a better fit, I'd be equally happy to build on those
instead. My main goal is to get this support implemented properly.

Thanks again for your time and help.

Regards,
Qiling Zhu

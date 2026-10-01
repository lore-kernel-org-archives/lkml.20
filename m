Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713494DA9DA
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 09:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790848155; cv=none; b=GeHpWyEEykipNm5vRB6Z9HVC6rEtxpXhlCcjtcNNzYoarlICTo/vNvBRTanJP1D+dIFHGOLZ09wfyYC7V5cIRDOYTsf1orZNrdjv0IkagCWqL3+KF/TaLp+LD67OtJXHauiL/8aw8ktahs4dlit6FxTDZS4+PbLVCbopRJbNER0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790848155; c=relaxed/simple;
	bh=NHQ5nDYXM8BYX2IgM+pgg1iwszdtKaUuwjNgGF1RgqQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=UkpA7DifToi0rGjqa8VwudGibvzNr66oPumA7yy28yaCfln3exSCOsAYWHNAhRsntwGdLdIRtDEZEm1nHg7/xYQjm9uI0EGGP6ZnzP7OwgR1zyQ5JRtbauj/JIGjwh0P1/qKJCShGQEkr6NK37C8FrtUyirLBR0z8CRRJNCto8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=puq0NCTH; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="puq0NCTH"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e721b5503so59286935e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 02:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790848150; x=1791452950; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NHQ5nDYXM8BYX2IgM+pgg1iwszdtKaUuwjNgGF1RgqQ=;
        b=puq0NCTHj0oX8ffNV/yYw1Se/qg6u5TCxCwolsXTLkRcY1Sn2P6PGYYiUpP2VlYyGl
         /7AXgFljuWD3QhhgfXAPMKTzSjo/wr8lYrmH92pfJKrR8nt54A9pHTndHU3CspDceSMx
         d434+hwnKmJg/Bobec9JlU1atkFEP6QtOqzUYk41ePm1IPdQieDDAsQdZNw4IQ+gG3/d
         JbGUjo8+KG+5gqhwRVURPSbtdQb43dGc3jcCmv7xctMxHW3ZGxOeW5u4LVz1BhlVgf5X
         c7ohzzg+651j7aqVf5D5v892ObgX60brZvIum/s7wpU53rO4tNU8ASHSpx6zofPDma17
         I2pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790848150; x=1791452950;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NHQ5nDYXM8BYX2IgM+pgg1iwszdtKaUuwjNgGF1RgqQ=;
        b=Td+DSlfxrJ8gvueAtEAvMf0qUkW9M5vc2ifJ0zSnLIAetgE/9mM5xserv4nkAwMTzB
         NTuM0KJzuZJEpnOvkfx/VTpH1pmwT9uSN+sMueRx1/ek7Rc3G0yBlO8Po0y8+Oc4fIIR
         kgh88/iKrD/k4VS6FN+1j7Zil1xvJPEZAGp5x4MIwVzZd6996mIujC4H1C72Bu6NxTTy
         fXfTAAW5yPGqq0fhHN+DdlaTK1IqDd0UNnvKz+Du58a0J5yNWEOsx2bdAXpxeb5/Wz2I
         Xd59q2+vF1uyva/PcUVHzEYSrwMidh6mWop2MrQkPlbmvg3BZvDjgJHlpgfbyh3Svnmf
         Q/xQ==
X-Forwarded-Encrypted: i=1; AKwUvBzFhMM6OqLCCG0lDt6wjnB9MK5rLOc/j4eR8XghFCKJrXvps2OGojgwMrGhb/V4G/LJ6q4t8prH1rpUl4o=@vger.kernel.org
X-Gm-Message-State: AFuF++kQpGc9u74s3SQ0Vap/+OxF9CbBMkQFbkxYzsZji1JRFMHxVY96
	rcre5cwOB5kCv2ChdhROqzQ61i6UpeAdoUdqkRo8hivCJRbDTiRKnbje
X-Gm-Gg: AYBFou1G2QnlL1Eh7Vuna3g4FxSVtubzV+9ffSxUCSonnfacSY1Feh84n5CY4gtlCcV
	/KPNPLuql1+SovSLjbOZS9JhFu6XU0LbV24t7PN8ShgoRrHFAYtgZMYoKfBT6SGRY05JQk3venl
	uDadH5cTIqodJNQpk29ybu0xCpNCZx8p7r7DM3FQdOQ4v3Tu+MoCoPSUD/afGEfJ41SH6U3yJGO
	D9G9+4j3CWcwUU9B23UyZNDXILQ5YAcQy0si12Wjbf3M6DZ1une0pd96IeV0LDPqc4vZ6fLeCiM
	d48Rv5QxYVUGgqcMnsKYKmWWJ2Fz2TOd2lxZw6VgP4iGJTZOfbk300GXohoQ9DPq+a0HfHxqORf
	XP8DPONnb+8vMASct6URtjbY70fsJCCW/g5IEb8ASPBUt2ah62Q0e1qVv5oEF3KIzZ8AKrlvz3F
	/eVtSkziLVoAN+GM03HNtDbJrYBQ2X+8+bZrBIp+QpwJRxbtuHgm+bZeP2hxwM+AJCuyEXy6UJw
	CFEhLYR++a1
X-Received: by 2002:a05:600c:4e8f:b0:4a0:1eb0:1ab9 with SMTP id 5b1f17b1804b1-4a01eb01b1bmr39564515e9.16.1790848149337;
        Thu, 01 Oct 2026 02:49:09 -0700 (PDT)
Received: from localhost ([5.27.43.223])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0226201aasm39558075e9.6.2026.10.01.02.49.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 02:49:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 01 Oct 2026 12:49:04 +0300
Message-Id: <DLTEONSHWRPQ.1U2Y6GDBRURFX@gmail.com>
To: "Viresh Kumar" <viresh.kumar@linaro.org>, "spidermana"
 <xuyiwen14@gmail.com>
Cc: <miguel.ojeda.sandonis@gmail.com>, <a.hindborg@kernel.org>,
 <acourbot@nvidia.com>, <aliceryhl@google.com>, <bjorn3_gh@protonmail.com>,
 <boqun@kernel.org>, <dakr@kernel.org>, <daniel.almeida@collabora.com>,
 <gary@garyguo.net>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <lossin@kernel.org>,
 <mehmet.mkoseoglu@gmail.com>, <ojeda@kernel.org>, <rafael@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <tamird@kernel.org>, <tmgross@umich.edu>,
 <work@onurozkan.dev>
Subject: Re: [PATCH v3] rust: cpufreq: reject NULL from cpufreq_cpu_get()
From: "Mehmet Koseoglu" <mehmet.mkoseoglu@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <CANiq72ki8M1KmxhO4vSkMUfLcuqOMvZtuTNdDpS-UcJy8rqWpA@mail.gmail.com> <20260929095539.1398671-1-xuyiwen14@gmail.com> <ar38vCqqekY7T3SZ@vireshk-B250M-D3H>
In-Reply-To: <ar38vCqqekY7T3SZ@vireshk-B250M-D3H>

On Thu Oct 1, 2026 at 9:25 AM +03, Viresh Kumar wrote:
> On 29-09-26, 11:55, spidermana wrote:
>> On Mon, 28 Sep 2026 19:17:08 +0200, Miguel Ojeda wrote:
>> > The From: doesn't seem to match the email of the tag, is that intended=
?
>>=20
>> Oops, no, thanks for noticing! Please disregard the tag in my
>> previous reply. the correct one is:
>>=20
>> Reviewed-by: spidermana <xuyiwen14@gmail.com>
>
> Please resend the patch with all the fixes / tags / improvements. Thanks.

Hi Viresh,

I see that v3 was already applied as 0ba1ee052b3f. Would you prefer
a follow-up patch updating the SAFETY comment, or a v4 of the original
patch with the comment update and collected review tags?

Thanks,
Mehmet


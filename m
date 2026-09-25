Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25764BD367
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790350969; cv=pass; b=PPOsG1akrt2LRA7L5hsdfftfZdGpF2srdHoJnOhbKPvU4CvQwyXA2VNi63Ef+qOmI7SF7MTRjUMr4367bKv1yO0jX2XAPRT5KxXR3UOZmKAUS+tshcbNc30+TTSszd3pOq6i0jTRzrbvTCuUs0SBjJV2xmqP3KWKGWWHgxpL6To=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790350969; c=relaxed/simple;
	bh=mmwxA1Qc27WddHPOxjfsi9qP+MwlgkxmC3KjpOPgTJI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HY2VH9WgT5dg8dvdC8EBt0F94DyqhC3WJvMvhjR/Qz+YUX8buBuq6nYq+3/2DM07Mwsx6MueU+2SPgXJG0s7LiSDx/ULk7YvmsApbAB1LQJqw6aN5MCwkKCigxbIqJp7jMeyp0ew8CxAZPp8q8YAd8mXiFd5fnQy3aOjsJlUqfg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qqf4+gtE; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qqf4+gtE"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f1e419so363055e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:42:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790350953; cv=none;
        d=google.com; s=arc-20260327;
        b=MAWEpF1sf0JciUQKw9yIyGQmyJ9QmuaC8Igov5KJQ9XTQZHuEncRKnO4JzS7ykqZpp
         QAT33S+6Nwm1HQWehS+0GoBgwDiJNCSGq4UDbplT8Kcl5Hm/llcFulxPfC/2iNl7sTW0
         1SmCpqQ19Pt94fjYL8xNPPoseLYo7KIyf9HI8vQhAjeTOGqsJ74nzRMAEhrSi0Z2tXrk
         jqgGOJxcq6/SgWGIG1QBQqfkZsLOF55HM4HPD3cPMMpVr3HGbIhbSsXZDddGaC223giy
         Yuua1lZ1NMBQlVm9Erf0vu9eKpREimdDR/NJBU1JbveYKOu8vQinWTLc/KW1gpP+gYzj
         9V3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lU8qhn0KHh/NjdXVEI94/uagsar860Baf7zBNg1vPEQ=;
        fh=YzmsvGey3j5I/19HItQOhF17T47+Zle0M9oVg5WAUHE=;
        b=QxlQcTuBaJOXUoxjKxx5ytgVLxuDWrGQ81O1rbAJCF7A1y6YUxB1g1MFlXSKSVnRTl
         M5aNQ1RqXdP0YMZOpIavQVna11QE2M+dvO8v55sTSK2f4sNUUXQOEJ/ukw9YgOXNOCjm
         iO48i/30U91cNZlurKT/QrKLHYQQ0tOxdT/PRwWzvIq2cPBDsYxeCnMSY197/L5TrdPl
         hEeLDgSlyYy0qdzD+JVAGh5GG5JgA6/ZlMUavRoq/CX2K7kNB5SeGxbwX+3q9oLllEL+
         UAFughujo4qnchSsD+oW6bE7LRb3fp88IoJsJrSha1B/Y90goqsWnQAsCy8b0bHEZxlb
         gLKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790350953; x=1790955753; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lU8qhn0KHh/NjdXVEI94/uagsar860Baf7zBNg1vPEQ=;
        b=Qqf4+gtE9uNY7gmBVGOWHJq+WjlUweFukCnYti4BbBjFNuQ18mEXrYOKAOqAFDoOmP
         ypEOR3XlRzkzrLDRlAgZgaje4gv5xwAPIN9FbCez36uju46A0yyYHIZEJWtT4ndy3bFX
         UTZYBQOEf6W7KPTfExrmUC+6HKQC2PIFcuQKj4EabE5q348qkafyqka9Vylag868zu90
         mwIk9rdAGQ3gxnXiaYmOvJBZ4ACK6hqy0k6T0jGQPSWmUTrVV0FrEIyh+k+ojBq0HOlz
         iV5CE6F3qDRFjZHRyXEZWvsBK8qKx9IWe3M6UlKmRs5Y8nXEg9mjmIPcBpOnDsTr8UwX
         l+cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790350953; x=1790955753;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lU8qhn0KHh/NjdXVEI94/uagsar860Baf7zBNg1vPEQ=;
        b=sTXet82BRReA/autYkvpNwkc40SAqVahNYztqRR9+grkoAuB00sM+GfcKVRl0HA/1R
         W8TqjPZb5r+UWSX+2wyKd8ZOqIi7FEtlu+CTReyFkxsoj/ELkcaI/vulfcjc7GQ7OdPn
         3CSItmM4ECaYhVli9+HiUkynsO0fqJDwPFUvzWZzus8JznYveRRU5QwePAoAKnrXaIHy
         nQZo6N5NeHnQcKjJNzNf5VCoDv1RBbMMdFR/A6RcCQRZAiRLTu86IJFCA6vI3oMtzq/a
         9X2e+5m42pU2CcZC+WZOmEFI58P/oKHAos2Z0USOuazpXbWA4giSozb+IesyHAT6Dt9W
         9H0Q==
X-Forwarded-Encrypted: i=1; AKwUvBwt7uZjVcbXN/+XKkndvMeudl35OORTTw4DRONz7RMTxTTVp0v+SWLBELmzLK+WP1SFOyy372ccWGhu/Eo=@vger.kernel.org
X-Gm-Message-State: AFuF++nzvKALSX5L1Q6REeSGBBUMw5fJaFI5fFgx2Z68TEElv4qe3sef
	J4w/wyHmHqtbkXReLpfrkam21xqCctLMADIEDrRfGlUSKSYisDD99fj5P/vXtBmzD1bdl1avDjl
	m6ebZ+d6Hpt35nPmcKDOrQWw0MkpGKbU=
X-Gm-Gg: AYBFou34aNOjzsNCzZxcHV+nOwEhLDV8005bDnDB/sokJf9uOOAHF8HTVLPINBcFmoH
	jK3L/R1abQnJW4lkewiKW/sYvhbfz4jcd/dk0b5akk3eKbMVUyKTXY7rVHErDyVcARTIEHHxnhd
	lJcPvIDGABcAAxWThhmSZinm7FXIEUPm/b7WMumzNsr5Ml82H5j4TOBQKU14c1/swhEhar1mI5I
	tYgJP8sZ6sBTAfwqj9HNVMin28SiOeY6gNxta0cgJUE3BPNimrh7BXxmg3EvEd6xk05VZaos9eZ
	7JGCSLwZ46T3UN5Y8OWMWC7fYeziNHm9l8XLKxiNjj4iuWw/zZI1EZaj2sMyhhU0dizjXJ7W+ua
	MIpeZE+gbeKb7dipM17Wn3FJaAZ04VZFenmfbZMIVV8w=
X-Received: by 2002:a05:6512:64c9:b0:5b8:5e0c:e22a with SMTP id
 2adb3069b0e04-5b8df09c14emr1320931e87.1.1790350952692; Fri, 25 Sep 2026
 08:42:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-aw88166-cleanup-v1-0-11f74cb5fe28@gmail.com>
 <20260925-aw88166-cleanup-v1-5-11f74cb5fe28@gmail.com> <ab6f28d6-4ce7-477d-80ce-ba076cc1b025@intel.com>
In-Reply-To: <ab6f28d6-4ce7-477d-80ce-ba076cc1b025@intel.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Fri, 25 Sep 2026 10:42:19 -0500
X-Gm-Features: AclHuK_Q_dLVZMXu2KW5SvoFLTRoaPvRyceVifNOnVEkMwHgGxGrQ98QdtZKYOE
Message-ID: <CALHNRZ-_d5vHUPjz88O8OT1zAmVu4G0cEr=JVRhGO6upyqWJiw@mail.gmail.com>
Subject: Re: [PATCH 5/6] ASoC: codecs: aw88166: remove async start
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Val Packett <val@packett.cool>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Weidong Wang <wangweidong.a@awinic.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 9:35=E2=80=AFAM Cezary Rojewski
<cezary.rojewski@intel.com> wrote:
>
> On 9/25/2026 9:47 AM, Aaron Kling via B4 Relay wrote:
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > Codec drivers are not supposed to do anything like this. The result was
> > that the first second or so of playback was essentially inaudible, and
> > very short alert sounds could be missed entirely. Let's not do this.
> Do anything like what?
> Let's not do what?
>
> With all due respect, the commit message found here is so vague I'm
> surprised people even review this.  Your change is not a one-liner
> cleanup.  I'd expect at least a short description provided, on what is
> happening _currently_ and _why_ removal improves the functional
> behaviour of the codec device.

As mentioned in the cover letter, this series is a direct copy of
changes to the aw88261 driver, which went through three revisions and
was accepted in this form. The matching patch is here [0]. What makes
this worse than the already merged patch?

Aaron

https://lore.kernel.org/linux-sound/20260529200550.529719-6-val@packett.coo=
l/

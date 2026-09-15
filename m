Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D84346E54
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789511079; cv=pass; b=tuke5eNWwloVCmBnvrHEl+p50jyi/ZTayw1kS5zWHW0ziPhC1VNU/Cob/s4W8ifBPOJdMHoJn0RaFDcLE+U5Qw6ZGnk8WAMOaIwq5/Hf+LFXhIjxW0PTXVRN1DjnJhF0CqYnuFy5kwab+NwTt8w48Ju/Uck2MmB62W8XZaeT+NA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789511079; c=relaxed/simple;
	bh=glk4hLZeB8BNV8FJN1ZJEgfUHPNFsCJRMeqWRnKIk5w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lXTHQk60jgDnEC0BIhUXRDlPNfASpAX6TSuI6qIuMMnrCnY7K3g+vRoLr9m9rpLuaUCUYXV4WYDpMgNJdCK5utvnqT/8k9MZvw1qQJ8Yo0j70QRcB4F0l+Ojj690QIqMW5sB3yjzqat9y8ouXTRdpBX5gZ0MgjtRq3V7HjYHAZg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WmS+vzDh; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WmS+vzDh"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f6c7a56so53580666b.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:24:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789511076; cv=none;
        d=google.com; s=arc-20260327;
        b=L87yrLJmGEimJe8LQdLCH4aV95KSco5vm3IDrIDf3K0XX1SemKQifJzkBevGTnH45v
         qSz9y4Rej5aiR3bJDWNHuqhbYAsL4ygRpDu5kniMXeL2y5TK8M54bubJ+MWhEMb8B5YM
         iWDeUcchV77748ChLCtngO8IXGXDkEQOAqR0xlFQRyEhyIjywi4tGmO1QpvpTLAr6xOo
         MOj7R8UuVkNiS38vlZzxFrwyTiOhNqeqgJ3ccoUo4pTotlcW0WQPRLXaXPTX9GIME3w8
         dOLAVNvNYaWvbADwkHKzZX7cefmz2UNdw23/UpsQbFCnG0yzpnog2xLX+4+aKKf6gzzd
         Pz2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fLnNBMG5QZIWbGY+kDvGdV9CDFonw3WRgIqwznl2sBU=;
        fh=sMDze8zaFcP4niAbrpciDLfyLkunwNlRm/dLedN2eg4=;
        b=oA2Zesk+B+61vKQWz8Yzd8HBRWeZMH6ZMyt2Xiw4ZH+ADnwBh5hFSuVzMuRZhCyx/j
         BTbeVhyHFzSl8jFZmZU6tzR9BmoQPK9eekOJatwgHuePMEjL049ppA1TGqiF7WAfz49H
         zINOLlcRv6xzeqwoL0q/U40PjSeT7jTIlJpL04jlBs0Kq8vHjf+GJSw9lUDHLRPIL7Mv
         4Bf5iEAKQ267+Eb9pQ1lQUp/pWkQQO8bQEDfivEFT4l3oVtjiQFpRlshwb+ATt/qoRNF
         2B9B4BdNqtbmxqRLohfNJsqOvPTmNpKH6iSOxovUNiC8RXUR3TyWMlpWuAUTmyiLu7IH
         sXWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789511076; x=1790115876; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fLnNBMG5QZIWbGY+kDvGdV9CDFonw3WRgIqwznl2sBU=;
        b=WmS+vzDhtKSAP1T3o2albshqftmO4o34Wgl03JMuAY41BGbogAxhIp6Cm36PUjS5Ou
         e9t4JqZC92WqM+jGcIlEMR/eGDSh/1arQhwcjUiZXMHzz0QYoI4BYp3rKBHzLvNnMiqO
         jSarpH1uE9vr/ZJKZnAnbe2T0bv6qpQ7+sLreL7tqlTzA/XGnhOt4LlMNG64xVuz9z2/
         OWJL1ssYBgtMUlPUpYMdbh1V/zdJHRGk8woav+nD8v8j2EBkBzGUHyb6lobGLbjNGE27
         iN9zP86GzVKQ+U1pPK8Q90V+WQb+oRNdJaB6PLhgUzZEJ+3If8Uj0Y8pvNj+5euwFeO+
         C37w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789511076; x=1790115876;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fLnNBMG5QZIWbGY+kDvGdV9CDFonw3WRgIqwznl2sBU=;
        b=ODn+6CUkMyPI0LxcyWIVVmIqlJNx2cLq1nScaicDdZ3FD2R/B7sgKxQI9xEArwJpXF
         /c9DSlIQWGkME2kUOvqEa7zn3/cFTQhxi0exyE4b68n7RrCHVsd042nB1RN0INB4/K5f
         GsQzUyr3bw89SN1Ewsu9eReZFbz0XEQtDYHh52fSae70EbGfa1OEd+X4ZLCGW/h6JDvT
         GUyRVExw2OcYO5DrVaoeQu9M6K0o0DMmZs2DJShBtTsRkiefye8jAw22OLzvTgfSNSjR
         FEhuExaPXq7OmKytwvmeMKW3HWDo0fqmBPDWHajEhbD6y/DBIFN7dLcjHzvtBJ/UqwS1
         8amA==
X-Forwarded-Encrypted: i=1; AKwUvByOu6Aeh1N0RahFgrnM1L3MSHL38eqJckEg7t0ey/46IMAtZ9uvDuax2k1in3Gjy4JfAtVSC8Wrk3GmV+A=@vger.kernel.org
X-Gm-Message-State: AFuF++kcEKGaNpvuUW4pGixAGGkY70DJdhFtCKjSQmlAu+kCEjmrtwie
	6B4vYjpCQ1Y3F0Wts6vtlZgLhmnxbZ+JQxPXalzxNl3iNP6L2L7QbNa1gyFkJpVdieErjAXCWEI
	TBYrWmMsI26LVXa0g+FiP3z+rhpAx85c=
X-Gm-Gg: AYBFou1kLFw5AYJ65rICXcfFjyM7IvsKTjQOczyQ9NQBlhxvKlMbHgUjdT9xotCu2yI
	2XNlg0XwCBYZIC3oFPWudxk1NgNTNHFdnTKtghddQMiguMA/0+fPBZkPNlEStet/USHNirBAvTn
	MZsl7q3wAdc0K4E3/7xwwfLAHcnFQixOikOBWfmUkiAeYcIs0bBhz+Z9jh8lBoBv2vnuo3BlA+O
	wz1fVwiAFXNlyx3FT0q+ksN5piF4+6m/Dbk8BPXROPs+IKrc4LuUXln+52ajY6zAuu19T/Nd30O
	J3Aq8T5XyNAXupO2AzNdp4s/dklk+tJO5JbyZ5AWHkvngNMQ8CVJK+9Xfci6MAc4n/3yBzZU3PY
	2iX5yxMLRZUJlKNkE0XNyRVlw0MrCi8bJSDTOmV7smnq0LYSdFbRXGqEG88NMWmc0xQZGRh1Zta
	Wg/OmnH0rtEdfJsg+s4ik09i2UPW8iVLy8nO/ZdP2+pfJyZLw8zumZOwFRYqSY7acmIoM3KACK3
	eBf
X-Received: by 2002:a17:907:d26:b0:c29:c356:6984 with SMTP id
 a640c23a62f3a-c29e51dbfdamr6340166b.8.1789511076181; Tue, 15 Sep 2026
 15:24:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915004406.115230-1-rosenp@gmail.com> <20260915064352.T4HiPnt_@linutronix.de>
In-Reply-To: <20260915064352.T4HiPnt_@linutronix.de>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 15 Sep 2026 15:24:24 -0700
X-Gm-Features: AcwNN1UmrBuelDzySu3Or0uOP888_AzAr6sVGxMbhPLw-5AZIgjqW0vcNetLvrU
Message-ID: <CAKxU2N_+H50zy7V0FR-_4KiyAG8+_x4kg2QZBsumHEXgdwmqKQ@mail.gmail.com>
Subject: Re: [PATCHv2] gpio: mvebu: keep resume masks within the irqchip cache
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:Real-time Linux (PREEMPT_RT):Keyword:PREEMPT_RT" <linux-rt-devel@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 11:43=E2=80=AFPM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> On 2026-09-14 17:44:06 [-0700], Rosen Penev wrote:
> > mvebu_gpio_resume() writes the edge/level mask registers saved at
> > suspend time straight back to hardware, bypassing the irqchip's
> > mask_cache_priv.  genirq skips mask_irq() for a line it already
> > considers masked, so restoring a bit in hardware that genirq thinks
> > is still masked leaves that line unmasked behind genirq's back.  An
> > asserted level line then has nobody to ack it, and the moment
> > interrupts are re-enabled the chained handler storms, hanging resume.
>
> Why is the mask value changed after suspend?
In order to keep genirq and the hardware in sync.
>
> Sebastian

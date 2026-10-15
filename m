Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA26C5293ED
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792072707; cv=none; b=H7B5bmxXr9JL9/86p2aq06N9v9UBNjZI+89QM+q0Z+t089u8RIq0pZZ6r2n+AGCbH3TtS67MsrN05yjHeaTOrAiXQhko+u8knHFC0A9Osj5JS7VrELwjMr2/eXVj/xlB2wLO07NZA7XfsNB2tfQtLwosU9lIkPx60j28HP+qnss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792072707; c=relaxed/simple;
	bh=CICcyDkLBlgP0XbsqlouCRaSY2ZySTTQkbqDa3AC5pM=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Ki1KYp+BB/lp71vJh0cFww14L/O0wtUqEpHBe9yR8mR5jKdmToiVKrvBl7JfT6avQkz2ht4cpw0XC8iX7M94h7+n8/qdd/wyiFwI9Q5pYsCHbjAHEy2OBhGHpXhw9b6ukO1Gw5BHuVQBDn5MLVO6fj4VweJkFbluK6G0IMnWGdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V0QarqSx; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V0QarqSx"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-89ea35973dfso33264b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792072705; x=1792677505; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CICcyDkLBlgP0XbsqlouCRaSY2ZySTTQkbqDa3AC5pM=;
        b=V0QarqSxS/LBSThWWzo7eT3JB5WdMp/ZzlJ8xsOOFVG3seaQLAodhDpqA7ptiiRbm8
         xlwzeK+xxOxIAxJMXynuRLhZjSIBHvhueW//sKaXcZu0Yrc9LHO0vhvWZMJRBgho3pJ8
         DgirW9su++8Q/kCk/yeFvu1OmGqxAKbXBYWxLhWASaFmp1PQtE9sdmla9QxI+pnNcYw2
         N9K5TB2MiLD8oj7QA4a4mSFjUkGJaXSs+nmmERkdzKKhmcUR56UtkY+HuFxFhgzcAdcx
         NtBkxU3Eg9frAVHAI05CzntDfedzQQGZ9Xjznw7uUrSIvNGIcKsdH6iaM8duxsBmu7FM
         dmmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792072705; x=1792677505;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CICcyDkLBlgP0XbsqlouCRaSY2ZySTTQkbqDa3AC5pM=;
        b=bsMPo77dDk+sW6xNupb4oaGp0V10OEDDz0lHPcNJ3LPTcji2BtgKAi7rYADb0+5179
         vv4mzf26ZOob5p9LNHy8nIUA19xZlvA6S69J9VqAmy81qw1ymxjclWtooe3cONIgMRsJ
         ADsqMCphzGtu6uomuqEoCQv9cgNWg3s6p1Rro/hC63RU+h8f8voFW8W8fOAMmD+q+HC0
         +cfly3XLV+/bXO3u0o/ywR35AklWcVK/8SfFKhqPrTV5ljMkV6fgOzktPbBimiCVUNlG
         c88weLU2wyxVp24YfYQD9bD6Zrqz4gw30P7oCMQ0xjGgncXZV6IFyW4N3MaHZU7D3Q1i
         2sag==
X-Forwarded-Encrypted: i=1; AKwUvBzx1wXBrb4XtOdnpZ0a4t3IT+ykFtcfJRze0PsCXHZaOdtLQ++ByPiCyEoycXRDqAAC2HJccVIqK7Qnup8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBa3xnfCQq244BgjpzP3MbXvfUd4aiCLkp4NWN7HloudyC7pNp
	C1SQDv89aDBOXuM9M0UADHMwDb7kA66/F0KW8MbUZBYUFwgmpJpv9bRG
X-Gm-Gg: AYBFou04+U+NhbzJLbwJB91jBcw7PBppXvUuNDlHAkUKG/nRLPwwGq1uyDXe+1/B3B/
	+OCC0X4IDSqKJqeYZKekXcZo9mgFO4TaiHkUNCak7Fn8kE6fZJl0aI0TrIJxB4OOTCa3/CD8dbp
	MR7NMFgTuAU2vZjwI783rGmiNvTPjvaZGMaveVAMGH03XSw0Maz/TFWlCiqhPS1YN1p9ER6Oiik
	k6D3x/KTMLYqTjaSlaI2oSwermgh3b+gvXDmdBNGiFXhIffKFYJ+PGk/9HnFyReyLNFgHHm4htd
	P7MALKSUQl+WPh5qf8+FiFeyu3YWelDlgbmYRSjA76ISlPExFF0TqRkfabBXdJBq+9mt4AG7aKy
	mZRcmiXsP74GbeT38CCmSFkNl7Yk7331C8NwXCfyINctx24fJhusx3UvS4WfdrJk+aQAjL1Cuyr
	1LWiiBhiV+GbgNTRF53KXaz1bnvPaYqDPx3Mp9RQnQchiXNjGjSYZdZ6ksLRmmUQjGztXGVckeG
	50xtp4LOTlDb0lN4KsU
X-Received: by 2002:a05:6a00:4a86:b0:89e:f07f:d848 with SMTP id d2e1a72fcca58-89ef07fe383mr756538b3a.3.1792072704961;
        Thu, 15 Oct 2026 06:58:24 -0700 (PDT)
Received: from smtpclient.apple ([23.247.139.92])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d802a437csm2447219b3a.19.2026.10.15.06.58.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Oct 2026 06:58:24 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.8\))
Subject: Re: [PATCH RFC v2 0/4] gpio: loongson-64bit: add interrupt support
 for more models
From: Miao Wang <shankerwangmiao@gmail.com>
In-Reply-To: <CAMRc=Mf0c8mqU46xqNVZRF+GSy=uZnHq_o90UsQXi+tUwgzEDw@mail.gmail.com>
Date: Thu, 15 Oct 2026 21:58:08 +0800
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Yinbo Zhu <zhuyinbo@loongson.cn>,
 Linus Walleij <linusw@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Transfer-Encoding: quoted-printable
Message-Id: <F0F05A76-F67E-438F-BACF-F5B118A491AA@gmail.com>
References: <20261002-loongsongpio-v2-0-6e3eb150a4ef@gmail.com>
 <CAMRc=McnDBO6OZx6p9HGHn=Yyt8ydD=8Z=zYZvYvuy-_DUq6tQ@mail.gmail.com>
 <7D6EB1C6-0CCB-44F1-B698-89B0479EEDA2@gmail.com>
 <CAMRc=MeW2nR8W3_4266N05p3Oa1WPNJhA92+T3miXQ0k5CsyJg@mail.gmail.com>
 <317E251E-9135-4376-B813-74B8A748FD72@gmail.com>
 <CAMRc=Mf0c8mqU46xqNVZRF+GSy=uZnHq_o90UsQXi+tUwgzEDw@mail.gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81.1.8)

Hi,

> 2026=E5=B9=B410=E6=9C=8815=E6=97=A5 21:24=EF=BC=8CBartosz Golaszewski =
<brgl@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Wed, 14 Oct 2026 18:20:49 +0200, Miao Wang =
<shankerwangmiao@gmail.com> said:
>> Hi,
>>=20
>>> 2026=E5=B9=B410=E6=9C=8814=E6=97=A5 23:33=EF=BC=8CBartosz =
Golaszewski <brgl@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>>>=20
>>> On Thu, 8 Oct 2026 12:21:43 +0200, Miao Wang =
<shankerwangmiao@gmail.com> said:
>>>> Hi,
>>>>=20
>>>>> 2026=E5=B9=B410=E6=9C=888=E6=97=A5 18:04=EF=BC=8CBartosz =
Golaszewski <brgl@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>>>>>=20
>>>>> On Thu, 1 Oct 2026 20:13:18 +0200, Miao Wang via B4 Relay
>>>>> <devnull+shankerwangmiao.gmail.com@kernel.org> said:
>>>>>> This patch series aims to correctly add interrupt support for =
GPIO
>>>>>> controllers found on more Loongson CPUs. The GPIO controllers in =
such
>>>>>> models do not have a complete intgrated interrupt controller, but =
choose
>>>>>> to delegate interrupt handling to their parent interrupt =
controller.
>>>>>> This sounds like a heirarchical interrupt setup, but what makes =
it
>>>>>> more complex is that multiple GPIO lines in these controllers may =
share
>>>>>> one interrupt line on the parent interrupt controller. The =
details is
>>>>>> described in the third patch.
>>>>>>=20
>>>>>> Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>
>>>>>> ---
>>>>>=20
>>>>> The series looks pretty good. Who is the RFC addressed at in this =
case? I can't
>>>>> really answer the questions from patch 3/4 as I don't know this =
platform nor am
>>>>> I well versed in ACPI. Maybe Cc the GPIO ACPI maintainers for =
review?
>>>>=20
>>>> Thanks for your review. The RFC contains two questions, the first =
is about
>>>> the firmware interface, including FDT and ACPI; the second is about =
the
>>>> way handling the delegated IRQs.
>>>>=20
>>>> Regarding the firmware interface, it is to be decided how to =
declare
>>>> platform irq numbers for the GPIO controller. Such a GPIO =
controller
>>>> may have N gpio lines with M parent interrupt lines (M < N). The
>>>> firmware should a) list M irq numbers corresponding to the M parent
>>>> interrupt lines or b) list N irq numbers (which might be =
duplicated)
>>>> orresponding to the N gpio lines. Previously b) was chosen by the
>>>> kernel driver. However actual ACPI tables found in the published
>>>> firmware chose a). The discussion about it happened in [1].
>>>>=20
>>>=20
>>> Unless it impacts DT systems, I'll let Andy handle the ACPI part. =
Please Cc him
>>> next time as I pointed out under the RFC.
>>=20
>> Will add him on the Cc list in further revisions.
>>=20
>>>> Regarding to the interrupt handling delegation, since there is no
>>>> complete interrupt controller integrated with the GPIO controller,
>>>> the interrupt handling, including detecting edge triggered =
interrupts
>>>> and masking/unmasking, should be delegated to the parent IRQ =
controller.
>>>> I want to check if my implementation approach is acceptable and not
>>>> violating any implicit rules on the interrupt subsystem side.
>>>>=20
>>>=20
>>> I'd suggest to run your implementation by Thomas Gleixner because =
directly
>>> accessing the internals of the parent's irq data looks fishy. For =
instance:
>>> you call irq_set_type() directly without going through __setup_irq() =
->
>>> __irq_set_trigger() which does some additional bookkeeping.
>>=20
>> I would originally tend to avoid directly calling into =
->irq_set_type() and
>> other handlers like this. However, the IRQ subsystem does not seem to =
provide
>> APIs to mask, unmask or set type of a given IRQ. Furthermore, =
__setup_irq()
>> is for registering irq_handler for an irq, while in chained irq chip, =
however,
>> irq_flow_handler is needed and should be registered via =
__irq_do_set_handler().
>>=20
>=20
> As I said: I'd involve Thomas in this discussion as it's his =
territory. I'm
> afraid I lack the deep knowledge of the interrupt subsystem internals =
to be
> able to help here and I'd also prefer to avoid adding any new abusers =
of the
> IRQ API to the kernel.

+Cc-ed Thomas

Cheers,

Miao Wang


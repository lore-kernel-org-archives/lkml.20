Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075C23A48E2
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789633493; cv=pass; b=OL46NTMIJUnulF3eOR7xVSGZey3GtObYV4yEgAF+/1hYnLDwuCYabI4byOg6Hz+Po1gjNPpJjS7ImR30xpxALl/oWAX61Xwx75wcdzstdRE+1Oj/kNl8SslCVlfRDHlY+d9qYuNCNg7OPClUU1zAzGfTz8j+fvGZMsv0e6B7NQA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789633493; c=relaxed/simple;
	bh=r2S4M+ZWj1phTNXOZ/5yE5XvxkCbLMX58PHwpwI7Dn4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tPm5sajjflezofFjWshxLtAxNvaeno6GSW1eAzpmkKgIk3rekk/BegEx7gn2Pb4ZXMz2WuDLTQaxhOptmgLpED8N2Nqazv0xQYsBgocx0+gt4X7OC0N6DoGkApv3G7bRnHtH1/FdacCaxUvDFKDdb6TTimMJnxzRZeKu5ehJn1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dLP3GBK3; arc=pass smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dLP3GBK3"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-530d8a00bcdso3095491cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:24:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789633486; cv=none;
        d=google.com; s=arc-20260327;
        b=MNL41LLcnPdwmJz48/PwTO8Kzn+me6C1onrpxB8dxnvJx5OdnQQ784cC87uonVatRU
         D0c4h/+9VJrr1s9Vd25/TE23Ta7G+faBL2kGZyp8cLRx1boAfYtfB7VEQZ8ND7paXBOg
         vEMLMrxovW1lAskfiaH88iz6FiR/ReogAAEF3tODym2AW27rQmr/uKe+BI2reLpR2TRb
         IaX9+S//7c+EXhP+3EoM3af6juDlAa219/+L06JrCHQPHPk7PlL6+hckrDgulGYk0dT5
         RO1Jf2yNWu7ALe/8/ZCm04W1moc0iylo/6//bHZ62cpJmiDQf4MhbIMlGIQZ/S2NRgPG
         tjWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=r2S4M+ZWj1phTNXOZ/5yE5XvxkCbLMX58PHwpwI7Dn4=;
        fh=KovdIYiRqgqh9SwpBK2o8Nm5pygzO2MBy3SOJ6BhX7c=;
        b=s7wgfjYZSOJ3tefBggwKdWxZD9kV+ZI8XYykTt0ZPxXV6akZkeerZSTmlgumq2tlCB
         Ve/sD++U1zwiTKBfUBgG1cndoXdEoa8yt8QYBE05zW77hhHptmH3Q4Ye+O8BwOZ6pz7f
         91r4Aa/1V8UmFDzNsaHEIW0xfv6W/vgHLSfnSdi0scM4fgCA0WvumV9bElSm/Yz0iya8
         g8NdHMBk1f50bzxkHpOxVfajulB9YB4iAuapQz8YEatwtLmplmsGowd9UuWCtUE4DZl8
         YPUXCe+VE4+Iiorz2m+GrdZmMQYeG8lRgFeYgIF936ANImHTwrdNwOfpseNu91MnplHa
         tEyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789633486; x=1790238286; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r2S4M+ZWj1phTNXOZ/5yE5XvxkCbLMX58PHwpwI7Dn4=;
        b=dLP3GBK3Cd6WoVXMwHrmi1LqwRAoYm5O/NIncsZnlCbh9LBOWkNJogIes8iUvgK9Pl
         uprZJvy8mZYwizsSGeHq0ID35zecAjYqYjtBWMMGhHaLf0ZNob36fVkO77Y/ACxf5hey
         3moh+mmyZNUtG56AK0nN91iZF956iPqpS/liS4Z//fUp/Qmu5PfH81x6XXky2EA5BSll
         kIfdDbxCo/SA6WW0XGgZxJeaFpBJWsfl0eLBQrwWXahpfdsjDQwWaFSnbTDx+qH5caV5
         5MsEVDwilTdSa/YdmmukKqcKZZsPS2dUsoxOZnb8qI5ehvnbuOkxXgVi/t1s7soISqOY
         C+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789633486; x=1790238286;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=r2S4M+ZWj1phTNXOZ/5yE5XvxkCbLMX58PHwpwI7Dn4=;
        b=ntTOVRrQTj0E/fAzW7WBatzs6YcryxEscs5I2Eut8FaSXuPS5x6YFwcvEeIaWFuIG6
         afmNPp/qQrfroFwQ+k4pUNAYYRN/Fpgr98ZBV/x4DjDbeVP0h72YqycRkV+oKblr3hU4
         wEy+JZbIrmICpj/0dbFC5CcnaZhD0DvCkb5ioJGu2GK9/DkGBv5OYjCdYtXv8vAGGCpE
         asgVPKTjTbBkxaRk09dxBLUYSnJtVZ7BvGHkDv/i7S0vWNxJPoUO5BJblQivWtYfl8j9
         0xHy1nLtEFh3nQpyvnb12UsJ36YqPzbbeWpVzfJbilbEWVubJLBtC0k9PaSKvg2Dc7AX
         S/AQ==
X-Forwarded-Encrypted: i=1; AKwUvBycoaPngjSrZmlnk3ZkTCyvCbolozXlv+8De1jhkNo9X43ftt4CKReBUAVXPatMp3tabi+Hjxb1jkekKbQ=@vger.kernel.org
X-Gm-Message-State: AFuF++klxLFuE5gw/KbU7PKDsse5QnIzz4oYcJtHfXAl4PtAIMIylwow
	JvkywnRDPvn/fmoQ3+kaz50h9drr8wLEj16wSCtk6+BVucvo83j9qiJTfBCeHXT91SJSmf89uTJ
	m51TLiDgm743ektpGyDDog1aNkSNHc9Y=
X-Gm-Gg: AYBFou1gRgVnZRnl1DtdDpVHrsVf1NmiggtyDZeKwbUWL7oVsCXzN0L5aDRzqPcxE6t
	4DilpGlVzMED9k7tN6T6dkga4LmkrfXHdtLwafNmRoRlozuYkdz5cA2+PB+tTmH+WyyYaRF0DGo
	UyqY5bAxoJEK3GyK5sEWGTir/yiajZ2XLnBBFJb1DCD3zkf3W20VCCL2N5pnZQscM/FvIEdSxOC
	DtssFMuDrjYCu0Y37Ldrv7107SXlekZYpTuCDDXDSgi0j6LB0enLdoKX2RECkENqH7q8uaPC9yw
	lLuWwC8PSyP8acEB9R2JlRUbDXxMBdevPLKCpu5uSglX0IjhGdAMhEFV
X-Received: by 2002:ac8:5990:0:b0:530:780e:9613 with SMTP id
 d75a77b69052e-5327ed7f4aamr99464371cf.8.1789633485846; Thu, 17 Sep 2026
 01:24:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917071931.8063-1-palaomer100@gmail.com> <87mrtgthqb.fsf@yellow.woof>
In-Reply-To: <87mrtgthqb.fsf@yellow.woof>
From: =?UTF-8?Q?=C3=96mer_PALA?= <palaomer100@gmail.com>
Date: Thu, 17 Sep 2026 11:24:23 +0300
X-Gm-Features: AcwNN1VQnPQe_ExU8gbeuuD_N1Yh4S4QTlzsRNiFBaOPLKoRHW2NMXy83p31l3U
Message-ID: <CAKhZXnpmg7wcwyjFuh0EQQQMke9XBKp2pndSq2awEkh+FRCyiA@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: replace msleep with usleep_range
To: Nam Cao <namcao@linutronix.de>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Nam Cao <namcao@linutronix.de> wrote:
> Why is precise delay important for power control?
>
> Precise delay comes with a cost, so we don't do that unless necessary.
>
> Nam

Thanks for feedback.
I am sorry for wasting your time.
I thought waiting up to 20ms was too much for power control, so I
submitted this patch.
So i wrote this patch.

I understand this isn't necessary.
You can drop my patch.

Best regards,
Omer PALA

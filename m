Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7567D364EAB
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 19:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788204316; cv=none; b=JNow6i2NaBPGkqXRMW0S+dlRzy8I6QYwlPWHUdEiO2rOuMaUd8zbpuV5vAS8Hwc9IHdgUF5dz8h7SqL2RTtepnvkFQDaEi9bW2uyBwV9fvCwNyehLUIQPTh2y6345M1v9V1kXrC8p7m2WeD+r8d/Xozwn0w+cvzD5fIST31LcVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788204316; c=relaxed/simple;
	bh=bJ8ViQ1poQtyyU0qQxN7jBxiUZmQXeRKiW1gHae5JGI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pOK5ltf+QolSzxJivQiDDLPey552YpU6JzUbc1PboNUKjg5rmsWMzyVPHuiN5X6Ie6JBqtqA7/fjWHerVO5GmWhC5f3tj2uUyfZSQqINJB3C54dJ3O2GF4tq3ospEv82ExvpOqwgnOZqpG+YsAyHTPLfF3Fet6AGjiB/944EM88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y5FkVRpO; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y5FkVRpO"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-52f83889a93so40864981cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788204314; x=1788809114; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T90xAUdJeBFN8hspKpt1rQxG0oeWIpOFQ7BBn3k1l64=;
        b=Y5FkVRpOQ/MZPvh3h18Pymh3AKAks1j+EE3twIqHqyR6G8VFNyl5rQ43afK16W+sH4
         AHZLmSZt2d0gNy+GyEX+/s/siINn6Qp3mtRDNVSrwdUglBf8Z6weLLbyvH/+fpmBf23e
         7k1gViWVD2vqdShRv/qB+9Hr1RwszNOAT8RQeGGOB6co0rDlxtrGTs8JVolX20qJI+pE
         y0S21C6ru6wO/O29iJw6RzxTn6rd/akl0Ldyh8/vfB2BcgOMZ+J0dWUPRNoGQi8N3yll
         6RsnOduM50AESr41J7Ir0k4koFVOEOJOiI9Gb/xTLZRrEPfCzBlyTsMsp8kJjL2L0UpF
         xGaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788204314; x=1788809114;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T90xAUdJeBFN8hspKpt1rQxG0oeWIpOFQ7BBn3k1l64=;
        b=VktIrZ3wJw4UObZZpT2P2i/vk9HOtCbTMZEyg3NGb9JhbvWUX2AxeK36857ymBfTbo
         MWytOtdVEH0BGFsxrfQ8xin/M58zSvXal5kGGE4PlhRUAyfPSo6gzyXQP6rXbjMK0/+4
         kQ9WU7BZ4VJO4Bf7HikdBlsn8Dn2kbHxB2l6TqGy6VT8xScPNDTIf59NDuDd0XXn9RMw
         63xdlF7KNKES64gbtEI4UegHlm4hSqrDjVhJmreyQ787hHyTvPrOviu6hJqwP7EJ5rwe
         QjdKAz8Mleb5Vr722pERSKlk/CmRNNyeslYl6t8nL3RbAEg9+euao65MdPwdogn4px2g
         pN6w==
X-Forwarded-Encrypted: i=1; AHgh+RoxuwhTCJ04FkPm4WUsEnAaPpqbMbAZFBwXh2I46gWDJpP5ivnAzqB2CIDVy+nfms+hKhv7duAdjBvRWPM=@vger.kernel.org
X-Gm-Message-State: AFuF++kvfvLk6NCP1StzL83vI82HpQzXWVDrTJyhzeQ6nYMxV+hiu8B3
	6FAK5H4R+n+oH7LJbppzgJj89ML5huORUr1kxrzpo0haOmGcapXfWH1a
X-Gm-Gg: AR+sD10nx10dQfGsowOhbspn96iDeDJNht9EqLB7+qje8oVM842D4O/9+VeMhksYlyW
	nSzeERRLrAzoSE1wYtMaU5KwpDSyBtTr2H/zQzx97715m1Rb2gTsuu34+2YPMVHVyMc3H5ZGchO
	QyzmJl0LnGXpxTG87pMPZdauNbSMxpWl+j6M26PV+QUIZmH3tAYx/qYgUJYuPyRWKbH1QAJRkKM
	DmXr0mqQ5XQcJxZrBAjrWtr6B5Oh/lyYaTG7k33davMDHh8QbBPzZtE/FpezZoUNS1Z+AwOi3J4
	cEcLdi1dJhledAYCtmqvhvX/e4E5obNbPOb/l31BFiohxHbmbYJ/jHlMREWnzX5gKXTGTOZWGvd
	k/tOdH2fTibgcapugyAVSPTgSXVnu0h8JnKz+FyKJ+rb+xRIARKyJCiUQlinbRuvKLmYT/z6bgQ
	Nk8dDHXabE+HOWfM7Ys2iHGhRr3Ab9kOGKLQDsDojznz0JUiJI0dcucyuvorPPI05i5pRjCyXWJ
	tk=
X-Received: by 2002:a05:622a:14c6:b0:52d:3352:f7ac with SMTP id d75a77b69052e-52fb9655af6mr333069491cf.28.1788204309745;
        Mon, 31 Aug 2026 12:25:09 -0700 (PDT)
Received: from louisarchdesktop ([2601:184:417f:5ad5:6adf:2919:5c0b:bce3])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90ce444e58fsm90880756d6.8.2026.08.31.12.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 12:25:09 -0700 (PDT)
Date: Mon, 31 Aug 2026 15:25:05 -0400
From: Louis Adamian <adamianlouis@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/5] iio: pressure: ms5637: Add per-variant
 compensation
Message-ID: <20260831152505.476826d7@louisarchdesktop>
In-Reply-To: <20260821020122.1c2cc7dc@jic23-huawei>
References: <20260820141224.23730-1-adamianlouis@gmail.com>
	<20260820141224.23730-6-adamianlouis@gmail.com>
	<20260821020122.1c2cc7dc@jic23-huawei>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 21 Aug 2026 02:01:22 +0100
Jonathan Cameron <jic23@kernel.org> wrote:
> 
> For this one Sashiko raises a valid concern.  The ABI is changing for
> those deprecated choices.  To avoid that will require a slightly 
> annoying dance with extra copies of the data to keep the old name.
> 
> One other question below.
> 

I will add ms_tp_data structs for the deprecated meas,ms5637,
meas,ms5803 and meas,ms5837 compatible strings, so the name there
matches.

> > +/*
> > + * MS5805-02BA01 compensation constants
> > + * Datasheet:
> > https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=MS5805-02BA01&DocType=Data%20Sheet&DocLang=English&DocFormat=pdf&PartCntxt=MS580502BA01-50
> > + * Pages: 8-9
> > + * Sections: Pressure and Temperature Calculation, Second Order
> > Temperature Compensation
> > + */
> > +static const struct ms_tp_comp_consts ms5805_consts = {
> > +	.press_scale = 1000,
> > +	.high_t2_multiplier = 0,
> > +	.high_t2_shift = 0,
> > +	.high_off2_multiplier = 0,
> > +	.high_off2_shift = 0,
> > +	.low_t2_multiplier = 11,
> > +	.low_t2_shift = 35,
> > +	.low_off2_multiplier = 31,
> > +	.low_off2_shift = 3,
> > +	.low_sens2_multiplier = 63,
> > +	.low_sens2_shift = 5,
> > +	.vlow_off2_multiplier = 0,
> > +	.vlow_sens2_multiplier = 0,
> > +	.has_vhigh_temp = false,
> > +	.off_t1_shift = 17,
> > +	.off_shift = 6,
> > +	.sens_t1_shift = 16,
> > +	.sens_shift = 7,
> > +	.press_sens_shift = 21,
> > +	.press_shift = 15,
> >  };
> >  
> >  static const struct ms_tp_data ms5805_data = {
> >  	.name = "ms5805",
> >  	.hw = &ms5637_hw_data,
> > -	.comp_consts = &ms5637_02_consts,
> > +	.comp_consts = &ms5805_consts,  
> 
> Is this change actually a fix?

No, I miswrote that. It's here because the hardware is different,
so there is no implied shared compensation between them. I prefer to
keep them separate but it can be removed if you prefer.

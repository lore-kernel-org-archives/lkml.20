Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39755350285
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 07:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787900524; cv=pass; b=YWoC6s3+dXbCXvMQQHaQBBxQYsAY+s+6vyeM+f5D0dRD2MzFlGVoiVF0zE7tSHDChyUzlAX/bF4nmbqLBJpbPURYSotPSCpKIpFVFNK22JGFp7rzCuzRNa0swtULkYf71ommGbeTHX6X8O3Jr7+NpTk8HmqnlhZSRuqbyb4Nw8g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787900524; c=relaxed/simple;
	bh=WUMZC5zmbWFHHM9fj/b0WVfBxUhBF81uS3y69nJEc54=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dYyyrVOgpOBn818EcMLAhZmJTkBV2HKmX8MfcxWvjH5z9EZRTmc419IVKpNopG2bn/nvQRRYUTjgIJJCGszwk2fWSSLaXpcRkwB8l43y+qXUFN2oxjCvhx7LSxQgtHXHIVBAzMm1icdL5xgUEgTRdWSj2QiDAhkvKg5lmP3QXVk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gn9xNuvR; arc=pass smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gn9xNuvR"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3a20f06cce6so6402751fa.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 00:02:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787900519; cv=none;
        d=google.com; s=arc-20260327;
        b=lDf/YnPKHIXHxpwswBRtyIkrDAiRhz7blKQkqhquYvF36HIqPqPji2CSKGnd+VZpS6
         BS3I0AuqE9peVxzt6z43tt+SecHbh8xQxJRGbeHk1m3n67FzZuSt7QNMw0vBL6YLjuTY
         pO9UXsQseeW+zBNsQqentGngAW+EA+9ZMCNG+lwaJ1F3rtp/SDvd6/dhfbXcjEV3QZxr
         /V6UPHQJQ1veP7qXCz1RVRoU/+4sovLW6+muo6WOkf6QAL4IdqoaidJDy1Pj+YiqC6pG
         cisqOJP7I12q4G/ZoVgB1vqxPtfgQoMMBrapwGCoBR0XQl7Yqk3kblcA7cgYL5BIoCjr
         TXuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=H4YdnU69bw2loweZcyhECkKVgGdkyMQpoAxdxOphCTE=;
        fh=sxXpmoCHyhprbjDinLZtl34kN55JyPpiEwmrzEI7B9Y=;
        b=Uu+4X0aRMnhmNm6gaIIpaaoLu3eipNCi19LheeLoWqFJBvRWvYFeIFgmq1FcUrThS1
         RtktXirj32+42FypSMXiAatTfR3so69LvewgM4beb9UsntRAlM4DlcdSLYG0cC8w6dtb
         mw9uerDszK0DwLHwr5dqc4M0HShxo8eV/H2ydDdX68SHKQ/4jc9+Ml+MAU8VEu3BEMye
         xxtCwKb9I+UGOz5AcJyt4Ux1YjFE28+8hI4Mk3itvZ0zI/M4wADBMNTTQbXiq0uEh7iF
         QYES2MzCR6MZraz50SEJK59ybuXWUaxka8BnOLIt8VTAnPXVbdJxIpsLnHSyy0tE9Lqq
         fJxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787900519; x=1788505319; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H4YdnU69bw2loweZcyhECkKVgGdkyMQpoAxdxOphCTE=;
        b=Gn9xNuvRxtRTpKHKpxXJTDHjvMhBlWvtemhqnqf+pNCkWzHReockOnLz89X/aMZMNB
         b0T9mcl8KTBDtX3wRQo9V7jauZUj9eJnei+uTby40CK61tqSqlMLLXpA8sTwgHmsUkL4
         wd64VqvNKeKvexLyvHDVj32uNkcH+Z3zW1WDrbk2qNGuUcYEKs1EZKvq8eyQmRRo01Dm
         eHOtYQQnfZomgt73Rrs0yl9Imhz95QRU/6jXqMmJG39yf8XOdoKO5OcVznsKjaYB08mP
         iJDNSQHwTEImS+wUQAmh+6NeL5Gs0h6/buMLxjkmr4XPfcLZjvlg9c7MqSUh4SFNR2PU
         WzIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787900519; x=1788505319;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=H4YdnU69bw2loweZcyhECkKVgGdkyMQpoAxdxOphCTE=;
        b=BeZlyAzKQZavESbZ8Bh2deIS7kY+Hu4Sk6+kT7/4TalKM/A6Xy6S87AcxE7aHpOKuF
         2DSrKVZvQImQam3kMrgJPwP/qe/AiSMO03GZrzh5Mx5w1ChU6LK2P9TW4xOmoHVa+0KU
         NvKz+bjOjP1+Fspxe2LvaATGQZFo8zo6Ws5AStpN81R09PhftU12xQPbyCRKjvmeM3Qm
         XlhRZSg7tTlYzXKRwS8AofkQdCnfBBJDV/BEAlDLrE8HnFlwrhVgyZARBKMqeBYazy6T
         MU/Driluu4t7UFiRPFwmfwu/OPWQRxlvwcBPXQlE8Rp6RkI7muamAMOR82klVN/7lHCw
         E8/g==
X-Forwarded-Encrypted: i=1; AHgh+RqPXDpgk26qwoTzbPZw7/0c6NljgjBzdFpkwkAfGNvwl7RjnS0hghc5+OR7epIcJidNA3rgL6h8CrvEfVY=@vger.kernel.org
X-Gm-Message-State: AFuF++kHHIYmJ8DqtzGFc5HHKkElYKq6JwFQq6SXkVrMi2XL+WExbNrS
	33kk5CC+THbNZWMS3pyz/+8bkFoUYFp84qQJzNgLjKzLGxq+Rd8XtHNDgPViaCtIRJuCxBxbaAy
	2GlHktIpCYumtgsLSCg8hjzKbPflQdX8=
X-Gm-Gg: AR+sD13LwsDS+cEYYrEAOwgOSTBIfyzb4D5RfKgeG9kMyK+6VpduVcGGPubnWVphY5X
	TRo7HKeGV16lb1WAQ41FtCzBvyEXvnxkBMsUYfrBJBj5ibRCfj35yaNtVmCpP/X/bYcmZxPUGKx
	oHtKmWT3G65+Sd9x7CqsmcRD0JSpqQh7VkjquVTHqpDFBwV+adgJtD/mpG1G4q0tyv1Ah0pk923
	u8spD/482VWVtOF6et5slCc4k/udA+YTEvXNli/XZB/+KXtpc8UveFCI+JtoR26WZDTaOBmlWZK
	2OUnP6aX2U8O30+nK8dk15j00MDsvP19njGNr3bdTFnNWHD2/P48u2Nb3g==
X-Received: by 2002:a2e:a909:0:b0:3a3:364:f783 with SMTP id
 38308e7fff4ca-3a303650017mr4458281fa.11.1787900519048; Fri, 28 Aug 2026
 00:01:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260822062725.60519-1-muchamadcoirulanwar@gmail.com>
 <20260822062725.60519-4-muchamadcoirulanwar@gmail.com> <20260824011749.62322d99@jic23-huawei>
In-Reply-To: <20260824011749.62322d99@jic23-huawei>
From: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
Date: Fri, 28 Aug 2026 14:01:47 +0700
X-Gm-Features: AcwNN1WZvS_vxAPD9ztThL80CtQKEFkx81WWXxaTUCllRl2U0Sxi7MBLeV2GPXs
Message-ID: <CAO26r3QMzTuGnHN3if8N82DEHdWo4TS5upEWgUz88gy54rXj8g@mail.gmail.com>
Subject: Re: [RFC PATCH v5 3/3] iio: position: add Rust driver for ams AS5600
To: Jonathan Cameron <jic23@kernel.org>
Cc: lars@metafoo.de, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	andi.shyti@kernel.org, wsa+renesas@sang-engineering.com, ojeda@kernel.org, 
	dakr@kernel.org, igor.korotin@linux.dev, branstj@gmail.com, 
	brucer42@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Jonathan,

Thanks.

On Mon, 24 Aug 2026 at 07:17, Jonathan Cameron <jic23@kernel.org> wrote:

> > The AS5600 stores the 12-bit raw angle big-endian across registers
> > 0x0C-0x0D. smbus_read_word_swapped() handles the byte swap: SMBus
> > always transmits the low byte first (little-endian wire), so an
> > unconditional byte swap recovers the correct value regardless of CPU
> > endianness. The long-term solution is regmap-rs where endianness is
> > configured once at the transport level.
> >
> > This driver uses INDIO_DIRECT_MODE without buffer or trigger support.
>
> I'd only talk about what you do support.  There are always many things
> that aren't in an initial driver so listing that bit doesn't provide much
> value.

Yes, I'll remove that sentence.

> >
> > Tested on BeagleBone Black (AM335x) with AS5600 on i2c-2 (0x36).
>
> Generally put things like testing info in the cover letter or below
> the ---

I'll move it below the --- separator.

> The code itself looks fine to me - but as with earlier I'm looking
> for rust expert review.


I'll add an explicit review request to Danilo, Igor, and Brandon in
the v6 cover letter.

Thanks again for making time to review.

Coirul

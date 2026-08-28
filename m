Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF7D78F2B
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 13:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787922168; cv=none; b=A0UeS+YyhYgHVacVKeFjQ8+5RS3W46foQvYYC7hcbAZAmD4ir/2WbV67L69FsTPocQeH32iVpADYZVku/Fz/HF3QJrLhlGzh3MtfCv3rKnmk6UdZ2Xk3+hgx8KtnSArNQ0qYHAm8e8CxZmX25RpfgW8NeEliU2Pxmc8jSHLLx4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787922168; c=relaxed/simple;
	bh=e0MTBt8C9abeTF6aZrQ7SUmivpXqo1/CfI3Y5wv+uKk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DzOdhKyC2dzhfyC29bCPFNqr0WCNJL4syNogUMvU9M8bzvpbcYn/RGnEMT0FhsIR4aoo4HPR0x1OYlqFiMJWh/VHgMy4zXXwpqTmI6l1HcQbFidq7Zr/loMwIMmjEC2SFTbbFAVMH4o9iAhHHTVSkfNfbSvfaEGZiF1soHY7z4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ru47Pa6A; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ru47Pa6A"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b965570d7so6185105e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 06:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787922165; x=1788526965; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I17XhHckomDClTuJ9XtJEJgl/TykF1PHh2VRHKfngpo=;
        b=ru47Pa6AGYUwflu+pbsQ+894sKNa8SLlSjbEmktLNyBaxoxawZ/DFkhN3+lQ7pEAy2
         Sye/FBkyIdh42KG7NTDuauPm9GdKY+FK4PeGqxL6vsFX3++AI0OkF2q6/oZlJOwp5PP/
         3HLXfMnDfmxurswV0D711C03egJrtrpCFiXZo7pscSD4XgI9sxemHwq6SsxW6kIAZo3G
         EfzXUbE6PTzRv617Oq0ln/2zBKP3Vxam/vgUcd/Thz+ETcBPz/AnalCnjJCGbnllv68f
         FP/qjXK1FcmiqD8oXuYBwbkLIQ7ols+hmxbSihDK7TmUmCRqQqIHW4CH5dyBoFgwcwlK
         M7pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787922165; x=1788526965;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I17XhHckomDClTuJ9XtJEJgl/TykF1PHh2VRHKfngpo=;
        b=IrjkfaQu8YosOC+t/u+dM/BLBDoiFI0MHB6n+I9hXaRCvpkkRbs+UskpLnreh+E3E3
         1k8PC0x02cwkXFs2HrIrxiTEzCoMH4KSv822VmIpMQ/+9BiYJZ9FrVibgIM5GOcZxYSO
         togSFFfwV8qejzKcJBWFkYfzfQyje3slaRsGXF7vJI/aoZfTwP9cPvoO2gnP7LHraspm
         epHpHJYVJXTMdpJ6a405KTnMuGc04uX/XCUKjiuK8vEptNP555f1BAFm0l7IVDcWPZ11
         6zBffcaaAZ7L42wuCUKVn5ioTKyBSUe3Y90e/is9eK8pVzMLrvTeOreRreRerz/fp9vF
         wwvQ==
X-Forwarded-Encrypted: i=1; AHgh+RogRxtaCWcjrZEnKkrEql5IoVRQilmmFA5TMdkgIE+SPGdfmcdGT8yu9fO3frcVVpX1CNfyCkZ+Nf7piL8=@vger.kernel.org
X-Gm-Message-State: AFuF++m24ztZfhRtWDx+xCt1dmGEXMAktsgFOcy4STdK1cYilUOcrTwd
	n8MhbF9W76kxes/prseI1cdED9kdNxNey4G3+hQq/Bq7GYbgy8Tf2M99
X-Gm-Gg: AR+sD10bzn7cRwrFxxUuKLoNkHYOl+25HgOeNLGp5a0ldgdD5SvNebXmr0bretbxRXc
	GVorHIX8aj4+nqD8kk7oR6onog6F2uDdPvMRKcJKVTYooiLW4tlUM396LsuHKewpxUZENt4k0pu
	DjXzXMZS+egJ0eh99HHOO061B6/iVVitWUjcP7HqX98TPK91ko7IeX0416YFrd1dasduP034po5
	ZR0+p1b+d/G8+BwFSB+CLRsLWFMnfkg3bvF97GW1sVVQqjWS+uuju+cmXxGSS9nPmQGH/G/cJGe
	r6oSksy/YdwQ3Sb1rNUUmX0Gz3DcCM6mBT2vyP3pIMV19Q7SK8/u67HrxB1HXfLoMg48DkDEs5W
	AOuwU6yIggV3fZ1amw4fFMwEJ+hWfKm2aLol2YzhekYzHw7JRIuuFva/AlCu0Vcj+dYUJZyCkEy
	iUGzdrn2mYEgvDL+P/1sms8UU+XyjncZsIOIVg0Ryzo0+0wvvLBy3IBe8EuMCdkwHkK4hcEakyZ
	LSUFp8+WzmGcGGyjw3oOVw7hg==
X-Received: by 2002:a05:600c:4fcb:b0:499:db27:7b1 with SMTP id 5b1f17b1804b1-49b91c62d9bmr94595575e9.15.1787922164498;
        Fri, 28 Aug 2026 06:02:44 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4c321184sm165459595e9.11.2026.08.28.06.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 06:02:43 -0700 (PDT)
Date: Fri, 28 Aug 2026 14:02:42 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Nicolai Buchwitz <nb@tipi-net.de>
Cc: Jakub Kicinski <kuba@kernel.org>, =?UTF-8?B?VGjDqW8=?= Lebrun
 <theo.lebrun@bootlin.com>, Conor Dooley <conor.dooley@microchip.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jonathan Bell
 <jonathan@raspberrypi.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S .
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 1/2] net: macb: exclude software FCS from TX byte
 statistics
Message-ID: <20260828140242.7c78d4cd@pumpkin>
In-Reply-To: <36165fe4a906b07dd9f92a73a72a05f1@tipi-net.de>
References: <20260824134703.766708-1-nb@tipi-net.de>
	<20260824134703.766708-2-nb@tipi-net.de>
	<20260827115601.6bf0b18a@kernel.org>
	<36165fe4a906b07dd9f92a73a72a05f1@tipi-net.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 28 Aug 2026 10:20:24 +0200
Nicolai Buchwitz <nb@tipi-net.de> wrote:

> Hi Jakub
> 
> On 27.8.2026 20:56, Jakub Kicinski wrote:
> > On Mon, 24 Aug 2026 15:47:02 +0200 Nicolai Buchwitz wrote:  
> >> + * @skb_len: skb->len as handed over by the stack, before padding and
> >> + *           software FCS, only set for the last buffer of the frame  
> > 
> > counting pad bytes to ETH_ZLEN as sent is perfectly legit,
> > it's a driver preference. Some don't because HW pads and
> > the driver doesn't want to bother adding a conditional.
> > But it's best if the driver bytes match wire bytes IMO.  
> 
> Matches what I had in mind for my v2. So the driver bytes would match 
> wire bytes minus FCS.
> 
> > 
> > Either way, you only need u8 or even a flag for this,
> > not a full u32?  
> 
> Agreed. skb->len at completion should already do the trick (minus 
> ETH_FCS_LEN).
> So a flag would be sufficient.

If you make the 'flag' 0 or 4 it will save some maths (and maybe a branch)
in the completion code.

David

> 
> Thanks,
> Nicolai
> 


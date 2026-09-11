Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A45408031
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789121459; cv=none; b=Upbpn8zf2FF6bcSgFgJMTmW4Q2FnPyeOJd9Mpb1O7KKZ8psRAyvukEz03IoPnCP2lhWfitH+PjjbO6tvaXiqkguPZu33OHlp3TqCoD0cR50AzRjFygmCVe7FCzbzevC1ng4Or3UmoRq8bVuowb8AXBpweO17oPSMrQPQb4u0mM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789121459; c=relaxed/simple;
	bh=1YRDDj3j2Vt1vNRZqhNjgjJMoy05JYx0QLGi7wz+esk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UPE9T1uaghARxrYHS54L2GJe1S1Suwd8uOYYqv1DLdMwb/0KjuEpCGjHXIrL+BTMvphVXEuFAh4k1Z6xxNHkwuuYwifsBEHJGwODb6C/rj0pkIrrYRKsD7kToEkwbgRm0oueeBlGSGyJAXGSm/jUWIicDVo4HDWKpwRdJUvdC2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=CF8MyNtw; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="CF8MyNtw"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a9a20a5e72so1137355a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 03:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789121456; x=1789726256; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BMUFQ99hb77UHdAvDILnPay4glWU4keZPMlyptDT9kA=;
        b=CF8MyNtwumX/kz/jtzkE3vs8eoW41h8N9BB32tZUo7BX7sWiwGuQpBX6RLBAyh/nyq
         1ADtrDY5HN6eGlNii/qurybYXkXO2UhBDWVDuY1crtxcQ2kugJT/62+SROiSNFi+wQe7
         edSk+/RzJqTNwc80DCl4twdLYt/qPKMSXUwAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789121456; x=1789726256;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BMUFQ99hb77UHdAvDILnPay4glWU4keZPMlyptDT9kA=;
        b=CUBfbs2pL65AzB0ufUAIbJ8HyKAmamYhgkAeDLy1iaIsMnl53+et3zVdgI6at9G+q/
         Boz7nMcGnS733zONHsMa7HH77tccpyLhHrxMk8uXSfUcXy+Xv8oMYXOmUX6kAgEOo/Zo
         GsRAMTKKHEv0a3Wn4WZR1zXA0Ys546dBuW0tOquY38cesOEPrpb+eLFD5+HgPLmbm2WS
         tU0ealvA/gy1ouMIngrtOneAzOlDJ8D9ok7+H12QbsfENZC1Ebg+QJuiyUNYNRXaQuyW
         3/gW4IA8EHGPfoC5kJ8pfB00aoWrv7on8hK/MVJOUM2caxsD2289B2aCDPeKi7sJuDJJ
         SS6g==
X-Gm-Message-State: AFuF++mOslftGH4kqKTdnTkpd756lW61KQVHSb9KoA8+tKfBdTB8EAmI
	hip+Zz6EGEuMGm6lVMrQ+vKT5vLxKvSeC//Pmr/OXOwM2b4d0hMvX3OugIOQIo3aUf0=
X-Gm-Gg: AYBFou0VGUljnwMoQDqH4ucuZv8PX0HVwxz/HaQI5x9YkhWmFjf7lK0AGFu5OSqtv7H
	ZyiQIv5xhxqI1JxM15hXy2oVfAnhTpAiMyfn5/NVTEcXSz6Vqn4Q23NFjNFdLpQV5I/4npbl4qW
	eHdbOL8SgV+UaDRdO8fq16D3klT06J4eccXcfZHgb3KaJkGBQQ14wBnw/DVh3MfOwUCX6a8Az6t
	YpMsjM0agI44G2jk1KvsjrcpvWGH7Fb0392d9yBRjB2dCIA3mm52hDindDGfalRtqFO9rfYGJeL
	OssO2Wp/OY3VqgEEtYiMRy+44btE2OC+iCsL7oGriOjAmMsSAkbFfGZ20Dkaevci/Uajj6Opet4
	OTJzhna8zgNmmQg7RhtO3i1vcWTpE7/WMx7995dZWbUa6z4B3E6r68kZTB/jFHrE/q5TLXZnpka
	j7PGTjQa5BsH+VwXSnyhRVC0Xr3CuCxb3SrGkuAnZd08VXjD1RdBiMZmwBmK4+whLUBgbVaWJrD
	jPhQdOPHlkov4am
X-Received: by 2002:a05:6402:450f:b0:6a7:f505:ef3a with SMTP id 4fb4d7f45d1cf-6a9b56c5debmr1418388a12.35.1789121455656;
        Fri, 11 Sep 2026 03:10:55 -0700 (PDT)
Received: from carbon.k.g ([85.187.61.220])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b58f8beesm578104a12.8.2026.09.11.03.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 03:10:54 -0700 (PDT)
Date: Fri, 11 Sep 2026 13:10:51 +0300
From: Petko Manolov <petko.manolov@konsulko.com>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v3 3/3] Add socfpga devicetree for Draeger's M48 board.
Message-ID: <20260911101051.GF722@carbon.k.g>
References: <20260909111513.2259643-1-petko.manolov@konsulko.com>
 <20260909111513.2259643-4-petko.manolov@konsulko.com>
 <0b682ab0-731d-49dc-a7f8-64c4d71bed71@kernel.org>
 <20260911092541.GE722@carbon.k.g>
 <1f61bd22-4e1d-44ae-b4d6-9426fb9dfddf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f61bd22-4e1d-44ae-b4d6-9426fb9dfddf@kernel.org>

On 26-09-11 04:54:21, Dinh Nguyen wrote:
> 
> 
> On 9/11/26 04:25, Petko Manolov wrote:
> > On 26-09-09 08:36:14, Dinh Nguyen wrote:
> > > 
> > > On 9/9/26 06:15, Petko Manolov wrote:
> > > > 
> > > > +				bank-name = "SYNC_I";
> > > 
> > > bank-name? I don't see it documented anywhere.
> > 
> > These DTs come from u-boot where it is documented.  What would be the
> > correct approach: to drop the property or document it?
> > 
> 
> DTs come from Linux, not the other way around. I don't see "bank-name"

I was explaining the origin of "bank-name", not that we should reverse the
process.

> I don't see how the property is getting used in the driver.

This is enough as a clue.  I'll just drop the property.


		Petko

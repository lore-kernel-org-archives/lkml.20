Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC925208A1
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 18:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789757432; cv=none; b=jB/ius3iDYRfnUdegwCd8hn/M8CwbOElQk16OuVx+W+NTl0H74WPu9VUf0xG2ydyyfaMpRTI9ch1kLu9fKG9Gh3LmEDv8v2GduIJj/5o763GzXiXP7EaGogdE2zio2zlxylycx5zz8/CwlBpW17xGHy52i26bFhXQtY3kAvu4Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789757432; c=relaxed/simple;
	bh=E0dIEkBrNpsavfmz8terpzu9tdJ/O2kWHmDPwT1Sr0E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nqT7lO/OcDK7aiRapIFUMZ/nliRKde37rhIl/eo/2t28EVEyxcP0cuw5YBzY3wKFmArkNKsulZ6IYrykm61SYAePEsrtRhlDMRskwq00Y9Pc7/2wWCvOPT+SgfAscH3wf3rnqcWAAsyst4+pJgiBsJw0ejjX53oWvfGCT8hW+TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YtiS9ilW; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YtiS9ilW"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccafb751so939366a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789757407; x=1790362207; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E0dIEkBrNpsavfmz8terpzu9tdJ/O2kWHmDPwT1Sr0E=;
        b=YtiS9ilWLBcMyWlv5Y2aFpH6jdxYPkOFOIGSCCxkUUdRY5aHDTyvSWq3MDlDVKkGuM
         ma5QeEm071R26vJqv8UfBF3VXVPkcbEnX2ZuvPt6nKHYOq4KBc/nKI8YpPsrVk3JZrG0
         +xcf7wndiGu/i13imu/C/UzEf6fy/oo4hQs6g/ZNZEcpGQPjtax+P4117eEjROAto3os
         OhReYfUNZXLvAKnRAb1olp4LA6F9joIk8GLXYIlElfvC5WLjzoozoBibhNOI9cnrUTVu
         EsGILpIlEM/8KJ/K8dQITUbaK+vaKpfvq4VcvF0WlapRF9fRyp7RkADNY6iaANBB1pep
         3Vtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789757407; x=1790362207;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E0dIEkBrNpsavfmz8terpzu9tdJ/O2kWHmDPwT1Sr0E=;
        b=2hRa9cAr/3z+9H3DLlLn0qNsVHWEkJMp9KL6Gs0NnWlMN/oEYpfBY66Ztd09ipCBw/
         g/uTdZYSGy63xiumegRIGZmYFNf6h5pKyI44rqZ8hllytkVC49GZssqWYlKu/gSnp+Kf
         2DNZtXF/w0BpIGtZALKVJbo/KU8dNrl5IUJD3E99RjT+CoLZxGYzxfUmszTPyWSjpyG5
         4X1B7yFY4Z53TH5i0LM/BPrZ6VIQX/y3Uq1ebEfF+foGN1kILaCVbtvNxTB6qq9vkYn6
         MsaJfadjRehjCQYBXjrKI50CzF78hfYZBv5fcRTqaS8XXo46wdlLS0wqJj80y7rPHYUE
         BoXw==
X-Forwarded-Encrypted: i=1; AKwUvBxOEiOQX6HFE+mfrsW63et3n/pDH8Zq1nO919DLox+nN1GBAJMyJ3uaGi4lok0sBdkPTDsvcF04aqDUXqs=@vger.kernel.org
X-Gm-Message-State: AFuF++kAp2U1eA+pY9EYdA4RvtCP5R0yDx0USA5ME0LbFtXKdrcKmi0r
	uMTw9C20MgLT/SerufKxhFJgkcXblLa8+iMZq5KWtQTOk+ZcEMyW/ix/vXKhukCqXfXwTA7GiXE
	=
X-Gm-Gg: AYBFou0+t/4CXDbubdfWzTMeRAsf21AsHYaxTvSzH/tc1t/+rthdjTNC+R8hhQsLVbi
	Ynrl9BUx4v8UVkTWgCKlLT0g43kquDAw4p2VOiEEJs5KmdhYYHwqX3rDSjJvfp4juMMGMhhhJdL
	9pEeLWtMZHGzwWkHwTxvljs/vvZS8G6rR/glun5ZJdK+Fg0PR3ypzuMErlfPZWxhGfPf1y+FiJu
	QN5t0GX5SXjxGgkVbDatDEiFPGv75stZDpB2m//i6ilwRaRMihfm6T8n91dm+Bdnht3KVP9VwwD
	eVT1SzF2ymJ57mgSM+hSbnlf/5gB0+e56RJySyoYLToOOXidjs6yJ5G53ahI0H+YvdXRkR5oUH0
	PbrhSKGGtuXIW6HUDo8vDmymS98VuYWsZV9PhvkmeUwvDLA0G4G9a6kMyF3cXK23M5VYPGWeczR
	l3qflfZxHoW+bxY+g2EjI8l0qMdi7siwsmIiqm7qbyOELVr2OQYvi/JGSACMZeKvxjSCLa/Lhge
	4Ep4q3qzpbb6oQ=
X-Received: by 2002:a17:90b:56c5:b0:39d:f95d:bd08 with SMTP id 98e67ed59e1d1-39e55008a3amr13452150a91.14.1789757406972;
        Fri, 18 Sep 2026 11:50:06 -0700 (PDT)
Received: from arch.mshome.net ([115.243.91.113])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55bf991sm658555c88.6.2026.09.18.11.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 11:50:05 -0700 (PDT)
From: Daasaradhi Mannava <daasaradhimannava@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Denis Benato <denis.benato@linux.dev>,
	Nikita Kravets <teackot@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86: msi-ec: Report valid charge thresholds when unset
Date: Sat, 19 Sep 2026 00:19:55 +0530
Message-ID: <20260918184958.6211-1-daasaradhimannava@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <12cdf224-08aa-d19f-62fd-fbc6e26d6103@linux.intel.com>
References: <12cdf224-08aa-d19f-62fd-fbc6e26d6103@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

[Resending as plain text, the lists rejected my previous reply.]

On Thu, 17 Sep 2026, Ilpo Järvinen wrote:
> This seems similar to case in commits:
>
> 186bf9031666 ("platform/x86: asus-wmi: do not enforce a battery charge threshold")
> 78bf392ba77d ("platform/x86: asus-wmi: temporarily revert to setting a charge limit")
>
> (The latter reverts first one as userspace could not handle -ENODATA but
> thought the feature was available.)
>
> So ideally, I'd tend to think we'd want to return -ENODATA when the
> threshold hasn't been set. But whether userspace survives that is a
> question we cannot ignore.

Hi Ilpo,

Thanks for the pointers.

I agree -ENODATA describes the state better. The asus-wmi revert was
caused by upower's udev rule reading the attribute to detect support
(upower#347). That was fixed in upower 1.91.3 (commit 83f86c75,
July 2026), but current stable distros still ship older versions,
e.g. Debian 13 has 1.90.9 and Ubuntu 26.04 has 1.91.1. Returning
-ENODATA from msi-ec now would hide the GNOME battery health toggle
for most MSI users.

Unlike asus-wmi before 186bf9031666, msi-ec never writes the threshold
at boot, so this patch only changes what is reported: today it is
-10/0, which is outside the documented 0-100 range and makes the
limit look set to 0%.

So I'd suggest taking this patch as is for now, and switching both
drivers to -ENODATA together once a fixed upower is widely available.
If you'd rather have -ENODATA right away, I'm happy to send a v2.

Thanks,
Daasaradhi

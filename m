Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDC83D34A2
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 15:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791474941; cv=none; b=Cy1jDsnRcxenmdDrfYkl8u9cX2eH3vHOyo0vVfjrZV70qpFx7/OLWRIjWgC5qjbFq+r58P2pi/BBfXkH9gRQfy9BBEsV1+PvuMNSc3YWTIJGy3J5d5UIAgkOz+su+KI0GfROD0oprCSPgDLpvozgjjmD1NUEyL2nhg1WXiuIu5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791474941; c=relaxed/simple;
	bh=zwt9pXj6gsP311a3qUbJjUn5uS37s7OXRVsn6XcqW0I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MN8wBsvLgMDOf2jYMxTABDeI6cobUWvEsoX1qzVRJQscnmy5yluJamB0XZkBz5T8Ui8rjTKhQjP60XOESh8xGx31u+COB4CrBLF6To9oNQetKa5F+f1jOX84nJK5AM/a83147h+NqW48SApqfXzw4loLZrn469AT7SpI3wQ0Cpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=bvBMuBv7; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="bvBMuBv7"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-917b78dfe30so45420106d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 08:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1791474939; x=1792079739; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1CQKLWLbGN0QJLQsdroI+hIQ5HSO8HVAfjGuz3Kaqvg=;
        b=bvBMuBv7Vx/nk9TAQr9bHHwPE3RAYHNVYCMspOahMqMtGEDBZW9suGaoG5yI7Nu1JT
         RUbKWgpVCoYHi3YjtgU6jc2syeJB2ztkyi6is2BUpLKJttq2DVjwqaN0KjT8g8zgBd8U
         +nE13O8NErcHLdjKNQVFgRK13u8sCIyLupNl4T/rCMV6XaB3sKPvMbaT8nwGnD6xVFJp
         qWotU8iE1O2O8QpMglWLq5n7BGd6RSdAhDplV4AwW1cNY0q6vIc2cHhvJTdOuLpfvztt
         jtZ3tcV4tbTfDfNoYzIyjvXN2Qd/4+UIPwCJcrlmpe7N6+qseADVtCr+VgRfC0INDSJ5
         KmAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791474939; x=1792079739;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1CQKLWLbGN0QJLQsdroI+hIQ5HSO8HVAfjGuz3Kaqvg=;
        b=FuHvkNEDd4V64sYL1eRpuquO/RSApZJJPwsD8qbF/ly/hPu1/NLq8VbL9KfpnMGL/1
         qrlYSGiis7IgPlpVnPth1SIw11X+MIrnfhDOTM96plyBTHa0R+Auj6ZPvPQTG1CRL4R+
         kb3EdP08LXIJHGzFUmWSJPkphcWj2hBTGTfRCjs6c8W7aCOPy4tdbTalBdvyAm15Z+7y
         wwSxILmXDK7NYxPjWsoDTsryzTHO1K83VrDNm0khtKeA+k8j8uqa7q9qsblTX2cL9C+G
         n3rrjR9+ZCgAuWy2KDwx2QeqRX07+aJw2g52LzVuP/5TSjFr5rku4z37spFZVxEB8Z3r
         Gh1g==
X-Forwarded-Encrypted: i=1; AKwUvBynZ2X7YiCDHtcYBLwFOPxv7padazve4juQ9t44ufHqJs3YNO6hyu+JEvN+JL2iU/qNDiOjG8xQim79M40=@vger.kernel.org
X-Gm-Message-State: AFuF++m0DREWbj7JXC+rzCsB1d/y+/ZuE7HQaQfGKwNq1+qOy7k/RCa2
	oOmN96SJM6kKjg4wmE3Fcv5Vb/PNgu7OMv5NFrdBdOMAYVbTa6tc+Y2GdnZlTPYGoVg=
X-Gm-Gg: AYBFou3FWgAtW0RaKArkZ7uw1NG2dEboqfWnfsL3RZdaJKdiWuqkmAWPcp8jHc/joLD
	c2HceIpObVYuyxt0Ls1UCXclwOM3BmoZugIUtStJzi4Ih0/7njrhuSEjSVmNjS6rwTuwPmMPC18
	TORfXFN5uR60pCXMbuyTJgBxmwbFA7exSeqyA91JiIG4Ib9pMzr4qip64tKm0JZA+Vt36EW+8WC
	9yuImLjGnaMZICLt4/Sr/h+oGgiCXy0Bi/w/vr2jeVhmDl1aLc7+hc6c9qXZ+Bw1oLsgOSSIzan
	nzWvdBASTnnTAJ099Mzbgj2xRQYJujckLlQtO5t0hU0/39eE9TiBhQMubefk7725Xs27TSZlB1V
	uvjUFBPBzNqI5ibkeFBn6Dejw2glO5MdiGJ3/RsxMjYZDWISO9qFsVZDvD5IeAdRddKq1rSyHf7
	MoF2fssy2Qg0fBvDCenpnWU0ReJgWVwAzuvKynhW+CDnTk2svRWD4GUW14wdkOBV7DiS5r2FnjI
	JOPnCzi+Q==
X-Received: by 2002:a05:620a:1789:b0:93e:9807:978c with SMTP id af79cd13be357-93e9b859774mr1077911885a.77.1791474938972;
        Thu, 08 Oct 2026 08:55:38 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93e98f6b4basm507577585a.6.2026.10.08.08.55.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 08:55:36 -0700 (PDT)
Message-ID: <223c5189-bfda-4c63-b09f-4ebd01bd144a@riscstar.com>
Date: Thu, 8 Oct 2026 10:55:34 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] PCI: of: update endpoint ranges dynamically
To: Andrea della Porta <andrea.porta@suse.com>
Cc: bhelgaas@google.com, lizhi.hou@amd.com, herve.codina@bootlin.com,
 daniel@riscstar.com, mohdayaa@qti.qualcomm.com, lbiancon@qti.qualcomm.com,
 mani@kernel.org, robh@kernel.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260924222444.1351466-1-elder@riscstar.com>
 <ase6toUhGn0XD0v9@apocalypse>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <ase6toUhGn0XD0v9@apocalypse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/8/26 10:45 AM, Andrea della Porta wrote:
> After a quick test, it seems that it's not working out of the
> box on my RPi5. Let me investigate a bit to see what's wrong.

THANK YOU FOR TESTING THIS!!!

My hope was that the recent change (to avoid doing any
updating of ranges property unless it was found to be
"empty") would avoid any trouble with the RPi5.

I'm eager to hear what more you find.  Please let me
know if I can be of any other help.

					-Alex

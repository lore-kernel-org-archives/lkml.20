Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4575848E0F0
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790331517; cv=none; b=XTAmB3LnLOwSvg/go2fDMsnX2xHfMCXCTDuNQes50liBfgwXgx8kdUkuNawja1PXUKor844v359C7oMBfsEuAC9JHM7LFrH/BMWvoaEBPMdWbyQTuuwgs2jTy4INi0coZMIM7nc4NmeoZf4JJdeeFh4+K3ZM071zGiN45Fc2jMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790331517; c=relaxed/simple;
	bh=AbQdBqj49bj37Pnn5gBhrLYqrKsApmp5K7k5jiUmA+8=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=qu5UW8SXm+mJj0sQ6uMX4iQVOx7cM1JD27+9UYgna79Yv/za+V+98tQZw0nbDQnhDIVUDOEsNvc6gOGUEbUes4157thMI0p/FK4+g3RzRrbdQj68kottdjfYlWtwBVeH78pGj5gYPHwnx+RU2YernEk+U/GXm8+iqYL2vIMY+p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N25+xQyJ; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N25+xQyJ"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f6c7a4aso95210266b.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 03:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790331514; x=1790936314; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XtsATQAvwWzq3tttdr/vRLT5iW3ODN1iCt+NsOWKe2w=;
        b=N25+xQyJqsyJqluts/3gADohh1copx+dnGw6Hz9Y2wqbMe/b5dauJm+GakrYkCMCCa
         lQvmB44Pd1C4X1f7OqsMQIsqaqrmS36dA+G54Pf2EMQAEJHkVOMBTzhsP9Dhq7jWQoO6
         yEipXccacO+fV5Ox1VTBPgkLHDiTF/3FHTbrvn5YhZQkpCG4mRZX1c6Qk7szXYy65sMk
         qcFSSPDpwabwq3F/nhea7KlEzVBIBFdi1EsnofdkBCvSILEj6T2pCNJsUM2e1zIwRLoS
         7hszWGrlvVqvHSxq+zdcCsqKm3MxdvonlUNBVgiGhfb0XeHhbQcqevgupHlHXqoS9GvJ
         AzuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790331514; x=1790936314;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XtsATQAvwWzq3tttdr/vRLT5iW3ODN1iCt+NsOWKe2w=;
        b=C44pDHn7lTWfDgmAb0aRS8Sbf332R5dtheDsBfEJdpFDhzwFiDrpnvkKTlBaaqfOse
         GfRD/97ItlBPCokRLz4B5r+9XIrgDzIqHrHdovkDxbisEzU+gqgCQxdyBZxLctk4TYaH
         hOwz6SoK8NwtqYlIKT/BgkZUJI9gN59wXwAamXJfGpyxUAxvavWZGRWH994wk2e1UYta
         wPy0BaKwJ3Gmz6RHOuJSlzKk0KnJu+1y5W3J/sZrhvRkdbBz+wXd+nFj7ciOr9TZhTb5
         LHZd3vecWZPBP2KCuOk1PQsRd4cBgp3GhU+ez2PWpB3+KMiFGKILAp2adkBkwvS3YtEu
         YT1w==
X-Forwarded-Encrypted: i=1; AKwUvBzc4BoigoNztCSeVSE2AREMFbkwYbUKT2pemMHE/ATcfoXcLgmbfbpbJWmRHEgd/kiBf0DcTmqNXmQjCO8=@vger.kernel.org
X-Gm-Message-State: AFuF++mYsYXHJ/wbsVQ0HmhcFjsT0KM9D6poXteQ9veUzyTM3nnSq3xo
	YRZiat06/QOPshztLKDVTCcWXGA5oRTwZ9wzEahd+ImifCVy9qkP92z7
X-Gm-Gg: AYBFou2ppLboDEW1GEezhkhwexRrNEKYfiVR8daQvVCxs5X6ViQKDY89NFCLaby8nw3
	DsKDfFZ1do+ZuqqqgtEqa3n9X2j0l13pzAifbB2LUGaa0/Csst80UQK8Jgdu0ghN/UFVtJv77zw
	UhvZTm/SsdPYfJD5y2sfVncsdbhTLwfOOG7OvQWVRurNrMAVp2KrpVQ5DnbSnlUg6hLEz8BJb//
	yHkJPg1sxqYscfnvHAGps4GYgB9LuCxb+g4SXa0XW/K88tEUtcibqyo4KUuiHG9dVjhrn4Uk1+3
	rYwzu+1FvWac7mrWAIGnJLp6t52Yf3eIzCCLNr7J15NmOiaRwYbabo6uMVbf96NiTZhh824fRi2
	Oc1AqNJgucift1w3zpSsdI1PB4JxRgxZqMELfjgsWY8RRavDfK2TcBcv3UVpjwsC/u5nkH2mk4j
	Xz47R7GCeZyz4nvaw1qvhF6SYgj80av3Fpo1D6RQVlkf8ta9TAOpMwUZbrU7nk+EegKg0UzEzb5
	35L
X-Received: by 2002:a17:907:9289:b0:c2a:d65c:c194 with SMTP id a640c23a62f3a-c2ad65cc78emr228455966b.29.1790331514319;
        Fri, 25 Sep 2026 03:18:34 -0700 (PDT)
Received: from [192.168.0.46] ([63.135.75.98])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae84ba822sm87933466b.7.2026.09.25.03.18.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 03:18:34 -0700 (PDT)
Message-ID: <92b1eece-9dc7-4b33-9ec5-fc94300038f1@gmail.com>
Date: Fri, 25 Sep 2026 11:18:33 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: arc@gmx.li
Cc: drabik.p@gmail.com, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, mrwillporter@gmail.com, neil@androos.io,
 perex@perex.cz, tiwai@suse.com
References: <20260919151840.24371-1-arc@gmx.li>
Subject: Re: [PATCH 0/3] Add Audient EVO4 support
Content-Language: en-US
From: Faaris Ansari <faaris.ansari@gmail.com>
In-Reply-To: <20260919151840.24371-1-arc@gmx.li>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thanks for your work on this - there is currently a regression on the 
latest kernel versions (7.2 onwards, as well as LTS kernels 6.12 and 
6.18). Trying to set the volume in software like wpctl, or pwvucontrol 
causes the software volume to be pulled down with it - I think it's 
something to do with "sticky mixers", not completely sure.

I worked through troubleshooting it here as I originally thought it was 
a wireplumber issue: 
https://gitlab.freedesktop.org/pipewire/wireplumber/-/work_items/1022

This patch should hopefully solve that, and avoid the usage of external 
kernel modules like https://github.com/vanzaho/audient-evo-py (which 
you've based your work from)

I'm not exactly sure how the process with kernel stuff works, but 
considering a regression on current mainline as well as LTS branches for 
this device - is there some chance of fast tracking the merge of these 
patches?

Thanks, Faaris



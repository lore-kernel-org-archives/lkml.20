Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C481DED49
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 00:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791161169; cv=none; b=RV5qRv3qK6KDVfOnPgqsTC+mfdQromJAb8ImCkHdyzkO5C5xNjgqhBS/ummQLw4B/piK595ccagGsyQr8zvMaOgreNwY5mGZ/ZqAXzrAtqNZT9lbvsyKEEIyyuF9y8j7lkNS3jQK+R1uOOx1Xrz310NOFDr5jSC79VwuBlcfcaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791161169; c=relaxed/simple;
	bh=XAuyJzwmchjjYdUKDJbH2DgAwDBPpjZRSl9vBWn6USI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WkBeacTOkMEqDCYQTRRjahjPwfRCmphGyQrD/TvL7ddERXsSx4hUqAly18VT/FIBidTYsbq4i+SvPdkrWJuLh2Np/ks7ccan+7Cp2Aj9Iv/NU0RwBPPfs7SJpn9ZVrBAyVdPaJQd2Dgpson6uAHLhrsocn/JP3IvGNeTjvuiR1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=F6I49H5k; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="F6I49H5k"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-9105d241693so14893496d6.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 17:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1791161166; x=1791765966; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zjr/DFZpwWSDDMMIDOykMIAePqSreo0kXNfDIw7NN+c=;
        b=F6I49H5kmznNVJacN4RyqjwGl5jG0Xy8zBVI1uFXHoNz8N0ln7C2m1FfCoycsbMZSS
         9jsMnTExNy8FAOAh2QCQFYb//3tjekj3BKwIO5IB8rnI67rbiNdNnROQr3qmFu51iPXZ
         tnVgjIJNkRPgJzb1wqrdUdK1UFQsoKWrjcVtnKPQMPo4o9HTKFjABeQTu9YtiD2yZ25E
         i+9+IZkPDyQw60Tklw2FQCkHlX7IAqk7dbBv7XMKNg7v0FTkSqC2ZolOmLd9RwcA3aJ0
         CAuZZ42s3iomaLj3jhvk3tm3Q0NT447Gz6L5dGYoTZQv14HSWnwDj2OMN85pI9ce4h2r
         nlEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791161166; x=1791765966;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zjr/DFZpwWSDDMMIDOykMIAePqSreo0kXNfDIw7NN+c=;
        b=kYjCaZjcxG16klcFFRRdCoMOfigjUM2/zoo/SEy9ZaJ8g+v32YVbwi7Ehu3INQMXiF
         +UOUzQXK+2TPmMRa8WHGNplOYpoT3ZSlPqPvKsg/u/69Hlqt68S38ZXc2Z8W272wv1xc
         rzN5lsI7eUWR0favVKNA4fDCqMD3Mij437uC8uajgfuPR1Fg/SVG9nw12D5kgdTMn4Fu
         D14H9DcciG8LYceKxgSptbHeAJJOGzO8aGYCmzbN0+YZbKdYVR2O5V3taMAzS1caB1a0
         45J24m0knHAZyl8It3V1ztc+mYx6B7MgQZuugSUtmvBEmaIaRAPtQDDNAa0ajVCtMTYN
         mDvw==
X-Forwarded-Encrypted: i=1; AKwUvBwaKFGSEeORWgeWYToIrwtfohNGY97gB+/CBGkS4w8cXX+33rSbCnho6DAFB1DXmbIIXnhMB30HdqJkdDM=@vger.kernel.org
X-Gm-Message-State: AFuF++lfx2Z5mmHJmHzukP6EAmwlrDnP2kcxpVV6o4aXFeDdbzr86DmW
	tgn3lEh8rEL47Lvyr+Ls/1alGNJmbWdpwDvvAdytA322GdnIXE87Mo6Qsgd/eNcebQ7OOY+Hja1
	oiZLyl8U=
X-Gm-Gg: AYBFou1V5VdEVCSU0Z4T2FDGbFFko5jlGXv8MPLytJ6pJYdv89KTgA7RUXh/gg1W6mB
	eJmdtkrA7QQc2kAwbgrtxm2H0BVyF1F3w9XYyApdvIpiI5wp3EQ8tF7Ap7IP8GFdLE9t914JHxc
	PhTYXa1eIgWJekx8G2xz1+oJM1mbyOgSxI2gue/MzCytiRKaFf1uvULeLX+QHUgMn8Tww+VFxVL
	ntKuTxL7J8fSGcXPeopI8LvDPVljxOhHuock1p8m3ug/8u5iJGWfDh7ScsLJUNpuUGlv/aljuq/
	P2ZRM/H0eCMG68mJ3EXQ5LPy+nDzkF8EuBW0zlNwRLv0IRrgHSiT8/b6o8pWp1u0u0vN/YCSfWI
	e5u8S3EB6+4gjd9oVYuz2PBlbIGxsjAAqAfDpnqkUzRmnrv65QGHdyB44HM6LbvpEhTx/taNE88
	jMnayaBzSHV5gws37TTwIjbvldrKfdgNImkcT+ub+BP8WBS0eeFY76vLrGsKbYlZfm7m7zHYkXS
	dCnQ2NqTBb/
X-Received: by 2002:a05:6214:2403:b0:915:e5c8:5663 with SMTP id 6a1803df08f44-917bff2a656mr179891486d6.4.1791161165979;
        Sun, 04 Oct 2026 17:46:05 -0700 (PDT)
Received: from [10.211.55.5] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917e0c3a0b5sm75214446d6.45.2026.10.04.17.46.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Oct 2026 17:46:05 -0700 (PDT)
Message-ID: <9af0e851-0cbb-425d-a78a-7a20282d3c2f@riscstar.com>
Date: Sun, 4 Oct 2026 19:46:03 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] lib: parser: reject out-of-range values in
 match_number()
To: shashank Jain <jain.sm@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alex Elder <elder@kernel.org>,
 David Gow <david@davidgow.net>, linux-kernel@vger.kernel.org
References: <20260926012718.15675-1-jain.sm@gmail.com>
 <00571efd-cc91-4ba7-a904-9ce183313f25@ieee.org>
 <CA+FWx=mP40LGSNxX=ivmam9d9i+JxtZBhuebGQHqyVK2Yeq4zg@mail.gmail.com>
 <0287908d-79a4-44b9-80c0-666b7ef6f639@ieee.org>
 <CA+FWx==H3G2Etg+bYQxOGyr4_R9hhjG+abuJV33EH0CkEu572w@mail.gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <CA+FWx==H3G2Etg+bYQxOGyr4_R9hhjG+abuJV33EH0CkEu572w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/2/26 9:12 PM, shashank Jain wrote:
> I'll send a v3 of patch 1/2 with your version (with "int ret; long res;"
> for the two declarations) and add a Suggested-by: for you, if that's OK.

Fine with me.  I'm glad I could help.	-Alex

Suggested-by: Alex Elder <elder@riscstar.com>

Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5B9485501
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790585615; cv=none; b=OaRd9yyYQA7/ZJu9iaCFTRK0bTrp49oyR1KDMncVtJMTQkmkdVFXvOnwV5mi11sfhWyKaLuALMPCAV2zNnatttvlWXP2iP1tga4Dm81QNIm6DBcrpzQmAm+v6zOWsuAdfXTZaCAfBoX1IwjQ2lp0sZwvakz7HNE99vRrbb1Mwn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790585615; c=relaxed/simple;
	bh=ZaeIQS1rA7QgfqJAf0PPDtdWcH4akOQrPw06QL4tVLk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c1y0sVfBHT8wgGbaguRKVIoDLCrE0f2q1CjQ3h1ew1pA8Hhd3ZUhYHqcA9+bEW3Xox70dAiDTLvFfjzDUElmywWsXFX/EtNitWQ6M9IxbuZr4sZ/QoiTCkHCyMa8kRXhyj+2yXmC4zQUxyZS0GvqODE4aogv37j4FLhAJnw3hrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R7hCUDKq; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R7hCUDKq"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2af9270c53so231637666b.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 01:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790585610; x=1791190410; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZaeIQS1rA7QgfqJAf0PPDtdWcH4akOQrPw06QL4tVLk=;
        b=R7hCUDKqtohj/v2Xj8LmjSn2VMSrM9zfTip7o34VGzFEmQx+bMN2C8VtZ1znR+Oou5
         jzXEtqfK+ZJj8JwIfCl7MkVmFBXAWU/RngV95DVhLwS6EAFXtrflzbbp7szFHEuGfgh4
         DtG+YA4eYRUxu1LyIbpOI+pLZWv6QSqa1NYldQxks9iitW3Sq7WOeYXqL9UdrZCgL/sE
         SBUNiaaCEp2lc14Cl9Wdss8WmJdR9oMIeciKau6HyOZdoJqOSAWJKYzRGwwgC1DBNnUX
         6Ie+6MkbWtcNZA6IPhCEVmEvDrLceO995HEckV99BYBIHxqPLnSm2C3G0Y9VA1Gox0uT
         IftA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790585610; x=1791190410;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZaeIQS1rA7QgfqJAf0PPDtdWcH4akOQrPw06QL4tVLk=;
        b=1RFLKYjKRWBQ5nB/E4K63Hlb7xqD/Xu22kWM7u3lpDOpYKAJVcB2KPPw0eT962/04U
         E1XFE6ULswVLX9zufB2k71BO4X3vtiheol0/IuhBDo8pbIvkLkMqzl6ih3eK6h+9HuxS
         Yp0oujeeHpdDL7MQ36GKqVb+3OeTCnQL+mvUx4eWuJ8HRduRT85FKzXh//IZd45cQXgH
         kMtTpLkH0bhjVcEL501IK5iLkFSsciCSU5856yEkX9Ytm56nRsvf7ZuKhyYclU5Yc4z7
         Y6MV8Ni4SSXilQ5nc+dblN1mvtUg/T/D8g1aMpDpv2+b7IEy4ipAbTADjdpgyHB0jpQK
         Gp1A==
X-Forwarded-Encrypted: i=1; AKwUvBw2KpZc1erP8/MWJP/W9njDEDS9LEXyNNyLd7DM6/6ZPRbkpom8fM4A1aq0x3R7lIrWLZH6QHGeC/8pjjY=@vger.kernel.org
X-Gm-Message-State: AFuF++nTviuIvd9eAqJRS2abtw3SUOx7l5iadbjNstBCSbDMwfTCIgXK
	MR+9qaWGIKuyPzypkIO0K3MHIQqCPCDxXWr6wSgCmdVAAg5q3dgJWFQx
X-Gm-Gg: AYBFou3NiGEiyKid2eBCMlHQcR6q12veuD+y0/UUAYUx1Db9QWXmSVbMMukd1f8wqat
	kff1q/VIW3Mk847xybu4jW2uhDnW6iiZXJ7H70fvmEOIW+yyaJUzgMuKzCy3sD5RZChangkLFCd
	Jb/h5WI5D8dL9eeh+Pe7PGqb/9eu2l3r9W4uYOeTHVYqgaS96e1HbEsXPTEAkWX+UyvyVKjLq8W
	mnqB/1c83AeJfZ3VrTAVZ8KqqpKZSgb7OjkO50zF0xTRdZE+EtaTvek1W8Gc9tguCcWuDLjASJ3
	3yRcAquNqSfsxuICJK7dtMMFicOdB8uKqHDHCT/efb6Bh1qFPx07hMnc/4bKy0HCFtlSrIDlewI
	GhN4mBmt4Ay78eJXHQzRAMJxdxKbCpxtDsburO3kBcOzcDJ2AxRfXw3klN5TaiOHrYw9Umj1ckq
	a9oW+AYiWMIo/8plWWkZtjKf2RBoIgPA9FzcOWc0rzD4AlTeO7P8jl44mW7P0bPBuP5hnO2NQQe
	h3NC77KlTwVrAgnsY8ABqa/pkFnMJtUTFOST7KMTYd8hX6m5W09Ph3Ejg3Dm1bXsuOFFrBx5RMb
	zrznZTRzFLsdxClG5NhyF0zWR2ied5BY/pSJu7r6
X-Received: by 2002:a17:907:ea91:b0:c29:45f6:6a1d with SMTP id a640c23a62f3a-c2ac5507183mr937039566b.43.1790585610060;
        Mon, 28 Sep 2026 01:53:30 -0700 (PDT)
Received: from [10.109.205.21] (ewetel-whiteboxtest-142.ewe-ip-backbone.de. [91.249.214.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2dbd380646sm257637666b.68.2026.09.28.01.53.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 01:53:29 -0700 (PDT)
Message-ID: <8b0d1fc7-1966-4eae-9ebf-ab14ada5af8e@gmail.com>
Date: Mon, 28 Sep 2026 10:53:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] HID: Kysona: Add support for Kysona M600V2 variant
To: Tjark Effenberger <mail@teffenberger.de>, linux-input@vger.kernel.org
Cc: jikos@kernel.org, bentiss@kernel.org, linux-kernel@vger.kernel.org
References: <20260926124337.45870-1-mail@teffenberger.de>
Content-Language: en-US
From: Iwan Schadrin <schadrin0108@gmail.com>
In-Reply-To: <20260926124337.45870-1-mail@teffenberger.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/26/26 2:43 PM, Tjark Effenberger wrote:
 > The M600V2 has a different HID ID on the wireless dongle.
 >
 > Signed-off-by: Tjark Effenberger <mail@teffenberger.de>

Tested-by: Iwan Schadrin <schadrin0108@gmail.com>


Tested on Arch Linux (kernel 7.2.3-arch1-3) with a Kysona Aztec mouse
(dongle shows up as "CX 2.4G Wireless Receiver", USB ID 3554:f5d5).

Adding the PID via new_id binds hid-kysona to both interfaces and the
battery shows up correctly in /sys/class/power_supply with accurate
capacity and charging status.

Note: this dongle PID is used by a Kysona Aztec, not an M600V2 - it
seems to be shared across models. Thanks for the patch!


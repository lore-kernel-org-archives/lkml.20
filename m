Received: from mail-yx1-f98.google.com (mail-yx1-f98.google.com [74.125.224.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC58C3D79EF
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 17:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790704088; cv=none; b=BHMjndVorSdDyTUeSBJaHFdUO+ZYTLHGcVLrL6LlM3q5SXNxB2niSSNsUgMcGTvW7A2dsgY93T17/nMJesq5g+FxfqqgdboVfwg4rvrTyS86QukNvrtgLqY70SS4HDdhBf3Zjjqw90KPVXn05Yb/87i/x0QF2Qw5+b+Eb1ld8Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790704088; c=relaxed/simple;
	bh=cJpmwEiuNdtdqwEFSa2ysDoeGDJ2N9SxsOcBpZJ0PNQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h/IyJYhFVFB0maaK6pVkit1pJetXAuPAYyGzsSesU4yp+XEbSW5Kqffu2B1CL6BtN523/LjDmvSRG1fhNPHCp0RkJOAw6+U626l+iqYGmT91T9wj8uy9PAxrUTEi+/xtYa6prUFuDRFW+/usave4d4xadmMl8xraUh9KowEDyyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=U4bWRal1; arc=none smtp.client-ip=74.125.224.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="U4bWRal1"
Received: by mail-yx1-f98.google.com with SMTP id 956f58d0204a3-67162548181so388429d50.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:48:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790704085; x=1791308885;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=e7MyTOOeEo7WzEXet1cmfM85sICUvnUIP5uaOgZRIgc=;
        b=ojOpw/9JQcOJH6VJQMR/7LuyHWUT6/gW4FRrGLaSduLwcAf+tNZstZDqEVcO9ST9lO
         Y4N088Xj+7I3odyWUkHT+9V+t/jIBRrcgdu8MFgH6kZXHidI4Tr9Z1eCpGslW3D8CesN
         pLYDA6u0Bz+wgVXF4Khy1xrtZo8Cb4203FgovoQPByT8nbhzJ2VKe1XvXxmzA+09wD/J
         jzo9joea+a8kZ89rng8oTdJ3AGZ3xL3r0n0bHWN0ErkPHVwKdRcXN2NPk6vVxU+Eb5g4
         N01shkQVXvt1Fq/ysknleAAGGEgn7k2u2gGOI3Ev8AIUwAjQe0rlvMyHKU0vI6ZzQ9Au
         SdQg==
X-Forwarded-Encrypted: i=1; AKwUvBzmYUjd43ixyxE9hgEhX5s2Yy0ttYb8BvTbRB14akkkPnwj0BXe7MUZe5t/rcqJY2EjodPblqFHFbLAMr4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLtsZ2iy4Jly8LA04ywQNbdqQhNNuBt+LEo5yTXDP6NYZzaBYEP
	qv+XNWIHfVWNrK/7wHTmxZ+4qjMXmp6BDuRHo3JUVRnx3d+LJ/U7ufDgO+csofTe/BLgjo/liBr
	njrgs0R3NCnWd/u5St2s88WHnmumk0M6apXZiX2GlNsU4ctpSJ9khkKZLjMXjnRKssiF/TBTBhf
	x71lH5b3SlweLV5Im2Xd6AT/zGQpKpprUmZEOQi6g2TmAQVOWb5ln1Xf1f2HyjvdhLXsQD97AN9
	x6wdIt3MN1FLtSgkQ==
X-Gm-Gg: AYBFou2g49SRyL+O5+vpFZQuZ6O7vGNevR3MGL7x1PXoMpkNVj1d2YShGDOwptBAayv
	AwkGslb7c+rpsGJhR6490ZX5yFt8Cvg+IGUu1qvqQAt3jtDBlCUV7/1wrS2GIb3FDLEb41K+ofV
	awGlBGz7wkHAsXy2AN1hSAlk6WSB52IqKDyg+I4WofkZURDdod86EgH7YW3ak/ds6Ic0kkUSSD8
	7QkEG6/ptpbJQBXkiLDiXzOoWu264+0cDYoZ7ABK/CalZcXEqJ4Xf0Q7FQnZcdLgTf+6Ws3PTKa
	Fay7s7muv6QKHNAPCiYVP+dckhhZoX6q+DJtfF3OrUbFyx1Y1D4bcz5/OZ015Eci15IlH4WhHfZ
	tLcvI0td/N0tGkcrE3tUAWWsxXBFml6zGyAZ9dSHvdOKsmF+DDtdpA0eZXd8da3o3EmgG+OVshF
	MNag/VwgGfVktTKCM75MceCQBd7AWSXvfua0Y+
X-Received: by 2002:a05:690e:400d:b0:671:520:cf7e with SMTP id 956f58d0204a3-672ed2a19c3mr7842927d50.49.1790704085331;
        Tue, 29 Sep 2026 10:48:05 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-124.dlp.protect.broadcom.com. [144.49.247.124])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-675b2800376sm105802d50.7.2026.09.29.10.48.04
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Sep 2026 10:48:05 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39b6416441eso7787658a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1790704084; x=1791308884; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e7MyTOOeEo7WzEXet1cmfM85sICUvnUIP5uaOgZRIgc=;
        b=U4bWRal1SZ7Hl6BG+s/i5AO3szN3ZCoOYl1RbpXW6RHffQN3O6R0Qubf6lE6LGeVDL
         cQQ+oIi/B8EO/XLwLN3yN2j+LthVII2C/FHyWMmPdo0zxAq6y17/G0NPdqFnVhhNjJiH
         9FILZiTtUvF1KctF3yRv3CnyGfvy7Wf8NHYiE=
X-Forwarded-Encrypted: i=1; AKwUvByFQdcx7pEEM3eufZIw4D+GN6Zr27thXqkpwcaNN+T8dtIaEjpUcQo2AtVOuF+ul00CEEWr0N41yLkqNAg=@vger.kernel.org
X-Received: by 2002:a17:90a:e7ca:b0:39e:24ab:9f82 with SMTP id 98e67ed59e1d1-3a4bfdbabc6mr122714a91.10.1790704083972;
        Tue, 29 Sep 2026 10:48:03 -0700 (PDT)
X-Received: by 2002:a17:90a:e7ca:b0:39e:24ab:9f82 with SMTP id 98e67ed59e1d1-3a4bfdbabc6mr122698a91.10.1790704083573;
        Tue, 29 Sep 2026 10:48:03 -0700 (PDT)
Received: from [10.14.4.125] ([192.19.161.248])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a49858bf27sm6624088a91.4.2026.09.29.10.48.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 10:48:03 -0700 (PDT)
Message-ID: <0cfdc48c-e06d-4664-8791-98b29138584c@broadcom.com>
Date: Tue, 29 Sep 2026 10:48:02 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mailbox: bcm74110: Cap rx_svc_init_list growth to prevent
 PMC-induced OOM
To: Danesh Petigara <danesh.petigara@broadcom.com>, jassisinghbrar@gmail.com
Cc: florian.fainelli@broadcom.com, james.quinlan@broadcom.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260825191619.2326087-1-danesh.petigara@broadcom.com>
Content-Language: en-US
From: Justin Chen <justin.chen@broadcom.com>
In-Reply-To: <20260825191619.2326087-1-danesh.petigara@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 8/25/26 12:16 PM, Danesh Petigara wrote:
> From: Florian Fainelli <florian.fainelli@broadcom.com>
> 
> bcm74110_rx_push_init_msg() allocates a GFP_ATOMIC struct for every
> BCM_MSG_SVC_INIT word received from the PMC co-processor and appends it
> to rx_svc_init_list with no cap on list length.  The only consumers of
> this list (bcm74110_rx_pop_init_msg_block / bcm74110_rx_flush_msg) are
> called only during probe and at shutdown respectively; after probe
> completes, PMC firmware can continuously inject BCM_MSG_SVC_INIT words,
> exhausting GFP_ATOMIC reserves and causing a whole-device denial of
> service.
> 
> Add BCM74110_INIT_MSG_MAX (16 entries) as the maximum list depth.
> bcm74110_rx_push_init_msg() now checks the count under the existing
> rx_svc_list_lock before allocating; if the cap is reached the message is
> dropped and a rate-limited warning is emitted.  The new rx_svc_init_count
> field is decremented by bcm74110_rx_pop_init_msg() on successful dequeue
> and reset to zero by bcm74110_rx_flush_msg() on shutdown.
> 
> Fixes: 52436007b862 ("mailbox: Add support for bcm74110")
> Cc: stable@vger.kernel.org
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> Assisted-by: Anthropic:claude-sonnet-4.6 cursor
> Signed-off-by: Danesh Petigara <danesh.petigara@broadcom.com>

Signed-off-by: Justin Chen <justin.chen@broadcom.com>

Gentle ping on this patch.

Thanks,
Justin

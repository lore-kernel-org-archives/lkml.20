Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A647E42DA5A
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 18:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790534902; cv=none; b=d5q+SAvHTnojBh8TDWNEhzwf34RwJnI08uF0a8FoGNXQ2scmcbs678GZOa/lGL4E09iaUDaW13R33z4np9IoLDRn2/+QAfqR6uFhc3daKNyHlTq7sM1oIX47CyAqczN24AWJvVVf8mij09HKwE0Pu6zH2Jcx3MMO7lkebrkHGuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790534902; c=relaxed/simple;
	bh=soXokHFCzmLIi+VJ1I3iTtbX0+pzsLftTokWbQ9P6Cg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=HhBTlCJa4JBs/oOab1UhVo0owAQZfeurfn9aHYgcxL+D7C4jEDqASiLkK+SEISxZZEFg5t3l0++zmo7X3E0pjHbHxMtTN/HP7rnt0kJ4qoe1p1vpdV3ZFSHAeu4Ax3XJSN+OOFNHc337cJB/8kySdLB2WUbYuOSniUr5aTTMqoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=k+RmNbcm; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="k+RmNbcm"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3115c4451c8so1909904eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 11:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1790534900; x=1791139700; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yqlZZ1RhSPYEVPxxu8nVXKmxPulry40jU+yUEBcr1Ew=;
        b=k+RmNbcmk2D7AP0kteNYpcaZdc/OxOoy8fVJMwEAKZurJAThwJr5YJOZ8NitnpImVB
         htLitsit0bfiW+cFgggLx5SZGCgVZ33wVyQIqpPA7OXzBXDiDFwyZwEVYao7D9AEVetl
         M3uAwn8dDROWtN2sjqzmbid8rTJjyeXbVa2Sr+LP+d0g7sxLpMCHIVT3rKPyifrM/PKe
         /cqbOOeUGoqFIka2VzrgEwWH9LMR2FmsIDGxzZObx2Ok7MGVyYeUsbJFh3PF8mgPPpf9
         dBqVwmjmD5Am3UcUIDfBG2EXGAtCgHKUBzgeppUALzldMB3nQJ9aYBGj0B99nh5rdgun
         7jrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790534900; x=1791139700;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yqlZZ1RhSPYEVPxxu8nVXKmxPulry40jU+yUEBcr1Ew=;
        b=ajwCmVIBavjrQ5qh78GcBwXpwZ+ynkX9ucjGpfo4whgRMCWbCigCt653nkOlcbPMVl
         Xn+pYM3kSccrqRJSR75evAZflIMpYTmMmjGBme7HytKFamsNgX0uyvSVTHwWxgPml/Lv
         VTMb20ny0SOAw0gv2KeMd8vsJnM+S4Bl9qAx+ByFZtx8DjRBrVMB29MTTZhyi3Tz5OcK
         BBI4JaNW9DtmSYNe9W1RmRLQ7vgGdtnMuyE8+OWQfngzRMuZxLCYEHOCHdrGMuPkPqUX
         /qoebkn3FG/kGEYZVnj9h99CPjr05H1oDf35uJqJZk6aaIcKULjCnPj1YqmrQzHJzmgE
         BUoQ==
X-Forwarded-Encrypted: i=1; AKwUvBxC1g+8iQmhC8VzBYRuR8dRNjXnULFOb8Yb6HGGbW9ozpOWT8TUll6oBzA7/lMJIgkDRgh4WvvvETmGGBs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIVQdUviQNXAbq6up9YOdc3I/D7ys2n3uygwlox6v2dhOZHm9vS
	6KJbB3R/qM/UetvKA5XNEAvsW22GWrIyKalpE8Q4bjVgnSJXT32MsKCig57QB2LNma4=
X-Gm-Gg: AYBFou1WK3MRb7YQYGoA39h9Tr3H5kgUxc4zPxWVecabQ3SyKrnqqYzjWEPgwPTbZSC
	+OYIoVb84zCmXeokN8D1PjVkqNI3lvGIYuSeiMeX3nBS/f/ke1ThHaVS4SRkDYbtDGAajLq2wJL
	MmfZmmkDSyEVw7/5mChQT13LINdHJ15RQ/pcN1BghYfK6ovQH2RwhQdS4f8JrIa6rZUTMsLlFKr
	W4QlJMQBjOG4x7PUh2P7BDk3SgvZ7izDqLH/Q5E3gUZm4Flg64NJpq7BxYOsRDdFaSJ8JWNIjom
	wxSH/iQrawUKaw03ZesEbCXGu1/S12AsiQR5gUQgHLpw/6RsMQdtpi/+T4+56kWqQnW1GlbvTZz
	h9yj/LPWEXRPFBKUKYQOucRls6WRaWNZvu1WHmg+vsdhTjC21d6RJ3ySbRCMKH/qGGusIHAPOLl
	PsxmqNPLdTIv+gQy2NmgKVeA3zKt309QK1ESwN5Pc99v+5202KFkQrY2AazBorNj1WpAMX/BI=
X-Received: by 2002:a05:693c:62dc:b0:332:946c:4778 with SMTP id 5a478bee46e88-342721805c8mr5904589eec.14.1790534899604;
        Sun, 27 Sep 2026 11:48:19 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-347323f5a7esm2044300eec.15.2026.09.27.11.48.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 11:48:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 27 Sep 2026 11:48:18 -0700
Message-Id: <DLQBNCNNWZNO.1AIPW6NRU3GWS@nexthop.ai>
Cc: "Michal Simek" <michal.simek@amd.com>, "Wolfram Sang"
 <wsa+renesas@sang-engineering.com>, "Raviteja Narayanam"
 <raviteja.narayanam@xilinx.com>, "Wolfram Sang" <wsa@kernel.org>,
 "Manikanta Guntupalli" <manikanta.guntupalli@amd.com>, "Shubhrajyoti Datta"
 <shubhrajyoti.datta@amd.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>
Subject: Re: [SPAM] [PATCH v7 0/3] i2c: xiic: fix SMBus block read and PEC
 support
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Andi Shyti" <andi.shyti@kernel.org>, "Abdurrahman Hussain"
 <abdurrahman@nexthop.ai>
X-Mailer: aerc 0.22.0
References: <20260924-i2c-xiic-v7-0-df7e752332ef@nexthop.ai>
 <arkAZJEJTtNsCjmF@zenone.zhora.eu>
In-Reply-To: <arkAZJEJTtNsCjmF@zenone.zhora.eu>

On Sun Sep 27, 2026 at 4:40 AM PDT, Andi Shyti wrote:
> Hi Abdurraham,
>
>> Abdurrahman Hussain (3):
>>       i2c: xiic: preserve PEC byte length in SMBus block read setup
>>       i2c: xiic: defer RX_FULL until all trailing bytes are in FIFO
>>       i2c: xiic: don't clobber msg->len to signal block-read completion
>
> pushed to i2c/i2c-fixes-2.
>
> Thanks,
> Andi

Thanks a lot!
Abdurrahman

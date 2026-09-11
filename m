Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA833470440
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789116678; cv=none; b=VJC48F5yDTdSs8Naw7YnAH0CWOvu7lZYcrnvvw8Q9ocF6vNG5mzBlqFav2yhlinN6scGOOMhW+9bXOrVcEyOs4cwu4z7W5/jWnX+rxB4TUBGOFEf9l8tbT62H7UaXLvb8OdSXVkJg7qWUfpruuV1GBPUFgFMDOOgnWIi+esM/po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789116678; c=relaxed/simple;
	bh=tvMysC/CeuoJ/SvvYgRXc3PRiPBy5Wp9M/28y1+/T4Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Content-Type:Date:
	 Message-ID; b=sCYtY1gWI7vHIAWQCh/XQRQ3T1MkYPftqsQEfK5GMbc5XRfxL5qtiuaiJO0WiUPa24o7mPsKR1jDDFfhQsdVBqJigqNUQD+uv1h6+JHqR9Ohn4SPmr/xuR1qWzNS5oIMAdqKigVJdo1Bj9Yt1H/rf1u5BipRPsKVpq+mLV/N8E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N42uOVX3; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N42uOVX3"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b9184fa80so639683a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 01:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789116676; x=1789721476; darn=vger.kernel.org;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AwetnbBbHmq54+9PKFJhG/LjURf4GtsJuxXdoTuoU6c=;
        b=N42uOVX34IwevujV8b8vitMWyTITmNuWdNhehkbE6IH+4ocLRxxyvjOf9+cyIYwiSB
         7yTNvsirYEvsYoVn84+iExMZ6o4zkV4QZqBEjjmfh7xK9mLinDbqq4LjJLEa7xfy2P11
         0GFGxjFClAqd++VfZMHi4aSFGH4XtyePh43dZWrYmFW93rpx1cTFnoBAkMaPq6E9LIlO
         TvbkPz7Ug0BuvPBkX7fTLXFPzHw32HV2NBBqWtCaWfdMFQE2Udfey7BKsk7xFgN9CrLG
         bkK29ZZCql+eJclK80JudkyKDkUhtZogiIP0oeWKaCVclx8q+p59mio2n5WJBDzeQeDQ
         /1CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789116676; x=1789721476;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AwetnbBbHmq54+9PKFJhG/LjURf4GtsJuxXdoTuoU6c=;
        b=A9m/av9I4Bq2JXk9gC8TuGOk2GJknM12xZS6nEt+fZ5bUgnkzD1LDoNxiHDsO8MzFG
         eh6ArVNhjJRPvVPU9F3ZK1kqvM8M72TT6qUVsbnCiMMEP9iE6I4B9m5WT/VbDmmxTmfM
         61QftN+Sl3y27QMj5Ez51yY6Ky8gRVY18eRWeKfHHqgQ8HfzB8GbOkPz6UdP8mrM5oY4
         TuWyySjcdDQ41Fu7MZqkSfnT9KSBCrQim5s2IcCq3dQqkzSqQdXJNynCYy/dNeDfJrD2
         7EfjyPsLPyGxvQA0rOmqpBise69ZEc9gXzLX8/VOrTq/88ErqX+RE+apmvpLnZRt99B2
         Uw/g==
X-Forwarded-Encrypted: i=1; AKwUvByF7903zddyEXLP9sbCO9QrDaQchex/6n5fW4Cwsee5hUwSVST7mQ352Uc0kmBPW21N1yUDHhOqCRlH/vI=@vger.kernel.org
X-Gm-Message-State: AFuF++l/Vj9fAaWf5xRMM5G0J7q8xAGM5JhSv1hORmWyKvbik6i1VWQ/
	XcUdY2tZB8ywTojDoMXE5hOyvil79cIUkl3AELtWOTuGrIN/wLXDuUpB
X-Gm-Gg: AYBFou1jG8Wc8kV8FhT+3kaPBD89/JXmJTzBmfHfkUv7/cXVM9HT24zzqsBrmGHebH9
	I73rkoAtpsACxYvEgBFmnndV2eRTq9I/BphEUT1v7wHYO70xx3md1YlqJosnDTfX8Ef6rDd3g4M
	Hp5AEFlRCcNChVeJ4LnzwEz8T1SJeXLhoLHlmRWPMrbG9AQYk13MVNRp4/+ThqH40pcjn0yKETT
	TI8dvmUW2MtpjhTyXWXR5L+MsC+Z9zwFElgoI9XkFAbCcAIC+fWUg84KcNmH7nOJXiFtuoBsPgE
	JtUZxuIai3d1SV2UWaFH33Qd5Grr9ohl9rGfn1epGj7Way4GrBuEEAOx9ZCrgrThrQReXBoJKfw
	8v3kz9vqYxmITl6CqjGTaDnQ2WI2NEm4pCvzOau4byuzgtN46p9zkk1MTWmjrDMOhF8s3AzJF7M
	1KsHZz2g1WQ83GS/JH0uyfxZLnbLytUXGApaKeXJifVCmjcbCCYDj7ibJltFbCip0DBrPHr6Iz/
	ZgSqwFcszPmz7zf7Ynnh4RhOa2dc8LJPMjU
X-Received: by 2002:a17:90b:270e:b0:398:dcf6:d40e with SMTP id 98e67ed59e1d1-39d9c1fe880mr5993873a91.17.1789116675878;
        Fri, 11 Sep 2026 01:51:15 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365ba71cesm4799895c88.13.2026.09.11.01.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 01:51:15 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Botsz HUANG <huang.botsz@gmail.com>, Nick Huang <sef1548@gmail.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH] mfd: fix typos in comments
In-Reply-To: <20260910094326.GP2133376@google.com>
References: <20260904122834.33723-1-hemanth.selam@gmail.com>
 <apwFlV97bLVlvsOJ@botszhome>
 <59747ea8-bd89-4dff-ba13-ff9c66318e8c@kernel.org>
 <20260909161454.GF2133376@google.com>
 <20260909161710.GG2133376@google.com>
 <a05c4086-1681-44f4-88c6-de1073b0f5a6@kernel.org>
 <20260910094326.GP2133376@google.com>
Content-Type: text/plain; charset=utf-8
Date: Fri, 11 Sep 2026 14:21:10 +0530
Message-ID: <178911667044.715443.13795127169435157424@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

On Thu, 10 Sep 2026, Lee Jones wrote:
> > Now, whether they should be Acked-by:ing patches is another issue
> > entirely!

I am the one who carried those two tags into v3, so let me take that part
off your hands.

I collected them the way b4 does, without knowing anything about either
person beyond the mail on the list, and I am in no position to vouch for
them.  I should not have respun the patch just to add them, which is what
v3 says it is for.

If it is useful I will send a v4 with both Acked-by trailers dropped,
keeping only Matti's Reviewed-by, which he gave after asking for the
"wainting" fix that v3 includes.  That way the patch does not depend on
how the wider question is settled.  Say the word and I will send it; or
if you would rather just apply v3 and strip the two trailers at commit
time, that works too and saves a round trip.

I will also drop the Assisted-by trailer naming the model while I am at
it, as has been asked of me elsewhere.

Thanks,
Hemanth


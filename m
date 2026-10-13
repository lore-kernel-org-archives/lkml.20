Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3100B472783
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791866484; cv=none; b=lW6PjT+wAlp48rZNTH6TmNTAQmvATjCnWO2tse41raLHLJ3KnAZ7QSZv9iYjF7aLYlCv17D5f+razDBK83XT9ueiNjsu5do3CSzwFDAEdlVfUxwX6G40ep8d8DJqwZFpYMYBFVH9n6bBgJmSSilRhhlrrC+EFayOpNYDNeqkQo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791866484; c=relaxed/simple;
	bh=1FGBCYpqoaQP7nZiD8Xk1Vj+UllHiO8jYhYyecW+KwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aT43/BMe/5S8ZSAH82MQbxZc457BO9wk4ZQlnYTLV4dDcoTFQknu4kyGdeWTPLnqPGVf+2NSJR8IFUvN4f9uMtByBTLot58x/XxQHD6o+JK+lB84imwpUFb7gcM9bEfktVFzuMvzhuex5/mwSu9eaDSjRJKYVFRHu1HJtS9Om0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tBYMcNuO; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tBYMcNuO"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so3969723eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 21:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791866482; x=1792471282; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ANl3PjyWBokYmlAx9rJhimSysaOK4KYpgUnncCZm4Lg=;
        b=tBYMcNuOsl6DwXh8T8YdAzzSQ4QzijrLaUpFZha+KvP3jIkn4JXKU4+WNR43gOFzn4
         8ZUHzPbrrHO5PiMt27N5Tvb3SvesP+NJE6AOUBjybjLl9rQkd/jQTP52ZpgU0EU0L1HN
         Bbp0mtyOFjq3EbcDeYL9WzO/r8edVasNdvOYeQSjVoHxIelt8DNt5IumOZtai73SPXEh
         lzIKmZ3VfKJTSypBe0WlGS6OaT1GSpJwyc4j7YvP6gz2c1niQtV4hZ4DjmI97/2Tbiwo
         fhm9HsCLl85fA+t0ZTSm6trhRJkfngypo5P+IVT+cC+vDTVYgkhupyOTAszWDpjV+7e8
         /Lpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791866482; x=1792471282;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ANl3PjyWBokYmlAx9rJhimSysaOK4KYpgUnncCZm4Lg=;
        b=Q8ZqkeiuD0hkb5yYrym9Ic6ZAABpTYzTYXLzeArVrPoxkLrYK/f523njYMm1xY2NgA
         Fd1h7Yflo7+UBVlw8gykMxGp3ppTw5JFJ69ARuXEBwzvwcsOJIDj55m4zTIMR4Wpuiw1
         8m1gvmFfnb68NGKWpc7j5h89ciQQSWuGCVQle9Z/zJXcJ73G0AOQPTMvbzd9PMrv4ivn
         5kEQI3b5LQV2ptj2XbxjushZ3/xC3zPRCmlPzDuMcjIiB9T0JJ9w30Jo/nDoOaT7yLGc
         d4yReIfBU4vM4irHEyDfb6J4apkx0ICk5qjgDtC9w1ZvOv6iaxo6PMk5rsVn4lr0Lsc5
         Oqdg==
X-Forwarded-Encrypted: i=1; AKwUvBzdvnh3J4eMf2z5OTaQ/OLxWx43K1bSwTkpZwfznV7ctG0NoLtUEEyqStOi3VQHY5LhkLV1CsSseaSRfWw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdIT+bvdwYkQ3ytx3Ib1c9EYCV6zgFzi55I3fuS3V17iF/wPJQ
	F8H+bFoKGLLLqawxMfg1HEdd3DtOyYgAl0sO6tGVkPyZzJZOZTPQZiny
X-Gm-Gg: AYBFou1N/nwFbp1nTkDH0/Qm53rOt9Du9BKLcEtS2ewK1xpoLihprhHIdTM9W7HB+mx
	jSa9xQAX+tD7/PrkJloI4tp4jKyz/BwzQQ9Xf2OOPzGhArGFxoAw9ESC7s4F9fDb8bth7DLg9ep
	7g+iZgJCNsAe4no9DnZ2LUVazyMvuf1t6bKODKWM5T3hnKkU+0s3xk2BLJBtJzoWIRVjiif/dUA
	x6mpM4dcvd5O5B4GcousQH3dcEw3Bgo1aehmf6ZAsz4if8PqyETThKIkzDSBgVHUxbt5BuvAceO
	IVad38xNA7AKr/b++vb7jbDo1Bs6VNocpOxe1URKDT8Ko/PzuGq049loS/M68blVWT4iKB7/LxF
	wCqDc4pECu3aNhoK2XUDs9QH3HkT9mRX8w1E9zdDyrkwd2NvNACPINDU5LjZ6YHRMCMEnwWzcQk
	0AdWL/LIQG0fruswGgJHoyePh3QAhfzGtUQFduAeSp+DHvHN5EfDWBonx5usMW88oxCFTCTaDY2
	8UyGyuEp6Y0Q39OkvEPel2OGnztXLp6UGTR
X-Received: by 2002:a05:701b:230c:b0:14f:5cd:f286 with SMTP id a92af1059eb24-16a6203dc73mr17576796c88.34.1791866482064;
        Mon, 12 Oct 2026 21:41:22 -0700 (PDT)
Received: from ?IPV6:2401:4900:1c43:7890:582d:8daf:d401:c87? ([2401:4900:1c43:7890:582d:8daf:d401:c87])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442956asm43133349c88.16.2026.10.12.21.41.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 21:41:21 -0700 (PDT)
Message-ID: <8ceef81d-bd17-4910-af11-699318691c23@gmail.com>
Date: Tue, 13 Oct 2026 10:11:15 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] openrisc: Add support for KProbes
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: jonas@southpole.se, stefan.kristiansson@saunalahti.fi, shorne@gmail.com,
 naveen@kernel.org, davem@davemloft.net, tytso@mit.edu,
 wangruikang@iscas.ac.cn, namcao@linutronix.de, pjw@kernel.org,
 kees@kernel.org, linux-openrisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
References: <20261013042255.7DF701F000FF@smtp.kernel.org>
Content-Language: en-US
From: Sahil <sahilcdq0@gmail.com>
In-Reply-To: <20261013042255.7DF701F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Masami,

On 10/13/26 9:52 AM, Masami Hiramatsu (Google) wrote:
> Hi Sahil,
> 
> Thanks for updating! Could you check Sashiko's comments on the series?
> 
> https://sashiko.dev/#/patchset/20260930203129.51048-1-sahilcdq0%40gmail.com

Thank you for your reply, and apologies for being slow in sending an update.

I have seen Sachiko's review comments. I am still working on getting v3 ready.

> I need OpenRISC maintainer's review for this series too.

Got it, that makes sense.

> Thank you,
> 
> [...]
>

Regards,
Sahil


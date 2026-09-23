Received: from mail-dl2-f12.google.com (mail-dl2-f12.google.com [74.125.229.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C2D36A342
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 23:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790206828; cv=none; b=D8PRpMt+qkygNS3TmP9751tzQaaoQsqKX+6MyGWiMuguefP1j0NJEevVTWefqsTpYUj+XuxffpPmqaix2O4fzb8vb3GFZE6J7t9o1uCCjlmOBzcwZAUmOUPpCw7uFbKIsSYLt8dXsVLOtr/BU0z2IJW5mvT9qvIJEvFi0UVNH5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790206828; c=relaxed/simple;
	bh=4d73jWUhVKwFne2iiMKsl6S5mOHyq32pL0TlnUi+MgQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZC7BRCyZ3/C7C/DplEYV6zLB4kJ7mzpMkb5SsC8n1yZC9x7ts5KSDZk6FBmcb5leLSqn8e+MmtbKwU1MqI+E3OX+wfzHjSRaSP51Uch6xvMN5cwrpWQdbW78caNhMPsCBWizY7KsenWHwi29C7kLMdJj4Dkwr3kXxMBbSakh5PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=STnjJXSY; arc=none smtp.client-ip=74.125.229.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="STnjJXSY"
Received: by mail-dl2-f12.google.com with SMTP id a92af1059eb24-142dce6e235so1139987c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790206826; x=1790811626; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+e9xikenpRxNbzkrvogML2O06nN9p7dr3NtMTmQXdRg=;
        b=STnjJXSYSMHRbs357CYXvmOd8kc5W0w+MGR6gXvBRAfCpw3RUHtAJOnNZrJVc9KOfd
         4+4Nqmeb3YLNcT/Kqd2Qc8IQBeHnxQPVoWcY8GIbMgX+ABIJWkWNe27hBh+PffA4STPv
         fVZNvFa8EoUard/aYXfWaW3+lNUVmCzck3Q0HOWbROJlh2Zy944yyXjB+IDILfpGE2Wl
         5F12vl46EIOE36f5ekgkOHzLHsFPyO7BFv3FTsjLAGd8MkoEyDxaQX8TKhNnH92sQiXk
         9cm1tD3tQMBKYd3Mbt9HzScJg52ST3Ko8Inq6ZQpd7qB+jSSSJC0ddvhgAaoAMSXexrz
         4FVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790206826; x=1790811626;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+e9xikenpRxNbzkrvogML2O06nN9p7dr3NtMTmQXdRg=;
        b=NGRRF2giRtwITTxVMmHbdgrssG4qGo/bkHKDf0OuSUDhNfNVmzFpoGUEqRaMvFTvNm
         mnhqWKifOHuQdKTj+yxIUSXTkqkikan4U67bjdqme8x4HjbFzrKgjSuYXl8DjzsFbJoR
         j7wRj7Lzj+DdUEv54JO5phgzXNOOakLdIjmKr6J1KtPQd5ilh4Quiz5sKEnlQs5ZfCrg
         ApIqDcz2n3WEIWwysLZnw7CPN3MN+MajtwVl1g6XxLMQzBHxx5RwZi0YQ75iGzQcbkxY
         psn6Gh8NpVUOPdlfJORE0lKpcJTpds399A7jYJl8HH7IuxbBBvR/OrINA1bpbBiNfd/s
         FH5Q==
X-Forwarded-Encrypted: i=1; AKwUvByW537T8mxG6Da6Smsa29EMLJGvfJQYal7aTepJ7LpQFvqQjh8H4b9rj0pxo0W9Kl66En+HMgt7zEe8AiA=@vger.kernel.org
X-Gm-Message-State: AFuF++mx2yBp4pSDVer9OG1lrGPRASfRMrx2fkAbO+I2uZCbw9nOxoXI
	it9tQ0kTmjjirhFu9P83KgufqmLjoUp445lfT/DlG8LwSTHavU8uYmzI/TFAA0sr9Q==
X-Gm-Gg: AYBFou1zqhfi9i+FDIM9yyfKxBSj3q0AuFXGaTfFXzjff6GJIR1c7UrOGouvsOXeHBe
	1uZ5Z5iwz6MvxBdAPG4axKQGBxzSCi3HrBYjTd0zbbJ7NVDaYiQcG1C5S5IbRqiEgxxcsGr6/R0
	UC4pAWyXj/wAb/HsT3d1UQWBnXQs69AjhWzXvDJMUPePjiBblPUP+VZp9eDuscLZIxtQRYTPRwR
	opmrePI8xuIQaK3IW3cp6cMLsZ9145e+bkIQDGMr6Gp3xH4u2FAS4MDLS6TvVdK0vWXCqb5DbHJ
	2Qz88c0UYDUdOOY41BXtDVdkeYeBKpOW5jqgJtSDkbMFDu6K1oJHvCK1nfQww12aXEh1itk6due
	ylin8P3IC2JRqi04izhMvo3Qa1kjAj1oy+ZVfuoGTOe4dmgpkWHuOqmz9im1Q4/XUNSpuWrvxRv
	ytBs2dapEv6rg1gABw/UxWiTJcgQurrnIW/IakL2FyC1j23WaOYKmThw4eisKjNBvgFU7m/STvP
	yra7VzDhKL8vNmr8tDzCTy0HZ7d+RbZ5rasxMXGX5KJSCCkCjrm6HQFUekiuJi9SHHz2yzzVzIW
	k46EKDvqKc4+YMHd5u5EFiyNm5U=
X-Received: by 2002:a05:701b:4515:10b0:144:fa64:dada with SMTP id a92af1059eb24-1450404d478mr444412c88.15.1790206824869;
        Wed, 23 Sep 2026 16:40:24 -0700 (PDT)
Received: from ?IPV6:2a00:79e0:2e7c:8:3cb2:1d30:b85:ba2e? ([2a00:79e0:2e7c:8:3cb2:1d30:b85:ba2e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f983c5a1sm14488825c88.7.2026.09.23.16.40.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 16:40:24 -0700 (PDT)
Message-ID: <4e21dd18-1988-4eda-82cd-4dd64620fef7@google.com>
Date: Wed, 23 Sep 2026 16:40:21 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] usb: typec: tcpm: reject type-mismatched source/sink
 PDO pairs
To: pip-izony <eeodqql09@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Guenter Roeck <linux@roeck-us.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Li Jun <jun.li@nxp.com>,
 Kyungtae Kim <Kyungtae.Kim@dartmouth.edu>,
 Badhri Jagan Sridharan <badhri@google.com>, RD Babiera
 <rdbabiera@google.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <CAAsoPpX1NgzMKJrvTdNp0heM0AMQAT0_t_2+AJdZs5fsZNpLOQ@mail.gmail.com>
 <20260923170301.415666-3-eeodqql09@gmail.com>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <20260923170301.415666-3-eeodqql09@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Seungjin,

On 9/23/26 10:03 AM, pip-izony wrote:
> From: Seungjin Bae <eeodqql09@gmail.com>
> 
> The tcpm_pd_select_pdo() function matches a source PDO against a sink
> PDO using their voltage ranges only, without checking that the two
> PDOs are of the same type. A source PDO and a sink PDO of different
> types (e.g. a Battery source PDO and a Fixed sink PDO) can therefore
> be matched as long as their voltage ranges overlap.
> 
> tcpm_pd_build_request() then combines the matched pair with
> min_power()/min_current(), which apply the same accessor to both
> operands. Since pdo_max_current() and pdo_max_power() decode the same
> bits (9:0) with different scaling (x10 mA vs x250 mW), a type-mismatched
> sink operand is misinterpreted. This misreads the sink's capability and
> weakens the min() bound intended to cap the request to the sink's limit.
> 
> Require the source and sink PDO types to match before a pair is
> selected. 

IMO, you can finish the commit message here. The following bit feels a 
little repetitive.

This keeps the voltage-range matching introduced by commit
> 53fe0de9a35d ("usb: typec: tcpm: pdo matching optimization") and covers
> both the min() computation and the mismatch branch in
> tcpm_pd_build_request().
> 
> I found this by static analysis and have not observed it on hardware, so
> I am sending it as RFC.

Do not include the above ^ sentence in a commit message. It can go in 
the "under the cut" section. Also, you can document any tools used using 
the "Assisted-by:" tag.

> 
> Fixes: 53fe0de9a35d ("usb: typec: tcpm: pdo matching optimization")
> Signed-off-by: Seungjin Bae <eeodqql09@gmail.com>

Please CC stable when you send the actual patch (the non-RFC one).

> ---
>   drivers/usb/typec/tcpm/tcpm.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 2d6b14aa2085..4959872050ae 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -4514,8 +4514,9 @@ static int tcpm_pd_select_pdo(struct tcpm_port *port, int *sink_pdo,
>   				continue;
>   			}
>   
> -			if (max_src_mv <= max_snk_mv &&
> -				min_src_mv >= min_snk_mv) {
> +			if (pdo_type(port->source_caps[i]) == pdo_type(pdo) &&
nit: we could just use type instead of pdo_type(port->source_caps[i])?

 From a technical standpoint the USB PD 3.2 spec does not explicitly 
prohibit mix type matching. Say, if we match a fixed snk pdo with the 
source's variable type pdo (the rdo structure is the same). However, it 
could have potential issues (instability). For the rest of the PDO types 
the rdo structure is different so obviously you can't match them. It 
shouldn't impact our Pixel user. But I can't say about the others 
especially considering the patch you intended to fix introduced the type 
matching when types were mismatched:

https://lore.kernel.org/all/1521817127-23061-1-git-send-email-jun.li@nxp.com/

Thanks,
Amit

> +			    max_src_mv <= max_snk_mv &&
> +			    min_src_mv >= min_snk_mv) {
>   				/* Prefer higher voltages if available */
>   				if ((src_mw == max_mw && min_src_mv > max_mv) ||
>   							src_mw > max_mw) {


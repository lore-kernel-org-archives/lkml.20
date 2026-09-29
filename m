Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E160A4F0558
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790674027; cv=none; b=dPW++Uiumttf6ph2jtDRpu3jx1erLWcjPj2KxKupIe4aQ88kBa5aK1LaRY7vsbCtzgx12gOj4KvjIOmPgaz9FL1aKN4lLir9spsHjrEcz52gNB+iJDV4yhWuhBdQgozPVp4AE1GSkk6NTpiLvgv6Fvd4OCeurWNOJFRxiU8X3Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790674027; c=relaxed/simple;
	bh=fcXyvBXj7Sy0LffIiP8HJUW08OGSCuJRW/UUi7/DyfE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LET1YqWOeIXUmNWYo3qi2NNjpzTqgeYfK92J9JFYdfs1hzj+jRPFij9nbRy2rmzAt8nab1lXfS1Xp6B6Rln0DFyr3t7gIC9XNthWb4HgnwMuMm6T/8UpDJEwpHkWscqxJD8b24YAH4ZfAsXp7sM1tH+wuuNdfDoQI3p09jLfeco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EGvaV2Zz; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=DPOGSHcb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EGvaV2Zz";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="DPOGSHcb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790674019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sekRSkYgEhXbsBdIcUfoQ0jf7hqjPYSNiBc5T17KCjY=;
	b=EGvaV2ZzRI/OndavcLYpDBlajKS8C8K5Wx/1oqj97329cZi0rpb7lKSxnztIZR8NLB6Y7s
	8xWOwP0cMJ8FZP7OyJxqYbRqJDgQghSqWOmLYLsOtrD2brkNB5qsbqDF9aEcxmwp0LMbrG
	AL7OEQJZ4pL2XrnEOsze7S1KN2XgsOA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-434-8L-uDlcDOFy3e-573jzhSw-1; Tue, 29 Sep 2026 05:26:57 -0400
X-MC-Unique: 8L-uDlcDOFy3e-573jzhSw-1
X-Mimecast-MFC-AGG-ID: 8L-uDlcDOFy3e-573jzhSw_1790674017
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c2dbb6da00aso238625366b.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790674017; x=1791278817; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sekRSkYgEhXbsBdIcUfoQ0jf7hqjPYSNiBc5T17KCjY=;
        b=DPOGSHcb/Cx2xsTfN3rRl/XFXi/pUVEaKMJ0u1vulQRjLMLed5jQ/z7Sy8/QYR7Q9y
         benk0CvkDOJkfxbrd0/PRRPTpOxWh+QqJmmI0k2kXRU7Kh7HGNXntNlM2bUlMfa6FKST
         l5OV14xUFwta0WAFG7jY7GJokTSjPt+k6am30s+fFXLri80Q87GpIZP6/C5J/LEiAIrX
         JBSyMT74RjZOf6vhMVMVzF5GfOHdxsfe1XeKfe7lqy0T97TbvG/kHZ07gaOSOt+8cG7W
         LkZrBXQYIC4X804i8gjE12hKtJ0+Ps5PzKMLzxm8uyrITRKqiw7JyEkJGVYJRJtOJhIQ
         Kj8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790674017; x=1791278817;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sekRSkYgEhXbsBdIcUfoQ0jf7hqjPYSNiBc5T17KCjY=;
        b=CHck4LjSBOJt0JFIK2Ke+6jA3mXxLzbFGtpAvHCa1hfn8YCKiz0d1xd7or8GpxAhxI
         Gu/ygtK6RKLr2GK7Sir7P9dKWUF+5MFjM31IlfRPFq0ZlNkUGm7WLTSC9fEUIF+96Hx0
         0CqJ8gNGmp3ZKYZN7FQibO7DfgvLxW7PSJ6cmZW8iiwk0lfaQnQrvnghfI4nNpedlQQo
         bp0YD4hTGkEOaS4Eg4+5joZLKFcP40UUbL+HJ38lRAR+55+zJS8uRzFwBxdOVZsW6bNk
         cv8WpZRgnHdAp1jxjagUHdQCdEjEAFo0W+GJpXIypkqr5WElL4PDyrxHD3gOck/oYNmr
         rvjg==
X-Forwarded-Encrypted: i=1; AKwUvBw9WL7HB9Q65S6tqoj2fJ5GvbHxWkRSAQRBajf+y99pfvbjYBFwrkCDU+vegT1gfqeHyeDPLu0bpncyJKk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKv9S4h7WkYlb3aynhYcZbza7OzpSpxIM0aukn1Rz13319NGxwY
	vvXBeouowWvBNmBx8430xszFKhxitmA99ujmVnWeGaKE2Ci163pXO1jbBUikOWSwcGO4s4/uJFl
	CN0PMc17oaIHPVG9nvh6EhK8zj59kQ4ms0dpFLlDBUq0GoA/Lc2yvcu7UtPwYfk/+Bw==
X-Gm-Gg: AYBFou0J0nmjGwa39wsGBtZUOes3E/+cES4uFtpjUf/rKnJC+RS64FyYjbwKD4vAu9/
	wrzCgon/DsHg+5YExZnm9GpmJlWigeXg+LD68yYkqK/auIzKw2kwEwAq2AWNxoAhu0zQfO2d4eB
	4QsZK5hZycSun2jTnKs+qrCBbhKV+DRlV8R4zRzCptGs8ozDGxTAzOOHytROVR0AkXVLL0dRHzC
	igxmvmoI+gQykU2Kng2EX6CFrM+aDKZSgOtNR+BSyKtb6hmwNyyJqHuie4s2a4rt+QzqxA84jcT
	N4AE2YS0dus1fiCAabBv5YRr8AbChxo01XEYkQi8FJNozXIlakbWvpz6GZczbAbfPJQGFL+7Dyz
	wiZU0cIJUIvxKhoyJ4OSbPq5GIRyvh0hhFSIoidAapDNCOuffZdhEuz20cojeTaXaMpXVvNGCOA
	==
X-Received: by 2002:a17:906:730d:b0:c21:9b4b:2690 with SMTP id a640c23a62f3a-c2ac23bf51fmr1255283566b.17.1790674016552;
        Tue, 29 Sep 2026 02:26:56 -0700 (PDT)
X-Received: by 2002:a17:906:730d:b0:c21:9b4b:2690 with SMTP id a640c23a62f3a-c2ac23bf51fmr1255281466b.17.1790674016087;
        Tue, 29 Sep 2026 02:26:56 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae678bbb0sm601169966b.5.2026.09.29.02.26.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 02:26:55 -0700 (PDT)
Message-ID: <286547c9-9f4a-4202-a615-b51d42850951@redhat.com>
Date: Tue, 29 Sep 2026 11:26:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v8 06/12] gve: simplify reset logic
To: netdev-bot+sashiko@kernel.org, hramamurthy@google.com
Cc: netdev@vger.kernel.org, joshwash@google.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, ast@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
 sdf@fomichev.me, jordanrhee@google.com, willemb@google.com,
 nktgrg@google.com, maolson@google.com, thostet@google.com,
 jacob.e.keller@intel.com, debarghyak@google.com, kees@kernel.org,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 przemyslaw.kitszel@intel.com
References: <20260924185316.2831077-7-hramamurthy@google.com>
 <179036256202.2160803.12978678207911420221@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <179036256202.2160803.12978678207911420221@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/25/26 20:56, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 7 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 2 (1) · Medium: 2 (2) · Low: 3 (1)
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [High] After a failed recovery, an unprivileged user can crash the
>    kernel with an ethtool query.
> - [High] When gve_recover() fails during a reset while the interface is
>    up (service-task reset, ethtool reset, flow-rule timeout, or…
> - [Medium] gve_teardown_control_plane_resources() (gve_main.c) now calls
>    gve_teardown_clock().
> - [Medium] The commit message does not mention several user-visible
>    changes to error handling, and one of its design statements is not…
> - [Low] This patch removed gve_queues_mem_remove() from
>    gve_queues_start()'s error path.
> - [Low] The commit fixes a real unbounded recursive reset but has no
>    Fixes: tag.
> - [Low] Item 2 of the commit message describes the old bug this way:
>    gve_close() during gve_shutdown triggers a hardware reset and then…
Low prio remarks could be ignored and we prefer no fixes tag in net-next
patches, but the first 3 ones in the list look relevant and should be
addressed.

Also please note you are supposed to address clashiko comments proactively.

/P


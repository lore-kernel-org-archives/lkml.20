Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953D348A8CD
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789469301; cv=none; b=kvrPJsRfeKusARWilD+SJ1v4N4bie2M6sDkJnUu6w+PsbWyIHQTdloyXCHMxUBmXwO61ydkrAl+lOxRbXN+QSyL6+tOSuRmSV0LavCoLObRGg9NGK2yvhDa824EM0MYIZl+8NlFSAlHfq/AgCM3F1oeuf3eYU6dAysZNiZ5i3AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789469301; c=relaxed/simple;
	bh=UdtxaFnD52HciRcS2H/ig0BAxwdmCizHyOkxtsEITws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UF2pVdpYKwGfV63j6waEwTSvlXPqJypkkEbErpMujqt2kiCWma13pO1h7FzLpNKSnkA/og/+k4bAkKc1pOxr4oTXygX4GoY5YVn4G/7fp4ETareK6rdARjqwQo8jS0vFjzql0n/oNWKLToUp0QCXJGbv2BU+9DnVfpCsWWyvFqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Z2pJVcHp; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Z2pJVcHp"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4838dbf1bbeso349014f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789469298; x=1790074098; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X1w5/HOuWkCLdce6a0BIC/AOiRe21BXgNY0jE7DdjdA=;
        b=Z2pJVcHpe1ufbl9rZdUPrtwW/x+ciolel3gprvxc0Xsv6Dj6tPfXZ8s9trwbcu+AD9
         7pti2empZTw0OkrLy+9K2LrZ6nniCGMEubPDtrQE3UeF/sR8xa7vs+3XUzexuyLruI9f
         ZkWoK+QjAu92p6aHr4A6YvC+4N3PTMyB70wmgPnzLs1efMExLNmyBw2qiBsKFV46sFK7
         XeD2roAu0j4cFxf6jcsyDvcGNgR92hSMLvirbDYIg/fk55KbCfcEdg+irBpxYiT1EYzB
         xJ/9wAYU7j43ZRgA0m4A1XLnr1aUU4uoqQYFcbtDO//D/azbidSQEwo+V7pI2Qh8pFnL
         lqiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789469298; x=1790074098;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X1w5/HOuWkCLdce6a0BIC/AOiRe21BXgNY0jE7DdjdA=;
        b=dSrX3HXR2ibPWT/a2Wbi/7l83PTfktZZVDXA6cuu4d3FfJj+tQ3JwMXYJM7WQeIf5P
         rurKKO5Uj+cVNwSc8XZZxatyPqJNx1fb259LeV86yfCdJ5vMt5Ilyx5bJuXVPYqXFdY6
         bRjPMi2ESNTRp2SYdxnP85VLOwo/ahzHWU4AYXnsCKIgC7LuDP2xMcyt8xUP7V9V8+Og
         0KknEXTEQL4OggomuKCxCZERlyg9ek0VoGtjCaP1Q7mm9NhyEhEQPNaTw7XoE8+hVLKx
         ZfcyEaGJjMfbl/oYAqw96KE1ujGNqPvliUo9mL5Ee6gA0vPKD/uDN3HXl5kQ3HojLc5t
         6qrw==
X-Forwarded-Encrypted: i=1; AKwUvBwpIl/dvQczSozv+XAsV/egMOACuSYVxdy9pjJqVVZUZvjNdoQXw6ibgGgHZZutLHcLR4OOyHywTeWk2cc=@vger.kernel.org
X-Gm-Message-State: AFuF++lqRjM0QiRsG2hGj2Ab2mZvmkgP9vWptDf0bSk+5xjJbwGSFXO3
	eVFG/NySOVu/WRwEL+4AnhOiLFhRmtW2KLz14kY1IjacISgCHfm7lGY/EE4vL11d/2U=
X-Gm-Gg: AYBFou2j2/ConihSE7mjHOt6V3qhGUM1mpf+EgNYhGgkYl0hUv1zfeIihCP5cXwSCKM
	Ugb8xsrmkY4yxQ7T4kmt0+LbvpNGE9MiKX4MxlA2yXVGtSnDyVcxu2/3uVyG0MlesBiY+Tqohok
	QbS6RbL2q8ekJMu0B2H/S4p/wFG2UFU/IgUuMxGXV/GeQ0FI+Yu+kk96wqkGeWVmSMHiySMr9eb
	uD0vUg2B8wzZsFG7BDCwKc5EMYE6DEC4LdFmwRp0o23//a5aVPjxApvB8Kis5As05n0IXA7yJAm
	tTeGwNKa9lDct4/+g773ra+rOUSUKMy/ZlOfH7UFabBoyfk4ne2TD4YSGJwUwMPnLdRsHUGIBZ6
	3O4PNOMmmIkSwrP9sTpze70eItPOTV68eY7NlqEDz+RB8Emq4NemMwveAVsgEDL4Z6L0Zw5AqAR
	WPiwLAG8WlXTGlcVs0qSNOdLUwJvoIuQtX5+sDa7jVxWwPc1alL/BRBhMfXorv8LYC
X-Received: by 2002:a5d:5d0a:0:b0:487:a9f:4fa2 with SMTP id ffacd0b85a97d-4870a9f501amr199821f8f.1.1789469297815;
        Tue, 15 Sep 2026 03:48:17 -0700 (PDT)
Received: from ?IPV6:2001:1a48:8:903::e14? ([2001:1a48:8:903::e14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb350686sm37347297f8f.27.2026.09.15.03.48.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 03:48:17 -0700 (PDT)
Message-ID: <c99d9feb-0a19-4f8d-915b-c2ece401e3fa@suse.com>
Date: Tue, 15 Sep 2026 12:48:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: qrtr: resend HELLO on MHI resume
Content-Language: en-US
To: Manivannan Sadhasivam <mani@kernel.org>,
 Daniel J Blueman <daniel@quora.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Thorsten Leemhuis <regressions@leemhuis.info>, Takashi Iwai <tiwai@suse.de>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Chris Lew <christopher.lew@oss.qualcomm.com>,
 Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>,
 Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260909055846.16539-1-daniel@quora.org>
 <hcr4woicsnz3pbhzlguuwjlego7yli3znhjmsx4cdz66xa74zd@wjtle2yslc4b>
From: Vlastimil Babka <vbabka@suse.com>
Autocrypt: addr=vbabka@suse.com; keydata=
 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
 pYekxJujNeEDkUlky0Y=
In-Reply-To: <hcr4woicsnz3pbhzlguuwjlego7yli3znhjmsx4cdz66xa74zd@wjtle2yslc4b>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/11/26 12:44, Manivannan Sadhasivam wrote:
> On Wed, Sep 09, 2026 at 01:58:44PM +0800, Daniel J Blueman wrote:
>> Since the MHI HELLO exchange was relocated, it is sent only at device
>> registration. During a suspend-resume cycle, the firmware in WiFi
>> cards such as WCN7850 indefinitely waits for another HELLO,
>> triggering:
>> 
>>   ath12k_wifi7_pci 0004:01:00.0: timeout while waiting for restart complete
>>   ath12k_wifi7_pci 0004:01:00.0: failed to resume core: -110
>> 
>> Fix this by triggering the handshake from resume_early in the MHI
>> transport.
>> 
>> Validated on Qualcomm X1E-801800 on Lenovo Slim 7x across 10
>> suspend-resume cycles.
>> 
>> Fixes: 544d85de4dc2 ("net: qrtr: Send HELLO message on endpoint register")
>> Signed-off-by: Daniel J Blueman <daniel@quora.org>
>> ---
>>  net/qrtr/af_qrtr.c | 13 +++++++++++++
>>  net/qrtr/mhi.c     | 10 +++++++++-
>>  net/qrtr/qrtr.h    |  2 ++
>>  3 files changed, 24 insertions(+), 1 deletion(-)
>> 
>> diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
>> index 78347c937af7..2ffcfc2fdb4a 100644
>> --- a/net/qrtr/af_qrtr.c
>> +++ b/net/qrtr/af_qrtr.c
>> @@ -623,6 +623,19 @@ static void qrtr_hello_work(struct work_struct *work)
>>  	qrtr_port_put(ctrl);
>>  }
>>  
>> +/* Trigger the HELLO handshake after the remote has been reset, eg on resume */
> 
> Use proper kernel-doc please.

Please prioritize merging this sooner than later (it's a regression from
7.3-rc2 that would hit people if it made it to 7.3 final) even if it means
fixing up non-critical aspects later, or by maintainer upon merging.

Thanks,
Vlastimil

> Rest LGTM, thanks!
> 
> - Mani
> 


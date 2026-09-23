Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D0F4746AA
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790152926; cv=none; b=uatNmrMhkB/F2wo/uTAbuMrMph/rqVYbGRUtffEVGGdmzW+Q36x43VgkAuftHEb9Cgn6ZmE6qjL1PuaXJLv9K0b49gw4jiriglRa76s+r44nV9PaMAseCmqDVjCWdpAVBnTuPNmdLsqNcvGVwafMRt9EukMk23z2oN2/52ufqH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790152926; c=relaxed/simple;
	bh=v6gcfZoGlpMVkHmqmxd/ej0FUVKlIMzzY+l7HT86Y2Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fk3sHap1iwohzUwTsSvT+FR7IhS1doVjIwuWQ80ZMVeBr0NcQmkOMu6AzGTmsbJQoaL0xpRSuwWXDAkPDofGYumuTI5L+0sd9TIituAWOKqc5WkC017IbPin5Jq4ns3EB1lLlANsVMPP8q1EmX4nGfisX6/NsakKIYm+ZF6DYGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YuQqLqZC; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YuQqLqZC"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6356256so237215f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790152914; x=1790757714; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tdCfwiAOTK6xfOE8r9cj3bnlP6s510wMptWKPzoCkJk=;
        b=YuQqLqZCNXeTvjkKyON30ABZvqg0W1xCLjpRNOm2FNfI+D1b/UyGZKX8zwB1QOSOvq
         K2m/OjaGXNLx2665J0TuwW3i/NLG+XFSWSO3syA4VK0AfdMd31RTMswBL0/Vf7UPyR2m
         DMFV4tnzZlyfvu9hfCM65AdfxkSJscPKHQSZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790152914; x=1790757714;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tdCfwiAOTK6xfOE8r9cj3bnlP6s510wMptWKPzoCkJk=;
        b=rSyRwfuPJ30W8xXNza7PNwfJx0DgmlZy/gXwzstBmKS2PSOe5Aa9jzMe3uz05wvHVx
         NhM9BF+xcWQXe1aETjwS3lBk+e5wd5VfMn3Bpt5kPg7aAcN9r3SQChPx+hbJHVYs7/mg
         Go5boBCvzgnldJvSd3XXmvrZ0PsH6j2te/+dGdGRZN63+fv7TmhaZXGv17puUuprRrf0
         kK2drPVI22sVPWidPjcyvVeZMlEwAEXXdldz4fNg3fL4NANf4ckvpTn2oZtMIjDZXe8Y
         8kKToLBM3E5JPEiuOYzBTg6s1MbXvSEbRrQLvJCpNTz61IPZ/eigANMARkrw0N957EKH
         kRjA==
X-Forwarded-Encrypted: i=1; AKwUvBwnKhqnJRBxLR73aRSCNaFyMFiOOQLdVzgjuAsMGnNA4dESMXY7DlqrftKfJG33rTBPNI3ZKqBkM1pvXRU=@vger.kernel.org
X-Gm-Message-State: AFuF++lSJwR/+sQB0rvpTZwlT4ETlHnGK3iovDir/zJQniZ1wT0FA60A
	MCIprJttIxxH1XMaGaLLyP23LrOCk9py0t3LlOTBV45gon+wQFCWS0mwn/l6U3cCLVs=
X-Gm-Gg: AYBFou25yPtI6nq3TX00CBmkQkj6YcXT8hNda2vkXwfoAOrPdD6xAp/nGbrrI6jatle
	CkLWqeowI5Qh3ouG4hCbs6nSTqa5udqCIgfb03V43WR23yYTSis1/qCPn6UlOFFoNKDNhEX/JAt
	pvAr9jijfni+sEsxdL5IC7VTcvDkfvDPfRUXDaOkzK0qCt5kcU0++jZzCXE/oY/WondLKSt5iO6
	gSaSMsz1DHfrEH1R3bQ5Qr8Pk6Yd/efhAGBurd8FbEJO4XYXpjXScMSNEXZfnlQP5OLxPAWhrlh
	24UjAgooEumUOKaoyXvlVs/NB3azA8OY1xD8OguiE6ZOxGHxEt26nFbTng1VrCANOMtvTxlLhXB
	CNgq64++di5ypIB7x9bs6yBPV6NRXRUQF7cxYGXeq2zIc2M38htho9o/ZOkBr5x51Phtl1dxmPx
	HHgsL8Tbx7WM4yak/q2320GvimLayUYwCMzQOhkypWMMyIS2/PLLLddShnI94iXJMhenZEfkIka
	x2g43eA2J7pY7X0
X-Received: by 2002:a5d:6f08:0:b0:484:3311:257a with SMTP id ffacd0b85a97d-4886717a655mr3555659f8f.14.1790152914532;
        Wed, 23 Sep 2026 01:41:54 -0700 (PDT)
Received: from [10.214.128.75] ([149.7.5.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488682673bdsm5272749f8f.2.2026.09.23.01.41.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 01:41:53 -0700 (PDT)
Message-ID: <77e123e2-f967-4a1b-ab98-fa83257c63b0@linuxfoundation.org>
Date: Wed, 23 Sep 2026 02:41:33 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] usbip: make remote list honor parsable output
To: Jason Colapietro <jasoncola1@gmail.com>, shuah@kernel.org,
 valentina.manea.m@gmail.com
Cc: greg@kroah.com, i@zenithal.me, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <178743110815.11397.14988078342421111980@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <178743110815.11397.14988078342421111980@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/22/26 14:38, Jason Colapietro wrote:
> The -p option is accepted in every list mode and `usbip help list`
> documents it as "Parsable list format", but it only ever reached the
> local (-l) and gadget (-d) paths. list_exported_devices() never took
> the flag, so -r ignores it and always prints the human-readable report.
> 
> Both commands below pass -p, and only the local one honors it:
> 
>    $ usbip list -p -l
>    busid=1-2#usbid=1a86:55d4#
>    busid=2-1#usbid=0627:0001#
> 
>    $ usbip list -p -r localhost
>    Exportable USB devices
>    ======================
>     - localhost
>            2-3: ATECH FLASH TECHNOLOGY : Kingston SNA-DC/U (11b0:6298)
>               : /sys/devices/pci0000:00/0000:00:1d.7/usb2/2-3
>               : (Defined at Interface level) (00/00/00)
> 
> `usbip list -r <host>` and `usbip list -p -r <host>` produce
> byte-identical output, so a script has to scrape the decorated report
> instead: the column padding, the " - <host>" banner, the blank line
> between devices and the per-interface lines. That is what the reporter
> hit in bugzilla 219502.
> 
> Use one file-scope flag for the list command and honor it in the remote
> listing path. Emit the same busid and usbid record used for local
> devices while continuing to consume every interface record from the
> server. After the change -r produces the record shape -l already does:
> 
>    $ usbip list -p -r 127.0.0.1
>    busid=1-1#usbid=0781:5583#
>    busid=1-2#usbid=046d:c52b#
> 
> so the obvious loop works against a remote host:
> 
>    for b in $(usbip list -p -r "$host" | sed 's/^busid=//; s/#.*//'); do
>            usbip attach -r "$host" -b "$b"
>    done
> 
> Without -p the remote output is unchanged.
> 
> Fixes: e9837bbb3e69 ("staging: usbip: userspace tools v1.0.0")
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=219502
> Assisted-by: LLM
> Signed-off-by: Jason Colapietro <jasoncola1@gmail.com>
> ---
> v5 -> v6:
> - Fold a condensed before/after into the commit message, as Shuah asked
>    for on v2. No code changes; the diff is identical to v5.
> - Restore the Assisted-by tag, in the format required by
>    Documentation/process/coding-assistants.rst. v2 carried it as
>    "Assisted-by: Codex:gpt-5", which predates that document.
> 
> Tooling disclosure, per Documentation/process/generated-content.rst: an
> AI coding assistant was used for the original code change, and in this
> revision to rewrite the commit message so it carries the before/after
> requested on v2. The code is byte-identical to v5. checkpatch.pl
> --strict reports no errors, and the patch applies cleanly with git am
> onto mainline.
> 
> v4 -> v5:
> - Drop Cc: stable@vger.kernel.org. This changes the user-visible output
>    of "usbip list -r -p", so it is not a stable backport candidate.
> 
> v3 -> v4:
> - Make parsable file-scope instead of passing it through list helpers.
> - Drop the option-ordering change to preserve existing behavior.
> 
> Two behaviours I checked beyond the output quoted above:
> 
> - The connection stays in sync. Interface records are still read from
>    the socket in parsable mode, only the printf is suppressed. To confirm
>    that rather than assert it, I had the test server withhold the final
>    4-byte usbip_usb_interface record for 3 seconds: the patched client
>    with -p blocks for the full 3 seconds, so it really is draining every
>    record.
> 
> - With no exported devices, -p prints nothing on stdout ("no exportable
>    devices found on <host>" still goes to stderr), so stdout stays clean.
> 
> Testing disclosure: my checkout is on macOS, so I have not run a native
> USB/IP stack end to end. The output above comes from building the real
> usbip_list.c, usbip_network.c, usbip_common.c and names.c against a stub
> libudev -- the remote path never calls udev, and the stubs abort if
> reached -- and pointing that binary at a small mock usbipd answering
> OP_REQ_DEVLIST with a real OP_REP_DEVLIST payload. The -p -l side is a
> second build with a fake udev backend presenting the same devices. So it
> is the real listing path over a real socket, but not usbip-host or
> usbip-vudc on hardware. I am happy to redo the runs on a Linux box, or
> to wait for someone with a usbip setup to confirm, before this goes in.
> 

Sorry. It is important to test end to end on a Linux machine to verify
patches. I can't accept patches that aren't tested on macOS - it just
doesn't make sense to do so.

thanks,
-- Shuah


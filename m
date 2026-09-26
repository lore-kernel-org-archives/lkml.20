Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88A6372EE2
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 19:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790452649; cv=none; b=ZU9yCUkSWO38ppJXdluZk+KGf/6FHxvFDv/l50PamoEDu/WtwXzSlKXhPU1hJmm6rPXJiBXoMV2tp4gz2io4jbEtjnWP1U/dEkEz5qByypbbGff2a62TPhJ4OCnbFTAXteSR1HyAYZwVT0AZOH+PNaG9+DF5PodmKaQPtiytPzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790452649; c=relaxed/simple;
	bh=qWq++QraPZZgfewzC7tf2JHtRehzSir1xvdICagfjjM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=et/ZKUfjLehQjWpuTsnxG+T3EsG69Gcaqneh3nL4PGkJFCp13jquXJDtfExR0hvgXXvizLjSLNuOx4uW+IsbdThG/BI2WaaKCbQWBqnh7dIgqxOESt9WkA617luqBIZJVOrr3E1Z6adsHiUliq6rDdQxi5+r2CndK5IH1l5o36A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=RATiE6m3; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RATiE6m3"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49fff72474fso1696435e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 12:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790452645; x=1791057445; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UvlokUDDlkO4+4AUk5rq3f1vyywZ8aScoT8XENLNdjw=;
        b=RATiE6m3NJ/EN5WtoynkuZZ+lstuFnbNTTA0fQkfp6MTize5jKHdCElW1LOVeHTIet
         XiRp3RPCmSNChLgzAVJugHgZuELIBDKPMssGOktfBoozro5wh3RB7arDYFzMLeEYI7I4
         ZLkCyUVq7m1ON3GANc9a0IP2wOhZ4E5a4LuYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790452645; x=1791057445;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UvlokUDDlkO4+4AUk5rq3f1vyywZ8aScoT8XENLNdjw=;
        b=2FrFBbIhPcjU57YXf0QfJica45J7KurPAwREJjnaUqKayp2egg1RMqXsbQVX4O1HQO
         Nz28y2wZhYnFH5Xgd1REJwgcqrIgQ7JODvIaO1SCQ+RrAm0yl5LkYGiwk9hsrWq+ZxRz
         Ib7vddrdPuHPlzSEICTIBoMgKytIVm4cGCPKxA8F6A+gWtdW61FIv2fmO0LEcUSsKjA7
         pX7W4HluYZM8yuycBpwTfpOc+VxGTu01QB45KuWpyzYx0zfKUZWKSS+xsakOi4DtoIJ5
         /0+2V8a7aap+9Ag4BBb3T9hRWDWbR79pLberKEyUHzymD/fCFVwZVZNOHufWwF+WWGbU
         bkTg==
X-Forwarded-Encrypted: i=1; AKwUvBzV4bjS2Xtb76XnERgmKTLwUpFsfkQ/OUdvxuuSIuhdjzNbh5ZVkRT10zI5u/9HQUC0uvcA0U4wcyXBf1c=@vger.kernel.org
X-Gm-Message-State: AFuF++lMXQK3nGiv+GCoJI8vzTOW8CVDwpJgF0nGVGmvv6Q7VvWMzfz8
	kDdlD7l0d4gKISaGjKVv/9JQ/iJCU9QJMuMHUVQMRb49VWYcGL5Sw1qZAk6UJhkuGSM=
X-Gm-Gg: AYBFou2niaGZkwTPUo0nT/DsJ9rIMEkvo1bv1Ja9QAwIpMsc2H6C6Po/Hx+cjrzAVus
	5BpjtYHup346DtYOD3pgcUTqydSdKKgKkqxoPQj44drUPxk2fG1b2/K0ntm9mlwq8tnm6ArVtgg
	vhz7K/En2+qBsuPQIHBjYBZgeGouDHYcBS2kI+oEcDNcHWUaRmRNwz7XcXN0F0L9WktaUUWo1Gb
	nho4qQHRVFNQCpVbHgNyle1qMpj78MQw933+g+k2/GueK1uVXrthW3mnPkYhrk7sF9NHXHi4qTk
	L22C9WJNxGoEdAYpJYuCHHl+IsRUtlmEZP2QGEtBTjIArRvgOBq9CXvY8J4T7SKbY3NcgWHuS8f
	/RASRQH18SmszqoCzaWUiVXjk3AOyjTB7Bqo1jz3lG6nZj3l8uGxgpbNkUCILKcvu/JeGbdSwEt
	9R04C9OcR/cSuv6NzN1P2ACl5DL6Mn460wZUqFtSai8/Rx84rw7GnfsHp5t9+xSo5lvOMMIez1c
	DP2rLN5A4BozeVsuIqFFhpiXPRpyiiPDnnny0dCAd8y55h9NaDEzNgRhzKzI9F1ECup
X-Received: by 2002:a05:600c:4e14:b0:49f:ce78:3563 with SMTP id 5b1f17b1804b1-49fe66f1a7bmr146614685e9.20.1790452645039;
        Sat, 26 Sep 2026 12:57:25 -0700 (PDT)
Received: from [10.188.205.27] (cust-west-par-46-193-1-237.cust.wifirst.net. [46.193.1.237])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fffa334e6sm55147175e9.10.2026.09.26.12.57.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2026 12:57:22 -0700 (PDT)
Message-ID: <6a97a599-db32-4fbc-90ca-e052cc23d317@linuxfoundation.org>
Date: Sat, 26 Sep 2026 13:57:19 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usbip: flush the event handler in usbip_stop_eh() to fix
 use-after-free
To: =?UTF-8?Q?Jo=C3=A3o_Moreira_Fernandes?= <joao.fernandes@ist.utl.pt>,
 Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan
 <shuah@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hongren Zheng <i@zenithal.me>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20260715133855.2312018-1-joao.fernandes@ist.utl.pt>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260715133855.2312018-1-joao.fernandes@ist.utl.pt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/15/26 07:38, João Moreira Fernandes wrote:
> usbip_stop_eh() is used by the stub, vhci and vudc sides to wait for the
> event handler to finish with a usbip_device before the caller tears it
> down.  It waits only on the event bitmask:
> 
> 	wait_event_interruptible(ud->eh_waitq, !(ud->event & ~USBIP_EH_BYE));
> 
> but event_handler() clears those bits with unset_event() *before* its
> final dereferences of ud:
> 
> 	if (ud->event & USBIP_EH_SHUTDOWN) {
> 		ud->eh_ops.shutdown(ud);
> 		unset_event(ud, USBIP_EH_SHUTDOWN);   /* wait may now return */
> 	}
> 	...
> 	mutex_unlock(&ud->sysfs_lock);            /* still touches ud */
> 	wake_up(&ud->eh_waitq);                   /* still touches ud */
> 
> Once the last non-BYE bit is cleared the waiter can wake and the caller
> proceeds to free ud.  For the stub side, stub_disconnect() ->
> shutdown_busid() calls usbip_stop_eh() and then stub_device_free() frees
> the stub_device that embeds ud, while event_handler() is still executing
> mutex_unlock(&ud->sysfs_lock) and wake_up(&ud->eh_waitq), and may still
> mutex_lock(&ud->sysfs_lock) on a second queued event for the same ud.
> The result is a use-after-free in the usbip_event workqueue.
> 
> It is readily triggered by a reverse/exported-device teardown that
> unbinds usbip-host while the importer is still attached: the socket EOF
> queues SDEV_EVENT_ERROR_TCP (SHUTDOWN|RESET) from the stub_rx thread at
> the same moment stub_disconnect() queues SDEV_EVENT_REMOVED
> (SHUTDOWN|BYE), so the handler re-runs shutdown/reset on ud in the exact
> window where it is being freed.
> 
> Reproduced under KASAN on v6.12.95 (usbip built as vhci_hcd importer and
> usbip-host exporter on two separate VMs).  The freed object is the
> stub_device, freed by the unbind write and then read by the event
> workqueue:
> 
>    BUG: KASAN: slab-use-after-free in event_handler+0x2ba/0x3a0
>    Read of size 8 at addr ffff888005cc6058 by task kworker/u8:5/63
>    Workqueue: usbip_event event_handler
>    Call Trace:
>     event_handler+0x2ba/0x3a0
>     process_one_work+0x5c2/0xfd0
>     worker_thread+0x49d/0xb00
>     kthread+0x246/0x300
> 
>    Allocated by task 1657:
>     stub_probe+0xf0/0xb00
>     usb_probe_device+0xaa/0x2e0
>     bind_store+0xce/0x140
>     vfs_write+0x87c/0xd70
> 
>    Freed by task 1660:
>     kfree+0x1a4/0x3a0
>     stub_disconnect+0x21e/0x340
>     usb_unbind_device+0x6b/0x170
>     device_release_driver_internal+0x384/0x550
>     unbind_store+0xdb/0xf0
>     vfs_write+0x87c/0xd70
> 
> The same run produced 37 KASAN splats against the one freed object,
> reached through every place the handler still touches ud after clearing
> the event bits: mutex_lock() on ud->sysfs_lock, the eh_waitq wake
> (__wake_up_common / finish_wait / prepare_to_wait_event), and
> stub_shutdown_connection() called from event_handler().
> 
> Waiting on the event bits cannot close the window, because the handler's
> last accesses to ud are inherently after the bit is cleared.  Instead,
> flush the event work in usbip_stop_eh() so the handler has fully returned
> before the caller is allowed to free ud.  Every *_EVENT_REMOVED sets
> USBIP_EH_BYE, after which usbip_event_add() no longer queues new work for
> that ud, so flush_work() only has to wait out the in-flight run.  Guard
> the flush with usbip_in_eh() so it is skipped in the (stub reset) path
> that runs from the handler itself, and move the usbip_work declaration
> above usbip_stop_eh() so it is in scope.  None of the three usbip_stop_eh()
> callers hold ud->sysfs_lock, so flushing the worker (which takes it)
> cannot deadlock.
> 
> With the patch applied, the same KASAN reproducer runs the teardown
> suite repeatedly with zero KASAN reports.

Hmm. Did you test this change with usbip host and client? What kind of
testing was done on this change?

thanks,
-- Shuah

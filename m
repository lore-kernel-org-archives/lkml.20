Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793736646;
	b=eaMkiaCtSPDat7LE7xDNMltLFDuL/DgUxUOcJgXZScFPb8VAOAyG65OllzSaOW2Y28cM
	 XxavL/2mgHo1x3xZiuI3oPfHzt4eTucteUIybziGtTmNHhPFunxd1QKoIO1FtqxQsNmca
	 9/5t3wqjWpBfFoLphhn3ixFEFM6FY3tsARfxAJL3oAn2GNAzFnCn/j5adGGKw05Nrc0zj
	 cv+8LQ3NetPgHVD6wsWAZH24SelqO7RpO4ndl6T0VKQAGNzxbQbjrLJrw1SO+7UXKJwrC
	 1LFPHLrBk+61PgiAtYk08gtErnNNbT9kXGeJEWBTLiXubfh6zGtNGtiWGfSX8y+7J0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736646;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=G+e0C+OO2ssPNCY+CMpKUyz+R3cTGFEfmTPvkxrQ+aU=;
	b=f5aQuiJ9XRcVR1ZlvCPQ89ULFVkZhNZOKpBGxoYunpGRS/84CXoy13Zva7Y/G4XSdPGP
	 6Yp6MaAvGiDpzWCmdoerD2L759UZ1BgyrfUIwoysrsuyn2Saj08W6qHNhp5FEV6xiXBlj
	 h+TnSWE89RSZaVrMWCoX57e7TXIRSBUnaGW1hGzeizYIsQoY1i8VE22U/jBtig87yEQAl
	 vP5dqZkEXIw46V7NUR6qQ8KxbPpi1oluJs7DMxYjB5fCZPiX8+YCR4gbkyRjpqsZpFFwy
	 ix+9WP36AxlZ+Z59on4DRpeNOMKZ1ozoWGvrHLG0DuWArBiQ+tGbyp5ArJxyA7axfbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aiuJxGNq;
	arc=none smtp.remote-ip=74.125.229.6
Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97289606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:10:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97289606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aiuJxGNq
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-33e48934fa8so1399047eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 12:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793736645; x=1794341445; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G+e0C+OO2ssPNCY+CMpKUyz+R3cTGFEfmTPvkxrQ+aU=;
        b=aiuJxGNqM2NOSyqLYh6xbIBKOf21JDB4WHU1FyrgtQBJZArufAJ0HrqHViyCi6VD38
         vRVHbkUKCTR4vl8vruhaj+5eMiuN+U8fqOOCro9zpjEpBRYYf9lLfxnGQ0LZFl5JH6IN
         8Ugtk70zgdRxYJIwwY2K3f+TweezPzv3QsuPwBe7ZYHU5cSmedf1L/S/1vKgctgmq2Wk
         fLaPC4K0kgS2dYkqhL5k3FDjBUvaMeb0sk4FG8b2w+z877/RtUSt6NewD9lzrSQS4USx
         Yn1EIzEbSO+F1BZtFUXZYpuPjkz8FoGmoAo9k+LE1kdlS1yFXNg06wMs0Papz7oZdk4P
         //ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793736645; x=1794341445;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G+e0C+OO2ssPNCY+CMpKUyz+R3cTGFEfmTPvkxrQ+aU=;
        b=NJNTYYCvxizHOp9dr4+U3B6f5uUW9riID/CLmoiwGGDXCOnyA4Ut/Vsyz4v5bxkXAZ
         drsxmBm4xXi2I2vIh9frQSn0Dl7SuIKvE9bDfdv4fE8qcEAjpeUvoJbx/9XTYs/ehAxA
         Y996vXkNW5/fX79zAANw6NYLKRDXy95rquj/o7sEKEUXEuMcrnjIE8PtpU/jL1RYcY7D
         UObe1ClT5SUZU3VZRuQ250AhwUS5v5Mg4vSXSoufymV7p0cHBwjtLexlCsj1OcBXGFT2
         6YKhCP760EUZw6V7kIrP2ByVLPWzNABS2ASBvRXy4gMY437RwkihFp4Iw3uMzame6xD6
         recw==
X-Forwarded-Encrypted: i=1; AKwUvByYoolekaN6dCYIwwEl/OAw1FBnnSN2oOEC7KCrUiYAKHlq1kP7yClGq6vu/LZ38XgHKHPbnZcQqoievag=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LLT+jAmgWagfyGwCL04evinnwwnnkUHGYbfeHK4t66gySfxk+
	AUMe4ztItKq4zwIpVjpzQmuwFT6kMhIeEw0PUn0Gyh2Tk1WRaIUttthG
X-Gm-Gg: AYBFou1aot3ZBGtzh0BG5K9+BzQ4ej3NkN+ZS10r29MfqA0Ohn5XWa69WuhDZ1wWqlS
	Wo12X3BsCPy4SZpJAXvjD6PuJhT1/OpjFZRhTQaKV9aDGkoICZZH+UcR5M2LuF32912mWdUabEV
	J16ojYaoktBhS2LUGLrk7wDAxeqmX1yjU8Bm4/IrBVQbu9HTvbZgojw8iejldbd9KDRIGgmXSbA
	d64In8mvfLnYmCYGLUIpO5jKNahtZuRTm7subDdct/QPzn0MHtJhVrtlfzdNBhtm6NEu3Bt4owZ
	IQDrRd4kIJPwVDfXSk3iPYIkf5+Y28qJbFT2kEu070o6OpnYpYCXQMNCOtyLjZWSyK64pJOck1e
	FVBA+tqDjNgb/Y4beKcowJqxcRMXCN5aWCjCSfejwIfrnW0ybJcEOoS67JcYaV/9r4mU8AlhD4L
	EiXbEOmVc9vbvF5y1EZGv2DRL4X3xKGpTiMJNSSkp0o75HY2VRVliwLowF29i+YP10qdhwntFjE
	MTQeDuQDTNir132YHLBccj9/ob7+amnsQFzGXHeUyiyjJQMZ6AateL0awg1VBl/KHYwA5yCZUxz
	0rhLAtVLZPnpC854TMnfsYRS4alkFQMIJL9sBTe3Nx0=
X-Received: by 2002:a05:693c:2512:b0:369:fa7c:aee9 with SMTP id 5a478bee46e88-36a423f54a1mr20127351eec.19.1793736644552;
        Tue, 03 Nov 2026 12:10:44 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:41::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a54ccsm481879eec.4.2026.11.03.12.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:10:44 -0800 (PST)
Date: Tue, 3 Nov 2026 12:10:39 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Bryan Cochrane <bcochrane@google.com>
Cc: Michael Chan <michael.chan@broadcom.com>, 
	Pavan Chebbi <pavan.chebbi@broadcom.com>, netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Joe Damato <joe@dama.to>, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH net v2] bnxt_en: Take RTNL before netif_close() when
 aborting FW reset
Message-ID: <auo_uBLO1gNqk2HN@devvm16445.scu0.facebook.com>
References: <20261103042210.2984373-1-bcochrane@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261103042210.2984373-1-bcochrane@google.com>

On 11/02, Bryan Cochrane wrote:
> netif_close() must be called with RTNL held in addition to the netdev
> instance lock: __dev_close_many() asserts it, and the NETDEV_GOING_DOWN
> and NETDEV_DOWN notifier chains it runs rely on it for serialization.
> 
> Commit 004b5008016a ("eth: bnxt: remove most dependencies on RTNL")
> replaced rtnl_lock() with netdev_lock() in bnxt_fw_reset_task() and
> bnxt_fw_reset(). That is sufficient for the paths that only tear the
> NIC down internally with __bnxt_close_nic(), but the abort paths close
> the netdev via bnxt_fw_reset_abort() -> netif_close(), and the error
> path in bnxt_fw_reset() calls netif_close() directly. Those now run
> without RTNL and trigger a WARN_ONCE() cascade when a firmware reset is
> aborted:
> 
>   RTNL: assertion failed at net/core/dev.c (1740)
>   WARNING: net/core/dev.c:1740 at __dev_close_many+0x1be/0x1f0
>   Workqueue: bnxt_pf_wq bnxt_fw_reset_task [bnxt_en]
>   Call Trace:
>    netif_close_many+0xb5/0x190
>    netif_close+0xa2/0xd0
>    bnxt_fw_reset_task.cold+0x8d/0x213 [bnxt_en]
>    process_one_work+0x19d/0x3a0
>    worker_thread+0x1af/0x320
>    kthread+0xe3/0x120
> 
> followed by the same assertion from call_netdevice_notifiers_info(),
> fib_rules_event(), inetdev_event(), rtnl_fill_ifinfo(),
> devlink_compat_phys_port_name_get() and ip_mc_down().
> 
> This was observed on a machine in real use with a BCM57504 (4 PFs,
> FW 236.1.153.0) running v7.1.6: the firmware crashed, announced a
> "Fatal firmware reset event" and then failed to come back within the
> advertised max wait, so bnxt_fw_reset_task() aborted the reset on all
> ports:
> 
>   bnxt_en 0000:c1:00.1 eno16905np1: Firmware reset aborted
>   bnxt_en 0000:c1:00.1 eno16905np1: fw_health_status 0x448100
> 
> Take RTNL (before the netdev instance lock, matching the OPENING state
> which already uses rtnl_trylock()) in the fw_reset_abort path of
> bnxt_fw_reset_task() and route the POLL_VF abort through that same
> path.
> 
> In bnxt_fw_reset() only the error path that closes the device after
> bnxt_get_registered_vfs() fails needs RTNL: drop the instance lock,
> take RTNL and the instance lock, then clear BNXT_STATE_IN_FW_RESET and
> close. The normal reset flow, which may run on many VFs at the same
> time, keeps running without RTNL. BNXT_STATE_IN_FW_RESET stays set
> across the lock switch, so a concurrent close marks the reset aborted
> as it does today and a concurrent recovery request backs off.
> 
> The bug was found by inspecting the kernel log of the affected machine
> and the driver source; the fix was prepared with the help of an AI
> coding assistant (Gemini based) and reviewed by the submitter. It is
> build tested (allmodconfig with W=1, plus the same change on top of
> v7.1.6 built as a module for the affected BCM57504 host). The aborted
> reset path itself only runs when the firmware fails to return from a
> reset, which could not be reproduced on demand.
> 
> Fixes: 004b5008016a ("eth: bnxt: remove most dependencies on RTNL")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bryan Cochrane <bcochrane@google.com>
> ---
> v2:
>  - Keep bnxt_lock_sp() in bnxt_fw_reset() and take RTNL only on the
>    bnxt_get_registered_vfs() error path, so that the normal FW reset
>    flow does not add RTNL contention when many VFs recover at the same
>    time (Michael Chan).
>  - Dropped Stanislav's Acked-by because of the change above.

Acked-by: Stanislav Fomichev <sdf@fomichev.me>

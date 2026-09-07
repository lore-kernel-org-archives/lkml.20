Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FE43C1D73
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788785099; cv=none; b=tdG+7WDLVlKIwDmWrhpAk8Wmb75336UjlRnMA5H7GrAjI7k3Q6FLBoR/yKssjI9GI+M+7sOHkMkaIEecT3wzA2ZHpIOX0F+6CsshrCeeM9uGPmRv8iOyGiIMqUDG/clqOxsy28mFnCl9BlQXc2j+0cYnxXcxmd2k2NyALNeA6JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788785099; c=relaxed/simple;
	bh=B+iiOiHkAB3SjnD4jE/kaBzO11YGeGn0DnIBjQ/9GYE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tlbAEwr3XmepmVEMiklfs0QhulQh3/kLDVfsaRb8zH+HIQrOj4cGmwPxOM3uJwhSHPShJ6ynbES1yGPdTtI/SVkOLn0+v/dE+Bh/iV+GmwqJjTxTSPYEndPrMMdgsDyKPnszDqtUGutn7n+0v7W/dLE/A8Q/tErOAuAJKlJWF0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=btL/Nhgx; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="btL/Nhgx"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-398c1101c1bso3361089a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 05:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788785097; x=1789389897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pgRcHlGojddIrdA4thflhygGudJUQQ+TeRB5rtetsFg=;
        b=btL/NhgxdSOkoZ+gQqFXxJQXkk6aa1NZqqTRux/OhwtOBPNIbpQHbzwigGHfdjDzur
         dYFd0pGHcjtCmGd2P7A35BpjW8qU5SmA3i5k+qRGgVijvjQOsGJg/y5rXQ0x5KGRQMn/
         nu1mV6DFKg+GdSTBZ6MbbeQloNaw/K42QdoRe1bNMSvDc+08489zUaZ0/b0RzBZ89eGH
         Tn6Js4k/otrluAUezvQkwaEMDLswVK4tsqg18FpMMDVpMkBKfOZ6IYo9hu05HQIwV9rF
         ND4O55nSusVL+4MnvrEpJQnFU6H269x9x4wQ6UnK83RuiPHoqHVZMsP5piI6YosZQ6p9
         vVEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788785097; x=1789389897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pgRcHlGojddIrdA4thflhygGudJUQQ+TeRB5rtetsFg=;
        b=AxMpSDsu5AWNlVWeLXTtGPBha42x6uV3wXuSEa7VDNHM6d3LetmRTDDmhgCLN6pLMq
         GighyFlbVcvOcloIghG1i6kh6eZDylJJjeBc8gTogRIW6MuL8/BsoYAFV1iAxQHbbE+l
         V3G4VzYQsyGYxakrtouAqGcJO5lLEjfCjS32ZU8JEakP1ZqiaXYX6Ec4lThiCIDWbMD6
         GIgeRas7IsjGJ2z4f8Ih2S2tG17j0+JcUV/cfOEdW2JT8DaceDRjTjdkGCnoWdOQaOOL
         tdBAhl7J9H70S7GuSGjWqWAa8sy7ct971iK/uNalJhECoMp7XN0Hp7T2K8DlNB41hjtO
         EimA==
X-Forwarded-Encrypted: i=1; AKwUvBwkmHfQCPdF+eSSsEQZfPVx781vE29RHYKAQ5VYw+mpljCZEqoe28y2RO4HSjAXefJkFVtQQuLxcGDBssE=@vger.kernel.org
X-Gm-Message-State: AFuF++ms940pCult9C6eSaIFbHrxDuSpnzb0kHNN6+uYUxufjQtltbQr
	B3UTZYit3f50ADCKReA8VmgGFOaqi4mI5WU7ifzHzJwrYOPVuVjpUIY=
X-Gm-Gg: AYBFou09m8BVpsbgvsCPMFTSTBKTXpsp2Z+RqZ0DmX0x66v6/Nx0bfBjx0ZtwclWfkg
	iSfMTjEqWCXK+zc5Jy3NgWewq60l8qsj7K7XC9tKnwGaD6WyQmAtOL53va1O10Pr00ei+EyGBJ6
	YqYIVpUeB6IkuGfD1t27qdAthc8HVX7OXMwB7KhTbUXf04xQNVQfOueKX0he87o7eICr8PN8LFL
	yczgvQGfHZDAbq1XaZ2MbHLOwRNWm3osztg/u4fOKM9gdeQAmQCTbYXhp1NapX6IsWY7vvgVMKt
	Q5u2VjJaiMVMHfqKBqnwopj7efU2FSPMYecryNx4z/xJELxI9vZ2xDWFNFGY6ipU8Nfd6wU3tIp
	AFPEtqxbLQ5J0JfCL2sJWblqOz+QN1t+HZ/fLgOP5whdXcf0zMrRFo4DUdm9aCEwZpdxpjpk4gW
	aMebS3Q+Gq+ehPoyjoq76ryeYrroq8qawwRMBLiO4X1mjQwsk0VBLu5ctRDPfOJYf/1V7Be3bKV
	L4VHuTsfCDlVPsz
X-Received: by 2002:a17:90b:5844:b0:398:dc16:3c29 with SMTP id 98e67ed59e1d1-39b26101530mr34967440a91.7.1788785096980;
        Mon, 07 Sep 2026 05:44:56 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:6467:d689:c773:5f09:906c:a72b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b083e4fafsm26491178a91.1.2026.09.07.05.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:44:56 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: Re: [PATCH] tracing: hist: set the trace clock before registering the trigger
Date: Mon,  7 Sep 2026 21:44:51 +0900
Message-ID: <20260907124451.607209-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907092944.3950E1F00A3D@smtp.kernel.org>
References: <20260907091415.554535-1-donggeunyoo.kernel@gmail.com> <20260907092944.3950E1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Sep 07, 2026 at 09:29:43AM +0000, sashiko-bot@kernel.org wrote:
> This isn't a bug introduced by this patch, but does this error path leave
> the new trigger on the global named_triggers list?
>
> If event_hist_trigger_init() fails, the trigger is never removed from the
> list before the function returns the error. The caller then propagates
> this error, eventually calling trigger_data_free() which frees the
> structure. Can this lead to a Use-After-Free list corruption when the
> global named_triggers list is accessed later?

Yes, and so does the second one. Both end in the same read this patch is
about, and neither is fixed by it.

event_hist_trigger_named_init() publishes the trigger before the only step
that can fail:

	data->ref++;

	save_named_trigger(data->named_data->name, data);

	ret = event_hist_trigger_init(data->named_data);

event_hist_trigger_init() can only fail on alloc_hist_pad() returning
-ENOMEM. Forcing that, with this patch applied:

  BUG: KASAN: slab-use-after-free in find_named_trigger+0xac/0xc0
  Read of size 8 at addr ffff888009346860 by task init/1
   find_named_trigger+0xac/0xc0
   hist_register_trigger+0xc1/0xa00
   event_hist_trigger_parse+0x3146/0x6af0
   event_trigger_write+0xce/0x160
  Freed by task 67:
   kfree+0x154/0x420
   trigger_kthread_fn+0xfd/0x160

> If hist_trigger_enable() fails, it drops the trigger from the local file
> list but then we jump to out_unreg. Because the trigger is no longer in
> file->triggers, event_trigger_unregister() won't find it and skips calling
> cmd_ops->free() (which would normally call del_named_trigger()).
>
> The code then falls through to trigger_data_free(). Does this manually
> free the memory without ever calling del_named_trigger(), leaving a freed
> node on the global named_triggers list?

Yes. hist_trigger_enable() removes the trigger from file->triggers before
returning the error, so the list walk in hist_unregister_trigger() matches
nothing, test stays NULL, cmd_ops->free() is not called and
del_named_trigger() never runs. Forcing trace_event_enable_disable() to
fail for a named trigger:

  BUG: KASAN: slab-use-after-free in find_named_trigger+0xac/0xc0
  Read of size 8 at addr ffff8880091d3160 by task init/1
   find_named_trigger+0xac/0xc0
   hist_register_trigger+0xc1/0xa00
   event_hist_trigger_parse+0x3146/0x6af0
   event_trigger_write+0xce/0x160
  Freed by task 69:
   kfree+0x154/0x420
   trigger_kthread_fn+0xfd/0x160

A control run with no injected failure is clean on both.

Both fixed here:

  https://lore.kernel.org/linux-trace-kernel/20260907124420.607097-1-donggeunyoo.kernel@gmail.com/

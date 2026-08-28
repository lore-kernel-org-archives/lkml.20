Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109D846DFF7
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 14:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787927544; cv=none; b=avDGotp5sIOVcI1GZKmyfMB4YoMw6CmXli7Pogg1bgGCxa0Rlu4/kxRFS0neciq7bHRRumSoB4jkT/8X2qzOwVbPf3UyRxrICFgIwnpdrOQmg455ElOC0zRVJ/74LvL0h9Hdu+gZQK9Aoxup7JOErK/a+NV4PN5dWOssZQYRD10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787927544; c=relaxed/simple;
	bh=tVAN3QworqS0BnYjxRFY90si3ZSQdAxuEt8sP6MPaCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YFWAJD9qyon6+vGqBnEs3S9TYb8at0Cm4qGccwEi3/wmXENHGLnsseajF7w5vj5ZCJsitNfGW95z78nxe1i9Q9JklMFMUhc3liiFcu3OPC64vc/JHMqq7f8GYxhaSvaTAPCM8/VeCZKXlJ/gnwQbWLAoOXzxKkBnnGl9BSUZeb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qyXFBUAr; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qyXFBUAr"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso1059612a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 07:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787927540; x=1788532340; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V7sf7plh19GCC7RhUSvKdPjyBhHsntHmx3sRykLziyc=;
        b=qyXFBUArHAsFbqfPXIkr4MY57tTjgPUrgA9kfFN0jL4vrxcIremVGYUowc4emskERR
         Em86rgnXi10LYKBfI9PLE4lSvjZC9ocv6AMUswp+aa7iiW5BtjkBlFsTB06h+VCRNWDp
         9Htstvpbjz8c3h13+oItHqIwWaZs8NZYtNnhhOJpm1Aq1QUBCk9duo4HrLHrWAHARbl6
         VFHA/TTmWIJQ9zuQIu8MDAeS4FeMonvNytVqj7qTA3cHcWkJNxvh7cByND2AN/5HkfdS
         l/LmoIlLXgG1xn/gBaY8DWTzptHjI/fDjpnkYDOV0SGUEkywqUYSb+1/uwjk46oV49Bk
         QNlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787927540; x=1788532340;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V7sf7plh19GCC7RhUSvKdPjyBhHsntHmx3sRykLziyc=;
        b=BvqBcpcmEaJ4fvDfmmKfveBNqHgJEleMCpL1uhCNc2p+ihffW+LO/Y6YNwg40dS4s7
         GpJJxji+mtVQcWroLNZb3AMevuRd51CAFASSn8AnTYSM5cgmjbNsz7qhTjDB3t2BIqfB
         umozZqwiw1LZzXMH5NF8cz5e7Y0+gvUo8yeFLSisVGbdb2TmPUtyCDQBDgayDPAuKnZN
         yE0FMuBfzZypimVyj26UDzg2OXtCI8FoBsaLBXhTsT3j2GI48CuuECB5ql0F7rbUKV7m
         HDHw0b3DQ86r3vuHBkcfXXAJjc0Y1ZvhbYM6XdtUpQ7BQKNSYilVCyi5buqArt+bhIjp
         amaQ==
X-Forwarded-Encrypted: i=1; AHgh+RqhhjZ4qD2d6O3VNE6pWFUmNzYT4CehjJB38NjgdE2hqDy7+ETXAi3ra7isqfrCwIlWuTwEEM3Kw5vKez4=@vger.kernel.org
X-Gm-Message-State: AFuF++mvwtrMLt+CegM12/QKwPrZjM2MdMUxYfzEO4F7sQL0st5Ol9WE
	HxzQtGXpqScOZdml/JNlpjP7M9ZKFK082/qubj3J+vAVOxpBA1ukDKw2wwqAZka+
X-Gm-Gg: AR+sD11ErcUNtBgWIinBbQfKSPX88TsTQ9/l7Ryizs6riDVjeZvRetR0Q5wSOu45rWy
	gOg0hp9wAa4QGzUWQkEu/64nfPmaLR92L6+Pgsm/+to9XPjLD1/ocJ1GIrYXz8qFiNUMud8O4kp
	LVAXgJ8DzRP6U78S8eIT04RmJH/Ae2C6abvM1iTnVr/xAvOJIMQHTiFtLfhTcHL1MxKh6H5Y1ML
	wb0Me8oGCDgpJW4jacuJJp1w4nGEA7H1Pq2El3iiJkBgeg0ACCLpnLP/wtz1n2U8w9UnkrsMRKR
	f3Vm8/9rxJPB5yExrYrmwbm9rKWd3/sZrH+SgyrPPjlVcpYwBJrSaoVw+8R6Iar5he7LfjMCddf
	oQfff/YTYfCJqqDNQUk22SufUU9HCV4tXrtbgjjWyPRCbZz7j3ThixpsFkcpLrHzHL88bOFEf9s
	pbP04D9z3E3Mi2zFdzospLtSNQE8GJJbmi0N4z/S9Mu8a296sxKwlEaDFaZXoSG5yFBQrMtxA86
	8kAZhnXxZ+W+jI9AOqOd2+Q+eh6GD/1y+a7e2Z+
X-Received: by 2002:a17:90b:2d82:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-396d0f2f709mr16353248a91.11.1787927540236;
        Fri, 28 Aug 2026 07:32:20 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:590d:7e37:c87d:136d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d38207sm6514014c88.5.2026.08.28.07.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 07:32:18 -0700 (PDT)
Date: Fri, 28 Aug 2026 07:32:14 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jeffin Philip <jeffinphilip14@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+1e2ef9bcb29af666b2e6@syzkaller.appspotmail.com
Subject: Re: [PATCH v2] Input: atkbd - fix UAF in atkbd_set_repeat_rate() on
 disconnect
Message-ID: <apGbjnQWWbqCLEVQ@google.com>
References: <20260828100547.120553-1-jeffinphilip14@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828100547.120553-1-jeffinphilip14@gmail.com>

Hi Jeffin,

On Fri, Aug 28, 2026 at 03:35:47PM +0530, Jeffin Philip wrote:
> Commit 0ef7a26af127 ("Input: atkbd - fix canceling event_work in disconnect")
> moved cancel_delayed_work_sync() after input_unregister_device() on
> the premise that events may arrive until input_unregister_device returns.
> 
> However, this created a UAF as work that may have passed the
> atkbd->enabled check in atkbd_event_work() may attempt to dereference dev
> which is freed in input_unregister_device(). Reverting the commit also
> does not solve the issue as events may still come through and pass the
> enabled check as atkbd_disable() and event_work() guard with different
> locks. Fix this by closing the hardware first using serio_close()
> and then unregistering to prevent work from executing after
> input_unregister_device(). serio_close() closes the device preventing
> work from arriving. Additionally add a check for atkbd->enabled in
> atkbd_event() to prevent userspace from queuing new events after
> atkbd_disable() sets atkbd->enabled to false.

I believe the proper fix is to replace cancel_delayed_work_sync() with
disable_delayed_work_sync() to prevent rescheduling due to atkbd being
marked as disabled.

Thanks.

-- 
Dmitry

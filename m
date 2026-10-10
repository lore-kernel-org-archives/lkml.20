Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE42360EF5
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 07:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791615659; cv=none; b=iy1EXssz9I/niO7+YqRMW13hgmMZ5BdOtM1kTqWRGk+XLqZ3j+Et4u1bs/FhldgIbtApkwrX1VwexCvyXdBHUzSk/2D+YsfGxSHTPEJvLKK5RheQHcwKT9ZjBZeSRb3rw4ZTeBUyTdKjzXCK50l1jypFzibcxGpgMW7RT69l17k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791615659; c=relaxed/simple;
	bh=F/o+CB+c764IJjLKKJ/Vq/hAsz/74K7FVfCJHTirPPI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I6ibJ12poWMfOb5mqn47cVn19EyvQWc6tBhOw9WGoWrx5So85fOJByx7rqTT7wPQwFokaDQiZcxyZleNOKvdPSPbQAJbiV9SWS4hFN66PjhNSLwZpmzQY5HRAMWLqjp13L21F+8SonbUb10gMGYyhnYppks64p+0XOb9vnku55I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cD+zYDZs; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cD+zYDZs"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-91957ec418cso6173736d6.2
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 00:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791615657; x=1792220457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rBFXJ6vukRDHY7fGAWooctn5jSYzAGKP6c4NuLaCWJM=;
        b=cD+zYDZsEqV+yqW6aJGFK5e8H2qGSBuLbnPZAizUChJpB7jSWV9hWQNr6dsDOTWh62
         jkJ9wnlkW2jfnAJo4zipaHKD7NBhVHB/j1JgM/lHnfOG30LmDJubhQUA7QQLwu5sRfg3
         tmbfnnZ2RB77HkFmqCUqLrEHSnenORv4PRR/8pgfcLID1Tzo+iJNTJGwDxP1iaj8cGFB
         V0SsnYgNwp9MDh6OHMEl7SJ3+fnvwEe+iljH8E9Kh/yVU/RGUFOmoF0D4PCICbjYQPvk
         5EcIiDf972lOiIdmH0FpSby3tbIwDILlQKFUMm1m9wqZzhBqvBiH3WjuvKdPCfpHasHU
         Mv1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791615657; x=1792220457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rBFXJ6vukRDHY7fGAWooctn5jSYzAGKP6c4NuLaCWJM=;
        b=yN8AlilUZT8IRmc9BPadjJnSKxmKXt6zsAJJmgTs6KNlRyYy0HzzJ6PPFa0GdlYs2q
         k0pH9UfqMFPv1XUsK5yEXIbN9bhfnIfYvztwhsFXYtAg0aMVd2zmpELXuIt9P6tAHUzV
         o9s8hCawFvYZ3QxHaMznAbAxz4JH7QmN6JJS5pE23T+JUjZcoWXXGC5yqYKeXBogiNkc
         WqgSydnbkO7o5P6d0XpKp17rhiz5sFXqerbRCDCnepti40EoarbCVwVlIa1E2AxL0ojj
         jKiSiqvM/dY/KjP45qICStYZp8Kcb/xKGrVWDIAjEicq+8XEV6fWEm4mMc1Q8GdZbw1S
         jBFA==
X-Forwarded-Encrypted: i=1; AKwUvBzMecuxtkUr0lraDJ60c89/R5/m+Pj5iNyS8D0IRqtjQxQ6QSF5DXb2wzb2V5MKwpc/NmQvAQhFOBhwvdE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJU6tTr91llO5lzOvNccJsUgCWjxIN02zoS5H0wVGh3ubfyVQ/
	Jmp17tEFL2u7b5HmgfPYWVKfBmUGwkk2uHPy9alzO2NU4hPtFNYPV8jv
X-Gm-Gg: AYBFou2j5lWTojIVCCYbp3DcMeNtSMQMSvAk2R03Iv1XOpRojfUpDUq/xfheWpnSrzr
	0WX/RmWjT9vaIVXRrUPUrai8PhaiWW6z22tNkYD10IuYqKrmbRV1fp6PhemW22hoErFJYMkcUJk
	NB9uwibJoNGGVheMgu13Vn6rrbxeJIOdrK56EAnkfM9G0yxzyQ+II4B5LbXKNF6wO2CgQ5dgGDm
	mWDE9XPx5zVt+aEC1VnQnUCkIcs8Dua3jzZX/UOBlZZNvARCkYSn/rmy0w4vPIrRXKOtw8DRQcz
	HfA/S8bHRjTlXrq5XIpJgXXwYadck10oBe1rM7iF0M+1463vxFWvf48tvHHlu5UJXGZIVfjq06p
	DTwXYKAoDTeKUumY1ipwqQ9yKWJauVp8F/gOPDNmSUTgMGpa9aW2LNExg9omRbRQ6mzHIRIjWJw
	F/vDMYA+40kcUXaeSRB41WN8TXv0+wPk0hJAJ8eWqICBXUpLBCV19xVNwwlnjaUoQqX64hb2aLw
	LvAUic2m6p61d8NMm1sWeebMWpu1xdvwqPd4r0uF1eaZh5dTDG75RqgPbBVVkSxdqGmvtmyobQC
	RTaKGH8OrGYAqo4n60UE6PpAIQjFlrCd0luWpstOAzUqV9H7cdcmjy9DgqTZmNXvi2izPw95LLQ
	np4qALrGNDNPvnlqMwUQ5d6FiIAicmGakGmlL0uR9FkL2bjqGrDtGvP/voNZElx40D0paBPW3/J
	c8b7lon7e/39FznwwnyeUE3kPtNgCF
X-Received: by 2002:ad4:5aee:0:b0:917:9ce0:b6d6 with SMTP id 6a1803df08f44-91b557bf438mr70044036d6.42.1791615657428;
        Sat, 10 Oct 2026 00:00:57 -0700 (PDT)
Received: from node0.quickhttpnode15.cloudfaas-pg0.wisc.cloudlab.us ([128.105.144.50])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b55082d87sm38108606d6.29.2026.10.10.00.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 00:00:55 -0700 (PDT)
From: mosafer <mohsafer@gmail.com>
X-Google-Original-From: mosafer <mosafer@node0.quickhttpnode15.cloudfaas-pg0.wisc.cloudlab.us>
To: stern@rowland.harvard.edu
Cc: dakr@kernel.org,
	driver-core@lists.linux.dev,
	gregkh@linuxfoundation.org,
	khiemtranzo532001@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	mohsafer@gmail.com,
	rafael@kernel.org,
	stable@vger.kernel.org,
	syzbot+863936f50214e843ae0c@syzkaller.appspotmail.com
Subject: Re: [PATCH v2] driver core: complete deferred binds when drivers_autoprobe is off
Date: Sat, 10 Oct 2026 02:00:39 -0500
Message-Id: <20261010070039.288392-1-mosafer@node0.quickhttpnode15.cloudfaas-pg0.wisc.cloudlab.us>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <0cc7fb74-aa32-427e-a931-dcbac7ffdcf9@rowland.harvard.edu>
References: <0cc7fb74-aa32-427e-a931-dcbac7ffdcf9@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Oct 09, 2026 at 09:49:49PM -0400, Alan Stern wrote:
> IMO, we do not want the system to limp along forever with the device in 
> this "half-bound" state.  Claiming an interface should cause the driver 
> core to create a real binding at some point in the near future.
> 
> This should happen even without automatic probing.  For example, if both 
> interfaces are unbound and the user writes one of them to the driver's 
> "bind" sysfs attribute, both interfaces should end up bound to the 
> driver after only a short delay.

Agreed --- that invariant is exactly what this patch restores.
drivers_autoprobe is meant to suppress automatic *matching* against the
bus's driver list; it should not cancel a bind that a driver already
initiated by claiming the interface.  With the patch,
usb_driver_claim_interface()'s promise ("let the future device_add()
bind it") is kept at device_add() time regardless of the knob: the
deferred bind completes through device_bind_driver() under the device
lock, so the interface ends up really bound, not half-bound.

To your example: when the claimed interface is already registered,
usb_driver_claim_interface() binds it immediately --- it checks
device_is_registered() and calls device_bind_driver() inline --- so
the manual "bind" attribute case works today and is unaffected by this
patch.  The one case where the invariant was broken, and the case the
patch fixes, is a claim made while the sibling interface is not yet
registered and the autoprobe knob happens to be off at its
device_add(): the core silently dropped the promised completion, and
the interface stayed registered with dev->driver set but never bound.
That state is beyond repair from userspace too: writing the interface
to the driver's "bind" attribute cannot complete it --- with
dev->driver pre-assigned, __driver_probe_device() returns -EBUSY (or
the attribute path rejects the device if it does not match the
driver's id table), so interface teardown was the only way out --- and
it oopsed.

The patch keeps the knob's meaning for devices with no claiming
driver: bus-wide matching is still skipped when autoprobe is off (the
check now sits inside __device_attach(), evaluated under the device
lock, per the review-bot finding on v1).  On the reproducer that means
the previously-crashing window now ends with a completed bind instead
of an oops, while matching stays suppressed for all the other devices
registered while the knob is off.

If you would rather the same invariant be implemented with a
different mechanism, say the word and I will respin.

Thanks for taking a look,
Mohammad Mosafer

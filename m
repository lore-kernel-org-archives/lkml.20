Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896923C0A03
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 03:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789873696; cv=pass; b=Bu9DVOvQRjVG1A9gLfCL+qhGmEZwydmkgDKLbB6Rii2VrKNkDzamIC6h34xkRoHM6SggtCb3lZXPFC6jMGYFSPOjrd9X64MT+0jfGqZyWs14gX+Kf8QeB62Mr6esrTmx5BLGqL/zGc5TOmKtnJ6xJAuJvdc0xJ79nJxP22X/4F4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789873696; c=relaxed/simple;
	bh=34f6wCTQExaoVK3BfF8gxDr+dpUi+HCw7ORBUe12guo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YuS/l4gTRNaPB+CVRhxXLoTJFZ7QlOv9vI+6u1/4EpB/xv3ms6s3qVUVGgyMEeaKv7cnxDGqzqcmR1HKCZY7JqKjfI/Y3MXKQiQawRBmReH1wb31m1lwhCqpeqwQt+qbPmiQGv+Hqw1cbGJxSIfbg2YZXTEMkaUMmr34RZ848Oc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jarK0S8N; arc=pass smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jarK0S8N"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-939eb3249c1so174342085a.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 20:08:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789873694; cv=none;
        d=google.com; s=arc-20260327;
        b=BZra5L0loXFY77iWK9adW1CPP2N49mtBTsgTY3p+Oynr+HhWMyZ06wz+++L2N1xdj0
         SjQBfPTiqX6oHxzM8y0YWNhu8Uo3YqprEoHp+sgE2I2dOLHnWX86Yj2Gt9ZsTiwfjlyl
         YpXpHHUaX+8gIk7eLxzDabaX2VZLrIgfEpotDZ17hH8+x79Sw7wiLWwXrjs/n/TPDeZk
         chkG0rK9WT0ZUbKvwYc+Erm/mlzh+ZuECtFAy0XCJ3DeRZy+1LYmSkUnTcbQmi5aZzpp
         ECoAtAR+BUwzsSKWlex0nCBabzW1bA6Rl0T2fHQLcXlVDao6AOg6Loq3D4JxymOwiIdG
         RoNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=34f6wCTQExaoVK3BfF8gxDr+dpUi+HCw7ORBUe12guo=;
        fh=yCGO6zgyZtHIFdnCWaicqeJr8iQiZxCMHCwyj7q4NDw=;
        b=oQJAZZAS+G7CW1S3dv3IeWMIT5b825PSxLxPPiconr/qE6ppyfkrtrExD6DoIaAOFb
         9Bmroov7oAHKrIfHA28uAbpvWI6icgOTf1b24G20uax1mlz1LLidm/nE04AMQirYQjGR
         woiExY7v5cQPiEVvKnPwPMIlqHdzvBE5PJcDsn3bcqc4vDVc9EM+0q6p0SsxZw2lgXFO
         Ks+6WiKjET6ieCBycU1f+ESycuKZy8WWNxBPTlkjMAWo/ooxXcgO5olU8vNO+K6Qs973
         DLylYVPYI58xryIaiCDJ5W8XLqEw8XLkMAtQDsxd4CA1TaBfv9ZQa5s8/P375oKfXmiT
         SQqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789873694; x=1790478494; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=34f6wCTQExaoVK3BfF8gxDr+dpUi+HCw7ORBUe12guo=;
        b=jarK0S8NWMSlejKgJy8ZJhWigaGm7v/HGOAUfg97GFZTv42M/peax7RSnYp2f9mjuX
         UAx05rc5JlSICzozV/BRMJLVi0Vc1WOkBRy0ktgxSg7TNnkgrJebm/cz/NW+KDn2vQiq
         xHIgSCAyDcMEtct0RFnDH3B0XgSrI59OnKAouoJveW5VlFC33j+XabfFjQrqkPRCr6ti
         pbdcA3qHQKdur5IzWfMAkHkOLKbElo3u1Np77zLw+je1m4cwlovA4zn29S9TJcyEzKpd
         d4Yl+nc4eygyP0XMVOxQWCspdGBdHmifQ3p4puDL7XEVt96etjkeofHcsie8HixrJ8sA
         xPQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789873694; x=1790478494;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=34f6wCTQExaoVK3BfF8gxDr+dpUi+HCw7ORBUe12guo=;
        b=lvqzcOdA+V644hjRXKIuZC1/Q6Rb6sszZCgvrmyjvjFVHs36S+85W47gjz8DxwDPH8
         55eDv0Lxw5/zUd0vRZPfo/ZAmunx/7osUP9GA66Cr2CWkVL5L/Y5cu3Jrs2x0hQ7EAVg
         uDPLCdEoeZIPpefP/lN8gIabNNGzEoc/HYFblZYd4iZTaEz9l6JoG6VpJnj6j0EZviuM
         nIGEai8hf0D8ZLDwW/ywfmXxdkys7tSoGWI8StqWuMdHCpGC5XC2jTng8Enux3fjrBTV
         qdAyX9MX4ApzCaVuY+TkahS6tDhK9RYgJJicbo0lTlVP5No7G3JtgCElEAcRdSUlkAYT
         46XA==
X-Forwarded-Encrypted: i=1; AKwUvBxgBYcwxLWBT8M2Do4IWeLHkvO61+xsvkrkz4rZVmKgMluZ6UZO+kSNHlxGFNIydx+FxxQluKkoxOoINec=@vger.kernel.org
X-Gm-Message-State: AFuF++mVrL7CBpGtml6B2xAdB/nrsllEKwKw0Wgyh6TnYmPyt8dcY4Ka
	Dkdlo4G36+XEkgu+0fPc3hEr7a8IulkdGpFv3vSpJviZiHvjEUHhK+DrG5/Zh88zxYfPv+fEoar
	49tTJXvFFUc61dIYeVCMxrM7qfdg9Y3kyqVUXsZ4=
X-Gm-Gg: AYBFou0uWk+GE1PxG4VTwXivvk56m5JA6rODQrmcTMA2nMllNVDKdN9EeGYNCaytfWt
	gj7ZgsI1M63nRD80D1QGBr0Osbs7K6j61Z4yX19tgGOVJqKdni5An6EBwuogmz8DkwFle1W+MiH
	U3rxvSRgtq0ELrm+tvXLKNqCyCEPBilBO9bJilsPPARzdKtT72rVC26mVqhXLGCzReJ4EMfx1Ln
	yBXAhB+8J4b5pIYcj9eg/FrFvdQXdp3QscST5sUL4nrcDw2W8zNUxS2nvTmL4SlQR6wmBv9sxDN
	5xB5w5tlNfTOWTNm3mlPRC6/6bjmzsOWYvhyRQvNLt1du3g9GKPUhxOXQTEY5TW6ioD3LFJz4GT
	rbIOcrvZR1Re1xFxSrev3MI0=
X-Received: by 2002:a05:620a:2855:b0:93b:d79a:c469 with SMTP id
 af79cd13be357-93bf57b7cf5mr366716385a.65.1789873694318; Sat, 19 Sep 2026
 20:08:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920024550.2278408-1-kunwu.chan@gmail.com>
In-Reply-To: <20260920024550.2278408-1-kunwu.chan@gmail.com>
From: Lai Jiangshan <jiangshanlai@gmail.com>
Date: Sun, 20 Sep 2026 11:08:03 +0800
X-Gm-Features: AcwNN1W7w-Lyl1nGnsFdtHbdW5NmtCJ03zvTVm3OWQrDFu5oCvONGGmSqml_vhM
Message-ID: <CAJhGHyABHDrYsnfMMr6V+rWt5qe6g1+Q0vHKqLbES7uEAzNYAg@mail.gmail.com>
Subject: Re: [PATCH] workqueue: Drop redundant rcu_read_lock() from dump functions
To: Kunwu Chan <kunwu.chan@gmail.com>
Cc: tj@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello, Chan

On Sun, Sep 20, 2026 at 10:46=E2=80=AFAM Kunwu Chan <kunwu.chan@gmail.com> =
wrote:
>
> show_all_workqueues() and show_cpu_pools_busy_workers() are called
> from contexts that already provide RCU read-side protection.
>
> show_all_workqueues() is called from wq_watchdog_timer_fn(), which
> runs in softirq context, and from sysrq_handle_showstate() through
> __handle_sysrq(), which holds rcu_read_lock().
>
> show_cpu_pools_busy_workers() is called from wq_watchdog_timer_fn()
> as well.
>
> Drop the redundant RCU read-side locking from both functions.
>

I don't think relying on other subsystems to already hold RCU is a good ide=
a,
except for contexts like IRQ or scheduler code, but not softirq.

`rcu_read_lock()` has almost no performance cost and makes the required
context clear.

Thanks,
Lai

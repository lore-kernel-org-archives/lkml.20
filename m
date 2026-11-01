Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793534127;
	b=xv3cwLGlcJoRpdKgcO1bO1xhmSvRaTaQdrNqaEJMUZpWIHrAlsdPpgfbsVdSTNW702oo
	 MoKcWNgVHq7Kx/IPDVd/mP39/8ry7m00hV/eEA0PAvoJaUCegZUpcCGpfg0tJNpUhM1DJ
	 fkgdjAZpAE28Kfo/B9FRrQ0iA4IJOiIXLM2SQoaFRdhhvAfpUefSTRLnSRHCQ3B8CxnWh
	 n/m1kIrTozHONxDqbTcVCATPB/kHI//Vfj6q2jC5z2o2rRE4lemhZ559pdSWyLiiUpV1u
	 MVNLL+dHOplwLE6qaa8YvLnPBRGLURvQEq1MbTUhCsxTW9WfKatk5I4coyjrtfKFS1g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793534127;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7fqcRS854qRJ/jeh/UhWfPYnmMyFLLL8s53M6ZZX1/U=;
	b=N0WGlKF3ZiDQn5Ran/kojtiROKmKs8jEruwUD3HuKkIfobGSBEN9yR2SySVQPfdDj/VL
	 WCRr1Es2Lx7Ado4oVM4msrT4rQi11fRnpZmVybhY64CcRouJVSDK2bN3+JgSGaOMrzMUo
	 BmSSrtiGMIliV8XJp2ioMVusdZvjzE8qoUQCUGwRvqYNwnNK9NVeP5I238Miv3r+D9Rk3
	 kJCVf0wN2ioet8gedO1TWV1Ly41zeFcZc6jj+9qOe/3uFoRO676ppm5xSoa/ZnYyWIUC/
	 rmzFak+5LMr/g1YQFXTDGRpt7kqJHjUDgAHr6jy+FvmM/28DvcqcEsRPss4KHQyCDzw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MrHhDdmz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.52
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA1C606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 11:55:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFA1C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MrHhDdmz
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-67a79750749so1200007d50.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 03:55:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793534126; cv=none;
        d=google.com; s=arc-20260327;
        b=MeXe4KBWcpn3Qi/hfCDAWEIKzB4Dt1JLcU/uDcs/MxN+esg7uCVBu8yRSnLGYvWlAW
         4b3QzkVkhSQuSPTDl+gBB77yzfVHUifbRB+0Z9KYN0GGVpbvxezBT+5g5Wi+8nXkA9Wv
         qTAjtpWXy/bBnV2QWohHHssK2528EBuSGoj3GZyfFlw94J5ZSqc9O9LDpBWFwV07VQeE
         Eb0mAlaVb6e/lzQnT8ZCoxhlnbjyWJr3PUR85cwQHinzDPl8BrnfwL+2f0lGe0txw5ou
         bexP4bcqR03ecOorGQWSFRddG9j/RB3Rd9YMzgYjBXsAN5qKZ7mpGVsTVFPgjA+xvbuW
         AI1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7fqcRS854qRJ/jeh/UhWfPYnmMyFLLL8s53M6ZZX1/U=;
        fh=AOW+wuKYuLv0xb4qL0oNysoAPrkL3gfVqVYzJbdtTMA=;
        b=CG94d4OisSy18hCtd6NYNryFGpjloSRK06Ojt+On3vEWRPRaq8ki7zA7oGxXVlxZH7
         1oSIlF9EAeVYD1Y4zy9bOqW1VmZp/zGw3CoofbjN3pugc8+IKwqsPiAmwDjPBNvmL+NV
         DngSB3l6uS145P5HYCtKaxVURRa7j9oFR0jp4WxFBHSLVbzCDcDY7ial80oQmAVtBO37
         mt5ckWHpXjcugyjoEE1kdBgjsFqK9yvR38koQUC/3pWXpNfMC3vC08ucg/VdqNjPm4nm
         KDdaGkyGv0wSZcyRyM9dl+OFfSff2+nAH06GhujpflQs2ljBDKMs6N37cayKFw0X1SNL
         OXyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793534126; x=1794138926; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7fqcRS854qRJ/jeh/UhWfPYnmMyFLLL8s53M6ZZX1/U=;
        b=MrHhDdmzutbG1jTjdgOBOWryBe4vQco7hsSn9i+xUjBAVyJIAokL7F11t+swBw1rYr
         v99UwQ/WO4PSY3gA/VbESOPaDnU/7fdttccE6VldN8umhl2Vf0EkTeqTTmk9zVD8PUeM
         moElVZtaBsEk4xU7TkYXkz2UrZh847m0AnrKGk0IyMU/UKns99sVFxdC2+OLWfbj+PpY
         G4BrULMRZN5LYGE933oG8KNFdefjT/DIWx0HNJxKoLNQBlO3rgFq8HdMNrPb2+GbjvhC
         BeSH0LBrvSKoiwhF8TwYLjnCRRsXPGPwpo8PvW4EAMEexsIP2o1O7DaJOYws7gkcMmNU
         dm7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793534126; x=1794138926;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7fqcRS854qRJ/jeh/UhWfPYnmMyFLLL8s53M6ZZX1/U=;
        b=A5Mgn+53OYj7MJU0P7noj11LCR7nli2R3/C0hDMmFCu5PuRkssn57fZnoUxdLQ7jOW
         kw/LidJqDH5KicvWcvL+YNKFQXXjwzb+pUTiYjSPM2Ry/uhf9jbc6Q7cX+BfUMvb5gmD
         7VC11io1jPBcf5o0sfhQjRS08Xc4GIkuibBaMOmoZrqCoZ05BpkwzPWYLAO+67UHp6Ts
         1mkQxeP6ZMyAeA+Ri6hylMYi5cbGnzDO2adiFKB98Alzy0b6iDqyHTME6TItJj8TKR3d
         l5Lm2SSgeOrDTbiz60Z08sfjGOgGYAwnkkqoGYBW7qQ1BmnbrUlslsY4oxEUxL77vvLM
         glRQ==
X-Forwarded-Encrypted: i=1; AKwUvBwwJ15rHxyGvqy7R840+SMA26ijGoqTofz//sDIYbJbqle2F+Db+feJp8K/Uan5aB30vJOS3YFvAnblTCE=@vger.kernel.org
X-Gm-Message-State: APuU4Z932umms9umWA6xrHucCDEAHJ3vpQlTUyB9Ou/jT9PSoT6H32o8
	JNpchUvdtBYoDZYDUOannbC97bP3mIQtYVbPwR5K+3zqtQqHb1WYMIgxRtxsbipzD9KnjenziHj
	1HtWkSU1iDt/BFqpxmM2BAYZdJ5k5z3rxbu3e
X-Gm-Gg: AYBFou282KaMaJeEgHoSblCc+LKHcjYOsvCmAOAIlB7sxCk3HNXCkb+gutfBG/v8BOI
	xzymo5CBxI4QU3aCSi98YbcgMUH8wK6u65kcNktEJMYR7AU7RmhrAkktHl86ZQKzMZJ8FM2Yjbr
	hePWMeWR0Va0rtllBIIDrmmezhHKATFdFlrI6kGMMia+nrzCrjCJ6F6MqVnHdpJ5LDn0kKpiMif
	vGBEeKeFaGvcO04j1i/tSFjXwh8R4+jtVq23N/YY+NzIdWumO4DTDuJoCDSRMDukppCOjpUhv1r
	HizrP9STfJNbzaqeFNibof8Cnez9pgLacB4T26V5QQea7S/9Jal8LOqgXN28jkCdR14xyD0mNqQ
	4AJxi1oW4qHfalv2x6z7Wr0T3Kp3CS7G4D5CFxGk=
X-Received: by 2002:a05:690e:1906:b0:674:9cc:4128 with SMTP id
 956f58d0204a3-67ba50db7c2mr5707194d50.86.1793534125780; Sun, 01 Nov 2026
 03:55:25 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031083642.1076356-1-sidong.yang@furiosa.ai>
In-Reply-To: <20261031083642.1076356-1-sidong.yang@furiosa.ai>
From: Gyeyoung Baek <gye976@gmail.com>
Date: Sun, 1 Nov 2026 20:55:15 +0900
X-Gm-Features: AclHuK-C5JJioyiCBX-IupgWA8EMz6wvl_OsWsPGARgDfid2h8EI2yQI9l4pcfI
Message-ID: <CAKbEznsRK68w=qimTHifgDhD_Roi4eg2NrBYu+r6foYRZv1ePw@mail.gmail.com>
Subject: Re: [PATCH] accel/rocket: Report per-core engine usage through fdinfo
To: Sidong Yang <sidong.yang@furiosa.ai>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sidong,

> If userspace (for example systemd-udevd reacting to the drm_dev_register(=
)
> uevent, or a client opening the device while remaining cores are still pr=
obing
> or deferred) calls rocket_open() before all cores have finished probing,
> rocket_priv->engine_usage is allocated with the smaller rdev->num_cores c=
ount
> at that moment. Once the remaining cores finish probing and increment
> rdev->num_cores, calling rocket_show_fdinfo() will iterate up to the new
> rdev->num_cores and read past the end of elapsed_ns[].
>
> Similarly, if a lower-indexed core is unbound via rocket_remove(),
> rdev->num_cores is decremented while higher-indexed cores retain their
> original core->index. If a file is opened afterwards, rocket_job_handle_i=
rq()
> indexing engine_usage->elapsed_ns[core->index] can also write out of boun=
ds:
>

I reproduced the OOB access sashiko reported.
I used `driver_override` to keep core1 and core2 from
binding, so only core0 had been probed when the file was opened:

  BUG: KASAN: slab-out-of-bounds in rocket_show_fdinfo+0xac/0x120 [rocket]
  Read of size 8 at addr ffff00000242b230 by task grep/461

  Hardware name: Radxa ROCK 5B (DT)
  Call trace:
   rocket_show_fdinfo+0xac/0x120 [rocket]
   drm_show_fdinfo+0x218/0x2a8 [drm]
   seq_show+0x340/0x648
   seq_read_iter+0x318/0x9d8
   vfs_read+0x220/0x6a8
   ksys_read+0x108/0x1f8
   ...

  Allocated by task 444 on cpu 5 at 79.841431s:
   __kmalloc_noprof+0x2d0/0x740
   rocket_open+0xb4/0x468 [rocket]
   drm_file_alloc+0x37c/0x568 [drm]
   drm_open_helper+0x110/0x2a8 [drm]
   accel_open+0xc4/0x1c0 [drm]
   ...

> drivers/accel/rocket/rocket_job.c:rocket_job_handle_irq() {
>         ...
>         core->in_flight_job->engine_usage->elapsed_ns[core->index] +=3D
>                 local_clock() - core->in_flight_job->start_ns;
>         ...
> }
>
> Would it make sense to record the total core count allocated for rdev->co=
res
> in rocket_device_init() (or store the allocated array length in struct
> rocket_engine_usage) so that the allocation size and bounds stay consiste=
nt?
>

`num_cores` is used with two different meanings:

  1. in rocket_device_init(): the number of core nodes in the DT
         (the size of the cores[] allocation)
  2. rdev->num_cores: the number of cores currently bound

This patch uses (2) where (1) is needed. How about storing (1) in a
new member (e.g. max_cores), as sashiko suggested, and using it instead?

> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261031083642.10=
76356-1-sidong.yang@furiosa.ai?part=3D1


--
Thanks,
Gyeyoung

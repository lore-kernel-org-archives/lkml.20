Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3958B2E7F20
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 00:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788309728; cv=pass; b=Nyv87C9odF/nT8IzRDV6qelxmkeImZYvU2HnHgFsdsU9gbSZs4Unz5aSxZUB/j7DvHQSU5CZYk7+CvZ35EL8bgXbd2QhaD6prbs5WGhbPXyhOfYkSm+rG0OOir0qaL6Z0XofX7XwNsBRKVdaUDEbVo4J3ou2RAUSQPsrwmUZCiQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788309728; c=relaxed/simple;
	bh=eFqcaGB/cErX84H78RZaw/LyxqfPSspGf9M6iQ2GHpo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X0upTeoXmxeNJdebdRhC/S4Xps1Exczkx2umfFdqzES8tlBbtv3DCmTFeSNcd/0VKrUCMTzZYVLzNQa8icoXaScWjfqi5MDcpbbLCpchvBW4Suk2gYWw/PYuKh9LlU0h0o/OsI7N4IeaUvkyHaRKu+eW0xP8Ad8y/5SPSHiBoJ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omnibond.com; spf=pass smtp.mailfrom=omnibond.com; dkim=pass (1024-bit key) header.d=omnibond.com header.i=@omnibond.com header.b=D6uw6VQ8; arc=pass smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omnibond.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omnibond.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=omnibond.com header.i=@omnibond.com header.b="D6uw6VQ8"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8485b358552so453086b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 17:42:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788309725; cv=none;
        d=google.com; s=arc-20260327;
        b=ibXUYbzj6sSYEsVrwF9PRRq6xcSiFwfIz6B14R10DmjqCnqmGBpzrJOcItfuYJRgaf
         DnBQryuiWfTfQm7yA8nOcqMVMBhQ3k96wlPIdIQFsL+3YCb86j62OKER6CkEXKqvO9Fp
         W+yvLoykPjsU3Pm675ONhyWoAumhi3WLZ7MKUsL6PvULrDaOxC7QrtF2RfVmrRFbLZqD
         yL+7OC37fHWdOBvRrxj+sMmB92XYyNsvi5QqBqWodpSoilPzr7tHdDuIeF33hDDlmjQp
         gPl9vJ6JKzMC9HHLpprk6rdBgvkKuO+XB2hDYd48sZfQ4RrTlwchnkEbp0gavmhIK3ZN
         fXIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gFUJHQZD1+cpYALjaZMVpkoL1HXZLD9SkBo8CagnxPc=;
        fh=wszwKr7wkaXX9sGPWZRPuzQIzYeuggsmbrJdqhSixKQ=;
        b=F9mlVA+y5qQhjqnnXAGP8ZBfTUVY6ApT9JPPqiMhHSTnoggBwd84nL5KFYO1FinAtv
         0WJSi4HH/+LsSeRsa0kFHUNguNkCwnlK5qV7Z+sRtzDMU9kK3ShdtnNs4nG3FRlfm97f
         VyYqZURoIhC0NoPNoE/S58o1PH8S3kogkAzKbVaf7qHL+Oje2cG4V0vj0YGXV6AU2ApQ
         O0ApnyEc55tmIHv18o8hAZLgcySKBCZMTVhjAHD0Sqcw7teoh6IvfGfgYyHBMSZsUk00
         rX/Ob9JR+6zmuQyeU1+i+WsqEq5wBIV0Yl/jGlq5d3uO0ayB++yFlnnZxz7skE+6cIVQ
         JQXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=omnibond.com; s=google; t=1788309725; x=1788914525; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gFUJHQZD1+cpYALjaZMVpkoL1HXZLD9SkBo8CagnxPc=;
        b=D6uw6VQ8HWR9MjR07k0XwM/Vm8YvPkNOwhiHVssyXlWToB6tnEbx/mjhJXp4ueYvKF
         +liOYWHvUZuo8e2q0RGbQpUEJkhBY0ZjdD/DWIH5IGhyfibcEyo4nNdjX+mbzVvVAgWf
         EVFa8S70TsVU86UjAuP1QUcgxZwfxjyfD/bz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788309725; x=1788914525;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gFUJHQZD1+cpYALjaZMVpkoL1HXZLD9SkBo8CagnxPc=;
        b=fX10+S+a5/in7ujkxUKSaCbDMQYxPJrpOb0FeDO6hFtfxkNYR8de+ae6OdjN/Fc6xK
         aVfZlEPie6OybM6YiKHOZAt4a+hx7jizDX26UP5zj0JHalqy7wQ0vIFDxwDHoKtimClQ
         D7W+2X98Ce+M/NSVi10jd25oDoIQh/9nUx88tkYPsXXCzztIboTT49Ud+4jyLm+pa4Cj
         FDSp1w/T3ywd8xoXv5vv1tSZHpq/fNVbih1u8Te9gakBS0kMmWtpiJrXN5jq/OlV/cWm
         J1HKDDi+k5pz9TcbzuywjDWV/P5zBmJUWd8pi8KfeAYEBWExI8Kwj3Gi9CVDQvJ793zc
         Lr6w==
X-Forwarded-Encrypted: i=1; AKwUvByrgAm4rDaVYrv3ZiHthJkrG3mKH7Tims42v/AfBTDk87VpeaTeEa9PbrfUSyKMPm/I2JJxv4gAasuZlVQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kE/1URaw1IWdncpGsmm+ogpni2Xpjl0Zdw2Xs1OuqbocHpsdzW
	JdSe1I7vufQsj1mmaObFBbBFfZbOiwyQmbWqvNmsPbfvWYDOlyTL0O8i1ZhdT7okqaGShzUAQft
	pt49AQNcOBcXmW3N+S/PrnUean3Yql8Rxwtgl/GFGtufworf6x/wuLA==
X-Gm-Gg: AYBFou1RWbeYIpXBbxnlwiIkSNjxXlHkr0cOSe/vwVHYlD6okvmdsMPCagKQ1uql1aC
	fuCX9qSa6M2UaOeAckWjT1qoeHa222QldHhDvbLK3IouSMHLvpn2EKrV4t8sQeiidF8Fp9oUuiq
	zAHtD9w2dG4ADMmNDZWhe80t/C+2A3kRPH2y8z6NJbcT754mi3Zq16Ew1KOUEkx8T1vIdqu8Z37
	Z+aYnIQKITfl42TZ1S2049qxz+6dmxYYNFoRxF0kE290CcHh3TMz7DVMKRj5lE6HlQHv6Il1Hb9
	pJpfHgeq5vwt1Eimm3YAxqeZvxbP4yKN4k6S6/Q1P4aFaE6fEVjKXNdM
X-Received: by 2002:a05:6a00:1307:b0:848:3f07:c5a2 with SMTP id
 d2e1a72fcca58-85ed1d08ca3mr1936483b3a.4.1788309725553; Tue, 01 Sep 2026
 17:42:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+0ovChOY+cRnRkfRWr5X9gcdXsz_L6BkBpXvL6=zdFBWFfUwg@mail.gmail.com>
In-Reply-To: <CA+0ovChOY+cRnRkfRWr5X9gcdXsz_L6BkBpXvL6=zdFBWFfUwg@mail.gmail.com>
From: Mike Marshall <hubcap@omnibond.com>
Date: Tue, 1 Sep 2026 20:41:54 -0400
X-Gm-Features: AcwNN1UeaIRdMgnISX1x_ZyNeAp7_vNJ7FJwGcw8daOY9wP4Rylu1WZVoBn70ag
Message-ID: <CAOg9mSRYepY_OrnEsdLjz-68ofScdCeqYt5k5a77dUH_uBisLQ@mail.gmail.com>
Subject: Re: [BUG] general protection fault in orangefs_writepages
To: Farhad Alemi <farhad.alemi@berkeley.edu>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, falemi@asu.edu, 
	devel@lists.orangefs.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mike Marshall <hubcap@omnibond.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the oops report. I have a potential patch. Please
send your reproducer program.

-Mike

On Fri, Aug 28, 2026 at 2:11=E2=80=AFAM Farhad Alemi <farhad.alemi@berkeley=
.edu> wrote:
>
> Hello,
>
> As part of the kernel research at ASU's SEFCOM
> lab, we hit the crash below. Crash reports can be found here:
>
>   https://github.com/farhad-alemi/public_bug_reports/tree/main/176-genera=
l-protection-fault-in-orangefs-writepages/
>
>   Oops: general protection fault, probably for non-canonical address
> 0xdffffc0000000002: 0000 [#1] SMP KASAN NOPTI
>   KASAN: null-ptr-deref in range [0x0000000000000010-0x0000000000000017]
>   RIP: 0010:orangefs_writepages_callback fs/orangefs/inode.c:144 [inline]
>   RIP: 0010:orangefs_writepages+0x642/0xc60 fs/orangefs/inode.c:205
>   Call Trace:
>    orangefs_writepages+0x642/0xc60 fs/orangefs/inode.c:205
>    do_writepages+0x328/0x550 mm/page-writeback.c:2571
>    filemap_write_and_wait_range+0x332/0x3f0 mm/filemap.c:685
>    orangefs_flush+0x44/0x60 fs/orangefs/file.c:566
>    filp_flush+0xbd/0x190 fs/open.c:1467
>    filp_close+0x1d/0x40 fs/open.c:1480
>    close_files fs/file.c:494 [inline]
>    put_files_struct+0x1b6/0x340 fs/file.c:509
>    do_exit+0x6a8/0x2360 kernel/exit.c:971
>
> Our reproducer.c is available upon request.
>
> Happy to test a patch if that would help.
>
> Regards,
>

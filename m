Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDF0345EA8
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 06:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787810553; cv=none; b=LTwLbF++0Gzu+7z/FVgHl+ndWav/Mf2UWXx8RKo3ENNljtH5A4laJN2YlLFYkgqKOcZf9TDJN5u2av/ADjSxkky67kTqwd/b7WRIyYJpPeeMinCaaYkgZoKXuI66gMRIeVvfoFVzhbglquQ1N/HVCVqssBqMxG8oO4CudDW4dTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787810553; c=relaxed/simple;
	bh=xp+w1tGN2NDSldxdF9HHD7HWmgw0CbR7HVRYpzb0ewQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VlvaFO07OLrEgyrZMGy9hY+QWNiF6+JfIOFqpGisonGEiHcHBoEjCbCT+Tey1Z6xpX8IdFDpgUGu6MiEy+SrryqgubMwD2DyD9wZjszO70xOySEwpaLh6Ip5xdMZ4h4r4Bu8+dY4MGLRaSvT9DH5tiajo9YogSki6e58R2W2YNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hMvEsHmt; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hMvEsHmt"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso15135285e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 23:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787810550; x=1788415350; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X0nNFkPNa9Bvip0LwXKQ+H6BiN5Qr8MdmRjZI2xdljI=;
        b=hMvEsHmtNLDnbHVoTBxKe4y5CacpQlmyIRlAox4o8BriAUP4OzvVvm3cxbJYQa5B0m
         wO9akqjEyDBcpdJH8zw6s0yx24Xdvuwe/+D7v54/mfBvsLtSieaxyqXigZ6DwJX90Joa
         1xfvynuO9acpycigXwxv87jMFR1o6N1v1QCOj2f60mCmG7u8Z2kztexemwjdc75gPlyg
         +JgH/0bzv6W8iOmEQKWx9ylZpKSmMDjFGiQX4/yDvWzDFBT+GEdr+x1bjXAIfysw6aXL
         bjLalm1VyCi4SzA3CTMER/eCfHzO0XtBOfm4qtTSrpHW8g9okb+gnGZInTBWRNgjf346
         ZFuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787810550; x=1788415350;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X0nNFkPNa9Bvip0LwXKQ+H6BiN5Qr8MdmRjZI2xdljI=;
        b=Se3CgTw52fpJurV9KpXwYNIMkl4mGYKJpJkRtzJEMcq34JLdfxsktwLG6Is1RBSAoy
         0T7+yGi30AdlYO/UjcI2TY+BA959rWB49URKdf9v31XyOc+V97yoeTCzAKp79CdH0tNq
         MZK3WehkBoksDkHJ/SkhCathKMoc+RrJMsbHjLHJXvANOK2HFTofW0Y6AdZ0oDwY2hTC
         FuEc9mPtDqlYPChq1zSqYMi7dScfHJPZhUd2Wi5G5U0ZIMpd66Dq6rScCMc7wUKjQyF4
         SesZGrZAZ8KE/AQjUfTwP9OogFIWC7x6xU48A/NJHxq4PLn81adJM1q4zUHIn/31OjSU
         F4Eg==
X-Forwarded-Encrypted: i=1; AHgh+Rr9q6evyCk1SknbhK0mqsCqyfeQNf5fVxHgpLvFJM3GEeXe7HRL57IONTwyJpErZfFMQdc5WZSuflcbkY0=@vger.kernel.org
X-Gm-Message-State: AFuF++nx483YTT/Fh0Kiu/vFrzsg/nF5tlDiF7UT8rvn1j5Rt26WToJ3
	eUS+oE9IVzaxLlN87b3mDdkDA3qQ5X392suhQvNfdGgP6pkgbv4wuwcC
X-Gm-Gg: AR+sD12VMR3vGhgqCfwLH090p0ZR6weIyivE0ZZUrwbKW6Gvhpz2WX80m70/Azm+RR4
	24PsDG8VbGEXkbThJ+58iTZgb4zvH+DGsnNZVyellEDoNDZUtYcoAi7UqHidx0w6hgtmDA4/8Cg
	eG4aKM2c+ldN4tGR05zbrscDUJ37QTAmIGOkBrv5MmREgTF1FQY4SwLbhPctHkWBG1Q3PSmfCxn
	+i10wLp94yehuecBQQjFJH23VZpWpeBSOLOsnSKXT+H/hFM3cmuR8mggb40BmZ4Kij5EO0GhB0u
	1CPdIiTNHpsyqMSv1tUdDSFZ5FwWVfHuDIqUy6b14f8cDkjmDLsNf78h+muo1OX+KP+TlUfGAgZ
	g6hvvU2Cu0Uc+yr8gZ90r1vvJ+3/lU3y9k+MQylyetwMbrca4D1kYjymiBeM24fRXMYqq5sc2t0
	W0mDs+TESv/7+qsa/fhoeLH9TjoGL56rSv/lS802lwY5Wmn44eYmpuTAo8Vi4HJ2kt4g8=
X-Received: by 2002:a05:600c:1d1d:b0:499:737c:8a8b with SMTP id 5b1f17b1804b1-499dc81eb1emr132743645e9.12.1787810549981;
        Wed, 26 Aug 2026 23:02:29 -0700 (PDT)
Received: from foxbook (bfk5.neoplus.adsl.tpnet.pl. [83.28.48.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b0d263dd5sm25955575e9.1.2026.08.26.23.02.28
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 26 Aug 2026 23:02:29 -0700 (PDT)
Date: Thu, 27 Aug 2026 08:02:26 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: syzbot <syzbot+fd7be5ad9795b7f29df3@syzkaller.appspotmail.com>
Cc: dakr@kernel.org, driver-core@lists.linux.dev,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, rafael@kernel.org, stern@rowland.harvard.edu,
 syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] INFO: task hung in unbind_store
Message-ID: <20260827080226.4ec229d3.michal.pecio@gmail.com>
In-Reply-To: <6a8efd77.50659fcc.60cd.0001.GAE@google.com>
References: <6a8adc31.ae6ddae5.3da009.0064.GAE@google.com>
	<6a8efd77.50659fcc.60cd.0001.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 26 Aug 2026 07:51:35 -0700, syzbot wrote:
> INFO: task syz.0.23:5988 blocked for more than 143 seconds.
>       Not tainted syzkaller #0
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:syz.0.23        state:D stack:27344 pid:5988  tgid:5988  ppid:5772   task_flags:0x400140 flags:0x08080002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5520 [inline]
>  __schedule+0x17d4/0x5820 kernel/sched/core.c:7270
>  __schedule_loop kernel/sched/core.c:7347 [inline]
>  schedule+0x164/0x2b0 kernel/sched/core.c:7362
>  schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7419
>  __mutex_lock_common kernel/locking/mutex.c:726 [inline]
>  __mutex_lock+0x7c1/0x1550 kernel/locking/mutex.c:821
>  device_lock include/linux/device.h:1104 [inline]
>  __device_driver_lock drivers/base/dd.c:1170 [inline]
>  device_release_driver_internal+0x93/0x880 drivers/base/dd.c:1369
>  unbind_store+0x1a1/0x1d0 drivers/base/bus.c:244

#syz test

--- a/drivers/usb/misc/sisusbvga/sisusbvga.c
+++ b/drivers/usb/misc/sisusbvga/sisusbvga.c
@@ -323,6 +323,7 @@ static int sisusb_send_bulk_msg(struct sisusb_usb_data *sisusb, int ep, int len,
 	unsigned int pipe;
 	char *buffer;
 
+	dev_info(&sisusb->sisusb_dev->dev, "sisusb_send_bulk_msg()\n");
 	(*bytes_written) = 0;
 
 	/* Sanity check */
@@ -378,7 +379,7 @@ static int sisusb_send_bulk_msg(struct sisusb_usb_data *sisusb, int ep, int len,
 
 			result = sisusb_bulkout_msg(sisusb, index, pipe,
 					buffer, thispass, &transferred_len,
-					async ? 0 : 5 * HZ, tflags);
+					async ? 0 : HZ / 2, tflags);
 
 			if (result == -ETIMEDOUT) {
 

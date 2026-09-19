Received: from mail-pj2-f25.google.com (mail-pj2-f25.google.com [74.125.227.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8CA488D97
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 11:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789818905; cv=none; b=auTypGWBKC0krCC181t+um649EaBXlEjK2w83FdrxBWTNW4VDz7C9AVYghzLvasy1La+bwOHEqxM5au/XKhvh5NCdsHqpaE712Q0lJI9snEalR8Bi2HwuF0xLK03o/SuEU59MUg7WL3BZRpywFXe+l8pXdkSTMjgCHdM2wZRReE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789818905; c=relaxed/simple;
	bh=0gsHMzOO4cRcCBVLdHgl0Sd1gCQeYtv2YaNf+w50Z8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GttyRg3iFVyyNsjsrr0WFn4MONsHBdJUBbXZwZEYiVSdFpfVnl6WakItk6AudSqmlWWVOvlTYHnoXDRBM/sn5hPxZ7jPgt0esG9YVhJhvQjrUNX9JXHMLmPHIUP25ZX2gp8tMxBOJQCiAH8tXyaockul1NxVOXyUcff8Iz215SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DaSW7N68; arc=none smtp.client-ip=74.125.227.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DaSW7N68"
Received: by mail-pj2-f25.google.com with SMTP id d9443c01a7336-2dd4b43b20bso11129395ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 04:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789818901; x=1790423701; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M2KopMb5MO+iQvHKojzedzUOkJZuYo1aJE/N0iz10Ds=;
        b=DaSW7N68seEmrIDmnWLiwtIyBQ6+ZJ6BkgxHFSHcmA9Rpa54z+/qw8JXdiRM06Z9BK
         YdfCvN5KFoHItI8OsVcERdCaP922ijG9UrYAfxPbyz7hF+r89Jrd85Gb/lH544nI9Okt
         VwBemtnMj5aGkT2d5mfLptpbFpP08nYSlH9+6I6ITy+wbmT4s59OLfE/40sceI0Zd9lX
         9H7x42jJAb1HsnigE6MZMX7/ioTvZt/3oyONa5HfZ+qwJMihBUwMxQUi0npx1e5xAsXK
         b7DGRgRstzy6JgVFMgMQZxiWhj7z+2/+YIFedpjSOnqNBr2KOnsj3NDna9WcFh0wZBdl
         HTXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789818901; x=1790423701;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M2KopMb5MO+iQvHKojzedzUOkJZuYo1aJE/N0iz10Ds=;
        b=kWfa1cUXIzSB8uEXr1nq/aZsB1nBO0ab6Q7xVP2zJKfCT8uctpjWDaU4bmRzOjP/7w
         1FAWcFh/vBHqozs7x1AuH1yveMCa/B8y9wtdgZ7Ta5sBhmf4TMBsuabjkwOs5U/szZCj
         6dIBM5u/A3q6fo6GD6LtWBrMwKepHUWIgQf6R5zR8Bj0u1DbjLaxkx5aZkE+nyALAvBm
         KSE9gm4DSOctMeRDcNEWNVXfHusnNoPC9E9y2JCi3NvA1DNwlZOg2bpW0RK9pjWlSC8E
         xL/5Oh+lsrFo5MVYVgK+/bMPl7vccUrh1aSk7LbJgdhQbu1rIr1Zx+VgqCTML+/FOeOY
         E7Sw==
X-Forwarded-Encrypted: i=1; AKwUvByUt2/QSQi/pJwL4EN9m+peltX+FtU477WJVKCKYvNnpQiPTRN3f6BxG1pwwuLYkYZAxPEXbwvTi53dE0A=@vger.kernel.org
X-Gm-Message-State: AFuF++k/3XYNF/cS6FrbQjbDJtHxpFqjQtg1y2AHhFcvEw52LpMiknE7
	OPo2ms4AyCF8N8/brHQd/AstnFgmeu+EECeHql4j9h+D5wiLCE1GNpwt
X-Gm-Gg: AYBFou0RCffXj3DN4KC+wMtMZwFxHweoufZFeDaPnUKF7QWKjasogiNGZ2VstE7S/QF
	lxVXK4ozydp5Wr1zoM9WkQjp+ijzZOtIRAEx6KHmBcZlVGw1Aznxh9ku43tx1mJ2oUj1Eh/gLS+
	Z8sawoXhA6m9Kt6x0Kp9DF3Pprn3WrTZID6lbkXv9qj1C5vj6smseZ5nw/pNp7xL2XP0BoE0cLG
	396B/H2GZETT97ODhd96fIoAudmkiPQypF5Tj0opoGJhPkc8CvGgxtjbWU83KrB/mWxJIbPXbqP
	0pgoBzMjwvc2BV+UfS2c1iuZbbYntPiBdB8t+DpZtpIILkfFbBonJScBUQEVEYj+60N78tlZc2x
	F03DZgV9NokliscLyvQlqFjTdA7mhl7b7sLDx/7//Ty5vkgJ03Cqs9THaWxO7kntafUwFtFsj3l
	oHfFkXi3L9cJYhMn6KdqI1lxIEKbuBQFdLSrstFIJchncrB9mN18peyN0kHaPh42YhDu2Jv+75C
	fNZG0PBezqodv1CoG2cjz/j6IXUwWtj0EMwp8m44LQUji3suOzqphW7Wg+5mau9NylrVOaGlKzU
	c+Uh
X-Received: by 2002:a17:903:3205:b0:2d8:f965:7e48 with SMTP id d9443c01a7336-2ddb1ab3990mr103667045ad.1.1789818901377;
        Sat, 19 Sep 2026 04:55:01 -0700 (PDT)
Received: from phui-2.c.googlers.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc15deea0sm9653685ad.0.2026.09.19.04.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 04:55:01 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: marcel@holtmann.org, luiz.dentz@gmail.com
Cc: lee@kernel.org, linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] Bluetooth: MGMT: Fix mesh_tx Use-After-Free and leak in mesh_send()
Date: Sat, 19 Sep 2026 11:55:00 +0000
Message-ID: <178981890089.4001113.207387311305810171@gmail.com>
In-Reply-To: <20260919112517.3871992-1-benquike@gmail.com>
References: <20260919112517.3871992-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please drop this patch, and sorry for the noise.

Two things are wrong with it.

First, the mechanical problem the CI already reported: I based it on
Linus' tree rather than bluetooth-next, so it does not apply.

Second, and more to the point, the use-after-free half of it is no
longer needed. 71af682ba469 ("Bluetooth: mgmt: Dequeue pending
mesh_send_sync entries on cancel") fixed that on 2026-09-15, and fixed
it better than this patch did. It dequeues the pending mesh_send_sync
entry at the point where mesh_tx is freed, which addresses the problem
at its source. What I had done instead was take hci_dev_lock() across
mesh_send_sync() and re-validate mesh_tx against mgmt_mesh_next(), which
only narrows the window for the two callers I happened to look at and
would not help any future path that frees a queued mesh_tx. I should
have checked bluetooth-next before sending.

What does survive is the other half: mesh_tx is leaked when
hci_cmd_sync_queue() fails in mesh_send(), because the cleanup is
guarded by "if (sending)" while that error can only occur when sending
is false. That is still present in bluetooth-next today. I have sent it
separately as a one-hunk patch against the right tree:

  [PATCH] Bluetooth: MGMT: fix mesh_tx leak on hci_cmd_sync_queue() failure
  Message-ID: <20260919115436.3998954-1-benquike@gmail.com>

Hui


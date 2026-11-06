Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793976809;
	b=au4kH122IHO2/Xg0J5JdvuXj+0zXFGo6VOh4GeYt0KZEfEsRNiMj2f2z66QEJgsYLQf2
	 FEFNbUvOP6cdUXkaT4ozS6VGLuywNwvP3/MPo4ArTaM9ITA4QA5Nae/wR2gv0ZkMMxiTj
	 +R7/U4d7CyiScftfVnZ7G0SIx99jvWEndDgTBTyIBYpTdQp0Ywmmet1StsXs3ER6HY05d
	 g8lITQSWDUmda8nO9hAF26Flbnsn82iLzrjP9OER4fgMaoY5BSnLqYAX9n+zLBxRPDw5s
	 t5nUkHlXLfmQ/jVsjd2V8u1SYuIYCjGIRE8jOgrHN2vYG6HfegpnTSWE0wz7+umaikw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793976809;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=GN1ctYdu3EUQe1/lEquYp83ZVHfs5WVqmLcymUKrlys=;
	b=akinAeGEjrohFbxAZF55EJIZv9c/9bW9I23lEJVmL9WCthozLv9p9wnpwzfYZb+UNpx3
	 OYYtbkRbZaZb3oOyVnxV9z1L1ne5T/4jI1sxsjE/2DNMNeOI65qK1BFgxY//Cfe5qJE9e
	 fPYOEItmAMoxeJV3zEHp3Ve+haltvSDbgEx8tGFIZHCQAtn/Ya25e7N6mFarewYYAadx+
	 hPWWiwsyYTLWCdCQIBzywCX9HvRJJSXYi64/Key2qtLDDL5g+xTFegJIerBgBm4FdgSwO
	 t2ZbdpIqVw3bqSV/LgnXyJaQ5D7/2iAiNaqP/cuyHTQxZHRikrq7ry4dwuR/vKfGW+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M0JMncY6;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31354606A330
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:53:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31354606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M0JMncY6
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35829219da8so1841723eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 06:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793976808; x=1794581608; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GN1ctYdu3EUQe1/lEquYp83ZVHfs5WVqmLcymUKrlys=;
        b=M0JMncY6T8XNvj0f/MxqRny1YMMLJseZKz2GUhqxUTztxXyVjGSXoxNERzuk4Js5Yw
         cpnZhQQT/S6gr38IRypreTRFs/3sv0RQBTOTTGksOM7JWmwKYnSPfbSzWup2SlOyKOUO
         BAk2Mlhm+2ME35OmXV3FlXNVaxzBrSOOII4nR80hQI8k1qTxcluq0hJ0U48TgoqFSmyd
         BPLRKQoxO7Xw4SyXB3LSVW20pkVDvRMXWPs8/kZRDyCp2Ea5I1J/vtcde8zFznr710Y3
         72oc9vCrAaBevfdv+MyqVLGDg204fzslE31/l6lMeYo7JHJco1NPv5jZ50AkoftEA5KA
         y9Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793976808; x=1794581608;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GN1ctYdu3EUQe1/lEquYp83ZVHfs5WVqmLcymUKrlys=;
        b=Gm9M37+HXAPCZ+o63ao+dNaUq0vvI4Rm9EV87YjxWc4jHRsKapwk2FXgxbiNUQMXwc
         c4YuOA4ibdy6TNc7Ys+4oj1nn5UwAOt5KM442NJpv95lecSUaEWVM9+NpJhdVY/eqrcY
         R7rS3S5omxP1DLnoDuvslQKc8JXhFyQH5hq4ntt6Vpl7gV1mPB65Ad9XABrYnSmCc51o
         /w+zLfB0k8/v4lLtgFFxE00CeWby+x9GgkE2cqHemkxNeBWkeQNVPVd3AGnWYvW7s4sv
         1flJ2BRSHz5txt8j9Twpm7HnyW2acbuaps7ALbpEawZHkaiAP/DBgpThlryWI2zAE+Iu
         Hj1w==
X-Forwarded-Encrypted: i=1; AL+hErGrar8pLfIr/FqNgRXTpEtI6K7a9gDxbVjNx2zbmeTpshDabjNxIw688qBMcehllkbTjIGz9RFyFNJ6Mf8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NXONqIg+fMUjJ/2Q3sEU5OO2WHw4bsQiG70tBxjtaybbpzQiy
	whscmjSckin8WsuyRk68EG5C/PwIJEnDrxICUd+6IoVQROjPNCsGuEzuJ+4IBkxa
X-Gm-Gg: AYBFou2uT5ybZGiuG4JwYlVV4TYjSkCsrOHx03xA71R+6ckuMyjZ2B84+0VoYsb96nV
	tRAzCIr61eK+lMdVrfvkq0c1Wr3olobirQMHrfUzlIxsjM4wzE1hjvUCYRKLhTOXTIXA0It7Wvz
	mbs25yQfh73ubKq9T8OZCY/Pp0GiKBXb26EBDLKeASf/UDPj9qm7/DjavKP9hnENyRuV2GE//uI
	Y4yddXRzBDZukWGxMTtQQ8crJIiygHqT+6/kTlle5pxh0RLRYVK9/VXOLO4vAqKcKv2I+VDRyAj
	5m+IOGr29ZsKZqxuvQOYsT/e1QYP5rhBsx9U0mg+JtLHGOP3dIIsRY2xuIDMXrFYj/mqmt6yzeo
	MP7SXMOtpcYFWvG03XH8tI+TyCaI2gk4x3DGR7hGQ4cPzxDvy3xMF3oNUo9SaM2IJra5VLPlZ+g
	g7zLDf7vQassAMTNvj3X6duacXSgI+HSCKL4hHHO+K0zM7MYAUI9aThy8z/Z3X9xLb3Q8jZD+PK
	br4l2zSFyzMWLr039p2j/o/YTMAqtDD9LE0q6CGWEBMj7B4F1vLH16IQbh5e8IN0GzSCtd5p1+Y
	kYsBono+ydPngIp0pGIOI8dKH0MHlH4iJ8TsiwlNCwFsKvNnZx3V7yrv22njqE/TyJATo8XW/Ct
	AD5kFr+WhsHwuEuTK4n6zn2vDA2JOZyTA
X-Received: by 2002:a05:7300:8a99:b0:36d:dcdb:70c5 with SMTP id 5a478bee46e88-36de713aa2cmr7899614eec.20.1793976808137;
        Fri, 06 Nov 2026 06:53:28 -0800 (PST)
Received: from fedora-laptop ([120.229.31.43])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9aea75fsm13164532eec.15.2026.11.06.06.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 06:53:26 -0800 (PST)
Date: Fri, 6 Nov 2026 08:53:20 -0600
From: Ming Lei <tom.leiming@gmail.com>
To: socketpair@gmail.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ublk: don't take ublk_ctl_mutex in DEL_DEV
Message-ID: <au3p4G9oppcTSLfd@fedora-laptop>
References: <20261105-ublk-del-gendisk-hang-v1-0-913a91a4314d@gmail.com>
 <20261105-ublk-del-gendisk-hang-v1-2-913a91a4314d@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105-ublk-del-gendisk-hang-v1-2-913a91a4314d@gmail.com>

On Thu, Nov 05, 2026 at 12:25:06AM +0500, Mark Korenberg via B4 Relay wrote:
> From: Mark Korenberg <socketpair@gmail.com>
> 
> ublk_ctrl_del_dev() holds the global ublk_ctl_mutex across
> ublk_remove(). Stopping the device calls del_gendisk(), which syncs the
> filesystem on the disk. If that filesystem is stuck, DEL_DEV never
> returns, and ADD_DEV and DEL_DEV of every other ublk device wait for
> ublk_ctl_mutex behind it, until reboot. This happens with the server
> alive, and also when it dies: the release work then hangs in the same
> del_gendisk() with ub->mutex held, and DEL_DEV sleeps on ub->mutex
> uninterruptibly, holding ublk_ctl_mutex.
> 
> DEL_DEV doesn't need the mutex. ADD_DEV is done with the device when
> DEL_DEV finds it: the device is found by its id only once it is set up,
> since the previous patch. Claiming UB_STATE_DELETED with
> test_and_set_bit() lets only one DEL_DEV remove the device, and the
> device number is freed under ublk_idr_lock on release. The mutex also
> protected unprivileged_ublks_added: make it atomic. ADD_DEV still
> checks and increments it under the mutex, so a decrement without it
> can only lower the count, and the limit holds.
> 
> A second DEL_DEV of the same device used to wait for the first one on
> ublk_ctl_mutex. Now it sees UB_STATE_DELETED and, unless it is
> DEL_DEV_ASYNC, waits interruptibly for the device number to be freed.
> The counter is decremented once the device is removed, so at the limit
> ADD_DEV of an unprivileged device fails with -EACCES instead of waiting
> for the removal, and the limit is never exceeded, even if the removal
> never completes.
> 
> Reproducer: XFS on a ublk loop device with an external log on
> dm-linear; "dmsetup suspend --nolockfs --noflush" the log device, write
> a file and syncfs, SIGKILL the ublk server or not, DEL_DEV the device,
> ADD_DEV another one. Before, ADD_DEV hangs on ublk_ctl_mutex until the
> log device is resumed. After, it completes; only the DEL_DEV of the
> device with the stuck filesystem waits.
> 
> Signed-off-by: Mark Korenberg <socketpair@gmail.com>

Reviewed-by: Ming Lei <tom.leiming@gmail.com>



Thanks,
Ming

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792568941;
	b=SwQk57Sqx6hW9iq5bzMFqD8ACGUsmpGUP29nn91pUSMAClKbwVBE8otFYSMZfHCJ/Ke3
	 W7DLacLvooqpd8dAH/oVr0sJxkZ5J/QRWmK6Ikd+1IZfF2xVP5DFx5tmQy43W+nv1+bDm
	 cSmJ5NEWElyOu0HpkAfWNhBuJCX+YwVg59sqoY07qDObjFtba7gjBT6t4V0iSHES3CNqe
	 aI4sE5O6J5TdObLwDDSqloNH1zA2DLgDYm810iAvXwJgFmIn/zscMK9+grY52r9qwNOuK
	 tf1t7QLdpME/NuklTScdDnt6nHHX6rvJ4G6vKYxHiX3/OVq+oQNvhrOJ+K3u1GFFzOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792568941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=dQaQFQyFMz3WaHz5uSFzXHRyL9HwryG8dy7Xw+d+Rd4=;
	b=jl5NjAnnCcRBkQdn8totlaNwB0bcPBvOfEvpo4QD8UoV73JIMo8sV+hMoN+oTYAS41B7
	 wtStGuEmNINDYWip7VIe31nZN3aM4vwdw6mHKNkM3EytuDJqguSdM3C7I972zmG2cL+xg
	 mJyABGQCBrlx6QUBy0WUJqe2HaKdX8bWTJ0ay61xRBkqvsujk2Gz+OLbe1DpFyqflwWnY
	 TumUH9+rWTf0wiwb3K0rgXX/Si04Cm7f+Ym5XIvU0//rAyEChkn/p6dXx5HLUI8Kqmx2u
	 fOMrK+oU+PAx/4saL95IUp2z7CE2wKv7Vb9wXZSeoVpCejf+CYHUYzDo3u9QR3lu61Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=LQrJ75jR;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15450606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:49:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15450606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=LQrJ75jR
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-487049569b6so228931f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792568939; x=1793173739; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dQaQFQyFMz3WaHz5uSFzXHRyL9HwryG8dy7Xw+d+Rd4=;
        b=LQrJ75jRUyhDNmANUEk7pqQFc984aSgFhSuZ5l7OdiDz/MJFL5Ufj7B9Y2xQnxayyj
         msAZgg8/xzSa8FAgSKwgiGkob/EMEToDD5CAq/P9ZuFchSUQbo97AOUA7ZLHpZY3Wshz
         4iSXggyacwHIAhquzFsRP5ZMKWqdaGccHDlijNqWPIRXDb6T4ZWwITaw6023A0NnIL32
         +yqctfXQXdi7y35zZNBl8k/7OsuXvgOvqJS1xh8FLqWSBX1QRtobFKpUEMkTYFkbiORN
         PVQOeWDmWPp7Nzb3V6SbyfBjQBjgjdSX3VGMz9rX44qQyt2tWEaUyhYcQrpUoIsYyO1Z
         OZww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792568939; x=1793173739;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dQaQFQyFMz3WaHz5uSFzXHRyL9HwryG8dy7Xw+d+Rd4=;
        b=1Z8X4lnThi2Nnaa15MAW14HRyzPadfKuAnwNDa41k506VJE8g/Cjd6SDlJOw8YW8O7
         0TjcyKgwIt/heqDRxRCVFv3jaQG2R2QR1qPbaN4nc65uLbsBNWJ9gORnFlF/63S7f/2x
         xyZitzRpcyKxm8JgWYYZkF22rbmyhqiklCU2n2DzNXaLEF60YupCUszP7pPUQQ2aP4fQ
         DYhfjONEIvTIBCJa2+BMQjA5py5E2LI+Clp88LFNDMYhjS2WI0zqLx3ybRrblbpa1Ayg
         USJ8VQlLqYSQ7EkAkgd+F8wQJftEVJwj53bd5mb4ao0FjX1A5uaEsOqeBnriLxr9UNZH
         p0aA==
X-Forwarded-Encrypted: i=1; AKwUvBy3SIniTBacQ0gIg32lbw17v/oHgSYZSTP94UHo3ia911weaAScrrjMuloXuUibHGHbD83cXEBo57MIiUA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLjWa4oChESx4kvEv79cbBtJkoV2Qw1R7+cO6vSN4dQETX3iagW
	5VI5NKSh2zQYTgyVpILiwG7+bHrNu/a47Rk1pvKk4wYYEGeo3JHlByPjuSiTW2L4aA8=
X-Gm-Gg: AYBFou3p0HwMe9P2Db7hS8YD3JO1eYQYBckzPS1stC88Wb2wl0Uf2JYHdV38ldxAen0
	0aGJcv+jk90pZQIcLBlOSTPB9rGs3GEDreiB8dWFb3Py5vHaKyoDvIBRoxCjw4gKQ7HIquCaxjA
	PNPtU4Est0451dUOLy7Y+mP1ACA+oiyhYwdchBWY9+gjiPXLFsRKn712gghQHmaHrr9B0kgfn1n
	Mw1V5jsUFiNh7LwjKZK0EA1p/dtV4VBvLxBCPxJh1njNj26QrrtCoZHUxreWeOmd4ALO62kzR2Q
	9cbV0JmGeb86bNTlEhlRJbRiF5Bvj+bwcAF2KshCmuMcj4okFwhzbTOejft3/RZRy20nJc9k7zA
	rCMAvv+iUYQO9sUHyVN4rGP1J2mL+UFj4Njdhto1HG242Xsout5ExAA9e1a5AGEwM0ZJS25mryc
	bUUy87mODgBzWxyUyZW/AG9qANGPM2pz+BAZyROBtZbqi+rDSby1I3zoWocNDwRScM0gkDezkZj
	qp6oxjMiSpEnGTfgnP7X//LnJ54A3/g1OXHu4DEgoQX8SzlKX9XI3Wc7jwPPFKTZyRbYTxVxOUL
	3KlEvqjTe5UaYiniMg==
X-Received: by 2002:a05:6000:12ce:b0:487:13f:f612 with SMTP id ffacd0b85a97d-48e264d2161mr1566794f8f.37.1792568939419;
        Wed, 21 Oct 2026 00:48:59 -0700 (PDT)
Received: from ?IPV6:2a02:3033:701:244:19c9:79b9:fe6b:6f9? ([2a02:3033:701:244:19c9:79b9:fe6b:6f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2581f412sm3923306f8f.16.2026.10.21.00.48.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 00:48:58 -0700 (PDT)
Message-ID: <85cde6cc-fdea-4bdd-8575-7e9d50c8781a@suse.com>
Date: Wed, 21 Oct 2026 09:48:56 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb-storage: option_ms: bound probe-time bulk transfers
To: Greg KH <gregkh@linuxfoundation.org>, Lee Yongjun <jun85566@gmail.com>
Cc: stern@rowland.harvard.edu, digidietze@draisberghof.de,
 xiehongyu1@kylinos.cn, linux-usb@vger.kernel.org,
 usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org,
 syzkaller-bugs@googlegroups.com,
 syzbot+7317196294d50d6e55c3@syzkaller.appspotmail.com
References: <20261013132033.4352-1-jun85566@gmail.com>
 <2026101310-crier-december-be03@gregkh>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <2026101310-crier-december-be03@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13.10.26 18:18, Greg KH wrote:
> On Tue, Oct 13, 2026 at 10:20:33PM +0900, Lee Yongjun wrote:
>> The Option device initialization path issues bulk transfers
>> without a timeout. If a device does not complete a transfer,
>> the USB hub worker can remain blocked while holding the device
>> mutex, causing usb_device_read() to hang.
> 
> So a broken device?
On a generic note, the SCSI layer is ready to deal with broken devices.
In consequence, so have SCSI LLDs. We cannot hold a lock that will stall
the SCSI layer in error handling indefinitely.

	Regards
		Oliver


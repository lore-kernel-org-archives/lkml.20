Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794190256;
	b=FJhBt0qt2j4qKMyw48M0uXrMZmIrHPhFNLSRY8G6l0pnza9dP5CDdGtTtfsFDmxl8LbT
	 +e5s+nyuCxdkbVmXL6NvaZca1gZwI8MJWlvWbyAztIkfEqCMXJCD/kjLE5fO3H7YZh7eG
	 9sKr5L5JOZyZ7gCYMqCyxGhld1yh7itAcobSrqTw4LsBMVvGrkbAiG1nm8c/F3EYmjR9N
	 S18+i+takZ+HsILt2fucIGWvMuodfBIWvmN+FeQefoqzyGKfbMB/lKhn1S0OzxT9moMIv
	 h8pM5RPlH2TJUYCe2rtYRFLkrWd3DuIDiGZ7eUXqUy6BETTvWPuedub8CaRWTKlBJog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794190256;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=fr4oHlRGypzWA8ygCEHVFzZC4J10YvJK1tg2b4hPWXQ=;
	b=EuXL1ScMd7URN/Yj2EKwn+9Pb422UkKVryyOhoGszUHb0r5NrL23ryCeAij96yHy2/X2
	 GC5Nin+cZaOlaTuG99c40LT1pHr2q7Jltio/fYFS7tePzTX/85VkShcFdJ19463NqCjfA
	 wxzop+mSnv67cBhZwDddcYezb7YFE7MSBzO2hR848TuLvTIIrhqk3y+WnxpGY+4spfE/S
	 /yux2jFk/hudvnHqCvKmkMQoOew5zuVWA7LlPdhWhVeSwNHEcL3TA082YYQh/DLfb2I6E
	 KCzcWBHHpM/oSWaIEUMxNk06z4jYW3LSBgtghJvq3+9pyd4FizyHIsJTBnIaIyG3JEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=qFM5h12i;
	arc=none smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFB8606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 02:10:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AFB8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=qFM5h12i
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-53512cd2f85so4130441cf.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 18:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794190255; x=1794795055; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fr4oHlRGypzWA8ygCEHVFzZC4J10YvJK1tg2b4hPWXQ=;
        b=qFM5h12iA2QiRGNmQcKbd9pY9WjI6kV6vewDrd45WU5jikIbsXswyd0g0PxHbrvgGl
         XNn6Jslh+6efi4qKP4YrsRxmqoOamtRr9rAdgcXiaoy7yViUVlb0rAAN6iagLwNKFji+
         j0ivDj2Kt4/OGoYv4vwd9NLsRwCZo76dDSfWSdzTCCmmXDfFj90W7jBrDQzTIX+FXFDq
         bbIXn/1KsqrvqkJ/7p6ecnoOPAFaaVncx/Rbuu+SlZe0/DT+lry2EmvtgojmUgB+Ympl
         eifFP0UNg2bfgciOI1scf2hVYKai5PkhDXHnOD2ttXIDPQ90RCqvrHeB9gzDnLODPoVw
         rwdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794190255; x=1794795055;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fr4oHlRGypzWA8ygCEHVFzZC4J10YvJK1tg2b4hPWXQ=;
        b=JaxwbWhL+RBIARJJuIuQaW2s4HMPGl/JfNxrJETO1qdeDo9FmgphySRmDS2F8zs5En
         diuQ3NHX1SDC3lYLtN14bGDwDvMGKCZQBfSR+OQOn+F09+DO0Pz9nLAVH5tOTUUpKTo9
         mcQNrgHuc60QR3WqNRfpmewgMfJBQJIj5YnMhGriojHrsc/K5LuVct/UwbE31r2DEBO3
         eVCY7tGCQ4+RU1u58+GBsMIOOl67qvkik2OTJNv+HgAOmIPrMPbsPjnwGzkdH7Sd6rV+
         TxiZD5tfGHDXrPTkFcByhoHU4sagARDiCtcggLlNRJPh66bJXPEG/GoQZpXJaauQRMMT
         Gn7A==
X-Forwarded-Encrypted: i=1; AL+hErGsQXrkO+Al+xZN66V0XmGRpbYxEC/pDF0z9TY2QvassB7r2z5yRSpB3gBYt97gkJ0hunjumhVC50cs8Cs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8n28+Yg2WKmZVwIVI8O7jt6kxNKuBxskFfWdSI37uiS9SEl9UY
	ETCRiDY0TSW4BAXWEa73MNzaYldbLCBu8G3fvrFb+O/TNAxRKNxCjG+iyfPDdlV+kQ==
X-Gm-Gg: AYBFou392rDZq49/3wUqyy3IN/gz+5eDkqFO9ystxZ1WOXw6IMY/bOXsjznfW/7fkmO
	Ie0XVjQHMMS7JChvoBHVHar+QMHHommNDgXXtymk7F09EYClX5pHhDc8Phi5Z0UxL2tH07zuGva
	uARKq9GjCtmI+SS4xQapwNMlk13+h5kdP+Pka6CqrI5QUEi2NZsNA9l9KFt8fws+U5MT2lAzaCa
	8Hhd5RhwyY6tBG8romFp0shXD6oFbEtmqMSLZcGyK8rXK0KDIgr7OHoRJEXY8NSi9JdW42x9HRS
	lMktI1aSee0fNpg7tZQ14wzBetz2pAq7xZbKTmvqXPN5f/dEBOuZbc/bk5bcTC2iMlX5QArsF7T
	xbf/udwlRy+9PGWBYtQJn3GgkjeSdc5dhjohEOzp46umWOqOxI/0gWoNIaYyaE7JTwkRpAJLCaU
	pKLJYKLIXPkFEUC4DT42KVV6g9nZX+Nj/EZ01AYWM0yljaehxMv1yDilHuHedkSMNM5eGk3dp74
	QTe8SsknIcrV2BGA0xuMDgCp8gtp4J5bTfJ6f5mU6Lkrnz5Az4F/UexkU8gJislz36sUfOLxePx
	Fc7l+cvuJGaXdga4rokiylayLw0i
X-Received: by 2002:a05:622a:587:b0:54f:856e:6793 with SMTP id d75a77b69052e-552a578ba94mr43781591cf.70.1794190255024;
        Sun, 08 Nov 2026 18:10:55 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55264b242b7sm29792751cf.28.2026.11.08.18.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 18:10:53 -0800 (PST)
Date: Sun, 8 Nov 2026 21:10:50 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Shuai Liu <847807867@qq.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org,
	syzbot+30552b4cbe99d6d91306@syzkaller.appspotmail.com
Subject: Re: [usb-storage] [PATCH v2] usb: storage: don't hold dev_mutex
 across the max_lun control transfer
Message-ID: <2957b6ab-f1ea-4d1a-9124-7ebeba7ed617@rowland.harvard.edu>
References: <tencent_5A9A9E45415EADE916B7558C66A2C4DD4F05@qq.com>
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
In-Reply-To: <tencent_5A9A9E45415EADE916B7558C66A2C4DD4F05@qq.com>

On Mon, Nov 09, 2026 at 07:53:07AM +0800, 'Shuai Liu' via USB Mass Storage on Linux wrote:
> usb_stor_scan_dwork() acquires us->dev_mutex and then calls
> usb_stor_Bulk_max_lun(), which issues a synchronous GET_MAX_LUN control
> transfer (10s timeout).  The reset and suspend callbacks
> (usb_stor_pre_reset / usb_stor_suspend) also acquire us->dev_mutex, but
> they run while the USB core already holds the device lock
> (udev->dev.mutex) during usb_reset_device() or disconnect.  This
> creates an AB-BA deadlock:
> 
>   scan work           reset/disconnect
>   ---------           ----------------
>   mutex_lock(dev_mutex)
>                       device_lock(udev)      [USB core]
>   control transfer  -- blocks waiting for
>                         the device lock

You lost me.  Exactly where does usb_stor_scan_dwork() or 
usb_stor_Bulk_max_lun() try to lock udev?  Taking that lock while 
holding us->dev_mutex certainly would be a violation of the locking 
order used by the rest of the driver.

>                       mutex_lock(dev_mutex)  [pre_reset]
>                         -- blocks forever
> 
> syzbot reports this as a task hung in usb_stor_scan_dwork(), with
> cancel_delayed_work_sync() in quiesce_and_remove_host() unable to make
> progress.

Are you certain this diagnosis is correct?  I can imagine the task being 
hung inside the mutex_lock(&us->dev_mutex) call, but that's not what you 
are claiming.

Alan Stern

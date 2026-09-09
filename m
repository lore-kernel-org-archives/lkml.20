Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00B256E06C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 16:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788973173; cv=none; b=j8Hmlb4KE2KLBoXlmY8ROKa8z6Jwh5UqONTT0sIgI3N7Zn57q34jjljhauobOVugWyUeadYBRxg7sejxtdde2At0Bg9TPI9b4n9gzO0AcmKcbDdYc6kd5Ecp++wGQ3rT5xKf58D1HgugVsMfGyF52H42oX9UPPigFzAz9ZPbH0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788973173; c=relaxed/simple;
	bh=rj4viG58U0ANXfxVZ4RrFE31NhkHdx71+5e/Am26pAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QTFF56AgXU4JP8wkJ1JhMLg/ONhkoHp5WR1VEfI6sQZ12HjBjMV+t4RAfw44QH7maiwiNpW3SnFjY1cLEdWjtkvpaSiE30vPGG1u4K3Li71efK7cIAYde6Bl+PERDFPtK+Az1vAOO0Ztx/TKb/yVoywlW3a+GwJ3O5u2RoL5+Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=IoqfmLSC; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="IoqfmLSC"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-9399daa3c8eso323960785a.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 09:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1788973170; x=1789577970; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+EHbIY/Ywlf9FLSv7Ev5/Wuo8w+C3q1oqLdJpQ1+dBE=;
        b=IoqfmLSCrKzaQx2KEcRp+7kaSip7eT8piOdMAYiSukd0UhkDytgNfhU9mZKmqVpBlO
         PCgIfWPJtCAW9PqnrFrzUD4qfx0qs5HXjSF8fiSNzH9vRAPNbqgWBFAK+g2DNoaWiYsd
         czVqe0y/0rSWJhdjNMrCB0bcFDEk/UGoO+278hPsZE//dfSSKAOaZxI6MymrtHY59siT
         i6g89Sop2Js0pZTLxFSDCyLNrveWhAh2YTvSuff1xs3acKbQqSYyqMa4W5PcLJQvVfLO
         mWt5YssOgowsPS4X3+rs7v+Xaghy+XaLm+qM6/icTDRLowK8BcjgL3S5GxzDYaAaNrnp
         PpOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788973170; x=1789577970;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+EHbIY/Ywlf9FLSv7Ev5/Wuo8w+C3q1oqLdJpQ1+dBE=;
        b=DTwhk6dFEG1JxYiff7upNgOov/u9jhe/Gx0I7I+euxnmm36d8WoN4L/VUZNQ8k2w3B
         n5oO6O7s9sR2i1a/IWC2Zf0mU3BiwkvpLo4Y3XNPK0MLkNSZgEtZYcxVuleDJMdXbTRC
         JKmMll3exdvRGe/r9xN9I0uJuwz0nY2AKeAvfUN3a8VcrDfjS8cSDiXmAcn+6LqB1fGM
         2jTUmoVKct2ISHMBazowYWQLSLiTPe7KAgUxSHXrbNz4l4MZGRXr9OGUgxTneWMjbrSB
         qMVDFa2iBC+cQC9ngJjmOu+0UCUhijdlEzo0haf4FGDeMrqCkOntz2/RO8K0l2cHlPjv
         +gqg==
X-Forwarded-Encrypted: i=1; AKwUvByvE/JKieE4A1y9DEZ6vjoqYyGQhrRKorFJYoSdVSmg/BP41euyBSZscdKH4Adps+fmfWk8+/tz3vVc28s=@vger.kernel.org
X-Gm-Message-State: AFuF++lOZU58wtqp4Gzf/EwLCdwCqPnNK5iSedOoW8j8DYqOWuEeTxdb
	1cz1JWths/QlW7fHkAFrHTJSYGqysFYxqaEr5tmUcFF08+kDLJrR9mjYgo5nYQCE5g==
X-Gm-Gg: AYBFou3qYWImjH323t+1Zyjb6wagC+ldT0SWkFkjNre7kW43kDdSspZ2lbLdl13mC1w
	aRfMvWKGvSUC1hEHEzjzXA0Zr7MbvnqmM26Dg11mx1Gnwku72i+QKd2xwSo8pp14TpXCcBMdwbh
	K8vKUHt4UBlUisK/8/DFsgvO0haPwNCN77fEq305xosBrMFia3ig5QKHdfW9Pkv2hZCT2mTzhKo
	n+q3u/gEdL1Msc5Qh4kUergCeIGy9wh+JktNie/8zjLJP3AyNvLYsZatarTTE6U9wmIBHByoKga
	LP8WCpaqEgg7YmgbC0jrT46MTt6eRrONfzQfyii/zJczOGX5CNtgFNnRTslxJ5JmOGa0DX0Wf//
	zaXr0ckFTG/OnnuTVX2c07+rYdLxMsmDith9r6cjWN1Wo4oFp7UyglcLmRpZe4yvPldq8fDMIGv
	pTkGHn8jLzwTvxOuANa+LFdHeGcmyM/N/7vf2JNfbH+QtlLO4Uqoc4ufw1C0B5J0Iwt8SK+SvWW
	ENYd+JKN0gkubTKFrhSBTFrne2AmiYZzTcBDqewhLM=
X-Received: by 2002:a05:620a:4721:b0:939:a003:7127 with SMTP id af79cd13be357-939a0037342mr2809210285a.52.1788973170370;
        Wed, 09 Sep 2026 09:59:30 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9399cf10c7dsm1027567985a.15.2026.09.09.09.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 09:59:25 -0700 (PDT)
Date: Wed, 9 Sep 2026 12:59:23 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org,
	syzbot+356ae236154297f0d60d@syzkaller.appspotmail.com
Subject: Re: [PATCH] usb: storage: ene_ub6250: set transport_reset to avoid
 NULL deref
Message-ID: <f97797b6-52ff-4c40-80b8-eb9c6bc42228@rowland.harvard.edu>
References: <20260909162710.28740-1-ngocthang2710.1999@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909162710.28740-1-ngocthang2710.1999@gmail.com>

On Wed, Sep 09, 2026 at 11:27:10PM +0700, Nguyen Ngoc Thang wrote:
> ene_ub6250_probe() sets us->transport but never sets
> us->transport_reset. get_transport() only fills in transport_reset
> for the standard USB_PR_CB/CBI/BULK protocols; since this driver
> matches on VID/PID alone, a device can report any bInterfaceProtocol
> value and still bind, leaving transport_reset NULL.
> 
> When the transport then reports an error, usb_stor_invoke_transport()
> calls us->transport_reset(us) in its Handle_Errors path, dereferencing
> a NULL function pointer:
> 
>   BUG: kernel NULL pointer dereference, address: 0000000000000000
>   RIP: 0010:0x0
>   Call Trace:
>    usb_stor_invoke_transport+0x55a/0x1a40 drivers/usb/storage/transport.c:926
>    usb_stor_control_thread+0x44c/0x8f0 drivers/usb/storage/usb.c:462
>    kthread+0x38b/0x480 kernel/kthread.c:436
> 
> Set transport_reset to usb_stor_Bulk_reset, matching the same pattern
> already used by the other subdrivers with a custom transport function
> (alauda, datafab, jumpshot, karma).
> 
> Reported-by: syzbot+356ae236154297f0d60d@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=356ae236154297f0d60d
> Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
> ---

Is there any reason to think that usb_stor_Bulk_reset is appropriate for 
the ene_ub6250?

Probably a better solution would be either to make usb_stor_probe2() 
check that us->transport_reset isn't NULL, or even better, make 
scsiglue.c:device_reset() fail immediately if us->transport_reset is 
NULL.  Either one of these would work if some other subdriver forgets to 
set transport_reset.

Alan Stern

>  drivers/usb/storage/ene_ub6250.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/storage/ene_ub6250.c b/drivers/usb/storage/ene_ub6250.c
> index ed49a3bc859c..3137c2cdd021 100644
> --- a/drivers/usb/storage/ene_ub6250.c
> +++ b/drivers/usb/storage/ene_ub6250.c
> @@ -2350,6 +2350,8 @@ static int ene_ub6250_probe(struct usb_interface *intf,
> 
>  	us->transport_name = "ene_ub6250";
>  	us->transport = ene_transport;
> +	/* get_transport() only sets this for the standard USB_PR_* protocols */
> +	us->transport_reset = usb_stor_Bulk_reset;
>  	us->max_lun = 0;
> 
>  	result = usb_stor_probe2(us);
> --
> 2.43.0
> 

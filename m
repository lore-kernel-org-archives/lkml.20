Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794821258;
	b=JKAsVLzGarLWZQp2dMAzoNzsdx+Jr7BWqnWD0x16302wCc0Ot4FrwqKDDWBBD2A/8N/d
	 V5h3TiGAiTjJcoDTMBlUXiFXgs9nyrHG53qrPRHGAyaZHmOpzwHFsRCphuBvuUaK+32ps
	 GiZzSt6OLXe1TlkPhcrRhdI4Bk6CyqH7W9mLhC65sE6+KO73eMmyTHpXzm4HrErNcirfM
	 bcHSeG5CDH3mXSdA5JANUBpAyabECjMx5LL9HqDeQDlZ20iFJG2kZ3SEXhwdSALs3+NpG
	 8uJrFmQ/TSWh5PrzAuotZGQL+ADgbYR9TPlXn1FMZOXWzdeFnMy5mNgFq7iYBSm5p1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794821258;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:In-Reply-To:References:Date:
	 Message-ID:MIME-Version:Content-Type;
	bh=UeghsTiOb4ju5n7zGZ1nHsTM034u6BwVxNZLSRJoYfw=;
	b=A0h/m2JccQ5jGnm3efaC9xeNB2aYv2VBQjOnjzTh+MqVSPIwJOtcpvOTTvbT6Xk95bXR
	 8ZD2bUDtI6AdQaW4a0kvn8wyqGKAyx6e1dU5vHmEDwMA0fuueQJ9Hef3kIyfHg8iogM9t
	 /XtIM0LOsIfjwvTS/y8b8u4EzS391SjR+ET/RBQLOWHG/H0kFBwDXH2kEnME3Eia9YoSK
	 4v+eW8lf23yOcYIAKbhiesybZNxu/Q+39WOBcdSbwPxlKD5R8ItJWol7y+8xJsd7sraD0
	 TESLfRyz6ACkgvHfOsWxATmkcE8aVwahM1db3JdGD1BMNvMO2nl8Q/H/bIElc5BOmxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=O8yOG7EC;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=gUQBxTOl;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF37606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:27:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEF37606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=O8yOG7EC;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=gUQBxTOl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794821256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UeghsTiOb4ju5n7zGZ1nHsTM034u6BwVxNZLSRJoYfw=;
	b=O8yOG7ECcm43MInd7H6L/X28k91eZ2Rd3+TGYWtLGMufYSscasJ7HrvM5gEEtfbQ5mDBH7
	uW7S+SG8Vc3T2cB75fu/m8+qpwQOLEsxNSHE3m3hsqXNoO3R8YAgzSvpwfvcDCYZGIiAgn
	/4aiUiZ4S71FmbYBdzaGVtSCbsXto0Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-53-io0_XLsLMpetumjAo19PSw-1; Mon, 16 Nov 2026 04:27:35 -0500
X-MC-Unique: io0_XLsLMpetumjAo19PSw-1
X-Mimecast-MFC-AGG-ID: io0_XLsLMpetumjAo19PSw_1794821254
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a027f2e364so17740425e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794821254; x=1795426054; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UeghsTiOb4ju5n7zGZ1nHsTM034u6BwVxNZLSRJoYfw=;
        b=gUQBxTOlnC4aQ3VYPs0pVlyUmuu3kQ65PXcf1W+9ViOs/qud/6VXHF9OGdwYZkjvZm
         i/xaLmh6+dq8fMBWMbSojHwizHXfOy6kVwU6x7c4DbHZ1fENHD9iajdHBy+U0Q9U/gjR
         HGQB9Uj7nH3r6SbnDgFTuFrtDG/9qki6DMF0mv0ucphsgAA9A0H8SVZM29bVRp6IMJaf
         26FqdShpHt/0xZAd6lOdstdUhfhO5/m59wYRxfgzfdpCX59kx6oiDGV6RencYYev9saO
         HxYBJqiD7fQ4kAd7+wXEHlqaoOPnV6SH3enqdnmkrz+KSRvvV46zhqL1msQ4iIr36AZk
         9B1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794821254; x=1795426054;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UeghsTiOb4ju5n7zGZ1nHsTM034u6BwVxNZLSRJoYfw=;
        b=Uhe2wFrbutveo5Cxf3PPyUb6Ibz9GWpCz2NMV+pQLK69EEJ9WBwfIW+ocSOhqM2fBg
         0oz9/eIslIupiQQxbRlBizzRs9Ku8ILadz7FQHu4gaHT3dpvzf2sJF5B5sH0+qEBuq1x
         9UTzD739hnBhMuHuAKM6sITO1RmOLvt+CIAdqGpFMbX0mMofIEGydUB4GGQSNx2nVH4j
         2TBPeaSJpTFr37OgaBUs7pyiWeGO5bkRdU6rZe7Iy7K6CdErCnfErvJMEF3waO6+t6rN
         81mxOMGcB2WaLd4FD1zkc5hGZWcGbYFW5ah9BuXRQlh1CF8icxrXuGwkXdfqdJv91fzh
         //wA==
X-Forwarded-Encrypted: i=1; AL+hErEtqQlU5V80EaoW2S0gQCx0WajuAOggdQO2uLrxdWF96UBao0Hx00fU18C6gHveR+jah2YGY27b0aEyg38=@vger.kernel.org
X-Gm-Message-State: APuU4Z/l5/0i/zTdePiJh4+1oBHc2rDWHlLvwF9P/JmGe8KoNjaTcK2D
	vdEFHhRtUam1FwjtO28LI6EYdw2f/FyCsHPB4jAatr43ke8CfE54YIEoS97mpYuUv5MzVrcV2Qb
	fkbYreRqmpvgORtlcSoDwPy2RzzAeDPyWTDRVcOjbj5VptH5vVejwuQ2YUVp37gCymw==
X-Gm-Gg: AYBFou0svNCjFfXBIffz/K/XnDINQogEdBBnUJRB4MH+oLMXyrFetTTfhNsZwJVgdP2
	yZC6dTv2HLAS+ciOxTsQTOQHT0p265m2417OEvtI9yNHzS4huFysjp3j0B3cXX/gJIkgHaDosfw
	4b0yCI4JRWJfDJ/TPL2i+pL3hG1f5qsJIctm/9AguQwHGOW5QtTfh9EamUhef7o53EFaJSSmol8
	Lwun36etQehl2BaBvNxase4oajpFkbwURYMfcMCMsJGbjue5jTeOQs704RdGNCcs7BtEexVhC0f
	Zd++i4lMBlJRseanObDBYjFE+bqLc93TbI72CiiZE7AZtyIGGQfjz9fmpDeIepMopLNqaJxAjAF
	CvOJsx+39bdCQRUoOe1PiOQQVgE9Bkb9EuAtdt5DRAghUxcP7JJ9a6BNkN1qhgFHJbfs+7yo+MR
	Jw9PJjUOp54KnzYgItZ4mIzvD5ZvKroYmoLhd1e9o=
X-Received: by 2002:a05:600c:3114:b0:4a2:167a:c939 with SMTP id 5b1f17b1804b1-4bb55a5de41mr207753985e9.21.1794821253831;
        Mon, 16 Nov 2026 01:27:33 -0800 (PST)
X-Received: by 2002:a05:600c:3114:b0:4a2:167a:c939 with SMTP id 5b1f17b1804b1-4bb55a5de41mr207753235e9.21.1794821253228;
        Mon, 16 Nov 2026 01:27:33 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb52bab8bbsm280128335e9.13.2026.11.16.01.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:27:32 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: "Mario Limonciello (AMD)" <superm1@kernel.org>, Maxime Ripard
 <mripard@kernel.org>, Alex Deucher <alexander.deucher@amd.com>, Jani
 Nikula <jani.nikula@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Harry Wentland <harry.wentland@amd.com>, Leo Li
 <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>
Cc: Mario Limonciello <superm1@kernel.org>, Xaver Hugl
 <xaver.hugl@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Mario Limonciello
 <mario.limonciello@amd.com>
Subject: Re: [PATCH v11 07/12] drm/panel: add connector luminance forwarding
In-Reply-To: <20261103-superm1-backlight-property-v11-7-00cce7b2ba22@kernel.org>
References: <20261103-superm1-backlight-property-v11-0-00cce7b2ba22@kernel.org>
 <20261103-superm1-backlight-property-v11-7-00cce7b2ba22@kernel.org>
Date: Mon, 16 Nov 2026 10:27:31 +0100
Message-ID: <xlv1qzglrurg.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

"Mario Limonciello (AMD)" <superm1@kernel.org> writes:

> From: Mario Limonciello <mario.limonciello@amd.com>
>
> Add helpers that expose a panel backlight through the connector
> LUMINANCE property and forward connector updates to the backlight
> backend.
>
> Hook the helpers into panel bridges that create their own connector.
> Panels consumed directly, or by a panel bridge attached with
> DRM_BRIDGE_ATTACH_NO_CONNECTOR, remain unchanged. Turning the backlight
> on and off is left to drm_panel_enable() and drm_panel_disable(), which
> already honour self refresh.
>
> The panel backlight remains the hardware backend and keeps its
> /sys/class/backlight device, which is owned by the backlight driver.
>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


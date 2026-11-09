Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=103.117.158.91
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794255373;
	b=POrS7dP2tyz6/X1tWi0MHsFuz1zWR+N8t8FHOBBhr2T7DMokjf73udrBuEo/0xUm2frY
	 MiEeIeirNIbjFA8AHhM81LwnseBxC5aMa0YXq6TDoLMVZPT1TwUjbouO7+Gtr0dDyyXl1
	 9LSBNguXXbbw5+j/g/MRMiwX5pcTI2OHDXxTgs3fo9mMWEauevwfy9VApzWh4ERco75t5
	 jKr0RpbpmCuo8AIbPc0FzgysqH11YHi6Ckvx+qgE8L8dHB27k93z+ZDkwunCTrGEaOr+f
	 zFvarKkh7GtLyxKfevlyWWdzMRjOLbg1cN83SpyqDk+//yJGfPNu5KRB2XQKWEYHddQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794255373;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ZohoMailClient;
	bh=NiNGA3mEEis6nXV+E7BAIEjBtF0Ivfk/UEX6Eg2U/Zo=;
	b=fBbJg7nW6KCWi+DCJc/U4FfUN3nBzh9mTTHHOAG42BxKoflR5WeyQQVcGkRnORJkbNdT
	 zJIvATY/0sjLwYj7pABNPkHzjXZ90IHA28dbQwt5a5E1z8TEo8BCtmy/+KAbgZnb3+sJ+
	 Kpv4CjUuZCADVuhn/Ist8k/x8AVMRzx4jni1g/Iryl491tKi8MarIXhoGyPmn+SPr4zwi
	 Cp2FKamakm2Mzcv7VZowBRUfyUlEizCUYD8NY+fBwJXbebJA6gmwau+94Hv1L3OEik1gi
	 GtVuh+WOgflNDIwdyQKZoH3xfzf6/eTpjosf5POobN4YyTyIuuPCI7en9lTyvY/XMqQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zohomail.in;
	spf=pass smtp.mailfrom=zohomail.in;
	dkim=pass header.d=zohomail.in header.i=@zohomail.in header.a=rsa-sha256 header.s=zoho header.b=Rwtmn6Ow;
	arc=pass header.oldest-pass=0 smtp.remote-ip=103.117.158.91
Received: from sender-pp-o91.zoho.in (sender-pp-o91.zoho.in [103.117.158.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6E1606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 20:16:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E6E1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=zohomail.in header.i=@zohomail.in header.a=rsa-sha256 header.s=zoho header.b=Rwtmn6Ow
ARC-Seal: i=1; a=rsa-sha256; t=1794255338; cv=none; 
	d=zohomail.in; s=zohoarc; 
	b=erZCLL66+1fQWRpIBiKg7j2TY+gkw0XD9MSe3JsdLfzxr3QrarZlJxkbEExc7Gx4NHRhYJ8tvkucNf1feY22oo+QhL/WuTc8AZF1U+dizXT6YdrccE6nAy/44tt1B5YOiDp+apVnJg2tvzQ6p7mWj0ow3sW7O8YoHS0E1v8LMLA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in; s=zohoarc; 
	t=1794255338; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=NiNGA3mEEis6nXV+E7BAIEjBtF0Ivfk/UEX6Eg2U/Zo=; 
	b=MNLBKj+29IHllT8rF0ru1Yj3gzXURUaFibyJCUEZ8dXEBORGGIL95Y7GYvlcLqKKeNIse7Yky7gp0Mxsyi0C6yFOAnZmXSsuhrI3a4FNTmdu+Ki77XMAKYTadLLYYOmkK706CTjcC7rWYcjjVyW/lqSlBnQDHZ8gmQazjHEr/Dk=
ARC-Authentication-Results: i=1; mx.zohomail.in;
	dkim=pass  header.i=zohomail.in;
	spf=pass  smtp.mailfrom=shivamkalra98@zohomail.in;
	dmarc=pass header.from=<shivamkalra98@zohomail.in>
DKIM-Signature: a=rsa-sha256; b=Rwtmn6OwsUENniwoHLto46EAP445ByULk+e8+bpaVkbyd6d6LRJvz8Xc5ZJcoNHc5PoqZuJj/ZOVP9BWtinIgWs5Afr2JeVUvDSJGW/r0/YOMCiEgv46MBQa1sefpkaXaUJg63rwLtyUqSVnpYOCHotLVmvjxI9HpcLlRNEJ/u4=; c=relaxed/relaxed; s=zoho; d=zohomail.in; v=1; bh=NiNGA3mEEis6nXV+E7BAIEjBtF0Ivfk/UEX6Eg2U/Zo=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.in with SMTPS id 1794255336648577.8557176644065;
	Tue, 10 Nov 2026 01:45:36 +0530 (IST)
Message-ID: <2caf9f85-8d5d-482a-8479-dd682cbf96fa@zohomail.in>
Date: Tue, 10 Nov 2026 01:45:35 +0530
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
Subject: Re: [PATCH] drm/amd/display: use atomic commit for panel power
 savings
To: Alex Hung <alex.hung@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, David Weber <weber.aulendorf@gmail.com>,
 Wayne Lin <Wayne.Lin@amd.com>
References: <20261031-abm-sysfs-atomic-v1-1-a99068f3b49c@zohomail.in>
 <7aec0ed4-1a4d-446b-8971-580770e3de09@amd.com>
Content-Language: en-US
From: Shivam Kalra <shivamkalra98@zohomail.in>
In-Reply-To: <7aec0ed4-1a4d-446b-8971-580770e3de09@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 06/11/26 03:15, Alex Hung wrote:
> 
> 
> On 10/30/26 15:58, Shivam Kalra via B4 Relay wrote:
> 
> Hi Shivam,
> 
> Thanks for the patch. Moving this to an atomic commit is the right direction, but as it stands every write still ends in a full modeset.
> 
> In amdgpu_dm_atomic_check(), any abm_level difference between the old and new connector state sets new_crtc_state->connectors_changed = true. That makes drm_atomic_crtc_needs_modeset() true, and commit_tail skips the abm_changed / stream_update.abm_level fast path. Users would see a blank/flicker on the eDP panel on every power-profile change.
> 
> Could you try keeping drm_atomic_get_crtc_state() and setting connectors_changed only for scaling? ABM would then go through the existing stream update with no modeset, like David's [PATCH 2/2] drm/amd/display: Avoid modeset for ABM changes - https://lore.kernel.org/amd-gfx/20260813112634.11455-3-weber.aulendorf@gmail.com/
> 
> Please run IGT amd_abm, including abm_gradual, before v2.
> 
> Also see inline comments.
> 
Thanks for review! I will send out v2 shortly.


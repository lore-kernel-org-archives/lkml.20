Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40F626F2BF;
	Tue,  1 Sep 2026 09:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788254430; cv=none; b=BfgKOLXOLLPQIL8wd735uHsBNuG1ChTvIM/k2Ho7fv+rBRnRjP3+ajev3bXAiEaLS6bUk3DsTNirGmw6ZOAUpusjOWi70aKXuPpEZZ5joL82Pg8EPeQHdupzYiiMUTzzWpGTuC+sjqn4SdeVUjv/6BQxh8zKZdzMs2T2maT7pho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788254430; c=relaxed/simple;
	bh=kRbjYsStCjSOwPN19KTZh2cgnlxc5zJT7KfIbesvvpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m+UQ8yQUlUs9LlrWp7gLpWe7mSGy8D9kVDVWNsJpqbx89mmZwUZnn0sTDyInv3jFM+4nlhjU0KeF4ELsjvFaggshagg6fhi8w7KZ493gBUFjfyFLM0ItCUryv9ybEZMAXBajfsre4XD9h8hlR/18hqHjLb0acGRWZV+XuVkr7D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=05m04NfB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="05m04NfB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1168A1F00A3D;
	Tue,  1 Sep 2026 09:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788254424;
	bh=QegarFhs17FMI5t31IwLc2/9mSC859AmsR3TE8eZmBo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=05m04NfBAQ1Tkeda/ZbHzioyjTrge/+RPfoyxONDC7SuycbnOBEKSKK/hKfP3GcA2
	 uiRNWvu1Jw7ld3UcEAn/4T8qbyN5gjh1btQlsHQP4KqW+yRtKf2KfXhg5EyxC/WmF0
	 Npae4RP+sXN+NSzL4fOkG9U4hkoqdweJ+sSj4+6w=
Date: Tue, 1 Sep 2026 11:20:19 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jesus Olmos <sha0@badchecksum.net>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: bound WPS attribute copy in
 rtw_get_wps_attr_content()
Message-ID: <2026090151-reborn-catsup-73c3@gregkh>
References: <20260901072249.366750-1-sha0@badchecksum.net>
 <20260901091226.444666-1-sha0@badchecksum.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901091226.444666-1-sha0@badchecksum.net>

On Tue, Sep 01, 2026 at 11:12:26AM +0200, Jesus Olmos wrote:
> rtw_get_wps_attr_content() copies attr_len - 4 (the WPS attribute's 2-byte
> data-length field, up to 0xffff) from a WPS information element into the
> caller's buffer with no destination-size bound:
> 
> 	memcpy(buf_content, attr_ptr + 4, attr_len - 4);
> 
> The information element comes straight from a received beacon / probe
> response: collect_bss_info() copies the frame's IEs verbatim into
> bssid->ies, which reaches the scan queue, so attr_len is attacker
> controlled. rtw_cfg80211_inform_bss() and two sites in rtw_mlme_ext.c call
> this for WPS_ATTR_SELECTED_REGISTRAR with a one-byte destination (u8 sr /
> u8 selected_registrar), because that attribute is a single byte by spec. A
> frame that declares a longer Selected Registrar attribute therefore
> overflows the one-byte stack variable during a scan, which happens
> automatically (NetworkManager/iwd), giving an unauthenticated adjacent
> attacker a remote stack buffer overflow (at minimum a stack-protector
> panic).
> 
> Commit 1463ca3ec660 ("staging: rtl8723bs: fix OOB reads in rtw_get_sec_ie(),
> rtw_get_wapi_ie(), and rtw_get_wps_attr()") added a bounds check for the
> attribute header in rtw_get_wps_attr() but not for the attribute data
> length, and did not touch rtw_get_wps_attr_content(), so the copy remained
> both an out-of-bounds read of the attribute data and an out-of-bounds write
> of the destination.
> 
> Reject attributes that claim more data than the IE holds (fixing the
> out-of-bounds read and the latent memcpy(buf_attr, ...) in
> rtw_get_wps_attr()), give rtw_get_wps_attr_content() the destination buffer
> size, and clamp the copy to it.
> 
> Compute the attribute length in an unsigned int rather than u16: a declared
> data length of 0xfffc made (u16)(attr_data_len + 4) wrap to 0, which slipped
> past that bounds check and advanced the parser by zero, looping forever.
> 
> Found using mwemu (https://github.com/sha0coder/mwemu).
> 
> Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude (Anthropic)
> Signed-off-by: Jesus Olmos <sha0@badchecksum.net>
> ---
> v2:
>  - Widen attr_len to unsigned int so a declared data length near 0xffff
>    cannot wrap; for 0xfffc the old u16 wrap defeated the bounds check and
>    made rtw_get_wps_attr() loop forever. Thanks Greg for spotting it.
>  - Add Assisted-by: tag for the AI-assisted analysis.
> 
> Build-tested as a module (x86_64 defconfig + CONFIG_RTL8723BS=m). Not tested
> on real hardware (I don't have an RTL8723BS device). The bug and the fix were
> found and checked by source review plus function-level emulation of
> rtw_get_wps_attr()/rtw_get_wps_attr_content() under mwemu: with a 0xfffc data
> length the pre-fix code spins forever (u16 wrap -> attr_ptr += 0) while the
> fix returns immediately, and the Selected Registrar overflow is clamped to the
> 1-byte destination.

Please see:
	https://lore.kernel.org/r/2026080354-skater-urgent-31b2@gregkh
for why I can't take this patch.

thanks,

greg k-h

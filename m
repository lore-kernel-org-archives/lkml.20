Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B487B368D66;
	Tue,  1 Sep 2026 08:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250586; cv=none; b=inc7EAbsrFXSzm+tQJuPDe+w4Xg0yHVIfRp05Zf9m+Yrv/JQMnohgKzECXYJDwH1aSQC8fiScnEC6+birgU6wcPIb8ThRU+qjAtVlod75ukWAU0WoGg4TDsJiXD18SSoKvc1+WSgh6pCoUDKa4uBCvOEPG7as2TuSpFdedSItx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250586; c=relaxed/simple;
	bh=hza6SvVnT+VdPOoUDeT9PRPIwa6n+NN1xd+pi1uuenE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=njJWqumoBSWCGXda0WLbS5Yfs1Niqp7DifP9oqlwHhHTGWWoXPm4NrfyoHVmUPv55XAtMGscac3/u0f2lrOFZaLklYntFmtb+mpkLTWfrYSa/6cTHhadbuhoTEnkRiZTVzMW3lWlKQa7JBNETmnlo11WC0a1fHmt6bEoi5Vh2WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=IfV4P+U8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IfV4P+U8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A39EC1F000E9;
	Tue,  1 Sep 2026 08:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788250585;
	bh=bRBAS6yCZW2+QDx3d7qDfqkJYxdVr8LxBI9GoEN6xE4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IfV4P+U8XVRnHEIt+FPJ9iTMPkC70edqOxhrdJJ2A+wkHiE9PRlDThPninJlTJg1f
	 7KW1DgVIXZcsvkKI1J4fM2htMHV0Z9vNBt4A40pEUb6+jXumu6F6JtdQkiedzmacoy
	 U27teAHV4YEnV9OTMe6+SoE7GhFhtuAhodxwiLec=
Date: Tue, 1 Sep 2026 10:16:21 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jesus Olmos <sha0@badchecksum.net>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: bound WPS attribute copy in
 rtw_get_wps_attr_content()
Message-ID: <2026090133-postwar-kebab-83f0@gregkh>
References: <20260901072249.366750-1-sha0@badchecksum.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901072249.366750-1-sha0@badchecksum.net>

On Tue, Sep 01, 2026 at 09:22:49AM +0200, Jesus Olmos wrote:
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
> Found using mwemu (https://github.com/sha0coder/mwemu).

So shouldn't this have an Assisted-by: tag?

And have you tested this on real hardware?

Also, this looks a bit wrong, you have an endless loop in this patch :(

thanks,

greg k-h

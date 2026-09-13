Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705C2377EDC
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 13:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789306338; cv=none; b=InnTTsx1fu9GvVW/QdArg6/0rYdCK+sDgv1HxtQdpWCYTak8OLPaOO85CAVOLbPloRwcGjJ6leq4yWlAGw4337smR61+8HroxheMpXZ+G6qs1dEdb7o/WxgWWFHRj79zt6QRFTZJTtAXXTNwXzvQQbcI1nfuWskFZx2UBbB7I4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789306338; c=relaxed/simple;
	bh=tacF+0/UgVgf1ZF2kBFCF17soFgwFERlvzcI1lOcP4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d3HxhbBRpy79Eb9SPjl+m8kSWO/qcjbFkIteGZpVofoX3QP54fMiMSz/GwuqhMmafQNGDc7xQfrm/Om0dxsAYv3K4U0kvYU56VCfTfnOfqQYu/tRZW9frW2CpTI8hMj8fXTAALR0Tr+A9Fr7b+QhJqYOajaNynPK4eHiqfLeahQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=CIcdHPJ9; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="CIcdHPJ9"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f0b20so269338766b.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 06:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789306336; x=1789911136; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VWrnyKIL/nI3FCiUVdAFpShSwUN32IQc4eQdP+H1XA0=;
        b=CIcdHPJ9IIO3SU4NHkiVnC5CzdoXka4ZFdOZks2xB2jA/O0eohKICdHf5cWraiFgSC
         Adz1M0BsxZGJItQfP749VSL5pgJh4aYa/cGWgazpxWnyXk/kPyOEnXmU/4Srz/pM9AWU
         gDq72IqHZpjNgidFSAwdS1HjrYZMtRSnrmPJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789306336; x=1789911136;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VWrnyKIL/nI3FCiUVdAFpShSwUN32IQc4eQdP+H1XA0=;
        b=WGMYXkDJP1NVI9PNwpDtwVzsRFQKrdm1KaWxNuwaj7s2PFTYTXXPc17S4L/m9bv0YU
         xYmUfrQsWloUJZ6lISEnNXGnVWqc2tDlXPxz+ob6/afkjJpb819jhV4Wvk6Wm++ZO9eG
         10tBEOlLWmohJc7BPgVw8bEYEv15gyKWlKiG2I95kh71hGfnAJmfZWIrX5XcTm8DFI2g
         5gaTlJiS9xlm1hrYgYD5d7R4t46PCHb4BMDOkEZ7zYnRIYs8TQCicvyYnDw1ClI7ZluC
         iSL2Mdy6WbU/+4z3NzoAN+W+xLBfp69jzNUDo360SZO7l62Vr5jNrZ1WZaDE2WEUWZWk
         zR8Q==
X-Gm-Message-State: AFuF++mL2u8LsUscmlRRAvK2Wi30xj4yNWAsGI0hcwjJ/y76Tmnndy73
	/9rynHR7pNGQ6ylAF9ivqxKt0qyOhF3A41U5mbvFZJbXP8tVuGvYCx0nJ6c7s6Ndi3U=
X-Gm-Gg: AYBFou04dACRIIkHEOstxRPV3s5kHgQEmREhj4+cy7/FtI4/Owwocn9+tSyGOHCCGgi
	80sq5WI8MNe/qbPzXUBeDX8Vt+YtlTCmrrLh1lTW8wnGO1AbPoxk5lblcI1AuDF2CB8kVyNogJA
	yv9632T8FeSZUIYp+1OavByDeCXSMzTMvEoz1+LDhwKQ78sWwgwNMTB7EpoQOy2gilgjvxENN3z
	b5e4Z3DNePH6+GX51T+kI4QoNCF7FQaLrtWAEi9j1e3/LiDwoSaebW+/pb3/equ31LNrhtwXmjY
	Ra6JBPy+4BwbvvjJLUdlVItBavkj+Dn1WE5C22wMuW7VeIUs8vmVUhzf2PwRl7ilpz2OkxfDAU+
	vffE78nyhHD5Iz/odcQb5Ed7nqOfdI9L5769FTe/RJr9FJrNrUU0y6d7Zu2n1I/eZmCQxGBORcK
	vSAuYA97Epcm7OhKZR4pYM4629x8usHm6OiWsEcfwGgwtlv6BXFXTuxFrc5KU5NfRGRpGI8cQSu
	yWP6Ac=
X-Received: by 2002:a17:907:724d:b0:c25:5114:c832 with SMTP id a640c23a62f3a-c29665acdeemr1293801966b.3.1789306335536;
        Sun, 13 Sep 2026 06:32:15 -0700 (PDT)
Received: from cabron.k.g ([95.111.117.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4cf01sm296633166b.1.2026.09.13.06.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 06:32:15 -0700 (PDT)
Date: Sun, 13 Sep 2026 16:32:14 +0300
From: Petko Manolov <petko.manolov@konsulko.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	dinguyen@kernel.org
Subject: Re: [PATCH v4 2/3] dt-bindings: arm: altera: add Draeger M48 Module
Message-ID: <20260913133214.GF20345@cabron.k.g>
References: <20260911150755.2803736-1-petko.manolov@konsulko.com>
 <20260911150755.2803736-3-petko.manolov@konsulko.com>
 <20260913-perky-resolute-badger-6c5e96@quoll>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913-perky-resolute-badger-6c5e96@quoll>

On 26-09-13 11:18:16, Krzysztof Kozlowski wrote:
> On Fri, Sep 11, 2026 at 06:07:53PM +0300, Petko Manolov wrote:
> > Add DT compatible string for Draeger's M48 CPU Module, an i.MX6
> > based board.
> 
> Sashiko comment is valid.

Sashiko doesn't know that this is indeed an i.MX6q board with the Altera FPGA as
a separate module, that is secondary to the NXP SoC.

What do you want me to put in the commit message so that everyone is happy?


		Petko

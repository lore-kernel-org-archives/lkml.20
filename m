Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793134144;
	b=cwrTNWL1+rJmuZa/MT3r4uXwhEm2DZgNPGh67JBKAQW7xfDJsNbfzabEwrmsZIV2JtIZ
	 Wtp0SGFHmGxwi/oBCMc/XHh2rS1uesAFQufGoGhKlXWkIpvrb3LwA5NzSNd+8mYGW3lKl
	 IyBCwvLAYzmQ4RF2MBcAhgKpsEqMljPorMNdm71bxtEhMg/kWQJ6LSlgWSWA8GgZnsKx2
	 Qmxsnqcyw3XMYKlEwT3eflWlzPR8N/P9DEsSaLtocgPbcid4BpJUUephTLKyHjt4W3DqW
	 yLlyK72+IY9L5ZPoDe0hVBHisXQMxphie2ZvNmhG35u5df3IxrKlhX+ogIwKhbwCyhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793134144;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=0hAF57gjoTt/mFElvB0eCyvbssGe7Z9DDBCWZ462jcE=;
	b=pqdO2dkDgTBxS4UiGzNiXkJw2Kiv9dqC5Xz9F3rsOnmZkvq1oix789IcnqxiKAQiqm4X
	 i/EMf0dDnSvQv2oKzNqc3gYslnFHqqznPHoKgWzsQh79c+3U7Zs4PcpnKhKyb7Iu7pHCa
	 VoPFOS/pDc7iVdmYglrSLUlXghRvCnYsuVGyITF/RqGM/IUNKSH/givXK4s+bquxU0Vt0
	 0C8PjiMhPJexOyF/WUBYvdhmgk86WMmnIc0At3q8+6JWhBDgdeUj5HvhLEbdljTEr/jrJ
	 AExrZvaGjAHgGOyby+WWHtZuh8/3VRKQOzwaLFHukn+L30Jv+lbUBIA/XRv3cHDMPsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e55IsjYh;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC58E606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 20:49:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC58E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e55IsjYh
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-369f33df08eso566907eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793134143; x=1793738943; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0hAF57gjoTt/mFElvB0eCyvbssGe7Z9DDBCWZ462jcE=;
        b=e55IsjYhiaImBGZaEfcHNMh1iYy+89zVX4Gb7i/eQxrr1bstQrZpT7NWG28qVP3QMh
         M+/9xzBrp5nhdQAwgEg/OPLEz6m8YNZ2BaSFKGCyUzFsrHTsjrOjrb+fHHvaY+ogpPSk
         6SWergbI2mXHUNZuALNteXmULFbqOWBbdEgJ4LzaWUCqshlf/Foq1MgysQwWE65Nawe1
         Puq8jzGeKgnr7iGkms245khvWVZ4aYfsncoaHoAywSO2TWm6a5oDoZz/OG+BGJGYjv9u
         MXynhrH9Ibj6DKp0ILSEd8tVIv2T1C9285LBP6kw9KeLRu4GpSkLA/UDaVwIaIqtH9hD
         51yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793134143; x=1793738943;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0hAF57gjoTt/mFElvB0eCyvbssGe7Z9DDBCWZ462jcE=;
        b=q+TB/7UQ8hxwl5Fb5RtSbJcAOHyg5OxIMr9H8YD83l9eVrv00do8RtLbVdZQLrLoLN
         CnS6f+htu4R66AH1moQWyz8SSQ7WY+R7/qosaDmYtq0Sm/sYvGE/DPx9Cm7JjlNcWEcw
         cIvEon3h3mUARv5suftWR0VnGWbmykW9N414FqsBmag2sADKOY5GH/ZQC5kX2P9Aljhd
         SNtWAVkANWPg4hbWRVE48EGZqW15oeDmcwzoOqbPxPtb3YTkO/U+FbtvMP6tjH1Z0wVp
         jpHvuXYMWt1E8rH0l9kv8DNCj5pOPJBj4z0KPkUDfqTESm/mFhNqQx4i0i5mYNb5FwC/
         5zng==
X-Forwarded-Encrypted: i=1; AKwUvBxDqtw+8WuqlERPeLP1mOhbOgsXx8Kyufcllb1MwnDLlIs3yWoBox+bT9+Uj61E8FAxIsOkJh63jLNIevQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKP9DGzZuZ5+ulbJrzW6y9mGq1BsVg/bGauE5u8Mq4P+avIdxXR
	5DLXLXyMKaaztmXmW8cclL+jxOdUwF94iiFJzlkz4SBLdfzLhhDHhbsn
X-Gm-Gg: AYBFou0Zefhw2ITKg2yt8HPygYfahFEkoMd+EH0LFdc2XCZ1pqH9McamnJM0jIEAbe8
	9wD+bxXeMDyXD66GLn99bJtJlF8NUKLrF6PzNU1ZqPkLV90lDkgGZ9Dm555T+dbMInX4vY8I9Yl
	et3wafIYY666CRkFY17nb/fQBteFMr8hGcLsaiNBdtTgYVMXF8HqJezDjF36+XBZR0lAWTjwZ4m
	M2EM0ZJnXkwbP2C0UItFBPC+VXZ73QllhJb4PImHuWSaEWOVcveWvAGNn/1O6S5HQkBa6f2E8bN
	wBxSBFQBFs9BPcDQEZHNfZioLcXfpqJjqoyIMadrUlzmk5I61eCcxuwovWuNYEMQ3EFTUB68uNP
	JTguHu3Jzi6QTspJ4ZK/MxqKoF8fqIjV9eBxr6NZky9wwcXqKRpZIGD7hv6vGGO/r2QMiemXi9/
	3OupkkqGXbaD6ZKez0WDbi9MkJwlp41fATAHUSSdhLypzPwvpPt7LMtAph9THlDgCYG1Wlfxbw3
	lMpajcNaBTBNLvBpmSPaqJ4MSK2a39vXogk4MHTLiZAwsuhg0hnZCCzJmrrpU5NCoy41C1Pecf8
	QCB4RRzDZxKOn7gohqpwG1Q0/yT88akPaoRkWBNPm2NMzEaPFh9eWlVCTHf210Cfmew3UiQ=
X-Received: by 2002:a05:7301:7187:b0:369:fcbb:4d4c with SMTP id 5a478bee46e88-36a2007da4dmr673283eec.7.1793134142800;
        Tue, 27 Oct 2026 13:49:02 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:9958:9525:7799:82b5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369ef6a71easm35192972eec.5.2026.10.27.13.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 13:49:01 -0700 (PDT)
Date: Tue, 27 Oct 2026 13:48:58 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Dmitry Mikushin <dmitry@kernelgen.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] Input: synaptics - enable SMBus for ThinkPad P14s
 Gen 2i (LEN2072)
Message-ID: <auEOI-Ay0xGBMd3k@google.com>
References: <20261026142648.2567233-1-dmitry@kernelgen.org>
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
In-Reply-To: <20261026142648.2567233-1-dmitry@kernelgen.org>

On Mon, Oct 26, 2026 at 03:26:45PM +0100, Dmitry Mikushin wrote:
> The ThinkPad P14s Gen 2i touchpad (Synaptics TM3471-030, LEN2072) is
> not on the SMBus passlist and runs in PS/2 mode. Forcing RMI4 alone
> does not help: the F12 attention handler reads the whole 79-byte data
> packet over SMBus on every frame, which caps the report rate at about
> 43 Hz and loses fast swipes.
> 
> Patch 1 fixes the size passed to rmi_f12_process_objects(), which
> counted from the start of the data packet instead of from Data1.
> Patch 2 makes F12 read only the registers up to and including Data1,
> raising the report rate to about 65 Hz on this machine. Patch 3 then
> adds LEN2072 to smbus_pnp_ids and should not be applied without
> patch 2.
> 
> Tested on a ThinkPad P14s Gen 2i (20VX) on 7.2.9, including s2idle
> suspend/resume and the TrackPoint on the RMI4 pass-through port. On
> this device Data1 is the first data register, so patch 1 does not
> change its behavior.
> 
> Changes in v2:
> - New patch 1. Sashiko pointed out that with patch 2 alone, on devices
>   where Data1 is not at offset 0, rmi_f12_process_objects() could parse
>   bytes past the end of what was read. The underlying off-by-
>   data1_offset bound predates this series, so it is fixed separately
>   with a Fixes: tag.
> - No changes to patches 2 and 3.

Applied the lot, thank you.

-- 
Dmitry

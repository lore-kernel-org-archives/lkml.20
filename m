Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD282EEE8C
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 01:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790384726; cv=none; b=JCj+sY5tnGC0niHwwdvtAJQnYqTFFZ6ie/VvHQQvV2I62mJYVjK2qUwQFEt/b3+VGeAs7+EHT8OIw5MeQNeq8hiFjvMHJl+d+sFHl3s7un/jojZglU1ApoQpCDFwgDgh4oKG4yQe7ErA05KHiT85xFxbqVxF9+TABaPz8orqWg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790384726; c=relaxed/simple;
	bh=J1MUs+t76eeeTbPqrIITgHha8ImsL6NjzfrE8Z1XKRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DdvuGAiwVZSn+r78Twixj9vmVVCQkV98igwWSeaHr/Mla+5VNMJkI54swwyT3EC14tE4bjb0rqnvyQTWXZuRmtl6IsIyAymb7EcESCOWLyqxkrXON4IdYUbqBJrzL4HocPVrXXO+2aRRAJ0AGlq5S6kN8GEIPKWzdaW/2U4WgBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m16U6ykq; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m16U6ykq"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e630052ebso1689242eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 18:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790384724; x=1790989524; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1WuuprmVZsNCEEfwj0xF1pE+sLZ0PLBPX+ZV3SJldbA=;
        b=m16U6ykqRNbMEytZ+tLZobjKL9CrA8XmbrgUoh9O4nP7z/ZwnuHo4de0HqKFvJq+y1
         Vmau1goArC1ApMS3WXRBvFitUw+0HoBoT22hw14WeYP6TV7FbLwnCVKU0lmRwhF0dS2T
         40UiMuypDmd+7Cgz77Cq+Lb9Wd6wtIEaZvTnrLoy+bTL49v/oH3E0KYGnIYNvLr+5bsN
         71mGMXEXUPguFTKCoQpm//lI8mJcN5WInnTtJmAVy5CLINU+330laoYkHFhsuHh6APil
         3dzqg3IUiE8EG110nP3A9P1/ebC3fcQ2lbCJTZOsmrM5BP7sADoksu6JaFzpcVOfJrue
         11mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790384724; x=1790989524;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1WuuprmVZsNCEEfwj0xF1pE+sLZ0PLBPX+ZV3SJldbA=;
        b=FgAW66b78iguqRfw5A9YWt8IRfacoEmkRcxO9dxaWAu8yibmxYrFfC7Jnu5yUSYr/y
         elSUDYQhryquK0n9JW1bJP3T/uAt4yR8QLr5ZZXfZDRQbnHvsWWSyvpxx/fQRc28gO/p
         UpTE9PRlDMiyUatdSgt++HJwGW35SQuJ44Wm8VFA0H7fj0r9bEz70yzhVqvvX3FuCRRR
         m4oktb03WgeOtIL4ms5JFp9KRsHOzkJ33lRkAzlucX8Qy9kGM/2vcAWrWAwTZjSFFong
         0PhD3W1jbyA3xl1/01zsnkInsu1RlVOReleVSbGq/neXVKfjxInu4bh55QIRpBW1SDzr
         8u1Q==
X-Forwarded-Encrypted: i=1; AKwUvByfg5nALuSZHZPfEPB7jLNDB9ttLbtjLroDGxCLEayIF6DU32minBhvKwq51arM8Cbse3r1V8GXUP4oWoE=@vger.kernel.org
X-Gm-Message-State: AFuF++nKB3iWZUhKMXG6D5Q36iO4cIBiEtylBwIa1KTxC6hqimCX1WQS
	PiFvlx224cEPmMi40KaokcTM/yPTLQgODAlbIW78ehQ+NCfpyK7DiVDFuBge3Oe/
X-Gm-Gg: AYBFou0mad48l/m5srrb8fPNcHmicOWDP14vc/i7OxEdY6jiI8UBh4ydAW9Cghqopqk
	GMNgs/3ThRiG+/mTFVxctiob6h5YS1g9d54l/U0F/mRVrqEXoQT8MSIVoAYMFejMMofN5Tr9bCe
	5xYBRbwH80738nbMKaR3yV8i3BfC0SnucuxH0veeH5nc4kDuGFxXhMzm6gpXEdIoGM/SrRzbuVL
	88v4ZZ+ZpSVkr7QgodnND11sOnCzIKYzIpTkbc5/wRfaUo7JKUYbFlWcQQ6ItIGRiwP6eTKGMze
	LmF3MiiAfchapCnBgvRGlXrLgZPrUJZBqdiFWMWWiL9NqJoQe8pbLZfRle2akQvUsMqc2u+bUbq
	lDwtLw5g93o2fyocXr6VLU2dylav9AodCrerkhEiZ6vW6+1H4nRuqXdBwyd1v/szOPmqsuNeFHV
	KAbklDEiFZbb2IrucniXzRQSpBlJtHeeQNlJkAK4pQV4hY4m7jXNSonyFXUC3QD37wgqLrlIDhz
	JYPf5Iep0gE+Ah5lvtPUlbJeayHPlksWpL2Dns=
X-Received: by 2002:a05:7300:7683:b0:339:8131:424e with SMTP id 5a478bee46e88-342727579e5mr2179532eec.34.1790384724235;
        Fri, 25 Sep 2026 18:05:24 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:375:19cf:5fee:be32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144172d8asm9494823eec.5.2026.09.25.18.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 18:05:23 -0700 (PDT)
Date: Fri, 25 Sep 2026 18:05:20 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jiale Yao <yaojiale02@163.com>
Cc: Hans de Goede <hansg@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jens Reidel <adrian@mainlining.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: goodix_berlin - reject devices without match data
Message-ID: <arcZ0zf2ZQn_Traj@google.com>
References: <20260925133639.2229728-1-yaojiale02@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925133639.2229728-1-yaojiale02@163.com>

Hi Jiale,

On Fri, Sep 25, 2026 at 09:36:38PM +0800, Jiale Yao wrote:
> A device bound through driver_override need not match an entry in the
> driver tables. In that case spi_get_device_match_data() returns NULL,
> but goodix_berlin_spi_probe() dereferences the result while calculating
> the regmap transfer limits.

We are not planning to address issues caused by incompatible writes to
driver_override. This is a privileged operation.

Thanks.

-- 
Dmitry
